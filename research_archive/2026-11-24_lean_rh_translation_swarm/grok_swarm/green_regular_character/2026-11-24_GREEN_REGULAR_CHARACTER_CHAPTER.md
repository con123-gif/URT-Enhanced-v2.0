# Green regular-character theorem — reconstruction chapter (Grok specialist lane)

**Lane:** `grok_swarm/green_regular_character/` (claimed by this file; Galois rows, native family existence and Lean validation/kernel extraction are other Grok lanes and are not touched here).
**Date:** 2026-11-24. **Agent:** Grok. **Upstream:** `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
**Status:** PARTIAL. Two layers are reconstructed in prose and **typechecked in Lean** (conditional on named upstream dependencies): the exhaustion argument `GlobalTheory.greenRegularCharacters_holds` and the label bridge `GlobalTheory.GreenBridge.green_of_regular`. The deep inputs (existence of the cuspidal family, the Gelfand–Graev/Harish-Chandra count) are listed as remaining dependencies and are **not** reconstructed here. No gate closed; RH reconstruction remains OPEN. URT was not used as a premise or as evidence of anything.

---

## 0. Correction to the earlier framing (important for the manuscript)

`math/2026-11-24_finite_character_induced_parameter_proof.md` §2 says "Keep the Green theorem itself as a named imported obligation". At the pinned revision it is **not an imported literature axiom on the RH path**:

| step | exact source (pin 40e56bab) | blob |
|---|---|---|
| literature wrapper ignores `O` | `UpperTheory.LiteratureTheorems.green_regular_characters_of_literature (O) := PositivityTheory.Stage1.PM.greenRegularCharacters` (EveryCharacterOfLiteratureOfVWin.lean:399–400) | a13ba1f8 |
| record field | `published_results_eigen O` sets `greenRegularCharacters := green_regular_characters_of_literature O` (same file :694) | a13ba1f8 |
| standard statement | `PositivityTheory.Stage1.PM.greenRegularCharacters := GlobalTheory.T.greenCuspidalCharsByRegularChars_proof` (StandardTheoremStatements/GreenRegularCharacters.lean) | 5b5cf915 |
| statement wrapper | `GlobalTheory.T.greenCuspidalCharsByRegularChars_proof := GlobalTheory.greenRegularCharacters_holds` (GreenCuspidalCharsByRegularCharsProofStatement.lean) | 4d4dbc49 |
| **native proof** | `GlobalTheory.greenRegularCharacters_holds` (GreenCuspidalCharsByRegularCharsProof.lean) | 8b77636f |
| bridge to `GLq.Green` | `GlobalTheory.GreenBridge.green_of_regular` (InertiaEigenvalues/SumRangeEqRoots.lean:226) | 43bfabf7 |

The proposition is consumed twice on the RH path:
1. **Character-box adapter** `every_character_of_theta_integrals_local_matching`: `every_character_of_green_v_win (GreenBridge.green_of_regular P.greenRegularCharacters) hV (...)`; inside TopPlug.lean (c51cb6b5) `hG` is used only through `shape_closed_link_n_of_green hG`.
2. **Covolume producer** `topCovolSlim2_use_alt_alt` (ThirdPlaceSeries/TopCovolSlim2Use.lean:18, blob 0e1bad41): `HypothesesX := ⟨hK, hN, GreenBridge.green_of_regular GlobalTheory.greenRegularCharacters_holds, hSep, …⟩`.

Separate sibling (not reconstructed here, listed for the editor): the record field `greenCuspidal := PositivityTheory.Stage1.PM.greenCuspidal`, proved natively as `PositivityTheory.GreenCharacters.green : GlobalTheory.GLq.Green` from `GreenAll.cuspParam_all` (FiniteTypeHarishChandra/GreenCuspLabels/GreenCuspidal.lean, blob 20c4f3e8). It is a **second, independent** proof of the same `GLq.Green` proposition; it feeds `greenCuspidal` and `green_series_st_of_literature`.

## 1. Exact statements (quantifiers and exceptional cases preserved)

Notation: `g` prime, `Gn g d = GL_d(Z/g)`, `Mt g d` = d×d matrices over Z/g, `Pc g = Σ d, (Gn g d → ℂ)` (a degree tagged class-function candidate).

* `IsPrimeLab d P` :⇔ P monic ∧ P irreducible ∧ P(0) ≠ 0 ∧ deg P = d. (Excludes P = X; forces d > 0.)
* `IsRegularChar g d θ` (θ : K× →* ℂ×) :⇔ ∀ i j < d, θ^(g^i) = θ^(g^j) → i = j.
* `IsCusp χ` (verbatim, LabelDatum.lean blob 8b45fadb): 0 < d ∧ χ is the character of a simple `FDRep ℂ (Gn g d)` ∧ ∀ a, 0 < a < d → `res a (d−a) χ 1 1 = 0`, i.e. Σ over block-upper-unitriangular x (diagonal blocks a, d−a both identity) of χ(x) is 0.

**`GlobalTheory.Published.GreenRegularCharacters`** (blob 29f45aba): for every prime g, every d > 0 and every field K with Z/g-algebra structure and finrank_{Z/g} K = d, there is τ : Hom(K×, ℂ×) → (Gn g d → ℂ) with
(i) for every regular θ: `IsCusp (τ θ)`; τθ(1) = ∏_{i=1}^{d−1}(g^i − 1); and for every y with irreducible characteristic polynomial and every z ∈ K× that is a root of it, τθ(y) = (−1)^{d−1} Σ_{i<d} θ(z^{g^i});
(ii) for regular θ, θ': τθ = τθ' ⇔ ∃ i < d, θ' = θ^{g^i};
(iii) every χ with `IsCusp χ` equals τθ for some regular θ.

**`GlobalTheory.GLq.Green`** (LabelDatum.lean): for every prime g, every `L : LabelDatum g` (Teichmüller-type injective `teich : F̄_g →* ℂ` on nonzero elements, and compatible generators `gen d` of order g^d − 1) and every d > 0, there is τ : (Z/g)[X] → (Gn g d → ℂ) with: for every IsPrimeLab-d P, `IsCuspOf L P (τ P)` (P prime label, τP cuspidal, and τP(y) = (−1)^{d−1} Σ_{i<d} thetaOf L d x (z^{g^i}) for every root x of P, every y with irreducible charpoly and every root z of that charpoly in F̄_g) and τP(1) = ∏_{i=1}^{d−1}(g^i−1); τ injective on prime labels of degree d; every cuspidal χ is τP for some prime label P of degree d.

## 2. Theorem A — exhaustion (`GlobalTheory.greenRegularCharacters_holds`)

**Inputs (exact upstream names and statements; stated verbatim as `ExistsPart`, `InjectPart`, `CardPart`, `PolyPart` in `companion/GreenCompanion/Exhaustion.lean`):**
* E = `GlobalTheory.T.exists_cuspidalCharacter_of_regularCharacter_GLn` (:= `GlobalTheory.GreenRegular.exists_cusp_of_regular`): clauses (i),(ii) above.
* I = `GlobalTheory.T.monicIrreducible_inject_regularCharacterOrbits` (:= `GlobalTheory.PrimeLabOrbit.primeLab_to_regularChar`): for d>0, finrank K = d, there is c : (Z/g)[X] → Hom(K×,ℂ×) sending each prime label of degree d to a regular character, such that c(P') ∈ Frobenius orbit of c(P) forces P = P'.
* C = `GlobalTheory.T.card_cuspidal_multisets_total_degree_le` (:= `GlobalTheory.GLq.CuspMultisetCount.card_le`): for n>0, any finite set S of multisets of tagged cuspidal characters, all of total degree n, has |S| ≤ g^n − g^{n−1}.
* Pn = `GlobalTheory.T.ncard_monic_natDegree_coeff_zero_ne_zero` (:= `GlobalTheory.GrPolys.card_monic_coeff_zero_ne_zero`): the set T_n of monic degree-n f with f(0) ≠ 0 is finite with exactly g^n − g^{n−1} elements.

**Proof.** Fix g, d>0, K with finrank d. Take τ from E; clauses (i),(ii) are E verbatim, so only (iii) needs proof.

*Step 1 (label families in every degree; lemma `family`).* For each e>0 choose a field of degree e (K itself if e = d, `GaloisField g e` otherwise), a family τ_e from E and c_e from I, and put L_e(P) := τ_e(c_e(P)). Then for prime labels of degree e: L_e(P) is cuspidal (E(i) at the regular character c_e(P)); and L_e is injective, because L_e(P) = L_e(P') gives, by E(ii), c_e(P') = c_e(P)^{g^i} for some i<e, hence P = P' by I. For e = d, every L_d(P) is of the form τ θ with θ regular. For e = 0 there are no prime labels (IsPrimeLab forces positive degree), so any L_0 works. (Exceptional case kept: the degree-e families are needed for **all** e ≤ d, because the irreducible factors of a degree-d polynomial have smaller degrees.)

*Step 2 (counting; lemma `count`).* Suppose χ is cuspidal on Gn g d and χ ≠ τθ for all regular θ; then χ ≠ L_d(P) for all prime labels P of degree d. Define φ(P) := ⟨deg P, L_{deg P}(P)⟩ ∈ Pc g; φ is injective on prime labels (equal tags force equal degrees, then injectivity of L_e). For f ∈ T_d define F(f) := multiset of φ(P) over the monic irreducible factors P of f (with multiplicity). Each factor is a prime label (P(0) ≠ 0 because X ∤ f; monic after normalisation). F is injective on T_d: applying a left inverse ψ of φ recovers the factor multiset and its product is f (unique factorisation, f monic). Every F(f) has total degree d and cuspidal entries. The singleton {⟨d, χ⟩} is not in F(T_d): if it were F(f), then f would have a single factor P = f of degree d with L_d(P) = χ, contrary to assumption. So S := {⟨d,χ⟩} ∪ F(T_d) consists of multisets of cuspidal tags of total degree d, and |S| = (g^d − g^{d−1}) + 1 by Pn and injectivity, contradicting C. ∎

**Shared mechanism (derived once, reused).** "Injective labelled-multiset count against an upper bound": an injection of a set of known size N into a set of size ≤ N, plus one extra element outside its image, is contradictory. It is used (a) here, with labels = prime polynomials and bound C; and (b) inside C itself (`CuspMultisetCount.card_le`): each cuspidal multiset M is sent to a generic irreducible constituent ρ_M of its Harish-Chandra product `hcL M.toList n` (`exists_generic_constituent_harishChandra_cuspidal`); M ↦ ρ_M is injective because a common constituent forces ⟨hcL M, hcL M'⟩ ≠ 0 (`Label.ip_ne_zero_of_common`), which by the Mackey/cuspidal orthogonality `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp` forces M' to be a permutation of M; and the number of generic irreducibles is ≤ g^n − g^{n−1} (`ncard_generic_irreducible_characters_GLn_le` := `GlobalTheory.GLq.card_generic_irr_le`, the Gelfand–Graev bound). Step (b) is source-read, not re-proved here.

## 3. Theorem B — the label bridge (`GlobalTheory.GreenBridge.green_of_regular`)

**Claim.** `GreenRegularCharacters → GLq.Green`. Input only: the hypothesis hG plus elementary finite-field lemmas (all copied into the companion and typechecked: `GreenExists.pow_eq_self_iff`, `GreenExists.rootsBar_eq`, `FixedMemRange.fixed_mem_range`, `GLq.Model.thetaOf_gen_pow`).

**Proof.** Fix g, a label datum L, d>0. Apply hG to K = GaloisField g d, with embedding emb : K → F̄_g; get τG with (i)–(iii).
1. *Characters from roots of unity.* Since L.gen d has order g^d − 1 and lies in emb(K) (fixed by Frobenius^d), there is a generator u of K× with emb u = L.gen d. For x ∈ F̄_g with x^{g^d−1} = 1 define the character th(x) of K× by u ↦ teich(x). Then th(x)(k) = thetaOf L d x (emb k) for all k; th is injective (teich injective on nonzero elements), surjective onto Hom(K×,ℂ×) (teich(gen d) is a primitive (g^d−1)-th root of unity), and Frobenius-equivariant: th(x^m) = th(x)^m.
2. *Regular ⇔ full degree.* th(x) is regular iff x, x^g, …, x^{g^{d−1}} are distinct.
3. *Definition.* τ_L(P) := τG(th(rootOf P)), rootOf P a chosen root of P in F̄_g. For a prime label P of degree d, rootOf P has exactly d distinct conjugates (pow_eq_self_iff), so th(rootOf P) is regular.
4. *Cuspidality, degree and the character formula.* Cuspidality and τ(1) come from (i). For y with irreducible f = charpoly(y): f(0) ≠ 0 since det y ≠ 0, so f is a prime label of degree d; a root z ∈ F̄_g lifts to k ∈ K× (fixed_mem_range). (i) gives τ_L(P)(y) = (−1)^{d−1} Σ_i thetaOf(x0, z^{g^i}) with x0 = rootOf P. Any other root x of P is x0^{g^j}; using thetaOf(x0^{g^j}, w) = thetaOf(x0, w^{g^j}) and the fact that z ↦ z^{g^j} permutes the d roots of f (rootsBar_eq, sum_range_eq_roots), the sum is the same for every root x of P — exactly the `IsCuspOf` formula "for all x ∈ rootsBar P".
5. *Injectivity.* τ_L(P) = τ_L(P') ⇒ by (ii) th(rootOf P') = th(rootOf P)^{g^i} = th((rootOf P)^{g^i}) ⇒ rootOf P' = (rootOf P)^{g^i}, a root of P ⇒ P and P' are both the minimal polynomial of rootOf P' ⇒ P = P'.
6. *Exhaustion.* For cuspidal χ, (iii) gives χ = τG(θ), θ regular; θ = th(x) by surjectivity; P := minpoly x has degree dividing d, and degree < d would contradict regularity (take i = deg P, j = 0); so P is a prime label of degree d (P(0) ≠ 0 as x ≠ 0). rootOf P = x^{g^j} for some j<d, hence by (ii) τG(th x) = τG(th(rootOf P)) = τ_L(P). ∎

## 4. Exceptional cases explicitly preserved
* d>0 everywhere; IsPrimeLab excludes P = X (corresponds to 0 ∉ K×) and degree-0 labels (the e = 0 branch in Step 1).
* d = 1: every character is regular, the degree product over Ico 1 1 is empty (= 1), sign (−1)^0. g = 2, d = 1: K× is trivial; one regular character, one prime label X+1.
* The value formula in (i) is asserted **only** for y with irreducible characteristic polynomial; no value is claimed elsewhere.
* Equality in (ii) is up to Frobenius powers i < d only; the four exceptional (g,n) Pin pairs of `PairCheckThreeTwo.lean` are already handled in `math/2026-11-24_finite_character_induced_parameter_proof.md` and are reused, not redone.

## 5. Remaining dependencies (exact names; NOT reconstructed here)
1. `GlobalTheory.GreenRegular.exists_cusp_of_regular` (ExistsCuspidalCharacterOfRegularCharacterGLn.lean, blob 44708e05). Construction read: τθ(x) := (−1)^{d−1}·`psi (rootSum θ₀ k) (Fin d → Z/g) (toLin' x)` with θ₀ from `GlobalTheory.T.exists_teichmuller_map_algebraicClosure_finiteField`, θ = λ^k. Its sub-dependencies: `GlobalTheory.ParamLabel.isCusp_psi` → **`GlobalTheory.T.isCharacter_cuspidal_rootSum_regular`** (genuine character + cuspidality: the true representation-theoretic core), `GlobalTheory.T.rootPowerSumCharacter_additive_and_X_sub_one_pow`, `GlobalTheory.T.invariantSubspaceMobiusInverse_one_prod_Ico`, `…_charpoly_of_irreducible` (InvariantSubspaceMobiusInverseCharpolyOfIrreduciStatement), `…LinearEqui…`, `IsPrimitiveEndClassFunctionInvariantSubspaceMobi…`, `InvertibleEndInnerProductRootPowerSumMobius…`, `PrimitiveClassFunctionExpansionRootSums…`.
2. `GlobalTheory.PrimeLabOrbit.primeLab_to_regularChar` (blob 4a7a4f26) — elementary field theory (AdjoinRoot, Frobenius).
3. `GlobalTheory.GLq.CuspMultisetCount.card_le` (blob 906eccd3) with: `GlobalTheory.gl_list_product_perm_char`, `Label.isChar_of_isIrr`, `Label.ip_ne_zero_of_common`, `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp`, `GlobalTheory.GLq.irr_finite_and_finsum_zOf_eq_one`, `GlobalTheory.GLq.GenericConstituent.exists_generic_constituent`, `GlobalTheory.GLq.card_generic_irr_le` (names as written in source; namespace resolution through `open` not machine-checked).
4. `GlobalTheory.GrPolys.card_monic_coeff_zero_ne_zero` (blob f7e73d9d) — elementary.
5. Downstream consumer not in this lane: `UpperTheory.Top.shape_closed_link_n_of_green`, `GlobalTheory.CovTop.HypothesesX` use in `topCovolG_alt_alt`.

## 6. Validation evidence (actually executed, on the shared Grok box — not CI)
* **Lean** (Appendix A): Lean 4.33.1 + Mathlib `0df444a3…` (both equal to the upstream pins). `companion/GreenCompanion/Exhaustion.lean` builds (`lake build`, exit 0); `companion/GreenCompanion/Bridge.lean` elaborates (exit 0, 0 errors, 6 style-linter warnings). `#print axioms` for `greenRegularCharacters_of_parts`, `greenRegularCharacters_holds_of_deps`, `green_of_regular`, `green_of_deps`: only `propext, Classical.choice, Quot.sound`. No `sorry`.
  *What this certifies:* the exact upstream propositions `GreenRegularCharacters` and `GLq.Green` (with verbatim `IsCusp`, `IsCuspOf`, `LabelDatum`, `thetaOf`, `rootsBar`, restated) follow from the four dependency statements E, I, C, Pn of §2, by the proofs of §2–3. *What it does not certify:* E, I, C, Pn themselves; that my restated definitions are definitionally the upstream constants (they are textual copies; equality with upstream constants needs the 105 GB environment — handed to the lean_validation lane).
* **Exact finite checks** (`green_exact_checks.py` → output in Appendix C, 160 `ok`, 0 failures, integer/cyclotomic arithmetic only): (A) |T_n| = g^n − g^{n−1} for g∈{2,3,5}, n ≤ 7/5/3; (B) prime-label multisets of total degree n ↔ T_n bijectively (the injection F of Step 2 is onto in these cases); (C) #regular Frobenius orbits of characters of F_{g^d}^× = #IsPrimeLab d for g∈{2,3,5,7} (the bijection behind Theorem B); (D) GL_2(F_q), q∈{2,3,5}: the standard cuspidal class functions have norm 1, satisfy the Lean `IsCusp` radical-sum condition, fibre exactly over Frobenius orbits {θ, θ^q}, and number (q²−q)/2 = #IsPrimeLab 2. (D) uses the textbook GL_2 formula as an instance; it is a consistency check of the statement, not a proof of E.
* Source integrity: Appendix B — 16 upstream files, git blob hashes of the fetched raw files equal the pinned tree entries (MATCH ×16).

## 7. RESUME HERE
Next executable task (this lane): reconstruct `GlobalTheory.GLq.card_generic_irr_le` (Gelfand–Graev multiplicity-one ⇒ #generic irreducibles ≤ ⟨Γ,Γ⟩ = (g−1)g^{n−1}) and `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp` from the pinned source, with the same generic-companion technique (fetch via raw URLs at the pin; Mathlib cache already on the box at /workspace/rh_green_lean). Then `GlobalTheory.T.isCharacter_cuspidal_rootSum_regular`.
HANDOFF TO: integration/editor (replace "Green = imported obligation" by §0 table), lean_validation (check restated defs against upstream constants when the environment exists), audit.


---
## Appendix A — Lean execution log (verbatim)
```
# Lean execution log — Green regular-character companions
date: 2026-11-24 09:35 GMT (box clock, Europe/London)
host: Grok Bot shared Linux box (NOT GitHub CI; CI does not run these files)
toolchain: Lean (version 4.33.1, x86_64-unknown-linux-gnu, commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6, Release)  (= upstream lean-toolchain leanprover/lean4:v4.33.1)
mathlib rev: 0df444a360eaa60ab8c11dca51a86af692955474  (= upstream lake-manifest mathlib rev at pin 40e56bab)
mathlib oleans obtained with: lake exe cache get (8690 files)
project files: companion/lakefile.toml, companion/lean-toolchain
sha256 GreenCompanion/Exhaustion.lean: e9954f452e1afb0005a09f629fca1df8ac5e67c51035e132c42751b29f95b96b
sha256 GreenCompanion/Bridge.lean: 7ffa1ee9e92961073f06156b6133790ef56df17f1ce871e61397d49a6ce20288

## 1. lake build GreenCompanion.Exhaustion
ℹ [8706/8706] Replayed GreenCompanion.Exhaustion
info: GreenCompanion/Exhaustion.lean:263:0: 'GreenCompanion.greenRegularCharacters_of_parts' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Exhaustion.lean:264:0: 'GreenCompanion.greenRegularCharacters_holds_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
Build completed successfully (8706 jobs).
exit=0

## 2. lake env lean GreenCompanion/Bridge.lean (warnings are style linters only; errors: none)
warning count: 6
error count: 0
'GreenCompanion.green_of_regular' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.green_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
exit=0

No sorry, no custom axiom: #print axioms lists only propext, Classical.choice, Quot.sound.
```
Note: `Bridge.lean` was generated on the box by splicing the upstream bodies listed in its header (substitutions listed there); the generator script is not committed, the generated file is.

## Appendix B — upstream source blob ledger (git hash-object of fetched raw file vs pinned tree)
```
MATCH 29f45abaede98aeedba97d251365e44642e43da9 src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/GreenRegularCharacters.lean
MATCH 8b77636fe17dd07c59e7b76bc1234be319b82395 src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProof.lean
MATCH 4d4dbc49de0b8bdb1950f53020b651b82654c67c src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProofStatement.lean
MATCH 43bfabf774390d458113554018e3b2ac965e10fa src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/SumRangeEqRoots.lean
MATCH 44708e05b945f485c7886dfe1008cc0b32ffb3e2 src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsCuspidalCharacterOfRegularCharacterGLn.lean
MATCH 4a7a4f2697c70ed8b9dca766c508add55cd8847f src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/MonicIrreducibleInjectRegularCharacterOrbits.lean
MATCH 906eccd344cbb39bbcdc227f9497ee606256eb0a src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/CardCuspidalMultisetsTotalDegreeLe.lean
MATCH f7e73d9dcf231dbddecd0f4a50f9218cc72bf610 src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NcardMonicNatDegreeCoeffZeroNeZero.lean
MATCH 8b45fadba6baf9bf7bb49b9c18dac0fb497f00ff src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean
MATCH 5b5cf915ed0b9e38e6e81450657ed8c903a75163 src/Development/WeilBound/CoreStatements/StandardPublishedResults/StandardTheoremStatements/GreenRegularCharacters.lean
MATCH 20c4f3e8cd239dd447a44e8b2d2f3a6c6cc75e55 src/Development/WeilBound/CoreStatements/FiniteTypeHarishChandra/GreenCuspLabels/GreenCuspidal.lean
MATCH 121d07c44fde301e5a836b20a1d52cca0ab2196c src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/GreenCuspidalIff.lean
MATCH 635e4da718e3ad98e5b5a4bae5573419ab979bd5 src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GreenCuspidalCharIsCuspidalOfMinpolyOfParam.lean
MATCH c51cb6b5bd4bf2944ace89e00a2990da16bd519a src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean
MATCH 0e1bad41f4b165c0d9b1693f419530309e1da5ba src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean
MATCH a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean
```

## Appendix C — `python3 green_exact_checks.py` output (verbatim, exit 0)
```
ok   (A) g=2 n=1: #monic deg n with f(0)!=0 = 1 = g^n-g^(n-1)
ok   (B) g=2 n=1: multisets of prime labels of total degree n <-> T bijectively (1 multisets)
ok   (A) g=2 n=2: #monic deg n with f(0)!=0 = 2 = g^n-g^(n-1)
ok   (B) g=2 n=2: multisets of prime labels of total degree n <-> T bijectively (2 multisets)
ok   (A) g=2 n=3: #monic deg n with f(0)!=0 = 4 = g^n-g^(n-1)
ok   (B) g=2 n=3: multisets of prime labels of total degree n <-> T bijectively (4 multisets)
ok   (A) g=2 n=4: #monic deg n with f(0)!=0 = 8 = g^n-g^(n-1)
ok   (B) g=2 n=4: multisets of prime labels of total degree n <-> T bijectively (8 multisets)
ok   (A) g=2 n=5: #monic deg n with f(0)!=0 = 16 = g^n-g^(n-1)
ok   (B) g=2 n=5: multisets of prime labels of total degree n <-> T bijectively (16 multisets)
ok   (A) g=2 n=6: #monic deg n with f(0)!=0 = 32 = g^n-g^(n-1)
ok   (B) g=2 n=6: multisets of prime labels of total degree n <-> T bijectively (32 multisets)
ok   (A) g=2 n=7: #monic deg n with f(0)!=0 = 64 = g^n-g^(n-1)
ok   (B) g=2 n=7: multisets of prime labels of total degree n <-> T bijectively (64 multisets)
ok   (A) g=3 n=1: #monic deg n with f(0)!=0 = 2 = g^n-g^(n-1)
ok   (B) g=3 n=1: multisets of prime labels of total degree n <-> T bijectively (2 multisets)
ok   (A) g=3 n=2: #monic deg n with f(0)!=0 = 6 = g^n-g^(n-1)
ok   (B) g=3 n=2: multisets of prime labels of total degree n <-> T bijectively (6 multisets)
ok   (A) g=3 n=3: #monic deg n with f(0)!=0 = 18 = g^n-g^(n-1)
ok   (B) g=3 n=3: multisets of prime labels of total degree n <-> T bijectively (18 multisets)
ok   (A) g=3 n=4: #monic deg n with f(0)!=0 = 54 = g^n-g^(n-1)
ok   (B) g=3 n=4: multisets of prime labels of total degree n <-> T bijectively (54 multisets)
ok   (A) g=3 n=5: #monic deg n with f(0)!=0 = 162 = g^n-g^(n-1)
ok   (B) g=3 n=5: multisets of prime labels of total degree n <-> T bijectively (162 multisets)
ok   (A) g=5 n=1: #monic deg n with f(0)!=0 = 4 = g^n-g^(n-1)
ok   (B) g=5 n=1: multisets of prime labels of total degree n <-> T bijectively (4 multisets)
ok   (A) g=5 n=2: #monic deg n with f(0)!=0 = 20 = g^n-g^(n-1)
ok   (B) g=5 n=2: multisets of prime labels of total degree n <-> T bijectively (20 multisets)
ok   (A) g=5 n=3: #monic deg n with f(0)!=0 = 100 = g^n-g^(n-1)
ok   (B) g=5 n=3: multisets of prime labels of total degree n <-> T bijectively (100 multisets)
ok   (C) g=2 d=1: #regular orbits=1 = #IsPrimeLab d (enumeration)=1
ok   (C') g=2 d=1: every regular orbit has exactly d elements
ok   (C) g=2 d=2: #regular orbits=1 = #IsPrimeLab d (enumeration)=1
ok   (C') g=2 d=2: every regular orbit has exactly d elements
ok   (C) g=2 d=3: #regular orbits=2 = #IsPrimeLab d (enumeration)=2
ok   (C') g=2 d=3: every regular orbit has exactly d elements
ok   (C) g=2 d=4: #regular orbits=3 = #IsPrimeLab d (enumeration)=3
ok   (C') g=2 d=4: every regular orbit has exactly d elements
ok   (C) g=2 d=5: #regular orbits=6 = #IsPrimeLab d (enumeration)=6
ok   (C') g=2 d=5: every regular orbit has exactly d elements
ok   (C) g=2 d=6: #regular orbits=9 = #IsPrimeLab d (enumeration)=9
ok   (C') g=2 d=6: every regular orbit has exactly d elements
ok   (C) g=2 d=7: #regular orbits=18 = #IsPrimeLab d (enumeration)=18
ok   (C') g=2 d=7: every regular orbit has exactly d elements
ok   (C) g=2 d=8: #regular orbits=30 = #IsPrimeLab d (enumeration)=30
ok   (C') g=2 d=8: every regular orbit has exactly d elements
ok   (C) g=3 d=1: #regular orbits=2 = #IsPrimeLab d (enumeration)=2
ok   (C') g=3 d=1: every regular orbit has exactly d elements
ok   (C) g=3 d=2: #regular orbits=3 = #IsPrimeLab d (enumeration)=3
ok   (C') g=3 d=2: every regular orbit has exactly d elements
ok   (C) g=3 d=3: #regular orbits=8 = #IsPrimeLab d (enumeration)=8
ok   (C') g=3 d=3: every regular orbit has exactly d elements
ok   (C) g=3 d=4: #regular orbits=18 = #IsPrimeLab d (enumeration)=18
ok   (C') g=3 d=4: every regular orbit has exactly d elements
ok   (C) g=3 d=5: #regular orbits=48 = #IsPrimeLab d (enumeration)=48
ok   (C') g=3 d=5: every regular orbit has exactly d elements
ok   (C) g=5 d=1: #regular orbits=4 = #IsPrimeLab d (enumeration)=4
ok   (C') g=5 d=1: every regular orbit has exactly d elements
ok   (C) g=5 d=2: #regular orbits=10 = #IsPrimeLab d (enumeration)=10
ok   (C') g=5 d=2: every regular orbit has exactly d elements
ok   (C) g=5 d=3: #regular orbits=40 = #IsPrimeLab d (enumeration)=40
ok   (C') g=5 d=3: every regular orbit has exactly d elements
ok   (C) g=5 d=4: #regular orbits=150 = #IsPrimeLab d (Gauss formula)=150
ok   (C') g=5 d=4: every regular orbit has exactly d elements
ok   (C) g=7 d=1: #regular orbits=6 = #IsPrimeLab d (enumeration)=6
ok   (C') g=7 d=1: every regular orbit has exactly d elements
ok   (C) g=7 d=2: #regular orbits=21 = #IsPrimeLab d (enumeration)=21
ok   (C') g=7 d=2: every regular orbit has exactly d elements
ok   (C) g=7 d=3: #regular orbits=112 = #IsPrimeLab d (Gauss formula)=112
ok   (C') g=7 d=3: every regular orbit has exactly d elements
ok   (D) q=2 k=1: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=2 k=1: sum |tau|^2 = |G| = 6 (norm 1)
ok   (D) q=2 k=1: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=2 k=2: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=2 k=2: sum |tau|^2 = |G| = 6 (norm 1)
ok   (D) q=2 k=2: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=2: tau_k = tau_k' iff k' in {k, qk} (each fibre is one Frobenius orbit of size 2)
ok   (D) q=2: #distinct cuspidal tau = 1 = #IsPrimeLab 2 = (q^2-q)/2
ok   (D) q=3 k=1: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=1: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=1: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3 k=2: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=2: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=2: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3 k=3: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=3: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=3: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3 k=5: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=5: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=5: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3 k=6: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=6: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=6: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3 k=7: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=3 k=7: sum |tau|^2 = |G| = 48 (norm 1)
ok   (D) q=3 k=7: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=3: tau_k = tau_k' iff k' in {k, qk} (each fibre is one Frobenius orbit of size 2)
ok   (D) q=3: #distinct cuspidal tau = 3 = #IsPrimeLab 2 = (q^2-q)/2
ok   (D) q=5 k=1: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=1: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=1: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=2: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=2: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=2: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=3: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=3: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=3: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=4: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=4: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=4: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=5: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=5: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=5: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=7: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=7: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=7: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=8: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=8: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=8: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=9: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=9: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=9: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=10: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=10: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=10: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=11: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=11: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=11: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=13: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=13: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=13: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=14: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=14: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=14: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=15: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=15: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=15: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=16: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=16: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=16: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=17: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=17: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=17: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=19: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=19: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=19: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=20: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=20: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=20: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=21: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=21: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=21: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=22: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=22: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=22: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5 k=23: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)
ok   (D) q=5 k=23: sum |tau|^2 = |G| = 480 (norm 1)
ok   (D) q=5 k=23: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes
ok   (D) q=5: tau_k = tau_k' iff k' in {k, qk} (each fibre is one Frobenius orbit of size 2)
ok   (D) q=5: #distinct cuspidal tau = 10 = #IsPrimeLab 2 = (q^2-q)/2
FAILURES: 0
```
