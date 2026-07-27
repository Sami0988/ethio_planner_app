import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/notifications/notification_sound_provider.dart';
import '../../../../core/theme/app_spacing.dart';

/// Bottom sheet for selecting notification sound.
class NotificationSoundSelector extends ConsumerWidget {
  const NotificationSoundSelector({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => const NotificationSoundSelector(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentSound = ref.watch(notificationSoundProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.settingsNotificationSound,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            for (final sound in NotificationSound.values)
              ListTile(
                title: Text(_soundLabel(sound, l10n)),
                subtitle: Text(_soundDescription(sound, l10n)),
                trailing: currentSound == sound
                    ? Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                onTap: () {
                  ref.read(notificationSoundProvider.notifier).setSound(sound);
                },
              ),
          ],
        ),
      ),
    );
  }

  String _soundLabel(NotificationSound sound, AppLocalizations l10n) {
    switch (sound) {
      case NotificationSound.systemDefault:
        return l10n.notificationSoundSystem;
      case NotificationSound.ethiopianBell:
        return l10n.notificationSoundEthiopianBell;
      case NotificationSound.gentleChime:
        return l10n.notificationSoundGentleChime;
      case NotificationSound.softPing:
        return l10n.notificationSoundSoftPing;
      case NotificationSound.warmTone:
        return l10n.notificationSoundWarmTone;
    }
  }

  String _soundDescription(NotificationSound sound, AppLocalizations l10n) {
    switch (sound) {
      case NotificationSound.systemDefault:
        return l10n.notificationSoundSystemDesc;
      case NotificationSound.ethiopianBell:
      case NotificationSound.gentleChime:
      case NotificationSound.softPing:
      case NotificationSound.warmTone:
        return l10n.notificationSoundCustomDesc;
    }
  }
}
