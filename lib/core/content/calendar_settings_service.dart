import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'calendar_settings.dart';

/// Persists calendar settings to SharedPreferences.
class CalendarSettingsService {
  static const _key = 'calendar_settings';

  CalendarSettings? _settings;

  /// Load settings from storage, returning defaults if not yet saved.
  Future<CalendarSettings> load() async {
    if (_settings != null) return _settings!;
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json != null) {
      _settings = CalendarSettings.fromJson(
        jsonDecode(json) as Map<String, dynamic>,
      );
    } else {
      _settings = const CalendarSettings();
    }
    return _settings!;
  }

  /// Save settings to storage.
  Future<void> save(CalendarSettings settings) async {
    _settings = settings;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(settings.toJson()));
  }

  /// Update settings using a modifier function.
  Future<CalendarSettings> update(
    CalendarSettings Function(CalendarSettings) modifier,
  ) async {
    final current = await load();
    final updated = modifier(current);
    await save(updated);
    return updated;
  }

  /// Check if a content bundle is enabled.
  Future<bool> isBundleEnabled(String bundleId) async {
    final settings = await load();
    return settings.enabledContentBundles.contains(bundleId);
  }

  /// Toggle a content bundle on/off.
  Future<CalendarSettings> toggleBundle(String bundleId) async {
    return update((s) {
      final bundles = List<String>.from(s.enabledContentBundles);
      if (bundles.contains(bundleId)) {
        bundles.remove(bundleId);
      } else {
        bundles.add(bundleId);
      }
      return s.copyWith(enabledContentBundles: bundles);
    });
  }
}
