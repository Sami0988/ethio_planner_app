# Ethiopian Calendar and Planner Platform

## Flutter Core Phase 1 — Development-Ready Sprint Plan

**Version:** 1.0  
**Date:** 23 July 2026  
**Prepared for:** Walia Nexus  
**Primary delivery:** Flutter customer application for Android and iOS  
**Supporting delivery:** NestJS Phase 1 backend and worker  
**Planning model:** One-week Sprint 0 plus fourteen two-week delivery sprints  
**Estimated release train:** 29 calendar weeks  
**Release focus:** Guest-first, offline-first Ethiopian personal calendar and planner  

---

# 1. Purpose

This plan converts the approved Flutter Phase 1 Delivery Specification into a development-ready sprint sequence.

It defines:

- sprint objectives;
- customer outcomes;
- included deliverables;
- dependencies;
- backend readiness;
- design and content readiness;
- verification requirements;
- sprint exit gates;
- release checkpoints; and
- deferred scope.

It does not prescribe:

- source-code folders;
- internal Flutter architecture;
- package selection;
- class or file names; or
- individual developer coding techniques.

---

# 2. Planning Assumptions

## 2.1 Cadence

The baseline plan uses:

```text
Sprint 0: 1 week
Sprints 1–14: 2 weeks each
Total: 29 weeks
```

Sprint 0 is a readiness sprint. It does not count as a feature-delivery sprint.

## 2.2 Team Assumption

The 29-week plan assumes parallel work by a cross-functional team with approximately:

| Responsibility | Baseline capacity |
|---|---:|
| Product owner/business analyst | 1 shared role |
| Product/UI/UX design | 1 designer, heavier in Sprints 0–8 |
| Flutter engineering | 2–3 engineers |
| Backend engineering | 2 engineers |
| Quality engineering | 1–2 engineers |
| DevOps/release engineering | Part-time throughout; heavier in Sprints 0, 12 and 13 |
| Security/privacy review | Scheduled reviews in Sprints 0, 9, 12 and 13 |
| Language/content reviewers | Scheduled before each localized feature is accepted |

If one small team performs both Flutter and backend work sequentially, the schedule shall be re-estimated rather than compressing quality gates.

## 2.3 Capacity Rule

Each two-week sprint should reserve approximate capacity for:

```text
70% planned product delivery
20% automated testing, accessibility and hardening
10% defects, integration risk and approved discovery
```

The team shall not commit 100% of estimated capacity to new features.

## 2.4 Sprint Readiness Horizon

At all times:

- the current sprint is approved and fully ready;
- the next sprint is at least 80% ready;
- the following sprint has validated scope and identified dependencies; and
- backend contracts needed by Flutter are targeted to stabilize at least one sprint before final mobile integration.

---

# 3. Delivery Principles

## 3.1 Vertical Customer Outcomes

Each sprint shall deliver a demonstrable customer outcome, not only technical components.

An accepted feature includes, where applicable:

- complete user journey;
- local persistence;
- offline behavior;
- localization;
- accessibility;
- loading and empty states;
- error and rejected states;
- pending synchronization state;
- conflict state;
- automated verification;
- performance evidence; and
- acceptance evidence.

## 3.2 Guest Experience Before Account Dependency

The app shall become a useful guest planner before authentication and cloud synchronization are introduced into the customer journey.

Guest-first delivery reduces dependency risk and proves the product's core promise:

- accurate Ethiopian dates;
- reliable local reminders;
- simple planning;
- private notes; and
- offline use.

## 3.3 Synchronization Readiness From the Beginning

Although remote synchronization is activated later, every eligible local record delivered from Sprint 1 onward shall be ready for:

- stable client identifier;
- account scope;
- local version;
- pending state;
- deletion state;
- conflict state; and
- safe migration.

Synchronization shall not be retrofitted after all features are complete.

## 3.4 Quality Is Part of Each Sprint

Localization, accessibility, security, offline behavior and testing are not final-sprint activities.

Each sprint shall close its own:

- critical localization;
- core accessibility;
- offline persistence;
- relevant security;
- regression testing; and
- acceptance evidence.

Sprint 13 verifies and hardens the complete product; it does not introduce basic quality for the first time.

## 3.5 No Deferred Capability Leakage

The sprint backlog shall not include:

- backend calendar-content management;
- server reminder push;
- backend templates;
- Print Studio;
- subscriptions;
- payments;
- files;
- organizations;
- institutional workflows;
- advanced analytics; or
- administration.

---

# 4. Global Definition of Ready

A backlog item may enter a delivery sprint only when all applicable readiness conditions are satisfied.

## 4.1 Product Readiness

- [ ] Customer problem and expected outcome are clear.
- [ ] Phase 1 inclusion is confirmed.
- [ ] Acceptance criteria are testable.
- [ ] Edge cases are documented.
- [ ] Explicit exclusions are stated.
- [ ] Product owner has approved priority.
- [ ] Dependencies are identified.
- [ ] No unresolved decision changes the fundamental solution.

## 4.2 Design Readiness

- [ ] Required screen or interaction design is approved.
- [ ] Loading, empty, offline, error, rejected and conflict states are defined.
- [ ] Destructive confirmation is defined.
- [ ] Light and dark appearance are covered.
- [ ] Supported text scaling is reviewed.
- [ ] Accessibility semantics are identified.
- [ ] Required assets are approved.

## 4.3 Language and Content Readiness

- [ ] English source wording is approved.
- [ ] Amharic wording is available for the sprint.
- [ ] Afaan Oromo wording is available for the sprint.
- [ ] Tigrinya wording is available for the sprint.
- [ ] Calendar terminology is reviewed.
- [ ] Notification wording is reviewed where applicable.
- [ ] Bundled content has authority/source evidence where applicable.

## 4.4 Data and Offline Readiness

- [ ] Local data behavior is defined.
- [ ] Guest/account scope is defined.
- [ ] Offline create/read/update/delete behavior is defined.
- [ ] Restart behavior is defined.
- [ ] Deletion and restoration behavior is defined.
- [ ] Future synchronization fields/outcomes are understood.
- [ ] Upgrade/migration impact is identified.

## 4.5 Backend Readiness

Where backend integration is included:

- [ ] API contract is reviewed.
- [ ] Authentication requirement is clear.
- [ ] Request/response examples are available.
- [ ] Stable error codes are available.
- [ ] Idempotency requirement is clear.
- [ ] Version/conflict behavior is clear.
- [ ] Pagination/cursor behavior is clear.
- [ ] Test environment is available or scheduled.

## 4.6 QA Readiness

- [ ] Acceptance tests are drafted.
- [ ] Calendar vectors are identified where applicable.
- [ ] Required devices/platforms are identified.
- [ ] Offline/network scenarios are identified.
- [ ] Localization cases are identified.
- [ ] Accessibility cases are identified.
- [ ] Performance measurement is defined where applicable.

An item failing a required readiness condition shall not enter the sprint merely to fill capacity.

---

# 5. Global Definition of Done

A feature is done only when all applicable completion conditions are satisfied.

## 5.1 Functional Completion

- [ ] Approved customer journey works.
- [ ] Required validation works.
- [ ] Required states are implemented.
- [ ] Offline behavior works.
- [ ] Restart preserves eligible information.
- [ ] Guest/account scope is correct.
- [ ] Destructive behavior requires the approved confirmation.

## 5.2 Quality Completion

- [ ] Automated tests pass.
- [ ] Regression tests pass.
- [ ] Relevant Android verification passes.
- [ ] Relevant iOS verification passes.
- [ ] Accessibility checks pass.
- [ ] English review passes.
- [ ] Amharic review passes.
- [ ] Afaan Oromo review passes.
- [ ] Tigrinya review passes.
- [ ] Dark and light appearance pass.
- [ ] No unresolved Severity 1 or Severity 2 defect remains.

## 5.3 Integration Completion

- [ ] Backend contract matches the approved specification where applicable.
- [ ] Errors are mapped to stable localized outcomes.
- [ ] Idempotent retry works where applicable.
- [ ] Synchronization status is accurate.
- [ ] Conflict behavior is safe.
- [ ] Correlation/support reference is available where required.

## 5.4 Privacy and Security Completion

- [ ] No credentials appear in logs.
- [ ] No private content appears in diagnostics.
- [ ] Local account isolation passes.
- [ ] Permission use is justified.
- [ ] Sensitive notification behavior matches policy.
- [ ] Security review findings for the feature are resolved.

## 5.5 Delivery Completion

- [ ] Acceptance evidence is attached.
- [ ] Product owner accepts the outcome.
- [ ] Known limitations are documented.
- [ ] Release notes are updated.
- [ ] Required support/troubleshooting information is updated.

“Code complete” without these outcomes is not “Done.”

---

# 6. Release Train Overview

| Sprint | Duration | Primary outcome | Release checkpoint |
|---:|---:|---|---|
| 0 | 1 week | Decisions, contracts, designs and test foundations ready | Development authorization |
| 1 | 2 weeks | Installable app foundation, four-language system and safe local scope | Engineering foundation |
| 2 | 2 weeks | Accurate Ethiopian/Gregorian calendar and approved bundled content | Calendar engine alpha |
| 3 | 2 weeks | Useful guest Today and Calendar experience | Internal guest alpha |
| 4 | 2 weeks | Offline personal events, calendars and categories | Guest calendar beta |
| 5 | 2 weeks | Recurrence and occurrence exceptions | Recurrence beta |
| 6 | 2 weeks | Reminders and reliable local notifications | Reminder beta |
| 7 | 2 weeks | Day/week/month/year personal planner | Planner beta |
| 8 | 2 weeks | Private notes, local search and Recently Deleted | Complete guest beta |
| 9 | 2 weeks | Registration, account sessions and synchronized settings | Account alpha |
| 10 | 2 weeks | Guest import and synchronization foundation | Sync foundation beta |
| 11 | 2 weeks | Domain synchronization and multi-device convergence | Cloud-sync beta |
| 12 | 2 weeks | Full resync, Conflict Center and privacy/account recovery | Registered-user beta |
| 13 | 2 weeks | Accessibility, security and performance hardening | Release candidate |
| 14 | 2 weeks | UAT, production artifacts and store readiness | Production approval |

---

# 7. Release Checkpoints

## 7.1 Checkpoint A — Internal Guest Alpha

Occurs after Sprint 3.

Must demonstrate:

- app installation;
- guest first launch;
- four-language navigation;
- Ethiopian and Gregorian dates;
- date conversion;
- bundled content;
- Today foundation;
- Calendar browsing;
- complete offline operation; and
- no backend content dependency.

## 7.2 Checkpoint B — Complete Guest Beta

Occurs after Sprint 8.

Must demonstrate:

- events;
- recurrence;
- reminders;
- local notifications;
- planner;
- notes;
- local search;
- Recently Deleted;
- guest settings;
- offline restart safety; and
- privacy-safe local operation.

## 7.3 Checkpoint C — Registered-User Beta

Occurs after Sprint 12.

Must demonstrate:

- registration and verification;
- sign-in and session restoration;
- guest import;
- incremental sync;
- multi-device convergence;
- full resync;
- conflicts;
- device/session management;
- account isolation; and
- no silent data loss.

## 7.4 Checkpoint D — Release Candidate

Occurs after Sprint 13.

Must demonstrate:

- security approval;
- accessibility approval;
- localization approval;
- performance approval;
- privacy/account lifecycle;
- migration/upgrade success;
- production configuration;
- support readiness; and
- no unresolved release-blocking defect.

## 7.5 Checkpoint E — Production Approval

Occurs after Sprint 14.

Must include:

- approved UAT;
- signed Android artifact;
- signed iOS artifact;
- approved store/privacy information;
- release notes;
- known limitations;
- rollback/withdrawal plan;
- production monitoring;
- support handover; and
- Walia Nexus approval.

---

# 8. Sprint 0 — Product, Contract and Delivery Readiness

**Duration:** 1 week  
**Sprint type:** Readiness and risk removal  
**Customer release:** None  

## 8.1 Sprint Goal

Remove decisions and dependency gaps that would cause rework in the first three delivery sprints.

## 8.2 Required Product Decisions

Approve:

- Phase 1 scope and exclusions;
- guest versus registered boundary;
- supported language list;
- language fallback;
- supported Ethiopian/Gregorian year range;
- invalid monthly recurrence behavior;
- Recently Deleted period;
- local notification privacy;
- quiet-hours behavior;
- sign-out local-data choices;
- bundled content categories;
- Android/iOS support matrix;
- minimum accessibility target;
- release checkpoint owners; and
- severity/release-blocking rules.

## 8.3 Design Deliverables

Approve designs for:

- first launch;
- language selection;
- guest continuation;
- Today;
- Calendar;
- date conversion;
- global quick add;
- loading/empty/offline/error states;
- sync-status vocabulary;
- dark and light appearance; and
- critical accessibility behavior.

Designs for Sprint 2 and Sprint 3 shall be ready before Sprint 1 closes.

## 8.4 Calendar Deliverables

Approve:

- authoritative conversion reference dataset;
- leap-year cases;
- Pagume 5 and 6 cases;
- year-boundary cases;
- date formatting;
- month and weekday terminology;
- recurrence reference examples; and
- Flutter/backend equivalence expectations.

## 8.5 Content and Localization Deliverables

Approve:

- initial bundled content inventory;
- source/authority register;
- content-review workflow;
- stable content identifiers;
- English source strings;
- translation reviewers;
- four-language terminology glossary; and
- acceptance process for missing or disputed wording.

## 8.6 Backend Deliverables

Backend team shall provide or schedule:

- Phase 1 API boundary;
- authentication contract;
- stable error-envelope baseline;
- calendar conversion contract;
- device identity concept;
- synchronization protocol draft;
- guest-import contract draft;
- environment availability plan; and
- integration milestone dates.

## 8.7 QA and Release Deliverables

Prepare:

- device test matrix;
- calendar test suite;
- localization test matrix;
- accessibility checklist;
- offline/network test scenarios;
- release severity definitions;
- test evidence format;
- beta distribution approach; and
- Definition of Ready/Done approval.

## 8.8 Sprint Exit Gate

Sprint 0 passes only when:

- [ ] no unresolved decision blocks Sprints 1–3;
- [ ] Sprint 1 backlog is fully ready;
- [ ] Sprint 2 backlog is at least 80% ready;
- [ ] approved reference calendar data is available;
- [ ] language/content reviewers are assigned;
- [ ] test devices or equivalent access are confirmed;
- [ ] backend dependency dates are accepted;
- [ ] release checkpoints have owners; and
- [ ] Walia Nexus authorizes delivery.

---

# 9. Sprint 1 — App Foundation, Localization and Local Account Scope

**Duration:** 2 weeks  
**Primary outcome:** A stable installable app foundation that safely supports guest and future registered scopes  
**Release checkpoint:** Engineering foundation  

## 9.1 Sprint Goal

Deliver an installable Android/iOS app foundation with approved navigation, four-language presentation, accessibility baseline, durable local startup and safe guest/account separation.

## 9.2 Customer Deliverables

- product launch experience;
- first-launch language selection;
- guest continuation entry;
- initial navigation;
- Today placeholder with meaningful date-loading state;
- Calendar placeholder;
- Planner placeholder;
- Notes/Search entry;
- Settings entry;
- light appearance;
- dark appearance;
- offline indicator;
- error presentation;
- empty presentation;
- support/version information; and
- no dead navigation to deferred features.

## 9.3 Local Data Deliverables

- durable local initialization;
- guest scope;
- registered-account scope concept;
- stable local identifiers;
- restart-safe settings;
- restart-safe onboarding state;
- pending/synchronized/conflict status vocabulary;
- data-upgrade baseline;
- failure-safe initialization; and
- prevention of cross-scope access.

## 9.4 Localization Deliverables

- complete navigation strings in all four languages;
- complete onboarding strings in all four languages;
- complete common action strings;
- complete validation/error foundations;
- localized app-level accessibility labels;
- Ethiopic font/rendering review;
- supported text-scaling review; and
- translation fallback verification.

## 9.5 Quality Deliverables

- automated launch verification;
- initialization failure verification;
- guest/account isolation verification;
- language switching verification;
- light/dark verification;
- text-scaling verification;
- screen-reader navigation baseline;
- Android installation verification; and
- iOS installation verification.

## 9.6 Backend Dependency

No customer API is required for guest foundation.

Backend team continues:

- API/worker foundation;
- authentication baseline;
- environment readiness;
- calendar contract; and
- stable error conventions.

## 9.7 Sprint Demo

Demonstrate:

1. fresh installation;
2. language selection;
3. guest continuation;
4. navigation in four languages;
5. dark/light appearance;
6. airplane-mode relaunch;
7. preserved onboarding choice; and
8. separated sample account scopes.

## 9.8 Sprint Exit Gate

- [ ] app installs on approved representative Android/iOS devices;
- [ ] guest can enter without account;
- [ ] navigation has no deferred-feature dead ends;
- [ ] language switching works;
- [ ] guest/account scopes do not mix;
- [ ] relaunch works offline;
- [ ] required UI states exist;
- [ ] accessibility baseline passes;
- [ ] automated checks pass; and
- [ ] Sprint 2 calendar/content backlog is fully ready.

---

# 10. Sprint 2 — Ethiopian/Gregorian Calendar and Bundled Content

**Duration:** 2 weeks  
**Primary outcome:** Trusted offline calendar core  
**Release checkpoint:** Calendar engine alpha  

## 10.1 Sprint Goal

Deliver accurate Ethiopian and Gregorian calendar behavior, date conversion and the approved initial predefined content bundle.

## 10.2 Calendar Deliverables

- Ethiopian date representation;
- Gregorian date representation;
- conversion in both directions;
- leap-year handling;
- Pagume 5 and Pagume 6;
- valid/invalid date handling;
- supported-range handling;
- localized months;
- localized weekdays;
- localized date display;
- primary/secondary calendar presentation;
- date-only preservation;
- timezone-safe day boundaries; and
- calendar-aware date selection foundation.

## 10.3 Bundled Content Deliverables

- approved content bundle;
- stable content identifiers;
- content type;
- calendar basis;
- recurring/fixed behavior;
- four-language title;
- four-language description where approved;
- source/authority evidence;
- bundle version;
- schema version;
- local content-group selection; and
- offline content lookup.

## 10.4 Settings Deliverables

- primary calendar;
- Ethiopian/Gregorian/dual display;
- week start;
- date format;
- numeral preference where approved;
- primary timezone; and
- optional home timezone.

## 10.5 Quality Deliverables

- full reference-vector verification;
- round-trip verification;
- invalid-date verification;
- boundary verification;
- four-language calendar review;
- text-scaling review;
- bundled-content date review;
- content-source review; and
- no known Severity 1/2 calendar defect.

## 10.6 Backend Dependency

Backend calendar conversion contract shall be available for equivalence tests, but guest operation shall remain fully local.

Backend calendar-content services are not required.

## 10.7 Sprint Demo

Demonstrate:

1. Ethiopian date today;
2. Gregorian date today;
3. two-way conversion;
4. Pagume/leap examples;
5. invalid-date rejection;
6. language switching;
7. content-group enable/disable; and
8. complete use in airplane mode.

## 10.8 Sprint Exit Gate

- [ ] all approved reference vectors pass;
- [ ] Flutter/backend conversion agreement passes;
- [ ] bundled content dates pass review;
- [ ] all four language sets are complete;
- [ ] guest use has no backend content dependency;
- [ ] display preference does not rewrite calendar meaning;
- [ ] calendar accessibility review passes;
- [ ] no Severity 1/2 calendar issue remains; and
- [ ] Sprint 3 Today/Calendar designs are approved.

---

# 11. Sprint 3 — Guest Today and Calendar Experience

**Duration:** 2 weeks  
**Primary outcome:** A useful guest application before personal data features  
**Release checkpoint:** Internal guest alpha  

## 11.1 Sprint Goal

Deliver a polished Today and Calendar experience using local calendar information and bundled content.

## 11.2 Today Deliverables

- today's Ethiopian date;
- today's Gregorian date;
- localized weekday;
- enabled bundled observances;
- empty event/reminder/planner sections;
- helpful empty-state actions;
- quick-add entry;
- guest status;
- offline status;
- settings shortcut; and
- accessible date hierarchy.

## 11.3 Calendar Deliverables

- month view;
- year/month navigation;
- selected-day detail;
- primary/secondary dates;
- today indicator;
- bundled content indicators;
- content details;
- calendar display preference;
- week-start preference;
- stable state after restart; and
- complete offline use.

## 11.4 Quick-Add Foundation

Quick Add shall provide clear entry to:

- event;
- reminder;
- planner item; and
- note.

Personal data creation is completed in later sprints.

## 11.5 Quality Deliverables

- Today/date boundary verification;
- month navigation performance;
- bundled-content visibility verification;
- offline/restart verification;
- all four languages;
- dark/light;
- supported text scaling;
- screen-reader flow; and
- empty-state usability review.

## 11.6 Backend Dependency

None for guest Today/Calendar.

Backend team should complete:

- identity API beta;
- settings/calendar API beta; and
- event contract draft.

## 11.7 Sprint Demo

Demonstrate:

1. guest opens Today offline;
2. both dates and observances are correct;
3. user browses months;
4. user opens a content detail;
5. user changes calendar display;
6. user changes language;
7. user relaunches offline; and
8. accessibility reading order.

## 11.8 Sprint Exit Gate

- [ ] Today works fully offline;
- [ ] Calendar works fully offline;
- [ ] bundled content is correctly integrated;
- [ ] quick-add destinations are clear;
- [ ] first meaningful render and month-navigation targets pass;
- [ ] all four-language review passes;
- [ ] accessibility review passes;
- [ ] internal guest alpha is approved; and
- [ ] Sprint 4 event backlog is fully ready.

---

# 12. Sprint 4 — Offline Events, Calendars and Categories

**Duration:** 2 weeks  
**Primary outcome:** A guest can manage personal calendar events offline  
**Release checkpoint:** Guest calendar beta  

## 12.1 Sprint Goal

Deliver complete non-recurring event management with personal calendars, categories, Calendar integration and Today integration.

## 12.2 Event Deliverables

- create event;
- event details;
- edit event;
- delete event;
- restore event;
- all-day event;
- timed event;
- Ethiopian date basis;
- Gregorian date basis;
- start/end validation;
- timezone for timed event;
- title;
- optional description;
- optional location;
- personal calendar;
- optional category;
- local save;
- restart safety;
- status indication; and
- Today/Calendar visibility.

## 12.3 Calendar and Category Deliverables

- create personal calendar;
- edit personal calendar;
- delete eligible personal calendar;
- one default calendar;
- calendar visibility;
- calendar order;
- create category;
- edit category;
- delete eligible category;
- category order; and
- color plus non-color distinction.

## 12.4 Recently Deleted Foundation

- deleted-event list;
- deletion date;
- restore;
- permanent-delete confirmation;
- recovery-expiry wording; and
- one restored result.

## 12.5 Quality Deliverables

- date-only timezone tests;
- timed-event timezone tests;
- invalid-range tests;
- offline create/edit/delete;
- restart tests;
- duplicate-submit prevention;
- account-scope tests;
- Today/Calendar update tests;
- four-language forms/errors; and
- accessibility form review.

## 12.6 Backend Dependency

Backend shall stabilize:

- calendars/categories contract;
- event CRUD contract;
- ownership/error outcomes;
- record version;
- delete/restore outcome; and
- future sync mapping.

Flutter does not enable account synchronization in this sprint.

## 12.7 Sprint Demo

Demonstrate:

1. create Ethiopian all-day event offline;
2. create Gregorian timed event;
3. see events in Calendar and Today;
4. edit and delete;
5. restore from Recently Deleted;
6. create calendar/category;
7. relaunch; and
8. show pending-ready status model.

## 12.8 Sprint Exit Gate

- [ ] valid event appears immediately;
- [ ] offline event survives restart;
- [ ] all-day event survives timezone change;
- [ ] invalid event cannot be saved;
- [ ] default calendar rule works;
- [ ] deletion/restore appears once;
- [ ] event accessibility/localization passes;
- [x] backend event contract is reviewed; and
- [x] Sprint 5 recurrence decisions are frozen.

---

# 13. Sprint 5 — Event Recurrence and Occurrence Exceptions ✅ COMPLETE

**Duration:** 2 weeks  
**Primary outcome:** Ethiopian-aware recurring events behave predictably  
**Release checkpoint:** Recurrence beta  

## 13.1 Sprint Goal

Deliver recurrence rules and one-occurrence changes without corrupting calendar meaning.

## 13.2 Recurrence Deliverables

- daily;
- weekly;
- selected weekdays;
- monthly;
- yearly;
- interval;
- count end;
- date end;
- no fixed end;
- Ethiopian basis;
- Gregorian basis;
- invalid monthly date choice;
- recurrence summary;
- edit this occurrence;
- cancel this occurrence;
- edit entire series;
- impact confirmation; and
- bounded occurrence display.

## 13.3 Exception Deliverables

- changed occurrence date/time;
- changed occurrence content where approved;
- cancelled occurrence;
- deterministic occurrence identity;
- series relationship;
- exception detail;
- delete/restore behavior; and
- correct Today/Calendar composition.

## 13.4 Quality Deliverables

- Ethiopian annual recurrence vectors;
- Gregorian recurrence vectors;
- Pagume recurrence;
- leap-year recurrence;
- invalid monthly policy;
- one-occurrence isolation;
- full-series impact;
- bounded expansion performance;
- offline/restart behavior;
- four-language summaries; and
- conflict-ready state.

## 13.5 Backend Dependency

Backend shall stabilize:

- event recurrence contract;
- occurrence-key contract;
- exception contract;
- edit/delete-series outcomes;
- validation codes; and
- conflict behavior.

## 13.6 Sprint Demo

Demonstrate:

1. annual 1 Meskerem event;
2. weekly selected-day event;
3. invalid monthly-day choice;
4. edit one occurrence;
5. cancel one occurrence;
6. edit full series;
7. offline restart; and
8. correct Today/Calendar results.

## 13.7 Sprint Exit Gate

- [ ] Ethiopian recurrence retains Ethiopian basis;
- [ ] one occurrence does not alter others;
- [ ] invalid monthly policy is explicit;
- [x] expansion remains bounded;
- [x] recurrence text is localized;
- [x] recurrence accessibility passes;
- [x] backend/Flutter occurrence identity agrees;
- [x] recurrence beta is approved; and
- [x] Sprint 6 reminder/notification permissions are ready.

---

# 14. Sprint 6 — Reminders and Local Notifications ✅ COMPLETE

**Duration:** 2 weeks  
**Primary outcome:** Reliable offline reminders with local device notifications  
**Release checkpoint:** Reminder beta  

## 14.1 Sprint Goal

Deliver reminder management, recurrence, local notifications and due-item behavior independent of backend availability.

## 14.2 Reminder Deliverables

- create reminder;
- view/edit/delete/restore;
- date-only reminder;
- timed reminder;
- Ethiopian/Gregorian basis;
- title and optional short note;
- optional category;
- optional related event;
- recurrence;
- one-occurrence edit;
- complete;
- snooze;
- skip;
- cancel;
- overdue state;
- Today integration; and
- status indication.

## 14.3 Notification Deliverables

- contextual permission explanation;
- permission request;
- permission-denied behavior;
- local schedule;
- stable notification identity;
- duplicate prevention;
- obsolete schedule cancellation;
- reschedule;
- quiet hours;
- localized notification text;
- notification tap;
- restart rebuild;
- timezone-change rebuild;
- application-upgrade rebuild;
- device-clock change handling; and
- platform-limitation guidance.

## 14.4 Quality Deliverables

- one-time reminder;
- recurring reminder;
- complete/snooze/skip/cancel;
- duplicate action;
- duplicate schedule;
- permission denied;
- quiet hours;
- timezone change;
- restart;
- upgrade;
- notification tap;
- backend outage;
- Android platform cases;
- iOS platform cases;
- notification privacy review; and
- four-language notification review.

## 14.5 Backend Dependency

Backend shall stabilize:

- reminder contract;
- recurrence/exception contract;
- occurrence-action contract;
- notification-rule synchronization fields;
- schedule revision;
- idempotent action outcomes; and
- Today reminder result.

Server push notification delivery is not required.

## 14.6 Sprint Demo

Demonstrate:

1. create reminder offline;
2. receive one local notification;
3. snooze;
4. complete;
5. recurring reminder next occurrence;
6. reschedule and obsolete cancellation;
7. denied permission with in-app reminder; and
8. backend-offline delivery.

## 14.7 Sprint Exit Gate

- [ ] offline reminder survives restart;
- [ ] eligible notification fires once under tested conditions;
- [ ] obsolete schedules are cancelled;
- [ ] duplicate actions are safe;
- [ ] quiet hours work;
- [ ] denied permission preserves reminders;
- [ ] Android/iOS notification matrices pass;
- [ ] notification privacy/localization passes; and
- [ ] reminder beta is approved.

---

# 15. Sprint 7 — Simple Personal Planner ✅ COMPLETE

**Duration:** 2 weeks  
**Primary outcome:** Complete offline day/week/month/year personal planning  
**Release checkpoint:** Planner beta  

## 15.1 Sprint Goal

Deliver simple personal planning without project-management or institutional complexity.

## 15.2 Planner Deliverables

- daily page;
- weekly page;
- monthly page;
- yearly page;
- focus section;
- priorities;
- checklist;
- intentions;
- notes;
- reflection;
- optional custom section;
- add/edit/reorder section;
- show/hide optional section;
- add/edit/reorder item;
- target date;
- complete/reopen;
- reflection;
- delete/restore;
- local autosave;
- recovery history; and
- Today contribution.

## 15.3 Copy and Carry-Forward Deliverables

- preview source content;
- select eligible items;
- merge/replace/cancel when target exists;
- exclude date-bound event duplication;
- source relationship;
- repeat-safe confirmation; and
- visible result.

## 15.4 Quality Deliverables

- all four planning periods;
- large page behavior;
- autosave timing;
- app backgrounding;
- restart;
- carry-forward duplication;
- merge/replace/cancel;
- item ordering;
- Recently Deleted;
- conflict-ready snapshots;
- private-content diagnostics scan;
- four-language planner review; and
- accessibility editor review.

## 15.5 Backend Dependency

Backend shall stabilize:

- planner page/section/item contract;
- completion;
- carry-forward;
- delete/restore;
- version/conflict;
- revision summary; and
- Today planner result.

Backend templates are not required.

## 15.6 Sprint Demo

Demonstrate:

1. create monthly plan offline;
2. edit sections/items;
3. autosave and restart;
4. complete item;
5. copy previous week;
6. carry item forward;
7. Today update; and
8. restore deleted item.

## 15.7 Sprint Exit Gate

- [ ] all periods work offline;
- [ ] autosave meets target;
- [ ] restart preserves content;
- [ ] carry-forward is repeat-safe;
- [ ] date-bound events are not copied;
- [ ] Recently Deleted works;
- [ ] privacy/localization/accessibility pass;
- [ ] no backend template dependency exists; and
- [ ] planner beta is approved.

---

# 16. Sprint 8 — Private Notes, Local Search and Complete Recently Deleted ✅ COMPLETE

**Duration:** 2 weeks  
**Primary outcome:** Complete guest planner beta  
**Release checkpoint:** Complete guest beta  

## 16.1 Sprint Goal

Complete the guest core with private notes, cross-domain local search and recovery.

## 16.2 Note Deliverables

- create/edit/autosave;
- view;
- pin/unpin;
- archive/unarchive;
- delete/restore;
- permanent-delete confirmation;
- limited revision recovery;
- event link;
- reminder link;
- planner link;
- mixed Ethiopic/Latin support;
- private preview behavior; and
- conflict-ready snapshots.

## 16.3 Search Deliverables

- search events;
- search reminders;
- search planner items;
- search notes;
- content-type filter;
- date filter;
- calendar/category filter;
- archive filter;
- Recently Deleted filter;
- result-type distinction;
- deterministic order;
- offline operation; and
- large-data performance.

## 16.4 Recently Deleted Deliverables

- unified eligible deleted list;
- content-type filter;
- deletion/expiry information;
- restore;
- permanent-delete confirmation;
- notification cleanup/rebuild;
- one restored result; and
- account-scope isolation.

## 16.5 Complete Guest Beta Verification

Verify complete guest journeys:

- first launch;
- Today;
- Calendar;
- events;
- recurrence;
- reminders;
- local notifications;
- planner;
- notes;
- search;
- Recently Deleted;
- settings;
- four languages;
- offline/restart; and
- local cleanup warning.

## 16.6 Backend Dependency

Backend shall stabilize:

- notes and link contract;
- search contract;
- Recently Deleted/tombstone outcomes;
- identity API production candidate; and
- sync/guest-import API beta for Sprint 10.

## 16.7 Sprint Demo

Demonstrate:

1. create private note offline;
2. link to event/reminder/planner;
3. search mixed scripts;
4. delete and restore;
5. permanent-delete warning;
6. full guest journey in airplane mode;
7. restart preservation; and
8. private-data diagnostic scan.

## 16.8 Sprint Exit Gate

- [ ] notes work offline and survive restart;
- [ ] links open correct owned items;
- [ ] search meets target with 10,000+ representative records;
- [ ] Recently Deleted is complete;
- [ ] private text is absent from diagnostics;
- [ ] four-language guest journey passes;
- [ ] accessibility guest journey passes;
- [ ] complete guest beta is approved; and
- [ ] Sprint 9 identity contract is production-candidate.

---

# 17. Sprint 9 — Registration, Account Sessions and Synchronized Settings

**Duration:** 2 weeks  
**Primary outcome:** A guest can create or enter a secure registered account  
**Release checkpoint:** Account alpha  

## 17.1 Sprint Goal

Deliver the complete account lifecycle without importing guest data yet.

## 17.2 Authentication Deliverables

- registration;
- verification pending;
- verification resend;
- verification deep link;
- sign-in;
- session restoration;
- forgotten password;
- password-reset deep link;
- expired/revoked state;
- sign-out;
- sign-out-all;
- session list;
- device list;
- session revocation;
- device revocation; and
- generic account-recovery responses.

## 17.3 Account-Scope Deliverables

- create registered local scope;
- switch from guest to account context safely;
- retain guest scope before import;
- protect authentication credentials;
- preserve unsynchronized local information;
- sign-out-and-retain option;
- sign-out-and-remove option;
- clear destructive confirmation; and
- two-account isolation.

## 17.4 Settings Account Integration

Prepare eligible registered settings for the account scope and Sprint 10 synchronization:

- language code;
- calendar display;
- primary timezone;
- home timezone;
- week start;
- numeral preference;
- appearance;
- quiet hours; and
- default reminder time.

Bundled content selection remains local unless explicitly approved in the contract.

Remote exchange of these settings is activated and proven through the common synchronization pipeline in Sprint 10.

## 17.5 Quality Deliverables

- successful/failed registration;
- verification expiry/resend;
- login/session renewal;
- revoked/expired session;
- reset expiry;
- account enumeration review;
- secure credential storage review;
- two-account isolation;
- sign-out choices;
- deep-link security;
- four-language authentication; and
- accessible authentication.

## 17.6 Backend Dependency

Backend identity, device/session and settings APIs must be stable and deployed to the integration environment before sprint midpoint.

Backend sync/guest-import APIs must be stable for Sprint 10 refinement.

## 17.7 Sprint Demo

Demonstrate:

1. guest registration;
2. email verification;
3. sign-in;
4. session restoration;
5. password reset;
6. session/device list;
7. sign-out choices; and
8. two-account local isolation.

## 17.8 Sprint Exit Gate

- [ ] identity lifecycle passes;
- [ ] deep links pass;
- [ ] protected credential review passes;
- [ ] revoked session/device behavior passes;
- [ ] guest data remains separate before import;
- [ ] sign-out choices work;
- [ ] eligible settings are account-scoped and ready for Sprint 10 synchronization;
- [ ] account alpha is approved; and
- [ ] Sprint 10 sync/guest-import backlog is fully ready.

---

# 18. Sprint 10 — Guest Import and Synchronization Foundation

**Duration:** 2 weeks  
**Primary outcome:** Guest import and the common synchronization pipeline are proven with foundation domains  
**Release checkpoint:** Sync foundation beta  

## 18.1 Sprint Goal

Deliver the guest-import workflow and common incremental synchronization pipeline without silent loss or duplication, initially proving the pipeline with settings, calendars, categories, events and event recurrence.

## 18.2 Guest Import Deliverables

- eligible-data inventory;
- import review;
- dependency-safe order;
- import progress;
- interruption recovery;
- accepted outcome;
- rejected outcome;
- retryable outcome;
- preserved local IDs;
- resulting server versions;
- retained failed local items;
- repeat-safe import;
- safe completion;
- optional guest-scope cleanup after confirmation; and
- support reference for unresolved failure.

The first stage shall import:

- settings required by the account;
- calendars;
- categories;
- events;
- event recurrence; and
- event occurrence exceptions.

Guest reminders, planner content and notes shall remain safely stored and visibly pending until Sprint 11 enables their import and synchronization. The app shall not describe a partial import as complete.

## 18.3 Incremental Sync Deliverables

- pending mutation queue;
- ordered device changes;
- push;
- pull;
- safe retry;
- duplicate-operation replay;
- server-version apply;
- remote-change apply;
- delete apply;
- restore apply;
- cursor acknowledgement after local commit;
- connectivity recovery;
- manual retry;
- status summary; and
- revoked-device stop.

## 18.4 Domain Synchronization Scope

Enable and prove synchronization for:

- settings;
- calendars;
- categories;
- events;
- recurrence/exceptions;
- deletion; and
- restoration.

The common pipeline shall already support extension to the remaining domains without a second incompatible protocol.

## 18.5 Quality Deliverables

- response-loss retry;
- duplicate operation;
- partial batch;
- dependency failure;
- network interruption;
- app termination;
- cursor commit failure;
- delete/restore;
- long pending queue;
- two accounts;
- revoked device;
- no ID replacement; and
- no silent accepted-data loss.

## 18.6 Backend Dependency

Backend must provide stable:

- guest-import endpoint;
- push/pull;
- cursor acknowledgement;
- mutation receipts;
- tombstones;
- domain payload contracts;
- device sequencing;
- idempotent outcomes;
- sync error catalogue; and
- sync metrics for joint testing.

## 18.7 Sprint Demo

Demonstrate:

1. guest with full planner data;
2. registration/import review;
3. interrupted import;
4. safe retry;
5. preserved IDs;
6. offline edit;
7. reconnect/sync once; and
8. another device receives the event change.

## 18.8 Sprint Exit Gate

- [ ] guest import preserves IDs;
- [ ] accepted item appears once;
- [ ] failed items remain recoverable;
- [ ] remaining guest domains stay safely pending;
- [ ] response-loss retry is idempotent;
- [ ] cursor is acknowledged only after local commit;
- [ ] settings/calendars/categories/events synchronize;
- [ ] common sync pipeline is reusable by remaining domains;
- [ ] no silent loss is observed;
- [ ] sync foundation beta is approved; and
- [ ] Sprint 11 remaining-domain contracts are stable.

---

# 19. Sprint 11 — Domain Synchronization and Multi-Device Convergence

**Duration:** 2 weeks  
**Primary outcome:** Every included private domain is cloud-backed and converges across registered devices  
**Release checkpoint:** Cloud-sync beta  

## 19.1 Sprint Goal

Extend the proven synchronization pipeline and guest import to reminders, planner content, notes and links, then demonstrate ordinary multi-device convergence.

## 19.2 Remaining Guest Import Deliverables

- reminders;
- reminder recurrence;
- reminder exceptions;
- reminder occurrence state;
- notification rules;
- planner pages;
- planner sections;
- planner items;
- planner recovery information where eligible;
- notes;
- note recovery information where eligible;
- note-to-event links;
- note-to-reminder links;
- note-to-planner links;
- per-item accepted/rejected/retryable outcomes;
- dependency-safe ordering; and
- final import completion summary.

Guest-scope cleanup shall be offered only after every accepted result is committed locally and every rejected/retryable item remains recoverable.

## 19.3 Remaining Domain Synchronization

Enable and prove synchronization for:

- reminders;
- reminder recurrence and exceptions;
- reminder occurrence actions;
- notification rules and schedule revisions;
- planner pages, sections and items;
- planner carry-forward outcomes;
- notes;
- eligible note links;
- Recently Deleted;
- restoration; and
- settings not completed in Sprint 10.

## 19.4 Multi-Device Deliverables

- device A create → device B;
- device A update → device B;
- reminder completion convergence;
- snooze/skip/cancel convergence;
- planner completion/order convergence;
- note pin/archive convergence;
- deletion and restoration convergence;
- Today convergence;
- Recently Deleted convergence;
- local notification schedule reconciliation;
- long-pending-queue recovery;
- revoked-device stop; and
- two-account isolation.

Complex concurrent conflicts and forced full resynchronization are completed in Sprint 12.

## 19.5 Quality Deliverables

- complete guest import;
- partial remaining-domain failure;
- response loss;
- duplicate domain action;
- cross-domain dependency;
- notification schedule replacement;
- two devices;
- offline device reconnect;
- revoked device;
- two local accounts;
- deletion/restoration;
- planner ordering;
- note-link identity; and
- no silent accepted-data loss.

## 19.6 Backend Dependency

Backend must provide production-candidate:

- all Phase 1 domain sync payloads;
- reminder occurrence actions;
- notification schedule revision;
- planner carry-forward;
- note links;
- tombstones/restoration;
- device status;
- complete guest-import outcomes; and
- sync monitoring for all included domains.

Backend full-resync and conflict APIs must be stable for Sprint 12.

## 19.7 Sprint Demo

Demonstrate:

1. complete guest import across all domains;
2. rejected item remains recoverable;
3. reminder action reaches another device;
4. planner update reaches another device;
5. note link reaches another device;
6. delete/restore convergence;
7. notification schedule reconciliation; and
8. revoked device denied.

## 19.8 Sprint Exit Gate

- [ ] every included domain imports safely;
- [ ] every included domain synchronizes;
- [ ] notification schedules reconcile;
- [ ] two ordinary devices converge;
- [ ] revoked devices stop remote work;
- [ ] two accounts remain isolated;
- [ ] guest cleanup cannot destroy failed items;
- [ ] no accepted change is silently lost;
- [ ] cloud-sync beta is approved; and
- [ ] Sprint 12 full-resync/conflict backlog is fully ready.

---

# 20. Sprint 12 — Multi-Device Recovery, Full Resync, Conflict Center and Privacy

**Duration:** 2 weeks  
**Primary outcome:** Registered users recover safely from concurrent and stale-device conditions  
**Release checkpoint:** Registered-user beta  

## 20.1 Sprint Goal

Complete full resynchronization, user-controlled conflict recovery and the registered-user privacy/account-recovery journey.

## 20.2 Full Resync Deliverables

- resync trigger;
- approved user/recovery entry;
- progress;
- bounded snapshot pages;
- interruption handling;
- unsynchronized-local preservation;
- account isolation;
- post-boundary change replay;
- cursor replacement;
- completion summary; and
- safe retry/restart.

## 20.3 Conflict Center Deliverables

- conflict list;
- content type;
- safe identifying summary;
- local version;
- synchronized version;
- conflict time;
- device information where approved;
- keep server;
- keep local;
- keep both where allowed;
- manual merge where supported;
- resolution progress;
- retry-safe resolution; and
- unresolved-state persistence.

## 20.4 Multi-Device Recovery Deliverables

- device A/create → device B;
- device A/update → device B;
- concurrent update conflict;
- update/delete conflict;
- delete/restore;
- stale device;
- revoked device;
- long offline period;
- Today convergence;
- notification-state convergence; and
- Recently Deleted convergence.

## 20.5 Privacy and Account Lifecycle Deliverables

- privacy-policy access;
- consent state where required;
- account-deletion request;
- deletion status;
- cancellation before irreversible boundary;
- final local cleanup behavior;
- revoked/deleted account handling;
- guest local-data disclosure;
- registered sign-out disclosure;
- notification privacy; and
- privacy-safe diagnostics.

## 20.6 Quality Deliverables

- mutation during full resync;
- app termination during snapshot;
- account switch during/after resync;
- invalid/expired resync token;
- duplicate resolution;
- keep-both identity;
- manual merge;
- conflict persistence;
- stale-device resurrection prevention;
- large account resync; and
- private conflict diagnostic scan;
- account-deletion request/cancellation;
- revoked/deleted account local behavior; and
- privacy-safe cleanup.

## 20.7 Backend Dependency

Backend must provide stable:

- full-resync start/page;
- signed boundary behavior;
- conflict payload;
- conflict resolution;
- tombstone retention behavior;
- stale-cursor behavior;
- device revocation; and
- privacy consent;
- account-deletion request/status/cancellation;
- production-shaped integration environment.

## 20.8 Sprint Demo

Demonstrate:

1. two devices edit same note;
2. both versions preserved;
3. resolve conflict;
4. update/delete conflict;
5. force full resync;
6. make concurrent change during resync;
7. complete without loss; and
8. request/cancel account deletion and show local privacy behavior.

## 20.9 Sprint Exit Gate

- [ ] two devices converge;
- [ ] conflict preserves both versions;
- [ ] resolution is repeat-safe;
- [ ] full resync preserves concurrent changes;
- [ ] unsynchronized local changes are not discarded;
- [ ] stale device cannot silently resurrect permanent deletion;
- [ ] account isolation passes;
- [ ] account deletion/request/cancellation works;
- [ ] revoked/deleted account behavior is safe;
- [ ] privacy-safe diagnostics pass;
- [ ] registered-user beta is approved; and
- [ ] no critical sync defect remains.

---

# 21. Sprint 13 — Accessibility, Security and Performance Hardening ✅ COMPLETE

**Duration:** 2 weeks  
**Primary outcome:** Production-quality release candidate  
**Release checkpoint:** Release candidate  

## 21.1 Sprint Goal

Close cross-product accessibility, localization, security, performance and operational gaps and produce a release candidate.

## 21.2 Accessibility Hardening

Verify all critical journeys for:

- screen reader;
- reading order;
- semantic labels;
- text scaling;
- contrast;
- touch targets;
- validation announcement;
- non-color status;
- reduced motion;
- dark mode; and
- four-language accessibility labels.

## 21.3 Localization Hardening

Complete:

- missing-key scan;
- English editorial review;
- Amharic review;
- Afaan Oromo review;
- Tigrinya review;
- calendar terminology review;
- notification wording review;
- error-message review;
- clipping/overflow review;
- store-text draft review; and
- translation sign-off.

## 21.4 Security Hardening

Complete:

- credential-storage review;
- deep-link review;
- account-isolation review;
- production configuration review;
- log/crash-data scan;
- notification privacy review;
- release-build review;
- local cleanup review;
- dependency/security scan;
- threat-model update; and
- remediation of critical/high findings.

## 21.5 Performance Hardening

Measure and meet:

- startup;
- Today render;
- Calendar navigation;
- local create/update;
- planner/note autosave;
- search with 10,000+ records;
- recurrence;
- notification rebuild;
- guest import;
- incremental sync;
- full resync;
- conflict list;
- local migration; and
- memory/battery behavior under approved scenarios.

## 21.6 Upgrade and Reliability Deliverables

- clean install;
- prior-version upgrade;
- local migration;
- interrupted migration recovery;
- application update with new content bundle;
- timezone change;
- clock change;
- device restart;
- API outage;
- backend recovery;
- notification rebuild; and
- crash/relaunch.

## 21.7 Backend Dependency

Backend must provide production-candidate:

- privacy/account deletion;
- all Phase 1 APIs;
- production error codes;
- rate-limit behavior;
- monitoring;
- backup/restore evidence;
- performance environment; and
- release version.

## 21.8 Sprint Demo

Demonstrate:

1. complete critical journey in all four languages;
2. screen-reader journey;
3. large-data performance;
4. account deletion/cancellation;
5. upgrade and content-bundle preservation;
6. secure sign-out/local cleanup;
7. API outage/recovery; and
8. release-candidate build.

## 21.9 Sprint Exit Gate

- [ ] all release performance targets pass;
- [ ] localization sign-off is complete;
- [ ] accessibility sign-off is complete;
- [ ] no critical/high mobile security finding remains;
- [ ] account deletion journey passes;
- [ ] clean install and upgrade pass;
- [ ] privacy-safe diagnostics pass;
- [ ] backend production candidate is compatible;
- [ ] release candidate is approved; and
- [ ] Sprint 14 UAT backlog is fully ready.

---

# 22. Sprint 14 — UAT, Production Artifacts and Store Readiness

**Duration:** 2 weeks  
**Primary outcome:** Production-approved Android and iOS release  
**Release checkpoint:** Production approval  

## 22.1 Sprint Goal

Complete formal acceptance, resolve release-blocking defects, produce signed artifacts and hand over the release.

## 22.2 UAT Deliverables

Formal UAT shall cover:

- guest onboarding;
- Today;
- Calendar/conversion;
- bundled content;
- events/recurrence;
- reminders/notifications;
- planner;
- notes;
- search;
- Recently Deleted;
- registration;
- guest import;
- synchronization;
- multi-device;
- Conflict Center;
- settings;
- sign-out;
- privacy/account deletion;
- four languages;
- accessibility; and
- offline recovery.

## 22.3 Android Deliverables

- final signed Android App Bundle;
- controlled-test artifact where required;
- application identity verification;
- deep-link verification;
- notification-channel verification;
- data-safety declaration;
- store metadata;
- screenshots/assets;
- privacy-policy link;
- support contact;
- version/release notes; and
- installation/upgrade proof.

## 22.4 iOS Deliverables

- final signed archive;
- TestFlight build;
- application identity verification;
- universal/deep-link verification;
- notification verification;
- privacy labels;
- store metadata;
- screenshots/assets;
- privacy-policy link;
- support contact;
- version/release notes; and
- installation/upgrade proof.

## 22.5 Operational Handover

- release checklist;
- known limitations;
- customer-support guide;
- troubleshooting guide;
- incident contact;
- monitoring dashboard access;
- crash/diagnostic handling;
- rollback/withdrawal procedure;
- signing custody;
- environment register;
- API compatibility record;
- content/translation approval record;
- test evidence archive; and
- go/no-go meeting.

## 22.6 Defect Rule

Sprint 14 shall not accept new product scope except:

- release-blocking legal requirement;
- release-blocking security requirement;
- store-mandated correction; or
- approved Severity 1/2 defect correction.

Non-critical improvements move to the post-Phase 1 backlog.

## 22.7 Sprint Exit Gate

- [ ] UAT is approved;
- [ ] no open Severity 1/2 defect remains;
- [ ] Android artifact is signed and verified;
- [ ] iOS artifact is signed and verified;
- [ ] store/privacy inputs are approved;
- [ ] production API compatibility passes;
- [ ] monitoring/support is active;
- [ ] rollback/withdrawal is documented;
- [ ] release evidence is complete; and
- [ ] Walia Nexus approves production release.

---

# 23. Backend Parallel Delivery Lane

The Flutter and backend teams shall coordinate through a shared dependency board.

| Sprint | Backend outcome required for Flutter |
|---:|---|
| 0 | API boundary, error conventions, calendar vectors, auth/sync contract drafts |
| 1 | API/worker foundation, integration environment plan |
| 2 | Calendar conversion contract and settings/calendar baseline |
| 3 | Identity API beta; event contract draft |
| 4 | Calendars/categories/event contract stable |
| 5 | Recurrence/exception/occurrence-key contract stable |
| 6 | Reminder/action/notification-rule contract stable |
| 7 | Planner contract stable |
| 8 | Notes/search/deletion contract stable; identity production candidate |
| 9 | Identity/settings deployed; sync and guest-import beta stable |
| 10 | Push/pull/ack/import/tombstones deployed for foundation domains |
| 11 | All Phase 1 domain sync payloads and multi-device operations production candidate |
| 12 | Full resync, conflict, privacy/account deletion and device-revocation production candidate |
| 13 | Monitoring, performance and production API release candidate |
| 14 | Production API/worker release, migration and operational approval |

## 23.1 Dependency Escalation

If a required backend contract misses its readiness date:

1. do not invent a temporary incompatible mobile contract;
2. preserve local guest delivery;
3. use the approved contract mock only for isolated verification;
4. record the integration risk;
5. re-plan affected acceptance; and
6. do not mark integrated scope Done until real-environment tests pass.

---

# 24. Design, Content and Localization Lane

## 24.1 Design Lead Time

Design shall remain at least one sprint ahead.

Required design sequence:

| Ready by | Designs required |
|---:|---|
| Sprint 0 end | Sprint 1 foundation and Sprint 2 calendar |
| Sprint 1 end | Sprint 3 Today/Calendar |
| Sprint 2 end | Sprint 4 events |
| Sprint 3 end | Sprint 5 recurrence and Sprint 6 reminders | ✅ Done |
| Sprint 5 end | Sprint 7 planner | ✅ Done |
| Sprint 6 end | Sprint 8 notes/search/deleted | ✅ Done |
| Sprint 7 end | Sprint 9 authentication/settings | ⏳ Blocked by backend |
| Sprint 8 end | Sprint 10 guest import/sync foundation | ⏳ Blocked by backend |
| Sprint 9 end | Sprint 11 remaining-domain sync and multi-device |
| Sprint 10 end | Sprint 12 conflicts/full resync/privacy |
| Sprint 11 end | Sprint 13 accessibility/security/performance hardening | ✅ Done |
| Sprint 12 end | Sprint 14 UAT/store/release states |

## 24.2 Localization Lead Time

For each sprint:

- English source text is frozen before refinement;
- translations are available before implementation closes;
- language review occurs before sprint acceptance;
- disputed terminology is resolved through the glossary owner;
- missing keys block acceptance of critical journeys; and
- localization defects are not deferred automatically to Sprint 13.

## 24.3 Bundled Content Governance

Before calendar-content acceptance:

- source/authority is recorded;
- date basis is explicit;
- fixed/recurring/estimated status is explicit;
- four-language text is reviewed;
- cultural/religious sensitivity is reviewed;
- legal public-holiday wording is checked;
- content identifier is stable; and
- release approval is recorded.

---

# 25. QA and Test Execution Lane

## 25.1 Continuous Regression

At the end of every sprint, regression shall cover at minimum:

- app launch;
- guest scope;
- language switching;
- calendar conversion;
- offline restart;
- local data migration;
- Today;
- previously delivered feature journeys;
- account isolation where available;
- notification schedules where affected; and
- production-build sanity.

## 25.2 Calendar Regression

The complete calendar reference suite runs:

- in Sprint 2;
- whenever calendar logic changes;
- whenever recurrence logic changes;
- before every beta checkpoint;
- before release candidate; and
- before production approval.

## 25.3 Device Matrix

Every sprint shall use:

- at least one representative low-cost Android device or approved equivalent;
- at least one mainstream Android device;
- at least one supported iPhone;
- one supported large-text configuration;
- one screen-reader configuration; and
- one constrained/offline network scenario.

The full approved device matrix runs at Checkpoints B, C, D and E.

## 25.4 Defect Severity

| Severity | Meaning | Sprint/release rule |
|---|---|---|
| Severity 1 | Data loss, security compromise, unusable core app, materially wrong calendar date | Immediate stop; cannot release |
| Severity 2 | Major core journey failure, duplicate reminder, cross-account exposure, unrecoverable sync | Must close before checkpoint/release |
| Severity 3 | Functional defect with reasonable workaround | Product owner decides sprint/release disposition |
| Severity 4 | Cosmetic or minor usability issue | May enter prioritized follow-up backlog |

Any cross-user exposure is release-blocking regardless of frequency.

---

# 26. Sprint Ceremony and Evidence

## 26.1 Refinement

Refinement shall confirm:

- Definition of Ready;
- acceptance scenarios;
- dependencies;
- language/content readiness;
- design states;
- backend contract;
- offline behavior;
- testing scope; and
- sprint capacity.

## 26.2 Sprint Planning

Planning shall produce:

- committed sprint goal;
- selected ready backlog;
- dependency owner;
- demo scenario;
- QA plan;
- backend integration plan;
- localization review date;
- accessibility review date; and
- risk list.

## 26.3 Mid-Sprint Review

By sprint midpoint:

- high-risk journey is demonstrable;
- backend contract has been exercised where applicable;
- calendar/localization issues are visible;
- blocking defects are escalated;
- scope change is controlled; and
- test execution has started.

## 26.4 Sprint Review

Review shall demonstrate customer outcomes on representative devices, including offline behavior where applicable.

Slides or screenshots alone do not prove sprint acceptance.

## 26.5 Retrospective

Retrospective shall review:

- committed versus accepted scope;
- defect escape;
- dependency delay;
- review bottlenecks;
- localization delay;
- device/testing delay;
- rework; and
- one or two measurable process improvements.

---

# 27. Sprint Metrics

Track:

- committed versus accepted backlog;
- carry-over count;
- escaped defects;
- Severity 1/2 defect count;
- automated verification pass rate;
- calendar regression pass rate;
- localization completion;
- accessibility completion;
- backend dependency readiness;
- average age of blocked item;
- app startup/Today/search performance;
- synchronization failure rate when enabled;
- duplicate-notification findings;
- crash-free test sessions;
- UAT pass rate; and
- release-gate completion.

Metrics shall be used for planning and quality, not individual employee scoring.

---

# 28. Key Risks and Sprint Controls

| Risk | Earliest control | Ongoing control | Release evidence |
|---|---|---|---|
| Ethiopian calendar defect | Sprint 0 reference suite | Regression every relevant sprint | Full reference pass |
| Incorrect bundled date | Sprint 0 source register | Content review/version control | Content approval record |
| Four-language delay | Sprint 0 reviewer assignment | One-sprint-ahead translation | Four-language sign-off |
| Offline data loss | Sprint 1 persistence/restart tests | Per-feature offline tests | Long-offline/UAT evidence |
| Cross-account leakage | Sprint 1 scope isolation | Negative tests every account feature | Full isolation security pass |
| Duplicate reminder | Sprint 6 stable identity/rebuild tests | Notification regression | Duplicate-rate evidence |
| Sync duplication/loss | Sprint 10 idempotency/cursor tests | Failure/concurrency tests | Multi-device/full-resync pass |
| Conflict overwrite | Sprint 8 conflict-ready snapshots | Sprint 12 Conflict Center | Preserve-both evidence |
| Backend delay | Sprint 0 dependency calendar | One-sprint-early contract target | Integration completion |
| Low-cost-device performance | Sprint 1 representative device | Per-checkpoint performance | Target pass |
| Store rejection | Sprint 0 support matrix/privacy plan | Sprint 13 preflight | Store-ready package |
| Scope expansion | Explicit Phase 1 exclusions | Change control | Deferred backlog |

---

# 29. Change-Control Rule

A new requirement may enter the active Phase 1 release only when:

1. it is required for calendar correctness, security, privacy, store compliance or an existing accepted journey;
2. impact on schedule and quality is assessed;
3. displaced work is identified;
4. product owner approves;
5. architecture/backend/design/QA impacts are reviewed; and
6. sprint goal remains achievable.

New commercial, administrative, institutional or convenience features go to the post-Phase 1 backlog.

---

# 30. Deferred Backlog

The following shall not be inserted into Sprints 0–14:

```text
backend-managed calendar content
remote calendar-pack updates
translation administration
administrator portal
roles and permission administration
organization tenancy
team workspaces
shared calendars
institutional workflows
approval chains
employee assignment
KPI or performance management
project management
server push reminder delivery
server notification inbox
file attachments
camera/document upload
Print Studio
PDF generation
personal-data export files
backend-managed templates
template marketplace
subscriptions
entitlements
payments
app-store purchase verification
advanced analytics
behavioral profiling
public events
polls
event questions
external calendar synchronization
ICS import/export
family sharing
shared notes
voice entry
natural-language scheduling
home-screen widgets
wearables
desktop applications
```

---

# 31. Final Phase 1 Release Gate

Production release requires approval of all categories below.

## 31.1 Product

- [ ] Guest core is complete.
- [ ] Registered core is complete.
- [ ] No deferred feature blocks a journey.
- [ ] UAT is approved.
- [ ] Known limitations are accepted.

## 31.2 Calendar and Content

- [ ] Full calendar reference suite passes.
- [ ] No Severity 1/2 calendar defect remains.
- [ ] Bundled content dates are approved.
- [ ] Content source/review evidence is complete.
- [ ] Four-language content is approved.

## 31.3 Offline and Notifications

- [ ] Airplane-mode core journeys pass.
- [ ] Restart preserves data and pending changes.
- [ ] Notification permission behavior passes.
- [ ] Duplicate/obsolete notification tests pass.
- [ ] Platform limitation guidance is accurate.

## 31.4 Synchronization

- [ ] Guest import is repeat-safe.
- [ ] IDs are preserved.
- [ ] Incremental sync is idempotent.
- [ ] Multi-device convergence passes.
- [ ] Full resync preserves concurrent changes.
- [ ] Conflicts preserve both versions.
- [ ] Revoked device behavior passes.
- [ ] No accepted-data loss remains.

## 31.5 Quality

- [ ] English is approved.
- [ ] Amharic is approved.
- [ ] Afaan Oromo is approved.
- [ ] Tigrinya is approved.
- [ ] Accessibility is approved.
- [ ] Performance targets pass.
- [ ] Android/iOS device matrix passes.
- [ ] No open Severity 1/2 defect remains.

## 31.6 Security and Privacy

- [ ] Account isolation passes.
- [ ] Protected credential storage passes.
- [ ] Log/crash privacy scan passes.
- [ ] Deep-link security passes.
- [ ] Notification privacy passes.
- [ ] Account deletion/local cleanup passes.
- [ ] No unresolved critical/high security issue remains.

## 31.7 Release and Operations

- [ ] Android production artifact is verified.
- [ ] iOS production artifact is verified.
- [ ] Store/privacy inputs are approved.
- [ ] Production backend compatibility passes.
- [ ] Monitoring and support are ready.
- [ ] Rollback/withdrawal is documented.
- [ ] Release evidence is archived.
- [ ] Walia Nexus gives final approval.

---

# 32. Recommended Start

Authorize Sprint 0 only after:

- Flutter Delivery Specification approval;
- Backend Delivery Specification approval;
- product owner assignment;
- calendar authority/reviewer assignment;
- translation reviewer assignment;
- test-device access;
- backend integration owner assignment; and
- release decision ownership.

The first execution sequence is:

```text
Sprint 0 — readiness ✅
Sprint 1 — app/local foundation ✅
Sprint 2 — calendar and bundled content ✅
Sprint 3 — guest Today/Calendar ✅
Sprint 4 — events ✅
Sprint 5 — recurrence ✅
Sprint 6 — reminders/local notifications ✅
Sprint 7 — planner ✅
Sprint 8 — notes/search/Recently Deleted ✅
Sprint 9 — identity/settings (blocked by backend)
Sprint 10 — guest import and sync foundation (blocked by backend)
Sprint 11 — domain sync and multi-device convergence (blocked by backend)
Sprint 12 — conflicts, full resync and privacy (blocked by backend)
Sprint 13 — accessibility, security and performance hardening ✅
Sprint 14 — UAT and production release
```

---

**End of Flutter Core Phase 1 Development-Ready Sprint Plan**
