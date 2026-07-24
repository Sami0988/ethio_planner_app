import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';
import '../providers/auth_view_state.dart';
import 'register_page.dart';
import 'reset_password_page.dart';
import 'sign_in_page.dart';
import 'verify_email_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    return switch (state.view) {
      AuthView.signIn => const SignInPage(),
      AuthView.register => const RegisterPage(),
      AuthView.verifyEmail => const VerifyEmailPage(),
      AuthView.resetPassword ||
      AuthView.confirmPasswordReset => const ResetPasswordPage(),
    };
  }
}
