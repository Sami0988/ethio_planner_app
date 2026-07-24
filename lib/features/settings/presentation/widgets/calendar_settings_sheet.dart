import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/calendar_settings_provider.dart';
import '../../../../shared/widgets/section_header.dart';

class CalendarSettingsSheet extends ConsumerWidget {
  const CalendarSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const CalendarSettingsSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(calendarSettingsProvider);
    final notifier = ref.read(calendarSettingsProvider.notifier);
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.settingsCalendar,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),

              // Primary Calendar
              SectionHeader(label: l10n.settingsPrimaryCalendar),
              const SizedBox(height: 8),
              _CalendarOptionTile(
                title: l10n.settingsPrimaryCalendarEthiopian,
                icon: Icons.calendar_today_rounded,
                isSelected:
                    settings.displayMode == CalendarDisplayMode.ethiopian,
                onTap: () =>
                    notifier.setDisplayMode(CalendarDisplayMode.ethiopian),
              ),
              _CalendarOptionTile(
                title: l10n.settingsPrimaryCalendarGregorian,
                icon: Icons.calendar_month_rounded,
                isSelected:
                    settings.displayMode == CalendarDisplayMode.gregorian,
                onTap: () =>
                    notifier.setDisplayMode(CalendarDisplayMode.gregorian),
              ),
              _CalendarOptionTile(
                title: l10n.settingsPrimaryCalendarDual,
                icon: Icons.calendar_view_day_rounded,
                isSelected: settings.displayMode == CalendarDisplayMode.dual,
                onTap: () => notifier.setDisplayMode(CalendarDisplayMode.dual),
              ),
              const SizedBox(height: 24),

              // Week Start
              SectionHeader(label: l10n.settingsWeekStart),
              const SizedBox(height: 8),
              _CalendarOptionTile(
                title: l10n.settingsWeekStartSaturday,
                icon: Icons.view_week_rounded,
                isSelected: settings.weekStart == WeekStartDay.saturday,
                onTap: () => notifier.setWeekStart(WeekStartDay.saturday),
              ),
              _CalendarOptionTile(
                title: l10n.settingsWeekStartSunday,
                icon: Icons.view_week_rounded,
                isSelected: settings.weekStart == WeekStartDay.sunday,
                onTap: () => notifier.setWeekStart(WeekStartDay.sunday),
              ),
              _CalendarOptionTile(
                title: l10n.settingsWeekStartMonday,
                icon: Icons.view_week_rounded,
                isSelected: settings.weekStart == WeekStartDay.monday,
                onTap: () => notifier.setWeekStart(WeekStartDay.monday),
              ),
              const SizedBox(height: 24),

              // Numeral Style
              SectionHeader(label: l10n.settingsNumeralStyle),
              const SizedBox(height: 8),
              _CalendarOptionTile(
                title: l10n.settingsNumeralGez,
                icon: Icons.font_download_outlined,
                isSelected: settings.numeralPreference == NumeralPreference.gez,
                onTap: () =>
                    notifier.setNumeralPreference(NumeralPreference.gez),
              ),
              _CalendarOptionTile(
                title: l10n.settingsNumeralLatin,
                icon: Icons.text_fields_rounded,
                isSelected:
                    settings.numeralPreference == NumeralPreference.latin,
                onTap: () =>
                    notifier.setNumeralPreference(NumeralPreference.latin),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}

class _CalendarOptionTile extends StatelessWidget {
  const _CalendarOptionTile({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: isSelected
            ? theme.colorScheme.primaryContainer.withValues(alpha: 0.4)
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle_rounded,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
