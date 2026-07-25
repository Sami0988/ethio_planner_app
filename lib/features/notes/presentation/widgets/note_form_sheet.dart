import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/note.dart';
import '../providers/notes_providers.dart';
import 'note_link_picker_sheet.dart';

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
  String? _linkedEventId;
  String? _linkedReminderId;
  String? _linkedPlannerItemId;
  String? _linkedEventTitle;
  String? _linkedReminderTitle;
  String? _linkedPlannerItemTitle;

  bool get _isEditing => widget.note != null;

  @override
  void initState() {
    super.initState();
    final note = widget.note;
    _titleController = TextEditingController(text: note?.title ?? '');
    _contentController = TextEditingController(text: note?.content ?? '');
    _selectedCategory = note?.category;
    _linkedEventId = note?.linkedEventId;
    _linkedReminderId = note?.linkedReminderId;
    _linkedPlannerItemId = note?.linkedPlannerItemId;
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
          const SizedBox(height: AppSpacing.md),
          _LinkSection(
            linkedEventId: _linkedEventId,
            linkedReminderId: _linkedReminderId,
            linkedPlannerItemId: _linkedPlannerItemId,
            linkedEventTitle: _linkedEventTitle,
            linkedReminderTitle: _linkedReminderTitle,
            linkedPlannerItemTitle: _linkedPlannerItemTitle,
            onEventLinked: (id, title) => setState(() {
              _linkedEventId = id;
              _linkedEventTitle = title;
            }),
            onReminderLinked: (id, title) => setState(() {
              _linkedReminderId = id;
              _linkedReminderTitle = title;
            }),
            onPlannerLinked: (id, title) => setState(() {
              _linkedPlannerItemId = id;
              _linkedPlannerItemTitle = title;
            }),
            onEventUnlinked: () => setState(() {
              _linkedEventId = null;
              _linkedEventTitle = null;
            }),
            onReminderUnlinked: () => setState(() {
              _linkedReminderId = null;
              _linkedReminderTitle = null;
            }),
            onPlannerUnlinked: () => setState(() {
              _linkedPlannerItemId = null;
              _linkedPlannerItemTitle = null;
            }),
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

class _LinkSection extends StatelessWidget {
  const _LinkSection({
    required this.linkedEventId,
    required this.linkedReminderId,
    required this.linkedPlannerItemId,
    required this.linkedEventTitle,
    required this.linkedReminderTitle,
    required this.linkedPlannerItemTitle,
    required this.onEventLinked,
    required this.onReminderLinked,
    required this.onPlannerLinked,
    required this.onEventUnlinked,
    required this.onReminderUnlinked,
    required this.onPlannerUnlinked,
  });

  final String? linkedEventId;
  final String? linkedReminderId;
  final String? linkedPlannerItemId;
  final String? linkedEventTitle;
  final String? linkedReminderTitle;
  final String? linkedPlannerItemTitle;
  final void Function(String id, String title) onEventLinked;
  final void Function(String id, String title) onReminderLinked;
  final void Function(String id, String title) onPlannerLinked;
  final VoidCallback onEventUnlinked;
  final VoidCallback onReminderUnlinked;
  final VoidCallback onPlannerUnlinked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Links',
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          children: [
            _LinkChip(
              icon: Icons.event,
              label: linkedEventTitle ?? 'Event',
              isLinked: linkedEventId != null,
              onLink: () => _showPicker(context, 'event', onEventLinked),
              onUnlink: onEventUnlinked,
            ),
            _LinkChip(
              icon: Icons.notifications,
              label: linkedReminderTitle ?? 'Reminder',
              isLinked: linkedReminderId != null,
              onLink: () => _showPicker(context, 'reminder', onReminderLinked),
              onUnlink: onReminderUnlinked,
            ),
            _LinkChip(
              icon: Icons.check_circle,
              label: linkedPlannerItemTitle ?? 'Planner',
              isLinked: linkedPlannerItemId != null,
              onLink: () => _showPicker(context, 'planner', onPlannerLinked),
              onUnlink: onPlannerUnlinked,
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showPicker(
    BuildContext context,
    String type,
    void Function(String id, String title) onSelected,
  ) async {
    final pickerType = _getPickerType(type);
    final result = await NoteLinkPickerSheet.show(context, type: pickerType);
    if (result != null) {
      onSelected(result.id, result.title);
    }
  }

  LinkPickerType _getPickerType(String type) {
    switch (type) {
      case 'event':
        return LinkPickerType.event;
      case 'reminder':
        return LinkPickerType.reminder;
      case 'planner':
        return LinkPickerType.planner;
      default:
        return LinkPickerType.event;
    }
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({
    required this.icon,
    required this.label,
    required this.isLinked,
    required this.onLink,
    required this.onUnlink,
  });

  final IconData icon;
  final String label;
  final bool isLinked;
  final VoidCallback onLink;
  final VoidCallback onUnlink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLinked) {
      return Chip(
        avatar: Icon(icon, size: 16),
        label: Text(
          label,
          style: theme.textTheme.labelSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        deleteIcon: const Icon(Icons.close, size: 16),
        onDeleted: onUnlink,
        backgroundColor: theme.colorScheme.primaryContainer,
      );
    }

    return ActionChip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      onPressed: onLink,
    );
  }
}
