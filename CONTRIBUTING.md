# Contributing

Newton's Cathedral / URT is an active research programme with a large historical audit trail. Contributions should preserve provenance and distinguish mathematics from physical interpretation.

## Before changing a canonical claim

Read:
- `docs/START_HERE.md`
- `docs/CANONICAL_STATE_PLAIN_2026-09-30.md`
- `docs/CLOSURE_LEDGER.md`
- `docs/CLAIM_LEDGER.md`

## For derivations

State:
1. assumptions;
2. defined objects;
3. exact derivation;
4. numerical checks separately;
5. what is new;
6. what is superseded/reopened, if anything.

Do not promote a numerical match to a first-principles derivation without a provenance chain that excludes fitted/observed target inputs.

## For code

- add or update tests;
- avoid generated files such as `__pycache__`;
- preserve old failed routes in the research/archive layer rather than deleting scientific provenance;
- keep engineering validation separate from fundamental-physics claims.

## Status language

Use the canonical status classes:
- CLOSED / FROZEN
- CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING
- REOPENED
- RETIRED / SUPERSEDED
- OPEN

A no-go applies to the assumptions actually tested.
