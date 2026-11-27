// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_reminder_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendReminderState {

 ReminderAudience get audience;/// Sends the reminder. A low balance settles as an error holding a
/// `NotEnoughMessagesException`.
 AsyncValue<SendReminderResultModel?> get send;
/// Create a copy of SendReminderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendReminderStateCopyWith<SendReminderState> get copyWith => _$SendReminderStateCopyWithImpl<SendReminderState>(this as SendReminderState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SendReminderState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendReminderState&&(identical(other.audience, _this.audience) || other.audience == _this.audience)&&(identical(other.send, _this.send) || other.send == _this.send));
}


@override
int get hashCode {
  final _this = this as SendReminderState;
  return Object.hash(runtimeType,_this.audience,_this.send);
}

@override
String toString() {
  final _this = this as SendReminderState;
  return 'SendReminderState(audience: ${_this.audience}, send: ${_this.send})';
}


}

/// @nodoc
abstract mixin class $SendReminderStateCopyWith<$Res>  {
  factory $SendReminderStateCopyWith(SendReminderState value, $Res Function(SendReminderState) _then) = _$SendReminderStateCopyWithImpl;
@useResult
$Res call({
 ReminderAudience audience, AsyncValue<SendReminderResultModel?> send
});




}
/// @nodoc
class _$SendReminderStateCopyWithImpl<$Res>
    implements $SendReminderStateCopyWith<$Res> {
  _$SendReminderStateCopyWithImpl(this._self, this._then);

  final SendReminderState _self;
  final $Res Function(SendReminderState) _then;

/// Create a copy of SendReminderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? audience = null,Object? send = null,}) {
  return _then(SendReminderState(
audience: null == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as ReminderAudience,send: null == send ? _self.send : send // ignore: cast_nullable_to_non_nullable
as AsyncValue<SendReminderResultModel?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SendReminderState].
extension SendReminderStatePatterns on SendReminderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendReminderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendReminderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendReminderState value)  $default,){
final _that = this;
switch (_that) {
case _SendReminderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendReminderState value)?  $default,){
final _that = this;
switch (_that) {
case _SendReminderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReminderAudience audience,  AsyncValue<SendReminderResultModel?> send)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendReminderState() when $default != null:
return $default(_that.audience,_that.send);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReminderAudience audience,  AsyncValue<SendReminderResultModel?> send)  $default,) {final _that = this;
switch (_that) {
case _SendReminderState():
return $default(_that.audience,_that.send);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReminderAudience audience,  AsyncValue<SendReminderResultModel?> send)?  $default,) {final _that = this;
switch (_that) {
case _SendReminderState() when $default != null:
return $default(_that.audience,_that.send);case _:
  return null;

}
}

}

/// @nodoc


class _SendReminderState extends SendReminderState {
  const _SendReminderState({this.audience = ReminderAudience.noReply, this.send = const AsyncData(null)}): super._();
  

@override@JsonKey() final  ReminderAudience audience;
/// Sends the reminder. A low balance settles as an error holding a
/// `NotEnoughMessagesException`.
@override@JsonKey() final  AsyncValue<SendReminderResultModel?> send;

/// Create a copy of SendReminderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendReminderStateCopyWith<_SendReminderState> get copyWith => __$SendReminderStateCopyWithImpl<_SendReminderState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendReminderState&&(identical(other.audience, audience) || other.audience == audience)&&(identical(other.send, send) || other.send == send));
}


@override
int get hashCode {
    return Object.hash(runtimeType,audience,send);
}

@override
String toString() {
    return 'SendReminderState(audience: $audience, send: $send)';
}


}

/// @nodoc
abstract mixin class _$SendReminderStateCopyWith<$Res> implements $SendReminderStateCopyWith<$Res> {
  factory _$SendReminderStateCopyWith(_SendReminderState value, $Res Function(_SendReminderState) _then) = __$SendReminderStateCopyWithImpl;
@override @useResult
$Res call({
 ReminderAudience audience, AsyncValue<SendReminderResultModel?> send
});




}
/// @nodoc
class __$SendReminderStateCopyWithImpl<$Res>
    implements _$SendReminderStateCopyWith<$Res> {
  __$SendReminderStateCopyWithImpl(this._self, this._then);

  final _SendReminderState _self;
  final $Res Function(_SendReminderState) _then;

/// Create a copy of SendReminderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? audience = null,Object? send = null,}) {
  return _then(_SendReminderState(
audience: null == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as ReminderAudience,send: null == send ? _self.send : send // ignore: cast_nullable_to_non_nullable
as AsyncValue<SendReminderResultModel?>,
  ));
}


}

// dart format on
