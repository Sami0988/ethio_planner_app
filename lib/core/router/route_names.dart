class RouteNames {
  RouteNames._();

  // Primary bottom-navigation destinations (APP-FR-001).
  static const String home = '/home';
  static const String calendar = '/calendar';
  static const String planner = '/planner';
  static const String more = '/more';

  // Secondary destinations reached from More, Quick Add, notifications, etc.
  // Reminders are intentionally NOT a bottom-navigation destination.
  static const String reminders = '/reminders';
  static const String settings = '/settings';
  static const String search = '/search';
  static const String notes = '/notes';
  static const String auth = '/auth';
  static const String recentlyDeleted = '/recently-deleted';
  static const String dateConverter = '/date-converter';
  static const String conflictCenter = '/conflict-center';
  static const String onboarding = '/onboarding';

  static const String error = '/error';
}
