#!/usr/bin/env bash
# SessionStart hook — Detect existing state and suggest next action
# Runs when Claude Code starts a new session

PLAN_DIR=".deliberate-plan"

if [ -f "$PLAN_DIR/HANDOFF.json" ]; then
  MODE=$(cat "$PLAN_DIR/HANDOFF.json" | grep -o '"mode": *"[^"]*"' | head -1 | cut -d'"' -f4)
  echo "[deliberate] Paused session found (mode: $MODE). Say 'resume' to continue where you left off."
elif ls "$PLAN_DIR/artifacts"/plan-*.md 1>/dev/null 2>&1; then
  LATEST=$(ls -t "$PLAN_DIR/artifacts"/plan-*.md | head -1)
  HAS_EXEC=$(ls "$PLAN_DIR/artifacts"/execution-report-*.md 2>/dev/null | wc -l)
  if [ "$HAS_EXEC" -eq 0 ]; then
    echo "[deliberate] Plan ready but not executed: $LATEST. Say 'execute this plan' to start building."
  else
    HAS_UAT=$(ls "$PLAN_DIR/artifacts"/uat-report-*.md 2>/dev/null | wc -l)
    if [ "$HAS_UAT" -eq 0 ]; then
      echo "[deliberate] Execution complete. Say 'verify work' to run UAT."
    else
      echo "[deliberate] All phases complete. Say 'ship it' to create PR, or 'new milestone' to plan next version."
    fi
  fi
elif [ -d "$PLAN_DIR" ]; then
  echo "[deliberate] Planning directory exists but no plan found. Say 'plan this' to start."
fi
