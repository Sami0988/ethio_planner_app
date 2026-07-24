import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum OnboardingStep { intro, guestOrAuth, guestExplanation, complete }

class OnboardingState {
  final OnboardingStep step;
  final bool hasCompletedOnboarding;

  const OnboardingState({
    this.step = OnboardingStep.intro,
    this.hasCompletedOnboarding = false,
  });

  OnboardingState copyWith({
    OnboardingStep? step,
    bool? hasCompletedOnboarding,
  }) {
    return OnboardingState(
      step: step ?? this.step,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    );
  }
}

class OnboardingNotifier extends Notifier<OnboardingState> {
  static const _key = 'onboarding_complete';

  @override
  OnboardingState build() {
    _load();
    return const OnboardingState();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final complete = prefs.getBool(_key) ?? false;
    state = state.copyWith(hasCompletedOnboarding: complete);
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    state = state.copyWith(hasCompletedOnboarding: true);
  }

  void goToGuestOrAuth() {
    state = state.copyWith(step: OnboardingStep.guestOrAuth);
  }

  void goToGuestExplanation() {
    state = state.copyWith(step: OnboardingStep.guestExplanation);
  }

  void dismissOnboarding() {
    completeOnboarding();
  }
}

final onboardingControllerProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
