import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';
import 'shell_page.dart';
import '../../features/home/presentation/pages/today_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.toString();
          int currentIndex = 0;
          if (location.startsWith(RouteNames.calendar)) {
            currentIndex = 1;
          } else if (location.startsWith(RouteNames.reminders)) {
            currentIndex = 2;
          } else if (location.startsWith(RouteNames.planner)) {
            currentIndex = 3;
          } else if (location.startsWith(RouteNames.print)) {
            currentIndex = 4;
          }
          return ShellPage(currentIndex: currentIndex, child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TodayPage(),
            ),
          ),
          GoRoute(
            path: RouteNames.calendar,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CalendarTab(),
            ),
          ),
          GoRoute(
            path: RouteNames.reminders,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RemindersTab(),
            ),
          ),
          GoRoute(
            path: RouteNames.planner,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PlannerTab(),
            ),
          ),
          GoRoute(
            path: RouteNames.print,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PrintTab(),
            ),
          ),
        ],
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

class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Calendar')),
    );
  }
}

class RemindersTab extends StatelessWidget {
  const RemindersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Reminders')),
    );
  }
}

class PlannerTab extends StatelessWidget {
  const PlannerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Planner')),
    );
  }
}

class PrintTab extends StatelessWidget {
  const PrintTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Print')),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('404 - Page not found'),
      ),
    );
  }
}
