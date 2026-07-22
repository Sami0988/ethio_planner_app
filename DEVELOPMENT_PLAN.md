# ETHIOPIAN PLANNER — FULL PLATFORM DEVELOPMENT PLAN

> Product: **Ethiopian Calendar, Reminder, Simple Planner & Custom Print SaaS Platform** (Walia Nexus).
> Companion to `refined_flutter_planner_app_master_prompt.md` (which scopes ONLY the Flutter app).
> This document covers the **entire platform**; the Flutter app is Workstream 6.
> Status date: 2026-07-22.

> **Scope note.** The master prompt deliberately restricts *Claude's coding scope* to the Flutter
> customer app. This plan is broader: it maps every platform component so the Flutter work fits a
> coherent whole. Other workstreams may be built by other teams or under separate prompts — but they
> are planned here so contracts, sequencing, and shared assets line up.

---

## SECTION A — LOCKED DECISIONS (2026-07-22)

- **A1 = SRS will be provided.** Treat the incoming SRS as authoritative for all workstreams; reconcile this plan and the prompt against it. **Feature-level work waits for the SRS.**
- **A2 = Flutter app developed in place** as `ethio_planner` at repo root (no `planner_app/` subdir).
- **A3 = Hybrid layering** in Flutter; extract pure-Dart `packages/ethiopian_calendar_core`.
- **A4 (new) = Ethiopian calendar core is a shared cross-language asset.** One canonical algorithm + golden-reference fixtures, consumed by BOTH the Flutter app (Dart) and the backend (TypeScript). Backend and client MUST agree bit-for-bit on conversions and recurrence.
- **A5 (new) = Backend is authoritative** for sync acceptance, conflicts, reminders scheduling, PDF generation, payments/entitlements, moderation. Clients are offline-first caches with a transactional outbox.
- **A6 (new) = Claude implements the Flutter app (WS6) ONLY.** WS0–WS5 (contracts, infra, backend, worker, admin, public site) are planned here for coherence but built by another team. The Flutter app develops against **mock API implementations / fake servers / local fixtures** until real endpoints exist. WS0 shared assets (calendar core golden fixtures, API contract) are still authored/owned jointly, but Claude's code output is Flutter-only per the master prompt.

---

## SECTION B — SYSTEM ARCHITECTURE

### Components

| # | Component | Tech | Role |
|---|-----------|------|------|
| 1 | **Public website** | Next.js | Marketing, pricing, signup entry, legal, SEO, blog/help |
| 2 | **Admin portal** | Next.js | Content mgmt, calendar packs, finance/subscriptions, moderation, job monitoring, support |
| 3 | **Backend API** | NestJS (modular) | Auth, sync push/pull, entities CRUD, entitlements, print requests, public events/polls/questions |
| 4 | **Background worker** | NestJS + BullMQ | Reminder scheduling, push delivery, PDF generation, email, payment reconciliation, cleanup |
| 5 | **Primary DB** | PostgreSQL + Drizzle ORM | System of record (server-authoritative) |
| 6 | **Cache/queue** | Redis + BullMQ | Job queues, rate limits, ephemeral state |
| 7 | **Object storage** | S3 / MinIO | Attachments, generated PDFs (expiring links) |
| 8 | **Flutter app** | Flutter (Android/iOS, optional Web/PWA) | Customer offline-first client |
| 9 | External providers | FCM/APNs, email (SES/etc.), payment (store IAP + hosted checkout) | Delivery & billing |

### Core data flow

```
Flutter app (Drift SSOT + outbox)
   │  HTTPS, versioned API, idempotent ops
   ▼
Backend API (NestJS) ──► PostgreSQL (server SoT)
   │        ▲                    │
   │        │ enqueue            │ changes
   ▼        │                    ▼
BullMQ (Redis) ──► Worker: reminders / push / PDF / email / payments
                        │                 │
                        ▼                 ▼
                  FCM/APNs           S3/MinIO (PDFs, attachments)

Admin portal (Next.js) ──► Backend API (admin scopes)
Public website (Next.js) ──► Backend API (public + signup)
```

### Shared assets (build once, consume everywhere)

- **Ethiopian calendar core** — canonical conversion + recurrence + golden fixtures (Dart pkg + TS pkg, same fixtures).
- **API contract** — OpenAPI/typed schema; source of truth for DTOs, sync envelope, cursor, conflict payloads.
- **Design tokens** — shared color/spacing/typography for web + Flutter where practical.
- **Auth/identity model** — one account model, tokens, device/session registry, entitlement shape.

---

## SECTION C — WORKSTREAMS

### WS0 — Shared foundations (blocks everything)
- [ ] **API contract v1** (OpenAPI): auth/refresh, device register/revoke, sync push, per-op results, sync pull + cursor, conflict payloads, tombstones, calendar packs, reminders, attachment upload authz, print request/status, generated-file download authz, subscriptions/entitlements, purchase receipt, payment-return verify, data export, account deletion, public events, polls/votes, questions/moderation. For each: method, path, authz, request/response DTO, idempotency, errors, retry class, pagination/cursor, schema version, correlation ID.
- [ ] **Ethiopian calendar core** — canonical algorithm spec + golden fixtures (New Year, Pagume 5/6 leap, round trips, min/max, leap boundaries, EC/GC yearly recurrence, all-day TZ-independent). Publish as `ethiopian_calendar_core` (Dart) and a mirrored TS package.
- [ ] **Identity & entitlement model** — account, guest, device/session, plan/entitlement shape.
- [ ] **Sync protocol spec** — batch envelope, entity ordering, operation types, result codes, cursor semantics, conflict semantics. Shared by client + server.
- [ ] **Design tokens / brand** — EN + Amharic (Amharic is **LTR**; verify font fallback, not RTL).

### WS1 — Infrastructure & DevOps
- [ ] Environments: development / staging / production (separate DBs, buckets, queues, domains, keys).
- [ ] Provision PostgreSQL, Redis, S3/MinIO (IaC — Docker Compose for dev, cloud for staging/prod).
- [ ] Secrets management (no secrets in repos); per-env config.
- [ ] CI/CD pipelines per component; container builds; DB migration gating.
- [ ] Observability stack: logging, metrics, error monitoring (Sentry or equivalent), with private-content redaction across all services.
- [ ] Backup/restore policy for Postgres + object storage; retention for expiring PDF links.

### WS2 — Backend API (NestJS, modular)
- [ ] Modules: `auth`, `accounts`, `devices`, `sync`, `calendar-packs`, `events`, `reminders`, `planner`, `notes`, `templates`, `attachments`, `print`, `subscriptions/entitlements`, `payments`, `public-events`, `polls`, `questions`, `admin`, `export`, `data-deletion`.
- [ ] Drizzle schema + migrations (server system of record). Server-authoritative versioning (not device clocks).
- [ ] **Sync engine (server side):** accept idempotent operations keyed by `operation_id`; return APPLIED / ALREADY_APPLIED / REJECTED / CONFLICT / UNAUTHORIZED / SESSION_EXPIRED / RETRYABLE_FAILURE; issue pull cursors; emit tombstones; per-entity conflict policy matching the client's.
- [ ] Auth: verified-email registration, sign-in, refresh rotation, session/device revocation, guest→account migration, password reset, account deletion, data export.
- [ ] Recurrence + calendar: reuse shared calendar core (TS); store EC recurrence as EC.
- [ ] Entitlements: authoritative; receipt validation hooks; feature gating source of truth.
- [ ] Public events / polls / questions with moderation, duplicate-vote prevention, rate limits.
- [ ] Enqueue jobs to BullMQ (reminders, push, PDF, email, payments).
- [ ] Security: authz on every ownership boundary, rate limiting, input validation, audit log.

### WS3 — Background worker (NestJS + BullMQ)
- [ ] Reminder occurrence calculation & canonical scheduling (authoritative), quiet hours, daily summaries.
- [ ] Push delivery (FCM/APNs) with retry, dedup, invalid-token cleanup, notification-attempt records.
- [ ] **PDF generation** (authoritative print artifact) → S3/MinIO → expiring download link; status + failure reasons.
- [ ] Email delivery (verification, reset, receipts, summaries).
- [ ] Payment reconciliation: webhook verification, subscription activation/renewal/expiry/refund, entitlement correction.
- [ ] Maintenance: cache expiry, tombstone GC, attachment cleanup, expired-link cleanup.

### WS4 — Admin portal (Next.js)
- [ ] Auth with admin scopes/roles.
- [ ] Content management: calendar packs (holidays/observances) authoring & publishing, templates.
- [ ] Moderation: public questions, poll configuration, event publication.
- [ ] Finance: subscriptions, entitlement overrides, refunds, revenue views.
- [ ] Operations: BullMQ job monitoring, sync/health dashboards, error triage.
- [ ] Support: account lookup, device/session revocation, data-export/deletion handling.

### WS5 — Public website (Next.js)
- [ ] Marketing pages, pricing, feature tour, EN/Amharic.
- [ ] Signup entry + email verification landing; deep-link handoff to app (email verify, password reset, payment return).
- [ ] Hosted checkout return pages; legal/privacy; help/FAQ; SEO + performance.

### WS6 — Flutter customer app  *(the master prompt's scope; detailed below)*

See **Section D**. Summary: offline-first client, Drift SSOT + transactional outbox + custom
SyncCoordinator, Ethiopian calendar core, EN/Amharic, Android/iOS (Web/PWA optional).

---

## SECTION D — FLUTTER APP DETAIL (WS6)

Current readiness **~10%** (clean scaffold; every repository and the date converter throw
`UnimplementedError`; zero sync/outbox code in `lib/`). Develop in place per A2/A3.

### D0 — Foundation hardening (Phase 0)
- [ ] Strict lints (`very_good_analysis` + `riverpod_lint` + `custom_lint`), replace default `flutter_lints`.
- [ ] Flavors `main_development/staging/production` + `bootstrap()`; centralized env via `--dart-define`.
- [ ] Consume shared **`ethiopian_calendar_core`** (WS0); delete throwing `lib/core/utils/date_converter.dart`.
- [ ] **Drift redesign:** sync metadata on every synced table (`id, owner_id, server_version, sync_status, created_at, updated_at, deleted_at, last_operation_id`); add outbox, sync_receipts, sync_cursors, sync_conflicts, deletion_tombstones, sync_lease, device-only tables; indexes on date ranges; versioned migrations + migration tests; bounded occurrence horizon.
- [ ] Typed failures, monitoring abstraction (redacted), feature-flag service, l10n shell (EN + Amharic).
- [ ] CI: format → analyze → codegen verify → unit/drift/widget tests → build Android/Web/(iOS on macOS).
- [ ] ADRs (SSOT, outbox sync, conflict policy, recurrence storage, DB encryption, native-vs-web auth).

### D1 — Calendar foundation (Phase 1A)
Guest mode, auth shell, preferences; calendar views (EC/GC/dual, year/month/week/day, week-start, jump-to-New-Year); calendar packs; **initial SyncCoordinator** (session → reachability → lease → push outbox → pull cursor → apply in txn → release); sync-status UI.
**Gate:** calendar reference suite, offline restart, migration tests, security baseline.

### D2 — Events & reminders (Phase 1B)
Events CRUD/duplicate/move/recurrence/exceptions/category/attachment-metadata/search; reminders (recurrence, multi-notify, snooze, reschedule, complete/undo, skip, quiet hours, daily summary); notification registration + provisional local fallback reconciled after sync; public-event extension foundation (flagged).
**Gate:** reminder accuracy, idempotent retry (same `operation_id` → no dup), notification cancellation, recurrence tests.

### D3 — Planner & notes (Phase 1C)
Yearly/monthly/weekly planner (+configurable sections/carry-forward); **notes feature (create `features/notes/`)**; profiles/templates (no hierarchy/KPI); autosave (debounced/coalesced), undo, Recently Deleted; guest→account migration; polls/questions (flagged).
**Gate:** privacy, offline autosave, multi-device conflict (Keep Mine/Server/Both/Merge), 10k-record perf.

### D4 — Print & commercialization (Phase 1D)
Print Studio (preview backend PDFs, warnings, privacy review, secure expiring download, history); subscriptions (cached entitlement + online verify + gating; never grant premium from client callback alone); data export; account-deletion request; production hardening.
**Gate:** print matrix, entitlement correction, payment-return validation, accessibility (WCAG 2.2 AA-eq).

---

## SECTION E — CROSS-CUTTING CONCERNS (span all workstreams)

| Concern | Requirement |
|---------|-------------|
| **Calendar correctness** | One algorithm, shared golden fixtures; client & server agree bit-for-bit; EC recurrence stored as EC. |
| **Sync protocol** | Idempotent ops keyed by `operation_id`; server-authoritative versions; typed result codes; per-entity conflict policy identical client/server. |
| **Auth/identity** | One account model; refresh rotation; device/session registry & revocation; guest migration; strict token storage (native secure storage / web HttpOnly cookie). |
| **Notifications** | Worker authoritative for scheduling/delivery; client handles permission/token/routing + bounded provisional local fallback. No exact-alarm by default. |
| **Print/PDF** | Worker is the authoritative generator; client previews/downloads via expiring links; no client-final PDF. |
| **Payments/entitlements** | Server authoritative; receipt/webhook validation in worker; never trust client success callback. |
| **i18n** | EN + Amharic across web + app; Amharic LTR; locale-safe formatting; dual EC/GC display. |
| **Security/privacy** | Least-privilege storage; log redaction; no private-content analytics; authz on every ownership boundary; audit logs; data export & deletion. |
| **Observability** | Privacy-safe technical events across all services; correlation IDs propagated client→API→worker. |

---

## SECTION F — INTEGRATED ROADMAP (across all components)

| Phase | Platform deliverable | Backend/Worker/Infra (WS0–3) | Web/Admin (WS4–5) | Flutter (WS6) |
|-------|----------------------|------------------------------|-------------------|----------------|
| **P0 Foundation** | Contracts + infra + calendar core | WS0 contract & calendar core; WS1 envs/CI; WS2 skeleton + auth + DB migrations | Admin/web skeleton + auth | D0 hardening |
| **P1 Calendar MVP** | Auth + calendar + sync round-trip | Sync push/pull, calendar packs, tombstones | Admin: calendar-pack authoring | D1 |
| **P2 Events/Reminders** | Scheduling + push | Reminder scheduling + push delivery worker | Admin: job monitoring | D2 |
| **P3 Planner/Notes** | Rich content + conflicts | Conflict endpoints, export/deletion | Admin: moderation, support | D3 |
| **P4 Print/Commerce** | PDF + payments + go-live | PDF worker, payments/entitlements, reconciliation | Admin finance; web checkout/pricing | D4 |
| **P5 Public extensions** | Polls/questions live | Moderation, rate limits, dup-vote prevention | Admin moderation UI | polls/questions flags on |

Sequencing rule: **WS0 precedes everything**; within a phase, backend endpoint lands before the client
consumes it (client uses mock/fake server until the real endpoint is ready).

---

## SECTION G — RISK REGISTER (ranked, whole platform)

| Sev | Risk | Mitigation |
|-----|------|------------|
| **Critical** | No SRS → requirement drift across all components | Provide SRS before feature phases (A1). |
| **Critical** | Client/server calendar or recurrence disagreement | Shared golden fixtures gate BOTH suites in CI (WS0/A4). |
| **Critical** | Offline sync correctness (dup writes, lost content, conflict merges) | Idempotent ops + server-authoritative versions + integration tests on both ends. |
| **High** | Contract drift between API and clients | OpenAPI as single source; generate DTOs; version + schema checks in CI. |
| **High** | Payments/entitlement fraud via client trust | Server/worker authoritative; webhook + receipt validation only. |
| **High** | PDF/print pipeline load & failures | Worker queue with retries, status, failure reasons; expiring links. |
| **Medium** | Package version pinning unverifiable by model | Human runs `flutter pub outdated`; pin from committed `pubspec.lock`. |
| **Medium** | iOS builds not runnable on Windows dev box | macOS CI runner only. |
| **Medium** | Master prompt (~2,240 lines) exceeds active-instruction window | Split into constitution + per-phase work orders. |
| **Low** | Amharic mis-assumed RTL | Amharic is LTR; test font fallback/line-height. |

---

## SECTION H — IMMEDIATE NEXT STEPS

1. **You:** provide the SRS (unblocks all feature work).
2. **Now, SRS-independent:** build **WS0 Ethiopian calendar core + golden fixtures** and **API contract v1 skeleton** — these gate both backend and Flutter.
3. **Flutter, in parallel:** D0 items B1/B2 (strict lints, flavors, env) can start immediately.
4. Confirm which workstreams Claude implements vs. other teams (the master prompt currently limits Claude to WS6/Flutter — the rest are planned here for coherence).
