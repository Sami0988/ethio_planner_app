// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarViewState {

 DateTime get currentMonth; DateTime? get selectedDate; List<CalendarEvent> get events; List<CalendarEvent> get selectedDayEvents; Set<String> get eventDates; bool get isLoading; String? get error;
/// Create a copy of CalendarViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarViewStateCopyWith<CalendarViewState> get copyWith => _$CalendarViewStateCopyWithImpl<CalendarViewState>(this as CalendarViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarViewState&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.selectedDayEvents, selectedDayEvents)&&const DeepCollectionEquality().equals(other.eventDates, eventDates)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentMonth,selectedDate,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(selectedDayEvents),const DeepCollectionEquality().hash(eventDates),isLoading,error);

@override
String toString() {
  return 'CalendarViewState(currentMonth: $currentMonth, selectedDate: $selectedDate, events: $events, selectedDayEvents: $selectedDayEvents, eventDates: $eventDates, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $CalendarViewStateCopyWith<$Res>  {
  factory $CalendarViewStateCopyWith(CalendarViewState value, $Res Function(CalendarViewState) _then) = _$CalendarViewStateCopyWithImpl;
@useResult
$Res call({
 DateTime currentMonth, DateTime? selectedDate, List<CalendarEvent> events, List<CalendarEvent> selectedDayEvents, Set<String> eventDates, bool isLoading, String? error
});




}
/// @nodoc
class _$CalendarViewStateCopyWithImpl<$Res>
    implements $CalendarViewStateCopyWith<$Res> {
  _$CalendarViewStateCopyWithImpl(this._self, this._then);

  final CalendarViewState _self;
  final $Res Function(CalendarViewState) _then;

/// Create a copy of CalendarViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentMonth = null,Object? selectedDate = freezed,Object? events = null,Object? selectedDayEvents = null,Object? eventDates = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<CalendarEvent>,selectedDayEvents: null == selectedDayEvents ? _self.selectedDayEvents : selectedDayEvents // ignore: cast_nullable_to_non_nullable
as List<CalendarEvent>,eventDates: null == eventDates ? _self.eventDates : eventDates // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarViewState].
extension CalendarViewStatePatterns on CalendarViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarViewState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarViewState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime currentMonth,  DateTime? selectedDate,  List<CalendarEvent> events,  List<CalendarEvent> selectedDayEvents,  Set<String> eventDates,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarViewState() when $default != null:
return $default(_that.currentMonth,_that.selectedDate,_that.events,_that.selectedDayEvents,_that.eventDates,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime currentMonth,  DateTime? selectedDate,  List<CalendarEvent> events,  List<CalendarEvent> selectedDayEvents,  Set<String> eventDates,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CalendarViewState():
return $default(_that.currentMonth,_that.selectedDate,_that.events,_that.selectedDayEvents,_that.eventDates,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime currentMonth,  DateTime? selectedDate,  List<CalendarEvent> events,  List<CalendarEvent> selectedDayEvents,  Set<String> eventDates,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CalendarViewState() when $default != null:
return $default(_that.currentMonth,_that.selectedDate,_that.events,_that.selectedDayEvents,_that.eventDates,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarViewState implements CalendarViewState {
  const _CalendarViewState({required this.currentMonth, required this.selectedDate, final  List<CalendarEvent> events = const [], final  List<CalendarEvent> selectedDayEvents = const [], final  Set<String> eventDates = const <String>{}, this.isLoading = false, this.error}): _events = events,_selectedDayEvents = selectedDayEvents,_eventDates = eventDates;
  

@override final  DateTime currentMonth;
@override final  DateTime? selectedDate;
 final  List<CalendarEvent> _events;
@override@JsonKey() List<CalendarEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<CalendarEvent> _selectedDayEvents;
@override@JsonKey() List<CalendarEvent> get selectedDayEvents {
  if (_selectedDayEvents is EqualUnmodifiableListView) return _selectedDayEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedDayEvents);
}

 final  Set<String> _eventDates;
@override@JsonKey() Set<String> get eventDates {
  if (_eventDates is EqualUnmodifiableSetView) return _eventDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_eventDates);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of CalendarViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarViewStateCopyWith<_CalendarViewState> get copyWith => __$CalendarViewStateCopyWithImpl<_CalendarViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarViewState&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._selectedDayEvents, _selectedDayEvents)&&const DeepCollectionEquality().equals(other._eventDates, _eventDates)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentMonth,selectedDate,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_selectedDayEvents),const DeepCollectionEquality().hash(_eventDates),isLoading,error);

@override
String toString() {
  return 'CalendarViewState(currentMonth: $currentMonth, selectedDate: $selectedDate, events: $events, selectedDayEvents: $selectedDayEvents, eventDates: $eventDates, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CalendarViewStateCopyWith<$Res> implements $CalendarViewStateCopyWith<$Res> {
  factory _$CalendarViewStateCopyWith(_CalendarViewState value, $Res Function(_CalendarViewState) _then) = __$CalendarViewStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime currentMonth, DateTime? selectedDate, List<CalendarEvent> events, List<CalendarEvent> selectedDayEvents, Set<String> eventDates, bool isLoading, String? error
});




}
/// @nodoc
class __$CalendarViewStateCopyWithImpl<$Res>
    implements _$CalendarViewStateCopyWith<$Res> {
  __$CalendarViewStateCopyWithImpl(this._self, this._then);

  final _CalendarViewState _self;
  final $Res Function(_CalendarViewState) _then;

/// Create a copy of CalendarViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentMonth = null,Object? selectedDate = freezed,Object? events = null,Object? selectedDayEvents = null,Object? eventDates = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_CalendarViewState(
currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<CalendarEvent>,selectedDayEvents: null == selectedDayEvents ? _self._selectedDayEvents : selectedDayEvents // ignore: cast_nullable_to_non_nullable
as List<CalendarEvent>,eventDates: null == eventDates ? _self._eventDates : eventDates // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
