---
allowed-tools: Bash(git:*), Read, Edit
description: Add new technical debt item to current session notes
argument-hint: "@file/path.php#L123 Description of technical debt"
---

## Add Technical Debt Item

Add a new technical debt item to the current session notes during fast TDD cycles.

### Usage
```bash
/tdd/debt/add @api/src/Module/Auth/Domain/User.php#L45 Extract duplicate validation logic
```

### Your Task

1. **Parse Arguments**
   - Extract file reference (format: `@path/to/file.php#L123`)
   - Extract description from remaining arguments
   - Validate that the referenced file exists in the project

2. **Find Current Session Notes**
   - Get current git branch: !`git branch --show-current`
   - Extract ticket number from branch name (format: `feature-br-XXXX-description`)
   - Construct session notes path: `notes/br-XXXX-session_notes.md`
   - If session notes file doesn't exist, show error with expected filename

3. **Add Debt Item**
   - Read the current session notes file
   - Find the "Technical Debt" section and "Pending" subsection
   - Add new item in format: `• [ ] \`{file_path}:{line_number}\` - {description}`
   - Example: `• [ ] \`api/src/Module/Auth/Domain/User.php:45\` - Extract duplicate validation logic`

4. **Validation & Error Handling**
   - Ensure file reference follows @file#L123 format
   - Validate referenced file exists in project
   - Check session notes file exists
   - Verify "Technical Debt" section exists in notes
   - If section missing, show helpful error about using updated template

5. **Success Feedback**
   ```
   ✅ Technical debt added to session notes
   📁 File: {file_path}:{line_number}
   📝 Description: {description}
   📋 Session Notes: notes/br-XXXX-session_notes.md
   ```

### Example Usage
```bash
# Add debt during TDD cycle
/tdd/debt/add @api/src/Module/Notifications/Application/Service/NotificationSender.php#L25 Extract permission check logic

# Add debt for duplicate code
/tdd/debt/add @api/src/Module/Cvs/Domain/Cv.php#L67 Remove duplicate validation methods
```

### Error Examples
- **Invalid format:** "Error: Use format @file/path.php#L123 description"
- **File not found:** "Error: File api/src/Module/Auth/User.php does not exist"  
- **No session notes:** "Error: Session notes not found. Expected: notes/br-1234-session_notes.md"
- **No Technical Debt section:** "Error: Session notes missing 'Technical Debt' section. Please update from template."