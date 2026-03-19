---
name: deliberate-execute
description: Executes implementation plans with mandatory TDD enforcement, per-task two-stage code review, parallel agent dispatch, browser-automated UAT, and architect verification loop. All agents use model opus. Triggers on "execute", "implement", "build this", "code this", "go", "execute this plan", "start building", "ship this". Handles quick ad-hoc tasks on "quick fix", "just do", "small change".
allowed-tools: [Read, Write, Edit, Bash, Glob, Grep, WebFetch, Task]
user-invocable: true
---

# Deliberate Execute — Disciplined Multi-Agent Implementation

Execute plans with mandatory TDD, per-task two-stage review, parallel execution, browser-automated UAT, and architect verification. All subagents use `model: opus`.

**Mode**: Implementation — writes code, runs tests, modifies files.
**Git Policy**: Do NOT create worktrees/branches unless user asks. Work on current branch.
**Model Policy**: ALL subagents use `model: opus`. No exceptions.

---

## Phase 0: Plan Intake

Locate plan: message → `.deliberate-plan/artifacts/plan-*.md` → `docs/plans/*.md` → `.omc/specs/*.md` → `.planning/*/PLAN.md` → ask user. Validate: steps numbered, file paths specified, done states clear. Parse into tasks, group parallel batches by dependency.

---

## Phase 1: Task Execution Cycle (per task, mandatory)

### Step 1: TDD Gate
Before ANY code, write failing test → run → MUST fail (🔴). Code without test → **delete it**. Skip exceptions logged as "TDD SKIP: [reason]" (config, docs, CSS, migrations only).

### Step 2: Implement (Fresh Subagent)
Dispatch with `model: opus`. Give ONLY: task spec + failing test + relevant codebase. Context isolation — no conversation history. Parallel batches: `run_in_background: true`. Drift prevention: verify file in task list before every Write/Edit.

### Step 3: Green Check
Test passes (🟢) + full suite green. 3 failures → **Escalate** (`references/debugging-escalation.md`).

### Step 4: Spec Review (Fresh Subagent)
NOT the implementer. Reads actual code, does NOT trust report. Checks: all requirements met, nothing extra (YAGNI), paths match, tests cover. FAIL → fix (max 2 cycles).

### Step 5: Quality Review (Fresh Subagent)
Only after spec PASSES. Reviews: conventions, errors, edges, naming, DRY, performance, security. CRITICAL blocks. IMPORTANT: fix if <5min.

### Step 6: Complete
Update TodoWrite. Commit. Next task.

---

## Phase 2: Completion Verification

**Full test suite** → all green (loop max 5). **Architect verification** (`references/agent-prompts.md`) → APPROVED or loop. Do NOT declare done until APPROVED.

---

## Phase 3: Automated UAT

Read `references/browser-uat.md`. Extract testable deliverables. Detect browser tools (agent-browser → PinchTab → Playwright → Puppeteer → Claude in Chrome). Persistent browser session — login once, test everything. Auto-fix failures (max 2 cycles). Frontend: 6-pillar design review (layout, type, color, responsive, states, a11y). Save UAT report.

---

## Phase 4: Ship (on user request only)

Only when user says "ship it"/"create PR": commit → push → `gh pr create` with execution report body. **Never auto-ship.**

---

## Session Management

**Pause**: HANDOFF.json (task, completed, remaining, test status, architect, UAT). **Resume**: Load → test suite → continue. **Milestone**: Archive → new.

## Quick Mode

"quick fix/just do/small change" → skip planning, write mini spec, run FULL execution cycle (TDD + reviews). Quality non-negotiable.

## Debugging Escalation

3 failures → STOP → Architectural Review → diagnose: code bug | design flaw | plan error. See `references/debugging-escalation.md`.

## Edit Lock (Drift Prevention)

Before every Write/Edit during execution, verify the target file is in the current task's file list. If not → warn: "This file is NOT in Task N's scope." Override only with explicit user permission. This is enforced via the `hooks/pre-tool-use.sh` hook.

## Retro Metrics (Post-Completion)

After execution completes, offer: "Want to see engineering metrics for this session?" Computes TDD compliance, spec review pass rate, quality review pass rate, escalation count, UAT pass rate. See `references/retro-metrics.md`. Saves JSON snapshot for trend tracking across milestones.

## Modes

**Sequential** (default) | **Parallel** ("fast") | **Persistent** ("don't stop")

## Quality Gates (Non-Negotiable)

🔴 TDD → 📋 Spec Review → ✅ Quality Review → 🟢 Green → 🏗️ Architect → 🌐 UAT → 🚢 Ship (user only)

## References

- `references/agent-prompts.md` — Subagent templates with cognitive mode separation (all `model: opus`)
- `references/debugging-escalation.md` — 3-failure protocol
- `references/browser-uat.md` — Persistent browser session + UAT patterns
- `references/retro-metrics.md` — Post-execution metrics and trend tracking
- `templates/execution-report.md` — Completion report
