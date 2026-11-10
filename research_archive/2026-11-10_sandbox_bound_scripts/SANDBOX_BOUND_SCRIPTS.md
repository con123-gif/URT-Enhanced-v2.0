# Q5 — Sandbox-bound `/mnt/data` scripts

**Date:** 2026-11-10 (Europe/London, GMT / UTC+0)
**Agent:** Grok
**Result type:** VERIFIED-ARCHIVE
**Status class:** CLOSED INTERNALLY (archive-health classification only; no physical identification)

The 14 scripts are exactly those whose latest `sweep.md` on
`cathedral-research-state` (orchestrator run
[42894969958](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42894969958),
2026-11-10T20:34:26Z) is `missing_file` with detail `sandbox path /mnt/data/...`.
The other 10 `missing_file` rows do not mention `/mnt/data`; they belong to Q6.

## Exact statement

Of those 14 scripts, exactly **3 are write-only** to `/mnt/data` and become
runnable once that directory exists and is writable; the other **11 read** one
or more hardcoded `/mnt/data` inputs, so creating the directory does not
unblock them.

A script is write-only if every `/mnt/data` filesystem use is a write
(`open(..., "w")`, `Path.write_text`, …). It is read-input if any use is a
read (`runpy.run_path`, `Path.read_text`, `open` in a read mode, …). Mixed
scripts (read then write) are read-input: an empty `/mnt/data` is not enough.

## Group A — write-only (3)

These compute from in-process constructions and write a results JSON under
`/mnt/data`. They were executed on this machine after
`sudo mkdir -p /mnt/data && sudo chmod a+rwx /mnt/data`
(`Path("/mnt/data").mkdir(...)` itself raised `PermissionError` because
`/mnt` is `root:root`). Each then exited 0 and wrote its JSON.

| Script | Write | Execution |
|---|---|---|
| `research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/decoded_originals/URT_full_framework/source_archive/urt_platonic_u2_holonomy.py` | `/mnt/data/urt_platonic_u2_holonomy_results.json` (line 125) | exit 0; 3322-byte JSON; system python (numpy, scipy) |
| `research_archive/2026-10-25_golay_leech_selection/cathedral_golay_leech_selection_audit.py` | `/mnt/data/cathedral_golay_leech_selection_results.json` (line 158) | exit 0; 2458-byte JSON; this box's system python lacks `networkx`, so it was rerun in a venv with networkx + numpy + scipy. CI already has networkx. |
| `research_archive/2026-11-10_urt_arf_forward/aux_tests/cathedral_native_spatial_vacuum_audit_2026-11-09.py` | `/mnt/data/cathedral_native_spatial_vacuum_audit_2026-11-09.json` (line 116) | exit 0; 1677-byte JSON; system python |

The holonomy script contains numerical target arrays. They were not used as
inputs to this classification; the script was run only to test its `/mnt/data`
write.

## Group B — read-input (11)

Each was executed with `/mnt/data` already present and writable. All 11 failed
on a missing `/mnt/data` input (the inter-sheet script first needed
`networkx` and `sympy`, then failed on the same class of missing file).

| Script | `/mnt/data` reads | Also writes | Execution |
|---|---|---|---|
| `.../source_archive/derive_a4_clifford_dirac.py` | `/mnt/data/cathedral_finite_dirac_trace_audit.py` (line 8) | `a4_clifford_dirac_results.json` | `FileNotFoundError` on the audit script |
| `.../source_archive/urt_dirac_selection_audit.py` | `/mnt/data/derive_a4_clifford_dirac.py` (line 9); `/mnt/data/a4_clifford_dirac_results.json` (line 10) | `urt_dirac_selection_audit_results.json`, `urt_dirac_selection_audit_report.txt` | `FileNotFoundError` on `derive_a4_clifford_dirac.py` |
| `.../audit/arf_full_five_charged_no_fit_nonuniqueness_2026_11_09.py` | `/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py` (line 9) | — | `FileNotFoundError` on that file |
| `.../audit/arf_inter_sheet_current_pole_derivation_2026_11_09.py` | `/mnt/data/cathedral_audit/cathedral_64_chiral_hybridization_2026_10_29.py` (line 8); same directory `cathedral_constructed_joint_dynamics_2026_11_07.py` (line 46) | — | `FileNotFoundError` on the hybridization script |
| `.../audit/first_principles_arf_source_test.py` | `/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py` (line 3) | — | `FileNotFoundError` on that file |
| `.../aux_tests/URT_HISTORY_CLOCK_INFORMATION_CURVATURE_2026-11-09.py` | `/mnt/data/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py` (line 7) | — | `FileNotFoundError` on that file |
| `.../aux_tests/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py` | `/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py` (line 13) | — | `FileNotFoundError` on that file |
| `.../aux_tests/URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py` | `/mnt/data/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py` (line 10); `/mnt/data/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py` (line 11) | — | `FileNotFoundError` on the coupling script |
| `.../new_gate/URT_ORIGINAL_190X64_DIAGONAL_CHARGE_AND_FIVE_SOLID_SECTORS_2026_11_10.py` | `/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py` (line 15) | — | `FileNotFoundError` on that file |
| `.../new_gate/URT_TRANSFER_ITERATES_KMS_TEST_2026_11_10.py` | `/mnt/data/urt_arf_forward_2026_11_09/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py` (line 7) | — | `FileNotFoundError` on that file |
| `.../Cathedral_v129_Universe_Fallout_2026-09-12/cathedral_v129_universe_fallout_verify.py` | `/mnt/data/Cathedral_v129_Universe_Fallout_Symbiotic_Theorem_results.json` (line 25) | — | `FileNotFoundError` on that JSON |

Q5's phrase “inputs that existed only in ChatGPT's sandbox” is true of the
**hardcoded paths**. It is not always true of the **file contents**: eight of
the nine distinct read basenames already have at least one same-named file in
`research_archive/`. The exception is `a4_clifford_dirac_results.json`, which
would be produced by `derive_a4_clifford_dirac.py` after *its* sandbox input
was present. Copies in the archive do not unblock these scripts, because they
do not look next to themselves.

Same-named committed copies (informational; not a Q6 producer→consumer map):

- `cathedral_finite_dirac_trace_audit.py` → `research_archive/cathedral_finite_dirac_trace_audit.py`
- `derive_a4_clifford_dirac.py` → the Q5 script itself, and `research_archive/derive_a4_clifford_dirac.py`
- `cathedral_constructed_joint_dynamics_2026_11_07.py` → four copies, including `research_archive/2026-11-10_urt_arf_forward/audit/`
- `cathedral_64_chiral_hybridization_2026_10_29.py` → `.../audit/` and `.../aux_tests/cathedral_audit/`
- `URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py` → `.../aux_tests/` and `.../forward/`
- `URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py` → `.../aux_tests/` and `.../forward/`
- `Cathedral_v129_Universe_Fallout_Symbiotic_Theorem_results.json` → the same folder as the verify script

## Proposed one-line sweep change

Insert this line in `research_archive/cathedral_arf_runner/orchestrator.py`,
function `sweep()`, immediately after the existing
`out.mkdir(parents=True, exist_ok=True)` (currently line 249):

```python
Path("/mnt/data").mkdir(parents=True, exist_ok=True)
```

This would unblock only the three write-only scripts, and only if the sweep
process can create a writable `/mnt/data`.

**Permission caveat, executed here.** `Path("/mnt/data").mkdir(parents=True, exist_ok=True)`
raised `PermissionError: [Errno 13] Permission denied: '/mnt/data'` because
`/mnt` is `root:root` mode 755. `sudo mkdir -p /mnt/data` succeeded but left
`root:root` mode 755, so writes would still fail until
`sudo chmod a+rwx /mnt/data`. GitHub-hosted runners are the same kind of
environment (`/mnt` root-owned; passwordless sudo typically available). A bare
mkdir in `sweep()` would therefore raise `PermissionError` and stop the whole
sweep unless the workflow first creates a writable `/mnt/data`. This session
does not edit `.github/workflows/` and does not insert the line.

## Certificate

`classify_sandbox_bound_scripts.py` re-derives the classification from the
AST of the 14 scripts (stdlib only) and checks the frozen 3/11 split. It does
not create `/mnt/data` and does not require networkx or sympy.

## What remains open

- Q6: the other 10 `missing_file` scripts (non-`/mnt/data` intermediates).
- Whether to implement the proposed mkdir, and how to give the CI runner a
  writable `/mnt/data` without breaking the sweep. Not done here.
- Redirecting the 11 read-input scripts to the same-named archive copies.
  That would be a separate repair; several of those copies themselves read
  further `/mnt/data` paths (for example the aux_tests pullback script).
