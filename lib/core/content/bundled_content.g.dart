// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundled_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BundledContent _$BundledContentFromJson(Map<String, dynamic> json) =>
    _BundledContent(
      id: json['id'] as String,
      type: $enumDecode(_$ContentTypeEnumMap, json['type']),
      calendarBasis: $enumDecode(
        _$ContentCalendarBasisEnumMap,
        json['calendarBasis'],
      ),
      ecMonth: (json['ecMonth'] as num?)?.toInt(),
      ecDay: (json['ecDay'] as num?)?.toInt(),
      gcMonth: (json['gcMonth'] as num?)?.toInt(),
      gcDay: (json['gcDay'] as num?)?.toInt(),
      recurrenceRule: json['recurrenceRule'] as String?,
      titleEn: json['titleEn'] as String,
      titleAm: json['titleAm'] as String,
      titleOm: json['titleOm'] as String,
      titleTi: json['titleTi'] as String,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAm: json['descriptionAm'] as String?,
      descriptionOm: json['descriptionOm'] as String?,
      descriptionTi: json['descriptionTi'] as String?,
      source: json['source'] as String?,
      bundleVersion: json['bundleVersion'] as String? ?? '1.0.0',
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$BundledContentToJson(_BundledContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ContentTypeEnumMap[instance.type]!,
      'calendarBasis': _$ContentCalendarBasisEnumMap[instance.calendarBasis]!,
      'ecMonth': instance.ecMonth,
      'ecDay': instance.ecDay,
      'gcMonth': instance.gcMonth,
      'gcDay': instance.gcDay,
      'recurrenceRule': instance.recurrenceRule,
      'titleEn': instance.titleEn,
      'titleAm': instance.titleAm,
      'titleOm': instance.titleOm,
      'titleTi': instance.titleTi,
      'descriptionEn': instance.descriptionEn,
      'descriptionAm': instance.descriptionAm,
      'descriptionOm': instance.descriptionOm,
      'descriptionTi': instance.descriptionTi,
      'source': instance.source,
      'bundleVersion': instance.bundleVersion,
      'schemaVersion': instance.schemaVersion,
    };

const _$ContentTypeEnumMap = {
  ContentType.holiday: 'holiday',
  ContentType.observance: 'observance',
};

const _$ContentCalendarBasisEnumMap = {
  ContentCalendarBasis.ethiopian: 'ethiopian',
  ContentCalendarBasis.gregorian: 'gregorian',
};

_ContentBundle _$ContentBundleFromJson(Map<String, dynamic> json) =>
    _ContentBundle(
      id: json['id'] as String,
      name: json['name'] as String,
      enabledByDefault: json['enabledByDefault'] as bool? ?? true,
      items: (json['items'] as List<dynamic>)
          .map((e) => BundledContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String? ?? '1.0.0',
    );

Map<String, dynamic> _$ContentBundleToJson(_ContentBundle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enabledByDefault': instance.enabledByDefault,
      'items': instance.items,
      'version': instance.version,
    };
