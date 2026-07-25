import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('Recently Deleted')),
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
    showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permanently delete?'),
        content: Text(
          '"${item.entityTitle}" will be permanently deleted. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref
                  .read(recentlyDeletedControllerProvider.notifier)
                  .permanentlyDelete(item.id);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            'No recently deleted items',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Deleted items will appear here for 30 days',
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterChip(
              label: const Text('All'),
              selected: selectedType == null,
              onSelected: (_) => onTypeSelected(null),
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.event, size: 16),
              label: const Text('Events'),
              selected: selectedType == DeletedEntityType.event,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.event : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.notifications, size: 16),
              label: const Text('Reminders'),
              selected: selectedType == DeletedEntityType.reminder,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.reminder : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.check_circle, size: 16),
              label: const Text('Planner'),
              selected: selectedType == DeletedEntityType.plannerItem,
              onSelected: (selected) {
                onTypeSelected(selected ? DeletedEntityType.plannerItem : null);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            FilterChip(
              avatar: const Icon(Icons.note, size: 16),
              label: const Text('Notes'),
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
                        'Deleted ${DateFormat('MMM d, y').format(item.deletedAt)}',
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
                  '${item.daysRemaining} days until permanent deletion',
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
                      child: const Text('Restore'),
                    ),
                    TextButton(
                      onPressed: onPermanentDelete,
                      child: Text(
                        'Delete',
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

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
