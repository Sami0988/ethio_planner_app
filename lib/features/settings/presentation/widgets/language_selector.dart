import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/locale_provider.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => const LanguageSelector(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    final languages = [
      (null, l10n.settingsLanguageSystem),
      (const Locale('en'), l10n.settingsLanguageEnglish),
      (const Locale('am'), l10n.settingsLanguageAmharic),
      (const Locale('om'), l10n.settingsLanguageOromoo),
      (const Locale('ti'), l10n.settingsLanguageTigrinya),
    ];

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l10n.settingsLanguage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          RadioGroup<Locale?>(
            groupValue: currentLocale,
            onChanged: (locale) {
              ref.read(localeProvider.notifier).setLocale(locale);
              Navigator.of(context).pop();
            },
            child: Column(
              children: [
                ...languages.map(
                  (lang) => RadioListTile<Locale?>(
                    title: Text(lang.$2),
                    value: lang.$1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
