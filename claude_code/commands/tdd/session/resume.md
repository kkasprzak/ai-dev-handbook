---
allowed-tools: Bash(cat:*), Bash(head:*), Bash(tail:*), Bash(date:*), Bash(git branch --show-current:*)
argument-hint: [ticket-number]
description: Resume from session notes for specific ticket (or auto-detect from branch)
---

## Context

- Current branch: !`git branch --show-current`
- Current time: !`date '+%Y-%m-%d %H:%M:%S'`
- Ticket: ${ARGUMENTS:-"(auto-detect from branch)"}

### Session Notes Content

```
!`cat "notes/br-${ARGUMENTS:-8317}-session_notes.md"`
```

## Your task

Create a concise Navigator handoff based on the session notes above. Extract the most recent session information and format it for easy resumption of work.

## Output format

Produce ONLY the following Markdown, nothing else:

```markdown
## Navigator Resume (for [date/time] on [branch])

- What we were doing: [1–2 sentences from session notes]
- Immediate next action: [single actionable step from session notes]

### Current Status

• [status from session notes]
• [status from session notes]

### Next Tasks

1. [task from session notes]
2. [task from session notes]
3. [task from session notes]

### Quick Start

- [Command or file from session notes]
- [Command or file from session notes]

### Notes

- [Important reminders from session notes]
```
