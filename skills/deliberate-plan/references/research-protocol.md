# Research Protocol v2.0 — Deep Web Research Guide

How to conduct thorough internet research during Phase 1. Uses Claude's web search to find best practices, reference implementations, and common pitfalls before touching any code.

---

## Research Strategy

Run **multiple focused searches** per question — quality comes from breadth and depth. For each research question, try 2-3 different search angles (official docs, engineering blogs, GitHub issues/discussions).

**Per question, run at least**:
1. An official docs / authoritative source search
2. A real-world experience / engineering blog search
3. A pitfalls / "what went wrong" search

This triangulation catches things a single search misses.

---

## Research Queries by Task Type

### IMPLEMENT — "How should we build this?"
1. `[technology] best practices [feature type] 2025 2026`
2. `[feature type] production architecture [framework]`
3. `[feature type] common mistakes pitfalls`
4. `[comparable product] [feature] engineering blog`
5. `"[specific pattern]" implementation guide`

### FIX — "Why does this break and what's the right fix?"
1. `[error message] [framework] [version]`
2. `[symptom] [technology] root cause`
3. `[component] [failure mode] fix`
4. `[library] [version] known issues changelog`
5. `[similar bug] regression prevention`

### REFACTOR — "What's the target state?"
1. `[current pattern] to [target pattern] migration`
2. `[target pattern] best practices [framework]`
3. `[current pattern] problems limitations`
4. `incremental refactoring [scope] strategies`
5. `[target pattern] testing strategy`

### MIGRATE — "How do others handle this?"
1. `migrate from [source] to [target] guide 2025 2026`
2. `[source] to [target] breaking changes`
3. `[target] migration rollback strategy`
4. `[source] vs [target] comparison production`
5. `[target] gotchas production deployment`

### INTEGRATE — "How does this service actually work?"
1. `[service] API documentation` (always start here)
2. `[service] [framework] integration guide`
3. `[service] production best practices`
4. `[service] error handling retry strategy`
5. `[service] webhook reliability idempotency`

### DESIGN — "What are proven patterns?"
1. `[system type] architecture patterns`
2. `[system type] scalability design`
3. `[similar system] engineering blog architecture`
4. `[system type] data model design`
5. `[system type] failure modes distributed systems`

---

## Source Priority (highest → lowest)

1. Official framework/library documentation
2. Engineering blogs from scale-comparable companies (Airbnb, Stripe, Vercel, etc.)
3. Conference talks and technical papers
4. Well-maintained open source reference implementations
5. Stack Overflow accepted answers (high vote count)
6. Community tutorials (verify against official docs)

---

## Research Quality Checks

After completing research:
1. **Recency**: Sources from last 2 years? Older may reference deprecated patterns.
2. **Relevance**: Match our tech stack and scale?
3. **Credibility**: Authoritative organizations or experienced practitioners?
4. **Consistency**: Multiple independent sources agree?
5. **Completeness**: Covered best practices, pitfalls, alternatives, testing?

If conflicting best practices found, document ALL approaches with trade-offs → let Phase 3 agents resolve which fits.

---

## Research Brief Template

```markdown
## Research Brief: [Feature/Task Name]
**Date**: [Date]
**Queries Executed**: [N]
**Sources Reviewed**: [N]

### 1. Recommended Approach (Consensus)
[What most authoritative sources recommend]
**Confidence**: High/Medium/Low
**Source(s)**: [Key sources]

### 2. Alternative Approaches
| Approach | Pros | Cons | Best When |
|----------|------|------|-----------|
| [Alt 1] | | | |
| [Alt 2] | | | |

### 3. Critical Pitfalls (Ranked by Severity)
1. **[Pitfall]**: [Description]. Mitigation: [How to avoid]
2. **[Pitfall]**: [Description]. Mitigation: [How to avoid]

### 4. Reference Implementations
- [Project/Company]: [How they solved this]

### 5. Technical Decisions Requiring Codebase Context
[Decisions needing Phase 2 analysis to resolve]

### 6. Key Numbers & Benchmarks
[Performance benchmarks, scalability limits, cost data]
```
