import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/reminder.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

@freezed
abstract class ReminderModel with _$ReminderModel {
  const factory ReminderModel({
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
  }) = _ReminderModel;

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);
}

extension ReminderModelX on ReminderModel {
  Reminder toEntity() {
    return Reminder(
      id: id,
      title: title,
      ecDate: ecDate,
      gcDate: gcDate,
      description: description,
      isCompleted: isCompleted,
      notificationId: notificationId,
      category: category,
      linkedEventId: linkedEventId,
      recurrenceRule: recurrenceRule,
    );
  }
}
