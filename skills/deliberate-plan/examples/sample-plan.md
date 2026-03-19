# Multi-Slot Booking System: Implementation Plan

**Task Type**: IMPLEMENT
**Date**: 2026-03-15
**Clarity Score**: 4.6/5.0
**Agent Team**: Architect, Backend Developer, DX Engineer, QA Strategist, Security Reviewer, Harsh Critic, Assumption Auditor
**Harsh Critic Verdict**: CONDITIONAL PASS
**Confidence**: 4.4/5.0 🟡 MEDIUM

## 1. Executive Summary

Add multi-slot booking to RoomShare's search page, allowing users to book 2+ time slots atomically with rollback on partial failure. Uses existing Supabase schema with a new HELD state for soft holds during the booking flow.

## 2. Confidence Score

| Dimension | Weight | Score | Evidence |
|-----------|--------|-------|----------|
| Research Grounding | 15% | 5 | Stripe/Airbnb booking patterns researched |
| Codebase Accuracy | 25% | 4 | All 12 files verified via Read |
| Assumption Freedom | 20% | 5 | Zero unverified assumptions |
| Completeness | 15% | 4 | All steps present, rollback plan included |
| Harsh Critic Verdict | 15% | 4 | Conditional: race condition mitigation noted |
| Specificity | 10% | 5 | Every path verified, no vague language |

## 3. Implementation Steps

### Step 1: Add HELD state to booking state machine
- **Files**: `src/types/booking.ts` (modify), `src/lib/state-machine.ts` (modify)
- **Action**: Add `HELD` to `BookingState` enum. Add transitions: `AVAILABLE → HELD`, `HELD → CONFIRMED`, `HELD → AVAILABLE` (timeout).
- **Verification**: `grep -n "HELD" src/types/booking.ts` returns the new state
- **Depends On**: None

### Step 2: Create soft hold API endpoint
- **Files**: `src/app/api/bookings/hold/route.ts` (create)
- **Action**: POST endpoint accepting `{ slotIds: string[], userId: string }`. Creates HELD records with 10-min TTL. Returns `{ holdId, expiresAt }`.
- **Verification**: `curl -X POST localhost:3000/api/bookings/hold` returns 201 with holdId
- **Depends On**: Step 1

[...continues for all steps...]

## 10. Assumption Audit

**✅ This plan contains zero unverified assumptions.**

| Claim | Method | Result |
|-------|--------|--------|
| `BookingState` enum in `src/types/booking.ts` | `Read src/types/booking.ts` | ✅ Line 14 |
| `state-machine.ts` uses switch pattern | `Read src/lib/state-machine.ts` | ✅ Line 28 |
| Supabase client in `src/lib/supabase.ts` | `Glob src/lib/supa*` | ✅ Exists |
