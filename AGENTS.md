# AGENTS.md — Flutter Project Rules

Project-wide instructions for coding agents working on this Flutter codebase. Follow every rule below strictly and write clean, modular, production-ready Dart.

## 1. System Language (STRICT)

- **Always respond in Arabic:** All explanations, questions, plans, and final summaries MUST be written in Arabic.
- **English exceptions only:** Code blocks, file paths, identifiers, CLI commands, and standard technical terms remain in English.
- **No fallback to English:** Keep responding in Arabic even when the user prompt or error logs are in English.

## 2. Working Agreement & Scope

- **Inspect before editing:** Before creating widgets, helpers, colors, or text styles, inspect existing files (`AppColors`, text styles, shared widgets, and the feature's existing `data/` & `domain/` layers) to reuse what already exists.
- **Ask on ambiguity:** Do not silently guess architectural changes, add new packages to `pubspec.yaml`, or edit files outside the requested feature scope. Stop and ask first.
- **No destructive operations:** Never delete existing public files/widgets or run destructive `git` commands without explicit approval.

## 3. UI/UX Redesign Boundaries (CRITICAL)

- **Sacred Layers (`data/` & `domain/`):** Backend APIs, DTOs/Models (`@freezed`), DataSources, and Repositories are already working. NEVER modify API payloads, endpoint paths, or model fields unless explicitly asked.
- **Presentation Layer (`presentation/`):** The app is undergoing a full UI and user-flow redesign. Screen counts, step sequences, and selection logic inside features have changed.
  - Use existing old Controllers and Screens ONLY as references to understand how Repositories are called and what business validations exist.
  - You ARE allowed to restructure or rewrite `State` classes, `Controllers`, and `Screens/Widgets` inside `presentation/` to match the new multi-screen HTML flows, as long as the final data sent to the `Repository` remains 100% compatible with the backend.
  - Keep `flutter_screenutil` (`.w`, `.h`, `.sp`, `.r`, `ScreenUtilInit`) if the project already uses it; do not add it if the project does not use it.
  - At the end of each feature redesign, list obsolete old screens/widgets in your final summary so I can approve deleting them.

## 4. Architecture

- **Layers:** `features/<feature>/{data, domain, presentation}`.
- **Data flow:** `Screen → Controller → Repository → DataSource → network client → API`.
- **State management:** Riverpod with code generation (`@riverpod`). Business logic lives in controllers, never in widgets. Avoid `setState` unless the state is purely local to a single widget.
- **Models:** `@freezed` + `json_serializable`, with `@JsonKey(name: 'snake_case')` for API fields.
- **Constants:**
  - No magic values.
  - API values with a fixed set of options must be enums with a field for the API value, e.g. `enum PostType { sale('Sale'); final String apiValue; }`.
  - Repeated keys used by one feature go in a small helper class in `presentation/utils/`.

## 5. Controllers

- **Public API:** Widgets call controller methods (`search(query)`, `applyFilters()`). They never mutate notifier fields directly.
- **Private fields:** Pagination counters, queries, and caches must be private.
- **`ref.watch` vs `ref.read`:** Use `ref.watch` only inside `build`. Use `ref.read` inside methods.
- **`ref.mounted` after every `await`:** Check `ref.mounted` before touching `state` or `ref` (including inside `catch`). If unmounted, return the method's neutral value (`null`, `false`, `[]`).
- **Latest-request counter** for actions that can fire again before finishing (search, pagination, refresh, retry, fast toggles, autocomplete):
  - Use one counter per independent data stream.
  - Clearing or replacing the input must also bump the counter.
  - Single-shot actions (submit, delete, logout) only need `ref.mounted`.

```dart
int _latestItemsRequest = 0;

Future<List<Item>?> fetchItems({required int page}) async {
  final requestId = ++_latestItemsRequest;
  bool isOutdated() => !ref.mounted || requestId != _latestItemsRequest;
  try {
    final response = await repository.fetchItems(page);
    if (isOutdated()) return null;
    // update state
  } catch (e, st) {
    if (isOutdated()) return null;
    // emit error
  }
}
```

- **Reading dependencies:**
  - Read `keepAlive` dependencies (repositories, storage, services) **before** the first `await`.
  - Read `autoDispose` providers **after** the `await`, guarded by `ref.mounted`. Never call a disposed notifier.
- **`_current` / `_emit`:** If the state is always `AsyncData`, read and write it through these two helpers. Notifiers that set the whole state to `AsyncLoading`/`AsyncError` assign `state` directly and do not use them.

```dart
MyState get _current => state.requireValue;
void _emit(MyState newState) => state = AsyncData(newState);
```

- **Optimistic updates** (like, favorite): Roll back on failure, and only allow the latest request to roll back.

## 6. State Classes

- **Shape:** `@freezed` with one `const factory` and `@Default` values. The initial state is `const MyState()`; no `init()` factory.
- **Screen data:** `@Default(AsyncLoading()) AsyncValue<T>`.
- **One-off actions** (submit, delete, send): `@Default(AsyncData(null)) AsyncValue<T?>`, where `AsyncData(null)` means idle.
- **Flags:** Non-nullable with an explicit default matching what the UI expects.
- **Single source for UI:** Everything a screen reads lives in the state.

```dart
@freezed
abstract class MyState with _$MyState {
  const factory MyState({
    @Default(AsyncLoading()) AsyncValue<List<Item>> items,
    @Default(AsyncData(null)) AsyncValue<void> deleteItem,
    @Default(false) bool isSelected,
  }) = _MyState;
}
```

- **Freezed & Riverpod 3 pitfalls:**
  - `copyWith(x: null)` sets `null`.
  - Lists and maps are unmodifiable.
  - Riverpod 3 notifies using `==`, so emitting an equal state notifies nobody. React to transitions (`AsyncLoading` → `AsyncData`/`AsyncError`), not repeated values.
- **Immutability:** Never mutate a collection held in state; always build a new one (`[...list, item]`, `{...map, key: value}`, `Map.of(map)..remove(key)`).

## 7. Safety

- Never use `!` or `.first` on API data; use `??`, `?.`, and `firstOrNull`.
- Always guard list indexes before `removeAt` or `[]`.
- For navigation that may have no route to return to (e.g. deep links), check `context.canPop()` before `pop()`.
- Never display placeholder/dummy values to users when real data is missing.

## 8. UI & Loading Rules

- **Widgets:** Keep widgets small and preferably stateless.
- **Naming & placement:** `ScreenName + Description` (e.g. `HomeScreenListItems`), placed in `widgets/<screen>/<screen>_<widget>.dart`.
- **Duplication:** Extract repeated UI into a private widget instead of duplicating markup.
- **Shared widgets:** Reuse the project's shared widgets for loaders, errors, empty states, toasts, dialogs, and pagination.
- **Rebuilds:** Use `ref.watch(provider.select(...))` to rebuild only when needed. Use `ref.listen` for navigation, dialogs, and toasts.
- **Colors:** Never hard-code colors; always use `AppColors`.
- **Text styles:**
  - Use the project's text style class, named `FontName + Weight + Size` (e.g. `rubikSemiBold18`).
  - Use `.sp` sizes only if the project already uses `flutter_screenutil`.
- **Loading States (Strict Separation — Never Mix):**
  1. **Initial screen, lists, details, pagination (Shimmer only):** Loaded in the controller's `build`/fetch and rendered in the widget tree with a `Shimmer` skeleton mimicking the expected layout. NEVER use a centered `CircularProgressIndicator` or a loading dialog for this.
  2. **Blocking one-off user actions (Full-screen loading dialog only):** For submit, login, send/verify code, create, update, delete, pay, or logout, show the project's shared full-screen loading dialog for the entire request (blocks taps and back button). NEVER put a spinner inside the submit button.
     - Drive the dialog strictly from `ref.listen` on the action's `AsyncValue` (never from `build` or `onTap`):
       - When `next` starts loading → dismiss keyboard, show dialog.
       - When `previous` was loading and `next` settles → close ONLY the loading dialog first (identified e.g. by route name, never closing a screen or another dialog), then navigate or show the error/success message.
     - Reuse one shared helper for this show/close/settle flow instead of repeating it per screen.
  3. **Tiny non-blocking inline indicators:** `CircularProgressIndicator` is ONLY permitted for tiny, non-blocking inline widgets (e.g., a small icon toggle or compact inline status indicator) — never full-page and never inside submit buttons.

## 9. Localization (`easy_localization`)

- Every user-facing string MUST be a localization key: `'key'.tr()` or `context.tr('key')`.
- Placeholders must match the call across every language file:
  - `tr(args: [x])` fills positional `{}`.
  - `tr(namedArgs: {'name': x})` fills `{name}`.

## 10. Code Generation

- After modifying providers, models, or states, run:
  ```bash
  dart run build_runner build
  ```
- NEVER pass `--delete-conflicting-outputs` (removed in `build_runner` 2.16 and ignored).
- Keep only generated files whose source changed; revert generated files with line-ending-only diffs or unrelated staleness (exception: keep all regenerated files after upgrading a generator package).

## 11. Android Build Constraints

- **Dot-files (`.env`):** Android's default ignore pattern excludes `.*`. Ensure `android/app/build.gradle` (or `.kts`) always keeps inside `android { }`:

```groovy
androidResources {
    ignoreAssetsPattern = "!.svn:!.git:!.ds_store:!*.scc:<dir>_*:!CVS:!thumbs.db:!picasa.ini:!*~"
}
```

  After any Flutter upgrade, migrator run, or Android build file edit, verify this block is still present and restore it if missing.
- **Toolchain sync:** Keep AGP/Kotlin versions in sync between `android/settings.gradle` and the top of `android/build.gradle`, and keep Gradle version in `android/gradle/wrapper/gradle-wrapper.properties`.
- **Migrator flags:** Never remove `android.builtInKotlin=false` or `android.newDsl=false` from `android/gradle.properties`.
- **Buildscript redirection & JVM target:** Preserve the blocks in `android/build.gradle` that redirect plugin `buildscript` AGP/Kotlin versions and align Kotlin `jvmTarget` with Java `targetCompatibility`. NEVER edit plugin files inside the pub cache.
- **Offline-first Gradle changes:** Do not trigger large downloads. Use only locally cached Gradle/AGP/Kotlin/SDK versions (`~/.gradle/wrapper/dists`, `~/.gradle/caches/modules-2/files-2.1`, local Android SDK) and validate Gradle edits with `./gradlew --offline`.

## 12. Cleanup

- When touching a file, remove commented-out code, unused imports, unused locals, and dead mock data.
- Never delete unused public widgets or files without asking; list them in the final summary instead.

## 13. Verification & Output (Mandatory Before Finishing)

1. If any `@riverpod`, `@freezed`, or `@JsonSerializable` file changed, run `dart run build_runner build`.
2. Run `flutter analyze` and fix any new errors or warnings introduced by your changes.
3. Reply concisely **in Arabic** with:
   - What changed and the exact file paths touched.
   - The `flutter analyze` result (explicitly noting any remaining warnings/errors).
   - Any obsolete old screens/widgets recommended for deletion (if applicable).