# Decisions

<!-- marrow v0 — append-only; newest at the bottom; one line each. Provenance lives here; the
     current rule each line implies is folded into AGENTS.md at closeout. Reversals are
     appended, never edited in. If the "why" needs a paragraph, it needed a plan — link it. -->

| Date | Decision | Why / evidence |
|---|---|---|
| 2026-07-03 | AGENTS.md owns operational doctrine; README derives | audit D1: classify rule didn't ship with `cp -r templates/*` — plans/archive/v0-hardening.md |
| 2026-07-03 | DECISIONS.md is provenance, AGENTS.md the current view; on conflict AGENTS.md is stale | audit D9/D10: enables prune-by-promotion + epoch archives without breaking append-only |
| 2026-07-03 | License 0BSD, not MIT | templates are copy-paste content; attribution-per-adopting-repo is friction with no upside |
| 2026-07-03 | Abandoned plans write `abandoned` in empty Evidence cells; archive invariant stays absolute | audit-2 D1: the documented abandon path tripped the shipped lint — plans/archive/v0-teeth.md |
| 2026-07-03 | risky-novel = wrong-step-expensive: new external surface, irreversible data, security-sensitive, or no repo pattern | audit-2 D2: ceremony was defined, membership was not; agents under-classify without a test |
| 2026-07-03 | Lint derives what docs own (cap from STATE.md header); removed DECISIONS rows must reappear verbatim in archive | audit-2 D3/D4: five false negatives and a duplicated cap; adapters/lint_test.sh keeps the check honest |
| 2026-07-03 | Defer scoping "dependency" out of the risky-novel trigger | audit-3 m-1: the recorded over-classification bias stands and Spec ceremony demonstrably improved a security task this audit; revisit if real adoption shows ceremony drag on routine dependency work |
| 2026-07-03 | Defer exact user-visible strings in plan success criteria | audit-3 m-3: pending the handoff-leak log from this plan's own execution; adopt at the next closeout if a copy or normalization leak is logged |
| 2026-07-03 | Defer STATE.md ↔ plans/ cross-check as a skipped-closeout detector | audit-3 M-3d: it constrains scratch plans; adopt as an optional-flagged check only after a closeout is actually skipped in practice |
