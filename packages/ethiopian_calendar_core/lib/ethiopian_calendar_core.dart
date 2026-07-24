/// Pure-Dart Ethiopian and Gregorian calendar core.
///
/// This package is the single source of truth for calendar math in the
/// Planner App. It intentionally has no Flutter, Drift, Dio or platform
/// dependencies so it can be unit-tested in isolation and shared with other
/// language ecosystems via its golden-reference fixtures.
library;

export 'src/calendar_basis.dart';
export 'src/calendar_conversion.dart';
export 'src/ethiopian_date.dart';
export 'src/ethiopian_date_math.dart';
export 'src/gregorian_date.dart';
