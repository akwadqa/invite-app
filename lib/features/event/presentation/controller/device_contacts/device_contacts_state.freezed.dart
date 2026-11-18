// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_contacts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceContactsState {

 AsyncValue<List<DeviceContact>> get contacts; String get query; Set<String> get selectedIds;
/// Create a copy of DeviceContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceContactsStateCopyWith<DeviceContactsState> get copyWith => _$DeviceContactsStateCopyWithImpl<DeviceContactsState>(this as DeviceContactsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DeviceContactsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceContactsState&&(identical(other.contacts, _this.contacts) || other.contacts == _this.contacts)&&(identical(other.query, _this.query) || other.query == _this.query)&&const DeepCollectionEquality().equals(other.selectedIds, _this.selectedIds));
}


@override
int get hashCode {
  final _this = this as DeviceContactsState;
  return Object.hash(runtimeType,_this.contacts,_this.query,const DeepCollectionEquality().hash(_this.selectedIds));
}

@override
String toString() {
  final _this = this as DeviceContactsState;
  return 'DeviceContactsState(contacts: ${_this.contacts}, query: ${_this.query}, selectedIds: ${_this.selectedIds})';
}


}

/// @nodoc
abstract mixin class $DeviceContactsStateCopyWith<$Res>  {
  factory $DeviceContactsStateCopyWith(DeviceContactsState value, $Res Function(DeviceContactsState) _then) = _$DeviceContactsStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<DeviceContact>> contacts, String query, Set<String> selectedIds
});




}
/// @nodoc
class _$DeviceContactsStateCopyWithImpl<$Res>
    implements $DeviceContactsStateCopyWith<$Res> {
  _$DeviceContactsStateCopyWithImpl(this._self, this._then);

  final DeviceContactsState _self;
  final $Res Function(DeviceContactsState) _then;

/// Create a copy of DeviceContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contacts = null,Object? query = null,Object? selectedIds = null,}) {
  return _then(DeviceContactsState(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<DeviceContact>>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceContactsState].
extension DeviceContactsStatePatterns on DeviceContactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceContactsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceContactsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceContactsState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceContactsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceContactsState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceContactsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncValue<List<DeviceContact>> contacts,  String query,  Set<String> selectedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceContactsState() when $default != null:
return $default(_that.contacts,_that.query,_that.selectedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncValue<List<DeviceContact>> contacts,  String query,  Set<String> selectedIds)  $default,) {final _that = this;
switch (_that) {
case _DeviceContactsState():
return $default(_that.contacts,_that.query,_that.selectedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncValue<List<DeviceContact>> contacts,  String query,  Set<String> selectedIds)?  $default,) {final _that = this;
switch (_that) {
case _DeviceContactsState() when $default != null:
return $default(_that.contacts,_that.query,_that.selectedIds);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceContactsState extends DeviceContactsState {
  const _DeviceContactsState({this.contacts = const AsyncLoading(), this.query = '',  Set<String> selectedIds = const {}}): _selectedIds = selectedIds,super._();
  

@override@JsonKey() final  AsyncValue<List<DeviceContact>> contacts;
@override@JsonKey() final  String query;
 final  Set<String> _selectedIds;
@override@JsonKey() Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}


/// Create a copy of DeviceContactsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceContactsStateCopyWith<_DeviceContactsState> get copyWith => __$DeviceContactsStateCopyWithImpl<_DeviceContactsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceContactsState&&(identical(other.contacts, contacts) || other.contacts == contacts)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.selectedIds, _selectedIds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,contacts,query,const DeepCollectionEquality().hash(_selectedIds));
}

@override
String toString() {
    return 'DeviceContactsState(contacts: $contacts, query: $query, selectedIds: $selectedIds)';
}


}

/// @nodoc
abstract mixin class _$DeviceContactsStateCopyWith<$Res> implements $DeviceContactsStateCopyWith<$Res> {
  factory _$DeviceContactsStateCopyWith(_DeviceContactsState value, $Res Function(_DeviceContactsState) _then) = __$DeviceContactsStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<DeviceContact>> contacts, String query, Set<String> selectedIds
});




}
/// @nodoc
class __$DeviceContactsStateCopyWithImpl<$Res>
    implements _$DeviceContactsStateCopyWith<$Res> {
  __$DeviceContactsStateCopyWithImpl(this._self, this._then);

  final _DeviceContactsState _self;
  final $Res Function(_DeviceContactsState) _then;

/// Create a copy of DeviceContactsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contacts = null,Object? query = null,Object? selectedIds = null,}) {
  return _then(_DeviceContactsState(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<DeviceContact>>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

/// @nodoc
mixin _$DeviceContact {

 String get id; String get name; GuestPhoneNumber get phone;
/// Create a copy of DeviceContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceContactCopyWith<DeviceContact> get copyWith => _$DeviceContactCopyWithImpl<DeviceContact>(this as DeviceContact, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DeviceContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceContact&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}


@override
int get hashCode {
  final _this = this as DeviceContact;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone);
}

@override
String toString() {
  final _this = this as DeviceContact;
  return 'DeviceContact(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $DeviceContactCopyWith<$Res>  {
  factory $DeviceContactCopyWith(DeviceContact value, $Res Function(DeviceContact) _then) = _$DeviceContactCopyWithImpl;
@useResult
$Res call({
 String id, String name, GuestPhoneNumber phone
});




}
/// @nodoc
class _$DeviceContactCopyWithImpl<$Res>
    implements $DeviceContactCopyWith<$Res> {
  _$DeviceContactCopyWithImpl(this._self, this._then);

  final DeviceContact _self;
  final $Res Function(DeviceContact) _then;

/// Create a copy of DeviceContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,}) {
  return _then(DeviceContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceContact].
extension DeviceContactPatterns on DeviceContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceContact value)  $default,){
final _that = this;
switch (_that) {
case _DeviceContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceContact value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  GuestPhoneNumber phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceContact() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  GuestPhoneNumber phone)  $default,) {final _that = this;
switch (_that) {
case _DeviceContact():
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  GuestPhoneNumber phone)?  $default,) {final _that = this;
switch (_that) {
case _DeviceContact() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceContact implements DeviceContact {
  const _DeviceContact({required this.id, required this.name, required this.phone});
  

@override final  String id;
@override final  String name;
@override final  GuestPhoneNumber phone;

/// Create a copy of DeviceContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceContactCopyWith<_DeviceContact> get copyWith => __$DeviceContactCopyWithImpl<_DeviceContact>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone);
}

@override
String toString() {
    return 'DeviceContact(id: $id, name: $name, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$DeviceContactCopyWith<$Res> implements $DeviceContactCopyWith<$Res> {
  factory _$DeviceContactCopyWith(_DeviceContact value, $Res Function(_DeviceContact) _then) = __$DeviceContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, GuestPhoneNumber phone
});




}
/// @nodoc
class __$DeviceContactCopyWithImpl<$Res>
    implements _$DeviceContactCopyWith<$Res> {
  __$DeviceContactCopyWithImpl(this._self, this._then);

  final _DeviceContact _self;
  final $Res Function(_DeviceContact) _then;

/// Create a copy of DeviceContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,}) {
  return _then(_DeviceContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber,
  ));
}


}

// dart format on
