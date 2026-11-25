// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuestStatsModel {

 int get confirmed;@JsonKey(name: 'no_reply') int get noReply; int get declined;@JsonKey(name: 'not_delivered') int get notDelivered;
/// Create a copy of GuestStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestStatsModelCopyWith<GuestStatsModel> get copyWith => _$GuestStatsModelCopyWithImpl<GuestStatsModel>(this as GuestStatsModel, _$identity);

  /// Serializes this GuestStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GuestStatsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestStatsModel&&(identical(other.confirmed, _this.confirmed) || other.confirmed == _this.confirmed)&&(identical(other.noReply, _this.noReply) || other.noReply == _this.noReply)&&(identical(other.declined, _this.declined) || other.declined == _this.declined)&&(identical(other.notDelivered, _this.notDelivered) || other.notDelivered == _this.notDelivered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GuestStatsModel;
  return Object.hash(runtimeType,_this.confirmed,_this.noReply,_this.declined,_this.notDelivered);
}

@override
String toString() {
  final _this = this as GuestStatsModel;
  return 'GuestStatsModel(confirmed: ${_this.confirmed}, noReply: ${_this.noReply}, declined: ${_this.declined}, notDelivered: ${_this.notDelivered})';
}


}

/// @nodoc
abstract mixin class $GuestStatsModelCopyWith<$Res>  {
  factory $GuestStatsModelCopyWith(GuestStatsModel value, $Res Function(GuestStatsModel) _then) = _$GuestStatsModelCopyWithImpl;
@useResult
$Res call({
 int confirmed,@JsonKey(name: 'no_reply') int noReply, int declined,@JsonKey(name: 'not_delivered') int notDelivered
});




}
/// @nodoc
class _$GuestStatsModelCopyWithImpl<$Res>
    implements $GuestStatsModelCopyWith<$Res> {
  _$GuestStatsModelCopyWithImpl(this._self, this._then);

  final GuestStatsModel _self;
  final $Res Function(GuestStatsModel) _then;

/// Create a copy of GuestStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? confirmed = null,Object? noReply = null,Object? declined = null,Object? notDelivered = null,}) {
  return _then(GuestStatsModel(
confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int,noReply: null == noReply ? _self.noReply : noReply // ignore: cast_nullable_to_non_nullable
as int,declined: null == declined ? _self.declined : declined // ignore: cast_nullable_to_non_nullable
as int,notDelivered: null == notDelivered ? _self.notDelivered : notDelivered // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestStatsModel].
extension GuestStatsModelPatterns on GuestStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _GuestStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _GuestStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int confirmed, @JsonKey(name: 'no_reply')  int noReply,  int declined, @JsonKey(name: 'not_delivered')  int notDelivered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestStatsModel() when $default != null:
return $default(_that.confirmed,_that.noReply,_that.declined,_that.notDelivered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int confirmed, @JsonKey(name: 'no_reply')  int noReply,  int declined, @JsonKey(name: 'not_delivered')  int notDelivered)  $default,) {final _that = this;
switch (_that) {
case _GuestStatsModel():
return $default(_that.confirmed,_that.noReply,_that.declined,_that.notDelivered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int confirmed, @JsonKey(name: 'no_reply')  int noReply,  int declined, @JsonKey(name: 'not_delivered')  int notDelivered)?  $default,) {final _that = this;
switch (_that) {
case _GuestStatsModel() when $default != null:
return $default(_that.confirmed,_that.noReply,_that.declined,_that.notDelivered);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestStatsModel implements GuestStatsModel {
  const _GuestStatsModel({this.confirmed = 0, @JsonKey(name: 'no_reply') this.noReply = 0, this.declined = 0, @JsonKey(name: 'not_delivered') this.notDelivered = 0});
  factory _GuestStatsModel.fromJson(Map<String, dynamic> json) => _$GuestStatsModelFromJson(json);

@override@JsonKey() final  int confirmed;
@override@JsonKey(name: 'no_reply') final  int noReply;
@override@JsonKey() final  int declined;
@override@JsonKey(name: 'not_delivered') final  int notDelivered;

/// Create a copy of GuestStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestStatsModelCopyWith<_GuestStatsModel> get copyWith => __$GuestStatsModelCopyWithImpl<_GuestStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestStatsModel&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.noReply, noReply) || other.noReply == noReply)&&(identical(other.declined, declined) || other.declined == declined)&&(identical(other.notDelivered, notDelivered) || other.notDelivered == notDelivered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,confirmed,noReply,declined,notDelivered);
}

@override
String toString() {
    return 'GuestStatsModel(confirmed: $confirmed, noReply: $noReply, declined: $declined, notDelivered: $notDelivered)';
}


}

/// @nodoc
abstract mixin class _$GuestStatsModelCopyWith<$Res> implements $GuestStatsModelCopyWith<$Res> {
  factory _$GuestStatsModelCopyWith(_GuestStatsModel value, $Res Function(_GuestStatsModel) _then) = __$GuestStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int confirmed,@JsonKey(name: 'no_reply') int noReply, int declined,@JsonKey(name: 'not_delivered') int notDelivered
});




}
/// @nodoc
class __$GuestStatsModelCopyWithImpl<$Res>
    implements _$GuestStatsModelCopyWith<$Res> {
  __$GuestStatsModelCopyWithImpl(this._self, this._then);

  final _GuestStatsModel _self;
  final $Res Function(_GuestStatsModel) _then;

/// Create a copy of GuestStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? confirmed = null,Object? noReply = null,Object? declined = null,Object? notDelivered = null,}) {
  return _then(_GuestStatsModel(
confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int,noReply: null == noReply ? _self.noReply : noReply // ignore: cast_nullable_to_non_nullable
as int,declined: null == declined ? _self.declined : declined // ignore: cast_nullable_to_non_nullable
as int,notDelivered: null == notDelivered ? _self.notDelivered : notDelivered // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
