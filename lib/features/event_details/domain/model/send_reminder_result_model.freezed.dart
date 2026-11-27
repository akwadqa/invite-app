// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_reminder_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendReminderResultModel {

 String? get audience;@JsonKey(name: 'reminded_count') int? get remindedCount;@JsonKey(name: 'messages_used') int? get messagesUsed;@JsonKey(name: 'messages_left') int? get messagesLeft;
/// Create a copy of SendReminderResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendReminderResultModelCopyWith<SendReminderResultModel> get copyWith => _$SendReminderResultModelCopyWithImpl<SendReminderResultModel>(this as SendReminderResultModel, _$identity);

  /// Serializes this SendReminderResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SendReminderResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendReminderResultModel&&(identical(other.audience, _this.audience) || other.audience == _this.audience)&&(identical(other.remindedCount, _this.remindedCount) || other.remindedCount == _this.remindedCount)&&(identical(other.messagesUsed, _this.messagesUsed) || other.messagesUsed == _this.messagesUsed)&&(identical(other.messagesLeft, _this.messagesLeft) || other.messagesLeft == _this.messagesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SendReminderResultModel;
  return Object.hash(runtimeType,_this.audience,_this.remindedCount,_this.messagesUsed,_this.messagesLeft);
}

@override
String toString() {
  final _this = this as SendReminderResultModel;
  return 'SendReminderResultModel(audience: ${_this.audience}, remindedCount: ${_this.remindedCount}, messagesUsed: ${_this.messagesUsed}, messagesLeft: ${_this.messagesLeft})';
}


}

/// @nodoc
abstract mixin class $SendReminderResultModelCopyWith<$Res>  {
  factory $SendReminderResultModelCopyWith(SendReminderResultModel value, $Res Function(SendReminderResultModel) _then) = _$SendReminderResultModelCopyWithImpl;
@useResult
$Res call({
 String? audience,@JsonKey(name: 'reminded_count') int? remindedCount,@JsonKey(name: 'messages_used') int? messagesUsed,@JsonKey(name: 'messages_left') int? messagesLeft
});




}
/// @nodoc
class _$SendReminderResultModelCopyWithImpl<$Res>
    implements $SendReminderResultModelCopyWith<$Res> {
  _$SendReminderResultModelCopyWithImpl(this._self, this._then);

  final SendReminderResultModel _self;
  final $Res Function(SendReminderResultModel) _then;

/// Create a copy of SendReminderResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? audience = freezed,Object? remindedCount = freezed,Object? messagesUsed = freezed,Object? messagesLeft = freezed,}) {
  return _then(SendReminderResultModel(
audience: freezed == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as String?,remindedCount: freezed == remindedCount ? _self.remindedCount : remindedCount // ignore: cast_nullable_to_non_nullable
as int?,messagesUsed: freezed == messagesUsed ? _self.messagesUsed : messagesUsed // ignore: cast_nullable_to_non_nullable
as int?,messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendReminderResultModel].
extension SendReminderResultModelPatterns on SendReminderResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendReminderResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendReminderResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendReminderResultModel value)  $default,){
final _that = this;
switch (_that) {
case _SendReminderResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendReminderResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendReminderResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? audience, @JsonKey(name: 'reminded_count')  int? remindedCount, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendReminderResultModel() when $default != null:
return $default(_that.audience,_that.remindedCount,_that.messagesUsed,_that.messagesLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? audience, @JsonKey(name: 'reminded_count')  int? remindedCount, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)  $default,) {final _that = this;
switch (_that) {
case _SendReminderResultModel():
return $default(_that.audience,_that.remindedCount,_that.messagesUsed,_that.messagesLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? audience, @JsonKey(name: 'reminded_count')  int? remindedCount, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)?  $default,) {final _that = this;
switch (_that) {
case _SendReminderResultModel() when $default != null:
return $default(_that.audience,_that.remindedCount,_that.messagesUsed,_that.messagesLeft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendReminderResultModel implements SendReminderResultModel {
  const _SendReminderResultModel({this.audience, @JsonKey(name: 'reminded_count') this.remindedCount, @JsonKey(name: 'messages_used') this.messagesUsed, @JsonKey(name: 'messages_left') this.messagesLeft});
  factory _SendReminderResultModel.fromJson(Map<String, dynamic> json) => _$SendReminderResultModelFromJson(json);

@override final  String? audience;
@override@JsonKey(name: 'reminded_count') final  int? remindedCount;
@override@JsonKey(name: 'messages_used') final  int? messagesUsed;
@override@JsonKey(name: 'messages_left') final  int? messagesLeft;

/// Create a copy of SendReminderResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendReminderResultModelCopyWith<_SendReminderResultModel> get copyWith => __$SendReminderResultModelCopyWithImpl<_SendReminderResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendReminderResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendReminderResultModel&&(identical(other.audience, audience) || other.audience == audience)&&(identical(other.remindedCount, remindedCount) || other.remindedCount == remindedCount)&&(identical(other.messagesUsed, messagesUsed) || other.messagesUsed == messagesUsed)&&(identical(other.messagesLeft, messagesLeft) || other.messagesLeft == messagesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,audience,remindedCount,messagesUsed,messagesLeft);
}

@override
String toString() {
    return 'SendReminderResultModel(audience: $audience, remindedCount: $remindedCount, messagesUsed: $messagesUsed, messagesLeft: $messagesLeft)';
}


}

/// @nodoc
abstract mixin class _$SendReminderResultModelCopyWith<$Res> implements $SendReminderResultModelCopyWith<$Res> {
  factory _$SendReminderResultModelCopyWith(_SendReminderResultModel value, $Res Function(_SendReminderResultModel) _then) = __$SendReminderResultModelCopyWithImpl;
@override @useResult
$Res call({
 String? audience,@JsonKey(name: 'reminded_count') int? remindedCount,@JsonKey(name: 'messages_used') int? messagesUsed,@JsonKey(name: 'messages_left') int? messagesLeft
});




}
/// @nodoc
class __$SendReminderResultModelCopyWithImpl<$Res>
    implements _$SendReminderResultModelCopyWith<$Res> {
  __$SendReminderResultModelCopyWithImpl(this._self, this._then);

  final _SendReminderResultModel _self;
  final $Res Function(_SendReminderResultModel) _then;

/// Create a copy of SendReminderResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? audience = freezed,Object? remindedCount = freezed,Object? messagesUsed = freezed,Object? messagesLeft = freezed,}) {
  return _then(_SendReminderResultModel(
audience: freezed == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as String?,remindedCount: freezed == remindedCount ? _self.remindedCount : remindedCount // ignore: cast_nullable_to_non_nullable
as int?,messagesUsed: freezed == messagesUsed ? _self.messagesUsed : messagesUsed // ignore: cast_nullable_to_non_nullable
as int?,messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
