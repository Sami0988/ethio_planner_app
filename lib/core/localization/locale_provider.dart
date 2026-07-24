import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Interface languages available in Version 1 (LOC-FR-001).
const List<Locale> supportedLocales = <Locale>[
  Locale('en'),
  Locale('am'),
  Locale('om'),
  Locale('ti'),
];

const _kLocaleKey = 'locale';

/// The user-selected interface locale. `null` means "follow the system",
/// which Flutter resolves against [supportedLocales].
final class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    _loadLocale();
    return null;
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_kLocaleKey);
    if (code != null) {
      final locale = Locale(code);
      if (supportedLocales.contains(locale)) {
        state = locale;
      }
    }
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_kLocaleKey);
    } else {
      await prefs.setString(_kLocaleKey, locale.languageCode);
    }
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(
  LocaleNotifier.new,
);
