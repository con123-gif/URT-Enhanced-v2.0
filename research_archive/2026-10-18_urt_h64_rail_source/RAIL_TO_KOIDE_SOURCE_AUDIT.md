# URT/H64 genuine-source rail coupling audit — 18 October 2026

**Source-level computation; not a charged-lepton Koide closure.** Computed without mass inputs from archived `golden_species_operators.npz` (SHA256 `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`) and the original signed-history 18D `combined_signed_source_operators.npz` (SHA256 `00715b3891570814eb346387017ea7abcaf166f215d5e83655b17673c23e1b58`).

## Native symmetry-derived gap response

The original electron-type 64x64 conditional positive matrices obey `K_cross-K_base=w w†` (residual 4.34e-15). Project onto the excited hidden 4_5 quartet with `P5=Qminus Qminus†`: `||P5 w||²=[486/(25 phi²)] Delta²=4.600838826238046e-5`, `Delta=3/20-80pi/(1053phi)=0.0024891898404204027`. The baseline commutes with `P5` (2.53e-15), while the retained electron generation3 is even under `J=I-2P5`. Thus `J K(Delta) J=K(-Delta)` (1.79e-14), so physical spectral responses are even in the gap and start at second order. The linear `4 Delta` and arbitrary 36-channel averaging do not follow.

The original invariant active H4 block is
```
H4=diag(0.7822507311068735,3.551149519739926,3,5)+u u^T
u=(0.8556003207749434,1.248897176948704,
   sqrt(6)/phi,(9/5)*sqrt(6)/phi*Delta)
```
with secular `F(z,Delta)=1-sum(u_j²/(z-d_j))=0`.
Implicit differentiation at Delta=0 gives the light-root coefficient `d z/d(Delta²)=-0.16306897291135`, giving `-1.01038612876e-6` predicted shift; the exact 64x64 shift is `-1.01038229672e-6`.

## Compose with original URT scalar rail flow

In uniform 13-site sector `d_{t+1}=d_t-[1/(8pi)](phi-1)(d_t-d_star)(1+d_t²)`, `d_0=3/20`, `d_star=80pi/(1053phi)`. Define the **conditional source composition** `K_t=K_base+(w_rest+[(3/20-d_t)/Delta] P5 w)(...)†` without adding a mass target.

Diagonalize the **full 64x64** source at each step and choose the top 3 overlap states with the original archival electron generation frame. Poles at endpoint: `(0.116918003429,1.044257140856,2.343665940468)`. Read as conditional root masses, `Q=0.5370368460413`, cosine amplitude `r=1.105541078499`, generalized phase `theta=0.427426315309`. Relative to the classical-rail start, `Delta Q=+1.37850396764e-7`, `Delta theta=-5.19111921060e-7 rad`.

The native source therefore demonstrates the gap-squared phase **scale and sign** without fitting, but does not yield `Q=2/3`, `r=sqrt(2)`, or the mass-inferred `theta≈0.222222047`. Its leading phase coefficient is `-0.08378121 Delta²`, not the previously postulated screened Koide `-4/(45pi) Delta² ≈ -0.02829421 Delta²`.

## Basis and actual history checks

Changing the retained13 basis by fractional 13-point QR at either rail is unitary conjugation: source spectrum remains invariant within 3.9e-15. The 4x9 interface Frobenius norm changes `2.99279607 -> 2.99352646` because the *subspace* moves, not because column phases alter poles. Physical electron-generation effective 3x3 Schur complement at real `z=-0.1` has invariant triangular link product phase `≈-3.6e-19 rad` and is substantially non-circulant (`||H-P_C3(H)||_F≈1.52378`). No native Koide holonomy follows from the QR coordinates.

The original 18D signed-history Hessian has smallest eigenvalue `2.4462302511`; its unique lowest normalized eigenmode, displaced by `Delta`, leaves the electron 12-link polar holonomy unchanged at ≲1.3e-15 rad. Other Hessian eigenmodes produce source-defined quadratic eigenphases, up to `5.47e-6 rad`, with some at `~1.72e-7 rad`. The action does **not** identify a unique 13-site-URT to 18D-H64 source direction or turn these SU3 eigenphases into the charged pole determinant. Near equality of a holonomy scale and the empirical Koide correction is not sufficient.

The separate positive-circulant toy action `Gamma=(kappa/2)Tr(M²)-ln v-ln|s|` does analytically imply `2|s|/v=sqrt(2)` and `Q=2/3`, but the original H64 source does not currently derive this action for its charged poles, nor fix the phase. Preserve established URT geometry, hidden parity, and nonlocal phase response without promoting this candidate to a completed physical theorem.

**Evidence:** original source NPZ files already archived under `research_archive/2026-10-17_source_first_recovery/` and `research_archive/2026-10-17_h64_quadratic_koide_phase/`. Standalone scripts, JSON outputs, original archive bytes and detailed report produced in the October 18 conversation artifact `URT_H64_RAIL_SOURCE_CALCULATION_2026-10-18.zip`. The old source binaries were *not* modified.
