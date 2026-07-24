import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/onboarding_provider.dart';
import 'onboarding_guest_explanation_page.dart';
import 'onboarding_guest_or_auth_page.dart';
import 'onboarding_intro_page.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(onboardingControllerProvider.select((s) => s.step));

    return switch (step) {
      OnboardingStep.intro => const OnboardingIntroPage(),
      OnboardingStep.guestOrAuth => const OnboardingGuestOrAuthPage(),
      OnboardingStep.guestExplanation => const OnboardingGuestExplanationPage(),
      OnboardingStep.complete => const SizedBox.shrink(),
    };
  }
}
