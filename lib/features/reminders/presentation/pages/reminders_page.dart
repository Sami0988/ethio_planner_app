import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifications/notification_provider.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/reminders_providers.dart';
import '../widgets/reminder_card.dart';
import '../widgets/reminder_filter_chips.dart';
import '../widgets/reminder_form_sheet.dart';

class RemindersPage extends ConsumerStatefulWidget {
  const RemindersPage({super.key});

  @override
  ConsumerState<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends ConsumerState<RemindersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAndLoad();
    });
  }

  void _initAndLoad() {
    final controller = ref.read(remindersControllerProvider.notifier);
    controller.setDependencies(
      getReminders: ref.read(getRemindersProvider),
      getOverdueReminders: ref.read(getOverdueRemindersProvider),
      getUpcomingReminders: ref.read(getUpcomingRemindersProvider),
      createReminder: ref.read(createReminderProvider),
      updateReminder: ref.read(updateReminderProvider),
      deleteReminder: ref.read(deleteReminderProvider),
      toggleCompleted: ref.read(toggleReminderCompletedProvider),
      notificationService: ref.read(notificationServiceProvider),
    );
    controller.loadReminders().then((_) {
      // Rebuild notifications on page load (survives app restart)
      unawaited(controller.rebuildNotifications());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(remindersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.moreReminders),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _onAddReminder(),
          ),
        ],
      ),
      body: Column(
        children: [
          const ReminderFilterChips(),
          const SizedBox(height: 8),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.filteredReminders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No reminders',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap + to add a reminder',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.filteredReminders.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final reminder = state.filteredReminders[index];
                      return ReminderCard(reminder: reminder);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _onAddReminder() async {
    final controller = ref.read(remindersControllerProvider.notifier);
    final hasPermission = await controller.requestNotificationPermission();

    if (!hasPermission && mounted) {
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Notification Permission'),
          content: const Text(
            'Notifications are disabled. You can still create reminders, '
            'but you won\'t receive alerts. Enable notifications in Settings '
            'to receive reminder alerts.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    if (mounted) {
      await ReminderFormSheet.show(context);
    }
  }
}
