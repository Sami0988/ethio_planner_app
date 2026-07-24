---
description: Map current changes to requirement IDs; flag scope creep and hard-exclusion violations
---

Review the current working changes for requirement traceability and product-scope compliance,
per `CLAUDE.md` and the master prompt. Do not modify files.

Steps:
1. Inspect the change with `git status` and `git diff` (and read touched files as needed).
   Summarise what changed.
2. Map each meaningful change to one or more requirement IDs (APP/AUTH/CAL/EVT/REC/REM/NTF/PLN/
   NOTE/TMP/SRCH/SYNC/CNF/DEL/PRT/SUB/PRIV/PUB/POLL/QST-FR). Flag anything with no mapping.
3. Enforce the phase boundary (0 → 1A → 1B → 1C → 1D → EXT). Flag work belonging to a later,
   unapproved phase.
4. Flag HARD EXCLUSIONS: HR, payroll, attendance, appraisal, employee performance / KPI /
   scorecards, work allocation, project milestones/dependencies/Kanban/assignees, CRM,
   accounting/invoicing/tax, e-signature, approval/hierarchy/document-approval workflows,
   admin/finance/moderation/job-monitoring screens, and any backend / website / admin-portal
   code. Institution / department / job-title are allowed ONLY as personal-profile or
   print-template fields — flag any use that establishes an org hierarchy.
5. Flag invented business rules, limits, API behaviour, or package versions (must trace to the
   docs or be explicit assumptions, never silently hard-coded).

Report a table: change → requirement ID(s) → status (mapped / UNMAPPED / OUT-OF-PHASE /
EXCLUSION VIOLATION), followed by the required actions.

$ARGUMENTS
