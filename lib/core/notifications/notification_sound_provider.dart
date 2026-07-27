import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kNotificationSoundKey = 'notification_sound';

/// Available notification sounds.
enum NotificationSound {
  systemDefault('System Default', null),
  ethiopianBell('Ethiopian Bell', 'ethiopian_bell'),
  gentleChime('Gentle Chime', 'gentle_chime'),
  softPing('Soft Ping', 'soft_ping'),
  warmTone('Warm Tone', 'warm_tone');

  const NotificationSound(this.label, this.androidResource);
  final String label;
  final String? androidResource;
}

/// Notifier for notification sound setting.
class NotificationSoundNotifier extends Notifier<NotificationSound> {
  @override
  NotificationSound build() {
    _load();
    return NotificationSound.systemDefault;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_kNotificationSoundKey) ?? 0;
    if (index < NotificationSound.values.length) {
      state = NotificationSound.values[index];
    }
  }

  Future<void> setSound(NotificationSound sound) async {
    state = sound;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kNotificationSoundKey, sound.index);
  }
}

final notificationSoundProvider =
    NotifierProvider<NotificationSoundNotifier, NotificationSound>(
  NotificationSoundNotifier.new,
);
