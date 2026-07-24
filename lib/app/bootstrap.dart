import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/app_config.dart';
import '../core/config/app_flavor.dart';
import '../core/providers/observers.dart';
import 'app.dart';

/// Single composition root for every flavor entrypoint.
///
/// Resolves configuration, wires cross-cutting services and runs the app.
/// Feature entrypoints (`main_development.dart` etc.) only pick a flavor.
Future<void> bootstrap(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize(AppConfig.forFlavor(flavor));

  runApp(
    ProviderScope(
      observers: [if (AppConfig.instance.enableVerboseLogging) AppObserver()],
      child: const App(),
    ),
  );
}
