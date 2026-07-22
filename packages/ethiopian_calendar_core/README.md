# ethiopian_calendar_core

Pure-Dart core for Ethiopian and Gregorian calendar handling in the Planner App.

**No** Flutter, Drift, Dio, Firebase or platform dependencies — so it can be
unit-tested in isolation and its golden fixtures reused by the backend suite.

## Contents

- `EthiopianDate`, `GregorianDate` — immutable, timezone-independent date value
  objects with validation (including Pagume rules).
- `CalendarConversion` — lossless Ethiopian ↔ Gregorian conversion using the
  Rata Die technique (Dershowitz & Reingold, *Calendrical Calculations*).
- `CalendarBasis` — the authoring calendar of a record (BR-CAL-001).

## Planned (Phase 1B)

Recurrence: `RecurrenceRule`, `RecurrenceFrequency`, `RecurrenceEnd`,
`RecurrenceException`, bounded occurrence generation, and Ethiopian-basis annual
recurrence (REC-FR-004: never rewritten to a fixed Gregorian month/day).

## Run tests

```bash
dart pub get
dart test
```

Correctness is anchored on real-world references, e.g. Ethiopian New Year 2015 =
11 Sep 2022 and 2016 = 12 Sep 2023, plus full round-trip coverage over 1900–2100.
