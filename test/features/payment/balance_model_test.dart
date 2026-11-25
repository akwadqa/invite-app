import 'package:flutter_test/flutter_test.dart';
import 'package:invit/features/payment/domain/model/balance/balance_model.dart';
import 'package:invit/src/infrastructure/api/response/api_response.dart';

void main() {
  // Real response of invite.api.balance.get_message_balance.
  final json = <String, dynamic>{
    'status_code': 200,
    'error': 0,
    'message': 'Message balance fetched successfully',
    'pagination': {
      'current_page': 1,
      'items_per_page': 10,
      'total_items': 2,
      'total_pages': 1,
    },
    'data': {
      'messages_left': 1597,
      'history': [
        {
          'id': '8aoju5qdnu',
          'date': '2026-11-24 17:19:27.248979',
          'type': 'Invitations Sent',
          'title': 'Invitations sent',
          'subtitle': 'Test 2',
          'amount': -1,
          'balance_after': 1597,
          'occasion': 'OCC-2026-269',
          'bundle': null,
          'paid_amount': null,
        },
        {
          'id': 'purchase1',
          'date': '2026-11-20 10:00:00',
          'type': 'Purchase',
          'title': 'Celebration plan',
          'subtitle': null,
          'amount': 300,
          'balance_after': 1600,
          'occasion': null,
          'bundle': 'Celebration',
          'paid_amount': 99.5,
        },
      ],
    },
  };

  test('parses the balance response through ApiResponse', () {
    final response = ApiResponse<BalanceModel>.fromJson(
      json,
      (data) => BalanceModel.fromJson(data as Map<String, dynamic>),
    );

    expect(response.hasSucceeded, isTrue);
    expect(response.pagination?.totalPages, 1);
    final data = response.data!;
    expect(data.messagesLeft, 1597);
    expect(data.history, hasLength(2));

    final spent = data.history[0];
    expect(spent.isCredit, isFalse);
    expect(spent.amount, -1);
    expect(spent.subtitle, 'Test 2');
    expect(spent.dateTime, DateTime(2026, 11, 24, 17, 19, 27, 248, 979));

    final bought = data.history[1];
    expect(bought.isCredit, isTrue);
    expect(bought.paidAmount, 99.5);
  });

  test('missing history falls back to an empty list', () {
    final model = BalanceModel.fromJson({'messages_left': 5});
    expect(model.history, isEmpty);
  });
}
