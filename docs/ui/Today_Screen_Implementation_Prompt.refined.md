# Refined Prompt — Implement the Today (Home) Screen

> Refines the original "Implement the Flutter Home Page — Today Screen" prompt to
> agree with the source-of-truth documents and the real repository. Changes from
> the original are marked **[CHANGED]** with rationale.

## Role
Senior Flutter Engineer + Mobile UI Architect + Accessibility Specialist +
Localization Engineer. Implement the production Today/Home screen and only the
reusable components it needs.

## Sources of truth (read fully first)
1. `docs/requirements/Walia_Nexus_Flutter_Planner_App_Clean_Functional_Requirements.md` (primary)
2. `docs/requirements/Ethiopian_Calendar_Planner_SRS.md`
3. **[CHANGED]** Design reference is in the repo: `docs/ui/today or home screen ui.png`
   (visual reference only — the SRS governs behaviour).

## [CHANGED] Language scope — English + Amharic only
The SRS (`LOC-FR-001`) mandates **English and Amharic**. Afaan Oromo (`om`) and
Tigrinya (`ti`) are **out of scope for Version 1** and must not be added until
native-speaker translation review is complete. Implement `en` + `am` now; track
`om`/`ti` as a documented follow-up. All four are LTR when eventually added.

ARB location follows Flutter tooling: `lib/l10n/app_en.arb`, `lib/l10n/app_am.arb`,
generated via `l10n.yaml` (`synthetic-package: false`, output `lib/l10n/generated/`).

## [CHANGED] Screen scope — Phase 1A/1B only
The SRS schedules Focus, Priorities, Checklist, Quick Note and Reflection for
**Phase 1C** (`TODAY-FR-005…009`), and the design image does not show them. Do
**not** implement them now. The Today screen for this task is:

```
Top App Bar (app title, search, account)
Dual Calendar Date Header (EC primary + GC secondary)   TODAY-FR-001, CAL-FR-003
Holiday / Observance (name + type, not a generic badge)  TODAY-FR-002, PACK-FR-*
Synchronization Status (9 states, honest, not colour-only) SYNC-FR-004/005
Up Next                                                   TODAY-FR-010
Events                                                    TODAY-FR-003
Reminders (complete/undo, overdue as text+badge)          TODAY-FR-004, REM-FR-*
Floating Quick Add (Event / Reminder / Note)              APP-FR-002
Bottom Navigation (exactly 4: Today/Calendar/Planner/More) APP-FR-001
```
Focus/Priorities/Checklist/QuickNote/Reflection are deferred to the Phase 1C prompt.

## [CHANGED] Navigation — fix the existing 5-tab bug
The repo currently ships **5** bottom destinations (…Reminders, Print). Replace
with exactly **4**: Today, Calendar, Planner, More. Reminders and Print move to
**More** / Quick Add / notifications, per `APP-FR-001` and the design.

## Architecture (unchanged, must follow the existing repo)
- Riverpod controller exposes a prepared, immutable `TodayViewState`
  (freezed). Ethiopian conversion happens in the controller via
  `packages/ethiopian_calendar_core`, never in a widget.
- Widgets format and render only; no Drift/Dio/Firebase/DAO access in widgets.
- go_router for navigation; generated `AppLocalizations` for all chrome text;
  centralized theme tokens (`core/theme/*`) — no hard-coded colours/strings.
- Reuse existing design-system widgets (`AppCard`, `SectionHeader`,
  `CheckboxTile`, `StatusBadge`, `PrimaryButton`).

## [CHANGED] Sample data is explicit
Event/reminder repositories land in Phase 1B. Until then the controller may
supply clearly-labelled sample content so the screen and tests exist; the
Ethiopian date must still be computed for real from `clock.now()`.

## [CHANGED] Commands — environment note
Run and report the real output of the commands below. **They cannot be run in an
environment without the Flutter SDK installed; do not claim success unless they
actually ran.** The screen depends on generated code, so it compiles only after:
```
flutter pub get                                   # also runs gen-l10n
dart run build_runner build --delete-conflicting-outputs
dart format . && flutter analyze && flutter test
flutter build apk --debug
```

## Final report must include
Requirement IDs covered; design changes vs the image; files created/modified;
localization files + terms needing native review; supported UI states;
accessibility work; real command results (or a clear statement they could not be
run and why); unresolved issues. Screenshots require a running device/emulator.

Stop after the Today screen; do not proceed to another screen without approval.
