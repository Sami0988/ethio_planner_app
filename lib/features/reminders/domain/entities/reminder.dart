import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';

@freezed
abstract class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    @Default(false) bool isCompleted,
    int? notificationId,
    String? category,
    String? linkedEventId,
    String? recurrenceRule,
  }) = _Reminder;
}
