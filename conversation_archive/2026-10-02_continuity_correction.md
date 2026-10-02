# Continuity Correction — 2026-10-02

The user explicitly corrected the project workflow after repeated conversation crashes and loss of prior closures.

## Durable rule

GitHub, not ChatGPT conversation memory, is the persistent project record.

The correct workflow is:

```
chat / scratch work
-> substantive result
-> persist to GitHub
-> future session reads GitHub first
-> continue from persisted state
```

A closure, correction, no-go, reopen, equation, version result or canonical status change is not considered safely preserved until it is written into the repository.

## Failure being corrected

Conversation-only reconstruction repeatedly:
- omitted previously closed results;
- reopened already-solved components;
- confused mathematical closure with physical identification;
- lost later corrections after chat crashes;
- compressed many closures into a few broad “remaining gaps.”

That workflow is retired.

## Required persistence

Future sessions must update, as appropriate:

- docs/CANONICAL_STATE_PLAIN_2026-09-30.md
- docs/CLOSURE_LEDGER.md
- docs/CLAIM_LEDGER.md
- a dated file in conversation_archive/
- sector-specific files in research_archive/ when a derivation deserves its own artifact.

The recovered Aug–Sep technical conversation record has been migrated into conversation_archive/.