# Chapter 07: the local zero-sum lemma, the principal log-derivative bound, L(1,χ) and L′ bounds, and where η enters

Lane: native_family_existence. Run 7, 2026-11-24 (GMT).
Pin: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`.
All paths are relative to `src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/` unless stated otherwise.

**Status, stated honestly.** This chapter is a human-readable reconstruction of proofs that already exist in the pinned Lean source. It is not a new proof. Nothing here was compiled against Mathlib, and no gate is closed. What was actually run:
- `verify_run7_sources.py` (log in `verify_run.log`): 17 files, 53 verbatim tokens, 0 failures. Each blob matches the pin, the pin and checkout trees are identical (apart from `src/Challenge.lean`), and the scan finds no top-level `axiom`.
- `constants_check.py` (log in `constants_run.log`): 12 exact-arithmetic checks, all ok. Two of them are float checks with a stated margin.
- `Run7ArithSkeleton.lean` (log in `lean_run.log`): core Lean v4.33.1 with no Mathlib, exit 0. It covers integer arithmetic only.
- `RH_Run7Companion.lean` was **NOT EXECUTED**.

Shared notation from chapters 05 and 06: (NV), (PL), (LZ) = `GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum` / `LLocal.logDeriv_LFunction_local`, the zero-sum bound mechanism (05 §A.4), and the 3-4-1 kernel (06). This chapter cites them rather than re-deriving them.

---
## A. `GlobalTheory.LogDerivZeros.main` (NormOneSubConjMul.lean:125)

```lean
theorem main : ∀ r R : ℝ, 0 < r → r < R → R < 1 → ∃ C : ℝ, 0 < C ∧ ∀ (f : ℂ → ℂ) (M : ℝ), AnalyticOnNhd ℂ f (Metric.closedBall 0 1) → f 0 ≠ 0 → (∀ z ∈ Metric.closedBall (0 : ℂ) 1, ‖f z‖ ≤ M) → ({w : ℂ | ‖w‖ ≤ R ∧ f w = 0}.Finite ∧ (∑ᶠ w ∈ {w : ℂ | ‖w‖ ≤ R ∧ f w = 0}, (analyticOrderNatAt f w : ℝ)) ≤ C * (1 + Real.log (M / ‖f 0‖))) ∧ ∀ z : ℂ, ‖z‖ ≤ r → f z ≠ 0 → ‖deriv f z / f z - ∑ᶠ w ∈ {w : ℂ | ‖w‖ ≤ R ∧ f w = 0}, (analyticOrderNatAt f w : ℂ) / (z - w)‖ ≤ C * (1 + Real.log (M / ‖f 0‖)) := by
```

**What the statement says.** Fix radii 0 < r < R < 1. Take any f that is analytic on a neighbourhood of the closed unit disc, has f(0) ≠ 0, and satisfies |f| ≤ M on that disc. Then:
1. f has finitely many zeros in |w| ≤ R.
2. The number of those zeros, counted with multiplicity, is at most C(1 + log(M/|f(0)|)).
3. For |z| ≤ r with f(z) ≠ 0, f′/f(z) differs from Σ m_w/(z − w) by at most the same quantity.

C depends only on r and R, and is uniform in f and M. Note that M ≥ |f(0)| > 0 is forced, because 0 is in the disc, so the log term is ≥ 0.

**Constant.** Write c1 = −log R > 0, c2 = −log(1 − R) > 0 and A = 8R/(R − r)². The source then uses `refine ⟨c1⁻¹ + A * (1 + c1⁻¹ * c2), by positivity, ?_⟩`.

**Proof (follows the source order; L := log(M/|f(0)|) ≥ 0).**
1. *Finiteness.* f is analytic and not identically zero near 0, because f(0) ≠ 0. The closed disc is connected and f is analytic on a neighbourhood of it, so the zeros are isolated (codiscrete), and a discrete subset of the compact disc |w| ≤ R is finite. Call this zero set Z, with multiplicities m_w = `analyticOrderNatAt f w` (finite, since f is not locally zero) and N := Σ_{w∈Z} m_w.
2. *Factorisation* (`exists_factor`). f = P·g on the closed unit disc, where P(z) = ∏_{w∈Z}(z − w)^{m_w} and g is analytic there with g(w) ≠ 0 for every w ∈ Z. The proof inducts over Z. Each step peels one zero with `exists_factor_one`, which wraps `GlobalTheory.FactorOrderExistence.exists_factor_order` (ExistsFactorOrder.lean:7, a remaining dependency) and leaves the order at the other points unchanged.
3. *|f(0)| ≤ R^N |g(0)|*, because |0 − w| = |w| ≤ R for w ∈ Z.
4. *|g(0)| ≤ M.* Let h(z) = ∏(1 − w̄z)^{m_w}·g(z). On |z| = 1 we have |1 − w̄z| = |z − w| (`norm_one_sub_conj_mul`: |1 − w̄z| = |z̄ − w̄|·|z| = |z − w|). So |h| = |f| ≤ M on the circle, and the maximum modulus principle (`norm_le_of_sphere`) gives |h(0)| = |g(0)| ≤ M.
5. *Zero count.* Steps 3 and 4 give |f(0)| ≤ R^N·M, so N·c1 ≤ L, i.e. N ≤ c1⁻¹L ≤ C(1 + L). This is the first conclusion.
6. *|g| ≤ M/(1 − R)^N on the closed disc.* On |z| = 1, |P(z)| ≥ (1 − R)^N, so the bound holds on the circle, and maximum modulus extends it to the disc.
7. *g ≠ 0 on the open ball of radius R.* A zero of g there would be a zero of f outside Z, or a point of Z where g ≠ 0. Both are impossible.
8. *|g| ≤ |g(0)|·e^K on the ball, with K := 1 + L + N·c2 > 0.* Steps 3 and 6 give M/(1 − R)^N ≤ |g(0)|·(M/|f(0)|)·(1 − R)^{−N}, and taking logs gives K. The "1 +" is slack that keeps K > 0.
9. *`norm_logDeriv_le`:* for |z| ≤ r, |g′/g(z)| ≤ (8R/(R − r)²)·K. Because g ≠ 0 on the simply connected ball, there is a holomorphic log h there with h(0) = 0 and e^h = g/g(0), so Re h = log|g/g(0)| ≤ K. Borel–Carathéodory (`Complex.borelCaratheodory_zero`) gives |h(u)| ≤ 2K|u|/(R − |u|). The Cauchy estimate on the circle of radius ρ = (R − r)/2 about z needs |u| ≤ r + ρ, so R − |u| ≥ ρ and |h| ≤ 2KR/ρ there. Hence |h′(z)| ≤ (2KR/ρ)/ρ = 8RK/(R − r)². Finally h′ = g′/g.
10. *Assembly.* f′/f = Σ_{w∈Z} m_w/(z − w) + g′/g wherever f(z) ≠ 0 (log-derivative of a product). Step 5 gives K ≤ 1 + L + c1⁻¹c2·L ≤ (1 + c1⁻¹c2)(1 + L), so the remainder is ≤ A(1 + c1⁻¹c2)(1 + L) ≤ C(1 + L).

`constants_check.py` re-checks the arithmetic of steps 5, 8 and 9 exactly. The core-Lean `ldz_K` checks the K inequality in scaled integer form.

**Instantiations (cited, not re-derived).**
- `GlobalTheory.LLocal.logDeriv_LFunction_local` (LogDerivDirichletLFunctionLocalZeroSum.lean:17) is (LZ). It applies `main (2/3) (5/6)` to f(z) = L(χ, c + z) with c = 3/2 + it, and returns constant 6C.
  - Lower bound at 0: `GlobalTheory.LLower.norm_LFunction_ge` (TsumOneDivRpowLe.lean, `(s.re - 1)/s.re ≤ ‖LFunction χ s‖` for 1 < Re s) gives |f(0)| ≥ 1/3.
  - Upper bound: `GlobalTheory.LGrowth.norm_LFunction_le` (DifferentiableAtMellinSummatory.lean, `‖LFunction χ s‖ ≤ q‖s‖/Re s` for Re s > 0, χ ≠ 1). On the unit disc, Re ≥ 1/2 and |c + z| ≤ |t| + 5/2, so M = q(2|t| + 5).
  - Then M/|f(0)| ≤ 8X with X = q(|t| + 2) ≥ 2, and 1 + log(8X) ≤ 6 log X.
- `GlobalTheory.ZetaLocal.logDeriv_riemannZeta_local` (LogDerivRiemannZetaLocalZeroSum.lean:87) is the ζ analogue. It uses f = `riemannZeta₁(c + z)` (removing the pole), M = 5(|t| + 2)² and constant 9C. Its growth inputs (`NormSubOneMulRiemannZetaLe.lean`, `TsumOneDivRpowLe.lean`) are listed as remaining dependencies. They were token-located only, not reconstructed.

---
## B. `GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le` (NegReLogDerivPrincipalLFunctionLe.lean:98)

```lean
theorem neg_re_logDeriv_le : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (σ t : ℝ), 1 < σ → σ ≤ 2 → -(deriv (LFunction (1 : DirichletCharacter ℂ q)) (σ + t * I) / LFunction (1 : DirichletCharacter ℂ q) (σ + t * I)).re ≤ (1 / ((σ : ℂ) + t * I - 1)).re + C * Real.log (q * (|t| + 2)) := by
```

This is (PL), used in chapters 05 and 06. Its constant is C + 1, where C comes from `GlobalTheory.T.logDeriv_riemannZeta_local_zero_sum` (= ZetaLocal, §A).

**Proof.** Let s = σ + it with 1 < σ ≤ 2.
1. Near s, `LFunctionTrivChar_eq_mul_riemannZeta` gives L(1_q, z) = ∏_{p|q}(1 − p^{−z})·ζ(z). Both sides are nonzero near s, since Re > 1, so `logDeriv_mul` and `logDeriv_prod` give L′/L = Σ_{p|q} logDeriv(1 − p^{−z}) + ζ′/ζ.
2. For Re z ≥ 1: |p^{−z}| ≤ 1/p ≤ 1/2, so |1 − p^{−z}| ≥ 1/2. The factor's log-derivative is log p·p^{−z}/(1 − p^{−z}), with modulus ≤ (log p/2)/(1/2) = log p.
3. Σ_{p|q} log p ≤ log q, because ∏_{p|q} p divides q (`Nat.prod_primeFactors_dvd`). Hence |L′/L − ζ′/ζ| ≤ log q.
4. ZetaLocal with the centre 3/2 + it gives ‖s − (3/2 + it)‖ = |σ − 3/2| ≤ 1/2 ≤ 2/3. So ζ′/ζ(s) = −1/(s − 1) + S + E, where S = Σ m_w/(s − w) over zeros w in the 5/6-disc and |E| ≤ C log(|t| + 2). Every zero has Re w ≤ 1 < σ. The source (l.123) uses `riemannZeta_ne_zero_of_one_lt_re`: a zero with Re w > 1 is impossible. So Re 1/(s − w) > 0 and Re S ≥ 0.
5. So −Re L′/L ≤ Re 1/(s − 1) − Re S + |E| + log q ≤ Re 1/(s − 1) + C log(|t| + 2) + log q ≤ Re 1/(s − 1) + (C + 1)·log(q(|t| + 2)). Both logs are ≥ 0 because q ≥ 1 and |t| + 2 ≥ 2.

Edge cases: q = 1 gives an empty product and log 1 = 0. The hypothesis σ ≤ 2 is only used to stay in the 2/3-disc.

---
## C. `GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le` (ExistsNormDerivLFunctionLe.lean:61)

```lean
theorem exists_norm_deriv_LFunction_le :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 → ∀ σ : ℝ,
      1 - 1 / Real.log (3 * q) ≤ σ → σ ≤ 1 →
        ‖deriv (LFunction χ) σ‖ ≤ C * Real.log (3 * q) ^ 2 := by
```

Auxiliary (line 23):
```lean
theorem norm_LFunction_le {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1) {s : ℂ}
    (h1 : 1 - 2 / Real.log (3 * q) ≤ s.re) (h2 : 1 / 20 ≤ s.re) (h3 : ‖s‖ ≤ 2) :
    ‖LFunction χ s‖ ≤ 84 * Real.exp 2 * Real.log (3 * q) := by
```

**Proof of `norm_LFunction_le`.** Let L = log 3q and x = Re s.
- `rpow_neg_le`: for 1 ≤ n ≤ q, n^{−x} ≤ n^{−1}·n^{2/L} ≤ e²/n, since log n ≤ L.
- The partial sum satisfies |Σ_{n≤q} χ(n)n^{−s}| ≤ e²·H_q ≤ e²(1 + log q) (`harmonic_le_one_add_log`).
- The tail uses `GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le` (LFunctionEqTsumOfOneLt.lean:226, a remaining dependency): ‖L − Σ_{n≤N}‖ ≤ 2q(1 + ‖s‖/x)·N^{−x}. Take N = q. Then ‖s‖/x ≤ 2/(1/20) = 40 and q^{−x} ≤ e²/q, so the tail is ≤ 82e².
- Total: ≤ e²(83 + log q) ≤ 84e²L, using log q ≤ L and L ≥ 1.

**Proof of the main statement; C = 336e².**
- q ≥ 2, because at level 1 the only character is 1 (`level_one`). So L = log 3q ≥ log 6 > log 4 ≥ 1.38; the source proves `1.38 ≤ Real.log (3 * q)`.
- Use the Cauchy estimate on the circle of radius ρ = 1/(4L) about the real point σ ∈ [1 − 1/L, 1].
- On that circle, Re z ≥ 1 − 1/L − 1/(4L) = 1 − 5/(4L). This is ≥ 1 − 2/L, and ≥ 1/20 because 5/(4·1.38) < 19/20. Also |z| ≤ 1 + 1/(4L) ≤ 2.
- So `norm_LFunction_le` applies on the whole circle, and |L′(σ)| ≤ 84e²L/ρ = 336e²L².
- L(χ, ·) is entire for χ ≠ 1 (Mathlib `differentiable_LFunction`), so the Cauchy estimate is legitimate.

---
## D. `GlobalTheory.LOneLower.inv_le_norm_LFunction_one` (ExistsLeNormLFunctionOne.lean:339)

```lean
theorem inv_le_norm_LFunction_one {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (h2 : χ ^ 2 = 1) : 1 / (36 * (q : ℝ)) ≤ ‖LFunction χ 1‖ := by
```

The exported corollary is `exists_le_norm_LFunction_one` (l.354), with c = 1/36. It states `c / q^(3/2) ≤ ‖LFunction χ 1‖` and is obtained by weakening 1/(36q) ≥ (1/36)/q^{3/2}. **So the source proves a stronger bound than the one it exports.** This is an elementary, effective Lambert-series argument, with no Siegel or class-number input.

**Ingredients.** r := `zetaMul χ` = 1 ∗ χ (Mathlib, Dirichlet convolution: r(n) = Σ_{d|n} χ(d)).
- (i) For real χ (χ² = 1), r(n) ≥ 0 (`zetaMul_nonneg`, Mathlib) and r(m²) ≥ 1 for m ≥ 1 (`one_le_zetaMul_sq`). This holds by multiplicativity, since on p^{2k} the value is 1 + χ(p) + … + χ(p)^{2k} ≥ 1.
- (ii) `lambert`: for |t| < 1, Σ_{n≥1} r(n)tⁿ = Σ_{d≥1} χ(d)·t^d/(1 − t^d).
- (iii) `char_sum_bound`: for χ ≠ 1, |Σ_{n=1}^{N} χ(n)| ≤ q, because a full period sums to 0.
- (iv) `abel_bound`: if the partial sums of a satisfy |Σ_{n<N} a_n| ≤ M, and b is antitone and ≥ 0, then |Σ a_n b_n| ≤ M·b_0.
- (v) wt(x) := 1/x − 1/(eˣ − 1). It satisfies 0 ≤ wt ≤ 1 on x > 0 (`wt_nonneg`, `wt_le_one`) and is antitone on (0, ∞) (`wt_antitoneOn`).

**Proof.** Fix α > 0 and set S(α) := Σ_{d≥1} χ(d)/(e^{dα} − 1). This converges absolutely (`summable_inv_exp`: 1/(e^{dα} − 1) ≤ 2α^{−2}d^{−2}).
1. *`lambert_lower`, for M ≥ 1 and α = 1/M²: |S(α)| ≥ M/3.* Take t = e^{−α} ∈ (0, 1). Then t^d/(1 − t^d) = 1/(e^{dα} − 1), so by (ii), S(α) = Σ r(n)tⁿ, a series of nonnegative reals by (i). Keep only n = (m + 1)² with m < M. There r(n) ≥ 1 and tⁿ ≥ t^{M²} = e^{−1} ≥ 1/3, so S ≥ M·(1/3). The map m ↦ (m + 1)² is injective, and |S| ≥ Re S = S.
2. *`compare_right`, for ε > 0: |L(χ, 1 + ε)/α − Σ_d χ(d)d^{−ε}/(e^{dα} − 1)| ≤ q.* For Re > 1, L is the absolutely convergent L-series, and the difference is termwise χ(d)·b_d with b_d = d^{−ε}·wt(dα), since d^{−1−ε}/α = d^{−ε}·(1/(dα)). By (v) and the fact that d^{−ε} is decreasing, b is antitone, b ≥ 0 and b_1 ≤ 1. Then (iii) and (iv) bound every partial sum by q·b_1 ≤ q, and the limit inherits the bound.
3. *`compare_one`: let ε → 0⁺.* L(χ, 1 + ε) → L(χ, 1) because L is entire for χ ≠ 1. The sum converges to S(α) by dominated convergence, with dominator 1/(e^{dα} − 1) because |χ(d)d^{−ε}| ≤ 1. So |L(χ, 1)/α − S(α)| ≤ q.
4. *Conclusion with M = 6q, α = 1/(36q²).* |L(χ, 1)|·36q² ≥ |S| − q ≥ 2q − q = q, so |L(χ, 1)| ≥ 1/(36q).

Edge cases: q ≥ 1 by `NeZero`. For q = 1 the hypothesis χ ≠ 1 is vacuous-false, so the statement holds trivially, but the proof does not rely on that.

---
## E. Where the non-explicit compactness constant η enters downstream

**Source of η.** In ZeroFreePrincipal.lean, the private lemma `exists_riemannZeta_ne_zero_near_one_of_abs_im_le_one` obtains δ via `obtain ⟨δ, hδ, hsub⟩ := hK.exists_thickening_subset_open hU hKU`. Here K is the compact segment {1 + iy : |y| ≤ 1} and U is the open set where ζ ≠ 0 (or s = 1). This step is a pure existence statement and gives no numerical value. The resulting η feeds `GlobalTheory.ZeroFreePrincipal.zero_free` (l.281) through `refine ⟨min (min c1 (η / 2)) (1 / 2), …⟩` (chapter 06, T-1b).

**Direct consumers of `ZeroFreePrincipal.zero_free` in the whole pinned `src/`** (rg over every `*.lean` file found exactly these 4, plus the definition):

| consumer (file:line) | declaration | how η propagates |
|---|---|---|
| ExceptionalDirichletZeroUniqueZeroFreeRegion.lean:49 | `GlobalTheory.ExceptionalPair.main` (T-1) | as `cp`, in both c₀ = min(1/8, cu/2, cp/2) and c = min(c₁, cz, cp, cs/2) (chapter 04) |
| ExistsDirichletLFunctionZeroGapNearOne.lean:75 | `GlobalTheory.ZeroGapNearOne.exists_gap` (T-1d) | as `e`, in c = min(1, a/(4C), d, e) (chapter 05) |
| InRegionMono.lean:57 | `GlobalTheory.LandauPageRegion.main : Formalism.ZeroFreeDirichlet.ZFRDirichlet` | as `c₃` |
| LogFreeZeroDensityDirichletOneModulus.lean:17 | `GlobalTheory.Lin.LogFree.principal_height` | as `c` (this declaration's own existential is also named η) |

**Second level.**
- `ZeroGapNearOne.exists_gap` is re-exported as `GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one`. That has two consumers:
  - `ExceptionalPair.main`, via `cs`;
  - `GlobalTheory.ExplicitFormulaRight.recip_bound` (ExplicitFormulaDirichletZerosRightHalf.lean:33).
- `ExceptionalPair.main` is re-exported as `GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion`. That has two consumers:
  - `GlobalTheory.Lin.primesRel_holds` (PrimesInProgressionsRelativeError.lean:22). This is on the main path: → `smallPrimeOne_of_primesRel` → `recS` (ObjCTrue.lean:33), per chapter 03;
  - `GlobalTheory.Lin.PsiRel.psiAP_relative` (ChebyshevPsiProgressionRelativeError.lean:294).
- `Formalism.ZeroFreeDirichlet.ZFRDirichlet` is referenced from several `Formalism/` files, e.g. LandauZeroFreeBounds and GL3MeanSquares. Those third-level users were **not** enumerated this run.

**Not affected by η:**
- T-1c `zero_free_region` (chapter 06), which uses only (PL) and the zero-sum mechanism.
- T-1a `RealZeroNearOne.main` and T-1e (chapters 05 and 06).
- All four results of this chapter. None of their files cite `ZeroFreePrincipal`; the verifier confirms their constants as tokens.

**What this means.** Each affected constant is a `min` with an η-dependent term, so it is positive but **not explicitly computable from the source**. Every downstream statement is existential in its constants (∃ c > 0), so this is a loss of effectivity, not a logical gap. A route to explicitness, which was not attempted here: replace the compactness step with an explicit zero-free neighbourhood of the segment 1 + iy, |y| ≤ 1, for example a numerical bound on ζ near Re s = 1.

---
## Remaining dependencies (exact names, not reconstructed here)
- `GlobalTheory.FactorOrderExistence.exists_factor_order` (ExistsFactorOrder.lean:7)
- `Complex.borelCaratheodory_zero` (rg finds no `theorem borelCaratheodory_zero` in the pinned `src/`, so it presumably comes from Mathlib; not re-checked)
- `GlobalTheory.LGrowth.norm_LFunction_le` (DifferentiableAtMellinSummatory.lean), `GlobalTheory.LLower.norm_LFunction_ge` (TsumOneDivRpowLe.lean)
- The ζ growth inputs of `ZetaLocal.logDeriv_riemannZeta_local`: NormSubOneMulRiemannZetaLe.lean, TsumOneDivRpowLe.lean
- `GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le` (LFunctionEqTsumOfOneLt.lean:226)
- Mathlib (the names are cited as they appear in the source; their Mathlib versions were not re-checked this run): `LFunctionTrivChar_eq_mul_riemannZeta`, `differentiable_LFunction`, `DirichletCharacter.zetaMul` / `zetaMul_nonneg`, `riemannZeta_ne_zero_of_one_lt_re`, `harmonic_le_one_add_log`, `IsCompact.exists_thickening_subset_open`

## RESUME HERE
1. Reconstruct `FactorOrderExistence.exists_factor_order` and the ζ growth bound (NormSubOneMulRiemannZetaLe.lean). That closes the analytic base under (LZ) and ZetaLocal.
2. Reconstruct `LGrowth.norm_LFunction_le` and `DirichletTail.norm_LFunction_sub_sum_le`, which are partial-summation bounds.
3. Enumerate the third-level η users through `ZFRDirichlet` in `Formalism/`.
4. Optional: make η explicit (§E).

## HANDOFF TO
- **lean_validation:** run `RH_Run7Companion.lean` against the pinned Mathlib and record the outcome. It is NOT EXECUTED here.
- **landau_criterion / theta:** §E lists every place where η makes a constant non-explicit, in case those lanes need effective constants.
- **literature_provenance:** §D (Lambert-series lower bound 1/(36q)) and §A (Jensen + Borel–Carathéodory local zero sum) are classical. Attribution is welcome.
