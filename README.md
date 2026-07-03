# Marrow

Five files and one loop. A minimal, agent-agnostic development framework — the living core of heavier agent frameworks with the scaffolding removed.

Marrow is not a tool you install. It is markdown you copy into a repo. Any agent — Claude Code, Codex, a bare API loop, a human — picks it up by reading the files. If your harness disappears tomorrow, the framework still works.

## Three layers

1. **State** — what persists between sessions. Every fact lives in exactly one file; nothing mirrors. Doc drift scales with copies × sync steps, so there are no copies.
2. **Harness** — the environment: how the agent builds, runs, and *proves* changes (AGENTS.md), what it may not touch, and the quirks that cost sessions to rediscover.
3. **Loop** — how work iterates: fresh context per step, evidence-gated progression, mandatory distillation and garbage collection at close.

## The loop

**classify → plan → execute → verify → distill**

- **Classify** every task. `trivial`: edit + verify inline, no plan. `multi-file`: plan file. `risky/novel`: plan file with the Spec section filled first.
- **Plan** in a fresh context. Copy `plans/_TEMPLATE.md` → `plans/<slug>.md`. Write for an executor with no other context — the plan is the entire handoff.
- **Execute** in a fresh context (new session or subagent). One atomic commit per task. Deviations are noted in the plan, never silently absorbed.
- **Verify** — the gate. A plan cannot close while its Verify table is empty. Evidence means command output, run logs, or screenshots — "it should work" closes nothing.
- **Distill** — run `CLOSEOUT.md`: ≤3 lines to DECISIONS.md, archive the plan, regenerate STATE.md, prune stale lines. This is the garbage collection that prevents context rot.

## Rules

1. STATE.md is regenerated, never appended. Hard cap: half a page.
2. DECISIONS.md is append-only, one line per decision. Needs a paragraph? It needed a plan — link it.
3. History lives in git; docs describe the present.
4. No document restates another. Derive, don't copy.
5. Ceremony scales by the classify rule — never by adding commands.
6. Vendor what you adopt. No third-party skill packs at runtime; copy in, pin, review once.

## Install

```sh
cp -r templates/* your-project/
```

Fill the TODO markers in AGENTS.md. Point your harness's memory file at it (e.g. a `CLAUDE.md` containing `See AGENTS.md.`). Optional per-harness adapters (slash commands, hooks) belong in `adapters/` — none are required.

## Lineage

Built by keeping what earned its overhead in three frameworks and dropping the rest.

| Source | Kept | Dropped |
|---|---|---|
| GSD | spec-before-execute, fresh-context executors, atomic commits, verification/UAT gates | ~70 commands, phases, multi-doc status mirroring, metrics dashboards |
| superpowers | brainstorm-before-build, TDD and systematic-debugging as habits, verify-before-claiming-done | mandatory skill invocation, session-start injection |
| impeccable | design-spec-before-UI-work, explicit visual acceptance criteria | standalone audit machinery |
