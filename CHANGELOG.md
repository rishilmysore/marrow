# Changelog

Notable changes to what adopters vendor, per [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Version semantics: README § Versioning.

## [Unreleased]

## [0.2.0] - 2026-07-04

Verification duties. Each arrives only inside an upgrade diff you choose to apply (README § Upgrading).

### Added

- `AGENTS.md` Conventions — Dependencies: verify a new dependency exists in its registry (exact name, current version) before adding it. Remediation: copy the new line into your vendored AGENTS.md.
- `AGENTS.md` Verification — red→green evidence: a test written for a change proves it by failing before and passing after; a test that never failed proves nothing. Remediation: append the new sentence to your Evidence line.
- `plans/_TEMPLATE.md` Spec — the Failure-modes prompt now asks security-sensitive work to name the attack surfaces and who abuses them. Remediation: extend the prompt in your copied template; closed plans are unaffected.
- `AGENTS.md` Design — verify UI against rendered output: a UI-affecting change's evidence is a screenshot or rendered artifact, or the Verify row names what stood in for eyes. Module-scoped: if you deleted the Design section, no duty applies. Remediation: add the new line under your Design bar.
- `adapters/fresh-verify.md` — optional adapter: re-run a finished plan's Verify table in a fresh context that did not write the code. Nothing requires it; delete it if unused. Remediation: vendor the file only if you want the practice.

## [0.1.0] - 2026-07-04

First public cut.

### Added

- Five templates under `templates/`: `AGENTS.md` (harness facts and binding rules), `STATE.md` (current focus, regenerated and hard-capped), `DECISIONS.md` (append-only provenance), `CLOSEOUT.md` (the close checklist: distill, archive, regenerate state, prune), `plans/_TEMPLATE.md` (the plan-as-handoff form).
- The loop: classify → plan → execute → verify → distill, with three task classes (`trivial`, `multi-file`, `risky-novel`) and evidence-gated closes.
- `adapters/lint.sh`: POSIX check of the four mechanical invariants — a live instance carries STATE.md, the state cap, evidence-gated archives, append-only decisions. An optional base-ref argument (`sh adapters/lint.sh origin/main`) makes the append-only check range-aware in CI. `adapters/lint_test.sh` is its regression harness.
- Marker convention: each vendored file pins its source as `marrow v0 @ <tag>`, the anchor upgrades diff from.

[Unreleased]: https://github.com/rishilmysore/marrow/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/rishilmysore/marrow/releases/tag/v0.2.0
[0.1.0]: https://github.com/rishilmysore/marrow/releases/tag/v0.1.0
