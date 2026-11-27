import 'package:freezed_annotation/freezed_annotation.dart';

part 'not_enough_messages_model.freezed.dart';
part 'not_enough_messages_model.g.dart';

/// The body of a 402 "Not enough messages" response.
@freezed
abstract class NotEnoughMessagesModel with _$NotEnoughMessagesModel {
  const factory NotEnoughMessagesModel({
    int? needed,
    int? available,
    int? missing,
  }) = _NotEnoughMessagesModel;

  factory NotEnoughMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$NotEnoughMessagesModelFromJson(json);
}
