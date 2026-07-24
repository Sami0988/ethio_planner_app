import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/locale_provider.dart';
import '../../../../core/providers/calendar_settings_provider.dart';
import '../../../../core/providers/theme_mode_provider.dart';
import '../widgets/calendar_settings_sheet.dart';
import '../widgets/language_selector.dart';
import '../widgets/theme_selector.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  String _themeModeLabel(BuildContext context, ThemeMode mode) {
    final l10n = AppLocalizations.of(context);
    switch (mode) {
      case ThemeMode.system:
        return l10n.settingsThemeSystem;
      case ThemeMode.light:
        return l10n.settingsThemeLight;
      case ThemeMode.dark:
        return l10n.settingsThemeDark;
    }
  }

  String _localeLabel(BuildContext context, Locale? locale) {
    final l10n = AppLocalizations.of(context);
    if (locale == null) return l10n.settingsLanguageSystem;
    switch (locale.languageCode) {
      case 'en':
        return l10n.settingsLanguageEnglish;
      case 'am':
        return l10n.settingsLanguageAmharic;
      case 'om':
        return l10n.settingsLanguageOromoo;
      case 'ti':
        return l10n.settingsLanguageTigrinya;
      default:
        return locale.languageCode;
    }
  }

  String _calendarModeLabel(BuildContext context, CalendarDisplayMode mode) {
    final l10n = AppLocalizations.of(context);
    switch (mode) {
      case CalendarDisplayMode.ethiopian:
        return l10n.settingsPrimaryCalendarEthiopian;
      case CalendarDisplayMode.gregorian:
        return l10n.settingsPrimaryCalendarGregorian;
      case CalendarDisplayMode.dual:
        return l10n.settingsPrimaryCalendarDual;
    }
  }

  String _weekStartLabel(BuildContext context, WeekStartDay day) {
    final l10n = AppLocalizations.of(context);
    switch (day) {
      case WeekStartDay.saturday:
        return l10n.settingsWeekStartSaturday;
      case WeekStartDay.sunday:
        return l10n.settingsWeekStartSunday;
      case WeekStartDay.monday:
        return l10n.settingsWeekStartMonday;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final calendarSettings = ref.watch(calendarSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.moreSettings)),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.brightness_6_outlined),
            title: Text(l10n.settingsTheme),
            subtitle: Text(_themeModeLabel(context, themeMode)),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => ThemeSelector.show(context),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(l10n.settingsLanguage),
            subtitle: Text(_localeLabel(context, locale)),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => LanguageSelector.show(context),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: Text(l10n.settingsCalendar),
            subtitle: Text(
              '${_calendarModeLabel(context, calendarSettings.displayMode)} · '
              '${_weekStartLabel(context, calendarSettings.weekStart)}',
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => CalendarSettingsSheet.show(context),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settingsVersion),
            subtitle: const Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
