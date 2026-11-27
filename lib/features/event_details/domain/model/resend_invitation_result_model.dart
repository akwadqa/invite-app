import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_invitation_result_model.freezed.dart';
part 'resend_invitation_result_model.g.dart';

/// The result of resending one guest's invitation.
@freezed
abstract class ResendInvitationResultModel with _$ResendInvitationResultModel {
  const factory ResendInvitationResultModel({
    @JsonKey(name: 'invitee_id') String? inviteeId,
    @JsonKey(name: 'messages_used') int? messagesUsed,
    @JsonKey(name: 'messages_left') int? messagesLeft,
  }) = _ResendInvitationResultModel;

  factory ResendInvitationResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResendInvitationResultModelFromJson(json);
}
