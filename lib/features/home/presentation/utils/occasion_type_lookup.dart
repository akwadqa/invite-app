import 'package:invit/features/home/domain/model/ocation%20type/ocation_type_model.dart';

extension OccasionTypeLookup on List<OcationTypeModel> {
  /// The occasion type an event's `type` refers to, ignoring case and extra
  /// spaces; `null` when the response has no such type.
  OcationTypeModel? byName(String? name) {
    final key = _normalize(name);
    if (key.isEmpty) return null;
    return where((type) => _normalize(type.title) == key).firstOrNull;
  }

  static String _normalize(String? value) => (value ?? '').trim().toLowerCase();
}
