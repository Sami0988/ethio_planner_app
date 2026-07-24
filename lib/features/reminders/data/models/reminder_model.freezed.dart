// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderModel {

 String get id; String get title; DateTime get ecDate; DateTime get gcDate; String? get description; bool get isCompleted; int? get notificationId; String? get category; String? get linkedEventId; String? get recurrenceRule;
/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderModelCopyWith<ReminderModel> get copyWith => _$ReminderModelCopyWithImpl<ReminderModel>(this as ReminderModel, _$identity);

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,notificationId,category,linkedEventId,recurrenceRule);

@override
String toString() {
  return 'ReminderModel(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, notificationId: $notificationId, category: $category, linkedEventId: $linkedEventId, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class $ReminderModelCopyWith<$Res>  {
  factory $ReminderModelCopyWith(ReminderModel value, $Res Function(ReminderModel) _then) = _$ReminderModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, int? notificationId, String? category, String? linkedEventId, String? recurrenceRule
});




}
/// @nodoc
class _$ReminderModelCopyWithImpl<$Res>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._self, this._then);

  final ReminderModel _self;
  final $Res Function(ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? ecDate = null,Object? gcDate = null,Object? description = freezed,Object? isCompleted = null,Object? notificationId = freezed,Object? category = freezed,Object? linkedEventId = freezed,Object? recurrenceRule = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ecDate: null == ecDate ? _self.ecDate : ecDate // ignore: cast_nullable_to_non_nullable
as DateTime,gcDate: null == gcDate ? _self.gcDate : gcDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,notificationId: freezed == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderModel].
extension ReminderModelPatterns on ReminderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  int? notificationId,  String? category,  String? linkedEventId,  String? recurrenceRule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.notificationId,_that.category,_that.linkedEventId,_that.recurrenceRule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  int? notificationId,  String? category,  String? linkedEventId,  String? recurrenceRule)  $default,) {final _that = this;
switch (_that) {
case _ReminderModel():
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.notificationId,_that.category,_that.linkedEventId,_that.recurrenceRule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime ecDate,  DateTime gcDate,  String? description,  bool isCompleted,  int? notificationId,  String? category,  String? linkedEventId,  String? recurrenceRule)?  $default,) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.notificationId,_that.category,_that.linkedEventId,_that.recurrenceRule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderModel implements ReminderModel {
  const _ReminderModel({required this.id, required this.title, required this.ecDate, required this.gcDate, this.description, this.isCompleted = false, this.notificationId, this.category, this.linkedEventId, this.recurrenceRule});
  factory _ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime ecDate;
@override final  DateTime gcDate;
@override final  String? description;
@override@JsonKey() final  bool isCompleted;
@override final  int? notificationId;
@override final  String? category;
@override final  String? linkedEventId;
@override final  String? recurrenceRule;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderModelCopyWith<_ReminderModel> get copyWith => __$ReminderModelCopyWithImpl<_ReminderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,notificationId,category,linkedEventId,recurrenceRule);

@override
String toString() {
  return 'ReminderModel(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, notificationId: $notificationId, category: $category, linkedEventId: $linkedEventId, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class _$ReminderModelCopyWith<$Res> implements $ReminderModelCopyWith<$Res> {
  factory _$ReminderModelCopyWith(_ReminderModel value, $Res Function(_ReminderModel) _then) = __$ReminderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, int? notificationId, String? category, String? linkedEventId, String? recurrenceRule
});




}
/// @nodoc
class __$ReminderModelCopyWithImpl<$Res>
    implements _$ReminderModelCopyWith<$Res> {
  __$ReminderModelCopyWithImpl(this._self, this._then);

  final _ReminderModel _self;
  final $Res Function(_ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? ecDate = null,Object? gcDate = null,Object? description = freezed,Object? isCompleted = null,Object? notificationId = freezed,Object? category = freezed,Object? linkedEventId = freezed,Object? recurrenceRule = freezed,}) {
  return _then(_ReminderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ecDate: null == ecDate ? _self.ecDate : ecDate // ignore: cast_nullable_to_non_nullable
as DateTime,gcDate: null == gcDate ? _self.gcDate : gcDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,notificationId: freezed == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
