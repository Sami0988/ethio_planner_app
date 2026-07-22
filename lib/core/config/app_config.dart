import 'app_flavor.dart';

/// Immutable, environment-specific configuration resolved once at startup.
///
/// No secrets are stored here; only non-sensitive per-environment values. The
/// API base URL is expected to be overridable at build time via
/// `--dart-define=API_BASE_URL=...` so CI and local builds can differ without
/// code changes.
final class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.enableVerboseLogging,
  });

  factory AppConfig.forFlavor(AppFlavor flavor) {
    const overrideBaseUrl = String.fromEnvironment('API_BASE_URL');
    switch (flavor) {
      case AppFlavor.development:
        return AppConfig(
          flavor: flavor,
          appName: 'Ethio Planner (Dev)',
          apiBaseUrl: overrideBaseUrl.isNotEmpty
              ? overrideBaseUrl
              : 'https://dev-api.ethioplanner.com',
          enableVerboseLogging: true,
        );
      case AppFlavor.staging:
        return AppConfig(
          flavor: flavor,
          appName: 'Ethio Planner (Staging)',
          apiBaseUrl: overrideBaseUrl.isNotEmpty
              ? overrideBaseUrl
              : 'https://staging-api.ethioplanner.com',
          enableVerboseLogging: true,
        );
      case AppFlavor.production:
        return AppConfig(
          flavor: flavor,
          appName: 'Ethio Planner',
          apiBaseUrl: overrideBaseUrl.isNotEmpty
              ? overrideBaseUrl
              : 'https://api.ethioplanner.com',
          enableVerboseLogging: false,
        );
    }
  }

  final AppFlavor flavor;
  final String appName;
  final String apiBaseUrl;
  final bool enableVerboseLogging;

  static AppConfig? _instance;

  /// The active configuration. Call [initialize] exactly once in `bootstrap`
  /// before the widget tree is built.
  static AppConfig get instance {
    final config = _instance;
    if (config == null) {
      throw StateError('AppConfig.initialize must be called before use.');
    }
    return config;
  }

  static void initialize(AppConfig config) => _instance = config;
}
