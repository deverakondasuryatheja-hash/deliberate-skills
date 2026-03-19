# Retro Metrics — Post-Execution Analysis

After completing a milestone or significant execution, generate engineering metrics to track improvement over time.

---

## When to Run

- After `/deliberate-execute` completes (suggested automatically)
- After milestone completion
- On user request: "show me metrics", "retro", "how did that go"

---

## Metrics to Compute

### From Execution Reports

Parse all `execution-report-*.md` files in `.deliberate-plan/artifacts/`:

| Metric | How to Compute | What It Shows |
|--------|---------------|---------------|
| **Tasks completed** | Count all ✅ tasks | Volume |
| **TDD compliance** | Tasks with TDD ÷ total tasks | Quality discipline |
| **TDD skip rate** | TDD SKIP count ÷ total | Where discipline slips |
| **Spec review fail rate** | FAIL verdicts ÷ total reviews | Plan specificity quality |
| **Quality review fail rate** | REQUEST CHANGES ÷ total reviews | Code quality |
| **Avg fix attempts** | Total attempts ÷ tasks with failures | Implementation difficulty |
| **Escalation count** | Tasks that hit 3-failure escalation | Problem areas |
| **Escalation diagnosis** | Count of: code bug / design flaw / plan error | Root cause patterns |
| **UAT pass rate** | PASS ÷ total UAT items | Feature correctness |
| **Auto-fix success** | UAT items fixed automatically ÷ total failures | Automation effectiveness |

### From Plan Reports

Parse all `plan-*.md` and `plan-meta.json`:

| Metric | How to Compute | What It Shows |
|--------|---------------|---------------|
| **Confidence score avg** | Average across plans | Planning quality trend |
| **Harsh Critic verdict distribution** | PASS / CONDITIONAL / FAIL counts | Plan rigor |
| **Research depth** | Avg web searches per plan | Research thoroughness |
| **Debate rounds** | Avg rounds to convergence | Deliberation efficiency |

### From Git

```bash
# Lines changed
git log --oneline --since="1 week ago" --numstat | awk '{a+=$1; b+=$2} END {print "Added:", a, "Deleted:", b}'

# Commits per task
git log --oneline --since="1 week ago" | wc -l

# Test files vs implementation files
find . -name "*.test.*" -newer .deliberate-plan/artifacts/ | wc -l
find . -name "*.ts" -not -name "*.test.*" -newer .deliberate-plan/artifacts/ | wc -l
```

---

## Output Format

```markdown
# Engineering Retro: [Milestone/Date]

## Summary
- Tasks: [N] completed, [N] with issues
- TDD compliance: [X]% ([N] skips)
- Spec review pass rate: [X]% first-try
- Quality review pass rate: [X]%
- UAT pass rate: [X]%
- Escalations: [N] (code bug: [N], design flaw: [N], plan error: [N])

## Trends (vs previous milestone)
- TDD compliance: [↑/↓/→] [X]%
- Spec review fails: [↑/↓/→] [X]
- Confidence scores: [↑/↓/→] [X.X]

## Improvement Actions
- [Based on data: "Spec review failures concentrated in API tasks → improve API preference capture"]
- [Based on data: "3 escalations were plan errors → spend more time on codebase analysis"]

## Raw Data
[JSON snapshot for trend tracking]
```

Save to `.deliberate-plan/artifacts/retro-YYYYMMDD.json` and `.deliberate-plan/artifacts/retro-YYYYMMDD.md`.

---

## Trend Tracking

Each retro saves a JSON snapshot:
```json
{
  "date": "2026-03-19",
  "milestone": "v1.0",
  "tasks_completed": 15,
  "tdd_compliance": 0.93,
  "spec_review_pass_rate": 0.87,
  "quality_review_pass_rate": 0.80,
  "uat_pass_rate": 0.93,
  "escalations": 1,
  "confidence_avg": 4.3,
  "lines_added": 2400,
  "lines_deleted": 180,
  "test_to_code_ratio": 0.45
}
```

Compare across milestones to see improvement over time.
