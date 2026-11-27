// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_templates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderTemplatesModel _$ReminderTemplatesModelFromJson(
  Map<String, dynamic> json,
) => _ReminderTemplatesModel(
  noReply: json['no_reply'] == null
      ? null
      : ReminderTemplateModel.fromJson(
          json['no_reply'] as Map<String, dynamic>,
        ),
  confirmed: json['confirmed'] == null
      ? null
      : ReminderTemplateModel.fromJson(
          json['confirmed'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ReminderTemplatesModelToJson(
  _ReminderTemplatesModel instance,
) => <String, dynamic>{
  'no_reply': instance.noReply,
  'confirmed': instance.confirmed,
};

_ReminderTemplateModel _$ReminderTemplateModelFromJson(
  Map<String, dynamic> json,
) => _ReminderTemplateModel(
  available: json['available'] as bool?,
  error: json['error'] as String?,
  name: json['name'] as String?,
  language: json['language'] as String?,
  headerType: json['header_type'] as String?,
  header: json['header'] as String?,
  image: json['image'] as String?,
  message: json['message'] as String?,
  footer: json['footer'] as String?,
  buttons: (json['buttons'] as List<dynamic>?)
      ?.map((e) => ReminderTemplateButton.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReminderTemplateModelToJson(
  _ReminderTemplateModel instance,
) => <String, dynamic>{
  'available': instance.available,
  'error': instance.error,
  'name': instance.name,
  'language': instance.language,
  'header_type': instance.headerType,
  'header': instance.header,
  'image': instance.image,
  'message': instance.message,
  'footer': instance.footer,
  'buttons': instance.buttons,
};

_ReminderTemplateButton _$ReminderTemplateButtonFromJson(
  Map<String, dynamic> json,
) => _ReminderTemplateButton(
  type: json['type'] as String?,
  label: json['label'] as String?,
);

Map<String, dynamic> _$ReminderTemplateButtonToJson(
  _ReminderTemplateButton instance,
) => <String, dynamic>{'type': instance.type, 'label': instance.label};
