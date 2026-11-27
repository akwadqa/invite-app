// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_invitation_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResendInvitationResultModel {

@JsonKey(name: 'invitee_id') String? get inviteeId;@JsonKey(name: 'messages_used') int? get messagesUsed;@JsonKey(name: 'messages_left') int? get messagesLeft;
/// Create a copy of ResendInvitationResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendInvitationResultModelCopyWith<ResendInvitationResultModel> get copyWith => _$ResendInvitationResultModelCopyWithImpl<ResendInvitationResultModel>(this as ResendInvitationResultModel, _$identity);

  /// Serializes this ResendInvitationResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResendInvitationResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendInvitationResultModel&&(identical(other.inviteeId, _this.inviteeId) || other.inviteeId == _this.inviteeId)&&(identical(other.messagesUsed, _this.messagesUsed) || other.messagesUsed == _this.messagesUsed)&&(identical(other.messagesLeft, _this.messagesLeft) || other.messagesLeft == _this.messagesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResendInvitationResultModel;
  return Object.hash(runtimeType,_this.inviteeId,_this.messagesUsed,_this.messagesLeft);
}

@override
String toString() {
  final _this = this as ResendInvitationResultModel;
  return 'ResendInvitationResultModel(inviteeId: ${_this.inviteeId}, messagesUsed: ${_this.messagesUsed}, messagesLeft: ${_this.messagesLeft})';
}


}

/// @nodoc
abstract mixin class $ResendInvitationResultModelCopyWith<$Res>  {
  factory $ResendInvitationResultModelCopyWith(ResendInvitationResultModel value, $Res Function(ResendInvitationResultModel) _then) = _$ResendInvitationResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invitee_id') String? inviteeId,@JsonKey(name: 'messages_used') int? messagesUsed,@JsonKey(name: 'messages_left') int? messagesLeft
});




}
/// @nodoc
class _$ResendInvitationResultModelCopyWithImpl<$Res>
    implements $ResendInvitationResultModelCopyWith<$Res> {
  _$ResendInvitationResultModelCopyWithImpl(this._self, this._then);

  final ResendInvitationResultModel _self;
  final $Res Function(ResendInvitationResultModel) _then;

/// Create a copy of ResendInvitationResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteeId = freezed,Object? messagesUsed = freezed,Object? messagesLeft = freezed,}) {
  return _then(ResendInvitationResultModel(
inviteeId: freezed == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String?,messagesUsed: freezed == messagesUsed ? _self.messagesUsed : messagesUsed // ignore: cast_nullable_to_non_nullable
as int?,messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResendInvitationResultModel].
extension ResendInvitationResultModelPatterns on ResendInvitationResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResendInvitationResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResendInvitationResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResendInvitationResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ResendInvitationResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResendInvitationResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResendInvitationResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String? inviteeId, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResendInvitationResultModel() when $default != null:
return $default(_that.inviteeId,_that.messagesUsed,_that.messagesLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String? inviteeId, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)  $default,) {final _that = this;
switch (_that) {
case _ResendInvitationResultModel():
return $default(_that.inviteeId,_that.messagesUsed,_that.messagesLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invitee_id')  String? inviteeId, @JsonKey(name: 'messages_used')  int? messagesUsed, @JsonKey(name: 'messages_left')  int? messagesLeft)?  $default,) {final _that = this;
switch (_that) {
case _ResendInvitationResultModel() when $default != null:
return $default(_that.inviteeId,_that.messagesUsed,_that.messagesLeft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResendInvitationResultModel implements ResendInvitationResultModel {
  const _ResendInvitationResultModel({@JsonKey(name: 'invitee_id') this.inviteeId, @JsonKey(name: 'messages_used') this.messagesUsed, @JsonKey(name: 'messages_left') this.messagesLeft});
  factory _ResendInvitationResultModel.fromJson(Map<String, dynamic> json) => _$ResendInvitationResultModelFromJson(json);

@override@JsonKey(name: 'invitee_id') final  String? inviteeId;
@override@JsonKey(name: 'messages_used') final  int? messagesUsed;
@override@JsonKey(name: 'messages_left') final  int? messagesLeft;

/// Create a copy of ResendInvitationResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendInvitationResultModelCopyWith<_ResendInvitationResultModel> get copyWith => __$ResendInvitationResultModelCopyWithImpl<_ResendInvitationResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResendInvitationResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendInvitationResultModel&&(identical(other.inviteeId, inviteeId) || other.inviteeId == inviteeId)&&(identical(other.messagesUsed, messagesUsed) || other.messagesUsed == messagesUsed)&&(identical(other.messagesLeft, messagesLeft) || other.messagesLeft == messagesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,inviteeId,messagesUsed,messagesLeft);
}

@override
String toString() {
    return 'ResendInvitationResultModel(inviteeId: $inviteeId, messagesUsed: $messagesUsed, messagesLeft: $messagesLeft)';
}


}

/// @nodoc
abstract mixin class _$ResendInvitationResultModelCopyWith<$Res> implements $ResendInvitationResultModelCopyWith<$Res> {
  factory _$ResendInvitationResultModelCopyWith(_ResendInvitationResultModel value, $Res Function(_ResendInvitationResultModel) _then) = __$ResendInvitationResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invitee_id') String? inviteeId,@JsonKey(name: 'messages_used') int? messagesUsed,@JsonKey(name: 'messages_left') int? messagesLeft
});




}
/// @nodoc
class __$ResendInvitationResultModelCopyWithImpl<$Res>
    implements _$ResendInvitationResultModelCopyWith<$Res> {
  __$ResendInvitationResultModelCopyWithImpl(this._self, this._then);

  final _ResendInvitationResultModel _self;
  final $Res Function(_ResendInvitationResultModel) _then;

/// Create a copy of ResendInvitationResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteeId = freezed,Object? messagesUsed = freezed,Object? messagesLeft = freezed,}) {
  return _then(_ResendInvitationResultModel(
inviteeId: freezed == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String?,messagesUsed: freezed == messagesUsed ? _self.messagesUsed : messagesUsed // ignore: cast_nullable_to_non_nullable
as int?,messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
