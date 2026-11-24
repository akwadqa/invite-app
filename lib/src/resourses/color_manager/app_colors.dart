import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF3B41C5);
  static const Color secondPrimary = Color(0xFFA981BB);
  static const Color primaryOpacity = Color(0xFFA0A3E3);
  static const Color background = Color(0xFFF6F8FA);
  static const Color fieldBackground = Color(0xFFEFF0F6);
  static const Color dividerColor = Color(0xFFEDF1F3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cardWhite = Color(0xFFF5F5F5);
  static const Color redOpacity = Color(0xFFFFF6E5);
  static const Color orangeOpacity = Color(0xFFFFF6E5);
  static const Color greenOpacity = Color(0xFFE9F7EF);
  static const Color shadow = Color(0x3F3B41C5);
  static const Color dark = Color(0xFF201C11);
  static const Color cyan = Color(0xFF5AA8CC);

  // Invitation Colors – Wedding
  static const Color weddingBg = Color(0xFFFFDCDC);
  static const Color weddingTop = Color(0xFFC63A3A);
  static const Color weddingIcon = Color(0x33F8A5A5);

  // Graduation
  static const Color graduationBg = Color(0xFFD7E5FF);
  static const Color graduationTop = Color(0xFF436FBF);
  static const Color graduationIcon = Color(0x3361779E);

  // Dinner Party
  static const Color dinnerBg = Color(0xFFFFF2EB);
  static const Color dinnerTop = Color(0xFFE8AA49);
  static const Color dinnerIcon = Color(0x33E8AB49);

  // Events
  static const Color eventsBg = Color(0xFFE8F5E9);
  static const Color eventsTop = Color(0xFF7BAB8E);
  static const Color eventsIcon = Color(0x337BAB8E);

  // Match
  static const Color matchBg = Color(0xFFDAD7FA);
  static const Color matchTop = Color(0xFF7F76E0);
  static const Color matchIcon = Color(0x338077E0);

  // Other
  static const Color otherBg = Color(0xFFF8E8EE);
  static const Color otherTop = Color(0xFFF292B6);
  static const Color otherIcon = Color(0x33F293B7);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFD4057, // Base color
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFD4057),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const Color gray = Color(0xFFAAAAAA);

  static const Color rose = Color(0xFFF8D5CC);
  static const Color darkRed = Color(0xFFBC0000);
  static const Color textDart = Color(0xFF050E13);
  static const Color red = Color(0xFFBD2C06);

  static const Color bodyColor = Color(0xFF576B74);
  static const Color borderGrey = Color(0xFF979797);
  static const Color black = Color(0xFF000000);
  static const Color black900 = Color(0xFF484848);
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey = Color(0xFFE7e7e7);
  static const Color green = Color(0xFF69A94B);
  static const Color mediumGray = Color(0xFFD7D7D7);
  static const Color grayBorder = Color(0xFFCCCCCC);
  static const Color grayHint = Color(0xFF767676);
  static const Color darkGray = Color(0xFF727272);
  static const Color lightGray01 = Color(0xFFF1F1F1);
  static const Color lightGray02 = Color(0xFFD9D9D9);
  static const Color gray02 = Color(0xFF888888);
  static const Color black800 = Color(0xFF444444);
  static const Color stoneGray = Color(0xFF949494);
  static const Color offWhite = Color(0xFFF6F6F6);
  static const Color newRed = Color(0xFFD75966);
  static const Color lightPeach = Color(0xFFFFF5F1);
  static const Color dimGray = Color(0xFF555555);
  static const Color grayishCharcoal = Color(0xFF595959);
  static const Color confirmGuest = Color(0xFF289C6D);
  static const Color waitingGuest = Color(0xFFBC8C1C);
  static const Color noticeRed = Color(0xFF9F2102);
  static const Color guestName = Color(0xFF937373);
  static const Color textGrey = Color(0xFF686868);
  static const Color softOrange = Color(0xFFFFEADA);
  static const Color softBlue = Color(0xFFE7F2FD);
  static const Color buttonBackground = Color(0xFFD1D1D1);

  // Redesign palette, named by role.
  /// Titles, primary buttons, strong text, focused borders, logo guests.
  static const Color ink = Color(0xFF000000);

  /// Descriptions and paragraphs.
  static const Color inkBody = Color(0xFF4A5560);

  /// Field labels and secondary text.
  static const Color inkLabel = Color(0xFF5B6168);

  /// Faint text and disabled button labels.
  static const Color inkMuted = Color(0xFF7E878E);

  /// Screen background behind the content.
  static const Color pageBackground = Color(0xFFFBFBF8);

  /// Hero header, splash background, icon circles.
  static const Color mist = Color(0xFFDBE3E9);

  /// Round secondary buttons and disabled badges.
  static const Color mistSoft = Color(0xFFE8EDF1);

  /// Input and chip backgrounds, empty code cells.
  static const Color mistLight = Color(0xFFF2F5F7);

  /// Input borders and disabled primary buttons.
  static const Color mistBorder = Color(0xFFD5DDE3);

  /// Button icon badge, logo host dot, avatar badge.
  static const Color accent = Color(0xFF6AA6DA);

  /// Logo core dot.
  static const Color accentSecondary = Color(0xFFE1E5AC);
  static const Color akwadInk = Color(0xFF270D33);

  /// Inactive dots, drag handles and outlined button borders.
  static const Color mistDark = Color(0xFFC3CED6);

  /// Card outlines.
  static const Color mistOutline = Color(0xFFDCE3E8);

  /// Thin dividers inside cards.
  static const Color mistDivider = Color(0xFFE6EBEF);

  /// List chevrons.
  static const Color inkChevron = Color(0xFF8E989F);

  /// Declined replies.
  static const Color inkFaint = Color(0xFF9AA3AB);

  /// Light blue surfaces (info banners, "no reply" chips).
  static const Color accentLight = Color(0xFFE1EDF8);
  static const Color accentSurface = Color(0xFFE8F1FA);

  /// Text on light blue surfaces.
  static const Color accentInk = Color(0xFF2F6EA5);

  /// Background card of the occasion carousel.
  static const Color accentPale = Color(0xFFD3E4F3);

  /// Success surfaces and text.
  static const Color successLight = Color(0xFFE5F4EC);
  static const Color success = Color(0xFF1F7A4C);
  static const Color successDot = Color(0xFF1F9D5B);
  static const Color successInk = Color(0xFF24503A);
  static const Color successStrong = Color(0xFF1F6B45);
  static const Color successText = Color(0xFF2A5A40);

  /// Failed deliveries and destructive actions.
  static const Color danger = Color(0xFFC2554B);
  static const Color dangerInk = Color(0xFFB3261E);
  static const Color dangerLight = Color(0xFFFDECEA);
  static const Color dangerDeep = Color(0xFF5A2420);

  /// Hero background of the payment-failed screen.
  static const Color dangerMist = Color(0xFFF7ECEF);

  /// "Declined" chips.
  static const Color declinedSurface = Color(0xFFE8EBEE);
  static const Color declinedInk = Color(0xFF4F575E);

  /// Secondary text on dark buttons.
  static const Color whiteMuted = Color(0xBFFFFFFF);

  /// Image placeholders.
  static const Color paper = Color(0xFFFFFDF8);
  static const Color overlay = Color(0x66000000);
  static const Color barrier = Color(0x73000000);

  /// Guest dots still waiting (dashed) on the daily limit sheet.
  static const Color inkWaiting = Color(0xFF8E989F);

  /// [pageBackground] fully transparent, for fades over lists.
  static const Color transparentPage = Color(0x00FBFBF8);

  /// Shadows: soft (cards, icon circles) and medium (floating buttons).
  static const Color shadowFaint = Color(0x0F000000);
  static const Color shadowSoft = Color(0x1A000000);
  static const Color shadowMedium = Color(0x24000000);
  static const Color shadowSheet = Color(0x1F000000);
  static const Color shadowCard = Color(0x29000000);

  /// Upload drop zone of the invitation image step.
  static const Color dropzoneFill = Color(0xFFF5F8FA);
  static const Color optionSelectedSurface = Color(0xFFF5F8FA);
  static const Color dropzoneBorder = Color(0xFFE1E5AC);

  /// Camera backdrop of the check-in scanner, shown until the preview starts.
  static const Color scannerGlow = Color(0xFF8C6A55);
  static const Color scannerMid = Color(0xFF5A4250);
  static const Color scannerDeep = Color(0xFF3A2A3C);

  // WhatsApp preview.
  static const Color whatsappChat = Color(0xFFEFEAE2);
  static const Color whatsappText = Color(0xFF111B21);
  static const Color whatsappMeta = Color(0xFF667781);
  static const Color whatsappDate = Color(0xFF54656F);
  static const Color whatsappLink = Color(0xFF027EB5);
  static const Color whatsappShadow = Color(0x210B141A);
  static const Color whatsappDoodle = Color(0xFFD9D0C3);
  static const Color whatsappDivider = Color(0xFFE9EDEF);
  static const Color whatsappOutgoing = Color(0xFFD9FDD3);
  static const Color whatsappQuote = Color(0xFFD1F4CC);
  static const Color whatsappQuoteAccent = Color(0xFF06CF9C);
}

class AvatarColors {
  static final List<Color> _colors = [
    const Color(0xFF3F51B5), // Blue
    const Color(0xFF6D4C41), // Brown
    const Color(0xFF7CB342), // Green
    const Color(0xFF8E24AA), // Purple
    const Color(0xFF039BE5), // Light Blue
    const Color(0xFF5D4037), // Dark Brown
    const Color(0xFF455A64), // Blue Grey
  ];
  static Color getColorForName(String name) {
    final index = name.hashCode.abs() % _colors.length;
    return _colors[index];
  }

  static Color random() {
    final random = Random();
    return _colors[random.nextInt(_colors.length)];
  }
}
