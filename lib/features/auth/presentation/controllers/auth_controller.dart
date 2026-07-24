import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/storage/auth_session.dart';
import '../providers/auth_providers.dart';
import '../providers/auth_view_state.dart';

class AuthController extends Notifier<AuthViewState> {
  @override
  AuthViewState build() {
    return const AuthViewState();
  }

  void setView(AuthView view) {
    state = state.copyWith(
      view: view,
      error: null,
      successMessage: null,
    );
  }

  Future<void> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final useCase = ref.read(registerUseCaseProvider);
    final result = await useCase(
      email: email,
      password: password,
      displayName: displayName,
    );

    if (result.success) {
      if (result.accessToken != null && result.refreshToken != null) {
        await ref.read(authSessionProvider.notifier).login(
              accessToken: result.accessToken!,
              refreshToken: result.refreshToken!,
            );
        state = state.copyWith(
          isLoading: false,
          user: result.user,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          view: AuthView.verifyEmail,
          pendingEmail: email,
          successMessage: 'Verification code sent to $email',
        );
      }
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  Future<void> verifyEmail({
    required String email,
    required String code,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final useCase = ref.read(verifyEmailUseCaseProvider);
    final result = await useCase(email: email, code: code);

    if (result.success) {
      if (result.accessToken != null && result.refreshToken != null) {
        await ref.read(authSessionProvider.notifier).login(
              accessToken: result.accessToken!,
              refreshToken: result.refreshToken!,
            );
        state = state.copyWith(
          isLoading: false,
          user: result.user,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          view: AuthView.signIn,
          successMessage: 'Email verified. Please sign in.',
        );
      }
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final useCase = ref.read(signInUseCaseProvider);
    final result = await useCase(email: email, password: password);

    if (result.success) {
      if (result.accessToken != null && result.refreshToken != null) {
        await ref.read(authSessionProvider.notifier).login(
              accessToken: result.accessToken!,
              refreshToken: result.refreshToken!,
            );
        state = state.copyWith(
          isLoading: false,
          user: result.user,
        );
      }
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final useCase = ref.read(resetPasswordUseCaseProvider);
    final result = await useCase(email: email);

    if (result.success) {
      state = state.copyWith(
        isLoading: false,
        view: AuthView.confirmPasswordReset,
        pendingEmail: email,
        successMessage: 'Reset code sent to $email',
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  Future<void> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final useCase = ref.read(confirmPasswordResetUseCaseProvider);
    final result = await useCase(
      email: email,
      code: code,
      newPassword: newPassword,
    );

    if (result.success) {
      state = state.copyWith(
        isLoading: false,
        view: AuthView.signIn,
        successMessage: 'Password reset successful. Please sign in.',
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  Future<void> signOut() async {
    final useCase = ref.read(signOutUseCaseProvider);
    await useCase();
    await ref.read(authSessionProvider.notifier).logout();
    state = const AuthViewState();
  }
}
