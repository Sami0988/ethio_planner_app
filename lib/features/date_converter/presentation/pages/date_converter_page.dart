import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

/// Date converter page — convert between Ethiopian and Gregorian calendars.
class DateConverterPage extends StatefulWidget {
  const DateConverterPage({super.key});

  @override
  State<DateConverterPage> createState() => _DateConverterPageState();
}

class _DateConverterPageState extends State<DateConverterPage> {
  bool _isEthiopianToGregorian = true;

  // EC inputs
  final _ecYearController = TextEditingController();
  final _ecMonthController = TextEditingController();
  final _ecDayController = TextEditingController();

  // GC inputs
  final _gcYearController = TextEditingController();
  final _gcMonthController = TextEditingController();
  final _gcDayController = TextEditingController();

  String? _result;
  String? _error;

  @override
  void dispose() {
    _ecYearController.dispose();
    _ecMonthController.dispose();
    _ecDayController.dispose();
    _gcYearController.dispose();
    _gcMonthController.dispose();
    _gcDayController.dispose();
    super.dispose();
  }

  void _convert() {
    setState(() {
      _result = null;
      _error = null;
    });

    try {
      if (_isEthiopianToGregorian) {
        final year = int.parse(_ecYearController.text);
        final month = int.parse(_ecMonthController.text);
        final day = int.parse(_ecDayController.text);

        final ec = EthiopianDate(year, month, day);
        final gc = CalendarConversion.ethiopianToGregorian(ec);

        setState(() {
          _result = '${gc.year}-${gc.month.toString().padLeft(2, '0')}-${gc.day.toString().padLeft(2, '0')}';
        });
      } else {
        final year = int.parse(_gcYearController.text);
        final month = int.parse(_gcMonthController.text);
        final day = int.parse(_gcDayController.text);

        final gc = GregorianDate(year, month, day);
        final ec = CalendarConversion.gregorianToEthiopian(gc);

        final monthName = _ethiopianMonthName(ec.month);
        setState(() {
          _result = '${ec.day} $monthName ${ec.year}';
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  String _ethiopianMonthName(int month) {
    const names = [
      'Meskerem', 'Tikimt', 'Hidar', 'Tahsas', 'Tir',
      'Yekatit', 'Megabit', 'Miyazia', 'Ginbot', 'Sene',
      'Hamle', 'Nehase', 'Pagume',
    ];
    return names[month - 1];
  }

  void _swapDirection() {
    setState(() {
      _isEthiopianToGregorian = !_isEthiopianToGregorian;
      _result = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dateConverterTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Direction toggle
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            _isEthiopianToGregorian
                                ? Icons.calendar_today
                                : Icons.public,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _isEthiopianToGregorian ? 'EC' : 'GC',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: _swapDirection,
                      icon: const Icon(Icons.swap_horiz),
                      tooltip: l10n.dateConverterSwap,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            _isEthiopianToGregorian
                                ? Icons.public
                                : Icons.calendar_today,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _isEthiopianToGregorian ? 'GC' : 'EC',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Input fields
            if (_isEthiopianToGregorian) ...[
              Text(
                l10n.dateConverterEthiopianDate,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ecYearController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterYear,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      controller: _ecMonthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterMonth,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      controller: _ecDayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterDay,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                l10n.dateConverterGregorianDate,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _gcYearController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterYear,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      controller: _gcMonthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterMonth,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      controller: _gcDayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.dateConverterDay,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSpacing.lg),

            // Convert button
            FilledButton.icon(
              onPressed: _convert,
              icon: const Icon(Icons.swap_horiz),
              label: Text(l10n.dateConverterConvert),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Result
            if (_result != null)
              Card(
                color: theme.colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    children: [
                      Text(
                        l10n.dateConverterResult,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        _result!,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Error
            if (_error != null)
              Card(
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Text(
                    _error!,
                    style: TextStyle(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
