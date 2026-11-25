import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_stats_model.freezed.dart';
part 'guest_stats_model.g.dart';

/// Replies summary of an event (`guest_stats`). `notDelivered` guests are
/// already counted inside `noReply`.
@freezed
abstract class GuestStatsModel with _$GuestStatsModel {
  const factory GuestStatsModel({
    @Default(0) int confirmed,
    @JsonKey(name: 'no_reply') @Default(0) int noReply,
    @Default(0) int declined,
    @JsonKey(name: 'not_delivered') @Default(0) int notDelivered,
  }) = _GuestStatsModel;

  factory GuestStatsModel.fromJson(Map<String, dynamic> json) =>
      _$GuestStatsModelFromJson(json);
}
