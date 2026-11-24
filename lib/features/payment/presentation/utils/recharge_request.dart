/// What the user was doing when they ran out of messages.
enum PaymentFollowUp {
  /// A plain top-up (or an action the user repeats by hand afterwards).
  none,

  /// Resending the invitations that failed: it is run once the payment is
  /// confirmed.
  resendFailed,
}

/// Why the recharge flow was opened.
class RechargeRequest {
  const RechargeRequest({
    this.needed = 0,
    this.eventId,
    this.followUp = PaymentFollowUp.none,
  });

  /// Messages the user's action needs; `0` for a plain top-up.
  final int needed;

  /// The event the [followUp] belongs to.
  final String? eventId;
  final PaymentFollowUp followUp;

  @override
  bool operator ==(Object other) =>
      other is RechargeRequest &&
      other.needed == needed &&
      other.eventId == eventId &&
      other.followUp == followUp;

  @override
  int get hashCode => Object.hash(needed, eventId, followUp);
}
