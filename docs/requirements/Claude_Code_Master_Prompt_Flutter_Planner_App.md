# MASTER DEVELOPMENT PROMPT — FLUTTER PLANNER APP

# ROLE

Act as a Principal Flutter Architect, Senior Flutter Engineer, Offline-First
Systems Engineer, Mobile Security Engineer, QA Automation Engineer, and
production software-delivery specialist.

Your task is to design, scaffold, and incrementally implement the customer-facing
Flutter Planner App for the attached:

“Ethiopian Calendar, Reminder, Simple Planner and Custom Print SaaS Platform”

The application belongs to Walia Nexus.

Produce implementation-ready, compiling, testable, maintainable code—not a
conceptual demo, tutorial, low-code prototype, or collection of disconnected
snippets.

# SOURCE OF TRUTH

Use the attached Software Requirements Specification as the primary functional
source of truth.

Read the entire SRS before implementation, including its:

- functional requirements;
- requirement identifiers;
- business rules;
- acceptance criteria;
- user journeys;
- use cases;
- phases;
- exclusions;
- security and privacy requirements;
- offline and synchronization rules;
- recurrence rules;
- print requirements;
- testing requirements;
- performance requirements;
- risks; and
- unresolved decisions.

Preserve the SRS terminology and behavior.

Do not silently change, simplify, invent, or omit requirements.

When a requirement is unclear, create an explicit assumption or technical
decision record rather than guessing.

# PROJECT BOUNDARY

Develop only the customer-facing Planner App in Flutter.

Do not develop:

- the public marketing website;
- the administration portal;
- the NestJS backend;
- the NestJS background worker;
- PostgreSQL migrations;
- Redis/BullMQ infrastructure;
- S3/MinIO infrastructure;
- administrative dashboards;
- content-management screens;
- finance-administration screens; or
- operational job-monitoring screens.

Assume these external applications and services exist:

- Next.js public website;
- Next.js administration portal;
- NestJS modular backend API;
- NestJS/BullMQ background worker;
- PostgreSQL with Drizzle ORM;
- Redis and BullMQ;
- S3-compatible object storage;
- push-notification provider;
- email provider;
- payment provider.

The Flutter application must integrate with the backend through documented,
versioned HTTPS APIs.

You may create:

- typed API contracts;
- DTOs;
- repository interfaces;
- mock API implementations;
- fake servers for tests;
- local fixtures;
- API-client adapters; and
- integration-test support.

Do not generate the actual backend implementation.

# SUPPORTED PLATFORMS

Mandatory production targets:

1. Android;
2. iOS.

Optional customer-access target:

3. Flutter Web/PWA, implemented only after a platform-capability review confirms
   acceptable support for offline persistence, authentication, notifications,
   deep links, file handling, background behavior, and security.

Android and iOS delivery must not be blocked by Flutter Web limitations.

Use explicit platform-adapter interfaces wherever behavior differs.

Do not assume that Android/iOS background execution, secure storage, local
notification, file-system, or purchase packages behave the same way on Flutter
Web.

Shared code must compile without importing native-only libraries from common code
paths. Platform-specific implementations must be selected through conditional
imports, adapters, or dependency injection.

Before Web/PWA implementation, produce a platform-capability matrix covering:

- Drift/SQLite persistence;
- browser storage quotas;
- background synchronization;
- push notifications;
- authentication and cookies;
- deep links;
- local files and downloads;
- printing;
- in-app purchases;
- secure storage;
- database encryption;
- application lifecycle behavior.

# PRODUCT IDENTITY

The product is an Ethiopian-first personal calendar, reminder, simple planner,
private notes, templates, and custom print application.

It must remain:

- calendar-centered;
- planner-oriented;
- simple to use;
- privacy-conscious;
- usable under limited connectivity;
- suitable for personal, student, professional, entrepreneur, government-template,
  family, and diaspora use;
- bilingual in English and Amharic; and
- compatible with Ethiopian and Gregorian dates.

It must not become a project-management, workforce-management, or enterprise ERP
application.

# EXPLICIT EXCLUSIONS

Under no circumstances generate modules, data models, navigation items,
permissions, comments, placeholders, or future stubs for:

- human resources;
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
- CRM;
- accounting;
- invoicing;
- tax management;
- electronic signatures;
- institutional approval workflows;
- government hierarchy workflows;
- document approval;
- strategic-plan cascading; or
- enterprise performance management.

Institution name, department/office, and job title may exist only as personal
profile or print-template fields. They must not establish an organizational
hierarchy.

# APPROVED PRODUCT EXTENSION

Public event polling and public event question management are approved product
extensions outside the original SRS baseline.

Implement them as isolated feature modules and protect them with feature flags.

The extension must include:

- public event information;
- event-linked polls;
- poll options;
- single- or multiple-selection rules;
- poll opening and closing times;
- pending offline vote submission;
- server-confirmed vote acceptance;
- duplicate-vote handling;
- event-linked public questions;
- question draft submission;
- moderation status;
- published questions;
- approved answers;
- rejected-question handling;
- rate-limit and abuse error states; and
- privacy-safe local storage.

The backend remains authoritative for:

- whether an event is public;
- whether a poll is open;
- voter eligibility;
- duplicate-vote prevention;
- final vote acceptance;
- published totals;
- question moderation;
- question publication; and
- approved answers.

An offline poll vote must be displayed as “Pending submission,” not “Vote
accepted,” until confirmed by the backend.

Do not couple polling or public questions to the core event, calendar, recurrence,
planner, or reminder domain models more than necessary.

# FINAL CLIENT ARCHITECTURE

Use:

Feature-first + offline-first + Clean MVVM architecture.

Use four logical layers for complex features:

1. Presentation
2. Application
3. Domain
4. Data

Do not create empty or ceremonial layers for simple features.

The required dependency direction is:

Presentation
    → Application
        → Domain

Data
    → Domain

Infrastructure implementations may depend on framework and platform packages,
but domain code must not depend on Flutter, Drift, Dio, Firebase, or platform
plugins.

# CLIENT SOURCE OF TRUTH

Use:

- SQLite as the local database engine;
- Drift as the typed Flutter persistence layer;
- Drift-managed SQLite as the immediate client-side source of truth.

All supported business screens must render from Drift streams.

The UI must never render synchronized business records directly from a Dio
response.

Correct flow:

Widget
→ Riverpod Controller
→ Repository
→ Drift DAO
→ Drift watch stream
→ Widget rebuild

Remote responses must first be validated, mapped, and persisted to Drift.
The Drift stream then updates Riverpod and the UI.

# OFFLINE-FIRST DEFINITION

This is a true offline-first application, not an API application with a cache.

Supported offline actions must:

1. validate locally;
2. generate a client-safe identifier;
3. persist immediately in Drift;
4. create an outbox operation in the same database transaction;
5. update the UI immediately;
6. survive application termination and restart;
7. synchronize when connectivity returns;
8. retry idempotently;
9. display synchronization state;
10. preserve unresolved conflicts; and
11. never silently lose accepted local content.

The application must open and provide supported local functionality while the
backend is unavailable.

# OFFLINE USER-VISIBLE STATES

Support and persist these states:

- Offline
- Saved locally
- Waiting to sync
- Syncing
- Synced
- Sync failed
- Rejected
- Conflict detected
- Action required

Do not infer “Synced” merely because a network connection exists.

# REQUIRED PACKAGE POLICY

Before generating pubspec.yaml:

1. inspect the current stable Flutter SDK;
2. inspect official pub.dev package pages;
3. choose the latest stable, mutually compatible production versions;
4. avoid beta, preview, discontinued, unverified, or weakly maintained packages
   unless explicitly approved;
5. state package compatibility constraints;
6. pin the Flutter SDK version;
7. commit pubspec.lock;
8. do not use moving dependency ranges in production without review.

Use official Flutter documentation and official pub.dev package records as the
primary sources.

Do not invent package versions.

# REQUIRED CORE PACKAGES

Use the following package families unless current official compatibility checks
show a blocking issue.

## State management and dependency injection

- flutter_riverpod
- riverpod_annotation

Development:

- riverpod_generator
- riverpod_lint
- custom_lint

Use Riverpod for:

- dependency injection;
- screen controllers;
- authentication state;
- asynchronous workflows;
- Drift stream exposure;
- synchronization status;
- preferences;
- entitlements;
- notification state;
- feature flags; and
- application lifecycle coordination.

Do not add:

- Bloc;
- Cubit;
- Provider;
- GetX;
- MobX;
- get_it; or
- injectable.

## Local database

- drift
- drift_flutter

Development:

- drift_dev
- build_runner

Use Drift for:

- typed tables;
- indexes;
- constraints;
- transactions;
- migrations;
- joins;
- reactive watch streams;
- background-isolate-safe access;
- test databases; and
- local source-of-truth behavior.

Do not add Hive, Isar, ObjectBox, Realm, or another SQLite database.

## Navigation

- go_router

Use:

- typed route definitions where supported;
- nested navigation;
- authentication redirects;
- deep links;
- notification routing;
- payment-return routing;
- route restoration; and
- shell navigation.

Primary application navigation:

- Today
- Calendar
- Planner
- More

Provide a persistent Quick Add action for:

- Event
- Reminder
- Note

## Networking

- dio

Dio must be isolated behind typed remote data sources or an API-client package.

Configure:

- base URL by environment;
- authentication interceptor;
- refresh-token coordination;
- correlation ID;
- request ID;
- installation/device ID;
- locale;
- application version;
- timeouts;
- cancellation;
- consistent error parsing;
- sensitive-data redaction;
- file upload/download;
- certificate and transport requirements;
- retry classification.

Do not implement automatic generic retries for POST, PATCH, PUT, or DELETE
requests.

Write retries belong to the durable outbox engine and must reuse the same
operation identifier.

## Immutable models and serialization

- freezed_annotation
- json_annotation

Development:

- freezed
- json_serializable
- build_runner

Use separate representations for:

- domain entities;
- Drift rows;
- API request DTOs;
- API response DTOs;
- form state;
- view state; and
- synchronization operations.

Do not reuse one class for every layer.

## Identifiers

- uuid

Use client-generated UUIDs for:

- offline-created business entities;
- outbox operation IDs;
- device installation IDs;
- conflict IDs;
- attachment-local IDs; and
- local draft IDs.

Prefer UUIDv7 for sortable business records and operation IDs if the selected
stable package version supports it correctly. Otherwise use UUIDv4 consistently.

The server remains responsible for validating ownership and uniqueness.

## Secure storage

- flutter_secure_storage

Use it only for:

- refresh tokens on native platforms;
- installation secrets;
- approved encryption keys;
- secure bootstrap material.

Do not store events, notes, planner content, outbox payloads, or general business
records in secure key-value storage.

Do not claim that flutter_secure_storage encrypts the complete Drift database.

For Flutter Web, use a backend-approved secure HttpOnly cookie session strategy
where available. Do not store long-lived refresh tokens in JavaScript-accessible
storage.

## Localization and time

- flutter_localizations from the Flutter SDK
- intl
- timezone
- flutter_timezone
- clock

Support:

- English;
- Amharic;
- Ethiopian-primary display;
- Gregorian-primary display;
- dual-date display;
- Sunday or Monday week start;
- IANA timezone IDs;
- diaspora timezone and DST behavior;
- testable current time;
- locale-safe formatting.

## Connectivity and background synchronization

- connectivity_plus
- workmanager

Use connectivity_plus only as a signal that network conditions changed.

Before synchronization, perform a real authenticated reachability request to the
NestJS API.

Use workmanager only for best-effort Android/iOS background work:

- upload pending operations;
- pull small change batches;
- retry attachment uploads;
- clean expired cache;
- refresh limited reference data.

Correctness must not depend on Workmanager executing.

Web synchronization must use:

- application startup;
- authentication restoration;
- browser online events;
- page visibility changes;
- manual refresh; and
- foreground retry.

## Notifications

- firebase_core
- firebase_messaging
- flutter_local_notifications

Wrap provider-specific behavior behind interfaces.

The backend worker remains authoritative for:

- synchronized reminder occurrence calculation;
- canonical scheduling;
- quiet hours;
- daily summaries;
- remote delivery retry;
- cancellation;
- duplicate prevention;
- provider failure handling;
- notification-attempt records;
- invalid-token cleanup.

Flutter handles:

- notification permission;
- token registration;
- token refresh;
- foreground presentation;
- notification channels;
- notification-click routing;
- limited local fallback;
- cancellation of obsolete local notifications.

For reminders created or changed while offline, schedule a bounded near-term
local fallback where the platform permits it. Mark that schedule as provisional.
After synchronization, reconcile local schedules with the backend-confirmed
schedule and cancel obsolete notifications.

Do not promise exact delivery where the operating system does not guarantee it.

On Android, request exact-alarm capability only when product requirements and
store policy justify it. Do not make exact-alarm permission a default requirement.

Do not use Workmanager as an exact reminder scheduler.

## Deep links

- app_links

Support:

- email verification;
- password reset;
- notification navigation;
- payment returns;
- authorized shared entry points where later approved.

## Files

Use as required by accepted features:

- file_picker
- image_picker
- mime
- path_provider

Store file binaries outside Drift.

Drift stores:

- local file reference;
- upload state;
- server attachment ID;
- MIME type;
- size;
- checksum;
- remote object metadata;
- synchronization status.

Binaries must upload through backend-authorized S3/MinIO flows.

## Print Studio

Use:

- pdfrx
- printing
- share_plus
- path_provider

Flutter is responsible for:

- print configuration;
- previewing backend-generated PDFs;
- showing generation status;
- downloading through authorized expiring links;
- native/browser printing;
- sharing;
- deletion of local cache.

The backend worker remains the authoritative PDF generator.

Do not make a locally generated Flutter PDF the final production artifact.

## Payments

Use when approved:

- in_app_purchase for supported native-store subscriptions;
- url_launcher for approved hosted checkout;
- app_links for verified payment-return routing.

The backend is authoritative for:

- payment status;
- receipt validation;
- webhook verification;
- subscription activation;
- entitlements;
- renewal;
- expiry;
- refunds;
- reconciliation.

Never grant permanent premium access from a client-side success callback alone.

## Monitoring

- sentry_flutter or another explicitly approved production monitoring adapter

Wrap monitoring behind an application interface.

Never capture:

- private note content;
- planner reflections;
- reminder descriptions;
- event descriptions;
- unpublished questions;
- voter-identifying information;
- access tokens;
- refresh tokens;
- passwords;
- payment credentials;
- full private API request bodies.

## Diagnostics

- package_info_plus

Use only for support and version reporting.

Do not collect unnecessary device fingerprints.

## Testing

Use:

- flutter_test;
- integration_test;
- mocktail;
- patrol where stable and compatible;
- very_good_analysis or an equivalent strict lint policy.

Do not add testing packages that are not actively used.

# PACKAGES TO AVOID

Do not use:

- multiple state-management frameworks;
- multiple service locators;
- multiple local databases;
- a generic automatic sync package;
- a generic HTTP retry package for writes;
- SharedPreferences as business persistence;
- a generic Ethiopian calendar package as the date authority;
- a Gregorian-only recurrence library as the recurrence authority;
- Workmanager for exact alarms;
- client-side payment entitlement;
- large BLOBs in Drift;
- global mutable singletons;
- untyped Map<String, dynamic> values across architectural boundaries;
- repositories that merely forward every DAO method without providing a domain
  boundary;
- service classes with hundreds of unrelated methods.

# REPOSITORY AND DART WORKSPACE

Use one Flutter application repository named `planner_app`.

Use a Dart workspace for the internal pure-Dart and shared Flutter packages when
supported by the selected stable SDK.

The root application must own:

- the application lockfile;
- shared analysis configuration;
- code-generation commands;
- CI commands;
- architecture documentation;
- ADRs;
- local package paths.

Internal packages must not be published unless separately approved.

An optional repository task runner such as Melos may be used only when it reduces
repeated workspace commands and does not become an architectural dependency.

# PROJECT LOCATION

Create the Flutter project inside an explicit directory named:

planner_app

Do not create the public website, admin portal, API, worker, or infrastructure
projects.

Provide exact terminal commands.

Do not use relative parent paths such as:

../
../../

Commands must be safe to run from a clearly named workspace directory.

# RECOMMENDED PROJECT STRUCTURE

Create:

planner_app/
├── android/
├── ios/
├── web/
├── assets/
│   ├── fonts/
│   ├── icons/
│   ├── images/
│   ├── calendar_reference/
│   └── translations/
├── lib/
│   ├── main.dart
│   ├── main_development.dart
│   ├── main_staging.dart
│   ├── main_production.dart
│   ├── app/
│   │   ├── app.dart
│   │   ├── bootstrap.dart
│   │   ├── router/
│   │   ├── theme/
│   │   ├── lifecycle/
│   │   └── providers/
│   ├── core/
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   ├── tables/
│   │   │   ├── daos/
│   │   │   ├── migrations/
│   │   │   └── converters/
│   │   ├── network/
│   │   │   ├── api_client.dart
│   │   │   ├── interceptors/
│   │   │   ├── errors/
│   │   │   └── contracts/
│   │   ├── sync/
│   │   │   ├── sync_coordinator.dart
│   │   │   ├── sync_push_service.dart
│   │   │   ├── sync_pull_service.dart
│   │   │   ├── retry_policy.dart
│   │   │   ├── conflict_service.dart
│   │   │   ├── sync_lease.dart
│   │   │   └── models/
│   │   ├── auth/
│   │   ├── calendar/
│   │   ├── notifications/
│   │   ├── files/
│   │   ├── payments/
│   │   ├── security/
│   │   ├── monitoring/
│   │   ├── localization/
│   │   ├── feature_flags/
│   │   └── errors/
│   ├── features/
│   │   ├── authentication/
│   │   ├── onboarding/
│   │   ├── today/
│   │   ├── calendar/
│   │   ├── events/
│   │   ├── reminders/
│   │   ├── planner/
│   │   ├── notes/
│   │   ├── templates/
│   │   ├── search/
│   │   ├── print_studio/
│   │   ├── subscriptions/
│   │   ├── profile/
│   │   ├── settings/
│   │   ├── synchronization/
│   │   ├── conflict_resolution/
│   │   ├── public_events/
│   │   ├── polls/
│   │   └── event_questions/
│   └── shared/
│       ├── widgets/
│       ├── formatting/
│       ├── validators/
│       ├── extensions/
│       └── constants/
├── packages/
│   ├── ethiopian_calendar_core/
│   ├── planner_design_system/
│   └── planner_test_support/
├── test/
├── integration_test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md

Do not create empty folders that provide no current value.

# FEATURE-INTERNAL STRUCTURE

For complex features, use:

features/events/
├── presentation/
│   ├── screens/
│   ├── widgets/
│   ├── controllers/
│   └── states/
├── application/
│   └── use_cases/
├── domain/
│   ├── entities/
│   ├── value_objects/
│   ├── repositories/
│   └── failures/
└── data/
    ├── local/
    ├── remote/
    ├── dtos/
    ├── mappers/
    └── repositories/

Simple features may use fewer layers.

# CLEAN CODE RULES

Apply these rules consistently:

1. No business logic in widgets.
2. No Dio calls from widgets or controllers.
3. No direct DAO calls from widgets.
4. No Firebase calls from feature widgets.
5. No direct secure-storage calls from features.
6. No dynamic maps across domain boundaries.
7. No broad catch blocks that silently discard errors.
8. No static global service locator.
9. No mutable public fields.
10. No giant utility classes.
11. No feature-to-feature data access through another feature’s internal DAO.
12. No circular imports.
13. No domain imports from presentation packages.
14. No package-level singleton database created outside bootstrap.
15. No hard-coded strings, routes, URLs, locales, feature limits, or API endpoints.
16. No logging of private content.
17. No comments that merely repeat the code.
18. No unresolved TODO placeholders in code delivered as complete for the current phase. Future-phase work must be tracked in issues, ADRs, or the implementation plan rather than hidden in production code.
19. No generated code manually edited.
20. No suppressed analyzer warnings without an explicit reason.

Prefer:

- small cohesive classes;
- explicit interfaces;
- immutable state;
- exhaustive sealed-state handling;
- named domain types;
- typed failures;
- composition;
- repository boundaries;
- deterministic functions;
- dependency injection;
- meaningful names;
- limited method length;
- testable time and ID generation;
- centralized environment configuration.

# DOMAIN PACKAGE: ETHIOPIAN CALENDAR

Create a pure Dart package:

packages/ethiopian_calendar_core

It must not import Flutter, Drift, Dio, Firebase, or platform libraries.

Implement:

- EthiopianDate;
- GregorianDate;
- CalendarBasis;
- DateOnly;
- CalendarConversion;
- Ethiopian leap-year rules;
- Gregorian leap-year rules;
- Pagume validation;
- Ethiopian-to-Gregorian conversion;
- Gregorian-to-Ethiopian conversion;
- date comparison;
- date arithmetic;
- localized formatting inputs;
- RecurrenceRule;
- RecurrenceFrequency;
- RecurrenceEnd;
- RecurrenceException;
- occurrence generation;
- monthly invalid-day policy;
- leap-year-only recurrence;
- Ethiopian yearly recurrence;
- Gregorian yearly recurrence;
- series exceptions;
- bounded occurrence generation.

Never permanently convert an Ethiopian annual recurrence into a Gregorian annual
month/day.

Store its source rule as Ethiopian.

Create a versioned golden-reference fixture set that can also be consumed by the
NestJS test suite outside this Flutter project.

Include property tests and fixed reference cases for:

- Ethiopian New Year;
- Pagume 5;
- Pagume 6 in leap years;
- conversion round trips;
- supported minimum and maximum dates;
- leap-year boundaries;
- Ethiopian yearly recurrence;
- Gregorian yearly recurrence;
- timezone-independent all-day dates.

# DRIFT DATABASE DESIGN

Implement versioned Drift tables and migrations.

At minimum include:

## Core data

- local_accounts
- user_preferences
- categories
- calendar_pack_subscriptions
- calendar_pack_items
- events
- event_recurrence_rules
- event_exceptions
- bounded_event_occurrences
- reminders
- reminder_recurrence_rules
- reminder_occurrences
- reminder_states
- planner_pages
- planner_sections
- planner_entries
- notes
- templates
- attachment_metadata
- print_designs
- print_requests
- generated_file_metadata
- entitlement_cache

## Extension data

- public_events
- polls
- poll_options
- pending_poll_votes
- event_questions

## Synchronization data

- outbox_operations
- sync_receipts
- sync_cursors
- sync_conflicts
- sync_write_results
- deletion_tombstones
- sync_device_state
- sync_lease

## Device-only data

- draft_form_state
- recent_searches
- calendar_view_state
- local_notification_mappings
- download_cache
- temporary_print_configuration
- local_diagnostics

Define:

- primary keys;
- foreign keys;
- unique constraints;
- indexes;
- ownership fields;
- server versions;
- timestamps;
- soft-delete fields;
- synchronization fields;
- query indexes based on actual screen access patterns.

Do not generate unlimited future recurrence rows.

Use a bounded occurrence horizon.

For optional Flutter Web/PWA support, document the Drift web database bootstrap,
required browser assets, worker configuration, persistence limitations, storage
quota behavior, migration behavior, and supported-browser matrix. Do not assume
the native database bootstrap works unchanged on web.

# REQUIRED SYNCHRONIZABLE METADATA

Every mutable synchronized entity must have appropriate fields such as:

- id
- owner_id
- server_version
- sync_status
- created_at
- updated_at
- deleted_at
- last_operation_id

Do not use device timestamps as authoritative synchronization order.

# TRANSACTIONAL OUTBOX

For every supported offline write, save the business record and outbox operation in
one Drift transaction.

Example behavior:

transaction:
    upsert business record
    enqueue outbox operation

Minimum outbox fields:

- operation_id
- device_id
- client_sequence
- entity_type
- entity_id
- operation_type
- base_version
- payload_json
- status
- attempt_count
- next_attempt_at
- last_error_code
- last_error_message
- created_at
- processing_started_at
- processed_at

Use explicit operation types:

- CREATE
- UPDATE
- DELETE
- RESTORE
- COMPLETE
- UNDO_COMPLETE
- SNOOZE
- RESCHEDULE
- SUBMIT_VOTE
- SUBMIT_QUESTION

Use explicit statuses:

- PENDING
- PROCESSING
- RETRYABLE_FAILURE
- APPLIED
- REJECTED
- CONFLICT
- CANCELLED

The operation ID is the idempotency key.

Do not use the entity ID as the operation ID.

Define safe outbox coalescing rules:

- CREATE followed by UPDATE before first sync may become one CREATE payload;
- multiple pending UPDATE operations for the same entity may be collapsed only
  when no operation-specific semantics are lost;
- CREATE followed by DELETE before first sync may be cancelled locally when no
  remote side effect occurred;
- COMPLETE, UNDO_COMPLETE, SNOOZE, RESCHEDULE, SUBMIT_VOTE, and SUBMIT_QUESTION
  must retain their operation semantics and must not be collapsed as generic
  updates;
- never coalesce across different accounts;
- never coalesce an operation already acknowledged by the server.

# SYNCHRONIZATION ENGINE

Implement a custom SyncCoordinator.

Synchronization sequence:

1. confirm an authenticated session;
2. check real API reachability;
3. acquire a persistent Drift sync lease;
4. recover abandoned PROCESSING operations;
5. load eligible outbox operations;
6. group operations into bounded batches;
7. preserve required entity ordering;
8. push operations through Dio;
9. process per-operation results;
10. update server versions;
11. record rejections and conflicts;
12. complete acknowledged operations;
13. retain retryable operations;
14. pull server changes using a server-issued cursor;
15. apply remote changes in a Drift transaction;
16. process deletion records;
17. update the cursor only after successful application;
18. release the lease;
19. emit an updated synchronization summary.

Prevent simultaneous foreground and background synchronization.

Use a persistent lease, not only an in-memory mutex.

Implement:

- exponential backoff;
- bounded jitter;
- maximum retry scheduling;
- manual retry;
- poison-operation isolation;
- batch limits;
- timeout handling;
- partial-batch results;
- session-expiry handling;
- account-revocation handling;
- schema-version handling;
- observability;
- privacy-safe diagnostics.

# WRITE-RESULT HANDLING

The backend may return:

- APPLIED
- ALREADY_APPLIED
- REJECTED
- CONFLICT
- UNAUTHORIZED
- SESSION_EXPIRED
- RETRYABLE_FAILURE

Map these into typed client outcomes.

Do not discard a rejected local record silently.

Show an actionable UI state.

# CONFLICT HANDLING

Do not use one universal conflict policy.

Use:

## User preferences

Field-level server-approved resolution where safe.

## Events

Optimistic concurrency using server version.

Prompt for resolution if both devices changed meaningful fields.

## Recurrence series

Never merge recurrence rules automatically when both changed.

Preserve both candidate rules and require an explicit decision.

## Reminder completion

Use operation-aware merge rules.

## Notes and planner content

Never silently apply last-write-wins.

Preserve:

- local version;
- server version;
- common base metadata where available;
- conflict timestamp;
- device metadata;
- resolution audit.

Support:

- Keep Mine
- Keep Server
- Keep Both
- Merge

## Calendar packs

Server authoritative.

## Subscription and entitlement

Server authoritative.

## Poll votes

Server acceptance authoritative.

A local submission remains pending until acknowledged.

## Public questions

Server moderation authoritative.

# DELETION AND RESTORATION

Implement:

- soft deletion;
- Recently Deleted;
- restore;
- final purge;
- deletion tombstones;
- multi-device deletion propagation;
- delete-versus-update conflicts;
- attachment cleanup;
- generated-file cleanup.

An old offline device must not silently resurrect a newer intentional deletion.

# LOCAL ACCOUNT AND DATA ISOLATION

Define and document the local account-isolation strategy before implementing
authentication.

Preferred native baseline:

- one active Drift database per authenticated account;
- a separate guest database;
- explicit database switching during sign-in, sign-out, and account change;
- no reuse of another account's local data file;
- secure cleanup rules for logout, revocation, and account deletion.

If a shared database is selected instead, every user-owned table must include an
account-scope key and every DAO query must enforce it. Prove isolation with
automated cross-account leakage tests.

Never rely on UI filtering as an account-isolation control.

# AUTHENTICATION

Implement client support for:

- guest mode;
- local-only guest data;
- verified email registration;
- sign-in;
- sign-out;
- password reset;
- session restoration;
- access-token refresh;
- active-device listing where supported;
- device/session revocation;
- account deletion request;
- personal-data export request;
- guest-to-account migration.

Guest migration must:

- inventory eligible local records;
- allow selected exclusions;
- upload using stable client IDs;
- preserve pending failures;
- avoid duplicates;
- report migrated, rejected, and pending counts.

# REQUIRED API CONTRACT ASSUMPTIONS

Before implementing remote data sources, produce a versioned client API contract
document covering at least:

- authentication and token refresh;
- device registration and revocation;
- sync push request;
- per-operation sync results;
- sync pull request and cursor semantics;
- conflict payloads;
- server-version fields;
- tombstones;
- calendar packs;
- reminder registration;
- attachment upload authorization;
- print request creation and status;
- generated-file download authorization;
- subscriptions and entitlements;
- native purchase receipt submission;
- payment-return verification;
- personal-data export;
- account deletion;
- public events;
- polls and vote submission;
- event questions and moderation states.

For every endpoint define:

- HTTP method and path;
- authentication requirement;
- request DTO;
- response DTO;
- idempotency behavior;
- validation errors;
- authorization errors;
- retry classification;
- pagination or cursor behavior;
- schema version;
- correlation ID behavior.

Do not invent backend behavior silently. Record missing details as explicit API
assumptions requiring backend confirmation.

# NAVIGATION AND UX

Use four main destinations:

- Today
- Calendar
- Planner
- More

Provide a persistent Quick Add button.

The app must support:

- responsive phone layout;
- tablet layout;
- responsive Flutter Web layout;
- keyboard navigation;
- screen-reader semantics;
- large text;
- light mode;
- dark mode;
- Amharic;
- English;
- offline banner;
- synchronization status;
- empty states;
- retry states;
- conflict states;
- privacy warnings;
- loading skeletons where appropriate.

Basic Event and Reminder creation must require no more than:

- title;
- date;
- optional time.

Place advanced fields under More Options.

# FEATURE REQUIREMENTS

Implement these feature areas according to the SRS.

## Today

- current Ethiopian date;
- current Gregorian date;
- day name;
- holiday/observance;
- events;
- reminders;
- focus;
- optional checklist;
- quick note;
- optional gratitude/reflection;
- next important item;
- yesterday/tomorrow navigation;
- hidden optional sections;
- Quick Add.

Do not display productivity scores, rankings, employee monitoring, or performance
charts.

## Calendar

- Ethiopian-primary;
- Gregorian-primary;
- dual-date;
- year;
- month;
- week;
- day;
- Jump to Today;
- Jump to Ethiopian New Year;
- Sunday/Monday week start;
- all-day events;
- multi-day events;
- cross-midnight events;
- calendar-pack visibility;
- holidays and observances;
- accurate date-only behavior.

Do not depend on a generic Gregorian calendar widget for core date behavior.

Build or adapt calendar rendering around the internal Ethiopian calendar domain
package.

## Events

- create;
- view;
- update;
- duplicate;
- copy;
- move;
- soft delete;
- restore;
- recurrence;
- series exceptions;
- location;
- description;
- category;
- reminders;
- optional attachment metadata;
- search;
- export eligibility.

Do not include projects, assignees, milestones, dependencies, estimates, KPIs, or
workflow status.

## Reminders

- create;
- recurrence;
- multiple notification times where supported;
- snooze;
- reschedule;
- complete;
- undo completion;
- skip occurrence;
- delete occurrence;
- quiet hours;
- daily summary preference;
- delivery-state display where available.

## Planner

- yearly;
- monthly;
- weekly;
- theme;
- intentions;
- simple goals;
- important dates;
- priorities;
- focus;
- checklist;
- self-care;
- notes;
- reflection;
- configurable section visibility;
- configurable section ordering;
- simple custom section;
- carry-forward selected items;
- autosave;
- undo;
- Recently Deleted.

Do not add project-management semantics.

## Notes

- private note;
- title;
- content;
- date;
- category;
- pin;
- archive;
- delete;
- restore;
- link to date/event/planner page;
- optional attachment metadata;
- autosave;
- undo;
- offline editing;
- conflict preservation;
- search;
- export eligibility.

## Profiles and templates

- personal;
- student;
- professional;
- entrepreneur;
- government employee;
- family.

Profiles influence:

- starter templates;
- terminology;
- examples;
- sections;
- categories;
- recommended calendar packs.

Changing profile must not destroy data.

Government templates may include personal office-planning fields but must not
introduce hierarchy, approval, assignment, KPI, appraisal, or institutional
performance reporting.

## Print Studio

- eligible source selection;
- year/date range;
- Ethiopian/Gregorian/dual mode;
- English/Amharic/bilingual;
- A4;
- A5;
- orientation;
- cover title;
- user name;
- approved institution information;
- theme;
- color;
- sections;
- event-category filters;
- holiday filters;
- private-content exclusions;
- headers;
- footers;
- page numbering;
- margin information;
- binding margin;
- page count;
- overflow warnings;
- small-text warnings;
- blank-page warnings;
- low-resolution-image warnings;
- color-print implications;
- privacy review;
- generation status;
- failure reason;
- history;
- regeneration;
- secure download;
- local cache deletion.

## Subscriptions

- plan display;
- cached entitlement display;
- online verification;
- upgrade flow;
- pending payment;
- confirmed payment;
- failed payment;
- renewal;
- expiry;
- downgrade;
- feature gating;
- offline grace behavior only if the backend policy permits it.

## Search

Search eligible local records through Drift.

Support:

- query debouncing;
- result grouping;
- filters;
- offline results;
- privacy-safe indexing;
- empty state;
- recent search state where approved.

# AUTOSAVE

Implement autosave for planner and notes with:

- local-first writes;
- debounce;
- explicit status;
- undo window;
- failure recovery;
- application lifecycle flush;
- crash-safe persistence;
- synchronization queuing.

Do not create one outbox operation for every keystroke.

Use coalescing or debounced snapshots with durable final local state.

# ENVIRONMENTS

Create:

- development;
- staging;
- production.

Use separate:

- application IDs/bundle IDs;
- API base URLs;
- Firebase configurations;
- monitoring environments;
- logging levels;
- feature flags;
- deep-link domains.

Do not commit secrets.

Use compile-time environment configuration where appropriate.

# SECURITY REQUIREMENTS

Implement:

- least-privilege storage;
- strict token handling;
- log redaction;
- screenshot/privacy review for sensitive screens where approved;
- no private-content analytics;
- API ownership assumptions;
- typed authorization failures;
- secure logout;
- local cache clearing rules;
- revoked-session behavior;
- account deletion behavior;
- attachment validation;
- payment-return validation;
- deep-link validation;
- database migration safety.

Create a security decision record for full local database encryption.

Do not add an encryption package without proving compatibility with Drift,
background isolates, Android, iOS, and Flutter Web.

# ACCESSIBILITY

Target WCAG 2.2 AA-equivalent behavior for supported Flutter journeys.

Implement:

- semantic labels;
- focus order;
- keyboard support;
- sufficient touch targets;
- text scaling;
- color-contrast testing;
- visible focus;
- error announcements;
- reduced-motion consideration;
- Amharic layout testing;
- no color-only status communication.

# ERROR MODEL

Create typed failures such as:

- ValidationFailure
- AuthenticationFailure
- AuthorizationFailure
- NetworkUnavailableFailure
- ServerUnavailableFailure
- TimeoutFailure
- ConflictFailure
- RejectedWriteFailure
- StorageFailure
- MigrationFailure
- NotificationFailure
- FileFailure
- PaymentFailure
- PrintGenerationFailure
- UnknownFailure

Map infrastructure errors into domain/application failures.

Do not expose raw exception text to users.

Provide a support reference or correlation ID where available.

# OBSERVABILITY

Record privacy-safe technical events for:

- application startup;
- database migration;
- sync start;
- sync completion;
- sync failure;
- outbox backlog;
- conflict count;
- API failure;
- push-token registration failure;
- PDF download failure;
- payment-return failure.

Do not record private record content.

# PERFORMANCE REQUIREMENTS

Design for:

- fast cold startup;
- immediate local screen rendering;
- bounded Drift queries;
- pagination;
- indexed date-range queries;
- bounded recurrence materialization;
- efficient stream scoping;
- provider select usage;
- cancellation of stale API requests;
- controlled image decoding;
- background JSON parsing where justified;
- outbox batching;
- attachment upload progress;
- large-note handling;
- at least 10,000 calendar-related local records in proof-of-concept testing.

Avoid watching entire tables when a screen needs a narrow date range.

# MIGRATIONS

Create a disciplined Drift migration strategy.

For every schema version:

- document changes;
- test upgrade from the previous supported version;
- test upgrade with pending outbox operations;
- test upgrade while records are soft deleted;
- test downgrade/rollback policy;
- back up or preserve unrecoverable local content;
- never clear the database merely to avoid migration work.

# TESTING REQUIREMENTS

Create:

## Unit tests

- Ethiopian calendar conversion;
- Pagume validation;
- leap years;
- recurrence;
- timezone behavior;
- outbox retry policy;
- operation coalescing;
- conflict policy;
- entitlement rules;
- validation;
- mappers;
- controllers;
- use cases.

## Drift tests

- constraints;
- indexes;
- transactions;
- DAO queries;
- migrations;
- outbox durability;
- sync cursor updates;
- conflicts;
- tombstones;
- guest migration;
- Recently Deleted;
- local-only data isolation.

## Widget tests

- Today;
- Calendar;
- Quick Add;
- Event editor;
- Reminder editor;
- Planner;
- Notes;
- conflict resolution;
- offline state;
- sync status;
- English;
- Amharic;
- dark mode;
- large text;
- accessibility semantics.

## Integration tests

At minimum:

1. launch offline;
2. create event offline;
3. close application;
4. reopen offline;
5. confirm event remains;
6. reconnect;
7. synchronize exactly once;
8. simulate timeout after possible server commit;
9. retry with the same operation ID;
10. verify no duplicate;
11. edit the same note on two devices;
12. preserve both versions;
13. delete on one device and edit on another;
14. test restoration;
15. migrate guest data after registration;
16. revoke the session with pending writes;
17. perform schema upgrade with pending outbox records;
18. simulate long offline period;
19. reschedule a reminder and cancel obsolete notification state;
20. submit an offline poll vote and wait for server confirmation;
21. submit an event question and receive moderation result;
22. generate a print request;
23. recover from PDF-generation failure;
24. verify entitlement correction from the server.

## Performance tests

- 10,000+ local records;
- date-range calendar queries;
- startup time;
- memory;
- outbox backlog recovery;
- large note;
- large planner page;
- recurrence generation;
- scrolling;
- conflict-screen load.

# CODE QUALITY

Configure strict analysis.

CI must fail on:

- formatter violations;
- analyzer warnings;
- lint failures;
- failed unit tests;
- failed widget tests;
- failed migration tests;
- failed code generation consistency;
- dependency vulnerability findings where tooling supports them;
- committed secrets;
- generated files out of date.

Require:

- dart format;
- flutter analyze;
- flutter test;
- integration smoke tests;
- code-generation verification.

# CI/CD

Create a GitHub Actions workflow or equivalent that:

1. installs the pinned Flutter stable SDK;
2. restores dependency cache;
3. runs flutter pub get;
4. verifies generated code;
5. runs formatting check;
6. runs flutter analyze;
7. runs unit/widget/database tests;
8. builds Android;
9. builds iOS where macOS runner is available;
10. builds Flutter Web;
11. archives test reports;
12. keeps signing secrets outside the repository.

# IMPLEMENTATION PHASES

Implement incrementally.

## Phase 0 — Architecture foundation

Deliver:

- project creation;
- environment configuration;
- strict linting;
- Riverpod bootstrap;
- routing;
- theme;
- localization shell;
- Drift initialization;
- Dio initialization;
- error model;
- monitoring abstraction;
- feature flags;
- CI;
- architecture README;
- ADRs.

Do not begin feature implementation before the foundation compiles and tests pass.

## Phase 1A — Calendar foundation

Deliver:

- guest mode;
- authentication shell;
- preferences;
- Ethiopian calendar package;
- conversion;
- Today base;
- calendar views;
- calendar packs;
- English/Amharic;
- local database;
- basic offline behavior;
- initial sync engine;
- sync-status UI.

Gate:

- calendar reference suite passes;
- offline restart passes;
- migration tests pass;
- security baseline approved.

## Phase 1B — Events and reminders

Deliver:

- events;
- recurrence;
- exceptions;
- reminders;
- snooze;
- reschedule;
- completion;
- notification registration;
- search;
- reminder sync;
- duplicate prevention;
- public event extension foundation.

Gate:

- reminder accuracy tests;
- idempotent retry tests;
- notification cancellation tests;
- recurrence tests pass.

## Phase 1C — Planner and notes

Deliver:

- yearly planner;
- monthly planner;
- weekly planner;
- Today planning sections;
- notes;
- profiles;
- templates;
- autosave;
- undo;
- Recently Deleted;
- conflict recovery;
- guest migration;
- polls and event-question feature flags where approved.

Gate:

- privacy tests;
- offline autosave tests;
- multi-device conflict tests;
- 10,000-record tests pass.

## Phase 1D — Print and commercialization

Deliver:

- Print Studio;
- backend PDF request integration;
- preview/download/print/share;
- subscription display;
- payment flow;
- entitlement caching;
- export;
- personal-data export;
- account deletion request;
- production hardening.

Gate:

- print matrix passes;
- entitlement correction passes;
- payment-return validation passes;
- accessibility tests pass;
- production readiness approved.

# REQUIRED ARCHITECTURE DECISION RECORDS

Create ADRs for:

- Flutter customer application;
- Drift-managed SQLite as client SSOT;
- Riverpod state and dependency injection;
- custom transactional outbox synchronization;
- UUID identifier strategy;
- recurrence storage;
- bounded occurrence materialization;
- server-authoritative reminders;
- server-generated PDFs;
- attachment metadata versus binary storage;
- conflict-resolution policy;
- local database encryption;
- native versus web authentication storage;
- payment entitlement authority;
- monitoring and privacy filtering;
- public polling and event-question extension;
- Flutter Web background limitations.

Each ADR must include:

- context;
- decision;
- alternatives;
- rationale;
- positive consequences;
- negative consequences;
- risks;
- mitigations;
- review trigger;
- status.

# INITIAL OUTPUT REQUIRED

Do not immediately generate hundreds of files.

First output:

1. SRS-derived Flutter scope summary;
2. assumptions and open decisions;
3. proposed architecture;
4. package inventory with:
   - selected current stable version;
   - official source;
   - supported platforms;
   - responsibility;
   - mandatory/optional status;
   - known limitation;
5. platform capability matrix for Android, iOS, and optional Web/PWA;
6. complete project tree;
7. Drift table plan;
8. synchronization protocol;
9. API contract assumptions;
10. phased implementation plan;
11. ADR list;
12. testing plan;
13. security checklist;
14. exact project-creation commands;
15. implementation risks ranked by severity.

Then wait for approval before generating Phase 0 code.

# CODE-GENERATION EXECUTION RULES

After approval:

- generate one coherent phase at a time;
- create or modify only files required by that phase;
- provide complete contents for new files and focused patches for changed files,
  unless complete replacement is safer;
- do not dump unrelated unchanged files;
- ensure imports resolve;
- ensure code-generation commands are included;
- run formatter;
- run analyzer;
- run tests;
- fix all errors before continuing;
- do not claim code compiles unless the commands actually pass;
- do not skip migrations;
- do not leave pseudocode in production paths delivered as complete;
- do not generate backend code;
- do not generate public-site or admin-site code.

At the end of each phase provide:

- files created;
- files changed;
- commands executed;
- analyzer result;
- test result;
- build result;
- unresolved risks;
- next phase gate.

# PHASE DEFINITION OF DONE

A phase is complete only when:

- all scoped acceptance criteria are mapped to implementation and tests;
- generated code is current;
- formatting passes;
- static analysis passes with no warnings;
- unit, Drift, and widget tests pass;
- required integration smoke tests pass;
- migrations are tested;
- privacy and logging review passes;
- no critical or high-severity known defect remains open;
- the build succeeds for mandatory platforms;
- architecture documentation and ADRs are updated;
- unresolved external dependencies are clearly documented;
- the next phase can begin without relying on hidden manual steps.

# FINAL QUALITY STANDARD

The completed Planner App must be:

- production-oriented;
- offline-first;
- maintainable;
- testable;
- secure by design;
- privacy-conscious;
- bilingual;
- calendar-accurate;
- recurrence-safe;
- resistant to duplicate synchronization;
- recoverable after conflicts;
- accessible;
- observable without leaking private content;
- compatible with the existing NestJS/PostgreSQL platform;
- production-ready on Android and iOS, with Flutter Web/PWA treated as a separately validated optional target;
- free from HR, payroll, e-signature, ERP, and employee-performance features.