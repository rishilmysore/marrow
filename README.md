# Marrow

Five files and one loop. A minimal, agent-agnostic development framework — the living core of heavier agent frameworks with the scaffolding removed.

Marrow is not a tool you install. It is markdown you copy into a repo. Any agent — Claude Code, Codex, a bare API loop, a human — picks it up by reading the files. If your harness disappears tomorrow, the framework still works. Everything an agent needs ships in the templates; this README is for the human deciding to adopt them.

## Install

```sh
git clone --branch v0.2.0 https://github.com/rishilmysore/marrow.git
cp -r marrow/templates/* your-project/
```

Already have an AGENTS.md? Stash it before the `cp` — commit or copy it away; `cp` overwrites the file and destroys uncommitted edits — then merge your rules into the fresh template's sections; don't keep both files. A merged rule the code currently violates stays in AGENTS.md; file the violation as STATE.md's Next action.

Then fill the `TODO` markers and the `<Project>` title in AGENTS.md, seed STATE.md's Focus and Next action, and append the tag you installed from to each copied file's `marrow v0` marker — it becomes `marrow v0 @ v0.2.0`, the anchor every later upgrade diffs from; rule 6 below applies to Marrow itself. Commit the install.

## Wiring a harness

- **Claude Code** — add a `CLAUDE.md` containing `@AGENTS.md` (the import form is guaranteed; "see X" is advisory). It reads AGENTS.md once at session start, so edits from a closeout are for the next session.
- **Codex, and any agent that already reads AGENTS.md by convention** — nothing. The files are the integration.
- **Bare loop, no harness affordances** — feed AGENTS.md into the context at the start of every session; it tells the agent what else to read. Run `sh adapters/lint.sh` yourself, by hand or in CI, since no hook fires for you.

## Three layers

1. **State** — what persists between sessions. Every fact lives in exactly one file; every copy is a future divergence, so nothing mirrors.
2. **Harness** — the environment: how the agent builds, runs, and *proves* changes (AGENTS.md), what it may not touch, and the quirks that cost sessions to rediscover.
3. **Loop** — how work iterates: fresh context per step, evidence-gated progression, mandatory distillation and garbage collection at close.

## The loop

**classify → plan → execute → verify → distill**

Every task is classified and ceremony scales with the class — never by adding commands. `trivial`: edit and verify inline, evidence in the commit message. `multi-file`: copy `plans/_TEMPLATE.md` to `plans/<slug>.md` and list it in STATE.md's In flight. `risky-novel` — "new external surface (API, schema, dependency), irreversible data change, security-sensitive, or nothing in the repo to pattern-match against" — is multi-file plus a Spec filled before the tasks. AGENTS.md owns these definitions; this paragraph is the digest.

Plans are written in one session and executed in a fresh one, because planning fills a context with exploration the executor shouldn't inherit. So every plan is written for an executor with no other context, and the committed plan file is the entire handoff — anything the executor needs that isn't in it is a defect (a *leak*; see Feedback). A plan cannot close while any Verify row lacks evidence — "it should work" closes nothing. Closing runs CLOSEOUT.md: distill, archive, regenerate state, prune.

## Rules

Each rule ships in the template file that owns it — that file's header is the law; this list is the index.

1. STATE.md is regenerated, never appended, and hard-capped. (STATE.md)
2. DECISIONS.md is append-only provenance; the current rules it implies live in AGENTS.md. (DECISIONS.md)
3. History lives in git; docs describe the present. (AGENTS.md)
4. No document restates another. Derive, don't copy. (AGENTS.md)
5. Ceremony scales by the classify rule — never by adding commands. (AGENTS.md)
6. Vendor what you adopt — copy in, pin, review once. (AGENTS.md)

## Lint

Optional per-harness adapters (slash commands, hooks, checks) belong in `adapters/`; none are required, and nothing harness-specific ever ships in `templates/`. Two examples ship here. The first, `adapters/lint.sh`, is a POSIX check of the four mechanical invariants the docs cannot self-enforce — a live instance carries STATE.md, the state cap, evidence-gated archives, append-only decisions. Wire it as a pre-commit hook — the exact one-liner is in its header — and every check has teeth before a commit lands: the append-only check diffs the worktree against HEAD. In CI, pass a base ref — `sh adapters/lint.sh origin/main`, also documented in the header — and that check turns range-aware, catching already-committed deletions too. `adapters/lint_test.sh` keeps the check itself honest. The second, `adapters/fresh-verify.md`, has a fresh context — one that did not write the code — re-run a finished plan's Verify table.

## Versioning

The version numbers the adopter contract: the five template files' names and roles, the loop's stages and classes, the lint invocation and checks, and the marker convention.

- **MAJOR** — your vendored copy or its upgrade path breaks without manual rework: a template file renamed, removed, or re-roled; stage or class semantics changed incompatibly; the marker format or lint invocation changed. The marker's `v0` is the major version and moves with it.
- **MINOR** — compatible additions and tightenings: a new template file or section, a new class, a new lint check, new doctrine that doesn't invalidate past work. A new lint check cannot fail your CI spontaneously — you vendored, so it arrives only inside an upgrade diff you chose to apply — and each one is named in its CHANGELOG entry with a one-line remediation.
- **PATCH** — changes no obligation: wording, guidance, lint false-positive fixes.

While 0.x, breaking changes may land in a MINOR — never a PATCH — each flagged **Breaking** in CHANGELOG.md with a one-line migration. 1.0 comes when adoption proves the contract: at least three independent adoptions each filing an instrumented report from a completed loop, two consecutive MINOR releases changing no template file's name or role, and at least one adopter running the upgrade below across a release boundary and reporting it workable.

## Upgrading

Your markers hold the anchor. When a new tag lands (say v0.2.0):

```sh
git -C marrow fetch --tags
git -C marrow diff v0.1.0 v0.2.0 -- templates/
```

— `marrow` being your clone and `v0.1.0` whatever your markers say; add `adapters/` to the paths if you vendored the lint. Hand-apply what you take to your copied files — a vendored copy updates nothing by itself — then re-anchor each marker to `marrow v0 @ v0.2.0`. CHANGELOG.md describes each release from the adopter's side; a **Breaking** flag there carries its migration line.

## Feedback

Marrow is 0.x: the shape is set, the contract is not frozen, and real-adoption reports decide what changes — they are also the 1.0 gate above. If you run it, file a [friction report](https://github.com/rishilmysore/marrow/issues/new?template=friction-report.yml). The form asks for three signals by name:

- **Friction point** — a step that worked but fought you: you did what the doc said and it cost more than it should have.
- **Moment of silence** — the doctrine went quiet: the loop raised a question and no shipped file answered it.
- **Leak count** — handoff leaks: times an executor needed information the plan plus AGENTS.md should have carried but didn't; count the deviations of that kind the plan records.

Only version and harness are required fields — a report with one filled field beats no report.

This repo runs Marrow on itself: the root AGENTS.md, STATE.md, DECISIONS.md, and plans/ are the live instance — plans/archive/ holds worked examples.

## Lineage

Built by keeping what earned its overhead in three frameworks and dropping the rest.

| Source | Kept | Dropped |
|---|---|---|
| GSD | spec-before-execute, fresh-context executors, atomic commits, verification gates | ~70 commands, phases, multi-doc status mirroring, metrics dashboards, conversational UAT |
| superpowers | TDD and systematic-debugging as habits, verify-before-claiming-done | mandatory skill invocation, session-start injection, brainstorming-as-ceremony |
| impeccable | design-spec-before-UI-work, explicit visual acceptance criteria | standalone audit machinery |
