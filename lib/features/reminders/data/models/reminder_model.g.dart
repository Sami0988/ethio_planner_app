// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) =>
    _ReminderModel(
      id: json['id'] as String,
      title: json['title'] as String,
      ecDate: DateTime.parse(json['ecDate'] as String),
      gcDate: DateTime.parse(json['gcDate'] as String),
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      notificationId: (json['notificationId'] as num?)?.toInt(),
      category: json['category'] as String?,
      linkedEventId: json['linkedEventId'] as String?,
      recurrenceRule: json['recurrenceRule'] as String?,
    );

Map<String, dynamic> _$ReminderModelToJson(_ReminderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ecDate': instance.ecDate.toIso8601String(),
      'gcDate': instance.gcDate.toIso8601String(),
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'notificationId': instance.notificationId,
      'category': instance.category,
      'linkedEventId': instance.linkedEventId,
      'recurrenceRule': instance.recurrenceRule,
    };
