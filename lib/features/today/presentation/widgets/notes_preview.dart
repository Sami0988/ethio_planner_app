import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../notes/domain/entities/note.dart';
import '../../../notes/presentation/providers/notes_providers.dart';

/// Preview of today's linked notes on the Today page.
/// Shows notes that were created or modified today.
class NotesPreview extends ConsumerWidget {
  const NotesPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final notesAsync = ref.watch(notesStreamProvider);

    return notesAsync.when(
      data: (List<Note> notes) {
        final today = DateTime.now();
        final todayNotes = notes.where((note) {
          final created = note.createdAt;
          final updated = note.updatedAt;
          return (created.year == today.year &&
                  created.month == today.month &&
                  created.day == today.day) ||
              (updated.year == today.year &&
                  updated.month == today.month &&
                  updated.day == today.day);
        }).toList();

        if (todayNotes.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              label: l10n.sectionNotes.toUpperCase(),
              trailing: TextButton(
                onPressed: () => context.push(RouteNames.notes),
                child: Text(l10n.seeAll),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontalPadding,
              ),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < todayNotes.length && i < 3; i++) ...[
                      _NoteTile(note: todayNotes[i]),
                      if (i < todayNotes.length - 1 && i < 2)
                        Divider(height: 1, color: theme.dividerColor),
                    ],
                    if (todayNotes.length > 3)
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: Text(
                          l10n.notesMoreCount(todayNotes.length - 3),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.colorTextMuted,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, st) => const SizedBox.shrink(),
    );
  }
}

class _NoteTile extends StatelessWidget {
  const _NoteTile({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.note_alt_outlined,
            size: 18,
            color: context.colorPrimary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (note.content?.isNotEmpty == true)
                  Text(
                    note.content!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: context.colorTextMuted,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
