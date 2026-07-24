import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/note.dart';
import '../providers/notes_providers.dart';

class NoteFormSheet extends ConsumerStatefulWidget {
  const NoteFormSheet({super.key, this.note});

  final Note? note;

  static Future<void> show(BuildContext context, {Note? note}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => NoteFormSheet(note: note),
    );
  }

  @override
  ConsumerState<NoteFormSheet> createState() => _NoteFormSheetState();
}

class _NoteFormSheetState extends ConsumerState<NoteFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  String? _selectedCategory;
  bool _titleError = false;

  bool get _isEditing => widget.note != null;

  @override
  void initState() {
    super.initState();
    final note = widget.note;
    _titleController = TextEditingController(text: note?.title ?? '');
    _contentController = TextEditingController(text: note?.content ?? '');
    _selectedCategory = note?.category;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) {
      setState(() => _titleError = true);
      return;
    }
    await HapticFeedback.lightImpact();

    final controller = ref.read(notesControllerProvider.notifier);

    if (_isEditing) {
      final updated = widget.note!.copyWith(
        title: _titleController.text.trim(),
        content: _contentController.text.trim().isEmpty
            ? null
            : _contentController.text.trim(),
        category: _selectedCategory,
      );
      await controller.updateNote(updated);
    } else {
      await controller.createNote(
        title: _titleController.text.trim(),
        content: _contentController.text.trim().isEmpty
            ? null
            : _contentController.text.trim(),
        category: _selectedCategory,
      );
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg + bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isEditing ? l10n.actionEdit : l10n.actionCreate,
                style: theme.textTheme.titleLarge,
              ),
              if (_isEditing)
                Text(
                  DateFormat('MMM d, y • h:mm a').format(widget.note!.updatedAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: l10n.fieldTitle,
              errorText: _titleError ? l10n.fieldTitleRequired : null,
            ),
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            onChanged: (_) {
              if (_titleError) setState(() => _titleError = false);
            },
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<String>(
            initialValue: _selectedCategory,
            decoration: InputDecoration(labelText: l10n.fieldCategoryOptional),
            items: [
              DropdownMenuItem(child: Text(l10n.categoryNone)),
              DropdownMenuItem(value: 'work', child: Text(l10n.categoryWork)),
              DropdownMenuItem(
                value: 'personal',
                child: Text(l10n.categoryPersonal),
              ),
              DropdownMenuItem(value: 'other', child: Text(l10n.categoryOther)),
            ],
            onChanged: (value) => setState(() => _selectedCategory = value),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(
              labelText: l10n.fieldDescriptionOptional,
              alignLabelWithHint: true,
            ),
            maxLines: 8,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.actionCancel),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: FilledButton(
                  onPressed: _save,
                  child: Text(
                    _isEditing ? l10n.actionUpdate : l10n.actionCreate,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
