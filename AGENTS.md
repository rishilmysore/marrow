# Marrow

<!-- marrow v0 -->

Marrow's own working copy — this repo runs the framework on itself. What must never break: `templates/` stays agent-agnostic and self-contained; an adopter copies it without this README and loses nothing.

Agent conventions for this repo. STATE.md holds current focus; DECISIONS.md holds decision provenance; plans/ holds in-flight work, plans/archive/ closed work. This file states the current binding rules — if it disagrees with a newer DECISIONS.md line, this file is stale: fix it.

## Session

- Start: read this file, then STATE.md; resume its Next action unless told otherwise.
- Context diet: planning adds DECISIONS.md; executing adds the one plan. plans/archive/ is history — dig only on purpose.
- Blocked, or scope has doubled? Write a STATE.md blocker and ask.
- Parallel work: one plan per worktree; STATE.md In flight lists them all.

## The loop

classify → plan → execute → verify → distill (templates/CLOSEOUT.md). Ceremony scales by class, never by adding commands.

- `trivial` — edit + verify inline; no plan; evidence goes in the commit message.
- `multi-file` — copy templates/plans/_TEMPLATE.md → plans/<slug>.md. Plan in a fresh context; execute in another. The plan is the entire handoff.
- `risky-novel` — as multi-file, plus fill Spec before Tasks.
- Reclassify upward the moment a task outgrows its class: a `trivial` that touches a second file or fails verification once is `multi-file` — stop and write the plan.
- Too big for one plan: split into independently verifiable plans; sequence them in STATE.md Next action.

## Commands

| Action | Command |
|---|---|
| Lint | `sh adapters/lint.sh` |

## Verification

- Fast gate (every change): `sh adapters/lint.sh && ! grep -rn "README" templates/`
- Behavior proof (template changes): copy templates/ into a scratch directory and walk one task through the loop — the copied set must answer every question the loop asks.
- Evidence lands in the plan's Verify table, secrets redacted.

## Environment

Quirks that cost sessions to rediscover. Update the moment you hit one.

- An ARS scope-guard hook here blocks agents writing CLAUDE.md — the human maintains that pointer file by hand.

## Conventions

- Style: every line earns its place. Templates use `<!-- TODO -->` for fill-at-install and plain comments for per-use guidance.
- Commits: one atomic commit per task, imperative mood. Docs (STATE.md, DECISIONS.md, plans/) are committed like code.
- History lives in git; docs describe the present. No document restates another — derive, don't copy.
- Vendor what you adopt: copy in, pin, review once.

## Boundaries

- templates/ never references this repo's README — the copied set must stand alone.
- templates/ never contains harness-specific syntax (slash commands, hook configs); that belongs in adapters/.
- Never push without being asked.
