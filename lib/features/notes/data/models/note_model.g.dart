// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => _NoteModel(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isPinned: json['isPinned'] as bool? ?? false,
  isArchived: json['isArchived'] as bool? ?? false,
  category: json['category'] as String?,
  linkedEventId: json['linkedEventId'] as String?,
  linkedReminderId: json['linkedReminderId'] as String?,
  linkedPlannerItemId: json['linkedPlannerItemId'] as String?,
);

Map<String, dynamic> _$NoteModelToJson(_NoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isPinned': instance.isPinned,
      'isArchived': instance.isArchived,
      'category': instance.category,
      'linkedEventId': instance.linkedEventId,
      'linkedReminderId': instance.linkedReminderId,
      'linkedPlannerItemId': instance.linkedPlannerItemId,
    };
