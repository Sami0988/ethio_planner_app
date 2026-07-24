import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/planner_item.dart';
import '../providers/planner_providers.dart';
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
      _initAndLoad();
    });
  }

  void _initAndLoad() {
    final controller = ref.read(plannerControllerProvider.notifier);
    controller.setDependencies(
      getItemsByDate: ref.read(getPlannerItemsByDateProvider),
      getItemsByDateRange: ref.read(getPlannerItemsByDateRangeProvider),
      createItem: ref.read(createPlannerItemProvider),
      updateItem: ref.read(updatePlannerItemProvider),
      deleteItem: ref.read(deletePlannerItemProvider),
      reorderItems: ref.read(reorderPlannerItemsProvider),
    );
    controller.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerControllerProvider);
    final controller = ref.read(plannerControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => PlannerItemFormSheet.show(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _DateHeader(
            selectedDate: state.selectedDate,
            onPrevious: controller.goToPreviousDay,
            onNext: controller.goToNextDay,
          ),
          const Divider(height: 1),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      for (final section in PlannerSection.values) ...[
                        PlannerSectionView(section: section),
                        if (section != PlannerSection.values.last)
                          const Divider(indent: 16, endIndent: 16),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  const _DateHeader({
    required this.selectedDate,
    required this.onPrevious,
    required this.onNext,
  });

  final DateTime selectedDate;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final isToday = selectedDate.year == today.year &&
        selectedDate.month == today.month &&
        selectedDate.day == today.day;

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
          ),
          Column(
            children: [
              Text(
                DateFormat('EEEE').format(selectedDate),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                DateFormat('MMMM d, y').format(selectedDate),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (isToday)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Today',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
