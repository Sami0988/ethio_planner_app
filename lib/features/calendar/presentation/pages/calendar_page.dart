import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../providers/calendar_providers.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/day_events_list.dart';
import '../widgets/event_form_sheet.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAndLoad();
    });
  }

  void _initAndLoad() {
    final controller = ref.read(calendarControllerProvider.notifier);
    controller.setDependencies(
      getEvents: ref.read(getCalendarEventsProvider),
      getEventsByDate: ref.read(getCalendarEventsByDateProvider),
      createEvent: ref.read(createCalendarEventProvider),
      updateEvent: ref.read(updateCalendarEventProvider),
      deleteEvent: ref.read(deleteCalendarEventProvider),
    );
    controller.loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(calendarControllerProvider);
    final controller = ref.read(calendarControllerProvider.notifier);

    final now = DateTime.now();
    final isViewingCurrentMonth =
        state.currentMonth.year == now.year &&
        state.currentMonth.month == now.month;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSpacing.screenHorizontalPadding,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          l10n.calendarTitle,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          if (!isViewingCurrentMonth)
            TextButton(
              onPressed: () =>
                  controller.goToMonth(DateTime(now.year, now.month)),
              child: Text(l10n.actionToday),
            ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: l10n.quickAddTitle,
            onPressed: () => EventFormSheet.show(context),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: Column(
        children: [
          const _CalendarGridSection(),
          Divider(
            height: 1,
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          ),
          const Expanded(child: DayEventsList()),
        ],
      ),
    );
  }
}

class _CalendarGridSection extends StatelessWidget {
  const _CalendarGridSection();

  @override
  Widget build(BuildContext context) {
    // Uses a fraction of screen height rather than a fixed value, so the
    // grid scales sensibly across phone sizes and larger text settings.
    final height = MediaQuery.sizeOf(context).height * 0.38;

    return SizedBox(
      height: height.clamp(300, 400),
      child: const CalendarGrid(),
    );
  }
}
