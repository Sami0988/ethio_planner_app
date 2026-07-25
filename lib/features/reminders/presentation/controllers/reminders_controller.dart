import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/notifications/notification_service.dart';
import '../../domain/entities/reminder.dart';
import '../../domain/usecases/get_reminders.dart';
import '../providers/reminders_view_state.dart';

const _uuid = Uuid();

class RemindersController extends Notifier<RemindersViewState> {
  late final GetReminders _getReminders;
  late final CreateReminder _createReminder;
  late final UpdateReminder _updateReminder;
  late final DeleteReminder _deleteReminder;
  late final ToggleReminderCompleted _toggleCompleted;
  late final NotificationService _notificationService;

  @override
  RemindersViewState build() {
    return const RemindersViewState();
  }

  void setDependencies({
    required GetReminders getReminders,
    required GetOverdueReminders getOverdueReminders,
    required GetUpcomingReminders getUpcomingReminders,
    required CreateReminder createReminder,
    required UpdateReminder updateReminder,
    required DeleteReminder deleteReminder,
    required ToggleReminderCompleted toggleCompleted,
    required NotificationService notificationService,
  }) {
    _getReminders = getReminders;
    _createReminder = createReminder;
    _updateReminder = updateReminder;
    _deleteReminder = deleteReminder;
    _toggleCompleted = toggleCompleted;
    _notificationService = notificationService;
  }

  Future<void> loadReminders() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final allReminders = await _getReminders();
      state = state.copyWith(allReminders: allReminders, isLoading: false);
      _applyFilter();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void setFilter(ReminderFilter filter) {
    state = state.copyWith(filter: filter);
    _applyFilter();
  }

  void _applyFilter() {
    final now = clock.now();

    List<Reminder> filtered;
    switch (state.filter) {
      case ReminderFilter.all:
        filtered = state.allReminders;
      case ReminderFilter.today:
        final today = DateTime(now.year, now.month, now.day);
        filtered = state.allReminders.where((r) {
          return r.gcDate.year == today.year &&
              r.gcDate.month == today.month &&
              r.gcDate.day == today.day &&
              !r.isCompleted;
        }).toList();
      case ReminderFilter.overdue:
        filtered = state.allReminders.where((r) {
          return r.gcDate.isBefore(now) && !r.isCompleted;
        }).toList();
      case ReminderFilter.upcoming:
        filtered = state.allReminders.where((r) {
          return r.gcDate.isAfter(now) && !r.isCompleted;
        }).toList();
      case ReminderFilter.completed:
        filtered = state.allReminders.where((r) => r.isCompleted).toList();
    }

    state = state.copyWith(filteredReminders: filtered);
  }

  Future<void> createReminder({
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    String? category,
    String? linkedEventId,
    String? recurrenceRule,
  }) async {
    final notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final reminder = Reminder(
      id: _uuid.v4(),
      title: title,
      ecDate: ecDate,
      gcDate: gcDate,
      description: description,
      category: category,
      notificationId: notificationId,
      linkedEventId: linkedEventId,
      recurrenceRule: recurrenceRule,
    );
    await _createReminder(reminder);

    // Schedule notification if time is in the future
    if (gcDate.isAfter(clock.now())) {
      await _scheduleReminderNotification(reminder);
    }

    await loadReminders();
  }

  Future<void> updateReminder(Reminder reminder) async {
    final oldReminder = state.allReminders.firstWhere(
      (r) => r.id == reminder.id,
      orElse: () => reminder,
    );

    await _updateReminder(reminder);

    // Cancel old notification and reschedule if time changed or recurrence changed
    final timeChanged = oldReminder.gcDate != reminder.gcDate;
    final recurrenceChanged =
        oldReminder.recurrenceRule != reminder.recurrenceRule;

    if (timeChanged || recurrenceChanged) {
      // Cancel old notification
      if (oldReminder.notificationId != null) {
        await _notificationService.cancelNotification(
          oldReminder.notificationId!,
        );
      }

      // Reschedule if time is in the future
      if (reminder.gcDate.isAfter(clock.now())) {
        await _scheduleReminderNotification(reminder);
      }
    }

    await loadReminders();
  }

  Future<void> deleteReminder(String id) async {
    final reminder = state.allReminders.firstWhere((r) => r.id == id);

    // Cancel notification before deleting
    if (reminder.notificationId != null) {
      await _notificationService.cancelNotification(reminder.notificationId!);
    }

    await _deleteReminder(id);
    await loadReminders();
  }

  Future<void> toggleCompleted(String id) async {
    final reminder = state.allReminders.firstWhere((r) => r.id == id);
    final updated = reminder.copyWith(isCompleted: !reminder.isCompleted);

    // Cancel notification if marking as completed
    if (updated.isCompleted && reminder.notificationId != null) {
      await _notificationService.cancelNotification(reminder.notificationId!);
    }

    await _toggleCompleted(id, !reminder.isCompleted);
    await loadReminders();
  }

  /// Rebuilds all pending notifications from the database.
  /// Called on app restart to ensure notifications survive process death.
  Future<void> rebuildNotifications() async {
    final now = clock.now();
    for (final reminder in state.allReminders) {
      if (!reminder.isCompleted &&
          reminder.gcDate.isAfter(now) &&
          reminder.notificationId != null) {
        await _scheduleReminderNotification(reminder);
      }
    }
  }

  Future<void> _scheduleReminderNotification(Reminder reminder) async {
    if (reminder.notificationId == null) return;

    await _notificationService.scheduleNotification(
      id: reminder.notificationId!,
      title: reminder.title,
      body: reminder.description ?? 'Reminder',
      scheduledTime: reminder.gcDate,
    );
  }

  /// Returns true if notification permission is granted.
  Future<bool> requestNotificationPermission() async {
    return _notificationService.requestPermission();
  }
}
