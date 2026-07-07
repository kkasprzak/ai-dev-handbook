---
allowed-tools: Bash(git branch --show-current:*), Bash(git log:*), Bash(git status:*), Bash(date:*)
description: Generate notes from Pair Programming session
---

## Context
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -5`
- Git status: !`git status --porcelain`
- Current time: !`date '+%Y-%m-%d %H:%M:%S'`

## Your task

You are the Driver in our pair programming session. Your task is to generate concise session notes for the Navigator who needs to pause their work on implementing a new feature. These notes should quickly remind the Navigator of the work context when they return.

### Task Instructions

When the Navigator requests session notes or when pausing work, follow these steps:

1. **Ask the Navigator for additional context** before generating notes:
   - "Before I create the session notes, would you like to provide any additional information about our next tasks, work context, or other important details that should be captured?"
   - Wait for their response and incorporate any provided information

2. **Analyze the work done** based on commits and context

3. **Analyze our conversation history** combined with any additional context to extract key information:
   - Feature description
   - Current progress
   - Planned next steps
   - Any potential issues or important reminders

4. **Generate session notes** using the STRICT template structure. You must follow template and examples EXACTLY:
   - **Read template**: Use structure from `notes/session_notes_template.md`  
   - **Reference examples**: Follow patterns from `notes/session_notes_examples.md`
   - **Required sections**: Feature Summary, Current Status, Technical Debt (Pending/Completed), Next Tasks, Important Reminders
   - **Technical debt**: Include specific file paths with line numbers for refactoring items
   - **Bullet formatting**: Preserve exact bullet characters and spacing from template

5. **Determine ticket number and append notes to ticket-specific file** — extract ticket number from branch name and use proper file naming convention.

### File Writing Policy

- **Ticket-specific naming**: Use format `notes/br-XXXX-session_notes.md` where XXXX is the ticket number
- **Extract ticket from branch**: Parse current branch name (e.g., `feature-br-8317-description` → `br-8317`)
- **Append-only**: Add new session notes at the top of the ticket-specific file
- **Preserve existing content**: Never overwrite existing sessions - stack chronologically with newest on top
- **Follow template structure**: Use the exact template from `notes/session_notes_template.md`
- **Reference examples**: Follow format patterns from `notes/session_notes_examples.md`

### Output Format

Before generating the final notes, provide your analysis in the chat (not in the file), incorporating both conversation history and any additional context provided by the Navigator:

```
<conversation_breakdown>
Feature Description:
[Quote from our conversation]
Reasoning: [Explanation for including this information]

Current Progress:
[Quote from our conversation]
Reasoning: [Explanation for including this information]

Next Steps:
[Quote from our conversation]
Reasoning: [Explanation for including this information]

Important Reminders:
[Quote from our conversation]
Reasoning: [Explanation for including this information]
</conversation_breakdown>
```

Then append the session notes to `notes/br-XXXX-session_notes.md` using the template structure from `notes/session_notes_template.md`:

**Steps for file handling:**
1. **Extract ticket number**: Parse branch name to get ticket (e.g., `feature-br-8317-description` → `8317`)
2. **Check if file exists**: `notes/br-XXXX-session_notes.md` 
3. **Read existing content** if file exists to preserve previous sessions
4. **Prepend new session** at the top following template structure
5. **Write complete file** with new session + existing sessions

**Required template structure** (from `notes/session_notes_template.md`):
```markdown
# Session Notes - {date} {hour}

## Feature Summary

{short session summary}

## Current Status

• {what we manage to finish in current session}
• {event more tasks we managed to finish in current session}

## Technical Debt

### Pending

• [ ] `api/src/Module/ModuleName/Domain/Entity.php:45` - {describe what needs refactoring and why}
• [ ] `api/src/Module/ModuleName/Application/Handler.php:23` - {describe what needs refactoring and why}

### Completed This Session

• [x] `api/src/Module/ModuleName/Domain/Service.php:12` - {what was refactored}

## Next Tasks

• {first task to work on next session}
• {second task to work on next session}
• {even more tasks to work on next session}

## Important Reminders

• {some important learnings to keep in next session}
• {even more important learnings to keep in next session}

---
```

### Key Guidelines

- **Ticket-specific files**: Always use `notes/br-XXXX-session_notes.md` format (extract XXXX from branch name)
- **Template compliance**: Follow the exact structure from `notes/session_notes_template.md` including Technical Debt section
- **Reference examples**: Use `notes/session_notes_examples.md` for formatting guidance and style patterns
- **Preserve chronology**: Stack sessions with newest on top, preserve all existing content
- **Technical debt tracking**: Include specific file paths and line numbers for pending/completed technical debt
- **Focus on actionable information**: Help Navigator resume work efficiently with clear next steps

Remember: You're documenting our collaborative work so the Navigator can seamlessly continue when they return.