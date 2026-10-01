# Repository consolidation — 1 October 2026

This repository is the canonical monorepo for Newton's Cathedral / URT.

## Source repositories reconciled

- `con123-gif/URT-Enhanced-v2.0` — canonical destination.
- `con123-gif/lytolllis-chaos-lab` — chaos / plasma / URT engineering experiments.
- `con123-gif/Newtons-cathedral-` — alternate packaged Cathedral checkpoint.

## Consolidation rules

1. Preserve Git history; do not rewrite the canonical branch.
2. Deduplicate by Git blob identity and by semantic comparison.
3. Keep the current canonical mathematics in `cathedral_core/` and the current public package in `newtons_cathedral/`.
4. Put engineering experiments under `experiments/`.
5. Put historical/superseded checkpoints under `research_archive/`.
6. Exclude generated `__pycache__`, transient build products and duplicate ZIP copies from the live tree.
7. Keep claim status explicit; importing historical code does not promote its claims to canonical status.

## Chaos-lab import

Source head: `bc6541ca8cb43e67e079239794fb6966b18cca04`.

The useful source modules and small notebooks are imported under `experiments/chaos_lab/`. Generated Python bytecode is intentionally excluded. The large unnamed Colab notebook remains preserved in the original source repository rather than being promoted into the cleaned live tree.

## Alternate Cathedral repository

Source head: `a0f4dab6be636191f77f19ff3b504de8cfba8b6f`.

Most files are byte-identical to, or already semantically incorporated into, the canonical package. Its later Lorentz/geometry/dynamics/gravity/QFT work is already represented in `newtons_cathedral/`. The source commit is retained here as provenance rather than copying a second full package tree.

## Project archive

The September 30 reconstruction placed the textual/code/data project archive under `research_archive/`. Binary scientific assets are tracked separately by manifest and SHA-256 inventory so they can be added without mixing ambiguous personal captures into the public repository.

## Canonical branch

The completed consolidation is staged on `monorepo-consolidation-2026-10-01` and then fast-forwarded into `newtons-cathedral` after integrity checks.
