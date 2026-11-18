// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateEventFlowState {

 bool get isEditingFromReview; String? get occasionType; AsyncValue<List<TemplateModel>> get templates; String? get templateName; TemplatePreviewTab get previewTab; String get title; DateTime? get date; TimeOfDay? get time; String get venue; String get hostedBy; EventLocationDraft? get location; List<EventGuestDraft> get guests; List<String> get recentlyAddedGuestIds; String get guestQuery; AsyncValue<void> get guestListImport; GuestListImportOrigin get guestListImportOrigin; GuestImportDraft? get guestImport; GuestImportTab get guestImportTab; AsyncValue<bool?> get guestListTemplate; File? get image; AsyncValue<void> get imageCrop; AsyncValue<EventSubmitResult?> get submit; String? get createdEventId;
/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEventFlowStateCopyWith<CreateEventFlowState> get copyWith => _$CreateEventFlowStateCopyWithImpl<CreateEventFlowState>(this as CreateEventFlowState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CreateEventFlowState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEventFlowState&&(identical(other.isEditingFromReview, _this.isEditingFromReview) || other.isEditingFromReview == _this.isEditingFromReview)&&(identical(other.occasionType, _this.occasionType) || other.occasionType == _this.occasionType)&&(identical(other.templates, _this.templates) || other.templates == _this.templates)&&(identical(other.templateName, _this.templateName) || other.templateName == _this.templateName)&&(identical(other.previewTab, _this.previewTab) || other.previewTab == _this.previewTab)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.venue, _this.venue) || other.venue == _this.venue)&&(identical(other.hostedBy, _this.hostedBy) || other.hostedBy == _this.hostedBy)&&(identical(other.location, _this.location) || other.location == _this.location)&&const DeepCollectionEquality().equals(other.guests, _this.guests)&&const DeepCollectionEquality().equals(other.recentlyAddedGuestIds, _this.recentlyAddedGuestIds)&&(identical(other.guestQuery, _this.guestQuery) || other.guestQuery == _this.guestQuery)&&(identical(other.guestListImport, _this.guestListImport) || other.guestListImport == _this.guestListImport)&&(identical(other.guestListImportOrigin, _this.guestListImportOrigin) || other.guestListImportOrigin == _this.guestListImportOrigin)&&(identical(other.guestImport, _this.guestImport) || other.guestImport == _this.guestImport)&&(identical(other.guestImportTab, _this.guestImportTab) || other.guestImportTab == _this.guestImportTab)&&(identical(other.guestListTemplate, _this.guestListTemplate) || other.guestListTemplate == _this.guestListTemplate)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.imageCrop, _this.imageCrop) || other.imageCrop == _this.imageCrop)&&(identical(other.submit, _this.submit) || other.submit == _this.submit)&&(identical(other.createdEventId, _this.createdEventId) || other.createdEventId == _this.createdEventId));
}


@override
int get hashCode {
  final _this = this as CreateEventFlowState;
  return Object.hashAll([runtimeType,_this.isEditingFromReview,_this.occasionType,_this.templates,_this.templateName,_this.previewTab,_this.title,_this.date,_this.time,_this.venue,_this.hostedBy,_this.location,const DeepCollectionEquality().hash(_this.guests),const DeepCollectionEquality().hash(_this.recentlyAddedGuestIds),_this.guestQuery,_this.guestListImport,_this.guestListImportOrigin,_this.guestImport,_this.guestImportTab,_this.guestListTemplate,_this.image,_this.imageCrop,_this.submit,_this.createdEventId]);
}

@override
String toString() {
  final _this = this as CreateEventFlowState;
  return 'CreateEventFlowState(isEditingFromReview: ${_this.isEditingFromReview}, occasionType: ${_this.occasionType}, templates: ${_this.templates}, templateName: ${_this.templateName}, previewTab: ${_this.previewTab}, title: ${_this.title}, date: ${_this.date}, time: ${_this.time}, venue: ${_this.venue}, hostedBy: ${_this.hostedBy}, location: ${_this.location}, guests: ${_this.guests}, recentlyAddedGuestIds: ${_this.recentlyAddedGuestIds}, guestQuery: ${_this.guestQuery}, guestListImport: ${_this.guestListImport}, guestListImportOrigin: ${_this.guestListImportOrigin}, guestImport: ${_this.guestImport}, guestImportTab: ${_this.guestImportTab}, guestListTemplate: ${_this.guestListTemplate}, image: ${_this.image}, imageCrop: ${_this.imageCrop}, submit: ${_this.submit}, createdEventId: ${_this.createdEventId})';
}


}

/// @nodoc
abstract mixin class $CreateEventFlowStateCopyWith<$Res>  {
  factory $CreateEventFlowStateCopyWith(CreateEventFlowState value, $Res Function(CreateEventFlowState) _then) = _$CreateEventFlowStateCopyWithImpl;
@useResult
$Res call({
 bool isEditingFromReview, String? occasionType, AsyncValue<List<TemplateModel>> templates, String? templateName, TemplatePreviewTab previewTab, String title, DateTime? date, TimeOfDay? time, String venue, String hostedBy, EventLocationDraft? location, List<EventGuestDraft> guests, List<String> recentlyAddedGuestIds, String guestQuery, AsyncValue<void> guestListImport, GuestListImportOrigin guestListImportOrigin, GuestImportDraft? guestImport, GuestImportTab guestImportTab, AsyncValue<bool?> guestListTemplate, File? image, AsyncValue<void> imageCrop, AsyncValue<EventSubmitResult?> submit, String? createdEventId
});


$EventLocationDraftCopyWith<$Res>? get location;$GuestImportDraftCopyWith<$Res>? get guestImport;

}
/// @nodoc
class _$CreateEventFlowStateCopyWithImpl<$Res>
    implements $CreateEventFlowStateCopyWith<$Res> {
  _$CreateEventFlowStateCopyWithImpl(this._self, this._then);

  final CreateEventFlowState _self;
  final $Res Function(CreateEventFlowState) _then;

/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isEditingFromReview = null,Object? occasionType = freezed,Object? templates = null,Object? templateName = freezed,Object? previewTab = null,Object? title = null,Object? date = freezed,Object? time = freezed,Object? venue = null,Object? hostedBy = null,Object? location = freezed,Object? guests = null,Object? recentlyAddedGuestIds = null,Object? guestQuery = null,Object? guestListImport = null,Object? guestListImportOrigin = null,Object? guestImport = freezed,Object? guestImportTab = null,Object? guestListTemplate = null,Object? image = freezed,Object? imageCrop = null,Object? submit = null,Object? createdEventId = freezed,}) {
  return _then(CreateEventFlowState(
isEditingFromReview: null == isEditingFromReview ? _self.isEditingFromReview : isEditingFromReview // ignore: cast_nullable_to_non_nullable
as bool,occasionType: freezed == occasionType ? _self.occasionType : occasionType // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<TemplateModel>>,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,previewTab: null == previewTab ? _self.previewTab : previewTab // ignore: cast_nullable_to_non_nullable
as TemplatePreviewTab,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,hostedBy: null == hostedBy ? _self.hostedBy : hostedBy // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as EventLocationDraft?,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as List<EventGuestDraft>,recentlyAddedGuestIds: null == recentlyAddedGuestIds ? _self.recentlyAddedGuestIds : recentlyAddedGuestIds // ignore: cast_nullable_to_non_nullable
as List<String>,guestQuery: null == guestQuery ? _self.guestQuery : guestQuery // ignore: cast_nullable_to_non_nullable
as String,guestListImport: null == guestListImport ? _self.guestListImport : guestListImport // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,guestListImportOrigin: null == guestListImportOrigin ? _self.guestListImportOrigin : guestListImportOrigin // ignore: cast_nullable_to_non_nullable
as GuestListImportOrigin,guestImport: freezed == guestImport ? _self.guestImport : guestImport // ignore: cast_nullable_to_non_nullable
as GuestImportDraft?,guestImportTab: null == guestImportTab ? _self.guestImportTab : guestImportTab // ignore: cast_nullable_to_non_nullable
as GuestImportTab,guestListTemplate: null == guestListTemplate ? _self.guestListTemplate : guestListTemplate // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool?>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,imageCrop: null == imageCrop ? _self.imageCrop : imageCrop // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,submit: null == submit ? _self.submit : submit // ignore: cast_nullable_to_non_nullable
as AsyncValue<EventSubmitResult?>,createdEventId: freezed == createdEventId ? _self.createdEventId : createdEventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventLocationDraftCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $EventLocationDraftCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuestImportDraftCopyWith<$Res>? get guestImport {
    if (_self.guestImport == null) {
    return null;
  }

  return $GuestImportDraftCopyWith<$Res>(_self.guestImport!, (value) {
    return _then(_self.copyWith(guestImport: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateEventFlowState].
extension CreateEventFlowStatePatterns on CreateEventFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEventFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEventFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEventFlowState value)  $default,){
final _that = this;
switch (_that) {
case _CreateEventFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEventFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEventFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isEditingFromReview,  String? occasionType,  AsyncValue<List<TemplateModel>> templates,  String? templateName,  TemplatePreviewTab previewTab,  String title,  DateTime? date,  TimeOfDay? time,  String venue,  String hostedBy,  EventLocationDraft? location,  List<EventGuestDraft> guests,  List<String> recentlyAddedGuestIds,  String guestQuery,  AsyncValue<void> guestListImport,  GuestListImportOrigin guestListImportOrigin,  GuestImportDraft? guestImport,  GuestImportTab guestImportTab,  AsyncValue<bool?> guestListTemplate,  File? image,  AsyncValue<void> imageCrop,  AsyncValue<EventSubmitResult?> submit,  String? createdEventId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEventFlowState() when $default != null:
return $default(_that.isEditingFromReview,_that.occasionType,_that.templates,_that.templateName,_that.previewTab,_that.title,_that.date,_that.time,_that.venue,_that.hostedBy,_that.location,_that.guests,_that.recentlyAddedGuestIds,_that.guestQuery,_that.guestListImport,_that.guestListImportOrigin,_that.guestImport,_that.guestImportTab,_that.guestListTemplate,_that.image,_that.imageCrop,_that.submit,_that.createdEventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isEditingFromReview,  String? occasionType,  AsyncValue<List<TemplateModel>> templates,  String? templateName,  TemplatePreviewTab previewTab,  String title,  DateTime? date,  TimeOfDay? time,  String venue,  String hostedBy,  EventLocationDraft? location,  List<EventGuestDraft> guests,  List<String> recentlyAddedGuestIds,  String guestQuery,  AsyncValue<void> guestListImport,  GuestListImportOrigin guestListImportOrigin,  GuestImportDraft? guestImport,  GuestImportTab guestImportTab,  AsyncValue<bool?> guestListTemplate,  File? image,  AsyncValue<void> imageCrop,  AsyncValue<EventSubmitResult?> submit,  String? createdEventId)  $default,) {final _that = this;
switch (_that) {
case _CreateEventFlowState():
return $default(_that.isEditingFromReview,_that.occasionType,_that.templates,_that.templateName,_that.previewTab,_that.title,_that.date,_that.time,_that.venue,_that.hostedBy,_that.location,_that.guests,_that.recentlyAddedGuestIds,_that.guestQuery,_that.guestListImport,_that.guestListImportOrigin,_that.guestImport,_that.guestImportTab,_that.guestListTemplate,_that.image,_that.imageCrop,_that.submit,_that.createdEventId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isEditingFromReview,  String? occasionType,  AsyncValue<List<TemplateModel>> templates,  String? templateName,  TemplatePreviewTab previewTab,  String title,  DateTime? date,  TimeOfDay? time,  String venue,  String hostedBy,  EventLocationDraft? location,  List<EventGuestDraft> guests,  List<String> recentlyAddedGuestIds,  String guestQuery,  AsyncValue<void> guestListImport,  GuestListImportOrigin guestListImportOrigin,  GuestImportDraft? guestImport,  GuestImportTab guestImportTab,  AsyncValue<bool?> guestListTemplate,  File? image,  AsyncValue<void> imageCrop,  AsyncValue<EventSubmitResult?> submit,  String? createdEventId)?  $default,) {final _that = this;
switch (_that) {
case _CreateEventFlowState() when $default != null:
return $default(_that.isEditingFromReview,_that.occasionType,_that.templates,_that.templateName,_that.previewTab,_that.title,_that.date,_that.time,_that.venue,_that.hostedBy,_that.location,_that.guests,_that.recentlyAddedGuestIds,_that.guestQuery,_that.guestListImport,_that.guestListImportOrigin,_that.guestImport,_that.guestImportTab,_that.guestListTemplate,_that.image,_that.imageCrop,_that.submit,_that.createdEventId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateEventFlowState extends CreateEventFlowState {
  const _CreateEventFlowState({this.isEditingFromReview = false, this.occasionType, this.templates = const AsyncLoading(), this.templateName, this.previewTab = TemplatePreviewTab.invitation, this.title = '', this.date, this.time, this.venue = '', this.hostedBy = '', this.location,  List<EventGuestDraft> guests = const [],  List<String> recentlyAddedGuestIds = const [], this.guestQuery = '', this.guestListImport = const AsyncData(null), this.guestListImportOrigin = GuestListImportOrigin.guests, this.guestImport, this.guestImportTab = GuestImportTab.needsFix, this.guestListTemplate = const AsyncData(null), this.image, this.imageCrop = const AsyncData(null), this.submit = const AsyncData(null), this.createdEventId}): _guests = guests,_recentlyAddedGuestIds = recentlyAddedGuestIds,super._();
  

@override@JsonKey() final  bool isEditingFromReview;
@override final  String? occasionType;
@override@JsonKey() final  AsyncValue<List<TemplateModel>> templates;
@override final  String? templateName;
@override@JsonKey() final  TemplatePreviewTab previewTab;
@override@JsonKey() final  String title;
@override final  DateTime? date;
@override final  TimeOfDay? time;
@override@JsonKey() final  String venue;
@override@JsonKey() final  String hostedBy;
@override final  EventLocationDraft? location;
 final  List<EventGuestDraft> _guests;
@override@JsonKey() List<EventGuestDraft> get guests {
  if (_guests is EqualUnmodifiableListView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guests);
}

 final  List<String> _recentlyAddedGuestIds;
@override@JsonKey() List<String> get recentlyAddedGuestIds {
  if (_recentlyAddedGuestIds is EqualUnmodifiableListView) return _recentlyAddedGuestIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlyAddedGuestIds);
}

@override@JsonKey() final  String guestQuery;
@override@JsonKey() final  AsyncValue<void> guestListImport;
@override@JsonKey() final  GuestListImportOrigin guestListImportOrigin;
@override final  GuestImportDraft? guestImport;
@override@JsonKey() final  GuestImportTab guestImportTab;
@override@JsonKey() final  AsyncValue<bool?> guestListTemplate;
@override final  File? image;
@override@JsonKey() final  AsyncValue<void> imageCrop;
@override@JsonKey() final  AsyncValue<EventSubmitResult?> submit;
@override final  String? createdEventId;

/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEventFlowStateCopyWith<_CreateEventFlowState> get copyWith => __$CreateEventFlowStateCopyWithImpl<_CreateEventFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEventFlowState&&(identical(other.isEditingFromReview, isEditingFromReview) || other.isEditingFromReview == isEditingFromReview)&&(identical(other.occasionType, occasionType) || other.occasionType == occasionType)&&(identical(other.templates, templates) || other.templates == templates)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.previewTab, previewTab) || other.previewTab == previewTab)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.hostedBy, hostedBy) || other.hostedBy == hostedBy)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.guests, _guests)&&const DeepCollectionEquality().equals(other.recentlyAddedGuestIds, _recentlyAddedGuestIds)&&(identical(other.guestQuery, guestQuery) || other.guestQuery == guestQuery)&&(identical(other.guestListImport, guestListImport) || other.guestListImport == guestListImport)&&(identical(other.guestListImportOrigin, guestListImportOrigin) || other.guestListImportOrigin == guestListImportOrigin)&&(identical(other.guestImport, guestImport) || other.guestImport == guestImport)&&(identical(other.guestImportTab, guestImportTab) || other.guestImportTab == guestImportTab)&&(identical(other.guestListTemplate, guestListTemplate) || other.guestListTemplate == guestListTemplate)&&(identical(other.image, image) || other.image == image)&&(identical(other.imageCrop, imageCrop) || other.imageCrop == imageCrop)&&(identical(other.submit, submit) || other.submit == submit)&&(identical(other.createdEventId, createdEventId) || other.createdEventId == createdEventId));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,isEditingFromReview,occasionType,templates,templateName,previewTab,title,date,time,venue,hostedBy,location,const DeepCollectionEquality().hash(_guests),const DeepCollectionEquality().hash(_recentlyAddedGuestIds),guestQuery,guestListImport,guestListImportOrigin,guestImport,guestImportTab,guestListTemplate,image,imageCrop,submit,createdEventId]);
}

@override
String toString() {
    return 'CreateEventFlowState(isEditingFromReview: $isEditingFromReview, occasionType: $occasionType, templates: $templates, templateName: $templateName, previewTab: $previewTab, title: $title, date: $date, time: $time, venue: $venue, hostedBy: $hostedBy, location: $location, guests: $guests, recentlyAddedGuestIds: $recentlyAddedGuestIds, guestQuery: $guestQuery, guestListImport: $guestListImport, guestListImportOrigin: $guestListImportOrigin, guestImport: $guestImport, guestImportTab: $guestImportTab, guestListTemplate: $guestListTemplate, image: $image, imageCrop: $imageCrop, submit: $submit, createdEventId: $createdEventId)';
}


}

/// @nodoc
abstract mixin class _$CreateEventFlowStateCopyWith<$Res> implements $CreateEventFlowStateCopyWith<$Res> {
  factory _$CreateEventFlowStateCopyWith(_CreateEventFlowState value, $Res Function(_CreateEventFlowState) _then) = __$CreateEventFlowStateCopyWithImpl;
@override @useResult
$Res call({
 bool isEditingFromReview, String? occasionType, AsyncValue<List<TemplateModel>> templates, String? templateName, TemplatePreviewTab previewTab, String title, DateTime? date, TimeOfDay? time, String venue, String hostedBy, EventLocationDraft? location, List<EventGuestDraft> guests, List<String> recentlyAddedGuestIds, String guestQuery, AsyncValue<void> guestListImport, GuestListImportOrigin guestListImportOrigin, GuestImportDraft? guestImport, GuestImportTab guestImportTab, AsyncValue<bool?> guestListTemplate, File? image, AsyncValue<void> imageCrop, AsyncValue<EventSubmitResult?> submit, String? createdEventId
});


@override $EventLocationDraftCopyWith<$Res>? get location;@override $GuestImportDraftCopyWith<$Res>? get guestImport;

}
/// @nodoc
class __$CreateEventFlowStateCopyWithImpl<$Res>
    implements _$CreateEventFlowStateCopyWith<$Res> {
  __$CreateEventFlowStateCopyWithImpl(this._self, this._then);

  final _CreateEventFlowState _self;
  final $Res Function(_CreateEventFlowState) _then;

/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isEditingFromReview = null,Object? occasionType = freezed,Object? templates = null,Object? templateName = freezed,Object? previewTab = null,Object? title = null,Object? date = freezed,Object? time = freezed,Object? venue = null,Object? hostedBy = null,Object? location = freezed,Object? guests = null,Object? recentlyAddedGuestIds = null,Object? guestQuery = null,Object? guestListImport = null,Object? guestListImportOrigin = null,Object? guestImport = freezed,Object? guestImportTab = null,Object? guestListTemplate = null,Object? image = freezed,Object? imageCrop = null,Object? submit = null,Object? createdEventId = freezed,}) {
  return _then(_CreateEventFlowState(
isEditingFromReview: null == isEditingFromReview ? _self.isEditingFromReview : isEditingFromReview // ignore: cast_nullable_to_non_nullable
as bool,occasionType: freezed == occasionType ? _self.occasionType : occasionType // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<TemplateModel>>,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,previewTab: null == previewTab ? _self.previewTab : previewTab // ignore: cast_nullable_to_non_nullable
as TemplatePreviewTab,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,hostedBy: null == hostedBy ? _self.hostedBy : hostedBy // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as EventLocationDraft?,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as List<EventGuestDraft>,recentlyAddedGuestIds: null == recentlyAddedGuestIds ? _self._recentlyAddedGuestIds : recentlyAddedGuestIds // ignore: cast_nullable_to_non_nullable
as List<String>,guestQuery: null == guestQuery ? _self.guestQuery : guestQuery // ignore: cast_nullable_to_non_nullable
as String,guestListImport: null == guestListImport ? _self.guestListImport : guestListImport // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,guestListImportOrigin: null == guestListImportOrigin ? _self.guestListImportOrigin : guestListImportOrigin // ignore: cast_nullable_to_non_nullable
as GuestListImportOrigin,guestImport: freezed == guestImport ? _self.guestImport : guestImport // ignore: cast_nullable_to_non_nullable
as GuestImportDraft?,guestImportTab: null == guestImportTab ? _self.guestImportTab : guestImportTab // ignore: cast_nullable_to_non_nullable
as GuestImportTab,guestListTemplate: null == guestListTemplate ? _self.guestListTemplate : guestListTemplate // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool?>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,imageCrop: null == imageCrop ? _self.imageCrop : imageCrop // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,submit: null == submit ? _self.submit : submit // ignore: cast_nullable_to_non_nullable
as AsyncValue<EventSubmitResult?>,createdEventId: freezed == createdEventId ? _self.createdEventId : createdEventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventLocationDraftCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $EventLocationDraftCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of CreateEventFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuestImportDraftCopyWith<$Res>? get guestImport {
    if (_self.guestImport == null) {
    return null;
  }

  return $GuestImportDraftCopyWith<$Res>(_self.guestImport!, (value) {
    return _then(_self.copyWith(guestImport: value));
  });
}
}

/// @nodoc
mixin _$EventGuestDraft {

 String get id; String get name; GuestPhoneNumber get phone; int get seats;
/// Create a copy of EventGuestDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventGuestDraftCopyWith<EventGuestDraft> get copyWith => _$EventGuestDraftCopyWithImpl<EventGuestDraft>(this as EventGuestDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EventGuestDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventGuestDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.seats, _this.seats) || other.seats == _this.seats));
}


@override
int get hashCode {
  final _this = this as EventGuestDraft;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.seats);
}

@override
String toString() {
  final _this = this as EventGuestDraft;
  return 'EventGuestDraft(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, seats: ${_this.seats})';
}


}

/// @nodoc
abstract mixin class $EventGuestDraftCopyWith<$Res>  {
  factory $EventGuestDraftCopyWith(EventGuestDraft value, $Res Function(EventGuestDraft) _then) = _$EventGuestDraftCopyWithImpl;
@useResult
$Res call({
 String id, String name, GuestPhoneNumber phone, int seats
});




}
/// @nodoc
class _$EventGuestDraftCopyWithImpl<$Res>
    implements $EventGuestDraftCopyWith<$Res> {
  _$EventGuestDraftCopyWithImpl(this._self, this._then);

  final EventGuestDraft _self;
  final $Res Function(EventGuestDraft) _then;

/// Create a copy of EventGuestDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? seats = null,}) {
  return _then(EventGuestDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EventGuestDraft].
extension EventGuestDraftPatterns on EventGuestDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventGuestDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventGuestDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventGuestDraft value)  $default,){
final _that = this;
switch (_that) {
case _EventGuestDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventGuestDraft value)?  $default,){
final _that = this;
switch (_that) {
case _EventGuestDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  GuestPhoneNumber phone,  int seats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventGuestDraft() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.seats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  GuestPhoneNumber phone,  int seats)  $default,) {final _that = this;
switch (_that) {
case _EventGuestDraft():
return $default(_that.id,_that.name,_that.phone,_that.seats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  GuestPhoneNumber phone,  int seats)?  $default,) {final _that = this;
switch (_that) {
case _EventGuestDraft() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.seats);case _:
  return null;

}
}

}

/// @nodoc


class _EventGuestDraft implements EventGuestDraft {
  const _EventGuestDraft({required this.id, required this.name, required this.phone, this.seats = CreateEventFlowConstants.defaultSeats});
  

@override final  String id;
@override final  String name;
@override final  GuestPhoneNumber phone;
@override@JsonKey() final  int seats;

/// Create a copy of EventGuestDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventGuestDraftCopyWith<_EventGuestDraft> get copyWith => __$EventGuestDraftCopyWithImpl<_EventGuestDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventGuestDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.seats, seats) || other.seats == seats));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,seats);
}

@override
String toString() {
    return 'EventGuestDraft(id: $id, name: $name, phone: $phone, seats: $seats)';
}


}

/// @nodoc
abstract mixin class _$EventGuestDraftCopyWith<$Res> implements $EventGuestDraftCopyWith<$Res> {
  factory _$EventGuestDraftCopyWith(_EventGuestDraft value, $Res Function(_EventGuestDraft) _then) = __$EventGuestDraftCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, GuestPhoneNumber phone, int seats
});




}
/// @nodoc
class __$EventGuestDraftCopyWithImpl<$Res>
    implements _$EventGuestDraftCopyWith<$Res> {
  __$EventGuestDraftCopyWithImpl(this._self, this._then);

  final _EventGuestDraft _self;
  final $Res Function(_EventGuestDraft) _then;

/// Create a copy of EventGuestDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? seats = null,}) {
  return _then(_EventGuestDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$GuestImportDraft {

 String get fileName; int get rowsFound; List<GuestImportEntry> get entries;
/// Create a copy of GuestImportDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestImportDraftCopyWith<GuestImportDraft> get copyWith => _$GuestImportDraftCopyWithImpl<GuestImportDraft>(this as GuestImportDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GuestImportDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestImportDraft&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.rowsFound, _this.rowsFound) || other.rowsFound == _this.rowsFound)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as GuestImportDraft;
  return Object.hash(runtimeType,_this.fileName,_this.rowsFound,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as GuestImportDraft;
  return 'GuestImportDraft(fileName: ${_this.fileName}, rowsFound: ${_this.rowsFound}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $GuestImportDraftCopyWith<$Res>  {
  factory $GuestImportDraftCopyWith(GuestImportDraft value, $Res Function(GuestImportDraft) _then) = _$GuestImportDraftCopyWithImpl;
@useResult
$Res call({
 String fileName, int rowsFound, List<GuestImportEntry> entries
});




}
/// @nodoc
class _$GuestImportDraftCopyWithImpl<$Res>
    implements $GuestImportDraftCopyWith<$Res> {
  _$GuestImportDraftCopyWithImpl(this._self, this._then);

  final GuestImportDraft _self;
  final $Res Function(GuestImportDraft) _then;

/// Create a copy of GuestImportDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? rowsFound = null,Object? entries = null,}) {
  return _then(GuestImportDraft(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,rowsFound: null == rowsFound ? _self.rowsFound : rowsFound // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<GuestImportEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestImportDraft].
extension GuestImportDraftPatterns on GuestImportDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestImportDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestImportDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestImportDraft value)  $default,){
final _that = this;
switch (_that) {
case _GuestImportDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestImportDraft value)?  $default,){
final _that = this;
switch (_that) {
case _GuestImportDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  int rowsFound,  List<GuestImportEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestImportDraft() when $default != null:
return $default(_that.fileName,_that.rowsFound,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  int rowsFound,  List<GuestImportEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _GuestImportDraft():
return $default(_that.fileName,_that.rowsFound,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  int rowsFound,  List<GuestImportEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _GuestImportDraft() when $default != null:
return $default(_that.fileName,_that.rowsFound,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _GuestImportDraft extends GuestImportDraft {
  const _GuestImportDraft({required this.fileName, required this.rowsFound,  List<GuestImportEntry> entries = const []}): _entries = entries,super._();
  

@override final  String fileName;
@override final  int rowsFound;
 final  List<GuestImportEntry> _entries;
@override@JsonKey() List<GuestImportEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of GuestImportDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestImportDraftCopyWith<_GuestImportDraft> get copyWith => __$GuestImportDraftCopyWithImpl<_GuestImportDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestImportDraft&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.rowsFound, rowsFound) || other.rowsFound == rowsFound)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileName,rowsFound,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'GuestImportDraft(fileName: $fileName, rowsFound: $rowsFound, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$GuestImportDraftCopyWith<$Res> implements $GuestImportDraftCopyWith<$Res> {
  factory _$GuestImportDraftCopyWith(_GuestImportDraft value, $Res Function(_GuestImportDraft) _then) = __$GuestImportDraftCopyWithImpl;
@override @useResult
$Res call({
 String fileName, int rowsFound, List<GuestImportEntry> entries
});




}
/// @nodoc
class __$GuestImportDraftCopyWithImpl<$Res>
    implements _$GuestImportDraftCopyWith<$Res> {
  __$GuestImportDraftCopyWithImpl(this._self, this._then);

  final _GuestImportDraft _self;
  final $Res Function(_GuestImportDraft) _then;

/// Create a copy of GuestImportDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? rowsFound = null,Object? entries = null,}) {
  return _then(_GuestImportDraft(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,rowsFound: null == rowsFound ? _self.rowsFound : rowsFound // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<GuestImportEntry>,
  ));
}


}

/// @nodoc
mixin _$GuestImportEntry {

 String get id; int get rowNumber; String get name; String get rawPhone; int get seats; GuestPhoneNumber? get phone; GuestImportIssue? get issue;
/// Create a copy of GuestImportEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestImportEntryCopyWith<GuestImportEntry> get copyWith => _$GuestImportEntryCopyWithImpl<GuestImportEntry>(this as GuestImportEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GuestImportEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestImportEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rowNumber, _this.rowNumber) || other.rowNumber == _this.rowNumber)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.rawPhone, _this.rawPhone) || other.rawPhone == _this.rawPhone)&&(identical(other.seats, _this.seats) || other.seats == _this.seats)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.issue, _this.issue) || other.issue == _this.issue));
}


@override
int get hashCode {
  final _this = this as GuestImportEntry;
  return Object.hash(runtimeType,_this.id,_this.rowNumber,_this.name,_this.rawPhone,_this.seats,_this.phone,_this.issue);
}

@override
String toString() {
  final _this = this as GuestImportEntry;
  return 'GuestImportEntry(id: ${_this.id}, rowNumber: ${_this.rowNumber}, name: ${_this.name}, rawPhone: ${_this.rawPhone}, seats: ${_this.seats}, phone: ${_this.phone}, issue: ${_this.issue})';
}


}

/// @nodoc
abstract mixin class $GuestImportEntryCopyWith<$Res>  {
  factory $GuestImportEntryCopyWith(GuestImportEntry value, $Res Function(GuestImportEntry) _then) = _$GuestImportEntryCopyWithImpl;
@useResult
$Res call({
 String id, int rowNumber, String name, String rawPhone, int seats, GuestPhoneNumber? phone, GuestImportIssue? issue
});




}
/// @nodoc
class _$GuestImportEntryCopyWithImpl<$Res>
    implements $GuestImportEntryCopyWith<$Res> {
  _$GuestImportEntryCopyWithImpl(this._self, this._then);

  final GuestImportEntry _self;
  final $Res Function(GuestImportEntry) _then;

/// Create a copy of GuestImportEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rowNumber = null,Object? name = null,Object? rawPhone = null,Object? seats = null,Object? phone = freezed,Object? issue = freezed,}) {
  return _then(GuestImportEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rowNumber: null == rowNumber ? _self.rowNumber : rowNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rawPhone: null == rawPhone ? _self.rawPhone : rawPhone // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as GuestImportIssue?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestImportEntry].
extension GuestImportEntryPatterns on GuestImportEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestImportEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestImportEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestImportEntry value)  $default,){
final _that = this;
switch (_that) {
case _GuestImportEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestImportEntry value)?  $default,){
final _that = this;
switch (_that) {
case _GuestImportEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int rowNumber,  String name,  String rawPhone,  int seats,  GuestPhoneNumber? phone,  GuestImportIssue? issue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestImportEntry() when $default != null:
return $default(_that.id,_that.rowNumber,_that.name,_that.rawPhone,_that.seats,_that.phone,_that.issue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int rowNumber,  String name,  String rawPhone,  int seats,  GuestPhoneNumber? phone,  GuestImportIssue? issue)  $default,) {final _that = this;
switch (_that) {
case _GuestImportEntry():
return $default(_that.id,_that.rowNumber,_that.name,_that.rawPhone,_that.seats,_that.phone,_that.issue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int rowNumber,  String name,  String rawPhone,  int seats,  GuestPhoneNumber? phone,  GuestImportIssue? issue)?  $default,) {final _that = this;
switch (_that) {
case _GuestImportEntry() when $default != null:
return $default(_that.id,_that.rowNumber,_that.name,_that.rawPhone,_that.seats,_that.phone,_that.issue);case _:
  return null;

}
}

}

/// @nodoc


class _GuestImportEntry extends GuestImportEntry {
  const _GuestImportEntry({required this.id, required this.rowNumber, this.name = '', this.rawPhone = '', this.seats = CreateEventFlowConstants.defaultSeats, this.phone, this.issue}): super._();
  

@override final  String id;
@override final  int rowNumber;
@override@JsonKey() final  String name;
@override@JsonKey() final  String rawPhone;
@override@JsonKey() final  int seats;
@override final  GuestPhoneNumber? phone;
@override final  GuestImportIssue? issue;

/// Create a copy of GuestImportEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestImportEntryCopyWith<_GuestImportEntry> get copyWith => __$GuestImportEntryCopyWithImpl<_GuestImportEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestImportEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.rowNumber, rowNumber) || other.rowNumber == rowNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.rawPhone, rawPhone) || other.rawPhone == rawPhone)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.issue, issue) || other.issue == issue));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,rowNumber,name,rawPhone,seats,phone,issue);
}

@override
String toString() {
    return 'GuestImportEntry(id: $id, rowNumber: $rowNumber, name: $name, rawPhone: $rawPhone, seats: $seats, phone: $phone, issue: $issue)';
}


}

/// @nodoc
abstract mixin class _$GuestImportEntryCopyWith<$Res> implements $GuestImportEntryCopyWith<$Res> {
  factory _$GuestImportEntryCopyWith(_GuestImportEntry value, $Res Function(_GuestImportEntry) _then) = __$GuestImportEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, int rowNumber, String name, String rawPhone, int seats, GuestPhoneNumber? phone, GuestImportIssue? issue
});




}
/// @nodoc
class __$GuestImportEntryCopyWithImpl<$Res>
    implements _$GuestImportEntryCopyWith<$Res> {
  __$GuestImportEntryCopyWithImpl(this._self, this._then);

  final _GuestImportEntry _self;
  final $Res Function(_GuestImportEntry) _then;

/// Create a copy of GuestImportEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rowNumber = null,Object? name = null,Object? rawPhone = null,Object? seats = null,Object? phone = freezed,Object? issue = freezed,}) {
  return _then(_GuestImportEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rowNumber: null == rowNumber ? _self.rowNumber : rowNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rawPhone: null == rawPhone ? _self.rawPhone : rawPhone // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as GuestPhoneNumber?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as GuestImportIssue?,
  ));
}


}

/// @nodoc
mixin _$EventLocationDraft {

 String get locationName; String get latitude; String get longitude; String get mapLink;
/// Create a copy of EventLocationDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventLocationDraftCopyWith<EventLocationDraft> get copyWith => _$EventLocationDraftCopyWithImpl<EventLocationDraft>(this as EventLocationDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EventLocationDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventLocationDraft&&(identical(other.locationName, _this.locationName) || other.locationName == _this.locationName)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.mapLink, _this.mapLink) || other.mapLink == _this.mapLink));
}


@override
int get hashCode {
  final _this = this as EventLocationDraft;
  return Object.hash(runtimeType,_this.locationName,_this.latitude,_this.longitude,_this.mapLink);
}

@override
String toString() {
  final _this = this as EventLocationDraft;
  return 'EventLocationDraft(locationName: ${_this.locationName}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, mapLink: ${_this.mapLink})';
}


}

/// @nodoc
abstract mixin class $EventLocationDraftCopyWith<$Res>  {
  factory $EventLocationDraftCopyWith(EventLocationDraft value, $Res Function(EventLocationDraft) _then) = _$EventLocationDraftCopyWithImpl;
@useResult
$Res call({
 String locationName, String latitude, String longitude, String mapLink
});




}
/// @nodoc
class _$EventLocationDraftCopyWithImpl<$Res>
    implements $EventLocationDraftCopyWith<$Res> {
  _$EventLocationDraftCopyWithImpl(this._self, this._then);

  final EventLocationDraft _self;
  final $Res Function(EventLocationDraft) _then;

/// Create a copy of EventLocationDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationName = null,Object? latitude = null,Object? longitude = null,Object? mapLink = null,}) {
  return _then(EventLocationDraft(
locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EventLocationDraft].
extension EventLocationDraftPatterns on EventLocationDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventLocationDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventLocationDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventLocationDraft value)  $default,){
final _that = this;
switch (_that) {
case _EventLocationDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventLocationDraft value)?  $default,){
final _that = this;
switch (_that) {
case _EventLocationDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locationName,  String latitude,  String longitude,  String mapLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventLocationDraft() when $default != null:
return $default(_that.locationName,_that.latitude,_that.longitude,_that.mapLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locationName,  String latitude,  String longitude,  String mapLink)  $default,) {final _that = this;
switch (_that) {
case _EventLocationDraft():
return $default(_that.locationName,_that.latitude,_that.longitude,_that.mapLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locationName,  String latitude,  String longitude,  String mapLink)?  $default,) {final _that = this;
switch (_that) {
case _EventLocationDraft() when $default != null:
return $default(_that.locationName,_that.latitude,_that.longitude,_that.mapLink);case _:
  return null;

}
}

}

/// @nodoc


class _EventLocationDraft implements EventLocationDraft {
  const _EventLocationDraft({required this.locationName, required this.latitude, required this.longitude, required this.mapLink});
  

@override final  String locationName;
@override final  String latitude;
@override final  String longitude;
@override final  String mapLink;

/// Create a copy of EventLocationDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventLocationDraftCopyWith<_EventLocationDraft> get copyWith => __$EventLocationDraftCopyWithImpl<_EventLocationDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLocationDraft&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.mapLink, mapLink) || other.mapLink == mapLink));
}


@override
int get hashCode {
    return Object.hash(runtimeType,locationName,latitude,longitude,mapLink);
}

@override
String toString() {
    return 'EventLocationDraft(locationName: $locationName, latitude: $latitude, longitude: $longitude, mapLink: $mapLink)';
}


}

/// @nodoc
abstract mixin class _$EventLocationDraftCopyWith<$Res> implements $EventLocationDraftCopyWith<$Res> {
  factory _$EventLocationDraftCopyWith(_EventLocationDraft value, $Res Function(_EventLocationDraft) _then) = __$EventLocationDraftCopyWithImpl;
@override @useResult
$Res call({
 String locationName, String latitude, String longitude, String mapLink
});




}
/// @nodoc
class __$EventLocationDraftCopyWithImpl<$Res>
    implements _$EventLocationDraftCopyWith<$Res> {
  __$EventLocationDraftCopyWithImpl(this._self, this._then);

  final _EventLocationDraft _self;
  final $Res Function(_EventLocationDraft) _then;

/// Create a copy of EventLocationDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationName = null,Object? latitude = null,Object? longitude = null,Object? mapLink = null,}) {
  return _then(_EventLocationDraft(
locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EventSubmitResult {

 String get eventId; bool get isSent;
/// Create a copy of EventSubmitResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventSubmitResultCopyWith<EventSubmitResult> get copyWith => _$EventSubmitResultCopyWithImpl<EventSubmitResult>(this as EventSubmitResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EventSubmitResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventSubmitResult&&(identical(other.eventId, _this.eventId) || other.eventId == _this.eventId)&&(identical(other.isSent, _this.isSent) || other.isSent == _this.isSent));
}


@override
int get hashCode {
  final _this = this as EventSubmitResult;
  return Object.hash(runtimeType,_this.eventId,_this.isSent);
}

@override
String toString() {
  final _this = this as EventSubmitResult;
  return 'EventSubmitResult(eventId: ${_this.eventId}, isSent: ${_this.isSent})';
}


}

/// @nodoc
abstract mixin class $EventSubmitResultCopyWith<$Res>  {
  factory $EventSubmitResultCopyWith(EventSubmitResult value, $Res Function(EventSubmitResult) _then) = _$EventSubmitResultCopyWithImpl;
@useResult
$Res call({
 String eventId, bool isSent
});




}
/// @nodoc
class _$EventSubmitResultCopyWithImpl<$Res>
    implements $EventSubmitResultCopyWith<$Res> {
  _$EventSubmitResultCopyWithImpl(this._self, this._then);

  final EventSubmitResult _self;
  final $Res Function(EventSubmitResult) _then;

/// Create a copy of EventSubmitResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventId = null,Object? isSent = null,}) {
  return _then(EventSubmitResult(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EventSubmitResult].
extension EventSubmitResultPatterns on EventSubmitResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventSubmitResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventSubmitResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventSubmitResult value)  $default,){
final _that = this;
switch (_that) {
case _EventSubmitResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventSubmitResult value)?  $default,){
final _that = this;
switch (_that) {
case _EventSubmitResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eventId,  bool isSent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventSubmitResult() when $default != null:
return $default(_that.eventId,_that.isSent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eventId,  bool isSent)  $default,) {final _that = this;
switch (_that) {
case _EventSubmitResult():
return $default(_that.eventId,_that.isSent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eventId,  bool isSent)?  $default,) {final _that = this;
switch (_that) {
case _EventSubmitResult() when $default != null:
return $default(_that.eventId,_that.isSent);case _:
  return null;

}
}

}

/// @nodoc


class _EventSubmitResult implements EventSubmitResult {
  const _EventSubmitResult({required this.eventId, required this.isSent});
  

@override final  String eventId;
@override final  bool isSent;

/// Create a copy of EventSubmitResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventSubmitResultCopyWith<_EventSubmitResult> get copyWith => __$EventSubmitResultCopyWithImpl<_EventSubmitResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSubmitResult&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.isSent, isSent) || other.isSent == isSent));
}


@override
int get hashCode {
    return Object.hash(runtimeType,eventId,isSent);
}

@override
String toString() {
    return 'EventSubmitResult(eventId: $eventId, isSent: $isSent)';
}


}

/// @nodoc
abstract mixin class _$EventSubmitResultCopyWith<$Res> implements $EventSubmitResultCopyWith<$Res> {
  factory _$EventSubmitResultCopyWith(_EventSubmitResult value, $Res Function(_EventSubmitResult) _then) = __$EventSubmitResultCopyWithImpl;
@override @useResult
$Res call({
 String eventId, bool isSent
});




}
/// @nodoc
class __$EventSubmitResultCopyWithImpl<$Res>
    implements _$EventSubmitResultCopyWith<$Res> {
  __$EventSubmitResultCopyWithImpl(this._self, this._then);

  final _EventSubmitResult _self;
  final $Res Function(_EventSubmitResult) _then;

/// Create a copy of EventSubmitResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? isSent = null,}) {
  return _then(_EventSubmitResult(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
