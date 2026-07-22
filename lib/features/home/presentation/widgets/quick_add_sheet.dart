import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/router/route_names.dart';

class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const QuickAddSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Quick Add', style: AppTextStyles.cardTitle),
            const SizedBox(height: AppSpacing.lg),
            _QuickAddOption(
              icon: Icons.event_rounded,
              label: 'Event',
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.calendar);
              },
            ),
            _QuickAddOption(
              icon: Icons.notifications_rounded,
              label: 'Reminder',
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.reminders);
              },
            ),
            _QuickAddOption(
              icon: Icons.task_alt_rounded,
              label: 'Planner Entry',
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.planner);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAddOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAddOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(label, style: AppTextStyles.cardTitle),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
