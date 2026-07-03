# Closeout

<!-- marrow v0 — run when a plan's Verify table is full. Abandoning a plan instead?
     Record why in the plan, then run from step 3. This is Marrow's garbage collector —
     skipping it is how context rot starts. -->

1. [ ] Every Verify row has evidence. Any row without it → not done → back to execute.
2. [ ] Deviations from the plan are recorded in the plan file.
3. [ ] Append ≤3 one-liners to DECISIONS.md: decisions made, surprises worth keeping.
4. [ ] New binding rule, environment quirk, or verification step discovered? Fold it into AGENTS.md now.
5. [ ] Archive: `mkdir -p plans/archive && git mv plans/<slug>.md plans/archive/`
6. [ ] Regenerate STATE.md from scratch, per its header.
7. [ ] Prune pass: delete any doc line now stale or duplicated elsewhere — never from DECISIONS.md.
8. [ ] DECISIONS.md past 40 entries? Fold still-binding lines into AGENTS.md, move the rest to decisions/archive-<year>.md, leave a link.
9. [ ] Commit the closeout — archive move + doc updates, one commit.
