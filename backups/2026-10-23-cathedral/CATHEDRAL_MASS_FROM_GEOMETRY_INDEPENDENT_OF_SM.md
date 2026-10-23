# From the Cathedral to the numbers — first-principles status (23 October 2026)

**Goal:** derive measured observables directly from URT/Cathedral histories; do not insert Standard Model Yukawa couplings, unification scales or phenomenological gravity constants. Distinguish conditional theory from data-inferred phases. Nothing here establishes the Standard Model is experimentally wrong.

## 1. Exact positive root-mass geometry (no Standard Model assumed)

Let `C^3=I` be the cyclic generation shift and `X=v I + s C + s* C^2` a Hermitian **positive** three-generation root-mass operator, with `v>0`, `s=r exp(iδ)`. Eigenvalues are `x_k=v+2r cos(δ+2πk/3)` and physical candidate squared masses `m_k=x_k²`. Thus

    Q=Tr X²/(Tr X)² = 1/3 + 2 r²/(3 v²).

If `r/v=1/sqrt(2)` follows from dynamics, Koide `Q=2/3` follows identically.

Positivity `x_k≥0`, combined with this ratio, restricts the phase (up to cyclic relabelling and complex conjugation) to

    0≤δ≤π/12   (15 degrees).

At δ=π/12 the lightest x vanishes, while `x_heavy=(3+sqrt3)v/2`, `x_middle=(3-sqrt3)v/2`. Hence the endpoint heavy-to-middle squared-mass ratio is **exactly** `7+4 sqrt(3) = 13.92820323...`. Near that endpoint the lightest squared mass vanishes **quadratically** in `(π/12-δ)`, supplying a mathematically concrete hierarchy mechanism without assigning different Yukawa inputs by hand.

**This does not select δ.** From the historically used *measured electron/muon mass ratio alone*, δ=0.222222047073... and the resulting **conditional** tau mass is 1776.9690 MeV; the comparison mass cited in the recovered script is 1776.93±0.09 MeV. This is a one-observation → another-observation check, not a zero-input prediction of the three masses. The phase 0.222222... remains sourced from data until the complete chronological URT action selects it.

## 2. Exact audit of the allegedly first-principles Koide logarithms

Recovered `kl_urt_koide_action.py` uses `Γ=κ/2 Tr X² −ln v−ln r`, giving `r/v=1/sqrt2` by stationarity. But the origin of **both** `−ln` terms must be established by the microscopic Cathedral measure.

There is a minimal sufficient mechanism: if the singlet baseline mode is a **complex** amplitude `ψ0` with `v=|ψ0|` and the cyclic bridge mode is a complex amplitude `ψ1=s`, the flat quantum-amplitude measure is

    d²ψ0 d²ψ1 ∝ v r dv dr d(arg ψ0) dδ.

Combining this measure with the quadratic invariant Gaussian `exp(−κ Tr X²/2)` yields the effective radial negative-log action exactly `Γ=κ(3v²+6r²)/2−ln v−ln r`, and its radial stationary point has `Q=2/3`, independent of κ. Positivity leaves the phase interval above. **This is a candidate mechanism, conditional on the Cathedral deriving two independent complex amplitudes and a Gaussian amplitude measure.** A mode of a coordinate density is not an observer-independent physical prediction without a well-defined measurement/postselection rule. No physical generation pole is established by the stationary coordinate density alone.

For contrast, if `v` is only **one real scalar** and `s` one complex scalar, the natural flat measure is `dv dRe(s) dIm(s) ∝ r dv dr dδ`; it does **not** provide `−ln v`. Its positive-cone Gaussian ensemble yields exact (numerically verified) average `E Q = 0.4601816876902764`, not `2/3`. If both amplitudes are complex, the corresponding positive-cone ensemble average is `E Q = 0.4494756436456943` (distinct from the radial-mode value `2/3`). Thus it is crucial to specify what *physical observable* follows from the history measure: pointwise pole invariant, average, or radial mode.

The positive-phase fraction for `r/v=1/sqrt2` is exactly **1/4** of the cyclic phase circle; proof: the allowed δ windows total π/6 out of 2π/3. This constraint arises directly from the spectral positivity cone, not empirical fitting.

## 3. Stress test against actual 64-state chronological geometry

`native_spiral_stress_test.py` loads the previously reconstructed icosahedral six-step vortex/hypercube operators, not a simplified replacement. As an *unfitted diagnostic*, let the nonunitary step amplitude be the canonical URT log radial scale `g=ln(π/e)` and repeat the six-step operator for 13 cycles. Compress its positive transfer onto the established three-state tetrahedral subspace. Result:

    Q(T-projected eigenvalues as root-masses)=0.333463364...
    Q(sqrt(T)-projected eigenvalues as root-masses)=0.333365947...

Both are near the equal-mass limit, **not** `2/3`. The assignment `g=ln(π/e)`, the repetition count and the correspondence between these eigenvalues and lepton root-masses are conditional trial identifications. This is only a test of this candidate bridge, not a refutation of URT as a whole. Crucially, it demonstrates that one cannot get observed hierarchy merely by renaming the six-step vortex operator a charged-lepton mass operator.

## 4. What a no-Standard-Model derivation must achieve

- Microscopic history law specifies the base complex modes and their integration measure, not just the desired `−ln v−ln r` radial action.
- History chronology and positive transfer select a unique phase δ and physical poles, rather than using the experimental mass ratio to infer δ.
- The same transfer defines operational currents and scattering probabilities from its independent measurement prescription. Do not first assume the Yukawa or electroweak Lagrangian.
- The absolute dimensional mass unit must come from a sourced physical clock/length/energy calibration. A normalized density matrix and dimensionless φ, π, e, Δ alone can fix dimensionless ratios but cannot specify an eV-valued pole without a dimensional map. This is an issue of physical calibration, not a newly invented independent Yukawa parameter.

**Closure:** positivity phase window, endpoint mass ratio, and ensemble integrals are exact conditional geometry results; neither the Koide radial measure nor the physical chronological phase has yet been deduced uniquely from the full Cathedral. No new fitted parameter introduced. No existing closed result silently invalidated.

## Reproduction

`python koide_positive_cone_test.py`

`python measure_test.py`

`OPENBLAS_NUM_THREADS=1 python native_spiral_stress_test.py`

The latter includes original 64-state symmetry-source scripts locally. It writes no files to the original repository.