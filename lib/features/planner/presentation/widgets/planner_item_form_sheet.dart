import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/planner_item.dart';
import '../providers/planner_providers.dart';

class PlannerItemFormSheet extends ConsumerStatefulWidget {
  const PlannerItemFormSheet({
    super.key,
    this.item,
    this.initialDate,
    this.initialSection,
  });

  final PlannerItem? item;
  final DateTime? initialDate;
  final PlannerSection? initialSection;

  static Future<void> show(
    BuildContext context, {
    PlannerItem? item,
    DateTime? initialDate,
    PlannerSection? initialSection,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => PlannerItemFormSheet(
        item: item,
        initialDate: initialDate,
        initialSection: initialSection,
      ),
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
  bool _titleError = false;

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
    _selectedSection = item?.section ?? widget.initialSection ?? PlannerSection.focus;
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

  String _sectionLabel(AppLocalizations l10n, PlannerSection section) =>
      switch (section) {
        PlannerSection.focus => l10n.plannerFocus,
        PlannerSection.priorities => l10n.plannerPriorities,
        PlannerSection.checklist => l10n.plannerChecklist,
        PlannerSection.notes => l10n.plannerNotes,
        PlannerSection.reflection => l10n.plannerReflection,
      };

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) {
      setState(() => _titleError = true);
      return;
    }
    await HapticFeedback.lightImpact();

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
          Text(
            _isEditing ? l10n.actionEdit : l10n.actionCreate,
            style: theme.textTheme.titleLarge,
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
          OutlinedButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_today, size: 18),
            label: Text(DateFormat('MMM d, y').format(_selectedDate)),
          ),
          const SizedBox(height: AppSpacing.md),
          Material(
            color: Colors.transparent,
            child: DropdownButtonFormField<PlannerSection>(
              initialValue: _selectedSection,
              decoration: const InputDecoration(),
              items: [
                for (final section in PlannerSection.values)
                  DropdownMenuItem(
                    value: section,
                    child: Text(_sectionLabel(l10n, section)),
                  ),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _selectedSection = value);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: l10n.fieldDescriptionOptional,
            ),
            maxLines: 3,
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
