// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_enough_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotEnoughMessagesModel _$NotEnoughMessagesModelFromJson(
  Map<String, dynamic> json,
) => _NotEnoughMessagesModel(
  needed: (json['needed'] as num?)?.toInt(),
  available: (json['available'] as num?)?.toInt(),
  missing: (json['missing'] as num?)?.toInt(),
);

Map<String, dynamic> _$NotEnoughMessagesModelToJson(
  _NotEnoughMessagesModel instance,
) => <String, dynamic>{
  'needed': instance.needed,
  'available': instance.available,
  'missing': instance.missing,
};
