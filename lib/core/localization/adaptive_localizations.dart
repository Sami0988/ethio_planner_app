import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// A [MaterialLocalizations] delegate that gracefully handles locales not
/// supported by Flutter's built-in [GlobalMaterialLocalizations] (e.g. Oromo
/// `om`, Tigrinya `ti`). When the requested locale isn't natively supported
/// it falls back to English so that Material widgets never crash.
final class AdaptiveMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const AdaptiveMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    if (GlobalMaterialLocalizations.delegate.isSupported(locale)) {
      return GlobalMaterialLocalizations.delegate.load(locale);
    }
    return GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(AdaptiveMaterialLocalizationsDelegate old) => false;
}

/// A [CupertinoLocalizations] delegate that gracefully handles locales not
/// supported by Flutter's built-in [GlobalCupertinoLocalizations]. Falls back
/// to English for unsupported locales.
final class AdaptiveCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const AdaptiveCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    if (GlobalCupertinoLocalizations.delegate.isSupported(locale)) {
      return GlobalCupertinoLocalizations.delegate.load(locale);
    }
    return GlobalCupertinoLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(AdaptiveCupertinoLocalizationsDelegate old) => false;
}
