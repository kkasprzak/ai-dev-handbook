---
allowed-tools: Read, Edit
description: Mark technical debt item as completed by moving from Pending to Completed
argument-hint: "@notes/session-file.md#L123"
---

## Clear Technical Debt Item

Mark a technical debt item as completed during refactoring phase.

### Usage
```bash
/tdd/debt/clear @notes/br-8317-session_notes.md#L15
```

### Your Task

1. **Parse Session Notes Reference**
   - Extract session notes file path (format: `@notes/br-XXXX-session_notes.md#L123`)
   - Extract line number from reference
   - Validate that the session notes file exists

2. **Read Debt Item from Line**
   - Read the specified line from session notes file
   - Extract the debt item details (file path, line number, description)
   - Validate it's a pending debt item (starts with `• [ ]`)
   - Parse format: `• [ ] \`file_path:line_number\` - description`

3. **Move Item from Pending to Completed**
   - Find the debt item in "Technical Debt > Pending" section
   - Remove the item from Pending section
   - Add item to "Technical Debt > Completed This Session" section
   - Change checkbox format from `• [ ]` to `• [x]`
   - Preserve the original description and file reference

4. **Validation & Error Handling**
   - Ensure session notes file exists
   - Validate line number is within file bounds
   - Check that line contains a pending debt item
   - Verify "Technical Debt" section structure exists
   - Handle case where item is already completed

5. **Success Feedback**
   ```
   ✅ Technical debt marked as completed
   📁 File: {original_file_path}:{line_number}
   📝 Description: {description}
   📋 Moved from Pending to Completed This Session
   ```

### Example Usage
```bash
# After refactoring the permission check logic
/tdd/debt/clear @notes/br-8317-session_notes.md#L15
```

**Before:**
```markdown
### Pending
• [ ] `api/src/Module/Notifications/Application/Service/NotificationSender.php:25` - Extract permission check logic
• [ ] `api/src/Module/Auth/Domain/User.php:67` - Remove duplicate validation
```

**After:**
```markdown
### Pending
• [ ] `api/src/Module/Auth/Domain/User.php:67` - Remove duplicate validation

### Completed This Session
• [x] `api/src/Module/Notifications/Application/Service/NotificationSender.php:25` - Extract permission check logic
```

### Error Examples
- **Invalid format:** "Error: Use format @notes/session-file.md#L123"
- **File not found:** "Error: Session notes file notes/br-8317-session_notes.md does not exist"
- **Invalid line:** "Error: Line 15 does not contain a pending debt item"
- **Line out of bounds:** "Error: Line 150 exceeds file length (45 lines)"
- **Already completed:** "Error: This debt item is already marked as completed"