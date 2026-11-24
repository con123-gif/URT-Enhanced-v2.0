# Run 5: T-1a (`GlobalTheory.RealZeroNearOne.main`, Landau–Page) and T-1d (`GlobalTheory.ZeroGapNearOne.exists_gap`)

Lane: native arithmetic family existence. Date 2026-11-24 (GMT). Upstream pin `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`. Reading copy: `homeowmorphism/riemann-hypothesis-original@4e8bb36`. Its `src/` matches the pin exactly (0 differing files, plus `Challenge.lean`), and `verify_run.log` re-checks this.

Status: **SOURCE-MATCHED.** The verifier was run against 9 files and 37 verbatim tokens, with 0 failures. No upstream file was elaborated, and no gate is closed. URT is not used as a premise.

Context: these are inputs (U) and (S) of `ExceptionalPair.main`, which was reconstructed in `04_published_bundle_and_exceptional_pair/` (Part II).

## 0. Overlap check (nothing redone)
At head `854a153` I checked:
- `specialists/landau_criterion/RUN1` to `RUN3` (Landau's positive-coefficient criterion, Mellin/conjugation pole fields, and line-one nonvanishing plus the log-derivative).
- `math/2026-11-24_analytic_zero_exclusion_chapter.md`.

None of them mentions `RealZeroNearOne`, `ZeroGapNearOne`, `ZeroFreePrincipal`, `ZeroFreeComplex` or `dirichletL_zeros_eq_primitiveCharacter_zeros`. A `git grep` over the swarm directory outside this lane also found nothing. So T-1a and T-1d were uncovered and are done here.

Shared fact cited, not re-derived: Mathlib's `LFunction_ne_zero_of_one_le_re` (L(χ,s) ≠ 0 for Re s ≥ 1, when χ ≠ 1 or s ≠ 1) is the line-one nonvanishing that landau_criterion RUN3 reconstructs. Below it is written **(NV)**.

Notation:
- All characters are `DirichletCharacter ℂ q` with `[NeZero q]`, so q ≥ 1. Write L(χ,s) for `LFunction χ s`.
- ord_β denotes `analyticOrderNatAt (LFunction χ) β`.
- A "real" character satisfies χ² = 1.

---------------------------------------------------------------------------------------------------
## Part A: T-1a. `GlobalTheory.RealZeroNearOne.main`

### A.1 Exact statement (`Proofs/GlobalInterpolation/OrderNeTop.lean:89`, blob 6ad3eec0)
```lean
theorem main : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (β β' : ℝ), χ ≠ 1 → ψ ≠ 1 → χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 - c / Real.log (2 * q) ≤ β → 1 - c / Real.log (2 * q) ≤ β' → LFunction χ β = 0 → LFunction ψ β' = 0 → χ = ψ ∧ β = β' ∧ deriv (LFunction χ) β ≠ 0 := by
```
In words: there is an absolute constant c > 0 with the following property, for every modulus q ≥ 1. Among non-principal real characters mod q, at most one has a real zero in [1 − c/log 2q, 1). That character has at most one such zero, and the zero is simple. (Two zeros of the same character are ruled out too.)

### A.2 Inputs (exact, SOURCE-MATCHED)
- **(PL)** `GlobalTheory.T.neg_re_logDeriv_principalLFunction_le`. This statement wraps `GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le` (153-line file).
  `∃ C > 0, ∀ q σ t, 1 < σ → σ ≤ 2 → −Re(L'/L)(1_q, σ+it) ≤ Re(1/(σ+it−1)) + C·log(q(|t|+2))`.
- **(LZ)** `GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum`. This wraps `GlobalTheory.LLocal.logDeriv_LFunction_local`, which in turn uses `GlobalTheory.LogDerivZeros.main (2/3) (5/6)`.
  `∃ C > 0, ∀ q, χ ≠ 1, ∀ t s, ‖s − (3/2+it)‖ ≤ 2/3 → L(χ,s) ≠ 0 →` the zero set Z = {w : ‖w − (3/2+it)‖ ≤ 5/6, L(χ,w) = 0} is finite and `‖L'/L(χ,s) − Σ_{w∈Z} ord_w/(s−w)‖ ≤ C·log(q(|t|+2))`.
- **(NN)** `GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg`. It is proved in full in `NegSumLogDerivNonneg.lean` (104f752f); see A.3.
- Mathlib facts:
  - (NV);
  - `differentiable_LFunction` (L(χ,·) is entire for χ ≠ 1);
  - `natCast_le_analyticOrderAt_iff_iteratedDeriv_eq_zero`;
  - `LSeries_twist_vonMangoldt_eq`, `deriv_LFunction_eq_deriv_LSeries`, `LFunction_eq_LSeries`;
  - `Real.log_two_gt_d9`.

### A.3 Lemma NN (four-term positivity; derived in full)
**Statement.** Let χ, ψ be real characters mod q, and let σ > 1. Then
0 ≤ −Re[(L'/L)(1,σ) + (L'/L)(χ,σ) + (L'/L)(ψ,σ) + (L'/L)(χψ,σ)].

**Proof.**
1. For σ > 1 the Dirichlet series gives −(L'/L)(φ,σ) = Σ_n φ(n)Λ(n)n^{−σ}, absolutely convergent (`hasSum_re_neg_logDeriv`). Taking real parts: −Re(L'/L)(φ,σ) = Σ_n Re φ(n)·Λ(n)/n^σ.
2. Add the four series termwise. Each term is [Re 1(n) + Re χ(n) + Re ψ(n) + Re χψ(n)]·Λ(n)/n^σ.
3. If n is a unit mod q, then χ(n), ψ(n) ∈ {±1} because χ² = ψ² = 1. The bracket is (1+χ(n))(1+ψ(n)) ∈ {0, 4}.
4. If n is not a unit, all four values are 0. This includes the principal character, whose value at a non-unit is 0.
5. Also Λ(n)/n^σ ≥ 0. So every term is ≥ 0, and so is the sum. ∎

### A.4 Lemma `exists_bound` (OrderNeTop.lean:33; derived in full)
**Statement.** There is C₂ > 0 such that the following holds. Let χ ≠ 1, 1 < σ ≤ 2, and let T be a finite set of reals with 2/3 ≤ β and L(χ,β) = 0 for every β ∈ T. Then
−Re(L'/L)(χ,σ) ≤ C₂·log(2q) − Σ_{β∈T} ord_β/(σ−β).

**Proof.** Take C₂ = C from (LZ) and apply (LZ) with t = 0 and s = σ.
- **The hypotheses of (LZ) hold.** First, |σ − 3/2| ≤ 2/3, since 1 < σ ≤ 2. Second, L(χ,σ) ≠ 0 by (NV), since Re σ > 1.
- **What (LZ) gives.** Z is finite, and |D − Σ_Z| ≤ C·log(2q), where D = L'/L(χ,σ). Here log(q(0+2)) is rewritten as log(2q).
- **Taking real parts:** −Re D ≤ C·log 2q − Re Σ_Z ord_w/(σ−w).
- **T ⊆ Z, as complex numbers.** For β ∈ T we have β < 1 by (NV), and β ≥ 2/3. So |β − 3/2| ≤ 5/6.
- **Every term of Σ_Z has nonnegative real part.** Re w < 1 < σ by (NV), so Re 1/(σ−w) = (σ − Re w)/|σ−w|² ≥ 0. The order ord_w is also ≥ 0.
- **So** Σ_T ord_β/(σ−β) ≤ Re Σ_Z, and the claim follows. ∎

Supporting lemmas: `order_ne_top` (L(χ,·) has finite order at every point, since L(χ,2) ≠ 0 by (NV) and L(χ,·) is not identically zero) and `le_order` (iterated derivatives 0,…,n−1 vanish ⇒ ord ≥ n).

### A.5 Proof of `main` (every hypothesis kept)
**Constants.** Take C₁ from (PL) and C₂ from `exists_bound`. Put
- K = C₁ + 3C₂ > 0;
- ε = min(1/2, 1/(4K)), so 0 < ε ≤ 1/2 and Kε ≤ 1/4;
- **c = ε/8**.

**Setup.** Fix q ≥ 1, χ, ψ ≠ 1 with χ² = ψ² = 1, and β, β' ≥ 1 − c/L, where L = log 2q, with L(χ,β) = L(ψ,β') = 0.
- L ≥ log 2 > 1/2. Hence c/L ≤ 1/3 (because ε/8 ≤ 1/16 < L/3), so β, β' ≥ 2/3.
- β, β' < 1 by (NV). Also (1−β)L ≤ ε/8 and (1−β')L ≤ ε/8.
- Put σ = 1 + ε/L. Then 1 < σ ≤ 2, since ε ≤ 1/2 < L, and 1/(σ−1) = L/ε.
- (PL) at t = 0: A := −Re(L'/L)(1_q,σ) ≤ L/ε + C₁L.
- ord_β ≥ 1 and ord_β' ≥ 1, since the functions vanish there. σ − β > 0 and σ − β' > 0.

**Contradiction hypothesis.** Suppose ¬(χ = ψ ∧ β = β' ∧ L'(χ,β) ≠ 0).

**Claim (hX):** 1/(σ−β) + 1/(σ−β') ≤ L/ε + KL. Write B_φ := −Re(L'/L)(φ,σ).
- **Case χ = ψ.** Then χ·χ = 1, so NN with (χ,χ) gives 0 ≤ 2A + 2B_χ, i.e. 0 ≤ A + B_χ.
  - *β = β'.* The negated conclusion forces L'(χ,β) = 0. Then the zeroth and first iterated derivatives vanish, so ord_β ≥ 2. `exists_bound` with T = {β} gives B_χ ≤ C₂L − 2/(σ−β). So 2/(σ−β) ≤ A + C₂L ≤ L/ε + (C₁+C₂)L ≤ L/ε + KL. The left side is 1/(σ−β) + 1/(σ−β').
  - *β ≠ β'.* `exists_bound` with T = {β, β'} (two distinct points, both orders ≥ 1) gives B_χ ≤ C₂L − 1/(σ−β) − 1/(σ−β'). Hence the sum is ≤ A + C₂L ≤ L/ε + KL.
- **Case χ ≠ ψ.** Then χψ ≠ 1: otherwise ψ = χ⁻¹ = χ, since χ² = 1. NN gives 0 ≤ A + B_χ + B_ψ + B_χψ. `exists_bound` gives:
  - B_χ ≤ C₂L − 1/(σ−β), with T = {β};
  - B_ψ ≤ C₂L − 1/(σ−β'), with T = {β'};
  - B_χψ ≤ C₂L, with T = ∅. This uses χψ ≠ 1.

  Summing: 1/(σ−β) + 1/(σ−β') ≤ L/ε + C₁L + 3C₂L = L/ε + KL.

  (This case does not use the negated conclusion. Two distinct real characters can never both have a zero in the window.)

**Window estimate.** (σ−β)L = (1−β)L + ε ≤ 9ε/8, so 1/(σ−β) ≥ 8L/(9ε). The same holds for β'. Hence the left side of (hX) is ≥ 16L/(9ε). Multiplying (hX) by ε/L > 0 gives 16/9 ≤ 1 + Kε ≤ 5/4, which is false because 64 > 45. ∎

**Edge cases.**
- Only q ≥ 1 is needed (NeZero), not q ≥ 3. The bound log 2q > 1/2 already holds at q = 1, where no non-principal character exists anyway.
- The "same character, same zero" sub-case is where simplicity (deriv ≠ 0) comes from. The other sub-cases give uniqueness.
- The constant c does not depend on q, χ, ψ, β or β'.

---------------------------------------------------------------------------------------------------
## Part B: T-1d. `GlobalTheory.ZeroGapNearOne.exists_gap`

### B.1 Exact statement (`Proofs/GlobalInterpolation/ExistsDirichletLFunctionZeroGapNearOne.lean:69`, blob e0685b69)
```lean
theorem exists_gap : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ),
    (χ ≠ 1 ∨ ρ ≠ 1) → LFunction χ ρ = 0 → |ρ.im| ≤ 1 →
      c / ((q : ℝ) ^ 2 * Real.log (3 * q)) ≤ 1 - ρ.re := by
```
It is restated verbatim as `_root_.GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one` (Statement file 1fd99e9a, `exact @GlobalTheory.ZeroGapNearOne.exists_gap`). That restatement is input (S) of `ExceptionalPair.main`.

### B.2 Inputs (exact, SOURCE-MATCHED)
- **(L1)** `GlobalTheory.LOneLower.exists_le_norm_LFunction_one`: `∃ a > 0, ∀ q χ, χ ≠ 1 → χ^2 = 1 → a / q^(3/2) ≤ ‖L(χ,1)‖`.
  - It is proved with a = 1/36 from `inv_le_norm_LFunction_one`: `1/(36q) ≤ ‖L(χ,1)‖`, which is a stronger bound.
  - The q^{3/2} form is a deliberate weakening, via q ≤ q^{3/2}.
  - `inv_le_norm_LFunction_one` itself rests on Lambert-series lemmas in the same 363-line file (`lambert_lower`, `one_le_zetaMul_sq`, `compare_one`, …). They are not reconstructed here.
- **(DB)** `GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le`, with C = 336·e²: `∀ q, χ ≠ 1, ∀ σ, 1 − 1/log 3q ≤ σ → σ ≤ 1 → ‖L'(χ,σ)‖ ≤ C·log²(3q)`.
- **(Z)** `GlobalTheory.ZeroFreeComplex.zero_free_region` and **(P)** `GlobalTheory.ZeroFreePrincipal.zero_free`, with the statements quoted in 04 §II.2.
- Mathlib facts: (NV); `Convex.norm_image_sub_le_of_norm_deriv_le` (the mean-value inequality on a convex set); `Real.log_le_sub_one_of_pos`.

### B.3 Elementary lemmas (x ≥ 1 throughout; derived)
- **`log_pos`:** log 3x > 0.
- **`weaken`:** if 0 < c ≤ d, then c/(x² log 3x) ≤ d/log 3x, because x² ≥ 1.
- **`of_region`:** suppose |t| ≤ 1, 0 < c ≤ d, and r < 1 − d/log(x(|t|+2)). Then c/(x² log 3x) ≤ 1 − r.
  - Proof: 2 ≤ x(|t|+2) ≤ 3x, so 0 < log(x(|t|+2)) ≤ log 3x. Hence d/log 3x ≤ d/log(x(|t|+2)) < 1 − r. Finish with `weaken`.
- **`log_le_sqrt`:** log 3x ≤ 4√x.
  - Proof: 3x ≤ (2√x)², so log 3x ≤ 2·log(2√x) ≤ 2(2√x − 1) < 4√x.
- **`real_case`:** suppose δ ≥ 0, 0 < c ≤ a/(4C), and a/x^{3/2} ≤ C·log²(3x)·δ. Then c/(x² log 3x) ≤ δ.
  - Proof: write x^{3/2} = x√x. Then a ≤ C·log²(3x)·δ·x√x ≤ C·log(3x)·δ·x√x·4√x = 4C·δ·x²·log 3x, using `log_le_sqrt`.
  - So c·4C ≤ a ≤ 4C·δ·x² log 3x. Divide by 4C > 0.

### B.4 Proof of `exists_gap`
Take a, C, d and e from (L1), (DB), (Z) and (P), and set **c = min(1, a/(4C), d, e)** > 0. Fix q ≥ 1 (x = q), χ, and ρ with (χ ≠ 1 ∨ ρ ≠ 1), L(χ,ρ) = 0 and |Im ρ| ≤ 1.
1. **χ = 1.** Then ρ ≠ 1 by the disjunction. (P) gives Re ρ < 1 − e/log(q(|t|+2)). Apply `of_region` with c ≤ e.
2. **χ ≠ 1, and χ² ≠ 1 or Im ρ ≠ 0.** (Z) applies. Use `of_region` with c ≤ d.
3. **χ ≠ 1, χ² = 1, Im ρ = 0** (a real zero of a real character). Write β = Re ρ. By (NV), β < 1.
   - (3a) If 1/log 3q ≤ 1 − β, then `weaken` with c ≤ 1 gives the bound.
   - (3b) Otherwise β > 1 − 1/log 3q. Consider the convex segment S = {z : Im z = 0, β ≤ Re z ≤ 1}, which contains ρ and 1.
     - Every z ∈ S is the real number Re z ∈ [1 − 1/log 3q, 1]. So by (DB), ‖L'(χ,z)‖ ≤ C·log²(3q) on S.
     - L(χ,·) is differentiable because χ ≠ 1. The mean-value inequality gives ‖L(χ,1) − L(χ,ρ)‖ ≤ C·log²(3q)·‖1 − ρ‖.
     - Here L(χ,ρ) = 0 and ‖1 − ρ‖ = 1 − β > 0. With (L1): a/q^{3/2} ≤ ‖L(χ,1)‖ ≤ C·log²(3q)·(1 − β).
     - `real_case` with δ = 1 − β and c ≤ a/(4C) gives the bound. ∎

**Edge cases.**
- The hypothesis (χ ≠ 1 ∨ ρ ≠ 1) is used twice: to exclude the pole in case 1, and as the side condition of (NV) in case 3.
- |Im ρ| ≤ 1 is what makes log(q(|t|+2)) ≤ log 3q.
- The q² (rather than q^{3/2}) in the conclusion comes from absorbing the extra log via `log_le_sqrt`.
- The constant is independent of q, χ and ρ.

**Remark.** This is an *effective* Siegel-type gap of polynomial strength in q. It needs no ineffective Siegel theorem. The effectivity comes entirely from (L1).

---------------------------------------------------------------------------------------------------
## Remaining dependencies (exact names; not reconstructed)
- **T-1a:** `GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le` (PL) and `GlobalTheory.LLocal.logDeriv_LFunction_local` (LZ). LZ in turn rests on `GlobalTheory.LogDerivZeros.main`, a Borel–Carathéodory / Jensen-type local zero-sum lemma.
- **T-1d:**
  - `GlobalTheory.LOneLower.inv_le_norm_LFunction_one`, the L(1,χ) lower bound;
  - `GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le`, the derivative bound near 1;
  - (Z) = T-1c and (P) = T-1b.
- **Still open from 04:** T-1b, T-1c and T-1e.

All of these are `theorem`s. The verifier scan found 0 `axiom` declarations in `src/`.

## Validation evidence (actually run)
- `verify_run.log`: 9 files, 37 tokens and their pin blob ids, plus a whole-`src/` tree comparison (0 differing) and the axiom/sorry scan. Exit 0.
- `lean_run.log`: `LandauPageCaseSkeleton.lean` typechecked with core Lean 4.33.1, exit 0. It checks the case structure of both proofs with abstract Props, plus the integer check 9·5 < 4·16. It is not a proof of either theorem.
- `RH_LandauPageCompanion.lean`: NOT EXECUTED. It needs Mathlib and the upstream build.

## RESUME HERE
Next targets: T-1c `ZeroFreeComplex.zero_free_region` (`LFunctionConjEqZero.lean:290`), then T-1b `ZeroFreePrincipal.zero_free` (`ZeroFreePrincipal.lean:281`), then T-1e. After that: (LZ) `LogDerivZeros.main`, (L1) `inv_le_norm_LFunction_one`, and T-2/T-3.

## HANDOFF TO
- landau_criterion: (NV) is shared, and Part A is the de la Vallée-Poussin/Landau–Page use of the 3-4-1-style positivity, in the form (1+χ)(1+ψ) ≥ 0. It may be worth cross-referencing from RUN3.
- lean_validation: `#print axioms GlobalTheory.RealZeroNearOne.main` and `GlobalTheory.ZeroGapNearOne.exists_gap`, once a Mathlib build is available. Not run by this lane.
