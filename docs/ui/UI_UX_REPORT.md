# UI/UX Status Report — Ethio Planner

**Date:** 2026-07-23
**Project:** Walia Nexus Ethiopian Planner App (Flutter)

---

## 1. Project Structure

```
lib/
├── main.dart                          # Default entrypoint (development)
├── main_development.dart              # Dev flavor
├── main_staging.dart                  # Staging flavor
├── main_production.dart               # Production flavor
│
├── app/
│   ├── app.dart                       # MaterialApp.router root widget
│   └── bootstrap.dart                 # Composition root (ProviderScope + AppConfig)
│
├── core/
│   ├── config/
│   │   ├── app_config.dart            # Immutable env config (per flavor)
│   │   └── app_flavor.dart            # enum: development, staging, production
│   │
│   ├── constants/
│   │   ├── app_constants.dart         # Base URL, timeouts
│   │   └── app_breakpoints.dart       # Responsive breakpoints (600/840/1200/1440)
│   │
│   ├── database/
│   │   ├── tables.dart                # Drift tables (CalendarEvents, PlannerItems, Reminders, PrintJobs)
│   │   ├── app_database.dart          # Drift AppDatabase (schema v1)
│   │   └── app_database.g.dart        # Generated
│   │
│   ├── errors/
│   │   └── failures.dart              # Failure base: ServerFailure, CacheFailure, NetworkFailure
│   │
│   ├── extensions/
│   │   └── responsive_context.dart    # BuildContext extensions (isCompact/Medium/Expanded/Large)
│   │
│   ├── feature_flags/
│   │   └── feature_flags.dart         # FeatureFlags interface (all off)
│   │
│   ├── localization/
│   │   └── locale_provider.dart       # LocaleNotifier + supportedLocales [en, am]
│   │
│   ├── monitoring/
│   │   └── monitoring_service.dart    # Interface + NoopMonitoringService
│   │
│   ├── network/
│   │   ├── dio_client.dart            # Dio client with interceptors
│   │   ├── network_info.dart          # Connectivity providers
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart       # Bearer token from secure storage
│   │       └── refresh_interceptor.dart    # Auto-refresh on 401
│   │
│   ├── notifications/
│   │   ├── notification_service.dart  # FlutterLocalNotifications
│   │   └── notification_provider.dart
│   │
│   ├── providers/
│   │   ├── providers.dart             # Barrel export
│   │   ├── dio_provider.dart
│   │   ├── database_provider.dart
│   │   ├── secure_storage_provider.dart
│   │   ├── theme_mode_provider.dart   # ThemeModeNotifier (system/light/dark)
│   │   └── observers.dart            # AppObserver (Riverpod lifecycle logging)
│   │
│   ├── router/
│   │   ├── route_names.dart           # Route constants
│   │   ├── app_router.dart            # GoRouter with ShellRoute (4-tab nav)
│   │   └── shell_page.dart            # Bottom NavigationBar scaffold shell
│   │
│   ├── storage/
│   │   ├── storage.dart               # Barrel export
│   │   ├── secure_storage_service.dart
│   │   └── auth_session.dart          # AuthSessionNotifier
│   │
│   ├── sync/
│   │   └── sync_status.dart           # SyncStatus enum (9 states)
│   │
│   ├── theme/
│   │   ├── theme.dart                 # Barrel export
│   │   ├── app_colors.dart            # AppColorsLight + AppColorsDark + extensions
│   │   ├── app_text_styles.dart       # AppTextStyles (NotoSansEthiopic)
│   │   ├── app_spacing.dart           # AppSpacing (xs/sm/md/lg/xl/xxl)
│   │   ├── app_radii.dart             # AppRadii (sm/md/lg/pill)
│   │   └── app_theme.dart             # AppTheme.light + AppTheme.dark (Material3)
│   │
│   └── widgets/
│       └── responsive_layout.dart     # ResponsiveLayout widget + ScreenTier
│
├── features/
│   ├── today/                         ✅ COMPLETE UI
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── today_page.dart
│   │       ├── controllers/
│   │       │   └── today_controller.dart
│   │       ├── providers/
│   │       │   ├── today_view_state.dart
│   │       │   └── today_view_state.freezed.dart
│   │       ├── widgets/
│   │       │   ├── today_header.dart
│   │       │   ├── today_empty_state.dart
│   │       │   ├── up_next_card.dart
│   │       │   ├── event_list_card.dart
│   │       │   ├── today_reminders.dart
│   │       │   └── quick_add_sheet.dart
│   │       └── formatting/
│   │           └── today_date_formatter.dart
│   │
│   ├── calendar/                      ⚠️ PLACEHOLDER
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── calendar_event.dart
│   │   │   ├── repositories/
│   │   │   │   └── calendar_repository.dart
│   │   │   └── usecases/
│   │   │       └── get_calendar_events.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── calendar_event_model.dart
│   │   │   │   └── calendar_event_model.freezed.dart
│   │   │   ├── repositories/
│   │   │   │   └── calendar_repository_impl.dart  # UnimplementedError
│   │   │   └── datasources/
│   │   │       ├── calendar_local_datasource.dart  # UnimplementedError
│   │   │       └── calendar_remote_datasource.dart # UnimplementedError
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── calendar_page.dart  # Stub
│   │       └── widgets/
│   │           └── calendar_grid.dart  # Text('Calendar Grid')
│   │
│   ├── planner/                       ⚠️ PLACEHOLDER
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── planner_item.dart
│   │   │   ├── repositories/
│   │   │   │   └── planner_repository.dart  # TODO
│   │   │   └── usecases/
│   │   │       └── get_planner_items.dart   # TODO
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── planner_item_model.dart  # TODO
│   │   │   ├── repositories/
│   │   │   │   └── planner_repository_impl.dart # TODO
│   │   │   └── datasources/
│   │   │       ├── planner_local_datasource.dart  # TODO
│   │   │       └── planner_remote_datasource.dart # TODO
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── planner_page.dart    # Text('Planner')
│   │       └── widgets/
│   │           └── planner_card.dart    # Card(Text('Planner Item'))
│   │
│   ├── reminders/                     ⚠️ PLACEHOLDER
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── reminder.dart
│   │   │   ├── repositories/
│   │   │   │   └── reminder_repository.dart  # TODO
│   │   │   └── usecases/
│   │   │       └── get_reminders.dart        # TODO
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── reminder_model.dart       # TODO
│   │   │   ├── repositories/
│   │   │   │   └── reminder_repository_impl.dart # TODO
│   │   │   └── datasources/
│   │   │       ├── reminder_local_datasource.dart  # TODO
│   │   │       └── reminder_remote_datasource.dart # TODO
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── reminders_page.dart   # Text('Reminders')
│   │       └── widgets/
│   │           └── reminder_card.dart    # Card(Text('Reminder'))
│   │
│   ├── print/                         ⚠️ PLACEHOLDER
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── print_job.dart
│   │   │   ├── repositories/
│   │   │   │   └── print_repository.dart  # TODO
│   │   │   └── usecases/
│   │   │       └── get_print_jobs.dart    # TODO
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── print_job_model.dart   # TODO
│   │   │   ├── repositories/
│   │   │   │   └── print_repository_impl.dart # TODO
│   │   │   └── datasources/
│   │   │       ├── print_local_datasource.dart  # TODO
│   │   │       └── print_remote_datasource.dart # TODO
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── print_page.dart       # Text('Print')
│   │       └── widgets/
│   │           └── print_preview_card.dart # Card(Text('Print Preview'))
│   │
│   └── more/                          ⚠️ MINIMAL
│       └── presentation/
│           └── pages/
│               └── more_page.dart       # ListView with tiles (Settings disabled)
│
├── shared/
│   ├── models/
│   │   └── shared_models.dart          # Empty (TODO)
│   └── widgets/
│       ├── shared_widgets.dart          # Barrel export
│       ├── app_card.dart               # AppCard (container with padding + radius)
│       ├── checkbox_tile.dart           # CheckboxTile (checkbox + title + subtitle + time + badge)
│       ├── primary_button.dart          # PrimaryButton (48px FilledButton, purple)
│       ├── section_header.dart          # SectionHeader (label + trailing)
│       ├── status_badge.dart            # StatusBadge (pill: holiday/overdue/completed/neutral)
│       └── sync_status_banner.dart      # SyncStatusBanner (icon + text + action)
│
└── l10n/
    ├── app_en.arb                     # English (44 keys)
    ├── app_am.arb                     # Amharic (44 keys)
    └── generated/
        ├── app_localizations.dart
        ├── app_localizations_en.dart
        └── app_localizations_am.dart
```

---

## 2. Current UI/UX Status

### ✅ Fully Built

| Component | Status | File |
|---|---|---|
| **Today/Home Page** | Complete | `lib/features/today/presentation/pages/today_page.dart` |
| Today Header (dual-calendar) | Complete | `lib/features/today/presentation/widgets/today_header.dart` |
| Up Next Card | Complete | `lib/features/today/presentation/widgets/up_next_card.dart` |
| Events List Card | Complete | `lib/features/today/presentation/widgets/event_list_card.dart` |
| Reminders Checklist | Complete | `lib/features/today/presentation/widgets/today_reminders.dart` |
| Empty State | Complete | `lib/features/today/presentation/widgets/today_empty_state.dart` |
| Quick Add Sheet | Complete | `lib/features/today/presentation/widgets/quick_add_sheet.dart` |
| Theme System (Light + Dark) | Complete | `lib/core/theme/app_theme.dart` |
| Color Palette | Complete | `lib/core/theme/app_colors.dart` |
| Typography | Complete | `lib/core/theme/app_text_styles.dart` |
| Spacing / Radii Tokens | Complete | `lib/core/theme/app_spacing.dart`, `app_radii.dart` |
| Shared Widgets (6) | Complete | `lib/shared/widgets/` |
| Bottom Nav Shell | Complete | `lib/core/router/shell_page.dart` |
| Localization (EN + AM) | Complete | `lib/l10n/` |
| Ethiopian Calendar Core | Complete | `packages/ethiopian_calendar_core/` |

### ⚠️ Placeholder / Stub

| Component | Current State | File |
|---|---|---|
| **Calendar Page** | `Text('Calendar Grid')` | `lib/features/calendar/presentation/widgets/calendar_grid.dart` |
| **Calendar Grid** | Not implemented | `lib/features/calendar/presentation/widgets/calendar_grid.dart` |
| **Planner Page** | `Text('Planner')` | `lib/features/planner/presentation/pages/planner_page.dart` |
| **Planner Card** | `Card(Text('Planner Item'))` | `lib/features/planner/presentation/widgets/planner_card.dart` |
| **Reminders Page** | `Text('Reminders')` | `lib/features/reminders/presentation/pages/reminders_page.dart` |
| **Reminder Card** | `Card(Text('Reminder'))` | `lib/features/reminders/presentation/widgets/reminder_card.dart` |
| **Print Page** | `Text('Print')` | `lib/features/print/presentation/pages/print_page.dart` |
| **Print Preview Card** | `Card(Text('Print Preview'))` | `lib/features/print/presentation/widgets/print_preview_card.dart` |
| **More Page** | Minimal list (Settings disabled) | `lib/features/more/presentation/pages/more_page.dart` |
| **Search** | AppBar icon with empty `onPressed` | Inline in `today_page.dart` |
| **Account/Profile** | AppBar icon with empty `onPressed` | Inline in `today_page.dart` |
| **Settings Screen** | Does not exist | — |
| **Shared Models** | Empty file | `lib/shared/models/shared_models.dart` |

### ❌ Missing / Not Started

| Component | Notes |
|---|---|
| **Custom Fonts (NotoSansEthiopic)** | Referenced in `AppTextStyles` but NOT in `pubspec.yaml` assets |
| **Asset Directory** | No `assets/` folder exists |
| **Images / Icons** | No custom images or icon assets |
| **Calendar Data Layer** | Repository + datasources throw `UnimplementedError` |
| **Planner Data Layer** | All files are empty `TODO` stubs |
| **Reminders Data Layer** | All files are empty `TODO` stubs |
| **Print Data Layer** | All files are empty `TODO` stubs |
| **Database DAOs** | Drift tables defined but no queries/DAOs |
| **Login / Auth UI** | No authentication screens |
| **Profile Screen** | Does not exist |
| **Animations / Transitions** | No custom animations |
| **Onboarding** | Does not exist |
| **Splash Screen** | Does not exist |

---

## 3. Design System

### Color Palette (Light Mode)

| Token | Hex | Usage |
|---|---|---|
| Primary | `#5B4FE5` | Buttons, active tabs, accents |
| Primary Dark | `#4A3FD1` | Pressed states |
| Primary Light | `#EDEBFC` | Backgrounds, tints |
| Background | `#F7F5F0` | Screen background (warm off-white) |
| Surface | `#FFFFFF` | Cards, sheets |
| Surface Muted | `#F1EFEA` | Secondary surfaces |
| Text Primary | `#1A1A1A` | Headings, body |
| Text Secondary | `#6B6B6B` | Subtitles |
| Text Muted | `#9B9B9B` | Hints, labels |
| Holiday | `#E0A030` | Ethiopian holidays (gold) |
| Overdue | `#D64545` | Overdue items (red) |
| Success | `#3EA36B` | Completed, active |
| Completed | `#B0AEA8` | Done items (muted) |
| Divider | `#E8E5DE` | Separators |
| Timeline Track | `#DDD9D2` | Time indicators |

### Typography

| Style | Size | Weight | Usage |
|---|---|---|---|
| `ecDateHeading` | 28px | w700 | Ethiopian date display |
| `cardTitle` | 16px | w600 | Card headings |
| `cardSubtitle` | 13px | w400 | Card body text |
| `timeLabel` | 13px | w600 | Time indicators (primary color) |
| `sectionLabel` | 12px | w600 | Section headers (uppercase, letter-spacing) |
| `badge` | 11px | w600 | Status badges |
| `gcDateSubtitle` | 13px | w400 | Gregorian date subtitle |

**Font Family:** NotoSansEthiopic (NOT YET ADDED TO ASSETS)

### Spacing

| Token | Value |
|---|---|
| xs | 4 |
| sm | 8 |
| md | 12 |
| lg | 16 |
| xl | 24 |
| xxl | 32 |

### Border Radii

| Token | Value |
|---|---|
| sm | 8 |
| md | 12 |
| lg | 16 |
| pill | 999 |

### Shared Widgets

| Widget | Description | File |
|---|---|---|
| `AppCard` | Container with padding, color, radius, tap | `lib/shared/widgets/app_card.dart` |
| `PrimaryButton` | 48px FilledButton, purple, white text | `lib/shared/widgets/primary_button.dart` |
| `SectionHeader` | Label + optional trailing widget | `lib/shared/widgets/section_header.dart` |
| `StatusBadge` | Pill badge (holiday/overdue/completed/neutral) | `lib/shared/widgets/status_badge.dart` |
| `CheckboxTile` | Checkbox + title + subtitle + time + badge | `lib/shared/widgets/checkbox_tile.dart` |
| `SyncStatusBanner` | Full-width banner (9 sync states) | `lib/shared/widgets/sync_status_banner.dart` |

---

## 4. Routing

| Route | Destination | Status |
|---|---|---|
| `/home` | TodayPage | ✅ Working |
| `/calendar` | `_CalendarPlaceholder` (inline) | ⚠️ Uses placeholder, not CalendarPage |
| `/planner` | `_PlannerPlaceholder` (inline) | ⚠️ Uses placeholder, not PlannerPage |
| `/more` | MorePage | ✅ Working |
| `/reminders` | `_SimpleScaffold` (inline) | ⚠️ Uses placeholder |
| `/print` | `_SimpleScaffold` (inline) | ⚠️ Uses placeholder |
| `/error` | ErrorPage | ✅ Working |

**Note:** `app_router.dart` uses inline placeholder widgets instead of importing the actual feature pages. The real `CalendarPage`, `PlannerPage`, `RemindersPage`, and `PrintPage` exist but are NOT wired into the router.

---

## 5. What Needs UI/UX Work

### Priority 1: Missing Core Screens
1. **Calendar Page** — Full month grid, Ethiopian/Gregorian toggle, event dots, month navigation
2. **Planner Page** — Daily/weekly view, drag-and-drop items, quick add
3. **Reminders Page** — List with filters, swipe actions, date picker
4. **Print Page** — Template gallery, preview, customization options

### Priority 2: Missing Utility Screens
5. **Settings Page** — Theme toggle, language switch, notifications, account
6. **Profile/Account Page** — User info, subscription status
7. **Search** — Global search across events, reminders, notes
8. **Onboarding** — First-time user experience

### Priority 3: Visual Polish
9. **Custom Fonts** — Add NotoSansEthiopic to assets
10. **Custom Icons/Images** — App icon, empty state illustrations, onboarding images
11. **Animations** — Page transitions, micro-interactions, loading states
12. **Splash Screen** — Branded launch screen

### Priority 4: Data Layer (Required for Real UI)
13. Calendar data layer (repository, datasources, DAOs)
14. Planner data layer
15. Reminders data layer
16. Print data layer
17. Database queries/DAOs for all features

---

## 6. Recommendations

1. **Start with assets** — Add NotoSansEthiopic font and any custom images before building new screens
2. **Fix routing** — Wire actual feature pages into `app_router.dart` instead of inline placeholders
3. **Build one page at a time** — Complete Calendar first (most complex), then Planner, Reminders, Print
4. **Use existing design system** — All new screens should use AppCard, AppSpacing, AppRadii, AppColors, AppTextStyles
5. **Keep Today page as reference** — It's the quality benchmark for all other pages

---

*Report generated: 2026-07-23*
