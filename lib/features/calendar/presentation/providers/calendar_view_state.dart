import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/calendar_event.dart';

part 'calendar_view_state.freezed.dart';

@freezed
abstract class CalendarViewState with _$CalendarViewState {
  const factory CalendarViewState({
    required DateTime currentMonth,
    required DateTime? selectedDate,
    @Default([]) List<CalendarEvent> events,
    @Default([]) List<CalendarEvent> selectedDayEvents,
    @Default(false) bool isLoading,
    String? error,
  }) = _CalendarViewState;
}
