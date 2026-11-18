import 'package:easy_localization/easy_localization.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

/// Tap handler for design elements whose backend is not ready yet. Every
/// call site carries a `TODO` naming the missing endpoint or field.
void showComingSoon() => AppToast.infoToast('common_coming_soon'.tr());
