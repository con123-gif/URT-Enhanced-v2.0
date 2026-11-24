# Green lane RUN4: `sum_wh_gg`, the torus-sum formula, the Möbius-inverse mass formula

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream: `leanprover-community/riemann-hypothesis`
pinned at `40e56bab026552e089d7afcfeff08d2defb9c005`. Every upstream file used is listed with its blob SHA in §6.
**Status labels:** *conditional reduction*: the exact upstream statement is derived in Lean from the named upstream
dependencies, which are taken as hypotheses whose text is the exact upstream statement. No gate is closed by this
note. URT is not used as a premise or as evidence.

## 0. Summary

| Upstream declaration (this run) | Reduced to (exact upstream names, still open in this lane) | Lean companion |
|---|---|---|
| `GLm.GGSum.sum_wh_gg` | `T.whittakerJacquetIdempotents_properties_primeField`, `T.whittakerDimension_harishChandraInduction_mul`, `T.bernsteinZelevinskyDerivativeGLn_eq_twisted_sum`, `T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives` | `GreenCompanion.GGSum.sum_wh_gg` (SumWhGG.lean) |
| `T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum` | `T.classFn_eq_zero_of_charpoly_not_irreducible_pow` | `GreenCompanion.CuspGL.ipGL_rootSum_eq_sum_torus` (CuspGLRun4.lean) |
| `T.endomorphismMass_mobiusInverse_monic_eq` | `T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj`, `T.charpolyEndomorphismDensityGL_recursion`, `T.additive_mul_eq_vonMangoldt_convolution`, `T.endomorphismMass_mul_parabolic_induction_trivial`, `T.apply_charpoly_eq_finsum_psi_invariant_submodules`, `T.monicFactorizationConvolution_cancel_of_one`, `T.endomorphismMass_eq_of_linearEquiv_invariant` | `GreenCompanion.CuspGL.mass_psi_eq_glCard_mul_mangoldt_div` |

(All `T.` names are `GlobalTheory.T.`.) Bridges, which discharge earlier-run hypotheses whose text is copied byte for byte from those runs:
* `ggNorm_of_deps`: the four leaves above give the full upstream statement of `T.gelfandGraevCharacterGLn_norm_and_reciprocity`, via RUN3's `GGNorm.gg_norm`. This discharges RUN3's `SumWhGGPart`, and through it RUN2's `GGNorm` hypothesis.
* `torusPart_of_deps : NotPrimaryPart → TorusPartR3`. This is RUN3's `TorusPart` hypothesis of `ipGL_psi_rootSum`.
* `massPart_of_deps : (7 hyps) → MassPartR3`. This is RUN3's `MassPart` hypothesis of `ipGL_psi_rootSum`.

The Lean build ran (lake, Lean 4.33.1, Mathlib 0df444a). `#print axioms` gives only `[propext, Classical.choice, Quot.sound]` for all six RUN4 theorems. `sorry` count: 0 (§5).

## 1. `sum_wh_gg`

**Statement (exact):** `∀ (g : ℕ) [Fact g.Prime] (ψ : AddChar (ZMod g) ℂ), ψ ≠ 1 → ∀ k : ℕ, ∑ j ∈ Finset.range (k + 1), wh ψ (gg ψ j) = (g : ℂ) ^ k`.

**Dependencies.** They are stated exactly in SumWhGG.lean as `WJPart`, `WhMulPart`, `BZPart` and `MirPart`. Fix a prime g, ψ ≠ 1 and any k ≥ 0. Write δ_n for the delta function at 1 on GL_n(F_g). Write T(n) = n(n−1)/2.

1. **(Mir)** δ_{k+1} is constant on mirabolic classes, because it is a class function (`dirac_class`). Also diag1 h = 1 ⇔ h = 1 (`blockDiagonalWithIdentityGL_eq_one_iff`, proved in the file from the verbatim upstream body). So for every h ∈ GL_k:
   δ_k(h) = δ_{k+1}(diag1 h) = Σ_{i=0}^{k} hc_{i,k−i}(der_i δ_{k+1}, gg_{k−i})(h).
   This uses ψ ≠ 1.
2. **(BZ)** In the twisted sum for der_i δ_{k+1}(h), only x = 1 survives. Then InR and tl x = h force h = 1, and supFrom(1) = 0 gives ψ(0) = 1. So
   der_i δ_{k+1} = g^{−(i(k+1−i)+T(k+1−i))} · δ_i (`der_dirac`), for every i ≤ k+1.
3. **(WJ)** wh δ_n = g^{−T(n)} (`wh_dirac`; this is the `coeff 1` clause of the idempotent eU).
4. **(WhMul)** wh(hc(α, β)) = wh α · wh β for class functions, using ψ ≠ 1 (`wh_hc`). wh is linear (`wh_mul_left`, `wh_sum`).
5. Apply wh to step 1, then use steps 2–4 term by term:
   g^{−T(k)} = Σ_i g^{−(T(i)+i(k+1−i)+T(k+1−i))} · wh(gg_{k−i}).
   The exponent is T(k+1) = T(k)+k (`tri_add`, `Nat.triangle_succ`), independent of i. So g^{−T(k)} = g^{−T(k)−k} · Σ_i wh(gg_{k−i}).
   Reflect the sum (i ↦ k−i) and multiply by g^{T(k)+k} ≠ 0. This gives Σ_{j≤k} wh(gg_j) = g^k.

There are no exceptions: k = 0 is included, and ψ ≠ 1 is the only hypothesis. The proof body is the upstream body, copied verbatim by the generator; the only change is that the four dependencies are passed as explicit hypotheses.

## 2. `invertibleEndInnerProduct_rootPowerSum_eq_torusSum`

**Statement (exact, = RUN3 `TorusPart`).** For finite F, finite-dimensional V, θ : F̄ →* ℂ, and φ a class function that is primitive with 0 < dim V, and for all l:

ipGL φ (rootSum θ l ∘ charpoly) = ∑ᶠ α ∈ {α : F̄ | α^(q^n−1) = 1}, (n / deg minpoly α) · mass φ (minpoly α^(n/deg minpoly α)) · conj(θ α^l)

Here n = finrank F V and q = |F|.

**Proof.**
1. `ipGL_charpoly_eq_finsum_mass` is proved in the file; its upstream body is copied whole. It regroups the inner product by characteristic polynomial: ipGL φ (s ∘ charpoly) = ∑ᶠ over monic P of degree n with P(0) ≠ 0 of mass φ P · conj(s P).
2. `sum_poly_eq_sum_torus` is proved in the file. For n > 0, take any c that vanishes on monic degree-n P that are not of the form f^m (f monic irreducible, m > 0). For such c, it turns the sum over P into the stated sum over the roots α of unity of order dividing q^n − 1. Each primary P = f^m is counted through the deg f roots of f, with multiplicity m = n / deg f in rootSum.
3. To apply step 2 with c = mass φ, it remains to show mass φ P = 0 for non-primary P. mass φ P is a sum of φ g over g with charpoly g = P. Each such φ g is 0 by the leaf `T.classFn_eq_zero_of_charpoly_not_irreducible_pow` (`NotPrimaryPart`), which needs exactly the hypotheses already present: class function, primitive, 0 < dim V.

Hypotheses are all preserved: F finite; V finite-dimensional; φ a class function and primitive; finrank > 0; l arbitrary.

## 3. `endomorphismMass_mobiusInverse_monic_eq`

**Statement (exact, = RUN3 `MassPart`):** for s additive, P monic, natDegree P = finrank F V:
`mass (psi s V) P = glCard F P.natDegree * mangoldt s P / (q ^ P.natDegree − 1)`.

**Proof.** μ is the density mass(1)/|GL| (the definition of `mu`). For every monic Q:

1. **(MuRec)** q^{deg Q} μ(Q) = (1 ∗ μ)(Q), and μ(1) = 1. Here ∗ is the monic-factorisation convolution `conv`.
2. **(LogConv)** Since q ≥ 2 and s is additive, step 1 gives s(Q)μ(Q) = (Λ_s/(q^{deg}−1) ∗ μ)(Q).
3. **(ParMass, Conj, PsiSum)** Take Φ_V = psi s V. It is invariant under linear-equivalence conjugation by `T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj`. Parabolic induction gives:
   mass(Σ_W psi s W ∘ restrict)(Q)/|GL_{deg Q}| = (mass(psi s)/|GL| ∗ μ)(Q), on V = F^{deg Q}.
   By PsiSum the summed function is s ∘ charpoly. By `mass_comp_charpoly_eq_mul` (proved in the file), mass(s ∘ charpoly)(Q) = s(Q) · mass(1)(Q). So the left side is s(Q)μ(Q).
4. **(Cancel)** Steps 2 and 3 express s(Q)μ(Q) as two convolutions with μ, where μ(1) = 1. Cancellation gives mass(psi s F^{deg D})(D)/|GL_{deg D}| = Λ_s(D)/(q^{deg D}−1) for every monic D.
5. **(MassEq)** mass(psi s V)(P) = mass(psi s F^{deg P})(P), since deg P = finrank V. Multiply by |GL_{deg P}| ≠ 0 (`Nat.card_pos`).

Hypotheses are all preserved: F finite; s additive; P monic; natDegree P = finrank F V. Nothing is assumed about P being irreducible or primary.

**Exact finite checks (independent of Lean).** The checker is `RUN4_green_exact_checks.py`, which uses exact Fractions and runs inside the scripts bundle. It enumerates all n×n matrices over F_q and builds psi s V by the defining Möbius recursion over invariant subspaces. It then compares mass(psi s V)(P) with |GL_n| Λ_s(P)/(q^n−1) for every monic P of degree n:
* (q,n) ∈ {(2,1),(2,2),(3,2),(5,2),(2,3)};
* s ∈ {natDegree, multiplicity of root 1, multiplicity of root 0};
* 0 mismatches.

The values are non-trivial; for example, at q=3, n=2, s=natDegree, the masses are 6, 12, 0 on squares, irreducibles and split-distinct P. Separately, the leaf recursion q^{deg P}μ(P) = (1∗μ)(P) was checked for q=2, deg ≤ 3 (15 P) and q=3, deg ≤ 2 (13 P), with 0 mismatches. These are finite checks; they are not a proof of the leaf.

## 4. Mechanisms, overlap, reproduction

* **Mechanisms:**
  * M3 (companion technique): verbatim definitions and bodies, with dependencies taken as exact-text Prop hypotheses.
  * M7 (new, shared by the mass formula): "Dirichlet-convolution cancellation against μ with μ(1)=1". This is used once here, in the form `hCancel`.
* **Overlap check:** head of `newtons-cathedral` re-fetched before pushing (`bf8e32edfe`, commit time 10:13 GMT). The 12 commits after RUN3 (`fd6228e2ea`) are galois_rows RUN4, native_family_existence runs 5–7, RH-dependency/fingerprint tooling, and one RH integration commit on depth-zero uniqueness / cyclic determinants; judged from commit titles, none touches `sum_wh_gg`, the torus-sum formula or the mass formula. RUN1–RUN3 Green files are unchanged; this run only adds files.
* **Reproduction.** Run `RUN3_generators_bundle.py`, then `python3 RUN3_mk_run3.py`, which writes `CuspGLDefs.lean` and `run3/ipgl_deps.lean`. Then run `RUN4_scripts_bundle.py`, which writes `RUN4_mk_run4.py` and `RUN4_green_exact_checks.py`. `python3 RUN4_mk_run4.py` writes `CuspGLRun4.lean` and `SumWhGG.lean` into the lake project `GreenCompanion/`. Finally run `nice lake build GreenCompanion.SumWhGG GreenCompanion.CuspGLRun4` with `OMP_NUM_THREADS=1`. No new Mathlib cache was downloaded.

## 5. Lean build log (excerpt, unedited lines)
```
ℹ [8709/8710] Built GreenCompanion.SumWhGG (16s)
info: GreenCompanion/SumWhGG.lean:219:0: 'GreenCompanion.GGSum.sum_wh_gg' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/SumWhGG.lean:220:0: 'GreenCompanion.ggNorm_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun4.lean:391:0: 'GreenCompanion.CuspGL.ipGL_rootSum_eq_sum_torus' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun4.lean:392:0: 'GreenCompanion.CuspGL.mass_psi_eq_glCard_mul_mangoldt_div' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun4.lean:393:0: 'GreenCompanion.torusPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun4.lean:394:0: 'GreenCompanion.massPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
Build completed successfully (8710 jobs).
```
`grep -c sorry`: 0 in SumWhGG.lean, 0 in CuspGLRun4.lean.

## 6. Upstream blob ledger (git hash-object of the fetched file vs GitHub contents API at the pin)
| path | upstream blob | local |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/BlockDiagonalWithIdentityGLEqOneIff.lean` | `4c22baad995d07ce23a55f49855f975ad2a2e444` | match |
| `src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsMirClass.lean` | `6e0a7381eed375d76591a759d4913378dc6be596` | match |
| `src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean` | `8b45fadba6baf9bf7bb49b9c18dac0fb497f00ff` | match |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/WhittakerJacquetIdempotentsPropertiesPrimeFieldStatement.lean` | `1a16c8134528a1aba1093940aa18b47a897952b2` | match |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/WhittakerDimensionHarishChandraInductionMulStatement.lean` | `c235494f4c6e5a7c07e4cdfc5a5202db07df7edf` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/BernsteinZelevinskyDerivativeGLnEqTwistedSumStatement.lean` | `aa75f1d44ff595c813ab4284ffba0a296cfe618e` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicClassFunBlockDiagonalEqSumDerivativesStatement.lean` | `d64ae6dd55884d02ea71ad4fea324c2b6c7477be` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndInnerProductRootPowerSumEqTorusSum.lean` | `a6553352aa163501413acf4531c5c33dd1952017` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsUnitIffCharpolyCoeffZeroNe.lean` | `baf213db18fe68703a1058c62c3d59abcd63f7ff` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/FiniteMonicNatDegree.lean` | `6310212d4280fa3ec5469384b9c2c6d3bcfe0cba` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EqZeroOfNotPrimaryStatement.lean` | `c1025ea4828c6c4d825d5fea50fa366fede37bcf` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassMobiusInverseMonicEq.lean` | `4d04798d29278170d81e96251a28656d89917c3f` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseCharpolyLinearEquiStatement.lean` | `5587eede8307cac3dc493a0dc000ebff1f1c8b34` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/CharpolyEndomorphismDensityGLRecursionStatement.lean` | `0932527c472260743a8573e74079ddfaafdc83fa` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/AdditiveMulEqVonMangoldtConvolutionStatement.lean` | `38a8f3a0d19c1f9883f254387767c8a604086a5d` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassMulParabolicInductionTrivialStatement.lean` | `c3dc5035c5d7ff821ceb2d68af00fa149b8eacb7` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/CharpolyEqFinsumPsiStatement.lean` | `d384c1c9c2a1b61f59e020b1b5943c70b90d9d0a` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/MonicFactorizationConvolutionCancelOfOneStatement.lean` | `717b52ac2efdcc483c687cc9cbda7bfc2e88bc19` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassEqOfLinearEquivInvariantStatement.lean` | `1457246356001297ea1c6ceb2ec46e88eace9fa7` | match |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/CardCuspidalMultisetsTotalDegreeLe.lean` | `906eccd344cbb39bbcdc227f9497ee606256eb0a` | match |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsCuspidalCharacterOfRegularCharacterGLn.lean` | `44708e05b945f485c7886dfe1008cc0b32ffb3e2` | match |
| `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GreenCuspidalCharIsCuspidalOfMinpolyOfParam.lean` | `635e4da718e3ad98e5b5a4bae5573419ab979bd5` | match |

The last three rows are the files read for the dependency tree; they were not compiled.

## 7. Exact-check output (`RUN4_green_exact_checks.py`)
```
== mass(psi s V) P = glCard * mangoldt s P / (q^n - 1) for every monic P of degree n = dim V (endomorphismMass_mobiusInverse_monic_eq)
q=2 n=1 s=natDegree: 2 monic P checked, mismatches = 0
q=2 n=1 s=mult of root 1: 2 monic P checked, mismatches = 0
q=2 n=1 s=mult of root 0: 2 monic P checked, mismatches = 0
q=2 n=2 s=natDegree: 4 monic P checked, mismatches = 0
q=2 n=2 s=mult of root 1: 4 monic P checked, mismatches = 0
q=2 n=2 s=mult of root 0: 4 monic P checked, mismatches = 0
q=3 n=2 s=natDegree: 9 monic P checked, mismatches = 0
q=3 n=2 s=mult of root 1: 9 monic P checked, mismatches = 0
q=3 n=2 s=mult of root 0: 9 monic P checked, mismatches = 0
q=5 n=2 s=natDegree: 25 monic P checked, mismatches = 0
q=5 n=2 s=mult of root 1: 25 monic P checked, mismatches = 0
q=5 n=2 s=mult of root 0: 25 monic P checked, mismatches = 0
q=2 n=3 s=natDegree: 8 monic P checked, mismatches = 0
q=2 n=3 s=mult of root 1: 8 monic P checked, mismatches = 0
q=2 n=3 s=mult of root 0: 8 monic P checked, mismatches = 0
== leaf charpolyEndomorphismDensityGL_recursion: q^deg P mu P = (1 * mu)(P), mu 1 = 1
q=2 deg<=3: 15 monic P checked, mismatches = 0
q=3 deg<=2: 13 monic P checked, mismatches = 0
```
