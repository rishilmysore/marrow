# Plan: v0-teeth

<!-- marrow v0 — written for an executor with NO other context: fresh session, this file + AGENTS.md only.
     Trivial tasks don't get plans. Risky-novel work fills Spec before Tasks. -->

**Intent:** Close the 2026-07-03 second audit: lint.sh passed 5 of 6 seeded violations and fails the documented abandon path; `risky-novel` has no membership criterion; four doctrine gaps (AGENTS.md unbounded growth, in-flight registration, parallel closeouts, pin/install wording). Make enforcement match doctrine exactly.
**Class:** risky-novel

## Success criteria (must be TRUE at close)

1. adapters/lint_test.sh is green against the new lint.sh, and against the pre-fix lint.sh the audit holes show red — the harness provably detects them.
2. A plan abandoned per CLOSEOUT.md archives without failing the lint.
3. The copied template set answers "what makes a task risky-novel?" and "when does a plan enter STATE.md In flight?"
4. Every numeric limit has one owner: the state cap lives in STATE.md's header only; lint parses it and fails loud if the phrase is missing.
5. templates/ net growth ≤ +8 lines; no harness-specific syntax enters templates/.

## Spec

- Unknowns to resolve first: POSIX portability of the table-parsing awk on this system's sh/awk; `git cat-file -e` must skip (not crash) outside a repo or before the first commit.
- Approach chosen + alternatives rejected:
  - Abandon path writes `abandoned` in empty Evidence cells — invariant stays absolute. Rejected: lint exemption marker (conditional invariant, more code).
  - Lint parses the cap from STATE.md's header, fails loud if absent. Rejected: hardcode with STATE.md deferring to lint (STATE.md must stand alone for adopters who skip adapters/).
  - Append-only = any row leaving DECISIONS.md (worktree vs HEAD) must reappear verbatim in decisions/archive-*. Rejected: keeping `--cached` scope (blind to unstaged edits) and the staged-archive exemption (lets deletions smuggle through).
- Failure modes / threats designed against: false negatives (one harness case per audit hole); false positive on abandonment (explicit case); silent skip when the cap phrase is missing (fail-loud); escaped pipes inside table cells shifting the Evidence column (gsub before split); user git config (gpg signing) breaking harness scratch repos (GIT_CONFIG_GLOBAL=/dev/null).
- Rollback if it ships broken: `git revert` the adapters commit — doc commits stand alone.

## Context

- Files / entry points: adapters/lint.sh (rewrite), adapters/lint_test.sh (new), templates/{AGENTS,CLOSEOUT,DECISIONS}.md, root AGENTS.md, root DECISIONS.md (header sync only), README.md.
- Binding constraints (from AGENTS.md / DECISIONS.md): templates/ agent-agnostic and never contain the word README; one fact, one owner; every line earns its place; DECISIONS.md rows append-only.

## Tasks

<!-- One atomic commit each. Record deviations inline as they happen. -->

1. [x] adapters/lint_test.sh (new, 20 cases) + adapters/lint.sh rewrite: cap parsed from header, line count survives missing trailing newline; evidence gate = Verify section exists, Evidence column located, ≥1 data row, no blank Evidence cell (trailing pipe optional, escaped pipes safe); append-only = rows removed from DECISIONS.md must appear verbatim in decisions/archive-*. Run the harness against the old lint first; record the red count. (4ffa7b3)
2. [x] templates/AGENTS.md + root AGENTS.md: risky-novel membership criterion (new external surface, irreversible data change, security-sensitive, or no repo pattern); multi-file bullet gains "list it in STATE.md In flight"; parallel bullet gains "closeouts land serially; DECISIONS.md append conflicts resolve as keep-both". Root only: boundary reworded to match the grep exactly; Verification gains the adapter-changes proof (`sh adapters/lint_test.sh`). (1780730)
3. [x] templates/CLOSEOUT.md: abandon path writes `abandoned` in each empty Evidence cell; step 7 prune reaches lines "no longer earning its place — AGENTS.md included"; step 8 moves 40+ rows verbatim to decisions/archive-<year>.md ("rows", not "entries"; still-binding rules are already in AGENTS.md via step 4). (4462f8e)
4. [x] templates/DECISIONS.md + root DECISIONS.md: placeholder instruction moves from the persistent header into the placeholder row it describes; root header synced to template. (da360f6)
5. [x] README.md: install order (stash before `cp`); marker pins the source commit (`marrow v0 @ <commit>`); pre-commit wiring pointer (the literal command lives in lint.sh's header). (d574a3d)
   - **Deviation:** planned and executed in one session — the audit that produced this plan was the planning context, and the plan was complete before the first edit. The fresh-context rule's intent (no reliance on unwritten context) held; the letter did not.

## Verify — the gate: cannot close while any row lacks evidence

| Check | How | Evidence |
|---|---|---|
| Fast gate | `sh adapters/lint.sh && ! grep -rn "README" templates/` | `marrow-lint: ok`; grep empty — run after every task commit and at close |
| Lint teeth, red | new harness vs pre-fix lint.sh: every audit hole red | 9 of 20 red: unterminated-line cap, missing cap phrase, raised cap honored, missing Evidence cell, no Verify section, no data rows, unstaged deletion, in-place edit, archive smuggle |
| Lint teeth, green | `sh adapters/lint_test.sh` after the rewrite: all cases ok | `lint-test: 20 ok, 0 failing` |
| Self-containment | fresh `cp -r templates/*` to scratch: risky-novel criterion + In-flight rule present; lint ok on the copy | criterion, In-flight registration, serial closeouts, abandon-fill each found once; zero README refs; `marrow-lint: ok` on the copy |
| Growth budget | `git diff --stat` on templates/ vs the +8-line cap | bb00ac0..HEAD templates/: 12 insertions, 13 deletions = net −1; adapters 173 lines (cap 180) |

## Budget

Stop if: templates/ net growth would exceed +8 lines; lint.sh + lint_test.sh together exceed 180 lines; any fix needs harness-specific syntax inside templates/.
Tripped → record it here, add a STATE.md blocker, ask before continuing.

## Closeout

Run CLOSEOUT.md. Distilled line(s) destined for DECISIONS.md:

- abandoned plans write `abandoned` in empty Evidence cells — the archive invariant stays absolute
- risky-novel = wrong-step-expensive: new external surface, irreversible data, security-sensitive, or no repo pattern
- lint derives what docs own (cap from STATE.md header); removed DECISIONS rows must reappear verbatim in the archive
