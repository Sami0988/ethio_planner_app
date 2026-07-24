import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:ethio_planner/l10n/generated/app_localizations.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/calendar_event.dart';
import '../providers/calendar_providers.dart';

class EventFormSheet extends ConsumerStatefulWidget {
  const EventFormSheet({super.key, this.event, this.initialDate});

  final CalendarEvent? event;
  final DateTime? initialDate;

  static Future<void> show(
    BuildContext context, {
    CalendarEvent? event,
    DateTime? initialDate,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => EventFormSheet(event: event, initialDate: initialDate),
    );
  }

  @override
  ConsumerState<EventFormSheet> createState() => _EventFormSheetState();
}

class _EventFormSheetState extends ConsumerState<EventFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _locationController;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  late bool _isAllDay;
  String? _selectedCategory;
  bool _isSaving = false;

  bool get _isEditing => widget.event != null;

  @override
  void initState() {
    super.initState();
    final event = widget.event;
    _titleController = TextEditingController(text: event?.title ?? '');
    _descriptionController = TextEditingController(
      text: event?.description ?? '',
    );
    _locationController = TextEditingController(text: event?.location ?? '');
    _selectedDate = event?.gcDate ?? widget.initialDate ?? DateTime.now();
    _selectedTime = TimeOfDay.fromDateTime(event?.gcDate ?? DateTime.now());
    _isAllDay = event?.isAllDay ?? false;
    _selectedCategory = event?.category;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_isSaving) return;

    setState(() => _isSaving = true);

    final gcDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _isAllDay ? 0 : _selectedTime.hour,
      _isAllDay ? 0 : _selectedTime.minute,
    );

    // TODO: replace with your real GC->EC adapter call.
    final ecDate = gcDate;

    final controller = ref.read(calendarControllerProvider.notifier);

    try {
      if (_isEditing) {
        final updated = widget.event!.copyWith(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          gcDate: gcDate,
          ecDate: ecDate,
          isAllDay: _isAllDay,
          category: _selectedCategory,
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
        );
        await controller.updateEvent(updated);
      } else {
        await controller.createEvent(
          title: _titleController.text.trim(),
          gcDate: gcDate,
          ecDate: ecDate,
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          isAllDay: _isAllDay,
          category: _selectedCategory,
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
        );
      }
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.eventSaveError)));
      }
    }
  }

  InputDecoration _fieldDecoration(
    BuildContext context, {
    required String label,
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, size: 20) : null,
      filled: true,
      fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final locale = Localizations.localeOf(context).toString();

    final categories = <String?, (String, IconData)>{
      null: (l10n.categoryNone, Icons.circle_outlined),
      'work': (l10n.categoryWork, Icons.work_outline_rounded),
      'personal': (l10n.categoryPersonal, Icons.person_outline_rounded),
      'holiday': (l10n.categoryHoliday, Icons.celebration_outlined),
      'other': (l10n.categoryOther, Icons.label_outline_rounded),
    };

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Form(
          key: _formKey,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                _isEditing ? l10n.editEventTitle : l10n.newEventTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _titleController,
                decoration: _fieldDecoration(
                  context,
                  label: l10n.fieldTitle,
                  icon: Icons.title_rounded,
                ),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
                style: const TextStyle(fontWeight: FontWeight.w600),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? l10n.fieldTitleRequired
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              // All-day toggle as its own soft card, not a plain ListTile.
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SwitchListTile(
                  title: Text(
                    l10n.allDay,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  value: _isAllDay,
                  onChanged: (value) => setState(() => _isAllDay = value),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: _PickerChip(
                      icon: Icons.calendar_today_rounded,
                      label: DateFormat(
                        'MMM d, y',
                        locale,
                      ).format(_selectedDate),
                      onTap: _pickDate,
                    ),
                  ),
                  if (!_isAllDay) ...[
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: _PickerChip(
                        icon: Icons.access_time_rounded,
                        label: _selectedTime.format(context),
                        onTap: _pickTime,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _locationController,
                decoration: _fieldDecoration(
                  context,
                  label: l10n.fieldLocationOptional,
                  icon: Icons.place_outlined,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                l10n.fieldCategoryOptional,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categories.entries.map((entry) {
                  final isSelected = _selectedCategory == entry.key;
                  final (label, icon) = entry.value;
                  return ChoiceChip(
                    selected: isSelected,
                    onSelected: (_) =>
                        setState(() => _selectedCategory = entry.key),
                    avatar: Icon(
                      icon,
                      size: 16,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    label: Text(label),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                    ),
                    selectedColor: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _descriptionController,
                decoration: _fieldDecoration(
                  context,
                  label: l10n.fieldDescriptionOptional,
                  icon: Icons.notes_rounded,
                ),
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _isSaving ? null : _save,
                  child: _isSaving
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          _isEditing ? l10n.actionUpdate : l10n.actionCreate,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerChip extends StatelessWidget {
  const _PickerChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 14,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
