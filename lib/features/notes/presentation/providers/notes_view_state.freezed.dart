// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotesViewState {

 NotesFilter get filter; List<Note> get allNotes; List<Note> get filteredNotes; bool get isLoading; String? get error;
/// Create a copy of NotesViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotesViewStateCopyWith<NotesViewState> get copyWith => _$NotesViewStateCopyWithImpl<NotesViewState>(this as NotesViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotesViewState&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.allNotes, allNotes)&&const DeepCollectionEquality().equals(other.filteredNotes, filteredNotes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,filter,const DeepCollectionEquality().hash(allNotes),const DeepCollectionEquality().hash(filteredNotes),isLoading,error);

@override
String toString() {
  return 'NotesViewState(filter: $filter, allNotes: $allNotes, filteredNotes: $filteredNotes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $NotesViewStateCopyWith<$Res>  {
  factory $NotesViewStateCopyWith(NotesViewState value, $Res Function(NotesViewState) _then) = _$NotesViewStateCopyWithImpl;
@useResult
$Res call({
 NotesFilter filter, List<Note> allNotes, List<Note> filteredNotes, bool isLoading, String? error
});




}
/// @nodoc
class _$NotesViewStateCopyWithImpl<$Res>
    implements $NotesViewStateCopyWith<$Res> {
  _$NotesViewStateCopyWithImpl(this._self, this._then);

  final NotesViewState _self;
  final $Res Function(NotesViewState) _then;

/// Create a copy of NotesViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? allNotes = null,Object? filteredNotes = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as NotesFilter,allNotes: null == allNotes ? _self.allNotes : allNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,filteredNotes: null == filteredNotes ? _self.filteredNotes : filteredNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotesViewState].
extension NotesViewStatePatterns on NotesViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotesViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotesViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotesViewState value)  $default,){
final _that = this;
switch (_that) {
case _NotesViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotesViewState value)?  $default,){
final _that = this;
switch (_that) {
case _NotesViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotesFilter filter,  List<Note> allNotes,  List<Note> filteredNotes,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotesViewState() when $default != null:
return $default(_that.filter,_that.allNotes,_that.filteredNotes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotesFilter filter,  List<Note> allNotes,  List<Note> filteredNotes,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _NotesViewState():
return $default(_that.filter,_that.allNotes,_that.filteredNotes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotesFilter filter,  List<Note> allNotes,  List<Note> filteredNotes,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _NotesViewState() when $default != null:
return $default(_that.filter,_that.allNotes,_that.filteredNotes,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NotesViewState implements NotesViewState {
  const _NotesViewState({this.filter = NotesFilter.all, final  List<Note> allNotes = const [], final  List<Note> filteredNotes = const [], this.isLoading = false, this.error}): _allNotes = allNotes,_filteredNotes = filteredNotes;
  

@override@JsonKey() final  NotesFilter filter;
 final  List<Note> _allNotes;
@override@JsonKey() List<Note> get allNotes {
  if (_allNotes is EqualUnmodifiableListView) return _allNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allNotes);
}

 final  List<Note> _filteredNotes;
@override@JsonKey() List<Note> get filteredNotes {
  if (_filteredNotes is EqualUnmodifiableListView) return _filteredNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredNotes);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of NotesViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotesViewStateCopyWith<_NotesViewState> get copyWith => __$NotesViewStateCopyWithImpl<_NotesViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotesViewState&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other._allNotes, _allNotes)&&const DeepCollectionEquality().equals(other._filteredNotes, _filteredNotes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,filter,const DeepCollectionEquality().hash(_allNotes),const DeepCollectionEquality().hash(_filteredNotes),isLoading,error);

@override
String toString() {
  return 'NotesViewState(filter: $filter, allNotes: $allNotes, filteredNotes: $filteredNotes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$NotesViewStateCopyWith<$Res> implements $NotesViewStateCopyWith<$Res> {
  factory _$NotesViewStateCopyWith(_NotesViewState value, $Res Function(_NotesViewState) _then) = __$NotesViewStateCopyWithImpl;
@override @useResult
$Res call({
 NotesFilter filter, List<Note> allNotes, List<Note> filteredNotes, bool isLoading, String? error
});




}
/// @nodoc
class __$NotesViewStateCopyWithImpl<$Res>
    implements _$NotesViewStateCopyWith<$Res> {
  __$NotesViewStateCopyWithImpl(this._self, this._then);

  final _NotesViewState _self;
  final $Res Function(_NotesViewState) _then;

/// Create a copy of NotesViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? allNotes = null,Object? filteredNotes = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_NotesViewState(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as NotesFilter,allNotes: null == allNotes ? _self._allNotes : allNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,filteredNotes: null == filteredNotes ? _self._filteredNotes : filteredNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
