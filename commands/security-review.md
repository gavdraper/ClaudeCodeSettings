---
description: Security-focused review of changes or specific code
allowed-tools: [Bash, Glob, Grep, Read, Task, TodoWrite]
argument-hint: [file or leave empty for uncommitted changes]
---

# Security Review

## Target
$ARGUMENTS

## Process

1. **Determine Scope**
   - If no argument: review all uncommitted changes (`git diff`)
   - If argument provided: review specified file(s)

2. **Delegate to Security-Reviewer Agent**
   - Use the security-reviewer agent for specialized analysis
   - Agent will perform comprehensive security audit

3. **Present Findings**
   - Categorize by severity: Critical, High, Medium, Low
   - Provide specific remediation steps
   - Include code examples for fixes
   - Estimate effort for each fix

4. **Action Plan**
   - Create TodoWrite list if multiple issues found
   - Prioritize by severity
   - Suggest security tests to add

Present findings with clear remediation guidance, ordered by severity.
