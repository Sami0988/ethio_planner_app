import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/recurrence/recurrence_engine.dart';
import '../../../../core/recurrence/recurrence_rule.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../calendar/presentation/widgets/recurrence_pattern_sheet.dart';
import '../../domain/entities/reminder.dart';
import '../providers/reminders_providers.dart';

class ReminderFormSheet extends ConsumerStatefulWidget {
  const ReminderFormSheet({super.key, this.reminder, this.initialDate});

  final Reminder? reminder;
  final DateTime? initialDate;

  static Future<void> show(
    BuildContext context, {
    Reminder? reminder,
    DateTime? initialDate,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          ReminderFormSheet(reminder: reminder, initialDate: initialDate),
    );
  }

  @override
  ConsumerState<ReminderFormSheet> createState() => _ReminderFormSheetState();
}

class _ReminderFormSheetState extends ConsumerState<ReminderFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  String? _selectedCategory;
  RecurrenceRule? _recurrenceRule;
  bool _titleError = false;

  bool get _isEditing => widget.reminder != null;

  @override
  void initState() {
    super.initState();
    final reminder = widget.reminder;
    _titleController = TextEditingController(text: reminder?.title ?? '');
    _descriptionController = TextEditingController(
      text: reminder?.description ?? '',
    );
    _selectedDate = reminder?.gcDate ?? widget.initialDate ?? DateTime.now();
    _selectedTime = TimeOfDay.fromDateTime(reminder?.gcDate ?? DateTime.now());
    _selectedCategory = reminder?.category;
    if (reminder?.recurrenceRule != null) {
      _recurrenceRule = RecurrenceRule.fromJson(reminder!.recurrenceRule!);
    }
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

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) {
      setState(() => _titleError = true);
      return;
    }
    await HapticFeedback.lightImpact();

    final gcDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final gcGregorian = GregorianDate.fromDateTime(gcDate);
    final ec = CalendarConversion.gregorianToEthiopian(gcGregorian);
    final ecDate = DateTime(ec.year, ec.month, ec.day);

    final controller = ref.read(remindersControllerProvider.notifier);

    if (_isEditing) {
      final updated = widget.reminder!.copyWith(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        gcDate: gcDate,
        ecDate: ecDate,
        category: _selectedCategory,
        recurrenceRule: _recurrenceRule?.toJson(),
      );
      await controller.updateReminder(updated);
    } else {
      await controller.createReminder(
        title: _titleController.text.trim(),
        gcDate: gcDate,
        ecDate: ecDate,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        category: _selectedCategory,
        recurrenceRule: _recurrenceRule?.toJson(),
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
            _isEditing ? l10n.calendarEditReminder : l10n.calendarNewReminder,
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
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_today, size: 18),
                  label: Text(DateFormat('MMM d, y').format(_selectedDate)),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickTime,
                  icon: const Icon(Icons.access_time, size: 18),
                  label: Text(_selectedTime.format(context)),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Material(
            color: Colors.transparent,
            child: DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: InputDecoration(
                labelText: l10n.fieldCategoryOptional,
              ),
              items: [
                DropdownMenuItem(child: Text(l10n.categoryNone)),
                DropdownMenuItem(value: 'meeting', child: Text(l10n.categoryMeeting)),
                DropdownMenuItem(
                  value: 'personal',
                  child: Text(l10n.categoryPersonal),
                ),
                DropdownMenuItem(value: 'deadline', child: Text(l10n.categoryDeadline)),
                DropdownMenuItem(value: 'health', child: Text(l10n.categoryHealth)),
                DropdownMenuItem(value: 'other', child: Text(l10n.categoryOther)),
              ],
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // Recurrence picker
          Material(
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.3,
            ),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                final rule = await RecurrencePatternSheet.show(
                  context,
                  rule: _recurrenceRule,
                );
                setState(() => _recurrenceRule = rule);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Icon(
                      _recurrenceRule != null
                          ? Icons.repeat_rounded
                          : Icons.repeat_one_rounded,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        _recurrenceRule != null
                            ? RecurrenceEngine.describe(_recurrenceRule!)
                            : 'No repeat',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
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
