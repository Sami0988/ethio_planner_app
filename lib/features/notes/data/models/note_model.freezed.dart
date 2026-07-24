// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoteModel {

 String get id; String get title; String? get content; DateTime get createdAt; DateTime get updatedAt; bool get isPinned; bool get isArchived; String? get category; String? get linkedEventId; String? get linkedReminderId; String? get linkedPlannerItemId;
/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteModelCopyWith<NoteModel> get copyWith => _$NoteModelCopyWithImpl<NoteModel>(this as NoteModel, _$identity);

  /// Serializes this NoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.linkedReminderId, linkedReminderId) || other.linkedReminderId == linkedReminderId)&&(identical(other.linkedPlannerItemId, linkedPlannerItemId) || other.linkedPlannerItemId == linkedPlannerItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,createdAt,updatedAt,isPinned,isArchived,category,linkedEventId,linkedReminderId,linkedPlannerItemId);

@override
String toString() {
  return 'NoteModel(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, isPinned: $isPinned, isArchived: $isArchived, category: $category, linkedEventId: $linkedEventId, linkedReminderId: $linkedReminderId, linkedPlannerItemId: $linkedPlannerItemId)';
}


}

/// @nodoc
abstract mixin class $NoteModelCopyWith<$Res>  {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) _then) = _$NoteModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? content, DateTime createdAt, DateTime updatedAt, bool isPinned, bool isArchived, String? category, String? linkedEventId, String? linkedReminderId, String? linkedPlannerItemId
});




}
/// @nodoc
class _$NoteModelCopyWithImpl<$Res>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._self, this._then);

  final NoteModel _self;
  final $Res Function(NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isPinned = null,Object? isArchived = null,Object? category = freezed,Object? linkedEventId = freezed,Object? linkedReminderId = freezed,Object? linkedPlannerItemId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,linkedReminderId: freezed == linkedReminderId ? _self.linkedReminderId : linkedReminderId // ignore: cast_nullable_to_non_nullable
as String?,linkedPlannerItemId: freezed == linkedPlannerItemId ? _self.linkedPlannerItemId : linkedPlannerItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteModel].
extension NoteModelPatterns on NoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteModel value)  $default,){
final _that = this;
switch (_that) {
case _NoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? content,  DateTime createdAt,  DateTime updatedAt,  bool isPinned,  bool isArchived,  String? category,  String? linkedEventId,  String? linkedReminderId,  String? linkedPlannerItemId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.isPinned,_that.isArchived,_that.category,_that.linkedEventId,_that.linkedReminderId,_that.linkedPlannerItemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? content,  DateTime createdAt,  DateTime updatedAt,  bool isPinned,  bool isArchived,  String? category,  String? linkedEventId,  String? linkedReminderId,  String? linkedPlannerItemId)  $default,) {final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.isPinned,_that.isArchived,_that.category,_that.linkedEventId,_that.linkedReminderId,_that.linkedPlannerItemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? content,  DateTime createdAt,  DateTime updatedAt,  bool isPinned,  bool isArchived,  String? category,  String? linkedEventId,  String? linkedReminderId,  String? linkedPlannerItemId)?  $default,) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.isPinned,_that.isArchived,_that.category,_that.linkedEventId,_that.linkedReminderId,_that.linkedPlannerItemId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoteModel implements NoteModel {
  const _NoteModel({required this.id, required this.title, this.content, required this.createdAt, required this.updatedAt, this.isPinned = false, this.isArchived = false, this.category, this.linkedEventId, this.linkedReminderId, this.linkedPlannerItemId});
  factory _NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? content;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isPinned;
@override@JsonKey() final  bool isArchived;
@override final  String? category;
@override final  String? linkedEventId;
@override final  String? linkedReminderId;
@override final  String? linkedPlannerItemId;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteModelCopyWith<_NoteModel> get copyWith => __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.category, category) || other.category == category)&&(identical(other.linkedEventId, linkedEventId) || other.linkedEventId == linkedEventId)&&(identical(other.linkedReminderId, linkedReminderId) || other.linkedReminderId == linkedReminderId)&&(identical(other.linkedPlannerItemId, linkedPlannerItemId) || other.linkedPlannerItemId == linkedPlannerItemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,createdAt,updatedAt,isPinned,isArchived,category,linkedEventId,linkedReminderId,linkedPlannerItemId);

@override
String toString() {
  return 'NoteModel(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, isPinned: $isPinned, isArchived: $isArchived, category: $category, linkedEventId: $linkedEventId, linkedReminderId: $linkedReminderId, linkedPlannerItemId: $linkedPlannerItemId)';
}


}

/// @nodoc
abstract mixin class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(_NoteModel value, $Res Function(_NoteModel) _then) = __$NoteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? content, DateTime createdAt, DateTime updatedAt, bool isPinned, bool isArchived, String? category, String? linkedEventId, String? linkedReminderId, String? linkedPlannerItemId
});




}
/// @nodoc
class __$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(this._self, this._then);

  final _NoteModel _self;
  final $Res Function(_NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isPinned = null,Object? isArchived = null,Object? category = freezed,Object? linkedEventId = freezed,Object? linkedReminderId = freezed,Object? linkedPlannerItemId = freezed,}) {
  return _then(_NoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,linkedEventId: freezed == linkedEventId ? _self.linkedEventId : linkedEventId // ignore: cast_nullable_to_non_nullable
as String?,linkedReminderId: freezed == linkedReminderId ? _self.linkedReminderId : linkedReminderId // ignore: cast_nullable_to_non_nullable
as String?,linkedPlannerItemId: freezed == linkedPlannerItemId ? _self.linkedPlannerItemId : linkedPlannerItemId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
