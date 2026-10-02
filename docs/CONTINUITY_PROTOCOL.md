# Newton’s Cathedral — Continuity Protocol

Date: 2026-10-02

## Source-of-truth rule

GitHub is the durable checkpoint and persistent memory anchor for Newton’s Cathedral.

The active reasoning context is broader than GitHub: use the current conversation, recoverable prior conversation context, project memory, and the repository together. GitHub exists so important state survives crashes, truncation, and conversation changes without forcing the user to remember and restate the project.

## Required workflow

For every substantive Cathedral / URT session:

1. Read the latest repository state before declaring a result new, missing, closed, reopened, or superseded.
2. Treat later explicit corrections as higher precedence than earlier claims.
3. Persist every substantive closure, correction, no-go, reopen, equation, operator, numerical certificate, and status change to GitHub.
4. Never rely on chat memory alone for canonical project continuity.
5. Never silently downgrade a prior closure merely because a downstream physical identification or continuum step remains unfinished.
6. Never delete failed or superseded routes. Preserve them with their status and reason.
7. When a result is reopened, record the exact contradiction, failed audit, or new premise that reopened it.

## Canonical status classes

Every important result should have exactly one of these statuses:

- CLOSED / FROZEN
  The mathematical or internal construction is closed and should not be reopened without an explicit contradiction.

- CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING
  The finite/internal mathematics is closed, while its physical normalization, continuum interpretation, or empirical identification remains open.

- REOPENED
  A previously closed result was explicitly reopened by a later contradiction, failed audit, no-go, or new premise.

- RETIRED / SUPERSEDED
  The route is preserved for provenance but must not be used as live evidence.

Use OPEN only for genuinely unfinished constructions that were never previously closed.

## Provenance requirement

Each ledger entry should include where possible:

- date;
- version / artifact label;
- exact equation or operator;
- status;
- superseding or reopening result;
- repository file or commit;
- whether the result is internal mathematics, physical identification, or empirical validation.

## Mandatory read set before continuing the project

At minimum, inspect:

- `docs/CANONICAL_STATE_PLAIN_2026-09-30.md`
- `docs/CLAIM_LEDGER.md`
- `docs/CLOSURE_LEDGER.md`
- `docs/PROJECT_MAP.md`
- recent commits on `newtons-cathedral`
- relevant `research_archive/` reports for the sector being changed

## Separation of layers

Do not conflate:

1. exact finite/internal mathematics;
2. candidate physical identification;
3. absolute dimensional normalization;
4. continuum completion;
5. external empirical validation.

A downstream open item does not erase an upstream closed result.

## URT continuity rule

The primitive URT object remains the original O(N) recursive selection principle together with the exact logarithmic scale-phase law

```
r_(k+1) = (pi/e) r_k
theta_(k+1) = theta_k + 2 pi / phi^2
```

or

```
w_(k+1) = w_k + Omega
Omega = ln(pi/e) + i 2 pi / phi^2
```

Later bounded-response maps are derived selector / relaxation realizations and must not silently replace the primitive URT definition.

## Archive rule

Historical branches may contain:

- valid exact mathematics;
- target-conditioned numerics;
- fitted formulas;
- superseded constructions;
- explicit no-go results;
- later-reopened no-go results.

Therefore a file name containing "closure", "proof", or "no-go" is not enough to set status. The latest precedence-ordered audit decides the live state.


## Primary workspace policy

Effective 2026-10-02, GitHub is the primary working environment for Newton's Cathedral / URT.

- Repository: `con123-gif/URT-Enhanced-v2.0`
- Primary branch: `newtons-cathedral`
- Chat is an interactive working surface, not the canonical store.
- Before substantive Cathedral work, read the current repository state first.
- During substantive work, create or update repository artifacts as the derivation progresses.
- At the end of any substantive session, persist new equations, proofs, audits, closures, corrections, no-go results, reopenings, code and status changes to GitHub.
- Do not leave important project state only in chat.
- When repository and chat recollection conflict, the precedence-ordered repository record governs unless a new explicit correction is being committed.


## Continuity burden

The user should not have to act as the project's memory.

Before asking the user to restate something, first use all recoverable context already available:
- current conversation;
- prior recoverable Cathedral context;
- canonical project memory;
- GitHub ledgers, archives and code.

GitHub is the persistent save point, not the only reasoning source.

The assistant is responsible for reconciling these sources and carrying forward prior closures correctly.
