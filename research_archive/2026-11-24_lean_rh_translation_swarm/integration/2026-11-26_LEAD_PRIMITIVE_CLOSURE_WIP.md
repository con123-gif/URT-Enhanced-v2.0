# Lead integration: primitive geometric suppliers

26 November 2026. WORK IN PROGRESS / NOT VERIFIED. Starting branch commit
`c0a35b567d91e02405b635b1bb6f3e28bfa912b1`.

Task: complete the human RH reconstruction, preserving the same A/B/C witnesses.
Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

## Prior work and scope

- Unified determinant at `95a78062`: sufficient conditional endgame; do not rederive.
- Weighted pair count at `6bdfdba6`: retains geometric saturation and lattice
  discriminant suppliers.
- Middle alignment and skew correction at `0a45200e`: source-matched human
  argument, not independently replayed; saturation divisibility remains.
- Mirror polarization, sharp Fitting polynomial and B band assembly at
  `837e9bc7`: conditional human derivations, with their listed primitives.
- Kummer and split reciprocity at `c0a35b56`: new source-matched derivation;
  independent mathematical audit still required.
- Native targeted replay run `45799225653`: published bounded success,
  ten native theorem checks and four scalar certificates, not whole RH or the
  human manuscript. Primitive replay job registered; no result in the current
  state-branch `compute/` listing.

## Chosen connected work

Read and reconstruct `New/Filling/GramLiouville`, `NearTerms`, `BlockBound`,
`AmplitudeSums`, and their exact callers. Prove the lattice index/discriminant
argument, saturation divisor at the pair-count consumer, and absolute
convergence with every measure and majorant hypothesis explicit. Integrate
accepted proofs into `HUMAN_PROOF_COMPACT.md`; retain all unresolved suppliers.
Existing 15 scheduled workers and protected workflows remain untouched.

## RESUME HERE

The local source checkout is pinned correctly. The connected derivation is
in `2026-11-26_COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md`: primitive
Gram-index, convergent subspace sum, marked-row class averaging, and the
actual saturation divisor. Absolute convergence and cutoff transport agree
with peer `15bb1dae`, retrieved after drafting; classify the overlap as REVIEW.
The manuscript §8 contains the actual caller substitutions, explicitly
pending independent audit/native replay. Exact scalar/source certificate
executed locally: 2 inequalities, 22 and 33 nonnegative coefficients,
14 authenticated source blobs; no Lean replay.

Next mathematical question: expand the two Fourier-modulus inequalities
`Gauge.formModulus_sq_le_of_char` and `_of_heads` from
`New/RealPlace/LocalTheorem.lean`, preserving their actual frequency,
head, shell and floor-Plancherel hypotheses. Do not repeat the endpoint.
