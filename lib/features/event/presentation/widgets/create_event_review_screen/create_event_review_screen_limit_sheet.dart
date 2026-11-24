import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_review_screen/create_event_review_screen_limit_illustration.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// What the user chose on the daily limit sheet.
enum CreateEventReviewScreenLimitChoice { sendTomorrow, tryLater }

/// Shown when WhatsApp's daily limit stops the invitations from going out:
/// the event is saved, and they can be sent tomorrow or later.
class CreateEventReviewScreenLimitSheet extends StatelessWidget {
  const CreateEventReviewScreenLimitSheet({super.key});

  static const double _radius = 30;
  static const double _handleWidth = 40;
  static const double _handleHeight = 5;
  static const double _handleRadius = 3;
  static const double _secondaryHeight = 56;
  static const double _secondaryBorder = 1.5;
  static const double _titleLetterSpacing = -0.5;
  static const double _titleHeight = 1.15;
  static const double _bodyHeight = 1.5;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(24, 12, 24, 34);

  /// `null` when the sheet is dismissed (treated as "try again later").
  static Future<CreateEventReviewScreenLimitChoice?> show(
    BuildContext context,
  ) {
    return showModalBottomSheet<CreateEventReviewScreenLimitChoice>(
      context: context,
      useRootNavigator: true,
      backgroundColor: AppColors.transparentPage,
      barrierColor: AppColors.barrier,
      elevation: 0,
      builder: (_) => const CreateEventReviewScreenLimitSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final limit = NumberFormat.decimalPattern(
      context.locale.toString(),
    ).format(CreateEventFlowConstants.whatsAppDailyLimit);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Semantics(
      container: true,
      label: 'create_limit_title'.tr().replaceAll('\n', ' '),
      child: Container(
        width: double.infinity,
        padding: _padding.copyWith(bottom: _padding.bottom + bottomInset),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const SizedBox(height: 20),
            Center(
              child: CreateEventReviewScreenLimitIllustration(
                semanticLabel: 'create_limit_illustration'.tr(),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'create_limit_title'.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitMedium25.copyWith(
                color: AppColors.ink,
                height: _titleHeight,
                letterSpacing: _titleLetterSpacing,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'create_limit_body'.tr(args: [limit]),
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.inkBody,
                height: _bodyHeight,
              ),
            ),
            const SizedBox(height: 22),
            AppPrimaryButton(
              label: 'create_limit_send_tomorrow'.tr(),
              onPressed: () => Navigator.of(
                context,
              ).pop(CreateEventReviewScreenLimitChoice.sendTomorrow),
            ),
            const SizedBox(height: 10),
            Material(
              color: AppColors.transparentPage,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: AppColors.mistDark,
                  width: _secondaryBorder,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.of(
                  context,
                ).pop(CreateEventReviewScreenLimitChoice.tryLater),
                child: SizedBox(
                  height: _secondaryHeight,
                  child: Center(
                    child: Text(
                      'create_limit_try_later'.tr(),
                      style: AppTextStyle.outfitMedium16.copyWith(
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
