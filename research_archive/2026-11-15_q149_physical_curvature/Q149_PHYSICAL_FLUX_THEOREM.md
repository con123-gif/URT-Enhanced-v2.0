# Q149 — A physical gauge-vacuum constraint, not another particle-spectrum moment

**Date:** 2026-11-15 · **Track M** (asymmetry/frustration-first, full Cathedral source) · **THEOREM: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. The underlying Q109 moving/Wilson Gaussian action is conditional and NOT selected uniquely by primitive URT. No observed constants or ARF targets are used.

## Why this is the active physics question

The objective is a physical law: original 190-cochain/H64/24 URT dynamics must determine a moving charged action, a stable 4D gauge vacuum, a massless transverse photon, its source normalization and a measurable interaction. Exact spectral moments of the 444-state source-weighted graph are useful supporting certificates but do NOT by themselves deliver that law. **Q109–Q111 had already supplied a far more advanced gauge-physics test** and must not be lost: the original v61 528-link determinant's symmetric vacuum has 397 positive, **84 strictly negative**, 47 gauge-zero modes (registered native CI PASS); Q110 proves an inequivalent nonzero minimizer exists for that declared Gaussian model, without finding it; Q111 corrected its link-angle torus period from 2π to **6π** because of fractional charges.

This certificate makes the Q109 instability directly physical in terms of native local plaquette flux rather than treating it as unidentified eigenvalues.

## Native 4D curvature theorem

Use the **actual untouched v61 source** \`research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py\`. Its 48 sites are the periodic 6×2×2×2 4-torus. There are 11 oriented links per site: 3 spatial unit axes and 8 temporal diagonals \`(1,b_1,b_2,b_3)\` with \`b_i∈{0,-1}\`. The 528 real link angles transform by a 48-site gauge gradient whose connected graph has rank 47.

Construct the *native* closed 2-cell boundaries by (a) 2640 directed 4-step commuting parallelograms from all 55 pairs of the 11 directions, at each of 48 sites, and (b) 576 three-step temporal-spatial triangles from 12 one-bit-separated temporal-diagonal pairs, at each site. Every 2-cell annihilates the 48-site gradient by exact integer arithmetic.

Four nonexact flat 1-forms assign each link its integer 4D displacement. Their integrals around the actual fundamental time/spatial Wilson cycles are exactly diagonal \`diag(6,2,2,2)\`; therefore they are independent modulo gauge. Every local two-cell curl annihilates them, proving the real rank of the 3216×528 curl map is at most \`528−47−4=477\`.

**Executable exact certification:** perform Gaussian elimination over \`GF(2)\` on every actual oriented 2-cell row (sign irrelevant mod 2): **rank 477**. A rational/integer matrix has real rank at least its reduction's rank modulo 2. Combined with the upper bound, the **exact real rank is 477**. Thus the full finite link space decomposes into **47 gauge**, **4 globally flat Wilson-loop**, and **477 local curvature** directions.

## New physical-vacuum consequence (relative to Q109)

The previously independently CI-executed original-v61 Q109 Hessian \`H=∇²Γ(0)\`, for the explicitly selected equal-weight moving+spatial Gaussian determinant \`Γ=-log|det H_joint|\`, has **84** negative physical eigenvalues. It is gauge-invariant, so the 84-dimensional negative eigenspace is transverse to the 47 gauge gradients. The 477-dimensional coexact/curvature space also lies in the 481-dimensional transverse space. The Grassmann dimension theorem therefore gives:

\`\`\`
dim(negative eigenspace ∩ locally curved coexact subspace)
   >= 84+477−481 = 80.
\`\`\`

Consequently **at least 80 linearly independent locally curvature-bearing directions reduce the declared Gaussian effective action near the symmetric configuration**, by Taylor expansion \`Γ(εv)=Γ(0)+(ε²/2)v^THv+o(ε²)\`. This is stronger than Q110's unspecified nontrivial gauge-equivalence class: a genuine *local-flux* instability has now been proved. Altering only the four global flat toron/Wilson holonomies cannot repair all these negative modes.

**Limit:** This does not prove the global minimum has local curvature; it proves curvature-bearing downhill perturbations exist at the symmetric vacuum. It does NOT derive a stable vacuum, a continuum transverse Maxwell propagator, a physical photon mass/pole, α, or a unique kinetic ratio. It does NOT prove that the conditional Q109 Gaussian model is chosen by the primitive full-Cathedral dynamics.

## Provenance and execution

- Actual v61 site/direction source and Q109 full 528 Hessian: original GitHub files referenced above; Q109 last observed registered CI PASS (checkpoint #148).
- Original native certificate: \`python research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py\`.
- Separate local executed proof in container with direct **v61 geometry transcription** and \`Q149_ALLOW_OFFLINE_GEOMETRY=1\` (not native-source verification): exact integer 2640+576 rows, F2 rank477, 4 Wilson cycles all assertions PASS. GitHub CI must run script with the ORIGINAL v61 module; do not claim CI until then.

## RESUME HERE — actual physics endgame, Q150 (subtask of ACTIVE Track M)

**Stop optimizing irrelevant graph moments.** Reuse Q109's *native* 528-link action and Q110's analytic gradient and **seek a stationary 481-dimensional gauge-quotient vacuum**, with exact gradient Ward verification. Project its physical Hessian onto the native 477-curvature/4-flat decomposition; check no negative modes and measure the smallest transverse dispersion under genuine 4D momentum. Next establish whether one and the same 190/H64/24 dynamics selects this action, kinetic ratio, and normalized electron source. Only then claim a Maxwell photon or test the fine-structure constant. Failed convergence is not a physical vacuum. No inherited Q77 kinetic selector and no target-fit ARF forms.
