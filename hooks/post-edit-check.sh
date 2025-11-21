#!/usr/bin/env zsh

# Hook to provide feedback after file edits
# Checks for common issues and provides guidance

# Read the tool input from stdin
TOOL_INPUT=$(cat)

# Extract file path from JSON
FILE_PATH=$(echo "$TOOL_INPUT" | jq -r '.file_path // empty')

if [[ -z "$FILE_PATH" ]]; then
    # No file path, allow
    echo '{}'
    exit 0
fi

# Only check code files
if [[ ! "$FILE_PATH" =~ \.(cs|csproj|sln|js|ts|tsx|jsx|py|go|java|rb)$ ]]; then
    echo '{}'
    exit 0
fi

FEEDBACK=""

# Check for TODO comments without tracking
if grep -q "// TODO" "$FILE_PATH" 2>/dev/null; then
    if [[ -n "$FEEDBACK" ]]; then FEEDBACK="$FEEDBACK\n"; fi
    FEEDBACK="${FEEDBACK}⚠️  Found TODO comments in $FILE_PATH - consider tracking in a plan file"
fi

# Check for console/debug statements in code files
if [[ "$FILE_PATH" =~ \.(cs)$ ]]; then
    if grep -q "Console.WriteLine" "$FILE_PATH" 2>/dev/null; then
        if [[ -n "$FEEDBACK" ]]; then FEEDBACK="$FEEDBACK\n"; fi
        FEEDBACK="${FEEDBACK}⚠️  Found Console.WriteLine in $FILE_PATH - consider using ILogger instead"
    fi
fi

# Provide feedback if any issues found
if [[ -n "$FEEDBACK" ]]; then
    echo "{\"decision\": \"block\", \"feedback\": \"$FEEDBACK\"}"
else
    echo '{}'
fi

exit 0
