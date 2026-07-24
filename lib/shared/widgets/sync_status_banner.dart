import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/sync/sync_status.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// Subtle, always-honest synchronization indicator (SYNC-FR-004).
///
/// Communicates state with icon + text + semantics — never colour alone
/// (ACC-FR-004). Hidden entirely when everything is synced. Never shows
/// "Synced" from mere connectivity (SYNC-FR-005): the caller passes the real
/// persisted status.
class SyncStatusBanner extends StatelessWidget {
  const SyncStatusBanner({
    super.key,
    required this.status,
    this.pendingCount = 0,
    this.onRetry,
    this.onReview,
  });

  final SyncStatus status;
  final int pendingCount;
  final VoidCallback? onRetry;
  final VoidCallback? onReview;

  @override
  Widget build(BuildContext context) {
    if (status == SyncStatus.synced) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final label = _label(l10n);
    final tone = _tone(context);
    final action = _action(context, l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
        vertical: AppSpacing.xs,
      ),
      child: Semantics(
        container: true,
        label: action == null ? label : '$label. ${action.label}',
        button: action != null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: tone.withValues(alpha: 0.12),
            borderRadius: AppRadii.card,
          ),
          child: Row(
            children: [
              Icon(_icon, size: 16, color: tone),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.cardSubtitle.copyWith(color: tone),
                ),
              ),
              if (action != null)
                TextButton(
                  onPressed: action.onPressed,
                  child: Text(action.label),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData get _icon => switch (status) {
    SyncStatus.offline => Icons.cloud_off_rounded,
    SyncStatus.savedLocally => Icons.save_rounded,
    SyncStatus.waitingToSync => Icons.schedule_rounded,
    SyncStatus.syncing => Icons.sync_rounded,
    SyncStatus.synced => Icons.check_circle_rounded,
    SyncStatus.syncFailed => Icons.error_outline_rounded,
    SyncStatus.rejected => Icons.block_rounded,
    SyncStatus.conflictDetected => Icons.merge_type_rounded,
    SyncStatus.actionRequired => Icons.priority_high_rounded,
  };

  String _label(AppLocalizations l10n) => switch (status) {
    SyncStatus.offline => l10n.syncOffline,
    SyncStatus.savedLocally => l10n.syncSavedLocally,
    SyncStatus.waitingToSync => l10n.syncWaiting(pendingCount),
    SyncStatus.syncing => l10n.syncingLabel,
    SyncStatus.synced => l10n.syncSynced,
    SyncStatus.syncFailed => l10n.syncFailed,
    SyncStatus.rejected => l10n.syncRejected,
    SyncStatus.conflictDetected => l10n.syncConflict,
    SyncStatus.actionRequired => l10n.syncActionRequired,
  };

  Color _tone(BuildContext context) => switch (status) {
    SyncStatus.syncFailed || SyncStatus.rejected => context.colorOverdue,
    SyncStatus.conflictDetected ||
    SyncStatus.actionRequired => context.colorHoliday,
    SyncStatus.offline || SyncStatus.savedLocally => context.colorTextSecondary,
    _ => context.colorPrimary,
  };

  _BannerAction? _action(BuildContext context, AppLocalizations l10n) {
    if (status == SyncStatus.syncFailed && onRetry != null) {
      return _BannerAction(l10n.syncRetry, onRetry!);
    }
    if (status == SyncStatus.conflictDetected && onReview != null) {
      return _BannerAction(l10n.syncReview, onReview!);
    }
    return null;
  }
}

class _BannerAction {
  const _BannerAction(this.label, this.onPressed);
  final String label;
  final VoidCallback onPressed;
}
