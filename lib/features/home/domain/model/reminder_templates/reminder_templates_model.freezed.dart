// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_templates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderTemplatesModel {

@JsonKey(name: 'no_reply') ReminderTemplateModel? get noReply; ReminderTemplateModel? get confirmed;
/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTemplatesModelCopyWith<ReminderTemplatesModel> get copyWith => _$ReminderTemplatesModelCopyWithImpl<ReminderTemplatesModel>(this as ReminderTemplatesModel, _$identity);

  /// Serializes this ReminderTemplatesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTemplatesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTemplatesModel&&(identical(other.noReply, _this.noReply) || other.noReply == _this.noReply)&&(identical(other.confirmed, _this.confirmed) || other.confirmed == _this.confirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTemplatesModel;
  return Object.hash(runtimeType,_this.noReply,_this.confirmed);
}

@override
String toString() {
  final _this = this as ReminderTemplatesModel;
  return 'ReminderTemplatesModel(noReply: ${_this.noReply}, confirmed: ${_this.confirmed})';
}


}

/// @nodoc
abstract mixin class $ReminderTemplatesModelCopyWith<$Res>  {
  factory $ReminderTemplatesModelCopyWith(ReminderTemplatesModel value, $Res Function(ReminderTemplatesModel) _then) = _$ReminderTemplatesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'no_reply') ReminderTemplateModel? noReply, ReminderTemplateModel? confirmed
});


$ReminderTemplateModelCopyWith<$Res>? get noReply;$ReminderTemplateModelCopyWith<$Res>? get confirmed;

}
/// @nodoc
class _$ReminderTemplatesModelCopyWithImpl<$Res>
    implements $ReminderTemplatesModelCopyWith<$Res> {
  _$ReminderTemplatesModelCopyWithImpl(this._self, this._then);

  final ReminderTemplatesModel _self;
  final $Res Function(ReminderTemplatesModel) _then;

/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noReply = freezed,Object? confirmed = freezed,}) {
  return _then(ReminderTemplatesModel(
noReply: freezed == noReply ? _self.noReply : noReply // ignore: cast_nullable_to_non_nullable
as ReminderTemplateModel?,confirmed: freezed == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as ReminderTemplateModel?,
  ));
}
/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTemplateModelCopyWith<$Res>? get noReply {
    if (_self.noReply == null) {
    return null;
  }

  return $ReminderTemplateModelCopyWith<$Res>(_self.noReply!, (value) {
    return _then(_self.copyWith(noReply: value));
  });
}/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTemplateModelCopyWith<$Res>? get confirmed {
    if (_self.confirmed == null) {
    return null;
  }

  return $ReminderTemplateModelCopyWith<$Res>(_self.confirmed!, (value) {
    return _then(_self.copyWith(confirmed: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReminderTemplatesModel].
extension ReminderTemplatesModelPatterns on ReminderTemplatesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTemplatesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTemplatesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTemplatesModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplatesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTemplatesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplatesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'no_reply')  ReminderTemplateModel? noReply,  ReminderTemplateModel? confirmed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTemplatesModel() when $default != null:
return $default(_that.noReply,_that.confirmed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'no_reply')  ReminderTemplateModel? noReply,  ReminderTemplateModel? confirmed)  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplatesModel():
return $default(_that.noReply,_that.confirmed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'no_reply')  ReminderTemplateModel? noReply,  ReminderTemplateModel? confirmed)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplatesModel() when $default != null:
return $default(_that.noReply,_that.confirmed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTemplatesModel implements ReminderTemplatesModel {
  const _ReminderTemplatesModel({@JsonKey(name: 'no_reply') this.noReply, this.confirmed});
  factory _ReminderTemplatesModel.fromJson(Map<String, dynamic> json) => _$ReminderTemplatesModelFromJson(json);

@override@JsonKey(name: 'no_reply') final  ReminderTemplateModel? noReply;
@override final  ReminderTemplateModel? confirmed;

/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTemplatesModelCopyWith<_ReminderTemplatesModel> get copyWith => __$ReminderTemplatesModelCopyWithImpl<_ReminderTemplatesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTemplatesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTemplatesModel&&(identical(other.noReply, noReply) || other.noReply == noReply)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,noReply,confirmed);
}

@override
String toString() {
    return 'ReminderTemplatesModel(noReply: $noReply, confirmed: $confirmed)';
}


}

/// @nodoc
abstract mixin class _$ReminderTemplatesModelCopyWith<$Res> implements $ReminderTemplatesModelCopyWith<$Res> {
  factory _$ReminderTemplatesModelCopyWith(_ReminderTemplatesModel value, $Res Function(_ReminderTemplatesModel) _then) = __$ReminderTemplatesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'no_reply') ReminderTemplateModel? noReply, ReminderTemplateModel? confirmed
});


@override $ReminderTemplateModelCopyWith<$Res>? get noReply;@override $ReminderTemplateModelCopyWith<$Res>? get confirmed;

}
/// @nodoc
class __$ReminderTemplatesModelCopyWithImpl<$Res>
    implements _$ReminderTemplatesModelCopyWith<$Res> {
  __$ReminderTemplatesModelCopyWithImpl(this._self, this._then);

  final _ReminderTemplatesModel _self;
  final $Res Function(_ReminderTemplatesModel) _then;

/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noReply = freezed,Object? confirmed = freezed,}) {
  return _then(_ReminderTemplatesModel(
noReply: freezed == noReply ? _self.noReply : noReply // ignore: cast_nullable_to_non_nullable
as ReminderTemplateModel?,confirmed: freezed == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as ReminderTemplateModel?,
  ));
}

/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTemplateModelCopyWith<$Res>? get noReply {
    if (_self.noReply == null) {
    return null;
  }

  return $ReminderTemplateModelCopyWith<$Res>(_self.noReply!, (value) {
    return _then(_self.copyWith(noReply: value));
  });
}/// Create a copy of ReminderTemplatesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTemplateModelCopyWith<$Res>? get confirmed {
    if (_self.confirmed == null) {
    return null;
  }

  return $ReminderTemplateModelCopyWith<$Res>(_self.confirmed!, (value) {
    return _then(_self.copyWith(confirmed: value));
  });
}
}


/// @nodoc
mixin _$ReminderTemplateModel {

 bool? get available; String? get error; String? get name; String? get language;@JsonKey(name: 'header_type') String? get headerType; String? get header; String? get image; String? get message; String? get footer; List<ReminderTemplateButton>? get buttons;
/// Create a copy of ReminderTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTemplateModelCopyWith<ReminderTemplateModel> get copyWith => _$ReminderTemplateModelCopyWithImpl<ReminderTemplateModel>(this as ReminderTemplateModel, _$identity);

  /// Serializes this ReminderTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTemplateModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTemplateModel&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.headerType, _this.headerType) || other.headerType == _this.headerType)&&(identical(other.header, _this.header) || other.header == _this.header)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.footer, _this.footer) || other.footer == _this.footer)&&const DeepCollectionEquality().equals(other.buttons, _this.buttons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTemplateModel;
  return Object.hash(runtimeType,_this.available,_this.error,_this.name,_this.language,_this.headerType,_this.header,_this.image,_this.message,_this.footer,const DeepCollectionEquality().hash(_this.buttons));
}

@override
String toString() {
  final _this = this as ReminderTemplateModel;
  return 'ReminderTemplateModel(available: ${_this.available}, error: ${_this.error}, name: ${_this.name}, language: ${_this.language}, headerType: ${_this.headerType}, header: ${_this.header}, image: ${_this.image}, message: ${_this.message}, footer: ${_this.footer}, buttons: ${_this.buttons})';
}


}

/// @nodoc
abstract mixin class $ReminderTemplateModelCopyWith<$Res>  {
  factory $ReminderTemplateModelCopyWith(ReminderTemplateModel value, $Res Function(ReminderTemplateModel) _then) = _$ReminderTemplateModelCopyWithImpl;
@useResult
$Res call({
 bool? available, String? error, String? name, String? language,@JsonKey(name: 'header_type') String? headerType, String? header, String? image, String? message, String? footer, List<ReminderTemplateButton>? buttons
});




}
/// @nodoc
class _$ReminderTemplateModelCopyWithImpl<$Res>
    implements $ReminderTemplateModelCopyWith<$Res> {
  _$ReminderTemplateModelCopyWithImpl(this._self, this._then);

  final ReminderTemplateModel _self;
  final $Res Function(ReminderTemplateModel) _then;

/// Create a copy of ReminderTemplateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = freezed,Object? error = freezed,Object? name = freezed,Object? language = freezed,Object? headerType = freezed,Object? header = freezed,Object? image = freezed,Object? message = freezed,Object? footer = freezed,Object? buttons = freezed,}) {
  return _then(ReminderTemplateModel(
available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,headerType: freezed == headerType ? _self.headerType : headerType // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,buttons: freezed == buttons ? _self.buttons : buttons // ignore: cast_nullable_to_non_nullable
as List<ReminderTemplateButton>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTemplateModel].
extension ReminderTemplateModelPatterns on ReminderTemplateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTemplateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTemplateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTemplateModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTemplateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? available,  String? error,  String? name,  String? language, @JsonKey(name: 'header_type')  String? headerType,  String? header,  String? image,  String? message,  String? footer,  List<ReminderTemplateButton>? buttons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTemplateModel() when $default != null:
return $default(_that.available,_that.error,_that.name,_that.language,_that.headerType,_that.header,_that.image,_that.message,_that.footer,_that.buttons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? available,  String? error,  String? name,  String? language, @JsonKey(name: 'header_type')  String? headerType,  String? header,  String? image,  String? message,  String? footer,  List<ReminderTemplateButton>? buttons)  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplateModel():
return $default(_that.available,_that.error,_that.name,_that.language,_that.headerType,_that.header,_that.image,_that.message,_that.footer,_that.buttons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? available,  String? error,  String? name,  String? language, @JsonKey(name: 'header_type')  String? headerType,  String? header,  String? image,  String? message,  String? footer,  List<ReminderTemplateButton>? buttons)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplateModel() when $default != null:
return $default(_that.available,_that.error,_that.name,_that.language,_that.headerType,_that.header,_that.image,_that.message,_that.footer,_that.buttons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTemplateModel implements ReminderTemplateModel {
  const _ReminderTemplateModel({this.available, this.error, this.name, this.language, @JsonKey(name: 'header_type') this.headerType, this.header, this.image, this.message, this.footer,  List<ReminderTemplateButton>? buttons}): _buttons = buttons;
  factory _ReminderTemplateModel.fromJson(Map<String, dynamic> json) => _$ReminderTemplateModelFromJson(json);

@override final  bool? available;
@override final  String? error;
@override final  String? name;
@override final  String? language;
@override@JsonKey(name: 'header_type') final  String? headerType;
@override final  String? header;
@override final  String? image;
@override final  String? message;
@override final  String? footer;
 final  List<ReminderTemplateButton>? _buttons;
@override List<ReminderTemplateButton>? get buttons {
  final value = _buttons;
  if (value == null) return null;
  if (_buttons is EqualUnmodifiableListView) return _buttons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReminderTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTemplateModelCopyWith<_ReminderTemplateModel> get copyWith => __$ReminderTemplateModelCopyWithImpl<_ReminderTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTemplateModel&&(identical(other.available, available) || other.available == available)&&(identical(other.error, error) || other.error == error)&&(identical(other.name, name) || other.name == name)&&(identical(other.language, language) || other.language == language)&&(identical(other.headerType, headerType) || other.headerType == headerType)&&(identical(other.header, header) || other.header == header)&&(identical(other.image, image) || other.image == image)&&(identical(other.message, message) || other.message == message)&&(identical(other.footer, footer) || other.footer == footer)&&const DeepCollectionEquality().equals(other.buttons, _buttons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,available,error,name,language,headerType,header,image,message,footer,const DeepCollectionEquality().hash(_buttons));
}

@override
String toString() {
    return 'ReminderTemplateModel(available: $available, error: $error, name: $name, language: $language, headerType: $headerType, header: $header, image: $image, message: $message, footer: $footer, buttons: $buttons)';
}


}

/// @nodoc
abstract mixin class _$ReminderTemplateModelCopyWith<$Res> implements $ReminderTemplateModelCopyWith<$Res> {
  factory _$ReminderTemplateModelCopyWith(_ReminderTemplateModel value, $Res Function(_ReminderTemplateModel) _then) = __$ReminderTemplateModelCopyWithImpl;
@override @useResult
$Res call({
 bool? available, String? error, String? name, String? language,@JsonKey(name: 'header_type') String? headerType, String? header, String? image, String? message, String? footer, List<ReminderTemplateButton>? buttons
});




}
/// @nodoc
class __$ReminderTemplateModelCopyWithImpl<$Res>
    implements _$ReminderTemplateModelCopyWith<$Res> {
  __$ReminderTemplateModelCopyWithImpl(this._self, this._then);

  final _ReminderTemplateModel _self;
  final $Res Function(_ReminderTemplateModel) _then;

/// Create a copy of ReminderTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = freezed,Object? error = freezed,Object? name = freezed,Object? language = freezed,Object? headerType = freezed,Object? header = freezed,Object? image = freezed,Object? message = freezed,Object? footer = freezed,Object? buttons = freezed,}) {
  return _then(_ReminderTemplateModel(
available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,headerType: freezed == headerType ? _self.headerType : headerType // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,buttons: freezed == buttons ? _self._buttons : buttons // ignore: cast_nullable_to_non_nullable
as List<ReminderTemplateButton>?,
  ));
}


}


/// @nodoc
mixin _$ReminderTemplateButton {

 String? get type; String? get label;
/// Create a copy of ReminderTemplateButton
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTemplateButtonCopyWith<ReminderTemplateButton> get copyWith => _$ReminderTemplateButtonCopyWithImpl<ReminderTemplateButton>(this as ReminderTemplateButton, _$identity);

  /// Serializes this ReminderTemplateButton to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTemplateButton;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTemplateButton&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTemplateButton;
  return Object.hash(runtimeType,_this.type,_this.label);
}

@override
String toString() {
  final _this = this as ReminderTemplateButton;
  return 'ReminderTemplateButton(type: ${_this.type}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $ReminderTemplateButtonCopyWith<$Res>  {
  factory $ReminderTemplateButtonCopyWith(ReminderTemplateButton value, $Res Function(ReminderTemplateButton) _then) = _$ReminderTemplateButtonCopyWithImpl;
@useResult
$Res call({
 String? type, String? label
});




}
/// @nodoc
class _$ReminderTemplateButtonCopyWithImpl<$Res>
    implements $ReminderTemplateButtonCopyWith<$Res> {
  _$ReminderTemplateButtonCopyWithImpl(this._self, this._then);

  final ReminderTemplateButton _self;
  final $Res Function(ReminderTemplateButton) _then;

/// Create a copy of ReminderTemplateButton
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? label = freezed,}) {
  return _then(ReminderTemplateButton(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTemplateButton].
extension ReminderTemplateButtonPatterns on ReminderTemplateButton {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTemplateButton value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTemplateButton() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTemplateButton value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplateButton():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTemplateButton value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTemplateButton() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTemplateButton() when $default != null:
return $default(_that.type,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? label)  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplateButton():
return $default(_that.type,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTemplateButton() when $default != null:
return $default(_that.type,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTemplateButton implements ReminderTemplateButton {
  const _ReminderTemplateButton({this.type, this.label});
  factory _ReminderTemplateButton.fromJson(Map<String, dynamic> json) => _$ReminderTemplateButtonFromJson(json);

@override final  String? type;
@override final  String? label;

/// Create a copy of ReminderTemplateButton
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTemplateButtonCopyWith<_ReminderTemplateButton> get copyWith => __$ReminderTemplateButtonCopyWithImpl<_ReminderTemplateButton>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTemplateButtonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTemplateButton&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,label);
}

@override
String toString() {
    return 'ReminderTemplateButton(type: $type, label: $label)';
}


}

/// @nodoc
abstract mixin class _$ReminderTemplateButtonCopyWith<$Res> implements $ReminderTemplateButtonCopyWith<$Res> {
  factory _$ReminderTemplateButtonCopyWith(_ReminderTemplateButton value, $Res Function(_ReminderTemplateButton) _then) = __$ReminderTemplateButtonCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? label
});




}
/// @nodoc
class __$ReminderTemplateButtonCopyWithImpl<$Res>
    implements _$ReminderTemplateButtonCopyWith<$Res> {
  __$ReminderTemplateButtonCopyWithImpl(this._self, this._then);

  final _ReminderTemplateButton _self;
  final $Res Function(_ReminderTemplateButton) _then;

/// Create a copy of ReminderTemplateButton
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? label = freezed,}) {
  return _then(_ReminderTemplateButton(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
