# Plan: public-cut

<!-- marrow v0 — written for an executor with NO other context: fresh session, this file + AGENTS.md only.
     Trivial tasks don't get plans. Risky-novel work fills Spec before Tasks. -->

**Intent:** Ship this repo to an arbitrary developer: a README that onboards a newcomer cold, a versioning scheme with first public tag v0.1.0 plus CHANGELOG.md, a friction-report feedback channel, everything pushed to origin. This plan deliberately carries decisions, acceptance criteria, and gates — never README prose; authorship is the executor's. Judgment calls are expected: record them as `Deviation:` lines, they are welcome data, not failures.

**Class:** risky-novel — new external surface (the entire adopter-facing contract: tag, versioning policy, feedback channel), an irreversible act (a published tag adopters pin; never force-push), and nothing in the repo to pattern-match against (no prior release).

## Success criteria (must be TRUE at close)

1. A cold subagent holding only the README answers every §Battery question correctly with a README citation — or each residual is recorded with a reason (Verify row 5).
2. `git ls-remote --tags origin` lists v0.1.0, and a fresh clone from origin at that tag, following its own README cold, produces a lint-green install (Verify rows 7–8).
3. Every mechanical claim in the shipped README and CHANGELOG verifies against the file it describes — and the pre-edit README's known-stale claim was caught blind by the sweep control before any edit (Verify rows 2–3).
4. The versioning policy settled in Spec is adopter-visible in the README; CHANGELOG.md follows Keep a Changelog with a [0.1.0] entry, mirrored as a GitHub release (or the manual step recorded in Verify row 7).
5. Filing an adoption report requires only what the README's feedback section points at, and the form captures all three instrumentation fields (§Instrumentation).
6. templates/ and adapters/ are byte-identical to the plan commit; fast gate and harness stay green (Verify rows 1, 4).

## Spec (risky-novel)

- Unknowns to resolve first: none open — resolved at plan time: origin = github.com/rishilmysore/marrow, PUBLIC, issues enabled; `gh` authenticated (rishilmysore, repo scope) — re-verify at execution; no tags exist; 12 commits unpushed, all one audit cycle (Appendix B); the canary confirmed live (Appendix A — sealed until Task 1 says otherwise).
- Approach chosen + alternatives rejected (one line why each):
  - First public tag **v0.1.0**: tags are adopter-facing contract cuts and no adopter ever saw the three internal iterations (plans/archive/ v0-hardening, v0-teeth, v0-edges). Rejected v0.4.0 honoring them — it mints anchors nobody vendored and CHANGELOG entries restating what git and plans/archive/ already own.
  - **The version numbers the adopter contract**: the file contract (the five templates' names and roles), the loop (five stages, three classes and their membership), lint (`sh adapters/lint.sh [BASE]` invocation, check semantics, exit discipline), and the marker convention (`marrow v0 @ <anchor>`). MAJOR = a vendored instance or its upgrade path breaks without manual rework — file rename/removal/re-role, incompatible stage or class semantics, marker format change, lint invocation change; the marker's `v0` is the major and moves with it. MINOR = compatible additions and tightenings — new template file or section, new class, new lint check, added doctrine that doesn't invalidate past work. PATCH = changes no obligation — wording, guidance, lint false-positive fixes. 0.x rider: breaking changes may land in MINOR only, never PATCH, each flagged **Breaking** with a one-line migration in its CHANGELOG entry. Rejected API-SemVer language verbatim — adopters depend on files and doctrine, not symbols; the policy must name what actually breaks them.
  - **Lint tightening is MINOR** with the policy stated where adopters look (README versioning section; per-check flags in CHANGELOG entries): distribution is pull-based vendoring, so a new check — check 0 is the live example — can never fail an adopter's CI spontaneously; it arrives only inside an upgrade diff they chose to apply, and the CHANGELOG entry names each new check with a one-line remediation. Rejected MAJOR-per-tightening — under vendoring it protects nobody and either freezes lint or debases MAJOR.
  - **1.0 criteria** (so 0.x can't drift forever): promote when (a) ≥3 independent real adoptions have each filed ≥1 instrumented report from a completed loop, (b) two consecutive MINOR releases changed no template file's name or role, and (c) ≥1 adopter has run the marker-diff upgrade across a release boundary and reported it workable.
  - **Feedback channel = one GitHub issue form** at .github/ISSUE_TEMPLATE/friction-report.yml speaking §Instrumentation. Rejected a bare "open an issue" line — unstructured reports lose the per-field comparability the instrumentation exists for. Rejected Discussions or external forms — a second surface with no vendoring story.
  - **CHANGELOG.md per Keep a Changelog 1.1**: `## [Unreleased]` plus one `## [x.y.z] - date` per tag, written for adopters (what changed in what they vendored); the internal why stays in DECISIONS.md and plans/archive/ — no restating.
- Failure modes / threats designed against:
  - The repo's recurring bug class — prose about shipped files going stale (three prior instances, one live now): every mechanical claim points at its file or quotes it minimally; the sweep control (Task 1) must catch the live instance blind before the sweep is trusted on the finished docs.
  - Publishing the wrong thing (irreversible): tag only after the closeout commit; re-review the unpushed log against Appendix B; `git push --dry-run` first; annotated tag; never force-push. Defect found post-push → fix forward in a PATCH release; tags are never deleted or moved.
  - README onboarding leak: the newcomer test runs on a cold `sonnet` subagent restricted to the README; every wrong or unanswerable battery answer is a doc defect — fix and rerun until clean, or record the accepted residual with a reason.
  - Archive invariant vs. push ordering: the closeout commit precedes the push, so push evidence cannot exist at archive time, and lint rejects blank Evidence cells in plans/archive/. Resolved explicitly: at archive time Verify rows 7–8 carry the literal text `deferred: post-push — replaced by the evidence commit` (non-blank, lint-green); Task 9's evidence commit replaces it and is inside Boundary 1's push scope.
- Rollback if it ships broken: everything before Task 8's push is ordinary `git revert` territory — nothing is public until the push. After the push, docs fix forward in a PATCH; a published tag has no rollback, which is why Task 8 is last and gated.

## Context

- Files this plan may touch, exhaustively: README.md (restructure/extend), CHANGELOG.md (new), .github/ISSUE_TEMPLATE/friction-report.yml (new), STATE.md + DECISIONS.md + this file (closeout mechanics). Frozen: templates/*, adapters/*, LICENSE, CLAUDE.md (hook-guarded); AGENTS.md only via CLOSEOUT step 4 fold-in (Task 7).
- Versioning needs zero shipped-file changes: templates carry the bare `<!-- marrow v0 -->` marker; the anchor format (`marrow v0 @ <anchor>`) is described only in the README, and any git ref — a tag included — already works as an anchor. Updating that README sentence to name tags is sanctioned and required by criterion b.
- The first upstream delta is real: `git diff 21022d2..HEAD -- templates/ adapters/` touches templates/AGENTS.md, templates/STATE.md, adapters/lint.sh, adapters/lint_test.sh — the upgrade workflow (criterion f) has a live subject. Citing the concrete example in the README is the executor's call; a hardcoded commit id is itself a mechanical claim that ages — prefer the generic workflow.
- Binding constraints (AGENTS.md + user instruction 2026-07-04):
  - Fast gate `sh adapters/lint.sh && ! grep -rn "README" templates/`; harness `sh adapters/lint_test.sh` ends exactly `lint-test: 26 ok, 0 failing`.
  - Point, don't restate: the README explains what marrow is, why the loop works, when to use what — in its own words; every mechanical claim about a shipped file's content or behavior quotes it minimally or points at it. A paraphrased rule is a future silent lie.
  - Register: terse, confident, concrete — the existing README's voice. No badge walls, no emoji, no marketing cadence. Quickstart lands in the first screen.
  - Surviving content (reword fine, weaken not): the Install section's audit-hardened content — stash-first cp warning, merge into the template's sections / don't keep both, violated-rule-stays + filed as STATE.md Next action, TODO and `<Project>` title fill, marker append, commit-the-install, the Claude Code harness note — plus the three layers, the loop digest, the Rules index, the Lineage table.
  - History lives in git; docs describe the present; no document restates another.
- Handoff-leak log: if executing requires information absent from this file + AGENTS.md + the repo's own files, that is a handoff leak — record a `Deviation:` line under the task. README prose judgment calls are expected authorship, not leaks.

## Boundaries

1. **Push is authorized for this plan only** — explicit user instruction, 2026-07-04, recorded here so the executor does not blocker on AGENTS.md's "Never push without being asked": this is the being-asked. Scope: `git push origin main` (the release push and Task 9's evidence commit), `git push origin v0.1.0`, and the `gh release create` mirror. Never `--force` in any form. The standing boundary is unchanged for every future plan.
2. Ordering is fixed: closeout commit → annotated tag → log review + dry-run → push → GitHub release → post-push verification → evidence commit → final push. Nothing publishes before the closeout commit exists.
3. templates/ and adapters/ stay byte-identical (Verify row 4). If any criterion seems to require touching them: stop — scope change, STATE.md blocker, ask.
4. New files: CHANGELOG.md and .github/ISSUE_TEMPLATE/friction-report.yml. Nothing else new, root or otherwise.
5. This plan pre-writes no README prose; coverage criteria + battery are the acceptance test, structure and words are the executor's.

## Coverage criteria (the README's acceptance — from the README alone, a newcomer can)

- a. Say what marrow is and is not, and who it is for, in two sentences.
- b. Install into an existing repo — the pre-existing-AGENTS.md merge path and the violated-rule handling included — pinning every copied file's marker to the new tag.
- c. Wire each of three harnesses: Claude Code (pointer file + the session-start caveat); a Codex/GPT-family agent that reads AGENTS.md by convention (correct answer: nothing extra — the README must say so); a bare loop with no harness affordances (feed AGENTS.md each session; run lint by hand or in CI).
- d. Run one full loop — classify, plan, execute, verify, distill — and explain the two-session handoff and why contexts stay fresh.
- e. Say when lint actually has teeth and where (pre-commit vs CI, the BASE argument), and where the exact wiring one-liner lives (lint.sh's header — point, don't restate).
- f. Upgrade later: read the marker anchor, diff anchor→new tag scoped to templates/, hand-apply, re-anchor markers.
- g. Know the project is 0.x seeking real-adoption reports, what to file (§Instrumentation) and where, and that these reports decide what changes.

## Instrumentation (for the README feedback section and the form — "leak" is in-repo vocabulary, plans/archive/v0-edges.md; the other two extend it to adoption)

- **Friction point** — a step that worked but fought you: you did what the doc said and it cost more than it should have.
- **Moment of silence** — the doctrine went quiet: the loop raised a question and no shipped file answered it.
- **Leak count** — handoff leaks per plan: times an executor needed information the plan + AGENTS.md should have carried but didn't (the plan's `Deviation:` lines of that kind, counted).

Form fields (friction-report.yml; labels and wording are the executor's): marrow version (tag) + marker anchor; harness; what you were doing (install / upgrade / a loop stage); friction points (numbered); moments of silence; leak count (number) + what leaked; anything you changed locally to proceed. Only version + harness required — a report with one filled field beats no report.

## Battery (Verify row 5 — at least one question per criterion; pass = correct answer + README citation)


| #   | Crit. | Question                                                                                                                                                                                                                                                                   |
| --- | ----- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | a     | In two sentences: what is marrow, what is it not, and who is it for?                                                                                                                                                                                                       |
| 2   | b     | Your repo already has an AGENTS.md with house rules, one of which the code currently violates. Walk the install: what do you run first, what happens to your existing AGENTS.md, what do you do with the violated rule, and what do you fill, seed, and commit at the end? |
| 3   | b     | You installed from tag v0.1.0 — what exactly does the marker line in each copied file say?                                                                                                                                                                                 |
| 4   | c     | Claude Code: what wiring beyond the copy does the README require, and when do AGENTS.md edits take effect?                                                                                                                                                                 |
| 5   | c     | Your agent already reads AGENTS.md by convention (Codex-family): what extra wiring does it need?                                                                                                                                                                           |
| 6   | c     | Bare API loop, no harness affordances: how does the agent pick the framework up each session, and how does lint run with no hook support?                                                                                                                                  |
| 7   | d     | A task arrives: add rate limiting to your API — three files and a new dependency. Classify it, name the file you create next, and say where it gets listed.                                                                                                                |
| 8   | d     | Why must the plan be written in one session and executed in a fresh one — and what single artifact carries the handoff?                                                                                                                                                    |
| 9   | e     | Where does the append-only check have teeth — pre-commit or CI — and what invocation makes it range-aware in CI? Where is the exact wiring one-liner?                                                                                                                      |
| 10  | f     | Marrow tags v0.2.0; your files say `marrow v0 @ v0.1.0`. Give the commands that show what changed in what you vendored, and what you update after applying.                                                                                                                |
| 11  | g     | Mid-loop the doctrine went quiet twice and your executor logged two handoff leaks. Where do you report this, in what fields, and why believe it changes anything?                                                                                                          |
| 12  | g     | Is marrow stable? What does 0.x mean here, and what promotes it to 1.0?                                                                                                                                                                                                    |


## Tasks

<!-- One atomic commit each, imperative mood. Fast gate before every commit. Record deviations inline. -->

1. [x] **Sweep control — before any README edit.** Enumerate every mechanical claim in README.md as of the plan commit (any statement about a shipped file's content, behavior, count, or command) into a table: claim → file:line it describes → verdict. At least one claim must come up stale; if none does, the sweep is broken — fix the procedure and rerun before trusting it. Then, and only then, open Appendix A and confirm the sealed canary is among the findings; if it is not, same rule: fix the sweep, rerun. Paste the table into Verify row 2. No commit — the stale line is fixed by Task 2's authorship, not a spot-edit.
   - Deviation: reading this plan file exposed Appendix A to the executor before the sweep ran — the seal cannot survive a full-file read. Mitigation: the sweep ran on a cold subagent given only README.md + shipped files (plans/, STATE.md, DECISIONS.md, AGENTS.md excluded), restoring the blind property; the executor only cross-checked its findings against Appendix A afterward.
   - Deviation: Appendix B expected 12 unpushed commits at execution; origin/main was already at 4bf77c9 (the 12 + this plan's own 2 commits, pushed outside this session between plan time and execution). Log matches Appendix B + plan commits exactly; no tags on the remote — the irreversible act is still ahead. Not a Budget stop (that triggers on unexplained commits); Task 8 ordering still governs the tag.
2. [x] **README.** Restructure and extend to meet every coverage criterion a–g under the Context constraints (register, surviving content, point-don't-restate, quickstart in the first screen). New ground the current file lacks: quickstart, the two non-Claude harness paths, the versioning policy (from Spec, adopter-visible), the upgrade workflow, the feedback section (0.x status, §Instrumentation, pointer to the form). Commit: `README: onboard a cold adopter — quickstart, harnesses, versioning, upgrade, feedback`
3. [ ] **CHANGELOG.md.** Keep a Changelog 1.1: `## [Unreleased]` (empty) and `## [0.1.0] - <exec-date>` describing what an adopter vendors at this cut — the five templates, the loop, the lint adapter and its BASE argument, the marker convention — adopter-facing, no internal narrative. Commit: `CHANGELOG: 0.1.0 — first public cut`
4. [ ] **Friction-report form.** Write .github/ISSUE_TEMPLATE/friction-report.yml per §Instrumentation and §Form fields, GitHub issue-form schema. Validation bar: a YAML parse (any parser at hand) plus a field-by-field check against the schema docs; the rendered form is re-checked live in Task 9. Commit: `feedback: friction-report issue form`
5. [ ] **Staleness sweep — finished docs.** Rerun the Task-1-validated procedure over the finished README and CHANGELOG. Every mechanical claim verifies against its file or gets pointerized; zero stale. Paste the final table into Verify row 3. Fix-commits as needed: `README: de-stale <claim>`
6. [ ] **Newcomer leak test.** Build the fixture: a scratch repo (2–3 file toy project) whose pre-existing AGENTS.md carries ~3 house rules, one visibly violated by the code (e.g. "every script sets `set -euo pipefail`" while build.sh doesn't). Spawn a fresh subagent pinned to model `sonnet` with: a clone of this working repo (local path — nothing is pushed yet), instructions to use ONLY README.md for guidance (other files only as install materials or where the README directs), the cold install into the fixture, then the full §Battery answered with a README citation per question. Every wrong or unanswerable answer is a doc defect: fix the README, rerun failed questions on a fresh subagent, repeat until clean — or record the accepted residual with a reason. Also verify the installed fixture: one merged AGENTS.md (house rules + marrow's, not two files), the violated rule handled exactly as the README documents, markers anchored `marrow v0 @ v0.1.0`, `marrow-lint: ok` inside the fixture. Evidence → Verify rows 5–6.
7. [ ] **Closeout, pre-push.** Run CLOSEOUT.md: deviations recorded; append exactly the three DECISIONS rows from §Closeout; fold-in judgment per CLOSEOUT step 4 (suggested, executor decides: one root-AGENTS.md Conventions line — a tag ships with its CHANGELOG entry and GitHub release); archive this plan with every Evidence cell non-blank — rows 7–8 carry the literal text `deferred: post-push — replaced by the evidence commit`; regenerate STATE.md (Focus: real-adoption watch; Next action: triage the first friction report or leak-count filing; In flight: none). One closeout commit.
8. [ ] **Tag, push, release — in order, stop at any surprise.** `git status` clean → `git log --oneline origin/main..HEAD` matches Appendix B plus exactly this plan's own commits → `git tag -a v0.1.0 -m "marrow v0.1.0 — first public cut"` → `git push --dry-run origin main` (remote + auth sanity) → `git push origin main` → `git push origin v0.1.0` → `gh auth status`, then `gh release create v0.1.0 --verify-tag --title "marrow v0.1.0"` with the [0.1.0] CHANGELOG section as notes. If gh auth is gone: skip the release, record the manual step in Verify row 7 evidence, do not block.
9. [ ] **Post-push cold verify + evidence commit.** From a directory outside this repo: `git ls-remote --tags origin` lists v0.1.0; fresh `git clone https://github.com/rishilmysore/marrow.git`; `git checkout v0.1.0`; follow the README install cold into a second scratch repo; fast gate green inside it; confirm the friction-report form renders on GitHub's new-issue page. Then replace the two `deferred:` cells in the archived plan with the real evidence, commit `public-cut: post-push evidence`, push it (Boundary 1 covers this push).

## Verify — the gate: cannot close while any row lacks evidence


| Check                             | How                                                                                                                                      | Evidence |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| 1 Fast gate + harness             | `sh adapters/lint.sh && ! grep -rn "README" templates/` exits 0; `sh adapters/lint_test.sh` ends `lint-test: 26 ok, 0 failing`           |          |
| 2 Sweep control caught the canary | Task 1's table pasted; ≥1 stale claim found blind; Appendix A cross-check passed                                                         | Table at §Evidence — Task 1 below: 27 verified, 2 stale, 3 unverifiable. Both stales = README:40 (check count "three"→four; "CI…checks 1–2 still hold" ignores BASE arg) — found blind by a cold subagent (no plans/ access); Appendix A cross-check: exactly the canary. ✓ |
| 3 Finished docs sweep clean       | Task 5's claim → file:line → verdict table; zero stale                                                                                   |          |
| 4 Shipped files untouched         | `git diff <plan-commit>..HEAD --stat -- templates/ adapters/` prints nothing                                                             |          |
| 5 Newcomer battery                | Per question: subagent's answer + README citation + verdict; defects fixed and rerun clean, or residuals recorded with reasons           |          |
| 6 Fixture install sound           | Merged AGENTS.md; violated rule handled per the README's documented path; markers `marrow v0 @ v0.1.0`; `marrow-lint: ok` in the fixture |          |
| 7 Tag + release published         | `git ls-remote --tags origin` shows v0.1.0; push output; release URL (or the recorded manual step)                                       |          |
| 8 Cold clone installs             | Fresh clone at v0.1.0, README-only install transcript summary, fast gate green, issue form renders                                       |          |


## Budget

Stop if: the sweep control misses the canary twice (one procedure fix is allowed); the same battery question still fails after 3 README fix cycles; any fix appears to require touching templates/ or adapters/; the pre-push log review shows any commit not in Appendix B + this plan's own; any push is rejected (never retry with force). Tripped → record it here, add a STATE.md blocker, ask before continuing.

## Closeout

Run CLOSEOUT.md (Task 7 sequences it against the push). Append exactly these three rows, `<exec-date>` = execution date; they consume the ≤3-row budget, the mandatory versioning row first:

| <exec-date> | Version = the adopter contract (five template files' names+roles, loop stages+classes, lint invocation+checks, marker convention); first public tag v0.1.0, internal iterations stay untagged; lint tightening is MINOR, flagged per-check in CHANGELOG; 1.0 at ≥3 instrumented adoptions + two file-contract-stable MINORs + one real marker-diff upgrade | plans/archive/public-cut.md Spec; adopter-visible in the README versioning section |

| <exec-date> | Pushed to origin under explicit one-plan authorization; the standing never-push boundary is unchanged | user instruction 2026-07-04, recorded in plans/archive/public-cut.md Boundaries |

| <exec-date> | Adoption feedback = one GitHub issue form speaking the instrumentation vocabulary (friction points, moments of silence, leak count) | .github/ISSUE_TEMPLATE/friction-report.yml; unstructured issues lose per-field comparability |

## Evidence — Task 1 sweep (Verify row 2; procedure: cold subagent, README.md + shipped files only, plans/ STATE.md DECISIONS.md AGENTS.md excluded)

| # | README line | Claim | Describes | Verdict |
|---|---|---|---|---|
| 1 | 3 | five files | templates/ (5 .md files) | VERIFIED |
| 2 | 5 | markdown you copy into a repo | templates/* | VERIFIED |
| 3 | 10 | harness layer = AGENTS.md: build/run/prove, boundaries, quirks | templates/AGENTS.md:25-47,64-68 | VERIFIED |
| 4 | 11 | loop: fresh context, evidence gate, distill+GC at close | AGENTS.md:20, _TEMPLATE.md:38, CLOSEOUT.md:5,9 | VERIFIED |
| 5 | 15 | classify → plan → execute → verify → distill | templates/AGENTS.md:17 | VERIFIED |
| 6 | 17 | three classes, ceremony scales | templates/AGENTS.md:17-21 | VERIFIED |
| 7 | 17 | plans written for executor with no other context | templates/plans/_TEMPLATE.md:3 | VERIFIED |
| 8 | 17 | cannot close while any Verify row lacks evidence | _TEMPLATE.md:38, CLOSEOUT.md:7 | VERIFIED |
| 9 | 17 | closing runs CLOSEOUT: distill, archive, regenerate, prune | templates/CLOSEOUT.md:9,11,12,13 | VERIFIED |
| 10 | 17 | AGENTS.md owns operational definitions | templates/AGENTS.md:15-23 | VERIFIED |
| 11 | 21 | each rule ships in the file that owns it | rows 12–17 | VERIFIED (rules 3–6 live in AGENTS.md body, not header) |
| 12 | 23 | STATE.md regenerated, never appended, hard-capped | templates/STATE.md:3-4 | VERIFIED |
| 13 | 24 | DECISIONS.md append-only; current rules fold into AGENTS.md | templates/DECISIONS.md:3-5 | VERIFIED |
| 14 | 25 | history in git; docs describe present | templates/AGENTS.md:56 | VERIFIED |
| 15 | 26 | no document restates another | templates/AGENTS.md:56 | VERIFIED |
| 16 | 27 | ceremony scales by classify rule | templates/AGENTS.md:17 | VERIFIED |
| 17 | 28 | vendor what you adopt | templates/AGENTS.md:57 | VERIFIED |
| 18 | 33 | `cp -r templates/* your-project/` | ran it — copies all 5 | VERIFIED |
| 19 | 36 | cp overwrites existing AGENTS.md, destroys uncommitted edits | tested | VERIFIED |
| 20 | 36 | Claude Code: CLAUDE.md with @AGENTS.md, import guaranteed | external harness | UNVERIFIABLE |
| 21 | 36 | marker `marrow v0`, `@ abc1234` once appended | all 5 templates line 3 | VERIFIED |
| 22 | 36 | fill TODO markers + `<Project>` title | templates/AGENTS.md:1 +12 TODOs | VERIFIED |
| 23 | 36 | seed STATE.md Focus and Next action | templates/STATE.md:6-7 | VERIFIED |
| 24 | 38 | Claude Code reads AGENTS.md once at session start | external harness | UNVERIFIABLE |
| 25 | 40 | adapters/lint.sh, POSIX | adapters/lint.sh:1; 26 harness cases green under sh | VERIFIED |
| 26 | 40 | "three mechanical invariants — state cap, evidence-gated archives, append-only decisions" | adapters/lint.sh:12-61 | **STALE** — four checks, 0–3; check 0 (live instance carries STATE.md, lint.sh:12-15) uncounted |
| 27 | 40 | append-only check compares worktree against HEAD | adapters/lint.sh:8,50-51 | VERIFIED (default invocation) |
| 28 | 40 | "only has teeth before the commit lands; as a CI step, checks 1–2 still hold" | adapters/lint.sh:5,8 | **STALE** — header documents `sh adapters/lint.sh origin/main`; with BASE, check 3 is range-aware (lint_test.sh BASE=HEAD~1 case); no-arg CI holds 0–2, not "1–2" |
| 29 | 40 | one-line hook command in its header | adapters/lint.sh:4 | VERIFIED |
| 30 | 40 | lint_test.sh keeps the check honest | ran: `lint-test: 26 ok, 0 failing` | VERIFIED |
| 31 | 42 | root files are the live instance; archive holds worked examples | repo root; plans/archive/ (3 files) | VERIFIED |
| 32 | 50 | lineage counts (e.g. GSD ~70 commands) | third-party frameworks | UNVERIFIABLE |

## Appendix A — SEALED: read only when Task 1 directs

The live stale claim Task 1's control must have caught blind: README.md line 40 — "a POSIX check of the three mechanical invariants — state cap, evidence-gated archives, append-only decisions", and in the same paragraph "as a CI step, checks 1–2 still hold". Both predate lint's newest check — check 0, a live instance must carry STATE.md (commit 723078c). adapters/lint.sh now runs four checks, 0–3, and its header documents the CI form `sh adapters/lint.sh origin/main`, under which check 3 is range-aware too.

## Appendix B — the 12 commits that publish (origin/main = 21022d2 at plan time)

```
0b710b0 closeout: v0-edges
168ac96 README: harness note — AGENTS.md edits land next session
847330a install: README six-gap path; template title TODO; In-flight empty state
9534a9b AGENTS: commit the plan before executing
31d7801 STATE: changing the hard cap requires a DECISIONS.md row
9fd6b58 AGENTS: mid-execution reclassify path to risky-novel
6c14662 lint: evidence gate reaches nested archive dirs
723078c lint: a live instance must carry STATE.md
220426f lint: epoch moves are all-or-nothing
3c8555b lint: BASE argument makes check 3 range-aware; README scopes the CI claim
c4f45c6 lint: exempt the DECISIONS placeholder row from append-only
9c4430e plan: v0-edges
```

Plus this plan's own commits. Re-run `git log --oneline origin/main..HEAD` before pushing; any unexplained line is a stop.