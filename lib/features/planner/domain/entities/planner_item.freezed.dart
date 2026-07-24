// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlannerItem {

 String get id; String get title; DateTime get ecDate; DateTime get gcDate; String? get description; bool get isCompleted; PlannerSection get section; int get sortOrder; String? get linkedEventId; String? get linkedReminderId;
/// Create a copy of PlannerItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannerItemCopyWith<PlannerItem> get copyWith => _$PlannerItemCopyWithImpl<PlannerItem>(this as PlannerItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannerItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.section, section) || other.section == section)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.linkedReminderId, linkedReminderId) || other.linkedReminderId == linkedReminderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,section,sortOrder,linkedEventId,linkedReminderId);

@override
String toString() {
  return 'PlannerItem(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, section: $section, sortOrder: $sortOrder, linkedEventId: $linkedEventId, linkedReminderId: $linkedReminderId)';
}


}

/// @nodoc
abstract mixin class $PlannerItemCopyWith<$Res>  {
  factory $PlannerItemCopyWith(PlannerItem value, $Res Function(PlannerItem) _then) = _$PlannerItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, PlannerSection section, int sortOrder, String? linkedEventId, String? linkedReminderId
});




}
/// @nodoc
class _$PlannerItemCopyWithImpl<$Res>
    implements $PlannerItemCopyWith<$Res> {
  _$PlannerItemCopyWithImpl(this._self, this._then);

  final PlannerItem _self;
  final $Res Function(PlannerItem) _then;

/// Create a copy of PlannerItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? ecDate = null,Object? gcDate = null,Object? description = freezed,Object? isCompleted = null,Object? section = null,Object? sortOrder = null,Object? linkedEventId = freezed,Object? linkedReminderId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ecDate: null == ecDate ? _self.ecDate : ecDate // ignore: cast_nullable_to_non_nullable
as DateTime,gcDate: null == gcDate ? _self.gcDate : gcDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as PlannerSection,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,linkedReminderId: freezed == linkedReminderId ? _self.linkedReminderId : linkedReminderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannerItem].
extension PlannerItemPatterns on PlannerItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannerItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannerItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannerItem value)  $default,){
final _that = this;
switch (_that) {
case _PlannerItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannerItem value)?  $default,){
final _that = this;
switch (_that) {
case _PlannerItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  PlannerSection section,  int sortOrder,  String? linkedEventId,  String? linkedReminderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannerItem() when $default != null:
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.section,_that.sortOrder,_that.linkedEventId,_that.linkedReminderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  PlannerSection section,  int sortOrder,  String? linkedEventId,  String? linkedReminderId)  $default,) {final _that = this;
switch (_that) {
case _PlannerItem():
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.section,_that.sortOrder,_that.linkedEventId,_that.linkedReminderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  PlannerSection section,  int sortOrder,  String? linkedEventId,  String? linkedReminderId)?  $default,) {final _that = this;
switch (_that) {
case _PlannerItem() when $default != null:
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.section,_that.sortOrder,_that.linkedEventId,_that.linkedReminderId);case _:
  return null;

}
}

}

/// @nodoc


class _PlannerItem implements PlannerItem {
  const _PlannerItem({required this.id, required this.title, required this.ecDate, required this.gcDate, this.description, this.isCompleted = false, this.section = PlannerSection.focus, this.sortOrder = 0, this.linkedEventId, this.linkedReminderId});
  

@override final  String id;
@override final  String title;
@override final  DateTime ecDate;
@override final  DateTime gcDate;
@override final  String? description;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  PlannerSection section;
@override@JsonKey() final  int sortOrder;
@override final  String? linkedEventId;
@override final  String? linkedReminderId;

/// Create a copy of PlannerItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannerItemCopyWith<_PlannerItem> get copyWith => __$PlannerItemCopyWithImpl<_PlannerItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannerItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.section, section) || other.section == section)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.linkedReminderId, linkedReminderId) || other.linkedReminderId == linkedReminderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,section,sortOrder,linkedEventId,linkedReminderId);

@override
String toString() {
  return 'PlannerItem(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, section: $section, sortOrder: $sortOrder, linkedEventId: $linkedEventId, linkedReminderId: $linkedReminderId)';
}


}

/// @nodoc
abstract mixin class _$PlannerItemCopyWith<$Res> implements $PlannerItemCopyWith<$Res> {
  factory _$PlannerItemCopyWith(_PlannerItem value, $Res Function(_PlannerItem) _then) = __$PlannerItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, PlannerSection section, int sortOrder, String? linkedEventId, String? linkedReminderId
});




}
/// @nodoc
class __$PlannerItemCopyWithImpl<$Res>
    implements _$PlannerItemCopyWith<$Res> {
  __$PlannerItemCopyWithImpl(this._self, this._then);

  final _PlannerItem _self;
  final $Res Function(_PlannerItem) _then;

/// Create a copy of PlannerItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? ecDate = null,Object? gcDate = null,Object? description = freezed,Object? isCompleted = null,Object? section = null,Object? sortOrder = null,Object? linkedEventId = freezed,Object? linkedReminderId = freezed,}) {
  return _then(_PlannerItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ecDate: null == ecDate ? _self.ecDate : ecDate // ignore: cast_nullable_to_non_nullable
as DateTime,gcDate: null == gcDate ? _self.gcDate : gcDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as PlannerSection,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,linkedReminderId: freezed == linkedReminderId ? _self.linkedReminderId : linkedReminderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
