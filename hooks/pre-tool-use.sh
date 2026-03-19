#!/usr/bin/env bash
# PreToolUse hook — Drift prevention + Edit Lock
# Runs before Write/Edit operations during execution
# Checks if the file being modified is in the current task's scope

PLAN_DIR=".deliberate-plan"
STATE_FILE="$PLAN_DIR/artifacts/execution-state.json"

# Only run during active execution
if [ ! -f "$STATE_FILE" ]; then
  exit 0
fi

# Get the file being modified (passed as first argument by Claude Code hook system)
TARGET_FILE="${1:-}"
if [ -z "$TARGET_FILE" ]; then
  exit 0
fi

# Get allowed files from current task
ALLOWED_FILES=$(cat "$STATE_FILE" 2>/dev/null | grep -o '"allowed_files": *\[[^]]*\]' | head -1)
CURRENT_TASK=$(cat "$STATE_FILE" 2>/dev/null | grep -o '"current_task": *"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -n "$ALLOWED_FILES" ]; then
  # Check if target file is in allowed list
  if echo "$ALLOWED_FILES" | grep -q "$(basename "$TARGET_FILE")"; then
    exit 0  # File is allowed
  else
    echo "[deliberate] ⚠️ EDIT LOCK: '$TARGET_FILE' is NOT in Task $CURRENT_TASK's file list."
    echo "[deliberate] Allowed files: $ALLOWED_FILES"
    echo "[deliberate] Modify the task spec first if this file needs changes."
  fi
fi
