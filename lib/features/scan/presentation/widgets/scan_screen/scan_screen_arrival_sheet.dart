import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_seats_label.dart';
import 'package:invit/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Bottom sheet shown when a guest was checked in: welcome, seats and a
/// button to scan the next pass.
class ScanScreenArrivalSheet extends StatelessWidget {
  const ScanScreenArrivalSheet({super.key, required this.guest});

  final ScanQrResponse guest;

  static const double _radius = 32;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _badgeSize = 64;
  static const double _badgeRing = 7;
  static const double _badgeIconSize = 28;
  static const double _titleLetterSpacing = -0.52;
  static const double _titleHeight = 1.15;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 10, 20, 24);

  /// Resolves when the sheet closes, whichever way it was closed.
  static Future<void> show(BuildContext context, ScanQrResponse guest) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.overlay,
      elevation: 0,
      builder: (_) => ScanScreenArrivalSheet(guest: guest),
    );
  }

  @override
  Widget build(BuildContext context) {
    final seats = guest.maxAllowed;
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;
    return Container(
      width: double.infinity,
      padding: _padding.copyWith(bottom: _padding.bottom + bottomSafeArea),
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
                borderRadius: BorderRadius.circular(_handleHeight / 2),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.all(_badgeRing),
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.successDot,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.successLight,
                    spreadRadius: _badgeRing,
                  ),
                ],
              ),
              child: Assets.icons.checkIc.svg(
                width: _badgeIconSize,
                height: _badgeIconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'scan_welcome'.tr(namedArgs: {'name': guest.fullName}),
            style: AppTextStyle.outfitMedium26.copyWith(
              color: AppColors.ink,
              letterSpacing: _titleLetterSpacing,
              height: _titleHeight,
            ),
          ),
          if (seats > 0) ...[
            const SizedBox(height: 6),
            Text(
              seatsLabel(seats),
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.inkBody,
              ),
            ),
          ],
          const SizedBox(height: 24),
          _ScanScreenArrivalSheetStepper(
            arriving: guest.checkedIn,
            seats: seats,
          ),
          const SizedBox(height: 24),
          AppPrimaryButton(
            label: 'scan_next'.tr(),
            icon: Assets.icons.qrIc,
            mirrorIconInRtl: false,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

/// "Arriving now" row with the − / + seat buttons.
class _ScanScreenArrivalSheetStepper extends StatelessWidget {
  const _ScanScreenArrivalSheetStepper({
    required this.arriving,
    required this.seats,
  });

  final int arriving;
  final int seats;

  static const double _height = 60;
  static const double _radius = 18;
  static const double _buttonSize = 44;
  static const double _borderWidth = 1.5;
  static const double _countWidth = 28;
  static const EdgeInsetsDirectional _padding = EdgeInsetsDirectional.fromSTEB(
    16,
    0,
    8,
    0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.mistLight,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'scan_arriving_now'.tr(),
                  style: AppTextStyle.outfitMedium15.copyWith(
                    color: AppColors.ink,
                    height: 1.2,
                  ),
                ),
                Text(
                  'scan_of_confirmed_seats'.tr(args: ['$seats']),
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.inkLabel,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          // TODO(backend): the check-in endpoint takes no "arriving now"
          // count, so the seats can't be changed yet.
          _ScanScreenArrivalSheetButton(
            label: '−',
            semantics: 'scan_fewer'.tr(),
            size: _buttonSize,
            background: AppColors.white,
            foreground: AppColors.ink,
            borderWidth: _borderWidth,
          ),
          SizedBox(
            width: _countWidth,
            child: Text(
              '$arriving',
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitSemiBold20.copyWith(
                color: AppColors.ink,
              ),
            ),
          ),
          _ScanScreenArrivalSheetButton(
            label: '+',
            semantics: 'scan_more'.tr(),
            size: _buttonSize,
            background: AppColors.ink,
            foreground: AppColors.white,
          ),
        ],
      ),
    );
  }
}

class _ScanScreenArrivalSheetButton extends StatelessWidget {
  const _ScanScreenArrivalSheetButton({
    required this.label,
    required this.semantics,
    required this.size,
    required this.background,
    required this.foreground,
    this.borderWidth,
  });

  final String label;
  final String semantics;
  final double size;
  final Color background;
  final Color foreground;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final width = borderWidth;
    return Semantics(
      button: true,
      label: semantics,
      child: GestureDetector(
        onTap: showComingSoon,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
            border: width == null
                ? null
                : Border.all(color: AppColors.mistDark, width: width),
          ),
          child: Text(
            label,
            style: AppTextStyle.outfitMedium22.copyWith(
              color: foreground,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
