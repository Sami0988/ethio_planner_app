import 'dart:convert';

enum RecurrenceFrequency { daily, weekly, monthly, yearly }

enum RecurrenceBasis { ethiopian, gregorian }

class RecurrenceRule {
  const RecurrenceRule({
    required this.frequency,
    this.interval = 1,
    this.count,
    this.until,
    this.byDays = const [],
    this.basis = RecurrenceBasis.ethiopian,
  }) : assert(
         count == null || until == null,
         'Cannot specify both count and until',
       );

  final RecurrenceFrequency frequency;
  final int interval;
  final int? count;
  final DateTime? until;
  final List<int> byDays;
  final RecurrenceBasis basis;

  RecurrenceRule copyWith({
    RecurrenceFrequency? frequency,
    int? interval,
    int? count,
    DateTime? until,
    List<int>? byDays,
    RecurrenceBasis? basis,
    bool clearUntil = false,
    bool clearCount = false,
  }) {
    return RecurrenceRule(
      frequency: frequency ?? this.frequency,
      interval: interval ?? this.interval,
      count: clearCount ? null : (count ?? this.count),
      until: clearUntil ? null : (until ?? this.until),
      byDays: byDays ?? this.byDays,
      basis: basis ?? this.basis,
    );
  }

  bool get isFinite => count != null || until != null;

  String toRuleString() {
    final parts = <String>[];
    parts.add('FREQ=${frequency.name.toUpperCase()}');
    parts.add('INTERVAL=$interval');
    if (count != null) parts.add('COUNT=$count');
    if (until != null) {
      parts.add('UNTIL=${until!.toIso8601String()}');
    }
    if (byDays.isNotEmpty) {
      parts.add('BYDAY=${byDays.join(",")}');
    }
    parts.add('BASIS=${basis.name.toUpperCase()}');
    return parts.join(';');
  }

  factory RecurrenceRule.fromRuleString(String ruleString) {
    final parts = Map.fromEntries(
      ruleString.split(';').map((p) {
        final kv = p.split('=');
        return MapEntry(kv[0], kv.length > 1 ? kv[1] : '');
      }),
    );
    return RecurrenceRule(
      frequency: RecurrenceFrequency.values.firstWhere(
        (f) => f.name.toUpperCase() == parts['FREQ'],
        orElse: () => RecurrenceFrequency.daily,
      ),
      interval: int.tryParse(parts['INTERVAL'] ?? '') ?? 1,
      count: int.tryParse(parts['COUNT'] ?? ''),
      until: parts['UNTIL'] != null ? DateTime.tryParse(parts['UNTIL']!) : null,
      byDays: (parts['BYDAY'] ?? '').isEmpty
          ? []
          : (parts['BYDAY']!
                .split(',')
                .map(int.tryParse)
                .whereType<int>()
                .toList()),
      basis: parts['BASIS'] != null
          ? RecurrenceBasis.values.firstWhere(
              (b) => b.name.toUpperCase() == parts['BASIS'],
              orElse: () => RecurrenceBasis.ethiopian,
            )
          : RecurrenceBasis.ethiopian,
    );
  }

  String toJson() => jsonEncode(toRuleString());
  factory RecurrenceRule.fromJson(String json) =>
      RecurrenceRule.fromRuleString(jsonDecode(json) as String);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurrenceRule &&
          runtimeType == other.runtimeType &&
          frequency == other.frequency &&
          interval == other.interval &&
          count == other.count &&
          until == other.until &&
          basis == other.basis;

  @override
  int get hashCode => Object.hash(frequency, interval, count, until, basis);

  @override
  String toString() => toRuleString();

  static String? nullableToJson(RecurrenceRule? rule) => rule?.toJson();
  static RecurrenceRule? nullableFromJson(String? json) =>
      json != null ? RecurrenceRule.fromJson(json) : null;
}
