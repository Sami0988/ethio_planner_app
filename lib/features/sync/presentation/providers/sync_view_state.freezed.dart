// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncViewState {

 SyncStatus get status; int get itemsSynced; int get itemsPending; String? get error; GuestImportResult? get lastImportResult;
/// Create a copy of SyncViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncViewStateCopyWith<SyncViewState> get copyWith => _$SyncViewStateCopyWithImpl<SyncViewState>(this as SyncViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncViewState&&(identical(other.status, status) || other.status == status)&&(identical(other.itemsSynced, itemsSynced) || other.itemsSynced == itemsSynced)&&(identical(other.itemsPending, itemsPending) || other.itemsPending == itemsPending)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastImportResult, lastImportResult) || other.lastImportResult == lastImportResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,itemsSynced,itemsPending,error,lastImportResult);

@override
String toString() {
  return 'SyncViewState(status: $status, itemsSynced: $itemsSynced, itemsPending: $itemsPending, error: $error, lastImportResult: $lastImportResult)';
}


}

/// @nodoc
abstract mixin class $SyncViewStateCopyWith<$Res>  {
  factory $SyncViewStateCopyWith(SyncViewState value, $Res Function(SyncViewState) _then) = _$SyncViewStateCopyWithImpl;
@useResult
$Res call({
 SyncStatus status, int itemsSynced, int itemsPending, String? error, GuestImportResult? lastImportResult
});




}
/// @nodoc
class _$SyncViewStateCopyWithImpl<$Res>
    implements $SyncViewStateCopyWith<$Res> {
  _$SyncViewStateCopyWithImpl(this._self, this._then);

  final SyncViewState _self;
  final $Res Function(SyncViewState) _then;

/// Create a copy of SyncViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? itemsSynced = null,Object? itemsPending = null,Object? error = freezed,Object? lastImportResult = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,itemsSynced: null == itemsSynced ? _self.itemsSynced : itemsSynced // ignore: cast_nullable_to_non_nullable
as int,itemsPending: null == itemsPending ? _self.itemsPending : itemsPending // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastImportResult: freezed == lastImportResult ? _self.lastImportResult : lastImportResult // ignore: cast_nullable_to_non_nullable
as GuestImportResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncViewState].
extension SyncViewStatePatterns on SyncViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncViewState value)  $default,){
final _that = this;
switch (_that) {
case _SyncViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncViewState value)?  $default,){
final _that = this;
switch (_that) {
case _SyncViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SyncStatus status,  int itemsSynced,  int itemsPending,  String? error,  GuestImportResult? lastImportResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncViewState() when $default != null:
return $default(_that.status,_that.itemsSynced,_that.itemsPending,_that.error,_that.lastImportResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SyncStatus status,  int itemsSynced,  int itemsPending,  String? error,  GuestImportResult? lastImportResult)  $default,) {final _that = this;
switch (_that) {
case _SyncViewState():
return $default(_that.status,_that.itemsSynced,_that.itemsPending,_that.error,_that.lastImportResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SyncStatus status,  int itemsSynced,  int itemsPending,  String? error,  GuestImportResult? lastImportResult)?  $default,) {final _that = this;
switch (_that) {
case _SyncViewState() when $default != null:
return $default(_that.status,_that.itemsSynced,_that.itemsPending,_that.error,_that.lastImportResult);case _:
  return null;

}
}

}

/// @nodoc


class _SyncViewState implements SyncViewState {
  const _SyncViewState({this.status = SyncStatus.idle, this.itemsSynced = 0, this.itemsPending = 0, this.error, this.lastImportResult});
  

@override@JsonKey() final  SyncStatus status;
@override@JsonKey() final  int itemsSynced;
@override@JsonKey() final  int itemsPending;
@override final  String? error;
@override final  GuestImportResult? lastImportResult;

/// Create a copy of SyncViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncViewStateCopyWith<_SyncViewState> get copyWith => __$SyncViewStateCopyWithImpl<_SyncViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncViewState&&(identical(other.status, status) || other.status == status)&&(identical(other.itemsSynced, itemsSynced) || other.itemsSynced == itemsSynced)&&(identical(other.itemsPending, itemsPending) || other.itemsPending == itemsPending)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastImportResult, lastImportResult) || other.lastImportResult == lastImportResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,itemsSynced,itemsPending,error,lastImportResult);

@override
String toString() {
  return 'SyncViewState(status: $status, itemsSynced: $itemsSynced, itemsPending: $itemsPending, error: $error, lastImportResult: $lastImportResult)';
}


}

/// @nodoc
abstract mixin class _$SyncViewStateCopyWith<$Res> implements $SyncViewStateCopyWith<$Res> {
  factory _$SyncViewStateCopyWith(_SyncViewState value, $Res Function(_SyncViewState) _then) = __$SyncViewStateCopyWithImpl;
@override @useResult
$Res call({
 SyncStatus status, int itemsSynced, int itemsPending, String? error, GuestImportResult? lastImportResult
});




}
/// @nodoc
class __$SyncViewStateCopyWithImpl<$Res>
    implements _$SyncViewStateCopyWith<$Res> {
  __$SyncViewStateCopyWithImpl(this._self, this._then);

  final _SyncViewState _self;
  final $Res Function(_SyncViewState) _then;

/// Create a copy of SyncViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? itemsSynced = null,Object? itemsPending = null,Object? error = freezed,Object? lastImportResult = freezed,}) {
  return _then(_SyncViewState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,itemsSynced: null == itemsSynced ? _self.itemsSynced : itemsSynced // ignore: cast_nullable_to_non_nullable
as int,itemsPending: null == itemsPending ? _self.itemsPending : itemsPending // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastImportResult: freezed == lastImportResult ? _self.lastImportResult : lastImportResult // ignore: cast_nullable_to_non_nullable
as GuestImportResult?,
  ));
}


}

// dart format on
