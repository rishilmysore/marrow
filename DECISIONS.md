# Decisions

<!-- marrow v0 — append-only; newest at the bottom; one line each. Provenance lives here; the
     current rule each line implies is folded into AGENTS.md at closeout. Reversals are
     appended, never edited in. If the "why" needs a paragraph, it needed a plan — link it. -->

| Date | Decision | Why / evidence |
|---|---|---|
| 2026-07-03 | AGENTS.md owns operational doctrine; README derives | audit D1: classify rule didn't ship with `cp -r templates/*` — plans/archive/v0-hardening.md |
| 2026-07-03 | DECISIONS.md is provenance, AGENTS.md the current view; on conflict AGENTS.md is stale | audit D9/D10: enables prune-by-promotion + epoch archives without breaking append-only |
| 2026-07-03 | License 0BSD, not MIT | templates are copy-paste content; attribution-per-adopting-repo is friction with no upside |
