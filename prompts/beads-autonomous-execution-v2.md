# Beads Autonomous Execution — v2

> **Version:** v2 · **Status:** Testing. Evolution of [`beads-autonomous-execution-v1.md`](./beads-autonomous-execution-v1.md).
> Which version is blessed is tracked in the pointer file [`beads-autonomous-execution.md`](./beads-autonomous-execution.md). When validated, set it as Current there.
> Execution counterpart to the planning prompt [`beads-self-documenting-breakdown.md`](./beads-self-documenting-breakdown.md).

## Purpose

Drive an AI coding agent to execute **exactly one bead** from a ready Beads graph, using a goal-driven loop (`/goal`) that doesn't finish until the bead is genuinely done — implemented, full regression green, committed, pushed to the open PR, and closed. Then it stops so the human can clear the context and launch the next bead from a clean slate.

Where v1 iterated over the whole graph inside a single session (and slowly filled the context window), v2 does **one bead per session**: one clean context in, one deployed increment out.

## Use When

- You have a Beads execution graph and want **one bead = one clean session = one commit = one push to the PR**.
- You drive the loop manually: run this prompt, let it finish one bead, `/clear`, run it again for the next.
- You want a concrete definition of done enforced by `/goal` rather than the agent declaring victory early.
- You want the agent to surface decisions via `AskUserQuestion` and stop cleanly when blocked.

## Context To Provide

- The Beads repository/workspace and access to the `bd` tool.
- The full **regression** command for the project (not just per-module tests) so "green" is well-defined.
- A long-lived feature branch with an **open PR** already created, plus commit conventions (how to reference a bead id) and the push target.
- Any product/architecture constraints the agent should defer to a human on.

## Prompt

```text
Execute exactly ONE Beads bead to completion using a goal-driven loop, then stop.

## Select the bead
1. `bd ready` → beads whose deps are all `closed`. (If you were given a specific bead id, use that.)
2. If none are ready: stop — everything is either done or blocked. Report and end.
3. Pick the highest-priority ready bead; on ties, the smallest high-value increment.
4. `bd update <id> --status in_progress`. This is the ONLY bead you touch this session.

## Set the goal
Read the bead fully — objective, acceptance criteria, files/interfaces, links.
Rely on the bead itself, not on prior context.

/goal The bead is complete only when ALL of these hold:
  1. Every acceptance criterion in the bead is implemented.
  2. The FULL regression suite passes AFTER the implementation (not just the touched module).
  3. Exactly one commit that references the bead id.
  4. That commit is pushed to the PR branch (changes visible in the open PR).
  5. Discoveries recorded on the bead; any out-of-scope work opened as new beads (not done now).
  6. `bd close <id>`.

Work the loop until every item above is true. Do not stop half-done, and do not
declare the bead done before the full regression is green.

## Hard rules
- ONE bead only. Never start a second. When the goal holds, STOP — the human will
  clear the context and launch the next bead from a clean slate.
- Graph order beats inferred order; only touch this selected bead.
- No green regression → no commit, no push, no close.
- Don't guess on decisions and don't expand scope.

## When you're stuck — ask, don't guess
Use `AskUserQuestion` (don't wait passively) when:
- regression fails and the fix isn't obvious (or fails twice on the same bead)
- the bead needs a product/architecture decision
- a merge conflict appears
- a dependency points at an external PR
If the blocker can't be resolved, `bd update <id> --status blocked` with a note
explaining exactly what blocks it, leave the working tree clean, and stop.

Goal: one bead — fully implemented, regression-green, committed and pushed to the PR —
or cleanly blocked. Never partial, never a second bead.
```

## Notes

- Execution-phase companion to the planning prompt `beads-self-documenting-breakdown.md`.
- Intended for use with Beads: <https://github.com/gastownhall/beads>
- Key differences vs v1:
  - **One bead per session.** v1's step 9 (`re-run bd ready` and continue) is removed — that in-session loop was what filled the context window. v2 stops after one bead; the human `/clear`s and re-runs for the next.
  - **`/goal`-driven done.** The definition of done is set as an explicit goal (same mechanism as `teach-me-the-session.md`), so the agent loops until it's met instead of declaring done early.
  - **Full regression, not per-module.** v1 accepted "tests for the touched module pass"; v2 requires the full regression suite green after the implementation.
  - **Push to the open PR is part of done.** v1 committed locally and did not push; v2's done state includes push to the PR branch so each bead lands as a visible increment in the PR.
- Orchestration is intentionally **manual** in v2 (human clears context between beads). If you later want it hands-off, wrap this per-bead prompt in a loop — a headless `claude -p` shell loop (truly fresh process per bead; note `AskUserQuestion` won't work, so blockers must route to `bd --status blocked`) or an in-Claude subagent orchestrator (subagent runs each bead in an isolated context).
- Status is `Testing` — being trialed against v1. When validated, promote by setting it as **Current** in the pointer file `beads-autonomous-execution.md` and flipping statuses; this file is never renamed.
