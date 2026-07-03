#!/bin/sh
# marrow v0 — mechanical check of the three invariants the docs cannot self-enforce.
# Run from the repo root; wire as a pre-commit hook or CI step. Exits non-zero on first failure.
set -eu

fail() { echo "marrow-lint: $1" >&2; exit 1; }

# 1. STATE.md hard cap (STATE.md's header owns the number).
if [ -f STATE.md ]; then
  lines=$(wc -l < STATE.md)
  [ "$lines" -le 25 ] || fail "STATE.md is $lines lines (cap 25) — regenerate, don't append"
fi

# 2. Archived plans are evidence-complete: no Verify row with an empty last cell.
for plan in plans/archive/*.md; do
  [ -e "$plan" ] || break
  bad=$(awk '/^## Verify/{v=1;next} /^## /{v=0}
             v && /^\|/ && $0 !~ /^[| :-]+$/ && $0 !~ /\| *Evidence *\|/ \
               && $0 ~ /\|[[:blank:]]*\|[[:blank:]]*$/' "$plan")
  [ -z "$bad" ] || fail "$plan archived with empty Evidence cell(s):
$bad"
done

# 3. DECISIONS.md is append-only (staged deletions allowed only when archiving an epoch).
if git rev-parse --is-inside-work-tree >/dev/null 2>&1 && [ -f DECISIONS.md ]; then
  if ! git diff --cached --name-only | grep -q '^decisions/archive-'; then
    removed=$(git diff --cached -- DECISIONS.md | grep -c '^-[^-]' || true)
    [ "$removed" -eq 0 ] || fail "DECISIONS.md loses $removed line(s) — append-only; archive an epoch instead"
  fi
fi

echo "marrow-lint: ok"
