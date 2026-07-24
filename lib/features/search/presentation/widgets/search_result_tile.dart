import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/repositories/search_repository.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({super.key, required this.result});

  final SearchResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: _TypeIcon(type: result.type),
      title: Text(result.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: result.subtitle != null
          ? Text(result.subtitle!, maxLines: 1, overflow: TextOverflow.ellipsis)
          : null,
      trailing: result.date != null
          ? Text(
              DateFormat('MMM d').format(result.date!),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      onTap: () {
        // Navigate to the specific item based on type
        // This will be wired up with proper navigation later
        Navigator.of(context).pop(result);
      },
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.type});

  final SearchResultType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData icon;
    Color color;

    switch (type) {
      case SearchResultType.event:
        icon = Icons.event;
        color = theme.colorScheme.primary;
      case SearchResultType.reminder:
        icon = Icons.notifications;
        color = theme.colorScheme.tertiary;
      case SearchResultType.plannerItem:
        icon = Icons.check_circle;
        color = theme.colorScheme.secondary;
      case SearchResultType.note:
        icon = Icons.note;
        color = theme.colorScheme.error;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
