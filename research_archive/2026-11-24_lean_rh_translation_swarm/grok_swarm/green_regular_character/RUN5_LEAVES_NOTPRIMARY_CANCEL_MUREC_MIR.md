# Green lane RUN5: four RUN4 leaves (two closed unconditionally, two reduced)

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream: `leanprover-community/riemann-hypothesis`
pinned at `40e56bab026552e089d7afcfeff08d2defb9c005`; the blob ledger is in §6. Companion: `companion/GreenCompanion/Run5.lean`.
It imports the RUN4 modules `CuspGLRun4` and `SumWhGG`, built with lake (Lean 4.33.1, Mathlib 0df444a). No gate is closed by this note. URT is not used.

## 0. Summary

| Upstream declaration | Upstream proof | Result in Run5.lean | Status |
|---|---|---|---|
| `T.classFn_eq_zero_of_charpoly_not_irreducible_pow` (RUN4 `NotPrimaryPart`) | `CuspGL.eq_zero_of_not_primary` | `notPrimaryPart_holds : NotPrimaryPart` | **proved in companion, no hypotheses**: its only in-repo dependency, `ExistsConjEqAddOfIsCoprime.lean`, is copied whole, and everything else is Mathlib |
| `T.monicFactorizationConvolution_cancel_of_one` (RUN4 `CancelPart`) | `CuspGL.ConvCancel.conv_cancel` | `cancelPart_holds : CancelPart` | **proved in companion, no hypotheses** |
| `T.charpolyEndomorphismDensityGL_recursion` (RUN4 `MuRecPart`) | `CuspGL.mu_rec` | `muRecPart_of_deps` | **conditional** on `T.endomorphismMass_mul_parabolic_induction_trivial` (already a RUN4 leaf), `T.finsum_card_cyclic_vectors_invariant_subspaces` and `T.endomorphismMassOfCharpoly_card_cyclic_vectors` |
| `T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives` (RUN4 `MirPart`) | `GLm.mirClass_diag1_eq_sum` | `mirPart_of_deps` | **conditional** on `T.mirabolicConjInvariant_eq_sum_induced_derivatives`, `T.mirabolicInduction_blockDiag_eq_harishChandra_gelfandGraev` and `T.isClassFunction_bernsteinZelevinskyDerivative` |

"Proved in companion" means the following. The exact upstream statement is derived in Lean from definitions copied verbatim from upstream, with no hypothesis left. `#print axioms` gives `[propext, Classical.choice, Quot.sound]`. It is a faithful re-derivation, not a build of the upstream repository itself.

**Consequences, bridges built in the same file:**
* `torusPart_holds : TorusPartR3`. Upstream `T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum`, which is RUN3's `TorusPart` hypothesis of `ipGL_psi_rootSum`, now holds with no hypotheses in the companion.
* `massPart_of_leaves`. RUN3's `MassPart` (`T.endomorphismMass_mobiusInverse_monic_eq`) now needs 7 leaves: Conj, LogConv, ParMass, PsiSum, MassEq, CycSum and MassCyc. Cancel is discharged, and MuRec is replaced by the two cyclic-vector statements.
* `sumWhGGPart_of_leaves`. RUN3's `SumWhGGPart` (`GLm.GGSum.sum_wh_gg`) now needs WJ, WhMul, BZ, MirConj, MirInd and DerClass.

## 1. `classFn_eq_zero_of_charpoly_not_irreducible_pow`

**Statement (exact):** F is a finite field and V a finite-dimensional F-space. Let φ : End V → ℂ be a class function (`IsClassFn`) that is primitive (`IsPrimitive`), with 0 < dim V. Then φ(g) = 0 for every g whose characteristic polynomial is not f^m with f monic irreducible and m > 0.

**Proof.**
1. χ = charpoly g is monic of degree dim V > 0, so it is not a unit. Pick a monic irreducible factor f, and write χ = f^m·Q with f ∤ Q (`max_power_factor`); here m > 0.
2. Q is not a unit: otherwise Q = 1 (Q is monic) and χ = f^m, contradicting the hypothesis. f^m and Q are coprime.
3. Let A = ker f(g)^m. It is g-invariant. Cayley–Hamilton gives f^m(g)·Q(g) = 0. Then:
   * f^m kills g|A, and Q kills the map g induces on V/A.
   * An irreducible factor of charpoly(T) divides any p with p(T) = 0. This is `irreducible_dvd_of_dvd_charpoly_of_aeval_eq_zero`, proved via an eigenvector over `AdjoinRoot`.
   * Hence charpoly(g|A) and charpoly(g on V/A) are coprime.
4. A ≠ 0: otherwise ker Q(g) = V by the coprime kernel decomposition, so f | Q, a contradiction. A ≠ V: otherwise f^m(g) = 0, and an irreducible factor z of Q would divide both f^m and Q.
5. **The Lemma** (`exists_conj_eq_add_of_isCoprime`, proved in the file). Suppose A is invariant and the two characteristic polynomials are coprime. Then every h in nilRad A = {h : h(V) ⊆ A, h(A) = 0} gives a conjugate e⁻¹ g e = g + h.
   * Proof: D(u) = u∘g − g∘u maps the space N = nilRad A to itself.
   * D is injective on N: if u ∈ N commutes with g, then u = 0. Write 1 = a·p₁ + b·p₂ (Bézout), where p₁(g) kills A and p₂(g) maps V into A.
   * N is finite-dimensional, so D is surjective; pick u with D u = h.
   * u² = 0, so e = 1 + u is invertible with inverse 1 − u, and e⁻¹ g e = g + h.
6. Primitivity at (A, g) gives Σ_{h∈nilRad A} φ(g+h) = 0. By step 5 and the class-function property, every term equals φ(g). So |nilRad A|·φ(g) = 0, and |nilRad A| ≥ 1 because 0 ∈ nilRad A. Hence φ(g) = 0.

All the hypotheses (class function, primitive, finite F, dim V > 0) are used. No extra hypothesis is added.

## 2. `monicFactorizationConvolution_cancel_of_one`

**Statement:** for any field F and a, b, m : F[X] → ℂ with m(1) = 1, suppose (a∗m)(P) = (b∗m)(P) for all monic P. Then a(P) = b(P) for all monic P. Here (a∗m)(P) = Σ over monic pairs (D, E) with D·E = P of a(D)m(E).

**Proof.** Strong induction on deg P.
* The set of pairs is finite, because the monic divisors of P ≠ 0 are finite (`finite_pairs`).
* Split off the pair (P, 1). Every other pair has E ≠ 1 monic, so deg E > 0 and deg D < deg P. By induction a(D) = b(D) on those terms.
* What remains is a(P)·m(1) = b(P)·m(1), and m(1) = 1.

This holds for any field F; no finiteness is needed.

## 3. `charpolyEndomorphismDensityGL_recursion`

**Statement:** for F finite and P monic, q^{deg P}·μ(P) = (1∗μ)(P), and μ(1) = 1. Here μ(P) = #{g ∈ End F^{deg P} : charpoly g = P}/|GL_{deg P}|.

**Proof.**
* μ(1) = 1 is a direct computation on F⁰ (`mu_one`).
* For the recursion, apply parabolic induction (ParMass) to Φ_V(g) = number of g-cyclic vectors of V. Φ is invariant under linear-equivalence conjugation (`cyclic_conj`).
* By CycSum, Σ over g-invariant W of #(cyclic vectors of g|W) equals q^{dim V}. Every vector is cyclic for exactly one invariant subspace, namely the one it generates. So the left side of ParMass is mass(const q^n)(P)/|GL_n| = q^n·μ(P), using `mass_const`.
* By MassCyc, mass(#cyclic)(D) = |GL_{deg D}| for monic D, so the right side is Σ 1·μ(E) = (1∗μ)(P).

## 4. `mirabolicClassFun_blockDiagonal_eq_sum_derivatives`

**Statement:** let ψ ≠ 1, let F be a mirabolic-class function on GL_{k+1}(F_g), and let h ∈ GL_k. Then F(diag1 h) = Σ_{i≤k} hc_{i,k−i}(der_i F, gg_{k−i})(h).

**Proof.**
* diag1 h lies in the mirabolic subgroup (`inMir_diag1_succ`, by unfolding).
* MirConj, with n = k+1 ≥ 1, expands F at a mirabolic point as Σ_{i<k+1} indR_i(der_i F).
* For i ≤ k, der_i F is a class function by DerClass (i < k+1, F mirabolic-class).
* MirInd then identifies indR_i(ρ)(diag1 h) with hc_{i,k−i}(ρ, gg_{k−i})(h).

## 5. Exact finite checks (`RUN5_green_exact_checks.py`)

All checks use exact integers and Fractions, enumerate every case, and work directly from the upstream definitions. They illustrate small cases; they do not prove the general statements.
* **(A)** For each case, the script solves exactly for the full space of primitive class functions on End(F_q^n) and checks that they vanish on non-primary classes.
  * q=2, n=2: dimension 3.
  * q=3, n=2: dimension 6.
  * q=2, n=3: dimension 4.
  * In every case, the number of nonzero values at non-primary classes is 0. The solution spaces are non-trivial.
* **(B)** Leaf CycSum: Σ_W #cyclic = q^n for every g, with (q,n) = (2,2), (3,2), (2,3). 0 mismatches.
* **(C)** Leaf MassCyc: Σ_{charpoly g = D} #cyclic(g) = |GL_n| for every monic D, with (q,n) = (2,2), (3,2), (5,2), (2,3). 0 mismatches.
* **(D)** The triangular structure behind conv_cancel: (P,1) is the only pair with deg D = deg P. Checked for q=2 up to degree 4 and q=3 up to degree 3. 0 exceptions.

The RUN4 mass check, and the μ-recursion check (q=2, deg ≤ 3; q=3, deg ≤ 2), remain in `RUN4_green_exact_checks.py`. No finite check was attempted for the mirabolic identity, because it needs the Whittaker/Bernstein–Zelevinsky machinery on GL_n(F_g).

## 6. Overlap, reproduction, build log, ledger

**Overlap.** Before pushing, the head of `newtons-cathedral` was re-fetched twice; the last fetch was `c3a6793705`, at 10:22 GMT. There are five commits after RUN4 (`0ea69dd`): a Landau/Cauchy audit, an arithmetic Fourier balance translation, galois_rows RUN5 + covolume_premises RUN1, and native_family_existence runs 7 and 8 (claim note). Judged from commit titles, none touches these four declarations or the Green files. This run only adds files.

**Reproduction.**
1. Run the RUN3 and RUN4 bundles as described in the RUN4 chapter.
2. Run `RUN5_scripts_bundle.py`, which writes `RUN5_mk_run5.py` and `RUN5_green_exact_checks.py`.
3. Run `python3 RUN5_mk_run5.py`, which writes `GreenCompanion/Run5.lean`.
4. Run `OMP_NUM_THREADS=1 nice lake build GreenCompanion.Run5`.

The build log is excerpted below with its lines unedited. The other warnings are 3 linter "Try this" suggestions and 1 deprecation (`Set.mem_setOf_eq`); there are no errors. `sorry` appears only in the header comment "No sorry, no axiom".
```
⚠ [8711/8711] Built GreenCompanion.Run5 (11s)
info: GreenCompanion/Run5.lean:436:0: 'GreenCompanion.CuspGL.eq_zero_of_not_primary' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:437:0: 'GreenCompanion.CuspGL.ConvCancel.conv_cancel' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:438:0: 'GreenCompanion.CuspGL.mu_rec' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:439:0: 'GreenCompanion.GLm.mirClass_diag1_eq_sum' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:440:0: 'GreenCompanion.notPrimaryPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:441:0: 'GreenCompanion.cancelPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:442:0: 'GreenCompanion.muRecPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:443:0: 'GreenCompanion.torusPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:444:0: 'GreenCompanion.mirPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:445:0: 'GreenCompanion.sumWhGGPart_of_leaves' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Run5.lean:446:0: 'GreenCompanion.massPart_of_leaves' depends on axioms: [propext, Classical.choice, Quot.sound]
Build completed successfully (8711 jobs).
EXIT 0
```

| upstream path | upstream blob (contents API) | local `git hash-object` |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EqZeroOfNotPrimary.lean` | `e01fdacd9c069c01e1704ccb9c929786665bd2d7` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/ExistsConjEqAddOfIsCoprime.lean` | `c28310b0901776be46c5de054ee87b28c5bfc120` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/MonicFactorizationConvolutionCancelOfOne.lean` | `9d4e8e423a68ac6a4de44bdf9c2914452d1cd006` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/CharpolyEndomorphismDensityGLRecursion.lean` | `1625e29810b0dfb409a2fb557bb5d8cb7195e6b6` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/FinsumCardCyclicVectorsInvariantSubspacesStatement.lean` | `80f02998c81f1a5156183d4ad2e963c3fe875c81` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassOfCharpolyCardCyclicVectorsStatement.lean` | `e23b1a7ab99e63262d089de420a32b5bbd5524ee` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicClassFunBlockDiagonalEqSumDerivatives.lean` | `602c540923a16dabb6b2e1428c7ee7a5f1e83669` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicConjInvariantEqSumInducedDerivativesStatement.lean` | `04aec3a7d16764eceafa2c85703bed38da6b6049` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicInductionBlockDiagEqHarishChandraGelfanStatement.lean` | `a0cb730f37c03e953135d5beb3f371375356e172` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsClassFunctionBernsteinZelevinskyDerivativeStatement.lean` | `93ba6ac1b5aecb63cd1e4a1bc1fa9463bb493656` | match |
| `src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsMirClass.lean` | `6e0a7381eed375d76591a759d4913378dc6be596` | match |

## 7. Exact-check output
```
(A) q=2 n=2: 6 conjugacy classes in End, 24 primitivity equations, primitive class functions dim = 3, non-primary classes = 1, nonzero values there = 0
(A) q=3 n=2: 12 conjugacy classes in End, 108 primitivity equations, primitive class functions dim = 6, non-primary classes = 3, nonzero values there = 0
(A) q=2 n=3: 14 conjugacy classes in End, 1792 primitivity equations, primitive class functions dim = 4, non-primary classes = 6, nonzero values there = 0
(B) q=2 n=2: 16 endomorphisms, mismatches = 0
(B) q=3 n=2: 81 endomorphisms, mismatches = 0
(B) q=2 n=3: 512 endomorphisms, mismatches = 0
(C) q=2 n=2: |GL|=6, 4 monic D, mismatches = 0
(C) q=3 n=2: |GL|=48, 9 monic D, mismatches = 0
(C) q=5 n=2: |GL|=480, 25 monic D, mismatches = 0
(C) q=2 n=3: |GL|=168, 8 monic D, mismatches = 0
(D) q=2 deg<=4: 30 monic P, factorisation pairs with deg D = deg P other than (P,1): 0
(D) q=3 deg<=3: 39 monic P, factorisation pairs with deg D = deg P other than (P,1): 0
EXIT 0
```
