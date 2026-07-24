import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/secure_storage_provider.dart';
import 'secure_storage_service.dart';

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return SecureStorageService(storage);
});

enum AuthStatus { initial, authenticated, unauthenticated }

class AuthSession {
  final AuthStatus status;
  final String? accessToken;

  AuthSession({required this.status, this.accessToken});

  AuthSession copyWith({AuthStatus? status, String? accessToken}) {
    return AuthSession(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

class AuthSessionNotifier extends Notifier<AuthSession> {
  @override
  AuthSession build() => AuthSession(status: AuthStatus.initial);

  SecureStorageService get _storage => ref.read(secureStorageServiceProvider);

  Future<void> checkAuthStatus() async {
    final hasTokens = await _storage.hasTokens();
    if (hasTokens) {
      final token = await _storage.getAccessToken();
      state = AuthSession(status: AuthStatus.authenticated, accessToken: token);
    } else {
      state = AuthSession(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> login({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    state = AuthSession(
      status: AuthStatus.authenticated,
      accessToken: accessToken,
    );
  }

  Future<void> logout() async {
    await _storage.clearTokens();
    state = AuthSession(status: AuthStatus.unauthenticated);
  }
}

final authSessionProvider = NotifierProvider<AuthSessionNotifier, AuthSession>(
  AuthSessionNotifier.new,
);
