# Archive / Provenance

This directory preserves material that should remain available for audit but should not clutter the live canonical workspace.

## repository_snapshots/

Historical files that differed from the current canonical repository at consolidation time.

These snapshots are **not authoritative current code**. They exist so older repository content can be retired without losing provenance.

## research_archive/ vs archive/

- `../research_archive/` is the working scientific archive: derivations, audits, result JSON, scripts, no-go tests and verification artifacts.
- `archive/` is repository-level provenance: superseded public snapshots, migration records and retired packaging.

Never promote an archived result back into the canonical theory without reconciling it against the current ledgers.
