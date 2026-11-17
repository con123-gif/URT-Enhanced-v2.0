# Spiral/frustration-to-URT: recovery checkpoint (2026-11-17)

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for exact finite statements; conditional for the choice of rates, chiral coherence, and rail normalization. **The theory of nature is not complete**.

This folder recovers previously uncommitted 2026-11-17 research from the conversation and stores directly executable certificates. No arbitrary physical constants have been fitted to the observed baryon ratio. The exact current GitHub source of native operators is documented in the archived Q101/Q124/Q125a/Q159/Q161 records; these are self-contained reconstructions, **not** a replacement for the original full 190/H64/24 source and Ward validation.

## Concrete results
1. Golden winding: `F_n phi^-2 - F_(n-2) = (-1)^n phi^-n`; eight-step defect `phi^-6`; 24-step defect `3 phi^-6`. Fibonacci hierarchy **assumed**, radial URT modulus `pi/e` and unique rails **not derived**.
2. Frustrated 13-contact shell: exact 8192 configurations; 444-state barrier sublevel; 1032 links; 30 ground states per centre orientation. The order parameter `c M/12=1/3` on every ground configuration, but symmetry gives zero signed `M` ensemble average.
3. Exact heat-bath barrier capacity: 72 central saddle pairs split 60 with four downhill links and 12 with five. Effective capacity `60*(2/5)+12*(5/12)=29`, gap prefactor `29/15`. The attempt-time normalization is assumed.
4. Source-based conditional 444-state NESS: original Q101/Q125 full-five source `J0`, candidate centre grading `Jg`, 12 A5 orbits. `Jg_outer=c J0`; centre current active on 60 saddles; phase-biased rates yield `P(c+)-P(c-)=-1.2430711770e-7` and nonzero entropy production. The affine phase-to-rate mapping and centre grading are **model choices**.
5. Q96 charge-respecting transfer: original 1032 intertwiners `[U,B]=0`; geometric spin imbalance does **not** produce net baryon number without a derived nonconserving/anomalous or initial-charge mechanism. Multiplication by maximal hidden coherence yielding `~6.18844e-10` is a **post-hoc numerical composite, not a physical prediction**.
6. All-five spiral-face closure report and candidate 4+4 KMS structure are historical conditional constructions; the 81-state rail trace is not uniquely forced by spiral geometry.
7. Q159/Q161 moving spatial gap and full physical source-to-Ward transfer remain open; this recovery does not supersede original finite-lattice results.

## Commands
Run in repository root:
```sh
python research_archive/2026-11-17_spiral_frustration_urt_recovery/FIBONACCI_CLOSURE_CERTIFICATE.py
OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-17_spiral_frustration_urt_recovery/cathedral_444_physical_reversal.py
OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-17_spiral_frustration_urt_recovery/cathedral_frustration_asymmetry_physical_test_2026_11_17.py
OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-17_spiral_frustration_urt_recovery/cathedral_urt_parity_history_test_2026_11_17.py
OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-17_spiral_frustration_urt_recovery/cathedral_10orbit_coupled_current.py
```
The above files were reproduced and executed in a local GPT container before GitHub upload (standalone Fibonacci check from prior local script; repository-specific new check awaits CI).
**RESUME HERE:** Continue **Q161ad**, sourcing the *actual* 190/H64/24-clock face amplitude and checking native Q96 Ward transport; do not identify oriented spin polarization with baryon number until a gauge-invariant observable evolution is derived.
