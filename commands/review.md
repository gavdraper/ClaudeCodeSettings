---
description: Comprehensive code review of uncommitted changes
allowed-tools: [Bash, Glob, Grep, Read, Task]
---

# Code Review

Perform a comprehensive code review of uncommitted changes.

## Process

1. **Gather Context**
   - Run `git status` to see changed files
   - Run `git diff` to see all changes
   - Read the modified files to understand context

2. **Delegate to Code-Reviewer Agent**
   - Use the code-reviewer agent for comprehensive review
   - The agent will check for:
     - Code quality, SOLID principles, Clean Code, DRY
     - Security vulnerabilities
     - Performance issues
     - Test coverage
     - Documentation needs

3. **Present Findings**
   - Summarize key findings from agent
   - Prioritize issues: Critical, Important, Minor
   - Suggest specific fixes for each issue
   - Highlight positive aspects of the changes

4. **Create Action Plan**
   - If multiple fixes needed, use TodoWrite to track them
   - Provide code snippets for suggested changes
   - Indicate if any issues should block commit

Present findings clearly organized by priority level.
