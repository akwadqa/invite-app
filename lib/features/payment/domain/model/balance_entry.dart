enum BalanceEntryKind { invitations, reminders, purchase }

/// One line of the balance history: messages spent on an event, or credit
/// bought with a plan.
class BalanceEntry {
  const BalanceEntry({
    required this.kind,
    required this.label,
    required this.date,
    required this.amount,
    this.price,
  });

  final BalanceEntryKind kind;

  /// Event title for usage lines, plan name for purchases.
  final String label;
  final DateTime date;

  /// Messages spent or bought (always positive).
  final int amount;

  /// Amount paid, for purchases only.
  final num? price;

  bool get isCredit => kind == BalanceEntryKind.purchase;
}
