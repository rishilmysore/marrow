# Plan: v0-edges

<!-- marrow v0 — written for an executor with NO other context: fresh session, this file + AGENTS.md only.
     Trivial tasks don't get plans. Risky-novel work fills Spec before Tasks. -->

**Intent:** Close the third self-audit: ten accepted findings hardening the framework's edges — a fresh install's first closeout, CI enforcement, epoch moves, the install path, mid-flight reclassification. Every edit is embedded verbatim below; if executing requires information not in this file + AGENTS.md, that is a handoff leak — log it (see Context).
**Class:** risky-novel — adapters/lint.sh gains a CLI argument (`BASE`), a new external surface adopters' CI will call.

## Success criteria (must be TRUE at close)

1. A fresh install's first closeout — the template's placeholder row replaced by the first real DECISIONS.md entry — passes lint; before this plan it exits 1.
2. A DECISIONS.md reword that is already committed, invisible to no-arg lint, is caught by `sh adapters/lint.sh <base>` (CI calls it with `origin/main`).
3. Partial epoch removal, a live instance missing STATE.md, and a blank-Evidence archived plan nested in a subdirectory each fail lint.
4. The README install path, walked cold in a scratch repo, has an explicit instruction for each of the six gaps listed in Verify row 8.
5. Doctrine now covers: multi-file→risky-novel mid-execution, cap changes routed through DECISIONS.md, plan committed before executing — in templates/ and both root mirrors.
6. `sh adapters/lint_test.sh` ends `lint-test: 26 ok, 0 failing` (20 at plan time), and every-session ledger growth stays within Verify row 10's budget.

## Spec (risky-novel)

- Unknowns to resolve first: none — every edit below is pinned byte-exact against commit 21022d2 (this plan's parent). Any old-text mismatch is drift: stop, write a STATE.md blocker, ask.
- Approach chosen + alternatives rejected: epoch guard is an additive stanza re-running `git diff` (restructuring the proven check-3 pipeline into variables — bigger diff, riskier); check 2 becomes `find … while read` (a `for` over `$(find …)` — word-splits paths); `BASE` is a positional argument defaulting to HEAD (an env var — the accepted finding specifies the argument form; the default keeps hook behavior byte-identical).
- Failure modes / threats designed against: the placeholder exemption matches only the literal `| YYYY-MM-DD |` cell, which no real row can contain (real date cells are digits) — no append-only hole; the epoch guard keys on date-shaped rows, so first-entry placeholder replacement never trips it; `fail` inside a piped `while` still aborts with exit 1 (pipeline status is the loop's — the pattern check 3 already uses, harness-pinned).
- Rollback if it ships broken: one atomic commit per task — `git revert` the offending commit; lint.sh and lint_test.sh always change in the same commit, so any revert lands back on a green harness.

## Context

- Files: adapters/lint.sh, adapters/lint_test.sh, README.md, templates/AGENTS.md, templates/STATE.md, root AGENTS.md, root STATE.md; DECISIONS.md at closeout only.
- Binding constraints: fast gate is `sh adapters/lint.sh && ! grep -rn "README" templates/`; every lint.sh change ships its lint_test.sh case(s) in the same commit; templates/ stays agent-agnostic (the Claude Code notes below are README-only); never push.
- One sanctioned harness change of expectation: Task 3 flips the old single-row epoch case from expect 0 to expect 1 exactly as written there. Any other case changing verdict is a blocker.
- Handoff-leak log: whenever this plan under-specifies an edit or an old-text block mismatches the file, record a `Deviation:` line under the task. The log decides a deferred finding at the next audit (see Closeout row m-3).
- Old/new blocks are byte-exact and column-0; copy them whole. In lint.sh, indentation is two spaces.

## Boundaries (MUST-PRESERVE — any edit weakening these is out of scope)

1. The reclassify tripwire with both concrete triggers — "touches a second file or fails verification once" — survives unchanged in both AGENTS.md; Task 6 only appends after it.
2. "cannot close while any row lacks evidence" + the Evidence column (templates/plans/_TEMPLATE.md) and "Claiming "done" requires running these and showing the output." (templates/AGENTS.md) — those lines stay byte-identical; no task touches them.
3. "Plan in a fresh context; execute in another. The plan is the entire handoff." — survives in both AGENTS.md; Task 8 extends the second sentence exactly as written there, nothing more.
4. templates/plans/_TEMPLATE.md is untouched — its Budget section keeps "record it here, add a STATE.md blocker, ask before continuing." and its four Spec prompts (item 10).
5. templates/CLOSEOUT.md is untouched — step 7's prune keeps "never from DECISIONS.md."
6. The STATE.md header keeps "regenerated at every closeout and whenever it stops being true; never appended." and the hard cap; Task 7 extends the cap clause exactly as written.
7. "Vendor what you adopt: no third-party skill packs at runtime — copy in, pin, review once." (templates/AGENTS.md) — untouched.
8. The CLOSEOUT abandon path — "write `abandoned` in each empty Evidence cell, then run from step 3" — untouched; Task 1's lint change must not disturb it (it edits check 3 only, and the two `abandoned` harness cases must stay green).
9. The context-diet line ("Context diet: planning adds DECISIONS.md; executing adds the one plan. plans/archive/ is history — dig only on purpose.") — both instances untouched.
10. The four Spec prompts in templates/plans/_TEMPLATE.md (Unknowns / Approach / Failure modes / Rollback) — untouched.

## Tasks

<!-- One atomic commit each, imperative mood. Before each commit: sh adapters/lint.sh && ! grep -rn "README" templates/ ; for lint tasks also sh adapters/lint_test.sh with the stated count. Record deviations inline. -->

1. [ ] **Exempt the DECISIONS placeholder row from the append-only check** (fixes: a fresh install's first closeout replaces the template's placeholder row and lint rejects it).

First, capture the pre-fix evidence for Verify row 3 — run this probe from the repo root and paste its output (expect `probe exit=1`):

```sh
MARROW=$(pwd); export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null
d=$(mktemp -d); (
  cd "$d" && git init -q && mkdir -p plans/archive
  printf '# State\n\n<!-- Hard cap: 25 lines. -->\n\nquiet\n' > STATE.md
  { echo '# Decisions'; echo; echo '| Date | Decision | Why / evidence |'; echo '|---|---|---|'
    echo '| YYYY-MM-DD | <your first entry replaces this row> | <why — plan link or measurement> |'
  } > DECISIONS.md
  git add -A && git -c user.name=t -c user.email=t@t commit -qm baseline
  sed 's/^| YYYY-MM-DD .*/| 2026-01-01 | first decision | plan link |/' DECISIONS.md > .d && mv .d DECISIONS.md
  sh "$MARROW/adapters/lint.sh"; echo "probe exit=$?"
); rm -rf "$d"
```

In `adapters/lint.sh`, replace:

```sh
  git diff HEAD -- DECISIONS.md | sed -n 's/^-//p' | grep '^|' |
```

with:

```sh
  git diff HEAD -- DECISIONS.md | sed -n 's/^-//p' | grep '^|' | grep -vF '| YYYY-MM-DD |' |
```

In `adapters/lint_test.sh`, replace:

```sh
fresh git; printf '| 2026-01-03 | new | appended |\n' >> "$T/DECISIONS.md"
expect 0 "pure append"
```

with:

```sh
fresh git; printf '| 2026-01-03 | new | appended |\n' >> "$T/DECISIONS.md"
expect 0 "pure append"
fresh; { echo '# Decisions'; echo
  echo '| Date | Decision | Why / evidence |'; echo '|---|---|---|'
  echo '| YYYY-MM-DD | <your first entry replaces this row> | <why — plan link or measurement> |'
} > "$T/DECISIONS.md"
(cd "$T" && git init -q && git add -A && git -c user.name=t -c user.email=t@t commit -qm baseline) >/dev/null
sed 's/^| YYYY-MM-DD .*/| 2026-01-01 | adopt X | plan link |/' "$T/DECISIONS.md" > "$T/.d" && mv "$T/.d" "$T/DECISIONS.md"
expect 0 "placeholder row replaced by the first real entry"
```

Rerun the probe (expect `marrow-lint: ok`, `probe exit=0`) and `sh adapters/lint_test.sh` (expect `lint-test: 21 ok, 0 failing`).
Commit: `lint: exempt the DECISIONS placeholder row from append-only`

2. [ ] **Make check 3 range-aware (`BASE` argument) and scope the README's CI claim** (fixes: the append-only check diffs against HEAD, so as a CI step it never sees committed violations; the README claims otherwise).

In `adapters/lint.sh`, replace:

```sh
# Wire as a hook: printf 'sh adapters/lint.sh\n' > .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
set -eu
```

with:

```sh
# Wire as a hook: printf 'sh adapters/lint.sh\n' > .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
# CI: sh adapters/lint.sh origin/main — check 3 diffs DECISIONS.md against that base instead of HEAD.
set -eu

BASE=${1:-HEAD}
```

and replace:

```sh
if git cat-file -e HEAD:DECISIONS.md 2>/dev/null; then
  git diff HEAD -- DECISIONS.md | sed -n 's/^-//p' | grep '^|' | grep -vF '| YYYY-MM-DD |' |
```

with:

```sh
if git cat-file -e "$BASE":DECISIONS.md 2>/dev/null; then
  git diff "$BASE" -- DECISIONS.md | sed -n 's/^-//p' | grep '^|' | grep -vF '| YYYY-MM-DD |' |
```

(The `cat-file` guard moves to `"$BASE"` with the diff — plan-time decision: a guard pinned to HEAD would silently skip check 3 exactly when CI diffs against a base that has DECISIONS.md but HEAD is unborn.)

In `adapters/lint_test.sh`, replace:

```sh
expect() { # expect <0|1> <description>
  want=$1; shift
  if (cd "$T" && sh "$LINT") >/dev/null 2>&1; then got=0; else got=1; fi
  if [ "$got" = "$want" ]; then ok=$((ok + 1)); echo "  ok  $*"
  else bad=$((bad + 1)); echo "  BAD $* — want exit $want, got $got"; fi
}
```

with:

```sh
expect() { # expect <0|1> <description>
  want=$1; shift
  if (cd "$T" && sh "$LINT") >/dev/null 2>&1; then got=0; else got=1; fi
  if [ "$got" = "$want" ]; then ok=$((ok + 1)); echo "  ok  $*"
  else bad=$((bad + 1)); echo "  BAD $* — want exit $want, got $got"; fi
}

expect_with() { # expect_with <base> <0|1> <description> — lint.sh with a BASE argument
  base=$1; want=$2; shift 2
  if (cd "$T" && sh "$LINT" "$base") >/dev/null 2>&1; then got=0; else got=1; fi
  if [ "$got" = "$want" ]; then ok=$((ok + 1)); echo "  ok  $*"
  else bad=$((bad + 1)); echo "  BAD $* — want exit $want, got $got"; fi
}
```

and replace:

```sh
sed 's/^| YYYY-MM-DD .*/| 2026-01-01 | adopt X | plan link |/' "$T/DECISIONS.md" > "$T/.d" && mv "$T/.d" "$T/DECISIONS.md"
expect 0 "placeholder row replaced by the first real entry"
```

with:

```sh
sed 's/^| YYYY-MM-DD .*/| 2026-01-01 | adopt X | plan link |/' "$T/DECISIONS.md" > "$T/.d" && mv "$T/.d" "$T/DECISIONS.md"
expect 0 "placeholder row replaced by the first real entry"
fresh git; sed 's/adopt X/adopt Z/' "$T/DECISIONS.md" > "$T/.d" && mv "$T/.d" "$T/DECISIONS.md"
(cd "$T" && git add -A && git -c user.name=t -c user.email=t@t commit -qm reword) >/dev/null
expect 0 "reword already committed — invisible to the no-arg HEAD diff"
expect_with HEAD~1 1 "same committed reword caught with BASE=HEAD~1"
```

In `README.md`, replace:

```
Wire it as a pre-commit hook or CI step if you want the honor system to have teeth; the one-line hook command is in its header, and `adapters/lint_test.sh` keeps the check itself honest.
```

with:

```
Wire it as a pre-commit hook (the append-only check compares your worktree against HEAD, so it only has teeth before the commit lands; as a CI step, checks 1–2 still hold). The one-line hook command is in its header, and `adapters/lint_test.sh` keeps the check itself honest.
```

(Plan-time decision: the accepted replacement covers the first clause; the trailing pointer sentence — hook one-liner location, lint_test.sh — stays, split into its own sentence, because losing it was not part of the finding.)

`sh adapters/lint_test.sh` → `lint-test: 23 ok, 0 failing`.
Commit: `lint: BASE argument makes check 3 range-aware; README scopes the CI claim`

3. [ ] **Epoch moves are all-or-nothing** (fixes: removing one archived-elsewhere row passes lint, but an epoch move must take every row).

In `adapters/lint.sh`, replace:

```sh
  while IFS= read -r row; do
    grep -qxF -- "$row" decisions/archive-*.md 2>/dev/null ||
      fail "DECISIONS.md row removed without a verbatim archive copy: $row"
  done
fi
```

with:

```sh
  while IFS= read -r row; do
    grep -qxF -- "$row" decisions/archive-*.md 2>/dev/null ||
      fail "DECISIONS.md row removed without a verbatim archive copy: $row"
  done
  # Epoch moves are all-or-nothing: once any dated row leaves, none may stay behind.
  if git diff "$BASE" -- DECISIONS.md | sed -n 's/^-//p' | grep -q '^| *[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} *|'; then
    ! grep -q '^| *[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} *|' DECISIONS.md 2>/dev/null ||
      fail "DECISIONS.md partial removal — epoch moves take every row"
  fi
fi
```

In `adapters/lint_test.sh`, replace (this is the one sanctioned expectation flip — the old case's scenario is now a violation):

```sh
fresh git; row=$(sed -n '5p' "$T/DECISIONS.md"); del_row
mkdir -p "$T/decisions"; printf '%s\n' "$row" > "$T/decisions/archive-2026.md"
expect 0 "epoch move — removed row verbatim in decisions/archive-2026.md"
```

with:

```sh
fresh git; sed -n '5,6p' "$T/DECISIONS.md" > "$T/.rows"
sed '5,6d' "$T/DECISIONS.md" > "$T/.d" && mv "$T/.d" "$T/DECISIONS.md"
mkdir -p "$T/decisions" && mv "$T/.rows" "$T/decisions/archive-2026.md"
expect 0 "full epoch move — every row verbatim in decisions/archive-2026.md"
fresh git; row=$(sed -n '5p' "$T/DECISIONS.md"); del_row
mkdir -p "$T/decisions"; printf '%s\n' "$row" > "$T/decisions/archive-2026.md"
expect 1 "single-row removal with an archive copy — partial epoch move"
```

`sh adapters/lint_test.sh` → `lint-test: 24 ok, 0 failing`.
Commit: `lint: epoch moves are all-or-nothing`

4. [ ] **A live instance must carry STATE.md** (fixes: delete STATE.md entirely and every check silently passes).

In `adapters/lint.sh`, replace:

```sh
# marrow v0 — mechanical check of the three invariants the docs cannot self-enforce.
```

with:

```sh
# marrow v0 — mechanical check of the invariants the docs cannot self-enforce.
```

and replace:

```sh
fail() { echo "marrow-lint: $1" >&2; exit 1; }

# 1. STATE.md hard cap — the header owns the number; a missing phrase fails loud.
```

with:

```sh
fail() { echo "marrow-lint: $1" >&2; exit 1; }

# 0. A live instance — plans/ or DECISIONS.md present — must carry STATE.md.
if [ -d plans ] || [ -f DECISIONS.md ]; then
  [ -f STATE.md ] || fail "STATE.md missing"
fi

# 1. STATE.md hard cap — the header owns the number; a missing phrase fails loud.
```

In `adapters/lint_test.sh`, replace:

```sh
# baseline
fresh;     expect 0 "clean instance, no git"
fresh git; expect 0 "clean instance, committed"

# 1 — STATE.md cap
```

with:

```sh
# baseline
fresh;     expect 0 "clean instance, no git"
fresh git; expect 0 "clean instance, committed"

# 0 — a live instance must carry STATE.md
fresh; rm "$T/STATE.md"
expect 1 "plans/ and DECISIONS.md present but STATE.md missing"

# 1 — STATE.md cap
```

`sh adapters/lint_test.sh` → `lint-test: 25 ok, 0 failing`.
Commit: `lint: a live instance must carry STATE.md`

5. [ ] **Evidence gate reaches nested archive subdirectories** (fixes: the `plans/archive/*.md` glob skips `plans/archive/2026/x.md`).

In `adapters/lint.sh`, replace:

```sh
for plan in plans/archive/*.md; do
  [ -e "$plan" ] || break
  msg=$(awk '
```

with:

```sh
find plans/archive -name '*.md' 2>/dev/null | while IFS= read -r plan; do
  msg=$(awk '
```

(The `done` closing the loop and the whole awk body stay byte-identical.)

In `adapters/lint_test.sh`, replace:

```sh
fresh; plan <<EOF
$VH
| Fast gate | cmd | abandoned |
| Behavior | drive | abandoned |
EOF
expect 0 "abandoned per CLOSEOUT: cells filled with 'abandoned'"
```

with:

```sh
fresh; plan <<EOF
$VH
| Fast gate | cmd | abandoned |
| Behavior | drive | abandoned |
EOF
expect 0 "abandoned per CLOSEOUT: cells filled with 'abandoned'"
fresh; mkdir -p "$T/plans/archive/2026"; cat > "$T/plans/archive/2026/x.md" <<EOF
$VH
| Fast gate | cmd | |
EOF
expect 1 "blank Evidence cell in a nested archive subdirectory"
```

`sh adapters/lint_test.sh` → `lint-test: 26 ok, 0 failing`.
Commit: `lint: evidence gate reaches nested archive dirs`

6. [ ] **Mid-execution reclassify path** — in BOTH `templates/AGENTS.md` and root `AGENTS.md`, replace:

```
- Reclassify upward the moment a task outgrows its class: a `trivial` that touches a second file or fails verification once is `multi-file` — stop and write the plan.
```

with:

```
- Reclassify upward the moment a task outgrows its class: a `trivial` that touches a second file or fails verification once is `multi-file` — stop and write the plan. A `multi-file` that turns out `risky-novel` mid-execution: stop before the next task, revert uncommitted work, fill Spec retroactively — or abandon per CLOSEOUT and replan.
```

Commit: `AGENTS: mid-execution reclassify path to risky-novel`

7. [ ] **Cap changes are decisions** — in BOTH `templates/STATE.md` and root `STATE.md`, replace:

```
     Hard cap: 25 lines. Durable facts belong in DECISIONS.md or AGENTS.md, not here. -->
```

with:

```
     Hard cap: 25 lines; changing the cap is a decision — append the DECISIONS.md row first. Durable facts belong in DECISIONS.md or AGENTS.md, not here. -->
```

Commit: `STATE: changing the hard cap requires a DECISIONS.md row`

8. [ ] **Commit the plan before executing** — in BOTH `templates/AGENTS.md` and root `AGENTS.md`, replace:

```
The plan is the entire handoff.
```

with:

```
The plan is the entire handoff — commit it before executing.
```

(One occurrence per file, in the `multi-file` bullet.)
Commit: `AGENTS: commit the plan before executing`

9. [ ] **Install path closes its six gaps.** In `README.md`, replace the whole paragraph:

```
Fill the TODO markers in AGENTS.md. Existing repo? `cp` overwrites an existing AGENTS.md — stash yours first (git suffices), then merge it into the fresh template's sections; don't keep both. Point your harness's memory file at it (for Claude Code, a `CLAUDE.md` containing `@AGENTS.md` — the import form is guaranteed; "see X" is advisory). Templates carry a `marrow v0` marker — append the source commit as you copy (`marrow v0 @ abc1234`) so later diffs against upstream have an anchor; rule 6 applies to Marrow itself.
```

with:

```
Existing repo? `cp` overwrites an existing AGENTS.md — stash yours first (commit or copy it — cp destroys uncommitted edits), then merge it into the fresh template's sections; don't keep both. A merged rule the code currently violates stays in AGENTS.md; file the violation as STATE.md's Next action. Point your harness's memory file at AGENTS.md (for Claude Code, a `CLAUDE.md` containing `@AGENTS.md` — the import form is guaranteed; "see X" is advisory). Templates carry a `marrow v0` marker (`marrow v0 @ abc1234` once the source commit is appended) so later diffs against upstream have an anchor; rule 6 applies to Marrow itself. Fill the TODO markers and the `<Project>` title in AGENTS.md, seed STATE.md's Focus and Next action, append the source commit to each copied file's marker, and commit the install.
```

(Plan-time decisions: "at it" became "at AGENTS.md" — the old antecedent moved; `<Project>` is backticked so markdown doesn't eat it as a tag. The two retained sentences — harness pointer, marker anchor — keep their content; the marker sentence sheds its append instruction, which now lives in the closing sequence.)

In `templates/AGENTS.md`, replace line 1:

```
# <Project>
```

with:

```
# <Project> <!-- TODO -->
```

In `templates/STATE.md`, replace:

```
- plans/<slug>.md — planning | executing | verifying
```

with:

```
- none <!-- or: plans/<slug>.md — planning | executing | blocked -->
```

Commit: `install: README six-gap path; template title TODO; In-flight empty state`

10. [ ] **Harness note in README.** Immediately after the Install paragraph edited in Task 9 (which now ends `…and commit the install.`) and before the paragraph starting `Optional per-harness adapters`, insert as its own paragraph:

```
Harness note: Claude Code reads AGENTS.md once at session start; edits from a closeout are for the next session.
```

Commit: `README: harness note — AGENTS.md edits land next session`

## Verify — the gate: cannot close while any row lacks evidence

| Check | How | Evidence |
|---|---|---|
| Fast gate | `sh adapters/lint.sh && ! grep -rn "README" templates/` — exit 0, prints `marrow-lint: ok` | |
| Harness, all cases | `sh adapters/lint_test.sh` — final line exactly `lint-test: 26 ok, 0 failing` | |
| First closeout unblocked | Task 1's probe script pasted twice: before its lint.sh edit → `probe exit=1`; after → `marrow-lint: ok` + `probe exit=0` | |
| Committed reword caught via BASE | harness lines `ok  reword already committed — invisible to the no-arg HEAD diff` and `ok  same committed reword caught with BASE=HEAD~1` | |
| Epoch all-or-nothing | harness lines `ok  full epoch move — every row verbatim in decisions/archive-2026.md` and `ok  single-row removal with an archive copy — partial epoch move` | |
| Missing STATE.md fails | harness line `ok  plans/ and DECISIONS.md present but STATE.md missing` | |
| Nested archive reached | harness line `ok  blank Evidence cell in a nested archive subdirectory` | |
| Install re-walk, six gaps | Scratch repo with a pre-existing AGENTS.md (one rule the code violates) and one uncommitted edit; follow README Install literally. Quote the README instruction that answers each: ① uncommitted edits destroyed by cp ② merge into template sections, don't keep both ③ violated merged rule stays, violation filed as STATE.md Next action ④ fill TODOs + `<Project>` title ⑤ seed STATE.md Focus and Next action ⑥ append source commit to every copied file's marker, commit the install | |
| Template behavior proof | Copy templates/ to a scratch dir; walk one task through classify→plan→execute→verify→distill. The copied set must answer every question the loop asks, incl. the three new ones: mid-flight reclassify, cap-change rule, commit-before-execute | |
| Ledger budget | After CLOSEOUT step 6 (STATE.md regenerated), before its commit: `wc -c AGENTS.md STATE.md`. Baseline at plan commit: 3266 + 841 = 4107 bytes. Doctrine edits (Tasks 6–8) sum ≈ +280 bytes ≈ +70 tokens — audit predicted ≈ +50; the accepted reclassify sentence simply runs long. Record actuals. Delta > +400 bytes (+100 tokens): attribute AGENTS.md doctrine vs regenerated STATE.md body churn; doctrine alone past +100 tokens trips the Budget | |
| Mirror parity | `grep -c 'mid-execution' AGENTS.md templates/AGENTS.md` then `grep -c 'commit it before executing' AGENTS.md templates/AGENTS.md` then `grep -c 'changing the cap is a decision' STATE.md templates/STATE.md` — every count exactly 1 | |

## Budget

Stop if: any old-text block above fails to match byte-for-byte; any harness case beyond Task 3's sanctioned flip changes verdict; doctrine ledger growth exceeds +100 tokens (Verify row 10); 3 failed attempts on the same failing check.
Tripped → record it here, add a STATE.md blocker, ask before continuing.

## Closeout

Run CLOSEOUT.md. Distilled line(s) destined for DECISIONS.md — append exactly these three rows, replacing `<exec-date>` with today's date. They record findings this audit considered and deferred (so the next audit sees them) and they consume this closeout's ≤3-row budget; the executed changes need no row — their provenance is this plan plus git.

| <exec-date> | Defer scoping "dependency" out of the risky-novel trigger | audit-3 m-1: the recorded over-classification bias stands and Spec ceremony demonstrably improved a security task this audit; revisit if real adoption shows ceremony drag on routine dependency work |
| <exec-date> | Defer exact user-visible strings in plan success criteria | audit-3 m-3: pending the handoff-leak log from this plan's own execution; adopt at the next closeout if a copy or normalization leak is logged |
| <exec-date> | Defer STATE.md ↔ plans/ cross-check as a skipped-closeout detector | audit-3 M-3d: it constrains scratch plans; adopt as an optional-flagged check only after a closeout is actually skipped in practice |
