---
description: Update an existing plan with new information or changes
allowed-tools: [Glob, Read, Edit, Write]
argument-hint: <plan-file-name> <update description>
---

# Update Plan

## Arguments
$ARGUMENTS

## Process

1. **Locate Plan**
   - Find the specified plan in `.claude/plans/`
   - Read current content

2. **Apply Updates**
   - Add new tasks if scope expanded
   - Mark tasks complete by checking boxes
   - Update Status field if phase changed
   - Add to Notes section for discoveries
   - Update Risks if new ones identified

3. **Preserve History**
   - Don't remove completed tasks
   - Keep checked items visible for progress tracking
   - Add dated entries to Notes for significant changes

4. **Confirm**
   - Show what was updated
   - Display current progress summary
