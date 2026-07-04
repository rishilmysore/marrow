# Plan: v0-proof

<!-- marrow v0 — written for an executor with NO other context: fresh session, this file + AGENTS.md only.
     Trivial tasks don't get plans. Risky-novel work fills Spec before Tasks. -->

**Intent:** Land the five verified survivors of the two-pass research audit as release v0.2.0 — two every-session verification duties (dependency existence, red→green test evidence), a threat-naming Spec prompt, a Design-module visual-evidence bar, an optional fresh-verify adapter — then tag, push, and cold-verify per the public-cut precedent. Every edit is embedded byte-exact below; needing anything beyond this file + AGENTS.md + the repo's own files is a handoff leak — record a `Deviation:` line under the task.
**Class:** risky-novel — new external surface (the adopter contract gains obligations plus a new vendorable adapter, all in a public MINOR), an irreversible act (a published tag adopters pin; never force-push), and edits inside audit-3 must-preserve territory, where a wrong step is expensive.

## Success criteria (must be TRUE at close)

1. A copied templates/ set alone drives all four new duties in toy walks: a dependency task produces registry evidence for the exact name and current version plus a red→green transcript; a security-sensitive Spec names attack surfaces and who abuses them; a UI task's evidence is a rendered artifact or a named stand-in (Verify rows 3–5).
2. A fresh context holding only a finished plan + AGENTS.md re-runs its Verify table per adapters/fresh-verify.md and returns evidence marked `fresh-verify` (Verify row 6).
3. v0.2.0 is public: annotated tag on origin, GitHub release mirroring the [0.2.0] CHANGELOG section (or the manual step recorded); a cold clone at the tag installs lint-green from its own README and its templates carry every new line (Verify rows 11–12).
4. Measured every-session growth (E1+E2 in templates/AGENTS.md) is ≤ +120 tokens; per-plan (E3) and Design-module (E4) deltas recorded against estimates (Verify row 8).
5. Outside §Context's exhaustive touch list, v0.1.0 → v0.2.0 is byte-identical; mirrors have parity; Boundary 3's byte-frozen lines are intact (Verify rows 9–10).
6. CHANGELOG [0.2.0] names each new obligation with a one-line remediation and marks the Design-module and adapter items optional/deletable; the finished README and CHANGELOG sweep zero-stale (Verify row 7).

## Spec (risky-novel)

- Unknowns to resolve first: none open — resolved at plan time: origin = github.com/rishilmysore/marrow, main == origin/main == remote tip b75c0df; the only tag anywhere is v0.1.0 (no v0.2.0 collision); `gh` authenticated (rishilmysore, repo scope) — re-verify at execution; every old block below verified byte-exact at the baseline.
- Approach chosen + alternatives rejected (one line why each):
  - E2 (red→green) lives in AGENTS.md Verification, not the plan template: `trivial` tasks put evidence in commit messages and inherit the duty only from AGENTS.md; it defines what counts as proof while the existing "Bugfix: failing test first, then the fix." line orders the work — complement, no restatement. Rejected _TEMPLATE.md placement: trivial tasks never read it.
  - E3 extends the existing Failure-modes prompt in place: audit-3's mid-execution security discovery had only a lucky Budget phrasing as a rail (in-repo trace: the m-1 row's "Spec ceremony demonstrably improved a security task this audit"); the question belongs where every risky-novel plan already answers it. Rejected a fifth Spec prompt: grows every plan for a security-only concern.
  - E4 upgrades the UI evidence channel from permitted ("or a screenshot for UI") to required, scoped to the Design module: repos that delete the module take no new duty — the module pattern is the point. No root mirror; this repo has no Design section (divergence already standing at v0.1.0).
  - E5 ships as an optional adapter, not doctrine: fresh-context verification costs a session per closeout, and adapters/ is the standing home for buy-if-worth-it machinery ("none are required" — README § Lint). Rejected a CLOSEOUT step: it would tax every closeout.
  - Rejected routing verification lessons into DECISIONS.md (research candidate C4): the log records decisions, not lessons — archived Verify tables already hold what verification caught, and a lesson-fed append-only log outgrows its epoch mechanism (the 40-row move, CLOSEOUT step 8).
  - Shipped pre-adoption deliberately: the dependency failure class cannot surface in friendly adoption, and the UI adoption should test the Design module as it ships.
  - MINOR, settled: per the versioning policy (DECISIONS 2026-07-04; README § Versioning) PATCH "changes no obligation" and every edit here adds one; nothing renames, removes, or re-roles a file. Not relitigated.
- Failure modes / threats designed against (security-sensitive: name the attack surfaces and who abuses them):
  - Slopsquatting — the surface E1 closes: an agent invents a plausible package name; whoever pre-registered that name in the registry owns the payload. Rail: exact-name + current-version registry evidence before adding. This plan adds no dependency itself, so walk (a) must show the line firing in a copied set, invented-name control included.
  - Weakening the evidence gate while extending it: E2 appends to the Evidence-lands line; Boundary 3's byte-frozen gate lines are untouched by every task — mirror parity and the scope-freeze diff prove it.
  - Must-preserve #10 contact: E3 edits one of the four Spec prompts the audit-3 list marks "untouched". Plan-time resolution: the list's binding force is its own header — "any edit weakening these is out of scope" — and E3 extends without weakening, the same direction the mission sanctions for E2. Flagged at plan review 2026-07-04; the strengthening reading confirmed by the user.
  - Publishing the wrong thing (irreversible): the closeout commit precedes the tag; §Publish delta review; dry-run; annotated tag; never force. Post-push defect → fix forward in a PATCH; tags never move or vanish.
  - Stale prose about shipped files (the repo's recurring bug class): the release re-pins the README's install examples; the validated cold-subagent sweep gates the push; post-push-only claims carry deferred cells replaced by Task 11's evidence commit.
- Rollback if it ships broken: before Task 10's push, ordinary `git revert`. After, fix forward in a PATCH; E4/E5 are adopter-deletable by design; E1–E3 would revert in a later MINOR only if adoption shows drag (the m-1 revisit path).

## Context

- Publish baseline: **b75c0df44a1aee68c71fcfe77445b7ce2f5b9652** — v0.1.0 (tag object 92df789 on 97ab660) plus its post-push evidence commit; clean tree, main == origin/main == remote tip, verified at plan time.
- Files this plan may touch, exhaustively: templates/AGENTS.md (E1, E2, E4), templates/plans/_TEMPLATE.md (E3), adapters/fresh-verify.md (new, E5), root AGENTS.md (E2 mirror only), README.md (Task 6), CHANGELOG.md (Task 7), STATE.md + DECISIONS.md + this file (closeout mechanics). Frozen, byte-identical v0.1.0 → v0.2.0: templates/STATE.md, templates/DECISIONS.md, templates/CLOSEOUT.md, adapters/lint.sh, adapters/lint_test.sh, LICENSE, CLAUDE.md (hook-guarded), .github/.
- Anchor map at the baseline: templates/AGENTS.md:55 (E1), :41 (E2), :62 (E4); templates/plans/_TEMPLATE.md:18 (E3); root AGENTS.md:37 (E2 mirror — the root line is a drifted variant without the screenshot clause; Task 2's second block is the pre-resolved adaptation, recorded there as a Deviation per the mission's drift rule). Root AGENTS.md has no Debugging line and no Design section: E1 and E4 take no root mirror — recorded divergence, not oversight.
- Binding constraints: fast gate `sh adapters/lint.sh && ! grep -rn "README" templates/` before every commit; `sh adapters/lint_test.sh` stays exactly `lint-test: 26 ok, 0 failing` (no lint change ships); templates/ stays agent-agnostic — fresh-verify's harness-naming lines are exactly why it lives in adapters/; one atomic commit per task, imperative mood.
- Ledger baselines at plan time (bytes; tokens ≈ bytes/4, the v0-edges convention): templates/AGENTS.md 3871, templates/plans/_TEMPLATE.md 1591, root AGENTS.md 3531. Estimates: E1 ≈ 34 + E2 ≈ 37 tokens (every adopter session), E3 ≈ 15 (per plan), E4 ≈ 50 (Design-module repos), E5 = 0 (nothing loads an adapter).

## Boundaries

1. **Push is authorized for this plan only** — explicit user instruction, 2026-07-04, recorded here so the executor does not blocker on AGENTS.md's "Never push without being asked": this is the being-asked. Scope: `git push origin main` (the release push and Task 11's evidence commit), `git push origin v0.2.0`, and the `gh release create` mirror. Never `--force`, on any ref. The standing boundary is unchanged for every future plan.
2. Ordering is fixed: closeout commit → pre-push gates → annotated tag → dry-run → push main → push tag → GitHub release → post-push cold verify → evidence commit → final push. Nothing publishes before the closeout commit exists.
3. The audit-3 must-preserve list (plans/archive/v0-edges.md Boundaries) binds; strengthening is the only permitted direction. Carried here for the executor — these stay byte-identical: templates/plans/_TEMPLATE.md's "## Verify — the gate: cannot close while any row lacks evidence" heading and its Evidence column; templates/AGENTS.md's "Claiming "done" requires running these and showing the output."; the reclassify, handoff ("Plan in a fresh context…"), context-diet, and vendor lines in both AGENTS.md; the three Spec prompts E3 does not name (Unknowns / Approach / Rollback). E2 appends after "secrets redacted." on its line and edits nothing else; E3 rewrites only the Failure-modes prompt exactly as Task 3 writes it. The rest of the list lives in files Boundary 4 freezes. Any other pressure on the list: stop, STATE.md blocker, ask.
4. Scope freeze: outside Context's exhaustive touch list, v0.1.0 → v0.2.0 is byte-identical (Verify row 10).
5. README touches only what the staleness sweep or fresh-verify's existence requires; no restating shipped doctrine — a paraphrased rule is a future silent lie.
6. The three §Closeout rows land as written (substance fixed, wording may tighten); they consume CLOSEOUT step 3's ≤3-row budget — no other rows this closeout. CLOSEOUT step 4's fold-in is discharged by Task 2's root mirror; no further root doctrine lands.

## Tasks

<!-- One atomic commit each unless stated, imperative mood. Fast gate before every commit. Record deviations inline. Old/new blocks are byte-exact and column-0. -->

1. [x] **E1 — dependency-existence check.** In `templates/AGENTS.md`, replace:

```
- Debugging: reproduce → hypothesize → instrument → fix. Three failed fixes on one symptom → stop and write a plan.
```

with:

```
- Debugging: reproduce → hypothesize → instrument → fix. Three failed fixes on one symptom → stop and write a plan.
- Dependencies: verify a new one exists in its registry — exact name, current version — before adding it; invented package names are an attack surface.
```

No root mirror — root Conventions has no Debugging anchor (Context). Commit: `AGENTS: verify a dependency exists in its registry before adding it`

2. [x] **E2 — red→green evidence.** In `templates/AGENTS.md`, replace:

```
- Evidence lands in the plan's Verify table — pasted output or a screenshot for UI — secrets redacted.
```

with:

```
- Evidence lands in the plan's Verify table — pasted output or a screenshot for UI — secrets redacted. A test written for this change proves it by failing before and passing after; a test that never failed proves nothing.
```

In root `AGENTS.md`, replace:

```
- Evidence lands in the plan's Verify table, secrets redacted.
```

with:

```
- Evidence lands in the plan's Verify table, secrets redacted. A test written for this change proves it by failing before and passing after; a test that never failed proves nothing.
```

Deviation (pre-resolved at plan time): the root anchor had drifted from the mission's old block — no screenshot clause — and is adapted above per the mission's drift rule. Commit: `AGENTS: a test that never failed proves nothing`

3. [x] **E3 — threat naming.** In `templates/plans/_TEMPLATE.md`, replace:

```
- Failure modes / threats designed against:
```

with:

```
- Failure modes / threats designed against (security-sensitive: name the attack surfaces and who abuses them):
```

Commit: `plan template: security-sensitive Spec names attack surfaces and abusers`

4. [x] **E4 — visual evidence bar (Design module).** In `templates/AGENTS.md`, replace:

```
- Bar for any shipped UI: keyboard-reachable, responsive at common widths, light + dark themes, loading/empty/error states designed, no layout shift on load.
```

with:

```
- Bar for any shipped UI: keyboard-reachable, responsive at common widths, light + dark themes, loading/empty/error states designed, no layout shift on load.
- Verify against rendered output: a UI-affecting change's evidence is a screenshot or rendered artifact — the agent looked at the page; where the harness cannot render, the Verify row names what stood in for eyes.
```

Module-scoped by the section's own "(UI repos — delete otherwise)"; no root mirror. Commit: `AGENTS: Design bar — verify UI against rendered output`

5. [x] **E5 — fresh-verify adapter.** Create `adapters/fresh-verify.md` with exactly (line breaks as the mission gave them; its uniform block indent stripped to column 0 — the one normalization, a plan-time decision):

```
# fresh-verify — optional adapter <!-- marrow v0 -->

Run the Verify table in a context that did not write the code. The
author's context knows what it meant; a fresh one only knows what the
plan says — author-blindness is what catches the gap between them.

- Claude Code: spawn a subagent whose entire context is the plan +
  AGENTS.md; it runs each Verify row and returns evidence.
- Codex-family / bare loop: open a new session with the same two files.
- Cost: one extra session per closeout. Buy it for `risky-novel` work;
  skip it when the Verify table is mechanical.

Evidence lands in the same Verify rows, marked "fresh-verify". Nothing
requires this file — delete it if unused, per the adapter convention.
```

Commit: `adapters: fresh-verify — optional fresh-context verification`

6. [x] **README.** Exactly three touches, authorship the executor's within Boundary 5: (a) Install: `--branch v0.1.0` → `--branch v0.2.0`, and the marker example `marrow v0 @ v0.1.0` → `marrow v0 @ v0.2.0` — the install pin tracks the release the README ships in; (b) the § Lint adapters paragraph currently opens "One example ships here: `adapters/lint.sh`…" — rework minimally so it also names `adapters/fresh-verify.md` as a second, optional adapter (one clause on what it is; deletability is already covered by "none are required"); (c) Rules index: unchanged by default — no template header gained a law; add a line only if Task 8's sweep flags the index incomplete, and record the call either way. Everything else untouched; the Upgrading example (v0.1.0 → v0.2.0) becomes the literal current upgrade and is expected byte-unchanged. Commit: `README: name fresh-verify; re-pin install to v0.2.0`
   Recorded call (c): Rules index unchanged — no template header gained a law; E1/E2/E4 are body lines under existing AGENTS.md sections, E3 is a Spec prompt in the plan template.

7. [x] **CHANGELOG.** Add `## [0.2.0] - <exec-date>` between `## [Unreleased]` (stays, empty) and `## [0.1.0]`: an Added list naming each of the five changes by file and obligation, each with a one-line remediation (adoption is the marker-diff upgrade — README § Upgrading); the Design-module item marked module-scoped (delete the section, no duty applies) and the adapter item optional (nothing requires it; delete if unused). Adopter-side voice; the internal why stays in this plan. Update link refs: `[Unreleased]` compares `v0.2.0...HEAD`; add the `[0.2.0]` release-tag link. Commit: `CHANGELOG: 0.2.0 — verification duties from the research audit`

8. [x] **Behavior proofs — four walks in a scratch instance; no commit in this repo.** Copy `templates/*` and `adapters/` into a scratch toy repo (2–3 file toy project), fill install TODOs minimally, keep the Design section, git-init so lint has teeth. Then:
   - (a) **Dependency walk (E1 + E2):** toy task "add a small real package" — classifies risky-novel (the "dependency" trigger; the m-1 deferral stands). Must produce: registry lookup output for the exact name + current version (any real registry at hand — npm, PyPI, crates.io); an invented-control lookup (plausible fake name) failing, the add refused on that basis; a test written for the change failing before and passing after — the red→green transcript. All in the walk plan's Verify rows. → Verify row 3.
   - (b) **UI walk (E4):** toy UI-affecting change (a static HTML page suffices); evidence is a rendered artifact — screenshot via any renderer at hand; if none, exercise the line's own fallback: the Verify row names what stood in for eyes. → Verify row 4.
   - (c) **Security walk (E3):** toy security-sensitive task (e.g. the toy's fetch script gains an API token) — classify risky-novel, fill Spec; the extended prompt must elicit named attack surfaces and who abuses them, in the walk plan's own words. → Verify row 5.
   - (d) **fresh-verify walk (E5):** on walk (a)'s finished plan, follow `adapters/fresh-verify.md`: a fresh context holding only that plan + the copied AGENTS.md re-runs each Verify row and returns evidence, marked `fresh-verify`. → Verify row 6.
   A walk that cannot exercise its line, or exposes it as wrong: flag it in the row — flagged, not assumed — and see Budget before Task 9.
   Deviations, walk-side (recorded here; none touches a shipped line): walk (a)'s first green run failed — picocolors strips ANSI when stdout is no TTY; fixed with `createColors(true)` in the toy. Walk (b) planned a `playwright` module import but used the Playwright CLI (`npx playwright screenshot`) — module not resolvable outside a package; same renderer. Walk (b)'s plan was committed with the work, not before execution — single-session walk, handoff discipline unexercised. Walk (d)'s fresh context read greet.test.js beyond the two-file manifest — required by the Red→green row's own "test written for this change" check; recorded in row 6.

9. [x] **Closeout, pre-push.** Run CLOSEOUT.md: deviations recorded; append exactly the three §Closeout rows (`<exec-date>` = execution date); step 4's fold-in is discharged (Boundary 6); measure the ledger for Verify row 8; archive this plan with Verify rows 11–12 carrying the literal text `deferred: post-push — replaced by the evidence commit`; regenerate STATE.md — Focus: adopt v0.2.0 on the first real projects; Next action: install on the first adoption target — a UI-project test repo (plan review 2026-07-04: the intended test repo is a UI project, so the Design module's visual-evidence bar is exercised from the first loop); name the repo at install time; In flight: none. One commit: `closeout: v0-proof`
   Deviation: Verify row 2's How ("immediately before Task 10's tag") is only satisfiable after this closeout commit exists, so its cell carries a pre-closeout run plus the rows-11/12 deferred pattern; the evidence commit records the actual pre-tag run — a third deferred cell the plan didn't anticipate.

10. [x] **Tag, push, release — in order, stop at any surprise.** `git status` clean → fast gate + `sh adapters/lint_test.sh` (26 ok) + `sh adapters/lint.sh origin/main` (the range-aware BASE form across the whole unpushed delta — its first real use) → `git log --oneline origin/main..HEAD` lists exactly §Publish delta, nothing else → `git tag -a v0.2.0 -m "marrow v0.2.0 — verification duties"` → `git push --dry-run origin main` → `git push origin main` → `git push origin v0.2.0` → `gh auth status`, then `gh release create v0.2.0 --verify-tag --title "marrow v0.2.0"` with the [0.2.0] CHANGELOG section as notes. gh auth gone → skip the release, record the manual step in Verify row 11's evidence, do not block.

11. [x] **Post-push cold verify + evidence commit.** From outside this repo: `git ls-remote --tags origin` lists v0.2.0 → fresh `git clone https://github.com/rishilmysore/marrow.git` → `git checkout v0.2.0` → follow the clone's own README cold: install into a fresh scratch repo, fast gate green inside it → in the cloned files, grep each new line (the Dependencies line, the "never failed proves nothing" sentence, the extended Failure-modes prompt, the "stood in for eyes" line) and confirm `adapters/fresh-verify.md` byte-equal → row 7's deferred claims resolve (clone `--branch v0.2.0`, compare + release URLs). Replace the two `deferred:` cells in the archived plan with real evidence; commit `v0-proof: post-push evidence`; push (Boundary 1 covers it).

## Publish delta (Task 10's review gate — the Appendix-B discipline)

origin/main = b75c0df at plan time. `git log --oneline origin/main..HEAD` must list exactly: `plan: v0-proof`, any `refine:`-prefixed plan commits landed before execution, the Task 1–7 commits by their stated messages, and `closeout: v0-proof`. Anything unexplained is a stop.

## Verify — the gate: cannot close while any row lacks evidence

| Check | How | Evidence |
|---|---|---|
| 1 Fast gate + harness | `sh adapters/lint.sh && ! grep -rn "README" templates/` exit 0; `sh adapters/lint_test.sh` ends exactly `lint-test: 26 ok, 0 failing` — at closeout and before every commit | ran before each of the seven task commits (`marrow-lint: ok` each time); at closeout: `marrow-lint: ok`, fast-gate exit 0, `lint-test: 26 ok, 0 failing` |
| 2 Range-aware pre-push gate | `sh adapters/lint.sh origin/main` → `marrow-lint: ok` across the whole unpushed delta, immediately before Task 10's tag | pre-closeout run over b75c0df..worktree: `marrow-lint: ok`; pre-tag re-run at Task 10, over the full delta b75c0df..cd04dd8 (clean tree): `marrow-lint: ok` — the range-aware BASE form's first real use (deviation under Task 9: a third deferred cell the plan didn't anticipate) |
| 3 Dependency walk | Walk (a): registry output (exact name, current version), invented-name control refused, red→green transcript — pasted or tightly summarized, the walk plan's Verify rows quoted | toy plans/archive/add-picocolors.md, classified risky-novel on the dependency trigger. Registry row: "`name = 'picocolors'` / `version = '1.1.1'`; control `npm view pikocolours-node version` → `npm error code E404 …`, exit 1 — add refused for any name that 404s". Red→green row: "before: `✖ … tests 1, pass 0, fail 1`; after: `✔ … tests 1, pass 1, fail 0`". The E1 line fired as written; the walk's one surprise (picocolors strips ANSI off-TTY) was package behavior, not a defect in the line |
| 4 UI walk | Walk (b): rendered-artifact reference — or the named stand-in per E4's fallback clause — in the walk plan's Verify row, quoted | toy plans/archive/quote-card.md Behavior row: "rendered artifacts: `../shots/quote-card-{light,dark,narrow}.png` (Playwright headless chromium, 900×600 light/dark + 360×640) — inspected: card focal, tokens applied, dark theme inverts paper/ink with lighter accent, 360px reflows without overflow". Renderer existed, so the fallback clause went unexercised (screenshot path taken; fallback not proven false, just unneeded) |
| 5 Security walk | Walk (c): the filled Spec line naming attack surfaces + who abuses them, quoted | toy plans/archive/token-fetch.md Spec, elicited by the extended prompt, its own words: "git history — the surface is every commit; the abuser is anyone who ever clones the repo"; "process table and shell history — the surface is `ps auxe` / `~/.bash_history`; the abuser is any other local user on a shared box"; "stdout/stderr and CI logs — … the abuser is whoever reads the build log". Three surfaces, each with a named abuser and rail |
| 6 fresh-verify walk | Walk (d): the fresh context's manifest (that plan + copied AGENTS.md only) + its returned rows marked `fresh-verify` | subagent manifest: the finished add-picocolors plan + copied AGENTS.md (+ greet.test.js, inspected only because the Red→green row itself demands "test written for this change"). All four rows returned `fresh-verify:`-prefixed and **confirms**; red half correctly identified as author-context-only; one real catch — the Fast-gate cell's `fast gate: ok` string was an author annotation, not command output (substance verified, exit 0) |
| 7 Staleness sweep | The validated public-cut procedure: cold subagent over the finished README.md + CHANGELOG.md + shipped files only (plans/, STATE.md, DECISIONS.md, root AGENTS.md excluded); claim → file:line → verdict table; zero stale after fixes; post-push-only claims deferred → row 12 | cold subagent, full claim → file:line → verdict table returned: **60 claims — 0 stale, 54 ok, 6 deferred post-push** (the v0.2.0 clone/branch, the v0.1.0↔v0.2.0 diff, the three CHANGELOG link refs, the friction-form URL). Zero fixes needed — Rules index confirmed complete as-is (Task 6c call stands). Deferred claims → row 12 |
| 8 Token ledger, measured | At Task 9: `wc -c templates/AGENTS.md templates/plans/_TEMPLATE.md AGENTS.md` vs baselines 3871 / 1591 / 3531; tokens ≈ bytes/4; attribute E1+E2 (every-session), E3 (per-plan), E4 (Design-module) vs estimates 34/37/15/50; Budget trips if every-session > +120 | measured 4362 / 1658 / 3650. Per-edit: E1 156 B ≈ 39 tok, E2 119 B ≈ 29 tok, E4 216 B ≈ 54 tok (sum 491 B = the exact templates/AGENTS.md delta); E3 67 B ≈ 16 tok; root mirror 119 B ≈ 29 tok. Every-session E1+E2 = 275 B ≈ **68 tok ≤ +120 cap**; vs estimates: 39/29/16/54 against 34/37/15/50 | 
| 9 Mirror parity + frozen lines | `grep -c "never failed proves nothing" AGENTS.md templates/AGENTS.md` → 1 and 1; `grep -c "Dependencies: verify" AGENTS.md templates/AGENTS.md` → 0 and 1; `grep -c "stood in for eyes" AGENTS.md templates/AGENTS.md` → 0 and 1; each Boundary-3 frozen line found verbatim by `grep -F` | parity exactly as required: 1/1, 0/1, 0/1. `grep -F` found each frozen line, count 1, in every owning file: the Verify heading + `\| Check \| How \| Evidence \|` and the three untouched Spec prompts in _TEMPLATE.md; `Claiming "done" …` in templates/AGENTS.md; reclassify, handoff, context-diet, vendor lines in both AGENTS.md | 
| 10 Scope freeze | `git diff b75c0df..HEAD --stat` lists only Context's touch list plus plans/ moves; `git diff b75c0df..HEAD -- templates/STATE.md templates/DECISIONS.md templates/CLOSEOUT.md adapters/lint.sh adapters/lint_test.sh LICENSE CLAUDE.md .github/` prints nothing | stat at Task 9: AGENTS.md, CHANGELOG.md, README.md, STATE.md, adapters/fresh-verify.md, plans/v0-proof.md, templates/AGENTS.md, templates/plans/_TEMPLATE.md — all in Context's list (DECISIONS.md + archive move land in the closeout commit). Frozen-set diff: 0 bytes | 
| 11 Tag + release published | `git ls-remote --tags origin` shows v0.2.0; push output; release URL via `--verify-tag` (or the recorded manual step) | ls-remote: `10eb564… refs/tags/v0.2.0` (annotated, on `cd04dd8… v0.2.0^{}`); push output `b75c0df..cd04dd8 main -> main` and `* [new tag] v0.2.0 -> v0.2.0`; `gh release create v0.2.0 --verify-tag` returned https://github.com/rishilmysore/marrow/releases/tag/v0.2.0 with the [0.2.0] CHANGELOG section as notes |
| 12 Cold clone carries the cut | Fresh clone at v0.2.0 outside this repo: README-cold install lint-green in a scratch repo; every new line greps in the cloned files; fresh-verify.md byte-equal; row 7's deferred claims resolve | fresh clone + `git checkout v0.2.0` → `git describe` = v0.2.0; README-cold install (templates + adapters into a fresh git-init scratch repo, markers pinned) → `marrow-lint: ok`, exit 0; all four new lines grep count 1 in the cloned templates; cloned adapters/fresh-verify.md byte-equal to the working copy (`diff` silent). Row 7's deferrals resolve: `git clone --branch v0.2.0` lands on v0.2.0; compare/v0.2.0...HEAD, both release URLs, and the friction-form URL all HTTP 200 |

## Budget

Stop if: any old block above mismatches the baseline bytes (beyond the two pre-resolved adaptations: the root E2 variant, the m-1 provenance date); any walk exposes a shipped line as wrong — not merely unexercised — before Task 9; every-session ledger delta exceeds +120 tokens; Task 10's log review shows any commit outside §Publish delta; any push is rejected (never retry with force); 3 failed attempts on the same walk or check.
Tripped → record it here, add a STATE.md blocker, ask before continuing.

## Closeout

Run CLOSEOUT.md (Task 9 sequences it against the push). Append exactly these three rows, `<exec-date>` = execution date; substance fixed, wording may tighten; they consume the ≤3-row budget:

| <exec-date> | v0.2.0 adds verification duties from a two-pass research audit — dependency-existence check, red→green test evidence, threat naming in the security-sensitive Spec prompt, a visual-evidence bar in the Design module, the fresh-verify adapter; shipped pre-adoption deliberately: the dependency failure class cannot surface in friendly adoption, and the UI adoption should test Design as it ships | plans/archive/v0-proof.md Spec |

| <exec-date> | Rejected routing verification lessons into DECISIONS.md (research candidate C4): this log records decisions, not lessons — archived plans' Verify tables already hold what verification caught, and a lesson-fed append-only log outgrows its epoch mechanism | plans/archive/v0-proof.md Spec |

| <exec-date> | The dependency-existence check is a verification duty, not classification ceremony — the m-1 deferral on the risky-novel "dependency" trigger stands unchanged | engages the DECISIONS m-1 row, 2026-07-03 |

Plan-time deviation, recorded: the mission cited the m-1 row as 2026-07-04; DECISIONS.md dates it 2026-07-03 (appended at the v0-edges closeout). The third row cites the actual date.
