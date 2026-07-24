---
description: Run the Definition-of-Done verification suite and report ONLY real command output
---

Run the project's Definition-of-Done verification suite from the repo root and report the
ACTUAL output of each step. Never claim a step passed unless its command actually ran and
passed — this is the binding "Real command evidence only" rule in `CLAUDE.md` and
`docs/CODING_STANDARDS.md` §15.

Run these in order. If a step fails, report the failure verbatim and stop (do not attempt
unrelated fixes):

1. `dart format --set-exit-if-changed .`
2. `flutter analyze`
3. `flutter test`
4. `dart test -C packages/ethiopian_calendar_core`   (pure-Dart Ethiopian calendar core)
5. `dart run build_runner build --delete-conflicting-outputs`
   — only when freezed / Drift / Riverpod / `.arb` sources changed; skip otherwise and say so.

For each step report: the exact command, PASS/FAIL, and the relevant output (all errors and
warnings verbatim — do not summarise them away). Finish with a short Definition-of-Done table
mapped to `docs/CODING_STANDARDS.md` §15 (format clean · zero analyzer warnings · unit/Drift/
widget tests · integration smoke · generated code current). If anything failed, list the
failures explicitly and stop.

$ARGUMENTS
