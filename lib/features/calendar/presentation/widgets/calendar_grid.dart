import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/providers/calendar_settings_provider.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/calendar_providers.dart';
import 'month_year_picker_sheet.dart';

class CalendarGrid extends ConsumerWidget {
  const CalendarGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarControllerProvider);
    final controller = ref.read(calendarControllerProvider.notifier);
    final settings = ref.watch(calendarSettingsProvider);
    final locale = Localizations.localeOf(context).toString();

    return Column(
      children: [
        _MonthHeader(
          currentMonth: state.currentMonth,
          locale: locale,
          onPrevious: controller.goToPreviousMonth,
          onNext: controller.goToNextMonth,
          onTapMonth: () async {
            final picked = await MonthYearPickerSheet.show(
              context,
              state.currentMonth,
            );
            if (picked != null) {
              await controller.goToMonth(picked);
            }
          },
        ),
        _WeekdayHeader(locale: locale, weekStart: settings.weekStartDay),
        Expanded(
          child: _MonthGrid(
            currentMonth: state.currentMonth,
            selectedDate: state.selectedDate,
            hasEvents: controller.hasEventsOnDate,
            onDateSelected: controller.selectDate,
            weekStartDay: settings.weekStartDay,
            displayMode: settings.displayMode,
            numeralPreference: settings.numeralPreference,
          ),
        ),
      ],
    );
  }
}

class _MonthHeader extends StatelessWidget {
  const _MonthHeader({
    required this.currentMonth,
    required this.locale,
    required this.onPrevious,
    required this.onNext,
    this.onTapMonth,
  });

  final DateTime currentMonth;
  final String locale;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback? onTapMonth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final monthName = DateFormat.yMMMM(locale).format(currentMonth);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavButton(icon: Icons.chevron_left_rounded, onPressed: onPrevious),
          GestureDetector(
            onTap: onTapMonth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  monthName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.expand_more_rounded,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
          _NavButton(icon: Icons.chevron_right_rounded, onPressed: onNext),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: const CircleBorder(),
      child: IconButton(icon: Icon(icon), onPressed: onPressed),
    );
  }
}

class _WeekdayHeader extends StatelessWidget {
  const _WeekdayHeader({required this.locale, required this.weekStart});

  final String locale;
  final int weekStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Build weekday names starting from the configured week start day.
    // DateTime(1970, 1, 4) is a Sunday. We offset from there.
    final weekdays = List.generate(7, (i) {
      final dayNum = (weekStart - 1 + i) % 7;
      // Sunday=7, Monday=1..Saturday=6 in DateTime.weekday
      final refDate = DateTime(1970, 1, 4 + dayNum);
      return DateFormat.E(locale).format(refDate);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: weekdays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({
    required this.currentMonth,
    required this.selectedDate,
    required this.hasEvents,
    required this.onDateSelected,
    required this.weekStartDay,
    required this.displayMode,
    required this.numeralPreference,
  });

  final DateTime currentMonth;
  final DateTime? selectedDate;
  final bool Function(DateTime) hasEvents;
  final void Function(DateTime) onDateSelected;
  final int weekStartDay;
  final CalendarDisplayMode displayMode;
  final NumeralPreference numeralPreference;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstDay = DateTime(currentMonth.year, currentMonth.month);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    // Calculate starting weekday offset based on configured week start.
    // DateTime.weekday: Monday=1..Sunday=7. We need offset from 0.
    final firstWeekday = firstDay.weekday; // 1-7
    final startingWeekday = (firstWeekday - weekStartDay + 7) % 7;
    final daysInMonth = lastDay.day;

    final today = DateTime.now();
    final isCurrentMonth =
        today.year == currentMonth.year && today.month == currentMonth.month;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 0.8,
      ),
      itemCount: startingWeekday + daysInMonth,
      itemBuilder: (context, index) {
        if (index < startingWeekday) {
          return const SizedBox.shrink();
        }

        final day = index - startingWeekday + 1;
        final date = DateTime(currentMonth.year, currentMonth.month, day);
        final isToday = isCurrentMonth && today.day == day;
        final isSelected =
            selectedDate != null &&
            selectedDate!.year == date.year &&
            selectedDate!.month == date.month &&
            selectedDate!.day == date.day;
        final hasEventsToday = hasEvents(date);
        final isWeekend = date.weekday == 6 || date.weekday == 7;
        final secondaryDay = _secondaryDayFor(date, displayMode);
        final primaryNumeral = numeralPreference == NumeralPreference.gez
            ? _toGez(day)
            : '$day';

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => onDateSelected(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primary
                    : isToday
                    ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                    : null,
                borderRadius: BorderRadius.circular(10),
                border: isToday && !isSelected
                    ? Border.all(color: theme.colorScheme.primary, width: 1.5)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    primaryNumeral,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: numeralPreference == NumeralPreference.gez
                          ? 'NotoSansEthiopic'
                          : null,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : isWeekend
                          ? theme.colorScheme.onSurfaceVariant
                          : null,
                      fontWeight: isToday || isSelected
                          ? FontWeight.w700
                          : null,
                    ),
                  ),
                  if (secondaryDay != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      secondaryDay,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontFamily: 'NotoSansEthiopic',
                        fontSize: 10,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? theme.colorScheme.onPrimary.withValues(alpha: 0.8)
                            : theme.colorScheme.primary.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                  if (hasEventsToday)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Returns the secondary day label based on display mode.
  /// In Ethiopian mode, shows the Ethiopian day. In Gregorian mode, shows
  /// the Ethiopian day. In dual mode, no secondary needed (both shown as
  /// primary).
  String? _secondaryDayFor(DateTime date, CalendarDisplayMode mode) {
    try {
      final gc = GregorianDate(date.year, date.month, date.day);
      final ec = CalendarConversion.gregorianToEthiopian(gc);
      if (mode == CalendarDisplayMode.dual) {
        // In dual mode, show Ethiopian as secondary below Gregorian
        return _toGez(ec.day);
      }
      if (mode == CalendarDisplayMode.gregorian) {
        // Gregorian primary, show Ethiopian as secondary
        return _toGez(ec.day);
      }
      // Ethiopian primary, show Gregorian as secondary
      return '${date.day}';
    } catch (_) {
      return null;
    }
  }

  /// Converts an integer to Ge'ez (Ethiopic) numerals.
  static String _toGez(int n) {
    if (n <= 0 || n > 30) return '$n';
    const ones = ['', '፩', '፪', '፫', '፬', '፭', '፮', '፯', '፰', '፱'];
    const tens = ['', '፲', '፳', '፴', '፵', '፶', '፷', '፸', '፹', '፺'];
    final t = n ~/ 10;
    final o = n % 10;
    return '${tens[t]}${ones[o]}';
  }
}
