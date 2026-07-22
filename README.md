# Ethio Planner

Customer-facing **Flutter** app for the *Ethiopian Calendar, Reminder, Simple
Planner and Custom Print SaaS Platform* (Walia Nexus). Ethiopian-first, bilingual
(English / Amharic), offline-first, Android + iOS.

## Documentation

- Development contract: [`CLAUDE.md`](CLAUDE.md)
- Full plan: [`DEVELOPMENT_PLAN.md`](DEVELOPMENT_PLAN.md)
- Requirements: [`docs/requirements/`](docs/requirements)
  - `Walia_Nexus_Flutter_Planner_App_Clean_Functional_Requirements.md` (primary)
  - `Ethiopian_Calendar_Planner_SRS.md`
  - `Claude_Code_Master_Prompt_Flutter_Planner_App.md`

## Project layout

```
lib/
  app/            composition root (bootstrap, App widget)
  core/           config, database, network, sync, notifications, theme, ...
  features/       today, calendar, reminders, planner, print (per-phase)
  shared/         reusable widgets and helpers
packages/
  ethiopian_calendar_core/   pure-Dart calendar conversion + validation (+tests)
integration_test/            on-device smoke / offline-sync suite
test/                        unit + widget tests
```

## Prerequisites

- Flutter SDK ≥ 3.38.4 (Dart ≥ 3.12.2), pinned per `pubspec.lock`.

## Run

```bash
flutter pub get
flutter run -t lib/main_development.dart      # dev flavor
```

Flavor entrypoints: `lib/main_development.dart`, `lib/main_staging.dart`,
`lib/main_production.dart`.

## Verify

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
dart test -C packages/ethiopian_calendar_core     # pure-Dart core
dart run build_runner build --delete-conflicting-outputs
```
