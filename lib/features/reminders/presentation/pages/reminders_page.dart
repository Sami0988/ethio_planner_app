import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    );
    controller.loadReminders();
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
            onPressed: () => ReminderFormSheet.show(context),
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No reminders',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap + to add a reminder',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.filteredReminders.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 8),
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
}
