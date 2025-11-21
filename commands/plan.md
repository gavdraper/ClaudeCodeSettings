---
description: Create detailed implementation plan in .claude/plans/
allowed-tools: [Glob, Grep, Read, Write, Bash, Task]
argument-hint: <feature or task description>
---

# Planning Phase

You are in PLANNING MODE. Do NOT write any code yet.

## Task
$ARGUMENTS

## Your Objective

Create a comprehensive implementation plan by:

1. **Understanding Current State**
   - Use Explore agent (thoroughness: medium) to understand relevant code
   - Identify files, classes, and patterns that will be affected
   - Note any dependencies or constraints

2. **Design Approach**
   - Outline the high-level approach
   - Identify key decisions and trade-offs
   - Consider edge cases and error scenarios
   - Flag any breaking changes or migration needs

3. **Implementation Steps**
   - Break down into specific, actionable tasks
   - Order tasks logically with dependencies
   - **Use TDD approach**: For each feature, include test task BEFORE implementation task
   - Structure as: Write test → Implement feature → Verify test passes
   - Estimate complexity/risk for each step

4. **Create Plan File**
   - Create `.claude/plans/` directory if it doesn't exist
   - Generate plan file: `.claude/plans/YYYY-MM-DD-feature-name.md`
   - Use TodoWrite to track the plan creation and immediate next steps
   - Include checkboxes `- [ ]` for each task so progress can be tracked

## Plan File Structure

```markdown
# [Feature/Task Name]

**Created**: YYYY-MM-DD
**Status**: Planning | In Progress | Completed
**Estimated Complexity**: Low | Medium | High

## Objective
[Clear description of what we're building and why]

## Current State Analysis
[Summary of relevant existing code and architecture]

## Approach
[High-level design and strategy]

## Key Decisions
- Decision 1: [Rationale]
- Decision 2: [Rationale]

## Risks & Considerations
- Risk 1: [Mitigation strategy]
- Risk 2: [Mitigation strategy]

## Implementation Steps

### Phase 1: [Name]
- [ ] Write tests for [feature] - [test file references]
- [ ] Implement [feature] - [implementation file references]
- [ ] Verify tests pass - run test suite
- [ ] [Next feature if applicable]

### Phase 2: [Name]
- [ ] Write tests for [feature]
- [ ] Implement [feature]
- [ ] Verify tests pass

## Test Coverage
- Unit tests: [What needs unit test coverage]
- Integration tests: [What needs integration test coverage]
- Edge cases: [Specific edge cases to test]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Notes
[Additional context, links, references]
```

Present the plan summary and inform the user where the plan file was saved.
