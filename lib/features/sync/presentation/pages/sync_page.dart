import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/repositories/sync_repository.dart';
import '../providers/sync_providers.dart';

class SyncPage extends ConsumerWidget {
  const SyncPage({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(context: context, builder: (_) => const SyncPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(syncControllerProvider);

    return AlertDialog(
      title: const Text('Sync Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SyncStatusIndicator(status: state.status),
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: Text(
                state.error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          if (state.itemsSynced > 0 || state.itemsPending > 0)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: Text(
                'Synced: ${state.itemsSynced} items\nPending: ${state.itemsPending} items',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
        ],
      ),
      actions: [
        if (state.status == SyncStatus.idle ||
            state.status == SyncStatus.success ||
            state.status == SyncStatus.error)
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        if (state.status == SyncStatus.idle) ...[
          TextButton(
            onPressed: () {
              ref.read(syncControllerProvider.notifier).importGuestData();
            },
            child: const Text('Import Guest Data'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(syncControllerProvider.notifier).syncAll();
            },
            child: const Text('Sync Now'),
          ),
        ],
      ],
    );
  }
}

class _SyncStatusIndicator extends StatelessWidget {
  const _SyncStatusIndicator({required this.status});

  final SyncStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (status) {
      case SyncStatus.idle:
        return Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('Ready to sync'),
          ],
        );
      case SyncStatus.syncing:
        return const Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: AppSpacing.sm),
            Text('Syncing...'),
          ],
        );
      case SyncStatus.success:
        return Row(
          children: [
            Icon(Icons.check_circle, color: theme.colorScheme.primary),
            const SizedBox(width: AppSpacing.sm),
            const Text('Sync complete'),
          ],
        );
      case SyncStatus.error:
        return Row(
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error),
            const SizedBox(width: AppSpacing.sm),
            const Text('Sync failed'),
          ],
        );
      case SyncStatus.conflictDetected:
        return Row(
          children: [
            Icon(Icons.warning_amber, color: theme.colorScheme.error),
            const SizedBox(width: AppSpacing.sm),
            const Text('Conflicts detected'),
          ],
        );
      case SyncStatus.waitingForConnection:
        return const Row(
          children: [
            Icon(Icons.wifi_off),
            SizedBox(width: AppSpacing.sm),
            Text('Waiting for connection'),
          ],
        );
    }
  }
}
