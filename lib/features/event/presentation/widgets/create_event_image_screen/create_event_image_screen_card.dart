import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// The picked invitation card in its own shape (very tall images are fitted
/// to a maximum height), or the upload drop zone while there is no image.
class CreateEventImageScreenCard extends StatelessWidget {
  const CreateEventImageScreenCard({
    super.key,
    required this.image,
    required this.onPick,
  });

  final File? image;
  final VoidCallback onPick;

  @override
  Widget build(BuildContext context) {
    final file = image;
    return file == null
        ? _CreateEventImageScreenDropzone(onTap: onPick)
        : _CreateEventImageScreenPicked(file: file);
  }
}

class _CreateEventImageScreenPicked extends StatelessWidget {
  const _CreateEventImageScreenPicked({required this.file});

  final File file;

  static const double _width = 266;
  static const double _maxHeight = 400;
  static const double _radius = 20;
  static const List<BoxShadow> _shadow = [
    BoxShadow(
      color: AppColors.shadowCard,
      offset: Offset(0, 18),
      blurRadius: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: _shadow,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: _maxHeight),
        child: Image.file(file, width: _width, fit: BoxFit.contain),
      ),
    );
  }
}

class _CreateEventImageScreenDropzone extends StatelessWidget {
  const _CreateEventImageScreenDropzone({required this.onTap});

  final VoidCallback onTap;

  static const double _width = 290;
  static const double _height = 362;
  static const double _radius = 28;
  static const double _borderWidth = 2;
  static const double _iconCircleSize = 64;
  static const double _iconSize = 28;
  static const List<double> _dash = [6, 6];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.dropzoneFill,
      borderRadius: BorderRadius.circular(_radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: const Radius.circular(_radius),
            color: AppColors.dropzoneBorder,
            strokeWidth: _borderWidth,
            dashPattern: _dash,
          ),
          child: SizedBox(
            width: _width - _borderWidth * 2,
            height: _height - _borderWidth * 2,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 14,
                children: [
                  Container(
                    width: _iconCircleSize,
                    height: _iconCircleSize,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.icons.uploadIc.svg(
                      width: _iconSize,
                      height: _iconSize,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Text(
                    'create_image_pick'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitMedium19.copyWith(
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    'create_image_pick_hint'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitRegular14.copyWith(
                      color: AppColors.inkLabel,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
