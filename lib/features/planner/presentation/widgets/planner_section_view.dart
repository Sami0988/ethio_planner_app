import 'package:ethio_planner/l10n/generated/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(_sectionIcon(section), size: 18, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _sectionTitle(section, l10n),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, size: 20),
                onPressed: () => PlannerItemFormSheet.show(
                  context,
                  initialDate: state.selectedDate,
                  initialSection: section,
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
            child: Row(
              children: [
                Icon(
                  _sectionEmptyIcon(section),
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    _emptyStateText(section, l10n),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          ...items.map((item) => _PlannerItemTile(item: item)),
      ],
    );
  }

  IconData _sectionIcon(PlannerSection section) {
    switch (section) {
      case PlannerSection.focus:
        return Icons.center_focus_strong;
      case PlannerSection.priorities:
        return Icons.flag_outlined;
      case PlannerSection.checklist:
        return Icons.check_circle_outline;
      case PlannerSection.notes:
        return Icons.note_outlined;
      case PlannerSection.reflection:
        return Icons.auto_awesome_outlined;
    }
  }

  IconData _sectionEmptyIcon(PlannerSection section) {
    switch (section) {
      case PlannerSection.focus:
        return Icons.center_focus_strong;
      case PlannerSection.priorities:
        return Icons.flag_outlined;
      case PlannerSection.checklist:
        return Icons.check_circle_outline;
      case PlannerSection.notes:
        return Icons.note_outlined;
      case PlannerSection.reflection:
        return Icons.auto_awesome_outlined;
    }
  }

  String _sectionTitle(PlannerSection section, AppLocalizations? l10n) {
    if (l10n == null) return section.name;
    switch (section) {
      case PlannerSection.focus:
        return l10n.plannerSectionFocus;
      case PlannerSection.priorities:
        return l10n.plannerSectionPriorities;
      case PlannerSection.checklist:
        return l10n.plannerSectionChecklist;
      case PlannerSection.notes:
        return l10n.plannerSectionNotes;
      case PlannerSection.reflection:
        return l10n.plannerSectionReflection;
    }
  }

  String _emptyStateText(PlannerSection section, AppLocalizations? l10n) {
    if (l10n == null) return 'No items';
    switch (section) {
      case PlannerSection.focus:
        return l10n.plannerSectionFocusEmpty;
      case PlannerSection.priorities:
        return l10n.plannerSectionPrioritiesEmpty;
      case PlannerSection.checklist:
        return l10n.plannerSectionChecklistEmpty;
      case PlannerSection.notes:
        return l10n.plannerSectionNotesEmpty;
      case PlannerSection.reflection:
        return l10n.plannerSectionReflectionEmpty;
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
