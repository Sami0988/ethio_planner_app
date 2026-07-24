import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/planner_item.dart';
import '../providers/planner_providers.dart';

class PlannerItemFormSheet extends ConsumerStatefulWidget {
  const PlannerItemFormSheet({super.key, this.item, this.initialDate});

  final PlannerItem? item;
  final DateTime? initialDate;

  static Future<void> show(
    BuildContext context, {
    PlannerItem? item,
    DateTime? initialDate,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          PlannerItemFormSheet(item: item, initialDate: initialDate),
    );
  }

  @override
  ConsumerState<PlannerItemFormSheet> createState() =>
      _PlannerItemFormSheetState();
}

class _PlannerItemFormSheetState extends ConsumerState<PlannerItemFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late DateTime _selectedDate;
  PlannerSection _selectedSection = PlannerSection.focus;

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _titleController = TextEditingController(text: item?.title ?? '');
    _descriptionController = TextEditingController(
      text: item?.description ?? '',
    );
    _selectedDate = item?.gcDate ?? widget.initialDate ?? DateTime.now();
    _selectedSection = item?.section ?? PlannerSection.focus;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) return;

    final controller = ref.read(plannerControllerProvider.notifier);

    final gcGregorian = GregorianDate.fromDateTime(_selectedDate);
    final ec = CalendarConversion.gregorianToEthiopian(gcGregorian);
    final ecDate = DateTime(ec.year, ec.month, ec.day);

    if (_isEditing) {
      final updated = widget.item!.copyWith(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        gcDate: _selectedDate,
        ecDate: ecDate,
        section: _selectedSection,
      );
      await controller.updateItem(updated);
    } else {
      await controller.createItem(
        title: _titleController.text.trim(),
        gcDate: _selectedDate,
        ecDate: ecDate,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        section: _selectedSection,
      );
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          Text(
            _isEditing ? 'Edit Item' : 'New Item',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.lg),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_today, size: 18),
            label: Text(DateFormat('MMM d, y').format(_selectedDate)),
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<PlannerSection>(
            initialValue: _selectedSection,
            decoration: const InputDecoration(
              labelText: 'Section',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: PlannerSection.focus,
                child: Text('Focus'),
              ),
              DropdownMenuItem(
                value: PlannerSection.priorities,
                child: Text('Priorities'),
              ),
              DropdownMenuItem(
                value: PlannerSection.checklist,
                child: Text('Checklist'),
              ),
              DropdownMenuItem(
                value: PlannerSection.notes,
                child: Text('Notes'),
              ),
              DropdownMenuItem(
                value: PlannerSection.reflection,
                child: Text('Reflection'),
              ),
            ],
            onChanged: (value) {
              if (value != null) setState(() => _selectedSection = value);
            },
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: _save,
            child: Text(_isEditing ? 'Update' : 'Create'),
          ),
        ],
      ),
    );
  }
}
