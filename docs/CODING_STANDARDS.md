# Ethio Planner — Coding Standards

Engineering standard for the Walia Nexus Flutter Planner App. These rules are
**enforced** — CI fails on formatter, analyzer and test violations, and code
review rejects deviations. They derive from the master prompt's clean-code rules
and the functional requirements / SRS.

Companion docs: [`CLAUDE.md`](../CLAUDE.md) · [`DEVELOPMENT_PLAN.md`](../DEVELOPMENT_PLAN.md)
· requirements in [`docs/requirements/`](requirements).

---

## 1. Architecture & layering

- **Feature-first + offline-first + Clean MVVM.** Code lives under
  `lib/features/<feature>/…`, cross-cutting code under `lib/core/…`, reusable UI
  under `lib/shared/…`, pure-Dart domain packages under `packages/…`.
- **Hybrid layering.** Simple features use three layers
  (`data` / `domain` / `presentation`). Only complex features (events, sync,
  print) add an `application/use_cases` layer. **Do not create empty or
  ceremonial layers** or placeholder folders/files for unbuilt features.
- **Dependency direction:** `presentation → application → domain` and
  `data → domain`. Never the reverse.
- **Domain purity.** `domain/` and `packages/ethiopian_calendar_core` must not
  import Flutter, Drift, Dio, Firebase or any platform plugin.
- **No feature reaches into another feature's internals.** Cross-feature access
  goes through a domain repository interface, never another feature's DAO.

## 2. State management — Riverpod only

- **Riverpod is the only state/DI mechanism.** Do **not** add or use
  `ChangeNotifier`, the `provider` package, Bloc, Cubit, GetX, MobX, `get_it` or
  `injectable`.
- Screen state is a `Notifier` (or `AsyncNotifier`) exposing an **immutable**
  view state. Reference pattern (`features/today`):

  ```dart
  final class TodayController extends Notifier<TodayViewState> {
    @override
    TodayViewState build() => /* compose from repositories via ref.watch */;
  }
  final todayControllerProvider =
      NotifierProvider<TodayController, TodayViewState>(TodayController.new);
  ```
- Inject dependencies with providers and `ref.watch`/`ref.read`. **No global
  mutable singletons or static service locators.**
- No business logic in `build()` of a widget; widgets read a prepared model.

## 3. Data & offline-first

- **Drift-managed SQLite is the client source of truth.** All business screens
  render from **Drift watch streams**. The UI must never render synchronized
  business records straight from a Dio response.
  `Widget → Riverpod controller → Repository → Drift DAO → watch stream → rebuild`.
- Remote responses are validated, mapped and **persisted to Drift first**; the
  stream then updates the UI.
- **Every offline write** persists the business record **and** an outbox
  operation in **one Drift transaction** (BR-OFF-001, SYNC-FR-002).
- The **operation id** (not the entity id) is the idempotency key
  (BR-SYNC-001). Retries reuse the same operation id.
- Do **not** implement automatic generic retries for `POST/PATCH/PUT/DELETE` in
  Dio — writes retry only through the durable outbox.
- Never infer `synced` from mere connectivity (SYNC-FR-005). Persist the real
  `SyncStatus`.
- One local database is authoritative — **no** Hive/Isar/ObjectBox/Realm or a
  second SQLite. `SharedPreferences` is never business persistence.

## 4. Models & serialization

- Use **freezed** for immutable models and unions; `json_serializable` for DTOs.
- Keep **separate** representations: domain entity · Drift row · request DTO ·
  response DTO · view state · sync operation. **Do not reuse one class across
  layers.**
- **No `dynamic` or untyped `Map<String, dynamic>` across architectural
  boundaries.** Map at the edge into typed objects.
- Client-generated ids use `uuid` (prefer v7 for sortable records where the
  stable package supports it, else v4 consistently).

## 5. Ethiopian calendar

- All calendar maths goes through `packages/ethiopian_calendar_core`. **Never
  compute or convert dates inside a widget** — the controller supplies computed
  `EthiopianDate`/`GregorianDate`; widgets only format (see
  `today_date_formatter.dart`).
- The authoring `CalendarBasis` is authoritative (BR-CAL-001). An Ethiopian
  annual recurrence stays Ethiopian — never rewritten to a fixed Gregorian
  month/day (REC-FR-004).
- Date-only/all-day values never shift due to timezone (BR-CAL-002).
- Any calendar change ships with golden-fixture tests.

## 6. Error handling

- Model failures with the typed hierarchy in `core/errors/failures.dart`
  (`ValidationFailure`, `AuthenticationFailure`, `ConflictFailure`, …).
- **Map infrastructure errors into domain/application failures at the boundary.**
- **No broad `catch` that swallows errors.** Catch narrowly, convert to a typed
  failure, and surface an actionable state.
- **Never expose raw exception text, stack traces or internal ids** to users
  (APP-FR-007). Provide a correlation id where available.
- A storage/migration failure must never be "fixed" by silently wiping the local
  database (ERR-FR-006).

## 7. Localization

- **No hard-coded user-facing strings** in widgets. All chrome text comes from
  generated `AppLocalizations` (ARB files in `lib/l10n/`).

  ```dart
  final l10n = AppLocalizations.of(context);
  Text(l10n.sectionEvents);           // not Text('Events')
  ```
- Version 1 interface languages are **English + Amharic** (LOC-FR-001). Amharic
  and other Ethiopian-script languages are **LTR** (no RTL mirroring); test font
  fallback, line height, clipping and 200 % scaling.
- Never auto-translate user content. Changing language must not alter stored
  dates, recurrence, calendar basis or titles.
- Amharic strings authored without native review are marked for review before
  release.

## 8. Theming & design system

- Use the **semantic theme tokens** — colours via the `context.colorX`
  extension, spacing via `AppSpacing`, radii via `AppRadii`, text via
  `AppTextStyles`. **No hard-coded `Color(0x…)`, magic paddings, or repeated
  inline styles** inside feature widgets.
- Reuse shared components (`AppCard`, `SectionHeader`, `CheckboxTile`,
  `StatusBadge`, `PrimaryButton`) rather than restyling per widget.
- Dark theme is designed intentionally, not a colour inversion.

## 9. Widgets

- No Dio, DAO, Drift, Firebase, notification-plugin or secure-storage calls from
  widgets or controllers-as-widgets — go through repositories/services.
- Prefer small, cohesive, `const` widgets; keep methods short.
- Status is never communicated by **colour alone** (ACC-FR-004) — always icon
  and/or text plus semantics.
- Provide semantic labels, logical focus order, ≥ 48dp touch targets, and
  support 200 % text scaling (ACC-FR-*).

## 10. Security & privacy

- `flutter_secure_storage` holds **only** refresh tokens (native), installation
  secrets and approved keys — never events, notes, planner content or outbox
  payloads. Do not claim it encrypts the Drift database.
- **Never log or send to analytics/monitoring** private content: note/planner
  text, reminder/event descriptions, unpublished questions, voter identity,
  tokens, passwords or payment data (BR-PRIV-001, PRIV-FR-010).
- The backend is authoritative for sync acceptance, conflicts, reminder
  scheduling, PDF generation, payments/entitlements and moderation. Never grant
  premium from a client-side success callback.

## 11. Naming & files

- Files `snake_case.dart`; types `UpperCamelCase`; members `lowerCamelCase`;
  constants `lowerCamelCase`.
- One primary public type per file; file name matches it.
- No giant utility/"manager" classes with unrelated methods; no dumping
  `shared_models.dart`-style files.
- No hard-coded routes, URLs, locales, feature limits or endpoints — centralize
  in config/route constants.

## 12. Codegen

- Generated files (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) are
  **never hand-edited**.
- After changing a freezed/Drift/Riverpod/ARB source, regenerate:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  flutter pub get   # regenerates localization when generate: true
  ```
- CI verifies generated code is current; stale generated output fails the build.

## 13. Analysis & formatting

- `analysis_options.yaml` is strict (strict-casts/inference/raw-types + curated
  lints). **Zero analyzer warnings.**
- `dart format .` is mandatory; unformatted code fails CI.
- **No `// ignore:` without an explicit justifying comment.** No `print` — use
  `debugPrint` or the monitoring abstraction.
- **No unresolved `TODO` placeholders** in code delivered as complete for a
  phase. Track future work in issues/ADRs/the plan.

## 14. Testing

- Grow tests **with** the code — new behaviour ships with tests.
- Layers to cover: **unit** (calendar conversion, recurrence, outbox retry,
  coalescing, conflict policy, mappers, controllers); **Drift** (constraints,
  migrations, outbox durability, cursors, tombstones, cross-account isolation);
  **widget** (screens in EN/AM, light/dark, 200 % scaling, offline/sync/conflict
  states, accessibility semantics); **integration** (the offline→restart→sync→
  idempotent-retry journey).
- Use `flutter_test`, `mocktail`, `integration_test`; reuse repository fakes.
  Don't add test packages that aren't used.

## 15. Definition of Done (per change / phase)

A change is done when: it maps to requirement IDs; generated code is current;
`dart format` clean; `flutter analyze` has zero warnings; unit/Drift/widget tests
pass; required integration smoke tests pass; migrations tested; privacy/logging
reviewed; no critical/high defect open; the mandatory-platform build succeeds;
ADRs/docs updated. **Never claim commands pass unless they were actually run.**
