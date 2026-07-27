import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/providers/calendar_settings_provider.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/planner_item.dart';
import '../controllers/planner_controller.dart';
import '../providers/planner_providers.dart';
import '../providers/planner_view_state.dart';
import '../widgets/planner_item_form_sheet.dart';
import '../widgets/planner_section_view.dart';

class PlannerPage extends ConsumerStatefulWidget {
  const PlannerPage({super.key});

  @override
  ConsumerState<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends ConsumerState<PlannerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(plannerControllerProvider.notifier).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerControllerProvider);
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.plannerTab),
        actions: [
          PopupMenuButton<PlannerViewMode>(
            icon: const Icon(Icons.view_module),
            onSelected: ref
                .read(plannerControllerProvider.notifier)
                .setViewMode,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: PlannerViewMode.day,
                child: Row(
                  children: [
                    if (state.viewMode == PlannerViewMode.day)
                      const Icon(Icons.check, size: 18),
                    if (state.viewMode != PlannerViewMode.day)
                      const SizedBox(width: 18),
                    const SizedBox(width: 8),
                    Text(l10n.plannerDay),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PlannerViewMode.week,
                child: Row(
                  children: [
                    if (state.viewMode == PlannerViewMode.week)
                      const Icon(Icons.check, size: 18),
                    if (state.viewMode != PlannerViewMode.week)
                      const SizedBox(width: 18),
                    const SizedBox(width: 8),
                    Text(l10n.plannerWeek),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PlannerViewMode.month,
                child: Row(
                  children: [
                    if (state.viewMode == PlannerViewMode.month)
                      const Icon(Icons.check, size: 18),
                    if (state.viewMode != PlannerViewMode.month)
                      const SizedBox(width: 18),
                    const SizedBox(width: 8),
                    Text(l10n.plannerMonth),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PlannerViewMode.year,
                child: Row(
                  children: [
                    if (state.viewMode == PlannerViewMode.year)
                      const Icon(Icons.check, size: 18),
                    if (state.viewMode != PlannerViewMode.year)
                      const SizedBox(width: 18),
                    const SizedBox(width: 8),
                    Text(l10n.plannerYear),
                  ],
                ),
              ),
            ],
          ),
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(value, ref),
            itemBuilder: (context) {
              final l10n = AppLocalizations.of(context);
              return [
                PopupMenuItem(
                  value: 'copy',
                  child: Text(l10n.copyFromPreviousTitle),
                ),
                PopupMenuItem(
                  value: 'carry',
                  child: Text(l10n.carryForwardTitle),
                ),
                PopupMenuItem(
                  value: 'sections',
                  child: Text(l10n.plannerManageSections),
                ),
              ];
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => PlannerItemFormSheet.show(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _PeriodHeader(
            viewMode: state.viewMode,
            selectedDate: state.selectedDate,
            periodLabel: ref
                .read(plannerControllerProvider.notifier)
                .getPeriodLabel(),
            weekStartDay: ref.read(calendarSettingsProvider).weekStartDay,
            onPrevious: ref
                .read(plannerControllerProvider.notifier)
                .goToPreviousDay,
            onNext: ref.read(plannerControllerProvider.notifier).goToNextDay,
            onToday: () => ref
                .read(plannerControllerProvider.notifier)
                .selectDate(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ),
          ),
          const Divider(height: 1),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildView(state, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildView(PlannerViewState state, WidgetRef ref) {
    switch (state.viewMode) {
      case PlannerViewMode.day:
        return _buildDayView(ref);
      case PlannerViewMode.week:
        return _buildWeekView(state, ref);
      case PlannerViewMode.month:
        return _buildMonthView(state, ref);
      case PlannerViewMode.year:
        return _buildYearView(state, ref);
    }
  }

  Widget _buildDayView(WidgetRef ref) {
    return ListView(
      children: [
        for (final section in PlannerSection.values) ...[
          PlannerSectionView(section: section),
          if (section != PlannerSection.values.last)
            const Divider(indent: 16, endIndent: 16),
        ],
      ],
    );
  }

  Widget _buildWeekView(PlannerViewState state, WidgetRef ref) {
    final calSettings = ref.watch(calendarSettingsProvider);
    final weekStartDay = calSettings.weekStartDay;
    final startOfWeek = state.selectedDate.subtract(
      Duration(days: (state.selectedDate.weekday - weekStartDay) % 7),
    );
    final days = List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
    final now = DateTime.now();

    return Column(
      children: [
        // Week day headers
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Row(
            children: days.map((day) {
              final isToday =
                  day.year == now.year &&
                  day.month == now.month &&
                  day.day == now.day;
              return Expanded(
                child: GestureDetector(
                  onTap: () => ref
                      .read(plannerControllerProvider.notifier)
                      .selectDate(day),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: isToday
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('EEE').format(day),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${day.day}',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: isToday
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        // Items grouped by day
        Expanded(
          child: ListView.builder(
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              final dayItems = state.items
                  .where(
                    (i) =>
                        i.gcDate.year == day.year &&
                        i.gcDate.month == day.month &&
                        i.gcDate.day == day.day,
                  )
                  .toList();
              return _DaySection(
                date: day,
                items: dayItems,
                onAdd: () =>
                    PlannerItemFormSheet.show(context, initialDate: day),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMonthView(PlannerViewState state, WidgetRef ref) {
    final year = state.selectedDate.year;
    final month = state.selectedDate.month;
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final firstDay = DateTime(year, month);
    final calSettings = ref.watch(calendarSettingsProvider);
    final weekStartDay = calSettings.weekStartDay;
    final startWeekday = (firstDay.weekday - weekStartDay + 7) % 7;
    final now = DateTime.now();

    const weekdayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final orderedLabels = List.generate(
      7,
      (i) => weekdayLabels[(weekStartDay - 1 + i) % 7],
    );

    return Column(
      children: [
        // Month calendar grid
        Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            children: [
              // Weekday headers
              Row(
                children: orderedLabels
                    .map(
                      (day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: AppSpacing.xs),
              // Calendar grid
              ...List.generate((daysInMonth + startWeekday - 1) ~/ 7 + 1, (
                week,
              ) {
                return Row(
                  children: List.generate(7, (dayOfWeek) {
                    final dayIndex = week * 7 + dayOfWeek - startWeekday + 2;
                    if (dayIndex < 1 || dayIndex > daysInMonth) {
                      return const Expanded(child: SizedBox());
                    }
                    final date = DateTime(year, month, dayIndex);
                    final isToday =
                        date.year == now.year &&
                        date.month == now.month &&
                        date.day == now.day;
                    final hasItems = state.items.any(
                      (i) =>
                          i.gcDate.year == year &&
                          i.gcDate.month == month &&
                          i.gcDate.day == dayIndex,
                    );
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => ref
                            .read(plannerControllerProvider.notifier)
                            .selectDate(date),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: isToday
                                ? Theme.of(context).colorScheme.primaryContainer
                                : null,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '$dayIndex',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      fontWeight: isToday
                                          ? FontWeight.w700
                                          : null,
                                    ),
                              ),
                              if (hasItems)
                                Container(
                                  width: 4,
                                  height: 4,
                                  margin: const EdgeInsets.only(top: 2),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ],
          ),
        ),
        const Divider(),
        // Items for selected date
        Expanded(
          child:
              state.items
                  .where(
                    (i) =>
                        i.gcDate.year == state.selectedDate.year &&
                        i.gcDate.month == state.selectedDate.month &&
                        i.gcDate.day == state.selectedDate.day,
                  )
                  .isEmpty
              ? Center(
                  child: Text(
                    'No items for ${DateFormat('MMM d').format(state.selectedDate)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : ListView(
                  children: state.items
                      .where(
                        (i) =>
                            i.gcDate.year == state.selectedDate.year &&
                            i.gcDate.month == state.selectedDate.month &&
                            i.gcDate.day == state.selectedDate.day,
                      )
                      .map((item) => _CompactItemTile(item: item))
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildYearView(PlannerViewState state, WidgetRef ref) {
    final year = state.selectedDate.year;
    final now = DateTime.now();

    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(AppSpacing.md),
      crossAxisSpacing: AppSpacing.sm,
      mainAxisSpacing: AppSpacing.sm,
      children: List.generate(12, (monthIndex) {
        final month = monthIndex + 1;
        final daysInMonth = DateTime(year, month + 1, 0).day;
        final monthItems = state.items
            .where((i) => i.gcDate.year == year && i.gcDate.month == month)
            .toList();
        final isCurrentMonth = year == now.year && month == now.month;

        return GestureDetector(
          onTap: () {
            ref
                .read(plannerControllerProvider.notifier)
                .setViewMode(PlannerViewMode.month);
            ref
                .read(plannerControllerProvider.notifier)
                .selectDate(DateTime(year, month));
          },
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: isCurrentMonth
                  ? Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: isCurrentMonth
                  ? Border.all(color: Theme.of(context).colorScheme.primary)
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMM').format(DateTime(year, month)),
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  '$daysInMonth days',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${monthItems.length} items',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                if (monthItems.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  ...monthItems
                      .take(3)
                      .map(
                        (item) => Text(
                          '• ${item.title}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  if (monthItems.length > 3)
                    Text(
                      '+${monthItems.length - 3} more',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }

  void _handleMenuAction(String action, WidgetRef ref) {
    final controller = ref.read(plannerControllerProvider.notifier);
    final l10n = AppLocalizations.of(context);
    final periodName = ref.read(plannerControllerProvider).viewMode.name;
    switch (action) {
      case 'copy':
        _showCopyConfirmDialog(l10n, controller, periodName);
        break;
      case 'carry':
        _showCarryForwardConfirmDialog(l10n, controller, periodName);
        break;
      case 'sections':
        _showSectionManager(ref);
        break;
    }
  }

  void _showCopyConfirmDialog(
    AppLocalizations? l10n,
    PlannerController controller,
    String periodName,
  ) {
    if (l10n == null) return;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.copyFromPreviousTitle),
        content: Text(l10n.copyFromPreviousMessage(periodName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(MaterialLocalizations.of(dialogContext).cancelButtonLabel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final count = await controller.copyFromPreviousPeriod();
              if (!mounted) return;
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    count > 0
                        ? l10n.copiedItems(count)
                        : l10n.nothingToCopy,
                  ),
                ),
              );
            },
            child: Text(MaterialLocalizations.of(dialogContext).okButtonLabel),
          ),
        ],
      ),
    );
  }

  void _showCarryForwardConfirmDialog(
    AppLocalizations? l10n,
    PlannerController controller,
    String periodName,
  ) {
    if (l10n == null) return;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.carryForwardTitle),
        content: Text(l10n.carryForwardMessage(periodName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(MaterialLocalizations.of(dialogContext).cancelButtonLabel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final count = await controller.carryForwardIncomplete();
              if (!mounted) return;
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    count > 0
                        ? l10n.carriedItems(count)
                        : l10n.nothingToCarry,
                  ),
                ),
              );
            },
            child: Text(MaterialLocalizations.of(dialogContext).okButtonLabel),
          ),
        ],
      ),
    );
  }

  void _showSectionManager(WidgetRef ref) {
    final state = ref.read(plannerControllerProvider);
    final controller = ref.read(plannerControllerProvider.notifier);

    showModalBottomSheet<void>(
      context: context,
      builder: (context) => _SectionManagerSheet(
        hiddenSections: state.hiddenSections,
        onToggle: controller.toggleSectionVisibility,
      ),
    );
  }
}

class _PeriodHeader extends StatelessWidget {
  const _PeriodHeader({
    required this.viewMode,
    required this.selectedDate,
    required this.periodLabel,
    required this.weekStartDay,
    required this.onPrevious,
    required this.onNext,
    required this.onToday,
  });

  final PlannerViewMode viewMode;
  final DateTime selectedDate;
  final String periodLabel;
  final int weekStartDay;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToday;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final isCurrentPeriod = _isCurrentPeriod(selectedDate, viewMode, now);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            onPressed: onPrevious,
            tooltip: l10n.navigationPrevious,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  periodLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (isCurrentPeriod)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      l10n.currentPeriod,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: onToday,
            tooltip: l10n.plannerGoToToday,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: onNext,
            tooltip: l10n.navigationNext,
          ),
        ],
      ),
    );
  }

  bool _isCurrentPeriod(DateTime date, PlannerViewMode mode, DateTime now) {
    switch (mode) {
      case PlannerViewMode.day:
        return date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
      case PlannerViewMode.week:
        final start = date.subtract(
          Duration(days: (date.weekday - weekStartDay) % 7),
        );
        final end = start.add(const Duration(days: 6));
        return !now.isBefore(start) && !now.isAfter(end);
      case PlannerViewMode.month:
        return date.year == now.year && date.month == now.month;
      case PlannerViewMode.year:
        return date.year == now.year;
    }
  }
}

class _DaySection extends StatelessWidget {
  const _DaySection({
    required this.date,
    required this.items,
    required this.onAdd,
  });

  final DateTime date;
  final List<PlannerItem> items;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  DateFormat('EEEE, MMM d').format(date),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isToday ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, size: 18),
                onPressed: onAdd,
                tooltip: l10n.add,
              ),
            ],
          ),
        ),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(
              'No items',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ...items.map((item) => _CompactItemTile(item: item)),
        const Divider(indent: 16, endIndent: 16),
      ],
    );
  }
}

class _CompactItemTile extends ConsumerWidget {
  const _CompactItemTile({required this.item});

  final PlannerItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.lg),
        color: theme.colorScheme.error,
        child: Icon(Icons.delete_outline, color: theme.colorScheme.onError),
      ),
      onDismissed: (direction) {
        ref.read(plannerControllerProvider.notifier).deleteItem(item.id);
      },
      child: ListTile(
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (_) {
            ref
                .read(plannerControllerProvider.notifier)
                .toggleCompleted(item.id);
          },
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            color: item.isCompleted ? theme.colorScheme.onSurfaceVariant : null,
          ),
        ),
        subtitle: item.description != null && item.description!.isNotEmpty
            ? Text(
                item.description!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Text(
          item.section.name,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        onTap: () => PlannerItemFormSheet.show(context, item: item),
      ),
    );
  }
}

class _SectionManagerSheet extends StatelessWidget {
  const _SectionManagerSheet({
    required this.hiddenSections,
    required this.onToggle,
  });

  final List<PlannerSection> hiddenSections;
  final void Function(PlannerSection) onToggle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              'Manage Sections',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...PlannerSection.values.map((section) {
            final isHidden = hiddenSections.contains(section);
            return SwitchListTile(
              title: Text(section.name.toUpperCase()),
              subtitle: Text(isHidden ? 'Hidden' : 'Visible'),
              value: !isHidden,
              onChanged: (_) => onToggle(section),
            );
          }),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
