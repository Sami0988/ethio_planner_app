import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/sync_status_banner.dart';
import '../controllers/today_controller.dart';
import '../providers/today_view_state.dart';
import '../widgets/event_list_card.dart';
import '../widgets/quick_add_sheet.dart';
import '../widgets/today_empty_state.dart';
import '../widgets/today_header.dart';
import '../widgets/today_reminders.dart';
import '../widgets/today_schedule_timeline.dart';
import '../widgets/up_next_card.dart';

/// Home / Today screen (TODAY-FR-*). A single vertically scrollable column on
/// phones. Renders from the prepared [TodayViewState]; no calendar maths,
/// repository, Dio or Drift access happens here.
class TodayPage extends ConsumerStatefulWidget {
  const TodayPage({super.key});

  @override
  ConsumerState<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends ConsumerState<TodayPage> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final scrolled = _scrollController.offset > 4;
      if (scrolled != _isScrolled) {
        setState(() => _isScrolled = scrolled);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context, [WidgetRef? _]) => _build(context, ref);

  Widget _build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(todayControllerProvider);
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSpacing.screenHorizontalPadding,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: _isScrolled ? 18 : 22,
          ),
          child: Text(l10n.appTitle),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 1,
            color: _isScrolled
                ? Theme.of(context).dividerColor
                : Colors.transparent,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: l10n.searchLabel,
            onPressed: () => context.push(RouteNames.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: IconButton(
              tooltip: l10n.accountLabel,
              onPressed: () => context.push(RouteNames.settings),
              icon: const Hero(
                tag: 'account-avatar',
                child: CircleAvatar(
                  radius: 16,
                  child: Icon(Icons.person_rounded, size: 18),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => QuickAddSheet.show(context),
        tooltip: l10n.quickAddTitle,
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.quickAddTitle),
        elevation: 2,
        highlightElevation: 4,
      ),
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          onRefresh: () => ref.read(todayControllerProvider.notifier).refresh(),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
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
                AnimatedSwitcher(
                  duration: reduceMotion
                      ? Duration.zero
                      : const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.03),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: !state.hasSchedule
                      ? TodayEmptyState(
                          key: const ValueKey('empty'),
                          onAdd: () => QuickAddSheet.show(context),
                        )
                      : Column(
                          key: const ValueKey('loaded'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _sections(state, reduceMotion),
                        ),
                ),
                const SizedBox(height: 96),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _sections(TodayViewState state, bool reduceMotion) {
    final upNext = state.upNext;
    final controller = ref.read(todayControllerProvider.notifier);
    final sections = <Widget>[
      if (upNext != null) UpNextCard(item: upNext),
      if (state.events.isNotEmpty) EventListCard(events: state.events),
      if (state.schedule.isNotEmpty)
        TodayScheduleTimeline(items: state.schedule),
      if (state.reminders.isNotEmpty)
        TodayReminders(
          items: state.reminders,
          onToggle: controller.toggleReminder,
        ),
    ];

    return [
      for (var i = 0; i < sections.length; i++) ...[
        if (reduceMotion)
          sections[i]
        else
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 350 + (i * 100)),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 16 * (1 - value)),
                child: child,
              ),
            ),
            child: sections[i],
          ),
        if (i != sections.length - 1) const SizedBox(height: AppSpacing.xl),
      ],
    ];
  }
}
