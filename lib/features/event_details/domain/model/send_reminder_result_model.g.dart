// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_reminder_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendReminderResultModel _$SendReminderResultModelFromJson(
  Map<String, dynamic> json,
) => _SendReminderResultModel(
  audience: json['audience'] as String?,
  remindedCount: (json['reminded_count'] as num?)?.toInt(),
  messagesUsed: (json['messages_used'] as num?)?.toInt(),
  messagesLeft: (json['messages_left'] as num?)?.toInt(),
);

Map<String, dynamic> _$SendReminderResultModelToJson(
  _SendReminderResultModel instance,
) => <String, dynamic>{
  'audience': instance.audience,
  'reminded_count': instance.remindedCount,
  'messages_used': instance.messagesUsed,
  'messages_left': instance.messagesLeft,
};
