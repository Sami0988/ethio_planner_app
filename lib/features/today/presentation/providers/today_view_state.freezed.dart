// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayViewState {

 EthiopianDate get ethiopianDate; GregorianDate get gregorianDate; HolidayPresentation? get holiday; UpNextPresentation? get upNext; List<EventPresentation> get events; List<ReminderPresentation> get reminders; List<SchedulePresentation> get schedule; SyncPresentation get sync;
/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayViewStateCopyWith<TodayViewState> get copyWith => _$TodayViewStateCopyWithImpl<TodayViewState>(this as TodayViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayViewState&&(identical(other.ethiopianDate, ethiopianDate) || other.ethiopianDate == ethiopianDate)&&(identical(other.gregorianDate, gregorianDate) || other.gregorianDate == gregorianDate)&&(identical(other.holiday, holiday) || other.holiday == holiday)&&(identical(other.upNext, upNext) || other.upNext == upNext)&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.reminders, reminders)&&const DeepCollectionEquality().equals(other.schedule, schedule)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode => Object.hash(runtimeType,ethiopianDate,gregorianDate,holiday,upNext,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(reminders),const DeepCollectionEquality().hash(schedule),sync);

@override
String toString() {
  return 'TodayViewState(ethiopianDate: $ethiopianDate, gregorianDate: $gregorianDate, holiday: $holiday, upNext: $upNext, events: $events, reminders: $reminders, schedule: $schedule, sync: $sync)';
}


}

/// @nodoc
abstract mixin class $TodayViewStateCopyWith<$Res>  {
  factory $TodayViewStateCopyWith(TodayViewState value, $Res Function(TodayViewState) _then) = _$TodayViewStateCopyWithImpl;
@useResult
$Res call({
 EthiopianDate ethiopianDate, GregorianDate gregorianDate, HolidayPresentation? holiday, UpNextPresentation? upNext, List<EventPresentation> events, List<ReminderPresentation> reminders, List<SchedulePresentation> schedule, SyncPresentation sync
});


$HolidayPresentationCopyWith<$Res>? get holiday;$UpNextPresentationCopyWith<$Res>? get upNext;$SyncPresentationCopyWith<$Res> get sync;

}
/// @nodoc
class _$TodayViewStateCopyWithImpl<$Res>
    implements $TodayViewStateCopyWith<$Res> {
  _$TodayViewStateCopyWithImpl(this._self, this._then);

  final TodayViewState _self;
  final $Res Function(TodayViewState) _then;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ethiopianDate = null,Object? gregorianDate = null,Object? holiday = freezed,Object? upNext = freezed,Object? events = null,Object? reminders = null,Object? schedule = null,Object? sync = null,}) {
  return _then(_self.copyWith(
ethiopianDate: null == ethiopianDate ? _self.ethiopianDate : ethiopianDate // ignore: cast_nullable_to_non_nullable
as EthiopianDate,gregorianDate: null == gregorianDate ? _self.gregorianDate : gregorianDate // ignore: cast_nullable_to_non_nullable
as GregorianDate,holiday: freezed == holiday ? _self.holiday : holiday // ignore: cast_nullable_to_non_nullable
as HolidayPresentation?,upNext: freezed == upNext ? _self.upNext : upNext // ignore: cast_nullable_to_non_nullable
as UpNextPresentation?,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventPresentation>,reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<ReminderPresentation>,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<SchedulePresentation>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as SyncPresentation,
  ));
}
/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HolidayPresentationCopyWith<$Res>? get holiday {
    if (_self.holiday == null) {
    return null;
  }

  return $HolidayPresentationCopyWith<$Res>(_self.holiday!, (value) {
    return _then(_self.copyWith(holiday: value));
  });
}/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpNextPresentationCopyWith<$Res>? get upNext {
    if (_self.upNext == null) {
    return null;
  }

  return $UpNextPresentationCopyWith<$Res>(_self.upNext!, (value) {
    return _then(_self.copyWith(upNext: value));
  });
}/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncPresentationCopyWith<$Res> get sync {
  
  return $SyncPresentationCopyWith<$Res>(_self.sync, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayViewState].
extension TodayViewStatePatterns on TodayViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayViewState value)  $default,){
final _that = this;
switch (_that) {
case _TodayViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayViewState value)?  $default,){
final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EthiopianDate ethiopianDate,  GregorianDate gregorianDate,  HolidayPresentation? holiday,  UpNextPresentation? upNext,  List<EventPresentation> events,  List<ReminderPresentation> reminders,  List<SchedulePresentation> schedule,  SyncPresentation sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
return $default(_that.ethiopianDate,_that.gregorianDate,_that.holiday,_that.upNext,_that.events,_that.reminders,_that.schedule,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EthiopianDate ethiopianDate,  GregorianDate gregorianDate,  HolidayPresentation? holiday,  UpNextPresentation? upNext,  List<EventPresentation> events,  List<ReminderPresentation> reminders,  List<SchedulePresentation> schedule,  SyncPresentation sync)  $default,) {final _that = this;
switch (_that) {
case _TodayViewState():
return $default(_that.ethiopianDate,_that.gregorianDate,_that.holiday,_that.upNext,_that.events,_that.reminders,_that.schedule,_that.sync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EthiopianDate ethiopianDate,  GregorianDate gregorianDate,  HolidayPresentation? holiday,  UpNextPresentation? upNext,  List<EventPresentation> events,  List<ReminderPresentation> reminders,  List<SchedulePresentation> schedule,  SyncPresentation sync)?  $default,) {final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
return $default(_that.ethiopianDate,_that.gregorianDate,_that.holiday,_that.upNext,_that.events,_that.reminders,_that.schedule,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _TodayViewState extends TodayViewState {
  const _TodayViewState({required this.ethiopianDate, required this.gregorianDate, this.holiday, this.upNext, final  List<EventPresentation> events = const <EventPresentation>[], final  List<ReminderPresentation> reminders = const <ReminderPresentation>[], final  List<SchedulePresentation> schedule = const <SchedulePresentation>[], this.sync = const SyncPresentation()}): _events = events,_reminders = reminders,_schedule = schedule,super._();
  

@override final  EthiopianDate ethiopianDate;
@override final  GregorianDate gregorianDate;
@override final  HolidayPresentation? holiday;
@override final  UpNextPresentation? upNext;
 final  List<EventPresentation> _events;
@override@JsonKey() List<EventPresentation> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<ReminderPresentation> _reminders;
@override@JsonKey() List<ReminderPresentation> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}

 final  List<SchedulePresentation> _schedule;
@override@JsonKey() List<SchedulePresentation> get schedule {
  if (_schedule is EqualUnmodifiableListView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedule);
}

@override@JsonKey() final  SyncPresentation sync;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayViewStateCopyWith<_TodayViewState> get copyWith => __$TodayViewStateCopyWithImpl<_TodayViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayViewState&&(identical(other.ethiopianDate, ethiopianDate) || other.ethiopianDate == ethiopianDate)&&(identical(other.gregorianDate, gregorianDate) || other.gregorianDate == gregorianDate)&&(identical(other.holiday, holiday) || other.holiday == holiday)&&(identical(other.upNext, upNext) || other.upNext == upNext)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._reminders, _reminders)&&const DeepCollectionEquality().equals(other._schedule, _schedule)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode => Object.hash(runtimeType,ethiopianDate,gregorianDate,holiday,upNext,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_reminders),const DeepCollectionEquality().hash(_schedule),sync);

@override
String toString() {
  return 'TodayViewState(ethiopianDate: $ethiopianDate, gregorianDate: $gregorianDate, holiday: $holiday, upNext: $upNext, events: $events, reminders: $reminders, schedule: $schedule, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$TodayViewStateCopyWith<$Res> implements $TodayViewStateCopyWith<$Res> {
  factory _$TodayViewStateCopyWith(_TodayViewState value, $Res Function(_TodayViewState) _then) = __$TodayViewStateCopyWithImpl;
@override @useResult
$Res call({
 EthiopianDate ethiopianDate, GregorianDate gregorianDate, HolidayPresentation? holiday, UpNextPresentation? upNext, List<EventPresentation> events, List<ReminderPresentation> reminders, List<SchedulePresentation> schedule, SyncPresentation sync
});


@override $HolidayPresentationCopyWith<$Res>? get holiday;@override $UpNextPresentationCopyWith<$Res>? get upNext;@override $SyncPresentationCopyWith<$Res> get sync;

}
/// @nodoc
class __$TodayViewStateCopyWithImpl<$Res>
    implements _$TodayViewStateCopyWith<$Res> {
  __$TodayViewStateCopyWithImpl(this._self, this._then);

  final _TodayViewState _self;
  final $Res Function(_TodayViewState) _then;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ethiopianDate = null,Object? gregorianDate = null,Object? holiday = freezed,Object? upNext = freezed,Object? events = null,Object? reminders = null,Object? schedule = null,Object? sync = null,}) {
  return _then(_TodayViewState(
ethiopianDate: null == ethiopianDate ? _self.ethiopianDate : ethiopianDate // ignore: cast_nullable_to_non_nullable
as EthiopianDate,gregorianDate: null == gregorianDate ? _self.gregorianDate : gregorianDate // ignore: cast_nullable_to_non_nullable
as GregorianDate,holiday: freezed == holiday ? _self.holiday : holiday // ignore: cast_nullable_to_non_nullable
as HolidayPresentation?,upNext: freezed == upNext ? _self.upNext : upNext // ignore: cast_nullable_to_non_nullable
as UpNextPresentation?,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventPresentation>,reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<ReminderPresentation>,schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<SchedulePresentation>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as SyncPresentation,
  ));
}

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HolidayPresentationCopyWith<$Res>? get holiday {
    if (_self.holiday == null) {
    return null;
  }

  return $HolidayPresentationCopyWith<$Res>(_self.holiday!, (value) {
    return _then(_self.copyWith(holiday: value));
  });
}/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpNextPresentationCopyWith<$Res>? get upNext {
    if (_self.upNext == null) {
    return null;
  }

  return $UpNextPresentationCopyWith<$Res>(_self.upNext!, (value) {
    return _then(_self.copyWith(upNext: value));
  });
}/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncPresentationCopyWith<$Res> get sync {
  
  return $SyncPresentationCopyWith<$Res>(_self.sync, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}

/// @nodoc
mixin _$HolidayPresentation {

 String get name; String get type; bool get isEstimated;
/// Create a copy of HolidayPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HolidayPresentationCopyWith<HolidayPresentation> get copyWith => _$HolidayPresentationCopyWithImpl<HolidayPresentation>(this as HolidayPresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HolidayPresentation&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isEstimated, isEstimated) || other.isEstimated == isEstimated));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,isEstimated);

@override
String toString() {
  return 'HolidayPresentation(name: $name, type: $type, isEstimated: $isEstimated)';
}


}

/// @nodoc
abstract mixin class $HolidayPresentationCopyWith<$Res>  {
  factory $HolidayPresentationCopyWith(HolidayPresentation value, $Res Function(HolidayPresentation) _then) = _$HolidayPresentationCopyWithImpl;
@useResult
$Res call({
 String name, String type, bool isEstimated
});




}
/// @nodoc
class _$HolidayPresentationCopyWithImpl<$Res>
    implements $HolidayPresentationCopyWith<$Res> {
  _$HolidayPresentationCopyWithImpl(this._self, this._then);

  final HolidayPresentation _self;
  final $Res Function(HolidayPresentation) _then;

/// Create a copy of HolidayPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? isEstimated = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isEstimated: null == isEstimated ? _self.isEstimated : isEstimated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HolidayPresentation].
extension HolidayPresentationPatterns on HolidayPresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HolidayPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HolidayPresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HolidayPresentation value)  $default,){
final _that = this;
switch (_that) {
case _HolidayPresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HolidayPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _HolidayPresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  bool isEstimated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HolidayPresentation() when $default != null:
return $default(_that.name,_that.type,_that.isEstimated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  bool isEstimated)  $default,) {final _that = this;
switch (_that) {
case _HolidayPresentation():
return $default(_that.name,_that.type,_that.isEstimated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  bool isEstimated)?  $default,) {final _that = this;
switch (_that) {
case _HolidayPresentation() when $default != null:
return $default(_that.name,_that.type,_that.isEstimated);case _:
  return null;

}
}

}

/// @nodoc


class _HolidayPresentation implements HolidayPresentation {
  const _HolidayPresentation({required this.name, required this.type, this.isEstimated = false});
  

@override final  String name;
@override final  String type;
@override@JsonKey() final  bool isEstimated;

/// Create a copy of HolidayPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HolidayPresentationCopyWith<_HolidayPresentation> get copyWith => __$HolidayPresentationCopyWithImpl<_HolidayPresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HolidayPresentation&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isEstimated, isEstimated) || other.isEstimated == isEstimated));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,isEstimated);

@override
String toString() {
  return 'HolidayPresentation(name: $name, type: $type, isEstimated: $isEstimated)';
}


}

/// @nodoc
abstract mixin class _$HolidayPresentationCopyWith<$Res> implements $HolidayPresentationCopyWith<$Res> {
  factory _$HolidayPresentationCopyWith(_HolidayPresentation value, $Res Function(_HolidayPresentation) _then) = __$HolidayPresentationCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, bool isEstimated
});




}
/// @nodoc
class __$HolidayPresentationCopyWithImpl<$Res>
    implements _$HolidayPresentationCopyWith<$Res> {
  __$HolidayPresentationCopyWithImpl(this._self, this._then);

  final _HolidayPresentation _self;
  final $Res Function(_HolidayPresentation) _then;

/// Create a copy of HolidayPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? isEstimated = null,}) {
  return _then(_HolidayPresentation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isEstimated: null == isEstimated ? _self.isEstimated : isEstimated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$UpNextPresentation {

 String get title; String? get time; String? get timeEnd; String? get subtitle; bool get isAllDay; bool get isPending; SyncStatus get syncStatus;
/// Create a copy of UpNextPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpNextPresentationCopyWith<UpNextPresentation> get copyWith => _$UpNextPresentationCopyWithImpl<UpNextPresentation>(this as UpNextPresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpNextPresentation&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,title,time,timeEnd,subtitle,isAllDay,isPending,syncStatus);

@override
String toString() {
  return 'UpNextPresentation(title: $title, time: $time, timeEnd: $timeEnd, subtitle: $subtitle, isAllDay: $isAllDay, isPending: $isPending, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $UpNextPresentationCopyWith<$Res>  {
  factory $UpNextPresentationCopyWith(UpNextPresentation value, $Res Function(UpNextPresentation) _then) = _$UpNextPresentationCopyWithImpl;
@useResult
$Res call({
 String title, String? time, String? timeEnd, String? subtitle, bool isAllDay, bool isPending, SyncStatus syncStatus
});




}
/// @nodoc
class _$UpNextPresentationCopyWithImpl<$Res>
    implements $UpNextPresentationCopyWith<$Res> {
  _$UpNextPresentationCopyWithImpl(this._self, this._then);

  final UpNextPresentation _self;
  final $Res Function(UpNextPresentation) _then;

/// Create a copy of UpNextPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? time = freezed,Object? timeEnd = freezed,Object? subtitle = freezed,Object? isAllDay = null,Object? isPending = null,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,timeEnd: freezed == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UpNextPresentation].
extension UpNextPresentationPatterns on UpNextPresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpNextPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpNextPresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpNextPresentation value)  $default,){
final _that = this;
switch (_that) {
case _UpNextPresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpNextPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _UpNextPresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? time,  String? timeEnd,  String? subtitle,  bool isAllDay,  bool isPending,  SyncStatus syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpNextPresentation() when $default != null:
return $default(_that.title,_that.time,_that.timeEnd,_that.subtitle,_that.isAllDay,_that.isPending,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? time,  String? timeEnd,  String? subtitle,  bool isAllDay,  bool isPending,  SyncStatus syncStatus)  $default,) {final _that = this;
switch (_that) {
case _UpNextPresentation():
return $default(_that.title,_that.time,_that.timeEnd,_that.subtitle,_that.isAllDay,_that.isPending,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? time,  String? timeEnd,  String? subtitle,  bool isAllDay,  bool isPending,  SyncStatus syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _UpNextPresentation() when $default != null:
return $default(_that.title,_that.time,_that.timeEnd,_that.subtitle,_that.isAllDay,_that.isPending,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc


class _UpNextPresentation implements UpNextPresentation {
  const _UpNextPresentation({required this.title, this.time, this.timeEnd, this.subtitle, this.isAllDay = false, this.isPending = false, this.syncStatus = SyncStatus.synced});
  

@override final  String title;
@override final  String? time;
@override final  String? timeEnd;
@override final  String? subtitle;
@override@JsonKey() final  bool isAllDay;
@override@JsonKey() final  bool isPending;
@override@JsonKey() final  SyncStatus syncStatus;

/// Create a copy of UpNextPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpNextPresentationCopyWith<_UpNextPresentation> get copyWith => __$UpNextPresentationCopyWithImpl<_UpNextPresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpNextPresentation&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,title,time,timeEnd,subtitle,isAllDay,isPending,syncStatus);

@override
String toString() {
  return 'UpNextPresentation(title: $title, time: $time, timeEnd: $timeEnd, subtitle: $subtitle, isAllDay: $isAllDay, isPending: $isPending, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$UpNextPresentationCopyWith<$Res> implements $UpNextPresentationCopyWith<$Res> {
  factory _$UpNextPresentationCopyWith(_UpNextPresentation value, $Res Function(_UpNextPresentation) _then) = __$UpNextPresentationCopyWithImpl;
@override @useResult
$Res call({
 String title, String? time, String? timeEnd, String? subtitle, bool isAllDay, bool isPending, SyncStatus syncStatus
});




}
/// @nodoc
class __$UpNextPresentationCopyWithImpl<$Res>
    implements _$UpNextPresentationCopyWith<$Res> {
  __$UpNextPresentationCopyWithImpl(this._self, this._then);

  final _UpNextPresentation _self;
  final $Res Function(_UpNextPresentation) _then;

/// Create a copy of UpNextPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? time = freezed,Object? timeEnd = freezed,Object? subtitle = freezed,Object? isAllDay = null,Object? isPending = null,Object? syncStatus = null,}) {
  return _then(_UpNextPresentation(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,timeEnd: freezed == timeEnd ? _self.timeEnd : timeEnd // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,
  ));
}


}

/// @nodoc
mixin _$EventPresentation {

 String get title; String? get time; String? get location; bool get isAllDay; bool get isPending;
/// Create a copy of EventPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventPresentationCopyWith<EventPresentation> get copyWith => _$EventPresentationCopyWithImpl<EventPresentation>(this as EventPresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventPresentation&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}


@override
int get hashCode => Object.hash(runtimeType,title,time,location,isAllDay,isPending);

@override
String toString() {
  return 'EventPresentation(title: $title, time: $time, location: $location, isAllDay: $isAllDay, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $EventPresentationCopyWith<$Res>  {
  factory $EventPresentationCopyWith(EventPresentation value, $Res Function(EventPresentation) _then) = _$EventPresentationCopyWithImpl;
@useResult
$Res call({
 String title, String? time, String? location, bool isAllDay, bool isPending
});




}
/// @nodoc
class _$EventPresentationCopyWithImpl<$Res>
    implements $EventPresentationCopyWith<$Res> {
  _$EventPresentationCopyWithImpl(this._self, this._then);

  final EventPresentation _self;
  final $Res Function(EventPresentation) _then;

/// Create a copy of EventPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? time = freezed,Object? location = freezed,Object? isAllDay = null,Object? isPending = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EventPresentation].
extension EventPresentationPatterns on EventPresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventPresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventPresentation value)  $default,){
final _that = this;
switch (_that) {
case _EventPresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _EventPresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? time,  String? location,  bool isAllDay,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventPresentation() when $default != null:
return $default(_that.title,_that.time,_that.location,_that.isAllDay,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? time,  String? location,  bool isAllDay,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _EventPresentation():
return $default(_that.title,_that.time,_that.location,_that.isAllDay,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? time,  String? location,  bool isAllDay,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _EventPresentation() when $default != null:
return $default(_that.title,_that.time,_that.location,_that.isAllDay,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc


class _EventPresentation implements EventPresentation {
  const _EventPresentation({required this.title, this.time, this.location, this.isAllDay = false, this.isPending = false});
  

@override final  String title;
@override final  String? time;
@override final  String? location;
@override@JsonKey() final  bool isAllDay;
@override@JsonKey() final  bool isPending;

/// Create a copy of EventPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventPresentationCopyWith<_EventPresentation> get copyWith => __$EventPresentationCopyWithImpl<_EventPresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventPresentation&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}


@override
int get hashCode => Object.hash(runtimeType,title,time,location,isAllDay,isPending);

@override
String toString() {
  return 'EventPresentation(title: $title, time: $time, location: $location, isAllDay: $isAllDay, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$EventPresentationCopyWith<$Res> implements $EventPresentationCopyWith<$Res> {
  factory _$EventPresentationCopyWith(_EventPresentation value, $Res Function(_EventPresentation) _then) = __$EventPresentationCopyWithImpl;
@override @useResult
$Res call({
 String title, String? time, String? location, bool isAllDay, bool isPending
});




}
/// @nodoc
class __$EventPresentationCopyWithImpl<$Res>
    implements _$EventPresentationCopyWith<$Res> {
  __$EventPresentationCopyWithImpl(this._self, this._then);

  final _EventPresentation _self;
  final $Res Function(_EventPresentation) _then;

/// Create a copy of EventPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? time = freezed,Object? location = freezed,Object? isAllDay = null,Object? isPending = null,}) {
  return _then(_EventPresentation(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ReminderPresentation {

 String get id; String get title; String? get subtitle; String? get time; bool get isOverdue; bool get isCompleted;
/// Create a copy of ReminderPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderPresentationCopyWith<ReminderPresentation> get copyWith => _$ReminderPresentationCopyWithImpl<ReminderPresentation>(this as ReminderPresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderPresentation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.time, time) || other.time == time)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,time,isOverdue,isCompleted);

@override
String toString() {
  return 'ReminderPresentation(id: $id, title: $title, subtitle: $subtitle, time: $time, isOverdue: $isOverdue, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ReminderPresentationCopyWith<$Res>  {
  factory $ReminderPresentationCopyWith(ReminderPresentation value, $Res Function(ReminderPresentation) _then) = _$ReminderPresentationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? subtitle, String? time, bool isOverdue, bool isCompleted
});




}
/// @nodoc
class _$ReminderPresentationCopyWithImpl<$Res>
    implements $ReminderPresentationCopyWith<$Res> {
  _$ReminderPresentationCopyWithImpl(this._self, this._then);

  final ReminderPresentation _self;
  final $Res Function(ReminderPresentation) _then;

/// Create a copy of ReminderPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = freezed,Object? time = freezed,Object? isOverdue = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderPresentation].
extension ReminderPresentationPatterns on ReminderPresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderPresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderPresentation value)  $default,){
final _that = this;
switch (_that) {
case _ReminderPresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderPresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? subtitle,  String? time,  bool isOverdue,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderPresentation() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.time,_that.isOverdue,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? subtitle,  String? time,  bool isOverdue,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _ReminderPresentation():
return $default(_that.id,_that.title,_that.subtitle,_that.time,_that.isOverdue,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? subtitle,  String? time,  bool isOverdue,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _ReminderPresentation() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.time,_that.isOverdue,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _ReminderPresentation implements ReminderPresentation {
  const _ReminderPresentation({required this.id, required this.title, this.subtitle, this.time, this.isOverdue = false, this.isCompleted = false});
  

@override final  String id;
@override final  String title;
@override final  String? subtitle;
@override final  String? time;
@override@JsonKey() final  bool isOverdue;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of ReminderPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderPresentationCopyWith<_ReminderPresentation> get copyWith => __$ReminderPresentationCopyWithImpl<_ReminderPresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderPresentation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.time, time) || other.time == time)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,time,isOverdue,isCompleted);

@override
String toString() {
  return 'ReminderPresentation(id: $id, title: $title, subtitle: $subtitle, time: $time, isOverdue: $isOverdue, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ReminderPresentationCopyWith<$Res> implements $ReminderPresentationCopyWith<$Res> {
  factory _$ReminderPresentationCopyWith(_ReminderPresentation value, $Res Function(_ReminderPresentation) _then) = __$ReminderPresentationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? subtitle, String? time, bool isOverdue, bool isCompleted
});




}
/// @nodoc
class __$ReminderPresentationCopyWithImpl<$Res>
    implements _$ReminderPresentationCopyWith<$Res> {
  __$ReminderPresentationCopyWithImpl(this._self, this._then);

  final _ReminderPresentation _self;
  final $Res Function(_ReminderPresentation) _then;

/// Create a copy of ReminderPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = freezed,Object? time = freezed,Object? isOverdue = null,Object? isCompleted = null,}) {
  return _then(_ReminderPresentation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SchedulePresentation {

 String get time; String get title; String? get subtitle; bool get isCompleted;
/// Create a copy of SchedulePresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchedulePresentationCopyWith<SchedulePresentation> get copyWith => _$SchedulePresentationCopyWithImpl<SchedulePresentation>(this as SchedulePresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchedulePresentation&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,isCompleted);

@override
String toString() {
  return 'SchedulePresentation(time: $time, title: $title, subtitle: $subtitle, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $SchedulePresentationCopyWith<$Res>  {
  factory $SchedulePresentationCopyWith(SchedulePresentation value, $Res Function(SchedulePresentation) _then) = _$SchedulePresentationCopyWithImpl;
@useResult
$Res call({
 String time, String title, String? subtitle, bool isCompleted
});




}
/// @nodoc
class _$SchedulePresentationCopyWithImpl<$Res>
    implements $SchedulePresentationCopyWith<$Res> {
  _$SchedulePresentationCopyWithImpl(this._self, this._then);

  final SchedulePresentation _self;
  final $Res Function(SchedulePresentation) _then;

/// Create a copy of SchedulePresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? title = null,Object? subtitle = freezed,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SchedulePresentation].
extension SchedulePresentationPatterns on SchedulePresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchedulePresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchedulePresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchedulePresentation value)  $default,){
final _that = this;
switch (_that) {
case _SchedulePresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchedulePresentation value)?  $default,){
final _that = this;
switch (_that) {
case _SchedulePresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  String title,  String? subtitle,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchedulePresentation() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  String title,  String? subtitle,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _SchedulePresentation():
return $default(_that.time,_that.title,_that.subtitle,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  String title,  String? subtitle,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _SchedulePresentation() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _SchedulePresentation implements SchedulePresentation {
  const _SchedulePresentation({required this.time, required this.title, this.subtitle, this.isCompleted = false});
  

@override final  String time;
@override final  String title;
@override final  String? subtitle;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of SchedulePresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchedulePresentationCopyWith<_SchedulePresentation> get copyWith => __$SchedulePresentationCopyWithImpl<_SchedulePresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchedulePresentation&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,isCompleted);

@override
String toString() {
  return 'SchedulePresentation(time: $time, title: $title, subtitle: $subtitle, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$SchedulePresentationCopyWith<$Res> implements $SchedulePresentationCopyWith<$Res> {
  factory _$SchedulePresentationCopyWith(_SchedulePresentation value, $Res Function(_SchedulePresentation) _then) = __$SchedulePresentationCopyWithImpl;
@override @useResult
$Res call({
 String time, String title, String? subtitle, bool isCompleted
});




}
/// @nodoc
class __$SchedulePresentationCopyWithImpl<$Res>
    implements _$SchedulePresentationCopyWith<$Res> {
  __$SchedulePresentationCopyWithImpl(this._self, this._then);

  final _SchedulePresentation _self;
  final $Res Function(_SchedulePresentation) _then;

/// Create a copy of SchedulePresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? title = null,Object? subtitle = freezed,Object? isCompleted = null,}) {
  return _then(_SchedulePresentation(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SyncPresentation {

 SyncStatus get status; int get pendingCount;
/// Create a copy of SyncPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncPresentationCopyWith<SyncPresentation> get copyWith => _$SyncPresentationCopyWithImpl<SyncPresentation>(this as SyncPresentation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncPresentation&&(identical(other.status, status) || other.status == status)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,pendingCount);

@override
String toString() {
  return 'SyncPresentation(status: $status, pendingCount: $pendingCount)';
}


}

/// @nodoc
abstract mixin class $SyncPresentationCopyWith<$Res>  {
  factory $SyncPresentationCopyWith(SyncPresentation value, $Res Function(SyncPresentation) _then) = _$SyncPresentationCopyWithImpl;
@useResult
$Res call({
 SyncStatus status, int pendingCount
});




}
/// @nodoc
class _$SyncPresentationCopyWithImpl<$Res>
    implements $SyncPresentationCopyWith<$Res> {
  _$SyncPresentationCopyWithImpl(this._self, this._then);

  final SyncPresentation _self;
  final $Res Function(SyncPresentation) _then;

/// Create a copy of SyncPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pendingCount = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncPresentation].
extension SyncPresentationPatterns on SyncPresentation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncPresentation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncPresentation value)  $default,){
final _that = this;
switch (_that) {
case _SyncPresentation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _SyncPresentation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SyncStatus status,  int pendingCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncPresentation() when $default != null:
return $default(_that.status,_that.pendingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SyncStatus status,  int pendingCount)  $default,) {final _that = this;
switch (_that) {
case _SyncPresentation():
return $default(_that.status,_that.pendingCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SyncStatus status,  int pendingCount)?  $default,) {final _that = this;
switch (_that) {
case _SyncPresentation() when $default != null:
return $default(_that.status,_that.pendingCount);case _:
  return null;

}
}

}

/// @nodoc


class _SyncPresentation implements SyncPresentation {
  const _SyncPresentation({this.status = SyncStatus.synced, this.pendingCount = 0});
  

@override@JsonKey() final  SyncStatus status;
@override@JsonKey() final  int pendingCount;

/// Create a copy of SyncPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncPresentationCopyWith<_SyncPresentation> get copyWith => __$SyncPresentationCopyWithImpl<_SyncPresentation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncPresentation&&(identical(other.status, status) || other.status == status)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,pendingCount);

@override
String toString() {
  return 'SyncPresentation(status: $status, pendingCount: $pendingCount)';
}


}

/// @nodoc
abstract mixin class _$SyncPresentationCopyWith<$Res> implements $SyncPresentationCopyWith<$Res> {
  factory _$SyncPresentationCopyWith(_SyncPresentation value, $Res Function(_SyncPresentation) _then) = __$SyncPresentationCopyWithImpl;
@override @useResult
$Res call({
 SyncStatus status, int pendingCount
});




}
/// @nodoc
class __$SyncPresentationCopyWithImpl<$Res>
    implements _$SyncPresentationCopyWith<$Res> {
  __$SyncPresentationCopyWithImpl(this._self, this._then);

  final _SyncPresentation _self;
  final $Res Function(_SyncPresentation) _then;

/// Create a copy of SyncPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pendingCount = null,}) {
  return _then(_SyncPresentation(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
