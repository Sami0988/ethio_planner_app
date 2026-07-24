# Ethiopian Calendar and Planner

## Phase 1 UI/UX Research and Complete Screen Inventory

**Version:** 1.0  
**Date:** 24 July 2026  
**Product:** Flutter customer application for Android and iOS  
**Audience:** Product owner, UX/UI designer, Flutter team, QA team and Claude Code  
**Phase:** Core Platform Phase 1  

---

# 1. Purpose

This document defines which Flutter screens and reusable interaction surfaces shall be designed for Phase 1 of the Ethiopian Calendar and Planner.

It is based on:

- the approved Flutter Core Phase 1 Delivery Specification;
- the current backend Phase 1 boundaries;
- the guest-first and offline-first product decisions;
- the decision to bundle initial predefined calendar content and translations in Flutter;
- current Android, iOS, Material Design and accessibility guidance; and
- common interaction patterns in calendar, reminder and planner applications.

This is a UX and screen-delivery specification. It describes:

- the recommended information architecture;
- every Phase 1 screen family;
- what each screen must help the customer accomplish;
- guest and registered-user differences;
- the design order;
- shared states and reusable surfaces;
- localization, accessibility and calendar-specific requirements; and
- the usability research required before production release.

It does not prescribe Flutter source-code structure or state-management implementation.

---

# 2. Confirmed Phase 1 Product Boundary

The screen design shall reflect these approved decisions:

1. The customer application is Flutter for Android and iOS.
2. The application is useful before registration.
3. Guest data is stored locally and is not cloud-backed.
4. Registered users receive optional cloud backup and multi-device synchronization.
5. Core calendar, events, reminders, planner, notes, search and settings work offline.
6. Reminder notifications are scheduled locally by Flutter.
7. Initial holidays, observances and their four-language content are bundled with Flutter.
8. Backend calendar-content management and backend translation are deferred.
9. Phase 1 supports English, Amharic, Afaan Oromo and Tigrinya.
10. Phase 1 is a personal planner, not project-management, institutional workflow or employee-performance software.
11. SaaS subscriptions, billing, entitlements, organization tenancy, administrative screens, files, print/export and product analytics are deferred.

---

# 3. Research Summary

## 3.1 Navigation Findings

Mobile navigation works best when the primary destinations are stable and limited. Material Design describes the navigation bar as a way to move between top-level views, while Apple's tab-bar guidance similarly treats tabs as persistent top-level destinations.

Recommended Phase 1 destinations:

| Location | Destination | Reason |
|---|---|---|
| Bottom navigation | Today | Most frequent daily entry point |
| Bottom navigation | Calendar | Date browsing, events and bundled content |
| Bottom navigation | Planner | Day, week, month and year planning |
| Bottom navigation | Notes | Private capture and retrieval |
| Global action | Add | Create event, reminder, planner item or note |
| Top app bar | Search | Global utility rather than a permanent content area |
| Profile/menu entry | Settings | Lower-frequency configuration and account tasks |
| Settings and status banners | Recently Deleted | Recovery destination, not a daily top-level destination |
| Settings and actionable status | Conflict Center | Registered-only exception handling |
| Settings and Today status | Sync Center | Registered-only account operation |

The global Add action should open a small chooser and then the appropriate focused editor. A floating action button is suitable because creation is the dominant global action.

## 3.2 Calendar-View Findings

Mainstream calendar products expose multiple time perspectives. For Phase 1, the design should support:

- Month for date orientation and high-level density;
- Day/Agenda for actionable detail;
- Week for short-range planning;
- Year/Date Navigator for rapid movement rather than dense event editing; and
- a dedicated date-conversion experience for Ethiopian and Gregorian conversion.

The customer should never have to infer whether a displayed or entered date is Ethiopian or Gregorian. The calendar basis shall always have a visible text label or other non-color-only indicator.

## 3.3 Today Findings

Today should be a composed daily dashboard, not another calendar view. It should answer:

1. What date is it in both calendars?
2. What is culturally or nationally relevant today?
3. What is scheduled?
4. What is due or overdue?
5. What did I plan to do?
6. Is anything offline, pending or conflicted?

Today must remain useful when no content exists. In the empty state it should still show both dates, bundled content and helpful creation actions.

## 3.4 Offline-First Findings

Android's offline-first architecture guidance recommends that critical reads come from a local source and that the application coordinate local and network data. For this product, every core screen must therefore design for:

- local content shown immediately;
- offline availability;
- locally saved changes;
- queued cloud changes;
- synchronization in progress;
- a rejected change that needs correction;
- a conflict that needs user choice; and
- an error that does not destroy entered content.

“Saved” and “Synced” are different states. The UI must communicate this accurately without showing technical database or API language.

## 3.5 Permission Findings

Notification permission should be requested only when it becomes meaningful, normally when a customer enables the first notification-producing reminder. The app must first explain:

- what the permission enables;
- that delivery can be affected by operating-system restrictions;
- that reminders remain visible inside the app when permission is denied; and
- how to enable the permission later.

Notification permission shall not block onboarding, calendar browsing or reminder creation.

## 3.6 Accessibility Findings

The native mobile design should target WCAG 2.2 Level AA principles and platform accessibility conventions:

- normal text contrast of at least 4.5:1;
- generous touch targets, preferably about 48 logical pixels for primary controls;
- scalable text without clipped actions;
- meaningful screen-reader labels and reading order;
- status information that does not rely on color;
- visible keyboard/focus treatment where relevant;
- reduced-motion support;
- dark-mode validation; and
- error messages associated with the affected field.

## 3.7 Ethiopian-First UX Findings

The design shall specifically validate:

- Ethiopian and Gregorian date hierarchy;
- Ethiopian month names and Pagume;
- Pagume 5 and Pagume 6;
- leap-year messaging;
- Ethiopian and Latin numeral preferences where approved;
- longer Ethiopic labels at large text sizes;
- mixed Ethiopic and Latin text in search, notes and titles;
- four-language screen fit;
- date-only values that must not shift with time zone;
- time-zone clarity for Ethiopians living abroad; and
- annual recurrence that remains attached to its original calendar basis.

Flags shall not be used as the only representation of language. Color shall not be the only representation of calendar basis, event type, synchronization state or conflict.

---

# 4. Recommended Information Architecture

## 4.1 Phone Navigation

```text
Bottom navigation
├── Today
├── Calendar
├── Planner
└── Notes

Global Add
├── Event
├── Reminder
├── Planner item
└── Note

Top app bar
├── Search
├── Sync/guest status
└── Profile or Settings

Secondary destinations
├── Reminders
├── Recently Deleted
├── Conflict Center
├── Sync Center
├── Account
└── Privacy and Help
```

## 4.2 Tablet and Large-Screen Adaptation

The same information architecture should adapt to a navigation rail or expanded side navigation. The Phase 1 design should prepare, at minimum:

- a compact phone layout;
- a medium-width tablet layout; and
- a large tablet layout for high-value screens such as Calendar, Planner, Notes and Conflict Compare.

Possible large-screen patterns include:

- Month calendar with selected-day agenda beside it;
- Notes list and note editor in a master-detail layout;
- Search results and selected result in two panes;
- Conflict list and comparison in two panes; and
- Planner navigation and current period in two panes.

The phone experience remains the release priority.

---

# 5. Design Priority Legend

All screens in this document are Phase 1 screens. The priority describes the order in which the design team should resolve them.

| Priority | Meaning |
|---|---|
| P0 — Prototype first | Establishes product navigation, date hierarchy and core interaction model |
| P1 — Guest core | Required to complete the useful offline guest product |
| P2 — Account and sync | Required for registration, import, cloud backup and multi-device use |
| P3 — Trust and release | Required for recovery, privacy, diagnostics and production readiness |

The first interactive usability prototype should include all P0 screens and the most important P1 creation flows.

---

# 6. Complete Phase 1 Screen Inventory

## 6.1 Launch and Onboarding

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| ONB-01 | Launch and secure initialization | P0 | All | Displays the product identity while local storage, language, active account scope and required migrations initialize. It needs normal launch, first launch, recoverable initialization failure and incompatible-data states. It must never reveal private content in the app switcher or launch snapshot. |
| ONB-02 | Language selection | P0 | All | Lets the customer choose English, Amharic, Afaan Oromo or Tigrinya. Each language name should appear in its own language. Selection applies immediately and must remain usable with screen readers and large text. |
| ONB-03 | Product introduction | P0 | New users | Briefly explains the dual Ethiopian/Gregorian calendar, offline personal planning and local reminders. Keep it short, skippable and focused on value rather than feature marketing. |
| ONB-04 | Calendar and regional setup | P0 | New users | Selects primary display as Ethiopian, Gregorian or dual; week start; time zone; optional numeral preference; and appearance where approved. Show a live date example so the choice is understandable. |
| ONB-05 | Continue as guest or use account | P0 | New users | Provides three clear choices: Continue as guest, Create account and Sign in. Guest is a first-class path and must not be visually hidden or presented as unsafe. |
| ONB-06 | Guest data explanation | P0 | Guests | Explains that guest data remains on this device, is not backed up and may be lost after uninstall or data clearing. It also explains that eligible data can be imported after registration. This should require acknowledgement once, not repeated interruption. |
| ONB-07 | First Today introduction | P1 | New users | A lightweight contextual introduction to the Today layout, dual date, global Add action and where to find Calendar, Planner and Notes. Prefer dismissible coach marks over a long tutorial. |

## 6.2 Core Navigation and Daily Use

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| CORE-01 | Today | P0 | All | The main daily dashboard. Shows Ethiopian and Gregorian dates, weekday, bundled holidays/observances, today's events, due and overdue reminders, relevant planner items, completion state, quick creation, guest/offline/sync status and actionable conflicts. Sections should link to full lists and remain useful when empty. |
| CORE-02 | Calendar — Month | P0 | All | Month grid with clear primary and secondary calendar dates, today, selection, event/reminder indicators, bundled content and category/calendar cues. Includes month navigation, jump to today, view switcher and filters. Density must remain readable in four languages and at supported text scaling. |
| CORE-03 | Calendar — Day/Agenda | P0 | All | Chronological view of a selected day with all-day events, timed events, reminders and bundled content. Supports quick creation at the selected date/time and makes overlaps understandable. |
| CORE-04 | Calendar — Week | P1 | All | Seven-day orientation with daily summaries or timed layout appropriate to phone width. It must communicate the selected calendar basis, week-start preference, all-day items and overflow without requiring tiny touch targets. |
| CORE-05 | Calendar — Year and date navigator | P1 | All | Provides rapid movement across months and years, jump to Today and direct date selection. The year screen may use a simplified month overview rather than trying to display full event detail. |
| CORE-06 | Day details and bundled content | P0 | All | Shows complete information for the selected date: both calendar dates, weekday, holiday/observance title, category, description where approved and personal items for that day. Bundled content is read-only and clearly distinguished from personal content. |
| CORE-07 | Date converter | P0 | All | Converts Ethiopian to Gregorian and Gregorian to Ethiopian. Includes explicit source calendar, validated date fields or calendar-aware picker, converted result, copy/share only if approved, swap direction and leap/Pagume error guidance. Conversion must work offline. |
| CORE-08 | Reminders hub | P1 | All | Provides useful reminder lists such as Today, Upcoming, All and Completed. Shows overdue state, recurrence, notification availability and quick actions. This is reached from Today, Calendar or Search rather than occupying a primary bottom tab. |
| CORE-09 | Planner hub and period selector | P0 | All | Entry point for daily, weekly, monthly and yearly plans. Shows the current period, recent periods, items needing carry-forward and quick movement to another date or period. |
| CORE-10 | Notes list | P0 | All | Searchable list of pinned, recent and archived notes. Shows title or safe preview, updated time, linked-record indicators, local/sync/conflict state and an empty-state creation action. |

## 6.3 Global Creation and Common Editing

| ID | Screen or surface | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| CRT-01 | Global Add chooser | P0 | All | Bottom sheet or menu opened from the global Add action. Offers Event, Reminder, Planner item and Note with concise labels and icons. It inherits the currently selected date or planner period where appropriate. |
| CRT-02 | Quick Event | P0 | All | Fast event entry requiring only title and date/time essentials, with a route to the full editor. It saves locally and prevents accidental duplicate submission. |
| CRT-03 | Event create/edit | P0 | All | Full event form: title, all-day/timed, Ethiopian or Gregorian basis, start/end, time zone, personal calendar, optional category, description, location and recurrence. Advanced fields should use progressive disclosure. Input is retained after validation or connectivity errors. |
| CRT-04 | Event detail | P0 | All | Readable summary with edit, delete, restore where applicable, recurrence information, calendar/category, description, location, local/sync/conflict status and related note links. |
| CRT-05 | Event recurrence editor | P1 | All | Configures daily, weekly, monthly or yearly recurrence, interval, weekdays, end rule and Ethiopian/Gregorian basis. For invalid monthly dates, the user explicitly chooses Skip invalid month or Use last valid day. |
| CRT-06 | Recurring-event occurrence editor | P1 | All | Edits or cancels one occurrence while preserving the series. It clearly identifies the original occurrence date and the exceptional value. |
| CRT-07 | Quick Reminder | P0 | All | Fast reminder entry with title, date/time and notification choice, with access to the full editor. If notification permission has not been decided, explanation occurs only after the reminder information is safely retained. |
| CRT-08 | Reminder create/edit | P0 | All | Full reminder form: title, optional note, date-only or timed, Ethiopian/Gregorian basis, category, optional event link, recurrence and notification behavior. It clearly distinguishes an in-app reminder from an operating-system notification. |
| CRT-09 | Reminder detail | P0 | All | Shows status, due information, recurrence, note, category, linked event, notification state, sync state and actions for complete, snooze, skip, cancel, edit and delete as applicable. |
| CRT-10 | Reminder recurrence editor | P1 | All | Uses the same recurrence language and calendar-basis rules as events while presenting reminder-specific occurrence actions. |
| CRT-11 | Reminder action and snooze chooser | P1 | All | Contextual sheet for Complete, Snooze, Skip or Cancel. Snooze options should include useful presets and a custom date/time. The chosen action must identify whether it affects one occurrence. |
| CRT-12 | Planner-item editor | P0 | All | Adds or edits a planner item with title, optional detail, section, optional target date and completion state. It opens in the context of the current planner period and saves locally. |
| CRT-13 | Note editor/detail | P0 | All | Private note writing surface with autosave, title/content, pin, archive, delete, limited revision history and links to eligible records. The interface communicates local save without interrupting typing. |
| CRT-14 | Link record selector | P1 | All | Searches and selects an owned event, reminder or planner page to link with a note. It distinguishes record types and current active account scope. |

## 6.4 Planner Screens

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| PLN-01 | Daily planner | P0 | All | Shows the chosen day, focus, priorities, checklist, intentions, notes and reflection as approved. Supports section visibility, item reordering, completion and autosave. Today's events/reminders may be referenced without being duplicated as planner items. |
| PLN-02 | Weekly planner | P0 | All | Supports weekly focus, priorities and day-oriented planning. It should make week start and Ethiopian/Gregorian date range clear and avoid overcrowding seven days on a small phone. |
| PLN-03 | Monthly planner | P1 | All | Supports monthly intentions, priorities, checklist and reflection with a clear month identity in the selected calendar basis. It is a planning page, not a duplicate month-calendar grid. |
| PLN-04 | Yearly planner | P1 | All | Supports yearly intentions, important priorities and reflection. It provides navigation to related monthly plans without becoming a project roadmap. |
| PLN-05 | Planner section manager | P1 | All | Shows built-in and approved custom sections, lets the user show/hide optional sections and reorder them, and prevents accidental loss of content when hiding a section. |
| PLN-06 | Carry-forward and copy review | P1 | All | Previews eligible source items, destination period and result. Offers merge, replace or cancel when the target contains content. Date-bound events are not silently copied and repeated confirmation must not duplicate items. |
| PLN-07 | Planner recovery history | P3 | All | Limited recovery view for recent planner versions or recoverable edits. It clearly shows date/time and the effect of restoration without exposing internal version numbers. |

## 6.5 Notes Supporting Screens

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| NTE-01 | Archived notes | P1 | All | Displays archived notes separately from the active list, with search, unarchive and delete actions. It reuses the Notes list pattern. |
| NTE-02 | Note revision history | P3 | All | Lists limited recoverable note revisions, with safe previews and timestamps. The user can inspect and restore without silently overwriting the current note. |
| NTE-03 | Note revision comparison | P3 | All | Compares the current note with a selected revision and explains whether restoration replaces the current text or creates a preserved copy. |

## 6.6 Calendars, Categories and Bundled Content

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| ORG-01 | Personal calendars | P1 | All | Lists personal calendars with visibility, color and default-calendar status. Includes create, edit and hide/show actions. It must not imply shared or team calendars in Phase 1. |
| ORG-02 | Personal calendar editor | P1 | All | Creates or edits a personal calendar name, color and visibility/default options. Color is supplementary; the calendar name remains the accessible identifier. |
| ORG-03 | Categories | P1 | All | Lists user categories used by events and reminders, with create, edit and visibility/filter behavior where approved. |
| ORG-04 | Category editor | P1 | All | Creates or edits a category name, optional icon/color and other approved local properties. It explains the effect of deleting a category that is already in use. |
| ORG-05 | Bundled content groups | P1 | All | Lets the customer enable or disable approved public-holiday, national, religious and cultural content groups included with Flutter. It does not download, publish or translate content from the backend. |
| ORG-06 | Today layout preferences | P1 | All | Lets the customer show, hide or reorder approved Today sections while preserving required date and status information. |

## 6.7 Search, Deletion and Conflict Recovery

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| REC-01 | Global search and results | P0 | All | Searches local events, reminders, planner items and notes. Supports mixed Ethiopic and Latin text, deterministic result ordering, type labels and result selection. It works offline and warns registered users when incomplete local data may limit results. |
| REC-02 | Search filters | P1 | All | Filters by content type, date range, personal calendar, category, archive state and recently deleted state. Active filters remain visible and are easy to clear. |
| REC-03 | Recently Deleted | P1 | All | Lists eligible deleted events, reminders, planner content and notes with deletion date, recovery expiry where known, restore and permanent-delete actions. |
| REC-04 | Deleted item preview | P1 | All | Shows enough safe detail to identify the deleted item, its recovery deadline and the effects of restore. A restored reminder explains that eligible local notification schedules will be rebuilt. |
| REC-05 | Conflict Center | P2 | Registered users | Lists unresolved and recently resolved conflicts by content type, title or safe summary, conflict date, device where safely available and current status. The empty state explains that there is nothing requiring attention. |
| REC-06 | Conflict comparison | P2 | Registered users | Side-by-side or stacked comparison of local and synchronized versions with field-level differences. The user can keep local, keep synchronized, keep both where allowed or enter manual merge. |
| REC-07 | Manual conflict merge | P2 | Registered users | Editable merge surface for supported free-form content such as notes. Both source versions remain accessible until resolution is safely completed. |

## 6.8 Authentication and Account

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| AUTH-01 | Registration | P2 | Guests | Creates an account using the approved identity fields, password rules and consent acknowledgement. It preserves eligible local guest data while registration is pending. |
| AUTH-02 | Email verification pending | P2 | New accounts | Explains that verification is required, shows the masked email, allows resend with safe throttling and provides change-email or sign-in routes where approved. |
| AUTH-03 | Verification result | P2 | New accounts | Handles successful, already-used, invalid and expired verification links. Expired links provide a clear resend action rather than a dead end. |
| AUTH-04 | Sign in | P2 | Registered users | Authenticates without mixing local account scopes. Provides password recovery, registration and return-to-guest paths. |
| AUTH-05 | Forgot password | P2 | Registered users | Requests recovery using a generic response that does not reveal whether an account exists. |
| AUTH-06 | Reset password | P2 | Registered users | Handles the supported deep link, new password entry, confirmation, successful reset and invalid/expired token recovery. |
| AUTH-07 | Session expired or revoked | P2 | Registered users | Explains that cloud access requires sign-in again while clearly stating that unsynchronized local changes have not been automatically deleted. |
| AUTH-08 | Account status | P3 | Registered users | Handles disabled, deletion-pending, deleted or otherwise restricted account states using approved server message keys and safe next actions. |
| AUTH-09 | Account profile | P2 | Registered users | Shows account identity, verification status, cloud/sync summary and routes to devices, sessions, privacy, deletion and sign-out. |
| AUTH-10 | Devices and sessions | P2 | Registered users | Lists current and other devices/sessions with recognizable device name, platform, last activity, current marker and revoke action. |
| AUTH-11 | Device or session detail | P2 | Registered users | Shows safe metadata and permits revocation. It avoids exposing tokens, precise private activity or unnecessary location data. |
| AUTH-12 | Sign-out choices | P2 | Registered users | Distinguishes “Sign out and retain protected local data” from “Sign out and remove this account’s local data,” with unsynchronized-change disclosure before removal. |
| AUTH-13 | Local account switcher | P2 | Multi-account local state | Selects the active signed-in or retained local account scope without mixing records. Guest data remains a distinct local scope until confirmed import. |

## 6.9 Guest Import and Synchronization

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| SYNC-01 | Guest import introduction | P2 | Newly registered users | Explains what eligible guest information can be imported, that identifiers are preserved, that existing cloud data may require conflict handling and that guest data will not be removed before safe completion. |
| SYNC-02 | Import inventory and review | P2 | Newly registered users | Summarizes eligible events, reminders, planner records, notes, calendars, categories and settings. Identifies invalid or unsupported records and allows the user to start, postpone or cancel. |
| SYNC-03 | Import issue review | P2 | Newly registered users | Lists invalid records, dependency problems and likely duplicates where detectable, with clear choices to correct, exclude or retain locally. |
| SYNC-04 | Import progress | P2 | Newly registered users | Shows overall and per-content progress, accepted/retryable/rejected counts and safe interruption behavior. It avoids implying failure when connectivity is temporarily unavailable. |
| SYNC-05 | Import result | P2 | Newly registered users | Summarizes imported, skipped, retryable and rejected records. It keeps unresolved local records accessible and provides retry or issue-review actions. |
| SYNC-06 | Sync Center | P2 | Registered users | Shows last successful sync, current state, pending count, conflicts, rejected changes, device status, manual retry and Full Resync recovery entry. Uses customer language such as “Waiting for internet” rather than protocol terminology. |
| SYNC-07 | Pending and rejected changes | P2 | Registered users | Lists local changes waiting for cloud backup and changes that require correction. It clearly separates ordinary pending work from action-required rejection. |
| SYNC-08 | Sync issue detail | P2 | Registered users | Explains the affected item, safe error meaning and correction/retry action while preserving the user's content. Internal API errors and stack traces are never displayed. |
| SYNC-09 | Full Resync review and confirmation | P3 | Registered users | Explains when Full Resync is appropriate, what will be downloaded, how unsynchronized local changes are protected and why the action may take time. It requires explicit confirmation. |
| SYNC-10 | Full Resync progress | P3 | Registered users | Shows bounded snapshot progress, local preservation stage and interruption handling. The screen must remain truthful if the app is backgrounded or connectivity is lost. |
| SYNC-11 | Full Resync result | P3 | Registered users | Shows completion, recovered data, remaining pending changes, conflicts or recoverable failure, with a safe next action. |

## 6.10 Settings

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| SET-01 | Settings hub | P0 | All | Organizes Calendar and region, Appearance, Today and content, Reminders and notifications, Account and sync, Recently Deleted, Conflict Center, Privacy, Help and About. Guest/account-specific rows appear only when relevant. |
| SET-02 | Language | P1 | All | Changes English, Amharic, Afaan Oromo or Tigrinya without unnecessarily restarting the app. Includes screen-fit-safe native names and does not change stored date meaning. |
| SET-03 | Calendar and regional preferences | P0 | All | Sets primary calendar, Ethiopian/Gregorian/dual display, time zone, optional home time zone, week start, date format and numeral preference. Preview examples reduce ambiguity. |
| SET-04 | Appearance and accessibility | P1 | All | Selects system/light/dark appearance and approved accessibility preferences such as reduced motion or enhanced contrast where the app provides overrides. It does not duplicate operating-system controls without need. |
| SET-05 | Reminder defaults and quiet hours | P1 | All | Sets default reminder time, quiet-hours enablement, start/end, time zone and behavior during quiet hours. Invalid or ambiguous combinations are explained before saving. |
| SET-06 | Notification status | P1 | All | Shows current operating-system permission, scheduling limitations and a route to system settings when permission is denied or restricted. It also offers schedule rebuild/troubleshooting where approved. |
| SET-07 | Sync settings | P2 | Registered users | Shows cloud-backup state, last sync, manual retry, Wi-Fi/data preferences only if approved, and routes to pending changes, conflicts and Full Resync. |
| SET-08 | Guest status and data | P1 | Guests | Explains local-only storage, offers registration/sign-in and provides a protected Remove guest data action. It should inform without repeatedly pressuring registration. |

## 6.11 Notification Permission and Troubleshooting

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| NOTIF-01 | Notification permission education | P1 | All | Contextual pre-permission screen or sheet shown after a user enables the first relevant reminder. Explains why permission is useful and that the reminder remains available in-app if permission is denied. |
| NOTIF-02 | Notification permission result | P1 | All | Briefly confirms enabled, denied or restricted status. Denial never discards the reminder and provides a non-blocking path to continue. |
| NOTIF-03 | Notification troubleshooting | P3 | All | Helps diagnose permission, channel, focus/do-not-disturb, battery/background restrictions and schedule state using platform-appropriate language. It avoids promising guaranteed delivery. |
| NOTIF-04 | Notification-tap destination | P1 | All | The correct Reminder Detail or Event Detail state opened from a local notification. It handles deleted, completed, signed-out or inaccessible content safely. This is a routed state of the detail screen, not a separate visual template. |

## 6.12 Privacy, Data Removal and Support

| ID | Screen | Priority | Applies to | Description and required content |
|---|---|---:|---|---|
| PRV-01 | Privacy and security | P3 | All | Explains local storage, registered cloud backup, notification privacy, account scope and links to the approved privacy notice. Registered users also access consent and account deletion here. |
| PRV-02 | Consent information | P3 | Registered users | Shows current required consent information and approved history/status without exposing internal legal or database terminology. |
| PRV-03 | Account deletion request | P3 | Registered users | Explains the effect on cloud data, local data, active sessions and any waiting period. It distinguishes account deletion from merely removing local data or signing out. |
| PRV-04 | Account deletion verification | P3 | Registered users | Performs approved re-authentication or verification before a destructive request. It preserves a safe route to cancel. |
| PRV-05 | Account deletion pending/status | P3 | Registered users | Shows request time, effective date or processing state, effects during the waiting period and the action to cancel when policy permits. |
| PRV-06 | Cancel account deletion | P3 | Registered users | Confirms cancellation and restores normal account status only after server acknowledgement. |
| PRV-07 | Account deletion completion and local cleanup | P3 | Registered users | Confirms that remote access is no longer available and lets the customer remove residual local data for that account without affecting other account scopes. |
| PRV-08 | Remove guest data | P3 | Guests | Destructive confirmation that summarizes local records and makes clear that there is no cloud backup. Use deliberate wording and require explicit confirmation. |
| PRV-09 | Remove registered local data | P3 | Registered users | Shows pending unsynchronized changes and cloud-backup state before removing this device's local copy. It never affects another local account. |
| SUP-01 | Help and support | P3 | All | Provides concise help topics for calendars, reminders, offline behavior, guest storage, synchronization and privacy, plus the approved support channel. |
| SUP-02 | Diagnostics summary | P3 | All | Shows app version, platform, locale, active calendar mode, notification permission and safe sync status. It must not include note text, planner text, tokens, passwords or other private content. |
| SUP-03 | About and legal | P3 | All | Shows product/version information, acknowledgements, privacy notice, terms where required and bundled-content attribution where applicable. |

---

# 7. Reusable Sheets, Dialogs and Components

The following shall be designed as reusable interaction surfaces. They should not become separate full-screen layouts unless content size or accessibility requires it.

| ID | Surface | Used by | UX requirement |
|---|---|---|---|
| UI-01 | Global Add sheet | All primary screens | Four concise creation choices with selected-date context |
| UI-02 | Calendar view switcher | Calendar | Month, Week, Day/Agenda and Year/Jump |
| UI-03 | Ethiopian/Gregorian date picker | Events, reminders, planner, search | Explicit calendar basis, valid ranges, Pagume and leap handling |
| UI-04 | Time and time-zone picker | Events, reminders, settings | Clear local time, primary time zone and optional home time zone |
| UI-05 | Recurrence pattern builder | Events and reminders | Plain-language summary of the resulting rule |
| UI-06 | Occurrence scope choice | Recurring item actions | “This occurrence” or “Entire series”; current-and-future is deferred |
| UI-07 | Invalid monthly-date policy | Recurrence | Explicit Skip invalid month or Use last valid day choice |
| UI-08 | Calendar selector | Event creation and filters | Personal calendar name plus non-color-only identification |
| UI-09 | Category selector | Events, reminders and filters | Searchable choice with Create category route |
| UI-10 | Search filter sheet | Search | Clear filters, active-filter count, Apply and Reset |
| UI-11 | Sync-status banner/chip | Today and detail screens | Offline, saved locally, pending, syncing, synced, rejected or conflict |
| UI-12 | Guest-status banner | Today and Settings | Calm local-only message with optional Learn more |
| UI-13 | Undo snackbar | Delete, archive and completion | Time-limited reversal where safe |
| UI-14 | Destructive confirmation | Delete, permanent delete and local removal | Names the exact item/scope and the consequence |
| UI-15 | Unsaved-input protection | Editors | Prevents accidental loss if local save has not completed |
| UI-16 | Overflow menu | Detail and list items | Secondary actions remain accessible with screen readers |
| UI-17 | Empty-state component | Lists and dashboards | Explains the value and provides one relevant next action |
| UI-18 | Inline validation and error summary | Forms | Associates messages with fields and preserves user input |
| UI-19 | Offline/retry panel | Account operations | Separates local success from unavailable cloud action |
| UI-20 | Account-scope indicator | Account switcher and Settings | Prevents guest/account or account/account data confusion |

---

# 8. Required State Variants

Do not create a separate Figma page for every state. Define a state matrix and build representative variants for each screen family.

| State | Required customer meaning | Screens most affected |
|---|---|---|
| Initial | Screen is ready before content has been requested or created | Onboarding, editors and Settings |
| Loading | Local or remote work is in progress and the interface remains stable | Launch, import, sync and account screens |
| Populated | Normal content state | All list and detail screens |
| Empty | No personal content exists; bundled dates may still appear | Today, Calendar, Reminders, Planner, Notes, Search and Deleted |
| Offline | Core local use continues; remote-only action is unavailable | Today, all editors, Sync and account screens |
| Saved locally | User input is safe on the device | Event, reminder, planner and note editors |
| Waiting to sync | Registered change is queued for cloud backup | Detail and list screens |
| Syncing | Cloud transfer is active | Today, Sync Center and import |
| Synced | Current server acknowledgement is known | Detail and Sync Center |
| Rejected | A change needs correction but content remains recoverable | Editor, Sync Center and issue detail |
| Conflict | Two meaningful versions need a decision | Detail, lists and Conflict Center |
| Permission denied | Reminder exists but operating-system notification is unavailable | Reminder detail and Notification settings |
| Error | A safe explanation and useful next action are available | All screen families |
| Retry | Repeating the action is safe and does not create duplicates | Import, sync and conflict resolution |
| Deleted | Item is recoverable under policy | Detail and Recently Deleted |
| Expired/unrecoverable | Recovery period has ended or server confirms removal | Deleted preview and account status |
| Destructive confirmation | Exact scope and consequence are shown before action | Delete, sign-out cleanup and account deletion |

## 8.1 Status Language

Prefer customer language:

- Saved on this device
- Waiting for internet
- Backing up
- Backed up
- Needs your attention
- Different versions found
- Notification access is off

Avoid exposing implementation language:

- mutation queued;
- cursor invalid;
- API 409;
- database version;
- outbox failure; or
- entity rejected.

---

# 9. First Screens to Design

The design team should not begin with every settings or authentication screen. Resolve the core product model first.

## Design Wave 1 — Product Foundation

1. Navigation shell and global Add action
2. Today
3. Calendar Month
4. Calendar Day/Agenda
5. Day Details
6. Date Converter
7. Planner Hub
8. Notes List
9. Settings Hub
10. Language and Calendar/Regional preferences

**Outcome:** The team agrees on date hierarchy, calendar-basis language, navigation, typography, spacing, status patterns and light/dark foundations.

## Design Wave 2 — Guest Core Flows

1. First launch and guest onboarding
2. Event create/edit, detail and recurrence
3. Reminder create/edit, detail, actions and notification permission
4. Daily, weekly, monthly and yearly Planner
5. Note editor and archived notes
6. Search and filters
7. Recently Deleted
8. Personal calendars, categories and bundled-content groups

**Outcome:** A guest can complete the full core product offline without placeholder journeys.

## Design Wave 3 — Account and Cloud

1. Registration and verification
2. Sign-in and password recovery
3. Guest import review, progress and result
4. Sync Center and pending changes
5. Devices and sessions
6. Account switching and sign-out data choices
7. Conflict Center, comparison and merge

**Outcome:** The same local-first experience extends to registered users without making the core product dependent on connectivity.

## Design Wave 4 — Trust, Recovery and Release

1. Full Resync recovery
2. Notification troubleshooting
3. Planner and note history
4. Privacy and consent
5. Account deletion
6. Local-data removal
7. Help, diagnostics, About and legal
8. Tablet layouts
9. Accessibility, localization and error-state completion

**Outcome:** Destructive, exceptional and support journeys are safe and production-ready.

---

# 10. Critical End-to-End Prototypes

At minimum, the interactive prototype shall cover these journeys.

## Journey 1 — First Useful Guest Session

```text
Launch
→ Select language
→ Understand dual calendar and guest mode
→ Configure calendar preference
→ Continue as guest
→ Reach Today
→ Open Calendar
→ Convert a date
```

## Journey 2 — Create an Ethiopian-Basis Recurring Event

```text
Calendar
→ Select Ethiopian date
→ Add Event
→ Choose Ethiopian calendar basis
→ Add yearly recurrence
→ Save locally
→ See it in Calendar and Today
```

## Journey 3 — Create a Reminder and Grant Notification Permission

```text
Today
→ Add Reminder
→ Set date/time
→ Enable notification
→ Read permission explanation
→ Accept or deny platform permission
→ Save reminder
→ See accurate notification state
```

## Journey 4 — Plan and Carry Forward

```text
Planner Hub
→ Weekly Planner
→ Add priorities and checklist
→ Complete an item
→ Open next week
→ Review carry-forward
→ Confirm selected items
```

## Journey 5 — Register Without Losing Guest Data

```text
Guest Settings
→ Create account
→ Verify email
→ Review guest-data inventory
→ Import
→ Review result
→ See sync status
```

## Journey 6 — Resolve a Note Conflict

```text
Conflict indicator
→ Conflict Center
→ Open note conflict
→ Compare local and synchronized versions
→ Merge or keep both
→ Confirm
→ See resolved item and sync state
```

## Journey 7 — Recover Deleted Content

```text
Delete reminder
→ Open Recently Deleted
→ Preview reminder
→ Restore
→ Rebuild eligible notification
→ Confirm restored reminder
```

## Journey 8 — Delete an Account Safely

```text
Privacy
→ Request account deletion
→ Review consequences
→ Re-authenticate
→ Confirm request
→ View pending status
→ Cancel within allowed period or complete local cleanup
```

---

# 11. Screen-Level Calendar Design Rules

Every screen containing a date shall follow these rules:

1. Display or retain the calendar basis explicitly.
2. Never use language selection to infer calendar basis.
3. Treat date-only values separately from timed values.
4. Do not shift an all-day Ethiopian or Gregorian date because of time-zone change.
5. Show the corresponding secondary-calendar date with lower visual emphasis, not ambiguous shorthand.
6. Preserve the originally selected calendar basis when editing.
7. Validate Pagume and leap-day rules in the picker, form message and recurrence summary.
8. Show the time zone for timed events where ambiguity is possible.
9. Use localized month and weekday names.
10. Do not rely only on color to differentiate Ethiopian and Gregorian values.

Recommended hierarchy example:

```text
Primary:   Hamle 17, 2018 EC
Secondary: 24 July 2026 GC
Weekday:   Friday
```

The actual localized wording and date order must be reviewed by fluent language and calendar specialists.

---

# 12. Localization Design Requirements

Each required screen and reusable component shall be designed and reviewed in:

- English (`en`);
- Amharic (`am`);
- Afaan Oromo (`om`); and
- Tigrinya (`ti`).

Design deliverables shall include:

- the longest expected labels in each language;
- narrow-phone and large-text variants;
- Ethiopic-font rendering proof;
- mixed Ethiopic/Latin search examples;
- plural and relative-date examples;
- localized error and permission messages;
- localized notification text examples;
- screen-reader labels; and
- approved calendar terminology.

Do not solve translation fit by using unreadably small text. Prefer:

- flexible containers;
- wrapping labels;
- full-screen forms instead of cramped sheets when necessary;
- concise approved translations;
- content prioritization; and
- progressive disclosure.

Machine translation shall not be treated as final product copy.

---

# 13. Accessibility Acceptance for Design

Before design handoff:

- primary touch targets shall be approximately 48 logical pixels where practical;
- normal text and meaningful icons shall meet approved contrast requirements;
- all icon-only controls shall have semantic labels and visible tooltips where appropriate;
- screen-reader order shall be documented for complex screens;
- list rows shall expose title, date, type and status as one understandable semantic unit;
- validation shall identify the affected field and how to correct it;
- status shall include text or icon plus accessible label, not color alone;
- selected/today/focused states in calendar grids shall remain distinguishable;
- 200% text scaling shall not hide essential actions on critical journeys;
- reduced motion shall not prevent understanding;
- dark mode shall be reviewed independently;
- destructive dialogs shall announce their title, consequence and actions; and
- custom date pickers shall be fully navigable with TalkBack and VoiceOver.

---

# 14. Usability Research Plan

This document includes desk research and requirements analysis. Before final visual approval, conduct moderated usability testing with representative customers.

## 14.1 Recommended Participants

Recruit 8–12 participants for the first round, including:

- primary Amharic, Afaan Oromo, Tigrinya and English users;
- users who primarily think in the Ethiopian calendar;
- users who primarily use the Gregorian calendar;
- at least two Ethiopians living outside Ethiopia;
- Android users on lower-cost or smaller devices;
- iPhone users;
- at least one screen-reader or large-text user where recruitment permits; and
- a mix of students, professionals, entrepreneurs and personal/family planners.

Avoid asking participants to select a profile type in the product. Participant diversity is for research, not for creating separate applications.

## 14.2 Core Research Tasks

Ask participants to:

1. identify today's Ethiopian and Gregorian dates;
2. find a specific Ethiopian date and its Gregorian equivalent;
3. create an all-day Ethiopian-basis annual event;
4. create a reminder, deny notification permission and confirm the reminder still exists;
5. create and complete a weekly-planner item;
6. carry an unfinished item into the next week;
7. write and later find a mixed-script note;
8. recover a deleted reminder;
9. explain whether a guest's data is cloud-backed;
10. register and decide which guest data to import;
11. explain the difference between Saved on this device and Backed up; and
12. resolve a note conflict without losing either version.

## 14.3 Evaluation Measures

Capture:

- task completion;
- incorrect calendar-basis choices;
- date-conversion errors;
- time to complete;
- backtracking;
- abandoned flows;
- permission comprehension;
- guest-storage comprehension;
- sync-status comprehension;
- destructive-action comprehension;
- Single Ease Question score after important tasks;
- accessibility barriers; and
- participant language and terminology feedback.

## 14.4 Release-Critical Research Findings

The design must be revised before release if participants commonly:

- mistake Ethiopian dates for Gregorian dates or the reverse;
- believe guest data is cloud-backed;
- believe locally saved data has already synchronized;
- cannot find Today, Calendar, Planner or Notes;
- cannot create an event or reminder offline;
- lose track of whether recurrence uses Ethiopian or Gregorian rules;
- think denying notification permission deletes a reminder;
- cannot understand a destructive data-removal action;
- cannot recover both sides of a conflict; or
- encounter clipped or unreadable critical controls in any supported language.

---

# 15. Figma and Design-Handoff Deliverables

The completed design package should contain:

1. approved information architecture and navigation map;
2. color, typography, spacing, icon and elevation tokens;
3. dual-calendar date hierarchy and calendar-state definitions;
4. light and dark themes;
5. compact phone and representative tablet layouts;
6. all P0–P3 screen templates in this inventory;
7. reusable sheets, dialogs, banners, chips and empty states;
8. populated, empty, offline, pending, conflict, error and permission variants;
9. four-language fit proof for critical journeys;
10. large-text and screen-reader annotations;
11. clickable prototypes for the eight critical journeys;
12. platform-specific permission and system-settings handoff;
13. component behavior and validation notes;
14. destructive-action copy;
15. guest/account/sync status copy;
16. notification copy and privacy behavior;
17. acceptance checklist mapped to the Flutter specification; and
18. usability findings and revision decisions.

---

# 16. Explicitly Deferred Screens

Do not design or implement these as Phase 1 customer-app screens:

- subscription plans;
- upgrade or paywall;
- payment methods;
- invoices or refunds;
- organization/workspace selection;
- teams, seats or invitations;
- role or permission administration;
- admin portal;
- backend calendar-pack management;
- backend translation management;
- remote content publication;
- content editor;
- server notification inbox;
- shared calendars;
- collaborative planner;
- tasks with assignees or dependencies;
- KPI or productivity dashboards;
- file management;
- Print Studio;
- PDF/export workflows;
- advanced analytics;
- public profile;
- home-screen widgets; or
- profile/template marketplace.

---

# 17. Research References

- [Material Design 3 — Navigation bar](https://m3.material.io/components/navigation-bar)
- [Material Design 3 — Top app bar](https://m3.material.io/components/app-bars/overview)
- [Material Design 3 — Floating action button](https://m3.material.io/components/floating-action-button/guidelines)
- [Material Design 3 — Search](https://m3.material.io/components/search/overview)
- [Material Design 3 — Flutter adaptive layouts](https://m3.material.io/develop/flutter)
- [Android Developers — Build an offline-first app](https://developer.android.com/topic/architecture/data-layer/offline-first)
- [Android Developers — Guide to app architecture](https://developer.android.com/topic/architecture)
- [Android Developers — Notification runtime permission](https://developer.android.com/develop/ui/compose/notifications/notification-permission)
- [Android Developers — Request runtime permissions](https://developer.android.com/training/permissions/requesting)
- [Android Developers — Deep links](https://developer.android.com/training/app-links/create-deeplinks)
- [Apple Human Interface Guidelines — Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- [Apple Human Interface Guidelines — Notifications](https://developer.apple.com/design/human-interface-guidelines/notifications)
- [Apple Human Interface Guidelines — Search](https://developer.apple.com/design/human-interface-guidelines/searching)
- [Apple Human Interface Guidelines — Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- [Apple Human Interface Guidelines — Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy)
- [Apple Support — Change Calendar views on iPhone](https://support.apple.com/guide/iphone/change-how-you-view-events-iphfd1054569/ios)
- [Apple Support — Create and edit Calendar events](https://support.apple.com/guide/iphone/create-and-edit-events-in-calendar-iph3d110f84/ios)
- [Apple Support — Reminders Smart Lists](https://support.apple.com/guide/iphone/use-smart-lists-iphe882772ed/ios)
- [Google Calendar Help — Change Calendar view](https://support.google.com/calendar/answer/6110849)
- [Google Calendar Help — Create an event on Android](https://support.google.com/calendar/answer/72143)
- [Google Calendar Help — Create recurring events](https://support.google.com/calendar/answer/37115)
- [W3C — Understanding WCAG 2.2 Target Size Minimum](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum)
- [W3C — Understanding WCAG Contrast Minimum](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)

---

# 18. Final Recommendation

Design Phase 1 as one coherent offline personal planner, not as separate calendar, reminder, planner and notes products.

The product should feel simple in daily use:

```text
Open Today
→ understand the date and day
→ capture something quickly
→ plan or review
→ trust that it is saved locally
→ optionally back it up after registration
```

The complexity of recurrence, localization, synchronization, conflict recovery and privacy should remain available when needed without dominating the guest user's everyday experience.
