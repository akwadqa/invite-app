// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_guest_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditGuestState {

/// Country code of the guest's number, without the `+`.
 String get dialCode; String get name;/// The number without its country code, digits only.
 String get phone;/// The chip selected (the last one means "5+", typed in [customSeats]).
 int get seats; String get customSeats;
/// Create a copy of EditGuestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditGuestStateCopyWith<EditGuestState> get copyWith => _$EditGuestStateCopyWithImpl<EditGuestState>(this as EditGuestState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EditGuestState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditGuestState&&(identical(other.dialCode, _this.dialCode) || other.dialCode == _this.dialCode)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.seats, _this.seats) || other.seats == _this.seats)&&(identical(other.customSeats, _this.customSeats) || other.customSeats == _this.customSeats));
}


@override
int get hashCode {
  final _this = this as EditGuestState;
  return Object.hash(runtimeType,_this.dialCode,_this.name,_this.phone,_this.seats,_this.customSeats);
}

@override
String toString() {
  final _this = this as EditGuestState;
  return 'EditGuestState(dialCode: ${_this.dialCode}, name: ${_this.name}, phone: ${_this.phone}, seats: ${_this.seats}, customSeats: ${_this.customSeats})';
}


}

/// @nodoc
abstract mixin class $EditGuestStateCopyWith<$Res>  {
  factory $EditGuestStateCopyWith(EditGuestState value, $Res Function(EditGuestState) _then) = _$EditGuestStateCopyWithImpl;
@useResult
$Res call({
 String dialCode, String name, String phone, int seats, String customSeats
});




}
/// @nodoc
class _$EditGuestStateCopyWithImpl<$Res>
    implements $EditGuestStateCopyWith<$Res> {
  _$EditGuestStateCopyWithImpl(this._self, this._then);

  final EditGuestState _self;
  final $Res Function(EditGuestState) _then;

/// Create a copy of EditGuestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dialCode = null,Object? name = null,Object? phone = null,Object? seats = null,Object? customSeats = null,}) {
  return _then(EditGuestState(
dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,customSeats: null == customSeats ? _self.customSeats : customSeats // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EditGuestState].
extension EditGuestStatePatterns on EditGuestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditGuestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditGuestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditGuestState value)  $default,){
final _that = this;
switch (_that) {
case _EditGuestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditGuestState value)?  $default,){
final _that = this;
switch (_that) {
case _EditGuestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dialCode,  String name,  String phone,  int seats,  String customSeats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditGuestState() when $default != null:
return $default(_that.dialCode,_that.name,_that.phone,_that.seats,_that.customSeats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dialCode,  String name,  String phone,  int seats,  String customSeats)  $default,) {final _that = this;
switch (_that) {
case _EditGuestState():
return $default(_that.dialCode,_that.name,_that.phone,_that.seats,_that.customSeats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dialCode,  String name,  String phone,  int seats,  String customSeats)?  $default,) {final _that = this;
switch (_that) {
case _EditGuestState() when $default != null:
return $default(_that.dialCode,_that.name,_that.phone,_that.seats,_that.customSeats);case _:
  return null;

}
}

}

/// @nodoc


class _EditGuestState implements EditGuestState {
  const _EditGuestState({this.dialCode = AuthFlowConstants.qatarDialCode, this.name = '', this.phone = '', this.seats = CreateEventFlowConstants.defaultSeats, this.customSeats = ''});
  

/// Country code of the guest's number, without the `+`.
@override@JsonKey() final  String dialCode;
@override@JsonKey() final  String name;
/// The number without its country code, digits only.
@override@JsonKey() final  String phone;
/// The chip selected (the last one means "5+", typed in [customSeats]).
@override@JsonKey() final  int seats;
@override@JsonKey() final  String customSeats;

/// Create a copy of EditGuestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditGuestStateCopyWith<_EditGuestState> get copyWith => __$EditGuestStateCopyWithImpl<_EditGuestState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditGuestState&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.customSeats, customSeats) || other.customSeats == customSeats));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dialCode,name,phone,seats,customSeats);
}

@override
String toString() {
    return 'EditGuestState(dialCode: $dialCode, name: $name, phone: $phone, seats: $seats, customSeats: $customSeats)';
}


}

/// @nodoc
abstract mixin class _$EditGuestStateCopyWith<$Res> implements $EditGuestStateCopyWith<$Res> {
  factory _$EditGuestStateCopyWith(_EditGuestState value, $Res Function(_EditGuestState) _then) = __$EditGuestStateCopyWithImpl;
@override @useResult
$Res call({
 String dialCode, String name, String phone, int seats, String customSeats
});




}
/// @nodoc
class __$EditGuestStateCopyWithImpl<$Res>
    implements _$EditGuestStateCopyWith<$Res> {
  __$EditGuestStateCopyWithImpl(this._self, this._then);

  final _EditGuestState _self;
  final $Res Function(_EditGuestState) _then;

/// Create a copy of EditGuestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dialCode = null,Object? name = null,Object? phone = null,Object? seats = null,Object? customSeats = null,}) {
  return _then(_EditGuestState(
dialCode: null == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,customSeats: null == customSeats ? _self.customSeats : customSeats // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
