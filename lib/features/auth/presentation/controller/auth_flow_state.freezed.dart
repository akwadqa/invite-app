// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFlowState {

/// National number only, without the dial code.
 String get phoneNumber; String get fullName; String get otp;/// Sign in screen "Send code". Idle when `AsyncData(null)`.
 AsyncValue<SigninResponseModel?> get sendCode;/// Create account screen "Continue". Idle when `AsyncData(null)`.
 AsyncValue<SignupResponseModel?> get createAccount;/// Verify screen "Resend code". Idle when `AsyncData(null)`.
 AsyncValue<SigninResponseModel?> get resendCode;/// Verify screen "Verify". Idle when `AsyncData(null)`.
 AsyncValue<VerifyOtpResponseModel?> get verifyOtp;
/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFlowStateCopyWith<AuthFlowState> get copyWith => _$AuthFlowStateCopyWithImpl<AuthFlowState>(this as AuthFlowState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuthFlowState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFlowState&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.otp, _this.otp) || other.otp == _this.otp)&&(identical(other.sendCode, _this.sendCode) || other.sendCode == _this.sendCode)&&(identical(other.createAccount, _this.createAccount) || other.createAccount == _this.createAccount)&&(identical(other.resendCode, _this.resendCode) || other.resendCode == _this.resendCode)&&(identical(other.verifyOtp, _this.verifyOtp) || other.verifyOtp == _this.verifyOtp));
}


@override
int get hashCode {
  final _this = this as AuthFlowState;
  return Object.hash(runtimeType,_this.phoneNumber,_this.fullName,_this.otp,_this.sendCode,_this.createAccount,_this.resendCode,_this.verifyOtp);
}

@override
String toString() {
  final _this = this as AuthFlowState;
  return 'AuthFlowState(phoneNumber: ${_this.phoneNumber}, fullName: ${_this.fullName}, otp: ${_this.otp}, sendCode: ${_this.sendCode}, createAccount: ${_this.createAccount}, resendCode: ${_this.resendCode}, verifyOtp: ${_this.verifyOtp})';
}


}

/// @nodoc
abstract mixin class $AuthFlowStateCopyWith<$Res>  {
  factory $AuthFlowStateCopyWith(AuthFlowState value, $Res Function(AuthFlowState) _then) = _$AuthFlowStateCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String fullName, String otp, AsyncValue<SigninResponseModel?> sendCode, AsyncValue<SignupResponseModel?> createAccount, AsyncValue<SigninResponseModel?> resendCode, AsyncValue<VerifyOtpResponseModel?> verifyOtp
});




}
/// @nodoc
class _$AuthFlowStateCopyWithImpl<$Res>
    implements $AuthFlowStateCopyWith<$Res> {
  _$AuthFlowStateCopyWithImpl(this._self, this._then);

  final AuthFlowState _self;
  final $Res Function(AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? fullName = null,Object? otp = null,Object? sendCode = null,Object? createAccount = null,Object? resendCode = null,Object? verifyOtp = null,}) {
  return _then(AuthFlowState(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,sendCode: null == sendCode ? _self.sendCode : sendCode // ignore: cast_nullable_to_non_nullable
as AsyncValue<SigninResponseModel?>,createAccount: null == createAccount ? _self.createAccount : createAccount // ignore: cast_nullable_to_non_nullable
as AsyncValue<SignupResponseModel?>,resendCode: null == resendCode ? _self.resendCode : resendCode // ignore: cast_nullable_to_non_nullable
as AsyncValue<SigninResponseModel?>,verifyOtp: null == verifyOtp ? _self.verifyOtp : verifyOtp // ignore: cast_nullable_to_non_nullable
as AsyncValue<VerifyOtpResponseModel?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFlowState].
extension AuthFlowStatePatterns on AuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String fullName,  String otp,  AsyncValue<SigninResponseModel?> sendCode,  AsyncValue<SignupResponseModel?> createAccount,  AsyncValue<SigninResponseModel?> resendCode,  AsyncValue<VerifyOtpResponseModel?> verifyOtp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.phoneNumber,_that.fullName,_that.otp,_that.sendCode,_that.createAccount,_that.resendCode,_that.verifyOtp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String fullName,  String otp,  AsyncValue<SigninResponseModel?> sendCode,  AsyncValue<SignupResponseModel?> createAccount,  AsyncValue<SigninResponseModel?> resendCode,  AsyncValue<VerifyOtpResponseModel?> verifyOtp)  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState():
return $default(_that.phoneNumber,_that.fullName,_that.otp,_that.sendCode,_that.createAccount,_that.resendCode,_that.verifyOtp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String fullName,  String otp,  AsyncValue<SigninResponseModel?> sendCode,  AsyncValue<SignupResponseModel?> createAccount,  AsyncValue<SigninResponseModel?> resendCode,  AsyncValue<VerifyOtpResponseModel?> verifyOtp)?  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.phoneNumber,_that.fullName,_that.otp,_that.sendCode,_that.createAccount,_that.resendCode,_that.verifyOtp);case _:
  return null;

}
}

}

/// @nodoc


class _AuthFlowState extends AuthFlowState {
  const _AuthFlowState({this.phoneNumber = '', this.fullName = '', this.otp = '', this.sendCode = const AsyncData(null), this.createAccount = const AsyncData(null), this.resendCode = const AsyncData(null), this.verifyOtp = const AsyncData(null)}): super._();
  

/// National number only, without the dial code.
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String otp;
/// Sign in screen "Send code". Idle when `AsyncData(null)`.
@override@JsonKey() final  AsyncValue<SigninResponseModel?> sendCode;
/// Create account screen "Continue". Idle when `AsyncData(null)`.
@override@JsonKey() final  AsyncValue<SignupResponseModel?> createAccount;
/// Verify screen "Resend code". Idle when `AsyncData(null)`.
@override@JsonKey() final  AsyncValue<SigninResponseModel?> resendCode;
/// Verify screen "Verify". Idle when `AsyncData(null)`.
@override@JsonKey() final  AsyncValue<VerifyOtpResponseModel?> verifyOtp;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowStateCopyWith<_AuthFlowState> get copyWith => __$AuthFlowStateCopyWithImpl<_AuthFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowState&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.sendCode, sendCode) || other.sendCode == sendCode)&&(identical(other.createAccount, createAccount) || other.createAccount == createAccount)&&(identical(other.resendCode, resendCode) || other.resendCode == resendCode)&&(identical(other.verifyOtp, verifyOtp) || other.verifyOtp == verifyOtp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,phoneNumber,fullName,otp,sendCode,createAccount,resendCode,verifyOtp);
}

@override
String toString() {
    return 'AuthFlowState(phoneNumber: $phoneNumber, fullName: $fullName, otp: $otp, sendCode: $sendCode, createAccount: $createAccount, resendCode: $resendCode, verifyOtp: $verifyOtp)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowStateCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowStateCopyWith(_AuthFlowState value, $Res Function(_AuthFlowState) _then) = __$AuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String fullName, String otp, AsyncValue<SigninResponseModel?> sendCode, AsyncValue<SignupResponseModel?> createAccount, AsyncValue<SigninResponseModel?> resendCode, AsyncValue<VerifyOtpResponseModel?> verifyOtp
});




}
/// @nodoc
class __$AuthFlowStateCopyWithImpl<$Res>
    implements _$AuthFlowStateCopyWith<$Res> {
  __$AuthFlowStateCopyWithImpl(this._self, this._then);

  final _AuthFlowState _self;
  final $Res Function(_AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? fullName = null,Object? otp = null,Object? sendCode = null,Object? createAccount = null,Object? resendCode = null,Object? verifyOtp = null,}) {
  return _then(_AuthFlowState(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,sendCode: null == sendCode ? _self.sendCode : sendCode // ignore: cast_nullable_to_non_nullable
as AsyncValue<SigninResponseModel?>,createAccount: null == createAccount ? _self.createAccount : createAccount // ignore: cast_nullable_to_non_nullable
as AsyncValue<SignupResponseModel?>,resendCode: null == resendCode ? _self.resendCode : resendCode // ignore: cast_nullable_to_non_nullable
as AsyncValue<SigninResponseModel?>,verifyOtp: null == verifyOtp ? _self.verifyOtp : verifyOtp // ignore: cast_nullable_to_non_nullable
as AsyncValue<VerifyOtpResponseModel?>,
  ));
}


}

// dart format on
