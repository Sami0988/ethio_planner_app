// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Reminder {

 String get id; String get title; DateTime get ecDate; DateTime get gcDate; String? get description; bool get isCompleted; int? get notificationId; String? get category; String? get linkedEventId; String? get recurrenceRule;
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderCopyWith<Reminder> get copyWith => _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,notificationId,category,linkedEventId,recurrenceRule);

@override
String toString() {
  return 'Reminder(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, notificationId: $notificationId, category: $category, linkedEventId: $linkedEventId, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res>  {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) = _$ReminderCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, int? notificationId, String? category, String? linkedEventId, String? recurrenceRule
});




}
/// @nodoc
class _$ReminderCopyWithImpl<$Res>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

/// Create a copy of Reminder
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


/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reminder value)  $default,){
final _that = this;
switch (_that) {
case _Reminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reminder value)?  $default,){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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
case _Reminder() when $default != null:
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
case _Reminder():
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
case _Reminder() when $default != null:
return $default(_that.id,_that.title,_that.ecDate,_that.gcDate,_that.description,_that.isCompleted,_that.notificationId,_that.category,_that.linkedEventId,_that.recurrenceRule);case _:
  return null;

}
}

}

/// @nodoc


class _Reminder implements Reminder {
  const _Reminder({required this.id, required this.title, required this.ecDate, required this.gcDate, this.description, this.isCompleted = false, this.notificationId, this.category, this.linkedEventId, this.recurrenceRule});
  

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

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderCopyWith<_Reminder> get copyWith => __$ReminderCopyWithImpl<_Reminder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ecDate, ecDate) || other.ecDate == ecDate)&&(identical(other.gcDate, gcDate) || other.gcDate == gcDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ecDate,gcDate,description,isCompleted,notificationId,category,linkedEventId,recurrenceRule);

@override
String toString() {
  return 'Reminder(id: $id, title: $title, ecDate: $ecDate, gcDate: $gcDate, description: $description, isCompleted: $isCompleted, notificationId: $notificationId, category: $category, linkedEventId: $linkedEventId, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) = __$ReminderCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime ecDate, DateTime gcDate, String? description, bool isCompleted, int? notificationId, String? category, String? linkedEventId, String? recurrenceRule
});




}
/// @nodoc
class __$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? ecDate = null,Object? gcDate = null,Object? description = freezed,Object? isCompleted = null,Object? notificationId = freezed,Object? category = freezed,Object? linkedEventId = freezed,Object? recurrenceRule = freezed,}) {
  return _then(_Reminder(
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
