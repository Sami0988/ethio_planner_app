import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/reminder_local_datasource.dart';
import '../../data/repositories/reminder_repository_impl.dart';
import '../../domain/usecases/get_reminders.dart';
import '../controllers/reminders_controller.dart';
import 'reminders_view_state.dart';

final reminderLocalDatasourceProvider = Provider<ReminderLocalDatasource>(
  (ref) => ReminderLocalDatasource(ref.watch(databaseProvider)),
);

final reminderRepositoryProvider = Provider<ReminderRepositoryImpl>(
  (ref) => ReminderRepositoryImpl(
    localDatasource: ref.watch(reminderLocalDatasourceProvider),
  ),
);

final getRemindersProvider = Provider<GetReminders>(
  (ref) => GetReminders(ref.watch(reminderRepositoryProvider)),
);

final getRemindersByDateProvider = Provider<GetRemindersByDate>(
  (ref) => GetRemindersByDate(ref.watch(reminderRepositoryProvider)),
);

final getOverdueRemindersProvider = Provider<GetOverdueReminders>(
  (ref) => GetOverdueReminders(ref.watch(reminderRepositoryProvider)),
);

final getUpcomingRemindersProvider = Provider<GetUpcomingReminders>(
  (ref) => GetUpcomingReminders(ref.watch(reminderRepositoryProvider)),
);

final createReminderProvider = Provider<CreateReminder>(
  (ref) => CreateReminder(ref.watch(reminderRepositoryProvider)),
);

final updateReminderProvider = Provider<UpdateReminder>(
  (ref) => UpdateReminder(ref.watch(reminderRepositoryProvider)),
);

final deleteReminderProvider = Provider<DeleteReminder>(
  (ref) => DeleteReminder(ref.watch(reminderRepositoryProvider)),
);

final toggleReminderCompletedProvider = Provider<ToggleReminderCompleted>(
  (ref) => ToggleReminderCompleted(ref.watch(reminderRepositoryProvider)),
);

final remindersControllerProvider =
    NotifierProvider<RemindersController, RemindersViewState>(
  RemindersController.new,
);
