// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarSettings _$CalendarSettingsFromJson(
  Map<String, dynamic> json,
) => _CalendarSettings(
  displayMode:
      $enumDecodeNullable(_$CalendarDisplayModeEnumMap, json['displayMode']) ??
      CalendarDisplayMode.dual,
  weekStartDay:
      $enumDecodeNullable(_$WeekStartDayEnumMap, json['weekStartDay']) ??
      WeekStartDay.monday,
  primaryTimezone: json['primaryTimezone'] as String? ?? 'Africa/Addis_Ababa',
  homeTimezone: json['homeTimezone'] as String?,
  enabledContentBundles:
      (json['enabledContentBundles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['ethiopian_holidays', 'ethiopian_observances'],
  useEthiopianNumerals: json['useEthiopianNumerals'] as bool? ?? false,
);

Map<String, dynamic> _$CalendarSettingsToJson(_CalendarSettings instance) =>
    <String, dynamic>{
      'displayMode': _$CalendarDisplayModeEnumMap[instance.displayMode]!,
      'weekStartDay': _$WeekStartDayEnumMap[instance.weekStartDay]!,
      'primaryTimezone': instance.primaryTimezone,
      'homeTimezone': instance.homeTimezone,
      'enabledContentBundles': instance.enabledContentBundles,
      'useEthiopianNumerals': instance.useEthiopianNumerals,
    };

const _$CalendarDisplayModeEnumMap = {
  CalendarDisplayMode.ethiopian: 'ethiopian',
  CalendarDisplayMode.gregorian: 'gregorian',
  CalendarDisplayMode.dual: 'dual',
};

const _$WeekStartDayEnumMap = {
  WeekStartDay.monday: 'monday',
  WeekStartDay.sunday: 'sunday',
  WeekStartDay.saturday: 'saturday',
};
