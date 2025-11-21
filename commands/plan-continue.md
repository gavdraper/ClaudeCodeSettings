---
description: Continue working on an existing plan from .claude/plans/
allowed-tools: [Glob, Read, Write, Bash, Edit, TodoWrite, Task]
argument-hint: [plan-file-name or leave empty to list]
---

# Continue Existing Plan

## Plan to Continue
$ARGUMENTS

## Process

1. **Find Plan**
   - If no argument provided, list all plans in `.claude/plans/` with their status
   - If plan name provided, read that specific plan file
   - Show current progress (completed vs pending tasks)

2. **Review Context**
   - Display plan overview and current status
   - Show completed tasks (checked boxes)
   - Highlight next pending task(s)

3. **Create Work Session**
   - Use TodoWrite to create tasks for the NEXT PHASE ONLY
   - If plan has no phases, create tasks for next 2-3 uncompleted items
   - Keep the plan file as source of truth

4. **Execute Next Chunk**
   - Work through tasks from the current phase/chunk only
   - After completing each task, update the plan file to check off items
   - **Run tests** after each implementation step
   - Verify all tests pass before marking phase complete
   - Update Status field if moving between phases
   - **STOP after completing the current phase/chunk**
   - Let user review progress and run /plan-continue again for next chunk

5. **Report Progress**
   - Count total tasks in plan (all checkboxes)
   - Count completed tasks (checked boxes)
   - Display: "Phase X completed. Progress: Y/Z tasks completed (N%)"
   - List which phase was just completed
   - Show next pending phase/tasks

## Important
- The plan file is the source of truth
- Work on ONE PHASE at a time, then stop
- **Tests must pass** before marking phase complete
- Update checkboxes in the plan as you complete tasks
- Update Status field when appropriate
- Add notes section if you discover new information
- Always stop after completing a phase to allow user review
- Always show progress summary at the end
