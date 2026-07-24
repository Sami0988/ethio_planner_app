import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/content/calendar_settings.dart';
import '../providers/content_providers.dart';

/// Settings widget for managing content packs (holidays, observances).
class ContentPackSettings extends ConsumerWidget {
  const ContentPackSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(calendarSettingsProvider);

    return settingsAsync.when(
      data: (settings) => _buildContent(context, ref, settings),
      loading: () => const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    CalendarSettings settings,
  ) {
    final l10n = AppLocalizations.of(context);
    final contentAsync = ref.watch(bundledContentProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.settingsContentPacks,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        contentAsync.when(
          data: (content) {
            final bundles = <String, String>{
              'ethiopian_holidays': l10n.settingsEthiopianHolidays,
              'ethiopian_observances': l10n.settingsEthiopianObservances,
            };

            return Column(
              children: bundles.entries.map((entry) {
                final isEnabled = settings.enabledContentBundles.contains(
                  entry.key,
                );
                return SwitchListTile(
                  title: Text(entry.value),
                  subtitle: Text(
                    isEnabled ? l10n.settingsEnabled : l10n.settingsDisabled,
                  ),
                  value: isEnabled,
                  onChanged: (value) async {
                    final service = ref.read(calendarSettingsServiceProvider);
                    await service.toggleBundle(entry.key);
                    ref.invalidate(calendarSettingsProvider);
                  },
                );
              }).toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ],
    );
  }
}
