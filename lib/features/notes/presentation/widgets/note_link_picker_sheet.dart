import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';

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
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                _getTitle(),
                style: theme.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search ${_getTypeName()}...',
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

  String _getTitle() {
    switch (widget.type) {
      case LinkPickerType.event:
        return 'Link Event';
      case LinkPickerType.reminder:
        return 'Link Reminder';
      case LinkPickerType.planner:
        return 'Link Planner Item';
    }
  }

  String _getTypeName() {
    switch (widget.type) {
      case LinkPickerType.event:
        return 'events';
      case LinkPickerType.reminder:
        return 'reminders';
      case LinkPickerType.planner:
        return 'planner items';
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
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      children: [
        _EmptyPickerState(type: type),
      ],
    );
  }
}

class _EmptyPickerState extends StatelessWidget {
  const _EmptyPickerState({required this.type});

  final LinkPickerType type;

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
              _getMessage(),
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

  String _getMessage() {
    switch (type) {
      case LinkPickerType.event:
        return 'No events found.\nCreate some events first to link them to notes.';
      case LinkPickerType.reminder:
        return 'No reminders found.\nCreate some reminders first to link them to notes.';
      case LinkPickerType.planner:
        return 'No planner items found.\nCreate some planner items first to link them to notes.';
    }
  }
}
