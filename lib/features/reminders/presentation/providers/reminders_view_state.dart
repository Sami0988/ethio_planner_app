import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/reminder.dart';

part 'reminders_view_state.freezed.dart';

enum ReminderFilter { all, today, overdue, upcoming, completed }

@freezed
abstract class RemindersViewState with _$RemindersViewState {
  const factory RemindersViewState({
    @Default(ReminderFilter.all) ReminderFilter filter,
    @Default([]) List<Reminder> allReminders,
    @Default([]) List<Reminder> filteredReminders,
    @Default(false) bool isLoading,
    String? error,
  }) = _RemindersViewState;
}
