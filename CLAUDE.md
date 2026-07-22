# CLAUDE.md — Development Contract

Customer-facing **Flutter Planner App** for the *Ethiopian Calendar, Reminder, Simple Planner &
Custom Print SaaS Platform* (Walia Nexus). This file is the standing contract for every session.

## Source-of-truth documents (read fully before any work)

1. `docs/requirements/Walia_Nexus_Flutter_Planner_App_Clean_Functional_Requirements.md` — **PRIMARY** product source (requirement IDs, phases, business rules, acceptance criteria).
2. `docs/requirements/Ethiopian_Calendar_Planner_SRS.md` — supporting technical SRS (data model, NFRs, testing, deployment, open decisions §71, required ADRs §72, use cases, traceability §65).
3. `docs/requirements/Claude_Code_Master_Prompt_Flutter_Planner_App.md` — the development contract / engineering constraints.

`DEVELOPMENT_PLAN.md` (repo root) — full-platform context; the Flutter app is Workstream 6.

## Scope

Build ONLY the Flutter customer app (Android + iOS mandatory; Web/PWA deferred). Integrate with a
pre-existing NestJS backend via typed, versioned HTTPS APIs using mocks/fakes/fixtures until real
endpoints exist. **Do not** build backend, worker, website, admin portal, or infrastructure.

## Hard exclusions (reject if proposed)

HR, payroll, attendance, appraisal, KPI/scorecards, project management (milestones/dependencies/
Kanban/assignees), CRM, accounting/invoicing/tax, e-signature, approval/hierarchy workflows,
admin/finance/moderation/job-monitoring screens, backend implementation. Institution/department/
job-title exist only as personal profile or print fields — never as org hierarchy.

## Working rules

- **Plan before code.** Produce planning output and stop for explicit approval before generating code.
- **One phase at a time.** Phases: 0 (foundation) → 1A (calendar) → 1B (events/reminders) →
  1C (planner/notes) → 1D (print/commerce) → EXT (public events/polls/questions). Never start the
  next phase without explicit approval.
- **Map code to requirement IDs** (APP-FR, AUTH-FR, CAL-FR, EVT-FR, REC-FR, REM-FR, NTF-FR, PLN-FR,
  NOTE-FR, TMP-FR, SRCH-FR, SYNC-FR, CNF-FR, DEL-FR, PRT-FR, SUB-FR, PRIV-FR, PUB/POLL/QST-FR, etc.).
- **Inspect existing code before changing it.** No unrelated refactoring.
- **Do not invent** package versions, API behavior, limits, or business rules. Unresolved values from
  the requirements' "Open Business Decisions" table stay as explicit assumptions/config, never
  silently hard-coded.
- **Real command evidence only.** Never claim `dart format` / `flutter analyze` / `flutter test` /
  codegen / builds pass unless the commands actually ran and passed. Report the real output.
- **Offline-first is literal:** Drift is the client source of truth; UI renders from Drift streams,
  never directly from Dio. Every offline write persists business record + outbox operation in one
  transaction. Operation ID (not entity ID) is the idempotency key.
- **Server authoritative** for sync acceptance, conflicts, reminder scheduling, PDF generation,
  payments/entitlements, poll/question moderation.

## Architecture (decided)

Feature-first + offline-first + Clean MVVM. Hybrid layering: simple features 3 layers
(data/domain/presentation); complex features add `application/use_cases`. Domain code imports no
Flutter/Drift/Dio/platform. Ethiopian calendar logic lives in a pure-Dart package
`packages/ethiopian_calendar_core` with golden-reference fixtures. Develop in place as `ethio_planner`
at repo root (no `planner_app/` subdir).

## Phase Definition of Done

Acceptance criteria mapped to tests; generated code current; `dart format` clean; `flutter analyze`
zero warnings; unit/Drift/widget tests pass; required integration smoke tests pass; migrations tested;
privacy/logging review passes; no critical/high defect open; Android build succeeds (iOS on macOS CI);
ADRs/docs updated; next phase needs no hidden manual steps.
