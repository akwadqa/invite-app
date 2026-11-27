// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_actions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventDetailsActionsState {

/// Sends a draft event's invitations.
 AsyncValue<bool?> get sendInvitations;/// Resends the invitations that were not delivered.
 AsyncValue<RetryBulkResponse?> get resendFailed;/// Resends one guest's invitation.
 AsyncValue<ResendInvitationResultModel?> get resendInvitation;/// Removes one guest from the event.
 AsyncValue<String?> get removeGuest;
/// Create a copy of EventDetailsActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDetailsActionsStateCopyWith<EventDetailsActionsState> get copyWith => _$EventDetailsActionsStateCopyWithImpl<EventDetailsActionsState>(this as EventDetailsActionsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EventDetailsActionsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetailsActionsState&&(identical(other.sendInvitations, _this.sendInvitations) || other.sendInvitations == _this.sendInvitations)&&(identical(other.resendFailed, _this.resendFailed) || other.resendFailed == _this.resendFailed)&&(identical(other.resendInvitation, _this.resendInvitation) || other.resendInvitation == _this.resendInvitation)&&(identical(other.removeGuest, _this.removeGuest) || other.removeGuest == _this.removeGuest));
}


@override
int get hashCode {
  final _this = this as EventDetailsActionsState;
  return Object.hash(runtimeType,_this.sendInvitations,_this.resendFailed,_this.resendInvitation,_this.removeGuest);
}

@override
String toString() {
  final _this = this as EventDetailsActionsState;
  return 'EventDetailsActionsState(sendInvitations: ${_this.sendInvitations}, resendFailed: ${_this.resendFailed}, resendInvitation: ${_this.resendInvitation}, removeGuest: ${_this.removeGuest})';
}


}

/// @nodoc
abstract mixin class $EventDetailsActionsStateCopyWith<$Res>  {
  factory $EventDetailsActionsStateCopyWith(EventDetailsActionsState value, $Res Function(EventDetailsActionsState) _then) = _$EventDetailsActionsStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<bool?> sendInvitations, AsyncValue<RetryBulkResponse?> resendFailed, AsyncValue<ResendInvitationResultModel?> resendInvitation, AsyncValue<String?> removeGuest
});




}
/// @nodoc
class _$EventDetailsActionsStateCopyWithImpl<$Res>
    implements $EventDetailsActionsStateCopyWith<$Res> {
  _$EventDetailsActionsStateCopyWithImpl(this._self, this._then);

  final EventDetailsActionsState _self;
  final $Res Function(EventDetailsActionsState) _then;

/// Create a copy of EventDetailsActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sendInvitations = null,Object? resendFailed = null,Object? resendInvitation = null,Object? removeGuest = null,}) {
  return _then(EventDetailsActionsState(
sendInvitations: null == sendInvitations ? _self.sendInvitations : sendInvitations // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool?>,resendFailed: null == resendFailed ? _self.resendFailed : resendFailed // ignore: cast_nullable_to_non_nullable
as AsyncValue<RetryBulkResponse?>,resendInvitation: null == resendInvitation ? _self.resendInvitation : resendInvitation // ignore: cast_nullable_to_non_nullable
as AsyncValue<ResendInvitationResultModel?>,removeGuest: null == removeGuest ? _self.removeGuest : removeGuest // ignore: cast_nullable_to_non_nullable
as AsyncValue<String?>,
  ));
}

}


/// Adds pattern-matching-related methods to [EventDetailsActionsState].
extension EventDetailsActionsStatePatterns on EventDetailsActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDetailsActionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDetailsActionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDetailsActionsState value)  $default,){
final _that = this;
switch (_that) {
case _EventDetailsActionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDetailsActionsState value)?  $default,){
final _that = this;
switch (_that) {
case _EventDetailsActionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncValue<bool?> sendInvitations,  AsyncValue<RetryBulkResponse?> resendFailed,  AsyncValue<ResendInvitationResultModel?> resendInvitation,  AsyncValue<String?> removeGuest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDetailsActionsState() when $default != null:
return $default(_that.sendInvitations,_that.resendFailed,_that.resendInvitation,_that.removeGuest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncValue<bool?> sendInvitations,  AsyncValue<RetryBulkResponse?> resendFailed,  AsyncValue<ResendInvitationResultModel?> resendInvitation,  AsyncValue<String?> removeGuest)  $default,) {final _that = this;
switch (_that) {
case _EventDetailsActionsState():
return $default(_that.sendInvitations,_that.resendFailed,_that.resendInvitation,_that.removeGuest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncValue<bool?> sendInvitations,  AsyncValue<RetryBulkResponse?> resendFailed,  AsyncValue<ResendInvitationResultModel?> resendInvitation,  AsyncValue<String?> removeGuest)?  $default,) {final _that = this;
switch (_that) {
case _EventDetailsActionsState() when $default != null:
return $default(_that.sendInvitations,_that.resendFailed,_that.resendInvitation,_that.removeGuest);case _:
  return null;

}
}

}

/// @nodoc


class _EventDetailsActionsState implements EventDetailsActionsState {
  const _EventDetailsActionsState({this.sendInvitations = const AsyncData(null), this.resendFailed = const AsyncData(null), this.resendInvitation = const AsyncData(null), this.removeGuest = const AsyncData(null)});
  

/// Sends a draft event's invitations.
@override@JsonKey() final  AsyncValue<bool?> sendInvitations;
/// Resends the invitations that were not delivered.
@override@JsonKey() final  AsyncValue<RetryBulkResponse?> resendFailed;
/// Resends one guest's invitation.
@override@JsonKey() final  AsyncValue<ResendInvitationResultModel?> resendInvitation;
/// Removes one guest from the event.
@override@JsonKey() final  AsyncValue<String?> removeGuest;

/// Create a copy of EventDetailsActionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDetailsActionsStateCopyWith<_EventDetailsActionsState> get copyWith => __$EventDetailsActionsStateCopyWithImpl<_EventDetailsActionsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDetailsActionsState&&(identical(other.sendInvitations, sendInvitations) || other.sendInvitations == sendInvitations)&&(identical(other.resendFailed, resendFailed) || other.resendFailed == resendFailed)&&(identical(other.resendInvitation, resendInvitation) || other.resendInvitation == resendInvitation)&&(identical(other.removeGuest, removeGuest) || other.removeGuest == removeGuest));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sendInvitations,resendFailed,resendInvitation,removeGuest);
}

@override
String toString() {
    return 'EventDetailsActionsState(sendInvitations: $sendInvitations, resendFailed: $resendFailed, resendInvitation: $resendInvitation, removeGuest: $removeGuest)';
}


}

/// @nodoc
abstract mixin class _$EventDetailsActionsStateCopyWith<$Res> implements $EventDetailsActionsStateCopyWith<$Res> {
  factory _$EventDetailsActionsStateCopyWith(_EventDetailsActionsState value, $Res Function(_EventDetailsActionsState) _then) = __$EventDetailsActionsStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<bool?> sendInvitations, AsyncValue<RetryBulkResponse?> resendFailed, AsyncValue<ResendInvitationResultModel?> resendInvitation, AsyncValue<String?> removeGuest
});




}
/// @nodoc
class __$EventDetailsActionsStateCopyWithImpl<$Res>
    implements _$EventDetailsActionsStateCopyWith<$Res> {
  __$EventDetailsActionsStateCopyWithImpl(this._self, this._then);

  final _EventDetailsActionsState _self;
  final $Res Function(_EventDetailsActionsState) _then;

/// Create a copy of EventDetailsActionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sendInvitations = null,Object? resendFailed = null,Object? resendInvitation = null,Object? removeGuest = null,}) {
  return _then(_EventDetailsActionsState(
sendInvitations: null == sendInvitations ? _self.sendInvitations : sendInvitations // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool?>,resendFailed: null == resendFailed ? _self.resendFailed : resendFailed // ignore: cast_nullable_to_non_nullable
as AsyncValue<RetryBulkResponse?>,resendInvitation: null == resendInvitation ? _self.resendInvitation : resendInvitation // ignore: cast_nullable_to_non_nullable
as AsyncValue<ResendInvitationResultModel?>,removeGuest: null == removeGuest ? _self.removeGuest : removeGuest // ignore: cast_nullable_to_non_nullable
as AsyncValue<String?>,
  ));
}


}

// dart format on
