import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/sync_status_banner.dart';
import '../controllers/today_controller.dart';
import '../providers/today_view_state.dart';
import '../widgets/event_list_card.dart';
import '../widgets/quick_add_sheet.dart';
import '../widgets/today_empty_state.dart';
import '../widgets/today_header.dart';
import '../widgets/today_reminders.dart';
import '../widgets/up_next_card.dart';

/// Home / Today screen (TODAY-FR-*). A single vertically scrollable column on
/// phones. Renders from the prepared [TodayViewState]; no calendar maths,
/// repository, Dio or Drift access happens here.
class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(todayControllerProvider);
    final controller = ref.read(todayControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSpacing.screenHorizontalPadding,
        title: Text(
          l10n.appTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: l10n.searchLabel,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: IconButton(
              tooltip: l10n.accountLabel,
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 16,
                child: Icon(Icons.person_rounded, size: 18),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuickAddSheet.show(context),
        tooltip: l10n.quickAddTitle,
        child: const Icon(Icons.add_rounded),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TodayHeader(
                ethiopianDate: state.ethiopianDate,
                gregorianDate: state.gregorianDate,
                holiday: state.holiday,
              ),
              SyncStatusBanner(
                status: state.sync.status,
                pendingCount: state.sync.pendingCount,
              ),
              const SizedBox(height: AppSpacing.md),
              if (!state.hasSchedule)
                TodayEmptyState(onAdd: () => QuickAddSheet.show(context))
              else
                ..._sections(state, controller),
              const SizedBox(height: 96),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _sections(TodayViewState state, TodayController controller) {
    final upNext = state.upNext;
    return [
      if (upNext != null) ...[
        UpNextCard(item: upNext),
        const SizedBox(height: AppSpacing.xl),
      ],
      if (state.events.isNotEmpty) ...[
        EventListCard(events: state.events),
        const SizedBox(height: AppSpacing.xl),
      ],
      if (state.reminders.isNotEmpty) ...[
        TodayReminders(
          items: state.reminders,
          onToggle: controller.toggleReminder,
        ),
      ],
    ];
  }
}
