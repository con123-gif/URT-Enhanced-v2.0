# Grok swarm · galois_rows · RUN 1 — native Galois row: Row0, Row0b, `Row0.row0b`, and the CoreAll → Row0 assembly

2026-11-24, 09:23–09:40 GMT (Europe/London). Agent: Grok (galois_rows lane).
**Status: SOURCE-MATCHED + RE-DERIVED in prose; schema-level Lean companion COMPILED (core Lean 4.33.1, no Mathlib, no upstream import). The upstream declarations themselves were NOT elaborated or kernel-checked here.** No URT premise; URT was not used as evidence for anything below. RH status remains OPEN.

**CLAIM (this lane):** native Galois row construction downstream of `CoreAll` — `Row0`/`Row0b` definitions, `Row0.row0b`, `galoisLocalGlobal_of_placeClassCompatibility`, and the two producers `R1` and `LocalGlobalCompatAtIwahoriFixedPlaces`. This closes the RESUME HERE left by `specialists/galois_representations/RUN1_ROW_BRIDGE.md` and `RUN2_CORE_DESCENT.md` ("locate Row0, Row0b, Row0.row0b; reconstruct exact place/rank guard weakening and compare with galois_realisation_of_rank_two"). It does not redo RUN2 (two lifts, Core → CoreAll), which is taken as an input.

**Continuity note (written after re-fetching the branch head 9dbcc10 at 09:34 GMT):** while this run was in progress, `specialists/galois_representations/RUN3_ROW0B_GUARD_AND_INPUTS.md` (commit 950f904, 09:33 GMT) independently reconstructed `Row0.row0b` and the `Inp` eleven-field ledger. My §1–2 was derived separately from the same pinned blobs and **agrees with RUN3** on every point (same witnesses, only the IsQpBig guard changes, Row0b is the restriction, `galois_realisation_of_rank_two` is off-path). Treat §1–2 here as an independent second derivation of RUN3, not as new mathematics. **New in this file:** §3 (the full CoreAll + R1 + H2 → Row0 assembly, clause by clause), §4 (the two producers R1 and LocalGlobalCompatAtIwahoriFixedPlaces, through `r2g`), §5 (a compiled Lean schema companion for the weakening and the inertia-to-degree-0 lemmas; RUN3's Python replay was "supplied not executed"), and the 66,168-file import-closure measurement. RUN3's RESUME (Crys.alg/hk, HeckeDeRham) is not touched here.

## 0. Provenance (all at upstream pin `40e56bab026552e089d7afcfeff08d2defb9c005`)

Abbreviations: `G/` = `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/`, `AV/` = `src/Development/AbelianVarietyTheory/`. Blob ids computed locally with `git rev-parse <pin>:<path>` and re-checked by `replay_source_checks.py`.

| tag | file | blob | declarations (line) |
|---|---|---|---|
| S | G/IntegralStructures/RowSrc.lean | f769999a | `galoisLocalGlobalStrong_recParameter` (6) |
| D | G/IntegralStructures/Development.lean | 4d4d9506 | `recT` (18), `coreAll_of` (20), `rest` (24), `galoisLocalGlobal_of_geometry_lift` (27), `galoisLocalGlobalStrong_of_geometry_lift` (30) |
| A | G/TypeConditions/WeightsConjAlt.lean | 486af16e | `RecNotion` (16), `Away` (35), `Above` (51), `Props` (66), `Row0` (85), `Row1` (91), `Row1.row0` (97) |
| B | G/TypeConditions/WeightsConjBis.lean | 0a1eab0e | `IsQpBig` (15), `IsQpBig.isQp` (18), `AwayB` (26), `Away.big` (33), `AboveB` (39), `PropsB` (54), `Row0b` (69), `Props.big` (75), `Row0.row0b` (84) |
| L | G/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean | eebd76fc | `LocalGlobalCompatibilityAtPlaceClass` (24), `localGlobalAtPlaceClass_of_localGlobal` (45), `charPol_of_ine` (53), `dim_of_ine` (59), `guard_tame` (70), `exists_hasSat` (77), `Cmp` (84), `away` (96), `above` (108), `exists_weights` (127), `crys` (150), `galoisLocalGlobal_of_placeClassCompatibility` (157), `galois_realisation_of_rank_two` (173), `galoisLocalGlobal_of_localGlobalCompatibility` (192), `galois_realisation_of_top` (195) |
| Q | AV/Statements/EllipticCurveLevels/IsQg.lean | 0b885c44 | `R1` (13), `IsQg` (28), `R2` (31), `Top` (49) |
| W | AV/Definitions/GaloisGeometry/IsWeight.lean | 5a5df49a | `Weak` (18), `ClauseAt` (28), `InScope` (58), `PlaceOK` (65), `Ex` (70) |
| C | AV/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean | 8b43b079 | `PlainTor` (30), `Core`/`CoreAll` (94/96) |
| U | G/SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean | e01a86b5 | `inq_holds` (8), `galoisCompat_unlinkedSupport_of_spherical` (10) |
| T | G/SphericalGaloisCompatibility/ToralDeRham/GaloisCompatUnlinkedSupportOfSpherical.lean | 63df8eba | `deRham_of_plainTor` (27), `galoisCompat_unlinkedSupport_of_spherical` (69) |
| P | G/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean | f6b0fadd | `Apart` (13), `LocalGlobalCompatAtIwahoriFixedPlaces` (16) |
| O | G/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean | 90390f83 | `toTor_holds` (14), `localGlobalCompatAtIwahoriFixed_of_unlinked` (18) |
| R | G/SphericalGaloisCompatibility/PAdicSplitting/R2g.lean | bead0ea0 | `r2g` (14) |
| I | G/SphericalGaloisCompatibility/PAdicSplitting/InfLifts.lean | a9ca7e5e | `MixedOf` (14), `ToTor` (40), `DRDesc` (55) |
| Y | G/SphericalGaloisCompatibility/ToralDeRham/AwayEqOfPlainTor.lean | e21c79c0 | `away_eq_of_plainTor` |
| H | G/SphericalGaloisCompatibility/Chl.lean | a2f8772a | `Inq` (11) |

Exact source chain (re-read, not inferred from names):
```
S: galoisLocalGlobalStrong_recParameter : Row0b recT
   := galoisRepresentations_of_thetaLift tLiftK                  (RUN1: = galoisLocalGlobalStrong_of_geometry_lift geoOne_holds tLiftK)
D: galoisLocalGlobalStrong_of_geometry_lift geo up := Row0.row0b recT (galoisLocalGlobal_of_geometry_lift geo up)
D: galoisLocalGlobal_of_geometry_lift geo up := rest (coreAll_of seed cong up)          (CoreAll: RUN2)
D: rest h := galoisLocalGlobal_of_localGlobalCompatibility h (R1-producer h) (H2-producer (R1-producer h))
     R1-producer   = U.galoisCompat_unlinkedSupport_of_spherical = T.galoisCompat_unlinkedSupport_of_spherical inq_holds
     H2-producer   = O.localGlobalCompatAtIwahoriFixed_of_unlinked = r2g mixedOf toTor_holds drDesc recTExists
L: galoisLocalGlobal_of_localGlobalCompatibility C H1 H2
     := galoisLocalGlobal_of_placeClassCompatibility C H1 (localGlobalAtPlaceClass_of_localGlobal H2 (fun _ _ _ _ _ => True))
```
Off-path: `L.galois_realisation_of_rank_two` and `L.galois_realisation_of_top` are referenced in no other file of the 66,168-file import closure of `RowSrc` (grep over the fetched closure; see §6). They are parallel results, not used by the main proof.

## 1. What `Row0` and `Row0b` say (decoded definition, all quantifiers kept)

Fix a "reciprocity notion" `Rc : RecNotion` — for every number field E, algebraic closure Ω, valuation subring A of Ω over a finite place w, a predicate on maps `rc : IrrGL(E_w) → WD(h)` (local Langlands candidates). On the actual path `Rc = recT = IsRecT`.

**Row0 Rc** (A:85): for every CM field E, algebraic closure Ω, prime l, field isomorphism ι : \bar Q_l ≅ C, rank a ≥ 1, cuspidal π of GL_a(A_E) and Hecke character χ of the maximal real subfield E⁺ such that π is **regular algebraic** and **(π, χ) is a polarized pair**, there exist a homomorphism r : G_E → GL_a(\bar Q_l), an integer wt and a multiset-valued HT : Hom(E, \bar Q_l) → Multiset ℤ with `Props Rc π ι r wt HT`:
1. `cont`: r is continuous; `ss`: r is semisimple;
2. `away`: for every finite w with l ∉ w, every A over w, every rc with Rc h rc, every local component σ of π at w: `Away (WD(r|_{G_w}) via ι) (rc(algNorm σ))`, where **Away x y** means
   (dim) equal dimensions; (tor) if y is `Tor` (trivial on commutators of the Weil group) and y has N = 0, then x = y; (tame0) if **w ≅ Q_g for a prime g (IsQp)**, y is tame (`TmW`), "square-free" (`Sqf`: every inertia eigenvalue of multiplicity ≥ 2 is a (Nw−1)-th root of unity) and N_y = 0, then N_x = 0 and x, y have equal characteristic polynomials at every degree-0 Weil element;
3. `weights`: for every τ, HT(τ) mapped into C equals {(a−1)/2 − z : z ∈ infinitesimal character of π at ι∘τ};
4. `weights_conj`: HT(τ∘c) = wt − HT(τ) (c = complex conjugation of E);
5. `above`: for every l-adic local datum (LocPrime P, Ainf AI with LocTied nonempty, place w, A, h, coefficient ring O, bridge Bw with `Induces`): `Above` = (crys) at spherical σ: r|_{G_w} is crystalline, de Rham, with HT jumps HT(τ) at each induced embedding; (nice) for every rc with Rc h rc, if ((IsQp w ∧ TmW ∧ Sqf) ∨ Tor) for rc(algNorm σ) and N = 0, then de Rham, potentially semistable, jumps HT(τ), and `Away (WD_pst(r|_{G_w})) (rc(algNorm σ))`.

**Row0b Rc** (B:69) is literally the same statement with `Props` → `PropsB`, `Away` → `AwayB`, `Above` → `AboveB`, where the **only** change is the tame guard: `IsQp w` is replaced by **`IsQpBig w n`: w ≅ Q_g continuously for a prime g with n = 1 or 16 n² < g** (with n = dim y in AwayB.tame0, n = a in AboveB.nice). All other fields (cont, ss, dim, tor, weights, weights_conj, crys) are copied verbatim (checked in B:26–67 against A:35–83).

## 2. Theorem (B:84 `Row0.row0b`): Row0 Rc → Row0b Rc, and Row0b is the *weaker* row

*Proof (re-derived).* Since IsQpBig w n = IsQp w ∧ (n = 1 ∨ 16n² < g) up to repackaging, `IsQpBig.isQp` (B:18) is the projection. In `Away`, the tame0 clause is an implication whose antecedent contains IsQp w; replacing IsQp w by the stronger IsQpBig w n makes the implication weaker, so `Away x y → AwayB x y` (B:33). In `Above.nice`, the hypothesis is a disjunction (IsQp ∧ TmW ∧ Sqf) ∨ Tor; the AboveB disjunct (IsQpBig w a ∧ TmW ∧ Sqf) implies the Above one by the same projection, and the conclusion's Away is weakened to AwayB by the previous step; `crys` is identical. Hence `Props → PropsB` (B:75). Row0 and Row0b are both "∀ inputs, ∃ (r, wt, HT) with property", so the implication on the property transports under the same witnesses (B:84). ∎

Consequences that must be carried downstream (not previously recorded):
- **The adjective "Strong" in `galoisLocalGlobalStrong_recParameter` does not mean a stronger statement.** Row0b retains *less* tame local–global information: tame characteristic-polynomial compatibility is only asserted at places w ≅ Q_g with g > 16a² (or a = 1). The schema companion (§5, `awayB_not_away`) shows the abstract implication is strict. Any downstream consumer (`OpenImageCondition.mk h`, `vwin_of_row h`, `every_character_of_literature_of_vWin`) may therefore use tame compatibility only at such large-residue-characteristic degree-one places.
- The witnesses r, wt, HT are unchanged: Row0b is obtained without re-choosing the Galois representation.
- `L.galois_realisation_of_rank_two` (L:173) proves Row0b **directly** from CoreAll, R1 and the weaker hypothesis `LocalGlobalCompatibilityAtPlaceClass IsQpBig`; it is not on the RH path (§0), but shows Row0b only ever needs local–global compatibility at IsQpBig places. A route that replaces H2 by that weaker hypothesis is an alternative, *not* what the pinned proof does.

## 3. Theorem (L:157 → L:192, used by D:24 `rest`): CoreAll ∧ R1 ∧ LocalGlobalCompatAtIwahoriFixedPlaces → Row0 recT

Inputs: C : CoreAll = Ex .all ∧ ∀ c, SphericalLevelCondition .all c (definition C:96; producer is RUN2's `coreAll_of_core`); H1 : R1 (Q:13); H2 : LocalGlobalCompatAtIwahoriFixedPlaces (P:16). First `localGlobalAtPlaceClass_of_localGlobal H2 Q` (L:45) specialises H2 to its right disjunct (IsQg w ∧ Apart) for any place class Q; with Q ≡ True this is the class used here.

*Proof (re-derived).* Fix E, Ω, l, ι, a ≥ 1, π, χ with hr : π regular algebraic and hp : (π, χ) polarized. Then InScope .all l π χ = (hr, hp, True) (W:58).
1. *Representation.* C.1 (= Ex .all, W:70) gives r with Weak π ι r = (continuous r) ∧ AttC ι r π. `cont` = hW.1; `ss` = hW.2.1 (the first component of AttC — not unpacked here; see dependency list).
2. *Hodge–Tate data (`exists_weights`, L:127).* `PolarizedWeight.exists_isWeight` gives wt with IsWeight π wt: infChar(τ∘c) = {a − 1 − wt − z : z ∈ infChar(τ)}. Regular algebraicity (hI.1) gives, for each z ∈ infChar(ι∘τ), an integer n, and the source proves (a−1)/2 − z = −n from it by `push_cast; ring` (the exact integrality clause of `IsRegAlg` is not unpacked here); so HT(τ) := {(a−1)/2 − z} lies in ℤ (lift via `Multiset.canLift`). Conjugation: HT(τ∘c) = {(a−1)/2 − (a−1−wt−z)} = {wt − ((a−1)/2 − z)} = wt − HT(τ), using injectivity of ℤ → C on multisets. This proves `weights` and `weights_conj`.
3. *Away from l (`away`, L:96 with Q = True).* Let l ∉ w, rc with IsRecT h rc, σ a local component; put x = WD(r|_{G_w}), y = rc(algNorm σ).
   (dim) dim x = |Fin a| = a, and IsRecT supplies dim y = a.
   (tor) If y is Tor with N = 0, then algNorm σ is `PlainTor` (`plainTor_of_tor`, using genericity of algNorm σ from `generic_algNorm`); R1's away branch then gives x = rc(algNorm σ).
   (tame0) If IsQp w, TmW y, Sqf y, N_y = 0: `guard_tame` (L:70, via `mixed_of_tame`, `dz_of_nu`) gives σ has nonzero K₁-fixed vectors and algNorm σ is `Apart`; H2 (place-class form) then gives N_x = 0 and equality of characteristic polynomials on inertia. **Extension to degree-0 Weil elements (`charPol_of_ine`, L:53):** every Weil element is g = Frob^{deg g}·t with t in inertia (`exists_eq_zpow_mul deg_frob`); if deg g = 0 then g = t, so the inertia equality applies. ∎(away)
4. *Spherical places above l (`crys`, L:150).* If σ is spherical, `exists_hasSat` gives Satake parameters B with HasSat (via `cuspRep_satake_iff_localComponent_satake`, `exists_hasSatGL_of_isIrreducible`); C.2 at clauses .crys and .dR with PlaceOK .all = True gives crystalline and de Rham, and the de Rham clause's jump statement is instantiated at J = HT(τ) using `weights`.
5. *Non-spherical places above l (`above`, L:108).* Under ((IsQp ∧ TmW ∧ Sqf) ∨ Tor) and N_y = 0: if y is Tor, R1's above branch gives de Rham, pst, N = 0 for WD_pst, and characteristic-polynomial equality at all Weil elements; `eq_of_mono0_charPol` upgrades this to equality WD_pst = y. Otherwise `guard_tame` + H2's above branch give inertia equality, and `dim_of_ine` (dimension = degree of the characteristic polynomial at the identity of inertia) and `charPol_of_ine` give the Away fields; the `tor` field is vacuous (¬Tor). ∎
All 5 clauses of `Props` are produced for the same r, wt, HT, so Row0 recT holds. ∎

Type-level remark kept, not re-derived: L passes `hq : IsQp w` (GalStar, A) where `LocalGlobalCompatibilityAtPlaceClass` asks for `IsQg w` (Q:28). Both bodies read "∃ prime g and a continuous ring isomorphism Q_g ≅ E_w"; acceptance by Lean requires definitional equality, which the published build implies but which was not re-elaborated here.

## 4. The two producers (structure of proof, exact inputs)

**4a. R1 from CoreAll (T:69, with Inq = `inq_holds`, U:8).** R1 asserts, for π, r weakly attached and every local component σ with **algNorm σ plainly toral** (Bernstein–Zelevinsky support consisting of length-one segments, i.e. characters, pairwise unlinked; C:30): away from l, N = 0 and WD(r|_{G_w}) = rc(algNorm σ) for every IsRecT rc; above l, de Rham with HT jumps, pst, N = 0 and characteristic-polynomial equality with rc(algNorm σ) at every Weil element.
Mechanism (one argument reused for all three branches): (i) `plainTor_exists_chars` writes algNorm σ through characters ξ; (ii) `localArtinExists_holds` gives a local Artin map; (iii) **solvable CM base change makes the local component spherical**: `exists_sph_lift_of_toral` gives a CM extension M/E, a place u | w, a cuspidal PM of GL_a(A_M) with the same infinitesimal character (`hlift.inf`), in scope, with Satake parameters at u; r|_{G_M} is weakly attached to PM (`weak_comp_res`); (iv) CoreAll's spherical clauses at u (`hC.2 .unr` via `toralGal_of_holds`; `.dR`; `.crys` and `.phi` via `toralAbove_of_holds`) give the conclusions over M_u; (v) descent to E_w: `deRham_descends` and `jumps_descend` (de Rham property and HT jumps descend from a finite extension, with embeddings matched by τ_L ∘ (E → M) = τ), and `rc_unlinked_chars` identifies rc(algNorm σ) with the sum of the characters, so `eq_of_mono0_charPol` gives the equality away from l. `Inq` additionally carries `chl`: CharLift for prime-degree Galois CM steps (H:11), which the lift construction consumes.

**4b. LocalGlobalCompatAtIwahoriFixedPlaces from R1 (R:14).** Input case split on (PlainTor(algNorm σ)) ∨ (IsQg w ∧ Apart(algNorm σ)), with K₁-fixed vectors, IsRecT rc, N = 0:
- *PlainTor:* restrict R1's conclusions to inertia elements (immediate).
- *IsQg ∧ Apart:* `MixedOf` (I:14) gives a **mixed inertial type**; `ToTor` (I:40; producer `toTor` from `suppBC_outright`, `unrField_holds`, `allLift_holds`, `ineNorm`, `infLifts (infStep stableOf)`, `recChars suppIne`, `recTExists`) gives an extension X.K/E in a controlled family, a base change P with equal infinitesimal character, a place u over the same A where the local component T is **plainly toral**, an IsRecT rc′, and a matching t ↦ t′ of inertia elements preserving the action and the characteristic polynomials. Apply R1 to (X.K, P, r|_{G_{X.K}}): away from l transfer back by `wdOf_restricts` + `restricts_lpDim_mono0_charPol`; above l the de Rham clause comes from `DRDesc` (descent from base changes at every A′ over w, each produced by `recTExists` + `ToTor`), pst from `exists_bridge` + `isPstAt_of_resTo`, and the WD comparison from `wdAt_resTo`. ∎
So the whole Iwahori-fixed local–global input is reduced to R1 by "make the type plainly toral after a base change, then restrict back". Inertia is the right level: restriction to an open subgroup preserves inertia characteristic polynomials but not Frobenius, which is exactly why H2 and `Away.tame0` only claim degree-0 / inertia equalities.

## 5. Formal companion (EXECUTED; schema level only)

`GaloisRowsSchema.lean` (this folder). Core Lean `leanprover/lean4:v4.33.1` (the upstream `lean-toolchain`), no Mathlib, no upstream import. Every upstream predicate (IsQp, IsQpBig, TmW, Sqf, Tor, mono0, lpDim, degree-0 equality, Weil multiplication, Frobenius powers, inertia inclusion, degree) is a universally quantified parameter, so each theorem holds for *every* instantiation, including the upstream definitions; the only upstream fact assumed is the projection IsQpBig w n → IsQp w (hypothesis `hbig`, = `IsQpBig.isQp`) and, for `charPol_of_ine`, the factorisation g = Frob^{deg g}·t and Frob^0·x = x (= `exists_eq_zpow_mul deg_frob`, `zpow_zero`, `one_mul`). Proved: `Away.big`, `nice_big` (Above → AboveB clause), `row_mono` (∀∃ transport, the shape of Row0.row0b), `awayB_not_away` (strictness in a two-point model), `charPol_of_ine`, `dim_of_ine`. What it does **not** do: it does not show that the schema predicates *are* the upstream ones (that needs elaboration against the published olean cache — the `lean_validation` lane), and it does not touch §3–4.

Command and full real output (`VALIDATION_LOG.txt` §1):
```
$ nice lean +leanprover/lean4:v4.33.1 GaloisRowsSchema.lean; echo "exit=$?"
'GrokGaloisRows.Away.big' does not depend on any axioms
'GrokGaloisRows.nice_big' does not depend on any axioms
'GrokGaloisRows.row_mono' does not depend on any axioms
'GrokGaloisRows.awayB_not_away' does not depend on any axioms
'GrokGaloisRows.charPol_of_ine' does not depend on any axioms
'GrokGaloisRows.dim_of_ine' does not depend on any axioms
exit=0
```
(Two earlier attempts failed on name clashes / `include` placement and were fixed; no `sorry` remains — `#print axioms` lists none.)

## 6. Validation evidence (actually run)

1. Upstream fetched as a blob-less partial clone of `leanprover-community/riemann-hypothesis`; full tree at the pin = 175,190 paths. Import-closure BFS (`bfs_import_closure.py`, source in `VALIDATION_LOG.txt` §3, lazy blob fetch) from `IntegralStructures.RowSrc`: **66,168 files** fetched (from `InertCharpoly.GaloisLocalGlobalOfLocalGlobalCompatibility` alone: 7,142). Selective loading of the needed source closure takes minutes and well under 1 GB, versus the ~105 GB compiled cache.
2. `python3 replay_source_checks.py <clone>`: 13 blob-id checks + 35 verbatim declaration-text checks → `checks ok=48 bad=0`, exit 0 (`VALIDATION_LOG.txt` §2).
3. `grep -rl "galois_realisation_of_rank_two\|galois_realisation_of_top"` over the 66,168-file closure → 1 file (L only): off-path. `grep -rl "Row0.row0b"` → B and D only.
4. Arithmetic in §3 step 2 (HT conjugation identity) is a one-line algebraic identity; no numeric test was run or is claimed.
Not run: Lean elaboration of upstream files; `#print axioms` on upstream constants; any audit of the producers listed in §7.

## 7. Remaining dependencies (unproved here; each is an open obligation)

From §3: `C.1 = Ex .all` and `C.2` (CoreAll; mapped by RUN2, producers open), `AttC → IsSSRep` (first component of `UpperTheory.V.Af.AttC`), `PolarizedWeight.exists_isWeight`, `plainTor_of_tor`, `generic_algNorm`/`isGeneric_of_isLocComp`, `mixed_of_tame`, `dz_of_nu`, `eq_of_mono0_charPol`, `cuspRep_satake_iff_localComponent_satake`, `exists_hasSatGL_of_isIrreducible`, `exists_eq_zpow_mul`, `deg_frob`, `WD.charPol_natDegree`, `lpDim_wdOf`, `mem_of_induces`.
From §4a: `inq_holds` = (`Inp.inp_holds`, `GamX.charLiftPrime_holds`), `plainTor_exists_chars`, `localArtinExists_holds`, `exists_sph_lift_of_toral`, `weak_comp_res`, `toralGal_of_holds`, `away_eq_of_plainTor`, `toralAbove_of_holds`, `deRham_descends`, `jumps_descend`, `rc_unlinked_chars`.
From §4b: `mixedOf`, `toTor` and its seven inputs listed above, `drDesc`, `recTExists`, `wdOf_restricts`, `restricts_lpDim_mono0_charPol`, `exists_bridge`, `isPstAt_of_resTo`, `wdAt_resTo`.

## 8. RESUME HERE / HANDOFF

RESUME HERE (galois_rows RUN 2): reconstruct `GlobalTheory.RoadU.exists_sph_lift_of_toral` (the solvable-CM-lift that makes a plainly toral local component spherical) with all quantifiers, since it is the single mechanism behind all three R1 branches; then `toTor` (mixed → plainly toral). In parallel, any lane consuming Row0b (theta/character_boxes: `OpenImageCondition.mk h`, `vwin_of_row h`) should record that only IsQpBig-place tame compatibility (g > 16a² or a = 1) is available.
HANDOFF TO: integration/proof_editor (replace "Row0b conversion OPEN" by §2–3), audit (re-derive §2 and check the IsQp/IsQg defeq remark), lean_validation (elaborate `Row0.row0b` and the schema statements against the published cache), theta/character_boxes (IsQpBig consequence).
