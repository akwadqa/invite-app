// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'not_enough_messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotEnoughMessagesModel {

 int? get needed; int? get available; int? get missing;
/// Create a copy of NotEnoughMessagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotEnoughMessagesModelCopyWith<NotEnoughMessagesModel> get copyWith => _$NotEnoughMessagesModelCopyWithImpl<NotEnoughMessagesModel>(this as NotEnoughMessagesModel, _$identity);

  /// Serializes this NotEnoughMessagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotEnoughMessagesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotEnoughMessagesModel&&(identical(other.needed, _this.needed) || other.needed == _this.needed)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.missing, _this.missing) || other.missing == _this.missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotEnoughMessagesModel;
  return Object.hash(runtimeType,_this.needed,_this.available,_this.missing);
}

@override
String toString() {
  final _this = this as NotEnoughMessagesModel;
  return 'NotEnoughMessagesModel(needed: ${_this.needed}, available: ${_this.available}, missing: ${_this.missing})';
}


}

/// @nodoc
abstract mixin class $NotEnoughMessagesModelCopyWith<$Res>  {
  factory $NotEnoughMessagesModelCopyWith(NotEnoughMessagesModel value, $Res Function(NotEnoughMessagesModel) _then) = _$NotEnoughMessagesModelCopyWithImpl;
@useResult
$Res call({
 int? needed, int? available, int? missing
});




}
/// @nodoc
class _$NotEnoughMessagesModelCopyWithImpl<$Res>
    implements $NotEnoughMessagesModelCopyWith<$Res> {
  _$NotEnoughMessagesModelCopyWithImpl(this._self, this._then);

  final NotEnoughMessagesModel _self;
  final $Res Function(NotEnoughMessagesModel) _then;

/// Create a copy of NotEnoughMessagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needed = freezed,Object? available = freezed,Object? missing = freezed,}) {
  return _then(NotEnoughMessagesModel(
needed: freezed == needed ? _self.needed : needed // ignore: cast_nullable_to_non_nullable
as int?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int?,missing: freezed == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotEnoughMessagesModel].
extension NotEnoughMessagesModelPatterns on NotEnoughMessagesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotEnoughMessagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotEnoughMessagesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotEnoughMessagesModel value)  $default,){
final _that = this;
switch (_that) {
case _NotEnoughMessagesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotEnoughMessagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotEnoughMessagesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? needed,  int? available,  int? missing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotEnoughMessagesModel() when $default != null:
return $default(_that.needed,_that.available,_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? needed,  int? available,  int? missing)  $default,) {final _that = this;
switch (_that) {
case _NotEnoughMessagesModel():
return $default(_that.needed,_that.available,_that.missing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? needed,  int? available,  int? missing)?  $default,) {final _that = this;
switch (_that) {
case _NotEnoughMessagesModel() when $default != null:
return $default(_that.needed,_that.available,_that.missing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotEnoughMessagesModel implements NotEnoughMessagesModel {
  const _NotEnoughMessagesModel({this.needed, this.available, this.missing});
  factory _NotEnoughMessagesModel.fromJson(Map<String, dynamic> json) => _$NotEnoughMessagesModelFromJson(json);

@override final  int? needed;
@override final  int? available;
@override final  int? missing;

/// Create a copy of NotEnoughMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotEnoughMessagesModelCopyWith<_NotEnoughMessagesModel> get copyWith => __$NotEnoughMessagesModelCopyWithImpl<_NotEnoughMessagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotEnoughMessagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotEnoughMessagesModel&&(identical(other.needed, needed) || other.needed == needed)&&(identical(other.available, available) || other.available == available)&&(identical(other.missing, missing) || other.missing == missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,needed,available,missing);
}

@override
String toString() {
    return 'NotEnoughMessagesModel(needed: $needed, available: $available, missing: $missing)';
}


}

/// @nodoc
abstract mixin class _$NotEnoughMessagesModelCopyWith<$Res> implements $NotEnoughMessagesModelCopyWith<$Res> {
  factory _$NotEnoughMessagesModelCopyWith(_NotEnoughMessagesModel value, $Res Function(_NotEnoughMessagesModel) _then) = __$NotEnoughMessagesModelCopyWithImpl;
@override @useResult
$Res call({
 int? needed, int? available, int? missing
});




}
/// @nodoc
class __$NotEnoughMessagesModelCopyWithImpl<$Res>
    implements _$NotEnoughMessagesModelCopyWith<$Res> {
  __$NotEnoughMessagesModelCopyWithImpl(this._self, this._then);

  final _NotEnoughMessagesModel _self;
  final $Res Function(_NotEnoughMessagesModel) _then;

/// Create a copy of NotEnoughMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needed = freezed,Object? available = freezed,Object? missing = freezed,}) {
  return _then(_NotEnoughMessagesModel(
needed: freezed == needed ? _self.needed : needed // ignore: cast_nullable_to_non_nullable
as int?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int?,missing: freezed == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
