import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Page frame shared by the auth screens: a fixed top (hero or header),
/// scrollable content and a bottom action pinned above the keyboard.
class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.top,
    required this.content,
    required this.bottom,
    this.contentTopSpacing = 32,
  });

  final Widget top;
  final Widget content;
  final Widget bottom;
  final double contentTopSpacing;

  static const double _contentBottomSpacing = 24;
  static const EdgeInsets _bottomPadding = EdgeInsets.fromLTRB(24, 12, 24, 12);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            top,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: contentTopSpacing,
                  bottom: _contentBottomSpacing,
                ),
                child: content,
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(padding: _bottomPadding, child: bottom),
            ),
          ],
        ),
      ),
    );
  }
}
