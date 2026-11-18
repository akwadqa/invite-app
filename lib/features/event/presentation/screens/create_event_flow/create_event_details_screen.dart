import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invit/features/event/presentation/controller/create_event_flow/create_event_flow_controller.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/widgets/create_event_details_screen/create_event_details_screen_location_card.dart';
import 'package:invit/features/event/presentation/widgets/create_event_details_screen/create_event_details_screen_pickers.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/src/application/router/app_routes.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:invit/src/core/shared_widgets/app_toast.dart';

/// Step 3: event name, date, time, venue and map location.
class CreateEventDetailsScreen extends ConsumerStatefulWidget {
  const CreateEventDetailsScreen({super.key});

  @override
  ConsumerState<CreateEventDetailsScreen> createState() =>
      _CreateEventDetailsScreenState();
}

class _CreateEventDetailsScreenState
    extends ConsumerState<CreateEventDetailsScreen> {
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 12, 20, 24);

  late final TextEditingController _title;
  late final TextEditingController _venue;
  late final TextEditingController _hostedBy;

  @override
  void initState() {
    super.initState();
    final flow = ref.read(createEventFlowControllerProvider);
    _title = TextEditingController(text: flow.title);
    _venue = TextEditingController(text: flow.venue);
    _hostedBy = TextEditingController(text: flow.hostedBy);
  }

  @override
  void dispose() {
    _title.dispose();
    _venue.dispose();
    _hostedBy.dispose();
    super.dispose();
  }

  void _next() {
    final error = ref
        .read(createEventFlowControllerProvider.notifier)
        .validateDetails();
    if (error != null) {
      AppToast.errorToast(error.messageKey.tr());
      return;
    }
    CreateEventFlowNavigation.next(
      context,
      ref,
      AppRoutes.createEventGuestsScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = ref.watch(
      createEventFlowControllerProvider.select(
        (state) => state.isEditingFromReview,
      ),
    );
    // The map picker fills the venue when it is still empty.
    ref.listen(
      createEventFlowControllerProvider.select((state) => state.venue),
      (_, venue) {
        if (_venue.text != venue) _venue.text = venue;
      },
    );
    final notifier = ref.read(createEventFlowControllerProvider.notifier);

    return CreateEventFlowLayout(
      title: 'create_details_title'.tr(),
      subtitle: 'create_details_subtitle'.tr(),
      step: CreateEventFlowConstants.detailsStep,
      body: SingleChildScrollView(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 14,
          children: [
            CreateEventFlowFieldLabel(
              label: 'create_details_event_name'.tr(),
              child: CreateEventFlowTextField(
                controller: _title,
                hint: 'create_details_event_name_hint'.tr(),
                textInputAction: TextInputAction.next,
                onChanged: notifier.updateTitle,
              ),
            ),
            CreateEventFlowFieldLabel(
              label: 'create_details_hosted_by'.tr(),
              optionalLabel: 'create_details_optional'.tr(),
              child: CreateEventFlowTextField(
                controller: _hostedBy,
                hint: 'create_details_hosted_by_hint'.tr(),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: notifier.updateHostedBy,
              ),
            ),
            const CreateEventDetailsScreenPickers(),
            CreateEventFlowFieldLabel(
              label: 'create_details_venue'.tr(),
              child: CreateEventFlowTextField(
                controller: _venue,
                hint: 'create_details_venue_hint'.tr(),
                textInputAction: TextInputAction.done,
                onChanged: notifier.updateVenue,
              ),
            ),
            CreateEventFlowFieldLabel(
              label: 'create_details_location'.tr(),
              child: const CreateEventDetailsScreenLocationCard(),
            ),
          ],
        ),
      ),
      bottom: AppPrimaryButton(
        label: isEditing ? 'create_edit_done'.tr() : 'create_details_next'.tr(),
        onPressed: _next,
      ),
    );
  }
}
