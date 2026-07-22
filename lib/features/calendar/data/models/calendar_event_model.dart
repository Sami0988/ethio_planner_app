import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/calendar_event.dart';

part 'calendar_event_model.freezed.dart';
part 'calendar_event_model.g.dart';

@freezed
abstract class CalendarEventModel with _$CalendarEventModel {
  const factory CalendarEventModel({
    required String id,
    required String title,
    required DateTime date,
    String? description,
  }) = _CalendarEventModel;

  factory CalendarEventModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventModelFromJson(json);
}

extension CalendarEventModelX on CalendarEventModel {
  CalendarEvent toEntity() {
    return CalendarEvent(
      id: id,
      title: title,
      date: date,
      description: description,
    );
  }
}
