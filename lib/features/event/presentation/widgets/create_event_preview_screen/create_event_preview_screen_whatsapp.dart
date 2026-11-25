import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_bubble.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_message.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_painters.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// A WhatsApp business chat: top bar, doodle background and the messages of
/// [chat]. It is always drawn left to right, exactly as the guest sees it.
class CreateEventPreviewScreenWhatsapp extends StatelessWidget {
  const CreateEventPreviewScreenWhatsapp({
    super.key,
    required this.chat,
    required this.bottomInset,
  });

  final CreateEventPreviewChat? chat;

  /// Space under the messages for the controls drawn over the chat.
  final double bottomInset;

  static const double _radius = 26;
  static const double _borderWidth = 1;
  static const double _messageGap = 6;
  static const EdgeInsets _chatPadding = EdgeInsets.fromLTRB(12, 10, 12, 10);
  static const double _dateChipGap = 10;

  @override
  Widget build(BuildContext context) {
    final current = chat;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.mistOutline,
          borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            _borderWidth,
            _borderWidth,
            _borderWidth,
            0,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(_radius - _borderWidth),
            ),
            child: Column(
              children: [
                const _CreateEventPreviewScreenTopBar(),
                Expanded(
                  child: ColoredBox(
                    color: AppColors.whatsappChat,
                    child: CustomPaint(
                      painter: const CreateEventPreviewScreenDoodlePainter(),
                      child: SizedBox.expand(
                        child: SingleChildScrollView(
                          padding: _chatPadding.copyWith(
                            bottom: _chatPadding.bottom + bottomInset,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: _messageGap,
                            children: [
                              const Center(
                                child: _CreateEventPreviewScreenDateChip(),
                              ),
                              const SizedBox(
                                height: _dateChipGap - _messageGap,
                              ),
                              if (current != null) ...[
                                if (current.replyLabel != null)
                                  CreateEventPreviewScreenOutgoingReply(
                                    label: current.replyLabel!,
                                    quotedTitle: current.quotedTitle,
                                  ),
                                CreateEventPreviewScreenIncomingBubble(
                                  message: current.incoming,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
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

class _CreateEventPreviewScreenTopBar extends StatelessWidget {
  const _CreateEventPreviewScreenTopBar();

  static const double _height = 58;
  static const double _avatarSize = 38;
  static const double _avatarMarkSize = 26;
  static const double _backSize = 24;
  static const double _videoSize = 24;
  static const double _phoneSize = 22;
  static const double _badgeSize = 15;
  static const double _nameLineHeight = 1.2;
  static const EdgeInsets _padding = EdgeInsets.only(left: 6, right: 10);

  @override
  Widget build(BuildContext context) {
    ColorFilter ink() =>
        const ColorFilter.mode(AppColors.whatsappText, BlendMode.srcIn);

    return Container(
      height: _height,
      padding: _padding,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.whatsappDivider)),
      ),
      child: Row(
        spacing: 8,
        children: [
          Assets.icons.waBackIc.svg(
            width: _backSize,
            height: _backSize,
            colorFilter: ink(),
          ),
          Container(
            width: _avatarSize,
            height: _avatarSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.waAvatarMark.svg(
              width: _avatarMarkSize,
              height: _avatarMarkSize,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    Flexible(
                      child: Text(
                        'create_preview_sender'.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.outfitSemiBold16.copyWith(
                          color: AppColors.whatsappText,
                          height: _nameLineHeight,
                        ),
                      ),
                    ),
                    Assets.icons.waVerifiedIc.svg(
                      width: _badgeSize,
                      height: _badgeSize,
                    ),
                  ],
                ),
                Text(
                  'create_preview_business_account'.tr(),
                  style: AppTextStyle.outfitRegular12_5.copyWith(
                    color: AppColors.whatsappMeta,
                    height: _nameLineHeight,
                  ),
                ),
              ],
            ),
          ),
          Assets.icons.waVideoIc.svg(
            width: _videoSize,
            height: _videoSize,
            colorFilter: ink(),
          ),
          const SizedBox(width: 14),
          Assets.icons.waPhoneIc.svg(
            width: _phoneSize,
            height: _phoneSize,
            colorFilter: ink(),
          ),
        ],
      ),
    );
  }
}

class _CreateEventPreviewScreenDateChip extends StatelessWidget {
  const _CreateEventPreviewScreenDateChip();

  static const double _radius = 7.5;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.whatsappShadow,
            offset: Offset(0, 1),
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Text(
        'create_preview_today'.tr(),
        style: AppTextStyle.outfitRegular12_5.copyWith(
          color: AppColors.whatsappDate,
          height: 1.2,
        ),
      ),
    );
  }
}
