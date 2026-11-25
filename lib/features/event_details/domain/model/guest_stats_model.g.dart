// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuestStatsModel _$GuestStatsModelFromJson(Map<String, dynamic> json) =>
    _GuestStatsModel(
      confirmed: (json['confirmed'] as num?)?.toInt() ?? 0,
      noReply: (json['no_reply'] as num?)?.toInt() ?? 0,
      declined: (json['declined'] as num?)?.toInt() ?? 0,
      notDelivered: (json['not_delivered'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$GuestStatsModelToJson(_GuestStatsModel instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'no_reply': instance.noReply,
      'declined': instance.declined,
      'not_delivered': instance.notDelivered,
    };
