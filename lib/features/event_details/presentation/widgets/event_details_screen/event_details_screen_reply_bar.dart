import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/guest/presentation/utils/guest_reply_status.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:invit/src/resourses/font_manager/app_text_style.dart';

/// One reply column: a rounded track with a colored bar that grows from 0
/// to its height once when it first appears, then its label and count.
class EventDetailsScreenReplyBar extends StatefulWidget {
  const EventDetailsScreenReplyBar({
    super.key,
    required this.status,
    required this.count,
    required this.percent,
    required this.fill,
    required this.onTap,
    this.delay = Duration.zero,
    this.animate = true,
  });

  final GuestReplyStatus status;
  final int count;
  final int percent;

  /// Bar height as a share of the track (0 → 1).
  final double fill;
  final VoidCallback onTap;

  /// Stagger between the columns.
  final Duration delay;

  /// `false` shows the bar at full height (skeleton).
  final bool animate;

  static const double trackHeight = 212;
  static const double _radius = 40;
  static const double _percentBottom = 20;
  static const double _labelGap = 10;
  static const double _lineHeight = 1.2;

  /// One line of the 14px label.
  static const double _labelHeight = 14 * _lineHeight;
  static const Duration _duration = Duration(milliseconds: 900);
  static const Curve _curve = Cubic(0.22, 1, 0.36, 1);

  @override
  State<EventDetailsScreenReplyBar> createState() =>
      _EventDetailsScreenReplyBarState();
}

class _EventDetailsScreenReplyBarState extends State<EventDetailsScreenReplyBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: EventDetailsScreenReplyBar._duration,
  );
  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: EventDetailsScreenReplyBar._curve,
  );
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (!widget.animate || reduceMotion) {
      _controller.value = 1;
      return;
    }
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Bar color and the color of the percentage written on it.
  (Color, Color) get _colors => switch (widget.status) {
    GuestReplyStatus.noReply => (widget.status.dot, AppColors.ink),
    _ => (widget.status.dot, AppColors.white),
  };

  @override
  Widget build(BuildContext context) {
    final (barColor, textColor) = _colors;
    final barHeight =
        EventDetailsScreenReplyBar.trackHeight * widget.fill.clamp(0.0, 1.0);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              EventDetailsScreenReplyBar._radius,
            ),
            child: Container(
              height: EventDetailsScreenReplyBar.trackHeight,
              width: double.infinity,
              color: AppColors.mistSoft,
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: _progress,
                builder: (context, child) => Container(
                  height: barHeight * _progress.value,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: barColor,
                    borderRadius: BorderRadius.circular(
                      EventDetailsScreenReplyBar._radius,
                    ),
                  ),
                  child: child,
                ),
                // The percentage keeps its place at the bottom and shows as
                // the bar grows over it.
                child: OverflowBox(
                  alignment: Alignment.bottomCenter,
                  minHeight: barHeight,
                  maxHeight: barHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: EventDetailsScreenReplyBar._percentBottom,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '${widget.percent}%',
                        style: AppTextStyle.outfitSemiBold15.copyWith(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: EventDetailsScreenReplyBar._labelGap),
          // "Not delivered" is wider than the column; it overflows centered
          // instead of being cut, as in the design.
          SizedBox(
            width: double.infinity,
            height: EventDetailsScreenReplyBar._labelHeight,
            child: OverflowBox(
              minWidth: 0,
              maxWidth: double.infinity,
              child: Text(
                widget.status.titleKey.tr(),
                maxLines: 1,
                softWrap: false,
                style: AppTextStyle.outfitMedium14.copyWith(
                  color: AppColors.ink,
                  height: EventDetailsScreenReplyBar._lineHeight,
                ),
              ),
            ),
          ),
          Text(
            'details_guests_count'.tr(args: ['${widget.count}']),
            maxLines: 1,
            softWrap: false,
            style: AppTextStyle.outfitRegular12_5.copyWith(
              color: AppColors.inkLabel,
              height: EventDetailsScreenReplyBar._lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}
