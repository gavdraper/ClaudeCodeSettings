#!/usr/bin/env zsh

# Hook to check for dangerous bash commands before execution
# Returns JSON to allow, deny, or ask for confirmation

# Read the tool input from stdin
TOOL_INPUT=$(cat)

# Extract the command from the JSON input
COMMAND=$(echo "$TOOL_INPUT" | jq -r '.command // empty')

if [[ -z "$COMMAND" ]]; then
    # No command found, allow
    echo '{"decision": "allow"}'
    exit 0
fi

# Dangerous patterns to check
DANGEROUS_PATTERNS=(
    "rm -rf /"
    "rm -rf /*"
    "rm -rf ~"
    "rm -rf \$HOME"
    "> /dev/sda"
    "dd if="
    "mkfs"
    ":(){ :|:& };:"  # fork bomb
    "chmod -R 777"
    "chown -R"
)

# Check for dangerous patterns
for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qF "$pattern"; then
        echo "{\"decision\": \"deny\", \"feedback\": \"Blocked dangerous command: $pattern\"}"
        exit 0
    fi
done

# Warn about potentially risky commands
WARNING_PATTERNS=(
    "rm -rf"
    "sudo rm"
    "curl.*| sh"
    "wget.*| sh"
    "curl.*| bash"
    "wget.*| bash"
)

for pattern in "${WARNING_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qE "$pattern"; then
        echo "{\"decision\": \"ask\", \"feedback\": \"This command could be risky: $COMMAND\"}"
        exit 0
    fi
done

# Allow by default
echo '{"decision": "allow"}'
