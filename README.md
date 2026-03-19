# DELIBERATE SKILLS

**The deepest planning and most disciplined execution skills for Claude Code.**

Multi-agent debate for planning. Mandatory TDD for execution. Browser-automated UAT for verification. Zero assumptions. Zero shortcuts.

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

```
npx deliberate-skills
```

---

## Why I Built This

I tested every planning and execution tool in the ecosystem — Superpowers (40K stars), GSD (35K stars), OMC, gstack. They're all good at different things. But none of them had everything I needed:

- **Superpowers** has the best TDD enforcement, but its planning is single-agent — one perspective, no debate.
- **GSD** solves context rot brilliantly, but has zero TDD enforcement and no per-task code review.
- **OMC** is the fastest with parallel agents, but no quality gates per task.
- **gstack** has the best cognitive mode separation, but no multi-agent deliberation.

So I took the best ideas from all of them, combined them, and built something that scores higher than any individual tool. Deliberate Skills gives you 5-6 specialized agents debating your plan (deeper than anyone), mandatory TDD with code deleted if tests don't exist (as strict as Superpowers), two-stage code review on every single task (stricter than anyone), and browser-automated UAT that verifies features actually work (as good as gstack).

**The result**: Plans with zero assumptions. Code with enforced quality. Features verified by an automated QA tester.

— **Surya Devera Konda**

---

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                   DELIBERATE-PLAN                        │
│                                                          │
│  Product Review ──→ Socratic Interview ──→ Web Research  │
│        │                                        │        │
│        ▼                                        ▼        │
│  Codebase Analysis ──→ 5-6 Agent Debate (3 rounds)      │
│                              │                           │
│                              ▼                           │
│                    Harsh Critic Review                    │
│                              │                           │
│                              ▼                           │
│              5 Refinement Rounds (Pre-Mortem)             │
│                              │                           │
│                              ▼                           │
│              Confidence-Scored Plan (🟢🟡🔴)              │
└──────────────────────────┬──────────────────────────────┘
                           │
                           ▼
┌──────────────────────────────────────────────────────────┐
│                  DELIBERATE-EXECUTE                       │
│                                                           │
│  For each task:                                           │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ 🔴 TDD Gate ──→ Implement ──→ 🟢 Green Check       │  │
│  │      │              │              │                │  │
│  │      ▼              ▼              ▼                │  │
│  │ Failing test   Fresh subagent  Tests pass           │  │
│  │ MUST exist     (context isolated) Full suite green  │  │
│  │      │                             │                │  │
│  │      ▼                             ▼                │  │
│  │ Spec Review ──→ Quality Review ──→ ✅ Complete      │  │
│  │ (fresh agent)   (fresh agent)                       │  │
│  └─────────────────────────────────────────────────────┘  │
│                           │                               │
│                           ▼                               │
│  Architect Verification ──→ Browser UAT ──→ Ship (PR)     │
└──────────────────────────────────────────────────────────┘
```

---

## Install

```bash
# One command
npx deliberate-skills

# Or manual
git clone https://github.com/suryadevera/deliberate-skills.git
cp -r deliberate-skills/skills/deliberate-plan ~/.claude/skills/
cp -r deliberate-skills/skills/deliberate-execute ~/.claude/skills/
```

Verify: `/deliberate-plan` and `/deliberate-execute` should appear in Claude Code.

---

## Quick Start

**Plan something:**
```
plan the multi-slot booking system for RoomShare
```
Claude runs: Product Review → Interview → Research → 6-Agent Debate → Harsh Critic → Pre-Mortem → Confidence-Scored Plan.

**Execute it:**
```
execute this plan
```
Claude runs: TDD → Implement → Spec Review → Quality Review → Architect → UAT → Ship.

**Quick fix (skip planning):**
```
quick fix the login button not responding on mobile
```
Claude runs: Mini spec → TDD → Implement → Reviews → Done. Still enforces quality.

---

## What Makes This Different

| Feature | Deliberate Skills | Superpowers | GSD | OMC | gstack |
|---------|:-:|:-:|:-:|:-:|:-:|
| Multi-agent debate (5-6 agents) | ✅ | ❌ | ❌ | ❌ | ❌ |
| Task-type adapted agents | ✅ | ❌ | ❌ | ❌ | ❌ |
| Mandatory TDD enforcement | ✅ | ✅ | ❌ | ❌ | ❌ |
| Per-task two-stage code review | ✅ | ✅ | ❌ | ❌ | ❌ |
| Deep web research before planning | ✅ | ❌ | ✅ | ❌ | ❌ |
| Harsh Critic with severity rating | ✅ | ❌ | ❌ | ❌ | ❌ |
| Pre-mortem failure analysis | ✅ | ❌ | ❌ | ❌ | ❌ |
| Confidence scoring | ✅ | ❌ | ❌ | ❌ | ❌ |
| Browser-automated UAT | ✅ | ❌ | ✅ | ❌ | ✅ |
| Parallel execution | ✅ | ❌ | ✅ | ✅ | ✅ |
| Product review (CEO-level) | ✅ | ❌ | ❌ | ❌ | ✅ |
| Domain preference capture | ✅ | ❌ | ✅ | ❌ | ❌ |
| Session pause/resume | ✅ | ❌ | ✅ | ✅ | ❌ |
| 3-failure debugging escalation | ✅ | ✅ | ❌ | ❌ | ❌ |
| Quick mode for ad-hoc tasks | ✅ | ❌ | ✅ | ❌ | ❌ |
| Auto-ship (PR creation) | ✅ | ✅ | ✅ | ❌ | ✅ |

---

## Two Skills, Complete Coverage

### deliberate-plan
Triggers: "plan this", "how should we implement", "create a plan", "design the approach"

Phases:
1. **Product Review** — 6 forcing questions to challenge what you're building
2. **Socratic Interview** — Clarity scoring + domain-specific preference capture
3. **Deep Research** — Web search triangulated across docs, blogs, pitfalls
4. **Codebase Analysis** — File mapping, data flow, patterns, constraints
5. **Agent Debate** — 5-6 task-adapted agents, 3 rounds of structured debate
6. **Harsh Critic** — Independent severity-rated adversarial review
7. **Refinement** — 5 rounds including pre-mortem and red team
8. **Output** — Confidence-scored plan with zero assumptions

### deliberate-execute
Triggers: "execute", "implement", "build this", "go", "ship this"

Per task:
1. **TDD Gate** — Write failing test FIRST. Code without test gets deleted.
2. **Implement** — Fresh subagent, isolated context, `model: opus`
3. **Spec Review** — Fresh subagent verifies against spec (doesn't trust implementer)
4. **Quality Review** — Fresh subagent checks conventions, errors, security
5. **Architect** — Final verification of entire implementation
6. **UAT** — Browser-automated user acceptance testing
7. **Ship** — PR creation on user command

---

## Configuration

All agents run on **Opus 4.6** by default. No model routing — every agent gets maximum reasoning depth.

**Execution modes**:
- Sequential (default) — safest, one task at a time
- Parallel — "fast" or "parallel" — independent tasks simultaneously
- Persistent — "don't stop" — loops until Architect approves

**Git**: No auto worktrees. No auto branches. Works on your current branch unless you say otherwise.

---

## Architecture

```
deliberate-skills/
├── skills/
│   ├── deliberate-plan/
│   │   ├── SKILL.md              # 101 lines — core instructions
│   │   ├── references/           # Loaded on demand
│   │   │   ├── agent-roster.md   # 30+ agent personas
│   │   │   ├── deliberation-protocol.md  # Debate rules
│   │   │   └── research-protocol.md      # Search queries
│   │   ├── templates/
│   │   │   └── plan-output.md    # Plan template
│   │   ├── scripts/
│   │   │   └── init-session.sh   # State detection
│   │   └── examples/
│   │       └── sample-plan.md    # Example output
│   └── deliberate-execute/
│       ├── SKILL.md              # 89 lines — core instructions
│       ├── references/
│       │   ├── agent-prompts.md  # Subagent templates
│       │   ├── debugging-escalation.md
│       │   └── browser-uat.md    # UAT patterns
│       ├── templates/
│       │   └── execution-report.md
│       └── examples/
│           └── sample-execution-report.md
├── README.md
├── LICENSE
├── CHANGELOG.md
└── package.json
```

**Progressive disclosure** (per Anthropic best practices):
- Level 1: Name + description always loaded (~100 tokens each)
- Level 2: SKILL.md loaded on trigger (~101/89 lines)
- Level 3: Reference files loaded on demand only
- Level 4: Scripts executed, only output enters context

---

## Session Management

**Pause mid-work**: Claude saves HANDOFF.json + STATE.md with exact position, completed work, and next steps.

**Resume**: Claude reads state files and continues from where you stopped. Never re-asks decided questions or re-executes completed tasks.

**Milestones**: Complete v1 → archive → start v2 with previous decisions as context.

---

## Comparison & Research

This project was built after deep-researching every major planning and execution tool in the Claude Code ecosystem (March 2026):

| Tool | Stars | Planning Depth | TDD | Per-Task Review | UAT |
|------|-------|:---:|:---:|:---:|:---:|
| **Deliberate Skills** | — | 9/10 | ✅ Mandatory | ✅ Two-stage | ✅ Browser |
| Superpowers | 40K | 6/10 | ✅ Mandatory | ✅ Two-stage | ❌ |
| GSD | 35K | 5/10 | ❌ | ❌ | ✅ Manual |
| OMC | active | 5/10 | ❌ Optional | ❌ End only | ❌ |
| gstack | new | 7/10 | ❌ | ❌ Phase only | ✅ Browser |

Full comparison methodology and research notes in [docs/comparison.md](docs/comparison.md).

---

## Contributing

PRs welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Areas where help is needed:**
- Eval framework (formal testing with skill-creator)
- More example outputs for different task types
- Cross-platform testing (Codex, Gemini CLI)

---

## License

MIT — See [LICENSE](LICENSE) for details.

---

**Claude Code is powerful. Deliberate Skills make it disciplined.**
