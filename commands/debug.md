---
description: Structured debugging workflow using debugging agent
allowed-tools: [Bash, Glob, Grep, Read, Write, Task, TodoWrite]
argument-hint: <description of the issue>
---

# Debugging Session

## Issue Description
$ARGUMENTS

## Process

1. **Gather Initial Context**
   - Collect error messages, stack traces, logs
   - Check git log for recent changes
   - Note environment details (dev/staging/prod)

2. **Delegate to Debugging Agent**
   - Use the debugging agent for systematic investigation
   - Agent will:
     - Reproduce the issue
     - Form and test hypotheses
     - Identify root cause (not just symptoms)
     - Propose solution with explanation

3. **Solution Implementation**
   - If fix is simple: implement directly
   - If fix is complex: create plan file in `.claude/plans/`
   - Use TodoWrite for tracking fix steps
   - Suggest tests to prevent regression

4. **Validation**
   - Run tests to verify fix
   - Validate build succeeds
   - Document findings for future reference

Present findings with code references and line numbers.
