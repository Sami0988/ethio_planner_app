import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logs Riverpod provider lifecycle events during development only.
///
/// Registered by `bootstrap` when verbose logging is enabled. Uses
/// [debugPrint] so it is stripped from release builds and does not trip the
/// `avoid_print` lint.
final class AppObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    debugPrint('[Provider] Added: ${_name(context)}');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    debugPrint('[Provider] Updated: ${_name(context)}');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    debugPrint('[Provider] Disposed: ${_name(context)}');
  }

  String _name(ProviderObserverContext context) =>
      context.provider.name ?? context.provider.runtimeType.toString();
}
