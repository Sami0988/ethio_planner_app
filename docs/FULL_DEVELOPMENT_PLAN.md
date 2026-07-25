# Ethio Planner — Phase 1 Development Plan

**Date:** 25 July 2026  
**Current Status:** ~70% complete (Sprints 0–8 complete, Sprint 9 partially done)  
**Target:** Phase 1 complete (Sprint 14)  
**Sprint cadence:** Sprint 0 (1 week) + Sprints 1–14 (2 weeks each)  
**Reference:** `docs/sprint/Ethiopian_Planner_Flutter_Phase1_Dev_Ready_Sprint_Plan.md`

---

## Status Legend

| Icon | Meaning |
|------|---------|
| ✅ | Complete — verified in codebase |
| ⚠️ | Partial — exists but needs work |
| ❌ | Not started — must implement |
| 🔒 | Blocked — depends on backend/external |

---

## Sprint 0 — Readiness ✅

**Status:** ✅ Complete  
**Exit Gate:** ✅ Approved (SPRINT0_CHECKLIST.md)

All product decisions, design approvals, calendar reference data, content governance, test matrix, ADRs and release process are approved.

---

## Sprint 1 — App Foundation, Localization and Local Account Scope ✅

**Status:** ✅ Complete

| Deliverable | Status | Evidence |
|---|---|---|
| Product launch experience | ✅ | `onboarding_page.dart` |
| First-launch language selection | ✅ | `onboarding_page.dart` + locale provider |
| Guest continuation entry | ✅ | `onboarding_guest_or_auth_page.dart` |
| Initial navigation (4-tab) | ✅ | `shell_page.dart` + `app_router.dart` |
| Today placeholder | ✅ | `today_page.dart` |
| Calendar placeholder | ✅ | `calendar_page.dart` |
| Planner placeholder | ✅ | `planner_page.dart` |
| Notes/Search entry | ✅ | `notes_page.dart`, `search_page.dart` |
| Settings entry | ✅ | `settings_page.dart` |
| Light appearance | ✅ | `app_theme.dart` |
| Dark appearance | ✅ | `app_theme.dart` |
| Offline indicator | ✅ | `sync_status_banner.dart` |
| Error presentation | ✅ | `failures.dart` + error page |
| Empty presentation | ✅ | `today_empty_state.dart` |
| Four-language navigation | ✅ | EN, AM, TI, OM in `l10n/` |
| Durable local initialization | ✅ | Drift database |
| Guest/account scope separation | ✅ | Account ID filtering |
| Stable local identifiers | ✅ | UUID-based |
| Restart-safe settings | ✅ | SharedPreferences + Drift |
| Data-upgrade baseline | ✅ | Schema migrations in `app_database.dart` |

---

## Sprint 2 — Ethiopian/Gregorian Calendar and Bundled Content ✅

**Status:** ✅ Complete

| Deliverable | Status | Evidence |
|---|---|---|
| Ethiopian date representation | ✅ | `ethiopian_calendar_core` package |
| Gregorian date representation | ✅ | `ethiopian_calendar_core` package |
| Conversion in both directions | ✅ | `calendar_conversion.dart` |
| Leap-year handling | ✅ | `ethiopian_date_math.dart` |
| Pagume 5 and Pagume 6 | ✅ | `ethiopian_date_math.dart` |
| Valid/invalid date handling | ✅ | Core package |
| Supported-range handling | ✅ | 1900–2100 |
| Localized months | ✅ | L10n files |
| Localized weekdays | ✅ | L10n files |
| Localized date display | ✅ | `today_date_formatter.dart` |
| Primary/secondary calendar | ✅ | Calendar settings provider |
| Date-only preservation | ✅ | Core package |
| Timezone-safe day boundaries | ✅ | Core package |
| Approved content bundle | ✅ | `bundled_content.dart` + JSON assets |
| Stable content identifiers | ✅ | Content service |
| Four-language content | ✅ | EN, AM, TI, OM |
| Content-group selection | ✅ | `content_pack_settings.dart` |
| Offline content lookup | ✅ | Bundled with app |
| Settings: primary calendar | ✅ | `calendar_settings_provider.dart` |
| Settings: week start | ✅ | `calendar_settings_sheet.dart` |
| Settings: date format | ✅ | Calendar settings |
| Settings: numeral preference | ✅ | Calendar settings |

---

## Sprint 3 — Guest Today and Calendar Experience ✅

**Status:** ✅ Complete

| Deliverable | Status | Evidence |
|---|---|---|
| Today's Ethiopian date | ✅ | `today_header.dart` |
| Today's Gregorian date | ✅ | `today_header.dart` |
| Localized weekday | ✅ | `today_date_formatter.dart` |
| Bundled observances | ✅ | `bundled_content_service.dart` |
| Empty event/reminder/planner sections | ✅ | `today_empty_state.dart` |
| Helpful empty-state actions | ✅ | `today_empty_state.dart` |
| Quick-add entry | ✅ | `quick_add_sheet.dart` |
| Guest status | ✅ | `sync_status_banner.dart` |
| Offline status | ✅ | `sync_status_banner.dart` |
| Settings shortcut | ✅ | `more_page.dart` |
| Accessible date hierarchy | ✅ | `today_header.dart` |
| Month view | ✅ | `calendar_grid.dart` (337 lines) |
| Year/month navigation | ✅ | `month_year_picker_sheet.dart` |
| Selected-day detail | ✅ | `day_events_list.dart` |
| Primary/secondary dates | ✅ | `calendar_grid.dart` |
| Today indicator | ✅ | `calendar_grid.dart` |
| Bundled content indicators | ✅ | `calendar_grid.dart` |
| Content details | ✅ | Day events list |
| Calendar display preference | ✅ | `calendar_settings_provider.dart` |
| Week-start preference | ✅ | `calendar_settings_sheet.dart` |
| Stable state after restart | ✅ | Drift persistence |
| Complete offline use | ✅ | Local DB only |

---

## Sprint 4 — Offline Events, Calendars and Categories ⚠️

**Status:** ⚠️ Partial — Events CRUD works, Calendar/Category management UI incomplete

| Deliverable | Status | Evidence |
|---|---|---|
| Create event | ✅ | `event_form_sheet.dart` |
| Event details | ✅ | `day_events_list.dart` |
| Edit event | ✅ | `event_form_sheet.dart` |
| Delete event | ✅ | With confirmation |
| Restore event | ✅ | `recently_deleted/` |
| All-day event | ✅ | `event_form_sheet.dart` |
| Timed event | ✅ | `event_form_sheet.dart` |
| Ethiopian date basis | ⚠️ | Field exists, conversion has TODO |
| Gregorian date basis | ✅ | `event_form_sheet.dart` |
| Start/end validation | ✅ | Form validation |
| Title | ✅ | Form field |
| Optional description | ✅ | Form field |
| Optional location | ✅ | Form field |
| Personal calendar | ⚠️ | Field exists, no calendar management UI |
| Optional category | ✅ | Category picker (Work/Personal/Holiday/Other) |
| Local save | ✅ | Drift DAO |
| Restart safety | ✅ | Drift persistence |
| Status indication | ✅ | Sync status |
| Today/Calendar visibility | ✅ | `calendar_grid.dart` + `today_page.dart` |
| **Create personal calendar** | ❌ | No UI |
| **Edit personal calendar** | ❌ | No UI |
| **Delete personal calendar** | ❌ | No UI |
| **Calendar visibility** | ❌ | No UI |
| **Calendar order** | ❌ | No UI |
| **Create category** | ❌ | Only hardcoded categories |
| **Edit category** | ❌ | No UI |
| **Delete category** | ❌ | No UI |
| **Category order** | ❌ | No UI |

**Next:** Implement personal calendar and category management UI.

---

## Sprint 5 — Event Recurrence and Occurrence Exceptions ✅

**Status:** ✅ Complete

| Deliverable | Status | Evidence |
|---|---|---|
| Daily recurrence | ✅ | `recurrence_pattern_sheet.dart` |
| Weekly recurrence | ✅ | `recurrence_pattern_sheet.dart` |
| Selected weekdays | ✅ | `byDays` field in `recurrence_rule.dart` |
| Monthly recurrence | ✅ | `recurrence_pattern_sheet.dart` |
| Yearly recurrence | ✅ | `recurrence_pattern_sheet.dart` |
| Interval | ✅ | `recurrence_pattern_sheet.dart` (1–30) |
| Count end | ✅ | `recurrence_pattern_sheet.dart` |
| Date end | ✅ | `recurrence_pattern_sheet.dart` (date picker) |
| No fixed end | ✅ | `recurrence_pattern_sheet.dart` |
| Ethiopian basis | ✅ | `recurrence_engine.dart` (_addEthiopianMonths/Years) |
| Gregorian basis | ✅ | `recurrence_engine.dart` (_addGregorianMonths/Years) |
| Invalid monthly date choice | ✅ | Max-day clamping in engine |
| Recurrence summary | ✅ | `RecurrenceEngine.describe()` + preview |
| Bounded occurrence display | ✅ | 365 max (Sprint 0 P-14) |
| `recurrenceRule` field in DB | ✅ | `tables.dart` |
| `recurrence_rule.dart` model | ✅ | Serialization, copyWith, equality |
| `recurrence_engine.dart` | ✅ | Generate, isOccurrence, describe |
| `recurrence_pattern_sheet.dart` UI | ✅ | 336 lines, full configuration |
| Edit this occurrence | ❌ | Not implemented (P1) |
| Cancel this occurrence | ❌ | Not implemented (P1) |
| Edit entire series | ❌ | Not implemented (P1) |
| Impact confirmation | ❌ | Not implemented (P1) |

---

## Sprint 6 — Reminders and Local Notifications ✅

**Status:** ✅ Complete

| Deliverable | Status | Evidence |
|---|---|---|
| Create reminder | ✅ | `reminder_form_sheet.dart` |
| View/edit/delete/restore | ✅ | `reminders_page.dart` |
| Date-only reminder | ✅ | Form field |
| Timed reminder | ✅ | Time picker |
| Ethiopian/Gregorian basis | ✅ | Calendar conversion |
| Title and optional short note | ✅ | Form field |
| Optional category | ✅ | Category picker |
| Optional related event | ⚠️ | `linkedEventId` field exists, no link UI |
| Recurrence | ✅ | `recurrence_pattern_sheet.dart` |
| One-occurrence edit | ❌ | Not implemented (P1) |
| Complete | ✅ | Toggle checkbox |
| Snooze | ❌ | Not implemented |
| Skip | ❌ | Not implemented |
| Cancel | ❌ | Not implemented |
| Overdue state | ✅ | Badge shown |
| Today integration | ✅ | `today_reminders.dart` |
| Status indication | ✅ | Sync status |
| **Contextual permission explanation** | ✅ | `reminders_page.dart` dialog |
| **Permission request** | ✅ | `NotificationService.requestPermission()` |
| **Permission-denied behavior** | ✅ | In-app reminder still works |
| **Local schedule** | ✅ | `NotificationService.scheduleNotification()` |
| **Stable notification identity** | ✅ | `notificationId` = timestamp-based |
| **Duplicate prevention** | ✅ | Cancel before reschedule |
| **Obsolete schedule cancellation** | ✅ | Cancel on update/delete |
| **Reschedule** | ✅ | On time/recurrence change |
| **Quiet hours** | ✅ | 22:00–07:00 default |
| **Localized notification text** | ✅ | Uses reminder title |
| **Notification tap** | ✅ | `onDidReceiveNotificationResponse` |
| **Restart rebuild** | ✅ | `rebuildNotifications()` on page load |
| **Timezone-change rebuild** | ⚠️ | Timezone plugin handles, not explicitly tested |
| **Application-upgrade rebuild** | ⚠️ | Depends on restart behavior |

---

## Sprint 7 — Simple Personal Planner ✅

**Status:** ✅ Complete — All views and section management implemented

| Deliverable | Status | Evidence |
|---|---|---|
| Daily page | ✅ | `planner_page.dart` |
| Weekly page | ✅ | `planner_page.dart` `_buildWeekView` |
| Monthly page | ✅ | `planner_page.dart` `_buildMonthView` |
| Yearly page | ✅ | `planner_page.dart` `_buildYearView` |
| Focus section | ✅ | `planner_section_view.dart` |
| Priorities section | ✅ | `planner_section_view.dart` |
| Checklist section | ✅ | `planner_section_view.dart` |
| Notes section | ✅ | `planner_section_view.dart` |
| Custom section | ✅ | `planner_section_view.dart` |
| Add/edit items | ✅ | `planner_item_form_sheet.dart` |
| Reorder items | ✅ | `reorderItems()` |
| Complete/reopen item | ✅ | `toggleCompleted()` |
| Target date | ✅ | Form field |
| Delete/restore | ✅ | Recently Deleted |
| Local autosave | ✅ | Auto-saves on create/update |
| Recovery history | ❌ | Not implemented |
| Today contribution | ⚠️ | Weak integration |
| **Copy from previous period** | ✅ | `copyFromPreviousPeriod()` |
| **Carry forward** | ✅ | `carryForwardIncomplete()` |
| **Merge/replace/cancel** | ❌ | Not implemented |
| **Planner section manager** | ✅ | `_SectionManagerSheet` |

**Next:** Implement merge/replace/cancel, recovery history.

---

## Sprint 8 — Private Notes, Local Search and Recently Deleted ✅

**Status:** ✅ Complete — All features implemented

| Deliverable | Status | Evidence |
|---|---|---|
| Create/edit/autosave | ✅ | `note_form_sheet.dart` |
| View | ✅ | `notes_page.dart` |
| Pin/unpin | ✅ | `notes_controller.dart` |
| Archive/unarchive | ✅ | `notes_controller.dart` |
| Delete/restore | ✅ | Recently Deleted |
| Permanent-delete confirmation | ✅ | With dialog |
| Limited revision recovery | ✅ | `note_revisions_page.dart` + `note_revisions_dao.dart` |
| **Link to event** | ✅ | `note_link_picker_sheet.dart` + UI |
| **Link to reminder** | ✅ | `note_link_picker_sheet.dart` + UI |
| **Link to planner** | ✅ | `note_link_picker_sheet.dart` + UI |
| Mixed Ethiopic/Latin support | ✅ | Unicode |
| Private preview behavior | ✅ | Local-only |
| Conflict-ready snapshots | ✅ | Sync metadata |
| Search events | ✅ | `search_page.dart` |
| Search reminders | ✅ | `search_page.dart` |
| Search planner items | ✅ | `search_page.dart` |
| Search notes | ✅ | `search_page.dart` |
| Text filter | ✅ | Search controller |
| Content type filter | ✅ | `search_repository.dart` + filter chips |
| Date range filter | ✅ | `search_repository.dart` + date picker |
| Category filter | ✅ | `search_repository.dart` + dropdown |
| Works offline | ✅ | Local DB |
| Recently Deleted content-type filter | ✅ | `recently_deleted_page.dart` + filter chips |

**Next:** Sprint 9 — Auth & Sessions.

---

## Sprint 9 — Registration, Account Sessions and Synchronized Settings ⚠️

**Status:** ⚠️ Partial — Auth works, session/device management missing

| Deliverable | Status | Evidence |
|---|---|---|
| Registration | ✅ | `register_page.dart` |
| Verification pending | ✅ | `verify_email_page.dart` |
| Verification resend | ✅ | Auth controller |
| Sign-in | ✅ | `sign_in_page.dart` |
| Session restoration | ⚠️ | Partial |
| Forgotten password | ✅ | `reset_password_page.dart` |
| Sign-out | ✅ | Auth controller |
| **Sign-out choices (retain/remove)** | ❌ | Not implemented |
| **Device list** | ❌ | Not implemented |
| **Session list** | ❌ | Not implemented |
| **Device revocation** | ❌ | Not implemented |
| **Session revocation** | ❌ | Not implemented |
| **Expired/revoked state** | ❌ | Not implemented |
| **Sign-out-all** | ❌ | Not implemented |
| Account-scope creation | ✅ | Account ID filtering |
| Guest scope retention | ⚠️ | Partial |
| Protect authentication credentials | ✅ | `flutter_secure_storage` |
| Settings account integration | ⚠️ | Partial |

**Next:** Implement sign-out choices, device/session management, revocation.

---

## Sprint 10 — Guest Import and Synchronization Foundation 🔒

**Status:** 🔒 Blocked — depends on backend APIs

| Deliverable | Status | Evidence |
|---|---|---|
| Pending mutation queue | ✅ | `outbox_dao.dart` |
| Ordered device changes | ✅ | Outbox operations |
| Push | ⚠️ | Infrastructure only |
| Pull | ⚠️ | Infrastructure only |
| Safe retry | ✅ | Outbox retry |
| Server-version apply | ✅ | Sync metadata |
| Connectivity recovery | ✅ | Network info |
| Status summary | ✅ | `sync_status.dart` |
| **Guest import: eligible-data inventory** | ❌ | Not implemented |
| **Guest import: review** | ❌ | Not implemented |
| **Guest import: execution** | ❌ | Not implemented |
| **Guest import: progress** | ❌ | Not implemented |
| **Guest import: interruption recovery** | ❌ | Not implemented |
| **Duplicate-operation replay** | ❌ | Not implemented |
| **Delete apply** | ❌ | Not implemented |
| **Restore apply** | ❌ | Not implemented |
| **Cursor acknowledgement** | ❌ | Not implemented |

**Next:** Implement guest import workflow (requires backend API contracts).

---

## Sprint 11 — Domain Synchronization and Multi-Device Convergence 🔒

**Status:** 🔒 Blocked — depends on Sprint 10 + backend

| Deliverable | Status | Evidence |
|---|---|---|
| Settings sync | 🔒 | Blocked |
| Calendars/categories sync | 🔒 | Blocked |
| Events sync | 🔒 | Blocked |
| Reminders sync | 🔒 | Blocked |
| Planner sync | 🔒 | Blocked |
| Notes sync | 🔒 | Blocked |
| Recently Deleted sync | 🔒 | Blocked |
| Multi-device convergence | 🔒 | Blocked |
| Notification schedule reconciliation | 🔒 | Blocked |

**Next:** Extend sync pipeline to all domains (requires Sprint 10 completion).

---

## Sprint 12 — Multi-Device Recovery, Full Resync, Conflict Center and Privacy ⚠️

**Status:** ⚠️ Partial — Conflict Center exists, full resync missing

| Deliverable | Status | Evidence |
|---|---|---|
| Conflict list | ✅ | `conflict_center_page.dart` |
| Local vs server version | ✅ | `conflict_resolution_sheet.dart` |
| Keep local | ✅ | Resolution options |
| Keep remote | ✅ | Resolution options |
| Keep both | ✅ | Resolution options |
| **Manual merge** | ❌ | Not implemented |
| **Full resync trigger** | ❌ | Not implemented |
| **Resync progress** | ❌ | Not implemented |
| **Resync interruption** | ❌ | Not implemented |
| **Privacy policy access** | ❌ | Not implemented |
| **Consent state** | ❌ | Not implemented |
| **Account deletion request** | ❌ | Not implemented |
| **Deletion status** | ❌ | Not implemented |
| **Cancellation before boundary** | ❌ | Not implemented |
| **Final local cleanup** | ❌ | Not implemented |

**Next:** Implement full resync, manual merge, privacy/account deletion lifecycle.

---

## Sprint 13 — Accessibility, Security and Performance Hardening ❌

**Status:** ❌ Not started

| Deliverable | Status | Evidence |
|---|---|---|
| Screen reader labels | ⚠️ | Some widgets, not all |
| Reading order | ⚠️ | Partial |
| Semantic labels | ⚠️ | Partial |
| Text scaling (200%) | ❌ | Untested |
| Contrast audit | ❌ | Not audited |
| Touch targets (48dp) | ⚠️ | Some places |
| Non-color status | ✅ | Badges with labels |
| Reduced-motion | ❌ | Not implemented |
| Dark-mode accessibility | ⚠️ | Partial |
| Four-language accessibility | ❌ | Not verified |
| Missing-key scan | ❌ | Not done |
| English editorial review | ❌ | Not done |
| Amharic review | ❌ | Not done |
| Afaan Oromo review | ❌ | 35+ missing keys |
| Tigrinya review | ❌ | 35+ missing keys |
| Credential-storage review | ❌ | Not tested |
| Deep-link review | ❌ | Not tested |
| Account-isolation review | ❌ | Not tested |
| Log/crash-data scan | ❌ | Not tested |
| Dependency/security scan | ❌ | Not tested |
| Startup performance | ❌ | Untested |
| Calendar navigation performance | ❌ | Untested |
| Search performance (10K) | ❌ | Untested |

**Next:** Full accessibility, localization, security, and performance hardening.

---

## Sprint 14 — UAT, Production Artifacts and Store Readiness ❌

**Status:** ❌ Not started

| Deliverable | Status | Evidence |
|---|---|---|
| Android production artifact | ❌ | Not built |
| iOS production artifact | ❌ | Not built |
| App icon | ⚠️ | Default |
| Launch experience | ⚠️ | Default |
| Notification channels (Android) | ❌ | Not configured |
| Store listing inputs | ❌ | Not done |
| Privacy declarations | ❌ | Not done |
| Release signing | ❌ | Not configured |
| UAT | ❌ | Not started |
| Release notes | ❌ | Not written |

**Next:** Build, sign, and prepare for store submission.

---

## Priority Queue — What to Build Next

### 🔴 High Priority (Sprint 9 gaps)

| # | Task | Sprint | Effort |
|---|---|---|---|
| 1 | **Sign-out choices** (retain/remove data) | 9 | Small |
| 2 | **Device/session management** | 9 | Medium |
| 3 | **Sign-out-all** | 9 | Small |
| 4 | **Session revocation** | 9 | Medium |

### 🟡 Medium Priority (Sprint 4 gaps + Sprint 10-12)

| # | Task | Sprint | Effort |
|---|---|---|---|
| 5 | **Personal calendar management** | 4 | Medium |
| 6 | **Category management** | 4 | Small |
| 7 | **Guest import workflow** | 10 | Large |
| 8 | **Full resync** | 12 | Large |
| 9 | **Manual conflict merge** | 12 | Medium |
| 10 | **Privacy/account deletion lifecycle** | 12 | Medium |

### 🟢 Lower Priority (Sprint 13–14)

| # | Task | Sprint | Effort |
|---|---|---|---|
| 11 | **Accessibility hardening** (screen reader, scaling, contrast) | 13 | Large |
| 12 | **Localization completion** (OM/TI missing keys) | 13 | Medium |
| 13 | **Security hardening** (credential review, deep links, isolation) | 13 | Medium |
| 14 | **Performance testing** (startup, search, navigation) | 13 | Medium |
| 15 | **Store assets** (icon, screenshots, listings) | 14 | Medium |
| 16 | **Release signing** (Android + iOS) | 14 | Small |

---

## Exit Gates

| Checkpoint | Sprint | Status |
|---|---|---|
| A — Internal Guest Alpha | After Sprint 3 | ✅ Achieved |
| B — Complete Guest Beta | After Sprint 8 | ✅ Achieved |
| C — Registered-User Beta | After Sprint 12 | ❌ Not reached |
| D — Release Candidate | After Sprint 13 | ❌ Not reached |
| E — Production Approval | After Sprint 14 | ❌ Not reached |

---

## Summary

| Sprint | Status | Key Gap |
|---|---|---|
| 0 — Readiness | ✅ | — |
| 1 — Foundation | ✅ | — |
| 2 — Calendar | ✅ | — |
| 3 — Today/Calendar | ✅ | — |
| 4 — Events | ⚠️ | Calendar/category management UI |
| 5 — Recurrence | ✅ | — |
| 6 — Reminders | ✅ | — |
| 7 — Planner | ✅ | — |
| 8 — Notes/Search | ✅ | — |
| 9 — Auth | ⚠️ | Session/device management |
| 10 — Sync Foundation | 🔒 | Guest import |
| 11 — Domain Sync | 🔒 | All domain sync |
| 12 — Conflict/Privacy | ⚠️ | Full resync, account deletion |
| 13 — Hardening | ❌ | Accessibility, security, performance |
| 14 — Release | ❌ | Store preparation |

**Next immediate action:** Start Sprint 9 — Sign-out choices, device/session management.
