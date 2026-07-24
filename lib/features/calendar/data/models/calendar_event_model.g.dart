// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarEventModel _$CalendarEventModelFromJson(Map<String, dynamic> json) =>
    _CalendarEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      ecDate: DateTime.parse(json['ecDate'] as String),
      gcDate: DateTime.parse(json['gcDate'] as String),
      description: json['description'] as String?,
      isAllDay: json['isAllDay'] as bool? ?? false,
      category: json['category'] as String?,
      location: json['location'] as String?,
      recurrenceRule: json['recurrenceRule'] as String?,
    );

Map<String, dynamic> _$CalendarEventModelToJson(_CalendarEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ecDate': instance.ecDate.toIso8601String(),
      'gcDate': instance.gcDate.toIso8601String(),
      'description': instance.description,
      'isAllDay': instance.isAllDay,
      'category': instance.category,
      'location': instance.location,
      'recurrenceRule': instance.recurrenceRule,
    };
