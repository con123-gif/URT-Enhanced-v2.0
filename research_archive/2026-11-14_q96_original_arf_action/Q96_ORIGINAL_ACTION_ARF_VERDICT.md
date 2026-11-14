# Q96 — ARFs must come from the original action, not Q93's substitute Gaussian

2026-11-14. **THEOREM (exact operator inequivalence), plus a direct closed response of the original all-five source.** Local Python original-operator certificate PASS and 80-digit Chebyshev/direct-sum checks PASS. CI pending. No physical ARF derived. No original source overwritten. This corrects the interpretation of Q93–Q95, rather than dismissing their scoped algebra.

## Sources and established prior work

- `cathedral_engine/histories.py`: the original 64-state de Bruijn Q and original Hbits=15I−sum X_i X_j.
- `cathedral_core/full_dynamics.py`, `docs/NATIVE_URT_FULL_COUPLED_HAMILTONIAN_DYNAMICS_2026_11_08.md`: **actual 190+64+24** quadratic history Hessian `Hbits+r² L24^(2)`, not `(e^(iω)I−Q)^*(e^(iω)I−Q)`.
- `research_archive/2026-11-10_urt_arf_forward/reports/CATHEDRAL_ARF_SOURCE_FIRST_PRINCIPLES_CONTINUATION_2026-11-09.md`: original 50-vertex nonlinear source 64-history averages `S3=36+72√5/5`, `S5=7`, its K64 3/5 poles, and no original nonlinear source residue at the K64 energy-7 pole.
- `research_archive/2026-11-10_urt_arf_forward/reports/CATHEDRAL_ARF_NATIVE_ACTION_NO_FIT_THEOREMS_2026-11-09.md`: 24-clock gauge quotient dimension 1 and unique classical zero vacuum for the original action; no 4D physical photon or fermion-mass ARF.
- `research_archive/2026-10-24_alpha_physical_gate/ACTUAL_A4_WILSON_PILOT_RESULT.md`: positive Maxwell stiffness family with unchanged symmetry and differing charged current response. This non-identifiability result is already established and is **not** claimed novel here.
- Q93–Q95 (2026-11-14): exact computations for a **separately assumed** history residual action. They must not be used as physical ARF derivations.

## Theorem A — exact parity-mode witness of inequivalence

For h∈{0,…,63} let p(h)=(-1)^(popcount h). With the original native operators
```
Q[h,2h mod64]=Q[h,2h+1 mod64]=1/2
Hbits = 15I − sum_{0<=i<j<6} X_i X_j,
```
the following identities hold exactly:
```
Hbits p = 0;     Q p = 0;     Q^T p = 0.
```
The original quadratic history kernel `Hbits` has nullity 2 (constant and parity Walsh characters); its complete eigenmultiplicities are `0(2), 10(12), 16(30), 18(20)`. In contrast the Q93 substitute quadratic kernel `K_Q(ω)=(e^(iω)I−Q)^*(e^(iω)I−Q)` satisfies `K_Q(ω)p=p` at every frequency and has untwisted nullity 1. Thus **no scalar normalization or unitary similarity can identify the original untwisted Hbits with Q93's Gaussian kernel**. At the prescribed golden 24-clock phase the original parity energy is `r²[2−2cos(2θ−2πm/24)]` with 24-mode range 0.01022872513785791 to 5.332594103081132 (dimensionless), whereas the Q93 residual has parity energy exactly 1 at every mode.

Consequently Q93–Q95 are valid only for their specified *alternative* Gaussian action, not for the original 190+64+24 Cathedral dynamics. Claims implying they derive original physical ARFs would be false.

## Theorem B — original action's actual analytic source response

For the original all-five nonlinear 50-vertex source, use the previously **exactly derived**, uniform 64-history averages `S3=36+72√5/5`, `S5=7`. The genuine history generator couples the quartets at Hbits energies 18 and 16, and the original charge-two 24-clock Laplacian has
```
ell_m=2−2cos(2θ−2πm/24),  r=π/e, θ=2π/φ².
```
After exact Schur elimination, the source-averaged trace response of the already specified original action, for spectral parameter z off its poles, is
```
Sigma(z,theta)=1/24 sum_{m=0}^{23} [
    S3/(18+r² ell_m−z) + Delta² S5/(16+r² ell_m−z)].
```
A *single exact closed formula*, with no candidate ARF coefficients, follows from the Chebyshev identity:
```
Sigma(z,theta)=sum_{a∈{18,16}} S_a/(2r²)
   * U_23(1+(a−z)/(2r²))
   / [T_24(1+(a−z)/(2r²))−cos(48θ)],
S_18=S3, S_16=Delta² S5,
Delta=3/20−80π/(1053φ).
```
The closed formula equals direct 24-mode summation at z=0,1,7,14,4+2i with absolute errors below 1e−68 using mpmath 80-digit arithmetic. At z=0,
```
Sigma(0,theta_golden)=3.3271148007912617287429372234958995...
```
**Exact derivation scope:** finite, original specified source and clock, and a chosen uniform spectral trace average; NOT a physical electromagnetic strength or a particle mass. The weight S3/S5 was previously derived from actual five-solid sources, not rederived in the short Q96 Chebyshev verification. The closed Chebyshev manipulation is exact even though its evaluation is numerical.

## Answer to the four historical ARFs

The actual four historical objects are the rail shift, electromagnetic residue, mass coefficient and mass residue:
```
rail:       Delta_delta = -delta_star³/63 − gamma/40
EM:         R_alpha = 3/(64 phi) + 1/(79 phi²)
mass:       C_mass = -5 delta_star³/16 + 7 pi phi/8
mass resid: R_mass = 3 delta_star²/35 − 4 pi³/51.
```
These four are **not** consequences of Theorem B's gauge-invariant physical observables: the current original action has no 4D physical Maxwell current and no charged fermionic pole-to-mass map. The 24-clock gauge quotient is one-dimensional (one holonomy), its classical zero-field vacuum does not source fermionic mass terms, and the independent original Wilson charged sector has not been joined with a uniquely normalised physical current. Old formulas are historical comparisons only; matching them is prohibited. This establishes underdetermination of **the currently specified action**, not the impossibility of a future completed zero-parameter URT.

## Execution and next mathematical question

```
python research_archive/2026-11-14_q96_original_arf_action/Q96_ORIGINAL_ACTION_REPLACEMENT_AUDIT.py
python research_archive/2026-11-14_q96_original_arf_action/Q96_ORIGINAL_SOURCE_CHEBYSHEV.py
```
Both locally executed with exit code 0. CI registered/pending.

**RESUME HERE:** Any claim of physical ARF derivation must give one explicit original-action-derived *charged* H64/H13⊕H51 ↔ Wilson current map and its normalisation, establish both Ward orders, and select a physical observable. Do not invent such a map by naming the internal 3/5 response as alpha or a mass; no old ARF form is required.
