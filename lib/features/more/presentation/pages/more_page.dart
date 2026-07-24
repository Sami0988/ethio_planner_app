import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';

/// The "More" hub (APP-FR-001). Reminders, Notes, Print Studio, Settings,
/// and Recently Deleted are reached from here rather than from the bottom
/// navigation.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(l10n.moreReminders),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.reminders),
          ),
          ListTile(
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('Notes'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.notes),
          ),
          ListTile(
            leading: const Icon(Icons.search_outlined),
            title: Text(l10n.searchLabel),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.search),
          ),
          ListTile(
            leading: const Icon(Icons.print_outlined),
            title: Text(l10n.morePrint),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.print),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(l10n.moreSettings),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.settings),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Recently Deleted',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(RouteNames.recentlyDeleted),
          ),
        ],
      ),
    );
  }
}
