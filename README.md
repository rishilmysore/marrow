# Marrow

Five files and one loop. A minimal, agent-agnostic development framework — the living core of heavier agent frameworks with the scaffolding removed.

Marrow is not a tool you install. It is markdown you copy into a repo. Any agent — Claude Code, Codex, a bare API loop, a human — picks it up by reading the files. If your harness disappears tomorrow, the framework still works. Everything an agent needs ships in the templates; this README is for the human deciding to adopt them.

## Three layers

1. **State** — what persists between sessions. Every fact lives in exactly one file; every copy is a future divergence, so nothing mirrors.
2. **Harness** — the environment: how the agent builds, runs, and *proves* changes (AGENTS.md), what it may not touch, and the quirks that cost sessions to rediscover.
3. **Loop** — how work iterates: fresh context per step, evidence-gated progression, mandatory distillation and garbage collection at close.

## The loop

**classify → plan → execute → verify → distill**

Every task is classified — `trivial`, `multi-file`, or `risky-novel` — and ceremony scales with the class. Plans are written for an executor with no other context, and cannot close while any Verify row lacks evidence — "it should work" closes nothing. Closing runs CLOSEOUT.md: distill, archive, regenerate state, prune. AGENTS.md owns the operational definitions; this paragraph is the digest.

## Rules

Each rule ships in the template file that owns it — that file's header is the law; this list is the index.

1. STATE.md is regenerated, never appended, and hard-capped. (STATE.md)
2. DECISIONS.md is append-only provenance; the current rules it implies live in AGENTS.md. (DECISIONS.md)
3. History lives in git; docs describe the present. (AGENTS.md)
4. No document restates another. Derive, don't copy. (AGENTS.md)
5. Ceremony scales by the classify rule — never by adding commands. (AGENTS.md)
6. Vendor what you adopt — copy in, pin, review once. (AGENTS.md)

## Install

```sh
cp -r templates/* your-project/
```

Fill the TODO markers in AGENTS.md. Existing repo? `cp` overwrites an existing AGENTS.md — stash yours first (git suffices), then merge it into the fresh template's sections; don't keep both. Point your harness's memory file at it (for Claude Code, a `CLAUDE.md` containing `@AGENTS.md` — the import form is guaranteed; "see X" is advisory). Templates carry a `marrow v0` marker — append the source commit as you copy (`marrow v0 @ abc1234`) so later diffs against upstream have an anchor; rule 6 applies to Marrow itself.

Optional per-harness adapters (slash commands, hooks, checks) belong in `adapters/`; none are required. One example ships here: `adapters/lint.sh`, a POSIX check of the three mechanical invariants — state cap, evidence-gated archives, append-only decisions. Wire it as a pre-commit hook (the append-only check compares your worktree against HEAD, so it only has teeth before the commit lands; as a CI step, checks 1–2 still hold). The one-line hook command is in its header, and `adapters/lint_test.sh` keeps the check itself honest.

This repo runs Marrow on itself: the root AGENTS.md, STATE.md, DECISIONS.md, and plans/ are the live instance — plans/archive/ holds worked examples.

## Lineage

Built by keeping what earned its overhead in three frameworks and dropping the rest.

| Source | Kept | Dropped |
|---|---|---|
| GSD | spec-before-execute, fresh-context executors, atomic commits, verification gates | ~70 commands, phases, multi-doc status mirroring, metrics dashboards, conversational UAT |
| superpowers | TDD and systematic-debugging as habits, verify-before-claiming-done | mandatory skill invocation, session-start injection, brainstorming-as-ceremony |
| impeccable | design-spec-before-UI-work, explicit visual acceptance criteria | standalone audit machinery |
