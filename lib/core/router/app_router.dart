import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/more/presentation/pages/more_page.dart';
import '../../features/today/presentation/pages/today_page.dart';
import 'route_names.dart';
import 'shell_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.toString();
          var currentIndex = 0;
          if (location.startsWith(RouteNames.calendar)) {
            currentIndex = 1;
          } else if (location.startsWith(RouteNames.planner)) {
            currentIndex = 2;
          } else if (location.startsWith(RouteNames.more)) {
            currentIndex = 3;
          }
          return ShellPage(currentIndex: currentIndex, child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.home,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TodayPage()),
          ),
          GoRoute(
            path: RouteNames.calendar,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: _CalendarPlaceholder()),
          ),
          GoRoute(
            path: RouteNames.planner,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: _PlannerPlaceholder()),
          ),
          GoRoute(
            path: RouteNames.more,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MorePage()),
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.reminders,
        builder: (context, state) => const _SimpleScaffold(titleKey: 'reminders'),
      ),
      GoRoute(
        path: RouteNames.print,
        builder: (context, state) => const _SimpleScaffold(titleKey: 'print'),
      ),
      GoRoute(
        path: RouteNames.error,
        builder: (context, state) => const ErrorPage(),
      ),
      GoRoute(
        path: '/:path(.*)',
        builder: (context, state) => const ErrorPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
});

class _CalendarPlaceholder extends StatelessWidget {
  const _CalendarPlaceholder();

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppLocalizations.of(context).calendarTab));
}

class _PlannerPlaceholder extends StatelessWidget {
  const _PlannerPlaceholder();

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppLocalizations.of(context).plannerTab));
}

/// Temporary full-screen placeholder for secondary destinations reached from
/// More (Reminders, Print). Replaced by real screens in later phases.
class _SimpleScaffold extends StatelessWidget {
  const _SimpleScaffold({required this.titleKey});

  final String titleKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final title = titleKey == 'print' ? l10n.morePrint : l10n.moreReminders;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404')),
    );
  }
}
