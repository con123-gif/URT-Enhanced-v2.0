# Green lane RUN6: cyclic-vector leaves, MassEq, LogConv, DerClass and the two mirabolic statements

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream: `leanprover-community/riemann-hypothesis`
@ `40e56bab026552e089d7afcfeff08d2defb9c005` (blob ledger §6). Companion: `companion/GreenCompanion/Run6.lean`
(imports RUN5 `Run5.lean`), built with lake (Lean 4.33.1, Mathlib 0df444a). No gate is closed. URT not used.

## 0. Summary

| Upstream declaration (`GlobalTheory.T.`) | Upstream proof | Result in Run6.lean | Status |
|---|---|---|---|
| `finsum_card_cyclic_vectors_invariant_subspaces` (RUN5 `CycSumPart`) | `CuspGL.finsum_card_cyclic_eq` | `cycSumPart_holds` | **proved in companion, no hypotheses** |
| `endomorphismMassOfCharpoly_card_cyclic_vectors` (RUN5 `MassCycPart`) | `CuspGL.mass_card_cyclic` (+ `CyclicMass.*`) | `massCycPart_holds` | **proved in companion, no hypotheses** |
| `endomorphismMass_eq_of_linearEquiv_invariant` (RUN4 `MassEqPart`) | `CuspGL.mass_eq_mass_pi_of_invariant` | `massEqPart_holds` | **proved in companion, no hypotheses** |
| `isClassFunction_bernsteinZelevinskyDerivative` (RUN5 `DerClassPart`) | `GLm.DerClass.isClass_der` | `derClassPart_holds` | **proved in companion, no hypotheses** |
| `additive_mul_eq_vonMangoldt_convolution` (RUN4 `LogConvPart`) | `CuspGL.LogDeriv.additive_mul_eq_conv` | `logConvPart_of_deps` | **conditional** on `T.monicFactorizationConvolution_finite_comm_assoc_add`, `T.additive_eq_polynomialVonMangoldt_convolution_one` |
| `mirabolicConjInvariant_eq_sum_induced_derivatives` (RUN5 `MirConjPart`) | `GLm.MirSum.eq_sum_indR_der` | `mirConjPart_of_deps` | **conditional** on `T.isMirabolicConjInvariant_twistedTailMeanFun`, `T.mirabolic_function_eq_induced_derivative_add_tail`, `T.mirabolicInductionPhiPlus_inductionFromBlockUni`, `T.der_tail_of_lt_of_le` |
| `mirabolicInduction_blockDiag_eq_harishChandra_gelfandGraev` (RUN5 `MirIndPart`) | `GLm.indR_diag1_eq_hc_gg` (+ 30 `GLm.ResInd.*` lemmas, 650 lines) | `mirIndPart_of_deps` | **conditional** on `T.blockParabolic_unitriangular_subgroups_GLnPrimeField` |

"Proved in companion" = the exact upstream statement is derived in Lean from verbatim upstream definitions with no
hypothesis left; `#print axioms` = `[propext, Classical.choice, Quot.sound]`. It is a faithful re-derivation, not a
build of the upstream repository.

**Consequences (bridges in Run6.lean).**
* `muRecPart_of_parMass : ParMassPart → MuRecPart` — the density recursion now needs only ParMass.
* `massPart_of_leaves6` — RUN3 `MassPart` (`T.endomorphismMass_mobiusInverse_monic_eq`) now needs only
  Conj, ParMass, PsiSum, FinComm, VonMangoldtOne (was 7 leaves in RUN5).
* `mirPart_of_leaves6`, `sumWhGGPart_of_leaves6'` — `T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives` now needs
  TailMir, MirTail, PhiPlus, DerTail, BlockPar; RUN3 `SumWhGGPart` (`GLm.GGSum.sum_wh_gg`) needs these + WJ, WhMul, BZ.

**Mechanical note (honest labelling).** Where an upstream dependency is invoked inside *helper* lemmas (LogDeriv's
`conv_eq_sum`; ~10 ResInd lemmas), it is supplied as a Prop-valued class (`FinCommH`, `VonMangoldtOneH`, `BlockParH`)
whose single field has the exact upstream statement as its type, with `include`; the verbatim call sites then need no
edits beyond the rename `GlobalTheory.T.X ↦ XH.h`. This is equivalent to an explicit hypothesis (the final bridges take
plain hypotheses and build the instance with `haveI`). Other edits: `_root_.GlobalTheory.GLm.DerClass.` /
`_root_.GlobalTheory.GLq.Mt` prefixes shortened and `open` lines re-pointed to the companion namespaces.

## 1. Cyclic-vector leaves
**CycSum** (exact): for finite F, finite-dimensional V, g ∈ End V:
Σ_{W g-invariant} #{v ∈ W : the only g|W-invariant subspace of W containing v is W} = q^{dim V}.
*Proof.* The map (W, v) ↦ v is a bijection from {(W, v) : v cyclic for g|W} onto V: injective because a vector cyclic
in W and lying in W' forces W ≤ W' (comap of W' to W is invariant, contains v, hence is all of W), so equal vectors
give mutually contained W; surjective because v is cyclic in the smallest invariant subspace containing it (sInf of
invariant subspaces containing v). Count both sides (|V| = q^{dim V}).

**MassCyc** (exact): for finite F and monic D, Σ_{g ∈ End F^{deg D}, charpoly g = D} #cyclic(g) = |GL_{deg D}(F)|.
*Proof.* Linear isomorphisms e : F[X]/(D) ≃ F^{deg D} are in bijection with pairs (g, v), charpoly g = D, v cyclic:
e ↦ (e∘(mult. by X)∘e⁻¹, e(1)); multiplication by the root has charpoly D (`charpoly_mulLeft_root`), 1 is cyclic
(`cyclic_one`), and conversely (g, v) gives e(p mod D) = p(g)v (`map_mk`; well defined and bijective by
Cayley–Hamilton and cyclicity). The number of such e is |GL_{deg D}|. Hypotheses kept: F finite, D monic.

## 2. MassEq
(exact) If Φ is invariant under conjugation by linear equivalences and deg P = dim V then
mass(Φ_V)(P) = mass(Φ_{F^{deg P}})(P). *Proof.* Fix e : V ≃ F^{deg P}; g ↦ e g e⁻¹ is a bijection of
{charpoly = P} (charpoly is conjugation invariant) and Φ is preserved. No monicity needed (as upstream).

## 3. LogConv (conditional)
(exact) For any field F, q ≥ 2, additive s and m with m(1)=1 and q^{deg P} m(P) = (1∗m)(P) for monic P:
s(P)m(P) = (L∗m)(P), L(D) = Λ_s(D)/(q^{deg D}−1).
*Proof.* (FinComm supplies finiteness, commutativity, associativity and additivity of ∗; VonMangoldtOne supplies
s = Λ_s ∗ 1.) With o ≡ 1: q^{deg D}L(D) = L(D)+Λ_s(D) (σ_L). Multiply both candidate sides by q^{deg Q}:
q^{deg}·(s m) = (Λ_s∗o)∗m + o∗(s m) using additivity of s over factorisations; q^{deg}·(L∗m) = (Λ_s∗o)∗m + o∗(L∗m)
using σ_L and the recursion for m. So E = s m − L∗m satisfies E(1)=0 and q^{deg}E = o∗E; `eq_zero_of_rec` (strong
induction on degree, using q^n − 1 ≠ 0 for n ≥ 1) gives E = 0. Note q is an arbitrary natural ≥ 2, not |F|.

## 4. DerClass
(exact) For i < n and F mirabolic-class on GL_n(F_g), der_i F is a class function on GL_i.
*Proof.* Write n = i + b, b > 0. der_i F(h) = wh(res_{i,b} F h). Conjugating h by y corresponds to conjugating by the
block-diagonal dg(y) = diag(y, 1) in GL_n; `res_conj` shows res F (y h y⁻¹) u = res F h u for upper-unitriangular u
(reindex the sum by x ↦ dg(y) x dg(y)⁻¹, which preserves the parabolic shape, the top-left block up to conjugacy,
the bottom-right block, and — since both matrices lie in the mirabolic — the value of F by IsMirClass). `wh_congr`:
wh only sees values at upper-unitriangular u (the Whittaker idempotent is supported there). Hence equality.

## 5. Mirabolic statements (conditional)
**MirConj** (exact): ψ ≠ 1, n ≥ 1, F mirabolic-class on GL_n, p mirabolic ⇒ F(p) = Σ_{i<n} indR_i(der_i F)(p).
*Proof.* Induction on n. n = 1: p = 1 and the identity is a direct computation (`base`, `der_one`, `eU_one`).
n = m+1, m ≥ 1: MirTail gives F(p) = indR_m(der_m F)(p) + indV(tail_m F)(p); TailMir says tail_m F is mirabolic-class,
so the induction hypothesis expands tail_m F on mirabolic points, and `indV_sum` pushes indV through the sum; PhiPlus
turns indV∘indR_i into indR_i at level m+1 and DerTail replaces der_i(tail_m F) by der_i F (i < m ≤ m+1).
**MirInd** (exact): i ≤ k, ρ class function on GL_i, h ∈ GL_k ⇒ indR_i^{k+1}(ρ)(diag1 h) = hc_{i,k−i}(ρ, gg_{k−i})(h).
*Proof (650 verbatim lines).* Unfold indR as an average over mirabolic y; each term equals
fR(ψ,i,ρ)(t⁻¹ h t) with t the top-left block of y (`fR_conj_diag1`), the sum over mirabolic y factors as
|U|·Σ_{t ∈ GL_k} (`sum_mir`), the normaliser counts are given by `card_inR_succ`, and `stages` identifies the
resulting average of fR with hc(ρ, gg). The block-parabolic/unitriangular subgroup facts and their cardinalities are
the single upstream dependency BlockPar.

## 6. Checks, overlap, reproduction, build, ledger
**Exact finite checks** (`RUN6_green_exact_checks.py`, exact Fractions, exhaustive; illustrations, not proofs):
(E) LogConv with m defined by its recursion for q ∈ {2,3,7} over F_2 (deg ≤ 4) and F_3 (deg ≤ 3), s ∈ {natDegree,
mult. of root 0, mult. of root 1, Ω}: 0 mismatches. A deliberately wrong L (dropping the −1) gives 7–14 mismatches
per case (negative control, run once, not committed). (F) leaf VonMangoldtOne first clause s = Λ_s ∗ 1: F_2 deg ≤ 5,
F_3 deg ≤ 3, F_5 deg ≤ 2: 0 mismatches. (G) leaf FinComm comm/assoc/additivity on fixed integer test functions:
0 mismatches. CycSum and MassCyc were already checked exhaustively in RUN5 (B, C). No finite check for DerClass,
MirConj, MirInd (they need the Whittaker machinery on GL_n(F_g)).

**Overlap.** Head of `newtons-cathedral` re-fetched twice before pushing (last: `43c78f92eb`, 10:34 GMT). Commits after RUN5 (`8298f23`): an RH-structure scheduling benchmark, native_family_existence run 8, RH theta run 4, galois_rows RUN6 / covolume_premises RUN2, a Weil–Deligne reconstruction, and one commit in this lane's directory by another worker: `e53a195` (LEAVES_I_PN), which closes the RUN1 leaves `T.monicIrreducible_inject_regularCharacterOrbits` and `T.ncard_monic_natDegree_coeff_zero_ne_zero` in its own files (`LEAVES_I_PN_*`). Those declarations and files are disjoint from this run's; nothing of it is overwritten. This run only adds files.

**Workspace hygiene.** Before building, the RUN1–RUN5 companion files in `/workspace/rh_green_lean/GreenCompanion/`
(LabelDefs, GGNorm, SumWhGG, CuspGLRun4, Run5, Exhaustion, GenericCount, MackeyCusp, RootSumCore) were compared
byte-for-byte (sha1) with the committed versions at `8298f23`: all identical. `lakefile.toml` unchanged. This lane
writes only inside `GreenCompanion/` (and its own work dir); the shared Mathlib cache was only read.

**Reproduction.** RUN3/RUN4/RUN5 bundles as before; then `RUN6_scripts_bundle.py` → `RUN6_mk_run6.py`,
`RUN6_green_exact_checks.py`; `python3 RUN6_mk_run6.py` → `GreenCompanion/Run6.lean`;
`OMP_NUM_THREADS=1 nice lake build GreenCompanion.Run6`.

**Build log.** Two runs. (i) `lake build GreenCompanion.Run6`: compiled Run6 (olean written 10:27:56 GMT); that lake process died before flushing its log (another worker's builds were using most of the RAM), so the build was re-run: it replayed the stored compile messages (source hash unchanged) and ended `Build completed successfully (8712 jobs).` (ii) To have first-hand output, a fresh elaboration `lake env lean GreenCompanion/Run6.lean` was run: exit 0 in 25 s, 0 errors, 19 `#print axioms` lines, all `[propext, Classical.choice, Quot.sound]`:
```
'GreenCompanion.CuspGL.finsum_card_cyclic_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.CuspGL.mass_card_cyclic' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.CuspGL.mass_eq_mass_pi_of_invariant' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.CuspGL.LogDeriv.additive_mul_eq_conv' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.GLm.DerClass.isClass_der' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.cycSumPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.massCycPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.massEqPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.logConvPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.muRecPart_of_parMass' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.massPart_of_leaves6' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.derClassPart_holds' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.sumWhGGPart_of_leaves6' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.GLm.MirSum.eq_sum_indR_der' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.GLm.indR_diag1_eq_hc_gg' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.mirConjPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.mirIndPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.mirPart_of_leaves6' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.sumWhGGPart_of_leaves6'' depends on axioms: [propext, Classical.choice, Quot.sound]
EXIT 0 secs 25
```
Warnings: linter only (unused simp args, "Try this", 20× "automatically included section variable unused" for the `include`d carrier instance in helper lemmas that do not need it, 2 deprecations). `sorry` occurs only in the header comment "No sorry, no axiom".

| upstream path | upstream blob (contents API) | local `git hash-object` |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/FinsumCardCyclicVectorsInvariantSubspaces.lean` | `c82e7a090331331acd982ec829baca9bb9a39f34` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassOfCharpolyCardCyclicVectors.lean` | `77109f632ccfa58750e6e19087b29817d6640fdd` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassEqOfLinearEquivInvariant.lean` | `e6d3d969be24713aebd5f31293d86ddcc9163802` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/AdditiveMulEqVonMangoldtConvolution.lean` | `54145f3b47f95867f2e3d10dee5ae805657362c1` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/MonicFactorizationConvolutionFiniteCommAssocAddStatement.lean` | `5509f00ef46b76b4ee5fecae9f4f16e3a7ba7736` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/AdditiveEqPolynomialVonMangoldtConvolutionOneStatement.lean` | `5de41079385272b1cd1354f1bec62bc678cb74f1` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsClassFunctionBernsteinZelevinskyDerivative.lean` | `710652cfc51a38d7dfcbfdc07f697f400051235c` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicConjInvariantEqSumInducedDerivatives.lean` | `b291ba3213822f8213ca27a83193ed5f078151b9` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicInductionBlockDiagEqHarishChandraGelfan.lean` | `7b5eff59370f6e6b65053c0adb0e67c0da33da3d` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicFunctionEqInducedDerivativeAddTailStatement.lean` | `5c6a391a94586e987f01733001c6dfdd944b85dc` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MirabolicInductionPhiPlusInductionFromBlockUniStatement.lean` | `d8be86ecd37d58508030c6db9487c31158dee60b` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/DerTailStatement.lean` | `52f4c3f8a394e2301dfb2382d7846f1e550178a5` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsMirabolicConjInvariantTwistedTailMeanFunStatement.lean` | `bef2b4e8abdc806a5bf1aeffdda3a41b54a9d20f` | match |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/BlockParabolicUnitriangularSubgroupsGLnPrimeFielStatement.lean` | `c36e545dd56b40e14729b9647fb515e2afe8ef39` | match |
| `src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsMirClass.lean` | `6e0a7381eed375d76591a759d4913378dc6be596` | match |

## 7. Exact-check output
```
(E) p=2 deg<=4 q=2 s=natDegree: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=2 s=mult root 0: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=2 s=mult root 1: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=2 s=Omega: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=3 s=natDegree: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=3 s=mult root 0: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=3 s=mult root 1: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=3 s=Omega: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=7 s=natDegree: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=7 s=mult root 0: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=7 s=mult root 1: 31 monic P, mismatches = 0
(E) p=2 deg<=4 q=7 s=Omega: 31 monic P, mismatches = 0
(E) p=3 deg<=3 q=2 s=natDegree: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=2 s=mult root 0: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=2 s=mult root 1: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=2 s=Omega: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=3 s=natDegree: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=3 s=mult root 0: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=3 s=mult root 1: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=3 s=Omega: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=7 s=natDegree: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=7 s=mult root 0: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=7 s=mult root 1: 40 monic P, mismatches = 0
(E) p=3 deg<=3 q=7 s=Omega: 40 monic P, mismatches = 0
(F) p=2 deg<=5 s=natDegree: 63 monic P, mismatches = 0
(F) p=2 deg<=5 s=mult root 0: 63 monic P, mismatches = 0
(F) p=2 deg<=5 s=mult root 1: 63 monic P, mismatches = 0
(F) p=2 deg<=5 s=Omega: 63 monic P, mismatches = 0
(F) p=3 deg<=3 s=natDegree: 40 monic P, mismatches = 0
(F) p=3 deg<=3 s=mult root 0: 40 monic P, mismatches = 0
(F) p=3 deg<=3 s=mult root 1: 40 monic P, mismatches = 0
(F) p=3 deg<=3 s=Omega: 40 monic P, mismatches = 0
(F) p=5 deg<=2 s=natDegree: 31 monic P, mismatches = 0
(F) p=5 deg<=2 s=mult root 0: 31 monic P, mismatches = 0
(F) p=5 deg<=2 s=mult root 1: 31 monic P, mismatches = 0
(F) p=5 deg<=2 s=Omega: 31 monic P, mismatches = 0
(G) p=2 deg<=4: 31 monic P x 4 identities, mismatches = 0
(G) p=3 deg<=3: 40 monic P x 4 identities, mismatches = 0
EXIT 0
```

