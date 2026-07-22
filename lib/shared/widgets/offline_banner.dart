import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SyncStatus { synced, offline, syncing }

class OfflineBanner extends ConsumerWidget {
  final SyncStatus status;

  const OfflineBanner({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (status == SyncStatus.synced) return const SizedBox.shrink();

    final isOffline = status == SyncStatus.offline;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      color: isOffline ? AppColorsLight.surfaceMuted : AppColorsLight.primaryLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOffline ? Icons.cloud_off_rounded : Icons.sync_rounded,
            size: 16,
            color: isOffline ? AppColorsLight.textMuted : AppColorsLight.primary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            isOffline ? 'You are offline' : 'Syncing...',
            style: AppTextStyles.cardSubtitle.copyWith(
              color: isOffline ? AppColorsLight.textMuted : AppColorsLight.primary,
            ),
          ),
        ],
      ),
    );
  }
}
