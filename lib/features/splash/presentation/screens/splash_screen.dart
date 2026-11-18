import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/splash/presentation/controller/splash_controller.dart';
import 'package:invit/features/splash/presentation/utils/splash_constants.dart';
import 'package:invit/features/splash/presentation/widgets/splash_screen/splash_screen_brand_text.dart';
import 'package:invit/features/splash/presentation/widgets/splash_screen/splash_screen_credit.dart';
import 'package:invit/src/core/shared_widgets/app_gather_logo.dart';
import 'package:invit/features/splash/presentation/widgets/splash_screen/splash_screen_ripples.dart';
import 'package:invit/features/splash/presentation/widgets/splash_screen/splash_screen_static_rings.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';

/// Animated splash. One [AnimationController] drives every animated piece so
/// they stay in sync. It plays once, then routes to home or sign in as soon
/// as it ends and [splashControllerProvider] has resolved.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: SplashConstants.animationDuration,
  );

  /// Honors the system "reduce motion" setting: the pieces show their still
  /// state, while the controller keeps timing the splash.
  bool _reduceMotion = false;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _controller
      ..addStatusListener(_onAnimationStatus)
      ..forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_onAnimationStatus)
      ..dispose();
    super.dispose();
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) _navigateIfReady();
  }

  /// Navigates once the animation has ended and the destination is known.
  void _navigateIfReady() {
    if (_hasNavigated || !_controller.isCompleted || !mounted) return;
    final destination = ref.read(splashControllerProvider).value;
    if (destination == null) return;
    _hasNavigated = true;
    context.go(switch (destination) {
      SplashDestination.main => AppRoutes.mainScreen,
      SplashDestination.signIn => AppRoutes.signInScreen,
    });
  }

  @override
  Widget build(BuildContext context) {
    // Keeps the destination loading during the animation; covers the case
    // where the session check finishes after the animation.
    ref.listen(splashControllerProvider, (_, _) => _navigateIfReady());

    final Animation<double>? progress = _reduceMotion ? null : _controller;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.mist,
        // Brand artwork: English and left-to-right in every language.
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: ClipRect(
            child: SizedBox.expand(
              child: FittedBox(
                child: SizedBox.fromSize(
                  size: SplashConstants.frame,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _centered(
                        SplashScreenStaticRings.size,
                        const SplashScreenStaticRings(),
                      ),
                      _centered(
                        SplashScreenRipples.boxSize,
                        SplashScreenRipples(progress: progress),
                      ),
                      _centered(
                        SplashConstants.logoSize,
                        AppGatherLogo(
                          progress: progress,
                          size: SplashConstants.logoSize,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: SplashConstants.brandTop,
                        height: SplashConstants.brandHeight,
                        child: SplashScreenBrandText(progress: progress),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: SplashConstants.creditBottom,
                        child: Center(
                          child: SplashScreenCredit(progress: progress),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Places a [size]×[size] [child] centered on [SplashConstants.center].
  Widget _centered(double size, Widget child) {
    const center = SplashConstants.center;
    return Positioned(
      left: center.dx - size / 2,
      top: center.dy - size / 2,
      width: size,
      height: size,
      child: child,
    );
  }
}
