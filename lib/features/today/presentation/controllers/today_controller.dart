import 'package:clock/clock.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/content/bundled_content.dart';
import '../../../../core/content/bundled_content_service.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/database_provider.dart';
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
    final remindersAsync = ref.watch(_watchUpcomingRemindersProvider);
    final contentAsync = ref.watch(bundledContentProvider);

    final dbEvents = eventsAsync.value ?? [];
    final dbReminders = remindersAsync.value ?? [];
    final allContent = contentAsync.value ?? [];

    return _buildState(
      ec: ethiopian,
      gc: today,
      dbEvents: dbEvents,
      dbReminders: dbReminders,
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

    final events = dbEvents
        .where((e) => !e.isAllDay)
        .take(5)
        .map(
          (e) => EventPresentation(
            title: e.title,
            time:
                '${e.gcDate.hour.toString().padLeft(2, '0')}:${e.gcDate.minute.toString().padLeft(2, '0')}',
            location: e.location,
            isAllDay: e.isAllDay,
          ),
        )
        .toList();

    final allDayEvents = dbEvents.where((e) => e.isAllDay).toList();

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
      upNext: allDayEvents.isNotEmpty
          ? UpNextPresentation(title: allDayEvents.first.title, isAllDay: true)
          : null,
      events: events,
      reminders: upcomingReminders,
      schedule: schedule,
    );
  }

  void toggleReminder(String id) {
    // ignore: todo
    // TODO: Wire to DAO toggleCompleted when the reminder list is streamed.
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

final _watchUpcomingRemindersProvider =
    StreamProvider.autoDispose<List<Reminder>>((ref) {
      final db = ref.watch(databaseProvider);
      return db.remindersDao.watchUpcomingReminders();
    });

final todayControllerProvider =
    NotifierProvider<TodayController, TodayViewState>(TodayController.new);
