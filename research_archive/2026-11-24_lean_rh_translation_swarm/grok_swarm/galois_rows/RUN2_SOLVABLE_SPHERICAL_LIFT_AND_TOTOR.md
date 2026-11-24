# Grok swarm · galois_rows · RUN 2 — the solvable spherical lift `exists_sph_lift_of_toral` and the mixed→toral producer `toTor`

2026-11-24, 09:36–09:50 GMT (Europe/London). Agent: Grok (galois_rows lane).
**Status: SOURCE-MATCHED + RE-DERIVED in prose (conditional on the named inputs in §6). A schema-level Lean companion COMPILED with core Lean 4.33.1 (no Mathlib, no upstream import). The upstream declarations themselves were NOT elaborated or kernel-checked.** No URT premise. RH status OPEN.

**CLAIM:** obligations #1 and #2 from RUN1 §8: `GlobalTheory.RoadU.exists_sph_lift_of_toral` (the single mechanism behind all three R1 branches) and `UpperTheory.Gal.ToralGalois.R2.toTor`.
**Continuity checked:** branch head `ac8d3e6` (09:36 GMT) — no commit after RUN1; `git grep` for `exists_sph_lift_of_toral|toTor_holds|PToTor` on the branch finds only my RUN1 files. The existing Galois lane's next step (`Crys.alg`/`hk`, `HeckeDeRham`) is not touched. RUN1 (assembly, Row0b) and the existing lane's RUN2 (Core → CoreAll) and RUN3 (Row0b guard, Inp ledger) are inputs, not repeated.

## 0. Provenance (pin `40e56bab026552e089d7afcfeff08d2defb9c005`)
`T/` = `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/`, `Pd/` = `…/SphericalGaloisCompatibility/PAdicSplitting/`, `SP/` = `src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/`. Blob ids from `git rev-parse <pin>:<path>`, re-checked by `replay_run2_checks.py` (§5).

| file | blob | declarations used |
|---|---|---|
| T/FrobeniusCharpolyOfUnlinkedUnramifiedSupport.lean | 0919be0c | `liesOver_of_isPlaceOver` (21), **`exists_sph_lift_of_toral` (32–45)**, alias `frobenius_charpoly_of_unlinked_unramified_support` (57) |
| T/WeaklyAttachedToralOfCmLift.lean | bad76ae6 | **`TorLiftC.exists_cm_lift_fix_charKer`**, alias `T.weaklyAttached_toral_of_cm_lift` |
| T/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean | a57bfc29 | **`TorLift.hasSat_charPol_above`**, alias `T.frobenius_charpoly_eq_satake_of_place_above` |
| T/ExistsCuspidalCharLiftOfSolvableCmExtension.lean | 144a33f1 | **`isWeaklyAttached_of_cmBaseChange_of_finrank`**, `upWeak`, alias `T.exists_cuspidal_charLift_of_solvable_cmExtension` (134) |
| Pd/PToTor.lean | 57031e80 | `split_of_padic`, `dvd_of_support`, **`R2.toTor`** |
| Pd/InfLifts.lean | a9ca7e5e | `ToTor` (40), `RecChars` (32), `InfLifts` (27) |
| …/AbelianVarietyTheory/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean | 8b43b079 | `CharLift` (98) |
| …/Definitions/GaloisGeometry/RegPolOfRepOf.lean | afe7d6c0 | `SolvDisj` (42) |
| …/PublishedTheorems/GaloisGeometry₂/ArthurClozelStrongTC.lean | 22fa0bc1 | `ArthurClozelStrongTC` (13) |
| …/AutomorphicVarieties/PublishedTheorems/CyclicBaseChangeC.lean | 04b178c9 | `SelfTw` (32) |
| …/RegularSemisimpleFibres/NumberField.lean | (replay) | `Mixed` (80), `SuppBC` (166) |
| …/CharpolyFromTrace/UnlinkedOfType.lean | (replay) | `UnrField` (112) |
| SP/*Statement.lean (10 files), SP/LocalArtinCompNormCompat.lean, SP/SatWDCharPolChars.lean, SP/SolvableAscentInduction.lean | see replay | statements listed in §6 |

Definitions used (decoded, nothing dropped):
- **CharLift π P** (K ⊆ M totally complex): `IsLift π P` (cuspidal base change) **and** for every place u | v and local components τ of π at v, T of P at u: if τ has Bernstein–Zelevinsky support given by characters ξ_j of K_v^×, then T has support given by ξ_j ∘ N_{M_u/K_v}.
- **SolvDisj M N** (N ⊆ G_K): M/K Galois with solvable group **and** every g ∈ G_K factors as g = x·n with x ∈ G_M, n ∈ N.
- **SelfTw sat η**: for cofinitely many v, η is unramified at v and the Satake multiset B at v satisfies η(v)·B = B.
- **ArthurClozelStrongTC** (an `Inp` field `ac`, a *published-theorem wrapper*, not proved in the repo): for M/K Galois of prime degree and π cuspidal on GL_a(A_K), if π is not a self-twist by any character η of K associated to M (IsNormChar), then a cuspidal base change P with IsLift π P exists.

## 1. Shared mechanism (derived once): solvable CM ascent with a trace guard

**Lemma A** (`isWeaklyAttached_of_cmBaseChange_of_finrank`, wrapped as `exists_cuspidal_charLift_of_solvable_cmExtension`). Assume `Inq`. Let K be CM, M ⊇ K CM inside Ω, a ≥ 1, π cuspidal on GL_a(A_K) with χ in scope (regular algebraic, polarized), r : G_K → GL_a(\bar Q_l) weakly attached to π, and N ⊆ G_K a subgroup with **tr r(n) ≠ 0 for every n ∈ N** and **SolvDisj M N**. Then there are P cuspidal on GL_a(A_M) and χ' with P in scope and CharLift π P.

*Proof (strong induction on d = [M:K]).*
- d = 1: `exists_characterSupportBaseChangeLift_degreeOne` gives P with CharLift; `polarizedPair_baseChange_polarized_same_weight` (inputs: `automorphicFormsFiniteGL`, `Inq.js` Jacquet–Shalika, `Inq.gk` Gelfand–Kazhdan) gives χ' with P in scope.
- d > 1: Gal(M/K) is solvable and nontrivial, so (`SolvUp.exists_normal_prime_index`) it has a normal subgroup H of prime index p. Put K₁ = M^H; K₁/K is Galois of degree p (index computation via `finrank_fixedField_eq_card`), K₁ is CM (`isCMField_intermediate`), and [M:K₁] = d/p < d.
- **Trace guard (`hmove`).** Pick x ∈ K₁ \ K (exists because [K₁:K] = p > 1). Suppose every g ∈ G_K moving x had tr r(g) = 0. Then every n ∈ N fixes x (else tr r(n) = 0, contradicting the hypothesis on N). Every element of G_M fixes x because x ∈ K₁ ⊆ M. By SolvDisj every g = z·n with z ∈ G_M, n ∈ N, so g(x) = z(n(x)) = x. Hence x is fixed by all of G_K, so x ∈ K by infinite Galois theory (`fixedField_fixingSubgroup` of ⊥). Contradiction. So some g moves K₁ and has tr r(g) ≠ 0.
- **Not a self-twist.** If π were a self-twist by a character η of K attached to K₁, then `trace_eq_zero_off_subgroup_of_selfTwist` (prime degree, r weakly attached) would force tr r(g) = 0 for every g not fixing K₁ — contradicting the guard.
- **Cyclic step.** `Inq.ac` (Arthur–Clozel) gives P₁ on GL_a(A_{K₁}) with IsLift; `Inq.chl` (CharLift for prime-degree Galois steps) upgrades to CharLift π P₁; polarized base change puts P₁ in scope; `weak_comp_res` makes r|_{G_{K₁}} weakly attached to P₁.
- **Descend the hypotheses.** N₁ := N ∩ G_{K₁} (as `comap` of restriction of scalars): traces on N₁ are traces on N, so nonzero; Gal(M/K₁) is solvable as a subgroup; for g₁ ∈ G_{K₁}, write g₁ = z·n in G_K with z ∈ G_M; since g₁ and z fix K₁, so does n, so n ∈ N₁: SolvDisj M N₁.
- Induction on [M:K₁] gives P with CharLift P₁ P; `charLift_trans` gives CharLift π P. ∎

Formal skeleton: `fixes_all_of_trace_vanishing`, `exists_moving_nonzero_trace` (the guard) and `solvable_ascent` (the induction shape) in `SolvableLiftSchema.lean`, compiled (§4).

## 2. Theorem B: `exists_sph_lift_of_toral` — making a plainly toral component spherical

**Statement (T:32, every quantifier kept).** Assume `Inq`. For every algebraic closure Ω, CM field E, prime l, ι : \bar Q_l ≅ C, n ≥ 1, cuspidal π on GL_n(A_E) and χ with π in scope, r weakly attached to π, finite place w, valuation subring A of Ω over w (h), local component σ of π at w, smooth characters ξ_1,…,ξ_n of E_w^× such that **algNorm σ has BZ support {ξ_j} and that support is unlinked**, every local Artin map a on the Weil group W(h), and **every g ∈ W(h) with deg g ≠ 0**: there exist a CM field M with E ⊆ M ⊆ Ω (scalar tower), a place u of M with A over u (h'), P cuspidal on GL_n(A_M), χ' such that
(i) P is in scope; (ii) IsLift π P; (iii) g fixes M pointwise; (iv) P has Satake parameters B at u; (v) for all g₀ ∈ W(h) and g' ∈ W(h') acting identically on Ω, charpol_{satWD(B)}(g') = ∏_j (X − ξ_j(a(g₀))).

*Proof.*
**Step 0 (undo the normalisation).** algNorm σ = σ ⊗ |det|^{(1−n)/2}. Put ξ⁰_j = ξ_j·|·|^{−(1−n)/2}. These are smooth; `supp_nu_chars` shows σ itself has support {ξ⁰_j}, and twisting by |·|^s preserves unlinkedness.

**Step 1 (two solvable CM extensions; `exists_cm_lift_fix_charKer`).**
 1a. `exists_open_galoisSubgroup_trace_ne_zero` gives an **open** N₀ ⊆ G_E with tr r ≠ 0 on N₀ (continuity of r).
 1b. `exists_solvable_cm_extension_split_place` gives a CM M₀ with SolvDisj M₀ N₀, such that the decomposition group Dec_E(A) fixes M₀ (read: w splits completely in M₀; the source states only the fixing property) and Dec_{M₀⁺}(A) also fixes M₀.
 1c. Lemma A gives π₀ on M₀, in scope, CharLift π π₀.
 1d. Let v₀ be the place of M₀ under A (`exists_isPlaceOver_finiteExtension_of_isPlaceOver`). g fixes M₀ (it lies in Dec_E(A)), so it restricts to g₀ ∈ W(h₀) (`mem_weilGroupAtPlace_of_fixes_extension`), and deg g₀ ≠ 0 because degree-zero-ness matches (`exists_weilGroup_restrict_extension`).
 1e. `exists_open_subgroup_weilElement_characterKernel` gives an **open** V ⊆ Dec_{M₀}(A) containing the commutator subgroup and g₀ such that ξ_j ∘ N(a₀(t)) = 1 for every inertia element t in V (all j).
 1f. r|_{G_{M₀}} is weakly attached to π₀; take open N₁ with nonzero traces; `exists_solvable_cm_extension_abelianCompletion` gives a CM M₁ with SolvDisj M₁ N₁ and **{g ∈ Dec_{M₀}(A) : g fixes M₁} = V exactly** (a global solvable CM extension realising the prescribed local abelian extension; this uses the split condition from 1b).
 1g. Lemma A again gives P on M₁ with CharLift π₀ P; transitivity gives CharLift π P.
 1h. g fixes M₁ because g₀ ∈ V. If t ∈ W(h) has degree 0 and fixes M₁, its restriction t₀ is an inertia element of M₀ lying in V, so ξ_j∘N(a₀(t₀)) = 1, and local Artin–norm compatibility `localArtin_comp_norm_compat` (a(t) = N(a₀(t₀))) gives **ξ⁰_j(a(t)) = 1 for every degree-0 t fixing M₁**.
 Set M := M₁. Note: M/E is a tower of two solvable Galois CM steps; M/E itself is not asserted to be Galois.

**Step 2 (unramified after norm).** With u the place of M under A, `unramified_comp_norm_of_killed_inertia_fixing` turns 1h into: **ξ⁰_j ∘ N_{M_u/E_w} is trivial on O_{M_u}^×** for every j (units of M_u ↔ inertia of M_u, which are degree-0 elements of W(h) fixing M).

**Step 3 (spherical with explicit Satake parameters; `hasSat_charPol_above`).**
 3a. A local component T of P at u exists (`exists_isLocComp`); CharLift transports the support: T has support {ξ⁰_j ∘ N}.
 3b. **Unlinkedness survives the norm.** `PolarizedWeight.exists_isWeight` gives wt; `RoadU.window` (T/NormEqOneOfIsUnitarisable.lean:100) shows |ξ_j| = |·|^{e_j − wt/2} with |e_j| < 1/2; `unlinked_chars_comp_normU` then shows {ξ_j∘N} is unlinked, and twisting (`chars_eq_map_nu`, `unlinked_map_nu`) gives the same for ξ⁰. (The bound |e_j| < 1/2 is an explicit hypothesis of `unlinked_chars_comp_normU`; it is consumed here, not dropped.)
 3c. Unlinked + unramified (Step 2) ⇒ `hasSat_of_unlinked_unr`: P has Satake parameters B = {ξ⁰_j∘N(ϖ)} at u for a uniformiser ϖ of M_u.
 3d. `satWD_charPol_chars`: charpol_{satWD(B)}(g') = ∏_j (X − (ξ⁰_j∘N·|·|^{s₀})(a'(g'))) = ∏_j (X − (ξ_j∘N)(a'(g'))) with s₀ = (1−n)/2; `localArtin_normU` (a(g₀) = N(a'(g')) for matching g₀, g') converts to ∏_j (X − ξ_j(a(g₀))). ∎

**How R1 uses Theorem B (all three branches, RUN1 §4a).** Away from l (`away_eq_of_plainTor`): CoreAll's `.unr` spherical clause at u for (P, r|_{G_M}) gives Frobenius eigenvalues = Satake data; (v) identifies them with ξ_j(a(g₀)); `rc_unlinked_chars` gives the same polynomial for rc(algNorm σ); N = 0 and equal char. polynomials give equality (`eq_of_mono0_charPol`). de Rham (`deRham_of_plainTor`): CoreAll `.dR` at u, then `deRham_descends`, `jumps_descend`. Above l (`toralAbove_of_holds`): CoreAll `.crys` and `.phi` at u. In each branch g is taken as a Frobenius `frob hA` (deg = 1 ≠ 0).

## 3. Theorem C: `toTor` (mixed type at a degree-one place → plainly toral after unramified base change)

**Inputs (all hypotheses of `R2.toTor`):** `SuppBC`, `UnrField`, `AllLift`, `IneNorm`, `InfLifts`, `RecChars`, `RecTExists`. **Conclusion `ToTor` (InfLifts.lean:40):** for π in scope, r weakly attached, σ local component at w, **w ≅ Q_p continuously (IsQg)**, **σ of mixed type** (`Mixed` = depth zero ∧ unlinked support whose segments of length ≥ 2 are pairwise non-inert), every A over w, every rc with IsRecT: there exist a field X (in the family `Fld E Ω`), a cuspidal P over X.K and χ', a place u of X.K with A over u, a local component T of P at u, and rc' with (P in scope), (r|_{G_{X.K}} weakly attached to P), (equal infinitesimal characters), (**algNorm T plainly toral**), (IsRecT rc'), and for every inertia element t of E an inertia element t' of X.K acting identically on Ω with charpol_{rc(algNorm σ)}(t) = charpol_{rc'(algNorm T)}(t').

*Proof.*
 1. `split_of_padic`: w ≅ Q_p ⇒ Nw = p and w is split of degree one and unramified over p.
 2. Each segment y in the BZ support of σ has length y.1 ≤ n, hence **y.1 | n!** (`dvd_of_support`).
 3. The set S of places where π is not spherical is finite (`eventually_hasSatGL_locRep`).
 4. `UnrField` with f = n! and S gives X with: inertia of E at every A over w fixes X.K (X.K/E unramified there) and **N w' = (N w)^{n!} = p^{n!}** for w' | w (residue degree n!).
 5. `AllLift` gives P over X.K, in scope, weakly attached (`hPr`) and lifting π along X (`hPL`); `InfLifts` gives equal infinitesimal characters.
 6. `IneNorm` gives an injection t ↦ t' of inertia groups with the same action on Ω (inertia is unchanged because the extension is unramified at w).
 7. `SuppBC` (needs depth zero = `hM.1`, N w' = p^{f} with f = n!, and y.1 | f for every support element) gives characters ξ of X_{w'}^× with `ToralOver`: T has character support ξ, and (from Mixed) that support is unlinked. Mechanism: an unramified base change of degree divisible by every segment length splits each depth-zero supercuspidal into characters.
 8. `RecChars` ⇒ algNorm T is plainly toral and charpol_{rc'(algNorm T)}(t') = ∏ (X − ξ_j(a'(t'))); `RecTExists` gives rc'.
 9. For t: combine the ToralOver identity at t (via `hTP`) with `inePol_lpTw_of_mem_Ine` and the twist `algNorm σ = σ.nu((1−n)/2)` (`L.nu`) to get the stated char-poly equality on inertia. ∎
Only inertia equalities are produced — Frobenius is not preserved by a degree-n! residue extension, which is why H2 and `Away.tame0` (RUN1 §1) only claim inertia / degree-0 compatibility.

**Shared structure of B and C.** Both: (base change to a CM extension in which the local type at w becomes *unramified characters*) + (CharLift / ToralOver transports BZ support as ξ ↦ ξ∘N) + (local Artin–norm compatibility a = N∘a' transports eigenvalues back). B uses a ramified-killing *solvable* extension so that Frobenius survives (it fixes M, condition (iii)); C uses an *unramified* extension of residue degree n! and therefore only transports inertia. The norm-transport step is the one-line `norm_transport` in the companion.

## 4. Formal companion (EXECUTED; schema level only)
`SolvableLiftSchema.lean`, core Lean `leanprover/lean4:v4.33.1` (upstream `lean-toolchain`), no Mathlib, no upstream import. Upstream objects (Galois group, action, membership in G_M and N, trace, field-degree measure, lift predicate, Artin maps, norm) are universally quantified parameters, so the theorems hold for every instantiation; they check only the logical shape of `hmove` (§1), the strong induction (§1) and the norm rewrite (§2 Step 3d). They do **not** prove Arthur–Clozel, CharLift, SolvDisj existence or any analytic/arithmetic input.
```
$ nice lean +leanprover/lean4:v4.33.1 SolvableLiftSchema.lean; echo "exit=$?"
'GrokSolvableLift.fixes_all_of_trace_vanishing' depends on axioms: [propext, Classical.choice, Quot.sound]
'GrokSolvableLift.exists_moving_nonzero_trace' depends on axioms: [propext, Classical.choice, Quot.sound]
'GrokSolvableLift.solvable_ascent' does not depend on any axioms
'GrokSolvableLift.norm_transport' does not depend on any axioms
exit=0
```
(The classical axioms come from proof by contradiction, as upstream `by_contra`; no `sorryAx`.)

## 5. Validation evidence (actually run)
- `python3 replay_run2_checks.py /workspace/rh_up` (blob-less clone of leanprover-community/riemann-hypothesis): 22 blob-id checks + 63 verbatim text checks → `checks ok=85 bad=0`, exit 0. Full output in `VALIDATION_LOG.txt`.
- Lean run above (also in `VALIDATION_LOG.txt`).
- Not run: elaboration of any upstream file; `#print axioms` on upstream constants; numeric tests (none are meaningful here and none are claimed).

## 6. Remaining dependencies (exact names; open unless stated)
Published-theorem wrappers carried in `Inq`/`Inp` (trust boundary — literature lane): `Inp.ac` = `ArthurClozelStrongTC`, `Inp.js` = JacquetShalikaRigidity, `Inp.gk` = GelfandKazhdanDual, `Inq.chl` (CharLift for prime-degree steps; producer `GamX.charLiftPrime_holds`), `automorphicFormsFiniteGL`.
Lemma A: `T.exists_characterSupportBaseChangeLift_degreeOne`, `T.polarizedPair_baseChange_polarized_same_weight`, `SolvUp.exists_normal_prime_index`, `SolvUp.isCMField_intermediate`, `T.trace_eq_zero_off_subgroup_of_selfTwist`, `T.weaklyAttachedGaloisRepresentation_baseChange_restrict` (= `GalCut.weak_comp_res`), `T.cuspRep_characterSupportLift_trans_tower` (= `RoadU.charLift_trans`).
Theorem B: `T.exists_open_galoisSubgroup_trace_ne_zero` (= `AboveL.exists_open_trace_ne_zero`), `T.exists_solvable_cm_extension_split_place` (= `AboveL.exists_cm_solvable_split`), `T.exists_isPlaceOver_finiteExtension_of_isPlaceOver`, `T.mem_weilGroupAtPlace_of_fixes_extension`, `T.exists_weilGroup_restrict_extension`, `T.exists_open_subgroup_weilElement_characterKernel` (= `RoadU.exists_open_sub_charKer`), `T.exists_solvable_cm_extension_abelianCompletion` (= `AboveL.exists_cm_solvDisj_dec_eq`), `T.localArtin_comp_norm_compat`, `localArtinExists_holds`, `T.unramified_comp_norm_of_killed_inertia_fixing` (= `RoadU.unram_comp_normU_of_fix`), `RoadU.TwistSupp.supp_nu_chars`, `LocEx.exists_isLocComp`, `PolarizedWeight.exists_isWeight`, `RoadU.window`, `RoadU.unlinked_chars_comp_normU`, `TwistSupp.chars_eq_map_nu`, `TwistSupp.unlinked_map_nu`, `SphUnr.hasSat_of_unlinked_unr`, `SatChar.satWD_charPol_chars`, `ArtinNormU.localArtin_normU`, `LBCNu.absPow_comp_norm`.
Theorem C: `InertialTypesAlt.suppBC_outright`, `UnramifiedFromSplittingCriterion.unrField_holds`, `NearKilling.allLift_holds`, `NearKilling.ineNorm`, `infLifts (infStep InertialTypesAlt.stableOf)`, `recChars InertialTypesAlt.suppIne`, `Zero.LLC.recTExists`, `DzType.normV_eq_of_padic`, `DenseInvFrob.isSplitAt_of_inertiaDeg_eq_one`, `CuspRep.UnrSat.eventually_hasSatGL_locRep`, `AboveL.exists_isPlaceOver_of_tower`, `DepthZeroRec.inePol_lpTw_of_mem_Ine`.

## 7. RESUME HERE / HANDOFF
RESUME HERE (galois_rows RUN 3): reconstruct the two global-construction inputs of Theorem B that carry the real number theory — `AboveL.exists_cm_solvDisj_dec_eq` (global solvable CM extension with prescribed local abelian completion, presumably Grunwald–Wang-type) and `AboveL.exists_cm_solvable_split` — then `SphUnr.hasSat_of_unlinked_unr`. Alternative if claimed: `SuppBC` (`suppBC_outright`, depth-zero supercuspidals split by unramified base change of degree n!).
HANDOFF TO: literature (the `Inp.ac`/`js`/`gk`/`chl` trust boundary used here), audit (re-derive Lemma A's trace guard and Step 1h), integration/proof_editor (insert §1–3 under "R1 producer"), lean_validation (elaborate the schema statements against the published cache when available).
