# Quick Start Guide

Get productive with Deliberate Skills in under 5 minutes.

---

## 1. Install (30 seconds)

```bash
npx deliberate-skills
# Choose: global (all projects) or local (this project)
```

Or manually:
```bash
git clone https://github.com/suryadevera/deliberate-skills.git
cp -r deliberate-skills/skills/deliberate-plan ~/.claude/skills/
cp -r deliberate-skills/skills/deliberate-execute ~/.claude/skills/
```

## 2. Plan something (2 minutes)

Open Claude Code and type:
```
plan the user authentication system
```

Claude will:
- Ask 6 product questions (what problem, who, why now...)
- Score your request's clarity
- Ask domain-specific questions (JWT vs cookies? MFA?)
- Research best practices on the web
- Run 5-6 agents debating the approach
- Run a Harsh Critic review
- Do a pre-mortem ("what if this fails?")
- Deliver a confidence-scored plan

## 3. Execute it (2 minutes to start, runs autonomously)

```
execute this plan
```

Claude will:
- Write a failing test for each task (TDD)
- Implement with a fresh subagent
- Verify spec compliance (separate subagent)
- Review code quality (another separate subagent)
- Get Architect approval
- Run browser-automated UAT
- Offer to create a PR

## 4. Quick fixes (30 seconds)

```
quick fix the login button not working on mobile
```

Skips planning, but still enforces TDD + spec review + quality review.

---

## Key Commands

| You say | What happens |
|---------|-------------|
| "plan this feature" | Multi-agent deliberation → confidence-scored plan |
| "execute this plan" | TDD + review + UAT → working tested code |
| "quick fix [X]" | Fast path with quality enforcement |
| "ship it" | Creates PR from execution report |
| "resume" | Continues from paused session |
| "show me metrics" | Engineering retro with trend data |

---

## Tips

- **Be specific upfront** to skip interview questions (clarity score ≥ 4.0 skips them)
- **Say "fast"** for parallel execution of independent tasks
- **Say "don't stop"** for persistent mode (won't quit until Architect approves)
- Plans are saved to `.deliberate-plan/artifacts/` — they survive session restarts
