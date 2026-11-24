// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

/// Profile card data (from the saved user session).
 String get fullName; String get phone;/// Messages left (shared with the home feed); `null` while unknown.
 int? get balance; AsyncValue<void> get logoutState; AsyncValue<void> get deleteAccountState;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettingsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.logoutState, _this.logoutState) || other.logoutState == _this.logoutState)&&(identical(other.deleteAccountState, _this.deleteAccountState) || other.deleteAccountState == _this.deleteAccountState));
}


@override
int get hashCode {
  final _this = this as SettingsState;
  return Object.hash(runtimeType,_this.fullName,_this.phone,_this.balance,_this.logoutState,_this.deleteAccountState);
}

@override
String toString() {
  final _this = this as SettingsState;
  return 'SettingsState(fullName: ${_this.fullName}, phone: ${_this.phone}, balance: ${_this.balance}, logoutState: ${_this.logoutState}, deleteAccountState: ${_this.deleteAccountState})';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 String fullName, String phone, int? balance, AsyncValue<void> logoutState, AsyncValue<void> deleteAccountState
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phone = null,Object? balance = freezed,Object? logoutState = null,Object? deleteAccountState = null,}) {
  return _then(SettingsState(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,logoutState: null == logoutState ? _self.logoutState : logoutState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,deleteAccountState: null == deleteAccountState ? _self.deleteAccountState : deleteAccountState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String phone,  int? balance,  AsyncValue<void> logoutState,  AsyncValue<void> deleteAccountState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.fullName,_that.phone,_that.balance,_that.logoutState,_that.deleteAccountState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String phone,  int? balance,  AsyncValue<void> logoutState,  AsyncValue<void> deleteAccountState)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.fullName,_that.phone,_that.balance,_that.logoutState,_that.deleteAccountState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String phone,  int? balance,  AsyncValue<void> logoutState,  AsyncValue<void> deleteAccountState)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.fullName,_that.phone,_that.balance,_that.logoutState,_that.deleteAccountState);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({this.fullName = '', this.phone = '', this.balance, this.logoutState = const AsyncData(null), this.deleteAccountState = const AsyncData(null)});
  

/// Profile card data (from the saved user session).
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String phone;
/// Messages left (shared with the home feed); `null` while unknown.
@override final  int? balance;
@override@JsonKey() final  AsyncValue<void> logoutState;
@override@JsonKey() final  AsyncValue<void> deleteAccountState;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.logoutState, logoutState) || other.logoutState == logoutState)&&(identical(other.deleteAccountState, deleteAccountState) || other.deleteAccountState == deleteAccountState));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fullName,phone,balance,logoutState,deleteAccountState);
}

@override
String toString() {
    return 'SettingsState(fullName: $fullName, phone: $phone, balance: $balance, logoutState: $logoutState, deleteAccountState: $deleteAccountState)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String phone, int? balance, AsyncValue<void> logoutState, AsyncValue<void> deleteAccountState
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phone = null,Object? balance = freezed,Object? logoutState = null,Object? deleteAccountState = null,}) {
  return _then(_SettingsState(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,logoutState: null == logoutState ? _self.logoutState : logoutState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,deleteAccountState: null == deleteAccountState ? _self.deleteAccountState : deleteAccountState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}


}

// dart format on
