# Comparison with Other Tools

Honest comparison based on deep research across the Claude Code skill ecosystem (March 2026).

---

## Planning Comparison

| Dimension | Deliberate Plan | Superpowers | GSD | OMC | gstack |
|-----------|:-:|:-:|:-:|:-:|:-:|
| Multi-agent debate (5-6 agents) | ✅ | ❌ Single agent | ❌ Single planner | ❌ 3 fixed agents | ❌ Role-based |
| Task-type adapted agents | ✅ | ❌ | ❌ | ❌ | ❌ |
| Product-level review | ✅ 6 forcing Qs | ❌ | ❌ | ❌ | ✅ CEO review |
| Deep web research | ✅ | ❌ | ✅ 4 parallel | ❌ | ❌ |
| Domain preference capture | ✅ Gray areas | ❌ | ✅ Discuss phase | ❌ | ❌ |
| Harsh Critic review | ✅ Severity-rated | ❌ | ❌ Plan checker | ❌ | ❌ |
| Pre-mortem analysis | ✅ 9 categories | ❌ | ❌ | ❌ | ❌ |
| Assumption verification | ✅ Auditor agent | ❌ | ❌ | ❌ | ❌ |
| Confidence scoring | ✅ 6-dimension | ❌ | ❌ | ❌ | ❌ |

## Execution Comparison

| Dimension | Deliberate Execute | Superpowers | GSD | OMC | gstack |
|-----------|:-:|:-:|:-:|:-:|:-:|
| Mandatory TDD | ✅ Code deleted | ✅ Code deleted | ❌ | ❌ Optional | ❌ |
| Per-task code review | ✅ Two-stage | ✅ Two-stage | ❌ | ❌ End only | ❌ Phase only |
| Parallel execution | ✅ Batched | ❌ Sequential | ✅ Waves | ✅ 5 agents | ✅ Conductor |
| Browser-automated UAT | ✅ Persistent | ❌ | ✅ Manual | ❌ | ✅ Playwright |
| Debugging escalation | ✅ 3-fail + diagnosis | ✅ 3-fail + arch review | ❌ Debug agents | ❌ | ❌ |
| Context isolation | ✅ Fresh per task | ✅ Fresh per task | ✅ Fresh per plan | ❌ Shared | ❌ |
| Edit lock / drift prevention | ✅ PreToolUse hook | ❌ | ❌ | ❌ | ✅ /freeze |
| Cognitive mode separation | ✅ Per-agent | ❌ | ❌ | ❌ | ✅ Explicit roles |
| Auto-ship (PR) | ✅ On request | ✅ Branch cleanup | ✅ /gsd:ship | ❌ | ✅ /ship |
| Retro metrics | ✅ JSON trends | ❌ | ❌ | ❌ | ✅ /retro |
| Quick mode | ✅ With quality gates | ❌ | ✅ /gsd:quick | ❌ | ❌ |
| Persistence loop | ✅ Until architect | ❌ | ❌ | ✅ Ralph | ❌ |

## Overall Scores

| Tool | Planning | Execution | Combined |
|------|:---:|:---:|:---:|
| **Deliberate Skills** | **9/10** | **9/10** | **9/10** |
| Superpowers (40K stars) | 6/10 | 8/10 | 7/10 |
| GSD (35K stars) | 5/10 | 6/10 | 5.5/10 |
| OMC (active) | 5/10 | 7/10 | 6/10 |
| gstack (new) | 7/10 | 6/10 | 6.5/10 |

---

## When to Use What

- **Deliberate Skills**: When you need the deepest planning AND most disciplined execution
- **Superpowers**: When you want battle-tested TDD across an established ecosystem
- **GSD**: When you're a solo dev who wants end-to-end lifecycle management
- **OMC**: When you need maximum parallel speed with 19 specialized agents
- **gstack**: When you want CEO-level product thinking + browser QA

They're all complementary. Deliberate Skills can work alongside any of them.
