import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../providers/link_picker_providers.dart';

enum LinkPickerType { event, reminder, planner }

class NoteLinkPickerResult {
  final String id;
  final String title;
  final DateTime? date;
  final LinkPickerType type;

  const NoteLinkPickerResult({
    required this.id,
    required this.title,
    this.date,
    required this.type,
  });
}

class NoteLinkPickerSheet extends ConsumerStatefulWidget {
  const NoteLinkPickerSheet({super.key, required this.type});

  final LinkPickerType type;

  static Future<NoteLinkPickerResult?> show(
    BuildContext context, {
    required LinkPickerType type,
  }) {
    return showModalBottomSheet<NoteLinkPickerResult>(
      context: context,
      isScrollControlled: true,
      builder: (_) => NoteLinkPickerSheet(type: type),
    );
  }

  @override
  ConsumerState<NoteLinkPickerSheet> createState() =>
      _NoteLinkPickerSheetState();
}

class _NoteLinkPickerSheetState extends ConsumerState<NoteLinkPickerSheet> {
  late final TextEditingController _searchController;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.3,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(_getTitle(l10n), style: theme.textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: _getHint(l10n),
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: _LinkItemList(
                type: widget.type,
                query: _query,
                scrollController: scrollController,
                onSelect: (result) => Navigator.of(context).pop(result),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getTitle(AppLocalizations l10n) {
    switch (widget.type) {
      case LinkPickerType.event:
        return l10n.linkToEvent;
      case LinkPickerType.reminder:
        return l10n.linkToReminder;
      case LinkPickerType.planner:
        return l10n.linkToPlanner;
    }
  }

  String _getHint(AppLocalizations l10n) {
    switch (widget.type) {
      case LinkPickerType.event:
        return '${l10n.searchLabel}...';
      case LinkPickerType.reminder:
        return '${l10n.searchLabel} ${l10n.sectionReminders.toLowerCase()}...';
      case LinkPickerType.planner:
        return '${l10n.searchLabel} ${l10n.plannerTab.toLowerCase()}...';
    }
  }
}

class _LinkItemList extends ConsumerWidget {
  const _LinkItemList({
    required this.type,
    required this.query,
    required this.scrollController,
    required this.onSelect,
  });

  final LinkPickerType type;
  final String query;
  final ScrollController scrollController;
  final void Function(NoteLinkPickerResult) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    switch (type) {
      case LinkPickerType.event:
        final eventsAsync = ref.watch(allEventsForLinkProvider);
        return eventsAsync.when(
          data: (events) {
            final filtered = query.isEmpty
                ? events
                : events
                      .where(
                        (e) =>
                            e.title.toLowerCase().contains(query.toLowerCase()),
                      )
                      .toList();
            if (filtered.isEmpty) {
              return _EmptyPickerState(type: type, l10n: l10n);
            }
            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final event = filtered[index];
                return ListTile(
                  leading: const Icon(Icons.event),
                  title: Text(event.title),
                  subtitle: Text(DateFormat('MMM d, y').format(event.gcDate)),
                  onTap: () => onSelect(
                    NoteLinkPickerResult(
                      id: event.id,
                      title: event.title,
                      date: event.gcDate,
                      type: LinkPickerType.event,
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => _EmptyPickerState(type: type, l10n: l10n),
        );

      case LinkPickerType.reminder:
        final remindersAsync = ref.watch(allRemindersForLinkProvider);
        return remindersAsync.when(
          data: (reminders) {
            final filtered = query.isEmpty
                ? reminders
                : reminders
                      .where(
                        (r) =>
                            r.title.toLowerCase().contains(query.toLowerCase()),
                      )
                      .toList();
            if (filtered.isEmpty) {
              return _EmptyPickerState(type: type, l10n: l10n);
            }
            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final reminder = filtered[index];
                return ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(reminder.title),
                  subtitle: Text(
                    DateFormat('MMM d, y').format(reminder.gcDate),
                  ),
                  onTap: () => onSelect(
                    NoteLinkPickerResult(
                      id: reminder.id,
                      title: reminder.title,
                      date: reminder.gcDate,
                      type: LinkPickerType.reminder,
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => _EmptyPickerState(type: type, l10n: l10n),
        );

      case LinkPickerType.planner:
        final plannerAsync = ref.watch(allPlannerItemsForLinkProvider);
        return plannerAsync.when(
          data: (items) {
            final filtered = query.isEmpty
                ? items
                : items
                      .where(
                        (p) =>
                            p.title.toLowerCase().contains(query.toLowerCase()),
                      )
                      .toList();
            if (filtered.isEmpty) {
              return _EmptyPickerState(type: type, l10n: l10n);
            }
            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];
                return ListTile(
                  leading: Icon(
                    item.isCompleted
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                  ),
                  title: Text(item.title),
                  subtitle: Text(DateFormat('MMM d, y').format(item.gcDate)),
                  onTap: () => onSelect(
                    NoteLinkPickerResult(
                      id: item.id,
                      title: item.title,
                      date: item.gcDate,
                      type: LinkPickerType.planner,
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => _EmptyPickerState(type: type, l10n: l10n),
        );
    }
  }
}

class _EmptyPickerState extends StatelessWidget {
  const _EmptyPickerState({required this.type, required this.l10n});

  final LinkPickerType type;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIcon(),
              size: 48,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.noItemsToLink,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (type) {
      case LinkPickerType.event:
        return Icons.event;
      case LinkPickerType.reminder:
        return Icons.notifications;
      case LinkPickerType.planner:
        return Icons.check_circle;
    }
  }
}
