// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlannerViewState {

 DateTime get selectedDate; PlannerViewMode get viewMode; List<PlannerItem> get items; bool get isLoading; String? get error;
/// Create a copy of PlannerViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannerViewStateCopyWith<PlannerViewState> get copyWith => _$PlannerViewStateCopyWithImpl<PlannerViewState>(this as PlannerViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannerViewState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,viewMode,const DeepCollectionEquality().hash(items),isLoading,error);

@override
String toString() {
  return 'PlannerViewState(selectedDate: $selectedDate, viewMode: $viewMode, items: $items, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlannerViewStateCopyWith<$Res>  {
  factory $PlannerViewStateCopyWith(PlannerViewState value, $Res Function(PlannerViewState) _then) = _$PlannerViewStateCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, PlannerViewMode viewMode, List<PlannerItem> items, bool isLoading, String? error
});




}
/// @nodoc
class _$PlannerViewStateCopyWithImpl<$Res>
    implements $PlannerViewStateCopyWith<$Res> {
  _$PlannerViewStateCopyWithImpl(this._self, this._then);

  final PlannerViewState _self;
  final $Res Function(PlannerViewState) _then;

/// Create a copy of PlannerViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDate = null,Object? viewMode = null,Object? items = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as PlannerViewMode,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PlannerItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannerViewState].
extension PlannerViewStatePatterns on PlannerViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannerViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannerViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannerViewState value)  $default,){
final _that = this;
switch (_that) {
case _PlannerViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannerViewState value)?  $default,){
final _that = this;
switch (_that) {
case _PlannerViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selectedDate,  PlannerViewMode viewMode,  List<PlannerItem> items,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannerViewState() when $default != null:
return $default(_that.selectedDate,_that.viewMode,_that.items,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selectedDate,  PlannerViewMode viewMode,  List<PlannerItem> items,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PlannerViewState():
return $default(_that.selectedDate,_that.viewMode,_that.items,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selectedDate,  PlannerViewMode viewMode,  List<PlannerItem> items,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PlannerViewState() when $default != null:
return $default(_that.selectedDate,_that.viewMode,_that.items,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PlannerViewState implements PlannerViewState {
  const _PlannerViewState({required this.selectedDate, this.viewMode = PlannerViewMode.day, final  List<PlannerItem> items = const [], this.isLoading = false, this.error}): _items = items;
  

@override final  DateTime selectedDate;
@override@JsonKey() final  PlannerViewMode viewMode;
 final  List<PlannerItem> _items;
@override@JsonKey() List<PlannerItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PlannerViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannerViewStateCopyWith<_PlannerViewState> get copyWith => __$PlannerViewStateCopyWithImpl<_PlannerViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannerViewState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,viewMode,const DeepCollectionEquality().hash(_items),isLoading,error);

@override
String toString() {
  return 'PlannerViewState(selectedDate: $selectedDate, viewMode: $viewMode, items: $items, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlannerViewStateCopyWith<$Res> implements $PlannerViewStateCopyWith<$Res> {
  factory _$PlannerViewStateCopyWith(_PlannerViewState value, $Res Function(_PlannerViewState) _then) = __$PlannerViewStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime selectedDate, PlannerViewMode viewMode, List<PlannerItem> items, bool isLoading, String? error
});




}
/// @nodoc
class __$PlannerViewStateCopyWithImpl<$Res>
    implements _$PlannerViewStateCopyWith<$Res> {
  __$PlannerViewStateCopyWithImpl(this._self, this._then);

  final _PlannerViewState _self;
  final $Res Function(_PlannerViewState) _then;

/// Create a copy of PlannerViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? viewMode = null,Object? items = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PlannerViewState(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as PlannerViewMode,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PlannerItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
