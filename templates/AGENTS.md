# <Project>

<!-- TODO: one paragraph — what this is, who it's for, the one thing that must never break. -->

Agent conventions for this repo. STATE.md holds current focus; DECISIONS.md holds every decision; plans/ holds in-flight work. Loop: classify → plan → execute → verify → distill (see CLOSEOUT.md).

## Commands

| Action | Command |
|---|---|
| Install | <!-- TODO --> |
| Typecheck / lint | <!-- TODO --> |
| Unit tests | <!-- TODO --> |
| Run locally | <!-- TODO --> |
| Build / package | <!-- TODO --> |

## Verification

What constitutes **proof** that a change works. Claiming "done" requires running these and showing the output.

- Fast gate (every change): <!-- TODO: e.g. `npm run typecheck && npm test` -->
- Behavior proof (feature work): <!-- TODO: how to drive the real flow — e2e suite, smoke script, or manual steps -->
- Evidence lands in the plan's Verify table: pasted output, or a screenshot for UI.

## Environment

Quirks that cost sessions to rediscover. Update the moment you hit one.

- <!-- TODO: e.g. "e2e cannot run in WSL2 — Chromium SIGTRAPs; run on CI macos-14 instead" -->

## Conventions

- Style: <!-- TODO: formatter/linter + the 2–3 norms tooling can't enforce -->
- Commits: one atomic commit per plan task, imperative mood.
- Comments: only for constraints the code cannot express.

## Design (UI repos — delete otherwise)

- Tokens: <!-- TODO: type scale, spacing unit, palette source -->
- Bar for any shipped UI: keyboard-reachable, responsive at common widths, light + dark themes, loading/empty/error states designed, no layout shift on load.

## Boundaries

What agents must not do here.

- <!-- TODO: e.g. never push without being asked; secrets live in X, never in code or docs; never touch generated/ -->
