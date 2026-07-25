import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/app_config.dart';
import '../core/config/app_flavor.dart';
import '../core/notifications/notification_service.dart';
import '../core/providers/observers.dart';
import 'app.dart';

/// Global notification service instance for tap routing.
/// The RemindersController accesses this via the provider.
late final NotificationService notificationService;

/// Single composition root for every flavor entrypoint.
///
/// Resolves configuration, wires cross-cutting services and runs the app.
/// Feature entrypoints (`main_development.dart` etc.) only pick a flavor.
Future<void> bootstrap(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize(AppConfig.forFlavor(flavor));

  // Initialize notification service
  final plugin = FlutterLocalNotificationsPlugin();
  notificationService = NotificationService(plugin);
  await notificationService.init();

  // Handle notification taps — navigate to reminders
  notificationService.onNotificationTap((payload) {
    // Navigation will be handled by the router when it picks up the tap.
    // For now, this is a no-op placeholder.
  });

  runApp(
    ProviderScope(
      observers: [if (AppConfig.instance.enableVerboseLogging) AppObserver()],
      child: const App(),
    ),
  );
}
