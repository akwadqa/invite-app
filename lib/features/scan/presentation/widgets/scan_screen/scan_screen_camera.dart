import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_frame.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Rounded camera card: live preview, scan frame, hint and torch button.
class ScanScreenCamera extends StatelessWidget {
  const ScanScreenCamera({
    super.key,
    required this.controller,
    required this.onDetect,
  });

  final MobileScannerController controller;
  final void Function(BarcodeCapture capture) onDetect;

  static const double _radius = 30;
  static const double _hintGap = 20;
  static const double _torchBottom = 20;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.4, -0.6),
                radius: 1.2,
                colors: [
                  AppColors.scannerGlow,
                  AppColors.scannerMid,
                  AppColors.scannerDeep,
                ],
                stops: [0, 0.45, 1],
              ),
            ),
          ),
          MobileScanner(
            controller: controller,
            onDetect: onDetect,
            errorBuilder: (context, _) => const _ScanScreenCameraError(),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: _hintGap,
              children: [
                const ScanScreenFrame(),
                Text(
                  'scan_point_at_qr'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.white,
                    shadows: const [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 6,
                        color: AppColors.overlay,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: _torchBottom,
            child: Center(
              child: _ScanScreenTorchButton(controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanScreenTorchButton extends StatelessWidget {
  const _ScanScreenTorchButton({required this.controller});

  final MobileScannerController controller;

  static const double _size = 44;
  static const double _iconSize = 20;
  static const double _blur = 8;

  Future<void> _toggle() async {
    try {
      await controller.toggleTorch();
    } catch (_) {
      // The device has no torch or the camera is not running yet.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'scan_torch'.tr(),
      child: GestureDetector(
        onTap: _toggle,
        child: ClipOval(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
            child: ValueListenableBuilder<MobileScannerState>(
              valueListenable: controller,
              builder: (context, value, _) {
                final isOn = value.torchState == TorchState.on;
                return Container(
                  width: _size,
                  height: _size,
                  alignment: Alignment.center,
                  color: AppColors.white.withValues(alpha: isOn ? 0.45 : 0.22),
                  child: const Icon(
                    Icons.bolt_outlined,
                    size: _iconSize,
                    color: AppColors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ScanScreenCameraError extends StatelessWidget {
  const _ScanScreenCameraError();

  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 32);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Align(
        alignment: const Alignment(0, -0.85),
        child: Text(
          'scan_camera_unavailable'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.outfitRegular13.copyWith(
            color: AppColors.whiteMuted,
          ),
        ),
      ),
    );
  }
}
