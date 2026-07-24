import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/content/bundled_content.dart';
import '../../../../core/content/bundled_content_service.dart';
import '../../../../core/content/calendar_settings.dart';
import '../../../../core/content/calendar_settings_service.dart';

/// Provider for the bundled content service.
final bundledContentServiceProvider = Provider<BundledContentService>((ref) {
  return BundledContentService();
});

/// Provider for the calendar settings service.
final calendarSettingsServiceProvider = Provider<CalendarSettingsService>((
  ref,
) {
  return CalendarSettingsService();
});

/// FutureProvider that loads bundled content at app startup.
final bundledContentProvider = FutureProvider<List<BundledContent>>((
  ref,
) async {
  final service = ref.watch(bundledContentServiceProvider);
  await service.load();
  return service.allContent;
});

/// FutureProvider that loads calendar settings at app startup.
final calendarSettingsProvider = FutureProvider<CalendarSettings>((ref) async {
  final service = ref.watch(calendarSettingsServiceProvider);
  return service.load();
});
