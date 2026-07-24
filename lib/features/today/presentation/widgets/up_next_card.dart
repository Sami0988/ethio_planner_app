import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/sync/sync_status.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/today_view_state.dart';

/// The nearest important upcoming item (TODAY-FR-010), shown as a self-contained
/// card with a header row (label + sync badge), title, subtitle, and time range.
class UpNextCard extends StatelessWidget {
  const UpNextCard({super.key, required this.item});

  final UpNextPresentation item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final timeRange = _buildTimeRange(item, l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: AppRadii.card as BorderRadius?,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorPrimaryLight,
                  context.colorPrimaryLight.withOpacity(0.6),
                ],
              ),
              borderRadius: AppRadii.card,
              boxShadow: [
                BoxShadow(
                  color: context.colorPrimary.withOpacity(0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: context.colorPrimary.withOpacity(0.12),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row: label + sync badge
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: context.colorPrimary.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.schedule_rounded,
                          size: 14,
                          color: context.colorPrimary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        l10n.sectionUpNext,
                        style: AppTextStyles.sectionLabel.copyWith(
                          color: context.colorPrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const Spacer(),
                      _SyncBadge(status: item.syncStatus, l10n: l10n),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Title
                  Text(
                    item.title,
                    style: AppTextStyles.cardTitle.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: context.colorTextPrimary,
                    ),
                  ),
                  // Subtitle
                  if (item.subtitle != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      item.subtitle!,
                      style: AppTextStyles.cardSubtitle.copyWith(
                        color: context.colorTextSecondary,
                      ),
                    ),
                  ],
                  // Time range
                  if (timeRange != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorSurface.withOpacity(0.6),
                        borderRadius: AppRadii.badge,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: context.colorPrimary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            timeRange,
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colorTextPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _buildTimeRange(UpNextPresentation item, AppLocalizations l10n) {
    if (item.isAllDay) return l10n.allDay;
    if (item.time != null && item.timeEnd != null) {
      return '${item.time} - ${item.timeEnd}';
    }
    return item.time;
  }
}

class _SyncBadge extends StatelessWidget {
  const _SyncBadge({required this.status, required this.l10n});

  final SyncStatus status;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final label = _label(l10n);
    if (label == null) return const SizedBox.shrink();

    final isActive = status == SyncStatus.syncing ||
        status == SyncStatus.waitingToSync;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colorSurface,
        borderRadius: AppRadii.badge,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            _PulsingDot(color: _dotColor(context))
          else
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: _dotColor(context),
                shape: BoxShape.circle,
              ),
            ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: AppTextStyles.badge.copyWith(
              color: context.colorTextSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  String? _label(AppLocalizations l10n) {
    switch (status) {
      case SyncStatus.savedLocally:
        return l10n.syncSavedLocally;
      case SyncStatus.waitingToSync:
        return l10n.syncWaitingToSync;
      case SyncStatus.syncing:
        return l10n.syncSyncing;
      case SyncStatus.synced:
        return l10n.syncSynced;
      case SyncStatus.syncFailed:
        return l10n.syncFailed;
      case SyncStatus.offline:
        return l10n.syncOffline;
      case SyncStatus.rejected:
        return l10n.syncRejected;
      case SyncStatus.conflictDetected:
        return l10n.syncConflict;
      case SyncStatus.actionRequired:
        return l10n.syncActionRequired;
    }
  }

  Color _dotColor(BuildContext context) {
    switch (status) {
      case SyncStatus.synced:
        return context.colorSuccess;
      case SyncStatus.savedLocally:
        return context.colorSuccess;
      case SyncStatus.syncing:
        return context.colorPrimary;
      case SyncStatus.waitingToSync:
        return context.colorPrimary;
      case SyncStatus.syncFailed:
        return context.colorOverdue;
      case SyncStatus.offline:
        return context.colorTextMuted;
      case SyncStatus.rejected:
        return context.colorOverdue;
      case SyncStatus.conflictDetected:
        return context.colorOverdue;
      case SyncStatus.actionRequired:
        return context.colorHoliday;
    }
  }
}

class _PulsingDot extends StatefulWidget {
  const _PulsingDot({required this.color});

  final Color color;

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = 0.8 + (_controller.value * 0.6);
        return Opacity(
          opacity: 0.5 + (_controller.value * 0.5),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}