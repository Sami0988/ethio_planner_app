// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchViewState {

 String get query; List<SearchResult> get results; bool get isLoading; String? get error;
/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchViewStateCopyWith<SearchViewState> get copyWith => _$SearchViewStateCopyWithImpl<SearchViewState>(this as SearchViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchViewState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(results),isLoading,error);

@override
String toString() {
  return 'SearchViewState(query: $query, results: $results, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchViewStateCopyWith<$Res>  {
  factory $SearchViewStateCopyWith(SearchViewState value, $Res Function(SearchViewState) _then) = _$SearchViewStateCopyWithImpl;
@useResult
$Res call({
 String query, List<SearchResult> results, bool isLoading, String? error
});




}
/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._self, this._then);

  final SearchViewState _self;
  final $Res Function(SearchViewState) _then;

/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? results = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchViewState].
extension SearchViewStatePatterns on SearchViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchViewState value)  $default,){
final _that = this;
switch (_that) {
case _SearchViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchViewState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<SearchResult> results,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchViewState() when $default != null:
return $default(_that.query,_that.results,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<SearchResult> results,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SearchViewState():
return $default(_that.query,_that.results,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<SearchResult> results,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SearchViewState() when $default != null:
return $default(_that.query,_that.results,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SearchViewState implements SearchViewState {
  const _SearchViewState({this.query = '', final  List<SearchResult> results = const [], this.isLoading = false, this.error}): _results = results;
  

@override@JsonKey() final  String query;
 final  List<SearchResult> _results;
@override@JsonKey() List<SearchResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchViewStateCopyWith<_SearchViewState> get copyWith => __$SearchViewStateCopyWithImpl<_SearchViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchViewState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_results),isLoading,error);

@override
String toString() {
  return 'SearchViewState(query: $query, results: $results, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SearchViewStateCopyWith<$Res> implements $SearchViewStateCopyWith<$Res> {
  factory _$SearchViewStateCopyWith(_SearchViewState value, $Res Function(_SearchViewState) _then) = __$SearchViewStateCopyWithImpl;
@override @useResult
$Res call({
 String query, List<SearchResult> results, bool isLoading, String? error
});




}
/// @nodoc
class __$SearchViewStateCopyWithImpl<$Res>
    implements _$SearchViewStateCopyWith<$Res> {
  __$SearchViewStateCopyWithImpl(this._self, this._then);

  final _SearchViewState _self;
  final $Res Function(_SearchViewState) _then;

/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? results = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_SearchViewState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
