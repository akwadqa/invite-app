// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recharge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RechargeState {

 List<RechargePlan> get plans; int get balance;/// Messages the user's action needs; `0` when opened from the balance.
 int get needed; String? get selectedPlanId;
/// Create a copy of RechargeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RechargeStateCopyWith<RechargeState> get copyWith => _$RechargeStateCopyWithImpl<RechargeState>(this as RechargeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RechargeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RechargeState&&const DeepCollectionEquality().equals(other.plans, _this.plans)&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.needed, _this.needed) || other.needed == _this.needed)&&(identical(other.selectedPlanId, _this.selectedPlanId) || other.selectedPlanId == _this.selectedPlanId));
}


@override
int get hashCode {
  final _this = this as RechargeState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.plans),_this.balance,_this.needed,_this.selectedPlanId);
}

@override
String toString() {
  final _this = this as RechargeState;
  return 'RechargeState(plans: ${_this.plans}, balance: ${_this.balance}, needed: ${_this.needed}, selectedPlanId: ${_this.selectedPlanId})';
}


}

/// @nodoc
abstract mixin class $RechargeStateCopyWith<$Res>  {
  factory $RechargeStateCopyWith(RechargeState value, $Res Function(RechargeState) _then) = _$RechargeStateCopyWithImpl;
@useResult
$Res call({
 List<RechargePlan> plans, int balance, int needed, String? selectedPlanId
});




}
/// @nodoc
class _$RechargeStateCopyWithImpl<$Res>
    implements $RechargeStateCopyWith<$Res> {
  _$RechargeStateCopyWithImpl(this._self, this._then);

  final RechargeState _self;
  final $Res Function(RechargeState) _then;

/// Create a copy of RechargeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plans = null,Object? balance = null,Object? needed = null,Object? selectedPlanId = freezed,}) {
  return _then(RechargeState(
plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<RechargePlan>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,needed: null == needed ? _self.needed : needed // ignore: cast_nullable_to_non_nullable
as int,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RechargeState].
extension RechargeStatePatterns on RechargeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RechargeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RechargeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RechargeState value)  $default,){
final _that = this;
switch (_that) {
case _RechargeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RechargeState value)?  $default,){
final _that = this;
switch (_that) {
case _RechargeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RechargePlan> plans,  int balance,  int needed,  String? selectedPlanId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RechargeState() when $default != null:
return $default(_that.plans,_that.balance,_that.needed,_that.selectedPlanId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RechargePlan> plans,  int balance,  int needed,  String? selectedPlanId)  $default,) {final _that = this;
switch (_that) {
case _RechargeState():
return $default(_that.plans,_that.balance,_that.needed,_that.selectedPlanId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RechargePlan> plans,  int balance,  int needed,  String? selectedPlanId)?  $default,) {final _that = this;
switch (_that) {
case _RechargeState() when $default != null:
return $default(_that.plans,_that.balance,_that.needed,_that.selectedPlanId);case _:
  return null;

}
}

}

/// @nodoc


class _RechargeState implements RechargeState {
  const _RechargeState({ List<RechargePlan> plans = const <RechargePlan>[], this.balance = 0, this.needed = 0, this.selectedPlanId}): _plans = plans;
  

 final  List<RechargePlan> _plans;
@override@JsonKey() List<RechargePlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override@JsonKey() final  int balance;
/// Messages the user's action needs; `0` when opened from the balance.
@override@JsonKey() final  int needed;
@override final  String? selectedPlanId;

/// Create a copy of RechargeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RechargeStateCopyWith<_RechargeState> get copyWith => __$RechargeStateCopyWithImpl<_RechargeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RechargeState&&const DeepCollectionEquality().equals(other.plans, _plans)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.needed, needed) || other.needed == needed)&&(identical(other.selectedPlanId, selectedPlanId) || other.selectedPlanId == selectedPlanId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),balance,needed,selectedPlanId);
}

@override
String toString() {
    return 'RechargeState(plans: $plans, balance: $balance, needed: $needed, selectedPlanId: $selectedPlanId)';
}


}

/// @nodoc
abstract mixin class _$RechargeStateCopyWith<$Res> implements $RechargeStateCopyWith<$Res> {
  factory _$RechargeStateCopyWith(_RechargeState value, $Res Function(_RechargeState) _then) = __$RechargeStateCopyWithImpl;
@override @useResult
$Res call({
 List<RechargePlan> plans, int balance, int needed, String? selectedPlanId
});




}
/// @nodoc
class __$RechargeStateCopyWithImpl<$Res>
    implements _$RechargeStateCopyWith<$Res> {
  __$RechargeStateCopyWithImpl(this._self, this._then);

  final _RechargeState _self;
  final $Res Function(_RechargeState) _then;

/// Create a copy of RechargeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? balance = null,Object? needed = null,Object? selectedPlanId = freezed,}) {
  return _then(_RechargeState(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<RechargePlan>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,needed: null == needed ? _self.needed : needed // ignore: cast_nullable_to_non_nullable
as int,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
