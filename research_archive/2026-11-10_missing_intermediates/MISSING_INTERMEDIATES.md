# Q6 — Missing intermediate producer map

**Date:** 2026-11-10 (Europe/London, GMT / UTC+0)
**Agent:** Grok
**Result type:** VERIFIED-ARCHIVE
**Status class:** CLOSED INTERNALLY (archive-health classification only; no physical identification)

The 10 scripts are exactly those whose latest `sweep.md` on
`cathedral-research-state` (orchestrator run
[42903908099](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42903908099),
2026-11-10T21:31:28Z, commit `d0eb5ed`) is `missing_file` with a detail that is
**not** a sandbox path `/mnt/data`. The other 14 `missing_file` rows are the
Q5 `/mnt/data` set.

## Exact statement

Of those 10 scripts, **no archived script writes the sweep-reported missing
file at the path the consumer opens**. There is therefore **no sweep
reordering** that unblocks any of them.

Exactly **one** archived script writes one of the ten *basenames*:
`golden_species_derivation.py` writes `golden_species_operators.npz` next to
itself (where a committed copy already exists). The consumer
`urt_h64_quadratic_phase_derivation.py` looks for that basename in its own
directory. The producer is itself one of these 10 consumers and cannot run
(it fails first on `flavour_work_v2/grounded_charged_amplitude_operators.npz`).

The other nine missing files have no producer in the archive at all.

## Producer → consumer

| Producer | Writes | Consumer opens | Sweep order |
|---|---|---|---|
| `research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_derivation.py` | `…/derive_three_work/species/golden_species_operators.npz` | `research_archive/2026-10-17_h64_quadratic_koide_phase/golden_species_operators.npz` | None. Different directories; a committed copy already sits at the write path. |

No other producer → consumer pair exists for the ten sweep-reported files.

## The ten remaining consumers

Each script was executed in this session after
`restore_matrices.py` (nice, `OMP_NUM_THREADS=1`, `OPENBLAS_NUM_THREADS=1`).
All ten exited 1 on a `FileNotFoundError` whose last quoted path equals the
`sweep.md` detail.

| Consumer | Sweep-reported missing file | Producer? |
|---|---|---|
| `…/h64_quadratic_koide_phase/urt_h64_quadratic_phase_derivation.py` | `…/h64_quadratic_koide_phase/golden_species_operators.npz` | Basename only, wrong directory (row above) |
| `…/combined_source_work/photon/correlated_long_transfer.py` | `…/joint_vacuum_work/photon/correlated_hat_k5_checks.json` | None; directory `joint_vacuum_work/photon/` is absent |
| `…/combined_source_work/species/combined_signed_source.py` | `…/flavour_work_v2/outer_history_operators.npz` | None; directory `flavour_work_v2/` is absent |
| `…/common_action_work/matter/microscopic_source_currents.py` | `…/common_action_work/recovery/theory_input_v5.md` | None. Provenance markdown; hashed, not read numerically. CI already runs this script through `run_native_source.py` |
| `…/common_action_work/photon/translated_photon_response.py` | `…/derive_three_work/photon/a4_entropy_gaussian.py` | None; directory `derive_three_work/photon/` is absent |
| `…/common_action_work/review/source_response_dictionary.py` | `…/response_join_work/normalization/compact_source_normalization_operators.npz` | None; directory `response_join_work/` is absent |
| `…/derive_three_work/species/golden_species_derivation.py` | `…/flavour_work_v2/grounded_charged_amplitude_operators.npz` | None; directory `flavour_work_v2/` is absent |
| `…/final_join_work/matter/full_period_physical.py` | `…/combined_source_work/recovery/combined_chat_recovery.json` | None; directory `combined_source_work/recovery/` is absent |
| `…/source_h64_joint_flux/joint_urt_h64_joint_holonomy_and_mass.py` | `…/source_h64_joint_flux/original_h64_species_link_source.npz` | None |
| `…/URT_Nature_Checkpoint_2026-08-25/urt_blocked_numpy_compat.py` | `…/URT_Nature_Checkpoint_2026-08-25/full_library/run_endpoint_test.py` | None; directory `full_library/` is absent |

Running the raw `microscopic_source_currents.py` wrote
`microscopic_source_currents_operators.npz` and then failed while hashing the
missing provenance file, matching `run_native_source.py`. That generated NPZ
was not committed.

## Same-named or near-named files already in the archive

These are committed copies or near-names, **not** runtime producers. They do
not change the sweep-order conclusion.

- `golden_species_operators.npz` — three byte-identical copies, sha256
  `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`, size
  1073079 bytes, in
  `2026-10-17_exact_14D_H64_reduction/`,
  `2026-10-17_original_oct08_source/derive_three_work/species/` (the
  producer's write path) and `2026-10-17_source_first_recovery/`. All three
  contain the keys `Qplus` and `Qminus` that the quadratic-phase consumer
  reads. None sits in `2026-10-17_h64_quadratic_koide_phase/`.
- `run_endpoint_test.py` — a file of that name exists at
  `research_archive/run_endpoint_test.py`. Several other names the
  checkpoint script opens from `full_library/` likewise exist at archive
  root (`gauge_preserving_exterior_solver_q.py`, the `urt_gate2_*.py`
  solvers, and some JSON results). Two names it also opens from
  `full_library/` exist nowhere: `urt_gate2_solution.npz` and
  `urt_seed_geometry_matrices.npz`.
- `original_h64_species_link_source.npz` — no file of that name. The same
  folder contains `joint_original_h64_species_link_source.npz` (recovered
  via `RECOVERY_MANIFEST.json`, sha256
  `1bf7f26d468bc6a672eba573522bd6063ac592a0642d8a9550e3b9df5c672642`).
  That near-name has the keys the consumer reads
  (`{u,d,e,nu}_amplitudes` and `{u,d,e,nu}_polar_links`).

The other seven missing basenames have no committed copy anywhere under
`research_archive/`.

## `restore_matrices.py` (related, not a Q6 producer)

`research_archive/2026-10-17_recovery_assets/restore_matrices.py` reconstructs
`combined_signed_source_operators.npz` from six committed `.partXX` blobs
into two destinations:

- `research_archive/2026-10-17_h64_quadratic_koide_phase/combined_signed_source_operators.npz`
- `research_archive/2026-10-17_original_oct08_source/combined_source_work/species/combined_signed_source_operators.npz`

Neither is a Q6 missing file. After restore, the quadratic-phase script
fails on `golden_species_operators.npz` (its second local input) and
`full_period_physical.py` fails on the provenance file
`combined_chat_recovery.json`. The CI sweep already runs this restorer
(it passes as a sweep target, and `run_native_source.py` invokes it).

`combined_signed_source.py` would also write
`combined_signed_source_operators.npz` next to itself if it could run; it
cannot, because `outer_history_operators.npz` is missing.

## Sweep ordering

No reordering of `orchestrator.py` `sweep()` can unblock any of these 10
scripts: no archived script writes the missing file at the path the
consumer opens. A companion copy at the consumer path is a different
repair (queue Q13); this item does not invent or copy file contents.

## Certificate

`find_missing_intermediate_producers.py` (stdlib only) walks
`research_archive/**/*.py`, finds writes of the ten basenames, checks the
committed copies and the restore targets, and exits 0 iff the frozen
classification holds.

## 2026-11-11 Q26 regression repair (GPT)

This document preserves the **2026-11-10 historical snapshot**. Q13 subsequently
restored two of its ten missing consumer paths using byte-identical companion
copies: `golden_species_operators.npz` (SHA256 `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`)
and `original_h64_species_link_source.npz` (SHA256
`1bf7f26d468bc6a672eba573522bd6063ac592a0642d8a9550e3b9df5c672642`).
The Q6 executable now checks these original/copy hashes instead of incorrectly
requiring their continued absence. The historical producer scan is unchanged:
**one basename-level producer, zero exact-path producers**. Eight original
targets remain absent; seven have no archived same-basename copy. The remaining
`run_endpoint_test.py` exists at archive root but not in the consumer's
`full_library/` directory. Q13's separate consumer executions establish that
the two repaired scripts run; this Q6 certificate establishes the archive's
current integrity, not a physical law.
