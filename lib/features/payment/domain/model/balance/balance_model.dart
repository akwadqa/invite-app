import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

/// `data` of the message balance endpoint: messages left plus one page of
/// the usage / purchase history.
@freezed
abstract class BalanceModel with _$BalanceModel {
  const factory BalanceModel({
    @JsonKey(name: 'messages_left') num? messagesLeft,
    @Default([]) List<BalanceHistoryModel> history,
  }) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}

/// One history line. A negative `amount` is messages spent, a positive one is
/// credit bought with a bundle.
@freezed
abstract class BalanceHistoryModel with _$BalanceHistoryModel {
  const BalanceHistoryModel._();

  const factory BalanceHistoryModel({
    String? id,
    String? date,
    String? type,
    String? title,
    String? subtitle,
    num? amount,
    @JsonKey(name: 'balance_after') num? balanceAfter,
    String? occasion,
    String? bundle,
    @JsonKey(name: 'paid_amount') num? paidAmount,
  }) = _BalanceHistoryModel;

  factory BalanceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceHistoryModelFromJson(json);

  /// Credit added to the balance (a purchase) rather than messages spent.
  bool get isCredit => (amount ?? 0) > 0;

  DateTime? get dateTime => date == null ? null : DateTime.tryParse(date!);
}
