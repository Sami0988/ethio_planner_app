// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlannerItemModel _$PlannerItemModelFromJson(Map<String, dynamic> json) =>
    _PlannerItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      ecDate: DateTime.parse(json['ecDate'] as String),
      gcDate: DateTime.parse(json['gcDate'] as String),
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      section:
          $enumDecodeNullable(_$PlannerSectionModelEnumMap, json['section']) ??
          PlannerSectionModel.focus,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      linkedEventId: json['linkedEventId'] as String?,
      linkedReminderId: json['linkedReminderId'] as String?,
    );

Map<String, dynamic> _$PlannerItemModelToJson(_PlannerItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ecDate': instance.ecDate.toIso8601String(),
      'gcDate': instance.gcDate.toIso8601String(),
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'section': _$PlannerSectionModelEnumMap[instance.section]!,
      'sortOrder': instance.sortOrder,
      'linkedEventId': instance.linkedEventId,
      'linkedReminderId': instance.linkedReminderId,
    };

const _$PlannerSectionModelEnumMap = {
  PlannerSectionModel.focus: 'focus',
  PlannerSectionModel.priorities: 'priorities',
  PlannerSectionModel.checklist: 'checklist',
  PlannerSectionModel.notes: 'notes',
  PlannerSectionModel.reflection: 'reflection',
};
