# Browser UAT Guide — Automated User Acceptance Testing

How to automatically test whether features work from a user's perspective using browser automation tools.

---

## Persistent Browser Session

**Do NOT launch a new browser for every test.** Launch once, reuse across all UAT items.

### Why
- Cold start: 3-5 seconds. Subsequent calls: 100-200ms (30x faster)
- Login state survives between tests — authenticate once, test everything
- Cookies, localStorage, tabs persist across commands
- Multi-step flows work naturally (add to cart → checkout → confirm)

### How
```bash
# At UAT start — launch persistent session
agent-browser open http://localhost:3000 2>/dev/null || pinchtab nav http://localhost:3000

# Login ONCE
agent-browser fill @email "test@example.com"
agent-browser fill @password "testpass"
agent-browser click @submit
# Session is now authenticated for ALL subsequent tests

# Run all UAT items against the same session
# agent-browser snapshot between each to verify state
```

### Cleanup
After all UAT items complete, close the browser session. Do not leave it running.

---

## Tool Detection Priority

Check for available tools in this order (best to worst for token efficiency):

### 1. agent-browser (Best — ~3K tokens per interaction)
```bash
which agent-browser 2>/dev/null
```
**Usage pattern:**
```bash
agent-browser open http://localhost:3000
agent-browser snapshot -i        # Get interactive elements with refs (@e1, @e2)
agent-browser click @e3          # Click element
agent-browser fill @e5 "test"    # Type into input
agent-browser snapshot           # Check result
agent-browser screenshot         # Visual evidence
```

### 2. PinchTab (~800 tokens per page read)
```bash
which pinchtab 2>/dev/null
```
**Usage pattern:**
```bash
pinchtab nav http://localhost:3000
sleep 2
pinchtab snap -i -c              # Compact interactive elements
pinchtab click e5                # Click element e5
pinchtab type e12 "test@email"   # Type into element
pinchtab text                    # Read page text
```

### 3. Playwright MCP
```bash
grep "playwright" ~/.claude.json .mcp.json 2>/dev/null
```
MCP tools: `navigate`, `click`, `fill`, `screenshot`, `evaluate`

### 4. Puppeteer MCP
```bash
grep "puppeteer" ~/.claude.json .mcp.json 2>/dev/null
```
MCP tools: `puppeteer_navigate`, `puppeteer_click`, `puppeteer_fill`, `puppeteer_screenshot`

### 5. Browser Tools MCP (AgentDeskAI)
```bash
grep "browser-tools" ~/.claude.json .mcp.json 2>/dev/null
```
Tools: Real-time console monitoring, Lighthouse audits, network inspection, accessibility checks

### 6. Claude in Chrome Extension
```bash
# Check via /mcp command — look for claude-in-chrome
```
Usage: Natural language browser commands via the extension's MCP server

### 7. No Browser Tool (Fallback)
If none available, present manual UAT checklist to the user.

---

## UAT Test Patterns

### Login Flow
```
1. Open [base_url]/login
2. Fill email field with "test@example.com"
3. Fill password field with "testpassword"
4. Click "Sign In" button
5. Verify: URL changed to /dashboard AND user name appears in header
```

### Form Submission
```
1. Open [base_url]/[form_page]
2. Fill all required fields with valid test data
3. Submit the form
4. Verify: Success message appears OR redirect to expected page
5. Edge case: Submit with empty required field → verify error message
```

### CRUD Operations
```
1. CREATE: Fill form, submit, verify item appears in list
2. READ: Navigate to list page, verify items render with correct data
3. UPDATE: Click edit, modify a field, save, verify change persists
4. DELETE: Click delete, confirm dialog, verify item removed from list
```

### API Endpoint (no browser needed)
```bash
# Use curl/fetch for API testing
curl -X POST http://localhost:3000/api/endpoint \
  -H "Content-Type: application/json" \
  -d '{"field": "value"}' \
  -w "\n%{http_code}"
# Verify: Status 200/201 and response body matches expected shape
```

### Responsive/Mobile (if screenshot available)
```
1. Open page
2. Set viewport to 375x667 (iPhone SE)
3. Screenshot → verify layout doesn't break
4. Set viewport to 768x1024 (iPad)
5. Screenshot → verify tablet layout
```

---

## UAT Report Format

```markdown
# UAT Report: [Feature Name]
**Date**: [YYYY-MM-DD]
**Browser Tool**: [agent-browser / pinchtab / playwright / manual]
**Base URL**: [http://localhost:3000]

## Results
| # | Test | Steps | Result | Evidence |
|---|------|-------|--------|----------|
| 1 | [Login works] | [5 steps] | ✅ PASS | [screenshot.png] |
| 2 | [Create booking] | [4 steps] | ❌→✅ | Fixed: [missing route], retested |
| 3 | [Edge: double submit] | [3 steps] | ❌ ESCALATED | [Diagnosis: no debounce] |

## Auto-Fixes Applied
| UAT Item | Failure | Root Cause | Fix |
|----------|---------|-----------|-----|
| #2 | 404 on submit | Route not registered | Added route in [file] |

## Remaining Issues (Escalated to User)
| UAT Item | Failure | Diagnosis | Suggested Fix |
|----------|---------|-----------|--------------|
| #3 | Double submit creates duplicates | No client-side debounce | Add debounce or server-side idempotency |
```

---

## Integration with deliberate-execute

UAT runs AFTER Architect verification (Phase 2.2) and BEFORE the execution is declared complete. The flow:

```
All tasks done → Full test suite green → Architect APPROVED → UAT testing → UAT PASS → DONE
                                                                    ↓
                                                              UAT FAIL → auto-fix (max 2) → re-test
                                                                    ↓
                                                              Still failing → escalate to user
```
