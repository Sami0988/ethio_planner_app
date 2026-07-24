import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<AuthResult> call({
    required String email,
    required String password,
    String? displayName,
  }) async {
    return _repository.register(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}

class VerifyEmailUseCase {
  final AuthRepository _repository;

  VerifyEmailUseCase(this._repository);

  Future<AuthResult> call({required String email, required String code}) async {
    return _repository.verifyEmail(email: email, code: code);
  }
}

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<AuthResult> call({
    required String email,
    required String password,
  }) async {
    return _repository.signIn(email: email, password: password);
  }
}

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<AuthResult> call({required String email}) async {
    return _repository.resetPassword(email: email);
  }
}

class ConfirmPasswordResetUseCase {
  final AuthRepository _repository;

  ConfirmPasswordResetUseCase(this._repository);

  Future<AuthResult> call({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    return _repository.confirmPasswordReset(
      email: email,
      code: code,
      newPassword: newPassword,
    );
  }
}

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> call() async {
    await _repository.signOut();
  }
}
