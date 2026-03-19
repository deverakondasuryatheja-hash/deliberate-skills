---
name: deliberate-plan
description: Produces zero-assumption implementation plans through product review, multi-agent debate, deep web research, codebase analysis, harsh critic review, and pre-mortem analysis. All agents run on Opus 4.6. Use when planning a feature, designing a system, architecting a solution, preparing a fix, refactoring, migrating, or integrating. Triggers on "plan this", "how should we implement", "create a plan", "design the approach", "think through", "deliberate", "deep plan", or any request for structured planning before coding.
allowed-tools: [Read, Write, Edit, Bash, Glob, Grep, WebFetch, WebSearch, Task]
user-invocable: true
---

# Deliberate Plan — Multi-Agent Planning

Produce a zero-assumption, battle-tested plan through product review, Socratic interviewing, deep web research, codebase analysis, multi-agent adversarial deliberation, harsh critic review, and pre-mortem analysis. All agents run on Opus 4.6.

**Mode**: Planning only — do NOT modify project files. Read/Grep/Glob/WebSearch to gather context. Produce a plan document. After delivery, offer execution handoff.

**Git Policy**: Do NOT create worktrees or branches unless user explicitly asks.

---

## Phase 0: Product Review & Socratic Interview

### Step 0.1 — Product Review (6 Forcing Questions)

Before technical planning, challenge WHAT is being built:

1. **What problem does this solve?** Not "what feature" — what user pain?
2. **Who has this problem?** Specific user type, not "everyone"
3. **Why now?** What changed that makes this urgent?
4. **What is the 10-star version?** If insanely great, what would it look like?
5. **What is the minimum viable version?** Smallest thing that delivers value
6. **What would make users tell their friends?** The viral hook

Save Product Brief to `.deliberate-plan/artifacts/product-brief.md`.

### Step 0.2 — Clarity Scoring

Score request across weighted dimensions (Scope 25%, Success Criteria 25%, Constraints 20%, Context 15%, Non-Goals 15%). If < 4.0, ask 2-3 hypothesis-driven questions (max 3).

### Step 0.3 — Domain-Specific Preference Capture

Analyze task domain, surface gray areas as multi-select. Frontend → layout/density/states. API → format/errors/auth. Database → naming/deletes/indexing. Auth → sessions/MFA/roles. For each selected area, 2-3 multiple-choice questions. Save to `.deliberate-plan/artifacts/preferences.md`.

**Scope guardrail**: Discussion clarifies HOW, not WHETHER to add features. New ideas → "deferred ideas."

### Step 0.4 — Task Classification

IMPLEMENT | FIX | REFACTOR | MIGRATE | INTEGRATE | DESIGN — determines agent team in Phase 3.

---

## Phase 1: Deep Web Research

Read `references/research-protocol.md` for task-specific queries. Generate 3-5 questions, triangulate (docs + blogs + pitfalls). Write findings to disk after every 2 searches. Save to `.deliberate-plan/artifacts/research-brief.md`.

---

## Phase 2: Codebase Deep Analysis

Map files, trace data flow, catalog patterns/conventions, identify constraints. Save to `.deliberate-plan/artifacts/codebase-analysis.md`.

---

## Phase 3: Agent Assembly & Deliberation

Read `references/agent-roster.md` for agents. Read `references/deliberation-protocol.md` for rules.

1. Detect execution mode (Agent Teams / Subagents / Simulated)
2. Assemble 5-6 task-specific agents + Harsh Critic + Assumption Auditor
3. **Round 1** — Challenge Assumptions (adversarial)
4. **Round 2** — Convergence (collaborative, explicit trade-offs)
5. **Round 3** — Gap Analysis (step-by-step stress test)
6. **Harsh Critic Review** — Severity-rated (🔴/🟠/🟡/⚪), mitigations required, PASS/CONDITIONAL/FAIL

---

## Phase 4: Plan Refinement (5 Rounds)

1. **Assumption Hunt** — Verify every claim. Zero unverified assumptions.
2. **Junior Dev Test** — Every step unambiguous, exact paths, no vague language.
3. **Pre-Mortem** — Assume FAILED, work backwards (9 failure categories).
4. **Red Team** — Failure injection, concurrency, data corruption, rollback.
5. **Final Consensus** — All agents 🟢/🟡. Single 🔴 blocks.

---

## Phase 5: Output

Confidence score (6 dimensions, weighted). 🟢 ≥4.5 | 🟡 3.5-4.4 | 🔴 <3.5. Produce plan via `templates/plan-output.md`. Save artifacts + plan-meta.json. Offer execution handoff.

---

## Session Management

**Pause**: HANDOFF.json + STATE.md. **Resume**: Load + continue. **Milestone**: Archive → new.

---

## References

- `references/agent-roster.md` — Agent personas for all task types
- `references/deliberation-protocol.md` — Debate rules, harsh critic, execution modes
- `references/research-protocol.md` — Task-specific web search queries
- `templates/plan-output.md` — Output structure with confidence scoring
