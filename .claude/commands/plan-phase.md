---
description: Produce the required planning output for a phase and STOP for approval (no code)
---

Produce planning output for the requested phase and then STOP for explicit approval before
writing any implementation code. This enforces the `CLAUDE.md` working rule "Plan before code"
and the master prompt's "INITIAL OUTPUT REQUIRED" gate. One phase at a time — never plan past
the requested phase.

Phase: **$ARGUMENTS**  (one of: `0` foundation · `1A` calendar · `1B` events/reminders ·
`1C` planner/notes · `1D` print/commerce · `EXT` public events/polls/questions)

First read the relevant sections of the source-of-truth docs (do not work from memory):
- `docs/requirements/Walia_Nexus_Flutter_Planner_App_Clean_Functional_Requirements.md` (PRIMARY)
- `docs/requirements/Ethiopian_Calendar_Planner_SRS.md`
- `docs/requirements/Claude_Code_Master_Prompt_Flutter_Planner_App.md`
- `docs/CODING_STANDARDS.md`

Then output, scoped to this phase ONLY:
1. Phase scope summary, each item mapped to requirement IDs (APP/AUTH/CAL/EVT/REC/REM/NTF/PLN/
   NOTE/TMP/SRCH/SYNC/CNF/DEL/PRT/SUB/PRIV/PUB/POLL/QST-FR).
2. Assumptions + any "Open Business Decisions" values relied on — kept as explicit config, never
   silently hard-coded.
3. Files to create/change, respecting feature-first + Clean MVVM layering (3 layers for simple
   features; add `application/use_cases` only for complex ones — no ceremonial layers).
4. Data model / Drift + sync/outbox impact (bounded occurrences, one-transaction writes,
   operation-id idempotency) where relevant.
5. Package additions with pinned stable versions and their official pub.dev source — verify on
   pub.dev, do not invent versions.
6. Test plan (unit / Drift / widget / integration) mapped to the phase's acceptance criteria.
7. Migration strategy + privacy/logging considerations.
8. Phase gate / Definition of Done checklist.
9. Risks ranked by severity, with mitigations.

Then STOP and wait for approval. Do NOT generate implementation code in this response.
