// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemindersViewState {

 ReminderFilter get filter; List<Reminder> get allReminders; List<Reminder> get filteredReminders; bool get isLoading; String? get error;
/// Create a copy of RemindersViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemindersViewStateCopyWith<RemindersViewState> get copyWith => _$RemindersViewStateCopyWithImpl<RemindersViewState>(this as RemindersViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemindersViewState&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.allReminders, allReminders)&&const DeepCollectionEquality().equals(other.filteredReminders, filteredReminders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,filter,const DeepCollectionEquality().hash(allReminders),const DeepCollectionEquality().hash(filteredReminders),isLoading,error);

@override
String toString() {
  return 'RemindersViewState(filter: $filter, allReminders: $allReminders, filteredReminders: $filteredReminders, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $RemindersViewStateCopyWith<$Res>  {
  factory $RemindersViewStateCopyWith(RemindersViewState value, $Res Function(RemindersViewState) _then) = _$RemindersViewStateCopyWithImpl;
@useResult
$Res call({
 ReminderFilter filter, List<Reminder> allReminders, List<Reminder> filteredReminders, bool isLoading, String? error
});




}
/// @nodoc
class _$RemindersViewStateCopyWithImpl<$Res>
    implements $RemindersViewStateCopyWith<$Res> {
  _$RemindersViewStateCopyWithImpl(this._self, this._then);

  final RemindersViewState _self;
  final $Res Function(RemindersViewState) _then;

/// Create a copy of RemindersViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? allReminders = null,Object? filteredReminders = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ReminderFilter,allReminders: null == allReminders ? _self.allReminders : allReminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,filteredReminders: null == filteredReminders ? _self.filteredReminders : filteredReminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RemindersViewState].
extension RemindersViewStatePatterns on RemindersViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemindersViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemindersViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemindersViewState value)  $default,){
final _that = this;
switch (_that) {
case _RemindersViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemindersViewState value)?  $default,){
final _that = this;
switch (_that) {
case _RemindersViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReminderFilter filter,  List<Reminder> allReminders,  List<Reminder> filteredReminders,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemindersViewState() when $default != null:
return $default(_that.filter,_that.allReminders,_that.filteredReminders,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReminderFilter filter,  List<Reminder> allReminders,  List<Reminder> filteredReminders,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _RemindersViewState():
return $default(_that.filter,_that.allReminders,_that.filteredReminders,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReminderFilter filter,  List<Reminder> allReminders,  List<Reminder> filteredReminders,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _RemindersViewState() when $default != null:
return $default(_that.filter,_that.allReminders,_that.filteredReminders,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RemindersViewState implements RemindersViewState {
  const _RemindersViewState({this.filter = ReminderFilter.all, final  List<Reminder> allReminders = const [], final  List<Reminder> filteredReminders = const [], this.isLoading = false, this.error}): _allReminders = allReminders,_filteredReminders = filteredReminders;
  

@override@JsonKey() final  ReminderFilter filter;
 final  List<Reminder> _allReminders;
@override@JsonKey() List<Reminder> get allReminders {
  if (_allReminders is EqualUnmodifiableListView) return _allReminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allReminders);
}

 final  List<Reminder> _filteredReminders;
@override@JsonKey() List<Reminder> get filteredReminders {
  if (_filteredReminders is EqualUnmodifiableListView) return _filteredReminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredReminders);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of RemindersViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemindersViewStateCopyWith<_RemindersViewState> get copyWith => __$RemindersViewStateCopyWithImpl<_RemindersViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemindersViewState&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other._allReminders, _allReminders)&&const DeepCollectionEquality().equals(other._filteredReminders, _filteredReminders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,filter,const DeepCollectionEquality().hash(_allReminders),const DeepCollectionEquality().hash(_filteredReminders),isLoading,error);

@override
String toString() {
  return 'RemindersViewState(filter: $filter, allReminders: $allReminders, filteredReminders: $filteredReminders, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RemindersViewStateCopyWith<$Res> implements $RemindersViewStateCopyWith<$Res> {
  factory _$RemindersViewStateCopyWith(_RemindersViewState value, $Res Function(_RemindersViewState) _then) = __$RemindersViewStateCopyWithImpl;
@override @useResult
$Res call({
 ReminderFilter filter, List<Reminder> allReminders, List<Reminder> filteredReminders, bool isLoading, String? error
});




}
/// @nodoc
class __$RemindersViewStateCopyWithImpl<$Res>
    implements _$RemindersViewStateCopyWith<$Res> {
  __$RemindersViewStateCopyWithImpl(this._self, this._then);

  final _RemindersViewState _self;
  final $Res Function(_RemindersViewState) _then;

/// Create a copy of RemindersViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? allReminders = null,Object? filteredReminders = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_RemindersViewState(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ReminderFilter,allReminders: null == allReminders ? _self._allReminders : allReminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,filteredReminders: null == filteredReminders ? _self._filteredReminders : filteredReminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
