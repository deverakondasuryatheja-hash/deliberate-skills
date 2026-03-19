# Changelog

## v3.0.0 (2026-03-19)

### deliberate-plan
- **NEW**: Product Review phase (6 forcing questions before technical planning)
- **NEW**: Domain-specific preference capture (gray area analysis by domain)
- **NEW**: Manus-style file-based working memory (2-Action Rule)
- **NEW**: Session management (pause/resume with HANDOFF.json + STATE.md)
- **NEW**: Milestone lifecycle (archive → new milestone)
- **IMPROVED**: Restructured per Anthropic skill authoring best practices
- **IMPROVED**: SKILL.md reduced to 101 lines (was 419) with progressive disclosure
- **IMPROVED**: Description rewritten for trigger accuracy (third person, no workflow summary)
- **IMPROVED**: Added allowed-tools and user-invocable frontmatter

### deliberate-execute
- **NEW**: Phase 3 — Automated UAT with browser tools (agent-browser, PinchTab, Playwright, Puppeteer, Claude in Chrome)
- **NEW**: Persistent browser session for UAT (login once, test everything)
- **NEW**: Design review for frontend tasks (6-pillar visual audit)
- **NEW**: Phase 4 — Auto-ship (PR creation on user command)
- **NEW**: Quick mode for ad-hoc tasks (TDD still enforced)
- **NEW**: Session management (pause/resume)
- **NEW**: Drift prevention (verify file in task list before Write/Edit)
- **IMPROVED**: SKILL.md reduced to 89 lines (was 363) with progressive disclosure
- **IMPROVED**: Plan intake reads from any source (deliberate-plan, Superpowers, GSD, OMC)

### Project
- **NEW**: Full project structure following Anthropic best practices
- **NEW**: README with comparison table, workflow diagram, install instructions
- **NEW**: package.json for npx install
- **NEW**: Example outputs (sample plan, sample execution report)
- **NEW**: Init script for session state detection

## v2.1.0 (2026-03-19)
- Added domain-specific preference capture
- Added session management (pause/resume/milestone)
- Added automated UAT with browser detection
- Added quick mode

## v2.0.0 (2026-03-15)
- Added Socratic deep interview with clarity scoring
- Added harsh critic with severity calibration
- Added pre-mortem analysis (9 failure categories)
- Added confidence scoring (6-dimension weighted)
- Added pipeline handoff to execution tools
- Added state persistence to `.deliberate-plan/artifacts/`

## v1.0.0 (2026-03-15)
- Initial release
- Multi-agent deliberation (5-6 task-adapted agents)
- Deep web research phase
- Codebase analysis phase
- 3 debate rounds + 4 refinement rounds
- Task-type adapted agent teams (IMPLEMENT/FIX/REFACTOR/MIGRATE/INTEGRATE/DESIGN)
- Mandatory TDD enforcement
- Two-stage per-task code review (spec + quality)
- 3-failure debugging escalation
- Architect verification loop
