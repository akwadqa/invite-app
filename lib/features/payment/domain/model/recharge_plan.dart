/// A message plan the user can buy, built from a home-feed bundle.
class RechargePlan {
  const RechargePlan({
    required this.id,
    required this.name,
    required this.messages,
    required this.price,
  });

  /// The bundle name, which is what the payment endpoint expects.
  final String id;
  final String name;
  final int messages;
  final num price;
}
