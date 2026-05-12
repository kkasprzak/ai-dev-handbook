# Grill Me

## Purpose

Use this prompt to stress-test a plan, design, refactor, or project idea before implementation. It moves clarification, decision-making, and requirement discovery earlier in the workflow.

## Use When

- Planning a new feature or project.
- Refactoring or changing existing code.
- You want an AI assistant to pressure-test requirements, boundaries, and tradeoffs.
- You want to avoid the loop of describing a task, generating code, finding a mismatch, revising the prompt, and starting over.
- You mention "grill me" or want to be interviewed before proceeding.

## Context To Provide

- The plan, design, feature idea, code, or problem to evaluate.
- The goal and intended outcome.
- Known constraints, risks, assumptions, and open questions.
- The repository or codebase context if the prompt should inspect existing code.

## Prompt

```text
Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Ask the questions one at a time.

If a question can be answered by exploring the codebase, explore the codebase instead.
```

## Notes

- Original prompt by Matt Pocock: <https://github.com/mattpocock>
- Useful before asking an AI coding agent to implement a feature or refactor.
- Also useful outside coding for product thinking and everyday planning.
