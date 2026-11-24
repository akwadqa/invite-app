// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_guest_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FindGuestState {

/// Text typed in the search field; empty lists every guest.
 String get query;
/// Create a copy of FindGuestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FindGuestStateCopyWith<FindGuestState> get copyWith => _$FindGuestStateCopyWithImpl<FindGuestState>(this as FindGuestState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FindGuestState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FindGuestState&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as FindGuestState;
  return Object.hash(runtimeType,_this.query);
}

@override
String toString() {
  final _this = this as FindGuestState;
  return 'FindGuestState(query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $FindGuestStateCopyWith<$Res>  {
  factory $FindGuestStateCopyWith(FindGuestState value, $Res Function(FindGuestState) _then) = _$FindGuestStateCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$FindGuestStateCopyWithImpl<$Res>
    implements $FindGuestStateCopyWith<$Res> {
  _$FindGuestStateCopyWithImpl(this._self, this._then);

  final FindGuestState _self;
  final $Res Function(FindGuestState) _then;

/// Create a copy of FindGuestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(FindGuestState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FindGuestState].
extension FindGuestStatePatterns on FindGuestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FindGuestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FindGuestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FindGuestState value)  $default,){
final _that = this;
switch (_that) {
case _FindGuestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FindGuestState value)?  $default,){
final _that = this;
switch (_that) {
case _FindGuestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FindGuestState() when $default != null:
return $default(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query)  $default,) {final _that = this;
switch (_that) {
case _FindGuestState():
return $default(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query)?  $default,) {final _that = this;
switch (_that) {
case _FindGuestState() when $default != null:
return $default(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _FindGuestState implements FindGuestState {
  const _FindGuestState({this.query = ''});
  

/// Text typed in the search field; empty lists every guest.
@override@JsonKey() final  String query;

/// Create a copy of FindGuestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FindGuestStateCopyWith<_FindGuestState> get copyWith => __$FindGuestStateCopyWithImpl<_FindGuestState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FindGuestState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'FindGuestState(query: $query)';
}


}

/// @nodoc
abstract mixin class _$FindGuestStateCopyWith<$Res> implements $FindGuestStateCopyWith<$Res> {
  factory _$FindGuestStateCopyWith(_FindGuestState value, $Res Function(_FindGuestState) _then) = __$FindGuestStateCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class __$FindGuestStateCopyWithImpl<$Res>
    implements _$FindGuestStateCopyWith<$Res> {
  __$FindGuestStateCopyWithImpl(this._self, this._then);

  final _FindGuestState _self;
  final $Res Function(_FindGuestState) _then;

/// Create a copy of FindGuestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_FindGuestState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
