import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:xml/xml.dart';

/// Why a guest list file could not be read. [messageKey] is a translation key.
class GuestListFileException implements Exception {
  const GuestListFileException(this.messageKey);

  final String messageKey;

  static const GuestListFileException unsupported = GuestListFileException(
    'import_error_unsupported',
  );
  static const GuestListFileException unreadable = GuestListFileException(
    'import_error_unreadable',
  );
  static const GuestListFileException empty = GuestListFileException(
    'import_error_empty',
  );
}

/// One spreadsheet row with its 1-based number as shown in Excel.
class GuestListFileRow {
  const GuestListFileRow({required this.rowNumber, required this.cells});

  final int rowNumber;
  final List<String> cells;
}

/// Picks, reads and writes the Excel/CSV guest lists.
abstract class GuestListFile {
  static const String _xlsx = 'xlsx';
  static const String _csv = 'csv';
  static const List<String> extensions = [_xlsx, _csv];

  /// Name of the template offered for download.
  static const String templateFileName = 'invit-guests-template.xlsx';

  /// Header row of the template; the reader also recognises these names.
  static const List<String> templateHeader = [
    'Name',
    'WhatsApp number',
    'Seats',
  ];
  static const List<String> templateExample = [
    'Noora Al-Thani',
    '+974 5512 3344',
    '2',
  ];

  static const String _sheetFolder = 'xl/worksheets/';
  static const String _firstSheet = 'xl/worksheets/sheet1.xml';
  static const String _sharedStrings = 'xl/sharedStrings.xml';
  static const String _anyNamespace = '*';
  static const String _byteOrderMark = '﻿';
  static final RegExp _columnLetters = RegExp(r'^[A-Z]+');
  static final RegExp _scientific = RegExp(r'[.eE]');

  /// Opens the system picker. `null` when the user cancels.
  static Future<PlatformFile?> pick() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
      withData: true,
    );
    return result?.files.firstOrNull;
  }

  /// Reads the picked file's rows off the UI isolate.
  static Future<List<GuestListFileRow>> read(PlatformFile file) async {
    final path = file.path;
    final bytes =
        file.bytes ?? (path == null ? null : await File(path).readAsBytes());
    if (bytes == null) throw GuestListFileException.unreadable;
    final name = file.name;
    return Isolate.run(() => parse(name, bytes));
  }

  static List<GuestListFileRow> parse(String fileName, Uint8List bytes) {
    final extension = fileName.split('.').last.toLowerCase();
    try {
      return switch (extension) {
        _xlsx => _parseXlsx(bytes),
        _csv => _parseCsv(bytes),
        _ => throw GuestListFileException.unsupported,
      };
    } on GuestListFileException {
      rethrow;
    } catch (_) {
      throw GuestListFileException.unreadable;
    }
  }

  static List<GuestListFileRow> _parseCsv(Uint8List bytes) {
    var text = utf8.decode(bytes, allowMalformed: true);
    if (text.startsWith(_byteOrderMark)) text = text.substring(1);
    final rows = CsvToListConverter(
      shouldParseNumbers: false,
      csvSettingsDetector: FirstOccurrenceSettingsDetector(
        eols: ['\r\n', '\n', '\r'],
        fieldDelimiters: [',', ';', '\t'],
      ),
    ).convert(text);
    return [
      for (var index = 0; index < rows.length; index++)
        GuestListFileRow(
          rowNumber: index + 1,
          cells: rows[index].map((cell) => '$cell'.trim()).toList(),
        ),
    ];
  }

  static List<GuestListFileRow> _parseXlsx(Uint8List bytes) {
    final archive = ZipDecoder().decodeBytes(bytes);
    final sheet =
        archive.findFile(_firstSheet) ??
        archive.files
            .where((file) => file.isFile && file.name.startsWith(_sheetFolder))
            .firstOrNull;
    if (sheet == null) throw GuestListFileException.unreadable;

    final sharedStrings = _readSharedStrings(archive.findFile(_sharedStrings));
    final document = XmlDocument.parse(utf8.decode(sheet.content));
    final rows = <GuestListFileRow>[];
    for (final row in document.findAllElements(
      'row',
      namespace: _anyNamespace,
    )) {
      final rowNumber = int.tryParse(row.getAttribute('r') ?? '');
      final cells = <String>[];
      for (final cell in row.findElements('c', namespace: _anyNamespace)) {
        final column = _columnIndex(cell.getAttribute('r')) ?? cells.length;
        while (cells.length < column) {
          cells.add('');
        }
        cells.add(_cellText(cell, sharedStrings).trim());
      }
      rows.add(
        GuestListFileRow(rowNumber: rowNumber ?? rows.length + 1, cells: cells),
      );
    }
    return rows;
  }

  static List<String> _readSharedStrings(ArchiveFile? file) {
    if (file == null) return const [];
    final document = XmlDocument.parse(utf8.decode(file.content));
    return document
        .findAllElements('si', namespace: _anyNamespace)
        .map(
          (item) => item
              .findAllElements('t', namespace: _anyNamespace)
              .map((text) => text.innerText)
              .join(),
        )
        .toList();
  }

  static String _cellText(XmlElement cell, List<String> sharedStrings) {
    final type = cell.getAttribute('t');
    final value =
        cell
            .findElements('v', namespace: _anyNamespace)
            .firstOrNull
            ?.innerText ??
        '';
    switch (type) {
      case 's':
        final index = int.tryParse(value);
        if (index == null || index < 0 || index >= sharedStrings.length) {
          return '';
        }
        return sharedStrings[index];
      case 'inlineStr':
        return cell
            .findAllElements('t', namespace: _anyNamespace)
            .map((text) => text.innerText)
            .join();
      case 'str' || 'b' || 'e':
        return value;
      default:
        return _plainNumber(value);
    }
  }

  /// Excel stores phone numbers typed as numbers like `97455123344` or
  /// `9.7455123344E10`; both become `97455123344`.
  static String _plainNumber(String value) {
    if (!value.contains(_scientific)) return value;
    final number = double.tryParse(value);
    if (number == null || number != number.truncateToDouble()) return value;
    return number.toStringAsFixed(0);
  }

  /// `C12` → 2.
  static int? _columnIndex(String? reference) {
    final letters = _columnLetters.stringMatch(reference ?? '');
    if (letters == null) return null;
    var index = 0;
    for (final code in letters.codeUnits) {
      index = index * 26 + (code - 0x40);
    }
    return index - 1;
  }

  /// Opens the system "save as" dialog with the template. `null` when the
  /// user cancels.
  static Future<String?> saveTemplate() {
    return FilePicker.platform.saveFile(
      fileName: templateFileName,
      type: FileType.custom,
      allowedExtensions: const [_xlsx],
      bytes: _buildTemplate(),
    );
  }

  static Uint8List _buildTemplate() {
    String cell(String column, int row, String text) =>
        '<c r="$column$row" t="inlineStr"><is><t>${_escape(text)}</t></is></c>';
    String row(int number, List<String> values) =>
        '<row r="$number">${[for (var i = 0; i < values.length; i++) cell(String.fromCharCode(0x41 + i), number, values[i])].join()}</row>';

    const mainNamespace =
        'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
    const relationships =
        'http://schemas.openxmlformats.org/officeDocument/2006/relationships';
    const packageRelationships =
        'http://schemas.openxmlformats.org/package/2006/relationships';

    final files = {
      '[Content_Types].xml':
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
          '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
          '<Default Extension="xml" ContentType="application/xml"/>'
          '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>'
          '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
          '</Types>',
      '_rels/.rels':
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="$packageRelationships">'
          '<Relationship Id="rId1" Type="$relationships/officeDocument" Target="xl/workbook.xml"/>'
          '</Relationships>',
      'xl/workbook.xml':
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<workbook xmlns="$mainNamespace" xmlns:r="$relationships">'
          '<sheets><sheet name="Guests" sheetId="1" r:id="rId1"/></sheets>'
          '</workbook>',
      'xl/_rels/workbook.xml.rels':
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="$packageRelationships">'
          '<Relationship Id="rId1" Type="$relationships/worksheet" Target="worksheets/sheet1.xml"/>'
          '</Relationships>',
      _firstSheet:
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<worksheet xmlns="$mainNamespace"><sheetData>'
          '${row(1, templateHeader)}${row(2, templateExample)}'
          '</sheetData></worksheet>',
    };

    final archive = Archive();
    files.forEach((name, content) {
      archive.addFile(ArchiveFile.string(name, content));
    });
    return ZipEncoder().encodeBytes(archive);
  }

  static String _escape(String text) => text
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;');
}
