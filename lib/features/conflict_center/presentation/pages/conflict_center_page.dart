import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/repositories/conflict_repository.dart';
import '../providers/conflict_providers.dart';
import '../widgets/conflict_resolution_sheet.dart';

class ConflictCenterPage extends ConsumerStatefulWidget {
  const ConflictCenterPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ConflictCenterPage()),
    );
  }

  @override
  ConsumerState<ConflictCenterPage> createState() =>
      _ConflictCenterPageState();
}

class _ConflictCenterPageState extends ConsumerState<ConflictCenterPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(conflictControllerProvider.notifier).loadConflicts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(conflictControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conflict Center'),
        actions: [
          if (state.conflicts.isNotEmpty)
            PopupMenuButton<ConflictResolution>(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: ConflictResolution.keepLocal,
                  child: Text('Keep all local'),
                ),
                const PopupMenuItem(
                  value: ConflictResolution.keepRemote,
                  child: Text('Keep all remote'),
                ),
              ],
              onSelected: (resolution) {
                ref
                    .read(conflictControllerProvider.notifier)
                    .resolveAllConflicts(resolution);
              },
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.conflicts.isEmpty
              ? _EmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  itemCount: state.conflicts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final conflict = state.conflicts[index];
                    return _ConflictCard(
                      conflict: conflict,
                      onResolve: (resolution) {
                        ref
                            .read(conflictControllerProvider.notifier)
                            .resolveConflict(conflict.id, resolution);
                      },
                    );
                  },
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
            Icons.sync_problem_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No conflicts',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'All your data is in sync',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _ConflictCard extends StatelessWidget {
  const _ConflictCard({
    required this.conflict,
    required this.onResolve,
  });

  final SyncConflictItem conflict;
  final void Function(ConflictResolution) onResolve;

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
                _TypeIcon(type: conflict.entityType),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _entityTypeName(conflict.entityType),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        conflict.localTitle,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Local version:',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              conflict.localVersion,
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Remote version:',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              conflict.remoteVersion,
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modified: ${DateFormat('MMM d, y • h:mm a').format(conflict.lastModifiedLocal)}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ConflictResolutionSheet.show(
                      context,
                      conflict: conflict,
                      onResolve: onResolve,
                    );
                  },
                  child: const Text('Resolve'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _entityTypeName(ConflictEntityType type) {
    return switch (type) {
      ConflictEntityType.event => 'Event',
      ConflictEntityType.reminder => 'Reminder',
      ConflictEntityType.plannerItem => 'Planner Item',
      ConflictEntityType.note => 'Note',
    };
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.type});

  final ConflictEntityType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData icon;
    Color color;

    switch (type) {
      case ConflictEntityType.event:
        icon = Icons.event;
        color = theme.colorScheme.primary;
      case ConflictEntityType.reminder:
        icon = Icons.notifications;
        color = theme.colorScheme.tertiary;
      case ConflictEntityType.plannerItem:
        icon = Icons.check_circle;
        color = theme.colorScheme.secondary;
      case ConflictEntityType.note:
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
