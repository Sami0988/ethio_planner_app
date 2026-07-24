import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/shared_widgets.dart';
import '../../domain/entities/planner_item.dart';
import '../providers/planner_providers.dart';
import 'planner_item_form_sheet.dart';

class PlannerSectionView extends ConsumerWidget {
  const PlannerSectionView({super.key, required this.section});

  final PlannerSection section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(plannerControllerProvider);
    final controller = ref.read(plannerControllerProvider.notifier);
    final items = controller.getItemsForSection(section);

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
              Text(
                _sectionTitle(section),
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, size: 20),
                onPressed: () => PlannerItemFormSheet.show(
                  context,
                  initialDate: state.selectedDate,
                ),
              ),
            ],
          ),
        ),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: Text(
              'No items',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ...items.map((item) => _PlannerItemTile(item: item)),
      ],
    );
  }

  String _sectionTitle(PlannerSection section) {
    switch (section) {
      case PlannerSection.focus:
        return 'Focus';
      case PlannerSection.priorities:
        return 'Priorities';
      case PlannerSection.checklist:
        return 'Checklist';
      case PlannerSection.notes:
        return 'Notes';
      case PlannerSection.reflection:
        return 'Reflection';
    }
  }
}

class _PlannerItemTile extends ConsumerWidget {
  const _PlannerItemTile({required this.item});

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
      child: AppCard(
        onTap: () => PlannerItemFormSheet.show(context, item: item),
        child: Row(
          children: [
            Checkbox(
              value: item.isCompleted,
              onChanged: (_) {
                ref
                    .read(plannerControllerProvider.notifier)
                    .toggleCompleted(item.id);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: item.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      color: item.isCompleted
                          ? theme.colorScheme.onSurfaceVariant
                          : null,
                    ),
                  ),
                  if (item.description != null && item.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        item.description!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
