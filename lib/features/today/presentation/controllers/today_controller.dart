import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/content/bundled_content.dart';
import '../../../../core/content/bundled_content_service.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/recurrence/recurrence_expander.dart';
import '../../../settings/presentation/providers/content_providers.dart';
import '../providers/today_view_state.dart';

/// Assembles the [TodayViewState] from Drift watch streams and bundled content.
///
/// The Ethiopian date is computed for real from the current date via
/// `ethiopian_calendar_core` and `clock` (testable time). Events, reminders,
/// and planner items stream from the local database in real time.
/// Holidays and observances come from bundled JSON content.
final class TodayController extends Notifier<TodayViewState> {
  @override
  TodayViewState build() {
    final today = GregorianDate.fromDateTime(clock.now());
    final ethiopian = CalendarConversion.gregorianToEthiopian(today);

    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));

    // Watch Drift streams — UI updates automatically on writes.
    final eventsAsync = ref.watch(_watchEventsProvider((start, end)));
    final recurringEventsAsync = ref.watch(_watchRecurringEventsProvider);
    final exceptionsAsync = ref.watch(_watchAllExceptionsProvider);
    final remindersAsync = ref.watch(_watchUpcomingRemindersProvider);
    final recurringRemindersAsync = ref.watch(_watchRecurringRemindersProvider);
    final contentAsync = ref.watch(bundledContentProvider);

    final dbEvents = eventsAsync.value ?? [];
    final recurringEvents = recurringEventsAsync.value ?? [];
    final exceptions = exceptionsAsync.value ?? [];
    final dbReminders = remindersAsync.value ?? [];
    final recurringReminders = recurringRemindersAsync.value ?? [];
    final allContent = contentAsync.value ?? [];

    // Build exception lookup sets for events.
    final eventSkippedKeys = <String>{};
    final eventModifiedDates = <String, DateTime>{};
    for (final ex in exceptions.where((e) => e.entityType == 'event')) {
      if (ex.exceptionType == 'skipped') {
        eventSkippedKeys.add(ex.exceptionKey);
      } else if (ex.exceptionType == 'modified' && ex.modifiedGcDate != null) {
        eventModifiedDates[ex.exceptionKey] = ex.modifiedGcDate!;
      }
    }

    // Build exception lookup sets for reminders.
    final reminderSkippedKeys = <String>{};
    final reminderModifiedDates = <String, DateTime>{};
    for (final ex in exceptions.where((e) => e.entityType == 'reminder')) {
      if (ex.exceptionType == 'skipped') {
        reminderSkippedKeys.add(ex.exceptionKey);
      } else if (ex.exceptionType == 'modified' && ex.modifiedGcDate != null) {
        reminderModifiedDates[ex.exceptionKey] = ex.modifiedGcDate!;
      }
    }

    // Expand recurring events into occurrences for today.
    final expandedEventOccurrences = RecurrenceExpander.expandEvents(
      events: recurringEvents,
      rangeStart: start,
      rangeEnd: end,
      skippedOccurrences: eventSkippedKeys,
      modifiedOccurrences: eventModifiedDates,
    );
    final expandedEvents = expandedEventOccurrences
        .map((o) => o.entity)
        .toList();

    // Expand recurring reminders into occurrences for today.
    final expandedReminderOccurrences = RecurrenceExpander.expandReminders(
      reminders: recurringReminders,
      rangeStart: start,
      rangeEnd: end,
      skippedOccurrences: reminderSkippedKeys,
      modifiedOccurrences: reminderModifiedDates,
    );
    final expandedReminders = expandedReminderOccurrences
        .map((o) => o.entity)
        .toList();

    // Combine non-recurring + expanded occurrences.
    final allEvents = [...dbEvents, ...expandedEvents];
    final allReminders = [...dbReminders, ...expandedReminders];

    return _buildState(
      ec: ethiopian,
      gc: today,
      dbEvents: allEvents,
      dbReminders: allReminders,
      allContent: allContent,
    );
  }

  TodayViewState _buildState({
    required EthiopianDate ec,
    required GregorianDate gc,
    required List<CalendarEvent> dbEvents,
    required List<Reminder> dbReminders,
    required List<BundledContent> allContent,
  }) {
    final now = clock.now();

    // Look up holidays/observances for today's EC date.
    final todayContent = allContent
        .where(
          (item) =>
              item.calendarBasis == ContentCalendarBasis.ethiopian &&
              item.ecMonth == ec.month &&
              item.ecDay == ec.day,
        )
        .toList();

    final holiday = todayContent.isNotEmpty
        ? HolidayPresentation(
            name: BundledContentService.localizedTitle(
              todayContent.first,
              'en',
            ),
            type: todayContent.first.type == ContentType.holiday
                ? 'holiday'
                : 'observance',
          )
        : null;

    // Assign color indices for event types based on category.
    const categoryColorMap = <String, int>{
      'meeting': 0,
      'personal': 1,
      'deadline': 2,
      'health': 3,
      'other': 4,
    };
    final events = dbEvents
        .where((e) => !e.isAllDay)
        .take(5)
        .toList()
        .map(
          (e) => EventPresentation(
            id: e.id,
            title: e.title,
            time:
                '${e.gcDate.hour.toString().padLeft(2, '0')}:${e.gcDate.minute.toString().padLeft(2, '0')}',
            location: e.location,
            colorIndex: categoryColorMap[e.category] ?? 4,
            isAllDay: e.isAllDay,
          ),
        )
        .toList();

    final allDayEvents = dbEvents.where((e) => e.isAllDay).toList();

    // Find the next upcoming event: prefer all-day, then next timed event after now.
    UpNextPresentation? upNext;
    if (allDayEvents.isNotEmpty) {
      upNext = UpNextPresentation(
        id: allDayEvents.first.id,
        type: 'event',
        title: allDayEvents.first.title,
        isAllDay: true,
      );
    } else {
      // Find the next timed event that hasn't started yet, or the earliest one today.
      final timedEvents = dbEvents.where((e) => !e.isAllDay).toList()
        ..sort((a, b) => a.gcDate.compareTo(b.gcDate));
      CalendarEvent? nextEvent;
      if (timedEvents.isNotEmpty) {
        nextEvent = timedEvents.firstWhere(
          (e) => e.gcDate.isAfter(now),
          orElse: () => timedEvents.first,
        );
      }
      if (nextEvent != null) {
        final timeStr =
            '${nextEvent.gcDate.hour.toString().padLeft(2, '0')}:${nextEvent.gcDate.minute.toString().padLeft(2, '0')}';
        upNext = UpNextPresentation(
          id: nextEvent.id,
          type: 'event',
          title: nextEvent.title,
          time: timeStr,
          location: nextEvent.location,
        );
      }
    }

    final upcomingReminders = dbReminders
        .where((r) => !r.isCompleted)
        .take(3)
        .map(
          (r) => ReminderPresentation(
            id: r.id,
            title: r.title,
            subtitle: r.description,
            time:
                '${r.gcDate.hour.toString().padLeft(2, '0')}:${r.gcDate.minute.toString().padLeft(2, '0')}',
            isOverdue: r.gcDate.isBefore(now),
            isCompleted: r.isCompleted,
          ),
        )
        .toList();

    // Build schedule from all events (including all-day) sorted by time.
    final schedule =
        dbEvents
            .map(
              (e) => SchedulePresentation(
                time:
                    '${e.gcDate.hour.toString().padLeft(2, '0')}:${e.gcDate.minute.toString().padLeft(2, '0')}',
                title: e.title,
                subtitle: e.isAllDay ? 'All Day' : e.location,
              ),
            )
            .toList()
          ..sort((a, b) => a.time.compareTo(b.time));

    return TodayViewState(
      ethiopianDate: ec,
      gregorianDate: gc,
      holiday: holiday,
      upNext: upNext,
      events: events,
      reminders: upcomingReminders,
      schedule: schedule,
    );
  }

  void toggleReminder(String id) {
    final db = ref.read(databaseProvider);
    final currentReminders = ref.read(_watchUpcomingRemindersProvider).value ?? [];
    final reminder = currentReminders.where((r) => r.id == id).firstOrNull;
    if (reminder != null) {
      db.remindersDao.toggleCompleted(id, !reminder.isCompleted);
    }
  }

  void deleteReminder(String id) {
    final db = ref.read(databaseProvider);
    db.remindersDao.deleteReminder(id);
  }

  void snoozeReminder(String id, Duration duration) {
    final db = ref.read(databaseProvider);
    final currentReminders = ref.read(_watchUpcomingRemindersProvider).value ?? [];
    final reminder = currentReminders.where((r) => r.id == id).firstOrNull;
    if (reminder != null) {
      final newDate = clock.now().add(duration);
      db.remindersDao.updateReminder(
        RemindersCompanion(
          id: Value(id),
          gcDate: Value(newDate),
        ),
      );
    }
  }

  Future<int> computePlanningStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final streakKey = 'planning_streak';
    final lastVisitKey = 'last_visit_date';

    final now = clock.now();
    final todayStr = '${now.year}-${now.month}-${now.day}';
    final lastVisit = prefs.getString(lastVisitKey);

    if (lastVisit == todayStr) return prefs.getInt(streakKey) ?? 0;

    final yesterday = now.subtract(const Duration(days: 1));
    final yesterdayStr = '${yesterday.year}-${yesterday.month}-${yesterday.day}';

    if (lastVisit == yesterdayStr) {
      final currentStreak = (prefs.getInt(streakKey) ?? 0) + 1;
      await prefs.setInt(streakKey, currentStreak);
      await prefs.setString(lastVisitKey, todayStr);
      return currentStreak;
    } else {
      await prefs.setInt(streakKey, 1);
      await prefs.setString(lastVisitKey, todayStr);
      return 1;
    }
  }

  Future<void> refresh() async {
    // Drift streams auto-update; this is a no-op for now.
  }
}

// ---------------------------------------------------------------------------
// Stream providers that derive from the database.
// ---------------------------------------------------------------------------

final _watchEventsProvider = StreamProvider.autoDispose
    .family<List<CalendarEvent>, (DateTime, DateTime)>((ref, dates) {
      final db = ref.watch(databaseProvider);
      return db.calendarEventsDao.watchEventsByDateRange(dates.$1, dates.$2);
    });

/// Watches all recurring events (for expansion at the presentation layer).
final _watchRecurringEventsProvider =
    StreamProvider.autoDispose<List<CalendarEvent>>((ref) {
      final db = ref.watch(databaseProvider);
      return db.calendarEventsDao.watchAllEvents().map(
        (events) => events.where((e) => e.recurrenceRule != null).toList(),
      );
    });

/// Watches all recurrence exceptions.
final _watchAllExceptionsProvider =
    StreamProvider.autoDispose<List<RecurrenceException>>((ref) {
      final db = ref.watch(databaseProvider);
      return db.recurrenceExceptionsDao.watchAllExceptions();
    });

final _watchUpcomingRemindersProvider =
    StreamProvider.autoDispose<List<Reminder>>((ref) {
      final db = ref.watch(databaseProvider);
      return db.remindersDao.watchUpcomingReminders();
    });

/// Watches all recurring reminders (for expansion at the presentation layer).
final _watchRecurringRemindersProvider =
    StreamProvider.autoDispose<List<Reminder>>((ref) {
      final db = ref.watch(databaseProvider);
      return db.remindersDao.watchAllReminders().map(
        (reminders) =>
            reminders.where((r) => r.recurrenceRule != null).toList(),
      );
    });

final todayControllerProvider =
    NotifierProvider<TodayController, TodayViewState>(TodayController.new);
