import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_radii.dart';

enum BadgeStatus { holiday, overdue, completed, neutral }

class StatusBadge extends StatelessWidget {
  final String label;
  final BadgeStatus status;

  const StatusBadge({
    super.key,
    required this.label,
    required this.status,
  });

  Color get _backgroundColor {
    switch (status) {
      case BadgeStatus.holiday:
        return AppColorsLight.holiday;
      case BadgeStatus.overdue:
        return AppColorsLight.overdue;
      case BadgeStatus.completed:
        return AppColorsLight.completed;
      case BadgeStatus.neutral:
        return AppColorsLight.surfaceMuted;
    }
  }

  Color get _textColor {
    switch (status) {
      case BadgeStatus.holiday:
        return Colors.white;
      case BadgeStatus.overdue:
        return Colors.white;
      case BadgeStatus.completed:
        return Colors.white;
      case BadgeStatus.neutral:
        return AppColorsLight.textSecondary;
    }
  }

  String get _semanticLabel {
    switch (status) {
      case BadgeStatus.holiday:
        return 'Holiday: $label';
      case BadgeStatus.overdue:
        return 'Overdue: $label';
      case BadgeStatus.completed:
        return 'Completed: $label';
      case BadgeStatus.neutral:
        return label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: _semanticLabel,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: AppRadii.badge,
        ),
        child: Text(
          label,
          style: AppTextStyles.badge.copyWith(color: _textColor),
        ),
      ),
    );
  }
}
