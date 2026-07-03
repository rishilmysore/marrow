# Closeout

<!-- Run when a plan's Verify table is full. This is Marrow's garbage collector —
     skipping it is how context rot starts. -->

1. [ ] Every Verify row has evidence. No evidence → not done → back into the loop.
2. [ ] Deviations from the plan are recorded in the plan file.
3. [ ] Append ≤3 one-liners to DECISIONS.md: decisions made, surprises worth keeping.
4. [ ] New environment quirk or verification step discovered? Fold it into AGENTS.md now.
5. [ ] Archive: `mkdir -p plans/archive && mv plans/<slug>.md plans/archive/`
6. [ ] Regenerate STATE.md from scratch — focus, next action, in-flight, blockers, last 3 closed. Half-page cap.
7. [ ] Prune pass: delete any doc line now stale or duplicated elsewhere.
