import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invit/features/event/presentation/controller/device_contacts/device_contacts_controller.dart';
import 'package:invit/features/event/presentation/controller/device_contacts/device_contacts_state.dart';
import 'package:invit/features/event/presentation/utils/create_event_flow_constants.dart';
import 'package:invit/features/event/presentation/utils/guest_phone_number.dart';
import 'package:invit/features/event/presentation/widgets/create_event_contacts_screen/create_event_contacts_screen_tile.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_field.dart';
import 'package:invit/features/event/presentation/widgets/create_event_flow/create_event_flow_layout.dart';
import 'package:invit/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:invit/src/core/shared_widgets/app_error_widget.dart';
import 'package:invit/src/core/shared_widgets/app_primary_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Step 4 (contacts): pick guests from the phone's contacts.
class CreateEventContactsScreen extends ConsumerStatefulWidget {
  const CreateEventContactsScreen({super.key});

  @override
  ConsumerState<CreateEventContactsScreen> createState() =>
      _CreateEventContactsScreenState();
}

class _CreateEventContactsScreenState
    extends ConsumerState<CreateEventContactsScreen> {
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(20, 12, 20, 0);

  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(
      deviceContactsControllerProvider.select((state) => state.contacts),
    );
    final selected = ref.watch(
      deviceContactsControllerProvider.select(
        (state) => state.selectedIds.length,
      ),
    );
    final notifier = ref.read(deviceContactsControllerProvider.notifier);

    return CreateEventFlowLayout(
      title: 'contacts_title'.tr(),
      subtitle: 'contacts_subtitle'.tr(),
      step: CreateEventFlowConstants.guestsStep,
      body: Padding(
        padding: _padding,
        child: Column(
          spacing: 12,
          children: [
            CreateEventFlowTextField(
              controller: _search,
              hint: 'contacts_search_hint'.tr(),
              textInputAction: TextInputAction.search,
              onChanged: notifier.search,
            ),
            Expanded(
              child: contacts.when(
                data: (_) => const _CreateEventContactsScreenList(),
                error: (error, _) => AppErrorWidget(
                  errorMsg: error is ContactsPermissionDenied
                      ? 'contacts_permission_denied'.tr()
                      : error.toString(),
                  onTap: notifier.retry,
                ),
                loading: () => const _CreateEventContactsScreenSkeleton(),
              ),
            ),
          ],
        ),
      ),
      bottom: AppPrimaryButton(
        label: selected == 0
            ? 'contacts_select_some'.tr()
            : 'contacts_add_selected'.tr(args: ['$selected']),
        isEnabled: selected > 0,
        onPressed: () {
          notifier.addSelectedToEvent();
          if (context.canPop()) context.pop();
        },
      ),
    );
  }
}

class _CreateEventContactsScreenList extends ConsumerWidget {
  const _CreateEventContactsScreenList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(
      deviceContactsControllerProvider.select((state) => state.visibleContacts),
    );
    final selectedIds = ref.watch(
      deviceContactsControllerProvider.select((state) => state.selectedIds),
    );
    if (contacts.isEmpty) {
      return AppEmptyDataWidget(text: 'contacts_empty');
    }
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return CreateEventContactsScreenTile(
          contact: contact,
          isSelected: selectedIds.contains(contact.id),
          onTap: () => ref
              .read(deviceContactsControllerProvider.notifier)
              .toggle(contact.id),
        );
      },
    );
  }
}

class _CreateEventContactsScreenSkeleton extends StatelessWidget {
  const _CreateEventContactsScreenSkeleton();

  static const int _rows = 8;
  static const DeviceContact _placeholder = DeviceContact(
    id: '',
    name: 'Contact name',
    phone: GuestPhoneNumber(dialCode: '974', number: '00000000'),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _rows,
        itemBuilder: (_, _) => CreateEventContactsScreenTile(
          contact: _placeholder,
          isSelected: false,
          onTap: () {},
        ),
      ),
    );
  }
}
