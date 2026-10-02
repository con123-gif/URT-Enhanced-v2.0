# Newton’s Cathedral

**A mathematical oddity — working towards a theory of nature.**

![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB)
![License](https://img.shields.io/badge/License-MIT-green)
![Workspace](https://img.shields.io/badge/workspace-GitHub%20first-181717)
![Status](https://img.shields.io/badge/status-active%20research-orange)

This repository is the **single primary workspace for Newton’s Cathedral**. Newton’s Cathedral is an evolving mathematical-physics construction: a mathematical oddity being developed towards a theory of nature. It is not presented here as a completed theory of nature.

**Universal Recursive Tuning (URT)** is the selection/dynamical principle inside Newton’s Cathedral, not the name of the overall project. The repository contains the current finite core, full audit trail, historical code, recovered conversation provenance, vortex/Navier–Stokes work, and engineering experiments.

> **Canonical rule:** current claims are governed by the canonical state and closure ledgers, not by older filenames, historical scripts, or attractive numerical matches.

## Start here

| Purpose | File |
|---|---|
| **Current live state** | [docs/LIVE_STATE_2026-10-02.md](docs/LIVE_STATE_2026-10-02.md) |
| Canonical Sept. 30 reference | [docs/CANONICAL_STATE_PLAIN_2026-09-30.md](docs/CANONICAL_STATE_PLAIN_2026-09-30.md) |
| Closure status | [docs/CLOSURE_LEDGER.md](docs/CLOSURE_LEDGER.md) |
| Claim status | [docs/CLAIM_LEDGER.md](docs/CLAIM_LEDGER.md) |
| Continuity / workflow | [docs/CONTINUITY_PROTOCOL.md](docs/CONTINUITY_PROTOCOL.md) |
| Repository map | [docs/PROJECT_MAP.md](docs/PROJECT_MAP.md) |
| Recovered chat chronology | [conversation_archive/README.md](conversation_archive/README.md) |
| Research archive | [research_archive/](research_archive/) |
| Engineering work | [engineering/](engineering/) |

## The Newton’s Cathedral programme

The working goal is to determine whether one parameter-free mathematical structure can connect history selection, information geometry, matter, gauge interactions, gravity and cosmology strongly enough to constitute a genuine theory of nature.

The current causal spine is:

## Canonical spine

```text
raw possibility / chaos
    ↓
URT selection
    ↓
bounded history-dependent response
    ↓
symmetry + Hodge reduction
    ↓
5 → 4 → 3 → 12 → 13
    ↓
finite A4/A5 / 13-site structure
    ↓
dual rails + master state ρ*
    ↓
Kubo–Mori / BKM information geometry
    ↓
geometry + gauge + matter response
    ↓
gravity / spacetime / cosmology
```

URT and entropy have different roles:

- **URT** selects admissible histories.
- **Entropy / information geometry** structures the selected state.
- The positive transfer machine `T = B†B` and the KM/BKM Hessian are the dynamical and response branches of one finite construction.

## Core finite objects

```text
φ = (1 + √5)/2
D = 3
N = 13
γ = 1/81

d*  = 80π / (1053φ)
dcl = 3/20
Δ   = dcl - d*

ρ* = (I4 ⊕ Δ² I4) / [4(1 + Δ²)]

16 = 4_g ⊕ 1_Y ⊕ 3_W ⊕ (3' ⊕ 5)_C

H64 = H13 ⊕ H51
```

The canonical 13-site spectrum is

```text
{0^(1), (6-√5)^(3), 7^(5), (6+√5)^(3), 13^(1)}.
```

## Repository layout

```text
cathedral_core/          compact current finite core
newtons_cathedral/       historical public Python package
tests/                   canonical + legacy verification
docs/                    canonical state, ledgers, maps, workflow
research_archive/        full research/audit corpus
conversation_archive/    recovered cross-chat technical chronology
engineering/             applied URT experiments and validation
archive/                 superseded repository snapshots / provenance
```

### Canonical vs historical code

`cathedral_core/` is intentionally small and conservative. It contains the currently retained finite constants, URT primitives, master entropy state and BKM response functions.

`newtons_cathedral/` is the earlier public package. It is preserved for provenance and executable historical audits, but individual modules are **not automatically canonical**.

## Quick verification

```bash
python -m pip install -e ".[dev]"
python -m pytest tests/test_canonical_core.py
```

To run the full historical suite:

```bash
python -m pytest
```

## Status discipline

Every serious result should be classified as one of:

- **CLOSED / FROZEN** — established for the defined mathematical construction.
- **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** — finite mathematics closed; physical normalization/continuum interpretation remains separate.
- **REOPENED** — an explicit later contradiction, failed audit or new premise reopened the result.
- **RETIRED / SUPERSEDED** — preserved for provenance; not live evidence.
- **OPEN** — genuinely unfinished and never previously closed.

A no-go is local to the assumptions it tested unless the current ledger explicitly promotes it to a global obstruction.

## Active research fronts

The finite machine is substantially constructed. Current work is concentrated on the interfaces that turn the finite model into a complete physical theory:

1. entropy-to-continuum gravitational normalization;
2. absolute gauge/current normalization without a free scale;
3. target-free flavour poles and mixing from the typed `H64` history operator;
4. continuum cosmological dynamics;
5. the exact unforced Navier–Stokes relay/shadowing theorem;
6. blind external validation of engineering branches.

## Engineering

Applied work is kept separate from fundamental-physics claims. The consolidated engineering area includes bounded-chaos control, plasma/turbulence experiments, EEG/seizure prediction, sensing, materials/fusion, vortex-flow control and constrained optimization.

See [engineering/README.md](engineering/README.md).

## Provenance and consolidation

This repository now consolidates the material previously split across the URT/Cathedral repositories. Older snapshots are retained under `archive/repository_snapshots/`; unique chaos-lab code and notebooks live under `engineering/chaos_lab/`.

The durable workflow is:

```text
work in chat → verify / derive → commit to GitHub → continue from GitHub
```

Important project state should never exist only in a conversation.

## License

MIT. See [LICENSE](LICENSE).
