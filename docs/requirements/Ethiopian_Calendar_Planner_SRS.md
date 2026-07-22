# Software Requirements Specification

## Ethiopian Calendar, Reminder, Simple Planner and Custom Print Flutter App

**Organization:** Walia Nexus  
**Document code:** WN-PLANNER-FLUTTER-SRS  
**Version:** 2.0  
**Status:** Final implementation baseline for approval  
**Date:** 22 July 2026  
**Classification:** Confidential working document  
**Primary delivery:** Flutter customer application for Android and iOS  

---

## Document Control

| Field | Detail |
|---|---|
| Document | Software Requirements Specification |
| Product | Ethiopian Calendar, Reminder, Simple Planner and Custom Print SaaS Platform |
| Application covered | Customer-facing Flutter Planner App |
| Mandatory platforms | Android and iOS |
| Deferred platform | Flutter Web/PWA, subject to separate approval |
| External applications | Next.js public website and Next.js administration portal |
| External services | NestJS API, background worker, PostgreSQL, Redis/BullMQ, S3-compatible storage, notification, email and payment providers |
| Client persistence | Drift-managed SQLite |
| State management | Riverpod |
| Network client | Dio |
| Navigation | go_router |
| Synchronization | Custom transactional outbox |
| Final PDF generation | Backend worker |
| Languages | English and Amharic |

## Revision History

| Version | Date | Description | Owner |
|---|---|---|---|
| 1.0 | 11 July 2026 | Original implementation-ready platform SRS using a Web/PWA-first customer baseline | Product Owner |
| 1.1 | 22 July 2026 | Flutter functional requirements and offline-first client architecture refined | Product/Architecture |
| 2.0 | 22 July 2026 | Consolidated clean Flutter App SRS for Claude-assisted implementation | Walia Nexus |

## Supersession Statement

This document supersedes only the original SRS statements that defined the customer application as Web/PWA-first and deferred Android and iOS. The product behavior, Ethiopian-calendar rules, recurrence rules, privacy principles, planner simplicity, print requirements, phased delivery, testing expectations and exclusions remain applicable unless this document expressly changes them.

The approved application split is:

| Application or service | Technology | Responsibility |
|---|---|---|
| Customer Planner App | Flutter | Android and iOS personal calendar, reminders, planner, notes, offline use, synchronization, print and subscriptions |
| Public Website | Next.js | Marketing, pricing, product information, help and legal content |
| Administration Portal | Next.js | Users, content, calendar packs, templates, payments, jobs, support and audit |
| Backend API | NestJS | Authentication, authorization, validation, business rules, synchronization and integrations |
| Background Worker | NestJS/Node + BullMQ | Notifications, PDF generation, exports, retries, cleanup and expiry |
| Server Database | PostgreSQL + Drizzle | Authoritative server data |
| Queue/Cache | Redis + BullMQ | Background jobs, locks and retry |
| Object Storage | S3/MinIO-compatible | Attachments, PDFs and exports |

## Approval Table

| Role | Approval responsibility | Status |
|---|---|---|
| Executive Sponsor | Product direction and funding | Pending |
| Product Owner | Scope, priorities, business rules and acceptance | Pending |
| Business/System Analyst | Completeness and traceability | Prepared |
| Solution Architect | Architecture feasibility and integrity | Pending |
| Flutter Engineering Lead | Mobile delivery readiness | Pending |
| Backend Engineering Lead | API and authority alignment | Pending |
| QA Lead | Testability and release gates | Pending |
| Security/Privacy Reviewer | Security, privacy and retention | Pending |
| UI/UX Lead | Usability, accessibility and bilingual design | Pending |

---

# Part I — Product Context and Architecture

## 1. Introduction

This SRS defines the complete functional and non-functional baseline for the customer-facing Flutter Planner App of the Ethiopian Calendar, Reminder, Simple Planner and Custom Print SaaS Platform.

The app is deliberately calendar-centered and planner-oriented. It shall help users understand Ethiopian and Gregorian dates, remember important matters, plan days, weeks, months and years simply, keep private notes and create personalized print-ready planners.

The product shall not become project-management, workforce-management, HR, payroll, employee-performance, accounting, e-signature or institutional workflow software.

## 2. Purpose

This SRS shall:

- establish one implementation baseline for product, design, Flutter engineering and QA;
- define the boundary between the Flutter app and external systems;
- specify testable functional and quality requirements;
- define Ethiopian calendar, recurrence, reminder, offline, synchronization and print behavior;
- preserve user content during offline use, retries, conflicts and migrations;
- support estimation, backlog creation, design, implementation and acceptance;
- provide traceability through permanent requirement identifiers; and
- control scope so calendar accuracy, reminder reliability, data safety and print correctness take priority over feature breadth.

## 3. Scope

Version 1 of the Flutter Planner App includes:

- guest mode and registered accounts;
- Ethiopian and Gregorian calendar support;
- bidirectional date conversion;
- Today, Calendar, Planner and More navigation;
- events and recurrence;
- reminders and notification behavior;
- yearly, monthly, weekly and daily planning;
- private notes;
- profiles and templates;
- English and Amharic;
- offline-first local operation;
- safe synchronization and conflict recovery;
- search and Recently Deleted;
- Print Studio and secure PDF access;
- subscriptions, payments and entitlements;
- personal-data export and account deletion; and
- feature-flagged public events, polls and event questions as a controlled extension.

Android and iOS are mandatory Version 1 production platforms. Flutter Web/PWA is not a mandatory Version 1 deliverable.

## 4. Intended Audience

This document is intended for:

- Product Owner;
- business and system analysts;
- UI/UX designers;
- solution architect;
- Flutter engineers;
- backend engineers responsible for API contracts;
- QA and automation engineers;
- security and privacy reviewers;
- DevOps and release engineers;
- support and operations teams; and
- implementation partners, including Claude Code or another coding agent operating under human approval.

Requirement IDs are the primary traceability keys. Technical documents may refine implementation details but shall not silently change approved behavior.

## 5. Document Conventions

- **Shall**: mandatory.
- **Should**: recommended and deferrable only with approval.
- **May**: optional or future.
- **P0**: required for commercially complete Version 1.
- **P1**: important after the core is stable.
- **EXT**: controlled public-event extension.
- Functional requirement: `DOMAIN-FR-NNN`.
- Non-functional requirement: `DOMAIN-NFR-NNN`.
- Business rule: `BR-DOMAIN-NNN`.
- Acceptance criterion: `AC-DOMAIN-NNN`.
- Use case: `UC-DOMAIN-NNN`.
- Architecture decision: `ADR-NNN`.

## 6. Definitions and Abbreviations

| Term | Definition |
|---|---|
| Flutter Planner App | Customer-facing Android and iOS application covered by this SRS |
| Event | Calendar item occupying a date or optional time interval |
| Reminder | Item the user wants to remember; it need not occupy calendar time |
| Planner entry | Focus, priority, checklist item, reflection or free-form entry associated with a planning period |
| Calendar basis | Ethiopian or Gregorian calendar governing the original date and recurrence rule |
| Occurrence | One generated instance of a recurring event or reminder |
| Series exception | Changed, skipped or deleted occurrence that differs from its source recurrence series |
| Calendar pack | Governed collection of holidays, observances or specialized dates |
| Canonical instant | Timezone-aware timestamp representing a timed occurrence |
| Date-only value | Calendar date stored without timezone shifting |
| Client source of truth | Drift-managed SQLite database from which Flutter business screens render |
| Server authority | Backend-confirmed state for persisted business rules, entitlements, payment and server-governed content |
| Outbox operation | Durable local record representing a pending client write |
| Idempotency key | Stable operation identifier used to prevent duplicate processing |
| Pull cursor | Server-issued position used for incremental synchronization |
| Tombstone | Deletion record that prevents stale clients from resurrecting deleted content |
| Conflict | Situation where local and server versions cannot be safely merged automatically |
| Provisional notification | Local offline notification scheduled before backend confirmation |
| PII | Personally identifiable information |
| WCAG | Web Content Accessibility Guidelines, used as an accessibility reference |
| RPO | Recovery Point Objective |
| RTO | Recovery Time Objective |

## 7. References and Source Hierarchy

The source hierarchy is:

1. this Flutter App SRS;
2. approved Product Owner decisions;
3. approved API contracts and ADRs;
4. the original Ethiopian Calendar & Planner Platform SRS for unchanged platform behavior;
5. technical implementation plans.

Supporting references include:

- Ethiopian Calendar & Planner Platform Software Requirements Specification, Version 1.0, 11 July 2026;
- Walia Nexus Flutter Planner App Clean Functional Requirements;
- approved product direction and phase decisions;
- WCAG 2.2 Level AA principles for critical journeys; and
- applicable privacy, consumer, payment and electronic-service requirements, subject to legal review.

## 8. Product Overview

The app provides one personal planning foundation for:

- personal users;
- students;
- professionals;
- entrepreneurs;
- government employees using personal templates;
- families using one-person family planning; and
- Ethiopian diaspora users.

Profiles change starter templates, examples, terminology, suggested sections, categories and calendar-pack recommendations. They do not create separate products or incompatible data models.

The primary user flow is:

1. open the app;
2. view today’s Ethiopian and Gregorian dates;
3. review events and reminders;
4. add an event, reminder or note;
5. plan the day, week, month or year;
6. continue working with or without connectivity;
7. synchronize safely when online; and
8. generate a customized print-ready planner where needed.

## 9. Product Perspective

The Flutter Planner App is one component of a broader SaaS platform. It communicates with a versioned backend API and external providers but owns the immediate offline mobile experience.

The app shall not directly access PostgreSQL, Redis, BullMQ or object-storage credentials. All remote business operations shall use documented API contracts.

The backend remains authoritative for:

- account authorization;
- server-side validation;
- ownership;
- synchronization acknowledgements;
- persisted server versions;
- calendar-pack publication;
- notification schedule after synchronization;
- payment verification;
- subscription entitlements;
- public-event publication;
- poll acceptance;
- public-question moderation;
- final PDF generation; and
- authorized file access.

## 10. Product Objectives

| ID | Objective | Primary SRS response |
|---|---|---|
| OBJ-01 | Deliver trustworthy Ethiopian and Gregorian date handling | Calendar, conversion and recurrence requirements plus reference tests |
| OBJ-02 | Enable fast capture | Quick Add and minimal event/reminder entry |
| OBJ-03 | Provide reliable reminders | Reminder, notification, retry and reconciliation requirements |
| OBJ-04 | Preserve planner simplicity | Simple planner and explicit exclusions |
| OBJ-05 | Support Ethiopian language and context | English/Amharic and governed calendar packs |
| OBJ-06 | Enable personalized print | Print Studio, privacy review and server-generated PDFs |
| OBJ-07 | Operate under limited connectivity | Drift persistence, outbox, sync and conflict recovery |
| OBJ-08 | Monetize premium customization safely | Backend-confirmed plans, payments and entitlements |
| OBJ-09 | Protect private content | Privacy, storage, monitoring and account-isolation controls |
| OBJ-10 | Support maintainable production delivery | Clean architecture, strict testing, CI and phased gates |

## 11. System Context

```text
Flutter Planner App
    |
    | HTTPS, versioned API, authenticated requests
    v
NestJS Backend API
    |
    +--> PostgreSQL / Drizzle
    +--> Redis / BullMQ
    +--> S3 / MinIO-compatible object storage
    +--> Notification provider
    +--> Email provider
    +--> Payment provider
    |
    v
NestJS Background Worker
    +--> Reminder and notification jobs
    +--> PDF and export generation
    +--> Retry, cleanup and expiry
```

The app shall remain useful for supported local functions when the backend or network is unavailable.

## 12. Stakeholders

| Stakeholder | Interest |
|---|---|
| Product Owner | Scope, value, priorities and acceptance |
| End users | Correct dates, reliable reminders, simple planning, privacy and recovery |
| Government-template users | Personal office-planning templates without institutional workflow |
| Content/Calendar Manager | Accurate and governed calendar packs, through external admin tools |
| Customer Support | Safe support without default private-content access |
| Finance/Commercial | Correct plan, payment and entitlement state |
| Engineering and Operations | Maintainable delivery, monitoring, recovery and version compatibility |
| Security/Privacy Reviewer | Data minimization, isolation, storage, retention and incident response |
| QA | Testable requirements and release gates |
| UI/UX | Calm, accessible, bilingual and culturally relevant experience |

## 13. User Classes

| User class | Characteristics | App permissions |
|---|---|---|
| Guest | Unregistered user evaluating the app | Dates, conversion and approved local-only functions |
| Registered Free User | Account holder using essential functionality | Basic events, reminders, planner, notes, synchronization and limited print |
| Premium User | Paying personal user | Expanded limits, templates, history, storage and print capabilities |
| Professional/Government Template User | Paying personal user needing professional or government-oriented templates | Personal institution fields, meeting/reporting templates and approved branding |
| Extension Participant | User accessing enabled public events, polls or questions | Backend-authorized public participation |

The app shall not expose administrative roles or administrative screens.

## 14. Operating Environment

Mandatory environments:

- supported Android versions defined by release policy;
- supported iOS versions defined by release policy;
- common phone sizes;
- supported tablets;
- English and Amharic;
- maintained IANA timezone database;
- intermittent, slow and unavailable networks;
- development, test, staging and production configurations.

External server environment:

- HTTPS;
- NestJS API and worker;
- PostgreSQL;
- Redis/BullMQ;
- S3-compatible object storage;
- notification, email and payment providers.

## 15. Design and Implementation Constraints

1. The customer app shall use Flutter for Android and iOS.
2. Drift-managed SQLite shall be the immediate client-side source of truth.
3. Riverpod shall provide state management and dependency injection.
4. Dio shall be isolated behind typed remote data sources.
5. go_router shall provide app navigation.
6. Offline writes shall use a durable transactional outbox.
7. Client-generated identifiers shall support offline creation.
8. Business screens shall render synchronized data from Drift streams.
9. Basic event and reminder entry shall require no more than title, date and optional time.
10. Recurrence shall preserve the calendar basis.
11. Private notes, reflections and selected print content shall remain private by default.
12. Institution and job fields are personal profile/print fields, not organizational hierarchy.
13. Final PDFs shall be generated by the backend worker.
14. Payment and entitlement shall be backend-authoritative.
15. Workmanager shall be best effort and shall not be an exact reminder scheduler.
16. No second local business database or second state-management framework shall be introduced.
17. P0 scope shall prioritize calendar correctness, reminder reliability, synchronization safety and print privacy/correctness.

## 16. Assumptions and Dependencies

| ID | Assumption or dependency | Effect |
|---|---|---|
| AD-01 | Authoritative Ethiopian/Gregorian reference dates are available | Required for calendar acceptance |
| AD-02 | The backend exposes versioned mobile-compatible APIs | Required before remote implementation |
| AD-03 | Notification providers meet target-market needs | Affects reminder delivery and provider selection |
| AD-04 | Native operating systems permit acceptable local notification behavior | Requires capability testing and honest user messaging |
| AD-05 | Amharic-capable fonts can be used in UI and embedded in PDFs | Required for localization and print acceptance |
| AD-06 | A suitable payment provider or native-store flow is approved | Required for commercialization |
| AD-07 | Legal review approves privacy, retention, subscription and public-content policies | Required before launch |
| AD-08 | The selected stable Flutter and package versions are mutually compatible | Required before Phase 0 code |
| AD-09 | Product Owner resolves open business limits and retention decisions | Required for affected phase acceptance |
| AD-10 | Screen designs will be approved per phase | Required for final UI acceptance |

## 17. High-Level Client Architecture

Use feature-first, offline-first Clean MVVM principles.

```text
Presentation
    -> Application
        -> Domain

Data
    -> Domain
```

Complex features may contain Presentation, Application, Domain and Data layers. Simple features may use fewer folders when dependency direction and testability remain clear.

```text
Flutter Widgets
    |
Riverpod Controllers / ViewModels
    |
Application Use Cases
    |
Repository Interfaces
    |
Repository Implementations
    +--> Drift DAOs / SQLite
    +--> Dio Remote Data Sources
    |
Custom Sync Coordinator
    |
NestJS Sync API
```

Domain code shall not import Flutter, Drift, Dio, Firebase or platform plugins.

## 18. Application Components

| Component | Responsibility |
|---|---|
| App Shell | Bootstrap, environment, theme, localization, lifecycle and routing |
| Today | Current dates, events, reminders, focus, priorities and quick capture |
| Calendar | Ethiopian/Gregorian views, calendar packs and navigation |
| Events | Event CRUD, recurrence and exceptions |
| Reminders | Reminder CRUD, action states and notification coordination |
| Planner | Daily, weekly, monthly and yearly personal planning |
| Notes | Private notes, autosave, links, archive and conflict recovery |
| Profiles/Templates | Starter configuration and optional structures |
| Search | Offline search across authorized local content |
| Synchronization | Outbox, push, pull, cursor, retry, conflict and tombstone behavior |
| Print Studio | Configuration, privacy review, generation status, preview and download |
| Subscriptions | Plans, payments, entitlements and feature gating |
| Privacy/Account | Export, deletion, logout and local cleanup |
| Extension Modules | Public events, polls and questions under feature flags |
| Ethiopian Calendar Core | Pure-Dart conversion, date arithmetic and recurrence |
| Local Database | Drift tables, DAOs, migrations and reactive queries |
| Platform Adapters | Notifications, files, secure storage, deep links and purchases |

## 19. External Interfaces

### 19.1 User Interface

The app shall use:

- Today;
- Calendar;
- Planner;
- More; and
- a persistent Quick Add action for Event, Reminder and Note.

The app shall support responsive mobile/tablet layouts, touch, screen readers, large text, light/dark appearance and English/Amharic labels.

### 19.2 API Interface

The API shall expose documented versioned HTTPS endpoints with:

- authentication;
- authorization;
- validation;
- pagination or cursors;
- consistent error envelopes;
- correlation IDs;
- idempotency keys;
- server versions;
- retry classification; and
- no exposure of database implementation details.

### 19.3 Provider Interfaces

| Interface | Required behavior from the app perspective |
|---|---|
| Push notifications | Token lifecycle, permission, foreground display, routing and invalid-token handling |
| Local notifications | Provisional offline scheduling, cancellation and reconciliation |
| Email | Deep links and server-generated communication, where approved |
| Payment | Native purchase or hosted checkout initiation and verified return handling |
| Object storage | Backend-authorized upload/download, type and size limits, expiring access |
| PDF | Backend job submission, status polling/push, secure preview/download |
| Deep links | Verification, password reset, notification routing and payment returns |
| Monitoring | Privacy-safe crash and performance reporting through an abstraction |

## 20. Functional Requirements Overview

Functional requirements are grouped by domain. P0 requirements are mandatory for commercially complete Version 1. P1 requirements are important after core stability. EXT requirements are controlled extension scope and shall not delay the core product.

# Part II — Functional Requirements

## 21. Application Shell and Navigation

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

## 22. Guest Use, Authentication and Account Management

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

## 23. Preferences, Language and Appearance

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

## 24. Localization

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| LOC-FR-001 | Navigation, controls, authentication, validation and common system messages shall be available in English and Amharic. | P0 | 1A |
| LOC-FR-002 | Event, reminder, planner, note, print and subscription interfaces shall be available in English and Amharic before their respective phase is accepted. | P0 | 1B–1D |
| LOC-FR-003 | The app shall support mixed English and Amharic user content without corrupting storage, search or layout. | P0 | 1C |
| LOC-FR-004 | User-entered content shall not be automatically translated without explicit user action and an approved feature. | P0 | All |
| LOC-FR-005 | Date, number and time formatting shall follow the selected language and calendar presentation where applicable. | P0 | 1A |

---

## 25. Ethiopian and Gregorian Calendar

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

## 26. Date Conversion

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| DATE-FR-001 | The user shall convert a valid Ethiopian date to its Gregorian equivalent. | P0 | 1A |
| DATE-FR-002 | The user shall convert a valid Gregorian date to its Ethiopian equivalent. | P0 | 1A |
| DATE-FR-003 | The app shall reject invalid Ethiopian and Gregorian dates with localized field-level feedback. | P0 | 1A |
| DATE-FR-004 | The app shall reject dates outside the supported range with a clear message. | P0 | 1A |
| DATE-FR-005 | The user shall copy or share a formatted conversion result. | P0 | 1A |
| DATE-FR-006 | Conversion shall remain available offline. | P0 | 1A |

---

## 27. Calendar Packs, Holidays and Observances

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

## 28. Today Experience

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

## 29. Events

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

## 30. Recurrence and Series Exceptions

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

## 31. Reminders

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

## 32. Notifications

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

## 33. Simple Planner

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

## 34. Private Notes

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

## 35. Profiles and Templates

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

## 36. Search

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

## 37. Offline Operation and Synchronization

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

## 38. Conflict Resolution and Recovery

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

## 39. Recently Deleted and Permanent Deletion

| ID | Functional requirement | Priority | Phase |
|---|---|---:|---:|
| DEL-FR-001 | Supported events, reminders, notes and planner content shall move to Recently Deleted before final purge. | P0 | 1B/1C |
| DEL-FR-002 | The user shall restore an eligible item during the approved recovery period. | P0 | 1B/1C |
| DEL-FR-003 | The user shall permanently delete an eligible item after an explicit warning. | P0 | 1C |
| DEL-FR-004 | Permanent deletion shall propagate to eligible synchronized devices. | P0 | 1C |
| DEL-FR-005 | A stale offline device shall not silently restore a permanently deleted item. | P0 | 1C |
| DEL-FR-006 | Deleting a record shall clean up obsolete notification schedules and eligible cached files. | P0 | 1C/1D |

---

## 40. Files and Images

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

## 41. Custom Print Studio

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

## 42. Subscriptions, Payments and Entitlements

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

## 43. Export, Privacy and Account Deletion

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

## 44. Public Events Extension

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

## 45. Polls Extension

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

## 46. Public Event Questions Extension

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

## 47. Accessibility and Usability

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

## 48. Errors, Support and Diagnostics

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

# Part III — Quality and Operational Requirements

## 49. Security Requirements

| ID | Requirement | Priority |
|---|---|---:|
| SEC-NFR-001 | All production communication shall use HTTPS with approved TLS configuration. | P0 |
| SEC-NFR-002 | Native authentication tokens shall use approved secure storage and defined expiry/revocation behavior. | P0 |
| SEC-NFR-003 | Tokens, passwords, authorization headers and payment secrets shall be redacted from logs and monitoring. | P0 |
| SEC-NFR-004 | The app shall validate local input before persistence and validate remote payload shape before applying it. | P0 |
| SEC-NFR-005 | The backend shall verify ownership for every user-owned remote record; the app shall not rely on hidden UI as authorization. | P0 |
| SEC-NFR-006 | Guest data and authenticated-account data shall be isolated. | P0 |
| SEC-NFR-007 | Cross-account local-data leakage tests shall be mandatory. | P0 |
| SEC-NFR-008 | Deep links shall validate scheme, host, path, state and expected action before execution. | P0 |
| SEC-NFR-009 | Payment-return screens shall not grant entitlement without backend verification. | P0 |
| SEC-NFR-010 | Selected files shall be validated by approved type, size and metadata before upload. | P0 |
| SEC-NFR-011 | Object-storage access shall use backend-authorized, time-limited links. | P0 |
| SEC-NFR-012 | Secrets shall not be committed to source control. | P0 |
| SEC-NFR-013 | Dependencies and build artifacts shall be scanned according to release policy. | P0 |
| SEC-NFR-014 | Security-relevant local events shall be recorded without private content. | P0 |
| SEC-NFR-015 | Secure logout, revoked-session behavior and account-deletion cleanup shall be explicitly implemented and tested. | P0 |
| SEC-NFR-016 | Full local database encryption shall require a separate ADR and compatibility proof. | P0 |
| SEC-NFR-017 | The app shall never claim that secure key-value storage encrypts the complete Drift database. | P0 |
| SEC-NFR-018 | A documented incident-response and vulnerability-management process shall exist before production. | P0 |

## 50. Privacy Requirements

| ID | Requirement | Priority |
|---|---|---:|
| PRIV-NFR-001 | Notes, planner reflections, private events and unpublished questions shall be private by default. | P0 |
| PRIV-NFR-002 | Private content shall be excluded from print unless explicitly selected during privacy review. | P0 |
| PRIV-NFR-003 | The app shall collect only information necessary for declared functions. | P0 |
| PRIV-NFR-004 | Notification, analytics and marketing choices shall be explained and consented to where required. | P0 |
| PRIV-NFR-005 | Private content shall not be included in logs, crash reports, analytics or support diagnostics. | P0 |
| PRIV-NFR-006 | Guest-local data limitations shall be explained before registration is deferred. | P0 |
| PRIV-NFR-007 | Export and account deletion shall follow identity verification and approved retention rules. | P0 |
| PRIV-NFR-008 | Generated files shall expire according to policy and be deletable from the device. | P0 |
| PRIV-NFR-009 | Private planner content shall not be sold or used for advertising profiles. | P0 |
| PRIV-NFR-010 | Public poll and question data stored locally shall follow approved privacy and retention rules. | EXT |
| PRIV-NFR-011 | Account deletion shall remove or render inaccessible credentials, local records, notification mappings and cached private files according to policy. | P0 |
| PRIV-NFR-012 | Signing out shall not silently destroy pending work. | P0 |

## 51. Accessibility Requirements

| ID | Requirement | Priority |
|---|---|---:|
| ACC-NFR-001 | Critical journeys shall target WCAG 2.2 AA-equivalent behavior. | P0 |
| ACC-NFR-002 | Interactive controls shall expose meaningful semantics and labels. | P0 |
| ACC-NFR-003 | Forms shall provide labels, instructions and associated errors. | P0 |
| ACC-NFR-004 | Status shall not be communicated by color alone. | P0 |
| ACC-NFR-005 | Text and controls shall meet approved contrast and scaling requirements. | P0 |
| ACC-NFR-006 | Touch targets shall meet approved mobile size and spacing. | P0 |
| ACC-NFR-007 | Content shall remain usable with large text and supported screen sizes. | P0 |
| ACC-NFR-008 | Motion shall respect reduced-motion preference where applicable. | P0 |
| ACC-NFR-009 | Amharic text shall remain legible, unclipped and correctly announced where assistive technology supports it. | P0 |
| ACC-NFR-010 | Focus order shall be logical for keyboard and switch access where applicable. | P0 |
| ACC-NFR-011 | PDF preview and generated PDFs should preserve selectable text and logical reading order where practical. | P1 |

## 52. Performance Requirements

Targets apply to representative supported devices under an approved test profile.

| ID | Requirement | Target | Priority |
|---|---|---|---:|
| PERF-NFR-001 | Cold startup to usable locally available screen | ≤ 3 seconds on representative supported device | P0 |
| PERF-NFR-002 | Cached Today first meaningful render | ≤ 2.5 seconds | P0 |
| PERF-NFR-003 | Calendar month navigation with local data | ≤ 300 ms perceived response | P0 |
| PERF-NFR-004 | Local date conversion | Immediate user-perceived response; benchmark recorded | P0 |
| PERF-NFR-005 | Local event/reminder save confirmation | ≤ 500 ms perceived confirmation | P0 |
| PERF-NFR-006 | Planner/note local autosave confirmation | ≤ 500 ms perceived confirmation | P0 |
| PERF-NFR-007 | Standard local search | ≤ 1.5 seconds for approved dataset | P0 |
| PERF-NFR-008 | Date-range queries | Indexed and bounded; no full-table watch for narrow screens | P0 |
| PERF-NFR-009 | Standard print-request acknowledgement | ≤ 2 seconds excluding network latency and backend queue | P0 |
| PERF-NFR-010 | Large local dataset | Core journeys tested with at least 10,000 calendar-related records | P0 |
| PERF-NFR-011 | Outbox backlog recovery | Bounded batching without UI lockup | P0 |
| PERF-NFR-012 | Memory | No sustained unbounded growth during calendar navigation or sync | P0 |

## 53. Availability, Reliability and Scalability Requirements

| ID | Requirement | Target or behavior | Priority |
|---|---|---|---:|
| REL-NFR-001 | Offline local availability | Calendar, planner, notes and pending local records remain usable for supported actions | P0 |
| REL-NFR-002 | Calendar correctness | No known Severity 1 or 2 correctness defect at launch | P0 |
| REL-NFR-003 | Duplicate operations | Retried writes shall not create duplicate business records/actions | P0 |
| REL-NFR-004 | Notification duplicate rate caused by app/platform | Approved target; original platform target < 0.1% | P0 |
| REL-NFR-005 | Graceful degradation | Local calendar/planning remain available when providers fail | P0 |
| REL-NFR-006 | Crash recovery | Accepted local work survives app termination and restart | P0 |
| REL-NFR-007 | Long offline period | Local data remains recoverable and queued under approved limits | P0 |
| REL-NFR-008 | Schema upgrades | Pending outbox records and soft-deleted records survive supported migrations | P0 |
| REL-NFR-009 | Background execution | Correctness shall not depend on Workmanager running | P0 |
| SCL-NFR-001 | Local data growth | Queries and indexes shall be tested against approved multi-year datasets | P0 |
| SCL-NFR-002 | Recurrence | Occurrence generation shall be bounded by visible or approved horizons | P0 |

## 54. Logging, Monitoring and Audit Requirements

| ID | Requirement | Priority |
|---|---|---:|
| LOG-NFR-001 | App diagnostics shall include timestamp, severity, environment, app version and correlation ID where available. | P0 |
| LOG-NFR-002 | Logs shall mask credentials and private content. | P0 |
| MON-NFR-001 | Monitoring shall capture crash, startup, migration, API, sync and print-download failures without private content. | P0 |
| MON-NFR-002 | Sync monitoring shall distinguish pending, processing, applied, retryable, rejected and conflict outcomes. | P0 |
| MON-NFR-003 | Notification monitoring shall capture token registration and scheduling failures without reminder text. | P0 |
| MON-NFR-004 | PDF monitoring shall display queued, processing, completed, failed, expired and cancelled states received from the backend. | P0 |
| MON-NFR-005 | Outbox backlog and conflict counts may be recorded as privacy-safe metrics. | P0 |
| MON-NFR-006 | Alert thresholds and ownership shall be documented before production. | P0 |
| AUD-NFR-001 | User-visible conflict resolution and destructive actions shall retain sufficient local/server audit metadata where approved. | P0 |

## 55. Backup, Recovery and Migration Requirements

| ID | Requirement | Priority |
|---|---|---:|
| RECOV-NFR-001 | The app shall rely on local durability for unsynchronized records and backend backup for synchronized records. | P0 |
| RECOV-NFR-002 | Recently Deleted shall support user-level recovery for the approved period. | P0 |
| RECOV-NFR-003 | Database migrations shall be versioned and tested from every supported prior version. | P0 |
| RECOV-NFR-004 | Migration tests shall include pending outbox records, tombstones and soft-deleted content. | P0 |
| RECOV-NFR-005 | A migration failure shall never be handled by silently wiping the database. | P0 |
| RECOV-NFR-006 | Unrecoverable migration problems shall preserve the original database or an approved recovery copy. | P0 |
| RECOV-NFR-007 | Failed sync shall retain recoverable local records and safe diagnostic references. | P0 |
| RECOV-NFR-008 | Failed PDF generation shall preserve the print configuration for retry. | P0 |
| RECOV-NFR-009 | Account deletion and logout shall apply approved local cache and secure-storage cleanup rules. | P0 |

## 56. Error-Handling Requirements

| ID | Requirement | Priority |
|---|---|---:|
| ERR-FR-001 | User-facing errors shall explain the problem and next safe action without exposing internal details. | P0 |
| ERR-FR-002 | Validation errors shall identify the affected field in English and Amharic. | P0 |
| ERR-FR-003 | Offline/network errors shall not discard a valid local change. | P0 |
| ERR-FR-004 | Calendar errors shall identify an invalid date or unsupported range. | P0 |
| ERR-FR-005 | Sync conflicts shall use the conflict-recovery flow, not a generic failure. | P0 |
| ERR-FR-006 | Storage or migration failure shall never trigger silent database deletion. | P0 |
| ERR-FR-007 | Notification, PDF, payment and upload failures shall expose safe retry or support actions. | P0 |
| ERR-FR-008 | Unexpected remote errors shall provide a safe reference/correlation code where available. | P0 |
| ERR-FR-009 | Raw stack traces and provider messages shall not be the primary user message. | P0 |
| ERR-FR-010 | Rejected synchronized records shall remain visible and corrective where possible. | P0 |

## 57. Integration Requirements

All external integrations shall be isolated behind typed interfaces.

### 57.1 Required API Contract Areas

- authentication and token refresh;
- session/device revocation;
- sync push;
- per-operation write results;
- sync pull and cursor semantics;
- conflicts and server versions;
- tombstones;
- calendar packs;
- notification device registration;
- attachment upload authorization;
- print request and status;
- generated-file download authorization;
- plans, purchases and entitlements;
- payment-return verification;
- export and account deletion;
- public events, polls and event questions.

### 57.2 Integration Behavior

1. Provider calls shall use timeouts and risk-appropriate retry classification.
2. Client writes shall not use generic automatic HTTP retry.
3. Payment and synchronization operations shall use stable idempotency keys.
4. Provider credentials shall never be embedded in the app.
5. Remote payloads shall be versioned or backward-compatible.
6. Incompatible API/schema versions shall produce a controlled upgrade response.
7. Attachment binaries shall use backend-authorized object-storage flows.
8. The final PDF shall not be generated solely by the Flutter client.

## 58. Analytics Requirements

| ID | Requirement | Priority |
|---|---|---:|
| ANA-FR-001 | Product analytics may measure activation and meaningful feature use using privacy-safe events. | P1 |
| ANA-FR-002 | Analytics shall not include note text, planner reflection text, reminder descriptions or unpublished questions. | P0 |
| ANA-FR-003 | Analytics consent shall follow approved market and legal requirements. | P0 |
| ANA-FR-004 | Personal productivity scores, employee rankings and government performance dashboards are excluded. | P0 |
| ANA-FR-005 | Operational metrics may measure sync failures, notification registration failures and PDF download failures without private content. | P0 |

## 59. Data Requirements

### 59.1 Core Local Data Areas

| Data area | Purpose | Classification |
|---|---|---|
| Account / Device / Preference | Local session, settings and device coordination | Personal/Restricted |
| Calendar Pack / Item | Downloaded governed dates | Public/Internal |
| Event / Recurrence / Exception | Personal scheduled content | Private |
| Reminder / Occurrence / State | Personal remembered content and action state | Private/Operational |
| Planner Page / Section / Entry | Personal planning content | Private |
| Note / Link | Private free-form content | Private/Sensitive |
| Template / Profile | Starter structure and user choices | Public/Private |
| Print Design / Request / File Metadata | Print configuration and output lifecycle | Private |
| Entitlement Cache | Offline feature-gating cache | Restricted |
| Outbox / Receipt / Cursor / Conflict / Tombstone | Synchronization state | Restricted/Operational |
| Notification Mapping | Local notification identifiers and status | Restricted/Operational |
| Public Event / Poll / Question | Feature-flagged public-content cache and pending operations | Public/Personal |

### 59.2 Data Rules

1. Every user-owned record shall have immutable account ownership or database isolation.
2. Mutable synchronized records shall have server-version and sync metadata.
3. Date-only values shall not be converted by timezone.
4. Timed records shall store enough instant/timezone context for correct display.
5. Recurrence shall store calendar basis, frequency, interval, termination and exceptions.
6. Device timestamps shall not be the sole synchronization order.
7. Private free text shall not be copied into operational logs or analytics.
8. Large file binaries shall not be stored in Drift business rows.
9. Money shall use currency plus exact minor units or equivalent exact decimal representation.
10. HR, payroll, KPI, project-assignment and organizational-hierarchy entities shall not be introduced.

### 59.3 Local Account Isolation

Preferred native baseline:

- one guest database;
- one active Drift database per authenticated account;
- explicit database switching;
- no cross-account cache/file reuse;
- tested logout, revocation and deletion behavior.

A shared database is permissible only with approved account-scoped keys on every owned table, account-scoped DAO queries and mandatory leakage tests.

## 60. Data Retention and Deletion

| Data class | Required behavior |
|---|---|
| Active local user data | Retained while required for service and authorized offline access |
| Pending outbox data | Retained until applied, cancelled or explicitly resolved |
| Conflicts | Retained until resolved or safely archived under approved policy |
| Recently Deleted | Recoverable for configured period; recommended default 30 days |
| Generated local PDFs | User-deletable and expired according to local cache policy |
| Server-generated PDFs/exports | Access expires according to backend policy; recommended default 7 days |
| Guest local data | Remains device-local until migrated, cleared or policy-based cleanup |
| Operational diagnostics | Retained according to policy with masking |
| Deleted account | Local access removed or rendered inaccessible after authoritative deletion |
| Backups | Governed by backend policy and not ordinary item-recovery storage |

---

# Part IV — User Journeys and Use Cases

## 61. Core User Journeys

### 61.1 First-Time Guest and Registration

1. The guest opens the app and sees today’s Ethiopian and Gregorian dates.
2. The guest converts a date or creates approved local trial content.
3. The app explains that an account is required for cloud backup, multi-device synchronization and purchase.
4. The guest registers and verifies the email address.
5. The app inventories eligible guest data.
6. The user selects records to migrate.
7. Migration uses stable client identifiers and reports migrated, rejected and pending counts.
8. The user selects language, primary calendar, timezone, week start, profile and calendar packs.
9. Today opens with visible synchronization state.

### 61.2 Ethiopian Annual Reminder

1. The user selects Quick Add and Reminder.
2. The user enters a title and Ethiopian date.
3. The user selects annual recurrence using the Ethiopian calendar.
4. The app displays the Ethiopian rule and Gregorian equivalent for the next occurrence.
5. The user selects notification options and saves.
6. The app stores locally immediately.
7. When synchronized, the backend becomes authoritative for the schedule.

### 61.3 Planner and Note

1. The user opens Planner and chooses the period.
2. Relevant events and reminders are referenced.
3. The user enters focus, priorities, checklist and notes.
4. Content autosaves locally.
5. The user links a private note to an event or planning period.
6. The app synchronizes when possible.

### 61.4 Offline Work and Conflict Recovery

1. Connectivity is unavailable and the app shows Offline.
2. The user creates or edits supported records.
3. The app shows Saved locally or Waiting to sync.
4. Connectivity returns.
5. Non-conflicting operations synchronize idempotently.
6. Concurrent note or planner edits preserve local and server versions.
7. The user keeps one, keeps both or merges supported content.

### 61.5 Print and Upgrade

1. The user opens Print Studio.
2. The user selects range, calendar mode, language, size, sections and cover.
3. The app shows layout warnings and a privacy review.
4. If entitlement is required, the user completes an approved purchase flow.
5. Backend verification activates entitlement.
6. The app submits the print request with a stable snapshot/version reference.
7. The backend worker generates the PDF.
8. The user previews, securely downloads, prints or shares it.

### 61.6 Public Event Extension

1. The user opens an enabled public event.
2. The user may copy the event to the private calendar.
3. The private copy is not silently overwritten by later public changes.
4. The user may submit an eligible poll vote.
5. Offline vote remains Pending Submission until server confirmation.
6. The user may submit a question.
7. Moderation and published answer state come from the backend.

## 62. Detailed Use Cases

### UC-AUTH-001 — Register Account

**Goal:** Create a verified account.  
**Actor:** Guest.  
**Preconditions:** Guest is not authenticated.  
**Trigger:** Guest chooses Register.

**Main flow:**

1. Enter email and password.
2. Accept required terms.
3. Client validates basic fields.
4. Backend validates policy and uniqueness.
5. Verification is sent.
6. User verifies.
7. Backend creates account and default settings.
8. App signs in and initializes account-local storage.

**Alternatives:** Existing email routes to sign-in or reset.  
**Exceptions:** Invalid/expired verification may be resent under rate limits.  
**Postcondition:** Verified account and active eligible session exist.

### UC-AUTH-002 — Convert Guest Data

**Goal:** Preserve eligible guest data.  
**Actor:** Guest becoming registered user.  
**Preconditions:** Guest records exist.  
**Trigger:** Registration succeeds.

**Main flow:**

1. App inventories eligible local records.
2. User excludes any unwanted records.
3. App sends stable IDs through the approved migration API.
4. Backend associates valid records.
5. Duplicate operation/entity IDs are handled safely.
6. App shows migrated, rejected and pending counts.

**Exceptions:** Failed items remain locally recoverable and retryable.

### UC-CAL-001 — Convert Ethiopian Date

**Goal:** Obtain Gregorian equivalent.  
**Actor:** Guest or user.

1. Enter Ethiopian date.
2. Validate year, month, day and Pagume.
3. Calculate equivalent using approved algorithm.
4. Display both formats and day name.
5. Allow copy/share.

Invalid or unsupported dates produce localized field errors without approximation.

### UC-CAL-002 — View Dual Calendar

1. Open Calendar.
2. Load selected view and enabled packs from local data.
3. Display primary and secondary dates.
4. Navigate previous/next, Today or Ethiopian New Year.
5. Show offline state where applicable.

### UC-EVT-001 — Create Event Offline

1. Choose Quick Add → Event.
2. Enter title, date and optional time.
3. Optionally open More Options.
4. Validate locally.
5. Save event and outbox operation atomically.
6. Display event immediately.
7. Show Waiting to sync.
8. On reconnection, push with the same operation ID.
9. Apply acknowledgement without duplication.

### UC-EVT-002 — Create Recurring Event

1. Enter event fields.
2. Select recurrence frequency and calendar basis.
3. Select termination.
4. Preview bounded next occurrences.
5. Confirm invalid-day behavior where applicable.
6. Save the series and required local occurrence data.
7. Synchronize without changing calendar basis.

### UC-REM-001 — Create Reminder

1. Choose Quick Add → Reminder.
2. Enter title, date and optional time.
3. Add recurrence or notification options if needed.
4. Save locally.
5. Schedule a provisional local notification where supported.
6. Synchronize.
7. Reconcile local schedule with backend-confirmed state.

Permission denial preserves the in-app reminder and explains notification limits.

### UC-REM-002 — Snooze Reminder

1. Open eligible occurrence.
2. Choose Snooze.
3. Select allowed interval or time.
4. Update only the current occurrence’s alert.
5. Preserve the next recurrence.
6. Synchronize the action as an operation, not a generic field update.

### UC-PLN-001 — Edit Planner Page

1. Open daily, weekly, monthly or yearly Planner.
2. View relevant referenced events/reminders.
3. Enter focus, priorities, checklist, notes or reflection.
4. Autosave locally after debounce.
5. Coalesce safe pending updates.
6. Synchronize later.
7. Preserve both versions if a conflict occurs.

### UC-NOTE-001 — Create Linked Note

1. Create a note.
2. Enter title/content.
3. Optionally link a date, event, reminder or planner page.
4. Autosave locally.
5. Allow pin/archive/delete/restore.
6. Synchronize.
7. Preserve local and server versions if merge is unsafe.

### UC-PRT-001 — Generate Planner PDF

1. Select source, range, calendar mode, language, size and sections.
2. Configure cover and approved personal identity fields.
3. Review page/layout warnings.
4. Review selected private content.
5. Confirm submission.
6. Submit a stable snapshot/versioned reference.
7. Show queued/processing/completed/failed state.
8. Preview and securely download the generated PDF.
9. Retain configuration for safe retry if generation fails.

### UC-SYNC-001 — Resolve Conflict

1. Sync detects a version mismatch.
2. Local and server versions are preserved.
3. App shows Conflict Detected.
4. User compares versions.
5. User selects Keep Mine, Keep Server, Keep Both or Merge where supported.
6. Resolved content is saved as a new operation/version.
7. Conflict is marked resolved only after durable local save.

### UC-SUB-001 — Upgrade Subscription

1. User selects a plan.
2. App shows approved price and renewal information.
3. App starts native-store or hosted checkout.
4. Provider result returns to the app.
5. App shows Pending until backend verification.
6. Backend verifies receipt/webhook.
7. App refreshes entitlement.
8. Duplicate provider callbacks do not create duplicate payment/entitlement results.

### UC-POLL-001 — Submit Vote Offline

1. User selects valid poll option(s).
2. Device is offline.
3. App creates a pending vote operation.
4. UI shows Pending Submission.
5. On reconnect, backend validates eligibility, poll status and duplication.
6. App displays accepted or safe rejected outcome.

---

# Part V — Rules, Acceptance and Traceability

## 63. Business Rules

| ID | Rule |
|---|---|
| BR-AUTH-001 | Email shall be unique after approved normalization. |
| BR-AUTH-002 | Cloud backup, multi-device sync and paid purchase require an account. |
| BR-GUEST-001 | Guest data is local-only until successfully migrated. |
| BR-CAL-001 | Conversion shall use one approved algorithm and reference dataset. |
| BR-CAL-002 | Display preference shall not change a record’s original calendar basis. |
| BR-CAL-003 | All-day/date-only values shall not shift because of timezone conversion. |
| BR-REC-001 | Ethiopian annual recurrence retains Ethiopian month/day; Gregorian annual recurrence retains Gregorian month/day. |
| BR-REC-002 | A series exception shall not alter other occurrences unless the series is explicitly changed. |
| BR-REM-001 | Completing one recurring occurrence shall not complete the series. |
| BR-REM-002 | Snoozing changes only the eligible current occurrence alert. |
| BR-NTF-001 | Backend scheduling is authoritative after synchronization; offline local scheduling is provisional. |
| BR-NTF-002 | Quiet hours may suppress eligible alerts but do not remove the in-app reminder. |
| BR-PLN-001 | Planner entries are not tasks and require no assignee, project, dependency, KPI or workflow status. |
| BR-PRIV-001 | Notes, reflections and unpublished questions are private by default. |
| BR-PRT-001 | Private content is excluded from print unless explicitly selected. |
| BR-PRT-002 | Submitted print content shall use a stable snapshot or equivalent version reference. |
| BR-SUB-001 | Entitlement activates only after backend verification or approved grant/trial. |
| BR-SUB-002 | Downgrade does not delete user content. |
| BR-PAY-001 | Provider redirect or client success alone is not proof of payment. |
| BR-DEL-001 | Eligible deleted items remain recoverable for the configured period. |
| BR-TMP-001 | Applying a profile/template shall not erase content without confirmation. |
| BR-GOV-001 | Government Employee is a personal profile/template, not an institutional hierarchy. |
| BR-SYNC-001 | A retried operation shall not create duplicate records/actions. |
| BR-SYNC-002 | Conflicting free-form content shall not be silently overwritten. |
| BR-SYNC-003 | Device time shall not be the sole synchronization authority. |
| BR-SYNC-004 | A stale device shall not resurrect a confirmed deletion silently. |
| BR-POLL-001 | A locally queued vote is not accepted until backend confirmation. |
| BR-QST-001 | Question moderation and publication are backend-authoritative. |

## 64. Acceptance Criteria

| ID | Given / When / Then | Related requirements |
|---|---|---|
| AC-AUTH-001 | Given a new valid email, when verification succeeds, then an active account is created and can sign in. | AUTH-FR-004–006 |
| AC-AUTH-002 | Given eligible guest records, when migration completes, then each accepted record appears once and rejected/pending items are reported. | AUTH-FR-009–011 |
| AC-AUTH-003 | Given two local accounts, when either account is active, then the other account’s records are inaccessible. | AUTH-FR-012/013 |
| AC-CAL-001 | Given every approved Ethiopian reference date, when converted, then the Gregorian result matches the authoritative dataset. | DATE-FR-001 |
| AC-CAL-002 | Given Pagume day 6 in a non-leap Ethiopian year, when submitted, then localized validation rejects it. | DATE-FR-003 |
| AC-CAL-003 | Given every approved Gregorian reference date, when converted, then the Ethiopian result matches the authoritative dataset. | DATE-FR-002 |
| AC-CAL-004 | Given Ethiopian-primary display, when navigating views, then primary/secondary dates and Today remain consistent. | CAL-FR-003–006 |
| AC-CAL-005 | Given an all-day event and timezone change, when displayed, then its calendar date remains unchanged. | CAL-FR-007–009 |
| AC-REC-001 | Given an annual reminder on 1 Meskerem, when the Ethiopian year changes, then the next occurrence remains 1 Meskerem. | REC-FR-003/004 |
| AC-REC-002 | Given a requested day absent in a target month, when recurrence is saved, then the approved disclosed rule is applied. | REC-FR-006 |
| AC-REC-003 | Given a series, when one occurrence is deleted, then other occurrences remain. | REC-FR-008 |
| AC-REC-004 | Given one occurrence is edited, when saved, then only that occurrence changes and remains linked to the series. | REC-FR-007–009 |
| AC-EVT-001 | Given title and valid date, when saved offline, then the event appears immediately without project fields. | EVT-FR-001/008/012 |
| AC-REM-001 | Given a near-term reminder offline, when saved, then it persists and a provisional local notification is scheduled where supported. | REM-FR-001/007; NTF-FR-005 |
| AC-REM-002 | Given a recurring reminder, when snoozed, then only the current alert changes. | REM-FR-005; BR-REM-002 |
| AC-NTF-001 | Given a reminder is rescheduled, when reconciliation completes, then obsolete local notifications are cancelled. | NTF-FR-006/007 |
| AC-TODAY-001 | Given preferences and packs, when Today opens, then dates, applicable events/reminders and enabled sections render correctly. | TODAY-FR-001–013 |
| AC-PLN-001 | Given a planner edit, when input pauses, then local autosave persists after restart without one outbox operation per keystroke. | PLN-FR-014/015 |
| AC-PLN-002 | Given target content exists, when copy is requested, then Merge, Replace or Cancel is required. | PLN-FR-010/011 |
| AC-NOTE-001 | Given concurrent note edits, when sync detects conflict, then neither version is silently lost. | NOTE-FR-011/012 |
| AC-PRIV-001 | Given a note-related failure, when diagnostics are recorded, then title/content are excluded. | NOTE-FR-014; PRIV-NFR-005 |
| AC-OFF-001 | Given no connectivity, when an event is created, then it is stored locally, survives restart and synchronizes once. | SYNC-FR-001–008 |
| AC-SYNC-001 | Given timeout after possible server commit, when retry uses the same operation ID, then no duplicate is created. | SYNC-FR-008 |
| AC-SYNC-002 | Given partial batch results, when processed, then successes and failures are retained individually. | SYNC-FR-009/010 |
| AC-SYNC-003 | Given delete on one device and stale update on another, when synchronized, then the record is not silently resurrected. | SYNC-FR-013; DEL-FR-004/005 |
| AC-LOC-001 | Given Amharic selection, when validation fails, then text is Amharic and layout is not clipped. | LOC-FR-001–005 |
| AC-TMP-001 | Given existing planner data, when profile changes, then existing content remains. | TMP-FR-003/007 |
| AC-PRT-001 | Given private notes are unselected, when PDF is generated, then note content is absent. | PRT-FR-008–010 |
| AC-PRT-002 | Given a submitted print request, when source content later changes, then queued output uses the submitted snapshot/reference. | PRT-FR-014 |
| AC-PRT-003 | Given A5 bilingual output, when complete, then Amharic and English render correctly with consistent dimensions. | PRT-FR-003–005 |
| AC-PRT-004 | Given a failed PDF job, when history/status is opened, then safe retry exists and design is retained. | PRT-FR-015/016 |
| AC-PAY-001 | Given client-side payment success without backend confirmation, then entitlement remains pending. | SUB-FR-004–006 |
| AC-SUB-001 | Given backend confirms downgrade or refund, when refreshed, then access changes without deleting content. | SUB-FR-008–010 |
| AC-DEL-001 | Given an eligible deleted item, when restored within recovery period, then it returns once without duplication. | DEL-FR-001–005 |
| AC-ACC-001 | Given large text and screen reader, when completing critical journeys, then actions remain accessible and understandable. | ACC-FR-001–010 |
| AC-POLL-001 | Given an offline vote, when submitted, then it shows Pending Submission until backend confirmation. | POLL-FR-004/005 |
| AC-QST-001 | Given a question is pending moderation, when backend status changes, then the app displays the authoritative status without exposing unpublished content to analytics. | QST-FR-003/004/007 |

## 65. Requirements Traceability Matrix

| Objective | Requirement areas | Business rules | Primary use cases | Acceptance | Phase |
|---|---|---|---|---|---|
| OBJ-01 | Calendar, date, recurrence | BR-CAL, BR-REC | UC-CAL, UC-EVT-002 | AC-CAL, AC-REC | 1A/1B |
| OBJ-02 | App shell, Today, events, reminders | BR-PLN | UC-EVT-001, UC-REM-001 | AC-EVT, AC-REM, AC-TODAY | 1A/1B |
| OBJ-03 | Reminders, notifications, reliability | BR-REM, BR-NTF | UC-REM-001/002 | AC-REM, AC-NTF | 1B |
| OBJ-04 | Planner, notes, templates | BR-PLN, BR-PRIV, BR-TMP | UC-PLN, UC-NOTE | AC-PLN, AC-NOTE, AC-TMP | 1C |
| OBJ-05 | Localization, calendar packs, profiles | BR-GOV | UC-CAL, UC-TMP | AC-LOC | 1A–1C |
| OBJ-06 | Print Studio | BR-PRT | UC-PRT-001 | AC-PRT | 1D |
| OBJ-07 | Offline, sync, deletion, conflicts | BR-SYNC, BR-DEL | UC-EVT-001, UC-SYNC-001 | AC-OFF, AC-SYNC, AC-DEL | 1A–1C |
| OBJ-08 | Plans, payments, entitlement | BR-SUB, BR-PAY | UC-SUB-001 | AC-PAY, AC-SUB | 1D |
| OBJ-09 | Security, privacy, isolation | BR-PRIV | All | AC-AUTH-003, AC-PRIV | All |
| OBJ-10 | Quality, testing, deployment | Quality requirements | All | Release gates | All |
| Extension | Public events, polls, questions | BR-POLL, BR-QST | UC-POLL-001 | AC-POLL, AC-QST | EXT |

---

# Part VI — Scope Control, Delivery and Verification

## 66. Out-of-Scope Requirements

The Flutter Planner App shall not include:

- project management;
- full task management;
- subtasks;
- assignees;
- dependencies;
- milestones;
- Kanban;
- workload planning;
- time tracking;
- HR;
- payroll;
- attendance;
- employee appraisal;
- employee performance monitoring;
- KPI and scorecard management;
- institutional approvals;
- government hierarchy workflows;
- strategic-plan cascading;
- accounting;
- invoicing;
- tax;
- CRM;
- e-signatures;
- document approval;
- social feed;
- complex collaboration;
- complex two-way external calendar synchronization;
- family sharing or permissions in Version 1;
- administration portal functionality;
- backend implementation;
- printing-partner fulfillment; or
- bulk institutional planner generation.

These exclusions protect the personal calendar/planner identity, cognitive simplicity, privacy and delivery quality.

## 67. Phased Implementation

| Phase | Scope | Completion gate |
|---|---|---|
| Phase 0 — Foundation | Project creation, environment, strict linting, Riverpod, routing, theme, localization shell, Drift, Dio, typed errors, monitoring abstraction, feature flags, CI, docs and ADRs | Formatting, analysis, tests and mandatory builds pass |
| 1A — Calendar Foundation | Guest/account shell, preferences, Ethiopian/Gregorian core, conversion, Today base, calendar views, packs, EN/AM, local database, initial sync status | Reference tests, account isolation, offline restart and migration tests pass |
| 1B — Events and Reminders | Events, recurrence, exceptions, reminders, local/remote notification coordination, search and sync retry | Recurrence, notification reconciliation and idempotent retry tests pass |
| 1C — Planner and Notes | Planner, notes, profiles/templates, autosave, undo, Recently Deleted, conflict recovery and guest migration | Privacy, offline autosave, multi-device conflict and 10,000-record tests pass |
| 1D — Print and Commercialization | Print Studio, PDF integration, subscriptions, payment, entitlement, export, account deletion and hardening | Print matrix, payment/entitlement, accessibility, security and production readiness pass |
| EXT — Public Engagement | Public events, polls and event questions behind feature flags | Eligibility, moderation, abuse, privacy and offline-pending tests pass |

Commercial Version 1 is complete only after Phase 1D acceptance.

## 68. Testing Requirements

### 68.1 Required Test Categories

#### Unit Tests

- Ethiopian-to-Gregorian conversion;
- Gregorian-to-Ethiopian conversion;
- Pagume validation;
- Ethiopian and Gregorian leap years;
- date arithmetic;
- Ethiopian-basis recurrence;
- Gregorian-basis recurrence;
- recurrence exceptions;
- timezone and date-only behavior;
- outbox retry and backoff;
- operation coalescing;
- duplicate prevention;
- conflict policies;
- entitlement rules;
- validation;
- mappers;
- use cases;
- Riverpod controllers.

#### Drift Tests

- primary and foreign-key constraints;
- unique constraints;
- indexes;
- transactions;
- DAOs;
- migrations;
- migrations with pending outbox operations;
- outbox durability after restart;
- cursor safety;
- conflicts;
- tombstones;
- Recently Deleted;
- guest migration;
- account isolation;
- database switching where used.

#### Widget Tests

- Today;
- Calendar;
- Quick Add;
- Event editor;
- Reminder editor;
- Planner;
- Notes;
- conflict resolution;
- offline banner;
- saved-locally and pending-sync states;
- rejected/action-required states;
- English;
- Amharic;
- dark mode;
- large text;
- accessibility semantics.

#### Integration Tests — Minimum 24 Scenarios

1. launch offline;
2. create event offline;
3. close application;
4. reopen offline;
5. confirm event remains;
6. reconnect;
7. synchronize exactly once;
8. simulate timeout after possible server commit;
9. retry with same operation ID;
10. verify no duplicate;
11. edit same note differently on two clients;
12. preserve both versions;
13. delete on one device and edit on another;
14. test safe deletion handling and restoration;
15. migrate guest data after registration;
16. revoke session with pending writes;
17. upgrade schema with pending outbox records;
18. simulate a long offline period;
19. reschedule reminder and cancel obsolete notification state;
20. submit offline poll vote and wait for server confirmation;
21. submit event question and receive moderation result;
22. submit a print request;
23. recover from PDF-generation failure;
24. correct cached entitlement from backend-authoritative state.

#### Performance Tests

- at least 10,000 local calendar-related records;
- cold startup;
- Today queries;
- calendar date-range queries;
- scrolling;
- recurrence generation;
- local search;
- large note;
- large planner page;
- outbox backlog;
- conflict-list loading;
- memory behavior.

### 68.2 Required Test Packages

Use and actively apply:

- `flutter_test`;
- `integration_test`;
- `mocktail`;
- Drift test utilities;
- `very_good_analysis` or approved equivalent;
- Patrol only if compatible and used for real native integration value.

### 68.3 Release Blocking

Release shall be blocked by:

- any open Severity 1 defect;
- unaccepted Severity 2 defect affecting calendar correctness, reminders, privacy, authorization, payment, data loss, sync duplication or print confidentiality;
- failed mandatory migration test;
- failed account-isolation test;
- failed required build;
- unresolved critical/high security finding; or
- failure of a phase completion gate.

## 69. Deployment and Release Requirements

### 69.1 Environments

Separate:

- development;
- test;
- staging;
- production.

Each shall use environment-specific:

- app IDs and bundle IDs;
- API endpoints;
- notification configuration;
- deep-link domains;
- monitoring environments;
- feature flags;
- logging levels; and
- secrets.

### 69.2 Flutter Release Requirements

CI/CD shall:

1. install the pinned Flutter stable SDK;
2. restore dependency caches safely;
3. run `flutter pub get`;
4. verify generated code;
5. check formatting;
6. run static analysis;
7. run unit, Drift and widget tests;
8. run integration smoke tests;
9. build Android;
10. build iOS on an approved macOS runner;
11. archive test reports;
12. keep signing secrets outside the repository.

Required Phase 0 command evidence:

```bash
flutter --version
flutter doctor -v
dart --version
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart format .
flutter analyze
flutter test
flutter build apk --debug
```

On macOS:

```bash
flutter build ios --simulator
```

No report shall claim a command passed unless it was actually executed successfully.

### 69.3 Release Controls

- feature flags;
- staged rollout where appropriate;
- rollback plan;
- API compatibility check;
- migration verification;
- app-store policy review;
- notification permission review;
- privacy and legal content review;
- production monitoring readiness;
- support readiness.

## 70. Risks and Mitigation

| ID | Risk | Impact | Probability | Mitigation | Contingency |
|---|---|---|---|---|---|
| R-01 | Ethiopian calendar/conversion error | Critical | Medium | One validated core, golden fixtures, boundary/property tests and expert review | Disable affected function, issue correction and audit |
| R-02 | Reminder late, failed or duplicated | Critical | Medium | Provisional local schedule, backend authority, idempotency, reconciliation and monitoring | In-app status, incident notice and rapid fix |
| R-03 | Offline loss or sync conflict | Critical | Medium | Drift durability, transactional outbox, cursor safety, tombstones and preserve-both recovery | Disable risky action, provide recovery support |
| R-04 | Duplicate server writes after timeout | Critical | Medium | Stable operation IDs, server idempotency and integration tests | Isolate operation and reconcile safely |
| R-05 | Amharic UI/PDF rendering failure | High | Medium | Font proof, bilingual test matrix and print QA | Block affected combination |
| R-06 | Scope expands into project/ERP features | High | High | Explicit exclusions, requirement review and change control | Defer to separate product specification |
| R-07 | Privacy exposure through logs, print or cache | Critical | Medium | Redaction, privacy review, least privilege and expiry | Revoke access, incident response and cleanup |
| R-08 | Payment callback or duplicate processing error | High | Medium | Backend verification, idempotency and reconciliation | Manual entitlement review/refund |
| R-09 | Timezone/DST error for diaspora user | High | Medium | IANA data, canonical instants and DST tests | Correction and rescheduling tools |
| R-10 | Cross-account local data leakage | Critical | Low/Medium | Separate databases or strict account scoping and automated tests | Force logout, quarantine data, incident response |
| R-11 | Migration damages pending work | Critical | Medium | Versioned migrations and pending-outbox fixtures | Preserve old DB and recovery workflow |
| R-12 | Package/SDK incompatibility | High | Medium | Pin stable SDK, official package review and lockfile | Revert/pin approved versions |
| R-13 | Backend contract incomplete | High | High | Contract-first API assumptions and mocks | Block remote feature implementation |
| R-14 | Mobile OS background limitations | High | High | Best-effort background sync, foreground triggers and honest UX | Adjust product promise and provider strategy |
| R-15 | Public poll/question abuse | High | Medium | Backend eligibility, rate limits, moderation and feature flags | Disable extension |
| R-16 | PDF/storage cost growth | Medium | Medium | Expiry, quotas, compression and monitoring | Reduce retention or quality tiers clearly |
| R-17 | Low adoption or premium conversion | High | Medium | User research, free utility and print differentiation | Adjust packaging and templates |

## 71. Open Decisions

| ID | Decision | Recommended default | Required before |
|---|---|---|---|
| OD-01 | Final product name and brand | Keep working title until naming/legal review | Public beta |
| OD-02 | Minimum Android version | Select based on target users and plugin support | Phase 0 |
| OD-03 | Minimum iOS version | Select based on target users and plugin support | Phase 0 |
| OD-04 | Supported calendar range | Define and lock with reference data | Phase 1A |
| OD-05 | Invalid monthly recurrence rule | Show choice: skip or last valid day | Phase 1B |
| OD-06 | Recently Deleted period | 30 days | Phase 1C |
| OD-07 | Guest inactivity cleanup | Disclosed configurable policy | Phase 1A/1C |
| OD-08 | Note and planner size limits | Define from performance/security testing | Phase 1C |
| OD-09 | Attachment support and limits | Cover image P0; general attachments P1 | Phase 1D |
| OD-10 | Notification provider and exact-alarm policy | Select after capability/store-policy review | Phase 1B |
| OD-11 | Email reminders | Include only if provider/cost approved | Phase 1B |
| OD-12 | Generated-file retention | 7 days default, configurable | Phase 1D |
| OD-13 | Pricing, currencies and plan limits | Validate commercially; do not hard-code | Phase 1D |
| OD-14 | Payment provider/native-store mix | Select after settlement/refund/reconciliation review | Phase 1D |
| OD-15 | PDF technology | Select after Amharic/font/throughput proof | Phase 1D |
| OD-16 | Full local DB encryption | Separate ADR and prototype | Security gate |
| OD-17 | Account database isolation model | Prefer separate guest/account DB | Phase 0/1A |
| OD-18 | Poll eligibility and anonymous voting | Backend policy decision | EXT |
| OD-19 | Question moderation and retention | Policy decision | EXT |
| OD-20 | Analytics consent and events | Market/legal decision | Production |
| OD-21 | Flutter Web/PWA | Deferred; separate capability review | Post-launch |
| OD-22 | Screen design baseline | Approve screen inventory and design system | Each phase |

## 72. Required Architecture Decision Records

Create ADRs for:

1. Flutter mobile client;
2. Drift-managed SQLite source of truth;
3. Riverpod state and dependency injection;
4. transactional outbox synchronization;
5. UUID identifier strategy;
6. recurrence storage and calendar basis;
7. bounded occurrence generation;
8. reminder scheduling authority;
9. PDF generation authority;
10. attachment metadata and binary storage;
11. conflict policy;
12. local database encryption;
13. native authentication storage;
14. payment and entitlement authority;
15. monitoring privacy;
16. public-event extension;
17. account-data isolation;
18. migration and rollback strategy.

Each ADR shall include context, decision, alternatives, rationale, positive and negative consequences, risks, mitigations, review trigger and status.

## 73. Implementation Package Baseline

Claude shall verify current stable mutually compatible versions before editing `pubspec.yaml`.

### Required package families

| Area | Packages |
|---|---|
| State/DI | `flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`, `riverpod_lint`, `custom_lint` |
| Database | `drift`, `drift_flutter`, `drift_dev`, `build_runner` |
| Routing | `go_router` |
| Networking | `dio` |
| Models | `freezed_annotation`, `freezed`, `json_annotation`, `json_serializable` |
| IDs | `uuid` |
| Secure storage | `flutter_secure_storage` |
| Localization/time | `flutter_localizations`, `intl`, `timezone`, `flutter_timezone`, `clock` |
| Connectivity/background | `connectivity_plus`, `workmanager` |
| Notifications | `firebase_core`, `firebase_messaging`, `flutter_local_notifications` |
| Deep links | `app_links` |
| Files/print | `file_picker`, `image_picker`, `mime`, `path_provider`, `pdfrx`, `printing`, `share_plus` |
| Payments | `in_app_purchase`, `url_launcher` |
| Monitoring | `sentry_flutter` behind an abstraction |
| Diagnostics | `package_info_plus` |
| Testing | `flutter_test`, `integration_test`, `mocktail`, `very_good_analysis`, optional compatible `patrol` |

Do not introduce competing state frameworks, service locators, local databases or synchronization engines.

## 74. Launch Acceptance Gate

Commercial Version 1 shall not launch until:

- calendar reference tests pass with no known critical correctness defect;
- reminder scheduling, reconciliation, retry and duplicate-prevention tests pass;
- offline, restart, migration and conflict scenarios pass;
- account-isolation tests pass;
- P0 print combinations pass Amharic, bilingual, dimension, privacy and secure-access review;
- critical accessibility and security findings are resolved or accepted formally;
- payment, entitlement correction, export and account deletion pass end to end;
- monitoring, incident response and support are ready;
- Android and iOS production builds pass; and
- Product Owner, QA Lead, Engineering Lead and Security/Privacy Reviewer approve release.

## 75. Final Implementation Recommendation

Implement the Flutter Planner App incrementally.

Phase 0 shall establish a compiling, tested foundation before feature code. Phase 1A shall freeze around trusted calendar, account isolation and offline foundations. Phase 1B shall treat recurrence, reminder actions, local notification reconciliation and idempotency as trust-critical. Phase 1C shall keep planner records lightweight and protect notes/planner content from silent conflict loss. Phase 1D shall require print, payment, privacy and operational acceptance before the product is declared commercially complete.

Public events, polls and event questions shall remain isolated behind feature flags and shall not delay the core product.

Claude or any coding agent shall:

1. read this SRS completely;
2. inspect the repository and toolchain;
3. plan before coding;
4. implement one approved phase at a time;
5. map implementation and tests to requirement IDs;
6. run real commands and report real output;
7. stop at approval checkpoints; and
8. never silently invent missing API behavior, limits or business rules.

---

## Appendix A — Recommended Repository Document Placement

```text
planner_app/
├── CLAUDE.md
├── docs/
│   ├── requirements/
│   │   └── Ethiopian_Calendar_Planner_SRS.md
│   ├── architecture/
│   ├── adr/
│   ├── api/
│   ├── decisions/
│   └── design/
├── lib/
├── packages/
├── test/
└── integration_test/
```

## Appendix B — Claude Source Rule

For this repository, Claude shall treat:

```text
docs/requirements/Ethiopian_Calendar_Planner_SRS.md
```

as the primary application requirements source unless a later approved document expressly supersedes a requirement.

## Appendix C — Phase Definition of Done

A phase is complete only when:

- scoped requirement IDs are mapped;
- generated code is current;
- formatting passes;
- analysis passes without warnings;
- required unit, Drift, widget and integration tests pass;
- migrations are tested;
- privacy review passes;
- no critical/high unresolved defect remains;
- required platform builds succeed;
- ADRs and documentation are current; and
- no hidden manual step is required.
