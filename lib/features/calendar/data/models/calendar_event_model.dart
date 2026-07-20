import '../../domain/entities/calendar_event.dart';

class CalendarEventModel extends CalendarEvent {
  const CalendarEventModel({
    required super.id,
    required super.title,
    required super.date,
    super.description,
  });

  factory CalendarEventModel.fromJson(Map<String, dynamic> json) {
    return CalendarEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'description': description,
    };
  }
}
