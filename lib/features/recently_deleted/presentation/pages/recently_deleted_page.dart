import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/repositories/recently_deleted_repository.dart';
import '../providers/recently_deleted_providers.dart';

class RecentlyDeletedPage extends ConsumerStatefulWidget {
  const RecentlyDeletedPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const RecentlyDeletedPage()));
  }

  @override
  ConsumerState<RecentlyDeletedPage> createState() =>
      _RecentlyDeletedPageState();
}

class _RecentlyDeletedPageState extends ConsumerState<RecentlyDeletedPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(recentlyDeletedControllerProvider.notifier).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recentlyDeletedControllerProvider);
    final controller = ref.read(recentlyDeletedControllerProvider.notifier);
    final filteredItems = controller.filteredItems;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.recentlyDeletedTitle)),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _FilterBar(
                  selectedType: state.filterType,
                  onTypeSelected: controller.setFilterType,
                ),
                Expanded(
                  child: filteredItems.isEmpty
                      ? _EmptyState()
                      : ListView.separated(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          itemCount: filteredItems.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return _DeletedItemCard(
                              item: item,
                              onRestore: () {
                                ref
                                    .read(recentlyDeletedControllerProvider.notifier)
                                    .restoreItem(item);
                              },
                              onPermanentDelete: () {
                                _confirmPermanentDelete(context, item);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  void _confirmPermanentDelete(BuildContext context, DeletedItem item) {
    final l10n = AppLocalizations.of(context);
    showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.recentlyDeletedConfirmTitle),
        content: Text(
          l10n.recentlyDeletedConfirmBody(item.entityTitle),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref
                  .read(recentlyDeletedControllerProvider.notifier)
                  .permanentlyDelete(item.id);
            },
            child: Text(l10n.recentlyDeletedDelete),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_sweep_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.recentlyDeletedEmpty,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.recentlyDeletedHint,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.selectedType,
    required this.onTypeSelected,
  });

  final DeletedEntityType? selectedType;
  final ValueChanged<DeletedEntityType?> onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterChip(
              label: Text(l10n.recentlyDeletedFilterAll),
              selected: selectedType == null,
              onSelected: (_) => onTypeSelected(null),
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.event, size: 16),
              label: Text(l10n.recentlyDeletedFilterEvents),
              selected: selectedType == DeletedEntityType.event,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.event : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.notifications, size: 16),
              label: Text(l10n.recentlyDeletedFilterReminders),
              selected: selectedType == DeletedEntityType.reminder,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.reminder : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.check_circle, size: 16),
              label: Text(l10n.recentlyDeletedFilterPlanner),
              selected: selectedType == DeletedEntityType.plannerItem,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.plannerItem : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.note, size: 16),
              label: Text(l10n.recentlyDeletedFilterNotes),
              selected: selectedType == DeletedEntityType.note,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.note : null);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DeletedItemCard extends StatelessWidget {
  const _DeletedItemCard({
    required this.item,
    required this.onRestore,
    required this.onPermanentDelete,
  });

  final DeletedItem item;
  final VoidCallback onRestore;
  final VoidCallback onPermanentDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _TypeIcon(type: item.entityType),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.entityTitle,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        l10n.recentlyDeletedDeletedOn(DateFormat('MMM d, y').format(item.deletedAt)),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.recentlyDeletedDaysLeft(item.daysRemaining),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: item.daysRemaining <= 7
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: onRestore,
                      child: Text(l10n.recentlyDeletedRestore),
                    ),
                    TextButton(
                      onPressed: onPermanentDelete,
                      child: Text(
                        l10n.recentlyDeletedDelete,
                        style: TextStyle(color: theme.colorScheme.error),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.type});

  final DeletedEntityType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData icon;
    Color color;

    switch (type) {
      case DeletedEntityType.event:
        icon = Icons.event;
        color = theme.colorScheme.primary;
      case DeletedEntityType.reminder:
        icon = Icons.notifications;
        color = theme.colorScheme.tertiary;
      case DeletedEntityType.plannerItem:
        icon = Icons.check_circle;
        color = theme.colorScheme.secondary;
      case DeletedEntityType.note:
        icon = Icons.note;
        color = theme.colorScheme.error;
    }

    return Semantics(
      label: type.name,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
