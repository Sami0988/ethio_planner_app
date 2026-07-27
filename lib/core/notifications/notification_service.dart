import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'notification_sound_provider.dart';

typedef NotificationTapCallback = void Function(String? payload);

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;
  NotificationTapCallback? _onTap;

  /// Quiet hours: no notifications between [quietStartHour] and [quietEndHour].
  /// Default: 22:00–07:00 (Sprint 0 P-17).
  int quietStartHour = 22;
  int quietEndHour = 7;

  NotificationService(this._plugin);

  /// Callback when user taps a notification.
  void onNotificationTap(NotificationTapCallback callback) {
    _onTap = callback;
  }

  Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (details) {
        _onTap?.call(details.payload);
      },
    );
  }

  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }

    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  /// Returns true if [dateTime] falls within quiet hours.
  bool isQuietHours(DateTime dateTime) {
    final hour = dateTime.hour;
    if (quietStartHour > quietEndHour) {
      // Overnight quiet hours (e.g., 22:00–07:00)
      return hour >= quietStartHour || hour < quietEndHour;
    }
    // Same-day quiet hours (e.g., 12:00–14:00)
    return hour >= quietStartHour && hour < quietEndHour;
  }

  /// If [scheduledTime] is within quiet hours, shift it to [quietEndHour].
  DateTime _adjustForQuietHours(DateTime scheduledTime) {
    if (!isQuietHours(scheduledTime)) return scheduledTime;

    // Move to quiet end hour on the same day (or next day if quiet spans midnight)
    var adjusted = DateTime(
      scheduledTime.year,
      scheduledTime.month,
      scheduledTime.day,
      quietEndHour,
    );
    if (adjusted.isBefore(scheduledTime) ||
        (quietStartHour > quietEndHour &&
            scheduledTime.hour >= quietStartHour)) {
      adjusted = adjusted.add(const Duration(days: 1));
    }
    return adjusted;
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
    bool respectQuietHours = true,
    NotificationSound sound = NotificationSound.systemDefault,
  }) async {
    var finalTime = scheduledTime;
    if (respectQuietHours) {
      finalTime = _adjustForQuietHours(scheduledTime);
    }

    final tzDateTime = tz.TZDateTime.from(finalTime, tz.local);

    // Build Android notification details with selected sound
    final androidDetails = _buildAndroidDetails(sound);

    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      payload: payload,
      scheduledDate: tzDateTime,
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  AndroidNotificationDetails _buildAndroidDetails(NotificationSound sound) {
    if (sound.androidResource != null) {
      // Custom sound from res/raw/ folder
      return AndroidNotificationDetails(
        'reminders',
        'Reminders',
        channelDescription: 'Reminder notifications',
        importance: Importance.high,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound(sound.androidResource!),
      );
    }

    // System default sound
    return const AndroidNotificationDetails(
      'reminders',
      'Reminders',
      channelDescription: 'Reminder notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id: id);
  }

  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}
