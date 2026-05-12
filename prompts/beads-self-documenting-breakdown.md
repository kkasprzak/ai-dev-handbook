# Beads Self-Documenting Breakdown

## Purpose

Use this prompt to turn an existing plan, discussion, or project context into a detailed Beads task structure with tasks, subtasks, dependencies, and enough background for future work to continue without re-reading the original instructions.

## Use When

- You have already discussed or planned a meaningful piece of work with an AI assistant.
- You want to convert that context into Beads issues.
- You need the resulting task graph to preserve reasoning, intent, constraints, and dependencies.
- You want the assistant to use Beads directly instead of only describing the tasks.

## Context To Provide

- The full prior plan, design discussion, or implementation context.
- The project goal and over-arching objectives.
- Any important decisions, rejected alternatives, constraints, and risks.
- The Beads repository or workspace where the tasks should be created.
- Any naming, priority, or task hierarchy conventions you want followed.

## Prompt

```text
OK so please take ALL of that and elaborate on it and use it to create a comprehensive and granular set of beads for all this with tasks, subtasks, and dependency structure overlaid, with detailed comments so that the whole thing is totally self-contained and self-documenting (including relevant background, reasoning/justification, considerations, etc.-- anything we'd want our "future self" to know about the goals and intentions and thought process and how it serves the over-arching goals of the project.). The beads should be so detailed that we never need to consult back to the instructions. Remember to ONLY use the `bd` tool to create and modify the beads and add the dependencies.
```

## Notes

- Original prompt shared by Jeffrey Emanuel.
- Intended for use with Beads: <https://github.com/gastownhall/beads>
- This prompt explicitly instructs the assistant to use the `bd` tool. Keep that wording when using the original Beads workflow.
