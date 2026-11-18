import 'package:flutter/material.dart';
import 'package:invit/src/core/shared_widgets/app_gather_logo.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Small card with the looping invite logo animation (the splash logo, faster).
/// Shown by `AppDialogs.loading`.
class AppLoadingIndicator extends StatefulWidget {
  const AppLoadingIndicator({super.key});

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {
  static const Duration _loop = Duration(milliseconds: 2400);
  static const double _cardSize = 120;
  static const double _cardRadius = 28;

  /// The guests start up to 0.34 × the logo size outside it and fly in, so the
  /// card keeps (card - logo) / 2 = 34px free around the logo for that path.
  static const double _logoSize = 52;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _loop,
  );

  /// Honors the system "reduce motion" setting: shows the still logo.
  bool _reduceMotion = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (_reduceMotion) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _cardSize,
      height: _cardSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      child: AppGatherLogo(
        progress: _reduceMotion ? null : _controller,
        size: _logoSize,
      ),
    );
  }
}
