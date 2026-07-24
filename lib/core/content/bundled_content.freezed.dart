// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundled_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BundledContent {

/// Unique stable identifier (e.g., 'et_holiday_genna').
 String get id;/// Content type (holiday, observance).
 ContentType get type;/// Calendar basis for the date.
 ContentCalendarBasis get calendarBasis;/// Ethiopian month (1-13) if calendarBasis is ethiopian.
 int? get ecMonth;/// Day of month (1-30/31) if calendarBasis is ethiopian.
 int? get ecDay;/// Gregorian month (1-12) if calendarBasis is gregorian.
 int? get gcMonth;/// Gregorian day of month (1-31) if calendarBasis is gregorian.
 int? get gcDay;/// Recurrence rule string (null for fixed-date items).
/// Format: "type:param" (e.g., "easter_offset:-2", "orthodox_easter:-1").
 String? get recurrenceRule;/// English title.
 String get titleEn;/// Amharic title.
 String get titleAm;/// Afaan Oromo title.
 String get titleOm;/// Tigrinya title.
 String get titleTi;/// English description (nullable).
 String? get descriptionEn;/// Amharic description (nullable).
 String? get descriptionAm;/// Afaan Oromo description (nullable).
 String? get descriptionOm;/// Tigrinya description (nullable).
 String? get descriptionTi;/// Source or authority for this item.
 String? get source;/// Content bundle version.
 String get bundleVersion;/// Schema version for forward compatibility.
 int get schemaVersion;
/// Create a copy of BundledContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BundledContentCopyWith<BundledContent> get copyWith => _$BundledContentCopyWithImpl<BundledContent>(this as BundledContent, _$identity);

  /// Serializes this BundledContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BundledContent&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.calendarBasis, calendarBasis) || other.calendarBasis == calendarBasis)&&(identical(other.ecMonth, ecMonth) || other.ecMonth == ecMonth)&&(identical(other.ecDay, ecDay) || other.ecDay == ecDay)&&(identical(other.gcMonth, gcMonth) || other.gcMonth == gcMonth)&&(identical(other.gcDay, gcDay) || other.gcDay == gcDay)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleAm, titleAm) || other.titleAm == titleAm)&&(identical(other.titleOm, titleOm) || other.titleOm == titleOm)&&(identical(other.titleTi, titleTi) || other.titleTi == titleTi)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAm, descriptionAm) || other.descriptionAm == descriptionAm)&&(identical(other.descriptionOm, descriptionOm) || other.descriptionOm == descriptionOm)&&(identical(other.descriptionTi, descriptionTi) || other.descriptionTi == descriptionTi)&&(identical(other.source, source) || other.source == source)&&(identical(other.bundleVersion, bundleVersion) || other.bundleVersion == bundleVersion)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,calendarBasis,ecMonth,ecDay,gcMonth,gcDay,recurrenceRule,titleEn,titleAm,titleOm,titleTi,descriptionEn,descriptionAm,descriptionOm,descriptionTi,source,bundleVersion,schemaVersion]);

@override
String toString() {
  return 'BundledContent(id: $id, type: $type, calendarBasis: $calendarBasis, ecMonth: $ecMonth, ecDay: $ecDay, gcMonth: $gcMonth, gcDay: $gcDay, recurrenceRule: $recurrenceRule, titleEn: $titleEn, titleAm: $titleAm, titleOm: $titleOm, titleTi: $titleTi, descriptionEn: $descriptionEn, descriptionAm: $descriptionAm, descriptionOm: $descriptionOm, descriptionTi: $descriptionTi, source: $source, bundleVersion: $bundleVersion, schemaVersion: $schemaVersion)';
}


}

/// @nodoc
abstract mixin class $BundledContentCopyWith<$Res>  {
  factory $BundledContentCopyWith(BundledContent value, $Res Function(BundledContent) _then) = _$BundledContentCopyWithImpl;
@useResult
$Res call({
 String id, ContentType type, ContentCalendarBasis calendarBasis, int? ecMonth, int? ecDay, int? gcMonth, int? gcDay, String? recurrenceRule, String titleEn, String titleAm, String titleOm, String titleTi, String? descriptionEn, String? descriptionAm, String? descriptionOm, String? descriptionTi, String? source, String bundleVersion, int schemaVersion
});




}
/// @nodoc
class _$BundledContentCopyWithImpl<$Res>
    implements $BundledContentCopyWith<$Res> {
  _$BundledContentCopyWithImpl(this._self, this._then);

  final BundledContent _self;
  final $Res Function(BundledContent) _then;

/// Create a copy of BundledContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? calendarBasis = null,Object? ecMonth = freezed,Object? ecDay = freezed,Object? gcMonth = freezed,Object? gcDay = freezed,Object? recurrenceRule = freezed,Object? titleEn = null,Object? titleAm = null,Object? titleOm = null,Object? titleTi = null,Object? descriptionEn = freezed,Object? descriptionAm = freezed,Object? descriptionOm = freezed,Object? descriptionTi = freezed,Object? source = freezed,Object? bundleVersion = null,Object? schemaVersion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ContentType,calendarBasis: null == calendarBasis ? _self.calendarBasis : calendarBasis // ignore: cast_nullable_to_non_nullable
as ContentCalendarBasis,ecMonth: freezed == ecMonth ? _self.ecMonth : ecMonth // ignore: cast_nullable_to_non_nullable
as int?,ecDay: freezed == ecDay ? _self.ecDay : ecDay // ignore: cast_nullable_to_non_nullable
as int?,gcMonth: freezed == gcMonth ? _self.gcMonth : gcMonth // ignore: cast_nullable_to_non_nullable
as int?,gcDay: freezed == gcDay ? _self.gcDay : gcDay // ignore: cast_nullable_to_non_nullable
as int?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleAm: null == titleAm ? _self.titleAm : titleAm // ignore: cast_nullable_to_non_nullable
as String,titleOm: null == titleOm ? _self.titleOm : titleOm // ignore: cast_nullable_to_non_nullable
as String,titleTi: null == titleTi ? _self.titleTi : titleTi // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAm: freezed == descriptionAm ? _self.descriptionAm : descriptionAm // ignore: cast_nullable_to_non_nullable
as String?,descriptionOm: freezed == descriptionOm ? _self.descriptionOm : descriptionOm // ignore: cast_nullable_to_non_nullable
as String?,descriptionTi: freezed == descriptionTi ? _self.descriptionTi : descriptionTi // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,bundleVersion: null == bundleVersion ? _self.bundleVersion : bundleVersion // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BundledContent].
extension BundledContentPatterns on BundledContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BundledContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BundledContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BundledContent value)  $default,){
final _that = this;
switch (_that) {
case _BundledContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BundledContent value)?  $default,){
final _that = this;
switch (_that) {
case _BundledContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ContentType type,  ContentCalendarBasis calendarBasis,  int? ecMonth,  int? ecDay,  int? gcMonth,  int? gcDay,  String? recurrenceRule,  String titleEn,  String titleAm,  String titleOm,  String titleTi,  String? descriptionEn,  String? descriptionAm,  String? descriptionOm,  String? descriptionTi,  String? source,  String bundleVersion,  int schemaVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BundledContent() when $default != null:
return $default(_that.id,_that.type,_that.calendarBasis,_that.ecMonth,_that.ecDay,_that.gcMonth,_that.gcDay,_that.recurrenceRule,_that.titleEn,_that.titleAm,_that.titleOm,_that.titleTi,_that.descriptionEn,_that.descriptionAm,_that.descriptionOm,_that.descriptionTi,_that.source,_that.bundleVersion,_that.schemaVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ContentType type,  ContentCalendarBasis calendarBasis,  int? ecMonth,  int? ecDay,  int? gcMonth,  int? gcDay,  String? recurrenceRule,  String titleEn,  String titleAm,  String titleOm,  String titleTi,  String? descriptionEn,  String? descriptionAm,  String? descriptionOm,  String? descriptionTi,  String? source,  String bundleVersion,  int schemaVersion)  $default,) {final _that = this;
switch (_that) {
case _BundledContent():
return $default(_that.id,_that.type,_that.calendarBasis,_that.ecMonth,_that.ecDay,_that.gcMonth,_that.gcDay,_that.recurrenceRule,_that.titleEn,_that.titleAm,_that.titleOm,_that.titleTi,_that.descriptionEn,_that.descriptionAm,_that.descriptionOm,_that.descriptionTi,_that.source,_that.bundleVersion,_that.schemaVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ContentType type,  ContentCalendarBasis calendarBasis,  int? ecMonth,  int? ecDay,  int? gcMonth,  int? gcDay,  String? recurrenceRule,  String titleEn,  String titleAm,  String titleOm,  String titleTi,  String? descriptionEn,  String? descriptionAm,  String? descriptionOm,  String? descriptionTi,  String? source,  String bundleVersion,  int schemaVersion)?  $default,) {final _that = this;
switch (_that) {
case _BundledContent() when $default != null:
return $default(_that.id,_that.type,_that.calendarBasis,_that.ecMonth,_that.ecDay,_that.gcMonth,_that.gcDay,_that.recurrenceRule,_that.titleEn,_that.titleAm,_that.titleOm,_that.titleTi,_that.descriptionEn,_that.descriptionAm,_that.descriptionOm,_that.descriptionTi,_that.source,_that.bundleVersion,_that.schemaVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BundledContent implements BundledContent {
  const _BundledContent({required this.id, required this.type, required this.calendarBasis, this.ecMonth, this.ecDay, this.gcMonth, this.gcDay, this.recurrenceRule, required this.titleEn, required this.titleAm, required this.titleOm, required this.titleTi, this.descriptionEn, this.descriptionAm, this.descriptionOm, this.descriptionTi, this.source, this.bundleVersion = '1.0.0', this.schemaVersion = 1});
  factory _BundledContent.fromJson(Map<String, dynamic> json) => _$BundledContentFromJson(json);

/// Unique stable identifier (e.g., 'et_holiday_genna').
@override final  String id;
/// Content type (holiday, observance).
@override final  ContentType type;
/// Calendar basis for the date.
@override final  ContentCalendarBasis calendarBasis;
/// Ethiopian month (1-13) if calendarBasis is ethiopian.
@override final  int? ecMonth;
/// Day of month (1-30/31) if calendarBasis is ethiopian.
@override final  int? ecDay;
/// Gregorian month (1-12) if calendarBasis is gregorian.
@override final  int? gcMonth;
/// Gregorian day of month (1-31) if calendarBasis is gregorian.
@override final  int? gcDay;
/// Recurrence rule string (null for fixed-date items).
/// Format: "type:param" (e.g., "easter_offset:-2", "orthodox_easter:-1").
@override final  String? recurrenceRule;
/// English title.
@override final  String titleEn;
/// Amharic title.
@override final  String titleAm;
/// Afaan Oromo title.
@override final  String titleOm;
/// Tigrinya title.
@override final  String titleTi;
/// English description (nullable).
@override final  String? descriptionEn;
/// Amharic description (nullable).
@override final  String? descriptionAm;
/// Afaan Oromo description (nullable).
@override final  String? descriptionOm;
/// Tigrinya description (nullable).
@override final  String? descriptionTi;
/// Source or authority for this item.
@override final  String? source;
/// Content bundle version.
@override@JsonKey() final  String bundleVersion;
/// Schema version for forward compatibility.
@override@JsonKey() final  int schemaVersion;

/// Create a copy of BundledContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BundledContentCopyWith<_BundledContent> get copyWith => __$BundledContentCopyWithImpl<_BundledContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BundledContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BundledContent&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.calendarBasis, calendarBasis) || other.calendarBasis == calendarBasis)&&(identical(other.ecMonth, ecMonth) || other.ecMonth == ecMonth)&&(identical(other.ecDay, ecDay) || other.ecDay == ecDay)&&(identical(other.gcMonth, gcMonth) || other.gcMonth == gcMonth)&&(identical(other.gcDay, gcDay) || other.gcDay == gcDay)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleAm, titleAm) || other.titleAm == titleAm)&&(identical(other.titleOm, titleOm) || other.titleOm == titleOm)&&(identical(other.titleTi, titleTi) || other.titleTi == titleTi)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAm, descriptionAm) || other.descriptionAm == descriptionAm)&&(identical(other.descriptionOm, descriptionOm) || other.descriptionOm == descriptionOm)&&(identical(other.descriptionTi, descriptionTi) || other.descriptionTi == descriptionTi)&&(identical(other.source, source) || other.source == source)&&(identical(other.bundleVersion, bundleVersion) || other.bundleVersion == bundleVersion)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,calendarBasis,ecMonth,ecDay,gcMonth,gcDay,recurrenceRule,titleEn,titleAm,titleOm,titleTi,descriptionEn,descriptionAm,descriptionOm,descriptionTi,source,bundleVersion,schemaVersion]);

@override
String toString() {
  return 'BundledContent(id: $id, type: $type, calendarBasis: $calendarBasis, ecMonth: $ecMonth, ecDay: $ecDay, gcMonth: $gcMonth, gcDay: $gcDay, recurrenceRule: $recurrenceRule, titleEn: $titleEn, titleAm: $titleAm, titleOm: $titleOm, titleTi: $titleTi, descriptionEn: $descriptionEn, descriptionAm: $descriptionAm, descriptionOm: $descriptionOm, descriptionTi: $descriptionTi, source: $source, bundleVersion: $bundleVersion, schemaVersion: $schemaVersion)';
}


}

/// @nodoc
abstract mixin class _$BundledContentCopyWith<$Res> implements $BundledContentCopyWith<$Res> {
  factory _$BundledContentCopyWith(_BundledContent value, $Res Function(_BundledContent) _then) = __$BundledContentCopyWithImpl;
@override @useResult
$Res call({
 String id, ContentType type, ContentCalendarBasis calendarBasis, int? ecMonth, int? ecDay, int? gcMonth, int? gcDay, String? recurrenceRule, String titleEn, String titleAm, String titleOm, String titleTi, String? descriptionEn, String? descriptionAm, String? descriptionOm, String? descriptionTi, String? source, String bundleVersion, int schemaVersion
});




}
/// @nodoc
class __$BundledContentCopyWithImpl<$Res>
    implements _$BundledContentCopyWith<$Res> {
  __$BundledContentCopyWithImpl(this._self, this._then);

  final _BundledContent _self;
  final $Res Function(_BundledContent) _then;

/// Create a copy of BundledContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? calendarBasis = null,Object? ecMonth = freezed,Object? ecDay = freezed,Object? gcMonth = freezed,Object? gcDay = freezed,Object? recurrenceRule = freezed,Object? titleEn = null,Object? titleAm = null,Object? titleOm = null,Object? titleTi = null,Object? descriptionEn = freezed,Object? descriptionAm = freezed,Object? descriptionOm = freezed,Object? descriptionTi = freezed,Object? source = freezed,Object? bundleVersion = null,Object? schemaVersion = null,}) {
  return _then(_BundledContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ContentType,calendarBasis: null == calendarBasis ? _self.calendarBasis : calendarBasis // ignore: cast_nullable_to_non_nullable
as ContentCalendarBasis,ecMonth: freezed == ecMonth ? _self.ecMonth : ecMonth // ignore: cast_nullable_to_non_nullable
as int?,ecDay: freezed == ecDay ? _self.ecDay : ecDay // ignore: cast_nullable_to_non_nullable
as int?,gcMonth: freezed == gcMonth ? _self.gcMonth : gcMonth // ignore: cast_nullable_to_non_nullable
as int?,gcDay: freezed == gcDay ? _self.gcDay : gcDay // ignore: cast_nullable_to_non_nullable
as int?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleAm: null == titleAm ? _self.titleAm : titleAm // ignore: cast_nullable_to_non_nullable
as String,titleOm: null == titleOm ? _self.titleOm : titleOm // ignore: cast_nullable_to_non_nullable
as String,titleTi: null == titleTi ? _self.titleTi : titleTi // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAm: freezed == descriptionAm ? _self.descriptionAm : descriptionAm // ignore: cast_nullable_to_non_nullable
as String?,descriptionOm: freezed == descriptionOm ? _self.descriptionOm : descriptionOm // ignore: cast_nullable_to_non_nullable
as String?,descriptionTi: freezed == descriptionTi ? _self.descriptionTi : descriptionTi // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,bundleVersion: null == bundleVersion ? _self.bundleVersion : bundleVersion // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ContentBundle {

/// Bundle identifier.
 String get id;/// Bundle display name.
 String get name;/// Whether this bundle is enabled by default.
 bool get enabledByDefault;/// Content items in this bundle.
 List<BundledContent> get items;/// Bundle version.
 String get version;
/// Create a copy of ContentBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBundleCopyWith<ContentBundle> get copyWith => _$ContentBundleCopyWithImpl<ContentBundle>(this as ContentBundle, _$identity);

  /// Serializes this ContentBundle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBundle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enabledByDefault, enabledByDefault) || other.enabledByDefault == enabledByDefault)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enabledByDefault,const DeepCollectionEquality().hash(items),version);

@override
String toString() {
  return 'ContentBundle(id: $id, name: $name, enabledByDefault: $enabledByDefault, items: $items, version: $version)';
}


}

/// @nodoc
abstract mixin class $ContentBundleCopyWith<$Res>  {
  factory $ContentBundleCopyWith(ContentBundle value, $Res Function(ContentBundle) _then) = _$ContentBundleCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool enabledByDefault, List<BundledContent> items, String version
});




}
/// @nodoc
class _$ContentBundleCopyWithImpl<$Res>
    implements $ContentBundleCopyWith<$Res> {
  _$ContentBundleCopyWithImpl(this._self, this._then);

  final ContentBundle _self;
  final $Res Function(ContentBundle) _then;

/// Create a copy of ContentBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? enabledByDefault = null,Object? items = null,Object? version = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enabledByDefault: null == enabledByDefault ? _self.enabledByDefault : enabledByDefault // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BundledContent>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentBundle].
extension ContentBundlePatterns on ContentBundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentBundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentBundle value)  $default,){
final _that = this;
switch (_that) {
case _ContentBundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentBundle value)?  $default,){
final _that = this;
switch (_that) {
case _ContentBundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool enabledByDefault,  List<BundledContent> items,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentBundle() when $default != null:
return $default(_that.id,_that.name,_that.enabledByDefault,_that.items,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool enabledByDefault,  List<BundledContent> items,  String version)  $default,) {final _that = this;
switch (_that) {
case _ContentBundle():
return $default(_that.id,_that.name,_that.enabledByDefault,_that.items,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool enabledByDefault,  List<BundledContent> items,  String version)?  $default,) {final _that = this;
switch (_that) {
case _ContentBundle() when $default != null:
return $default(_that.id,_that.name,_that.enabledByDefault,_that.items,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentBundle implements ContentBundle {
  const _ContentBundle({required this.id, required this.name, this.enabledByDefault = true, required final  List<BundledContent> items, this.version = '1.0.0'}): _items = items;
  factory _ContentBundle.fromJson(Map<String, dynamic> json) => _$ContentBundleFromJson(json);

/// Bundle identifier.
@override final  String id;
/// Bundle display name.
@override final  String name;
/// Whether this bundle is enabled by default.
@override@JsonKey() final  bool enabledByDefault;
/// Content items in this bundle.
 final  List<BundledContent> _items;
/// Content items in this bundle.
@override List<BundledContent> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Bundle version.
@override@JsonKey() final  String version;

/// Create a copy of ContentBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentBundleCopyWith<_ContentBundle> get copyWith => __$ContentBundleCopyWithImpl<_ContentBundle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBundleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentBundle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enabledByDefault, enabledByDefault) || other.enabledByDefault == enabledByDefault)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enabledByDefault,const DeepCollectionEquality().hash(_items),version);

@override
String toString() {
  return 'ContentBundle(id: $id, name: $name, enabledByDefault: $enabledByDefault, items: $items, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ContentBundleCopyWith<$Res> implements $ContentBundleCopyWith<$Res> {
  factory _$ContentBundleCopyWith(_ContentBundle value, $Res Function(_ContentBundle) _then) = __$ContentBundleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool enabledByDefault, List<BundledContent> items, String version
});




}
/// @nodoc
class __$ContentBundleCopyWithImpl<$Res>
    implements _$ContentBundleCopyWith<$Res> {
  __$ContentBundleCopyWithImpl(this._self, this._then);

  final _ContentBundle _self;
  final $Res Function(_ContentBundle) _then;

/// Create a copy of ContentBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? enabledByDefault = null,Object? items = null,Object? version = null,}) {
  return _then(_ContentBundle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enabledByDefault: null == enabledByDefault ? _self.enabledByDefault : enabledByDefault // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BundledContent>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
