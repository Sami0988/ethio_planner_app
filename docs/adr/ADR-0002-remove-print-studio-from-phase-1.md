# ADR-0002 — Remove Print Studio from the Phase 1 build

- **Status:** Accepted
- **Date:** 2026-07-24
- **Deciders:** Walia Nexus product owner, Flutter lead
- **Relates to:** [ADR-0001](ADR-0001-foundation-first-remediation.md), `docs/sprint/Ethiopian_Planner_Flutter_Phase1_Dev_Ready_Sprint_Plan.md` §3.5, CLAUDE.md (Phase 1D)
- **Requirement areas:** PRT-FR (deferred), scope control

---

## Context

The scope-alignment review (2026-07-24) found that a **Print** capability had been added to the
app even though the Phase 1 sprint plan §3.5 ("No deferred capability leakage") explicitly lists
**Print Studio** among the capabilities the Phase 1 backlog **shall not include** (alongside
subscriptions, payments and files). In CLAUDE.md's phase model this is Phase **1D**
(print/commerce), which is not yet authorized.

The Print code was also **orphaned and inconsistent**:

- The `/print` route rendered a local `_SimpleScaffold` placeholder, **not** the `print` feature —
  so the entire `lib/features/print/` tree (9 files: data/domain/presentation) was unreachable dead
  code.
- A `PrintJobs` Drift table was nonetheless wired into the database schema
  (`app_database.dart`, `tables.dart`), adding out-of-scope migration weight.
- A `morePrint` string and a More-hub tile exposed the deferred feature to users.

## Decision

**Remove Print entirely from the Phase 1 build** (hard removal, not a feature flag), and drop its
persistence:

1. Delete `lib/features/print/` (orphaned feature).
2. Remove the `/print` route and the `_SimpleScaffold` placeholder from `core/router/app_router.dart`,
   and the now-unused `AppLocalizations` import.
3. Remove `RouteNames.print`.
4. Remove the Print tile from the More hub (`features/more/.../more_page.dart`) and update its doc
   comment.
5. Remove the `PrintJobs` table from `core/database/tables.dart` and the `@DriftDatabase` table list.
6. Bump Drift `schemaVersion` 4 → 5 with an `onUpgrade` step `deleteTable('print_jobs')`.
7. Remove the `morePrint` key from all four ARB files (en/am/om/ti).

A hard removal (rather than a disabled feature flag) was chosen because the code was already dead
and there is no released artifact or production data to preserve.

## Alternatives considered

1. **Feature-flag Print off, keep the code.** Rejected: the feature was orphaned/unwired and would
   remain dead code and dead schema; a flag adds maintenance for no current value.
2. **Leave as-is, document only.** Rejected: it keeps an out-of-scope table in every migration and
   an out-of-scope destination in the shipping UI, contradicting sprint plan §3.5.

## Consequences

**Positive:** Phase 1 build matches the approved guest-first scope; the schema and navigation no
longer carry deferred-feature weight; less dead code.

**Negative:** When Print Studio is authorized (Phase 1D) it must be rebuilt — acceptable, since the
removed code was a non-functional shell and Phase 1D will require a server-authoritative PDF design
anyway (per the master prompt).

## Follow-up required (code generation + verification)

This change edits Drift and l10n **source**; generated files are now stale and must be regenerated.
The Flutter/Dart toolchain was **not available in the editing environment**, so these commands were
**not run** and their results are **not yet verified**:

```
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # regenerate app_database.g.dart (drops PrintJobs)
flutter gen-l10n                                            # regenerate app_localizations*.dart (drops morePrint)
dart format .
flutter analyze
flutter test
```

Until `build_runner` runs, `lib/core/database/app_database.g.dart` still references the removed
`PrintJobs`/`PrintJob` types and the project will not compile. This is expected codegen hygiene, not
a defect. Definition of Done for this ADR is met only when the commands above pass.

## Review trigger

Revisit when Phase 1D (print/commerce) is authorized: this ADR is superseded by the Print Studio
design ADR at that time.
