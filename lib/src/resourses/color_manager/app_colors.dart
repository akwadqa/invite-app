import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF5E1A22);
  static const Color secondPrimary = Color(0xFF4E5133);
  static const Color primaryOpacity = Color(0xFFD9C2C5);
  static const Color background = Color(0xFFE4D8C7);
  static const Color fieldBackground = Color(0xFFF6F2EC);
  static const Color dividerColor = Color(0xFFEEE8DF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cardWhite = Color(0xFFF6F2EC);
  static const Color redOpacity = Color(0xFFFAEDEB);
  static const Color orangeOpacity = Color(0xFFF4EEE6);
  static const Color greenOpacity = Color(0xFFEAF2EC);
  static const Color shadow = Color(0x3F5E1A22);
  static const Color dark = Color(0xFF2A1A17);
  static const Color cyan = Color(0xFF5AA8CC);
  static const Color deepPurple = Color(0xFF270D33);
  static const Color muted = Color(0xFF8A7B70);
  static const Color host = Color(0xFF4E5133);
  static const Color core = Color(0xFFF6F1E9);
  static const Color ring = Color(0xFFFFFFFF);
  static const Color akwadCyan1 = Color(0xFF3CC3D9);
  static const Color akwadCyan2 = Color(0xFF3BBBD7);
  static const Color akwadCyan3 = Color(0xFF38B2D6);
  static const Color akwadCyan4 = Color(0xFF36ACD5);
  static const Color akwadBlue = Color(0xFF2D95D2);
  static const List<Color> akwadGradient = [
    akwadCyan1,
    akwadCyan2,
    akwadCyan3,
    akwadCyan4,
    akwadBlue,
  ];
  static const List<double> akwadGradientStops = [0.42, 0.47, 0.54, 0.59, 0.71];

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
    0xFF5E1A22, // Base color
    <int, Color>{
      50: Color(0xFFF3E8E9),
      100: Color(0xFFE0C6C9),
      200: Color(0xFFC9A0A5),
      300: Color(0xFFAE7077),
      400: Color(0xFF8A424B),
      500: Color(0xFF5E1A22),
      600: Color(0xFF541820),
      700: Color(0xFF46141B),
      800: Color(0xFF380F16),
      900: Color(0xFF2A0A10),
    },
  );
  static const Color gray = Color(0xFFAAAAAA);

  static const Color rose = Color(0xFFF8D5CC);
  static const Color darkRed = Color(0xFF5E1A22);
  static const Color textDart = Color(0xFF2A1A17);
  static const Color red = Color(0xFFA8352C);

  static const Color bodyColor = Color(0xFF6F625B);
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
  static const Color newRed = Color(0xFFB4473D);
  static const Color lightPeach = Color(0xFFF6F2EC);
  static const Color dimGray = Color(0xFF555555);
  static const Color grayishCharcoal = Color(0xFF595959);
  static const Color confirmGuest = Color(0xFF2E6B4F);
  static const Color waitingGuest = Color(0xFF4E5133);
  static const Color noticeRed = Color(0xFFA8352C);
  static const Color guestName = Color(0xFF6F625B);
  static const Color textGrey = Color(0xFF686868);
  static const Color softOrange = Color(0xFFF4EEE6);
  static const Color softBlue = Color(0xFFEEEFE6);
  static const Color buttonBackground = Color(0xFFD8CEC0);

  // Redesign palette, named by role.
  /// Titles, primary buttons, strong text, focused borders, logo guests.
  static const Color ink = Color(0xFF2A1A17);

  /// Descriptions and paragraphs.
  static const Color inkBody = Color(0xFF5A4A43);

  /// Field labels and secondary text.
  static const Color inkLabel = Color(0xFF6F625B);

  /// Faint text and disabled button labels.
  static const Color inkMuted = Color(0xFF8A7B70);

  /// Screen background behind the content.
  static const Color pageBackground = Color(0xFFFFFFFF);

  /// Hero header, splash background, icon circles.
  static const Color mist = Color(0xFFF4EEE6);

  /// Round secondary buttons and disabled badges.
  static const Color mistSoft = Color(0xFFF0EAE2);

  /// Input and chip backgrounds, empty code cells.
  static const Color mistLight = Color(0xFFF6F2EC);

  /// Input borders and disabled primary buttons.
  static const Color mistBorder = Color(0xFFE6DED2);

  /// Button icon badge, logo host dot, avatar badge.
  static const Color accent = Color(0xFF4E5133);

  /// Logo core dot.
  static const Color accentSecondary = Color(0xFFB9B48A);
  static const Color akwadInk = Color(0xFF270D33);

  /// Inactive dots, drag handles and outlined button borders.
  static const Color mistDark = Color(0xFFD8CEC0);

  /// Card outlines.
  static const Color mistOutline = Color(0xFFEAE3D8);

  /// Thin dividers inside cards.
  static const Color mistDivider = Color(0xFFEEE8DF);

  /// List chevrons.
  static const Color inkChevron = Color(0xFF9A8B80);

  /// Declined replies.
  static const Color inkFaint = Color(0xFFA69A8E);

  /// Light blue surfaces (info banners, "no reply" chips).
  static const Color accentLight = Color(0xFFEEEFE6);
  static const Color accentSurface = Color(0xFFF3F2EA);

  /// Text on light blue surfaces.
  static const Color accentInk = Color(0xFF4E5133);

  /// Background card of the occasion carousel.
  static const Color accentPale = Color(0xFFF4EEE6);

  /// Success surfaces and text.
  static const Color successLight = Color(0xFFEAF2EC);
  static const Color success = Color(0xFF2E6B4F);
  static const Color successDot = Color(0xFF2E7D56);
  static const Color successInk = Color(0xFF2E5B45);
  static const Color successStrong = Color(0xFF2E6B4F);
  static const Color successText = Color(0xFF2E5B45);

  /// Failed deliveries and destructive actions.
  static const Color danger = Color(0xFFB4473D);
  static const Color dangerInk = Color(0xFFA8352C);
  static const Color dangerLight = Color(0xFFFAEDEB);
  static const Color dangerDeep = Color(0xFF5A2420);

  /// Hero background of the payment-failed screen.
  static const Color dangerMist = Color(0xFFF8EFED);

  /// "Declined" chips.
  static const Color declinedSurface = Color(0xFFF2EDE6);
  static const Color declinedInk = Color(0xFF5E5249);

  /// Secondary text on dark buttons.
  static const Color whiteMuted = Color(0xBFFFFFFF);

  /// Image placeholders.
  static const Color paper = Color(0xFFFFFDF8);
  static const Color overlay = Color(0x66000000);
  static const Color barrier = Color(0x73000000);

  /// Guest dots still waiting (dashed) on the daily limit sheet.
  static const Color inkWaiting = Color(0xFF9A8B80);

  /// [pageBackground] fully transparent, for fades over lists.
  static const Color transparentPage = Color(0x00FFFFFF);

  /// Shadows: soft (cards, icon circles) and medium (floating buttons).
  static const Color shadowFaint = Color(0x0F000000);
  static const Color shadowSoft = Color(0x1A000000);
  static const Color shadowMedium = Color(0x24000000);
  static const Color shadowSheet = Color(0x1F000000);
  static const Color shadowCard = Color(0x29000000);

  /// Upload drop zone of the invitation image step.
  static const Color dropzoneFill = Color(0xFFF6F2EC);
  static const Color optionSelectedSurface = Color(0xFFF6F2EC);
  static const Color dropzoneBorder = Color(0xFFB9B48A);

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
