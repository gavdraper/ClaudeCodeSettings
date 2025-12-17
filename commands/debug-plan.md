---
description: Create a debug plan for investigating and resolving an issue
allowed-tools: [Bash, Glob, Grep, Read, Write, Task, TodoWrite]
argument-hint: <description of the issue to debug>
---

# Debug Plan Creation

You are creating a **debug plan** - a structured document for tracking investigation and resolution of a specific issue.

## Issue Description
$ARGUMENTS

## Your Objective

Create a comprehensive debug plan that:
1. Prevents circular debugging (trying the same fixes repeatedly)
2. Documents what has been tried and the results
3. Isolates the problem with a minimal failing test
4. Tracks progress toward resolution

## Process

### 1. Understand the Issue
- Gather error messages, stack traces, and logs
- Identify the expected vs actual behavior
- Note any conditions that trigger the issue
- Check git history for recent relevant changes

### 2. Create Minimal Reproduction Test
- **CRITICAL**: Before any fixes, create the smallest possible failing test
- This test should:
  - Isolate the specific behavior that's broken
  - Fail with the current code
  - Pass when the issue is fixed
  - Live in the appropriate test directory
- Document the test file and test name in the plan

### 3. Form Initial Hypotheses
- List 2-5 possible root causes based on investigation
- Order by likelihood
- Note what evidence would confirm/deny each hypothesis

### 4. Create Debug Plan File
- Create `.claude/debug-plans/` directory if it doesn't exist
- Generate plan file: `.claude/debug-plans/YYYY-MM-DD-issue-name.md`
- Structure as checklist with investigation steps

## Debug Plan File Structure

```markdown
# Debug: [Issue Name]

**Created**: YYYY-MM-DD
**Status**: Investigating | In Progress | Resolved | Blocked
**Severity**: Critical | High | Medium | Low

## Problem Statement
[Clear description of the issue, including expected vs actual behavior]

## Environment/Context
- [Relevant environment details]
- [Steps to reproduce]
- [Error messages/stack traces]

## Reproduction Test
- **Test File**: `path/to/test/file.test.ts`
- **Test Name**: `should [expected behavior]`
- **Status**: Failing (as expected) | Passing (issue resolved)

```
[Include the actual minimal test code here]
```

## Hypotheses

### Hypothesis 1: [Most likely cause]
- **Likelihood**: High | Medium | Low
- **Evidence for**: [What suggests this]
- **Evidence against**: [What contradicts this]
- **Status**: Untested | Testing | Confirmed | Ruled Out

### Hypothesis 2: [Second possibility]
- **Likelihood**: High | Medium | Low
- **Evidence for**: [What suggests this]
- **Evidence against**: [What contradicts this]
- **Status**: Untested | Testing | Confirmed | Ruled Out

## Investigation Log

### [Date/Time] - Initial Investigation
- [ ] Gathered error messages and stack traces
- [ ] Identified relevant code paths
- [ ] Created minimal reproduction test
- [ ] Listed initial hypotheses

### [Date/Time] - [Investigation Phase Name]
- [ ] [Specific action to try]
- [ ] [Expected outcome]
- [ ] [Actual result - filled in after trying]

## Attempted Fixes

### Fix 1: [Description]
- **Date Attempted**: YYYY-MM-DD
- **What was changed**: [Files/lines modified]
- **Result**: Failed | Partial | Success
- **Why it didn't work**: [Analysis if failed]
- **Rollback?**: Yes/No

### Fix 2: [Description]
- **Date Attempted**: YYYY-MM-DD
- **What was changed**: [Files/lines modified]
- **Result**: Failed | Partial | Success
- **Why it didn't work**: [Analysis if failed]
- **Rollback?**: Yes/No

## Current Understanding
[Updated as investigation progresses - what we now know about the root cause]

## Next Steps
- [ ] [Next action to take]
- [ ] [Following action]

## Resolution
[Filled in when issue is resolved]
- **Root Cause**: [What was actually wrong]
- **Fix Applied**: [What change resolved the issue]
- **Verification**: [How we confirmed the fix - reproduction test passing]
- **Prevention**: [How to prevent similar issues]
```

## Important Rules

1. **Test First**: ALWAYS create a failing test before attempting any fix
2. **Document Everything**: Every attempted fix must be logged with results
3. **No Circular Debugging**: Check "Attempted Fixes" before trying anything
4. **Update Status**: Keep hypothesis statuses current
5. **Rollback Failed Fixes**: Don't leave broken fix attempts in code

Present the plan summary and inform the user where the debug plan file was saved.
Remind them to use `/debug-plan-continue [plan-name]` to continue working on this debug plan.
