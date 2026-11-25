// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) =>
    _BalanceModel(
      messagesLeft: json['messages_left'] as num?,
      history:
          (json['history'] as List<dynamic>?)
              ?.map(
                (e) => BalanceHistoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BalanceModelToJson(_BalanceModel instance) =>
    <String, dynamic>{
      'messages_left': instance.messagesLeft,
      'history': instance.history,
    };

_BalanceHistoryModel _$BalanceHistoryModelFromJson(Map<String, dynamic> json) =>
    _BalanceHistoryModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      amount: json['amount'] as num?,
      balanceAfter: json['balance_after'] as num?,
      occasion: json['occasion'] as String?,
      bundle: json['bundle'] as String?,
      paidAmount: json['paid_amount'] as num?,
    );

Map<String, dynamic> _$BalanceHistoryModelToJson(
  _BalanceHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'type': instance.type,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'amount': instance.amount,
  'balance_after': instance.balanceAfter,
  'occasion': instance.occasion,
  'bundle': instance.bundle,
  'paid_amount': instance.paidAmount,
};
