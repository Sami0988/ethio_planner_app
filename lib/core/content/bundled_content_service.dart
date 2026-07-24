import 'dart:convert';

import 'package:flutter/services.dart';

import 'bundled_content.dart';

/// Service that loads and queries bundled content (holidays, observances).
///
/// Content is loaded from bundled JSON assets and cached in memory.
/// Each item has a stable ID, four-language titles, and a date that is
/// either fixed (month/day) or computed from a recurrence rule.
class BundledContentService {
  List<BundledContent>? _holidays;
  List<BundledContent>? _observances;

  /// Load all bundled content from assets.
  Future<void> load() async {
    _holidays = await _loadBundle('assets/content/ethiopian_holidays.json');
    _observances = await _loadBundle(
      'assets/content/ethiopian_observances.json',
    );
  }

  Future<List<BundledContent>> _loadBundle(String assetPath) async {
    final json = await rootBundle.loadString(assetPath);
    final bundle = ContentBundle.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );
    return bundle.items;
  }

  /// All holidays.
  List<BundledContent> get holidays => _holidays ?? [];

  /// All observances.
  List<BundledContent> get observances => _observances ?? [];

  /// All content items combined.
  List<BundledContent> get allContent => [...holidays, ...observances];

  /// Find content items for a given Ethiopian date (month/day).
  List<BundledContent> findByEthiopianDate(int month, int day) {
    return allContent
        .where(
          (item) =>
              item.calendarBasis == ContentCalendarBasis.ethiopian &&
              item.ecMonth == month &&
              item.ecDay == day,
        )
        .toList();
  }

  /// Find content items for a given Gregorian date (month/day).
  List<BundledContent> findByGregorianDate(int month, int day) {
    return allContent
        .where(
          (item) =>
              item.calendarBasis == ContentCalendarBasis.gregorian &&
              item.gcMonth == month &&
              item.gcDay == day,
        )
        .toList();
  }

  /// Find content items for today using Ethiopian calendar.
  List<BundledContent> findForEthiopianDate(int year, int month, int day) {
    return findByEthiopianDate(month, day);
  }

  /// Get content by stable ID.
  BundledContent? findById(String id) {
    try {
      return allContent.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Get localized title for a content item.
  static String localizedTitle(BundledContent item, String locale) {
    return switch (locale) {
      'am' => item.titleAm,
      'om' => item.titleOm,
      'ti' => item.titleTi,
      _ => item.titleEn,
    };
  }

  /// Get localized description for a content item.
  static String? localizedDescription(BundledContent item, String locale) {
    return switch (locale) {
      'am' => item.descriptionAm,
      'om' => item.descriptionOm,
      'ti' => item.descriptionTi,
      _ => item.descriptionEn,
    };
  }
}
