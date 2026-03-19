# Debugging Escalation Protocol

When a task's implementation fails repeatedly, escalate systematically instead of retrying blindly.

---

## The 3-Failure Rule

After 3 consecutive failed attempts to fix a failing test or implementation issue:

### 1. STOP Immediately
Do not attempt a 4th fix. Three failures means the approach itself is likely wrong, not just the code.

### 2. Diagnose — Dispatch Architectural Review

Dispatch the Architectural Review subagent (see `agent-prompts.md`) with:
- The original task spec
- Summary of all 3 attempts and why each failed
- The current error state
- Relevant codebase context

### 3. Act on Diagnosis

| Diagnosis | Action |
|-----------|--------|
| **CODE BUG** | Provide specific fix direction to implementer. Resume task cycle with guidance. Max 2 more attempts. |
| **DESIGN FLAW** | Modify the task approach. Update the task spec. Restart from TDD Gate with new approach. |
| **PLAN ERROR** | PAUSE execution. Surface to user: "Task [N] has a plan problem: [diagnosis]. Options: (A) modify plan, (B) skip task, (C) abort." |

### 4. Second Escalation

If the task fails AGAIN after architectural review (total 5+ attempts):
- Surface to user unconditionally
- Present: the task, what was tried, the diagnosis, and ask for direction
- Do NOT keep retrying autonomously

---

## 4-Phase Systematic Debugging

When debugging within the 3-attempt window, follow this structured approach:

### Phase 1: Reproduce
- Get the exact error message and stack trace
- Identify the minimal reproduction steps
- Confirm the error is deterministic (not flaky)

### Phase 2: Root Cause Trace
- Read the actual failing code path (don't guess)
- Trace from the error backwards to find the root cause
- Distinguish: is this the ROOT cause or a SYMPTOM?
- Check: did a recent change cause this, or is it pre-existing?

### Phase 3: Hypothesize & Test
- Form a specific hypothesis: "The error occurs because [X] when [Y]"
- Design a minimal test that proves or disproves the hypothesis
- If hypothesis is wrong → go back to Phase 2 with new information

### Phase 4: Fix & Verify
- Apply the minimal fix for the confirmed root cause
- Run the specific failing test → must pass
- Run the full test suite → no regressions
- If new failures appear → they're separate issues, not re-attempts

---

## Anti-Patterns in Debugging

1. **Shotgun debugging**: Changing multiple things hoping something works → Change ONE thing at a time
2. **Symptom fixing**: Adding workarounds without understanding the cause → Trace to root cause first
3. **Scope creep**: Refactoring during debugging → Fix the bug only, refactor later
4. **Stale evidence**: Assuming test results from 3 tool calls ago are still valid → Run tests fresh every time
5. **Hope-driven development**: "I think this should work" → Verify with actual test execution
