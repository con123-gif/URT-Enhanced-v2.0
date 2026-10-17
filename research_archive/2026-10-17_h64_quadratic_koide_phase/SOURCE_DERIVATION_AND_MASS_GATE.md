# URT/H64 Koide — actual selected-history phase response (17 October 2026)

**Result status:** new source-level mathematical result; physical charged-lepton Koide phase NOT derived. This is not a global URT / five-Platonic no-go.

## Original source provenance
Reconstructed exact source matrix arrays from user's archived `Cathedral_Continuation_2026-10-08.zip`:
`combined_source_work/species/combined_signed_source_operators.npz` and `derive_three_work/species/golden_species_operators.npz`.
Original signed-history conditional common action is 18-dimensional, with a positive Hessian; the amplitude family `A_(f,k)(x)` has twelve periodic steps.

## Dynamical phase instead of postulated phase
Original chronological links are `R_(f,k)=A_(f,k+1)^(-1)A_(f,k)`, with polar parts `U_(f,k)`. The raw full-period ordered return telescopes identically to I3. The polar return **need not** be I3 for a general history, but at the recovered common selected source it is I3 numerically to 4.98e-15 for the electron sector, and within 1.6e-14 for all four species.

**New result:** Analytically differentiate the polar decomposition `R=UP`, solving `P Ω+Ω P=U†R'-R'†U`, `U'=UΩ`, and propagate through the full 12-link product. All eighteen derivatives of the electron selected-history holonomy vanish, with max Frobenius residual **5.59e-15**. Thus its first nonzero holonomy variation is **quadratic** in genuine 18-dimensional history fluctuations. A reproducible, explicitly probe-only normalized history displacement of size `Delta` generates SU(3) eigenphases `(-3.209735, +0.623241, +2.586494)×10^-6` radians. The direction is NOT established as the physical photon source.

## Exact local quartet contraction
The original H64 `Qplus,Qminus` four-dimensional frames are entirely within the 18D period decoder. For **each** of the 12 history steps, the original amplitude derivatives contracted over either quartet give exactly `(4/3)I3`, max error **3.36e-15**. Identifying these two quartet frames with the Cathedral thermal populations `a=1/[4(1+Delta^2)]`, `b=Delta^2 a` yields the **generation-universal** local quadratic Gram response `I3/3`. This thermal identification is a cross-model hypothesis, not an established physical map. Nonlocal ordered holonomy need not vanish.

## Nonlocal quadratic response
The source-defined quadratic holonomy Hessian, contracted with those canonical quartet weights, produces a Hermitian 3x3 tensor with eigenvalues converging to approximately `(-0.742980,-0.375457,+1.118437)`. Its Frobenius norm is `1.39423`, while the remainder outside the specified C3-circulant span is `1.38843`. Hence it distinguishes three directions but **does not equal** the physical Koide circulant; no target coefficient is inserted.

## Actual geometric chiral Wilson action test
The separately certified chiral triangular face amplitudes are:
`B0=743/182250 +/- i13 sqrt(15)/60750`;
`Bchi=(699+655 Delta² +/- i54 sqrt(15) Delta)/[729000(1+Delta²)]`.
A separately hypothesized minimal Wilson term `V=-40 Re(B exp(-3i delta))` has genuine stationary phase `arg(B)/3`, which gives `0.066853147045` (bare) or `0.000248254070` (Gibbs); neither equals the observed mass-inferred `0.222222047`. The earlier proposed Berry screening `(2/9)(1-(2/(5pi))P5)` matches measured data closely as a numerical formula but is **not** the stationary phase of either loop source or the phase-independent original scalar action.

## What was achieved
**Positive new mechanism:** the real restored H64 action has an orientation-bearing, second-order history transport; the ordinary local hidden mass Gram is universal. Therefore a physically nontrivial relative mass phase, if generated in this construction, has to enter through a *nonlocal, source-selected history response*, not a scalar photon slowdown or unweighted `F²` screening. A unique dynamical photon–history vertex and positive charged pole dictionary have not yet been recovered.

**Reproducibility:** `URT_H64_Koide_Quadratic_Holonomy_2026-10-17.zip` created in current ChatGPT conversation contains untouched archived source arrays, executable `urt_h64_quadratic_phase_derivation.py`, full output `RESULTS.json`, SHA256 source hashes and mathematical report. No mass target used in the source-level construction.