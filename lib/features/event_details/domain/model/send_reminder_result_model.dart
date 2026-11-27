import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_reminder_result_model.freezed.dart';
part 'send_reminder_result_model.g.dart';

/// The summary of a sent reminder.
@freezed
abstract class SendReminderResultModel with _$SendReminderResultModel {
  const factory SendReminderResultModel({
    String? audience,
    @JsonKey(name: 'reminded_count') int? remindedCount,
    @JsonKey(name: 'messages_used') int? messagesUsed,
    @JsonKey(name: 'messages_left') int? messagesLeft,
  }) = _SendReminderResultModel;

  factory SendReminderResultModel.fromJson(Map<String, dynamic> json) =>
      _$SendReminderResultModelFromJson(json);
}
