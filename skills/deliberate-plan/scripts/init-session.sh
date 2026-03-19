#!/usr/bin/env bash
# Initialize a deliberate-plan session
# Creates the artifacts directory and checks for existing state

set -euo pipefail

PLAN_DIR=".deliberate-plan"
ARTIFACTS="$PLAN_DIR/artifacts"

mkdir -p "$ARTIFACTS"

# Check for existing plans
if ls "$ARTIFACTS"/plan-*.md 1>/dev/null 2>&1; then
  LATEST=$(ls -t "$ARTIFACTS"/plan-*.md | head -1)
  echo "[deliberate] Found existing plan: $LATEST"
  if [ -f "$ARTIFACTS/plan-meta.json" ]; then
    echo "[deliberate] Plan metadata:"
    cat "$ARTIFACTS/plan-meta.json"
  fi
  echo "[deliberate] Run deliberate-execute to implement, or deliberate-plan to create a new plan."
elif [ -f "$PLAN_DIR/HANDOFF.json" ]; then
  echo "[deliberate] Found paused session. Run deliberate-plan or deliberate-execute to resume."
  cat "$PLAN_DIR/HANDOFF.json"
else
  echo "[deliberate] No existing plans. Run deliberate-plan to start planning."
fi
