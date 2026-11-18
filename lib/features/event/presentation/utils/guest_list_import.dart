import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_state.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_list_file.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';

/// Screen that started a list upload; only that screen reacts to the result.
enum GuestListImportOrigin { guests, quickAdd, review }

/// Tabs of the "Check your list" screen.
enum GuestImportTab { needsFix, all }

/// What keeps an uploaded row from being added, with the row's message and
/// the label of its fix button (translation keys).
enum GuestImportIssue {
  missingPhone('import_issue_missing_phone', 'import_fix_add_number'),
  shortPhone('import_issue_short_phone', 'import_fix'),
  invalidPhone('import_issue_invalid_phone', 'import_fix'),
  missingName('import_issue_missing_name', 'import_fix_add_name'),
  duplicate('import_issue_duplicate', 'import_fix_remove');

  const GuestImportIssue(this.messageKey, this.actionKey);

  final String messageKey;
  final String actionKey;

  bool get isRemovable => this == duplicate;
}

/// Turns spreadsheet rows into reviewable guests.
abstract class GuestListImport {
  /// International numbers (without dial code) outside this range are
  /// treated as too short / not valid.
  static const int _minForeignLength = 6;
  static const int _maxForeignLength = 12;

  static const List<String> _nameHeaders = ['name', 'guest', 'الاسم', 'اسم'];
  static const List<String> _phoneHeaders = [
    'phone',
    'number',
    'mobile',
    'whatsapp',
    'رقم',
    'الجوال',
    'الهاتف',
    'واتساب',
  ];
  static const List<String> _seatHeaders = [
    'seat',
    'party',
    'guests count',
    'مقاعد',
    'المقاعد',
    'عدد',
  ];

  static final RegExp _nonDigits = RegExp(r'\D');
  static final RegExp _whitespace = RegExp(r'\s+');

  /// Reads name / number / seats columns (found by header, otherwise the
  /// first three columns) and skips empty rows.
  static List<GuestImportEntry> fromRows(
    List<GuestListFileRow> rows, {
    required String Function() newId,
  }) {
    final header = rows.firstOrNull?.cells ?? const <String>[];
    final nameColumn = _findColumn(header, _nameHeaders);
    final phoneColumn = _findColumn(header, _phoneHeaders);
    final seatsColumn = _findColumn(header, _seatHeaders);
    final hasHeader =
        nameColumn != null || phoneColumn != null || seatsColumn != null;

    final entries = <GuestImportEntry>[];
    for (final row in rows.skip(hasHeader ? 1 : 0)) {
      String cell(int? column, int fallback) {
        final index = hasHeader ? column : fallback;
        if (index == null || index < 0 || index >= row.cells.length) return '';
        return row.cells[index];
      }

      final name = cell(nameColumn, 0).replaceAll(_whitespace, ' ').trim();
      final phone = cell(phoneColumn, 1).trim();
      if (name.isEmpty && phone.isEmpty) continue;
      entries.add(
        GuestImportEntry(
          id: newId(),
          rowNumber: row.rowNumber,
          name: name,
          rawPhone: phone,
          seats: _seats(cell(seatsColumn, 2)),
        ),
      );
    }
    return entries;
  }

  /// Re-checks every row: number format, missing name, and numbers already
  /// invited or repeated earlier in the file.
  static List<GuestImportEntry> review(
    List<GuestImportEntry> entries, {
    required Set<GuestPhoneNumber> invited,
  }) {
    final seen = {...invited};
    return [for (final entry in entries) _reviewEntry(entry, seen)];
  }

  static GuestImportEntry _reviewEntry(
    GuestImportEntry entry,
    Set<GuestPhoneNumber> seen,
  ) {
    final (phone, phoneIssue) = _checkPhone(entry.rawPhone);
    final GuestImportIssue? issue;
    if (phoneIssue != null) {
      issue = phoneIssue;
    } else if (entry.name.isEmpty) {
      issue = GuestImportIssue.missingName;
    } else if (phone != null && !seen.add(phone)) {
      issue = GuestImportIssue.duplicate;
    } else {
      issue = null;
    }
    return entry.copyWith(phone: phone, issue: issue);
  }

  static (GuestPhoneNumber?, GuestImportIssue?) _checkPhone(String raw) {
    if (raw.trim().isEmpty) return (null, GuestImportIssue.missingPhone);
    final digits = raw.replaceAll(_nonDigits, '');
    if (digits.isEmpty) return (null, GuestImportIssue.invalidPhone);

    final phone = GuestPhoneNumber.fromContact(raw);
    if (phone == null) return (null, GuestImportIssue.shortPhone);

    final isQatar = phone.dialCode == AuthFlowConstants.qatarDialCode;
    final min = isQatar
        ? AuthFlowConstants.qatarPhoneLength
        : _minForeignLength;
    final max = isQatar
        ? AuthFlowConstants.qatarPhoneLength
        : _maxForeignLength;
    final length = phone.number.length;
    if (length < min) return (phone, GuestImportIssue.shortPhone);
    if (length > max) return (phone, GuestImportIssue.invalidPhone);
    return (phone, null);
  }

  static int? _findColumn(List<String> header, List<String> keywords) {
    for (var index = 0; index < header.length; index++) {
      final title = header[index].toLowerCase();
      if (keywords.any(title.contains)) return index;
    }
    return null;
  }

  static int _seats(String value) {
    final seats = int.tryParse(value) ?? double.tryParse(value)?.round();
    if (seats == null || seats < CreateEventFlowConstants.defaultSeats) {
      return CreateEventFlowConstants.defaultSeats;
    }
    return seats;
  }
}
