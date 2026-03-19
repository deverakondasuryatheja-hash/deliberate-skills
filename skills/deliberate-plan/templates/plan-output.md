# Plan Output Template v2.0

Every section is required. Use this exact structure.

---

```markdown
# [Plan Title]: [Brief Description]

**Task Type**: [IMPLEMENT | FIX | REFACTOR | MIGRATE | INTEGRATE | DESIGN]
**Date**: [Generated date]
**Clarity Score**: [X.X/5.0] (from Socratic interview)
**Deliberation Rounds**: [N]
**Refinement Rounds**: [N]
**Agent Team**: [List of agents]
**Harsh Critic Verdict**: [PASS | CONDITIONAL PASS]

---

## 1. Executive Summary

[3-4 sentences: What, why, expected outcome. No jargon — a PM should understand this.]

## 2. Plan Confidence Score

**Overall: [X.X/5.0] — [🟢 HIGH | 🟡 MEDIUM | 🔴 LOW]**

| Dimension | Weight | Score | Evidence |
|-----------|--------|-------|----------|
| Research Grounding | 15% | [1-5] | [Brief evidence] |
| Codebase Accuracy | 25% | [1-5] | [Brief evidence] |
| Assumption Freedom | 20% | [1-5] | [Brief evidence] |
| Completeness | 15% | [1-5] | [Brief evidence] |
| Harsh Critic Verdict | 15% | [1-5] | [Brief evidence] |
| Specificity | 10% | [1-5] | [Brief evidence] |

**Interpretation**:
- ≥ 4.5 🟢: Execute with standard review
- 3.5–4.4 🟡: Execute with extra review at flagged steps
- < 3.5 🔴: Do NOT execute — investigate open questions first

## 3. Research Foundation

### Best Practice (Chosen Approach)
[The approach we're taking, backed by research]
- **Source**: [Where this comes from]
- **Why this over alternatives**: [Brief rationale]

### Alternatives Considered & Rejected
| Alternative | Why Rejected |
|------------|-------------|
| [Alt 1] | [Reason] |
| [Alt 2] | [Reason] |

### Key Pitfalls to Avoid
- [Pitfall 1]: [How we're avoiding it]
- [Pitfall 2]: [How we're avoiding it]

## 4. Agent Deliberation Summary

### Team Composition
| Agent | Key Contribution | Notable Objections |
|-------|-----------------|-------------------|
| [Agent 1] | [Contribution] | [Objection] |
| [Agent 2] | [Contribution] | [Objection] |

### Key Debates & Resolutions
1. **[Topic]**: [Agent A] argued [X], [Agent B] argued [Y]. **Resolution**: [Z] because [rationale].
2. ...

### Trade-offs Accepted
| Decision | Gained | Sacrificed | Why Acceptable |
|----------|--------|-----------|----------------|
| [Decision] | [Benefit] | [Cost] | [Justification] |

## 5. Harsh Critic Report

**Verdict**: [PASS | CONDITIONAL PASS]
**Severity Calibration**: [Production/MVP/Prototype] — [Strict/Moderate/Pragmatic] review

### Issues Found
| Severity | Category | Description | Mitigated By |
|----------|----------|-------------|-------------|
| 🔴 | [Cat] | [Description] | [Mitigation] |
| 🟠 | [Cat] | [Description] | [Mitigation] |
| 🟡 | [Cat] | [Description] | [Noted in risk register] |

### Critic's Assessment
[2-3 sentence summary of the critic's overall view of the plan's strength and weakness]

## 6. Pre-Mortem Results

### Most Likely Failure Modes
| Rank | Category | Scenario | Prevention Added |
|------|----------|----------|-----------------|
| 1 | [Category] | [What happens] | [Step N modified / new step added] |
| 2 | [Category] | [What happens] | [Step N modified / new step added] |
| 3 | [Category] | [What happens] | [Accepted risk — see below] |

### Accepted Risks (from Pre-Mortem)
| Risk | Blast Radius | Why Accepted |
|------|-------------|-------------|
| [Risk] | [Impact scope] | [Justification] |

## 7. Implementation Steps

### Prerequisites
- [ ] [Prerequisite 1]
- [ ] [Prerequisite 2]

### Step-by-Step Plan

#### Step 1: [Clear, Action-Oriented Title]
- **Files**: `[exact/path/to/file.ts]` (modify) | `[exact/path/to/new-file.ts]` (create)
- **Action**: [Precise description]
- **Details**:
  - [Specific sub-action 1]
  - [Specific sub-action 2]
- **Verification**: [How to confirm correctness]
- **Rollback**: [How to undo]
- **Depends On**: [Step N] | None
- **Risk Level**: Low/Medium/High
- **Pre-Mortem Prevention**: [If this step has a pre-mortem prevention, reference it]

#### Step 2: ...

[Continue for all steps]

### Parallelizable Work
- Group A: Steps [X, Y] — no shared files or dependencies
- Group B: Steps [Z, W] — no shared files or dependencies

## 8. Dependency Graph

```
[Step 1] ──→ [Step 3] ──→ [Step 5]
[Step 2] ──→ [Step 4] ──↗
                         ──→ [Step 6]
```

## 9. Test Strategy

| Test File | Description | Type | Priority |
|-----------|------------|------|----------|
| `[exact path]` | [What it tests] | Unit/Integration/E2E | P0/P1/P2 |

### Test Execution Order
1. [First and why]
2. [Second]

### Acceptance Criteria
- [ ] [Criterion 1 — measurable]
- [ ] [Criterion 2]

## 10. Risk Register

| ID | Risk | Source | Prob | Impact | Mitigation | Detection |
|----|------|--------|------|--------|------------|-----------|
| R1 | [Risk] | Harsh Critic / Pre-Mortem / Red Team | L/M/H | L/M/H | [Mitigation] | [Detection] |

## 11. Rollback Plan

### Full Rollback Procedure
1. [Specific undo step]
2. [Data restoration if needed]
3. [Verification of rollback]

### Point of No Return
[Step after which rollback is significantly harder — and what to do]

## 12. Open Questions

| # | Question | Blocking? | Who Can Answer | Suggested Resolution |
|---|----------|-----------|---------------|---------------------|
| 1 | [Question] | Yes/No | [Person/team] | [Path forward] |

## 13. Assumption Audit

**✅ This plan contains zero unverified assumptions.**

| Claim | Verification Method | Result |
|-------|-------------------|--------|
| [File X at path Y] | `Read [path]` | ✅ Confirmed |
| [Function Z accepts A, B] | `Grep` | ✅ Confirmed |
| [Library supports W] | Official docs | ✅ Confirmed |

---

## Pipeline Handoff

**Plan Confidence**: [X.X/5.0] [🟢|🟡|🔴]
**Ready for Execution**: [Yes|No — if No, list blockers]

### Execution Options:
[Auto-detected based on environment — see SKILL.md Phase 5.4]
```

---

## Template Usage Notes

1. **Don't skip sections** — include "N/A — [reason]" if not applicable
2. **File paths must be verified** — never guess; use Glob/Read to confirm
3. **Verification steps mandatory** — every implementation step needs confirmation method
4. **Harsh Critic report required** — even if PASS, include the assessment
5. **Pre-Mortem required** — even if no likely failures found, document the analysis
6. **Confidence score is the final gate** — 🔴 plans should NOT be executed
