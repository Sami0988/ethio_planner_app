import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'auth_view_state.freezed.dart';

enum AuthView { signIn, register, verifyEmail, resetPassword, confirmPasswordReset }

@freezed
abstract class AuthViewState with _$AuthViewState {
  const factory AuthViewState({
    @Default(AuthView.signIn) AuthView view,
    User? user,
    @Default(false) bool isLoading,
    String? error,
    String? successMessage,
    String? pendingEmail,
  }) = _AuthViewState;
}
