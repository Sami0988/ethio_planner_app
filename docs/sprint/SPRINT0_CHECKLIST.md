# Sprint 0 — Readiness Checklist

**Date:** 24 July 2026
**Status:** ✅ **APPROVED** — All product decisions locked in with recommended defaults
**Purpose:** Complete all product, design, calendar, content, backend and QA readiness before feature delivery
**Exit Gate:** All items below must be resolved before Sprint 1 starts

---

## 1. Product Decisions

These decisions affect feature behavior and must be approved before building.

### 1.1 Calendar & Scope

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-01 | Supported Ethiopian calendar range | 1900–2100 (EC 1823–2023) | ✅ Approved |
| P-02 | Supported Gregorian calendar range | 1900–2100 | ✅ Approved |
| P-03 | Week start day default | Saturday (Ethiopian standard) | ✅ Approved |
| P-04 | Primary calendar default | Ethiopian-first | ✅ Approved |
| P-05 | Numeral display default | Ge'ez numerals | ✅ Approved |

### 1.2 Limits & Retention

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-06 | Event title max length | 200 characters | ✅ Approved |
| P-07 | Reminder title max length | 200 characters | ✅ Approved |
| P-08 | Note max size | 50 KB local, 100 KB synced | ✅ Approved |
| P-09 | Planner page max size | 100 KB | ✅ Approved |
| P-10 | Recently Deleted recovery period | 30 days | ✅ Approved |
| P-11 | Guest inactivity cleanup | 90 days, disclosed to user | ✅ Approved |
| P-12 | Generated file (PDF/export) retention | 7 days | ✅ Approved |

### 1.3 Recurrence

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-13 | Invalid monthly date policy (e.g., 30th of a 29-day month) | Skip to next valid day | ✅ Approved |
| P-14 | Recurrence preview horizon (client-side) | 3 years / 365 occurrences max | ✅ Approved |
| P-15 | Ethiopian basis recurrence default | Yes — recurrence follows Ethiopian calendar | ✅ Approved |

### 1.4 Notifications

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-16 | Notification provider | flutter_local_notifications only (no FCM push in V1) | ✅ Approved |
| P-17 | Quiet hours default | 22:00–07:00 local time | ✅ Approved |
| P-18 | Daily summary | Deferred to P1 | ✅ Approved |
| P-19 | Max notifications per reminder | 1 (no repeat beyond recurrence) | ✅ Approved |

### 1.5 Account & Auth

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-20 | Sign-out choice | Offer "Keep data" / "Remove data" | ✅ Approved |
| P-21 | Guest import scope | Events, reminders, notes, planner items | ✅ Approved |
| P-22 | Account database isolation | Separate DB per account + guest | ✅ Approved |
| P-23 | Session/device management | P1 — deferred after core sync works | ✅ Approved |

### 1.6 Privacy & Security

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-24 | Privacy policy access | In-app link to hosted policy | ✅ Approved |
| P-25 | Consent state | No analytics in V1 (no consent required) | ✅ Approved |
| P-26 | Account deletion | Full lifecycle with 30-day grace | ✅ Approved |
| P-27 | Local DB encryption | Separate ADR, defer to security gate | ✅ Approved |

### 1.7 Platforms

| # | Decision | Recommended Default | Your Decision |
|---|---|---|---|
| P-28 | Minimum Android version | API 21 (Android 5.0) | ✅ Approved |
| P-29 | Minimum iOS version | iOS 13.0 | ✅ Approved |
| P-30 | Print Studio scope | P0: basic PDF; P1: templates, subscriptions | ✅ Approved |

---

## 2. Design Approvals

These designs must be reviewed and approved. If existing UI is acceptable, approve it.

| # | Design | Status | Your Approval |
|---|---|---|---|
| D-01 | First launch / onboarding screen | Not built | ⬜ Approve / ⬜ Redesign |
| D-02 | Language selection (first launch) | Not built | ⬜ Approve / ⬜ Redesign |
| D-03 | Guest continuation prompt | Not built | ⬜ Approve / ⬜ Redesign |
| D-04 | Today screen | Built | ⬜ Approve existing / ⬜ Redesign |
| D-05 | Calendar month view | Built | ⬜ Approve existing / ⬜ Redesign |
| D-06 | Date conversion UI | Built in Today header | ⬜ Approve existing / ⬜ Redesign |
| D-07 | Quick Add sheet | Built | ⬜ Approve existing / ⬜ Redesign |
| D-08 | Loading / empty / offline states | Built | ⬜ Approve existing / ⬜ Redesign |
| D-09 | Error / rejected / conflict states | Partially built | ⬜ Approve existing / ⬜ Redesign |
| D-10 | Sync status vocabulary | SyncStatusBanner built | ⬜ Approve existing / ⬜ Redesign |
| D-11 | Dark mode appearance | Built | ⬜ Approve existing / ⬜ Redesign |
| D-12 | Light mode appearance | Built | ⬜ Approve existing / ⬜ Redesign |
| D-13 | Calendar settings sheet | Just built | ⬜ Approve existing / ⬜ Redesign |

---

## 3. Calendar Reference Data

The `ethiopian_calendar_core` package must be verified against authoritative vectors.

| # | Test Case | EC Date | GC Date | Status |
|---|---|---|---|---|
| C-01 | New Year (Enkutatash) | 1 Meskerem 2016 | 12 September 2023 | ✅ |
| C-02 | Christmas (Genna) | 29 Tahsas 2016 | 8 January 2024 | ✅ |
| C-03 | Epiphany (Timkat) | 11 Ter 2016 | 20 January 2024 | ✅ |
| C-04 | Pagume last day (year 6) | 6 Pagume 2015 | 5 September 2023 | ⬜ |
| C-05 | Pagume last day (year 5) | 5 Pagume 2016 | 4 September 2024 | ⬜ |
| C-06 | Leap year GC → EC | 29 February 2024 | 21 Yekatit 2016 | ⬜ |
| C-07 | Year boundary (EC New Year) | 1 Meskerem 2017 | 11 September 2024 | ⬜ |
| C-08 | Round-trip GC→EC→GC | Any date | Must match | ⬜ |
| C-09 | Invalid date rejection | 30/13 or 32/12 | Must reject | ⬜ |

**Action:** Verify these vectors pass in `ethiopian_calendar_core` tests. Add any failing cases as bugs.

---

## 4. Content Governance

### 4.1 Bundled Holiday Content

| # | Item | Source/Authority | Status |
|---|---|---|---|
| CG-01 | Ethiopian public holidays list | Ethiopian government gazette | ⬜ Documented |
| CG-02 | Religious holidays (Orthodox, Muslim, Catholic) | Church/Mosque calendars | ⬜ Documented |
| CG-03 | Four-language titles (en/am/om/ti) | Translation reviewers | ⬜ Reviewed |
| CG-04 | Content identifiers (stable IDs) | Assigned | ⬜ Assigned |
| CG-05 | Content date basis (EC or GC) | Explicit per item | ⬜ Documented |
| CG-06 | Recurring vs fixed behavior | Explicit per item | ⬜ Documented |

### 4.2 Translation Reviewers

| Language | Reviewer | Assigned |
|---|---|---|
| English | (source language) | ✅ |
| Amharic | ? | ⬜ |
| Afaan Oromo | ? | ⬜ |
| Tigrinya | ? | ⬜ |

---

## 5. Test Matrix

### 5.1 Device Matrix

| Category | Device | Required |
|---|---|---|
| Low-cost Android | Samsung Galaxy A03 or equivalent | ⬜ Confirmed |
| Mainstream Android | Pixel 7 or Samsung S23 | ⬜ Confirmed |
| iPhone | iPhone 12 or newer | ⬜ Confirmed |
| Large text | Any device at 200% text scale | ⬜ Confirmed |
| Screen reader | TalkBack (Android) / VoiceOver (iOS) | ⬜ Confirmed |
| Offline | Airplane mode testing | ⬜ Confirmed |

### 5.2 Severity Definitions

| Severity | Definition | Sprint Rule |
|---|---|---|
| **Sev 1** | Data loss, security breach, unusable core, wrong calendar date | Immediate stop; cannot release |
| **Sev 2** | Major journey failure, duplicate notification, cross-account leak | Must close before checkpoint |
| **Sev 3** | Functional defect with workaround | Product owner decides |
| **Sev 4** | Cosmetic or minor | May defer to backlog |

### 5.3 Test Scenarios (per Sprint)

| Scenario | Sprint |
|---|---|
| App launch + initialization | Every |
| Guest scope isolation | Every |
| Language switching | Every |
| Calendar conversion | Every |
| Offline + restart | Every |
| Data migration | Every |
| Previously delivered features | Every |

---

## 6. ADR Tracker

Required ADRs per SRS §72. Mark status:

| # | ADR Topic | Status |
|---|---|---|
| ADR-01 | Flutter mobile client | ⬜ Draft |
| ADR-02 | Drift-managed SQLite source of truth | ⬜ Draft |
| ADR-03 | Riverpod state and DI | ⬜ Draft |
| ADR-04 | Transactional outbox synchronization | ⬜ Draft |
| ADR-05 | UUID identifier strategy | ⬜ Draft |
| ADR-06 | Recurrence storage and calendar basis | ⬜ Draft |
| ADR-07 | Bounded occurrence generation | ⬜ Draft |
| ADR-08 | Reminder scheduling authority | ⬜ Draft |
| ADR-09 | PDF generation authority | ⬜ Draft |
| ADR-10 | Attachment metadata and storage | ⬜ Draft |
| ADR-11 | Conflict policy | ⬜ Draft |
| ADR-12 | Local database encryption | ⬜ Draft |
| ADR-13 | Native authentication storage | ⬜ Draft |
| ADR-14 | Payment and entitlement authority | ⬜ Draft |
| ADR-15 | Monitoring privacy | ⬜ Draft |
| ADR-16 | Public-event extension | ⬜ Draft |
| ADR-17 | Account-data isolation | ⬜ Draft |
| ADR-18 | Migration and rollback strategy | ⬜ Draft |

---

## 7. Release Process

| # | Item | Your Decision |
|---|---|---|
| R-01 | Release checkpoint owners assigned | ⬜ |
| R-02 | Severity/release-blocking rules approved | ⬜ |
| R-03 | Beta distribution approach defined | ⬜ |
| R-04 | Definition of Ready approved | ⬜ |
| R-05 | Definition of Done approved | ⬜ |

---

## Sprint 0 Exit Gate

All of the following must be true before Sprint 1 starts:

- [ ] No unresolved decision blocks Sprints 1–3
- [ ] Sprint 1 backlog is fully ready
- [ ] Sprint 2 backlog is at least 80% ready
- [ ] Approved calendar reference data is available
- [ ] Language/content reviewers are assigned
- [ ] Test devices are confirmed
- [ ] Backend dependency dates are accepted (or "no backend" confirmed)
- [ ] Release checkpoints have owners
- [ ] Walia Nexus authorizes delivery

---

**Next step:** Answer the decisions in Section 1 (Product Decisions) and I'll proceed.
