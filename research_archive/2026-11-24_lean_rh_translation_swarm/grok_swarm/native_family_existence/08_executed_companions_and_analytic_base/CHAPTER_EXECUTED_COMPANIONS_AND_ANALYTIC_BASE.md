# Chapter 08: executed companions, and the analytic base under (LZ) and ZetaLocal

Lane: native_family_existence. Run 8, 2026-11-24 (GMT).
Pin: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`, with Mathlib `0df444a`.
Paths are relative to `src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/` unless stated otherwise.

## Part 0. What was actually executed (real Lean output in the logs)

**How it was built.** Lake was not used, and nothing was downloaded. The dependency oleans were taken read-only from `/workspace/rh_green_lean/.lake/packages`. Those are the Green lane's builds of Mathlib, batteries, aesop, Qq, proofwidgets, plausible, importGraph, LeanSearchClient and Cli. Their revisions in `lake-manifest.json` are identical to the upstream manifest for all 9 packages, which was checked. The pinned upstream **source** modules that the companions import were compiled from source, one by one, with core `lean` v4.33.1 (`build_closure.py`). The options were copied from the upstream `lakefile.toml`: `autoImplicit=false`, `relaxedAutoImplicit=false`, `maxSynthPendingDepth=3`, `maxHeartbeats=4000000` and `--tstack=400000`. The outputs went to a scratch directory. The `rh_green_lean` tree was not written to. Direct `lean` was used instead of `lake build` so that lake could not rebuild or re-trace the shared packages.

- `build_run.log`: **29/29 upstream modules compiled, 0 failures.** The import closure is computed from the `import` lines, starting at the companions' imports plus the run-8 targets. The only warnings are linter and deprecation messages. No module contains `sorry`. The verifier confirms the source tree that was compiled is blob-identical to the pin.
- `companion_run.log`: the companions, run **unmodified**, exactly as committed:

| companion (as committed) | result | `#print axioms` |
|---|---|---|
| 05_/RH_LandauPageCompanion.lean | **exit 0** | `RealZeroNearOne.main`, `ZeroGapNearOne.exists_gap`: [propext, Classical.choice, Quot.sound] |
| 06_/RH_ZeroFreeCompanion.lean | **exit 0** | `ZeroFreeComplex.zero_free_region`, `ZeroFreePrincipal.zero_free`, `Lin.zeros_eq_zeros_primitiveCharacter`: [propext, Classical.choice, Quot.sound] |
| 07_/RH_Run7Companion.lean | **exit 1**: `comp/RH_Run7Companion.lean:16:8: error(lean.unknownIdentifier): Unknown identifier `GlobalTheory.LLocal.logDeriv_LFunction_local`` | the remaining commands ran: `LOneLower.inv_le_norm_LFunction_one`, `DirichletDeriv.exists_norm_deriv_LFunction_le`: [propext, Classical.choice, Quot.sound] |
| 08_/RH_Run8Companion.lean (new) | **exit 0** | all 8 targets below: [propext, Classical.choice, Quot.sound] |

**Cause of the run-7 failure.** It was my own mistake. The run-7 companion did not import `LogDerivDirichletLFunctionLocalZeroSum`, so the name was out of scope. The name itself is correct. `RH_Run7Companion_fixed.lean` adds that one import line and a new header comment, and changes nothing else; the diff is recorded. Its result is in the last section of `companion_run.log`: **exit 0**, `#check` prints the `LLocal.logDeriv_LFunction_local` statement, and the axioms are the same three. The committed run-7 file is left as it was and still fails as committed.

The statement `example`s in the run-5 and run-6 companions re-type the chapter statements and close them with the upstream terms. They elaborated, so chapters 05 and 06 quote those statements faithfully. The §D weakening `example` in the run-7 companion also elaborated.

**Not executed.** The companions in 02_, 03_ and 04_, and the top-level `RH_NativeFamilyExistenceCompanion.lean`, import closures of roughly 13,300 to 175,000 upstream modules, as computed by `clos.py`. Building those means building the whole project, which is beyond this box's time and disk budget, so they stay NOT EXECUTED. The 04_ companion pulls in `MainConclusion`, so even the exceptional-pair statement alone was not cheap. The upstream proof as a whole was **not** compiled.

**What this run establishes, stated honestly.** The upstream proofs of every declaration in the 29-module closure, including T-1a, T-1b, T-1c, T-1d, T-1e, the run-7 lemmas and the run-8 lemmas, typecheck against Mathlib 0df444a, and their transitive axioms are only Lean's three standard ones. Every declaration in that closure is proved, and none is assumed. This is still not RH, and no gate is closed. The theorems in 02_ to 04_ that sit above `ExceptionalPair.main` were not compiled here.

---
## A. `GlobalTheory.FactorOrderExistence.exists_factor_order` (ExistsFactorOrder.lean:7)
```lean
theorem exists_factor_order {U : Set ℂ} {g : ℂ → ℂ} (hg : AnalyticOnNhd ℂ g U) {w : ℂ}
    (hw : w ∈ U) (hord : analyticOrderAt g w ≠ ⊤) :
    ∃ h : ℂ → ℂ, AnalyticOnNhd ℂ h U ∧
      (∀ z : ℂ, g z = (z - w) ^ analyticOrderNatAt g w * h z) ∧ h w ≠ (0 : ℂ) := by
```
**Proof.** Let n = `analyticOrderNatAt g w`. Because the order is finite, Mathlib's `AnalyticAt.analyticOrderAt_ne_top` gives an h₀ that is analytic at w, has h₀(w) ≠ 0, and satisfies g = (z − w)ⁿ·h₀ eventually near w.

Define h(z) = h₀(w) if z = w, and g(z)/(z − w)ⁿ otherwise. Then:
- **h is analytic at w.** Near w, h agrees with h₀: at y = w by definition, and for y ≠ w because g(y) = (y − w)ⁿh₀(y) with (y − w)ⁿ ≠ 0.
- **h is analytic at z ≠ w in U.** It is the quotient of two analytic functions with nonzero denominator, and it agrees with g/(z − w)ⁿ on the open set {y ≠ w}.
- **The identity g = (z − w)ⁿ·h holds for every z ∈ ℂ, not only on U.** At z = w, the eventual equality evaluated at w gives g(w) = 0ⁿ·h₀(w). Elsewhere it is field arithmetic.
- **h(w) = h₀(w) ≠ 0.**

Edge case: n = 0 is allowed. Then h = g off w, and g(w) = h₀(w) ≠ 0.

This closes the "remaining dependency" from chapter 07 §A step 2. It depends only on Mathlib.

---
## B. ζ growth bounds

**Correction to chapter 07.** Chapter 07 listed the ζ growth inputs of ZetaLocal as `NormSubOneMulRiemannZetaLe.lean` and `TsumOneDivRpowLe.lean`. That was wrong on the first file. ZetaLocal imports `TsumOneDivRpowLe`, `NormOneSubConjMul` and `DifferentiableAtFractInt`, and its growth bound is the local lemma `ZetaLocal.norm_zeta₁_le`, which rests on `ZetaHalfPlane.norm_zeta_sub_le`. `ZetaLeft.norm_sub_one_mul_riemannZeta_le` (NormSubOneMulRiemannZetaLe.lean) is a different bound, used elsewhere (B.3).

### B.1 `GlobalTheory.ZetaHalfPlane.norm_zeta_sub_le` (DifferentiableAtFractInt.lean:121)
```lean
theorem norm_zeta_sub_le :
    ∀ s : ℂ, 0 < s.re → s ≠ 1 → ‖riemannZeta s - s / (s - 1)‖ ≤ ‖s‖ / s.re := by
```
Define fractInt(s) = ∫_{t>1} {t}·t^{−(s+1)} dt.
1. *For Re s > 1:* ζ(s) = s/(s − 1) − s·fractInt(s). This is `ZetaFractionalIntegral.zeta_eq_sub_integral_fract`. It comes from Mathlib's `LSeries_eq_mul_integral_of_nonneg` (ζ(s) = s∫⌊t⌋t^{−s−1}) and the split ⌊t⌋ = t − {t}, using ∫_{t>1} t^{−s} = 1/(s − 1).
2. *Continuation (`zeta_eq`):* fractInt is holomorphic on Re s > 0. It is a Mellin transform of a bounded function, and {t}t^{−σ−1} is integrable (`differentiableAt_fractInt`). Both ζ₀ = ζ − 1/(s − 1) and 1 − s·fractInt are analytic on the connected half-plane Re s > 0 and agree near 2, so they agree everywhere there (`eqOn_of_preconnected_of_eventuallyEq`). Hence ζ(s) = s/(s − 1) − s·fractInt(s) for Re s > 0, s ≠ 1.
3. *Bound:* |fractInt(s)| ≤ ∫_{t>1} t^{−σ−1} = 1/σ (`norm_fractInt_le`). So |ζ − s/(s − 1)| = |s|·|fractInt| ≤ |s|/σ.

### B.2 `ZetaLocal.norm_zeta₁_le` and `le_norm_zeta₁` (LogDerivRiemannZetaLocalZeroSum.lean:43, :74)
```lean
lemma norm_zeta₁_le (t : ℝ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖riemannZeta₁ (3/2 + t * I + z)‖ ≤ 5 * (|t| + 2) ^ 2 := by
lemma le_norm_zeta₁ (t : ℝ) : 1 / 6 ≤ ‖riemannZeta₁ (3/2 + t * I)‖ := by
```
Notation: T = |t| + 2, w = 3/2 + it + z, and riemannZeta₁(w) = (w − 1)ζ(w), with value 1 at w = 1.
- **Case w = 1:** the norm is 1 ≤ 5T².
- **Otherwise:**
  - Re w ≥ 1/2, |w − 1| ≤ T and |w| ≤ 2T.
  - Write ζ₁(w) = (w − 1)(ζ(w) − w/(w − 1)) + w.
  - By B.1, |ζ(w) − w/(w − 1)| ≤ |w|/Re w ≤ 2|w| ≤ 4T.
  - So |ζ₁(w)| ≤ T·4T + 2T ≤ 5T², since T ≥ 2.
- **Lower bound at the centre c = 3/2 + it:**
  - |ζ(c)| ≥ (Re c − 1)/Re c = 1/3. This is `LLower.norm_LFunction_ge` at q = 1, using `LFunction_modOne_eq`.
  - |c − 1| ≥ Re(c − 1) = 1/2.
  - So |ζ₁(c)| ≥ 1/6.
- **Use in `ZetaLocal.logDeriv_riemannZeta_local`:** M/|f(0)| ≤ 5T²·6 ≤ T⁷, since 5 ≤ T⁵/6 for T ≥ 2. Then 1 + log(T⁷) ≤ 9 log T, since log 2 ≥ 1/2. This is where the constant 9C comes from (chapter 07 §A).

### B.3 `GlobalTheory.ZetaLeft.norm_sub_one_mul_riemannZeta_le` (NormSubOneMulRiemannZetaLe.lean)
```lean
theorem norm_sub_one_mul_riemannZeta_le :
    ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ, -(7/4 : ℝ) ≤ s.re → s ≠ 1 →
      ‖(s - 1) * riemannZeta s‖ ≤ C * (‖s‖ + 2) ^ 5 := by
```
This is Euler–Maclaurin to third order. Set w = 1 − s and emT(x, s) = x^w − w·x^{w−1}/2 + w(w − 1)x^{w−2}/12. The per-unit error is emE(x, s) = emT(x + 1) − emT(x) − w·x^{−s}.
1. *`norm_emE_le` (a ≥ 1, Re s ≥ −15/8):* |emE(a, s)| ≤ (|s| + 2)⁴·a^{−9/8}.
   - The source writes emE(a, s) as G(1) − G(0) for an explicit G. G is built from the Bernoulli-type polynomials z − 1/2, (z² − z + 1/6)/2 and (z³ − 3z²/2 + z/2)/6.
   - G′ = −B₃(t)/6 · w(w − 1)(w − 2)(w − 3)(a + t)^{w−4}.
   - Bound G′ on [0, 1):
     - |B₃(t)/6| ≤ 1;
     - each |w − k| ≤ |s| + 2 for k ∈ {0, 1, 2, 3}, because |c − s| ≤ |s| + 2 when |c| ≤ 2;
     - Re(w − 4) = −3 − Re s ≤ −9/8, so |(a + t)^{w−4}| ≤ a^{−9/8}.
   - Then apply the mean-value inequality (`norm_image_sub_le_of_norm_deriv_le_segment_01'`).
2. *For Re s > 1:* (s − 1)ζ(s) = emT(1, s) + Σ_{n≥1} emE(n, s). This follows by telescoping (`hpart`), from emT(N + 1) → 0, and from the Dirichlet series.
3. *Continuation to Re s > −15/8, s ≠ 1:* the right side is holomorphic there. Use Weierstrass M-test with the summable majorant (|s| + 3)⁴(n + 1)^{−9/8}, which is `differentiableOn_tsum_emE`. The left side is `LFunctionTrivChar₁ 1`, which is entire. Both agree near 2, so the identity theorem extends the equation.
4. *Bound:* with R = |s| + 2 ≥ 1 and K = Σ(n + 1)^{−9/8}, |emT(1, s)| ≤ 1 + R/2 + R²/12. The total is ≤ (3 + K)R⁵. The hypothesis Re s ≥ −7/4 sits inside −15/8.

Its consumers are IteratedDerivLogDerivDirichletLViaNearbyZeros.lean:121 and ImportsMore.lean:92. **It is not an input to (LZ) or ZetaLocal.**

---
## C. `GlobalTheory.LGrowth.norm_LFunction_le` (DifferentiableAtMellinSummatory.lean:128)
```lean
theorem norm_LFunction_le : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 →
    ∀ s : ℂ, 0 < s.re → ‖LFunction χ s‖ ≤ q * ‖s‖ / s.re := by
```
1. *`norm_partialSum_le`:* |Σ_{k=1}^{n} χ(k)| ≤ q for χ ≠ 1. A full period sums to 0 (`χ.sum_eq_zero_of_ne_one`), so the sum reduces to fewer than q terms, each of modulus ≤ 1.
2. *Mellin representation (`LFunction_eq_mul_mellin`):* L(χ, s) = s·∫_{t>1} A(t)t^{−s−1} dt, where A(t) = Σ_{k≤t} χ(k).
   - For Re s > 1 this is Mathlib's `LSeries_eq_mul_integral` (Abel summation). Its O-hypothesis is |A(n)| ≤ q.
   - The right side is holomorphic on Re s > 0 (`differentiableAt_mellin_summatory`, using |A| ≤ q).
   - L(χ, ·) is entire for χ ≠ 1, so the identity theorem on the half-plane extends the equation.
3. *`norm_mellin_summatory_le`:* |∫_{t>1} A(t)t^{−s−1}| ≤ q∫_{t>1} t^{−σ−1} = q/σ.

Hence |L(χ, s)| ≤ |s|·q/σ.

---
## D. `GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le` (LFunctionEqTsumOfOneLt.lean:226)
```lean
theorem norm_LFunction_sub_sum_le :
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 → ∀ s : ℂ, 0 < s.re → ∀ N : ℕ, 1 ≤ N →
      ‖LFunction χ s - ∑ n ∈ Finset.Icc 1 N, χ (n : ZMod q) * (n : ℂ) ^ (-s)‖
        ≤ 2 * q * (1 + ‖s‖ / s.re) * (N : ℝ) ^ (-s.re) := by
```
Write A_n = Σ_{k≤n} χ(k), so |A_n| ≤ q by `norm_sum_range_le`, the same argument as C.1. Let term_n(s) = A_{n+1}·((n + 1)^{−s} − (n + 2)^{−s}).
1. *`norm_cpow_sub_le`:* for 1 ≤ a ≤ b and 0 < δ ≤ Re s, |a^{−s} − b^{−s}| ≤ (|s|/δ)(a^{−δ} − b^{−δ}). Write the difference as s∫_a^b t^{−s−1} dt, and use t^{−σ−1} ≤ t^{−δ−1}. The source does this via derivative comparison on [a, b].
2. *`norm_term_le`:* |term_n| ≤ q(R/δ)((n + 1)^{−δ} − (n + 2)^{−δ}) when |s| ≤ R. The right side telescopes (`hasSum_telescope`): Σ_{n≥N} = (N + 1)^{−δ}.
3. *`abel`:* Σ_{n≤N} χ(n)n^{−s} = Σ_{n<N} term_n + A_N·(N + 1)^{−s}. This is finite summation by parts, proved by induction.
4. *`LFunction_eq_tsum`:* L(χ, s) = Σ_n term_n(s) for Re s > 0. For Re s > 1 it comes from the L-series. Holomorphy of the series on Re s > 0 follows from the M-test with the step-2 majorant on {Re > Re z/2} ∩ ball. Then apply the identity theorem.
5. *Assembly with δ = σ, R = |s|:*
   - L − Σ_{n≤N} = Σ_{n≥N} term_n − A_N(N + 1)^{−s}.
   - The first piece is ≤ q(|s|/σ)(N + 1)^{−σ}, and the boundary piece is ≤ q(N + 1)^{−σ} (`norm_boundary_le`).
   - Total: ≤ q(1 + |s|/σ)(N + 1)^{−σ} ≤ q(1 + |s|/σ)N^{−σ}.

**Finding.** The source proves the bound **without the factor 2**, at the step `_ = q * (1 + ‖s‖ / s.re) * ((N + 1 : ℕ) : ℝ) ^ (-s.re)`. It then weakens it to 2q(…) in the last `calc` step. This is the second weakened export noticed in this lane, after 07 §D.

---
## E. Third-level users of η

This extends chapter 07 §E. Every edge was found by rg over the whole pinned `src/`. Unqualified uses were searched inside the owning files.
- **`Lin.LogFree.principal_height`** → `Lin.LogFree.count_param` (LogFreeZeroDensityDirichletOneModulus.lean:249) → `Lin.LogFree.zero_density` (:323) → re-exported as `GlobalTheory.T.logFree_zeroDensity_dirichlet_one_modulus`.
- **`ExplicitFormulaRight.recip_bound`** → `ExplicitFormulaRight.explicit_formula_right` (ExplicitFormulaDirichletZerosRightHalf.lean:206) → re-exported as `GlobalTheory.T.explicit_formula_dirichlet_zeros_right_half`.
- **`LandauPageRegion.main`**, which proves `ZFRDirichlet`, → `ZerosNearOne.density_and_regions` (DensityAndRegions.lean:15, via `ZeroFreeHalf.main`) → used at ImportsFurther.lean:9.
- **`Lin.PsiRel.psiAP_relative`** → `GlobalTheory.T.chebyshevPsiProgression_relative_error` → used in `Lin.primesRel_holds` (PrimesInProgressionsRelativeError.lean:24). So η reaches `primesRel_holds` by **two routes**: through `exceptionalDirichletZero_unique_zeroFreeRegion` and through `chebyshevPsiProgression_relative_error`.
- **`Lin.primesRel_holds`** has three consumers:
  - `EX.smallPrimeOne_of_primesRel` in ObjCTrue.lean:33 (`recS`, the main path);
  - `GlobalTheory.T.primesInProgressions_relativeError`, which in turn feeds `UpperTheory.Lit.linnik : GlobalTheory.Published.Linnik` (ThetaCorrespondence/Linnik.lean:142, discharging the Published Linnik input);
  - `UpperTheory.T3.smallOne` (ShortNorms/Primes.lean:7).

**What this means.** The loss of effectivity is unchanged: every downstream constant is existential, so there is no logical gap. η now reaches the `Published.Linnik` discharge and `T3.smallOne` as well as the main path. Users at the fourth level and beyond, for example consumers of the re-exported `T.*` statements, were not enumerated.

## Remaining dependencies (exact names)
- All Mathlib names cited in A–D. Mathlib itself was compiled into the oleans used, so these are now checked by Lean rather than assumed.
- Nothing inside the 29-module closure remains unproved. The reconstruction gap is now **only expository**, for lemmas not yet written up in prose:
  - `RealZeroNearOne.exists_bound` and `TwoRealCharacters.neg_sum_logDeriv_nonneg` (chapter 05 cites these);
  - `logDerivativeThreeFourOne.three_four_one` (chapter 06);
  - `ZeroFreeComplex.LFunction_conj_eq_zero`.

## RESUME HERE
1. Optionally extend the build to the closure of `ExceptionalPair.main` / `ExceptionalDirichletZeroUniqueZeroFreeRegion.lean`. Measure the closure size first with `clos.py`, and run it only if it is small.
2. Write up `RealZeroNearOne.exists_bound`, `TwoRealCharacters.neg_sum_logDeriv_nonneg` and `three_four_one` in prose.
3. Fourth-level η users.

## HANDOFF TO
- **lean_validation:** `build_closure.py` and `run_companions.sh` are a cheap, reusable route that typechecks any upstream closure of up to about 100 modules against the shared Mathlib oleans with no new cache. Feel free to reuse them for other lanes' companions.
- **literature_provenance:** two weakened exports were found, 07 §D (1/(36q) exported as q^{−3/2}) and 08 §D (factor 2).
