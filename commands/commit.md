---
description: Create git commit with optional custom message
allowed-tools: [Bash, Read, Grep]
argument-hint: [optional commit message]
---

# Create Git Commit

## Commit Message
$ARGUMENTS

## Process

1. **Gather Context**
   - Run `git status` to see all changes
   - Run `git diff --cached` to see staged changes
   - Run `git diff` to see unstaged changes
   - Run `git log -5 --oneline` to understand commit message style

2. **Stage Changes**
   - If there are unstaged changes, stage relevant files with `git add`
   - Do NOT stage secrets, .env files, or credentials
   - Warn if attempting to commit sensitive files

3. **Create Commit Message**

   **If argument provided:**
   - Use the provided message as-is
   - Add standard footer

   **If no argument provided:**
   - Analyze all changes (staged and newly added)
   - Write a concise, meaningful commit message:
     - First line: Brief summary (50 chars max) - what and why, not how
     - Blank line
     - Bullet points for key changes (if multiple significant changes)
     - Follow conventional commits format: `type: description`
       - `feat:` new feature
       - `fix:` bug fix
       - `refactor:` code refactoring
       - `test:` adding tests
       - `docs:` documentation
       - `chore:` maintenance tasks
     - Focus on WHY and WHAT, not HOW

   - Add standard footer:
     ```
     🤖 Generated with [Claude Code](https://claude.com/claude-code)

     Co-Authored-By: Claude <noreply@anthropic.com>
     ```

4. **Create Commit**
   - Use heredoc for proper formatting:
   ```bash
   git commit -m "$(cat <<'EOF'
   Commit message here

   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>
   EOF
   )"
   ```

5. **Verify**
   - Run `git status` to confirm commit succeeded
   - Show commit hash and summary

## Important Notes

- NEVER commit secrets, credentials, or .env files
- Ensure all tests pass before committing (run if not already done)
- Build should succeed with no warnings
- Follow the project's existing commit message style
- Do NOT push to remote unless explicitly requested
