// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_success_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentSuccessState {

 int get messagesAdded; String get planName;/// The failed invitations are being resent now that the balance covers
/// them (shows the "Sending to N guests" step).
 bool get isSending; int get guests;/// What is left once the payment (and the resend, if any) is done;
/// `null` when the current balance is unknown, which hides the card.
 int? get balanceAfter; String? get eventId;
/// Create a copy of PaymentSuccessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentSuccessStateCopyWith<PaymentSuccessState> get copyWith => _$PaymentSuccessStateCopyWithImpl<PaymentSuccessState>(this as PaymentSuccessState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentSuccessState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentSuccessState&&(identical(other.messagesAdded, _this.messagesAdded) || other.messagesAdded == _this.messagesAdded)&&(identical(other.planName, _this.planName) || other.planName == _this.planName)&&(identical(other.isSending, _this.isSending) || other.isSending == _this.isSending)&&(identical(other.guests, _this.guests) || other.guests == _this.guests)&&(identical(other.balanceAfter, _this.balanceAfter) || other.balanceAfter == _this.balanceAfter)&&(identical(other.eventId, _this.eventId) || other.eventId == _this.eventId));
}


@override
int get hashCode {
  final _this = this as PaymentSuccessState;
  return Object.hash(runtimeType,_this.messagesAdded,_this.planName,_this.isSending,_this.guests,_this.balanceAfter,_this.eventId);
}

@override
String toString() {
  final _this = this as PaymentSuccessState;
  return 'PaymentSuccessState(messagesAdded: ${_this.messagesAdded}, planName: ${_this.planName}, isSending: ${_this.isSending}, guests: ${_this.guests}, balanceAfter: ${_this.balanceAfter}, eventId: ${_this.eventId})';
}


}

/// @nodoc
abstract mixin class $PaymentSuccessStateCopyWith<$Res>  {
  factory $PaymentSuccessStateCopyWith(PaymentSuccessState value, $Res Function(PaymentSuccessState) _then) = _$PaymentSuccessStateCopyWithImpl;
@useResult
$Res call({
 int messagesAdded, String planName, bool isSending, int guests, int? balanceAfter, String? eventId
});




}
/// @nodoc
class _$PaymentSuccessStateCopyWithImpl<$Res>
    implements $PaymentSuccessStateCopyWith<$Res> {
  _$PaymentSuccessStateCopyWithImpl(this._self, this._then);

  final PaymentSuccessState _self;
  final $Res Function(PaymentSuccessState) _then;

/// Create a copy of PaymentSuccessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messagesAdded = null,Object? planName = null,Object? isSending = null,Object? guests = null,Object? balanceAfter = freezed,Object? eventId = freezed,}) {
  return _then(PaymentSuccessState(
messagesAdded: null == messagesAdded ? _self.messagesAdded : messagesAdded // ignore: cast_nullable_to_non_nullable
as int,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentSuccessState].
extension PaymentSuccessStatePatterns on PaymentSuccessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentSuccessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentSuccessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentSuccessState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentSuccessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentSuccessState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentSuccessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int messagesAdded,  String planName,  bool isSending,  int guests,  int? balanceAfter,  String? eventId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentSuccessState() when $default != null:
return $default(_that.messagesAdded,_that.planName,_that.isSending,_that.guests,_that.balanceAfter,_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int messagesAdded,  String planName,  bool isSending,  int guests,  int? balanceAfter,  String? eventId)  $default,) {final _that = this;
switch (_that) {
case _PaymentSuccessState():
return $default(_that.messagesAdded,_that.planName,_that.isSending,_that.guests,_that.balanceAfter,_that.eventId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int messagesAdded,  String planName,  bool isSending,  int guests,  int? balanceAfter,  String? eventId)?  $default,) {final _that = this;
switch (_that) {
case _PaymentSuccessState() when $default != null:
return $default(_that.messagesAdded,_that.planName,_that.isSending,_that.guests,_that.balanceAfter,_that.eventId);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentSuccessState implements PaymentSuccessState {
  const _PaymentSuccessState({this.messagesAdded = 0, this.planName = '', this.isSending = false, this.guests = 0, this.balanceAfter, this.eventId});
  

@override@JsonKey() final  int messagesAdded;
@override@JsonKey() final  String planName;
/// The failed invitations are being resent now that the balance covers
/// them (shows the "Sending to N guests" step).
@override@JsonKey() final  bool isSending;
@override@JsonKey() final  int guests;
/// What is left once the payment (and the resend, if any) is done;
/// `null` when the current balance is unknown, which hides the card.
@override final  int? balanceAfter;
@override final  String? eventId;

/// Create a copy of PaymentSuccessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentSuccessStateCopyWith<_PaymentSuccessState> get copyWith => __$PaymentSuccessStateCopyWithImpl<_PaymentSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentSuccessState&&(identical(other.messagesAdded, messagesAdded) || other.messagesAdded == messagesAdded)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,messagesAdded,planName,isSending,guests,balanceAfter,eventId);
}

@override
String toString() {
    return 'PaymentSuccessState(messagesAdded: $messagesAdded, planName: $planName, isSending: $isSending, guests: $guests, balanceAfter: $balanceAfter, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$PaymentSuccessStateCopyWith<$Res> implements $PaymentSuccessStateCopyWith<$Res> {
  factory _$PaymentSuccessStateCopyWith(_PaymentSuccessState value, $Res Function(_PaymentSuccessState) _then) = __$PaymentSuccessStateCopyWithImpl;
@override @useResult
$Res call({
 int messagesAdded, String planName, bool isSending, int guests, int? balanceAfter, String? eventId
});




}
/// @nodoc
class __$PaymentSuccessStateCopyWithImpl<$Res>
    implements _$PaymentSuccessStateCopyWith<$Res> {
  __$PaymentSuccessStateCopyWithImpl(this._self, this._then);

  final _PaymentSuccessState _self;
  final $Res Function(_PaymentSuccessState) _then;

/// Create a copy of PaymentSuccessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messagesAdded = null,Object? planName = null,Object? isSending = null,Object? guests = null,Object? balanceAfter = freezed,Object? eventId = freezed,}) {
  return _then(_PaymentSuccessState(
messagesAdded: null == messagesAdded ? _self.messagesAdded : messagesAdded // ignore: cast_nullable_to_non_nullable
as int,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
