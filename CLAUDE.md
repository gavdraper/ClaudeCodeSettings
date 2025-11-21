# Staff Engineer - AI-Assisted Workflow Standards

## Working Philosophy

I'm a Staff Software Engineer focused on efficiency, quality, and systematic problem-solving. I prefer AI assistance that enhances my workflow through automation, thoughtful analysis, and structured execution. I use TDD and ALWAYS ensure good use of Open Telemetery

## Planning & Execution Standards

### ALWAYS Plan First

- For any non-trivial task (3+ steps), create a plan using the TodoWrite tool BEFORE starting implementation
- Break complex tasks into discrete, trackable steps
- Mark tasks as `in_progress` when starting, `completed` immediately upon finishing
- Keep exactly ONE task in_progress at a time
- Update the todo list as you discover new requirements

### Research Before Implementation

- When encountering unfamiliar code, explore and understand it first
- Use the Explore agent for codebase understanding (NOT direct Grep/Glob for broad questions)
- Read existing patterns and follow them
- Ask clarifying questions if requirements are ambiguous

### Proactive Quality Checks

- Use the code-reviewer agent automatically after completing features
- Run builds and tests after changes - don't just assume they pass
- Fix ALL warnings, not just errors
- Validate assumptions with actual execution, not speculation

## Architecture & Design Standards

### SOLID Principles (Non-Negotiable)

- **Single Responsibility**: One class/function, one reason to change
  - Each class should do ONE thing well
  - Extract to separate files when responsibilities grow
  - Never dump everything into Program.cs, Startup.cs, or "God classes"
- **Open/Closed**: Open for extension, closed for modification
  - Use inheritance, composition, or strategy patterns
  - Don't modify existing code when adding features
- **Liskov Substitution**: Subtypes must be substitutable for base types
  - Derived classes shouldn't break base class contracts
- **Interface Segregation**: Many specific interfaces > one general interface
  - Clients shouldn't depend on methods they don't use
- **Dependency Inversion**: Depend on abstractions, not concretions
  - Use dependency injection
  - Program to interfaces, not implementations

### Clean Code Principles

- **Meaningful Names**: Variables, functions, classes should reveal intent
  - Avoid abbreviations unless universally understood
  - Use pronounceable, searchable names
  - Class names = nouns, Method names = verbs
- **Functions**:
  - Small (ideally < 20 lines, max 50 lines)
  - Do one thing
  - One level of abstraction per function
  - Minimize arguments (0-2 ideal, 3 max, avoid flag arguments)
- **Comments**: Code should be self-documenting
  - Good code > comments
  - Use comments to explain "why", not "what"
  - Remove commented-out code
- **Error Handling**:
  - Use exceptions, not error codes
  - Provide context with exceptions
  - Don't return null, use Option/Maybe patterns or throw
- **Formatting**: Consistent, readable structure
  - Vertical spacing to separate concepts
  - Related code should appear vertically dense
  - Declare variables close to usage

### DRY (Don't Repeat Yourself)

- **No duplication**: Extract shared logic to methods/classes
- **Abstraction over repetition**: Create base classes, utilities, helpers
- **Configuration over code**: Don't hardcode repeated values
- **Look for patterns**: 3+ similar blocks = time to abstract
- **But avoid premature abstraction**: Don't DRY until pattern is clear

### File & Project Organization

- **One class per file** (exceptions: small private helper classes)
- **Organize by feature/domain**, not by type
  - ✅ `/Features/Orders/OrderService.cs`, `/Features/Orders/OrderRepository.cs`
  - ❌ `/Services/OrderService.cs`, `/Repositories/OrderRepository.cs`
- **Separate concerns into layers**:
  - Presentation → Business Logic → Data Access
  - API Controllers should be thin, delegate to services
  - Services contain business logic
  - Repositories/Data Access handle persistence
- **Keep related code together**: High cohesion, low coupling
- **Limit file size**: 200-300 lines max, extract if larger

### When to Extract

- Function/method exceeds 20-30 lines
- Class exceeds 200-300 lines
- Class has multiple responsibilities
- Code is duplicated in 3+ places
- Logic is complex enough to benefit from isolated testing
- You're tempted to add a comment explaining a code block (extract to named method instead)

### Design Patterns (Use When Appropriate)

- **Repository Pattern**: For data access abstraction
- **Strategy Pattern**: For interchangeable algorithms
- **Factory Pattern**: For complex object creation
- **Decorator Pattern**: For extending behavior
- **CQRS**: For separating reads/writes in complex domains
- Don't force patterns, use when they solve real problems

## Communication Preferences

### Be Concise But Complete

- Get to the point quickly
- No unnecessary pleasantries or emoji
- Explain the "why" behind decisions, not just the "what"
- Use technical precision - I'm a Staff Engineer

### Code References

- Always include file paths with line numbers: `src/file.ts:123`
- Show relevant code snippets when explaining issues
- Link related files when discussing architecture

### Status Updates

- Tell me what you're doing and why
- Explain what tools you're using (agents, searches, etc.)
- Call out blockers immediately, don't spin
- Summarize results after completion

## Sub-Agent Delegation

### When to Delegate

- **Explore agent**: Broad codebase questions ("How does auth work?", "What's the architecture?")
- **Code-reviewer agent**: After completing features, before committing
- **Security-reviewer agent**: For auth, data handling, secrets, external integrations
- **Test agent**: Comprehensive test generation and coverage analysis
- **Debugging agent**: Complex investigation requiring multiple hypotheses

### How to Delegate

- Provide clear context and specific goals
- Specify thoroughness level for Explore agent (quick/medium/very thorough)
- Let agents complete their work before evaluating results
- Use parallel agent execution when tasks are independent
- Trust agent expertise - they have specialized knowledge

### Agent Expectations

- Agents should be proactive when their description says so
- Use agents to minimize context window usage
- Don't re-do work that agents are designed for
- Delegate early and often - it's more efficient

## Efficiency Optimizations

### Context Window Management

- Use sub-agents for focused tasks to minimize main context
- Leverage Explore agent instead of reading multiple files speculatively
- Be selective about which files to read
- Use targeted searches, not broad exploration

### Parallel Execution

- Run independent tool calls in a single message
- Launch multiple agents simultaneously when possible
- Don't wait unnecessarily - batch independent operations
- Read multiple potentially relevant files in parallel

### Pattern Recognition

- Create slash commands for repeated workflows
- Build custom agents for specialized, recurring tasks
- Use hooks to automate quality checks
- Develop skills for domain-specific capabilities

## Build & Test Standards

### Before Declaring "Done"

- [ ] Code compiles without errors or warnings
- [ ] All tests pass (unit, integration, e2e as applicable)
- [ ] Code follows existing patterns and conventions
- [ ] Code review completed (via agent or manual request)
- [ ] Breaking changes called out explicitly

### Continuous Validation

- Run builds incrementally during development
- Execute relevant test subsets frequently
- Fix issues immediately, don't accumulate technical debt
- Verify changes with actual execution

### Test-Driven Development (TDD)

- **Default to TDD** for new features, business logic, and algorithms
- **Write tests first** when:
  - Adding new public APIs or interfaces
  - Implementing complex business logic or calculations
  - Building pure functions or utilities
  - Fixing bugs (write failing test, then fix)
- **Tests can follow implementation** when:
  - Prototyping or exploring unfamiliar territory
  - Working on UI/presentation that benefits from visual feedback
  - Simple CRUD operations following established patterns
- **Test requirements**:
  - Every feature must have unit tests before marked complete
  - Integration tests for cross-boundary interactions
  - Run tests after each implementation step, not just at the end
  - Tests must pass before moving to next phase/task
- **Test quality standards**:
  - Test behavior, not implementation details
  - Cover edge cases and error scenarios
  - Use descriptive test names that explain intent
  - Prefer small, focused tests over large comprehensive ones

## Learning & Adaptation

### Project-Specific Context

- Look for CLAUDE.md in project root for tech stack standards
- Review README, CONTRIBUTING, and docs/ for project conventions
- Check for .claude/commands/ for project-specific workflows
- Check for .claude/agents/ for project-specific specialized agents
- Adapt to team patterns, don't impose external preferences

### Continuous Improvement

- Learn from code review feedback
- Adjust approach based on what works
- Propose improvements to workflows
- Stay current with tooling and best practices

## Anti-Patterns to Avoid

### Execution Anti-Patterns

- Assuming code works without testing it
- Making changes without understanding existing code
- Fixing symptoms instead of root causes
- Over-engineering simple problems
- Ignoring warnings or test failures
- Committing without running builds/tests

### Architecture Anti-Patterns

- Dumping all logic into Program.cs, Controller, or single file
- Creating "God classes" that do everything
- Duplicating code instead of extracting shared logic
- Violating SOLID principles (especially Single Responsibility)
- Functions exceeding 50 lines without extraction
- Classes exceeding 300 lines without extraction
- Organizing by technical type instead of business domain
- Tight coupling between layers
- Not using dependency injection for dependencies

### Communication Anti-Patterns

- Verbose explanations when concise will do
- Using placeholder values instead of real implementation
- Saying "I'll do X" without actually doing X in the same response
- Apologizing excessively for issues

### Workflow Anti-Patterns

- Not using TodoWrite for multi-step tasks
- Batching todo completions instead of marking them immediately
- Reading files directly when Explore agent should be used
- Not delegating to specialized agents when appropriate
- Using multiple in_progress tasks simultaneously
- NEVER remove tests just because you cant get them to pass. Always ask me first.

## Success Metrics

Good AI assistance means:

- Fewer iterations needed to reach correct solution
- Proactive identification of issues before they occur
- Thoughtful analysis that considers trade-offs
- Code that integrates seamlessly with existing patterns
- Clear, concise communication that respects my time
- Efficient use of context and parallel execution
