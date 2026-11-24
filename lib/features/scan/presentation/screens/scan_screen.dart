import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event_details/presentation/controller/event_details_controller.dart';
import 'package:invit/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:invit/features/scan/presentation/controller/scan_controller.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_arrival_sheet.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_camera.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_doors_chip.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_find_guest_button.dart';
import 'package:invit/features/scan/presentation/widgets/scan_screen/scan_screen_stats_card.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_screen_header.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';
import 'package:invit/src/core/utils/functions/async_action_listener.dart';
import 'package:invit/src/core/utils/functions/coming_soon.dart';
import 'package:invit/src/resourses/color_manager/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Door check-in of one event: scans the guests' QR codes with the camera.
/// Opened from the event details with the event's id as the route extra.
class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key, required this.occasionId});

  /// Reads the route extra; an id that is missing or malformed gives `''`.
  factory ScanScreen.from(Object? extra) =>
      ScanScreen(occasionId: extra is String ? extra : '');

  final String occasionId;

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  static const EdgeInsets _cameraPadding = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const EdgeInsets _statsPadding = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const EdgeInsets _buttonPadding = EdgeInsets.fromLTRB(24, 16, 24, 36);

  late final MobileScannerController _camera = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  @override
  void dispose() {
    _camera.dispose();
    super.dispose();
  }

  void _back() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.mainScreen);
    }
  }

  void _onDetect(BarcodeCapture capture) {
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null) return;
    ref
        .read(scanControllerProvider(widget.occasionId).notifier)
        .onCodeDetected(code);
  }

  /// Shows the welcome sheet, then lets the camera read the next pass.
  Future<void> _showArrival(ScanQrResponse guest) async {
    await ScanScreenArrivalSheet.show(context, guest);
    if (!mounted) return;
    ref.read(scanControllerProvider(widget.occasionId).notifier).scanNext();
  }

  /// The camera keeps running under the next screen, so it is stopped there.
  Future<void> _openFindGuest() async {
    await _camera.stop();
    if (!mounted) return;
    await context.push(AppRoutes.findGuestScreen, extra: widget.occasionId);
    if (!mounted) return;
    await _camera.start();
  }

  void _listenCheckIn() {
    ref.listen(
      scanControllerProvider(
        widget.occasionId,
      ).select((state) => state.checkIn),
      (previous, next) => handleAsyncAction(
        context,
        previous,
        next,
        onSettled: (result) {
          if (result.hasError) {
            AppToast.errorToast(result.error.toString());
            return;
          }
          final guest = result.value;
          if (guest != null) _showArrival(guest);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.occasionId.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Column(
          children: [
            AppScreenHeader(title: 'scan_title'.tr(), onBack: _back),
            const Expanded(child: AppErrorWidget(onTap: null)),
          ],
        ),
      );
    }

    _listenCheckIn();
    final event = ref.watch(
      eventDetailsControllerProvider(
        ocassionId: widget.occasionId,
      ).select((event) => event.value),
    );
    final report = event?.guestReport;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Column(
        children: [
          AppScreenHeader(
            title: 'scan_title'.tr(),
            subtitle: event?.title,
            onBack: _back,
            trailing: event == null
                ? null
                : ScanScreenDoorsChip(
                    // TODO(backend): no endpoint exposes the doors' state yet.
                    onTap: showComingSoon,
                  ),
          ),
          Expanded(
            child: Padding(
              padding: _cameraPadding,
              child: ScanScreenCamera(controller: _camera, onDetect: _onDetect),
            ),
          ),
          if (report != null)
            Padding(
              padding: _statsPadding,
              child: ScanScreenStatsCard(
                arrived: report.scannedCount,
                expected: report.totalInvitees,
              ),
            ),
          Padding(
            padding: _buttonPadding,
            child: ScanScreenFindGuestButton(onTap: _openFindGuest),
          ),
        ],
      ),
    );
  }
}
