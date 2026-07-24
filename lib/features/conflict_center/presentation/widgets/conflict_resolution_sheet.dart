import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/repositories/conflict_repository.dart';

class ConflictResolutionSheet extends StatelessWidget {
  const ConflictResolutionSheet({
    super.key,
    required this.conflict,
    required this.onResolve,
  });

  final SyncConflictItem conflict;
  final void Function(ConflictResolution) onResolve;

  static Future<void> show(
    BuildContext context, {
    required SyncConflictItem conflict,
    required void Function(ConflictResolution) onResolve,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (_) =>
          ConflictResolutionSheet(conflict: conflict, onResolve: onResolve),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text('Resolve Conflict', style: theme.textTheme.titleLarge),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('Keep local version'),
            subtitle: Text(
              conflict.localVersion,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.of(context).pop();
              onResolve(ConflictResolution.keepLocal);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Keep remote version'),
            subtitle: Text(
              conflict.remoteVersion,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.of(context).pop();
              onResolve(ConflictResolution.keepRemote);
            },
          ),
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text('Keep both versions'),
            subtitle: const Text('Create a duplicate of the remote version'),
            onTap: () {
              Navigator.of(context).pop();
              onResolve(ConflictResolution.keepBoth);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
