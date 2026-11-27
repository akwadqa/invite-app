import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_templates_model.freezed.dart';
part 'reminder_templates_model.g.dart';

/// The WhatsApp reminder messages, one per kind of guest.
@freezed
abstract class ReminderTemplatesModel with _$ReminderTemplatesModel {
  const factory ReminderTemplatesModel({
    @JsonKey(name: 'no_reply') ReminderTemplateModel? noReply,
    ReminderTemplateModel? confirmed,
  }) = _ReminderTemplatesModel;

  factory ReminderTemplatesModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderTemplatesModelFromJson(json);
}

@freezed
abstract class ReminderTemplateModel with _$ReminderTemplateModel {
  const factory ReminderTemplateModel({
    bool? available,
    String? error,
    String? name,
    String? language,
    @JsonKey(name: 'header_type') String? headerType,
    String? header,
    String? image,
    String? message,
    String? footer,
    List<ReminderTemplateButton>? buttons,
  }) = _ReminderTemplateModel;

  factory ReminderTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderTemplateModelFromJson(json);
}

@freezed
abstract class ReminderTemplateButton with _$ReminderTemplateButton {
  const factory ReminderTemplateButton({String? type, String? label}) =
      _ReminderTemplateButton;

  factory ReminderTemplateButton.fromJson(Map<String, dynamic> json) =>
      _$ReminderTemplateButtonFromJson(json);
}
