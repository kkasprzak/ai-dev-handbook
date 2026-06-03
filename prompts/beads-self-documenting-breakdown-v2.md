# Beads Execution Graph Compilation — v2

> **Version:** v2 · **Status:** Testing. Evolution of [`beads-self-documenting-breakdown-v1.md`](./beads-self-documenting-breakdown-v1.md).
> Which version is blessed is tracked in the pointer file [`beads-self-documenting-breakdown.md`](./beads-self-documenting-breakdown.md). When validated, set it as Current there.

## Purpose

Convert prior planning, decisions, and constraints into a Beads execution graph — a dependency-ordered set of small, deployable beads. Shifts the emphasis from "self-documenting tasks" (v1) toward delivery flow: vertical slices, explicit dependencies, and beads small enough to execute without re-reading the parent epic.

## Use When

- You have already discussed or planned a meaningful piece of work with an AI assistant.
- You want that context turned into a Beads task graph optimized for incremental delivery, not just documentation.
- You want explicit dependency edges and beads sized to ~30 min – 1 day of work.
- You want the assistant to check for an existing epic first and to confirm the topology before creating anything.

## Context To Provide

- The full prior plan, design discussion, or implementation context.
- The project goal and over-arching objectives.
- Important decisions, rejected alternatives, constraints, and risks.
- The Beads repository or workspace where the tasks should be created.
- Any naming, priority, or bead-workflow conventions you want followed (also surfaced from memory in Phase 4).

## Prompt

```text
Convert prior planning, decisions, and constraints into a Beads execution graph.

## Phase 0: Discover

Before planning anything, run `bd list` / `bd memories` to check for an existing epic/beads covering this scope. If found, surface it and ask whether to reopen, extend, or supersede — do not duplicate.

## Phase 1: Optimize for delivery

Rework the plan so:

- Vertical slices > horizontal refactors
- Expand → migrate → contract for breaking changes
- Feature flags / adapters / dummy impls reduce risk when the cost is justified
- Repo stays functional between beads **when feasible** — for type-level changes touching N callers in one language unit, atomic delivery in a single bead is acceptable; flag it explicitly

For each bead ask: "If we stopped here and deployed, would the system work — or is the next bead required to restore it?" Either answer is OK; record which.

## Phase 2: Execution graph

- Smallest *useful* unit: ~30 min to ~1 day of work. Smaller → merge. Larger → split.
- Dependencies over duplication
- Capture only constraints / risks / validation / migration that materially affect *this* bead's execution
- Add rollback only where reversal is non-trivial (DB migrations, infra, shared contracts) — skip for code-only diffs
- Make dependencies explicit

## Phase 3: Bead content

Each bead carries enough for a developer to execute without reading the parent epic:

- Objective
- Files / interfaces touched + key snippets if non-obvious
- Acceptance criteria
- Link to parent for "why" (don't restate reasoning)

If you find yourself re-explaining architecture in a bead, link instead.

## Phase 4: Confirm, then create

Present the proposed topology (epic + sub-bead titles + dep edges) inline. Wait for approval. Then create via `bd`. Respect any project-level bead-workflow preferences saved in memory.

---

Optimize for: **deployable increments > completeness · execution flow > documentation · small working sets > large context**.
```

## Notes

- Original prompt shared by Jeffrey Emanuel; this v2 is Karol's reworked, multi-phase version.
- Intended for use with Beads: <https://github.com/gastownhall/beads>
- Key differences vs v1: discovery-first (avoid duplicate epics), delivery-oriented sizing and slicing, explicit confirm-before-create gate, and "link don't restate" instead of v1's "totally self-contained, never consult the instructions".
- Status is `Testing` — being trialed against v1 in real iterations. When validated, promote by setting it as **Current** in the pointer file `beads-self-documenting-breakdown.md` and flipping statuses; this file is never renamed.
