# Run 6: T-1c (`ZeroFreeComplex.zero_free_region`), T-1b (`ZeroFreePrincipal.zero_free`), T-1e (primitive-zero transfer)

Lane: native arithmetic family existence. Date 2026-11-24 (GMT).
Pin: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`. Reading copy: `homeowmorphism/riemann-hypothesis-original@4e8bb36`, whose `src/` equals the pin's `src/` (0 differing files; re-checked in `verify_run.log`).

Status is **SOURCE-MATCHED**: the verifier was run on 6 files and 38 verbatim tokens, with 0 failures. No upstream file was elaborated. No gate is closed. URT is not used as a premise.

These are inputs (Z), (P) and (D) of `ExceptionalPair.main` (see 04 §II). (Z) and (P) also feed `exists_gap` (see 05 Part B).

## 0. Overlap check and shared mechanisms
**Overlap.** At head `3cdc2e1`, then at my claim commit `cc65467`, `git grep` for `ZeroFreeComplex`, `ZeroFreePrincipal` and `primitiveCharacter_zeros` found nothing outside this lane. Landau RUN1 to RUN3 and `math/..._analytic_zero_exclusion_chapter.md` do not cover these theorems. The claim note `CLAIM.md` was pushed first.

**Shared mechanisms, cited and not re-derived:**
- **(NV)** Mathlib line-one nonvanishing, `LFunction_ne_zero_of_one_le_re` and `riemannZeta_ne_zero_of_one_le_re` (landau_criterion RUN3).
- **(PL)** `PrincipalLogDeriv.neg_re_logDeriv_le` (05 §A.2).
- **(LZ)** `LLocal.logDeriv_LFunction_local` (05 §A.2).
- **(NN)** Two-character positivity (05 §A.3).
- **The "zero-sum bound" mechanism of 05 §A.4.** `ZeroFreeComplex.neg_re_logDeriv_le` (LFunctionConjEqZero.lean:78) is the same argument at height t with a finite set S of complex zeros. Applying (LZ) at s = σ+it gives −Re(L'/L)(χ,σ+it) ≤ C₁·log(q(|t|+2)) − Σ_{w∈S} Re 1/(σ+it−w). Here ord_w ≥ 1 (`one_le_order`), and every Re 1/(s−w) ≥ 0 because Re w < 1 < σ by (NV). Its ζ analogue (T-1b) is identical, with one extra pole term +1/(s−1).
- **Root of both local lemmas.** (LZ) and its ζ analogue `ZetaLocal.logDeriv_riemannZeta_local` are both instances of `GlobalTheory.LogDerivZeros.main (2/3) (5/6)`. That is a single Landau/Jensen local zero-sum lemma, and it is the common remaining dependency.

**New shared kernel (3-4-1).** `logDerivativeThreeFourOne.three_four_one` (LogDerivativeBound.lean:76) states, for σ > 1 and any χ:
0 ≤ −Re[3·(L'/L)(1_q,σ) + 4·(L'/L)(χ,σ+it) + (L'/L)(χ²,σ+2it)].
- **Proof.** Expand as Dirichlet series in Λ. The n-th term is Λ(n)n^{−σ}·(3 + 4 Re z + Re z²).
  - If n is a unit mod q, take z = χ(n)n^{−it}, so |z| = 1. Then 3 + 4x + (x² − y²) = 2(1+x)² ≥ 0, using x² + y² = 1 (`comb_nonneg`).
  - If n is not a unit, all three character values are 0.
- With q = 1 and χ = 1 this is the classical ζ inequality, which T-1b uses.

Notation: L(χ,s) = `LFunction χ s`; q ≥ 1 (NeZero); L_γ := log(q(|γ|+2)) > 1/2 (`half_lt_log`).

-------------------------------------------------------------------------------------------
## Part C: T-1c. `GlobalTheory.ZeroFreeComplex.zero_free_region` (LFunctionConjEqZero.lean:290, blob 94ffe758)
```lean
theorem zero_free_region : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), χ ≠ 1 → LFunction χ s = 0 → (χ ^ 2 ≠ 1 ∨ s.im ≠ 0) → s.re < 1 - c / Real.log (q * (|s.im| + 2)) := by
```

### C.1 Key lemma `inv_le_log` (line 173)
```lean
theorem inv_le_log : ∃ K : ℝ, 0 < K ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
    (δ γ : ℝ), χ ≠ 1 → LFunction χ (((1 - δ : ℝ) : ℂ) + γ * I) = 0 → (χ ^ 2 ≠ 1 ∨ γ ≠ 0) →
    0 < δ → δ ≤ 1 / 21 → 1 / δ ≤ K * Real.log (q * (|γ| + 2)) := by
```
**Proof.** Take C₁ from the zero-sum bound and C₀ from (PL), and set **K = 300(C₀+C₁)**.
Let ρ = 1−δ+iγ be a zero, put L = L_γ and **σ = 1+8δ**. Since δ ≤ 1/21, 1 < σ ≤ 2.

Two bounds hold in every case:
- **(A)** −Re(L'/L)(1_q,σ) ≤ 1/(8δ) + C₀L. This is (PL) at t = 0: Re 1/(σ−1) = 1/(8δ), and log 2q ≤ L (`log_zero_le`).
- **(B)** −Re(L'/L)(χ,σ+iγ) ≤ C₁L − 1/(9δ). This is the zero-sum bound at t = γ with S = {ρ}. ρ lies in the disc because |ρ−(3/2+iγ)| = 1/2+δ ≤ 5/6. Also σ+iγ−ρ = 9δ.

Three cases:
1. **χ² ≠ 1** (so χ² ≠ 1 as a character, i.e. non-principal).
   - **(C)** −Re(L'/L)(χ²,σ+2iγ) ≤ C₁·log(q(2|γ|+2)) ≤ 2C₁L. This is the zero-sum bound with S = ∅, plus `log_two_le`: q(2|γ|+2) ≤ (q(|γ|+2))².
   - 3-4-1 gives 0 ≤ 3A + 4B + C ≤ 3/(8δ) + 3C₀L + 4C₁L − 4/(9δ) + 2C₁L.
   - Since 4/9 − 3/8 = 5/72, we get 1/δ ≤ (72/5)(3C₀+6C₁)L ≤ KL.
2. **χ² = 1, so γ ≠ 0, and 2γ² ≤ 81δ² (zero close to the real axis).**
   - χ is real, so by Schwarz reflection ρ̄ = 1−δ−iγ is also a zero (`LFunction_conj_eq_zero`). This holds because conj L(χ, conj z) = L(χ,z) on Re z > 1, termwise since χ(n) ∈ ℝ, and then extends to all z by the identity theorem, L(χ,·) being entire.
   - ρ̄ ≠ ρ since γ ≠ 0. Both lie in the disc |w − 3/2| ≤ 5/6, since (1/2+δ)² + γ² ≤ (23/42)² + (81/2)(1/21)² ≤ 25/36.
   - The zero-sum bound at t = 0 with S = {ρ, ρ̄} gives −Re(L'/L)(χ,σ) ≤ C₁·log 2q − 2T, with T = 9δ/(81δ²+γ²) ≥ (2/27)/δ. The last step is equivalent to 81δ² ≥ 2γ².
   - (NN) with (χ,χ), using χ·χ = 1, gives 0 ≤ A + (−Re(L'/L)(χ,σ)).
   - So (4/27)/δ ≤ 1/(8δ) + (C₀+C₁)L. Since 4/27 − 1/8 = 5/216, 1/δ ≤ (216/5)(C₀+C₁)L ≤ KL.
3. **χ² = 1, γ ≠ 0, and 2γ² > 81δ².** Now χ² = 1_q, so the third 3-4-1 term is principal.
   - (PL) at t = 2γ: −Re(L'/L)(1_q,σ+2iγ) ≤ 8δ/(64δ²+4γ²) + 2C₀L ≤ (4/81)/δ + 2C₀L. The middle bound is equivalent to 392δ² ≤ 16γ², which follows from γ² > (81/2)δ².
   - 3-4-1 gives 0 ≤ 3/(8δ) − 4/(9δ) + 4/(81δ) + 5C₀L + 4C₁L, and 3/8 − 4/9 + 4/81 = −13/648.
   - So 1/δ ≤ (648/13)(5C₀+4C₁)L ≤ KL. ∎

### C.2 Proof of `zero_free_region`
Take **c = min(1/(2K), 1/42)**. Let s be a zero with χ ≠ 1 and (χ² ≠ 1 ∨ Im s ≠ 0), and put δ = 1 − Re s. Then δ > 0 by (NV), and L = L_{Im s} > 1/2.
- **Case δ ≤ 1/21.** Write s = 1−δ+i·Im s. `inv_le_log` gives 1/δ ≤ KL, i.e. δL ≥ 1/K > 1/(2K) ≥ c.
- **Case δ > 1/21.** Since c ≤ 1/42 and L > 1/2, c/L < 1/21 < δ.

In both cases c/L < δ, i.e. Re s < 1 − c/L. ∎

**Edge cases.**
- The side condition (χ² ≠ 1 ∨ Im s ≠ 0) is exactly what excludes the real zero of a real character, which is the possible Siegel zero.
- δ ≤ 1/21 is needed both for σ ≤ 2 and for the disc condition.
- The constants depend only on C₀ and C₁.

-------------------------------------------------------------------------------------------
## Part D: T-1b. `GlobalTheory.ZeroFreePrincipal.zero_free` (ZeroFreePrincipal.lean:281, blob 641a2e37)
```lean
theorem _root_.GlobalTheory.ZeroFreePrincipal.zero_free : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (s : ℂ),
    s ≠ 1 → LFunction (1 : DirichletCharacter ℂ q) s = 0 →
    s.re < 1 - c / Real.log (q * (|s.im| + 2)) := by
```

### D.1 Lemma ζ-region (private, line 128)
**Statement.** ∃ c₁ > 0 such that ζ(s) = 0 and |Im s| ≥ 1 imply Re s < 1 − c₁/log(|Im s|+2).

**Proof (de la Vallée-Poussin).**
- **Constants.** Take C from `ZetaLocal.logDeriv_riemannZeta_local`. Set K = 9C+5 ≥ 5, **c₁ = 1/(28K)** and δ = 1/(2K) ≤ 1/10.
- **Setup.** Suppose, for contradiction, that s = β+iγ is a zero with β ≥ 1 − c₁/L, where L = log(|γ|+2) ≥ 1 (since |γ|+2 ≥ 3 > e).
  - β < 1 by (NV).
  - c₁/L ≤ 1/140, so β ≥ 2/3.
  - Put σ = 1+δ/L ∈ (1, 1.1].
- **Local bound** (ζ analogue of the zero-sum bound, `neg_re_logDeriv_riemannZeta_le_sub_inv_dist_zero_add_log`): −Re ζ'/ζ(σ+it) ≤ Re 1/(σ+it−1) − r + C·log(|t|+2). Here r = 0, or r = 1/(σ−β) when β+it is a zero with β ≥ 2/3.
- **Three applications:**
  - t = 0: A ≤ 1/(σ−1) + CL.
  - t = γ: B ≤ (σ−1) − 1/(σ−β) + CL. This uses Re 1/z ≤ Re z when Re z > 0 and |Im z| ≥ 1, since x/(x²+y²) ≤ x when x²+y² ≥ 1. Here |γ| ≥ 1 is essential.
  - t = 2γ: D ≤ (σ−1) + 2CL, since log(2|γ|+2) ≤ log 2 + L ≤ 2L.
- **3-4-1** (the q = 1, χ = 1 instance): 0 ≤ 3A + 4B + D. Hence
  4/(σ−β) ≤ 3/(σ−1) + 9CL + 5(σ−1) ≤ 6KL + 9CL + 5L = 7KL.
  This uses σ−1 ≤ δ ≤ L and 3/(σ−1) = 3L/δ = 6KL.
- **Conclusion.** So 4 ≤ 7KL(σ−β) ≤ 7K(δ + c₁) = 7/2 + 1/4 = 15/4, using L(σ−β) = δ + L(1−β) ≤ δ + c₁. This is a contradiction. ∎

### D.2 Lemma ζ near the segment (private, line 239)
**Statement.** ∃ η > 0 such that, for s ≠ 1 with |Im s| ≤ 1 and Re s > 1 − η, ζ(s) ≠ 0.

**Proof.**
- Let g(s) = (s−1)ζ(s), redefined as g(1) = 1. It is continuous by `riemannZeta_residue_one`.
- g has no zeros on the compact segment K = {1+iy : |y| ≤ 1}: g(1) = 1, and ζ(1+iy) ≠ 0 for y ≠ 0 by (NV).
- {g ≠ 0} is open, so some η-thickening of K stays inside it (`IsCompact.exists_thickening_subset_open`).
- If Re s ≥ 1, use (NV). Otherwise dist(s, 1+i·Im s) = 1 − Re s < η, so g(s) ≠ 0. Since s ≠ 1, ζ(s) ≠ 0. ∎

**Note.** η comes from a compactness argument. It is a genuine theorem, but the source gives no explicit value for η, so the constant in T-1b, and in everything downstream, is not explicit.

### D.3 Proof of `zero_free`
Take **c = min(c₁, η/2, 1/2)**. Let s ≠ 1 with L(1_q,s) = 0, and put L = log(q(|Im s|+2)) ≥ log 2 > 1/2. Then c/L < 1 and c/L < η.

Mathlib's `LFunctionTrivChar_eq_mul_riemannZeta` gives L(1_q,s) = ∏_{p|q}(1 − p^{−s})·ζ(s) for s ≠ 1. So either an Euler factor vanishes or ζ(s) = 0.
- **Euler factor.** p^{−s} = 1 means |p^{−s}| = p^{−Re s} = 1, so Re s = 0 < 1 − c/L. These are genuine zeros of the imprimitive principal L-function on Re s = 0, and they are handled here.
- **ζ(s) = 0 and |Im s| ≥ 1.** By D.1, Re s < 1 − c₁/log(|Im s|+2) ≤ 1 − c/L, using c ≤ c₁ and log(|Im s|+2) ≤ L because q ≥ 1.
- **ζ(s) = 0 and |Im s| < 1.** By D.2, Re s ≤ 1 − η < 1 − c/L. ∎

-------------------------------------------------------------------------------------------
## Part E: T-1e. `GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros`
The Statement file (blob b4446a9f) restates `GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter` (DirichletLZerosEqPrimitiveCharacterZeros.lean, blob c2178cd4) verbatim:
```lean
theorem _root_.GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩; (LFunction χ s = 0 ↔ LFunction χ.primitiveCharacter s = 0) ∧ ord χ s = ord χ.primitiveCharacter s := by
```
**Proof.** Let χ* be the primitive character, of conductor f | q, and let E(z) = ∏_{p|q}(1 − χ*(p)p^{−z}).
1. **Factorisation.** Mathlib's `LFunction_changeLevel` and `changeLevel_primitiveCharacter` give L(χ,z) = L(χ*,z)·E(z), whenever χ* ≠ 1 or z ≠ 1.
2. **χ* ≠ 1 ∨ s ≠ 1.** If χ* = 1, then χ = changeLevel(1) = 1. So the hypothesis χ ≠ 1 ∨ s ≠ 1 transfers.
3. **E(s) ≠ 0.** Each factor satisfies |χ*(p)p^{−s}| ≤ p^{−Re s} < 1, because Re s > 0 and p > 1. **This is the only place Re s > 0 is used.** On Re s = 0 the Euler factors can vanish, as in D.3.
4. **Analyticity.** E is entire. L(χ*,·) is analytic at s: it is entire if χ* ≠ 1, and otherwise analytic off z = 1, with s ≠ 1.
5. **The identity holds near s.** It holds everywhere if χ* ≠ 1, and on the open set z ≠ 1 otherwise.
6. **Conclusion.** The zero statement follows from L(χ,s) = L(χ*,s)·E(s) with E(s) ≠ 0. For orders, ord(L(χ)) = ord(L(χ*)) + ord(E), and ord(E) = 0 (`analyticOrderAt_congr`, `analyticOrderAt_mul`). ∎

-------------------------------------------------------------------------------------------
## Remaining dependencies (exact names; not reconstructed)
- `GlobalTheory.LogDerivZeros.main`: the common root of (LZ) and `ZetaLocal.logDeriv_riemannZeta_local`.
- `GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le` (PL).
- From 05: `LOneLower.inv_le_norm_LFunction_one` and `DirichletDeriv.exists_norm_deriv_LFunction_le`.
- Mathlib facts as named above.

With this run, all five inputs of `ExceptionalPair.main` (T-1a to T-1e) are reconstructed down to these named lemmas. The verifier scan found 0 `axiom` declarations in `src/`.

## Validation evidence (actually run)
- `verify_run.log`: 6 files and 38 tokens checked against their pin blob ids, plus a whole-`src/` tree comparison (0 differing) and an axiom/sorry scan. Exit 0.
- `constants_run.log`: `constants_check.py` checked all rational coefficient identities and inequalities used above with exact `Fraction` arithmetic. It also checked the 3-4-1 kernel identity 3+4x+(x²−y²) = 2(1+x)² at 168 exact rational unit-circle parametrisations. All ok, exit 0. This checks arithmetic only, not the analytic inputs.
- `lean_run.log`: `ZeroFreeCaseSkeleton.lean` typechecked in core Lean 4.33.1, exit 0. It covers the case structures and the order-transfer arithmetic, using abstract Props and ℕ only. It is not a proof of the upstream theorems.
- `RH_ZeroFreeCompanion.lean`: NOT EXECUTED.

## RESUME HERE
Next: `GlobalTheory.LogDerivZeros.main`. It is the shared Landau local zero-sum lemma, and reconstructing it once discharges both (LZ) and the ζ version. After that: `PrincipalLogDeriv.neg_re_logDeriv_le`, `LOneLower.inv_le_norm_LFunction_one`, then T-2 `PsiRel.psiAP_relative` and T-3 `pi_rel_of_psi_rel`.

## HANDOFF TO
- landau_criterion: the 3-4-1 kernel and the de la Vallée-Poussin argument in D.1 are classical. If useful, cite them from RUN3.
- lean_validation: when Mathlib is available, `#print axioms` for `ZeroFreeComplex.zero_free_region`, `ZeroFreePrincipal.zero_free` and `Lin.zeros_eq_zeros_primitiveCharacter`. Not run by this lane.
