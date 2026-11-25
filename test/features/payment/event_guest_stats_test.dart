import 'package:flutter_test/flutter_test.dart';
import 'package:invit/features/event/domain/model/event_model/event_model.dart';

void main() {
  test('parses guest_stats and the new event fields', () {
    final event = EventModel.fromJson({
      'event_id': 'OCC-2026-218',
      'title': 'TEST ME',
      'role': 'owner',
      'reminder_template': null,
      'is_upcoming': true,
      'checkin_status': 'live',
      'checkin_stats': {'total_invitees': 2, 'failed': 2, 'scanned_count': 0},
      'guest_stats': {
        'confirmed': 0,
        'no_reply': 2,
        'declined': 0,
        'not_delivered': 2,
      },
    });
    expect(event.guestStats?.noReply, 2);
    expect(event.guestStats?.notDelivered, 2);
    expect(event.checkinStats?.totalInvitees, 2);
    expect(event.isUpcoming, isTrue);
    expect(event.checkinStatus, 'live');
  });
}
