---
description: Continue working on an existing debug plan until issue is resolved
allowed-tools: [Bash, Glob, Grep, Read, Write, Edit, Task, TodoWrite]
argument-hint: [debug-plan-name or leave empty to list]
---

# Continue Debug Plan

You are continuing work on an **existing debug plan**. Your goal is to systematically resolve the issue while preventing circular debugging.

## Debug Plan to Continue
$ARGUMENTS

## Process

### 1. Find and Load Plan
- If no argument provided, list all plans in `.claude/debug-plans/` with their status
- If plan name provided, read that specific debug plan file
- Display current status and progress summary

### 2. Review What's Been Tried
**CRITICAL**: Before doing ANYTHING, review the "Attempted Fixes" section.
- List all previously attempted fixes
- Note why each failed
- DO NOT retry any fix that has already been attempted unless you have new information

### 3. Check Reproduction Test Status
- Run the reproduction test to confirm current state
- If test passes: Issue may already be resolved - verify and update plan
- If test fails: Continue investigation

### 4. Execute Next Investigation Step
Based on plan status, choose ONE of these paths:

**Path A: Testing Hypotheses**
- Take the highest-likelihood untested hypothesis
- Design a specific test/check to confirm or rule it out
- Execute the test
- Update hypothesis status in the plan with results

**Path B: Attempting a Fix**
- Select a fix based on confirmed hypothesis
- BEFORE implementing:
  - Check "Attempted Fixes" to ensure this hasn't been tried
  - If similar fix was tried, explain why this attempt is different
- Implement the fix
- Run the reproduction test
- Log results in "Attempted Fixes" section

**Path C: Adding New Hypotheses**
- If all hypotheses are ruled out
- Analyze the problem with new information gathered
- Add new hypotheses to the plan
- Return to Path A

### 5. Update the Debug Plan File
After EVERY action, update the plan file:
- Mark completed investigation steps with `[x]`
- Update hypothesis statuses
- Add new entries to "Attempted Fixes" if a fix was tried
- Update "Current Understanding" with new insights
- Update "Next Steps" with immediate next actions
- Update "Status" field if appropriate

### 6. Check for Resolution
After each fix attempt:
- Run the reproduction test
- If PASSING:
  - Run full test suite to ensure no regressions
  - If all tests pass, mark plan as "Resolved"
  - Fill in "Resolution" section with root cause and fix details
  - Celebrate!
- If FAILING:
  - Document why the fix didn't work
  - Rollback if necessary
  - Continue to next hypothesis/fix

### 7. Handle Exhausted Plan
If ALL hypotheses have been tested and ALL planned items have been tried but the issue is NOT resolved:

**DO NOT STOP. Expand the plan:**

1. **Analyze What We've Learned**
   - Review all ruled-out hypotheses and why they were wrong
   - Review all failed fixes and what they revealed
   - Look for patterns or commonalities in the failures
   - Consider what assumptions might be incorrect

2. **Generate New Hypotheses**
   - Based on evidence gathered, form 2-3 new hypotheses
   - Consider less obvious causes (race conditions, environment issues, upstream bugs)
   - Look at code paths that weren't previously considered
   - Question initial assumptions about the problem

3. **Add New Investigation Items**
   - Add a new "Investigation Log" section with date
   - Add specific new items to try based on new hypotheses
   - Consider deeper debugging approaches:
     - Add more logging/tracing
     - Examine related subsystems
     - Check for similar issues in issue trackers/forums
     - Review recent changes more broadly

4. **Update the Plan File**
   - Add new hypotheses to the "Hypotheses" section
   - Add new investigation items with checkboxes
   - Update "Current Understanding" with insights from exhausted attempts
   - Update "Status" to "Expanding Investigation"

5. **Continue Execution**
   - Return to Step 4 (Execute Next Investigation Step)
   - Work through new hypotheses and items
   - Repeat this expansion process if needed

**The plan is never "complete" until the reproduction test passes.**

### 8. Report Progress
After each session, provide:
- What was tried this session
- Results of the attempt
- Current reproduction test status
- Next recommended action
- Updated progress: "X/Y hypotheses tested, Z fixes attempted"

## Anti-Circular-Debugging Rules

1. **NEVER** retry a fix without explicitly stating why it's different this time
2. **ALWAYS** check "Attempted Fixes" before implementing anything
3. **ALWAYS** run the reproduction test after each change
4. **ALWAYS** log failed fixes with analysis of why they failed
5. **ALWAYS** rollback failed fixes - don't leave broken code
6. **NEVER** declare the plan "complete" or "exhausted" - expand it instead
7. **ASK** for user input if:
   - You've expanded the plan twice with no progress
   - Same fix has been attempted 2+ times
   - Reproduction test passes but root cause is unknown

## Session Flow

```
1. Load plan → Review attempted fixes → Run reproduction test
2. If test passes → Verify resolution → Update plan → Done
3. If test fails → Choose untested hypothesis → Test hypothesis
4. If hypothesis confirmed → Design fix → Check if fix was tried before
5. If new fix → Implement → Test → Log results
6. If fix works → Run full suite → Mark resolved
7. If fix fails → Document why → Update plan → Return to step 3
8. If all hypotheses exhausted → Analyze learnings → Add new hypotheses → Return to step 3
```

## Important

- The debug plan file is the **source of truth**
- Work methodically - one hypothesis or fix at a time
- **Stop after each major action** to update the plan
- If stuck, add new hypotheses based on gathered evidence
- The reproduction test is the ultimate arbiter of success
- **The plan is never "done" until the test passes** - always expand with new hypotheses if needed
