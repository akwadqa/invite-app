import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/features/event/presentation/widgets/create_event_image_screen/create_event_image_screen_card.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/image_picker.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Step 5: the image shown at the top of the WhatsApp message.
class CreateEventImageScreen extends ConsumerWidget {
  const CreateEventImageScreen({super.key});

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 26, 20, 16);
  static const double _gap = 16;
  static const double _noteGap = 18;

  Future<void> _pick(BuildContext context, WidgetRef ref) async {
    final image = await pickImage();
    if (image == null || !context.mounted) return;
    ref.read(createEventFlowControllerProvider.notifier).setImage(image);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.isEditingFromReview,
      ),
    );
    final image = ref.watch(
      createEventFlowControllerProvider.select((state) => state.image),
    );

    return CreateEventFlowLayout(
      title: 'create_image_title'.tr(),
      subtitle: 'create_image_subtitle'.tr(),
      step: CreateEventFlowConstants.imageStep,
      body: SingleChildScrollView(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateEventImageScreenCard(
              image: image,
              onPick: () => _pick(context, ref),
            ),
            if (image != null) ...[
              const SizedBox(height: _gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  _CreateEventImageScreenPillButton(
                    icon: Assets.icons.replaceIc,
                    label: 'create_image_replace'.tr(),
                    onTap: () => _pick(context, ref),
                  ),
                  _CreateEventImageScreenPillButton(
                    icon: Assets.icons.cropIc,
                    label: 'create_image_crop'.tr(),
                    onTap: () => context.push(AppRoutes.createEventCropScreen),
                  ),
                ],
              ),
              const SizedBox(height: _noteGap),
              const SizedBox(
                width: double.infinity,
                child: _CreateEventImageScreenLooksSharp(),
              ),
            ],
          ],
        ),
      ),
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: _gap,
        children: [
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref
                    .read(createEventFlowControllerProvider.notifier)
                    .removeImage();
                CreateEventFlowNavigation.next(
                  context,
                  ref,
                  AppRoutes.createEventReviewScreen,
                );
              },
              child: Text(
                'create_image_send_without'.tr(),
                style: AppTextStyle.outfitMedium14.copyWith(
                  color: AppColors.inkLabel,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.inkLabel,
                ),
              ),
            ),
          ),
          AppPrimaryButton(
            label: isEditing
                ? 'create_edit_done'.tr()
                : 'create_image_next'.tr(),
            isEnabled: image != null,
            onPressed: () => CreateEventFlowNavigation.next(
              context,
              ref,
              AppRoutes.createEventReviewScreen,
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateEventImageScreenPillButton extends StatelessWidget {
  const _CreateEventImageScreenPillButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String label;
  final VoidCallback onTap;

  static const double _height = 42;
  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      shape: const StadiumBorder(
        side: BorderSide(color: AppColors.mistDark, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                icon.svg(
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: const ColorFilter.mode(
                    AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  label,
                  style: AppTextStyle.outfitMedium14_5.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateEventImageScreenLooksSharp extends StatelessWidget {
  const _CreateEventImageScreenLooksSharp();

  static const double _badgeSize = 28;
  static const double _iconSize = 14;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.successLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: _badgeSize,
            height: _badgeSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.checkIc.svg(
              width: _iconSize,
              height: _iconSize,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'create_image_looks_sharp'.tr(),
              style: AppTextStyle.outfitRegular14.copyWith(
                color: AppColors.successInk,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
