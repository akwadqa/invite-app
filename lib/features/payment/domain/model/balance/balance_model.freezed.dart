// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BalanceModel {

@JsonKey(name: 'messages_left') num? get messagesLeft; List<BalanceHistoryModel> get history;
/// Create a copy of BalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceModelCopyWith<BalanceModel> get copyWith => _$BalanceModelCopyWithImpl<BalanceModel>(this as BalanceModel, _$identity);

  /// Serializes this BalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BalanceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceModel&&(identical(other.messagesLeft, _this.messagesLeft) || other.messagesLeft == _this.messagesLeft)&&const DeepCollectionEquality().equals(other.history, _this.history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BalanceModel;
  return Object.hash(runtimeType,_this.messagesLeft,const DeepCollectionEquality().hash(_this.history));
}

@override
String toString() {
  final _this = this as BalanceModel;
  return 'BalanceModel(messagesLeft: ${_this.messagesLeft}, history: ${_this.history})';
}


}

/// @nodoc
abstract mixin class $BalanceModelCopyWith<$Res>  {
  factory $BalanceModelCopyWith(BalanceModel value, $Res Function(BalanceModel) _then) = _$BalanceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'messages_left') num? messagesLeft, List<BalanceHistoryModel> history
});




}
/// @nodoc
class _$BalanceModelCopyWithImpl<$Res>
    implements $BalanceModelCopyWith<$Res> {
  _$BalanceModelCopyWithImpl(this._self, this._then);

  final BalanceModel _self;
  final $Res Function(BalanceModel) _then;

/// Create a copy of BalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messagesLeft = freezed,Object? history = null,}) {
  return _then(BalanceModel(
messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as num?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<BalanceHistoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BalanceModel].
extension BalanceModelPatterns on BalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _BalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _BalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'messages_left')  num? messagesLeft,  List<BalanceHistoryModel> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BalanceModel() when $default != null:
return $default(_that.messagesLeft,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'messages_left')  num? messagesLeft,  List<BalanceHistoryModel> history)  $default,) {final _that = this;
switch (_that) {
case _BalanceModel():
return $default(_that.messagesLeft,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'messages_left')  num? messagesLeft,  List<BalanceHistoryModel> history)?  $default,) {final _that = this;
switch (_that) {
case _BalanceModel() when $default != null:
return $default(_that.messagesLeft,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BalanceModel implements BalanceModel {
  const _BalanceModel({@JsonKey(name: 'messages_left') this.messagesLeft,  List<BalanceHistoryModel> history = const []}): _history = history;
  factory _BalanceModel.fromJson(Map<String, dynamic> json) => _$BalanceModelFromJson(json);

@override@JsonKey(name: 'messages_left') final  num? messagesLeft;
 final  List<BalanceHistoryModel> _history;
@override@JsonKey() List<BalanceHistoryModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of BalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceModelCopyWith<_BalanceModel> get copyWith => __$BalanceModelCopyWithImpl<_BalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceModel&&(identical(other.messagesLeft, messagesLeft) || other.messagesLeft == messagesLeft)&&const DeepCollectionEquality().equals(other.history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,messagesLeft,const DeepCollectionEquality().hash(_history));
}

@override
String toString() {
    return 'BalanceModel(messagesLeft: $messagesLeft, history: $history)';
}


}

/// @nodoc
abstract mixin class _$BalanceModelCopyWith<$Res> implements $BalanceModelCopyWith<$Res> {
  factory _$BalanceModelCopyWith(_BalanceModel value, $Res Function(_BalanceModel) _then) = __$BalanceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'messages_left') num? messagesLeft, List<BalanceHistoryModel> history
});




}
/// @nodoc
class __$BalanceModelCopyWithImpl<$Res>
    implements _$BalanceModelCopyWith<$Res> {
  __$BalanceModelCopyWithImpl(this._self, this._then);

  final _BalanceModel _self;
  final $Res Function(_BalanceModel) _then;

/// Create a copy of BalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messagesLeft = freezed,Object? history = null,}) {
  return _then(_BalanceModel(
messagesLeft: freezed == messagesLeft ? _self.messagesLeft : messagesLeft // ignore: cast_nullable_to_non_nullable
as num?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<BalanceHistoryModel>,
  ));
}


}


/// @nodoc
mixin _$BalanceHistoryModel {

 String? get id; String? get date; String? get type; String? get title; String? get subtitle; num? get amount;@JsonKey(name: 'balance_after') num? get balanceAfter; String? get occasion; String? get bundle;@JsonKey(name: 'paid_amount') num? get paidAmount;
/// Create a copy of BalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceHistoryModelCopyWith<BalanceHistoryModel> get copyWith => _$BalanceHistoryModelCopyWithImpl<BalanceHistoryModel>(this as BalanceHistoryModel, _$identity);

  /// Serializes this BalanceHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BalanceHistoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceHistoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.balanceAfter, _this.balanceAfter) || other.balanceAfter == _this.balanceAfter)&&(identical(other.occasion, _this.occasion) || other.occasion == _this.occasion)&&(identical(other.bundle, _this.bundle) || other.bundle == _this.bundle)&&(identical(other.paidAmount, _this.paidAmount) || other.paidAmount == _this.paidAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BalanceHistoryModel;
  return Object.hash(runtimeType,_this.id,_this.date,_this.type,_this.title,_this.subtitle,_this.amount,_this.balanceAfter,_this.occasion,_this.bundle,_this.paidAmount);
}

@override
String toString() {
  final _this = this as BalanceHistoryModel;
  return 'BalanceHistoryModel(id: ${_this.id}, date: ${_this.date}, type: ${_this.type}, title: ${_this.title}, subtitle: ${_this.subtitle}, amount: ${_this.amount}, balanceAfter: ${_this.balanceAfter}, occasion: ${_this.occasion}, bundle: ${_this.bundle}, paidAmount: ${_this.paidAmount})';
}


}

/// @nodoc
abstract mixin class $BalanceHistoryModelCopyWith<$Res>  {
  factory $BalanceHistoryModelCopyWith(BalanceHistoryModel value, $Res Function(BalanceHistoryModel) _then) = _$BalanceHistoryModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? date, String? type, String? title, String? subtitle, num? amount,@JsonKey(name: 'balance_after') num? balanceAfter, String? occasion, String? bundle,@JsonKey(name: 'paid_amount') num? paidAmount
});




}
/// @nodoc
class _$BalanceHistoryModelCopyWithImpl<$Res>
    implements $BalanceHistoryModelCopyWith<$Res> {
  _$BalanceHistoryModelCopyWithImpl(this._self, this._then);

  final BalanceHistoryModel _self;
  final $Res Function(BalanceHistoryModel) _then;

/// Create a copy of BalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? type = freezed,Object? title = freezed,Object? subtitle = freezed,Object? amount = freezed,Object? balanceAfter = freezed,Object? occasion = freezed,Object? bundle = freezed,Object? paidAmount = freezed,}) {
  return _then(BalanceHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num?,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as num?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String?,bundle: freezed == bundle ? _self.bundle : bundle // ignore: cast_nullable_to_non_nullable
as String?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [BalanceHistoryModel].
extension BalanceHistoryModelPatterns on BalanceHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BalanceHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BalanceHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BalanceHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _BalanceHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BalanceHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _BalanceHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? date,  String? type,  String? title,  String? subtitle,  num? amount, @JsonKey(name: 'balance_after')  num? balanceAfter,  String? occasion,  String? bundle, @JsonKey(name: 'paid_amount')  num? paidAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BalanceHistoryModel() when $default != null:
return $default(_that.id,_that.date,_that.type,_that.title,_that.subtitle,_that.amount,_that.balanceAfter,_that.occasion,_that.bundle,_that.paidAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? date,  String? type,  String? title,  String? subtitle,  num? amount, @JsonKey(name: 'balance_after')  num? balanceAfter,  String? occasion,  String? bundle, @JsonKey(name: 'paid_amount')  num? paidAmount)  $default,) {final _that = this;
switch (_that) {
case _BalanceHistoryModel():
return $default(_that.id,_that.date,_that.type,_that.title,_that.subtitle,_that.amount,_that.balanceAfter,_that.occasion,_that.bundle,_that.paidAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? date,  String? type,  String? title,  String? subtitle,  num? amount, @JsonKey(name: 'balance_after')  num? balanceAfter,  String? occasion,  String? bundle, @JsonKey(name: 'paid_amount')  num? paidAmount)?  $default,) {final _that = this;
switch (_that) {
case _BalanceHistoryModel() when $default != null:
return $default(_that.id,_that.date,_that.type,_that.title,_that.subtitle,_that.amount,_that.balanceAfter,_that.occasion,_that.bundle,_that.paidAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BalanceHistoryModel extends BalanceHistoryModel {
  const _BalanceHistoryModel({this.id, this.date, this.type, this.title, this.subtitle, this.amount, @JsonKey(name: 'balance_after') this.balanceAfter, this.occasion, this.bundle, @JsonKey(name: 'paid_amount') this.paidAmount}): super._();
  factory _BalanceHistoryModel.fromJson(Map<String, dynamic> json) => _$BalanceHistoryModelFromJson(json);

@override final  String? id;
@override final  String? date;
@override final  String? type;
@override final  String? title;
@override final  String? subtitle;
@override final  num? amount;
@override@JsonKey(name: 'balance_after') final  num? balanceAfter;
@override final  String? occasion;
@override final  String? bundle;
@override@JsonKey(name: 'paid_amount') final  num? paidAmount;

/// Create a copy of BalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceHistoryModelCopyWith<_BalanceHistoryModel> get copyWith => __$BalanceHistoryModelCopyWithImpl<_BalanceHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BalanceHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.bundle, bundle) || other.bundle == bundle)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,date,type,title,subtitle,amount,balanceAfter,occasion,bundle,paidAmount);
}

@override
String toString() {
    return 'BalanceHistoryModel(id: $id, date: $date, type: $type, title: $title, subtitle: $subtitle, amount: $amount, balanceAfter: $balanceAfter, occasion: $occasion, bundle: $bundle, paidAmount: $paidAmount)';
}


}

/// @nodoc
abstract mixin class _$BalanceHistoryModelCopyWith<$Res> implements $BalanceHistoryModelCopyWith<$Res> {
  factory _$BalanceHistoryModelCopyWith(_BalanceHistoryModel value, $Res Function(_BalanceHistoryModel) _then) = __$BalanceHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? date, String? type, String? title, String? subtitle, num? amount,@JsonKey(name: 'balance_after') num? balanceAfter, String? occasion, String? bundle,@JsonKey(name: 'paid_amount') num? paidAmount
});




}
/// @nodoc
class __$BalanceHistoryModelCopyWithImpl<$Res>
    implements _$BalanceHistoryModelCopyWith<$Res> {
  __$BalanceHistoryModelCopyWithImpl(this._self, this._then);

  final _BalanceHistoryModel _self;
  final $Res Function(_BalanceHistoryModel) _then;

/// Create a copy of BalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? type = freezed,Object? title = freezed,Object? subtitle = freezed,Object? amount = freezed,Object? balanceAfter = freezed,Object? occasion = freezed,Object? bundle = freezed,Object? paidAmount = freezed,}) {
  return _then(_BalanceHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num?,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as num?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String?,bundle: freezed == bundle ? _self.bundle : bundle // ignore: cast_nullable_to_non_nullable
as String?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
