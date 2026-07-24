// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conflict_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConflictViewState {

 List<SyncConflictItem> get conflicts; bool get isLoading; String? get error;
/// Create a copy of ConflictViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictViewStateCopyWith<ConflictViewState> get copyWith => _$ConflictViewStateCopyWithImpl<ConflictViewState>(this as ConflictViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictViewState&&const DeepCollectionEquality().equals(other.conflicts, conflicts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conflicts),isLoading,error);

@override
String toString() {
  return 'ConflictViewState(conflicts: $conflicts, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ConflictViewStateCopyWith<$Res>  {
  factory $ConflictViewStateCopyWith(ConflictViewState value, $Res Function(ConflictViewState) _then) = _$ConflictViewStateCopyWithImpl;
@useResult
$Res call({
 List<SyncConflictItem> conflicts, bool isLoading, String? error
});




}
/// @nodoc
class _$ConflictViewStateCopyWithImpl<$Res>
    implements $ConflictViewStateCopyWith<$Res> {
  _$ConflictViewStateCopyWithImpl(this._self, this._then);

  final ConflictViewState _self;
  final $Res Function(ConflictViewState) _then;

/// Create a copy of ConflictViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conflicts = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
conflicts: null == conflicts ? _self.conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<SyncConflictItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConflictViewState].
extension ConflictViewStatePatterns on ConflictViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConflictViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConflictViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConflictViewState value)  $default,){
final _that = this;
switch (_that) {
case _ConflictViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConflictViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ConflictViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SyncConflictItem> conflicts,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConflictViewState() when $default != null:
return $default(_that.conflicts,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SyncConflictItem> conflicts,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ConflictViewState():
return $default(_that.conflicts,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SyncConflictItem> conflicts,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ConflictViewState() when $default != null:
return $default(_that.conflicts,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ConflictViewState implements ConflictViewState {
  const _ConflictViewState({final  List<SyncConflictItem> conflicts = const [], this.isLoading = false, this.error}): _conflicts = conflicts;
  

 final  List<SyncConflictItem> _conflicts;
@override@JsonKey() List<SyncConflictItem> get conflicts {
  if (_conflicts is EqualUnmodifiableListView) return _conflicts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conflicts);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ConflictViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConflictViewStateCopyWith<_ConflictViewState> get copyWith => __$ConflictViewStateCopyWithImpl<_ConflictViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConflictViewState&&const DeepCollectionEquality().equals(other._conflicts, _conflicts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conflicts),isLoading,error);

@override
String toString() {
  return 'ConflictViewState(conflicts: $conflicts, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ConflictViewStateCopyWith<$Res> implements $ConflictViewStateCopyWith<$Res> {
  factory _$ConflictViewStateCopyWith(_ConflictViewState value, $Res Function(_ConflictViewState) _then) = __$ConflictViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<SyncConflictItem> conflicts, bool isLoading, String? error
});




}
/// @nodoc
class __$ConflictViewStateCopyWithImpl<$Res>
    implements _$ConflictViewStateCopyWith<$Res> {
  __$ConflictViewStateCopyWithImpl(this._self, this._then);

  final _ConflictViewState _self;
  final $Res Function(_ConflictViewState) _then;

/// Create a copy of ConflictViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conflicts = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ConflictViewState(
conflicts: null == conflicts ? _self._conflicts : conflicts // ignore: cast_nullable_to_non_nullable
as List<SyncConflictItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
