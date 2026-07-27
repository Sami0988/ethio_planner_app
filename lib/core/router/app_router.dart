import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/conflict_center/presentation/pages/conflict_center_page.dart';
import '../../features/date_converter/presentation/pages/date_converter_page.dart';
import '../../features/more/presentation/pages/more_page.dart';
import '../../features/notes/presentation/pages/notes_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/providers/onboarding_provider.dart';
import '../../features/planner/presentation/pages/planner_page.dart';
import '../../features/recently_deleted/presentation/pages/recently_deleted_page.dart';
import '../../features/reminders/presentation/pages/reminders_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/today/presentation/pages/today_page.dart';
import 'route_names.dart';
import 'shell_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final onboardingState = ref.watch(onboardingControllerProvider);

  return GoRouter(
    initialLocation: onboardingState.hasCompletedOnboarding
        ? RouteNames.home
        : RouteNames.onboarding,
    routes: [
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
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
                const NoTransitionPage(child: CalendarPage()),
          ),
          GoRoute(
            path: RouteNames.planner,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PlannerPage()),
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
        builder: (context, state) => const RemindersPage(),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: RouteNames.search,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: RouteNames.notes,
        builder: (context, state) => const NotesPage(),
      ),
      GoRoute(
        path: RouteNames.auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: RouteNames.recentlyDeleted,
        builder: (context, state) => const RecentlyDeletedPage(),
      ),
      GoRoute(
        path: RouteNames.dateConverter,
        builder: (context, state) => const DateConverterPage(),
      ),
      GoRoute(
        path: RouteNames.conflictCenter,
        builder: (context, state) => const ConflictCenterPage(),
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

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404')));
  }
}
