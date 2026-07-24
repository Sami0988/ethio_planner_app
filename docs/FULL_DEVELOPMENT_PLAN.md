# Ethio Planner — 4-Week Daily Plan

**Date:** 24 July 2026  
**Current Status:** ~65% done (Sprints 0–2 complete)  
**Target:** Phase 1 complete in 20 working days  
**Cadence:** Daily tasks, sequential dependency chain

---

## Week 1 — Foundation + Calendar + Today

### Day 1 (Mon) — Foundation Hardening
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Run `dart analyze` — fix ALL warnings to zero | Full project | 3h |
| 2 | Add typed failure classes | `lib/core/errors/failures.dart` | 2h |
| 3 | Remove full-body request/response logging | `lib/core/network/interceptors/` | 1h |

**Exit Gate:** `dart analyze` returns zero warnings

### Day 2 (Tue) — Drift Streams + Account Isolation
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Wire Drift `watch` into calendar controller | `lib/features/calendar/presentation/controllers/calendar_controller.dart` | 2h |
| 2 | Wire Drift `watch` into reminders controller | `lib/features/reminders/presentation/controllers/reminders_controller.dart` | 2h |
| 3 | Wire Drift `watch` into planner controller | `lib/features/planner/presentation/controllers/planner_controller.dart` | 2h |
| 4 | Wire Drift `watch` into notes controller | `lib/features/notes/presentation/controllers/notes_controller.dart` | 2h |

**Exit Gate:** All controllers use reactive streams

### Day 3 (Wed) — Calendar Polish
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Calendar grid: highlight days with holidays | `lib/features/calendar/presentation/widgets/calendar_grid.dart` | 2h |
| 2 | Calendar grid: show holiday dot indicators | Same file | 1h |
| 3 | Day detail: show holiday card when tapping day with content | `lib/features/calendar/presentation/widgets/day_events_list.dart` | 2h |
| 4 | Settings: wire ContentPackSettings + CalendarSettings | `lib/features/settings/presentation/pages/settings_page.dart` | 3h |

**Exit Gate:** Calendar shows holidays, settings work

### Day 4 (Thu) — Guest Today
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Today page: wire real events from DAO | `lib/features/today/presentation/controllers/today_controller.dart` | 2h |
| 2 | Today page: wire real reminders from DAO | Same file | 1h |
| 3 | Today page: wire real planner items from DAO | Same file | 1h |
| 4 | Quick Add: create event from Today | `lib/features/today/presentation/widgets/quick_add_sheet.dart` | 2h |
| 5 | Quick Add: create reminder from Today | Same file | 1h |
| 6 | Empty states: helpful CTAs | `lib/features/today/presentation/widgets/today_empty_state.dart` | 1h |

**Exit Gate:** Today shows real data, quick-add works

### Day 5 (Fri) — Events & Categories
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Event form: add category picker | `lib/features/calendar/presentation/widgets/event_form_sheet.dart` | 2h |
| 2 | Event details page: full view with edit/delete | `lib/features/calendar/presentation/pages/event_detail_page.dart` | 3h |
| 3 | Event recurrence: wire recurrence rule to creation | `lib/features/calendar/presentation/widgets/event_form_sheet.dart` | 2h |
| 4 | Event color coding by category | Calendar grid + event cards | 1h |

**Exit Gate:** Events have categories, detail view works

---

## Week 2 — Reminders + Planner + Notes

### Day 6 (Mon) — Reminders
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Reminder form: wire to database | `lib/features/reminders/presentation/controllers/reminders_controller.dart` | 2h |
| 2 | Notification service: schedule local notifications | `lib/core/notifications/notification_service.dart` | 3h |
| 3 | Reminder list: overdue indicators + swipe actions | `lib/features/reminders/presentation/pages/reminders_page.dart` | 2h |
| 4 | Reminder recurrence: wire recurrence rule | `lib/features/reminders/presentation/widgets/reminder_form_sheet.dart` | 1h |

**Exit Gate:** Reminders save, notifications fire, overdue shows

### Day 7 (Tue) — Planner Views
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Weekly planner view | `lib/features/planner/presentation/pages/weekly_planner_page.dart` | 3h |
| 2 | Monthly planner view | `lib/features/planner/presentation/pages/monthly_planner_page.dart` | 3h |
| 3 | Planner item form: wire to database | `lib/features/planner/presentation/controllers/planner_controller.dart` | 2h |

**Exit Gate:** Weekly + monthly views work, items save

### Day 8 (Wed) — Planner Sections + Notes
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Section management (focus/errands/personal) | `lib/features/planner/presentation/widgets/section_manager.dart` | 2h |
| 2 | Notes form: wire to database | `lib/features/notes/presentation/controllers/notes_controller.dart` | 2h |
| 3 | Notes: pin/archive functionality | `lib/features/notes/presentation/pages/notes_page.dart` | 2h |
| 4 | Notes: link to events/reminders/planner | `lib/features/notes/` | 2h |

**Exit Gate:** Sections work, notes save/pin/archive

### Day 9 (Thu) — Search + Recently Deleted
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Global search: search all entity types | `lib/features/search/presentation/pages/search_page.dart` | 3h |
| 2 | Recently Deleted: populate on entity delete | `lib/features/recently_deleted/` | 2h |
| 3 | Recently Deleted: restore + permanent delete | Same file | 2h |
| 4 | Recently Deleted: 30-day auto-expiry | `lib/core/database/daos/recently_deleted_dao.dart` | 1h |

**Exit Gate:** Search finds everything, soft-delete works

### Day 10 (Fri) — Integration Day
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Fix all `dart analyze` warnings from this week | Full project | 3h |
| 2 | Run `build_runner` — verify all generated code | Full project | 1h |
| 3 | Test all CRUD flows end-to-end | Full app | 4h |

**Exit Gate:** Zero warnings, all flows tested

---

## Week 3 — Account + Sync + Polish

### Day 11 (Mon) — Auth Flow
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Auth: sign-up with email/password | `lib/features/auth/` | 3h |
| 2 | Auth: sign-in with email/password | Same file | 2h |
| 3 | Auth: sign-out + forgot password | Same file | 2h |
| 4 | Secure storage: store auth tokens | `lib/core/storage/auth_session.dart` | 1h |

**Exit Gate:** Auth flow works end-to-end

### Day 12 (Tue) — Account Isolation
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Account isolation: filter all DAOs by accountId | `lib/core/database/daos/` | 4h |
| 2 | Guest→Account migration: merge local data | `lib/features/auth/data/migration/` | 4h |

**Exit Gate:** Each account sees only their data

### Day 13 (Wed) — Sync Engine
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Sync engine: process outbox operations | `lib/features/sync/data/repositories/sync_repository_impl.dart` | 4h |
| 2 | Sync engine: conflict detection | Same file | 3h |
| 3 | Sync status: real banner | `lib/shared/widgets/sync_status_banner.dart` | 1h |

**Exit Gate:** Outbox processes, conflicts detected

### Day 14 (Thu) — Sync UI + Conflict Resolution
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Conflict resolution UI | `lib/features/conflict_center/presentation/pages/conflict_center_page.dart` | 3h |
| 2 | Sync: retry with backoff | `lib/features/sync/` | 2h |
| 3 | Sync settings: enable/disable | `lib/features/settings/` | 1h |
| 4 | Mock backend: implement API endpoints | `lib/core/network/mock_backend.dart` | 2h |

**Exit Gate:** Conflicts resolve, retry works, mock backend serves

### Day 15 (Fri) — Integration Day
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Fix all `dart analyze` warnings | Full project | 3h |
| 2 | Test auth + sync flows end-to-end | Full app | 3h |
| 3 | Test offline→online transition | Full app | 2h |

**Exit Gate:** Zero warnings, auth+sync tested

---

## Week 4 — Polish + Release

### Day 16 (Mon) — Accessibility + Performance
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Screen reader labels on all interactive elements | All widgets | 3h |
| 2 | Text scaling review (200%) | All pages | 2h |
| 3 | Lazy loading for calendar months | `lib/features/calendar/` | 2h |
| 4 | Edge cases: Pagume 5/6 handling | `packages/ethiopian_calendar_core/` | 1h |

**Exit Gate:** Accessibility audit passes, performance smooth

### Day 17 (Tue) — Error Handling + Edge Cases
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Network error UI on all pages | All pages | 3h |
| 2 | Database error recovery | All DAOs | 2h |
| 3 | Invalid date rejection | Calendar widgets | 1h |
| 4 | Privacy review: no secrets in logs | Full project | 2h |

**Exit Gate:** Errors handled gracefully, privacy clean

### Day 18 (Wed) — Testing
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Unit tests: calendar conversion | `packages/ethiopian_calendar_core/test/` | 2h |
| 2 | Unit tests: recurrence engine | `lib/core/recurrence/` | 2h |
| 3 | Widget tests: Today page | `test/features/today/` | 2h |
| 4 | Widget tests: Calendar grid | `test/features/calendar/` | 2h |

**Exit Gate:** Core tests pass

### Day 19 (Thu) — Release Prep
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Android: build signing config | `android/app/build.gradle` | 2h |
| 2 | iOS: provisioning profile + signing | Xcode | 2h |
| 3 | Version bump to 1.0.0 | `pubspec.yaml` | 0.5h |
| 4 | Final `dart analyze` + `flutter test` | Full project | 2h |
| 5 | Release notes | `RELEASE_NOTES.md` | 1.5h |

**Exit Gate:** Builds signed, version bumped, tests pass

### Day 20 (Fri) — Launch
| # | Task | File/Area | Time |
|---|------|-----------|------|
| 1 | Submit to Google Play (internal testing) | Play Console | 2h |
| 2 | Submit to App Store (TestFlight) | App Store Connect | 2h |
| 3 | Monitor crash reports | Firebase Crashlytics | 2h |
| 4 | Final review + sign-off | Full app | 2h |

**Exit Gate:** App submitted, no critical crashes

---

## Summary

| Week | Focus | Days |
|------|-------|------|
| 1 | Foundation + Calendar + Today + Events | Days 1–5 |
| 2 | Reminders + Planner + Notes + Search | Days 6–10 |
| 3 | Account + Sync + Mock Backend | Days 11–15 |
| 4 | Polish + Testing + Release | Days 16–20 |

## Critical Path

```
Day 1: Foundation (zero warnings)
  ↓
Day 2: Drift streams
  ↓
Day 3: Calendar polish (needs streams)
  ↓
Day 4: Guest Today (needs calendar)
  ↓
Day 5: Events (needs Today)
  ↓
Day 6: Reminders (needs events)
  ↓
Day 7: Planner views (needs events + reminders)
  ↓
Day 8: Notes (needs all entities)
  ↓
Day 9: Search + Recently Deleted (needs all entities)
  ↓
Day 10: Integration (needs everything)
  ↓
Day 11: Auth (needs everything working)
  ↓
Day 12: Account isolation (needs auth)
  ↓
Day 13: Sync (needs account isolation)
  ↓
Day 14: Sync UI + Mock backend
  ↓
Day 15: Integration (needs sync)
  ↓
Day 16: Accessibility + Performance
  ↓
Day 17: Error handling
  ↓
Day 18: Testing
  ↓
Day 19: Release prep
  ↓
Day 20: Launch
```
