# In The Optimal Way Possible (ITOWP)

## Purpose

A lightweight phrase you append to a request to push the model to reason harder and produce a higher-quality answer. Functions as a low-effort quality nudge rather than a structured prompt.

## Use When

- You have a normal request and want a stronger, more considered result without writing a longer prompt.
- A first answer felt rushed or "good enough" and you want the model to optimize rather than satisfice.
- You want a quick experiment to see if extra reasoning effort improves output on a given task.

## Context To Provide

- The actual task or request the phrase is attached to.
- Any constraints or definition of "optimal" that matters here (speed, readability, cost, correctness) — otherwise the model picks its own interpretation.

## Prompt

```text
<your normal request> ... in the optimal way possible.
```

## Notes

- Source: post by Jeffrey on LinkedIn — <https://www.linkedin.com/feed/update/share:7463384844262256640/>
- Shorthand: ITOWP.
- Same family as appending "make no mistakes" — sounds trivial, but reportedly makes the model think harder and produce better results.
- "Optimal" is undefined by default; if a specific axis matters (correctness, performance, simplicity), name it instead of relying on the phrase alone.
