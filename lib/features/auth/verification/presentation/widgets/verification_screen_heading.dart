import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/auth/presentation/controller/auth_flow_controller.dart';
import 'package:invit/features/auth/presentation/utils/auth_flow_constants.dart';
import 'package:invit/features/auth/widgets/auth_heading.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/utils/functions/helper_methods.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Title plus "We sent a code on WhatsApp to `phone` · Edit".
class VerificationScreenHeading extends ConsumerWidget {
  const VerificationScreenHeading({super.key});

  /// Keeps "+974 5512 8890" left-to-right inside Arabic text.
  static final String _ltrIsolateStart = String.fromCharCode(0x2066);
  static final String _isolateEnd = String.fromCharCode(0x2069);
  static const String _separator = ' · ';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = ref.watch(
      authFlowControllerProvider.select((s) => s.value?.displayPhoneNumber),
    );
    final emphasis = AppTextStyle.outfitRegular15.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    );

    return AuthHeading(
      spacing: 10,
      leading: const _VerificationScreenHeadingIcon(),
      title: 'auth_otp_title'.tr(),
      subtitle: TextSpan(
        children: [
          TextSpan(
            text: 'auth_otp_subtitle'.tr(
              args: ['${AuthFlowConstants.otpLength}'],
            ),
          ),
          if (phone != null) ...[
            const TextSpan(text: '\n'),
            TextSpan(
              text: '$_ltrIsolateStart$phone$_isolateEnd',
              style: emphasis,
            ),
            const TextSpan(text: _separator),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {
                  dismissKeyboard();
                  context.go(AppRoutes.signInScreen);
                },
                child: Text(
                  'auth_edit'.tr(),
                  style: AppTextStyle.outfitRegular15.copyWith(
                    color: AppColors.ink,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.ink,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _VerificationScreenHeadingIcon extends StatelessWidget {
  const _VerificationScreenHeadingIcon();

  static const double _size = 52;
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.mist,
        shape: BoxShape.circle,
      ),
      child: Assets.icons.whatsappChatIc.svg(
        width: _iconSize,
        height: _iconSize,
        colorFilter: const ColorFilter.mode(AppColors.ink, BlendMode.srcIn),
      ),
    );
  }
}
