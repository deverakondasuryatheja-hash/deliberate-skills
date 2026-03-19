# Execution Report Template

Use this structure when execution completes (Phase 2.3).

---

```markdown
# Execution Report: [Feature/Task Name]

**Date**: [YYYY-MM-DD]
**Plan Source**: [deliberate-plan / superpowers / OMC / manual]
**Execution Mode**: [Sequential / Parallel / Persistent]
**Architect Verdict**: [APPROVED / NEEDS WORK]

---

## Summary

**Tasks**: [Completed]/[Total]
**Tests**: [Pass count] passing, [Fail count] failing, [Skip count] skipped
**Batches**: [N] batches ([N] parallel, [N] sequential)
**Escalations**: [N] (debugging escalation triggered [N] times)
**Duration**: [Approximate total time]

## Per-Task Results

| # | Task | TDD | Impl | Spec Review | Quality Review | Status |
|---|------|-----|------|-------------|----------------|--------|
| 1 | [Title] | 🔴→🟢 | ✅ | PASS | APPROVE | ✅ Done |
| 2 | [Title] | SKIP: config | ✅ | PASS | APPROVE | ✅ Done |
| 3 | [Title] | 🔴→🟢 | ✅ (2 attempts) | PASS | REQUEST→FIX→APPROVE | ✅ Done |

## Files Modified

| File | Action | Task | Summary |
|------|--------|------|---------|
| `src/path/file.ts` | Modified | Task 1 | [What changed] |
| `src/path/new-file.ts` | Created | Task 2 | [What it does] |
| `tests/path/file.test.ts` | Created | Task 1 | [What it tests] |

## Test Coverage

### New Tests Added
| Test File | Tests | Covers |
|-----------|-------|--------|
| `[path]` | [N] tests | [What feature/behavior] |

### Full Suite Results
- **Total**: [N] tests
- **Passing**: [N]
- **Failing**: [N]
- **New since execution start**: [N] tests added

## Issues Encountered

### Spec Review Failures
| Task | Issue | Resolution |
|------|-------|------------|
| [N] | [What was wrong] | [How it was fixed] |

### Quality Review Issues
| Task | Severity | Issue | Resolution |
|------|----------|-------|------------|
| [N] | CRITICAL | [Issue] | Fixed |
| [N] | IMPORTANT | [Issue] | Noted for follow-up |

### Debugging Escalations
| Task | Attempts | Diagnosis | Resolution |
|------|----------|-----------|------------|
| [N] | 3 → escalated | [CODE BUG/DESIGN FLAW/PLAN ERROR] | [What was done] |

## Architect Verification

**Verdict**: [APPROVED]
**Iterations**: [N] (first pass / needed [N] fixes)
**Notes**: [Any architect observations]

## Follow-Up Items

| Priority | Item | Reason |
|----------|------|--------|
| [P1/P2/P3] | [What needs doing] | [From quality review / architect notes] |

## TDD Skip Log

| Task | Reason |
|------|--------|
| [N] | [Justification for skipping TDD] |
```
