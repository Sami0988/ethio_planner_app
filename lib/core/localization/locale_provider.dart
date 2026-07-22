import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Interface languages available in Version 1 (LOC-FR-001).
///
/// Only English and Amharic are in scope. Afaan Oromo (`om`) and Tigrinya
/// (`ti`) are planned but must pass native-speaker translation review before
/// they are added here.
const List<Locale> supportedLocales = <Locale>[
  Locale('en'),
  Locale('am'),
];

/// The user-selected interface locale. `null` means "follow the system",
/// which Flutter resolves against [supportedLocales].
final class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() => null;

  void setLocale(Locale? locale) => state = locale;
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);
