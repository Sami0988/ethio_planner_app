import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';

@freezed
abstract class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    @Default(false) bool isAllDay,
    String? category,
    String? location,
    String? recurrenceRule,
  }) = _CalendarEvent;
}
