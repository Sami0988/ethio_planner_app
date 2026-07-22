import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderObserverContext context,
    Object? value,
  ) {
    print('[Provider] Added: ${context.provider.name ?? context.provider.runtimeType}');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    print('[Provider] Updated: ${context.provider.name ?? context.provider.runtimeType}');
  }

  @override
  void didDisposeProvider(
    ProviderObserverContext context,
  ) {
    print('[Provider] Disposed: ${context.provider.name ?? context.provider.runtimeType}');
  }
}
