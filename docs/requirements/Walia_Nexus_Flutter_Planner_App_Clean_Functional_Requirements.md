# Flutter Planner App
## Final Functional Requirements Specification

**Product:** Ethiopian Calendar, Reminder, Simple Planner and Custom Print SaaS Platform  
**Organization:** Walia Nexus  
**Document type:** Customer-facing Flutter application functional requirements  
**Version:** 1.0  
**Status:** Final baseline for product, design, engineering and QA approval  
**Date:** 22 July 2026  

---

## 1. Purpose

This document defines the functional requirements for the customer-facing **Flutter Planner App**.

The application shall provide an Ethiopian-first personal calendar, reminder, simple planner, private notes, templates and custom-print experience. It shall remain easy to use, privacy-conscious, bilingual and reliable under limited connectivity.

This document describes required user and system behavior. Detailed database schemas, package choices, API implementation, synchronization algorithms and deployment infrastructure shall be defined in separate technical specifications without changing the approved behavior in this document.

---

## 2. Approved Product and Platform Baseline

The following architecture decision supersedes the earlier Web/PWA-first customer-application baseline:

- The customer-facing Planner App shall be implemented in **Flutter**.
- **Android and iOS** are the mandatory Version 1 production platforms.
- Flutter Web/PWA for authenticated planner use is deferred until separately approved.
- The public website and administration portal are separate Next.js applications.
- Backend API, background processing, notifications, payments, file storage and PDF generation are external services consumed by the Flutter app.

---

## 3. Product Principles

The Planner App shall be:

- Ethiopian-first while fully supporting Gregorian dates;
- calendar-centered and planner-oriented;
- simple enough for everyday personal use;
- usable offline for supported actions;
- safe against duplicate synchronization and silent data loss;
- bilingual in English and Amharic;
- suitable for personal, student, professional, entrepreneur, government-employee, family and diaspora use;
- privacy-conscious, especially for private notes and reflections;
- accessible and usable on common phone and tablet form factors; and
- free from unnecessary enterprise, workforce and project-management complexity.

---

## 4. Scope

### 4.1 Included in Version 1

Version 1 includes:

- guest use and registered accounts;
- Ethiopian and Gregorian calendars;
- date conversion;
- calendar views and calendar packs;
- Today experience;
- events and recurrence;
- reminders and notifications;
- yearly, monthly, weekly and daily planning;
- private notes;
- profiles and templates;
- offline operation and multi-device synchronization;
- search;
- Recently Deleted and conflict recovery;
- Custom Print Studio;
- subscriptions, payment status and entitlements;
- personal-data export and account deletion; and
- feature-flagged public events, polls and event questions as a controlled extension.

### 4.2 Separate Applications and Services

The Flutter app shall not implement:

- the public marketing website;
- the administration portal;
- backend business-rule administration;
- calendar-pack administration;
- user or subscription administration;
- payment reconciliation administration;
- moderation administration;
- background-job monitoring; or
- infrastructure management.

---

## 5. Requirement Conventions

- **Shall** means mandatory.
- **Should** means recommended and may be deferred only with approval.
- **May** means optional or future.
- **P0** means required for the commercially complete Version 1.
- **P1** means important after core stabilization.
- **EXT** means part of the separately controlled public-event extension.
- Requirement identifiers are permanent traceability keys.

### Delivery Phases

| Phase | Scope |
|---|---|
| **1A** | Application foundation, accounts, calendar, conversion, localization and offline foundation |
| **1B** | Events, recurrence, reminders and notifications |
| **1C** | Planner, notes, templates, autosave, recovery and conflict handling |
| **1D** | Print Studio, subscriptions, payments, export and production hardening |
| **EXT** | Public events, polls and public event questions |

---

## 6. User Types

| User type | Description |
|---|---|
| **Guest** | Uses approved local-only functions without registration |
| **Registered user** | Uses synchronized personal data across eligible devices |
| **Subscriber** | Has active paid entitlements verified by the backend |
| **Extension participant** | Uses enabled public-event, poll or public-question capabilities |

The Flutter app shall not provide administrative user roles.

---

# Functional Requirements

## 7. Application Shell and Navigation

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| APP-FR-001 | The app shall provide four primary destinations: **Today**, **Calendar**, **Planner** and **More**. | P0 | 1A |
| APP-FR-002 | The app shall provide a persistent Quick Add action for Event, Reminder and Note. | P0 | 1B/1C |
| APP-FR-003 | The app shall restore the active user session, language, appearance, primary calendar, week-start preference and last safe navigation state after restart. | P0 | 1A |
| APP-FR-004 | The app shall support Android and iOS as mandatory production platforms. | P0 | 1A |
| APP-FR-005 | The app shall adapt its layout for supported phones and tablets. | P0 | 1A |
| APP-FR-006 | The app shall show clear loading, empty, offline, retry, rejected, conflict and action-required states. | P0 | 1A |
| APP-FR-007 | The app shall not expose raw exception messages, stack traces or internal identifiers as the primary user message. | P0 | 1A |
| APP-FR-008 | The app shall allow the user to manually refresh or synchronize from an appropriate visible location. | P0 | 1A |
| APP-FR-009 | The app shall use feature flags for public events, polls and event questions. | EXT | EXT |
| APP-FR-010 | The app shall not contain administration, finance, moderation or operational job-monitoring screens. | P0 | All |

---

## 8. Guest Use, Authentication and Account Management

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| AUTH-FR-001 | A guest shall view today’s Ethiopian and Gregorian dates. | P0 | 1A |
| AUTH-FR-002 | A guest shall convert Ethiopian and Gregorian dates. | P0 | 1A |
| AUTH-FR-003 | A guest shall use approved local-only calendar, planner and note functions without registration. | P0 | 1A |
| AUTH-FR-004 | The user shall register using a verified email address. | P0 | 1A |
| AUTH-FR-005 | The user shall securely sign in and sign out. | P0 | 1A |
| AUTH-FR-006 | The app shall restore an eligible authenticated session after restart. | P0 | 1A |
| AUTH-FR-007 | The user shall request password reset through a time-limited process. | P0 | 1A |
| AUTH-FR-008 | The app shall handle expired, revoked or unauthorized sessions without silently deleting unsynchronized local work. | P0 | 1A |
| AUTH-FR-009 | After registration, the app shall identify eligible guest records and allow the user to migrate selected records to the registered account. | P0 | 1C |
| AUTH-FR-010 | Guest migration shall avoid duplicate records and show migrated, rejected and pending counts. | P0 | 1C |
| AUTH-FR-011 | Failed guest-migration items shall remain recoverable and retryable. | P0 | 1C |
| AUTH-FR-012 | Guest-local data and authenticated-user data shall remain strictly separated. | P0 | 1A |
| AUTH-FR-013 | The app shall prevent one authenticated account from viewing another account’s local records. | P0 | 1A |
| AUTH-FR-014 | The user should be able to view and revoke eligible active sessions or devices where supported by the backend. | P1 | 1D |
| AUTH-FR-015 | Sensitive account actions shall require renewed authentication when required by backend policy. | P0 | 1D |

---

## 9. Preferences, Language and Appearance

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PREF-FR-001 | The user shall select English or Amharic as the app language. | P0 | 1A |
| PREF-FR-002 | The user shall select Ethiopian-primary, Gregorian-primary or dual-date presentation. | P0 | 1A |
| PREF-FR-003 | The user shall select Sunday or Monday as the first day of the week. | P0 | 1A |
| PREF-FR-004 | The user shall select light, dark or system appearance. | P0 | 1A |
| PREF-FR-005 | The user shall select a primary timezone. | P0 | 1A |
| PREF-FR-006 | The user may select a secondary home timezone for diaspora use. | P1 | 1C |
| PREF-FR-007 | The user shall manage notification permission and reminder preferences. | P0 | 1B |
| PREF-FR-008 | The user shall manage quiet hours and daily-summary preference where supported. | P1 | 1B |
| PREF-FR-009 | Changing language or display preference shall not change the stored calendar basis or occurrence dates of existing records. | P0 | 1A |
| PREF-FR-010 | The app shall preserve user preferences across restart and eligible synchronized devices. | P0 | 1A |

---

## 10. Localization

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| LOC-FR-001 | Navigation, controls, authentication, validation and common system messages shall be available in English and Amharic. | P0 | 1A |
| LOC-FR-002 | Event, reminder, planner, note, print and subscription interfaces shall be available in English and Amharic before their respective phase is accepted. | P0 | 1B–1D |
| LOC-FR-003 | The app shall support mixed English and Amharic user content without corrupting storage, search or layout. | P0 | 1C |
| LOC-FR-004 | User-entered content shall not be automatically translated without explicit user action and an approved feature. | P0 | All |
| LOC-FR-005 | Date, number and time formatting shall follow the selected language and calendar presentation where applicable. | P0 | 1A |

---

## 11. Ethiopian and Gregorian Calendar

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| CAL-FR-001 | The app shall support the complete Ethiopian calendar, including all 13 months and valid Pagume days. | P0 | 1A |
| CAL-FR-002 | The app shall support Gregorian common and leap years within the approved date range. | P0 | 1A |
| CAL-FR-003 | The app shall provide Ethiopian-primary, Gregorian-primary and dual-date display modes. | P0 | 1A |
| CAL-FR-004 | The app shall provide year, month, week and day calendar views. | P0 | 1A |
| CAL-FR-005 | The app shall provide Jump to Today. | P0 | 1A |
| CAL-FR-006 | The app shall provide Jump to Ethiopian New Year. | P0 | 1A |
| CAL-FR-007 | The app shall distinguish date-only, all-day and timed records. | P0 | 1A |
| CAL-FR-008 | Date-only and all-day records shall not move to another date because of timezone conversion. | P0 | 1A |
| CAL-FR-009 | Timed records shall retain their intended instant and timezone context. | P0 | 1A |
| CAL-FR-010 | The calendar basis selected when a record is created shall remain authoritative for that record. | P0 | 1A |
| CAL-FR-011 | Calendar views shall render all-day, multi-day and cross-midnight events correctly. | P0 | 1B |
| CAL-FR-012 | When a secondary home timezone is enabled, the app shall show both primary and home times for timed events where useful. | P1 | 1C |
| CAL-FR-013 | The app shall warn when the same timed event falls on different calendar dates in the primary and home timezones. | P1 | 1C |
| CAL-FR-014 | Timezone handling shall respect daylight-saving changes without changing Ethiopian date-only occasions. | P0 | 1B |

---

## 12. Date Conversion

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| DATE-FR-001 | The user shall convert a valid Ethiopian date to its Gregorian equivalent. | P0 | 1A |
| DATE-FR-002 | The user shall convert a valid Gregorian date to its Ethiopian equivalent. | P0 | 1A |
| DATE-FR-003 | The app shall reject invalid Ethiopian and Gregorian dates with localized field-level feedback. | P0 | 1A |
| DATE-FR-004 | The app shall reject dates outside the supported range with a clear message. | P0 | 1A |
| DATE-FR-005 | The user shall copy or share a formatted conversion result. | P0 | 1A |
| DATE-FR-006 | Conversion shall remain available offline. | P0 | 1A |

---

## 13. Calendar Packs, Holidays and Observances

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PACK-FR-001 | The app shall display an Ethiopian public-holiday pack supplied by the backend. | P0 | 1A |
| PACK-FR-002 | The app shall display an essential national-observance pack supplied by the backend. | P0 | 1A |
| PACK-FR-003 | The app may display optional verified religious or fasting packs supplied by the backend. | P1 | 1A |
| PACK-FR-004 | The user shall enable or disable each available calendar pack. | P0 | 1A |
| PACK-FR-005 | Downloaded calendar-pack content shall remain available offline. | P0 | 1A |
| PACK-FR-006 | Observation-dependent dates shall show the backend-provided estimated, configurable or subject-to-confirmation status. | P0 | 1A |
| PACK-FR-007 | Backend changes to a calendar pack shall not overwrite the user’s private events or notes. | P0 | 1A |

---

## 14. Today Experience

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| TODAY-FR-001 | Today shall show the current Ethiopian date, Gregorian date and day name. | P0 | 1A |
| TODAY-FR-002 | Today shall show relevant enabled holidays or observances. | P0 | 1A |
| TODAY-FR-003 | Today shall show the day’s all-day and timed events. | P0 | 1B |
| TODAY-FR-004 | Today shall show the day’s reminders and their current status. | P0 | 1B |
| TODAY-FR-005 | Today shall support one daily focus. | P0 | 1C |
| TODAY-FR-006 | Today shall support up to three main priorities. | P0 | 1C |
| TODAY-FR-007 | Today shall support an optional checklist. | P0 | 1C |
| TODAY-FR-008 | Today shall support a quick note. | P0 | 1C |
| TODAY-FR-009 | Today shall support an optional short reflection or gratitude entry. | P1 | 1C |
| TODAY-FR-010 | Today shall show the next important upcoming item where one exists. | P0 | 1B |
| TODAY-FR-011 | The user shall navigate to the previous or next day. | P0 | 1A |
| TODAY-FR-012 | The user shall show or hide optional Today sections. | P0 | 1C |
| TODAY-FR-013 | Today shall provide Quick Add access. | P0 | 1B |
| TODAY-FR-014 | Today shall not display productivity rankings, employee monitoring, performance scores or judgmental completion metrics. | P0 | All |

---

## 15. Events

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| EVT-FR-001 | The user shall create an event using title, date and optional time as the minimum required input. | P0 | 1B |
| EVT-FR-002 | Advanced event fields shall be available under a secondary More Options area. | P0 | 1B |
| EVT-FR-003 | An event may include description, location, category, color or label and reminders. | P0 | 1B |
| EVT-FR-004 | The user shall view, edit, duplicate, copy and move an event. | P0 | 1B |
| EVT-FR-005 | The user shall soft-delete and restore an event during the approved recovery period. | P0 | 1B |
| EVT-FR-006 | The app shall support date-only, all-day, timed, multi-day and cross-midnight events. | P0 | 1B |
| EVT-FR-007 | The app shall preserve the event’s Ethiopian or Gregorian calendar basis. | P0 | 1B |
| EVT-FR-008 | The user shall create and edit events while offline. | P0 | 1B |
| EVT-FR-009 | The app shall show whether an event is saved locally, waiting to sync, synced, rejected or in conflict. | P0 | 1B |
| EVT-FR-010 | Event conflicts shall preserve the local and server versions until the user or approved rule resolves them. | P0 | 1C |
| EVT-FR-011 | General event attachments may be supported after core event stability. | P1 | 1D |
| EVT-FR-012 | Events shall not contain assignees, milestones, dependencies, estimates, KPIs, approval states or workflow status. | P0 | All |

---

## 16. Recurrence and Series Exceptions

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| REC-FR-001 | The user shall create daily, weekly, monthly and yearly recurring events. | P0 | 1B |
| REC-FR-002 | The user shall create recurring reminders. | P0 | 1B |
| REC-FR-003 | A recurrence rule shall retain the calendar basis in which it was created. | P0 | 1B |
| REC-FR-004 | An Ethiopian annual recurrence shall not be converted into a fixed Gregorian annual month and day. | P0 | 1B |
| REC-FR-005 | The user shall define recurrence by count, end date or no explicit end where supported. | P0 | 1B |
| REC-FR-006 | The app shall apply an approved rule when a monthly recurrence requests a day that does not exist in a target month. | P0 | 1B |
| REC-FR-007 | The user shall edit one occurrence or the complete series where applicable. | P0 | 1B |
| REC-FR-008 | The user shall skip, move or delete one occurrence without changing the complete series. | P0 | 1B |
| REC-FR-009 | Modified occurrences shall remain linked to their source series. | P0 | 1B |
| REC-FR-010 | When both local and server recurrence rules change, the app shall not silently merge them. | P0 | 1C |
| REC-FR-011 | Conflicting recurrence rules shall remain recoverable until the user selects a resolution. | P0 | 1C |
| REC-FR-012 | The app shall generate only the occurrences required for the visible or approved future range. | P0 | 1B |

---

## 17. Reminders

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| REM-FR-001 | The user shall create a reminder using title, date and optional time as the minimum input. | P0 | 1B |
| REM-FR-002 | A reminder may exist without occupying calendar time. | P0 | 1B |
| REM-FR-003 | The user shall view, edit, duplicate, delete and restore a reminder. | P0 | 1B |
| REM-FR-004 | The user shall complete a reminder and undo a recent completion. | P0 | 1B |
| REM-FR-005 | The user shall snooze or reschedule an eligible reminder. | P0 | 1B |
| REM-FR-006 | The user shall skip or delete an eligible occurrence of a recurring reminder. | P0 | 1B |
| REM-FR-007 | The user shall create and edit reminders while offline. | P0 | 1B |
| REM-FR-008 | The app shall display pending, scheduled, snoozed, completed, cancelled, failed or action-required states where applicable. | P0 | 1B |
| REM-FR-009 | The app shall preserve reminder operations during retries so that duplicate actions are not created. | P0 | 1B |
| REM-FR-010 | Multiple notification times may be enabled according to plan and backend policy. | P1 | 1B |
| REM-FR-011 | Reminder completion conflicts shall use operation-aware resolution rather than generic last-write-wins. | P0 | 1C |

---

## 18. Notifications

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| NTF-FR-001 | The app shall request notification permission using clear, contextual language. | P0 | 1B |
| NTF-FR-002 | The app shall register and refresh the device notification token when the user is eligible. | P0 | 1B |
| NTF-FR-003 | The app shall receive remote notifications and route a notification tap to the relevant screen. | P0 | 1B |
| NTF-FR-004 | The app shall show foreground notifications where appropriate. | P0 | 1B |
| NTF-FR-005 | A reminder created or changed offline shall use a bounded provisional local notification where the platform permits it. | P0 | 1B |
| NTF-FR-006 | After synchronization, the app shall reconcile provisional local notifications with the backend-confirmed schedule. | P0 | 1B |
| NTF-FR-007 | Rescheduling or cancelling a reminder shall cancel obsolete local notification entries. | P0 | 1B |
| NTF-FR-008 | The app shall not claim exact delivery where the operating system or provider does not guarantee it. | P0 | 1B |
| NTF-FR-009 | Notification diagnostics shall not expose private reminder content. | P0 | 1B |

---

## 19. Simple Planner

The planner shall remain simple. The default core structure is focus, priorities, important dates, checklist, notes and reflection. Additional sections are optional and template-driven.

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PLN-FR-001 | The app shall provide daily, weekly, monthly and yearly planning pages. | P0 | 1C |
| PLN-FR-002 | Daily planning shall support focus, up to three priorities, optional checklist, note and reflection. | P0 | 1C |
| PLN-FR-003 | Weekly planning shall support weekly focus, priorities, important dates, checklist, notes and reflection. | P0 | 1C |
| PLN-FR-004 | Monthly planning shall support monthly focus, priorities, important dates, checklist, notes and reflection. | P0 | 1C |
| PLN-FR-005 | Yearly planning shall support a year theme, intentions, important dates, notes and reflection. | P0 | 1C |
| PLN-FR-006 | Optional template sections may include work, study, family, self-care, reading or financial intention. | P1 | 1C |
| PLN-FR-007 | The user shall show, hide and reorder supported planner sections. | P0 | 1C |
| PLN-FR-008 | The user may add one simple custom text section to a planning page. | P1 | 1C |
| PLN-FR-009 | Every planning period shall provide a blank writing area. | P0 | 1C |
| PLN-FR-010 | The user shall copy an eligible previous week or month after previewing the content. | P1 | 1C |
| PLN-FR-011 | When target planner content already exists, copy shall offer Merge, Replace or Cancel. | P1 | 1C |
| PLN-FR-012 | The user shall carry selected incomplete checklist items forward. | P1 | 1C |
| PLN-FR-013 | Applying a template shall not overwrite existing content without explicit confirmation. | P0 | 1C |
| PLN-FR-014 | Planner content shall autosave locally. | P0 | 1C |
| PLN-FR-015 | Planner autosave shall not create a separate synchronization operation for every keystroke. | P0 | 1C |
| PLN-FR-016 | The user shall undo a recent eligible planner change. | P0 | 1C |
| PLN-FR-017 | Deleted planner content shall remain recoverable during the approved recovery period. | P0 | 1C |
| PLN-FR-018 | Calendar events and reminders shall appear as references in relevant planning periods without duplicating their source records. | P0 | 1C |
| PLN-FR-019 | Conflicting planner edits shall preserve both versions until resolved. | P0 | 1C |
| PLN-FR-020 | The planner shall not include projects, milestones, dependencies, assignees, workload, progress percentages, formal statuses, KPIs or approvals. | P0 | All |

---

## 20. Private Notes

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| NOTE-FR-001 | The user shall create and edit a private note with title and content. | P0 | 1C |
| NOTE-FR-002 | A note may include an optional date and category. | P0 | 1C |
| NOTE-FR-003 | The user shall pin, unpin, archive and restore a note. | P0 | 1C |
| NOTE-FR-004 | A note may link to a date, event, reminder or planner page. | P0 | 1C |
| NOTE-FR-005 | Notes shall autosave locally. | P0 | 1C |
| NOTE-FR-006 | Note autosave shall not create a synchronization operation for every keystroke. | P0 | 1C |
| NOTE-FR-007 | The user shall undo a recent eligible note change. | P0 | 1C |
| NOTE-FR-008 | The user shall search notes by keyword. | P0 | 1C |
| NOTE-FR-009 | The user shall delete and restore a note during the approved recovery period. | P0 | 1C |
| NOTE-FR-010 | The user shall create and edit notes while offline. | P0 | 1C |
| NOTE-FR-011 | Concurrent conflicting note edits shall preserve the local and server versions. | P0 | 1C |
| NOTE-FR-012 | Conflict resolution shall support Keep Mine, Keep Server, Keep Both and Merge where applicable. | P0 | 1C |
| NOTE-FR-013 | General note attachments may be supported after core note stability. | P1 | 1D |
| NOTE-FR-014 | Private note content shall not appear in monitoring, analytics or support diagnostics. | P0 | All |

---

## 21. Profiles and Templates

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| TMP-FR-001 | The app shall provide Personal, Student, Professional, Entrepreneur, Government Employee, Family and Diaspora profiles. | P0 | 1C |
| TMP-FR-002 | Profile selection shall be optional. | P0 | 1C |
| TMP-FR-003 | The user shall change profile without deleting existing content. | P0 | 1C |
| TMP-FR-004 | Profiles shall influence starter templates, terminology, suggested categories, optional sections and recommended calendar packs. | P0 | 1C |
| TMP-FR-005 | Profiles shall not restrict the type of personal events, reminders, notes or planner entries a user may create. | P0 | 1C |
| TMP-FR-006 | The user shall preview a template before applying it. | P0 | 1C |
| TMP-FR-007 | Applying a template shall not overwrite existing content without explicit confirmation. | P0 | 1C |
| TMP-FR-008 | Government Employee profile fields may include institution, department or office and job title as personal profile or print fields. | P0 | 1C |
| TMP-FR-009 | Government templates may include annual work intentions, personal office planning, meetings, reporting reminders, training, policy reading and meeting notes. | P0 | 1C |
| TMP-FR-010 | Government templates shall not introduce hierarchy, assignment, approval, KPI, appraisal or institutional performance reporting. | P0 | All |
| TMP-FR-011 | The Family profile shall support one user’s personal family dates and reminders without sharing or permissions in Version 1. | P0 | 1C |
| TMP-FR-012 | The Diaspora profile shall recommend dual-date display, Ethiopian calendar packs, a home timezone and bilingual presentation. | P0 | 1C |

---

## 22. Search

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| SRCH-FR-001 | The user shall search authorized local events, reminders, notes and planner content. | P0 | 1C |
| SRCH-FR-002 | Search shall remain usable offline for locally available content. | P0 | 1C |
| SRCH-FR-003 | Results shall be grouped or labeled by content type. | P0 | 1C |
| SRCH-FR-004 | The user shall filter search results by supported type, date range or category. | P1 | 1C |
| SRCH-FR-005 | Search shall support mixed English and Amharic text within supported device capabilities. | P0 | 1C |
| SRCH-FR-006 | The app shall explain when offline results may be incomplete because content has not been downloaded to the device. | P0 | 1C |
| SRCH-FR-007 | Recent searches may be stored locally when privacy policy permits it. | P1 | 1C |

---

## 23. Offline Operation and Synchronization

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| SYNC-FR-001 | The app shall open and provide supported local functionality while the backend is unavailable. | P0 | 1A |
| SYNC-FR-002 | Supported offline actions shall be saved immediately on the device. | P0 | 1A |
| SYNC-FR-003 | Accepted local work shall survive app termination and device restart. | P0 | 1A |
| SYNC-FR-004 | The app shall visibly distinguish Offline, Saved Locally, Waiting to Sync, Syncing, Synced, Sync Failed, Rejected, Conflict Detected and Action Required. | P0 | 1A |
| SYNC-FR-005 | The app shall not mark a record as synced merely because a network connection is present. | P0 | 1A |
| SYNC-FR-006 | The app shall synchronize eligible pending work when connectivity and authentication permit. | P0 | 1A |
| SYNC-FR-007 | The user shall be able to manually retry failed eligible synchronization. | P0 | 1A |
| SYNC-FR-008 | Retrying an operation after a timeout shall not create a duplicate server record or duplicate business action. | P0 | 1B |
| SYNC-FR-009 | The app shall process partial synchronization results without discarding successful or failed items. | P0 | 1B |
| SYNC-FR-010 | A rejected record shall remain visible with a reason and a corrective action where possible. | P0 | 1B |
| SYNC-FR-011 | Synchronization conflicts shall preserve recoverable user content. | P0 | 1C |
| SYNC-FR-012 | The app shall prevent simultaneous foreground and background synchronization from corrupting local state. | P0 | 1B |
| SYNC-FR-013 | Deletions shall synchronize across eligible devices without being silently reversed by an older offline device. | P0 | 1C |
| SYNC-FR-014 | The app shall synchronize only data authorized for the active account. | P0 | 1A |
| SYNC-FR-015 | The app shall show a summary of pending, failed and conflicting items. | P0 | 1C |
| SYNC-FR-016 | Long offline periods shall not cause silent loss of local records. | P0 | 1C |
| SYNC-FR-017 | Payment, entitlement, calendar-pack, poll and moderation states shall be corrected to the backend-authoritative value after synchronization. | P0 | 1D/EXT |

---

## 24. Conflict Resolution and Recovery

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| CNF-FR-001 | The app shall not use one universal conflict policy for all data types. | P0 | 1C |
| CNF-FR-002 | Event conflicts shall preserve both meaningful versions until resolved. | P0 | 1C |
| CNF-FR-003 | Recurrence-rule conflicts shall require explicit resolution and shall not be silently merged. | P0 | 1C |
| CNF-FR-004 | Note and planner conflicts shall preserve local, server and available common-base information. | P0 | 1C |
| CNF-FR-005 | The app shall support Keep Mine, Keep Server, Keep Both and Merge where applicable. | P0 | 1C |
| CNF-FR-006 | Server-governed calendar packs shall use the server version while preserving unrelated private records. | P0 | 1A |
| CNF-FR-007 | Subscription and entitlement conflicts shall use the backend-confirmed value. | P0 | 1D |
| CNF-FR-008 | Poll-vote and public-question outcomes shall use the backend-confirmed value. | EXT | EXT |
| CNF-FR-009 | The app shall retain an unresolved conflict until it is resolved or safely archived under approved retention rules. | P0 | 1C |

---

## 25. Recently Deleted and Permanent Deletion

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| DEL-FR-001 | Supported events, reminders, notes and planner content shall move to Recently Deleted before final purge. | P0 | 1B/1C |
| DEL-FR-002 | The user shall restore an eligible item during the approved recovery period. | P0 | 1B/1C |
| DEL-FR-003 | The user shall permanently delete an eligible item after an explicit warning. | P0 | 1C |
| DEL-FR-004 | Permanent deletion shall propagate to eligible synchronized devices. | P0 | 1C |
| DEL-FR-005 | A stale offline device shall not silently restore a permanently deleted item. | P0 | 1C |
| DEL-FR-006 | Deleting a record shall clean up obsolete notification schedules and eligible cached files. | P0 | 1C/1D |

---

## 26. Files and Images

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| FILE-FR-001 | The user shall select an approved cover image for Print Studio. | P0 | 1D |
| FILE-FR-002 | The app shall validate approved file type and size before upload. | P0 | 1D |
| FILE-FR-003 | The app shall show upload progress, success, failure and retry states. | P0 | 1D |
| FILE-FR-004 | A failed upload shall not cause the associated text record to disappear. | P0 | 1D |
| FILE-FR-005 | The user shall remove an eligible uploaded file. | P0 | 1D |
| FILE-FR-006 | General event and note attachments are P1 and shall not block Version 1 core delivery. | P1 | 1D |
| FILE-FR-007 | Private file names or content shall not be exposed in diagnostics. | P0 | 1D |

---

## 27. Custom Print Studio

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PRT-FR-001 | The user shall create a print request from eligible calendar, planner and selected note content. | P0 | 1D |
| PRT-FR-002 | The user shall select a year or supported date range. | P0 | 1D |
| PRT-FR-003 | The user shall select Ethiopian, Gregorian or dual-calendar output. | P0 | 1D |
| PRT-FR-004 | The user shall select English, Amharic or bilingual output. | P0 | 1D |
| PRT-FR-005 | The user shall select A4 or A5 size and supported orientation. | P0 | 1D |
| PRT-FR-006 | The user shall configure cover title, personal name and approved personal institution information. | P0 | 1D |
| PRT-FR-007 | The user shall select an approved theme and color treatment. | P0 | 1D |
| PRT-FR-008 | The user shall select included planner sections, event categories, calendar packs and eligible private-content types. | P0 | 1D |
| PRT-FR-009 | The app shall provide a final privacy review before submission. | P0 | 1D |
| PRT-FR-010 | The privacy review shall clearly list the selected private-content types. | P0 | 1D |
| PRT-FR-011 | The app shall show page count and supported layout warnings before final submission. | P0 | 1D |
| PRT-FR-012 | Warnings may include overflow, small text, blank pages, low-resolution images, binding margins and color-print implications. | P1 | 1D |
| PRT-FR-013 | The app shall submit the print request to the backend for final PDF generation. | P0 | 1D |
| PRT-FR-014 | The submitted request shall preserve a stable content snapshot or equivalent versioned reference so later edits do not silently change the queued job. | P0 | 1D |
| PRT-FR-015 | The app shall show queued, processing, completed, failed, expired or cancelled status. | P0 | 1D |
| PRT-FR-016 | A failed print job shall show a safe reason and eligible retry or regeneration action. | P0 | 1D |
| PRT-FR-017 | The user shall preview a completed PDF. | P0 | 1D |
| PRT-FR-018 | The user shall securely download, print or share a completed PDF. | P0 | 1D |
| PRT-FR-019 | The app shall maintain eligible print history and regeneration access within the approved retention period. | P1 | 1D |
| PRT-FR-020 | The user shall delete an eligible locally cached PDF. | P0 | 1D |
| PRT-FR-021 | Expired download links shall not expose unauthorized files and shall provide a refresh action where permitted. | P0 | 1D |

---

## 28. Subscriptions, Payments and Entitlements

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| SUB-FR-001 | The app shall display available plans and their approved features and limits. | P0 | 1D |
| SUB-FR-002 | The app shall show the user’s current subscription and entitlement state. | P0 | 1D |
| SUB-FR-003 | The app shall support approved native-store or hosted-checkout upgrade flows. | P0 | 1D |
| SUB-FR-004 | The app shall show pending, confirmed, failed, cancelled, expired, refunded and action-required payment states where applicable. | P0 | 1D |
| SUB-FR-005 | The app shall not permanently unlock paid features based only on a client-side success screen. | P0 | 1D |
| SUB-FR-006 | Paid entitlement shall become authoritative only after backend verification. | P0 | 1D |
| SUB-FR-007 | Cached entitlement may support approved offline use for an approved grace period. | P0 | 1D |
| SUB-FR-008 | After reconnection, the app shall correct cached entitlement to the backend-confirmed state. | P0 | 1D |
| SUB-FR-009 | The app shall explain unavailable premium features and provide an eligible upgrade action. | P0 | 1D |
| SUB-FR-010 | The app shall reflect renewal, expiry, downgrade and refund outcomes received from the backend. | P0 | 1D |

---

## 29. Export, Privacy and Account Deletion

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PRIV-FR-001 | The user shall request a machine-readable export of eligible personal data. | P0 | 1D |
| PRIV-FR-002 | The app shall show export preparation, ready, failed and expired states. | P0 | 1D |
| PRIV-FR-003 | Export downloads shall require authorization and use time-limited access. | P0 | 1D |
| PRIV-FR-004 | The user shall request account deletion from the app. | P0 | 1D |
| PRIV-FR-005 | The app shall explain the effect of account deletion before confirmation. | P0 | 1D |
| PRIV-FR-006 | When backend account deletion becomes authoritative, the app shall remove or render inaccessible the deleted account’s credentials, local records, notification mappings and cached private files according to approved policy. | P0 | 1D |
| PRIV-FR-007 | Signing out shall not silently destroy pending local work unless the user explicitly approves deletion or policy requires it. | P0 | 1A |
| PRIV-FR-008 | Device or session revocation shall prevent future authorized synchronization and access. | P0 | 1D |
| PRIV-FR-009 | The app shall provide clear privacy controls for notes, reflections, print inclusion and analytics consent where applicable. | P0 | 1D |
| PRIV-FR-010 | Private content shall be excluded from monitoring and analytics payloads. | P0 | All |

---

## 30. Public Events Extension

Public events are a separately controlled extension and shall not delay core calendar, reminder, planner, note or print delivery.

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| PUB-FR-001 | When enabled, the app shall display backend-published public events. | EXT | EXT |
| PUB-FR-002 | The user shall browse and view public-event details. | EXT | EXT |
| PUB-FR-003 | Downloaded public-event information may remain available offline. | EXT | EXT |
| PUB-FR-004 | The user shall add a public event to the private calendar. | EXT | EXT |
| PUB-FR-005 | Adding a public event shall create a private copy linked to the source public-event identifier. | EXT | EXT |
| PUB-FR-006 | Later public-event changes shall not silently overwrite the private copy. | EXT | EXT |
| PUB-FR-007 | The app may notify the user when updated public information is available. | EXT | EXT |
| PUB-FR-008 | Public-event availability and publication status shall be backend-authoritative. | EXT | EXT |

---

## 31. Polls Extension

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| POLL-FR-001 | When enabled, the app shall show polls linked to eligible public events. | EXT | EXT |
| POLL-FR-002 | A poll shall show its question, options, selection rule and opening or closing status. | EXT | EXT |
| POLL-FR-003 | The user shall select one or multiple options according to the poll rule. | EXT | EXT |
| POLL-FR-004 | An offline vote submission shall be shown as **Pending Submission**, not accepted. | EXT | EXT |
| POLL-FR-005 | Final vote acceptance shall require backend confirmation. | EXT | EXT |
| POLL-FR-006 | Duplicate, ineligible, closed or rate-limited votes shall show a clear backend-confirmed outcome. | EXT | EXT |
| POLL-FR-007 | Published poll totals shall use the backend-confirmed values. | EXT | EXT |
| POLL-FR-008 | Poll participation data stored locally shall follow approved privacy and retention rules. | EXT | EXT |

---

## 32. Public Event Questions Extension

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| QST-FR-001 | When enabled, the user shall submit a question linked to an eligible public event. | EXT | EXT |
| QST-FR-002 | A question created offline shall remain a local pending submission until acknowledged. | EXT | EXT |
| QST-FR-003 | The app shall show submitted, pending moderation, published, answered, rejected or action-required status. | EXT | EXT |
| QST-FR-004 | Question moderation, publication and approved answers shall be backend-authoritative. | EXT | EXT |
| QST-FR-005 | A rejected question shall show an approved safe reason where provided. | EXT | EXT |
| QST-FR-006 | Rate-limit and abuse-control outcomes shall be displayed without exposing internal security rules. | EXT | EXT |
| QST-FR-007 | Unpublished question content shall not appear in analytics or monitoring. | EXT | EXT |

---

## 33. Accessibility and Usability

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| ACC-FR-001 | The app shall provide meaningful screen-reader labels for interactive elements. | P0 | All |
| ACC-FR-002 | The app shall support system text scaling without hiding critical actions or information. | P0 | All |
| ACC-FR-003 | Touch targets shall be large enough for comfortable mobile use. | P0 | All |
| ACC-FR-004 | Status shall not be communicated by color alone. | P0 | All |
| ACC-FR-005 | The app shall provide sufficient contrast for text, controls and status indicators. | P0 | All |
| ACC-FR-006 | Validation and error messages shall be associated with the relevant field or action. | P0 | All |
| ACC-FR-007 | The app shall support a logical focus order for keyboard and assistive technology where applicable. | P0 | All |
| ACC-FR-008 | Amharic text shall be tested for clipping, wrapping, readability and text scaling. | P0 | All |
| ACC-FR-009 | Basic event and reminder creation shall require no more than title, date and optional time. | P0 | 1B |
| ACC-FR-010 | Advanced fields shall not obstruct the basic creation flow. | P0 | 1B |

---

## 34. Errors, Support and Diagnostics

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| ERR-FR-001 | The app shall provide clear user messages for validation, authentication, authorization, network, server, conflict, storage, notification, file, payment and print failures. | P0 | All |
| ERR-FR-002 | The app shall distinguish retryable failures from failures requiring user correction. | P0 | All |
| ERR-FR-003 | The app shall provide a retry action where retry is safe and meaningful. | P0 | All |
| ERR-FR-004 | The app shall provide a support reference or correlation identifier where available. | P0 | 1A |
| ERR-FR-005 | The app shall not expose private content in logs, diagnostics or support references. | P0 | All |
| ERR-FR-006 | A storage or migration failure shall not be handled by silently deleting the local database. | P0 | 1A |
| ERR-FR-007 | The app shall clearly communicate when an external service is temporarily unavailable. | P0 | All |

---

# Business Rules

## 35. Core Business Rules

| ID | Business rule |
|---|---|
| BR-CAL-001 | The original Ethiopian or Gregorian calendar basis governs stored recurrence meaning. |
| BR-CAL-002 | Date-only and all-day values shall not shift because of timezone conversion. |
| BR-REC-001 | Ethiopian yearly recurrence shall remain Ethiopian-basis recurrence. |
| BR-REC-002 | Recurrence series changes and occurrence exceptions are distinct operations. |
| BR-OFF-001 | Supported offline work shall be locally durable before the app reports it as saved. |
| BR-OFF-002 | No accepted local user content may be silently discarded because synchronization failed. |
| BR-SYNC-001 | Retried operations shall be processed idempotently. |
| BR-SYNC-002 | Device timestamps shall not be treated as the sole authoritative synchronization order. |
| BR-CNF-001 | Notes and planner conflicts shall preserve both versions until resolved. |
| BR-DEL-001 | Deletion shall propagate and shall not be silently reversed by stale devices. |
| BR-NTF-001 | Backend scheduling is authoritative after synchronization; local offline schedules are provisional. |
| BR-PRT-001 | Final production PDFs are generated and authorized by the backend service. |
| BR-PRT-002 | Print submission shall preserve stable source content or an equivalent version reference. |
| BR-PAY-001 | The backend-confirmed payment and entitlement state is authoritative. |
| BR-POLL-001 | A locally queued vote is not an accepted vote until the backend confirms it. |
| BR-QST-001 | Question moderation and publication are backend-authoritative. |
| BR-PRIV-001 | Private notes, planner reflections and unpublished questions shall not be included in monitoring or analytics. |
| BR-PROD-001 | Profiles and templates alter defaults and presentation, not the underlying personal-data model. |

---

# Key Acceptance Criteria

## 36. Acceptance Scenarios

### AC-CAL-001 — Ethiopian date conversion

**Given** the user enters a valid Ethiopian date  
**When** the user requests conversion  
**Then** the app shall display the correct Gregorian equivalent  
**And** the result shall remain available without network access.

### AC-CAL-002 — Invalid Pagume date

**Given** the user enters an invalid Pagume date  
**When** validation runs  
**Then** the app shall reject the value  
**And** show localized field-level guidance.

### AC-EVT-001 — Offline event creation

**Given** the device is offline  
**When** the user creates a valid event  
**Then** the app shall save it locally immediately  
**And** show it in the relevant calendar view  
**And** mark it as waiting to sync.

### AC-SYNC-001 — Idempotent retry

**Given** an event operation may have reached the server before a timeout  
**When** the app retries the same pending operation  
**Then** the server result shall not create a duplicate event  
**And** the app shall converge to one synchronized record.

### AC-SYNC-002 — Restart with pending work

**Given** the user has unsynchronized local records  
**When** the app is closed and reopened  
**Then** those records shall remain present  
**And** retain their synchronization states.

### AC-CNF-001 — Note conflict

**Given** the same note was edited differently on two devices  
**When** synchronization detects a conflict  
**Then** neither version shall be silently lost  
**And** the app shall offer an approved resolution action.

### AC-DEL-001 — Delete versus stale update

**Given** one device permanently deletes a record  
**And** another device later reconnects with an older update  
**When** synchronization occurs  
**Then** the deleted record shall not be silently restored.

### AC-REM-001 — Offline reminder

**Given** the device is offline  
**When** the user creates a near-term reminder  
**Then** the app shall save the reminder locally  
**And** schedule a provisional local notification where supported  
**And** reconcile it after backend synchronization.

### AC-PLN-001 — Planner autosave

**Given** the user edits a planner page  
**When** the user pauses or leaves the screen  
**Then** the current content shall be saved locally  
**And** the app shall not create one synchronization operation for each keystroke.

### AC-NOTE-001 — Private diagnostics

**Given** a note-related error occurs  
**When** the app records diagnostics  
**Then** the note title and content shall not be included.

### AC-PRT-001 — Print privacy review

**Given** the user configures a print request  
**When** the user proceeds to submission  
**Then** the app shall show the private content types selected for inclusion  
**And** require explicit confirmation.

### AC-PRT-002 — Stable print request

**Given** the user submits a print request  
**When** the user later edits the source planner or notes  
**Then** the queued print job shall continue using its submitted snapshot or stable version reference.

### AC-PAY-001 — Client success is not entitlement

**Given** a payment provider returns a client-side success response  
**When** backend verification is not yet complete  
**Then** the app shall show a pending state  
**And** shall not grant permanent premium entitlement.

### AC-AUTH-001 — Guest migration

**Given** the guest has local eligible content  
**When** the guest registers and selects records to migrate  
**Then** the app shall upload them using stable identifiers  
**And** avoid duplicates  
**And** report migrated, rejected and pending results.

### AC-POLL-001 — Offline poll vote

**Given** the public-event extension is enabled and the device is offline  
**When** the user submits a vote  
**Then** the app shall show Pending Submission  
**And** shall not count the vote as accepted until backend confirmation.

---

# Delivery Priorities

## 37. Commercially Complete Version 1

### Phase 1A — Foundation and Calendar

- Flutter app shell for Android and iOS;
- guest use and registered account foundation;
- preferences and localization;
- Ethiopian and Gregorian calendars;
- date conversion;
- Today base;
- calendar views and calendar packs;
- offline local persistence;
- basic synchronization and visible sync status.

### Phase 1B — Events and Reminders

- events;
- recurrence and series exceptions;
- reminders;
- snooze, reschedule and completion;
- notifications;
- offline event and reminder operation;
- duplicate-prevention and retry behavior.

### Phase 1C — Planner and Notes

- daily, weekly, monthly and yearly planner;
- private notes;
- profiles and templates;
- autosave and undo;
- Recently Deleted;
- conflict recovery;
- guest-to-account migration;
- local search.

### Phase 1D — Print and Commercialization

- Custom Print Studio;
- final privacy review;
- server-generated PDF workflow;
- secure preview, download, print and share;
- subscriptions and verified entitlements;
- payment states;
- personal-data export;
- account deletion;
- production hardening.

### Controlled Extension

- public events;
- polls;
- event questions;
- moderation and backend-authoritative outcomes.

The extension shall not delay acceptance of the core Version 1 product.

---

# Explicit Exclusions

## 38. Out of Scope

The Flutter Planner App shall not include:

- human-resources management;
- payroll;
- attendance management;
- employee appraisal;
- employee performance monitoring;
- KPI management;
- scorecards;
- work allocation;
- project dependencies;
- project milestones;
- Kanban boards;
- time tracking;
- CRM;
- accounting;
- invoicing;
- tax management;
- electronic signatures;
- institutional approval workflows;
- government hierarchy workflows;
- document approval;
- strategic-plan cascading;
- enterprise performance management;
- social feeds;
- complex collaboration;
- family sharing or shared permissions in Version 1;
- complex two-way external calendar synchronization;
- bulk institutional planner generation; or
- printing-partner fulfillment.

Institution name, department or office and job title may exist only as personal profile or print fields. They shall not create organizational hierarchy or workflow.

---

# Open Business Decisions

## 39. Decisions Required Before Final Configuration

The following values shall be approved before their affected feature is accepted:

| Decision | Required outcome |
|---|---|
| Supported calendar range | Minimum and maximum Ethiopian and Gregorian dates |
| Recently Deleted period | Recovery duration and purge behavior |
| Event title limit | Maximum length |
| Reminder title limit | Maximum length |
| Note size limit | Maximum local and synchronized size |
| Planner-page size limit | Maximum supported content size |
| General attachment support | Confirm P1 scope, types, sizes and plan limits |
| Print cover-image limit | File types, size and resolution |
| Recurrence preview horizon | Client-visible generation range |
| Notification limits | Number and timing allowed per plan |
| Quiet-hours behavior | Exact business policy |
| Print retention | Backend and local retention periods |
| Export retention | Expiry period for export files and links |
| Subscription plans | Names, prices, currencies and entitlements |
| Offline entitlement grace | Duration and eligible features |
| Poll eligibility | Authentication and anonymous-voting policy |
| Question moderation | Statuses, reasons, retention and appeal behavior |
| Account deletion retention | Legal and operational retention policy |
| Analytics consent | Markets and events requiring consent |

No unresolved commercial limit shall be silently hard-coded.

---

# Approval

## 40. Approval Table

| Role | Responsibility | Status |
|---|---|---|
| Executive Sponsor | Product direction and funding | Pending |
| Product Owner | Scope, priorities and business decisions | Pending |
| Business/System Analyst | Completeness and traceability | Prepared |
| Solution Architect | Feasibility and architecture alignment | Pending |
| Flutter Engineering Lead | Delivery readiness | Pending |
| Backend Engineering Lead | API and authority alignment | Pending |
| QA Lead | Testability and acceptance coverage | Pending |
| Security and Privacy Reviewer | Privacy, retention and security behavior | Pending |
| UI/UX Lead | Usability, accessibility and bilingual experience | Pending |

---

## Final Product Statement

The Flutter Planner App shall deliver a reliable Ethiopian-first personal planning experience built around:

- accurate Ethiopian and Gregorian dates;
- simple events and reminders;
- calm daily, weekly, monthly and yearly planning;
- private notes;
- trustworthy offline operation;
- recoverable synchronization;
- bilingual use;
- custom print output; and
- verified subscription access.

The product shall remain a personal calendar and planner and shall not expand into HR, payroll, e-signature, ERP, employee-performance or institutional workflow software without a separately approved product specification.
