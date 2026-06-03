# Beads Autonomous Execution — v1

> **Version:** v1 · **Status:** Current.
> Which version is blessed is tracked in the pointer file [`beads-autonomous-execution.md`](./beads-autonomous-execution.md).
> Execution counterpart to the planning prompt [`beads-self-documenting-breakdown.md`](./beads-self-documenting-breakdown.md).

## Purpose

Drive an AI coding agent to execute a ready Beads graph autonomously — picking up unblocked beads in dependency order, doing the work, validating, committing one bead at a time, and recording discoveries — while stopping safely whenever a real decision is needed. Optimizes for safe incremental progress over throughput.

## Use When

- You have a Beads execution graph (e.g. built with the breakdown prompt) and want the agent to work through it.
- You want one-bead-one-commit discipline with the build kept green between beads.
- You want the agent to surface decisions via `AskUserQuestion` rather than guess or expand scope.
- You want it to stop cleanly when there is no ready work or it gets stuck.

## Context To Provide

- The Beads repository/workspace and access to the `bd` tool.
- Validation commands for the project (build, test per module) so "green" is well-defined.
- Commit conventions (how to reference a bead id) and the rule not to push.
- Any product/architecture constraints the agent should defer to a human on.

## Prompt

```text
Read the Beads graph and execute ready work autonomously.

## Workflow

1. `bd ready` → list unblocked beads (all deps are `closed`, not just `in_progress`)
2. Pick the highest-priority one; on ties, smallest high-value increment
3. `bd update <id> --status in_progress`
4. Do the work
5. Validate: code compiles and tests for the touched module pass — no green, no close
6. Commit locally (one bead = one commit, reference the bead id, do not push)
7. `bd update <id>` with discoveries as notes; open a new bead for anything out of scope
8. `bd close <id>`
9. Re-run `bd ready` — completed work may have unblocked more

## Rules

- Graph order beats inferred order
- Only touch ready beads
- Every commit must keep the build green (deployability)
- If significant undiscovered work appears, stop and create a bead — don't expand scope
- Use `AskUserQuestion` (don't wait passively) when:
  - tests fail and the fix isn't obvious
  - a bead needs a product/architecture decision
  - a merge conflict appears
  - a dep points at an external PR

## Stop conditions

- No ready beads
- Validation fails twice on the same bead
- Any `AskUserQuestion` condition triggers

Goal: **safe incremental progress, not throughput.**
```

## Notes

- Execution-phase companion to the planning prompt `beads-self-documenting-breakdown.md`; intended to run on a graph that prompt produced.
- Intended for use with Beads: <https://github.com/gastownhall/beads>
- Key safety properties: dependency order over inferred order, build stays green per commit, scope creep becomes a new bead, and a "fails twice" / decision-needed stop so the agent doesn't thrash or guess.
- Which version is current is tracked in the pointer file; this family is evaluated the same way as the breakdown prompt — promote by editing the pointer, never by renaming.
