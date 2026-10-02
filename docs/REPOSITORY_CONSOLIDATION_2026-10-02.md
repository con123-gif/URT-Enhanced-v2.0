# Repository Consolidation — 2026-10-02

## Goal

Reduce the project to one primary GitHub workspace:

`con123-gif/URT-Enhanced-v2.0`

Primary branch:

`newtons-cathedral`

## Source repositories audited

### 1. con123-gif/Newtons-cathedral-

Older packaged Cathedral snapshot.

Result:
- 40 source blobs;
- 30 byte-identical normalized files already existed in the canonical repo;
- differing historical text versions preserved under `archive/repository_snapshots/Newtons-cathedral-/`;
- root MIT license recovered;
- duplicate ZIP intentionally not copied because its unpacked content is already preserved.

### 2. con123-gif/lytolllis-chaos-lab

Unique engineering repository.

Imported:
- three named notebooks;
- Python source package;
- plasma surrogate;
- URT control module.

Destination:

`engineering/chaos_lab/`

Generated `__pycache__` files were discarded.

### Oversized legacy notebook

`lytolllis-chaos-lab/Untitled60.ipynb` is 1,736,884 bytes and cannot be read through the connected GitHub contents interface. Its blob identity is:

`fe86fd0391de4bef86706c6f14509238ec9172a6`

The source repository must not be deleted until that notebook is copied through a binary-capable route.

## Repository deletion capability

The connected GitHub toolset available in ChatGPT supports file/branch/commit operations but does **not** expose repository deletion or repository-archive settings.

Therefore:
- content consolidation can be completed here;
- final deletion of the two repository containers must be performed in GitHub settings by the repository owner after the oversized notebook is secured.

## Canonical structure after consolidation

```text
README.md
LICENSE
pyproject.toml
cathedral_core/
newtons_cathedral/
tests/
docs/
research_archive/
conversation_archive/
engineering/
archive/
```

This repository is the sole canonical workspace regardless of whether the retired repository containers remain temporarily visible.
