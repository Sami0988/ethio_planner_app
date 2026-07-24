// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthViewState {

 AuthView get view; User? get user; bool get isLoading; String? get error; String? get successMessage; String? get pendingEmail;
/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthViewStateCopyWith<AuthViewState> get copyWith => _$AuthViewStateCopyWithImpl<AuthViewState>(this as AuthViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthViewState&&(identical(other.view, view) || other.view == view)&&(identical(other.user, user) || other.user == user)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail));
}


@override
int get hashCode => Object.hash(runtimeType,view,user,isLoading,error,successMessage,pendingEmail);

@override
String toString() {
  return 'AuthViewState(view: $view, user: $user, isLoading: $isLoading, error: $error, successMessage: $successMessage, pendingEmail: $pendingEmail)';
}


}

/// @nodoc
abstract mixin class $AuthViewStateCopyWith<$Res>  {
  factory $AuthViewStateCopyWith(AuthViewState value, $Res Function(AuthViewState) _then) = _$AuthViewStateCopyWithImpl;
@useResult
$Res call({
 AuthView view, User? user, bool isLoading, String? error, String? successMessage, String? pendingEmail
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthViewStateCopyWithImpl<$Res>
    implements $AuthViewStateCopyWith<$Res> {
  _$AuthViewStateCopyWithImpl(this._self, this._then);

  final AuthViewState _self;
  final $Res Function(AuthViewState) _then;

/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = null,Object? user = freezed,Object? isLoading = null,Object? error = freezed,Object? successMessage = freezed,Object? pendingEmail = freezed,}) {
  return _then(_self.copyWith(
view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as AuthView,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthViewState].
extension AuthViewStatePatterns on AuthViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthViewState value)  $default,){
final _that = this;
switch (_that) {
case _AuthViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthViewState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthView view,  User? user,  bool isLoading,  String? error,  String? successMessage,  String? pendingEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthViewState() when $default != null:
return $default(_that.view,_that.user,_that.isLoading,_that.error,_that.successMessage,_that.pendingEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthView view,  User? user,  bool isLoading,  String? error,  String? successMessage,  String? pendingEmail)  $default,) {final _that = this;
switch (_that) {
case _AuthViewState():
return $default(_that.view,_that.user,_that.isLoading,_that.error,_that.successMessage,_that.pendingEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthView view,  User? user,  bool isLoading,  String? error,  String? successMessage,  String? pendingEmail)?  $default,) {final _that = this;
switch (_that) {
case _AuthViewState() when $default != null:
return $default(_that.view,_that.user,_that.isLoading,_that.error,_that.successMessage,_that.pendingEmail);case _:
  return null;

}
}

}

/// @nodoc


class _AuthViewState implements AuthViewState {
  const _AuthViewState({this.view = AuthView.signIn, this.user, this.isLoading = false, this.error, this.successMessage, this.pendingEmail});
  

@override@JsonKey() final  AuthView view;
@override final  User? user;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  String? successMessage;
@override final  String? pendingEmail;

/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthViewStateCopyWith<_AuthViewState> get copyWith => __$AuthViewStateCopyWithImpl<_AuthViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthViewState&&(identical(other.view, view) || other.view == view)&&(identical(other.user, user) || other.user == user)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail));
}


@override
int get hashCode => Object.hash(runtimeType,view,user,isLoading,error,successMessage,pendingEmail);

@override
String toString() {
  return 'AuthViewState(view: $view, user: $user, isLoading: $isLoading, error: $error, successMessage: $successMessage, pendingEmail: $pendingEmail)';
}


}

/// @nodoc
abstract mixin class _$AuthViewStateCopyWith<$Res> implements $AuthViewStateCopyWith<$Res> {
  factory _$AuthViewStateCopyWith(_AuthViewState value, $Res Function(_AuthViewState) _then) = __$AuthViewStateCopyWithImpl;
@override @useResult
$Res call({
 AuthView view, User? user, bool isLoading, String? error, String? successMessage, String? pendingEmail
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthViewStateCopyWithImpl<$Res>
    implements _$AuthViewStateCopyWith<$Res> {
  __$AuthViewStateCopyWithImpl(this._self, this._then);

  final _AuthViewState _self;
  final $Res Function(_AuthViewState) _then;

/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = null,Object? user = freezed,Object? isLoading = null,Object? error = freezed,Object? successMessage = freezed,Object? pendingEmail = freezed,}) {
  return _then(_AuthViewState(
view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as AuthView,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
