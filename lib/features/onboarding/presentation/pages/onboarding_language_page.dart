import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/locale_provider.dart';
import '../../providers/onboarding_provider.dart';

class OnboardingLanguagePage extends ConsumerWidget {
  const OnboardingLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final notifier = ref.read(onboardingControllerProvider.notifier);
    final currentLocale = ref.watch(localeProvider);

    final languages = [
      (null, l10n.onboardingSystemLanguage, Icons.smartphone_outlined),
      (const Locale('en'), 'English', Icons.language),
      (const Locale('am'), 'አማርኛ', Icons.language),
      (const Locale('om'), 'Afaan Oromoo', Icons.language),
      (const Locale('ti'), 'ትግርኛ', Icons.language),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Icon(
                Icons.language_rounded,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.onboardingLanguageTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.onboardingLanguageBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 2),
              ...languages.map((lang) {
                final locale = lang.$1;
                final label = lang.$2;
                final icon = lang.$3;
                final isSelected = currentLocale == locale;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () => notifier.setLanguage(locale),
                      icon: Icon(
                        icon,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                      label: Text(
                        label,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected
                            ? theme.colorScheme.primaryContainer
                                .withValues(alpha: 0.3)
                            : null,
                        side: BorderSide(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
