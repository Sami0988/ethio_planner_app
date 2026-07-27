import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/recurrence/recurrence_engine.dart';
import '../../../../core/recurrence/recurrence_rule.dart';

class RecurrencePatternSheet extends StatefulWidget {
  const RecurrencePatternSheet({super.key, this.initialRule});

  final RecurrenceRule? initialRule;

  static Future<RecurrenceRule?> show(
    BuildContext context, {
    RecurrenceRule? rule,
  }) {
    return showModalBottomSheet<RecurrenceRule>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RecurrencePatternSheet(initialRule: rule),
    );
  }

  @override
  State<RecurrencePatternSheet> createState() => _RecurrencePatternSheetState();
}

class _RecurrencePatternSheetState extends State<RecurrencePatternSheet> {
  late RecurrenceFrequency _frequency;
  late int _interval;
  late RecurrenceBasis _basis;
  int? _count;
  DateTime? _until;

  @override
  void initState() {
    super.initState();
    final rule = widget.initialRule;
    _frequency = rule?.frequency ?? RecurrenceFrequency.weekly;
    _interval = rule?.interval ?? 1;
    _basis = rule?.basis ?? RecurrenceBasis.ethiopian;
    _count = rule?.count;
    _until = rule?.until;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          controller: scrollController,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.39),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              l10n.recurrenceTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            // Frequency selector
            Text(l10n.recurrenceFrequency, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: RecurrenceFrequency.values.map((f) {
                final selected = f == _frequency;
                return ChoiceChip(
                  label: Text(_frequencyLabel(l10n, f)),
                  selected: selected,
                  onSelected: (_) => setState(() => _frequency = f),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Interval
            Text(l10n.recurrenceInterval, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: _interval > 1
                      ? () => setState(() => _interval--)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                  tooltip: l10n.navigationPrevious,
                ),
                const SizedBox(width: 8),
                Text('$_interval', style: theme.textTheme.titleMedium),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _interval < 30
                      ? () => setState(() => _interval++)
                      : null,
                  icon: const Icon(Icons.add_circle_outline),
                  tooltip: l10n.add,
                ),
                const SizedBox(width: 8),
                Text(
                  _intervalUnitLabel(l10n),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Calendar basis (for monthly/yearly)
            if (_frequency == RecurrenceFrequency.monthly ||
                _frequency == RecurrenceFrequency.yearly) ...[
              Text(
                l10n.recurrenceCalendarBasis,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              RadioGroup<RecurrenceBasis>(
                groupValue: _basis,
                onChanged: (v) => setState(() => _basis = v!),
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile<RecurrenceBasis>(
                        title: Text(l10n.calendarBasisEthiopian),
                        value: RecurrenceBasis.ethiopian,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<RecurrenceBasis>(
                        title: Text(l10n.calendarBasisGregorian),
                        value: RecurrenceBasis.gregorian,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            // End condition
            Text(l10n.recurrenceEnd, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text(l10n.recurrenceEndNever),
                    value: true,
                    // ignore: deprecated_member_use
                    groupValue: _count == null && _until == null,
                    // ignore: deprecated_member_use
                    onChanged: (_) => setState(() {
                      _count = null;
                      _until = null;
                    }),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text(l10n.recurrenceEndAfter),
                    value: false,
                    // ignore: deprecated_member_use
                    groupValue: _count != null,
                    // ignore: deprecated_member_use
                    onChanged: (_) => setState(() {
                      _count = 10;
                      _until = null;
                    }),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                if (_count != null)
                  SizedBox(
                    width: 80,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                      ),
                      controller: TextEditingController(text: '$_count'),
                      onChanged: (v) => _count = int.tryParse(v),
                    ),
                  ),
                if (_count != null) const SizedBox(width: 4),
                if (_count != null) Text(l10n.recurrenceOccurrences),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text(l10n.recurrenceEndOnDate),
                    value: false,
                    // ignore: deprecated_member_use
                    groupValue: _until != null,
                    // ignore: deprecated_member_use
                    onChanged: (_) async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate:
                            _until ??
                            DateTime.now().add(const Duration(days: 30)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365 * 3),
                        ),
                      );
                      if (picked != null) {
                        setState(() {
                          _until = picked;
                          _count = null;
                        });
                      }
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                if (_until != null)
                  Text(
                    '${_until!.day}/${_until!.month}/${_until!.year}',
                    style: theme.textTheme.bodyMedium,
                  ),
              ],
            ),
            const SizedBox(height: 24),
            // Preview
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _buildPreviewDescription(l10n),
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            // Save button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: _save,
                child: Text(l10n.actionSave),
              ),
            ),
            const SizedBox(height: 8),
            // Clear recurrence
            if (widget.initialRule != null)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.recurrenceClear),
                ),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _save() {
    final rule = RecurrenceRule(
      frequency: _frequency,
      interval: _interval,
      count: _count,
      until: _until,
      basis: _basis,
    );
    Navigator.of(context).pop(rule);
  }

  String _frequencyLabel(AppLocalizations l10n, RecurrenceFrequency f) {
    switch (f) {
      case RecurrenceFrequency.daily:
        return l10n.recurrenceFreqDaily;
      case RecurrenceFrequency.weekly:
        return l10n.recurrenceFreqWeekly;
      case RecurrenceFrequency.monthly:
        return l10n.recurrenceFreqMonthly;
      case RecurrenceFrequency.yearly:
        return l10n.recurrenceFreqYearly;
    }
  }

  String _intervalUnitLabel(AppLocalizations l10n) {
    switch (_frequency) {
      case RecurrenceFrequency.daily:
        return _interval == 1 ? l10n.recurrenceDay : l10n.recurrenceDays;
      case RecurrenceFrequency.weekly:
        return _interval == 1 ? l10n.recurrenceWeek : l10n.recurrenceWeeks;
      case RecurrenceFrequency.monthly:
        return _interval == 1 ? l10n.recurrenceMonth : l10n.recurrenceMonths;
      case RecurrenceFrequency.yearly:
        return _interval == 1 ? l10n.recurrenceYear : l10n.recurrenceYears;
    }
  }

  String _buildPreviewDescription(AppLocalizations l10n) {
    final rule = RecurrenceRule(
      frequency: _frequency,
      interval: _interval,
      count: _count,
      until: _until,
      basis: _basis,
    );
    return '${l10n.recurrencePreview}: ${RecurrenceEngine.describe(rule)}';
  }
}
