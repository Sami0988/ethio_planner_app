import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../providers/calendar_providers.dart';
import 'month_year_picker_sheet.dart';

class CalendarGrid extends ConsumerWidget {
  const CalendarGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarControllerProvider);
    final controller = ref.read(calendarControllerProvider.notifier);
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
        _WeekdayHeader(locale: locale),
        Expanded(
          child: _MonthGrid(
            currentMonth: state.currentMonth,
            selectedDate: state.selectedDate,
            hasEvents: controller.hasEventsOnDate,
            onDateSelected: controller.selectDate,
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
  const _WeekdayHeader({required this.locale});

  final String locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weekdays = List.generate(7, (i) {
      final refDate = DateTime(1970, 1, 4 + i);
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
  });

  final DateTime currentMonth;
  final DateTime? selectedDate;
  final bool Function(DateTime) hasEvents;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final startingWeekday = firstDay.weekday % 7;
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
        final ecDay = _ethiopianDayFor(date);

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
                    '$day',
                    style: theme.textTheme.bodyMedium?.copyWith(
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
                  if (ecDay != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      ecDay,
                      // Explicit font family so Ge'ez glyphs render
                      // consistently across devices instead of relying on
                      // whichever fallback font the OS happens to pick.
                      // Requires bundling e.g. Noto Sans Ethiopic in
                      // pubspec.yaml and registering it under this family
                      // name (or your existing app font if it already
                      // covers the Ethiopic Unicode block).
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontFamily: 'NotoSansEthiopic',
                        fontSize: 11,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? theme.colorScheme.onPrimary.withValues(
                                alpha: 0.85,
                              )
                            : theme.colorScheme.primary.withValues(alpha: 0.75),
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

  /// Converts a Gregorian date to its Ethiopian day number in Ge'ez numerals.
  String? _ethiopianDayFor(DateTime date) {
    try {
      final gc = GregorianDate(date.year, date.month, date.day);
      final ec = CalendarConversion.gregorianToEthiopian(gc);
      return _toGez(ec.day);
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
