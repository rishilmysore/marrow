# Changelog

Notable changes to what adopters vendor, per [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Version semantics: README § Versioning.

## [Unreleased]

## [0.1.0] - 2026-07-04

First public cut.

### Added

- Five templates under `templates/`: `AGENTS.md` (harness facts and binding rules), `STATE.md` (current focus, regenerated and hard-capped), `DECISIONS.md` (append-only provenance), `CLOSEOUT.md` (the close checklist: distill, archive, regenerate state, prune), `plans/_TEMPLATE.md` (the plan-as-handoff form).
- The loop: classify → plan → execute → verify → distill, with three task classes (`trivial`, `multi-file`, `risky-novel`) and evidence-gated closes.
- `adapters/lint.sh`: POSIX check of the four mechanical invariants — a live instance carries STATE.md, the state cap, evidence-gated archives, append-only decisions. An optional base-ref argument (`sh adapters/lint.sh origin/main`) makes the append-only check range-aware in CI. `adapters/lint_test.sh` is its regression harness.
- Marker convention: each vendored file pins its source as `marrow v0 @ <tag>`, the anchor upgrades diff from.

[Unreleased]: https://github.com/rishilmysore/marrow/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/rishilmysore/marrow/releases/tag/v0.1.0
