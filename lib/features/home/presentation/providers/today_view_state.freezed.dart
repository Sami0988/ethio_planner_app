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

 String get ecDateLabel; String get gcDateLabel; UpNextItem? get upNextItem; List<ScheduleItem> get scheduleItems; List<ReminderItem> get reminderItems; bool get isEmpty; SyncStatus get syncStatus;
/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayViewStateCopyWith<TodayViewState> get copyWith => _$TodayViewStateCopyWithImpl<TodayViewState>(this as TodayViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayViewState&&(identical(other.ecDateLabel, ecDateLabel) || other.ecDateLabel == ecDateLabel)&&(identical(other.gcDateLabel, gcDateLabel) || other.gcDateLabel == gcDateLabel)&&(identical(other.upNextItem, upNextItem) || other.upNextItem == upNextItem)&&const DeepCollectionEquality().equals(other.scheduleItems, scheduleItems)&&const DeepCollectionEquality().equals(other.reminderItems, reminderItems)&&(identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,ecDateLabel,gcDateLabel,upNextItem,const DeepCollectionEquality().hash(scheduleItems),const DeepCollectionEquality().hash(reminderItems),isEmpty,syncStatus);

@override
String toString() {
  return 'TodayViewState(ecDateLabel: $ecDateLabel, gcDateLabel: $gcDateLabel, upNextItem: $upNextItem, scheduleItems: $scheduleItems, reminderItems: $reminderItems, isEmpty: $isEmpty, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $TodayViewStateCopyWith<$Res>  {
  factory $TodayViewStateCopyWith(TodayViewState value, $Res Function(TodayViewState) _then) = _$TodayViewStateCopyWithImpl;
@useResult
$Res call({
 String ecDateLabel, String gcDateLabel, UpNextItem? upNextItem, List<ScheduleItem> scheduleItems, List<ReminderItem> reminderItems, bool isEmpty, SyncStatus syncStatus
});


$UpNextItemCopyWith<$Res>? get upNextItem;

}
/// @nodoc
class _$TodayViewStateCopyWithImpl<$Res>
    implements $TodayViewStateCopyWith<$Res> {
  _$TodayViewStateCopyWithImpl(this._self, this._then);

  final TodayViewState _self;
  final $Res Function(TodayViewState) _then;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ecDateLabel = null,Object? gcDateLabel = null,Object? upNextItem = freezed,Object? scheduleItems = null,Object? reminderItems = null,Object? isEmpty = null,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
ecDateLabel: null == ecDateLabel ? _self.ecDateLabel : ecDateLabel // ignore: cast_nullable_to_non_nullable
as String,gcDateLabel: null == gcDateLabel ? _self.gcDateLabel : gcDateLabel // ignore: cast_nullable_to_non_nullable
as String,upNextItem: freezed == upNextItem ? _self.upNextItem : upNextItem // ignore: cast_nullable_to_non_nullable
as UpNextItem?,scheduleItems: null == scheduleItems ? _self.scheduleItems : scheduleItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleItem>,reminderItems: null == reminderItems ? _self.reminderItems : reminderItems // ignore: cast_nullable_to_non_nullable
as List<ReminderItem>,isEmpty: null == isEmpty ? _self.isEmpty : isEmpty // ignore: cast_nullable_to_non_nullable
as bool,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,
  ));
}
/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpNextItemCopyWith<$Res>? get upNextItem {
    if (_self.upNextItem == null) {
    return null;
  }

  return $UpNextItemCopyWith<$Res>(_self.upNextItem!, (value) {
    return _then(_self.copyWith(upNextItem: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ecDateLabel,  String gcDateLabel,  UpNextItem? upNextItem,  List<ScheduleItem> scheduleItems,  List<ReminderItem> reminderItems,  bool isEmpty,  SyncStatus syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
return $default(_that.ecDateLabel,_that.gcDateLabel,_that.upNextItem,_that.scheduleItems,_that.reminderItems,_that.isEmpty,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ecDateLabel,  String gcDateLabel,  UpNextItem? upNextItem,  List<ScheduleItem> scheduleItems,  List<ReminderItem> reminderItems,  bool isEmpty,  SyncStatus syncStatus)  $default,) {final _that = this;
switch (_that) {
case _TodayViewState():
return $default(_that.ecDateLabel,_that.gcDateLabel,_that.upNextItem,_that.scheduleItems,_that.reminderItems,_that.isEmpty,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ecDateLabel,  String gcDateLabel,  UpNextItem? upNextItem,  List<ScheduleItem> scheduleItems,  List<ReminderItem> reminderItems,  bool isEmpty,  SyncStatus syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _TodayViewState() when $default != null:
return $default(_that.ecDateLabel,_that.gcDateLabel,_that.upNextItem,_that.scheduleItems,_that.reminderItems,_that.isEmpty,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc


class _TodayViewState implements TodayViewState {
  const _TodayViewState({required this.ecDateLabel, required this.gcDateLabel, this.upNextItem, final  List<ScheduleItem> scheduleItems = const [], final  List<ReminderItem> reminderItems = const [], this.isEmpty = false, this.syncStatus = SyncStatus.synced}): _scheduleItems = scheduleItems,_reminderItems = reminderItems;
  

@override final  String ecDateLabel;
@override final  String gcDateLabel;
@override final  UpNextItem? upNextItem;
 final  List<ScheduleItem> _scheduleItems;
@override@JsonKey() List<ScheduleItem> get scheduleItems {
  if (_scheduleItems is EqualUnmodifiableListView) return _scheduleItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scheduleItems);
}

 final  List<ReminderItem> _reminderItems;
@override@JsonKey() List<ReminderItem> get reminderItems {
  if (_reminderItems is EqualUnmodifiableListView) return _reminderItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminderItems);
}

@override@JsonKey() final  bool isEmpty;
@override@JsonKey() final  SyncStatus syncStatus;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayViewStateCopyWith<_TodayViewState> get copyWith => __$TodayViewStateCopyWithImpl<_TodayViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayViewState&&(identical(other.ecDateLabel, ecDateLabel) || other.ecDateLabel == ecDateLabel)&&(identical(other.gcDateLabel, gcDateLabel) || other.gcDateLabel == gcDateLabel)&&(identical(other.upNextItem, upNextItem) || other.upNextItem == upNextItem)&&const DeepCollectionEquality().equals(other._scheduleItems, _scheduleItems)&&const DeepCollectionEquality().equals(other._reminderItems, _reminderItems)&&(identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,ecDateLabel,gcDateLabel,upNextItem,const DeepCollectionEquality().hash(_scheduleItems),const DeepCollectionEquality().hash(_reminderItems),isEmpty,syncStatus);

@override
String toString() {
  return 'TodayViewState(ecDateLabel: $ecDateLabel, gcDateLabel: $gcDateLabel, upNextItem: $upNextItem, scheduleItems: $scheduleItems, reminderItems: $reminderItems, isEmpty: $isEmpty, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$TodayViewStateCopyWith<$Res> implements $TodayViewStateCopyWith<$Res> {
  factory _$TodayViewStateCopyWith(_TodayViewState value, $Res Function(_TodayViewState) _then) = __$TodayViewStateCopyWithImpl;
@override @useResult
$Res call({
 String ecDateLabel, String gcDateLabel, UpNextItem? upNextItem, List<ScheduleItem> scheduleItems, List<ReminderItem> reminderItems, bool isEmpty, SyncStatus syncStatus
});


@override $UpNextItemCopyWith<$Res>? get upNextItem;

}
/// @nodoc
class __$TodayViewStateCopyWithImpl<$Res>
    implements _$TodayViewStateCopyWith<$Res> {
  __$TodayViewStateCopyWithImpl(this._self, this._then);

  final _TodayViewState _self;
  final $Res Function(_TodayViewState) _then;

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ecDateLabel = null,Object? gcDateLabel = null,Object? upNextItem = freezed,Object? scheduleItems = null,Object? reminderItems = null,Object? isEmpty = null,Object? syncStatus = null,}) {
  return _then(_TodayViewState(
ecDateLabel: null == ecDateLabel ? _self.ecDateLabel : ecDateLabel // ignore: cast_nullable_to_non_nullable
as String,gcDateLabel: null == gcDateLabel ? _self.gcDateLabel : gcDateLabel // ignore: cast_nullable_to_non_nullable
as String,upNextItem: freezed == upNextItem ? _self.upNextItem : upNextItem // ignore: cast_nullable_to_non_nullable
as UpNextItem?,scheduleItems: null == scheduleItems ? _self._scheduleItems : scheduleItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleItem>,reminderItems: null == reminderItems ? _self._reminderItems : reminderItems // ignore: cast_nullable_to_non_nullable
as List<ReminderItem>,isEmpty: null == isEmpty ? _self.isEmpty : isEmpty // ignore: cast_nullable_to_non_nullable
as bool,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,
  ));
}

/// Create a copy of TodayViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpNextItemCopyWith<$Res>? get upNextItem {
    if (_self.upNextItem == null) {
    return null;
  }

  return $UpNextItemCopyWith<$Res>(_self.upNextItem!, (value) {
    return _then(_self.copyWith(upNextItem: value));
  });
}
}

/// @nodoc
mixin _$UpNextItem {

 String get time; String get title; String get subtitle; String get type;
/// Create a copy of UpNextItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpNextItemCopyWith<UpNextItem> get copyWith => _$UpNextItemCopyWithImpl<UpNextItem>(this as UpNextItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpNextItem&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,type);

@override
String toString() {
  return 'UpNextItem(time: $time, title: $title, subtitle: $subtitle, type: $type)';
}


}

/// @nodoc
abstract mixin class $UpNextItemCopyWith<$Res>  {
  factory $UpNextItemCopyWith(UpNextItem value, $Res Function(UpNextItem) _then) = _$UpNextItemCopyWithImpl;
@useResult
$Res call({
 String time, String title, String subtitle, String type
});




}
/// @nodoc
class _$UpNextItemCopyWithImpl<$Res>
    implements $UpNextItemCopyWith<$Res> {
  _$UpNextItemCopyWithImpl(this._self, this._then);

  final UpNextItem _self;
  final $Res Function(UpNextItem) _then;

/// Create a copy of UpNextItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? title = null,Object? subtitle = null,Object? type = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpNextItem].
extension UpNextItemPatterns on UpNextItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpNextItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpNextItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpNextItem value)  $default,){
final _that = this;
switch (_that) {
case _UpNextItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpNextItem value)?  $default,){
final _that = this;
switch (_that) {
case _UpNextItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  String title,  String subtitle,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpNextItem() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  String title,  String subtitle,  String type)  $default,) {final _that = this;
switch (_that) {
case _UpNextItem():
return $default(_that.time,_that.title,_that.subtitle,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  String title,  String subtitle,  String type)?  $default,) {final _that = this;
switch (_that) {
case _UpNextItem() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _UpNextItem implements UpNextItem {
  const _UpNextItem({required this.time, required this.title, required this.subtitle, required this.type});
  

@override final  String time;
@override final  String title;
@override final  String subtitle;
@override final  String type;

/// Create a copy of UpNextItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpNextItemCopyWith<_UpNextItem> get copyWith => __$UpNextItemCopyWithImpl<_UpNextItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpNextItem&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,type);

@override
String toString() {
  return 'UpNextItem(time: $time, title: $title, subtitle: $subtitle, type: $type)';
}


}

/// @nodoc
abstract mixin class _$UpNextItemCopyWith<$Res> implements $UpNextItemCopyWith<$Res> {
  factory _$UpNextItemCopyWith(_UpNextItem value, $Res Function(_UpNextItem) _then) = __$UpNextItemCopyWithImpl;
@override @useResult
$Res call({
 String time, String title, String subtitle, String type
});




}
/// @nodoc
class __$UpNextItemCopyWithImpl<$Res>
    implements _$UpNextItemCopyWith<$Res> {
  __$UpNextItemCopyWithImpl(this._self, this._then);

  final _UpNextItem _self;
  final $Res Function(_UpNextItem) _then;

/// Create a copy of UpNextItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? title = null,Object? subtitle = null,Object? type = null,}) {
  return _then(_UpNextItem(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ScheduleItem {

 String get time; String get title; String get subtitle; ScheduleStatus get status;
/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleItemCopyWith<ScheduleItem> get copyWith => _$ScheduleItemCopyWithImpl<ScheduleItem>(this as ScheduleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleItem&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,status);

@override
String toString() {
  return 'ScheduleItem(time: $time, title: $title, subtitle: $subtitle, status: $status)';
}


}

/// @nodoc
abstract mixin class $ScheduleItemCopyWith<$Res>  {
  factory $ScheduleItemCopyWith(ScheduleItem value, $Res Function(ScheduleItem) _then) = _$ScheduleItemCopyWithImpl;
@useResult
$Res call({
 String time, String title, String subtitle, ScheduleStatus status
});




}
/// @nodoc
class _$ScheduleItemCopyWithImpl<$Res>
    implements $ScheduleItemCopyWith<$Res> {
  _$ScheduleItemCopyWithImpl(this._self, this._then);

  final ScheduleItem _self;
  final $Res Function(ScheduleItem) _then;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? title = null,Object? subtitle = null,Object? status = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScheduleStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleItem].
extension ScheduleItemPatterns on ScheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  String title,  String subtitle,  ScheduleStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  String title,  String subtitle,  ScheduleStatus status)  $default,) {final _that = this;
switch (_that) {
case _ScheduleItem():
return $default(_that.time,_that.title,_that.subtitle,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  String title,  String subtitle,  ScheduleStatus status)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
return $default(_that.time,_that.title,_that.subtitle,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleItem implements ScheduleItem {
  const _ScheduleItem({required this.time, required this.title, required this.subtitle, required this.status});
  

@override final  String time;
@override final  String title;
@override final  String subtitle;
@override final  ScheduleStatus status;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleItemCopyWith<_ScheduleItem> get copyWith => __$ScheduleItemCopyWithImpl<_ScheduleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleItem&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,time,title,subtitle,status);

@override
String toString() {
  return 'ScheduleItem(time: $time, title: $title, subtitle: $subtitle, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ScheduleItemCopyWith<$Res> implements $ScheduleItemCopyWith<$Res> {
  factory _$ScheduleItemCopyWith(_ScheduleItem value, $Res Function(_ScheduleItem) _then) = __$ScheduleItemCopyWithImpl;
@override @useResult
$Res call({
 String time, String title, String subtitle, ScheduleStatus status
});




}
/// @nodoc
class __$ScheduleItemCopyWithImpl<$Res>
    implements _$ScheduleItemCopyWith<$Res> {
  __$ScheduleItemCopyWithImpl(this._self, this._then);

  final _ScheduleItem _self;
  final $Res Function(_ScheduleItem) _then;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? title = null,Object? subtitle = null,Object? status = null,}) {
  return _then(_ScheduleItem(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScheduleStatus,
  ));
}


}

/// @nodoc
mixin _$ReminderItem {

 String get title; String? get subtitle; String? get time; String? get badgeLabel; bool? get badgeStatus; bool get isCompleted;
/// Create a copy of ReminderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderItemCopyWith<ReminderItem> get copyWith => _$ReminderItemCopyWithImpl<ReminderItem>(this as ReminderItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderItem&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.time, time) || other.time == time)&&(identical(other.badgeLabel, badgeLabel) || other.badgeLabel == badgeLabel)&&(identical(other.badgeStatus, badgeStatus) || other.badgeStatus == badgeStatus)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,time,badgeLabel,badgeStatus,isCompleted);

@override
String toString() {
  return 'ReminderItem(title: $title, subtitle: $subtitle, time: $time, badgeLabel: $badgeLabel, badgeStatus: $badgeStatus, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ReminderItemCopyWith<$Res>  {
  factory $ReminderItemCopyWith(ReminderItem value, $Res Function(ReminderItem) _then) = _$ReminderItemCopyWithImpl;
@useResult
$Res call({
 String title, String? subtitle, String? time, String? badgeLabel, bool? badgeStatus, bool isCompleted
});




}
/// @nodoc
class _$ReminderItemCopyWithImpl<$Res>
    implements $ReminderItemCopyWith<$Res> {
  _$ReminderItemCopyWithImpl(this._self, this._then);

  final ReminderItem _self;
  final $Res Function(ReminderItem) _then;

/// Create a copy of ReminderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = freezed,Object? time = freezed,Object? badgeLabel = freezed,Object? badgeStatus = freezed,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,badgeLabel: freezed == badgeLabel ? _self.badgeLabel : badgeLabel // ignore: cast_nullable_to_non_nullable
as String?,badgeStatus: freezed == badgeStatus ? _self.badgeStatus : badgeStatus // ignore: cast_nullable_to_non_nullable
as bool?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderItem].
extension ReminderItemPatterns on ReminderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderItem value)  $default,){
final _that = this;
switch (_that) {
case _ReminderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? subtitle,  String? time,  String? badgeLabel,  bool? badgeStatus,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderItem() when $default != null:
return $default(_that.title,_that.subtitle,_that.time,_that.badgeLabel,_that.badgeStatus,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? subtitle,  String? time,  String? badgeLabel,  bool? badgeStatus,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _ReminderItem():
return $default(_that.title,_that.subtitle,_that.time,_that.badgeLabel,_that.badgeStatus,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? subtitle,  String? time,  String? badgeLabel,  bool? badgeStatus,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _ReminderItem() when $default != null:
return $default(_that.title,_that.subtitle,_that.time,_that.badgeLabel,_that.badgeStatus,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _ReminderItem implements ReminderItem {
  const _ReminderItem({required this.title, this.subtitle, this.time, this.badgeLabel, this.badgeStatus, this.isCompleted = false});
  

@override final  String title;
@override final  String? subtitle;
@override final  String? time;
@override final  String? badgeLabel;
@override final  bool? badgeStatus;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of ReminderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderItemCopyWith<_ReminderItem> get copyWith => __$ReminderItemCopyWithImpl<_ReminderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderItem&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.time, time) || other.time == time)&&(identical(other.badgeLabel, badgeLabel) || other.badgeLabel == badgeLabel)&&(identical(other.badgeStatus, badgeStatus) || other.badgeStatus == badgeStatus)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,time,badgeLabel,badgeStatus,isCompleted);

@override
String toString() {
  return 'ReminderItem(title: $title, subtitle: $subtitle, time: $time, badgeLabel: $badgeLabel, badgeStatus: $badgeStatus, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ReminderItemCopyWith<$Res> implements $ReminderItemCopyWith<$Res> {
  factory _$ReminderItemCopyWith(_ReminderItem value, $Res Function(_ReminderItem) _then) = __$ReminderItemCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, String? time, String? badgeLabel, bool? badgeStatus, bool isCompleted
});




}
/// @nodoc
class __$ReminderItemCopyWithImpl<$Res>
    implements _$ReminderItemCopyWith<$Res> {
  __$ReminderItemCopyWithImpl(this._self, this._then);

  final _ReminderItem _self;
  final $Res Function(_ReminderItem) _then;

/// Create a copy of ReminderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? time = freezed,Object? badgeLabel = freezed,Object? badgeStatus = freezed,Object? isCompleted = null,}) {
  return _then(_ReminderItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,badgeLabel: freezed == badgeLabel ? _self.badgeLabel : badgeLabel // ignore: cast_nullable_to_non_nullable
as String?,badgeStatus: freezed == badgeStatus ? _self.badgeStatus : badgeStatus // ignore: cast_nullable_to_non_nullable
as bool?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
