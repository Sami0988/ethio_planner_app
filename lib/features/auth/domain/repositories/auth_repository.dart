import '../entities/user.dart';

class AuthResult {
  final bool success;
  final String? error;
  final String? accessToken;
  final String? refreshToken;
  final User? user;

  const AuthResult({
    required this.success,
    this.error,
    this.accessToken,
    this.refreshToken,
    this.user,
  });
}

abstract class AuthRepository {
  Future<AuthResult> register({
    required String email,
    required String password,
    String? displayName,
  });

  Future<AuthResult> verifyEmail({
    required String email,
    required String code,
  });

  Future<AuthResult> signIn({
    required String email,
    required String password,
  });

  Future<AuthResult> resetPassword({required String email});

  Future<AuthResult> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  });

  Future<void> signOut();

  Future<User?> getCurrentUser();
}
