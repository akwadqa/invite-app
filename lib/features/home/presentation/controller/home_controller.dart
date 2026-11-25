import 'package:invit/features/event/domain/model/event_model/event_model.dart';
import 'package:invit/features/home/data/repositories/home_repository.dart';
import 'package:invit/features/home/domain/model/home/home_model.dart';
import 'package:invit/src/infrastructure/api/response/pagination/pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

/// Home feed: the user's events (paginated), balance, bundles and occasion
/// types. Other screens read the balance, bundles and types from it.
@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  static const int _firstPage = 1;

  List<EventModel> _events = const [];
  int _currentPage = _firstPage;
  int _totalPages = _firstPage;
  int _latestHomeRequest = 0;

  @override
  Future<HomeModel> build() async {
    // Any refresh or page load still running belongs to the previous build.
    _latestHomeRequest++;
    final repository = ref.read(homeRepositoryProvider);
    final response = await repository.getHomeData(page: _firstPage);
    return _merge(response.data, response.pagination, _firstPage);
  }

  /// Reloads the first page after an error.
  Future<void> retry() async {
    state = const AsyncLoading();
    await _fetchFirstPage();
  }

  /// Pull to refresh: keeps the current events visible while reloading.
  Future<bool> refresh() => _fetchFirstPage();

  /// Returns whether more pages remain, for the pagination footer.
  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages || state.isLoading) return false;
    final page = _currentPage + 1;
    final requestId = ++_latestHomeRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestHomeRequest;
    final repository = ref.read(homeRepositoryProvider);
    try {
      final response = await repository.getHomeData(page: page);
      if (isOutdated()) return false;
      state = AsyncData(_merge(response.data, response.pagination, page));
      return _currentPage < _totalPages;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _fetchFirstPage() async {
    final requestId = ++_latestHomeRequest;
    bool isOutdated() => !ref.mounted || requestId != _latestHomeRequest;
    final repository = ref.read(homeRepositoryProvider);
    try {
      final response = await repository.getHomeData(page: _firstPage);
      if (isOutdated()) return false;
      state = AsyncData(_merge(response.data, response.pagination, _firstPage));
      return true;
    } catch (error, stackTrace) {
      if (isOutdated()) return false;
      if (!state.hasValue) state = AsyncError(error, stackTrace);
      return false;
    }
  }

  HomeModel _merge(HomeModel? data, Pagination? pagination, int page) {
    _currentPage = pagination?.currentPage ?? page;
    _totalPages = pagination?.totalPages ?? page;
    final pageEvents = data?.events ?? const <EventModel>[];
    _events = page == _firstPage ? pageEvents : [..._events, ...pageEvents];
    return HomeModel(
      bundles: data?.bundles ?? const [],
      events: _events,
      consumingBalance: data?.consumingBalance,
      remainingBalance: data?.remainingBalance,
      featuredEvents: data?.featuredEvents ?? const [],
      occasionTypes: data?.occasionTypes ?? const [],
    );
  }
}

/// Home events split by the server's `is_upcoming` flag (by date when it is
/// missing): upcoming (soonest first, undated last) and past (latest first). Past events
/// without a valid date are listed last.
final DateTime _noDate = DateTime.fromMillisecondsSinceEpoch(0);

@riverpod
HomeEventSections homeEventSections(Ref ref) {
  final events = ref.watch(
    homeControllerProvider.select(
      (home) => home.value?.events ?? const <EventModel>[],
    ),
  );
  final now = DateTime.now();
  final upcoming = <({EventModel event, DateTime? date})>[];
  final past = <({EventModel event, DateTime date})>[];
  for (final event in events) {
    final date = DateTime.tryParse(event.dateTime ?? '');
    final isUpcoming =
        event.isUpcoming ?? !(date != null && date.isBefore(now));
    if (!isUpcoming) {
      past.add((event: event, date: date ?? _noDate));
    } else {
      upcoming.add((event: event, date: date));
    }
  }
  upcoming.sort((a, b) {
    final first = a.date;
    final second = b.date;
    if (first == null) return second == null ? 0 : 1;
    if (second == null) return -1;
    return first.compareTo(second);
  });
  past.sort((a, b) => b.date.compareTo(a.date));
  return HomeEventSections(
    upcoming: upcoming.map((item) => item.event).toList(),
    past: past.map((item) => item.event).toList(),
  );
}

class HomeEventSections {
  const HomeEventSections({required this.upcoming, required this.past});

  final List<EventModel> upcoming;
  final List<EventModel> past;

  bool get isEmpty => upcoming.isEmpty && past.isEmpty;

  @override
  bool operator ==(Object other) =>
      other is HomeEventSections &&
      _sameEvents(other.upcoming, upcoming) &&
      _sameEvents(other.past, past);

  @override
  int get hashCode =>
      Object.hash(Object.hashAll(upcoming), Object.hashAll(past));

  static bool _sameEvents(List<EventModel> a, List<EventModel> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
