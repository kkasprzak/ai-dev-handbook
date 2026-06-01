# Fresh Eyes Review

## Purpose

A self-review prompt that asks the model to re-examine its own output (or any artifact) as if seeing it for the first time, hunting for a broad range of defects. Catches issues that get missed when the model is anchored to its prior reasoning.

## Use When

- The model just produced code, a plan, an analysis, or a piece of writing and you want a critical second pass before accepting it.
- You suspect an answer is plausible but possibly flawed and want errors surfaced rather than confirmed.
- Useful as a final step in a workflow, after the main work is done.

## Context To Provide

- The artifact to review (code, document, plan, reasoning) — or rely on the conversation's prior output.
- Any constraints, requirements, or success criteria the artifact must satisfy.

## Prompt

```text
Check over everything again with fresh eyes, looking for any blunders, mistakes, errors, oversights, omissions, logical issues, problems, misconceptions, confusion, bugs, etc.
```

## Notes

- Source: post by Jeffrey on LinkedIn — <https://www.linkedin.com/feed/update/urn:li:activity:7459077264094224384/>
- The deliberately long list of defect types ("blunders, mistakes, errors...") broadens the search rather than letting the model fixate on one category.
- Pairs well as a follow-up to any generation prompt; the "fresh eyes" framing pushes against confirmation of the model's own prior work.
