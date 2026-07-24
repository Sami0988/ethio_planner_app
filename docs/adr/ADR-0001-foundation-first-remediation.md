# ADR-0001 — Foundation-first remediation before further feature expansion

- **Status:** Proposed (awaiting Walia Nexus approval)
- **Date:** 2026-07-24
- **Deciders:** Walia Nexus product owner, Flutter lead
- **Supersedes / relates to:** `docs/PHASE1_COMPLIANCE_REPORT.md`, `docs/sprint/Ethiopian_Planner_Flutter_Phase1_Dev_Ready_Sprint_Plan.md`, `docs/CODING_STANDARDS.md`, `docs/requirements/Claude_Code_Master_Prompt_Flutter_Planner_App.md`
- **Requirement areas:** APP-FR, CAL-FR, SYNC-FR, CNF-FR, DEL-FR, PRIV-FR, AUTH-FR; business rules BR-OFF-001, BR-SYNC-001, BR-CAL-001, BR-PRIV-001

---

## Context

A full, independent, feature-by-feature code review (2026-07-24) compared the current
implementation against the Phase 1 sprint plan and the binding coding standards. The prior
self-assessment reported ~55–60% of Phase 1 complete.

The review confirmed that this figure holds **by screen count** but not **by architecture**: the
app is a UI-complete prototype sitting on a largely absent offline-first foundation. A realistic
split is **UI ~60% / offline-first architecture ~10%.**

The following systemic defects were verified directly against the source tree (not merely
reported), with evidence:

1. **No offline-first backbone.** No `outbox_operations` table, no sync-metadata columns
   (`serverVersion` / `syncStatus` / `lastOperationId`) on any business table, and zero Drift
   `.transaction()` calls in the codebase. Sync methods are `// TODO` stubs returning success from
   local row counts. → violates BR-OFF-001, BR-SYNC-001, SYNC-FR-002, CODING_STANDARDS §3.
2. **No account/data isolation.** No `accountId` column on any of the 6 tables, no per-account
   database, no guest-mode entity; every `getAll*` DAO query is unfiltered, so a second account
   would read the first account's rows. → fails the Sprint 1 and Sprint 9 exit gates; privacy and
   correctness blocker.
3. **Ethiopian date is faked.** `ecDate = gcDate` behind live TODOs in events, reminders and
   planner (`event_form_sheet.dart:107`, `reminder_form_sheet.dart:100/108`,
   `planner_item_form_sheet.dart:82/90`), even though a correct converter exists in
   `packages/ethiopian_calendar_core`. → violates BR-CAL-001 and the product's Ethiopian-first
   promise.
4. **UI is not Drift-stream-driven.** Controllers imperatively reload after writes; `watch*`
   streams exist but no screen subscribes (calendar, reminders, planner, notes). → violates §3.
5. **Notifications are dead code.** `NotificationService` scheduling/permission methods are never
   invoked — no permission flow, scheduling, tap routing, quiet hours or rebuild. → Sprint 6
   §14.3 unbacked.
6. **Recurrence engine absent** in both the calendar core package and features (only a
   `recurrenceRule` string field). → Sprint 5 unstarted.
7. **Recently Deleted is inert** — `addToRecentlyDeleted` is never called and deletes are hard
   deletes; nothing is recoverable. → violates DEL-FR.
8. **Typed-failure hierarchy missing;** raw `e.toString()` surfaced to users; broad `catch`
   blocks. → violates §6 and APP-FR-007.
9. **Localization debt** — feature forms hardcode English (0 `AppLocalizations` uses in several
   features); `om` and `ti` ARB files are missing ~38 keys each versus `en`/`am`.
10. **Backend + privacy** — datasources call a hardcoded real host with no mock/fixture (violates
    the "mocks until real endpoints exist" contract); a debug `LogInterceptor` logs full
    request/response bodies including credentials and private content. → violates BR-PRIV-001.
11. **`flutter analyze` is not warning-clean** — `todo: warning` plus 21 TODOs in `lib/`. →
    violates the Definition of Done.
12. **Silent data-loss bugs** — `_toCompanion` mappers drop fields (planner
    `isCompleted`/`section`/`sortOrder`; reminder `category`/`linkedEventId`/`recurrenceRule`) and
    `insertOrReplace` clobbers rows.

What is genuinely solid: `ethiopian_calendar_core` conversion + purity + golden-anchor tests; the
Today feature as a correct MVVM reference; semantic theme tokens; `go_router` with no dead-end
navigation; flavor/env config; token-only secure storage; default-off feature flags; and a privacy
scrubber + monitoring interface (currently unwired).

## Decision

**Halt net-new feature expansion and execute a foundation-first remediation** that pays down the
Sprint 1/2 architectural debt before resuming the sprint feature sequence. Concretely, the next
work admitted into a sprint is the **P0 foundation set**, and no feature is considered "Done"
until it sits on this foundation:

- **P0 — Foundation debt:** `outbox_operations` table + sync-metadata columns on every business
  table; single-transaction writes (business record + outbox op) with operation-id idempotency;
  account-scope column enforced in every DAO + guest mode + tested migration; wire Drift `watch`
  streams into controllers; real EC↔GC conversion adapter replacing the `ecDate = gcDate` stubs;
  typed-failure hierarchy with boundary mapping; mock backend + fixtures replacing the hardcoded
  host; remove full-body request/response logging; drive `flutter analyze` to zero warnings.
- **P1:** Bundled content + settings display preferences + calendar correctness (finish Sprint 2/3).
- **P2:** Recurrence engine (Sprint 5) → notification wiring (Sprint 6).
- **P3:** Planner views/autosave/carry-forward, Notes links/soft-delete, Search filters/indexes,
  fix Recently Deleted population (Sprint 7/8).
- **P4:** Auth sessions/devices/deep links, real guest import + sync engine, Conflict Center
  apply/persist (Sprint 9–12).

Each P-band is planned one at a time and approved before code, per the CLAUDE.md working rules.

## Alternatives considered

1. **Continue the sprint feature sequence and retrofit sync/isolation later (status quo).**
   Rejected: the sprint plan (§3.3) explicitly forbids retrofitting synchronization after features
   are complete, because every eligible record must carry sync/account/version/pending/deletion
   state from Sprint 1 onward. Retrofitting later would require migrating and rewriting every
   feature's data path and re-testing all of them.
2. **Ship the guest-only prototype as-is for an early demo, defer the foundation.** Rejected: the
   account-isolation defect (a second account reading another's data) and the faked Ethiopian
   dates are correctness/privacy defects, not polish items; demoing them risks anchoring
   stakeholders on incorrect behavior.
3. **Rewrite the app from scratch.** Rejected: the calendar core, Today reference pattern, theming,
   routing and flavor setup are sound and worth keeping; a rewrite discards that value.

## Rationale

The offline-first backbone, account isolation and Ethiopian-date correctness are load-bearing:
almost every remaining sprint (events, reminders, planner, notes, search, sync, conflicts,
deletion) depends on them. Fixing them first is cheaper than threading them through completed
features, and it is mandated by the sprint plan's "synchronization readiness from the beginning"
principle and by CODING_STANDARDS §3.

## Consequences

**Positive**

- Later features inherit a correct offline-first data path instead of re-implementing it.
- Removes two shipping blockers (cross-account data leakage; incorrect Ethiopian dates).
- Restores an honest Definition of Done (warning-clean analyzer, tested migrations, typed errors).
- Aligns the codebase with the sprint plan's stated sequencing and quality gates.

**Negative**

- Short-term: no new user-visible features while P0 is underway; the reported "% complete" will
  temporarily appear to stall or regress as fake/UI-only paths are replaced with real ones.
- Some completed UI must be reworked to read from Drift streams and typed failures.

## Risks and mitigations

- **Risk:** foundation work expands into an open-ended rewrite. **Mitigation:** scope P0 to the
  bulleted set above; plan and approve one P-band at a time; keep the calendar core, Today,
  theming, routing and config unchanged.
- **Risk:** migration of existing local data corrupts or drops records. **Mitigation:** versioned
  Drift migration with upgrade tests including pending-outbox and soft-deleted rows; never clear
  the database to avoid migration work (ERR-FR-006).
- **Risk:** backend contracts still unstable. **Mitigation:** develop against mocks/fixtures behind
  typed remote data sources; record unresolved endpoints as explicit API assumptions.

## Review trigger

Revisit this decision when P0 is complete and `flutter analyze` is warning-clean with the offline
write path (outbox + one-transaction + account scope) covered by Drift and integration tests, or
sooner if the backend team delivers production-candidate sync/identity contracts that change the
sequencing.
