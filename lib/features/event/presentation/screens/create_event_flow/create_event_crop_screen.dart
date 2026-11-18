import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_crop_screen/create_event_crop_screen_viewport.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// Crops the invitation image freely: drag the corners and edges of the frame
/// to keep any part of it.
class CreateEventCropScreen extends ConsumerStatefulWidget {
  const CreateEventCropScreen({super.key});

  @override
  ConsumerState<CreateEventCropScreen> createState() =>
      _CreateEventCropScreenState();
}

class _CreateEventCropScreenState extends ConsumerState<CreateEventCropScreen> {
  static const EdgeInsets _bodyPadding = EdgeInsets.fromLTRB(24, 16, 24, 8);
  static const double _resetGap = 16;
  static const double _resetHeight = 40;
  static const double _resetIconSize = 16;

  /// Space the crop handles need around the image.
  static const double _handleRoom = 40;

  static const Rect _fullImage = Rect.fromLTRB(0, 0, 1, 1);

  final ValueNotifier<Rect> _area = ValueNotifier(_fullImage);
  Size? _imageSize;
  ImageStream? _stream;
  ImageStreamListener? _listener;

  @override
  void initState() {
    super.initState();
    final file = ref.read(createEventFlowControllerProvider).image;
    if (file != null) _readImageSize(file);
  }

  void _readImageSize(File file) {
    final stream = FileImage(file).resolve(const ImageConfiguration());
    final listener = ImageStreamListener((info, _) {
      if (!mounted) return;
      setState(() {
        _imageSize = Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        );
      });
    });
    _stream = stream..addListener(listener);
    _listener = listener;
  }

  @override
  void dispose() {
    final listener = _listener;
    if (listener != null) _stream?.removeListener(listener);
    _area.dispose();
    super.dispose();
  }

  /// The image scaled to fit inside [available] (all of it stays visible).
  Size _fit(Size image, Size available) {
    final scale =
        available.width / image.width < available.height / image.height
        ? available.width / image.width
        : available.height / image.height;
    return Size(image.width * scale, image.height * scale);
  }

  void _apply() {
    ref.read(createEventFlowControllerProvider.notifier).cropImage(_area.value);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      createEventFlowControllerProvider.select((state) => state.imageCrop),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast('create_crop_failed'.tr());
            return;
          }
          if (context.canPop()) context.pop();
        },
      ),
    );
    final file = ref.watch(
      createEventFlowControllerProvider.select((state) => state.image),
    );
    final image = _imageSize;

    return CreateEventFlowLayout(
      title: 'create_crop_title'.tr(),
      subtitle: 'create_crop_subtitle'.tr(),
      step: CreateEventFlowConstants.imageStep,
      body: Padding(
        padding: _bodyPadding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (file == null || image == null) return const SizedBox.shrink();
            final shown = _fit(
              image,
              Size(
                constraints.maxWidth - _handleRoom,
                constraints.maxHeight - _resetGap - _resetHeight - _handleRoom,
              ),
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: _resetGap,
              children: [
                CreateEventCropScreenViewport(
                  file: file,
                  imageSize: shown,
                  area: _area,
                ),
                TextButton.icon(
                  onPressed: () => _area.value = _fullImage,
                  icon: Assets.icons.replaceIc.svg(
                    width: _resetIconSize,
                    height: _resetIconSize,
                    colorFilter: const ColorFilter.mode(
                      AppColors.inkLabel,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: Text(
                    'create_crop_reset'.tr(),
                    style: AppTextStyle.outfitMedium14.copyWith(
                      color: AppColors.inkLabel,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottom: AppPrimaryButton(
        label: 'create_crop_apply'.tr(),
        icon: Assets.icons.checkIc,
        mirrorIconInRtl: false,
        onPressed: _apply,
      ),
    );
  }
}
