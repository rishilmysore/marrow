# Plan: v0-hardening

<!-- marrow v0 — written for an executor with NO other context: fresh session, this file + AGENTS.md only.
     Trivial tasks don't get plans. Risky-novel work fills Spec before Tasks. -->

**Intent:** Close all 11 defects and 12 gaps from the 2026-07-03 external audit so the copied template set is self-contained, enforceable, and honest about its lineage.
**Class:** multi-file

## Success criteria (must be TRUE at close)

1. `cp -r templates/*` into a bare directory yields a set that answers every question the loop asks — classify thresholds, fresh-context rule, failure paths, precedence — with zero references back to this repo's README.
2. `sh adapters/lint.sh` passes on this repo and exits non-zero on seeded violations (oversize STATE.md, empty Evidence cell in an archived plan).
3. Every doctrine invariant is stated in exactly one owner file; the README carries principles and pointers, no parameters.
4. The lineage table contains no claim without a referent in the templates.

## Context

- Files / entry points: README.md, templates/{AGENTS,STATE,DECISIONS,CLOSEOUT}.md, templates/plans/_TEMPLATE.md; new: adapters/lint.sh, LICENSE, root AGENTS.md + CLAUDE.md.
- Binding constraints: agent-agnostic (no harness-specific syntax in templates/); every line earns its place; total template growth ≤ +40 lines.

## Tasks

<!-- One atomic commit each. Record deviations inline as they happen. -->

1. [x] templates/AGENTS.md absorbs the doctrine: classify definitions + reclassify tripwire, session protocol + context diet, blocked→ask, worktrees, precedence over DECISIONS.md, TDD + debugging conventions, rules 3–6, version marker. (6ec34cd)
2. [x] templates/{STATE,DECISIONS,CLOSEOUT}.md: 25-line cap + "whenever it stops being true"; provenance header + placeholder-row note; abandon path, fenced prune, `git mv`, epoch archival, closeout commit step. (da3d080)
3. [x] templates/plans/_TEMPLATE.md: unify `risky-novel`, rollback line in Spec, budget-trip output. (df3608d)
4. [x] README.md: derive from templates — gate wording fixed, parameters removed, install/merge/`@AGENTS.md` guidance, honest lineage, adapters + dogfood notes. (5de2180)
5. [x] adapters/lint.sh (state cap, evidence-gated archives, append-only decisions) + LICENSE (0BSD). (2204f62)
6. [x] Root AGENTS.md + CLAUDE.md: this repo runs Marrow on itself. (f29e50e)
   - **Deviation:** root CLAUDE.md not created — an ARS scope-guard hook in this environment blocks agents writing CLAUDE.md. Quirk folded into AGENTS.md Environment; the human creates the one-line pointer (`@AGENTS.md`) by hand.
   - **Deviation:** secret-redaction line placed in AGENTS.md Verification only, not also in the plan template — one owner per rule.

## Verify — the gate: cannot close while any row lacks evidence

| Check | How | Evidence |
|---|---|---|
| Fast gate | `sh adapters/lint.sh && ! grep -rn "README" templates/` | `marrow-lint: ok`; grep found nothing (exit 1) |
| Self-containment | copy templates/* to scratch; grep for README refs and old `risky/novel` token; confirm classify + failure paths present | 5 files copied; 0 README refs; 0 `risky/novel`; classify tokens ×4 in AGENTS.md; abandon path, back-to-execute, budget-trip all present; lint ok on the fresh copy |
| Lint teeth | seeded violations in scratch each exit 1 | 31-line STATE.md → exit 1 "cap 25"; empty Evidence cell in archived plan → exit 1, flagged only the empty row; staged deletion from committed DECISIONS.md → exit 1 "loses 3 line(s)" |
| Growth budget | `git diff --stat` on templates/ vs +40-line cap | 85850ff..f29e50e templates/: 44 insertions, 16 deletions = net +28 |

## Budget

Stop if: template growth would exceed +40 lines total, or any fix needs harness-specific syntax inside templates/.
Tripped → record it here, add a STATE.md blocker, ask before continuing. (Not tripped.)

## Closeout

Run CLOSEOUT.md. Distilled line(s) destined for DECISIONS.md:

- AGENTS.md owns operational doctrine; README derives — the copied set must stand alone.
- DECISIONS.md is provenance, AGENTS.md the current view; on conflict AGENTS.md is stale.
- 0BSD license: templates are copy-paste content; zero-attribution beats MIT here.
