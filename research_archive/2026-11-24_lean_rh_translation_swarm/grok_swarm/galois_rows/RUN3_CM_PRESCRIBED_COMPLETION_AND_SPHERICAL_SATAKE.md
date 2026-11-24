# galois_rows RUN 3 — prescribed-completion CM extensions and Satake parameters from unlinked unramified support

Lane: `grok_swarm/galois_rows` (Grok). Continues RUN 2 (`c77487a`, §7 RESUME HERE). Upstream: leanprover-community/riemann-hypothesis at pin `40e56bab026552e089d7afcfeff08d2defb9c005`.
Status: **human-readable re-derivation, CONDITIONAL on the named dependencies in §5. Upstream declarations NOT elaborated or kernel-checked here.** RH remains OPEN. URT was not used as a premise or as evidence.

Overlap check (2026-11-24 GMT): branch head `c7e3e2e` at start, re-checked at `f5bf62f` before push (intervening commits touch only green_regular_character, math/, specialists/character_boxes, specialists/literature_provenance); no file under `research_archive/2026-11-24_lean_rh_translation_swarm/` names `exists_cm_solvDisj_dec_eq`, `exists_cm_solvable_split`, `hasSat_of_unlinked_unr`, `SphUnr`, `SuppBC` or `AboveL` in its path, and `HANDOFF_QUEUE.md` has no claim on them. The fallback (`SuppBC`) was therefore not needed.

## 0. Provenance (blob ids at the pin; all re-checked by `RUN3_replay_checks.py`)

| file (under `src/Development/`) | blob | declarations used |
|---|---|---|
| AbelianVarietyTheory/Proofs/SatakeParameters/ExistsSolvableCmExtensionAbelianCompletion.lean | 788132cf | `GlobalTheory.AboveL.exists_cm_solvDisj_dec_eq`, `AboveL.DecRes.{resHom, resHom_injective, resHom_surjective, mem_map_iff, isOpen_map, commutator_le_map}` |
| …/SatakeParameters/ExistsSolvableCmExtensionAbelianCompletionStatement.lean | 4c6f90f5 | alias `GlobalTheory.T.exists_solvable_cm_extension_abelianCompletion` |
| …/SatakeParameters/ExistsSolvableCmExtensionSplitPlace.lean | 0e627042 | `GlobalTheory.AboveL.exists_cm_solvable_split`, `AboveL.mem_dec_congr` |
| …/SatakeParameters/ExistsSolvableCmExtensionSplitPlaceStatement.lean | 4d9e0009 | alias `GlobalTheory.T.exists_solvable_cm_extension_split_place` |
| …/SatakeParameters/ExistsCmFieldLiftDisjointOfRealSolvable.lean (+Statement 7e93ec1f) | 5303f735 | `GlobalTheory.KLift.exists_cm_lift` = `T.exists_cmField_lift_disjoint_of_real_solvable` |
| …/SatakeParameters/ExistsAbelianTotallyRealExtPrescribedCompletion.lean (+Statement 0c35a56c) | 74824e74 | `GlobalTheory.AbStep.{loc_char, gal_char, one_char, exists_abelian_real_field}` = `T.exists_abelian_totallyReal_ext_prescribedCompletion` |
| …/SatakeParameters/FiniteDecompositionGroupsCoverOpenQuotient.lean (+Statement 0a81780d) | 840f45a0 | `GlobalTheory.DecCover.main` = `T.finite_decompositionGroups_cover_openQuotient` |
| …/SatakeParameters/CmSubfieldsCompositumClosedStatement.lean | c385108b | `T.cm_subfields_compositum_closed` (third conjunct) |
| AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsHcharPrescribedTrivial.lean | 649f9a3d | `GlobalTheory.DelEps.Twist.exists_hchar_prescribed` |
| AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/LocalComponentsOfSmoothCharacters.lean | 5ee15c31 | `GlobalTheory.SphUnr.{hasSat_of_unlinked_unr, equiv_prodIrr_chars, equiv_prodIrr_untwist, exists_equiv_of_eq, hasSatGL_of_equiv_prodIrr, exists_isUnitarisable_twist, valAt_ofChar}` |
| …/ToralDeRham/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean | a57bfc29 | the call site of `hasSat_of_unlinked_unr` (line 81) |

Notation. Ω an algebraic closure; G K Ω = Gal(Ω/K); for a valuation ring A of Ω, Dec_K(A) ≤ G_K its decomposition group; E CM with maximal totally real subfield E⁺ =: F. `SolvDisj M N` (RegPolOfRepOf, checked in RUN 2) = M/E Galois ∧ Gal(M/E) solvable ∧ every g ∈ G_E is x·n with x ∈ G_M, n ∈ N.

## 1. The shared mechanism, derived once — Proposition P (CM lift of a totally real abelian field with prescribed local Galois group)

**Statement (composite of `AbStep.exists_abelian_real_field` and `KLift.exists_cm_lift`).** Let E be CM, F = E⁺, A a valuation ring of Ω over a finite place v of F, N ≤ G_E open, and W ≤ Dec_F(A) open with [Dec_F(A), Dec_F(A)] ≤ W. Then there is a CM field M ⊇ E inside Ω with
 (P1) `SolvDisj M N`;
 (P2) M = E·F₁ for a finite abelian, totally real F₁/F, so for g ∈ G_E: g fixes M ⇔ g fixes F₁;
 (P3) for g ∈ Dec_F(A): g fixes F₁ ⇔ g ∈ W;
 (P4) F₁ ⊆ M⁺.

**Proof.**
*Step 1 (the set T, `KLift.exists_cm_lift` first line → `DecCover.main`).* Push N into G_F (`isOpen_map_restrictScalars`, open because [E:F] finite). Choose an open normal U ⊆ N. For each g, Chebotarev (`GlobalTheory.Published.cheb_holds`, applied with the excluded set {v}) gives a place u ≠ v and an element σ of a decomposition group at u with σ ≡ g mod U, so σ⁻¹g ∈ N. The open sets {h : σ_g⁻¹h ∈ N} cover the compact G_F; a finite subcover gives a finite T ∌ v with: every g ∈ G_F is x·n with x in a decomposition group Dec_F(A′) at some u ∈ T and n ∈ N.
*Step 2 (F₁, `AbStep.exists_abelian_real_field`).* Q := Dec_F(A)/W is finite (W open in the compact Dec_F(A), `LocVec.finiteIndex_of_isOpen`) and abelian (W ⊇ commutator). Pick characters ψ_q : Q → ℂˣ separating points (`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`). For each q globalise χ_q := ψ_q∘(Dec→Q) by `one_char`:
 - (`loc_char`) the local Artin map a of v turns χ_q into a smooth finite-order θ on F_vˣ with θ(a σ) = χ_q(σ) for σ in the Weil group;
 - (`exists_hchar_prescribed`) a finite-order Hecke character η of F with η_v = θ, η_u = 1 for u ∈ T, trivial at all infinite places. Mechanism (as consumed at its call sites): with m = ∏ orders, `ChevalleySUnits.exists_places` gives a finite set of auxiliary places on which "global unit, locally a unit off S and ≡ 1 there" forces "m-th power"; then the idelic character prescribed on the S-components and trivial on an open level subgroup is well defined on Fˣ·(…) because the obstruction elements are m-th powers and θ_w^m = 1 (`hxz`), and extends by `exists_unitary_char_of_open_subgroup_and_hom`. No Grunwald–Wang obstruction arises because only the local components (not the global order) are prescribed;
 - (`gal_char`) global Artin reciprocity (`globalArtinReciprocity_holds`) turns η into an open-kernel character ρ of G_F^{ab}; r_q := ρ∘toAb.
 Then r_q|Dec = χ_q: on Weil elements by local–global compatibility (`haL.glob`) and the choice of θ; on all of Dec by density — for g ∈ Dec and a finite L on which r_q and χ_q are locally constant, a Weil element τ agreeing with g on L exists (`ConjWD.exists_weil_eq_on`), so r_q(g) = r_q(τ) = χ_q(τ) = χ_q(g). Also r_q(c) = 1 for every complex conjugation c (`HilbertFromArtin.art_sign_eq` with η_∞ = 1) and r_q kills Dec_F(A′) at u ∈ T (the image of Dec is the closure of the local idèles there, `ha.dec`, where η_u = 1).
 Let φ = (r_q)_q; ker φ is open, and `RayFromArtin.exists_field` gives F₁ finite abelian over F with G_{F₁} = ker φ. Hence (P3): g ∈ Dec fixes F₁ ⇔ ψ_q(gW) = 1 ∀q ⇔ gW = 1 (separation) ⇔ g ∈ W; split at T: Dec_F(A′) ≤ G_{F₁} for u ∈ T; totally real: for an embedding φ′ of F₁ extend to j : Ω → ℂ; since F is totally real, conj∘j and j agree on F, so some σ has j∘σ⁻¹ = conj∘j; σ⁻¹ is a complex conjugation, so fixes F₁, so φ′ is real.
*Step 3 (M, `KLift.exists_cm_lift`).* M := E(F₁) inside Ω. Finite over E (spanned by a basis of F₁/F), normal over E (F₁/F normal), CM by `cm_subfields_compositum_closed` (generated over E by elements real under every embedding). Gal(M/E) embeds into Gal(F₁/F) via restriction (equal kernels in G_E), hence is solvable (indeed abelian). (P2) is immediate from M = E(F₁); (P4): each z ∈ F₁ has real image under every complex embedding of M (it is real under every embedding of Ω), so z ∈ M⁺ = `maximalRealSubfield M`. (P1): for g ∈ G_E, Step 1 writes its image in G_F as x·n with x ∈ Dec_F(A′), u ∈ T, n ∈ N; x fixes F₁ (split at T), so g·n⁻¹ fixes F₁, hence fixes M by (P2); so g = (g n⁻¹)·n with g n⁻¹ ∈ G_M. ∎
Every hypothesis is used: CM-ness of E (for M CM and E⁺ totally real in Step 2), openness of N (Step 1), openness of W (finite index, open kernels), commutator ⊆ W (Q abelian, so characters separate), v ∉ T (prescribing θ at v and 1 at T simultaneously).

## 2. `AboveL.exists_cm_solvDisj_dec_eq` (= `T.exists_solvable_cm_extension_abelianCompletion`)

**Exact statement.** ∀ Ω E [NumberField E] [IsCMField E] [IsAlgClosure E Ω] A w (h : IsPlaceOver A w), (∀ g ∈ Dec_{E⁺}(A), g fixes E) → ∀ V ≤ Dec_E(A) open with [Dec_E(A),Dec_E(A)] ≤ V, ∀ N ≤ G_E open, ∃ CM M ⊇ E, `SolvDisj M N` ∧ ∀ g ∈ Dec_E(A), (g fixes M ⇔ g ∈ V).
**Proof.** The hypothesis `hfix` says Dec_{E⁺}(A) ≤ G_E, i.e. the place of E⁺ under A splits in E. Then restriction `resHom : Dec_E(A) → Dec_{E⁺}(A)` is injective always and surjective by `hfix` (`resHom_surjective` lifts k to an E-automorphism because k fixes E), so it is an isomorphism of topological groups onto Dec_{E⁺}(A). Put W := resHom(V): it is open (`isOpen_map`) and contains the commutator (`commutator_le_map`, by surjectivity). The place v of E⁺ under A comes from `ShaCmp.exists_over_iff` (both directions). Apply Proposition P with (v, W, N): M, F₁ with (P1)–(P3). For g ∈ Dec_E(A): g fixes M ⇔ g fixes F₁ (P2) ⇔ resHom g ∈ W (P3) ⇔ g ∈ V (injectivity: `mem_map_iff`). ∎ (Lean shape of this chain: `dec_eq_transport`.)
Gal(F₁/E⁺) abelian ⇒ solvable (`isSolvable_of_comm`) feeds the solvability hypothesis of `KLift`.

## 3. `AboveL.exists_cm_solvable_split` (= `T.exists_solvable_cm_extension_split_place`)

**Exact statement.** Same quantifier prefix (no `hfix`, no V); ∃ CM M ⊇ E with `SolvDisj M N` ∧ (∀ g ∈ Dec_E(A), g fixes M) ∧ (∀ g ∈ Dec_{M⁺}(A), g fixes M).
**Proof = Proposition P with W := Dec_F(A) ∩ G_E** (F = E⁺, v := comap of w, an explicit `HeightOneSpectrum` built from a nonzero x₀ ∈ w). W is open (G_E is the fixing group of the finite field E). Commutator ⊆ W: Gal(E/F) has order 2 (`IsQuadraticExtension.finrank_eq_two`), hence is cyclic, so every commutator in Dec_F(A) restricts trivially to E. Proposition P gives M = E·F₁ with: for g ∈ Dec_F(A), g fixes F₁ ⇔ g fixes E (`hkey`, `hkey2`).
 - Clause 2: g ∈ Dec_E(A) restricts to g′ ∈ Dec_F(A) (`mem_dec_congr`: same underlying map, same stabiliser of A) fixing E, hence fixing F₁, hence fixing M by (P2). So the place w is totally split in M/E (Dec_E(A) ≤ G_M).
 - Clause 3: g ∈ Dec_{M⁺}(A) fixes M⁺ ⊇ F₁ (P4); viewed in Dec_F(A) it fixes F₁ hence fixes E (P3 with W = Dec∩G_E); so it is an E-automorphism fixing F₁, so fixes M (P2). So the place of M⁺ under A splits in M — exactly the `hfix` hypothesis of §2 for the field M. ∎
**How RUN 2 chains them (WeaklyAttachedToralOfCmLift, checked in RUN 2):** §3 gives M₀ (with N₀ = trace-nonzero subgroup); its clause 3 is `hfixR₀` (line 41 destructures it, line 59 passes it to §2); §2 applied over M₀ with V from `exists_open_subgroup_weilElement_characterKernel` gives M₁. So both steps of Theorem B rest on the single Proposition P.

## 4. `SphUnr.hasSat_of_unlinked_unr`

**Exact statement.** Inq → ∀ E [NumberField E] [IsCMField E] n, 1 ≤ n → ∀ π : CuspSub E n, w, σ : SmIrr(GL_n(E_w)), π.IsLocComp w σ → ∀ ξ : Fin n → (E_wˣ →* ℂˣ) smooth, HasSupport σ.ρ (chars ξ) → Unlinked (chars ξ) → (∀ j, ξ_j trivial on units) → ∀ ϖ with v(ϖ) = exp(−1) → (CG.mk π).HasSat w {ξ_j(ϖ)}_j (as a multiset).
(At the call site the support hypothesis is for σ itself after norm-composition, `(ξ0 j).comp normU`; RUN 2 §2 step 3c.)
**Proof.**
 1. *Unitary twist* (`exists_isUnitarisable_twist`): some real t makes σ⊗|det|^t unitarisable — from a unitary twist π₀ = π⊗|·|^{−t} of the cuspidal π (`CG.exists_isUnitary_twist_absPow`) and unitarisability of local components of unitary cuspidals (`ResW.isUnitarisable_of_isLocComp_cusp`). Let χ = |·|^t.
 2. *Generic* (`Generic.isGeneric_of_isLocComp`): local components of cuspidal π are generic; genericity survives the twist.
 3. *Support transport*: the twist has support chars(ξ_j χ) (`TwistSupp.chars_eq_map_nu`, `HasSupport.tw`) and is still unlinked (`TwistSupp.unlinked_map_nu`: twisting by ν^t commutes with ν-shifts).
 4. *Classification* (`equiv_prodIrr_chars`, using `hI.gen : GlobalTheory.Published.GenericUnitaryDualGL`): a smooth irreducible unitarisable generic representation is ≅ a product ×_i L(Δ_i)ν^{s_i} of Langlands-segment representations. Its support is the sum of the segment multisets (`TD.hasSupport_of_isSubquotient_prodIrr`) and supports are unique (`TD.hasSupport_unique`, with the geometric lemma `geometricLemma_of_filtration Laid.bzfin_holds geometricLemmaFiltration_holds`). If some segment had length ≥ 2 it would contain both its first character μ and μν, which are linked — contradicting Unlinked (`hlen`; Lean shape `seg_len_one`). So every segment is a single character, equal to some ξ_{τ(i)}χ, and σ⊗χ ≅ ×_i ξ_{τ(i)}χ with multiset {ξ_{τ(i)}χ} = chars(ξχ).
 5. *Untwist* (`equiv_prodIrr_untwist`, `IrrGL.tw_ofChar`): σ ≅ ×_i ξ_{τ(i)}.
 6. *Spherical* (`hasSatGL_of_equiv_prodIrr`): ξ_{τ(i)} unramified ⇒ it is the unramified character with value ξ_{τ(i)}(ϖ) (`eq_unrChar`); the unramified principal series has a K-fixed vector (`GenSph.isSpherical_prodIrr_uc`), so σ is spherical with Satake parameters {ξ_{τ(i)}(ϖ)} (`hasSatGL_of_hasSatakeGL`); degree count forces h = n.
 7. *Multisets*: applying y ↦ valAt ϖ y · χ(ϖ)⁻¹ to {ξ_{τ(i)}χ} = {ξ_jχ} gives {ξ_{τ(i)}(ϖ)} = {ξ_j(ϖ)} (`valAt_ofChar`) — τ need not be given as a bijection; only the multiset identity is used.
 8. *Globalise* (`HeightCounting.Blocks.hasSatGL_locRep`, `CG.hasSat_mk`). ∎
Every hypothesis is used: 1 ≤ n and CM-ness (step 1), local component (1, 2, 8), support + Unlinked (4), unramified (6), uniformiser (6–7). The only field of `Inq` consumed is `gen`.

## 5. Remaining dependencies (exact names; not reconstructed here)

Published / trust boundary: `GlobalTheory.Published.cheb_holds` (Chebotarev), `GlobalTheory.Published.GenericUnitaryDualGL` (via `Inq.gen`).
Native, not yet reconstructed: `GlobalTheory.globalArtinReciprocity_holds`, `GlobalTheory.localArtinExists_holds`, `GlobalTheory.RayFromArtin.exists_field`, `GlobalTheory.HilbertFromArtin.art_sign_eq`, `GlobalTheory.ConjWD.exists_weil_eq_on`, `GlobalTheory.ChevalleySUnits.exists_places`, `GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom`, `GlobalTheory.Mem.FinOrder.finite_order_of_inf_eq_one`, `GlobalTheory.CMSub.isCMField_sup_le_adjoin`, `Formalism.MainNotions.V.Pf.ShaCmp.exists_over_iff`, `GlobalTheory.Laid.bzfin_holds`, `GlobalTheory.geometricLemmaFiltration_holds`, `GlobalTheory.CompanionTheory.Hypotheses₂.TD.{hasSupport_unique, hasSupport_of_isSubquotient_prodIrr}`, `GlobalTheory.GenSph.{isSpherical_prodIrr_uc, eq_first_of_isLSeg}`, `GlobalTheory.ResW.isUnitarisable_of_isLocComp_cusp`, `CG.exists_isUnitary_twist_absPow`, `Generic.isGeneric_of_isLocComp`, `GlobalTheory.HeightCounting.Blocks.hasSatGL_locRep`, `GlobalTheory.LFun.SatCompare.hasSatGL_of_hasSatakeGL`.
(Whether a given `_holds` name is itself proved natively or rests on a `Published` wrapper was not traced in this run.)

## 6. Formal companion and evidence (actually run, 2026-11-24 GMT)

- `RUN3_CmPrescribedCompletionSchema.lean` (namespace `GrokCmPrescribed`), core Lean 4.33.1, no Mathlib: `solvDisj_of_cover` (no axioms), `fix_iff_mem_of_separating` (propext, Classical.choice, Quot.sound), `dec_eq_transport` (propext), `seg_len_one` (propext, Classical.choice, Quot.sound); exit 0, no sorryAx. Abstract shapes only; NOT a check of upstream constants. First attempt failed (an `rw` in `solvDisj_of_cover`); fixed by using the cover element directly, as upstream does after re-lifting.
- `RUN3_replay_checks.py /workspace/rh_up`: 14 blob-id checks + 77 verbatim text checks, `checks ok=91 bad=0`, exit 0. Confirms transcription, not mathematics.
- Raw outputs: `RUN3_VALIDATION_LOG.txt`.

## 7. RESUME HERE (galois_rows RUN 4)

Proposition P's arithmetic input is global class field theory. Next: reconstruct `GlobalTheory.ChevalleySUnits.exists_places` and `GlobalTheory.DelEps.Twist.exists_hchar_prescribed` in full (the Chevalley m-th-power step), then trace whether `globalArtinReciprocity_holds` / `localArtinExists_holds` are native or `Published`. Alternative if claimed: `UpperTheory.Gal.InertialTypesAlt.SuppBC` / `suppBC_outright` (RUN 2 Theorem C input).
