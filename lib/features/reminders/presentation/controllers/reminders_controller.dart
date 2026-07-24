import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/reminder.dart';
import '../../domain/usecases/get_reminders.dart';
import '../providers/reminders_view_state.dart';

const _uuid = Uuid();

class RemindersController extends Notifier<RemindersViewState> {
  late final GetReminders _getReminders;
  late final GetOverdueReminders _getOverdueReminders;
  late final GetUpcomingReminders _getUpcomingReminders;
  late final CreateReminder _createReminder;
  late final UpdateReminder _updateReminder;
  late final DeleteReminder _deleteReminder;
  late final ToggleReminderCompleted _toggleCompleted;

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
  }) {
    _getReminders = getReminders;
    _getOverdueReminders = getOverdueReminders;
    _getUpcomingReminders = getUpcomingReminders;
    _createReminder = createReminder;
    _updateReminder = updateReminder;
    _deleteReminder = deleteReminder;
    _toggleCompleted = toggleCompleted;
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
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    List<Reminder> filtered;
    switch (state.filter) {
      case ReminderFilter.all:
        filtered = state.allReminders;
      case ReminderFilter.today:
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
    int? notificationId,
    String? linkedEventId,
    String? recurrenceRule,
  }) async {
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
    await loadReminders();
  }

  Future<void> updateReminder(Reminder reminder) async {
    await _updateReminder(reminder);
    await loadReminders();
  }

  Future<void> deleteReminder(String id) async {
    await _deleteReminder(id);
    await loadReminders();
  }

  Future<void> toggleCompleted(String id) async {
    final reminder = state.allReminders.firstWhere((r) => r.id == id);
    await _toggleCompleted(id, !reminder.isCompleted);
    await loadReminders();
  }
}
