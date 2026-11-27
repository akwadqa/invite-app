import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_message.dart';
import 'package:invit/features/event/presentation/widgets/create_event_preview_screen/create_event_preview_screen_painters.dart';
import 'package:invit/gen/assets.gen.dart';
import 'package:invit/src/core/utils/extenssions/string_extension.dart';
import 'package:invit/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

const double _bubbleRadius = 7.5;
const double _lineHeight = 20 / 15;
const List<BoxShadow> _bubbleShadow = [
  BoxShadow(
    color: AppColors.whatsappShadow,
    offset: Offset(0, 1),
    blurRadius: 0.5,
  ),
];

String _timeNow(BuildContext context) =>
    DateFormat.jm(context.locale.toString()).format(DateTime.now());

/// A message from the business: header image, text, footer and quick reply
/// buttons, on the left with its tail.
class CreateEventPreviewScreenIncomingBubble extends StatelessWidget {
  const CreateEventPreviewScreenIncomingBubble({
    super.key,
    required this.message,
  });

  final CreateEventPreviewMessage message;

  static const double _maxWidth = 296;
  static const double _imageRadius = 6;
  static const double _imageHeight = 168;
  static const double _imagePadding = 3;
  static const double _sideInset = 8;

  bool get _hasImage =>
      message.imageFile != null || (message.imagePath?.isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: _sideInset),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxWidth),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(_bubbleRadius),
                    bottomRight: Radius.circular(_bubbleRadius),
                    bottomLeft: Radius.circular(_bubbleRadius),
                  ),
                  boxShadow: _bubbleShadow,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (_hasImage)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          _imagePadding,
                          _imagePadding,
                          _imagePadding,
                          0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(_imageRadius),
                          child: SizedBox(
                            height: _imageHeight,
                            child: _image(),
                          ),
                        ),
                      ),
                    _CreateEventPreviewScreenMessageText(
                      message: message,
                      time: _timeNow(context),
                    ),
                    for (final button in message.buttons)
                      _CreateEventPreviewScreenQuickReply(label: button),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: -_sideInset,
              top: 0,
              child: CustomPaint(
                size: CreateEventPreviewScreenTailPainter.size,
                painter: CreateEventPreviewScreenTailPainter(
                  isIncoming: true,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    final file = message.imageFile;
    if (file != null) return Image.file(file, fit: BoxFit.cover);
    final path = message.imagePath ?? '';
    return CachedNetworkImage(
      imageUrl: path.startsWith('http') ? path : ServicesUrls.imageUrl + path,
      fit: BoxFit.cover,
      placeholder: (_, _) => const ColoredBox(color: AppColors.paper),
      errorWidget: (_, _, _) => const ColoredBox(color: AppColors.paper),
    );
  }
}

class _CreateEventPreviewScreenMessageText extends StatelessWidget {
  const _CreateEventPreviewScreenMessageText({
    required this.message,
    required this.time,
  });

  final CreateEventPreviewMessage message;
  final String time;

  static const EdgeInsets _padding = EdgeInsets.fromLTRB(9, 6, 9, 7);
  static const double _titleGap = 3;
  static const double _footerGap = 5;
  static const double _footerLineHeight = 17 / 13;

  @override
  Widget build(BuildContext context) {
    final title = message.title?.trim() ?? '';
    final text = message.message?.trim() ?? '';
    final footer = message.footer;
    final bodyStyle = AppTextStyle.outfitRegular15.copyWith(
      color: text.isEmpty ? AppColors.whatsappMeta : AppColors.whatsappText,
      height: _lineHeight,
    );

    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                textDirection: title.textDirection,
                style: AppTextStyle.outfitSemiBold15.copyWith(
                  color: AppColors.whatsappText,
                  height: _lineHeight,
                ),
              ),
            ),
            const SizedBox(height: _titleGap),
          ],
          SizedBox(
            width: double.infinity,
            child: Text(
              text.isEmpty ? 'create_preview_no_message'.tr() : text,
              textDirection: text.textDirection,
              style: bodyStyle,
            ),
          ),
          const SizedBox(height: _footerGap),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  footer ?? '',
                  style: AppTextStyle.outfitRegular13.copyWith(
                    color: AppColors.whatsappMeta,
                    height: _footerLineHeight,
                  ),
                ),
              ),
              Text(
                time,
                style: AppTextStyle.outfitRegular11.copyWith(
                  color: AppColors.whatsappMeta,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateEventPreviewScreenQuickReply extends StatelessWidget {
  const _CreateEventPreviewScreenQuickReply({required this.label});

  final String label;

  static const double _height = 42;
  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.whatsappDivider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 7,
        children: [
          Assets.icons.replyIc.svg(
            width: _iconSize,
            height: _iconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.whatsappLink,
              BlendMode.srcIn,
            ),
          ),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.outfitRegular15.copyWith(
                color: AppColors.whatsappLink,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The guest's reply, on the right: the quoted invitation title above the
/// tapped button's text, with its time and read ticks.
class CreateEventPreviewScreenOutgoingReply extends StatelessWidget {
  const CreateEventPreviewScreenOutgoingReply({
    super.key,
    required this.label,
    required this.quotedTitle,
  });

  final String label;
  final String? quotedTitle;

  static const double _maxWidth = 260;
  static const double _padding = 3;
  static const double _quoteRadius = 6;
  static const double _quoteBar = 4;
  static const double _sideInset = 8;
  static const double _quoteLineHeight = 1.3;
  static const double _ticksWidth = 16;
  static const double _ticksHeight = 11;
  static const EdgeInsets _quotePadding = EdgeInsets.symmetric(
    horizontal: 9,
    vertical: 5,
  );
  static const EdgeInsets _textPadding = EdgeInsets.fromLTRB(6, 4, 6, 2);

  @override
  Widget build(BuildContext context) {
    final quoted = quotedTitle?.trim() ?? '';
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: _sideInset),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: _maxWidth),
              padding: const EdgeInsets.all(_padding),
              decoration: const BoxDecoration(
                color: AppColors.whatsappOutgoing,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_bubbleRadius),
                  bottomRight: Radius.circular(_bubbleRadius),
                  bottomLeft: Radius.circular(_bubbleRadius),
                ),
                boxShadow: _bubbleShadow,
              ),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (quoted.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(_quoteRadius),
                        child: Container(
                          padding: _quotePadding,
                          decoration: const BoxDecoration(
                            color: AppColors.whatsappQuote,
                            border: Border(
                              left: BorderSide(
                                color: AppColors.whatsappQuoteAccent,
                                width: _quoteBar,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'create_preview_sender'.tr(),
                                style: AppTextStyle.outfitSemiBold13.copyWith(
                                  color: AppColors.whatsappQuoteAccent,
                                  height: _quoteLineHeight,
                                ),
                              ),
                              Text(
                                quoted,
                                textDirection: quoted.textDirection,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.outfitRegular13_5.copyWith(
                                  color: AppColors.whatsappDate,
                                  height: _quoteLineHeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding: _textPadding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              label,
                              textDirection: label.textDirection,
                              style: AppTextStyle.outfitRegular15.copyWith(
                                color: AppColors.whatsappText,
                                height: _lineHeight,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _timeNow(context),
                            style: AppTextStyle.outfitRegular11.copyWith(
                              color: AppColors.whatsappMeta,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Assets.icons.waTicksIc.svg(
                            width: _ticksWidth,
                            height: _ticksHeight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              right: -_sideInset,
              top: 0,
              child: CustomPaint(
                size: CreateEventPreviewScreenTailPainter.size,
                painter: CreateEventPreviewScreenTailPainter(
                  isIncoming: false,
                  color: AppColors.whatsappOutgoing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
