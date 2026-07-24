import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notification_service.dart';

final flutterLocalNotificationsProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
      return FlutterLocalNotificationsPlugin();
    });

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final plugin = ref.watch(flutterLocalNotificationsProvider);
  return NotificationService(plugin);
});
