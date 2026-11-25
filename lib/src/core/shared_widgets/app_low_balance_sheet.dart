import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// "Not enough messages": says what the action needs, how much of it the
/// balance covers and offers to recharge.
class AppLowBalanceSheet extends StatelessWidget {
  const AppLowBalanceSheet({
    super.key,
    required this.message,
    required this.needed,
    required this.balance,
  });

  /// What the user was trying to do and what it costs.
  final String message;
  final int needed;
  final int balance;

  static const double _radius = 32;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _handleRadius = 3;
  static const double _iconCircle = 60;
  static const double _iconSize = 26;
  static const double _titleLetterSpacing = -0.52;
  static const double _bodyHeight = 1.45;
  static const double _notNowHeight = 48;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 10, 20, 36);
  static const EdgeInsets _buttonPadding = EdgeInsets.symmetric(horizontal: 4);

  /// `true` when the user chose to recharge; `false` (or dismissed) otherwise.
  static Future<bool> show(
    BuildContext context, {
    required String message,
    required int needed,
    required int balance,
  }) async {
    final recharge = await showModalBottomSheet<bool>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparentPage,
      barrierColor: AppColors.overlay,
      elevation: 0,
      builder: (_) => AppLowBalanceSheet(
        message: message,
        needed: needed,
        balance: balance,
      ),
    );
    return recharge ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final missing = math.max(needed - balance, 0);
    final ratio = needed <= 0 ? 1.0 : (balance / needed).clamp(0.0, 1.0);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Semantics(
      container: true,
      label: 'low_balance_title'.tr(),
      child: Container(
        width: double.infinity,
        padding: _padding.copyWith(bottom: _padding.bottom + bottomInset),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: _handleWidth,
                height: _handleHeight,
                decoration: BoxDecoration(
                  color: AppColors.mistDark,
                  borderRadius: BorderRadius.circular(_handleRadius),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: _iconCircle,
              height: _iconCircle,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.accentLight,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.bubbleAlertIc.svg(
                width: _iconSize,
                height: _iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.accentInk,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'low_balance_title'.tr(),
              style: AppTextStyle.outfitMedium26.copyWith(
                color: AppColors.ink,
                letterSpacing: _titleLetterSpacing,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.inkBody,
                height: _bodyHeight,
              ),
            ),
            const SizedBox(height: 20),
            _AppLowBalanceSheetCard(
              balance: balance,
              needed: needed,
              missing: missing,
              ratio: ratio,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: _notNowHeight,
              width: double.infinity,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(false),
                child: Center(
                  child: Text(
                    'low_balance_not_now'.tr(),
                    style: AppTextStyle.outfitMedium15.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: _buttonPadding,
              child: AppPrimaryButton(
                label: 'low_balance_recharge'.tr(),
                icon: Assets.icons.plusIc,
                mirrorIconInRtl: false,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppLowBalanceSheetCard extends StatelessWidget {
  const _AppLowBalanceSheetCard({
    required this.balance,
    required this.needed,
    required this.missing,
    required this.ratio,
  });

  final int balance;
  final int needed;
  final int missing;
  final double ratio;

  static const double _radius = 18;
  static const double _barHeight = 10;
  static const double _barRadius = 5;
  static const EdgeInsets _padding = EdgeInsets.all(14);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'low_balance_your_balance'.tr(),
                style: AppTextStyle.outfitRegular13_5.copyWith(
                  color: AppColors.inkBody,
                ),
              ),
              Text(
                'low_balance_of'.tr(args: ['$balance', '$needed']),
                style: AppTextStyle.outfitSemiBold13_5.copyWith(
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(_barRadius),
            child: SizedBox(
              height: _barHeight,
              width: double.infinity,
              child: CustomPaint(
                painter: _AppLowBalanceSheetBarPainter(
                  ratio: ratio,
                  isRtl: Directionality.of(context) == ui.TextDirection.rtl,
                ),
              ),
            ),
          ),
          Text(
            'low_balance_missing'.tr(args: ['$missing']),
            style: AppTextStyle.outfitRegular12_5.copyWith(
              color: AppColors.accentInk,
            ),
          ),
        ],
      ),
    );
  }
}

/// A bar: the part of the balance in black, the missing part hatched.
class _AppLowBalanceSheetBarPainter extends CustomPainter {
  const _AppLowBalanceSheetBarPainter({
    required this.ratio,
    required this.isRtl,
  });

  final double ratio;
  final bool isRtl;

  static const double _radius = 5;
  static const double _stripe = 8;
  static const double _diagonal = 0.70710678;

  @override
  void paint(Canvas canvas, Size size) {
    if (isRtl) {
      canvas
        ..translate(size.width, 0)
        ..scale(-1, 1);
    }
    canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.white);

    final split = size.width * ratio;
    if (split < size.width) {
      final rest = Rect.fromLTWH(split, 0, size.width - split, size.height);
      const direction = Offset(_diagonal, _diagonal);
      final length = (rest.width + rest.height) / math.sqrt2;
      final start = rest.center - direction * (length / 2);
      final end = start + direction * _stripe;
      canvas.drawRect(
        rest,
        Paint()
          ..shader = ui.Gradient.linear(
            start,
            end,
            const [
              AppColors.accent,
              AppColors.accent,
              AppColors.accentLight,
              AppColors.accentLight,
            ],
            const [0.0, 0.5, 0.5, 1.0],
            TileMode.repeated,
          ),
      );
    }

    if (split > 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, split, size.height),
          const Radius.circular(_radius),
        ),
        Paint()..color = AppColors.primary,
      );
    }
  }

  @override
  bool shouldRepaint(_AppLowBalanceSheetBarPainter oldDelegate) =>
      oldDelegate.ratio != ratio || oldDelegate.isRtl != isRtl;
}
