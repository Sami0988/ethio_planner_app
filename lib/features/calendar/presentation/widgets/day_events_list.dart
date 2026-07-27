import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/reduced_motion.dart';
import '../../../../shared/widgets/shared_widgets.dart';
import '../../domain/entities/calendar_event.dart';
import '../providers/calendar_providers.dart';
import 'event_form_sheet.dart';

enum EventFilter { day, week, month, all }

class DayEventsList extends ConsumerStatefulWidget {
  const DayEventsList({super.key});

  @override
  ConsumerState<DayEventsList> createState() => _DayEventsListState();
}

class _DayEventsListState extends ConsumerState<DayEventsList> {
  EventFilter _filter = EventFilter.day;

  List<CalendarEvent> _filteredEvents(
    List<CalendarEvent> allEvents,
    DateTime? selectedDate,
  ) {
    if (selectedDate == null) return [];
    final now = DateTime.now();
    switch (_filter) {
      case EventFilter.day:
        return allEvents.where((e) {
          return e.gcDate.year == selectedDate.year &&
              e.gcDate.month == selectedDate.month &&
              e.gcDate.day == selectedDate.day;
        }).toList();
      case EventFilter.week:
        final startOfWeek = selectedDate.subtract(
          Duration(days: selectedDate.weekday % 7),
        );
        final endOfWeek = startOfWeek.add(const Duration(days: 6));
        return allEvents.where((e) {
          final d = e.gcDate;
          return !d.isBefore(startOfWeek) && !d.isAfter(endOfWeek);
        }).toList();
      case EventFilter.month:
        return allEvents.where((e) {
          return e.gcDate.year == now.year && e.gcDate.month == now.month;
        }).toList();
      case EventFilter.all:
        return allEvents;
    }
  }

  String _filterTitle(
    EventFilter filter,
    DateTime? selectedDate,
    AppLocalizations l10n,
  ) {
    if (selectedDate == null) return '';
    final locale = Localizations.localeOf(context).toString();
    switch (filter) {
      case EventFilter.day:
        return DateFormat('EEEE, MMMM d', locale).format(selectedDate);
      case EventFilter.week:
        final start = selectedDate.subtract(
          Duration(days: selectedDate.weekday % 7),
        );
        final end = start.add(const Duration(days: 6));
        return '${DateFormat('MMM d', locale).format(start)} – ${DateFormat('MMM d', locale).format(end)}';
      case EventFilter.month:
        return DateFormat('MMMM yyyy', locale).format(selectedDate);
      case EventFilter.all:
        return l10n.calendarAllEvents;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(calendarControllerProvider);
    final selectedDate = state.selectedDate;
    final l10n = AppLocalizations.of(context);
    final events = _filteredEvents(state.events, selectedDate);

    final today = DateTime.now();
    final isToday =
        selectedDate != null &&
        selectedDate.year == today.year &&
        selectedDate.month == today.month &&
        selectedDate.day == today.day;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter chips
        SizedBox(
          height: 44,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            scrollDirection: Axis.horizontal,
            itemCount: EventFilter.values.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) {
              final f = EventFilter.values[index];
              final isSelected = f == _filter;
              final labels = [
                l10n.filterDay,
                l10n.filterWeek,
                l10n.filterMonth,
                l10n.filterAll,
              ];
              return ChoiceChip(
                label: Text(labels[index]),
                selected: isSelected,
                onSelected: (_) => setState(() => _filter = f),
                selectedColor: theme.colorScheme.primary,
                labelStyle: theme.textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
                side: BorderSide(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                showCheckmark: false,
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        // Header row
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xs,
            AppSpacing.lg,
            AppSpacing.sm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            _filterTitle(_filter, selectedDate, l10n),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isToday && _filter == EventFilter.day) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              l10n.today,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (events.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        l10n.eventsCount(events.length),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Material(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: const CircleBorder(),
                child: IconButton(
                  icon: Icon(
                    Icons.add_rounded,
                    color: theme.colorScheme.primary,
                  ),
                  tooltip: l10n.quickAddEvent,
                  onPressed: () =>
                      EventFormSheet.show(context, initialDate: selectedDate),
                ),
              ),
            ],
          ),
        ),
        // Events list or empty state
        if (events.isEmpty)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.xl,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withValues(
                          alpha: 0.25,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.event_available_rounded,
                        size: 32,
                        color: theme.colorScheme.primary.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      l10n.calendarNoEventsForDay,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              itemCount: events.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final event = events[index];
                if (ReducedMotion.isEnabled(context)) {
                  return _EventTile(event: event);
                }
                return TweenAnimationBuilder<double>(
                  key: ValueKey(event.id),
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 200 + (index * 40)),
                  curve: Curves.easeOut,
                  builder: (context, value, child) => Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 6 * (1 - value)),
                      child: child,
                    ),
                  ),
                  child: _EventTile(event: event),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _EventTile extends ConsumerWidget {
  const _EventTile({required this.event});

  final CalendarEvent event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final accentColor = event.isAllDay
        ? theme.colorScheme.tertiary
        : theme.colorScheme.primary;

    return AppCard(
      onTap: () => EventFormSheet.show(context, event: event),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              event.isAllDay ? Icons.wb_sunny_outlined : Icons.schedule_rounded,
              size: 20,
              color: accentColor,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    event.isAllDay
                        ? l10n.allDay
                        : DateFormat('h:mm a', locale).format(event.gcDate),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (event.location != null && event.location!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 12,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          event.location!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    const Icon(Icons.edit_outlined, size: 18),
                    const SizedBox(width: AppSpacing.sm),
                    Text(l10n.actionEdit),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline_rounded,
                      size: 18,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      l10n.actionDelete,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) async {
              final controller = ref.read(calendarControllerProvider.notifier);
              if (value == 'edit') {
                if (context.mounted) {
                  await EventFormSheet.show(context, event: event);
                }
              } else if (value == 'delete') {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(l10n.deleteEventConfirmTitle),
                    content: Text(l10n.deleteEventConfirmBody(event.title)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        child: Text(l10n.actionCancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.error,
                        ),
                        child: Text(l10n.actionDelete),
                      ),
                    ],
                  ),
                );
                if (confirmed == true) {
                  await controller.deleteEvent(event.id);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
