# Reusable AI Prompts

This directory stores reusable prompts that are useful across projects, tools, and AI coding assistants.

The goal is to keep prompts easy to copy, adapt, and improve over time. Each prompt should explain when to use it, what context it expects, and what output it should produce.

## Catalog

| Prompt | Use case | Tools | Status |
| --- | --- | --- | --- |
| [`radically-useful-addition.md`](./radically-useful-addition.md) | Challenge a development plan or project with one high-leverage improvement idea | Any | Active |
| [`beads-self-documenting-breakdown.md`](./beads-self-documenting-breakdown.md) | Convert prior context into a Beads task graph — pointer to the current version (v1; v2 in testing) | Beads, `bd` | Active |
| [`fresh-eyes-review.md`](./fresh-eyes-review.md) | Ask the model to re-review its own output for a broad range of defects | Any | Active |
| [`grill-me.md`](./grill-me.md) | Stress-test a plan or design through one-question-at-a-time interrogation | Any, coding agents | Active |
| [`in-the-optimal-way-possible.md`](./in-the-optimal-way-possible.md) | Append a phrase to nudge the model to reason harder for a better answer | Any | Active |
| [`_template.md`](./_template.md) | Template for adding a new reusable prompt | Any | Template |

## Naming

Use short, descriptive, kebab-case filenames:

- `code-review.md`
- `refactoring-plan.md`
- `tdd-session-start.md`
- `debugging-handoff.md`

If a prompt is specific to one tool, include the tool in the filename:

- `claude-code-tdd-session.md`
- `cursor-refactor-checklist.md`

## Prompt Format

Each prompt file should include:

- **Purpose**: what problem this prompt solves.
- **Use when**: the situation where this prompt is useful.
- **Context to provide**: information that should be included before running the prompt.
- **Prompt**: the actual reusable prompt text.
- **Notes**: optional observations, variants, or examples.

## Versioning

When a prompt evolves but you want every version to stay accessible (not buried in git history), use the **pointer convention**:

- Each version's full content lives **permanently in its own `-vN` file** (`-v1`, `-v2`, ...). These files are **never renamed** and numbers are monotonic — no gaps, no reuse.
- The **unsuffixed filename is a pointer**, not a prompt. It names the currently-blessed version and lists all versions with their status.
- Each version file cross-links the pointer, so "which one is current" has a single source of truth.
- **Promotion is cheap**: set the new version as Current in the pointer file and flip statuses there and in this catalog. No renames, no broken links.
- The catalog lists only the pointer (status `Active`); per-version status lives in the pointer file.

## Maintenance

When a prompt works well in a real project, add a short note about the context where it helped. When it fails or produces weak output, update the prompt instead of only adding a new variant.
