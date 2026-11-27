// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_invitation_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResendInvitationResultModel _$ResendInvitationResultModelFromJson(
  Map<String, dynamic> json,
) => _ResendInvitationResultModel(
  inviteeId: json['invitee_id'] as String?,
  messagesUsed: (json['messages_used'] as num?)?.toInt(),
  messagesLeft: (json['messages_left'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResendInvitationResultModelToJson(
  _ResendInvitationResultModel instance,
) => <String, dynamic>{
  'invitee_id': instance.inviteeId,
  'messages_used': instance.messagesUsed,
  'messages_left': instance.messagesLeft,
};
