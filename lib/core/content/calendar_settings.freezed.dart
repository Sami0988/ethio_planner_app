// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarSettings {

/// Primary calendar display mode.
 CalendarDisplayMode get displayMode;/// Which day the week starts on.
 WeekStartDay get weekStartDay;/// Primary timezone (IANA format, e.g., 'Africa/Addis_Ababa').
 String get primaryTimezone;/// Optional home timezone for dual-timezone display.
 String? get homeTimezone;/// Enabled content bundle IDs.
 List<String> get enabledContentBundles;/// Numeral preference (Ethiopian numerals vs Latin).
 bool get useEthiopianNumerals;
/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarSettingsCopyWith<CalendarSettings> get copyWith => _$CalendarSettingsCopyWithImpl<CalendarSettings>(this as CalendarSettings, _$identity);

  /// Serializes this CalendarSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarSettings&&(identical(other.displayMode, displayMode) || other.displayMode == displayMode)&&(identical(other.weekStartDay, weekStartDay) || other.weekStartDay == weekStartDay)&&(identical(other.primaryTimezone, primaryTimezone) || other.primaryTimezone == primaryTimezone)&&(identical(other.homeTimezone, homeTimezone) || other.homeTimezone == homeTimezone)&&const DeepCollectionEquality().equals(other.enabledContentBundles, enabledContentBundles)&&(identical(other.useEthiopianNumerals, useEthiopianNumerals) || other.useEthiopianNumerals == useEthiopianNumerals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayMode,weekStartDay,primaryTimezone,homeTimezone,const DeepCollectionEquality().hash(enabledContentBundles),useEthiopianNumerals);

@override
String toString() {
  return 'CalendarSettings(displayMode: $displayMode, weekStartDay: $weekStartDay, primaryTimezone: $primaryTimezone, homeTimezone: $homeTimezone, enabledContentBundles: $enabledContentBundles, useEthiopianNumerals: $useEthiopianNumerals)';
}


}

/// @nodoc
abstract mixin class $CalendarSettingsCopyWith<$Res>  {
  factory $CalendarSettingsCopyWith(CalendarSettings value, $Res Function(CalendarSettings) _then) = _$CalendarSettingsCopyWithImpl;
@useResult
$Res call({
 CalendarDisplayMode displayMode, WeekStartDay weekStartDay, String primaryTimezone, String? homeTimezone, List<String> enabledContentBundles, bool useEthiopianNumerals
});




}
/// @nodoc
class _$CalendarSettingsCopyWithImpl<$Res>
    implements $CalendarSettingsCopyWith<$Res> {
  _$CalendarSettingsCopyWithImpl(this._self, this._then);

  final CalendarSettings _self;
  final $Res Function(CalendarSettings) _then;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayMode = null,Object? weekStartDay = null,Object? primaryTimezone = null,Object? homeTimezone = freezed,Object? enabledContentBundles = null,Object? useEthiopianNumerals = null,}) {
  return _then(_self.copyWith(
displayMode: null == displayMode ? _self.displayMode : displayMode // ignore: cast_nullable_to_non_nullable
as CalendarDisplayMode,weekStartDay: null == weekStartDay ? _self.weekStartDay : weekStartDay // ignore: cast_nullable_to_non_nullable
as WeekStartDay,primaryTimezone: null == primaryTimezone ? _self.primaryTimezone : primaryTimezone // ignore: cast_nullable_to_non_nullable
as String,homeTimezone: freezed == homeTimezone ? _self.homeTimezone : homeTimezone // ignore: cast_nullable_to_non_nullable
as String?,enabledContentBundles: null == enabledContentBundles ? _self.enabledContentBundles : enabledContentBundles // ignore: cast_nullable_to_non_nullable
as List<String>,useEthiopianNumerals: null == useEthiopianNumerals ? _self.useEthiopianNumerals : useEthiopianNumerals // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarSettings].
extension CalendarSettingsPatterns on CalendarSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarSettings value)  $default,){
final _that = this;
switch (_that) {
case _CalendarSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarDisplayMode displayMode,  WeekStartDay weekStartDay,  String primaryTimezone,  String? homeTimezone,  List<String> enabledContentBundles,  bool useEthiopianNumerals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that.displayMode,_that.weekStartDay,_that.primaryTimezone,_that.homeTimezone,_that.enabledContentBundles,_that.useEthiopianNumerals);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarDisplayMode displayMode,  WeekStartDay weekStartDay,  String primaryTimezone,  String? homeTimezone,  List<String> enabledContentBundles,  bool useEthiopianNumerals)  $default,) {final _that = this;
switch (_that) {
case _CalendarSettings():
return $default(_that.displayMode,_that.weekStartDay,_that.primaryTimezone,_that.homeTimezone,_that.enabledContentBundles,_that.useEthiopianNumerals);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarDisplayMode displayMode,  WeekStartDay weekStartDay,  String primaryTimezone,  String? homeTimezone,  List<String> enabledContentBundles,  bool useEthiopianNumerals)?  $default,) {final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that.displayMode,_that.weekStartDay,_that.primaryTimezone,_that.homeTimezone,_that.enabledContentBundles,_that.useEthiopianNumerals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarSettings implements CalendarSettings {
  const _CalendarSettings({this.displayMode = CalendarDisplayMode.dual, this.weekStartDay = WeekStartDay.monday, this.primaryTimezone = 'Africa/Addis_Ababa', this.homeTimezone, final  List<String> enabledContentBundles = const ['ethiopian_holidays', 'ethiopian_observances'], this.useEthiopianNumerals = false}): _enabledContentBundles = enabledContentBundles;
  factory _CalendarSettings.fromJson(Map<String, dynamic> json) => _$CalendarSettingsFromJson(json);

/// Primary calendar display mode.
@override@JsonKey() final  CalendarDisplayMode displayMode;
/// Which day the week starts on.
@override@JsonKey() final  WeekStartDay weekStartDay;
/// Primary timezone (IANA format, e.g., 'Africa/Addis_Ababa').
@override@JsonKey() final  String primaryTimezone;
/// Optional home timezone for dual-timezone display.
@override final  String? homeTimezone;
/// Enabled content bundle IDs.
 final  List<String> _enabledContentBundles;
/// Enabled content bundle IDs.
@override@JsonKey() List<String> get enabledContentBundles {
  if (_enabledContentBundles is EqualUnmodifiableListView) return _enabledContentBundles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enabledContentBundles);
}

/// Numeral preference (Ethiopian numerals vs Latin).
@override@JsonKey() final  bool useEthiopianNumerals;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarSettingsCopyWith<_CalendarSettings> get copyWith => __$CalendarSettingsCopyWithImpl<_CalendarSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarSettings&&(identical(other.displayMode, displayMode) || other.displayMode == displayMode)&&(identical(other.weekStartDay, weekStartDay) || other.weekStartDay == weekStartDay)&&(identical(other.primaryTimezone, primaryTimezone) || other.primaryTimezone == primaryTimezone)&&(identical(other.homeTimezone, homeTimezone) || other.homeTimezone == homeTimezone)&&const DeepCollectionEquality().equals(other._enabledContentBundles, _enabledContentBundles)&&(identical(other.useEthiopianNumerals, useEthiopianNumerals) || other.useEthiopianNumerals == useEthiopianNumerals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayMode,weekStartDay,primaryTimezone,homeTimezone,const DeepCollectionEquality().hash(_enabledContentBundles),useEthiopianNumerals);

@override
String toString() {
  return 'CalendarSettings(displayMode: $displayMode, weekStartDay: $weekStartDay, primaryTimezone: $primaryTimezone, homeTimezone: $homeTimezone, enabledContentBundles: $enabledContentBundles, useEthiopianNumerals: $useEthiopianNumerals)';
}


}

/// @nodoc
abstract mixin class _$CalendarSettingsCopyWith<$Res> implements $CalendarSettingsCopyWith<$Res> {
  factory _$CalendarSettingsCopyWith(_CalendarSettings value, $Res Function(_CalendarSettings) _then) = __$CalendarSettingsCopyWithImpl;
@override @useResult
$Res call({
 CalendarDisplayMode displayMode, WeekStartDay weekStartDay, String primaryTimezone, String? homeTimezone, List<String> enabledContentBundles, bool useEthiopianNumerals
});




}
/// @nodoc
class __$CalendarSettingsCopyWithImpl<$Res>
    implements _$CalendarSettingsCopyWith<$Res> {
  __$CalendarSettingsCopyWithImpl(this._self, this._then);

  final _CalendarSettings _self;
  final $Res Function(_CalendarSettings) _then;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayMode = null,Object? weekStartDay = null,Object? primaryTimezone = null,Object? homeTimezone = freezed,Object? enabledContentBundles = null,Object? useEthiopianNumerals = null,}) {
  return _then(_CalendarSettings(
displayMode: null == displayMode ? _self.displayMode : displayMode // ignore: cast_nullable_to_non_nullable
as CalendarDisplayMode,weekStartDay: null == weekStartDay ? _self.weekStartDay : weekStartDay // ignore: cast_nullable_to_non_nullable
as WeekStartDay,primaryTimezone: null == primaryTimezone ? _self.primaryTimezone : primaryTimezone // ignore: cast_nullable_to_non_nullable
as String,homeTimezone: freezed == homeTimezone ? _self.homeTimezone : homeTimezone // ignore: cast_nullable_to_non_nullable
as String?,enabledContentBundles: null == enabledContentBundles ? _self._enabledContentBundles : enabledContentBundles // ignore: cast_nullable_to_non_nullable
as List<String>,useEthiopianNumerals: null == useEthiopianNumerals ? _self.useEthiopianNumerals : useEthiopianNumerals // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
