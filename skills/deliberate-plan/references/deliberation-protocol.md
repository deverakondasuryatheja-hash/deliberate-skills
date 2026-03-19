# Deliberation Protocol v2.0 — Multi-Agent Debate Rules

Structured debate process to produce high-quality plans. Includes harsh critic review, pre-mortem analysis, and state persistence. All agents run on Opus 4.6.

---

## Execution Modes

### Mode A: Agent Teams (Best)
Requires `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`. Spawn team with each agent as a teammate. Real parallel deliberation with inter-agent messaging. Team lead coordinates.

### Mode B: Subagents (Good)
Requires Task tool. Spawn parallel subagents with persona prompts. Use `run_in_background: true`. Main session synthesizes debate rounds.

### Mode C: Simulated Deliberation (Always available)
Main session adopts each persona sequentially. Must maintain perspective integrity — when wearing the QA hat, think like QA, not a developer. Document each distinct perspective before synthesizing.

**Auto-detect** at Phase 3 start:
```bash
echo $CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS  # non-empty → MODE_A
# Check Task tool availability → MODE_B
# Fallback → MODE_C
```

---

## Agent Prompt Template (Phase 3.3)

```
You are the [ROLE NAME] on a planning team.

## Your Lens
[Agent's cognitive lens from agent-roster.md]

## Context
### Research Brief
[Phase 1 output — include cross-model disagreements if any]

### Codebase Analysis
[Phase 2 output]

## Task
[User's original request + Socratic interview results]

## Your Job
1. **Approach**: What do you recommend from your domain perspective?
2. **Risks**: What risks or concerns do you see that others might miss?
3. **Steps**: What specific implementation steps do you recommend?
4. **Non-Negotiables**: What MUST be in the plan? (hard requirements)
5. **Objections**: What parts of a naive approach would you push back on?
6. **Dependencies**: What does your part depend on, and what depends on it?
```

---

## Cross-Examination Protocol (Phase 3.4)

### Round 1: Challenge Assumptions (Adversarial)

For each agent pair with overlapping concerns:

```
[Agent A] proposed: "[specific proposal]"
[Agent B] has concerns: "[specific concern]"

Resolution Required:
- Compatible? If not, what modification resolves both?
- If irreconcilable, which takes priority and why?
```

**Rules:**
- Every proposal faces at least one challenge
- No "I agree" without specific reasoning
- Assumption Auditor verifies every factual claim
- Document every disagreement and its resolution

### Round 2: Convergence (Collaborative)

1. **Agreed Foundation**: Consensus points → plan's core
2. **Resolved Disagreements**: Each with chosen resolution and rationale
3. **Trade-offs Documented**: What was sacrificed and why acceptable
4. **Open Questions**: What can't be resolved without more info

**Rules:**
- Architect breaks ties with documented reasoning
- Trade-offs must be explicit
- "We'll figure it out later" is NOT acceptable

### Round 3: Gap Analysis (Stress Test)

Walk through the emerging plan step by step:

```
Step [N]: [Description]
- Files touched: [verified list]
- QA Strategist: What could go wrong?
- Security Reviewer: Security implications?
- DX Engineer: Clear and maintainable?
- Assumption Auditor: Everything verified?
```

Every step examined by 2+ agents. Gaps must be filled before Phase 4.

---

## Harsh Critic Protocol (Phase 3.5)

The Harsh Critic is an INDEPENDENT adversarial voice. Not the QA Strategist re-reviewing — a fresh pair of eyes seeing the full plan for the first time after debate convergence.

### Step 1: Realist Check (Severity Calibration)

Before issuing any critique, answer:

| Question | Answer determines... |
|----------|---------------------|
| Is this production or prototype? | Strictness level |
| What's the blast radius of a flaw? | Severity thresholds |
| What's the cost of over-engineering? | Where to draw the line |
| Who uses this? Internal team or end users? | Impact calibration |
| What's the deployment timeline? | Pragmatism vs perfectionism |

**Calibration output**: "This is a [production/MVP/prototype] system affecting [scope]. I will calibrate severity accordingly — [strict/moderate/pragmatic] review."

### Step 2: Severity-Rated Critique

Review the ENTIRE plan. For each issue:

```
[SEVERITY] [Category]: [Description]
- Evidence: [What in the plan triggers this concern]
- Blast Radius: [What breaks if this is wrong]
- Mitigated By: [Specific action to address this]  ← REQUIRED for 🔴 and 🟠
```

| Severity | Meaning | Action |
|----------|---------|--------|
| 🔴 **BLOCKER** | Plan will fail or cause damage | Must fix before proceeding |
| 🟠 **MAJOR** | Significant risk of problems | Should fix; document if not |
| 🟡 **MINOR** | Could be better but acceptable | Note in risk register |
| ⚪ **NIT** | Style/preference | Ignore unless trivial to fix |

### Step 3: Harsh Critic Verdict

- **PASS**: Zero 🔴 blockers, all 🟠 have documented mitigations
- **CONDITIONAL PASS**: Has 🟠 with acceptable trade-offs documented
- **FAIL**: Has 🔴 blockers → plan returns to Phase 3.4 for another round

**FAIL limit**: Maximum 2 FAIL cycles. If the plan fails twice, document remaining blockers as known risks with blast radius and proceed — don't get stuck in infinite loops.

---

## Pre-Mortem Protocol (Phase 4, Round 3)

This is NOT "what could go wrong with each step" (that's the adversarial review). This is "assume the ENTIRE plan failed — what killed it?"

### Methodology

1. **Assume failure**: "The plan was executed perfectly as written. The result was a failure. Why?"
2. **Brainstorm failure modes** across these categories:

| Category | Prompt |
|----------|--------|
| **Integration Failure** | "This worked in isolation but broke when it touched ___" |
| **Sequencing Failure** | "Step N ran before its true dependency was ready because ___" |
| **Data Assumption Failure** | "Production data looked like ___ instead of what we expected" |
| **Scale Failure** | "This worked for 10 users but broke at ___ because ___" |
| **Rollback Failure** | "We tried to roll back but ___ was irreversible" |
| **Human Failure** | "A developer misread step ___ and did ___" |
| **Timing Failure** | "___ changed during the execution window" |
| **Environment Failure** | "Works on dev/staging but fails in production because ___" |
| **Dependency Failure** | "External service ___ was down/changed/rate-limited during ___" |

3. **For each failure mode**: Either add preventive measure to the plan OR document as accepted risk with blast radius estimate.

### Output format

```
## Pre-Mortem Analysis

### Most Likely Failure: [Category]
- Scenario: [what happens]
- Prevention: [added to plan step N]

### Second Most Likely: [Category]
- Scenario: [what happens]
- Prevention: [added to plan step N]

### Accepted Risks
| Risk | Category | Blast Radius | Why Accepted |
|------|----------|-------------|-------------|
```

---

## Refinement Rounds Quick Reference

| Round | Name | Focus | Agent Leading |
|-------|------|-------|---------------|
| 1 | Assumption Hunt | Verify every factual claim | Assumption Auditor |
| 2 | Specificity Check | Junior Dev Test | DX Engineer |
| 3 | Pre-Mortem | Systemic failure modes | Harsh Critic |
| 4 | Adversarial Red Team | Step-level attack surface | QA Strategist |
| 5 | Final Consensus | All agents approve | Architect (tie-break) |

---

## State Persistence

Save artifacts at each phase for context survival (compaction, session restart):

```
.deliberate-plan/
├── artifacts/
│   ├── interview-YYYYMMDD-HHMMSS.md    # Phase 0 results
│   ├── research-brief.md                # Phase 1 output
│   ├── codebase-analysis.md             # Phase 2 output
│   ├── agent-perspectives.md            # Phase 3.3 output
│   ├── debate-log.md                    # Phase 3.4 output
│   ├── harsh-critic-report.md           # Phase 3.5 output
│   ├── plan-YYYYMMDD-HHMMSS.md         # Final plan
│   └── plan-meta.json                   # Machine-readable metadata
```

This allows resuming planning after context compaction by reading the latest artifact files.

---

## Anti-Patterns to Avoid

1. **Echo Chamber**: Agents agreeing without challenge → Assumption Auditor MUST challenge 3+ claims per round
2. **Analysis Paralysis**: Infinite loops → Hard cap: 5 refinement rounds + 2 Harsh Critic FAIL cycles max
3. **Scope Creep**: Proposals beyond original task → Every proposal must trace to task statement
4. **Over-Engineering**: Complexity for complexity's sake → DX Engineer challenges solutions not explainable in 2 sentences
5. **Assumption Laundering**: Assumptions disguised as "decisions" → Auditor distinguishes verified facts from unverified decisions
6. **Premature Convergence**: Quick agreement → At least 2 genuine challenges before convergence
7. **Severity Inflation**: Harsh Critic flags everything as 🔴 → Realist Check calibrates severity to context
