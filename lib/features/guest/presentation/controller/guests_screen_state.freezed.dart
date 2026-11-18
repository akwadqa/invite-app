// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guests_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuestsScreenState {

 String get query;/// `null` shows every guest.
 GuestReplyStatus? get filter;
/// Create a copy of GuestsScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestsScreenStateCopyWith<GuestsScreenState> get copyWith => _$GuestsScreenStateCopyWithImpl<GuestsScreenState>(this as GuestsScreenState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GuestsScreenState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestsScreenState&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.filter, _this.filter) || other.filter == _this.filter));
}


@override
int get hashCode {
  final _this = this as GuestsScreenState;
  return Object.hash(runtimeType,_this.query,_this.filter);
}

@override
String toString() {
  final _this = this as GuestsScreenState;
  return 'GuestsScreenState(query: ${_this.query}, filter: ${_this.filter})';
}


}

/// @nodoc
abstract mixin class $GuestsScreenStateCopyWith<$Res>  {
  factory $GuestsScreenStateCopyWith(GuestsScreenState value, $Res Function(GuestsScreenState) _then) = _$GuestsScreenStateCopyWithImpl;
@useResult
$Res call({
 String query, GuestReplyStatus? filter
});




}
/// @nodoc
class _$GuestsScreenStateCopyWithImpl<$Res>
    implements $GuestsScreenStateCopyWith<$Res> {
  _$GuestsScreenStateCopyWithImpl(this._self, this._then);

  final GuestsScreenState _self;
  final $Res Function(GuestsScreenState) _then;

/// Create a copy of GuestsScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? filter = freezed,}) {
  return _then(GuestsScreenState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as GuestReplyStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestsScreenState].
extension GuestsScreenStatePatterns on GuestsScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestsScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestsScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestsScreenState value)  $default,){
final _that = this;
switch (_that) {
case _GuestsScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestsScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _GuestsScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  GuestReplyStatus? filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestsScreenState() when $default != null:
return $default(_that.query,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  GuestReplyStatus? filter)  $default,) {final _that = this;
switch (_that) {
case _GuestsScreenState():
return $default(_that.query,_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  GuestReplyStatus? filter)?  $default,) {final _that = this;
switch (_that) {
case _GuestsScreenState() when $default != null:
return $default(_that.query,_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _GuestsScreenState implements GuestsScreenState {
  const _GuestsScreenState({this.query = '', this.filter});
  

@override@JsonKey() final  String query;
/// `null` shows every guest.
@override final  GuestReplyStatus? filter;

/// Create a copy of GuestsScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestsScreenStateCopyWith<_GuestsScreenState> get copyWith => __$GuestsScreenStateCopyWithImpl<_GuestsScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestsScreenState&&(identical(other.query, query) || other.query == query)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,filter);
}

@override
String toString() {
    return 'GuestsScreenState(query: $query, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$GuestsScreenStateCopyWith<$Res> implements $GuestsScreenStateCopyWith<$Res> {
  factory _$GuestsScreenStateCopyWith(_GuestsScreenState value, $Res Function(_GuestsScreenState) _then) = __$GuestsScreenStateCopyWithImpl;
@override @useResult
$Res call({
 String query, GuestReplyStatus? filter
});




}
/// @nodoc
class __$GuestsScreenStateCopyWithImpl<$Res>
    implements _$GuestsScreenStateCopyWith<$Res> {
  __$GuestsScreenStateCopyWithImpl(this._self, this._then);

  final _GuestsScreenState _self;
  final $Res Function(_GuestsScreenState) _then;

/// Create a copy of GuestsScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? filter = freezed,}) {
  return _then(_GuestsScreenState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as GuestReplyStatus?,
  ));
}


}

// dart format on
