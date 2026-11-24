# Human-readable RH reconstruction — integrated working manuscript

2026-11-24. INCOMPLETE. Source-matched conditional arguments, not independent kernel validation. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Do not mix current main revisions. This manuscript includes complete peer chapter texts as evidence appendices; the reading spine below identifies the exact joins. Duplicate explanations are retained in appendices for audit. No URT premise.

## Reading spine
1. Galois row from geometry and theta lift: appendix 1. The same row supplies both Row fields of the literature record, plus independent VWin; RecTExists is separate.
2. Literature and theta inputs: appendices 2–4. Seven inputs, not the older everyE₂ route. Align CF0 and CF1 by maximum, then apply the new StageU derivation below.
3. Arithmetic volume and design: appendices 5–6. The volume inequality is conditional on ArithHilbertSamuel, ArCalc and NefNumerics; it does not itself imply RH. The nine closed predicates must hold on the same family chosen after K. TopPlug uses HypsAlt and DefiniteSideCondition, not the parallel Hyps route.
4. Arithmetic bound: appendices 7–8. Normalize error by Q=nT*m*b>0. The resulting exponent is 1/2+(C+3)eps. For fixed s to the right of 1/2 choose eps sufficiently small before choosing a family. Arbitrarily late full windows suffice.
5. Analytic nonvanishing: appendices 9–11. Positive family weights prevent cancellation of residues. The one-sided window majorant controls high derivatives; a pole to the right of theta gives exponential growth contradicting that bound. Retain the analytic tail and pole-isolation obligations.
6. Primitive to imprimitive and zeta reflection: appendices 6 and 12. Finite Euler factors do not vanish in Re(s)>0; exclude the principal pole at 1. Modulus one gives zeta, and functional equation excludes nontrivial left-half zeros.

## New StageU bridge (source-matched composition)
Source src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean, blob c0ce994aa86f737b707b5617fb10bcfb35c0117e, declaration hypotheses_nonempty_of_unramified_exponents_alt. Inputs: P:UnitaryGroupThirdPlaceHypotheses, RowRat, hL:RecTExists, real cDep, A:GroupRetwisting.AtP, EvLgG A, linked prime-two-three slot norms at parametersOfDependence hL cDep, and linked FunctionalCondition and CovolumeBoundThirdPlaceSeries at the SAME extended parameters E=parametersOfExtension(extensionWithAtProperty hL (extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry). Conclusion Nonempty(HypsAlt S0.NL DefiniteSideCondition).

Proof of composition. Large unramified exponent bundles produce hP,hMem,hEx. The geometric Galois third-layer theorem applied to P.litN and P.toHypothesesX produces prN and serN. Surjectivity and low weights give hOL. The open parameter theorem gives hO. GalC.final_alt_alt uses P.nLink, prN, P.toHypothesesX, serN, depthZeroSupport', localFiniteness, localTateDuality, localEulerChar, hL,cDep and the original linked norm hypothesis to produce hNrow. The stronger-extension theorem supplies a pair of transport maps: its second component sends hO to hO', and its first component transports hNrow with predicate S0.NL(Cp.D3 3 A) to linked slot norms at E. The transport witness is x↦⟨x.1.1⟩, not a free identification of two parameter spaces. Apply allRows_of_open0_alt to global Artin reciprocity, convergent Siegel-Weil, discrete series cover, Harish-Chandra modules, cusp rapid decay, Casselman-Wallach, discrete series classification, both hOL projections, hL, the extended parameters, S0.NL, hO', hL3,hF,hN'. This yields hAll. Finally nonempty_hyps_of_allRows_alt uses hP, litThin, wuDecayOfGap, rowsFinDim_link, rowsPos_typeP, rowNGP and rowMainEqP from Siegel-Weil, volumeRatio from Siegel-Weil, genusMassAt_two, KPx, S0.NL, DefiniteSideCondition, the constant membership witness fun _ => hMem, hEx and hAll. This constructs the desired nonempty record. No theorem producer is discharged by its name; this closes only the composition junction.

Executed static check: 12/12 source substrings and exact connector blob ID matched. Reproduce by git show 40e56bab026552e089d7afcfeff08d2defb9c005:src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean and inspect the named calls. No Lean execution.

## Numbered remaining obligations
1. Native GeoOne, TLiftK, CoreAll and Row0b conversion, all arithmetic producers.
2. RecTExists and native VWin/host existence.
3. Exact literature theorem provenance and seven-input producer proofs, including 15 covolume premises.
4. StageU producer proofs (large exponent bundles, final_alt_alt, stronger extension, allRows, nonempty_hyps), now exact composition mapped.
5. Nine design closure producers, rank, lattice, thick density and host estimates; exact same witness throughout.
6. Full analytic tail and derivative, nearest-pole and residue proofs and external lemma audit.
7. Full reachable elaborated dependency export and trust ledger; denominator unknown. No global coverage percentage. Local coverage: 12/12 selected peer chapters included, not 12/12 proof obligations solved.
8. Independent mathematical and kernel audit of all joins and producer proofs. No final closure.

RESUME HERE: expand the exact stronger-extension transport theorem and allRows_of_open0_alt, checking the two maps' domains and codomains; integrate the next source-matched peer chapters into a new dated manuscript. HANDOFF TO: theta, geometry, integration, formal audit.

## Evidence appendices


---

## Appendix 1: specialists/galois_representations/RUN1_ROW_BRIDGE.md
Working-repo blob 0ad31b240da3079f8803c4360b7725840f681a35.

# Galois arithmetic run 1 — source-matched bridge
2026-11-24. PARTIAL, not kernel-checked. Source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Main now 6c6821263d6b80f4ec3d7479b0159340c1b2f65e; original RowSrc path returns 404 there. Do not mix versions. Read swarm protocol, expansion, queue, AGENTS, continuity, research log/protocol/state and peer theta/integration/kernel/acceleration checkpoints. Physical CI PASS 45345201880 is unrelated to RH.

## Exact source inventory
Paths relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/:
- A IntegralStructures/RowSrc.lean f769999ac5e49241993e5efbf81e4d2cded18acd
- B ThetaParseval/ThetaKernels/TLiftK.lean e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713
- C IntegralStructures/GaloisRepresentationsOfThetaLift.lean 869a5e68fcff90c1ee29a6dae75594ed8a59ada9
- D IntegralStructures/Development.lean 4d4d9506494734f28fce7d39bac1a50650ecf148
- E IntegralStructures/GeometricFlagBases/WeightOneGeometricRealization.lean 4af6c909184001b272f7bfc504eac4606dcda763
- F ThetaParseval/HalfIndexLattices/TLiftK.lean 4b36fc43e988270944cef2fc1b5e9ee1493fc275
- G ThetaParseval/ThetaKernels/TPGHolds.lean c621b46b313d554ed00af05fb0ab8eb4c5050c60
- H IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean eebd76fca5538c7a0156cf330cedd4b663b0d70a
- I IntegralStructures/CrystallineDescent/ToCoreK.lean e4235a62a4bce78539c94be995d8f5a0ff59fac3

## Human-readable proof of the composition (not proofs of all producers)
A:galoisLocalGlobalStrong_recParameter is C:galoisRepresentations_of_thetaLift applied to B:tLiftK. B uses G:tLift_holds_k. C combines E:geoOne_holds and the lift via D:galoisLocalGlobalStrong_of_geometry_lift. E unfolds HolomorphicLefschetzFormula and invokes lefschetz_fixedPoint_finite_etale_correspondence; geometric_realization_of_weight_one then yields GeoOne. This is a separate geometric input, not a consequence of the theta lift alone.

F:TLiftK quantifiers: for every CM number field E with base B satisfying W.GoodK, every n>=1 and Hermitian space X of rank n with J=1 and X.IsHerm(cj E,B,n,0), there exists a natural threshold d0. For every d>=d0, every skew-Hermitian W with J=delta times identity and W.IsSkew(cj E,B,d,0), every pair of Hecke characters chiX,chiW with ResEtaPow on the specified units-map range at n,d, and archimedean exponents mX,mW satisfying HasExp, every complex submodule U of functions on UA E n and family lam of dominant weights, assume IsAutRepU U, HasWeightAt at every embedding B.emb w, and d+mW(w)<=2 lam(w).w(k) for every w,k. Then there exists a complex submodule U' of functions on UA E d with IsLift B chiX chiW mX mW lam U U'. The threshold precedes the choices of W, characters and U. IsLift remains an unexpanded predicate, not merely existence of a nonzero vector. G produces the lift using tLift_of_tools_k, tools_holds_k and hgtEx_of_k(stab2Cpt_k). The tools record contains 14 fields: swFull, boxSec, dbl, stab2, cpt, basic, polSch, unfold0, pairEx, split, vacFix, acts, lie1, lie2. Their producers include anisotropic Siegel-Weil, Eisenstein continuation, compactness, finite volume, unimodularity, tower pair/model/Weil existence, real Lie lift. These are substantive dependencies.

D:recT is exactly fun h rc => IsRecT h rc. Given GeoOne and TLiftK, seedFinOdd_of_geoOne and congFinOdd_of_ex(wtLacEx_holds) give seed and congruence. limFinOdd_of seed cong, congPhi_holds and descOffT together with TLiftK yield Core via I:toCoreK (it applies toCore to twoUpOK_of_k hT). coreAll_of_core upgrades Core to CoreAll. D:rest uses CoreAll, galoisCompat_unlinkedSupport_of_spherical(CoreAll) and localGlobalCompatAtIwahoriFixed_of_unlinked of that same compatibility to produce Row0 recT. Finally Row0.row0b recT gives Row0b recT. Do not infer Row0b is stronger from its name: its definition and conversion still need auditing.

H explains the actual local-global construction. Given CoreAll C, R1 H1 and LocalGlobalCompatAtIwahoriFixedPlaces H2, specialize H2 to the always-true place class Q. For every CM E, algebraic closure Omega, prime l, ring equivalence Qbar l to C, positive rank a, cusp representation pi, character chi and scope hypotheses hr,hp, form InScope .all l pi chi=(hr,hp,trivial). C.1 supplies a representation r and Weak evidence. exists_weights supplies integer wt and multisets HT for each embedding tau; mapped to C these equal the infinitesimal character shifted by (a-1)/2 and negated. Under complex conjugation HT maps by x -> wt-x. This uses polarized weight and integrality of the infinitesimal character; neither is automatic.

Away from l, H:away compares wdOf with rc(algNorm sigma): equal dimensions, equality when Tor and mono0, and conditional monodromy-zero plus characteristic polynomial equality for degree-zero Weil elements when Q, IsQp, TmW, Sqf and mono0 hold. The Tor branch uses H1 and plainTor_of_tor. The tame branch uses guard_tame to get nontrivial KOne fixed vectors and Apart, then H2; charPol_of_ine rewrites a degree-zero Weil element as an inertia element using exists_eq_zpow_mul. At places above l, H:above requires Nonempty LocTied, LocBridge with Pst.Induces, IsRecT, local component, mono0, and either the Q/IsQp/TmW/Sqf conjunction or Tor. It returns de Rham clause, potentially semistable evidence, and Away comparison. Tor case uses H1 and eq_of_mono0_charPol; non-Tor case uses H2, dim_of_ine and charPol_of_ine. H:crys separately obtains Satake data from spherical local component and applies C.2 to crystalline and de Rham clauses. These branches fill Row0, retaining HT identities and local conditions. No claim for arbitrary ramified representations outside these hypotheses.

Downstream junction: MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4 supplies the same Row0b h twice in OpenLiteratureStatements with recTExists, plus independent vwin_of_row h. VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4 constructs VWin from OpenImageCondition.mk h, baseChangeN and h. Then every_character_of_literature_of_vWin yields EveryCharacter. The theta specialist already mapped that adapter; this lane supplies its arithmetic input. No assumption dropped.

## Executed static checks
Nine grouped assertions in V8 against actual connector-returned pinned source files A-I: A call to C/B; B call to G; C geometry/lift application; D five core/row references; E two Lefschetz/geometry references; F threshold, Hecke, restriction, exponent, existential U'; G tools/height/Lie references; H five local-global/weight/branch references; I twoUpOK conversion. All 9 succeeded. Replay: git checkout the pin; git hash-object each file and compare inventory; grep -F each named call in the corresponding declaration. Connector blob identities recorded, not independently hashed. No Lean execution, no elaborated edges, no independent proof of imported producers, no URT speed result. Source-matched composition only.

RESUME HERE: locate exact Row0 and Row0b definitions via H's imports and audit Row0.row0b, then unpack CoreAll/Core and twoUpOK_of_k to determine which crystalline descent and congruence assumptions are discharged by TLiftK. Preserve all quantifiers and both local branches.
HANDOFF TO: integration, theta, character-box and audit lanes. The two independent arithmetic inputs GeoOne and TLiftK and their CoreAll/Row0 conversion are now mapped. No physical research files changed.



---

## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md
Working-repo blob cfbb71f3c6ed91a29acbca54a16961d501cfc3d1.

# Literature provenance audit — RUN 1, 2026-11-24

**REVIEW / SOURCE-MATCHED; OPEN full translation.** Separate from physics. No kernel verification executed in this session, no URT speed claim, no new axiom, no gate change.

Pinned upstream leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005; adapter [source](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean) blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24. Current main observed d27f71347abceb76cd37dc8a5fccbe556ec2be90; same path blob f4f6eb32f04c91b5cde32f11631828eb4016fa7f. Use original pin for all numbered entries.

Preflight: read swarm protocol, handoff, expansion, AGENTS, continuity, research state, proper runner log/protocol, CI summary and peer checkpoint extracts (dependencies, integration, character boxes, Galois, theta, kernel, acceleration, prime, Landau, math, structure). No prior literature lane file in branch tree. Prior physical CI PASS run 45347447866 at 07:43:18 UTC; not an RH certificate. No baseline Queue or protected files changed.

## 1. Distinguish named literature from axioms

The package `UpperTheory.LiteratureTheorems.OpenLiteratureStatements` is a proposition-valued structure (adapter L215–218), not an axiom declaration. It has three fields: `caraianiLocalGlobalDual : UpperTheory.One.M.Row`, `localLanglandsExists : UpperTheory.Zero.LLC.RecTExists`, `galoisRepOfPolarizedPairLit : UpperTheory.One.M.Row`. In particular, the first and third fields have the SAME Row type; they are not, merely by their names, the full propositions `GlobalTheory.Published.CaraianiLocalGlobalDual` or `PositivityTheory.Lit1.GRPP.GaloisRepOfPolarizedPairLit`. The record is inhabited in the actual call chain; not a hypothesis of the final RH statement.

`src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean` blob ee340012ab19713a8acfecf8adc6a331cbc2f1a4 L7–11: `everyCharacter_of_row` assumes a particular `Row0b` witness h, constructs O as the three values h, recTExists, h, and separately supplies `vwin_of_row h`. `everyCharacter` supplies h via `UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter`. No independent second Row assumption. Preserve both field projections and the separate VWin obligation. This is not a proof that the Row or RecTExists constructions are simple; their obligations must be expanded, not deleted.

Four direct literal field readers in the adapter:

| L | Theorem suffix | Field | Source role |

|---:|---|---|---|

| 283 | local_langlands_recT_exists_of_literature | localLanglandsExists | returns the field itself |

| 285 | pair_u_of_literature | galoisRepOfPolarizedPairLit | applies field_of_starFull_alt with additional local Langlands, converse and exhaustion premises |

| 459 | carU_local_global_of_literature | caraianiLocalGlobalDual | applies ofDual_star_alt with rigidity/multiplicity/boundedness inputs |

| 609 | literature_automorphy | caraianiLocalGlobalDual | constructs a record with named additional obligations; not just projection |

All four occur in the explicit qualified-name closure of the local final adapter. Original L313–314 `local_langlands_gl_recT_exists_of_literature` calls `llOf_alt` with 12 explicit inputs (including the local Langlands existence projection); those other obligations cannot be removed solely because an input has the same conclusion type. At observed current head the corresponding name is an alias of the projection wrapper, not the original 12-input body. This is a concrete upstream source simplification, NOT a demonstrated equivalence of all old and new reachable proof terms. Do not silently mix revisions.

## 2. Auditable producer / assumption ledger (selected actual imports)

All paths below relative to `src/Development/` at pinned revision. Classify the declaration syntax and source dependency, not a theorem's historical authorship. Source names are not bibliographic evidence.

| Path / blob | Classification and exact relevant obligations |

|---|---|

| AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean / 268786576f96cb5a2cea5fab2da4cf4f291c1116 | L21–66 `theorem recTExists : RecTExists := by`: constructs Artin datum a via artEx, cuspidal map r via cuspEx, extension rc via exists_isLExt; fills dim, one, langlands, cusp, nu, absCentral, twist, central, dual, inj, depth, type fields. No declaration-level extra premise. Retain all twelve fields and dependency proofs. Not an externally postulated axiom at this source boundary. |

| AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean / f769999ac5e49241993e5efbf81e4d2cded18acd | L6 theorem `galoisLocalGlobalStrong_recParameter : Row0b recT` applies galoisRepresentations_of_thetaLift to tLiftK. No extra source hypothesis at this declaration. Both producers still require expansion; Galois lane owns them. |

| AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/CaraianiLocalGlobalDual.lean / b3ff07fbd208eea125eccc13f29f31ed3744f018 | L18 `def ... : Prop`: defines a universally quantified assertion for CM number field, algebraic closure, prime l, comparison embedding, rank a≥2, cuspidal representation, conjugate-duality and cohomological premises; asks for a continuous semisimple Galois representation, away-l WD matching and local potentially semistable/WD matching under the specified local bridges. A proposition definition, not an inhabitation proof or axiom. Not identical by name to O's Row field. Citation equivalence to a published theorem not established here. |

| WeilBound/CoreStatements/PublishedTheorems/PolarizedGaloisRepresentations/GaloisRepOfPolarizedPairLit.lean / 38f7e1a7956f0e6ac5fbd94900e965bf25c438c6 | L5 `def ... : Prop := GlobalTheory.Published.PolarizedGaloisRepPublished`: definitional alias, no evidence of truth by itself. |

| AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/PolarizedGaloisRepPublished.lean / 4791e8bac2cacc067368c1ef336387541d7acb7c | L16–70 structures Above and Props plus L64–71 proposition definition: CM field/closure, l prime, a≥1, regular algebraic polarized cuspidal pair; existential r, wt, HT; retain continuity, semisimplicity, polarization, away-l matching, purity, weight and conjugate-weight conditions, above-l de Rham/jumps/Iwahori/spherical conditions. Definition and record types, not supplied axiom. Exact published-source attribution OPEN. |

| AbelianVarietyTheory/PublishedTheorems/Divisors₂/GrothendieckDeformation.lean / 88188d49a09a09565265ef1e83f9a91335cafec4 | L12–15 proposition definition with commutative R, ideal I, nilpotent divided powers, surjection to R₀ with kernel I. L21–27 and L31–36 derive GrothendieckMessing and at_dualNumber respectively **from H : GrothendieckDeformation**. These are conditional theorem bodies, not proof of H. Adapter L405 instead calls grothendieckDeformation_of_lifting on the abelian de Rham and lifting producers. Follow that separate producer. |

| WeilBound/CoreStatements/PublishedTheorems/ClozelPurity/Bridge.lean / acdc20a9470643d48c08b07e2e204a630cc0d2b9 | L6–7 theorem clozelPurity applies clozelPurity_of_bounded to CompanionTheory.CuspFinGL.cuspFormsBoundedGL. Explicit theorem application, not literature axiom. |

| WeilBound/CoreStatements/TemperedRepresentationTheory/ClozelPurity/ClozelPurityOfBounded.lean / 0f9d3ef28325a8b392146d12b4a4423fa55e09cb | L10–12 theorem clozelPurity_of_bounded is a conditional implication CuspFormsBoundedGL → ClozelPurity, supplying infChar witnesses and using CompanionTheory.ClozelPurity.purity. Need its proof and the bound's producer before condensing this branch. |

Important: the selected files above are not a census of every imported PublishedTheorems module. Their citation claims and semantic equivalence to traditional literature must be checked against exact mathematical definitions, hypotheses and theorem statements before attributing them to the named authors. Do not assume a name is a proof or an external axiom.

## 3. Complete lexical adapter ledger

Executed in the connector JavaScript runtime on the actual fetched original source. 815 split lines, 195 explicitly named theorem declarations; 311 deduplicated directed edges between them, 17 direct local neighbours of the final adapter, all 195 reachable by explicit qualified-name scanning, 152 bodies with no literal O token, 43 with O token (including forwarders and records), four direct field readers, three distinct literal field names, zero unmatched qualified LiteratureTheorems references. Distinguish 311 unique source edges from use multiplicity (e.g. two projections of the same conjunction). These counts are for this single file, not the full proof. `no O token` means syntactically unused in the explicit body, not an elaborated dependency/semantic independence proof. No explicit `axiom`, `constant`, `sorry`, or `admit` token detected by prior line scan within this adapter; not a transitive axiom audit.

Rows below identify the full set of declarations and their local source dependencies. Every row has status SOURCE-MATCHED only; all external/implicit edges and publication attributions OPEN until audited. O = parameter mentioned in explicit source body; Fields = literal O.field accesses. Source ranges identify original declarations; blank columns mean no match, not absence of elaborated dependency.

| Lines | Declaration suffix (UpperTheory.LiteratureTheorems) | O | Fields | Local qualified dependency suffixes |

|---|---|---|---|---|

| 219–220 | logDerivOne | no | — | — |

| 221–222 | ellipticMainTheoremCM' | no | — | — |

| 223–224 | heckeTateFunctionalEquation' | no | — | — |

| 225–226 | hilbertClassFieldJ' | no | — | — |

| 227–228 | partial_zeta_functional_equation_of_literature | no | — | — |

| 229–230 | deligne_ribet_of_literature | no | — | — |

| 231–232 | siegel_klingen_deligne_ribet_of_literature | yes | — | deligne_ribet_of_literature |

| 233–234 | join_out_of_literature | yes | — | ellipticMainTheoremCM', hilbertClassFieldJ', siegel_klingen_deligne_ribet_of_literature, partial_zeta_functional_equation_of_literature, heckeTateFunctionalEquation' |

| 235–236 | ht_card_of_literature | no | — | — |

| 237–238 | ab_mul_n_st_of_literature | no | — | — |

| 239–240 | abelian_de_rham_of_literature | no | — | — |

| 241–242 | de_rham_pot_semistable_of_literature | no | — | — |

| 243–244 | global_artin_reciprocity_of_literature | no | — | — |

| 245–246 | hecke_l_adic_character_de_rham_of_literature | no | — | — |

| 247–248 | algebraic_character_wd_of_literature | yes | — | global_artin_reciprocity_of_literature, hecke_l_adic_character_de_rham_of_literature, de_rham_pot_semistable_of_literature |

| 249–250 | ar_calc_of_literature | no | — | — |

| 251–252 | ar_degree_of_literature | no | — | — |

| 253–254 | principalisation_of_literature | no | — | — |

| 255–256 | arith_hilbert_samuel_of_literature | yes | — | principalisation_of_literature |

| 257–258 | automorphic_forms_finite_gl_of_literature | no | — | — |

| 259–260 | base_change_isobaric | no | — | — |

| 261–262 | base_change_definite_unitary_group_of_literature | yes | — | base_change_isobaric |

| 263–264 | bernstein_unitary_product_irreducible_of_literature | no | — | — |

| 265–266 | bernstein_zelevinsky_finiteness_of_literature | no | — | — |

| 267–268 | bhatt_scholze_integral_of_literature | no | — | — |

| 269–270 | bhatt_scholze_crystalline_lattices_of_literature | yes | — | bhatt_scholze_integral_of_literature |

| 271–272 | bloch_kato_local_of_literature | no | — | — |

| 273–274 | borel_casselman_of_literature | no | — | — |

| 275–276 | brauer_degree_zero_of_literature | no | — | — |

| 277–278 | cm_curve_good_outside_prime_st_of_literature | no | — | — |

| 279–280 | ess_square_integrable_segments_of_literature | no | — | — |

| 281–282 | local_converse_gl_of_literature | no | — | — |

| 283–284 | local_langlands_recT_exists_of_literature | yes | localLanglandsExists | — |

| 285–286 | pair_u_of_literature | yes | galoisRepOfPolarizedPairLit | local_langlands_recT_exists_of_literature, local_converse_gl_of_literature |

| 287–288 | cusp_forms_bounded_gl_of_literature | no | — | — |

| 289–290 | jacquet_shalika_rigidity_of_literature | no | — | — |

| 291–292 | gelfand_kazhdan_dual_of_literature | yes | — | jacquet_shalika_rigidity_of_literature, cusp_forms_bounded_gl_of_literature |

| 293–294 | generic_unlinked_gl_of_literature | no | — | — |

| 295–296 | chevalley_units_of_literature | no | — | — |

| 297–298 | geometric_restriction_of_literature | no | — | — |

| 299–300 | grothendieck_ring_polynomial_of_literature | no | — | — |

| 301–302 | segment_representation_of_literature | no | — | — |

| 303–304 | zelevinsky_polynomial_ring_of_literature | yes | — | segment_representation_of_literature, grothendieck_ring_polynomial_of_literature |

| 305–306 | depth_zero_induction_of_literature | yes | — | geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature, zelevinsky_polynomial_ring_of_literature |

| 307–308 | langlands_exhaustion_gl_of_literature | no | — | — |

| 309–310 | langlands_multisegments_of_literature | no | — | — |

| 311–312 | standard_cosocle_gl_of_literature | no | — | — |

| 313–314 | local_langlands_gl_recT_exists_of_literature | yes | — | local_langlands_recT_exists_of_literature, local_converse_gl_of_literature, depth_zero_induction_of_literature, brauer_degree_zero_of_literature, chevalley_units_of_literature, global_artin_reciprocity_of_literature, langlands_exhaustion_gl_of_literature, langlands_multisegments_of_literature, standard_cosocle_gl_of_literature, zelevinsky_polynomial_ring_of_literature, geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature |

| 315–316 | irreducible_admissible_gl_of_literature | no | — | — |

| 317–318 | standard_functors_finite_length_of_literature | no | — | — |

| 319–320 | tempered_product_of_square_integrable_of_literature | yes | — | geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature, irreducible_admissible_gl_of_literature, standard_functors_finite_length_of_literature, langlands_exhaustion_gl_of_literature, standard_cosocle_gl_of_literature, langlands_multisegments_of_literature, ess_square_integrable_segments_of_literature |

| 321–322 | casselman_wallach_of_literature | no | — | — |

| 323–324 | chebotarev_degree_one_of_literature | no | — | — |

| 325–326 | chow_form_exists_of_literature | no | — | — |

| 327–328 | clozel_cohomological_of_literature | no | — | — |

| 329–330 | clozel_purity_of_literature | no | — | — |

| 331–332 | complex_multiplication_j_st_of_literature | no | — | — |

| 333–334 | cusp_bounded_of_literature | no | — | — |

| 335–336 | cusp_decay_bound_of_literature | no | — | — |

| 337–338 | cusp_decay_sobolev_of_literature | no | — | — |

| 339–340 | cusp_rapid_decay_of_literature | no | — | — |

| 341–342 | cusp_trace_class_of_literature | no | — | — |

| 343–344 | cuspidal_mirabolic_of_literature | no | — | — |

| 345–346 | cuspidal_spectrum_gl_of_literature | no | — | — |

| 347–348 | cycle_heights_of_literature | no | — | — |

| 349–350 | depth_zero_jacquet_injective_of_literature | no | — | — |

| 351–352 | depth_zero_support_of_literature | no | — | — |

| 353–354 | discrete_series_classification_of_literature | no | — | — |

| 355–356 | discrete_series_cover_of_literature | no | — | — |

| 357–358 | discrete_series_cover_exists_of_literature | no | — | — |

| 359–360 | discrete_series_exists_of_literature | no | — | — |

| 361–362 | discrete_series_hermitian_unique_of_literature | no | — | — |

| 363–364 | discrete_series_lowest_k_type_of_literature | no | — | — |

| 365–366 | discrete_series_upq_exists_of_literature | no | — | — |

| 367–368 | dixmier_malliavin_factorisation_of_literature | no | — | — |

| 369–370 | siegel_eisenstein_continuation_of_literature | no | — | — |

| 371–372 | doubling_method | yes | — | cusp_rapid_decay_of_literature, siegel_eisenstein_continuation_of_literature |

| 373–374 | flath_tensor_product_of_literature | no | — | — |

| 375–376 | unitary_irreducible_admissible_of_literature | no | — | — |

| 377–378 | flath_factorisation_of_literature | yes | — | flath_tensor_product_of_literature, unitary_irreducible_admissible_of_literature |

| 379–380 | fontaine_bcris_of_literature | no | — | — |

| 381–382 | formal_algebraisation_of_literature | no | — | — |

| 383–384 | formal_degree_compact_dual_of_literature | no | — | — |

| 385–386 | gk_globalisation_of_literature | no | — | — |

| 387–388 | gl_howe_duality_of_literature | no | — | — |

| 389–390 | cusp_u_of_literature | yes | — | gelfand_kazhdan_dual_of_literature, pair_u_of_literature |

| 391–392 | generic_unitary_dual_gl_of_literature | no | — | — |

| 393–394 | geometric_restriction_filtration_of_literature | no | — | — |

| 395–396 | good_chern_weil_of_literature | no | — | — |

| 397–398 | green_cuspidal_of_literature | no | — | — |

| 399–400 | green_regular_characters_of_literature | no | — | — |

| 401–402 | green_series_st_of_literature | no | — | — |

| 403–404 | abelian_lifting_of_literature | no | — | — |

| 405–406 | grothendieck_deformation_of_literature | yes | — | abelian_de_rham_of_literature, abelian_lifting_of_literature |

| 407–408 | grothendieck_messing_of_literature | yes | — | grothendieck_deformation_of_literature |

| 409–410 | principal_polarisation_one_section_of_literature | no | — | — |

| 411–412 | harish_chandra_analyticity_of_literature | no | — | — |

| 413–414 | harish_chandra_finite_of_literature | no | — | — |

| 415–416 | harish_chandra_modules_of_literature | no | — | — |

| 417–418 | hasse_norm_st_of_literature | no | — | — |

| 419–420 | hecke_l_adic_character_of_literature | no | — | — |

| 421–422 | hecke_l_adic_character_crystalline_of_literature | yes | — | hecke_l_adic_character_de_rham_of_literature, de_rham_pot_semistable_of_literature, algebraic_character_wd_of_literature, local_langlands_gl_recT_exists_of_literature |

| 423–424 | hecke_l_adic_character_above_of_literature | yes | — | hecke_l_adic_character_de_rham_of_literature, hecke_l_adic_character_crystalline_of_literature, de_rham_pot_semistable_of_literature |

| 425–426 | hecke_l_adic_parameter_above_of_literature | yes | — | algebraic_character_wd_of_literature |

| 427–428 | hecke_l_entire_and_nonzero_at_one_of_literature | no | — | — |

| 429–430 | hecke_l_partial_continuation_of_literature | no | — | — |

| 431–432 | hermitian_hasse_principle_of_literature | no | — | — |

| 433–434 | hermitian_local_global_of_literature | no | — | — |

| 435–436 | holomorphic_discrete_series_of_literature | no | — | — |

| 437–438 | howe_duality_real_of_literature | no | — | — |

| 439–440 | ideal_invariants_one_orbit_st_of_literature | no | — | — |

| 441–442 | induced_simple_lowest_alcove_of_literature | no | — | — |

| 443–444 | jacquet_shalika_of_literature | no | — | — |

| 445–446 | k_finite_vectors_unitary_of_literature | no | — | — |

| 447–448 | kawamata_viehweg_of_literature | no | — | — |

| 449–450 | kudla_splitting_split_unitary_of_literature | no | — | — |

| 451–452 | l2_extension_log_canonical_of_literature | no | — | — |

| 453–454 | landherr_st_of_literature | no | — | — |

| 455–456 | linnik_of_literature | no | — | — |

| 457–458 | cuspidal_multiplicity_one_of_literature | no | — | — |

| 459–460 | carU_local_global_of_literature | yes | caraianiLocalGlobalDual | jacquet_shalika_rigidity_of_literature, cuspidal_multiplicity_one_of_literature |

| 461–462 | carU_above_l_of_literature | yes | — | automorphic_forms_finite_gl_of_literature, local_langlands_gl_recT_exists_of_literature, carU_local_global_of_literature |

| 463–464 | metaplectic_representation_of_literature | no | — | — |

| 465–466 | moy_prasad_jacquet_iso_of_literature | no | — | — |

| 467–468 | nadel_vanishing_and_non_klt_divisor_of_literature | no | — | — |

| 469–470 | nef_numerics_of_literature | no | — | — |

| 471–472 | point_separation_pair_of_literature | no | — | — |

| 473–474 | poitou_tate_normalised_of_literature | no | — | — |

| 475–476 | prismatic_dieudonne_hodge_of_literature | no | — | — |

| 477–478 | quadratic_class_field_theory_of_literature | no | — | — |

| 479–480 | radford_shuffle_polynomial_of_literature | no | — | — |

| 481–482 | siegel_weil_unitary_convergent_of_literature | no | — | — |

| 483–484 | weil_theta_convergence_of_literature | no | — | — |

| 485–486 | rallis_inner_product_convergent_of_literature | yes | — | doubling_method, siegel_weil_unitary_convergent_of_literature, weil_theta_convergence_of_literature |

| 487–488 | ray_character_artin_of_literature | yes | — | global_artin_reciprocity_of_literature |

| 489–490 | ray_class_field_st_of_literature | no | — | — |

| 491–492 | real_metaplectic_representation_of_literature | no | — | — |

| 493–494 | regular_algebraic_purity_of_literature | yes | — | clozel_purity_of_literature, clozel_cohomological_of_literature |

| 495–496 | schur_orthogonality_square_integrable_of_literature | no | — | — |

| 497–498 | semi_abelian_hom_extension_of_literature | no | — | — |

| 499–500 | semi_abelian_lie_seminegative_of_literature | no | — | — |

| 501–502 | semistable_reduction_st_of_literature | no | — | — |

| 503–504 | serre_holomorphic_sections_of_literature | no | — | — |

| 505–506 | siegel_eisenstein_simple_pole | no | — | — |

| 507–508 | siegel_set_unitary_of_literature | no | — | — |

| 509–510 | siegel_toroidal_integral_of_literature | no | — | — |

| 511–512 | siegel_weil_unitary_schrodinger_of_literature | no | — | — |

| 513–514 | square_integrable_segment_of_literature | yes | — | ess_square_integrable_segments_of_literature |

| 515–516 | stone_von_neumann_of_literature | no | — | — |

| 517–518 | strong_approx_su_of_literature | no | — | — |

| 519–520 | theta_rational_invariance_of_literature | no | — | — |

| 521–522 | toroidal_compactification_of_literature | no | — | — |

| 523–524 | toroidal_for_fan_ks_of_literature | no | — | — |

| 525–526 | totally_disjoint_product_irreducible_of_literature | no | — | — |

| 527–528 | unlinked_product_irreducible_of_literature | yes | — | totally_disjoint_product_irreducible_of_literature |

| 529–530 | unramified_doubling_gl_of_literature | no | — | — |

| 531–532 | vol_ge_of_literature | yes | — | arith_hilbert_samuel_of_literature, ar_calc_of_literature, nef_numerics_of_literature |

| 533–534 | vol_nef_of_literature | yes | — | arith_hilbert_samuel_of_literature |

| 535–536 | weber_ray_field_st_of_literature | no | — | — |

| 537–538 | weil_representation_exists_of_literature | no | — | — |

| 539–540 | weil_representation_unitary_pair_of_literature | no | — | — |

| 541–542 | weil_siegel_formula_unitary_of_literature | no | — | — |

| 543–544 | weyl_branching_of_literature | no | — | — |

| 545–546 | dual_abelian_scheme_of_literature | no | — | — |

| 547–548 | zarhin_statement | yes | — | dual_abelian_scheme_of_literature |

| 549–550 | fargues_exact_of_literature | no | — | — |

| 551–552 | nef_rr_of_literature | no | — | — |

| 553–554 | poincare_lelong_inv_of_literature | no | — | — |

| 555–556 | principalisation_char_zero_of_literature | no | — | — |

| 557–558 | resolution_char_zero_of_literature | no | — | — |

| 559–560 | cheb_of_literature | no | — | — |

| 561–562 | eis_bl_of_literature | no | — | — |

| 563–564 | siegel_weil_std_of_literature | no | — | — |

| 565–566 | theta_integrals_agree_and_local_matching_of_literature | yes | — | eis_bl_of_literature, siegel_weil_std_of_literature |

| 567–568 | global_euler_char_of_literature | no | — | — |

| 569–570 | global_finiteness_of_literature | no | — | — |

| 571–572 | localEulerChar_alt_alt | no | — | — |

| 573–574 | local_finiteness_of_literature | no | — | — |

| 575–576 | local_tate_duality_of_literature | no | — | — |

| 577–578 | greenberg_wiles_of_literature | yes | — | poitou_tate_normalised_of_literature, global_euler_char_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt, local_finiteness_of_literature |

| 579–580 | unramified_orthogonality_of_literature | no | — | — |

| 581–582 | siegelWeilU_unitary_convergent_of_literature | no | — | — |

| 583–584 | local_euler_char_k_of_literature | no | — | — |

| 585–586 | local_finiteness_k_of_literature | no | — | — |

| 587–588 | local_tate_duality_k_of_literature | no | — | — |

| 589–608 | literature_local | yes | — | bernstein_zelevinsky_finiteness_of_literature, bernstein_unitary_product_irreducible_of_literature, geometric_restriction_of_literature, zelevinsky_polynomial_ring_of_literature, totally_disjoint_product_irreducible_of_literature, moy_prasad_jacquet_iso_of_literature, tempered_product_of_square_integrable_of_literature, ess_square_integrable_segments_of_literature, square_integrable_segment_of_literature, generic_unlinked_gl_of_literature, langlands_multisegments_of_literature, langlands_exhaustion_gl_of_literature, standard_cosocle_gl_of_literature, local_langlands_recT_exists_of_literature, local_converse_gl_of_literature, depth_zero_induction_of_literature, brauer_degree_zero_of_literature, chevalley_units_of_literature, green_regular_characters_of_literature |

| 609–625 | literature_automorphy | yes | caraianiLocalGlobalDual | cusp_rapid_decay_of_literature, harish_chandra_finite_of_literature, automorphic_forms_finite_gl_of_literature, jacquet_shalika_of_literature, cuspidal_spectrum_gl_of_literature, base_change_isobaric, gelfand_kazhdan_dual_of_literature, pair_u_of_literature, clozel_purity_of_literature, clozel_cohomological_of_literature, global_artin_reciprocity_of_literature, ray_class_field_st_of_literature, hecke_l_adic_character_above_of_literature, algebraic_character_wd_of_literature, de_rham_pot_semistable_of_literature |

| 626–638 | literature_cohomology | yes | — | poitou_tate_normalised_of_literature, local_finiteness_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt, global_finiteness_of_literature, global_euler_char_of_literature, unramified_orthogonality_of_literature, greenberg_wiles_of_literature, local_finiteness_k_of_literature, local_tate_duality_k_of_literature, local_euler_char_k_of_literature, bloch_kato_local_of_literature |

| 639–644 | literature_nonexistence | yes | — | literature_local, literature_automorphy, literature_cohomology, join_out_of_literature, heckeTateFunctionalEquation' |

| 645–657 | published_results_analytic | yes | — | weil_representation_unitary_pair_of_literature, discrete_series_exists_of_literature, harish_chandra_analyticity_of_literature, discrete_series_classification_of_literature, cusp_trace_class_of_literature, dixmier_malliavin_factorisation_of_literature, flath_factorisation_of_literature, weil_siegel_formula_unitary_of_literature, doubling_method, unramified_doubling_gl_of_literature, hecke_l_partial_continuation_of_literature, ht_card_of_literature |

| 658–665 | published_results_local | yes | — | fontaine_bcris_of_literature, global_artin_reciprocity_of_literature, bloch_kato_local_of_literature, local_tate_duality_k_of_literature, local_euler_char_k_of_literature, local_finiteness_k_of_literature, bhatt_scholze_integral_of_literature |

| 666–726 | published_results_eigen | yes | — | clozel_cohomological_of_literature, green_cuspidal_of_literature, hecke_l_adic_character_of_literature, chebotarev_degree_one_of_literature, cusp_u_of_literature, base_change_definite_unitary_group_of_literature, bhatt_scholze_crystalline_lattices_of_literature, hecke_l_adic_character_above_of_literature, cusp_rapid_decay_of_literature, weil_siegel_formula_unitary_of_literature, siegel_weil_unitary_convergent_of_literature, doubling_method, unramified_doubling_gl_of_literature, bernstein_zelevinsky_finiteness_of_literature, formal_degree_compact_dual_of_literature, bernstein_unitary_product_irreducible_of_literature, geometric_restriction_filtration_of_literature, unlinked_product_irreducible_of_literature, depth_zero_jacquet_injective_of_literature, jacquet_shalika_of_literature, automorphic_forms_finite_gl_of_literature, carU_above_l_of_literature, regular_algebraic_purity_of_literature, global_artin_reciprocity_of_literature, hecke_l_adic_parameter_above_of_literature, de_rham_pot_semistable_of_literature, harish_chandra_finite_of_literature, green_regular_characters_of_literature, zelevinsky_polynomial_ring_of_literature, ray_class_field_st_of_literature, ray_character_artin_of_literature, generic_unitary_dual_gl_of_literature, standard_cosocle_gl_of_literature, cheb_of_literature, discrete_series_cover_of_literature, harish_chandra_modules_of_literature, casselman_wallach_of_literature, weil_representation_unitary_pair_of_literature, discrete_series_exists_of_literature, discrete_series_classification_of_literature, strong_approx_su_of_literature, siegelWeilU_unitary_convergent_of_literature, harish_chandra_analyticity_of_literature, cusp_trace_class_of_literature, dixmier_malliavin_factorisation_of_literature, flath_factorisation_of_literature, cm_curve_good_outside_prime_st_of_literature, weber_ray_field_st_of_literature, discrete_series_cover_exists_of_literature, siegel_weil_unitary_schrodinger_of_literature, siegel_eisenstein_continuation_of_literature, siegel_eisenstein_simple_pole, schur_orthogonality_square_integrable_of_literature, literature_nonexistence, published_results_analytic, published_results_local, depth_zero_support_of_literature, local_finiteness_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt |

| 727–780 | published_results_first | yes | — | green_series_st_of_literature, linnik_of_literature, complex_multiplication_j_st_of_literature, cuspidal_mirabolic_of_literature, weyl_branching_of_literature, bernstein_unitary_product_irreducible_of_literature, zelevinsky_polynomial_ring_of_literature, bernstein_zelevinsky_finiteness_of_literature, cusp_trace_class_of_literature, flath_factorisation_of_literature, weil_siegel_formula_unitary_of_literature, rallis_inner_product_convergent_of_literature, doubling_method, unramified_doubling_gl_of_literature, hermitian_local_global_of_literature, quadratic_class_field_theory_of_literature, borel_casselman_of_literature, radford_shuffle_polynomial_of_literature, dixmier_malliavin_factorisation_of_literature, schur_orthogonality_square_integrable_of_literature, hecke_l_partial_continuation_of_literature, logDerivOne, k_finite_vectors_unitary_of_literature, discrete_series_lowest_k_type_of_literature, holomorphic_discrete_series_of_literature, gk_globalisation_of_literature, cusp_bounded_of_literature, strong_approx_su_of_literature, hecke_l_entire_and_nonzero_at_one_of_literature, real_metaplectic_representation_of_literature, cusp_decay_bound_of_literature, gl_howe_duality_of_literature, kudla_splitting_split_unitary_of_literature, metaplectic_representation_of_literature, harish_chandra_modules_of_literature, discrete_series_cover_of_literature, ideal_invariants_one_orbit_st_of_literature, hermitian_hasse_principle_of_literature, stone_von_neumann_of_literature, discrete_series_upq_exists_of_literature, formal_degree_compact_dual_of_literature, theta_rational_invariance_of_literature, discrete_series_hermitian_unique_of_literature, discrete_series_exists_of_literature, harish_chandra_finite_of_literature, cusp_rapid_decay_of_literature, weil_representation_unitary_pair_of_literature, discrete_series_cover_exists_of_literature, cusp_decay_sobolev_of_literature, casselman_wallach_of_literature, howe_duality_real_of_literature, siegel_set_unitary_of_literature, weil_representation_exists_of_literature |

| 781–809 | published_results_arithmetic | yes | — | toroidal_compactification_of_literature, vol_ge_of_literature, vol_nef_of_literature, ar_calc_of_literature, abelian_de_rham_of_literature, ray_class_field_st_of_literature, semistable_reduction_st_of_literature, strong_approx_su_of_literature, green_series_st_of_literature, good_chern_weil_of_literature, landherr_st_of_literature, hasse_norm_st_of_literature, semi_abelian_hom_extension_of_literature, induced_simple_lowest_alcove_of_literature, principal_polarisation_one_section_of_literature, ab_mul_n_st_of_literature, grothendieck_messing_of_literature, prismatic_dieudonne_hodge_of_literature, kawamata_viehweg_of_literature, nef_numerics_of_literature, l2_extension_log_canonical_of_literature, arith_hilbert_samuel_of_literature, chow_form_exists_of_literature, cycle_heights_of_literature, serre_holomorphic_sections_of_literature, nadel_vanishing_and_non_klt_divisor_of_literature, principalisation_of_literature, formal_algebraisation_of_literature |

| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poincare_lelong_inv_of_literature, fargues_exact_of_literature, zarhin_statement, nef_rr_of_literature, siegel_toroidal_integral_of_literature, toroidal_for_fan_ks_of_literature, semi_abelian_lie_seminegative_of_literature, point_separation_pair_of_literature, ar_degree_of_literature, published_results_arithmetic, grothendieck_deformation_of_literature, local_langlands_gl_recT_exists_of_literature |

## 4. Independent verification boundary

Read Andrew Sutherland's 2026-11-24 03:30 UTC report and the underlying audit log at https://math.mit.edu/~drew/grh/ and https://math.mit.edu/~drew/grh/audit.log; Lean FRO/Mathlib joint statement 2026-11-21 https://leanprover-community.github.io/blog/posts/riemann-hypothesis/. The published submission's five headline theorems were reported to use only propext, Classical.choice and Quot.sound; audit.log identifies 15 axiom constants in its entire environment, all Init, including the unused sorryAx. The theorem axiom closure is not the whole environment list. Independent kernels and statement comparison are reported successful. The public report does not substitute for our source-linked explanation or our own export/commit correspondence check. Do not label all named literature lemmas as separately kernel-audited from this report; no local Lean executable/kernel run or downloaded export in this lane.

## 5. Reproduction and actual checks

Below is the exact census/check logic executed here, with a standalone Node driver for replay. It is an intentionally source-format-specific scanner, not a Lean parser: it recognizes explicit fully qualified names and literal O.field tokens; comments, macros, local notation, implicit references and alias evolution require a kernel export or more general parser. The standalone driver is supplied for reproducibility; not separately executed in this session. Checkout the pinned commit and run with the adapter path. It verifies the raw Git blob SHA before scanning.

```js

import {readFileSync} from 'node:fs';

import {createHash} from 'node:crypto';

function census(s){
 const lines=s.split("\n"), starts=[];
 for(let i=0;i<lines.length;i++){const m=lines[i].match(/^theorem UpperTheory\.LiteratureTheorems\.([^\s(]+)/u);if(m)starts.push({name:m[1],i});}
 const names=new Set(starts.map(x=>x.name));
 const rows=starts.map(({name,i})=>{
  let j=i+1;while(j<lines.length&&!/^(?:theorem |def |structure |alias |namespace |end\b|section\b|open |set_option |noncomputable|private |@\[)/u.test(lines[j]))j++;
  const m=lines[i].match(/^(.*?)(?: :=\s*| where\s*)$/u);if(!m)throw Error("unrecognized declaration "+lines[i]);
  const body=lines.slice(i+1,j).join("\n");
  const refs=[...new Set([...body.matchAll(/(?:_root_\.)?UpperTheory\.LiteratureTheorems\.([\p{L}\p{N}_']+)/gu)].map(x=>x[1]))];
  return {name,line:i+1,end:j,refs:refs.filter(x=>names.has(x)),unmatched:refs.filter(x=>!names.has(x)),fields:[...new Set([...body.matchAll(/\bO\.([\p{L}\p{N}_']+)/gu)].map(x=>x[1]))],bodyO:/\bO\b/u.test(body)};
 });
 const map=new Map(rows.map(r=>[r.name,r])),reachable=new Set(),todo=["every_character_of_literature_of_vWin"];
 while(todo.length){const n=todo.pop();if(reachable.has(n))continue;const row=map.get(n);if(!row)throw Error("missing "+n);reachable.add(n);todo.push(...row.refs);}
 const summary={wrappers:rows.length,edges:rows.reduce((n,x)=>n+x.refs.length,0),without_explicit_O:rows.filter(x=>!x.bodyO).length,with_explicit_O:rows.filter(x=>x.bodyO).length,explicit_field_read:rows.filter(x=>x.fields.length).map(x=>({name:x.name,line:x.line,fields:x.fields,reachable:reachable.has(x.name)})),root_reachable_local_wrappers:reachable.size,root_local_edges:rows.filter(x=>reachable.has(x.name)).reduce((n,x)=>n+x.refs.length,0),root_direct:map.get("every_character_of_literature_of_vWin").refs,unmatched:rows.flatMap(x=>x.unmatched)};
 return {rows,summary};
}

function check(x){
 const q=x.summary;
 if(q.wrappers!==195||q.edges!==311||q.without_explicit_O!==152||q.with_explicit_O!==43||q.root_reachable_local_wrappers!==195||q.root_local_edges!==311||q.explicit_field_read.length!==4||q.unmatched.length!==0||q.root_direct.length!==17)throw Error("unexpected census");
 const expected=["caraianiLocalGlobalDual","galoisRepOfPolarizedPairLit","localLanglandsExists"];
 if(JSON.stringify([...new Set(q.explicit_field_read.flatMap(r=>r.fields))].sort())!==JSON.stringify(expected))throw Error("unexpected literal field set");
 if(q.explicit_field_read.some(r=>!r.reachable))throw Error("missing field-reader reachability");
}

const raw=readFileSync(process.argv[2]);

const sha=createHash('sha1').update(Buffer.from('blob '+raw.length+'\0')).update(raw).digest('hex');

if(sha!=='a13ba1f8c38d4dbf2ddd809fbf9610a007936c24') throw Error('unexpected Git blob '+sha);

const result=census(raw.toString('utf8')); check(result); console.log(JSON.stringify(result.summary,null,2));

```

Executed assertions: exact original blob returned by GitHub, 195/311/152/43 counts, 195 root closure, 17 root direct dependencies, four direct field-reader rows, exact three-field set, zero unmatched local qualified references; current blob and alias change checked. All passed in connector runtime. No compile/test of generated Lean proof; no new physical CI claim. No assumption removed. Runtime complexity of this scoped lexical census is linear in scanned source plus local name/edge storage, subject to string regex/hash costs. Not measured as a proof speedup.

## RESUME HERE

Fetch the actual pinned producer for `GlobalTheory.Published.grothendieckDeformation_of_lifting` by following the adapter's imports (start at the CanonicalOfAbelianDeRham and abelian lifting dependencies); extract its exact two input types, construct a source-linked proof tree down to their producers, and compare the formal target with the historical Grothendieck–Messing theorem under the exact nilpotent divided-power hypotheses. Use this ledger's canonical names rather than translating all 195 interfaces again; coordinate with positivity and audit. Continue until citation and kernel reachability boundaries are closed; do not infer missing proof from a publication's title.

HANDOFF TO: integration, formal audit, positivity geometry, kernel extractor, human proof editor. Record this file as 195 local source declarations/311 edges, no kernel graph expansion claimed; field witnesses and selected PublishedTheorems type/proof distinctions available for reuse.


---

## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md
Working-repo blob 4839d4327ffba33469443bc50fac59778155aa33.

# MATH lane: the exact seven-input `EveryCharacter` adapter

## RESULT

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, the theorem
`UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin` is now traced through the
exact adapter that it invokes.  The decisive source declaration is
`UpperTheory.Lit.every_character_of_theta_integrals_local_matching`, not `everyE₂`.

This is a **source-matched mathematical derivation**, not a new Lean proof and not a claim that the
upstream project has been re-elaborated here.  All theorem names, argument order, and intermediate
types below were read at the pinned revision.  The companion verifier checks the pinned Git blob
identities when run against a checkout of that revision and checks this checkpoint's required
provenance fields locally.

## Source ledger

| ID | Pinned source path | Git blob | Declaration(s) used |
|---|---|---|---|
| `EC-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` | `a13ba1f8c38d4dbf2ddd809fbf9610a007936c24` | lines 565, 666, 727, 810: theta pair, `published_results_eigen`, `published_results_first`, literature wrapper |
| `EC-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean` | `42abe20ee235820aaa924dbabce5e1d2c2540380` | lines 44, 69: hypothesis-bundle constructor and seven-input adapter |
| `EC-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/At23OfAll.lean` | `e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d` | lines 19, 21, 24: two/three-prime family bound and linked packaging |
| `EC-S4` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean` | `c51cb6b5bd4bf2944ace89e00a2990da16bd519a` | lines 12, 16: `ZeroFreeAll` and `EveryCharacter` discharge |
| `EC-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean` | `6ac769568b67f85f33565ba3e1eef7b91f53c55f` | line 13: exact definition of `UpperTheory.EveryCharacter` |
| `EC-S6` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean` | `0e1bad41f4b165c0d9b1693f419530309e1da5ba` | line 16: fifteen-premise construction of `CovolumeBoundOfX` |
| `EC-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean` | `ee340012ab19713a8acfecf8adc6a331cbc2f1a4` | final row-to-character and character-to-RH links |

## Correction to the existing interpretation

The earlier MATH/integration checkpoint treated `FockModels/EveryCharacterE.lean` as if the final
wrapper called `everyE₂` and `hypsE₂`.  That file is imported, and its proof has a parallel shape,
but it is **not the declaration called by the final literature wrapper**.

The actual call graph is:

1. `every_character_of_literature_of_vWin` (`EC-S1`);
2. `every_character_of_theta_integrals_local_matching` (`EC-S2`);
3. `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2`), producing
   `Nonempty (GlobalTheory.Fc.HypsAlt S0.NL GlobalTheory.Fc.DefiniteSideCondition)`;
4. `every_character_of_green_v_win` (`EC-S4`);
5. `zero_free_all_of_green_v_win` followed by `UpperTheory.Top.imprimitive` (`EC-S4`);
6. the proposition `UpperTheory.EveryCharacter` (`EC-S5`).

Thus the final route uses `HypsAlt`, `DefiniteSideCondition`,
`BoundAtTwoThreeFamilyFonAlt`, and `every_character_of_green_v_win`.  Replacing these by the older
`Hyps`, `DRS`, `BoundAtTwoAndThreeForFamily`, and `plugAll` names loses the exact dependency path.

## The exact seven inputs

At `EC-S2:69`, with all quantification explicit, the theorem is:

\[
\begin{aligned}
&P : \mathrm{UnitaryGroupThirdPlaceHypotheses},\\
&F : \mathrm{ThetaLocalInputs},\\
&h_A : \mathrm{ThetaIntegralsAgree},\\
&h_M : \mathrm{LocalMatching},\\
&h_X : \mathrm{CovolumeBoundOfX},\\
&h_L : \mathrm{RecTExists},\\
&h_V : \mathrm{VWin}
\end{aligned}
\quad\Longrightarrow\quad
\mathrm{UpperTheory.EveryCharacter}.
\]

No argument is implicit in the wrapper call and none may be dropped:

1. `P` supplies the global unitary/Galois/analytic package, including
   `P.greenRegularCharacters`, `P.nLink`, `P.litN`, and the fields used to construct the row and
   interpolation data.
2. `F` supplies theta/local inputs used in functional separation, test-vector assembly, theta
   evaluation, and the grid construction.
3. `hA` is equality of the relevant theta integrals.
4. `hM` is the local matching assertion.  It is a separate premise even though the literature
   theorem constructs `hA ∧ hM` in one theorem.
5. `hX` is the covolume bound required by the linked-bundle `L3` step.
6. `hL` is existence of the local-Langlands recursive parameter package.
7. `hV` supplies the zero-free window for every character input to the character-box argument.

The conclusion means exactly (`EC-S5:13`):

\[
\forall N:\mathbb N,\ [\mathrm{NeZero}\ N],\ \forall \chi:\mathrm{DirichletCharacter}(\mathbb C,N),
\ \forall s:\mathbb C,
\quad \tfrac12<\Re(s)\to(\chi\ne1\lor s\ne1)\to L(\chi,s)\ne0.
\]

The exceptional disjunction is preserved: the theorem does not assert nonvanishing at the pole of
the trivial character.

## Derivation of the missing hypothesis bundle

The hard step is `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2:44`).  Its first six
premises are `P,F,hA,hM,hX,hL`; it additionally requires

\[
\forall c_{\mathrm{dep}}\in\mathbb R,
\ \mathrm{RL.LinkedAt}\bigl(\mathrm{parametersOfDependence}(h_L,c_{\mathrm{dep}})\bigr)
\left(
 (Q,L)\mapsto\mathrm{R1.SlotNormCondition}(Q,L)
 \left(\mathcal C\mapsto\mathrm{Closed}(\mathcal C,
 (Fm\mapsto\mathrm{BoundAtTwoThreeFamilyFonAlt}(Fm)))\right)
\right).
\tag{1}
\]

The adapter discharges (1), without a new premise, by

```
fun cDep =>
  UpperTheory.N.boundAtTwoThree_linked_of_recT
    P.nLink
    (GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep)
```

The two steps behind that lambda are explicit in `EC-S3`:

- `at23_family_alt P.nLink Fm` derives `BoundAtTwoThreeFamilyFonAlt Fm` for every family `Fm`
  from the local hypotheses at the primes two and three;
- `boundAtTwoThree_n_linked` packages this familywise statement as `RL.LinkedAt p (...)` by a row
  selected from a property closed for all families.  Instantiating `p` with
  `parametersOfDependence hL cDep` gives (1) for each real `cDep`.

This is the precise prime-window bridge.  It is not a numerical estimate inserted later and it is
not derivable from `VWin`; it is carried by `P.nLink` and universally quantified over the dependence
parameter.

Inside `nonempty_hyps_definite_side_of_closed_bound`, let `C := P.litN`.  The proof constructs:

1. `hS : FunctionalsSeparate` from `F`, the unramified Howe input, and
   `P.siegelWeilUnitaryConvergent`.
2. `hRat : S0.RowRat` from test-vector assembly using `F.siegelSetUnitary`,
   `F.howeDualityReal`, `P.greenCuspidal`, `C.join`, `C.fe`, `hA`, `hM`, and `hS`.
3. `hFit : ConstantFunctionFits` from the alternate Fourier-coefficient fit and the surjectivity/
   low-weight consequence of `P`.
4. A threshold `CF1` with
   `hCF1 : ∀ C ≥ CF1, EvLgG (GridA C)`, obtained from theta evaluation.  Here both `hA` and `hM`
   enter again, together with twisted Weil convergence, local-factor matching, and equality of
   twisted square theta integrals.
5. A threshold `CF0` with the row-function conclusion `hCF0` for all `C ≥ CF0`, obtained from
   `P.discreteSeriesCover`, `P.harishChandraModules`, `P.cuspRapidDecay`,
   `P.casselmanWallach`, `P.rayClassFieldSt`, and `hFit`.

The thresholds are synchronized by the actual choice

\[
C_*:=\max(CF0,CF1).
\]

This choice is logically necessary: `CF1 ≤ C_*` supplies
`hEv : EvLgG (GridA C_*)`, while `CF0 ≤ C_*` allows the row-function theorem to be evaluated at the
same grid.  The proof then constructs:

- `hOpen1`, the open-parameter assertion at
  `parametersOfDependence hL C_*`;
- `hMono`, the stronger-extension open/linked comparison, and `hOpenA := hMono.2 hOpen1`;
- `hFun`, the row function at `C_*`, using `hCF0` and `hOpenA`;
- `hL3`, the linked-bundles `L3` assertion, using the covolume premise `hX`, the same extension, and
  `hOpenA`;
- `hN C_*`, the instance of the universally linked two/three-prime bound (1).

These are exactly the final inputs to
`hypotheses_nonempty_of_unramified_exponents_alt`, which returns

\[
\mathrm{Nonempty}\bigl(
\mathrm{GlobalTheory.Fc.HypsAlt}(S0.NL,
\mathrm{GlobalTheory.Fc.DefiniteSideCondition})
\bigr).
\tag{2}
\]

This explains the difficult step rather than hiding it behind the name “theta correspondence”:
the proof aligns two independently obtained large-parameter thresholds, transports openness to a
linked extension, combines row-function and covolume/L3 data at that single parameter, and adds the
closed two/three-prime bound before constructing the hypothesis bundle.

## From the bundle to `EveryCharacter`

The adapter converts `P.greenRegularCharacters` to
`hG : GlobalTheory.GLq.Green` using `green_of_regular`, and feeds `hG`, `hV`, and (2) to
`every_character_of_green_v_win` (`EC-S4:16`).

The latter first proves `ZeroFreeAll` (`EC-S4:12`).  Given a witness of `HypsAlt`, it calls
`zeroFreeAll_of_topG` at the fixed exponent `la = 3/2`; the required inequality is discharged by
arithmetic.  The shape premise is produced from the witness by
`forall_goal_of_shape_of_hyps` and `shape_closed_link_n_of_green hG`.  For every character object
`ψ`, the remaining window obligation is supplied by `supplyChi ψ (hV ψ)`.

Finally, `UpperTheory.Top.imprimitive` transports the primitive/character-box zero-free statement
to arbitrary Dirichlet characters, yielding the quantified proposition above.  A one-line
summary such as “the window proves RH” would omit the essential uses of the `HypsAlt` witness and
the imprimitive-character transfer.

## How the literature wrapper supplies the seven inputs

At `EC-S1:810`, for
`O : OpenLiteratureStatements` and `hV : VWin`, the wrapper calls the adapter with:

| Adapter input | Exact producer in `EC-S1` | What must remain visible |
|---|---|---|
| `P` | `published_results_eigen O` | the full `UnitaryGroupThirdPlaceHypotheses` record; in particular `greenRegularCharacters` and `nLink` |
| `F` | `published_results_first O` | the full `ThetaLocalInputs` record |
| `hA` | `(theta_integrals_agree_and_local_matching_of_literature O).1` | first projection of one shared conjunction |
| `hM` | `(theta_integrals_agree_and_local_matching_of_literature O).2` | second projection of the same conjunction |
| `hX` | `topCovolSlim2_use_alt_alt` applied to fifteen displayed premises | produces `CovolumeBoundOfX`; it is not an axiom-free scalar estimate |
| `hL` | `local_langlands_gl_recT_exists_of_literature O` | constructed from twelve named local/global representation-theoretic inputs |
| `hV` | the wrapper's second argument | not derived from `O` in this theorem |

The shared theta pair itself is

```
theoremK_head2
  (eis_bl_of_literature O)
  (siegel_weil_std_of_literature O)
```

so the two projections must not be described as independent hypotheses.

The fifteen covolume premises (`EC-S6`) are, in order: resolution in characteristic zero,
principalisation in characteristic zero, inverse Poincaré–Lelong, Hilbert–Samuel use, Moriwaki
bigness, Fargues exactness, Zarhin's statement, nef Riemann–Roch, Siegel toroidal integrality,
toroidal fan `KS`, seminegativity of the semi-abelian Lie bundle, point separation, arithmetic
degree, `PublishedHodgeBundleTheorems`, and Grothendieck deformation.  The theorem constructs
intermediate `HypothesesX` and `HypothesesH`, then calls `topCovolG_alt_alt` with a deep-slim bound.
This dependency must not be collapsed to “volume positivity”.

## Downstream link

`EC-S7` gives the exact final composition:

1. `everyCharacter_of_row h` forms
   `O := ⟨h, recTExists, h⟩` and supplies `vwin_of_row h` to the literature wrapper;
2. `everyCharacter` instantiates `h` with
   `galoisLocalGlobalStrong_recParameter`;
3. `riemannHypothesis` applies `riemannHypothesis_of_everyCharacter`.

This checkpoint therefore establishes the source-accurate adapter chain, not the mathematical truth
of any premise record.  In particular, the fields of `OpenLiteratureStatements`, the covolume
inputs, the Galois row, and `VWin` remain visible dependencies.

## Executed tests

- `python3 verify_every_character_adapter.py --self-test`
- `python3 verify_every_character_adapter.py --report 2026-11-24_every_character_adapter_derivation.md`
- `python3 -m py_compile verify_every_character_adapter.py`

The source-checking mode is:

```
python3 verify_every_character_adapter.py --source-root /path/to/riemann-hypothesis
```

It requires the upstream checkout at the pinned revision and verifies all seven Git blob IDs plus
the exact adapter/wrapper tokens.  That mode was not run here because this lane had GitHub source
access but no local checkout of the upstream Lean repository.

## Failed attempts and limitations

- GitHub code search returned no indexed hit for the adapter identifier.  Scanning the 33 direct
  imports of `EveryCharacterE.lean` also returned no hit.  The declaration was found by scanning
  the 201 direct imports of the final literature wrapper; it is in
  `SiegelEisensteinSecondTermHypotheses.lean`.
- No Lean executable or upstream checkout was available in this workspace, so no `lake build` or
  kernel elaboration was performed.  “Source-matched” must not be upgraded to “independently
  elaborated”.
- This contribution does not audit the internal proof of `hypotheses_nonempty_of_unramified_exponents_alt`,
  `zeroFreeAll_of_topG`, `imprimitive`, or the fifteen-premise covolume theorem.
- No URT comparison or advantage is claimed.

## RESUME HERE

Trace `hypotheses_nonempty_of_unramified_exponents_alt` backwards from its exact source declaration.
Preserve the types of `hEv`, `hN C_*`, `hFun`, and `hL3`, and determine which fields of `HypsAlt`
each one fills.  The next independent check should also locate and unpack
`zeroFreeAll_of_topG` far enough to show precisely how the `la = 3/2` shape and `VWin` character
windows imply `ZeroFreeAll`, without re-summarizing the already audited wrapper.



---

## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md
Working-repo blob a1b2447105e93bccdb53afa6ae802f342df41c61.

# Theta lifts — first source-matched reconstruction of the character bridge

Date 2026-11-24. RESULT: PARTIAL — source-matched human proof of the *composition* of the seven-input adapter; independently executable static source checks (13/13). No independent Lean elaboration, no proof of all input theorems, no RH closure or URT speed claim.

## Provenance and continuity

Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. All references below are to that immutable revision. Current main observed at 6c6821263d6b80f4ec3d7479b0159340c1b2f65e. The two principal files changed blob IDs; the seven-input adapter declaration+body is unchanged in the text comparison; the top literature adapter is changed. Keep revisions separate; do not assume semantic equivalence. Read the swarm protocol, handoff queue, expansion, AGENTS, continuity and research log/state/protocol, peer integration, mathematical, dependency, kernel, acceleration, prime-window and Landau checkpoints. No prior theta-lifts lane artifact in the preflight tree. The most recent physical CI verdict at preflight was PASS for 0f7a23b (run 45345201880); not a check of this RH proof.

Paths A–J are relative to src/Development/; T = AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/.

| ID | path | Git blob SHA |
|---|---|---|
| A | T/EveryCharacterOfLiteratureOfVWin.lean | a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 |
| B | T/SiegelEisensteinSecondTermHypotheses.lean | 42abe20ee235820aaa924dbabce5e1d2c2540380 |
| C | T/TopPlug.lean | c51cb6b5bd4bf2944ace89e00a2990da16bd519a |
| D | WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean | 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 |
| E | AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean | 4d0d94fd3fd9368e5428c05402979d6dd5123b4d |
| F | T/At23OfAll.lean | e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d |
| G | WeilBound/ThetaLifts/SphericalLattices/SphericalClosure/CloseSph.lean | 9a15ec479fb007975f15b6df7fe5fe46615e4f8f |
| H | T/HypothesesNonemptyOfUnramifiedExponents.lean | c0ce994aa86f737b707b5617fb10bcfb35c0117e |
| I | T/TopCovolSlim2Use.lean | 0e1bad41f4b165c0d9b1693f419530309e1da5ba |
| J | T/Prm1.lean | e7e454678d47eaa76c342abbafb4c4bcdf9f372d |

MainConclusion.lean (ee340012ab19713a8acfecf8adc6a331cbc2f1a4) invokes A. Earlier FockModels/EveryCharacterE.lean (01e60174b728fc6b473a308c5bf5dbffbe017afe) provides a similarly named older everyE₂ with different types; it is NOT the explicitly invoked adapter. Use B, not that older theorem. This prevents a real translation error.

## 1. The exact seven-input bridge (A:810–814; B:69–73)

Given O : UpperTheory.LiteratureTheorems.OpenLiteratureStatements and hV : UpperTheory.Top.VWin, obtain:

1. P = published_results_eigen O : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses.
2. F = published_results_first O : GlobalTheory.FunPr.ThetaLocalInputs.
3. hA : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree.
4. hM : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching.
5. hX : GlobalTheory.CovTop.CovolumeBoundOfX, supplied by the exact 15-argument topCovolSlim2_use_alt_alt (I), not the earlier CovolX variant.
6. hL : UpperTheory.Zero.LLC.RecTExists, supplied by local_langlands_gl_recT_exists_of_literature O.
7. hV : UpperTheory.Top.VWin, retained separately from the above.

Both hA and hM are projections of **the same conjunction**, theta_integrals_agree_and_local_matching_of_literature O. Bind it once in the human reading view; retain both edges. No additional axiom or premise removed. A:215 defines O with three fields: caraianiLocalGlobalDual : One.M.Row, localLanglandsExists : Zero.LLC.RecTExists, galoisRepOfPolarizedPairLit : One.M.Row. MainConclusion constructs it as ⟨h, recTExists, h⟩, and supplies vwin_of_row h independently; do not call O empty or externally established. Source inspection alone does not establish kernel-level trust status.

The exact B proof, in human mathematical terms: for each real cDep, F:boundAtTwoThree_linked_of_recT applied to P.nLink and parametersOfDependence hL cDep supplies a linked family bound. With P,F,hA,hM,hX,hL and this universally quantified family of linked bounds, B:nonempty_hyps_definite_side_of_closed_bound constructs an inhabitant of HypsAlt S0.NL DefiniteSideCondition (under Nonempty). Green regular characters in P supply Green via GreenBridge.green_of_regular. Then C:every_character_of_green_v_win applies the independently supplied hV and the inhabitance to obtain EveryCharacter.

## 2. What the theta claims actually mean (E:388–394, 433–447, 458–471, 491–513, 559–595)

Fix arbitrary types F,E with Field and NumberField instances and an Algebra F E, an F-algebra endomorphism σ of E, a base B, natural ranks a,a', a geometric triple G, characters X, and Weil models om,om'. Restrict to IsTriple: B.IsGood σ, G.IsGood B, X.IsGood B a a', and two IsWeil properties using opposite characters X.β with X.β/X.α and X.α with X.α/X.β. In particular G.IsGood has a'<a, even a+a', each archimedean weight difference greater than a+a', 2(p+q)+1 < (a-a')/2 and < a', the specified Hermitian/skew forms and two good models (E:360–371). Natural subtraction/division here is Lean Nat arithmetic. Other IsGood and model conditions remain as defined in E; this is not an assertion for arbitrary representations.

LocalMatching: for *every* such triple there exist real maps R and finite maps Rf with IsMatched. IsMatched retains IsTriple plus IsRealMaps and IsFinMaps. Real maps give common quotient, intertwining equality under Lie derivative and compact-group actions, nontriviality and irreducibility. Finite maps are onto on Schwartz-Bruhat spaces, kill augmentation subspaces, preserve matching under finite local actions, have nontrivial irreducible targets, equal nonzero spherical-vacuum images outside X.T, and zeta conditions at specified places. Neither existence nor irreducibility follows solely from calling these objects theta lifts.

ThetaIntegralsAgree contains THREE conjuncts, not only a proportionality:

(i) For each triple, Decay holds and for each matched pair (R,Rf), OneConst and Coinv hold. Decay requires convergence for all Schwartz inputs in the first model; for each special input Φ' in the second model and every N∈ℕ, some real C and natural k bound |theta(om',Φ',g,h)| qht(g)^N ≤ C ht(h)^k for all g,h, together with convergence and moderate growth of the integrated function. OneConst asserts existence of a special Φ' with nonzero integral function, exactly one scalar c satisfying IsConst, and every such scalar is nonzero. IsConst means I_A(Φ)(h)=c I_B(Φ')(h) for every matched pair of vectors and every h. Coinv gives exact kernels on Schwartz-Bruhat inputs at good places, special-input surjectivity, linear functional descent through Rf.p', and invariance of the special global input space under om'. In particular this is not just equality of traces or norms.

(ii) There exist integer units e₁,e₂,s such that for *all* F,E,σ with the stated instances, StepBeta holds. Given the specified rank reduction a' = b+2 → b, unchanged V,p and q decreasing by one, the two adapted planes and real maps, there exists C≠0 independent of subsequent matched choices. For all choices of X, both sets of Weil models/maps, and constants c,c₁ satisfying IsConst in their respective models, there is u with u·(C·stepFac)=1 and c·charL(X.ν,X.S₀, k+1)=u·c₁, k = Nat.div (a-(b+2)) 2 (coerced as in E). stepFac uses unit ideal values, character values and local epsilons at integer exponent -k. The exact nonzero and adapted-plane conditions remain necessary.

(iii) A separately existential triple of integer units e₁,e₂,s works universally for StepAlpha. Here a=b+2→b, V' fixed, q=0 on both, p decreases by one, with the different adapted-plane conditions in E. There exists C≠0; for all matched pairs and constants, c=C·stepFac·charL(X.ν,X.S₀,k)·c₁, k=Nat.div (b+2-a') 2, stepFac exponent 1-k.

Elementary consequence of (i)+(ii)+(iii), **conditional on all the stated data**: for Beta, u≠0 since u·(C·stepFac)=1, and c₁≠0 by OneConst, hence the RHS is nonzero, so charL at k+1 is nonzero. For Alpha, c≠0 forces each factor in its product nonzero, hence charL at k is nonzero. This is not a half-plane zero-free theorem for arbitrary Dirichlet characters: the source's admissible character construction, adaptation, and arithmetic projection remain necessary. No claim that charL is directly the final Dirichlet L-function without source justification.

## 3. Producer of the paired theta properties

A:561–566 calls PositivityTheory.ThKR.theoremK_head2 with two precise named propositions, GlobalTheory.ThK.Dbl.EisBL (from PositivityTheory.RgEis.Hd.eisBL) and GlobalTheory.ThK.Dbl.SiegelWeilStd (from PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd). The bodies of those two producer theorems remain to be traced. A wrapper ending in a named theorem is not evidence that the mathematical result is a published theorem or that its proof is sound.

D:theoremK_head2 specializes theoremK_head2_of_mod at PositivityTheory.Sph.modSt2. The latter passes 14 inputs to Tr.closeSph (G): kCoinv, soCoinv, ramifiedMultiplicityOne, finRam, finSplit, sphTri_of applied to sphSplit_geo and vacInert howeInert, finInert_of with sphFun_of_modSt hM and locRepEx, lieSecond2 localLift_holds RL.derEx, archLie' localLift_holds, kReal' localLift_holds, siegel_of_core siegelCore_holds, h11, h12, weilEx. These are explicit source applications, not elaborated expression edges. G includes substantive derived obligations e.g. tower constructions, constant term vanishing, Weil convergence, spherical and archimedean matching, and anisotropic Siegel-Weil plus Eisenstein continuation. Its full remaining body is next frontier, not compressed away. The named external literature analogues are classical themes; do not classify a particular source proposition as established literature until exact statement/hypotheses and provenance have been audited.

## 4. Actual adapter construction in B:44–68

The proof of Nonempty HypsAlt is not an invocation of theta correspondence alone. Keep the following ordered, source-matched intermediate facts.

- Set C=P.litN (literal nonexistence/literature package, use its join and fe fields). Separate functionals via functionalsSeparate_of_howeUnram_of_siegelWeil(F, howeUnram_holds, P.siegelWeilUnitaryConvergent).
- Obtain RowRat using rowRatW_of_rowTest(test_vector_assembly_holds(F.siegelSetUnitary,F.howeDualityReal,P.greenCuspidal,F,C.join,C.fe,hA,hM,hS)).
- Obtain ConstantFunctionFits using fourier_coefficient_fit_of_join_alt(F,C.join,C.fe,hA,hM,hS, second component of ontoX_and_lamLow_of_unitaryGroupHypotheses' P).
- From evaluation_grid_of_join obtain CF1 and hCF1. Inputs include both theta properties, functionals separation, F and its real Howe duality, C.join and C.fe, twisted_weil_representation_convergence, twisted_local_factors_match, twisted_square_theta_integrals_eq. This witnesses evaluation condition EvLgG(GridA(c)) at every c≥CF1.
- From rowFun_at_gridA_alt with P.discreteSeriesCover, P.harishChandraModules, P.cuspRapidDecay, P.casselmanWallach, P.rayClassFieldSt and hFit obtain CF0,hCF0, furnishing functional linked condition above CF0 once the open condition is supplied.
- Choose d=max(CF0,CF1). Both bounds hold at d; this is the actual synchronization step, not an assumed intersection of arbitrary infinite sets. Obtain hEv from hCF1(d), hOpen1 from open0_of_unitary_group_hypotheses P hL d.
- Use open_and_linked_of_stronger_extension_alt on hL, extensionWithList hL d, extensionWithAtProperty hL (extensionWithOrigin hL d) (GridA d), SExt.none and geoCl anyGeometry with the explicit inclusion witness x↦⟨x.1.1⟩. Take its second component to transfer hOpen1 to hOpenA. hCF0(d) now yields hFun using extensionWithOrigin, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1⟩ and hOpenA.
- linked_bundles_l3_of_open_alt, with the same five P fields used for CF0, hX, hL, extensionWithAtProperty on GridA d, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1.1.1⟩ and hOpenA, yields hL3.
- H:hypotheses_nonempty_of_unramified_exponents_alt consumes P,hRat,hL,d,GridA d,hEv,hN(d),hFun,hL3, producing the promised Nonempty HypsAlt S0.NL DefiniteSideCondition. H obtains actual large unramified exponent bundles, Galois local bounds and all-row conditions; its full dependencies are not eliminated. The universally quantified hN in B is essential to choose d *after* both thresholds are obtained. F supplies hN via local bounds at two and three, closed_of_all, then Row.of_sel and LinkedAt.of_row; J specifies parametersOfDependence from extensionWithList, SExt.none, geoCl anyGeometry.

Explicit output path C:zero_free_all_of_green_v_win eliminates Nonempty only into the proposition ZeroFreeAll, uses zeroFreeAll_of_topG at la=3/2>1, forall_goal_of_shape_of_hyps with shape_closed_link_n_of_green and the inhabitant, and supplies each ψ by supplyChi ψ (hV ψ). C:every_character_of_green_v_win then invokes imprimitive. Hence the theta bridge and prime-window character lane meet at exactly C, not an unsupported jump from scalar nonvanishing to RH. Preserve the exceptional trivial-character pole and all primitive/nonprimitive quantifiers in the downstream chapter.

## 5. Reproducible static checks

Actually executed 13 assertions in the tool V8 JavaScript runtime against six retrieved pinned files A–F. All succeeded: blob identities, two projections, exact adapter rather than everyE₂, seven formal premise names, universal cDep and linked-bound producer, both max inequalities, five theta bridge call sites, Eisenstein/Siegel-Weil pair producer, all five named conjunct components in ThetaIntegralsAgree, unique nonzero scalar, la=3/2 and imprimitive, closeSph and modSt2 call, linked-family closed_of_all construction.

Replay on local pinned checkout (Python 3, no Lean required):
```python
from pathlib import Path
import hashlib
root=Path("src/Development")
T="AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
paths=[T+"EveryCharacterOfLiteratureOfVWin.lean",T+"SiegelEisensteinSecondTermHypotheses.lean",T+"TopPlug.lean","WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean","AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean",T+"At23OfAll.lean"]
shas="a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 42abe20ee235820aaa924dbabce5e1d2c2540380 c51cb6b5bd4bf2944ace89e00a2990da16bd519a 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 4d0d94fd3fd9368e5428c05402979d6dd5123b4d e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d".split()
bs=[(root/p).read_bytes() for p in paths]
assert [hashlib.sha1(b"blob "+str(len(b)).encode()+b"\\0"+b).hexdigest() for b in bs]==shas
a,b,c,d,e,f=map(lambda x:x.decode(),bs)
target=a.split("theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",1)[1]
adapter=b.split("theorem every_character_of_theta_integrals_local_matching",1)[1]
bridge=b.split("theorem nonempty_hyps_definite_side_of_closed_bound",1)[1].split("theorem every_character_of_theta_integrals_local_matching",1)[0]
pair=a.split("theorem UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",1)[1].split("theorem ",1)[0]
one=e.split("def OneConst",1)[1].split("def Coinv",1)[0]
agree=e.split("def ThetaIntegralsAgree",1)[1].split("example",1)[0]
assert all("theta_integrals_agree_and_local_matching_of_literature O)"+s in target for s in [".1",".2"])
assert "every_character_of_theta_integrals_local_matching" in target and "everyE₂" not in target
assert all("("+n+" :" in adapter for n in ["P","F","hA","hM","hX","hL","hV"])
assert "∀ cDep : ℝ" in bridge and "fun cDep =>" in adapter and "boundAtTwoThree_linked_of_recT" in adapter
assert all(s in bridge for s in ["le_max_left","le_max_right","hN (max CF0 CF1)"])
assert all(s in bridge for s in ["test_vector_assembly_holds","fourier_coefficient_fit_of_join_alt","evaluation_grid_of_join","twisted_local_factors_match","twisted_square_theta_integrals_eq"])
assert all(s in pair for s in ["theoremK_head2","eis_bl_of_literature","siegel_weil_std_of_literature"])
assert all(s in agree for s in ["StepBeta","StepAlpha","Decay","OneConst","Coinv"])
assert "∃! c" in one and "c ≠ 0" in one
assert "la := 3 / 2" in c and "UpperTheory.Top.imprimitive" in c
assert "Tr.closeSph" in d and "PositivityTheory.Sph.modSt2" in d
assert "closed_of_all" in f and "at23_family_alt hP Fm" in f
print("13 static source assertions passed")
```
The Python replay is supplied, not executed in this run; V8 checks used connector-returned blob IDs rather than independently recalculating Git SHA1. A source text check does not prove theorem truth. No changed premises introduced; implicit typeclass and kernel edges await kernel export. Current-head blobs A=f4f6eb32f04c91b5cde32f11631828eb4016fa7f and B=24cacd4b9f4ae5ef83703e26ee2d26b51ffafdf8. No current-head mathematical validity claim.

RESUME HERE: retrieve full G:closeSph and its final AgreeOfLeaves call; map the actual terminal inputs into Decay, OneConst, Coinv, StepBeta, StepAlpha and LocalMatching, especially the nonzero theta scalar producer and exact character X.ν → Dirichlet character map. Fetch the definitions and producers of EisBL and SiegelWeilStd, marking external provenance separately. Do not rerun the already mapped seven-input composition. Handoff to integration, formal audit, character-box, literature-provenance and human editor lanes: A→B→C is ready as a source-matched conditional chapter. No Cathedral physics files changed.



---

## Appendix 5: specialists/positivity_geometry/RUN1_SELF_INTERSECTION_VOLUME.md
Working-repo blob 6e165bba55a9ad1274ace9d3ed93e3dfe24592eb.

# Positivity geometry run 1 — from self-intersection to arithmetic volume
2026-11-24. RESULT: PARTIAL full project; SOURCE-MATCHED human reconstruction of VolGe and its self-intersection limit and limsup argument. Exact finite regression checks executed. Not an independent Lean kernel check or proof of all geometric producer theorems.

## Continuity and source anchor
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol, continuity, latest state branch CI summary (PASS 45347447866 at 1dec3c8; physical CI is not RH validation). Read peer theta, Galois, character-box, literature, Landau, prime-window, integration, math, kernel and acceleration handoffs. This is the first geometry lane file. Distinct from literature's interface ledger, theta's seven-input bridge, and Galois's row adapter. No Cathedral physics files changed.

All statements below refer to leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 at 07:32:48 UTC; the corresponding A and D blobs are now f4f6eb32f04c91b5cde32f11631828eb4016fa7f and 0d30ec46d5560d675a435b49f911903d3d5357c0. No equivalence claimed across revisions.

Paths relative to src/Development/; T=AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/; P=AbelianVarietyTheory/Proofs/DivisorProofs/.
- A T/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24
- B T/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba
- C AbelianVarietyTheory/PublishedTheorems/Divisors₂/VolGe.lean 3838e9a22a7fa93d98a7406239103be54c7414cc
- D P/VolGeOfHilbertSamuel.lean fd45423c859443963c1afdea940b351115c8c13d
- E P/TendstoSelfIntersectionPowTensorDivPow.lean 9842d7f2fc3da0d7f27c87825d305a54923b9e04
- F P/SmallSectionCountContinuousFromAboveStatement.lean 576ce7a9e4043f9dd3ac9b952163fc1e8c85a065
- G P/LogCardSmallSectionsGeOfShiftNefStatement.lean cdc8a3a38fc1606b45c761fece070970642afcdb
- H P/ExistsMetricShiftIsNefPowTensAmpleStatement.lean 1bdfc7617f52ef8967c54904fa2dd2b113ae9e5d
- I P/LeArithVolumeOfFrequentlySmallSectionsLower.lean 9d7885dc87a2f80aa5b90a45e5c35bb8096edded
- J P/TendstoSelfIntersectionPowTensorDivPowStatement.lean 71c212cf16d692d3835c7c08aabfbf0be9419267
- K P/LeArithVolumeOfFrequentlySmallSectionsLowerStatement.lean e13abab6f3c1a7ebe0111cdb32beccd78e229365
- L T/TopCovolG.lean 62742fab059140fb67f88b2c1e18abd6078992b3
- M T/HeightLowerBoundGeneral.lean b6012f8c9b260e1596140ce99671df2b7692f72c

## 1. Why this is on the actual source path
A:531–532 calls D:volGe_of_hilbertSamuel with arith_hilbert_samuel_of_literature O, ar_calc_of_literature O and nef_numerics_of_literature O. A:783 supplies this as p2 of published_results_arithmetic. A:812 passes the record into B:topCovolSlim2_use_alt_alt, which passes it to L:topCovolG_alt_alt. L uses that record in height, gram, degree, and covering producers; M:height_lower_bound_general_alt uses height_of_meanAll_bound with short-section, geometric, integral-frame and weight-budget producers. This is a source-level record-flow path, not a proof that projection p2 survives kernel proof irrelevance or is indispensable. The exact consuming projection is a further task. No inferred direct link from this isolated inequality to RH.

## 2. Exact theorem and retained assumptions
C:13 defines VolGe: for every commutative ring k, integral scheme X of universe 0, map p:X→Spec k and D∈N satisfying IsArithVar p D, every Hermitian line bundle L over p and every real a, assume NefFib L, L.SemiPos D and L.IsSelfInter a. Then (a:EReal) ≤ arVol L D.
D proves this conditional on three proposition-valued inputs: ArithHilbertSamuel, ArCalc, NefNumerics. Keep the distinction between fibre-nef and globally nef, and between the real a and extended-real volume. Neither a>0 nor D>0 is assumed. Positivity of a is needed only if one wants to conclude positive volume.

## 3. Human reconstruction of the intersection polynomial (E, J)
Let r=D+1, and use the real-linear functional Phi on polynomials in two variables supplied by ArCalc.arExists for the pair L,A. The ArCalc isometry and uniqueness rules imply
  Phi(X0^r)=a.
For every n∈N the bundle combination with integer coefficients (n,1) is isometric to L^n tensor A, using the isometry class laws. Thus
  alpha(n)=Phi((n X0+X1)^r)
is a self-intersection of that bundle. In particular, for n≥1,
  alpha(n)/n^r = Phi((X0+X1/n)^r)
    = sum_{j=0}^r binomial(r,j) Phi(X0^(r-j) X1^j) n^(-j).
Each term is a fixed coefficient times a power of 1/n. Hence the right-hand side tends to Phi(X0^r)=a. The source proves continuity of a polynomial in t, evaluates at t=1/n, and uses eventual n≥1; no division by n=0 in the human proof. All coefficients can have either sign. This proof is not asserting positivity of mixed intersections or invoking an unproved Hodge index inequality.

## 4. Human reconstruction of D's three-error budget
Fix any epsilon>0, let e=epsilon/3 and F=r!≥1. The good-pair theorem constructs P with P.L=L, P.A ample and nef, b and rational-function witnesses s,t with P.Good D b s t. D obtains the self-intersection alpha from E and the representation facts for P.L and P.A. These inputs remain obligations, not consequences of the numerical budget.

First choose n≥1, sufficiently large that
  alpha(n)/n^r > a-e,
and such that for all sufficiently large m the following F (continuity-from-above) estimate holds:
  P.lc(nm,m,1) ≤ P.lc(nm,0,1)+e(nm)^r.                   (1)
F supplies the nested eventual quantifiers: eventually n, eventually m. Choose n only once, after intersecting the two eventual n conditions. D derives P.Rep n 1 (L^n tensor A) via the power/tensor representations. H yields a real t0 such that the constant metric shift of L^n tensor A is nef, using ArCalc, NefNumerics, semipositivity and fibre-nef of L, and ample plus nef of A. This is not the assertion that the unshifted L is nef.

Now G, using ArithHilbertSamuel, ArCalc, P.Good, the representation, self-intersection alpha(n), and nef shift t0, gives for all sufficiently large m
  (alpha(n)/F-e)m^r ≤ P.lc(nm,m,1).                       (2)
For arbitrary N0 choose one m≥max(N0,1) satisfying (1) and (2). Set x=n^r≥1, y=m^r>0, N=nm≥N0. Then
  P.lc(nm,0,1) ≥ alpha(n)y/F-ey-exy
                 ≥ (a-e)xy/F-ey-exy
                 = a xy/F - e xy/F - ey - exy
                 ≥ (a/F-3e)xy.
The final step uses F≥1 and x≥1: e xy/F≤e xy and e y≤e xy. It does not require a or alpha(n) nonnegative. D:70–85 proves exactly these inequalities (e1–e4) and combines them with the two eventual estimates.

D then identifies P.lc(nm,0,1) with log of the finite small-section count for L^N: its twisted-power encard equality and ball finiteness ensure the natural cardinalities agree. Thus for every epsilon>0 and arbitrarily large N,
  smallSec(L^N) is finite, and
  log #smallSec(L^N) ≥ (a/F-epsilon) N^r.
No uniform threshold in epsilon is needed and not all large N are claimed to work. The n,m selection order is essential. The geometric count lemma and ball finiteness are still separate leaves.

## 5. Limsup closure (I, K)
Use arbitrary delta>0 and the preceding result with epsilon=delta/F. Discard finitely many N=0 terms. The small-section set contains the zero section, so each finite count at a selected N is positive. Multiplying the bound by F/N^r gives a-delta ≤ F log(#smallSec(L^N))/N^r on arbitrarily large N. The exact extended-real limsup inequality follows from Filter.le_limsup_of_frequently_le, including the possibility of infinite arVol. I handles finite ncard to extended-real log with the finite/positive conditions, then uses order density on EReal to let delta→0. Result: a≤arVol L D. This is the desired VolGe inequality, conditional on all of section 2's inputs and the cited geometric leaves.

In short: self-intersection is the highest-degree coefficient of a geometric polynomial; the counting estimates transfer that leading coefficient to a lower bound for arithmetic volume. The factorial F is a normalization from the source, not a fitted constant. The result supplies a mathematical route from intersection data to section growth rather than directly claiming nonvanishing of an L-function.

## 6. Executed checks and reproduction
Actual connector V8 run re-fetched A–I at the original pin, checked all nine returned blob IDs against inventory, and passed 31 literal source assertions (not kernel edges): A lines 532,783,812; B 16,21; C 13; D 40,49,70,74,77,79,82,85; E 18,29,38,40,47,56; F/G/H line 12; I 21,22,25,37. J–M inspected; no assertion count assigned to them. Replay checkout pin and git hash-object each path; inspect listed lines and full theorem bodies.

Exact integer arithmetic tests executed in the same runtime: 11,340 budget cases (D=0..5, n=1..6, m=1..7, a=-4..4, epsilon=1..5). Use 3alpha=(3a-epsilon)x+1 so strict premise holds even for negative a. Multiply all inequalities by 3F. Independent integer polynomial multiplication vs binomial formula: 900 cases (r=1..9, n=1..20, coefficient families c_j=s(j+1)-2, s=-2..2). No failures. Minimum scaled budget slack=1. Reproduce with this standalone Python standard-library script (equivalent arithmetic to executed BigInt loops):
```python
from math import factorial, comb
from itertools import product
budget = poly = 0
min_slack = None
for D,n,m,a,eps in product(range(6),range(1,7),range(1,8),range(-4,5),range(1,6)):
    r=D+1; F=factorial(r); x=n**r; y=m**r
    alpha3=(3*a-eps)*x+1
    lb=alpha3*y-eps*F*y-eps*F*x*y
    target=(3*a-3*F*eps)*x*y
    slack=lb-target
    assert slack==y+eps*((2*F-1)*x*y-F*y) and slack>=0
    min_slack=slack if min_slack is None else min(min_slack,slack)
    budget+=1
for r,n,s in product(range(1,10),range(1,21),range(-2,3)):
    c=lambda j:s*(j+1)-2
    p=[1]
    for _ in range(r):
        z=[0]*(len(p)+1)
        for j,v in enumerate(p):
            z[j]+=n*v
            z[j+1]+=v
        p=z
    assert sum(v*c(j) for j,v in enumerate(p))==sum(comb(r,j)*n**(r-j)*c(j) for j in range(r+1))
    poly+=1
assert (budget,poly,min_slack)==(11340,900,1)
print(budget,poly,min_slack)
```
These synthetic arithmetic regression cases check the generic algebra, not the geometry or native Lean environment. Mathematical proof for arbitrary parameters is the exact inequality and polynomial argument above. No Lean compilation or local kernel extraction, no changes to assumptions, no URT acceleration tested, no full-proof completion percentage. CI for this note not executed. Source hypotheses of all imported geometric producer lemmas remain open for translation.

RESUME HERE: follow M:height_of_meanAll_bound via HodgeBundleWeights/HeightLowerBoundGeneral and ThirdPlaceSeries/HeightOfSteps. Locate an actual consuming use of PublishedHodgeBundleTheorems.p2 in this chain (if absent, record the exact alternative consumer or unused field). In parallel with that source inspection, the next geometric leaf for VolGe is F's lc_add_A_le in SmallSectionCountContinuousFromAbove.lean: reconstruct its two-level eventual quantifiers and prove its small-section comparison with the exact b,s,t and metric assumptions. Do not redo the polynomial or three-error budget.
HANDOFF TO: proof editor, integration, audit, character boxes and literature lanes. The VolGe chapter is ready for independent source audit; record flow is not yet kernel reachability.



---

## Appendix 6: specialists/character_boxes/RUN1_CONNECTED_WINDOW_WITNESS.md
Working-repo blob 691114be7974fd950c248b7f9b2defc44161e3be.

# Character boxes run 1 — actual window witness and nine-link closure
2026-11-24. SOURCE-MATCHED / PARTIAL. Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Executed 83 literal source assertions across 20 pinned files in V8; all passed. No independent Lean elaboration, no kernel dependency certification or URT speed claim. Current upstream observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 (07:32:48 UTC); MainConclusion, EveryCharacter and theta TopPlug/TopShape blobs changed; old ShapeWin and SupplyChi paths return 404 there. Keep revisions separate.
Preflight read swarm protocol, handoff, expansion, AGENTS, state/log/protocol, continuity and peer dependency/kernel/acceleration/integration/math/theta/Landau/Galois/prime/structure notes. No prior character_boxes artifact. Physical CI PASS 45345201880 for 0f7a23b is unrelated. The peers mapped the analytic and seven-input theta bridges; this note supplies the intervening family witness.

## Actual path vs parallel wrappers
Main.lean: riemannHypothesis = rhOfAll; Supplements/Kernels/MainTheorems: rhOfAll = Formalism.VW.rh_of_every allChi; allChi = UpperTheory.FinalTheorems.everyCharacter. CharacterBoxes/MainConclusion: h = galoisLocalGlobalStrong_recParameter, passed as (h,recTExists,h) with vwin_of_row h to every_character_of_literature_of_vWin. The theta adapter SiegelEisensteinSecondTermHypotheses:69–73 invokes every_character_of_green_v_win. ThirdPlaceSeries/TopPlug:12–18 invokes zero_free_all_of_green_v_win then imprimitive. Crucial distinction: the actual TopPlug invokes shape_closed_link_n_of_green (ThirdPlaceSeries/TopShape) via forall_goal_of_shape_of_hyps, with HypsAlt N DefiniteSideCondition. The older EveryCharacter.plugWin instead invokes CharacterBoxes/ShapeWin.shapeWin with Hyps N DRS. Do not conflate them. Similarly MainConclusion's own RH theorem calls UpperTheory.riemannHypothesis_of_everyCharacter, but the original Main root calls Formalism.VW.rh_of_every. Imports are not kernel dependencies.

## Nine-condition design witness
Let A be the admissible family class, G:FReq, la>1, HostExW la G.req and assume every member of G.cls la satisfies HypV. Supply:22–23 defines G.cls la F as F.core.Windows la AND for all x>F.x1 and i in F.Ix(x), G.At(F.L(x,i)). TopG concludes FamilyClassConnected(G.cls la), not that every family is connected. Actual theta TopShape:35–55 constructs a design in the intersection A and G.cls la. hsub restricts existing closed Tu-size/class-number conditions via Closed.sub but does not delete the intersection condition from the chosen family. All TopShapeAlt binders and HypsAlt fields remain obligations; the two True placeholders are discharged by trivial.

The nine Closed conditions on Des(class,C0) in DesWin:11–22 and their actual producers in theta TopShape:35–55 (Cabs=2,C0=3,eD=2,eL=0; literal source constants):
| Condition | Producer | Use |
|---|---|---|
| LinkN | nRest record hypothesis | divinN_of_hypV |
| LinkEta | closed_linkEta_of_duty | division link |
| LinkIRR | closed_linkIRR_of_join_count, Green | final chain |
| SmallLevelRankEq | link_alt_alt_alt, zL surjectivity | divinN_of_hypV |
| TuSize → DGamSize → LinkDIVt | closed_linkDIVt_of_closed_bridge_kernel | eta and DIVinN |
| ChosenE → NuFullF and J.MuRank | link_gl.1 | linkMu_of_linkDIV |
| LinkG | closed_linkG_of_duty | final chain |
| TuSize → LinkS | link_alt_alt_bis | final chain |
| TuSize → DGamSize → LinkGLOBAL | link_gl.2 | final ChainTied |

DesWin:23–31: intersect all nine closed predicates to obtain epsilon1>0 and hA. Independently hEx supplies epsilon3>0. For each 0<eps<min(epsilon1,epsilon3), select K and hK from hA **before** selecting Fm, CH and their class/size/chosen witnesses from hEx at that same K. Apply hK to that very family and CH. It yields predicates in order N,DIV,Eta,IRR,Z,Rk,G,S,GL. HypV from class membership plus LinkN and SmallLevelRankEq give DIVinN through divinN_of_hypV. Apply aD hT hDG aE to get hD; use hD, the components of aR hCh, muTu_of_tuSize and muDGam_of_fact to construct LinkMu. The tuple (LinkG,LinkS,LinkIRR,hD,LinkMu) feeds aGL hT hDG hCh. Return the same family with the intended class membership and ChainTied. This is dependent witness selection, not mathematical induction.
Exact FamilyClassConnected (DivinNOfHypV:13–15): exists eD,eL,epsilon1>0, for every 0<eps<epsilon1 exists Fm:G.cls la and K,cHH,eK,CL,x0 such that for every x>=x0 in Fm.Win, ChainTied Fm eD eL K cHH eK CL x. No single family for every eps; constants precede all x. Preserve K-before-Fm selection in the proof.

## Character supply and rescaling
SupplyChi:8–16: for every primitive psi, VWinAt psi 401 → HostExW (3/2) (GChi psi).req. supplyOfAdm uses admissibleClassesTwistedChar; the latter gives rank/frame witness under 0<eps<1/52 and frame order in [x^(2+8eps),2*x^(2+8eps)], after substitution of s.eps=eps. Extra premises of the stronger adapter are unused here, not removed from its statement. HostOfField uses shortNorm and smallOne. ShortNorms/supplyOfAdmOf:24–56 uses fieldChi, winPairs and fixed J, C0>=max(1,J,level order,8*conductor), host constants, common threshold encompassing rank bound, A^J with A^(eps/5)=5+4*conductor, and page bound c*2^e0. For each permitted scale, fieldChi provides frame/host/kernel/twist data, admissibility gives R, host theorem gives H,q0. At lines 117–135 prime divisors of H.QS divide 2*conductor, boundedTw gives EAtH components and isChiField plus WinDatum.bound and rank bound gives VVle at R.t. GChi is the conjunction of EAtH(Level.cyc psi) with parameter 4 and VVle H.E t sqrt(b).
WinPairs:16–81 scale adjustment: k=c^(1/(2+8eps))>=1. Choose M>=1,y,Y1,k^3,k^400; X>=X0,M^J. V-window starts W>=X^(1/J)>=M and ends W^2<=X. Z=kW>=y, Z^(3/2)<=W^2 since W>=k^3. For x in [Z,Z^(3/2)], x'=x/k lies in [W,W^2]. Dyadic page has x'^(2+8eps)<=2^e<=2*x'^(2+8eps); multiply by c for the target at x. Since x'>=W>=k^400, x^400=k^400*x'^400<=x'^401. Since x'<=x and eps>0, allowed exponential bound grows. WinDatum.bound follows by monotonicity. Thus 401 is the rescaling buffer, not a fitted zero-free exponent. PairEx and VWinAt producers remain substantive upstream obligations.

## Zero-free transfer
ZeroFreeAllOfTopG:12–34: take G=GChi psi, la=3/2. G.cls gives EFamC with constant 4, threshold Fm.x1+1, using Fm.L_x and L_eps; and HypV at same threshold. TopG selects connected family; retain window membership. SupplyChi gives HostExW. Independent comparison theorem level_gm_le_on_family_scales and formB plus zeroFreeOn_of_tiedWin_cyc give ZeroFreeAll for predicate True. Prior analytic chapter explains choosing eps so exponent 1/2+(eD+eL+7)eps lies below Re(s); this note does not independently derive geometric size bounds.
Imprimitive:5–35: N>0, any chi, Re(s)>1/2, chi!=1 OR s!=1. Apply primitive nonvanishing to PChar.of chi. If chi nontrivial and primitive character trivial, changeLevel_primitiveCharacter/changeLevel_one contradict chi!=1. If s!=1, pole exception automatically satisfied. Change-level formula gives primitive L times finite Euler factors 1-chi_prim(p)p^(-s); their subtracted terms have norm <=p^(-Re(s))<1, so none vanish. No induction over modulus needed. EveryCharacter quantifies all N>0, chi, s with these exact hypotheses. Root RH specializes to modulus one and uses functional equation via rh_of_right. Alternate RH proof also handles zeros of Gamma_R in Lean's totalized division. Neither wrapper proves the upstream arithmetic premise.

## Pinned source inventory and replay
Paths C=src/Development/AutomorphicArithmetic/CharacterBoxes/; T=src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/. Connector-returned blob identities; independently replay with git hash-object and git show PIN:path. Check each named call inside the specified declarations, not just imports.
| File | Blob |
|---|---|
| src/Main.lean | dbd5db70bc11b35f18fa5751216ab335321e7bfc |
| src/Supplements/Kernels/MainTheorems.lean | 6a542d7ce969a791fd12ce575f587e6bc29044bf |
| C/MainConclusion.lean | ee340012ab19713a8acfecf8adc6a331cbc2f1a4 |
| T/SiegelEisensteinSecondTermHypotheses.lean | 42abe20ee235820aaa924dbabce5e1d2c2540380 |
| T/TopPlug.lean | c51cb6b5bd4bf2944ace89e00a2990da16bd519a |
| T/TopShape.lean | 3f791ca182db235c4a8ff582d3f038019320d5cd |
| T/ShapeOf.lean | 236d0eadd60b292bd0a832114f8c4a6253131250 |
| C/ShapeWin.lean | 884e55f808de32034259a8bb2d74043e2e933430 |
| C/EveryCharacter.lean | 6ac769568b67f85f33565ba3e1eef7b91f53c55f |
| C/DesWin.lean | 94820ef32775f43f41c61da2b892a121d0549b86 |
| C/DivinNOfHypV.lean | 5321920359316653b7627951429a6d7555c311b0 |
| C/Supply.lean | b104f034fc9c13758e280d1b7d33ac1ea370663a |
| C/SupplyChi.lean | 339885b77069601fb716a60739369805241e8222 |
| C/HostOfField.lean | d98214b25bf84966a5b4e858a35f21ac9193b49f |
| src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean | 04ca5068e90544580c7684a316ec79c49d3572fc |
| C/WinPairs.lean | 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b |
| C/ZeroFreeAllOfTopG.lean | 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1 |
| C/Imprimitive.lean | 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa |
| src/Formalism/GammaFactorNonvanishing/CritLine.lean | 95fa4da5c50119db164aa93944d106f22fdb576d |
| C/RiemannHypothesisOfEveryCharacter.lean | c6dfef5bfa62aa0ef1cd1481833e1cd2475cbbbc |

Small replay (subset of executed assertions; local git required; replay not itself executed):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
c="src/Development/AutomorphicArithmetic/CharacterBoxes/"
t="src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
checks=[
(t+"TopPlug.lean","c51cb6b5bd4bf2944ace89e00a2990da16bd519a",["shape_closed_link_n_of_green hG","supplyChi ψ (hV ψ)","UpperTheory.Top.imprimitive"]),
(c+"EveryCharacter.lean","6ac769568b67f85f33565ba3e1eef7b91f53c55f",["shapeWin hG","(χ ≠ 1 ∨ s ≠ 1)"]),
(t+"TopShape.lean","3f791ca182db235c4a8ff582d3f038019320d5cd",["closed_linkDIVt_of_closed_bridge_kernel","link_alt_alt_alt","topDesWin","closed_linkIRR_of_join_count","link_alt_alt_bis"]),
(c+"DesWin.lean","94820ef32775f43f41c61da2b892a121d0549b86",["min ε1 ε3","obtain ⟨K, hK⟩ := hA","obtain ⟨Fm, CH, hc, -, hL, hCh, hT, hDG⟩ := hEx","divinN_of_hypV","J.linkMu_of_linkDIV"]),
(c+"WinPairs.lean","4670fec488d1eb59a3cc52dffc8d0eab16e16b0b",["k ^ (3 : ℝ) ≤ M","k ^ (400 : ℝ) ≤ M","hv.mono"]),
(c+"ZeroFreeAllOfTopG.lean","54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",["⟨4, Fm.x1 + 1","zeroFreeOn_of_tiedWin_cyc","level_gm_le_on_family_scales"]),
(c+"Imprimitive.lean","97cbdce9fcc91c4f0dcc25fef62daf4c95724afa",["LFunction_changeLevel","Finset.prod_ne_zero_iff","Complex.norm_natCast_cpow_of_pos"])]
for path,sha,strings in checks:
    raw=subprocess.check_output(["git","show",pin+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha
    for s in strings: assert s in raw.decode(),(path,s)
print("Pinned source subset checks succeeded")
```
The actual V8 checks covered 83 strings in 20 files; no failures. Literal presence corroborates manually inspected bodies but cannot resolve elaborated dependencies or validate theorem truth. Zero changed assumptions, nine conditions retained, full proof coverage unknown. No CI verdict for this new note.

RESUME HERE: retrieve exact producer link_alt_alt_alt (theta ThirdPlaceSeries/Link.lean or its imports) and reconstruct SmallLevelRankEq from zL surjectivity; then map TopShapeAlt/HypsAlt record producers with positivity/theta lanes. Do not substitute older ShapeWin or redo this nine-link witness. HANDOFF TO: integration, editor, audit, positivity, Galois, theta, prime-window, math lanes.



---

## Appendix 7: math/2026-11-24_normalized_size_budget.md
Working-repo blob 84979bf13fc1351eb6ae1d0226aebd09d9fcc7d7.

# Normalized size-budget proof — exact square-root exponent
Status: SOURCE-MATCHED derivation; independent BigInt regression on constructed boundary cases, not real host existence or kernel verification.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources (paths relative to src/Formalism/SizeWindowBrackets/):
GrowthBoundGivesRiemannHypothesis.lean (a3ece4b4aea97a95ba2977fa9e8d437e72677774): SizeWindows, GrowthSizeBound.
SChain.lean (a4bc8cecac40a1f5fd307661e151639aaf6a6efa): RestSize, SizeWindowsSplit.
ErrorFormsWeakWindowsFalse.lean (1d1d179d111b5aa668893327264648558f30fdb6): errorBracketSizeWindows.
ChainSlopeWindows/LipschitzWeightAndMinimum.lean (4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b): proposition_size_bound.

## 1. Exact premises
x>=3, eps>0, C>=0, n>0, b>0, 0<=aE<=2xb, nT>=n*x^(-eps/8)/2, x^(-eps)<=nT2/n<=1,
x^(1/2-eps)<=m<=x^(1/2+eps/2),
xm<=k<=n^2*x^(1/2-eps),
26<=x^(3eps/8). Counts n,nT,nT2,m natural. All denominators below positive by these hypotheses.
Err<=x^(C eps)*B, where
B=nT*aE*(1+m^2/k)+m*(2*n*m*b*x^eps+nT2*k*b*x^eps/(n^2*x^(-eps))).
The subgroup argument supplies Q*delta/2*(Gx-4X)<=Err+2Q/x, where Q=nT*m*b, delta=nT2/n, X=x^(1/2+eps).

## 2. Human simplification: normalize before expanding
Divide the four terms of B by Q. In order:
1. aE/(mb)<=2x/m<=2x^(1/2+eps).
2. aE*m/(kb)<=2xm/k<=2.
3. 2nm*x^eps/nT<=4m*x^(9eps/8)<=4x^(1/2+13eps/8).
4. nT2*k*x^(2eps)/(n^2*nT)<=2k*x^(17eps/8)/n^2<=2x^(1/2+9eps/8).
All four are bounded by their constants times Y=x^(1/2+13eps/8)>=1, giving B/Q<=10Y. These reproduce the source's SZ.T1--T4 with a single common normalization.
With P=x^(C eps)>=1, the input inequality yields delta*(Gx-4X)<=20PY+4/x<=22PY (x>=3, PY>=1).
If Gx-4X<=0 the next upper bound is immediate. Otherwise use delta>=x^(-eps)>0 to get Gx-4X<=22PY*x^eps. Hence
Gx <= 4X+22x^(1/2+(C+21/8)eps)
   <=26x^(1/2+(C+21/8)eps)
   <=x^(1/2+(C+3)eps).
This retains the source constants and hypotheses, while exposing the actual mechanism: the inverse row count x/m, the direct row count m, and the scaled k/n^2 are all controlled at square-root order. The 13/8 loss comes from the third term, 1 from thick-set density, and 3/8 from absorption of 26. No novel RH proof or URT advantage asserted.

## 3. Executed independent regression (JS BigInt in tool isolate)
120 exact boundary-combination cases passed. For q in {2,3,8,53,100}, set eps=1/q, x=26^(8q), n=2x, nT=n/52, b=3, aE=2xb. Choose m at either endpoint, nT2 at either endpoint, k at either endpoint, C in {0,2,3}. All powers used have integral exponents in base 26. Evaluate the four terms and total as rational numerators with common denominator k*n^2; compare by integer cross multiplication. Also take Err=x^(C eps)*B and the maximum Gx permitted by the input inequality, verifying final bound exactly. These are constructed size-budget fixtures only, not native geometric data. Reproduction:
```js
let count=0;
for(const q of [2,3,8,53,100]){
 const p=i=>26n**BigInt(i), x=p(8*q), n=2n*x,nT=n/52n,b=3n,a=2n*x*b;
 const lo=p(4*q-8),hi=p(4*q+4),Y=p(4*q+13),X=p(4*q+8);
 for(const m of [lo,hi])for(const nT2 of [n/p(8),n])for(const k of [x*m,n*n*lo])for(const C of [0,2,3]){
  if(k<x*m)continue;
  const Q=nT*m*b,P=p(8*C),den=k*n*n;
  const ts=[nT*a*den,nT*a*m*m*n*n,m*2n*n*m*b*p(8)*den,m*nT2*k*b*p(16)*k];
  const cap=[2n,2n,4n,2n];
  if(ts.some((v,i)=>v>cap[i]*Y*Q*den))throw Error("term");
  const errNum=P*ts.reduce((a,b)=>a+b,0n);
  if(errNum>10n*P*Y*Q*den)throw Error("sum");
  const Gden=Q*nT2*den*x,Gnum=4n*X*Gden+2n*n*(errNum*x+2n*Q*den);
  if(Gnum>p(4*q+8*(C+3))*Gden)throw Error("final");
  count++;
 }
}
if(count!==120)throw Error("count");
```

## 4. Origin of the geometric size conditions — next frontier, not solved here
Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean (00acf811793877fe42d18c0d69f2d5833f75bf94) explicitly includes RestSize and ErrWindows in ChainTied; TiePts identifies m with the native rank R.m. These are not yet independently derived geometric conditions in this reconstruction.
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LinkGl.lean (31359d438c3bb3c5050f9cab94dba28c5b64c72a) obtains LinkGLOBAL through famGLmin_of_realPlaceSecondLayer and link8, with constants 2,3,2,0. This is the exact upstream call to investigate next, using imports Formalism/SharpRestriction/GlobalSchurBounds/TuSizeOfRealPlaceSecondLayer.lean and LogXLowerFamilyOfTheorems.lean.
RESUME HERE: locate link8 producer and native ranks/scales construction (FamCore imports DFam); show how m, k and group sizes satisfy the exact window conditions for every sufficiently small eps. Do not substitute the model fixture in PChain for actual geometry. Continue separately toward theta-integral adapter. No whole-export processing or local Lean check this session.
HANDOFF TO: positivity geometry, character boxes, human proof editor.



---

## Appendix 8: math/2026-11-24_window_exponent_and_character_projection.md
Working-repo blob 469eabc7fe6507abe6d4c79bc8d1616275917a61.

# Arithmetic-window exponent and subgroup projection
Status: SOURCE-MATCHED conditional derivation. Original source revision 40e56bab026552e089d7afcfeff08d2defb9c005. Follows analytic_zero_exclusion_chapter. No newly executed Lean kernel check.

## 1. Exact quantifier bridge
Source: src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean (a6ac464a67f99a546566ee3a3e0fd1db1f4c2550), Window.lean (099d96fec932b03a505ea79a81c45bcc3fbf0ea3).
Fix a primitive character psi and level Lambda containing it. Fix la>1. HasWindows(S,la) means for every real y there is Y>=y with the entire interval [Y,Y^la] contained in S. We only use Y>=1. ChebyshevInequalityAtWindowScale supplies fixed eD,eL and eps1>0 such that for every 0<eps<eps1 there exists a family Fm with EFamC Lambda (core Fm), HasWindows(Fm.Win,la), and constants K,cHH,eK,CL,x0 independent of x for which ChainTied holds at every x>=x0 in the window set. ChebyshevInequalityOnWindows supplies x1 (allowed to depend on the fixed family and eps) with Lambda.Gm(x)<=x^(1/2+(eD+eL+7)eps) for x>=x1 in Fm.Win.
For any s with sigma=Re(s)>1/2, let q=min(sigma-1/2,1/2)>0, theta=1/2+q/2, A=eD+eL+7. Choose eps=min(eps1/2,(q/2)/(|A|+1)). Then 0<eps<eps1 and A eps<=q/2, so theta<sigma and 0<theta<1. For any desired lower window start Y0, select Y>=max(Y0,x1,1) using HasWindows. For every x in [Y,Y^la], Lambda.Gm(x)<=x^(1/2+A eps)<=x^theta since x>=1. FormBAt(la) now implies ZeroFreeAbove(theta) and hence L(psi,s)!=0. This is level_of_tiedWin, without reversing any quantifier or claiming the same family works for every eps.
zeroFreeOn_of_tiedWin_cyc chooses Lambda=Level.cyc psi containing psi and repeats the argument for each psi satisfying Q. In the source call in ZeroFreeAllOfTopG.lean, Q=True. FormB is supplied by PrimitiveCosets/Imports.lean (prior chapter); its window exponent delta=la-1 and constant C=1. No epsilon limit of L-functions is involved: epsilon is selected after s is fixed.

## 2. Geometry-to-bounds interface
Sources under src/Development/AutomorphicArithmetic/: CharacterBoxes/DivinNOfHypV.lean (5321920359316653b7627951429a6d7555c311b0), CharacterBoxes/DesWin.lean (94820ef32775f43f41c61da2b892a121d0549b86), PrimitiveCosets/WindowInequalityOfArtinInputs.lean (c349e34925ac26b8bc76bd36e9b91562f86d6b8d), PrimitiveCosets/CoreAtH.lean (0ba3621036f19146e7e67fa9c0e8a1c38661a097).
FamilyClassConnected is the fixed-eD/eL, variable-eps quantifier structure. topDesWin intersects the nine closed conditions' epsilon threshold with the design-existence threshold; obtains a transported condition K; obtains a design Fm and CH satisfying K, size conditions and family membership; obtains LinkN, LinkDIVt, LinkEta, LinkIRR, SmallLevelRankEq, rank, LinkG, LinkS and LinkGLOBAL simultaneously. Uses HypV, LinkN and SmallLevelRankEq via divinN_of_hypV to get DIVinN, then LinkDIVt, mu rank and size lemmas feed LinkGLOBAL to yield ChainTied. Exact closure/transport of each named condition still requires proof reconstruction. Source shapeWin calls topDesWin with Cabs=2,C0=3,eD=2,eL=0 at that construction; existential result hides those constants, and the general downstream argument does not require knowing them.
windowInequality_of_artinInputs takes a Tied-to-FamCoreConstantBounds implication. It combines the EFamC threshold xE, ChainTied threshold x0, core_gm threshold x1 using max(x1,max(x0,xE)). At every qualifying x, select the same host index i provided by FamCoreConstantBounds and apply EFamC at i and CoreAtH at i; core_gm supplies the bound. This is a legitimate pointwise existence selection, not uniform i across x. CoreAtH includes character/log-derivative compatibility, data x and eps, bounded eDiv/eLoss/cHH, coverage of subgroup A0 by tr, IdentU, SizeData2, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize and T2 subset A0. These are substantial obligations, not optional scaffolding.

## 3. Exact finite-group simplification at the arithmetic core
Sources: DedekindLFunctions/LandauTheorems/ChCore.lean (878f5077bc382426c7da988e5a375b85deeaa7de), ChTop.lean (ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5), PrimitiveCosets/CoreGm.lean (3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d).
For finite abelian H and subgroup A0, let PsiA(A0) be additive characters of E0 x H trivial on {0} x A0. For s in A0, the source's sum_A identity is
 sum_{u in A0} psi(-e1(s+u-t)) = |A0| psi(e1(t)) if psi in PsiA(A0), else 0,
where e1(t)=((1,0),t) and E0=Z/2 x Z/2. Proof: expand additive character on the sum e1(t)+(0,-s)+(0,-u). If restricted character is trivial every term is 1; otherwise its finite character sum is zero by translation invariance. Thus subgroup averaging projects onto the annihilator, with no arbitrary mode deletion. This is ordinary exact character orthogonality, not evidence of URT-specific speedup.
sum_Th uses this to collapse an average of thick-channel sums to a sum only over PsiA. th_le bounds the difference of the thick approximation and true De by 2 fPl(H)[3(x+1)(eta+1)+(x+1)b theta_thin]; CostWindows reduces this to 2b/x. CharacterBalanceMoves.core sums over A0 and divides by its positive cardinality, yielding
 |TT| m b (delta2(T2)/2) Y <= Err + 2 |TT| m b/x,
under its exact hY lower bound on the character sum and hTop upper bound on every gapA at u0 in A0. The thick and thin weights and size constraints are essential.
one_char controls retained and omitted characters with derivative and phase-discrepancy bounds; sum_vv identifies GmA-SigA. ChCore.ch_core chooses Y=GmA-SigA-4 x^(1/2+eps); after applying the preceding inequality and proposition_size_bound, it obtains
 GmA <= x^(1/2+(C+3)eps)+SigA.
ChTop.ch_top identifies gapA = Dd.ASK-Dd.Main and derives gapA<=x^(CErr(Cc)eps)*errorBracketSizeWindows from each_unit_bound_statement and errX5at_le and BNBoundsU. All named conditions remain obligations.
CoreGm.core_gm uses C=eD+eL+3 (source initially max(eD+eL,0)+3, proves nonnegativity before simplifying). The main term becomes x^(1/2+(eD+eL+6)eps) via gmA_eq. The omitted-channel error estimate from sigA_le plus x^eps>=1+4*Lambda.o absorbs the remaining term and gives exponent 1/2+(eD+eL+7)eps. No inference of a square-root bound from finite group averaging alone.

## 4. Integration / exact next work
The exponent loss +7 has three source-level stages: +3 from CErr, +3 from ch_core, +1 from the final absorption. The source does not obtain 1/2 by numerically fitting a constant; the square-root base is built into the rank/size conditions used in ch_core and earlier geometric arguments. Need reconstruct why those conditions hold. Do not claim full RH proof complete.
RESUME HERE: fetch proposition_size_bound and size_windows_split from SplitInertia import tree; reconstruct the exact size-budget inequality and its origin in RestSize, especially m<=x^(1/2+eps/2), and trace the nine closed conditions in shapeWin to their producers. In parallel, integration must recover the exact theta-integrals-to-every-character adapter; this chapter follows verified analytic branch only.
Tests: original source fetched at pinned revision; expressions and quantifiers manually checked. No local Lean execution or whole-export benchmark.
HANDOFF TO: Character Boxes, Positivity Geometry, Human Proof Editor, integration.



---

## Appendix 9: specialists/prime_window/RUN1_WINDOW_RECONSTRUCTION.md
Working-repo blob dfad9f489e4cc5673fd18ca5ed9486cad655339f.

# Prime-window translator — run 1 — 2026-11-24

RESULT: SOURCE-MATCHED / hand-derived exact window bridge; independent finite regression checks executed locally. RH project OPEN. No Lean elaboration or kernel verification. The source theorem is conditional; do not confuse the proof of the implication with the proof of its antecedent.

## Continuity and version lock
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, research log/protocol, continuity, and the dependency, acceleration and kernel-extractor run-1 checkpoints. No prime_window lane file existed at preflight. Prior protocol already mentions a WindowHypOfRpow excerpt translation; this run extends it with exact pinned declarations, complete Gm expansion, explicit threshold, change-of-variable proof and executable regression cases. It does not duplicate the Landau pole/analytic-continuation lane. Existing physical CI verdict: PASS at 07:05 UTC for commit 9aa5afb, run 45342893347, unrelated to this result.

Upstream source repository: https://github.com/leanprover-community/riemann-hypothesis
PIN = 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest upstream observed 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf (2026-11-24 06:57:31 UTC); its CharFamily and LandauZeroFreeCriterion files have changed blobs cac521ab291c9dab261508613d4d12195cdfb799 and f4c5124f8a0188f85b60b2687864d531f9c0a3d8. Old paths for WindowHypOfRpow, WindowHypUOfWindowHyp and ZeroFreeOfRpowWindow returned HTTP 404 at latest revision. Do not assume the declarations were deleted rather than relocated. Keep revision-specific graphs separate.

All paths below relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/ at PIN. GitHub-reported blob hashes and source line spans:

| File | Blob SHA | Exact declaration / lines |
| --- | --- | --- |
| CharFamily.lean | 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 | Deduction.ramp 10–11; Gchi 15–19; G 21–22; CharFamily 24–32; Gm 36; ZeroFree 38–39; WindowHyp 41–45 |
| LandauZeroFreeCriterion.lean | 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 | gm 9; zeroSet 11–13; PoleData 15–23; WindowHypU 25–29 |
| LandauTheorems/WindowHypOfRpow.lean | dde1c159371538875c28374574ca7e452b0450d9 | windowHyp_of_rpow_eventually 9–25; windowHyp_of_rpow 27–57 |
| LandauTheorems/WindowHypUOfWindowHyp.lean | 701f0502ae106ab89e390105cd9c98e6cf881e1a | image lemma 9–19; fun lemma 21–27; windowHypU_of_windowHyp 29–56 |
| LandauTheorems/ZeroFreeOfRpowWindow.lean | 2ed00ad3aa862f3e522686557fb8f559b17fc002 | zeroFree_of_rpow_window 11–14 |
| LandauTheorems/lemmaL.lean | 6c37aebd05121b6d68e3532d8529f0ce8357386f | lemmaL 13–22 |

To reproduce source inspection, use git show PIN:src/Development/AutomorphicArithmetic/DedekindLFunctions/<file> | nl -ba, and git rev-parse PIN:<full-path>. Source read via connector, not local git checkout; SHA identities reported by connector, not independently rehashed.

## 1. The arithmetic object: exact expansion of Gm

Fix a finite index type I, positive integer modulus N_i for each i, a complex Dirichlet character chi_i mod N_i, and positive real coefficients a_i. Admissibility: for each i, either N_i=1 or chi_i is not the identity character. No common modulus or normalization sum a_i=1 is required.

For real y>=1 and complex f on natural numbers, define
  ramp(f,y) = sum_{p prime} sum_{k>=1, p^k<=y} log(p) f(p^k) (y/p^k - 1).
This is the finite Lean sum over n in range(floor_nat(y)+1), with von Mangoldt Lambda(n) and max(y/n-1,0). Only prime powers survive because Lambda(0)=Lambda(1)=0 and Lambda(p^k)=log p. All other terms vanish. A prime power precisely at y contributes zero. For n>=2 in the finite sum n<=y, the maximum equals y/n-1. The n=0 term in Lean uses totalized division and is zero because Lambda(0)=0; the displayed analytic rewriting never divides by zero. The definition is for all real y; the expansion here is stated only in the positive range relevant to the proof.

For the identity character chi=1, the source defines
  Gchi(chi,y) = ramp(chi,y) - y log y + (1+gamma_E)y.
For chi!=1,
  Gchi(chi,y) = ramp(chi,y) + y L'(1,chi)/L(1,chi).
gamma_E is the Euler–Mascheroni constant, not Cathedral granularity. The plus sign in front of L'/L is essential. The definition uses total Lean field division; this chapter does not establish L(1,chi)!=0. That is a separate analytic obligation when interpreting the ratio.

G(y) is the real part of ramp(1,y) with the same two trivial-character correction terms; Gm(F,y) = sum_i a_i Re Gchi(chi_i,y).
Equivalently let I0={i:chi_i=1}, I1=I minus I0, A0=sum_{i in I0}a_i. Then for y>=1:
  Gm(F,y) =
    sum_{p^k<=y} log(p)(y/p^k-1) sum_i a_i Re chi_i(p^k)
    - A0 y log y + A0(1+gamma_E)y
    + y sum_{i in I1} a_i Re(L'(1,chi_i)/L(1,chi_i)).
The equality follows by exchanging finite sums, real linearity of Re and real a_i. A0 need not be positive if I0 is empty. Gm is real, not necessarily nonnegative. Neither an absolute-value bound nor a lower bound for Gm is required in the window theorem. No primes are generated or controlled by URT in this identity.

## 2. The actual quantifier scopes

WindowHyp(F,theta,delta) means:
  for EVERY real eta>0 and EVERY real Y0,
    there EXISTS real Y>=Y0 and a function R:R->R such that, on I=[Y,Y^(1+delta)],
    (i) R(y)*y^(-theta-1) is Lebesgue integrable on I;
    (ii) at EVERY y in I, 0<=R(y) and Gm(F,y)<=R(y);
    (iii) integral_I R(y)*y^(-theta-1) dy <= Y^eta.

No positivity of Y, theta or delta is baked into this definition. For the theorem below, delta>0 and the constructed witness Y>=1. The pointwise conditions are not merely almost-everywhere conditions. The upper bound is one-sided; do not replace it by |Gm|. R may depend on eta and Y0, though our formula works on each chosen interval.

The hypothesis h in windowHyp_of_rpow (fixed F,theta,delta,C, with delta>0) is
  for EVERY real Y0, there EXISTS real Y>=Y0 such that
    for EVERY y in [Y,Y^(1+delta)], Gm(F,y)<=C*y^theta.
C and delta are fixed BEFORE Y0 and eta are quantified. The windows need only occur arbitrarily far out, not for every sufficiently large Y, and not just at individual y. No assumption C>=0; no restriction 0<theta<1 at this particular implication. Those restrictions enter later in lemmaL.

## 3. Full elementary proof, with explicit threshold

Source windowHyp_of_rpow_eventually uses a=eta/2>0, eventual growth of Y^a, and log Y<=Y^a/a for positive Y.
An equivalent explicit witness (derived here, not claimed to be the literal Lean witness) for K>=0 is
  Y1 = max(1,(K/a)^(1/a)) .
For K=0 use Y1=1. For y>=Y1, y^a>=K/a. For y>=1, the integral of 1/t over [1,y] is at most the integral of t^(a-1), so log y <= (y^a-1)/a <= y^a/a. Consequently
  K log y <= (K/a)y^a <= y^(2a)=y^eta.
This proves the threshold lemma for every eta>0 and K>=0, including K=0.

Now fix arbitrary eta>0 and Y0. Set K=|C| delta >=0 and take the threshold above. Apply h at max(Y0,Y1). This produces a witness Y at least both numbers, and therefore Y>=1>0. Since delta>0 and base Y>=1, B=Y^(1+delta)>=Y. For all y in I=[Y,B], y>0.

Define R(y)=|C| y^theta for all real y (using Lean's real power convention outside the interval). Within I it is nonnegative. Since C<=|C| and y^theta>=0,
  Gm(F,y)<=C y^theta<=R(y).
For every y in I,
  R(y)y^(-theta-1) = |C| y^(theta-theta-1) = |C|/y.
The cancellation is justified by y>0, including for negative theta. This last function is continuous on the compact interval I and therefore integrable. The pointwise identity gives integrability of the requested weighted function; no integrability premise for Gm is needed.

Since B>=Y>0, equality of closed-interval and ordinary interval integrals (endpoints have measure zero) gives
  integral_I R(y)y^(-theta-1)dy
  = |C| integral_Y^B dy/y
  = |C| (log B - log Y)
  = |C| ((1+delta)log Y-log Y)
  = |C| delta log Y
  <= Y^eta.
The degenerate case Y=1 gives integral zero. This discharges (i),(ii),(iii) for the chosen Y,R, with Y>=Y0. Since eta,Y0 were arbitrary, WindowHyp holds. This matches source lines 27–57, with no additional hypothesis. The crucial exact identity is independent of theta.

## 4. Logarithmic coordinate bridge (source-matched)

Define gm(F,u)=Gm(F,exp u). The target WindowHypU(g,theta,delta) is: for all eta>0 and real U0, there exist U>=U0 and Q:R->R with integrability of Q(u)exp(-theta u) on J=[U,(1+delta)U], 0<=Q(u) and g(u)<=Q(u) at every u in J, and weighted integral <=exp(eta U).

Fix eta,U0. Apply WindowHyp with Y0=exp U0, not U0, to obtain Y>=exp U0>0 and R with all three conditions. Put U=log Y, Q(u)=R(exp u). Then U>=U0 by monotonicity. Exponential is strictly increasing, injective and differentiable with derivative exp u. It maps J bijectively to I=[Y,Y^(1+delta)] since exp((1+delta)log Y)=Y^(1+delta). This image identity holds also for empty or singleton intervals; do not add U>=0 to the source theorem. (For negative U and delta>0 both intervals are empty.) In the composite with section 3, U>=0 automatically.

The integrand transforms by the absolute Jacobian:
  |exp u| R(exp u) (exp u)^(-theta-1)
  = Q(u) exp(-theta u).
The source uses integrableOn_image_iff_integrableOn_abs_deriv_smul and integral_image_eq_integral_abs_deriv_smul on measurable Icc, with derivative and injectivity conditions. Thus integrability transfers, the pointwise inequalities transfer by exp(u) in I, and
  integral_J Q(u) exp(-theta u) du
  = integral_I R(y)y^(-theta-1)dy
  <= Y^eta = exp(eta U).
This proves WindowHypU(gm(F),theta,delta), preserving every quantifier. Section 3 alone is not a zero-free proof.

## 5. Interface to the next lane

zeroFree_of_rpow_window adds 0<theta<1 and delta>0 to h. It applies lemmaL F htheta htheta1 hdelta (windowHyp_of_rpow F hdelta h).
ZeroFree F theta means for every i and complex s with theta<Re(s), L(s,chi_i)!=0. No claim about equality Re(s)=theta. In lemmaL, source 15–22, poleData F and landau_window are invoked after the log bridge, with Re(s)>=1 handled by charFamily_LFunction_ne_zero_of_one_le_re, and Re(s)<1 handled by membership of the alleged zero s in zeroSet and the bound from landau_window. These dependencies are deliberately not declared reconstructed in this chapter. The definition of ZeroFree includes the source's Lean LFunction conventions at the trivial-character pole; that boundary is the separate Landau lane's responsibility.

Logical boundary: existence of arbitrarily distant windows satisfying h is the hard upstream arithmetic premise; neither the cancellation nor this chapter proves it. No numerical finite prime data can establish it. No URT-specific acceleration result is asserted. No assumptions dropped or added in the source implications; the explicit threshold formula is an explanatory witness derived under the source hypotheses.

## 6. Executed regression certificate

Executed in local Python 3 sandbox, not Lean. Exact rational coefficient checks compare prime-power enumeration against integer-factorization-based von Mangoldt support (formal log(p) coefficient vectors; no numerical log needed). Floating point checks test the explicit threshold and the weight/Jacobian identities in selected cases. They are not universal proof substitutes.

Copy this block to a temporary Python file and run python3 <file>.

~~~python
from collections import defaultdict
from fractions import Fraction as Q
from math import isclose, log, exp

def prime_base(n):
    if n < 2: return None
    p = next((d for d in range(2, n) if n % d == 0), n)
    while n % p == 0: n //= p
    return p if n == 1 else None

def char4(n):
    return 0 if n % 2 == 0 else (1 if n % 4 == 1 else -1)

def direct(y, f):
    a = defaultdict(Q)
    for n in range(2, int(y)+1):
        p = prime_base(n)
        if p is not None: a[p] += f(n)*max(y/n-1, Q(0))
    return {p:v for p,v in a.items() if v}

def powers(y, f):
    a = defaultdict(Q)
    for p in range(2, int(y)+1):
        if any(p%d == 0 for d in range(2,p)): continue
        n = p
        while n <= y:
            a[p] += f(n)*(y/n-1)
            n *= p
    return {p:v for p,v in a.items() if v}

n_ramp=0
for k in range(2,201):
    for f in (lambda n:1, char4, lambda n: 1+2*char4(n)):
        y=Q(k,2)
        assert direct(y,f)==powers(y,f), (y,f)
        n_ramp+=1

n_bound=0
for K in (0,0.125,1,2,10):
    for eta in (0.25,0.5,1,2,4):
        a=eta/2
        L0=max(0,log(K/a)/a) if K else 0
        for L in (L0,L0+0.125,L0+1,L0+4):
            assert K*L <= exp(eta*L)*(1+1e-12)
            n_bound+=1

n_weight=0
for C in (-3,0,2):
    for theta in (-2,-0.5,0,0.5,2):
        for y in (1,1.5,2,10,100):
            R=abs(C)*y**theta
            assert isclose(R*y**(-theta-1),abs(C)/y,rel_tol=1e-12,abs_tol=1e-12)
            u=log(y)
            assert isclose(y*(R*y**(-theta-1)),R*exp(-theta*u),rel_tol=1e-12,abs_tol=1e-12)
            n_weight+=1

print(f'Exact prime-power coefficient checks: {n_ramp}')
print(f'Floating-point threshold checks: {n_bound}')
print(f'Floating-point weight/Jacobian checks: {n_weight} (two identities each)')
print('All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.')
~~~

Actual stdout:
~~~
Exact prime-power coefficient checks: 597
Floating-point threshold checks: 100
Floating-point weight/Jacobian checks: 75 (two identities each)
All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.
~~~

No lean/lake executable found. No new CI verdict or kernel graph. The test uses real characters for small finite coefficient vectors and does not evaluate L'/L(1), gamma_E or the full Gm function. The proof of finite-sum rearrangement itself permits complex characters. Complexity of this intentionally small test's trial-division implementation is not a claimed production O(N) method.

## 7. Independent audit request and handoff

Audit lane: independently check quantifier order, fixed C/delta, sign of correction terms and one-sided Gm bound, y>0 justification, closed vs interval integrals, theta restrictions only in lemmaL, and handling of negative U/empty intervals. Compare exact original pinned declarations and Mathlib lemmas; check kernel references when available. Do not certify the harder h or PoleData from this chapter.

Metrics: 6 original source files inspected; 4 principal bridge theorems source-matched (threshold, power-to-window, window-to-log, wrapper; wrapper only mapped), 2 auxiliary change-of-variable identities translated; 772 finite regression cases (597 exact, 175 floating-point cases), zero kernel claims, zero dropped hypotheses, no full-corpus complexity or URT benchmark. Full proof coverage denominator unknown.

RESUME HERE: Locate all direct pinned-source call sites of Deduction.zeroFree_of_rpow_window and Deduction.windowHyp_of_rpow in the AutomorphicArithmetic subtree, identify the particular upstream declaration establishing the arbitrarily distant uniform Gm window h, and reconstruct its exact quantifier flow into this bridge. Keep distinct from the Landau lane's downstream pole theorem. Do not substitute an assumed power bound for the missing witness-producing proof.
HANDOFF TO: landau-criterion, formal audit, integration, human proof editor and character-box lanes.



---

## Appendix 10: specialists/landau_criterion/RUN1_LANDAU_CRITERION_RECONSTRUCTION.md
Working-repo blob c607ebbf593efa5490a599af7bdb1a63f60f539a.

# Landau criterion: complete conditional analytical argument (first reconstruction)

Date 2026-11-24. Status SOURCE-MATCHED / independently auditable human derivation; finite regression executed, not independently Lean-elaborated. This is a conditional downstream proof chapter, not a proof of the upstream arithmetic window or the entire RH. No Cathedral physics input.

## Provenance and preflight
Upstream leanprover-community/riemann-hypothesis, immutable commit 40e56bab026552e089d7afcfeff08d2defb9c005. The paths below are relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/. All named files were retrieved by exact pin. Source Git blob IDs:
- CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
- LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
- LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
- LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
- LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
- LandauTheorems/WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a
- LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109
- LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1
- LandauTheorems/LogDerivLocal.lean 56dd45f8630096e041bdad64152e07862e0d4c27
- LandauTheorems/mellinGchiOfNeOne.lean 675a25d278977948c8327f0e1e2e31fb3a990a7d
- LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc (initial 6500 characters inspected; final statement included, final proof body not fully inspected)
- LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
- LandauTheorems/LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0
- LandauTheorems/LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2
- LandauTheorems/LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5
- LandauTheorems/LandauCoeff.lean dc8287f2dbe7c767dcb77893eaf53d07092ed1f3
- LandauTheorems/IteratedDerivLaplace.lean c1c05ec801b258064f1e14fb9d7e624eb7345382
- LandauTheorems/landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef
- LandauTheorems/landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436
- LandauTheorems/kernelIntegral.lean d785c54e03a55b0ef6c0fcb64bc4f8158e803642
- LandauTheorems/LandauKernelMax.lean b230a9e40c3710eac205f32ceb8a44f2d003b647
- LandauTheorems/LandauGrowthContra.lean bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda
- LandauTheorems/LandauPoleReLe.lean 205c7380b79e78b2752ed67aeb069f2a9d12cc77
- LandauTheorems/LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7
- LandauTheorems/LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b

Read protocol, handoff, expansion, AGENTS, continuity, state/log/protocol and latest state-branch CI summary (physical CI PASS at 9aa5afb, not evidence for this chapter). Peer prime-window RUN1 already establishes the elementary power/log window bridge; no duplication of its finite prime tests. Read integration reflection/export, dependencies inventory, kernel and acceleration RESUME notes. No own lane file existed at preflight. Upstream main observed 6c6821263d6b80f4ec3d7479b0159340c1b2f65e at 07:18:26 UTC. Its CharFamily, LandauZeroFreeCriterion, landauWindow blobs differ (cac521ab291c9dab261508613d4d12195cdfb799, f4c5124f8a0188f85b60b2687864d531f9c0a3d8, 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc); the old paths ZeroFreeOfRpowWindow, lemmaL, poleData return 404 at that head. Semantic equivalence of revisions NOT established. All conclusions below exclusively about original pin.

## 1. Statement and exact logical direction
For a finite family F of Dirichlet characters chi_i with moduli N_i>0, each either modulus one or nonprincipal, and strictly positive real weights a_i, define Gm(F,y)=sum_i a_i Re Gchi_i(y) (CharFamily.lean). For fixed real theta, delta, C with 0<theta<1 and delta>0, suppose
  forall real Y0 exists real Y>=Y0 forall y in [Y,Y^(1+delta)]: Gm(F,y)<=C*y^theta.
Then forall i and complex s, theta<Re(s) implies L(chi_i,s)!=0 (Lean convention). No assumption C>=0; no absolute-value upper bound required. No conclusion on Re(s)=theta. The ordinary meromorphic zeta pole at s=1 is not a zero; Lean's totalized value at 1 is nonzero, not the value of a holomorphic extension of zeta itself.

zeroFree_of_rpow_window = lemmaL applied to windowHyp_of_rpow. Prime lane has reconstructed the latter: enlarge Y>=1 as necessary, choose R(y)=|C| y^theta, weighted integral exactly |C| delta log Y <=Y^eta for each eta>0. WindowHyp requires an integrable weighted nonnegative majorant, not nonnegativity of Gm. Under y=e^u, U=log Y, obtain WindowHypU(g,theta,delta) for g(u)=Gm(F,e^u): for every eta>0 and real U0 there are U>=U0 and R(u)>=max(0,g(u)) on [U,(1+delta)U] with R(u)e^(-theta u) integrable there and integral <=e^(eta U). U can be chosen >=1 by asking for larger U0. Do not reverse the implications or assume windows are eventually contiguous.

## 2. Constructing PoleData (poleData.lean)
For an entire function f with f(1)!=0, let b=f'(1)/f(1), kappa a complex constant, and N(s)=f'(s)/f(s)-s b+kappa(1-s). Define P(s)=-N(s)/[s(s-1)] away from 1 (at 1 extend using divided difference of N). Since N(1)=0, the apparent singularity at 1 is removable, and P is holomorphic away from 0 and the zeros of f. The identity theorem (f(1)!=0) implies isolated zeros. At a zero rho!=0 with order m>=1, factor f(s)=(s-rho)^m h(s), h(rho)!=0. Then f'/f=m/(s-rho)+h'/h. Since rho!=1, multiply by -1/[s(s-1)] and separate its value at rho from its analytic divided difference. The result is
  P(s)=m*(-1/[rho(rho-1)])/(s-rho)+analytic remainder.
At a nonzero non-root take m=0. Source logDeriv_local preserves analytic order and all the local eventual-equality conditions. This residue formula includes multiplicities; a multiple L-zero becomes a simple logarithmic-derivative pole.

Nonprincipal chi: f=L(chi,.), kappa=0, entire and f(1)!=0 by imported Mathlib results. For modulus-one chi take f(s)=(s-1)zeta(s) for s!=1, and f(1)=1 by the residue at 1. Its derivative at 1 is Euler's constant gamma_E, and kappa=1. Source uses riemannZeta_one_ne_zero to identify zeros even at the totalized point. Thus
  P_nonprincipal(s)=-(L'/L(s)-s L'/L(1))/(s(s-1)),
  P_modone(s)=-(zeta'/zeta(s)+1/(s-1)+1-(1+gamma_E)s)/(s(s-1)).
These identities away from 1 are exactly the Mellin transforms of Gchi at Re(s)>1. For the explanatory calculation, each ramp (y/n-1)_+ has Mellin integral n^(-s)/(s(s-1)), n>=1. Interchange prime-weighted sum/integral by absolute integrability, using the twisted von Mangoldt series = -L'/L. Correction y times b gives b/(s-1). For modulus one, -y log y+(1+gamma_E)y gives -1/(s-1)^2+(1+gamma_E)/(s-1), hence the displayed formula. The source uses MellinRamp, LSeriesSummable_twist_vonMangoldt and Gchi correction integrability. The full final proof body of mellin_Gchi_modOne and its transitive Mathlib prerequisites remain an audit frontier, not silently certified.

For the actual family use P_i for chi_i and P'_i for inverse chi_i (prime here denotes inverse-character label, not derivative). Conjugation Gchi_inv=conj Gchi makes real part half the sum. Define Phi(s)=sum_i (a_i/2)(P_i(s)+P'_i(s)). Change variables y=e^u, dy/y=du, so for Re(s)>2:
  Phi(s)=integral_0^infinity g(u)e^(-su)du.
Measurability and |g(u)|<=C0 e^(2u) follow from measurable_Gchi, Gchi_growth and finite positive weighted sum (these imported estimates still need separate leaf audit). The bound makes the integral absolutely convergent on Re(s)>2. Z= {rho : Re(rho)>0 and some chi_i has L(chi_i,rho)=0 or L(chi_i,conj rho)=0}. Conjugate zero iff inverse-character zero (poleData_inv_zero). At any rho in Z, at least one multiplicity among the original and inverse characters is positive; the entire finite family contributes
  S=sum_i (a_i/2)(m_i+m'_i)>0,
  residue c=-S/[rho(rho-1)].
Crucial: weights are positive and all factors share the same complex phase at this particular rho; no cancellation, even at a nonreal zero. By the source's one_le_re nonvanishing theorem, rho!=1; when rho is real, 0<rho<1, so c=S/[rho(1-rho)] is strictly positive real. This covers real exceptional zeros rather than assuming their absence. The family transform is holomorphic off Z in Re(s)>0, and Z is locally discrete there, including at points not in Z. These are all seven PoleData fields: meas, growth, laplace, pos, diff, iso, pole. Finite family can be empty (Z empty, conclusion vacuous); positivity at an alleged zero uses an existing index witness.

## 3. The signed window estimate: no absolute prime bound
Write A_k(z)=(-1)^k Phi^(k)(z)/k!, k>=0. By dominated differentiation (for a small disc around Re(z)>2, dominate by C0 u^k exp(-b u), b>0), A_k(z)=integral g(u)u^k e^(-zu)/k! du. This is landau_coeff and iteratedDeriv_laplace, where the signs cancel exactly.

Fix sigma>2 and let w(u)=u^k e^(-sigma u)/k!>=0 for u>=0. Triangle inequality gives |A_k(sigma+i t)|<=integral |g|w, while Re A_k(sigma)=integral gw. Thus
  |A_k(sigma+i t)|+Re A_k(sigma) <= integral (|g|+g)w.
The left second term is SIGNED, not absolute. On the chosen window, |g|+g=2 max(g,0)<=2R, regardless of arbitrarily negative g. The elementary exponential-series estimate u^k e^(-a u)/k!<=a^(-k) for a>0 gives w<= (sigma-theta)^(-k)e^(-theta u). Outside the window use |g|+g<=2C0 e^(2u). Therefore (landau_window_ineq)
  |A_k(sigma+i t)|+Re A_k(sigma)
   <= 2 (sigma-theta)^(-k) integral_window R e^(-theta u)
      +2C0 integral_outside u^k exp(-(sigma-2)u)/k!.
This is the key to exploiting a one-sided bound.

## 4. One derivative order suppresses both tails
Let l=2+6/delta, M=l(1+delta), sigma=M(2+l)>2; fix these before choosing eta or U. For U>=1 take k=ceil((1+delta/2)*sigma*U)>=U, V=(1+delta)U. Gamma integral integral_0^infty u^k e^(-a u)/k! du=a^(-k-1). Chernoff splitting, s=sigma-2>l, bounds outside [U,V] by
  e^(-l V)/(s-l)^(k+1) + e^(l U)/(s+l)^(k+1).
With a=s-l and b=s+l, use log(sigma/a)<= (sigma-a)/a and likewise b. Exact algebra and the ceiling bounds yield
  -l V+k(sigma-a)/a <= 1,
  l U+k(sigma-b)/b <= 0.
Indeed (sigma-a)/a=1/(M-1) and (1+delta/2)sigma=M(M-1); also (1+delta/2)(l-2)=l+1 and l(sigma-2+l)<=(l+1)sigma. Hence the tail integral <= C_tail/sigma^k, C_tail=e/a+1/b. No large-k limit approximation; source landau_tails constructs these constants explicitly. The certificate tests exact rational exponent inequalities.

Combine Sections 3–4: for E=sigma-theta>0, C_key=2+2 C0 |C_tail|, for every eta>0,U0 there are U>=max(U0,1) and k>=U such that for ALL real t,
  |A_k(sigma+i t)|+Re A_k(sigma) <= C_key e^(eta U)/E^k.
Here sigma,C_key fixed and U,k do not depend on t (landau_window_key). Critical quantifier uniformity: choose t from pole geometry before or after using this bound; no averaging over t, no assumption of positive g.

## 5. A pole to the right of theta forces a faster-growing derivative
Abstract PoleData implies every pole Re(rho)<=2: integral bound |Phi(s)|<=C0/(sigma0-2) for Re(s)>=sigma0>2; a nonzero residue in that region contradicts boundedness because (s-rho)Phi(s)->c!=0. So all poles strictly left of fixed sigma.

Assume rho0 in Z with Re(rho0)>theta. Write E=sigma-theta<sigma. Compact discs lying in Re>0 meet only finitely many poles: local punctured isolation at every point yields finite subcover of the compact disc. The source uses landau_finite and landau_dichotomy.

Dichotomy: if no pole in closed disc of radius E around real sigma, take D=E. Otherwise minimize the distance to real sigma over that finite nonempty set, take D this minimum. In either case open disc radius D is pole-free. If there is a pole rho1 with horizontal gap sigma-Re(rho1)<D, this is Case A. If not, the minimum-distance pole must be real beta=sigma-D, because distance>=horizontal gap>=D and equality forces Im=0. It is unique at distance D; since rho0 has horizontal gap<E, D<E. Choose a radius r with D<r<=E and no other pole in open disc using finiteness. This is Case B. The empty-closed-disc branch always falls in A. No global rightmost zero assumed, and no supremum attained assumed.

Case A: choose vertical center z=sigma+i t near sigma+i Im(rho1) by a perturbation less than epsilon=min(D-(sigma-Re(rho1)),sigma-D)/2>0. The enlarged closed disc of radius D+epsilon lies in Re>0 and contains finitely many poles. Avoid the finite set of vertical bisector heights of pairs (equal height distinct poles cannot tie since Re<sigma). For unequal heights the forbidden t is
  ((sigma-Re a)^2+(Im a)^2-(sigma-Re b)^2-(Im b)^2)/(2(Im a-Im b)).
Thus the closest pole rho to z is unique and has d=|z-rho|<D; choose d<r<=D so open disc radius r contains only rho. Poles outside enlarged disc cannot enter this disc by triangle inequality. This is landau_nearest.

Subtract c/(s-rho), and extend remainder at rho using its local analytic expansion; it is holomorphic throughout disc radius r. On circle of radius e=(d+r)/2, Cauchy coefficient estimate gives
  |A_k(z)-c/(z-rho)^(k+1)| <= M1/e^k.
The real center disc of radius D is pole-free; same e<D gives |A_k(sigma)|<=M2/e^k. Cauchy constants are finite circle norms/averages, independent of k. By reverse triangle inequality and Re A_k(sigma)>=-|A_k(sigma)|,
  |A_k(z)|+Re A_k(sigma) >= (|c|/d)/d^k -(M1+M2)/e^k.
We have 0<d<e<=E. This handles complex poles without assuming their residues positive real.

Case B: real beta>theta, closest isolated pole, d=sigma-beta>0, and d<r<=E. Again Cauchy after subtracting the pole, e=(d+r)/2, gives
  Re A_k(sigma) >= (Re c/d)/d^k - M1/e^k
with Re c>0. Add the nonnegative |A_k(sigma)| on the left and apply key estimate with t=0. A real negative residue would not provide this lower bound: the positive residue field is indispensable to this branch. This is why strictly positive family weights matter and why exceptional real zeros are accounted for.

## 6. Exponential contradiction and final implication
Both cases imply constants c_*>0, 0<d<e<=E, M_*,C_key such that for every eta>0,U0 there are U>=U0 and natural k>=U with
  c_*/d^k <= M_*/e^k + C_key e^(eta U)/E^k.
Take U>=0, majorize right by C_* e^(eta U)/e^k where C_*=|M_*|+|C_key|. Put L=log(e/d)>0, eta=L/2, U0=2C_*/(c_* L). Then e^(eta U)>=1+eta U>=1+C_*/c_*, so C_*<c_*e^(eta U); and k>=U implies e^(2eta U)<=e^(kL)=(e/d)^k. Hence C_*e^(eta U)/e^k < c_*/d^k, contradiction. This exactly follows landau_growth_contra and landau_window_contra. No sign of M_* or C needed in abstract growth lemma; their absolute values suffice. Thus every rho in Z satisfies Re(rho)<=theta.

Finally lemmaL: suppose L(chi_i,s)=0 and Re(s)>theta. Source splits Re(s)>=1, excluded by charFamily_LFunction_ne_zero_of_one_le_re (modulus one uses zeta nonzero; nonprincipal uses Dirichlet nonzero), and Re(s)<1, where Re(s)>theta>0 implies s in Z via the original-character disjunct. landau_window gives Re(s)<=theta, contradiction. Strict threshold and both branches preserved. Combining the peer's power/log bridge proves the conditional zeroFree_of_rpow_window. The arithmetic proof of the initial window hypothesis is separate and must not be inferred from this criterion.

## 7. Executed finite regression certificate
Local Python 3 standard library. Copy block to a Python file and execute; not a proof of universal inequalities or Lean verification.
~~~python
from fractions import Fraction as Q
from itertools import product
from math import ceil, exp, log
def run():
    counts = dict(tails=0, residue=0, signed_bound=0, geometry=0, growth=0)
    for delta,U in product(map(Q,['1/100','1/8','1/2','1','3','10']),map(Q,['1','3/2','4','10','100'])):
        l=2+6/delta; M=l*(1+delta); sigma=M*(2+l)
        k=ceil((1+delta/2)*sigma*U); a=sigma-2-l; b=sigma-2+l
        assert sigma>2 and a>0 and b>0 and k>=U
        assert -l*(1+delta)*U+k*(sigma-a)/a<=1
        assert l*U+k*(sigma-b)/b<=0
        counts['tails']+=1
    for rho,m,n,a,b in product(map(Q,['1/100','1/4','1/2','99/100']),range(3),range(3),map(Q,['1/3','2']),map(Q,['1/7','3'])):
        S=a*m/2+b*n/2
        assert (S>0)==(m+n>0)
        if S: assert -S/(rho*(rho-1))>0
        counts['residue']+=1
    for g,R,w in product(range(-5,6),range(6),map(Q,['0','1/7','3'])):
        if g<=R:
            assert (abs(g)+g)*w<=2*R*w
            counts['signed_bound']+=1
    sigma=Q(3); points=[(x,y) for x in map(Q,['1/4','1/2','3/4','1','2']) for y in range(-2,3)]
    def dsq(p,t): return (sigma-p[0])**2+(t-p[1])**2
    for p,q in product(points,repeat=2):
        if p==q: continue
        if p[1]==q[1]: assert dsq(p,0)!=dsq(q,0)
        else:
            t=((sigma-p[0])**2+p[1]**2-(sigma-q[0])**2-q[1]**2)/(2*(p[1]-q[1]))
            assert dsq(p,t)==dsq(q,t) and dsq(p,t+1)!=dsq(q,t+1)
        counts['geometry']+=1
    for c,d,e,C in product([0.1,1,3],[0.25,1,2],[3,4,10],[0.0,0.5,10]):
        L=log(e/d); eta=L/2; U0=2*C/(c*L)
        for U in [U0,U0+1,U0+10]:
            for k in [ceil(U),ceil(U)+1,ceil(U)+10]:
                assert C==0 or log(C)+eta*U < log(c)+k*L
                counts['growth']+=1
    print(counts)
    print('All finite tests passed; not a Lean/kernel verification.')
if __name__=='__main__': run()
~~~
Actual stdout:
{'tails': 30, 'residue': 144, 'signed_bound': 153, 'geometry': 600, 'growth': 729}
All finite tests passed; not a Lean/kernel verification.
927 exact rational/integer cases and 729 floating-point log-space cases = 1656 finite tests. No Lean or Lake executable found. No new CI run verified. No full-corpus proof coverage percentage or URT speed claim. 25 pinned modules read, one partly. Seven abstract fields preserved; two geometrical branches reconstructed; one main conditional analytical criterion reconstructed at source level; no extra premises or removed hypotheses. Arithmetic window remains OPEN in this lane's chapter.

RESUME HERE: finish the final body of mellin_Gchi_modOne.lean and retrieve GchiGrowth.lean, measurableGchi.lean, GchiConj.lean, LFunctionConj.lean and MellinRamp.lean at original pin. Reconstruct the exact growth/measurability/conjugation and Mellin leaf obligations, including the real exceptional-zero and modulus-one pole convention; compare current upstream renamed/moved files only as a separate revision audit. Then send complete pole construction for independent audit. Do not repeat prime-window witness producer research assigned to prime lane.

HANDOFF TO: integration, human proof editor, audit, prime-window and character-box lanes. The signed coefficient bound, tail choice, noncancelling residues, pole geometry dichotomy, and growth contradiction are ready for independent source-level review.


---

## Appendix 11: math/2026-11-24_analytic_zero_exclusion_chapter.md
Working-repo blob 2c296ac9e55158223fb239104a8a318f0e95f923.

# Human proof chapter: from arithmetic windows to exclusion of zeros

Status: SOURCE-MATCHED mathematical reconstruction, not a new kernel verification. Upstream commit 40e56bab026552e089d7afcfeff08d2defb9c005. This chapter supplies the actual analytic subargument, not just theorem names. It does not establish the upstream arithmetic window estimates independently.

## 1. Prime-power signal, precise assumptions
Source: Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean (blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96).
For a Dirichlet character chi, let
 A_chi(y) = sum_{n <= floor(y)} Lambda(n) chi(n) max(y/n - 1,0),
with von Mangoldt Lambda. For a trivial character define G_chi(y)=A_chi(y)-y log y+(1+gamma_E)y. Otherwise G_chi(y)=A_chi(y)+y L'(chi,1)/L(chi,1).
A character family F has finite index set, positive moduli N_i, characters chi_i, real weights a_i>0, and admissibility N_i=1 or chi_i != 1. Define G_m(y)=sum_i a_i Re G_chi_i(y).
For fixed 0<theta<1 and delta>0, suppose for every real Y0 there is Y>=Y0 such that G_m(y)<=C y^theta for every y in [Y,Y^(1+delta)], with C fixed real. The estimate is ONE-SIDED, not an absolute bound. Arbitrarily late full multiplicative windows suffice; no eventual all-y bound assumed.

## 2. Reduce to logarithmic windows
Sources: WindowHypOfRpow.lean (dde1c159371538875c28374574ca7e452b0450d9), WindowHypUOfWindowHyp.lean (701f0502ae106ab89e390105cd9c98e6cf881e1a), under Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/.
For every eta>0 choose Y sufficiently large so Y>=1 and |C| delta log Y<=Y^eta. This is possible since log Y=o(Y^eta); the source proves it via log Y <= Y^(eta/2)/(eta/2) and Y^(eta/2)>=|C|delta/(eta/2). The original window hypothesis permits Y above the maximum of this threshold and any prescribed starting point.
Set R(y)=|C| y^theta, which is nonnegative and dominates G_m on the selected window. Its weighted integral is exactly |C| delta log Y, hence <=Y^eta. With u=log y, U=log Y, let g(u)=G_m(exp u) and B(u)=R(exp u). Then the interval becomes [U,(1+delta)U] and the weighted integral becomes integral B(u) exp(-theta u) du <=exp(eta U). For every eta>0 and every real U0 there is such U>=U0 and an integrable nonnegative majorant B>=g on that interval. This is precisely WindowHypU.

## 3. Zeros create noncancelling poles
Sources: DedekindLFunctions/LandauZeroFreeCriterion.lean (54fd0de979e0dad6ac7709ad8ecbec8a29e21872), LandauTheorems/poleData.lean (1f7fdc4409d2f1185700764c51d5c17a907d76e1).
There exists Phi with Phi(s)=integral_0^infty g(u) exp(-s u) du for Re(s)>2; g is measurable and |g(u)|<=C0 exp(2u) for u>=0. In Re(s)>0 its exceptional set Z comprises zeros of any family L-function and their complex conjugates. Phi is differentiable outside Z and Z is locally isolated in the right half-plane.
At rho in Z, Phi(s)=c/(s-rho)+h(s) near rho, with h analytic and c != 0. The residue is
 c = -S/[rho(rho-1)], S=sum_i a_i(m_i+m_i')/2 >0,
where m_i,m_i' are nonnegative multiplicities of zeros of L(chi_i,s), L(chi_i^{-1},s). A zero of at least one contributes positively. The common factor prevents cancellation between family members. A real rho satisfies 0<rho<1 because no member vanishes for Re>=1, so c=S/[rho(1-rho)]>0 is real. These signs matter in the one-sided argument. The source regularises the modulus-one zeta factor using (s-1)zeta(s) at s=1; other members are nontrivial by admissibility.

## 4. The analytic contradiction
Source: LandauTheorems/landauWindow.lean (7915058f10b33a52652290cd887cbccdc00e676a).
Set D_k(z)=(-1)^k Phi^(k)(z)/k!. landau_window_key proves the following using the Laplace expression, a majorant on the window, and tails outside it:
 there exist sigma>2 and C1 such that for every eta>0 and every U0 there exist U>=U0 and integer k>=U, for every real t,
 |D_k(sigma+it)|+Re D_k(sigma) <= C1 exp(eta U)/(sigma-theta)^k.
No replacement by an absolute bound on g or by a bound for all derivative orders is allowed.
Assume a pole rho0 in Z with Re rho0>theta. The source's landau_dichotomy and landau_nearest choose one of two configurations:
 A. A unique nearest pole rho to z=sigma+it, distance d>0, isolated in a disk of radius r>d, with room for an analytic disk centered at sigma; choose e=(d+r)/2 with d<e<=sigma-theta. Pole asymptotics give D_k(z)=c/(z-rho)^(k+1)+O(e^-k); Cauchy bounds give D_k(sigma)=O(e^-k). Combining the reverse triangle inequality with Re D_k(sigma)>=-|D_k(sigma)| yields A0 d^-k<=M e^-k+C1 exp(eta U)/(sigma-theta)^k, A0=|c|/d>0.
 B. A uniquely isolated real nearest pole beta>theta centered at sigma, d=sigma-beta>0, and e=(d+r)/2, d<e<=sigma-theta. Here the residue c is real positive; Re D_k(sigma)>=c/d^(k+1)-M/e^k, and the absolute-value term is nonnegative. The same inequality holds with A0=c/d>0.
In both cases, put E=sigma-theta>=e and A=|M|+|C1|. Taking U>=0 and k>=U, the inequality implies
 A0 (e/d)^k <= A exp(eta U) <= A exp(eta k).
Choose eta=(1/2)log(e/d)>0. Then A0 exp(eta k)<=A, impossible for k>=U with arbitrarily large U. If A=0 the inequality is already impossible. Thus no pole in Z has Re>theta.
This last algebraic compression is an elementary consequence of the exact source hypotheses (source counterpart landau_window_contra/landau_growth_contra), not a new RH argument or an additional URT assumption. The Cauchy, pole isolation, and window-tail lemmas are retained obligations for the full proof.

## 5. Connect back to the genuine proof chain
Deduction.lemmaL (LandauTheorems/lemmaL.lean, 6c37aebd05121b6d68e3532d8529f0ce8357386f) obtains PoleData from the family and applies landau_window to its zero set. Re>=1 is handled separately by charFamily_LFunction_ne_zero_of_one_le_re; for theta<Re<1 membership in Z gives contradiction.
Deduction.zeroFree_of_rpow_window (LandauTheorems/ZeroFreeOfRpowWindow.lean, 2ed00ad3aa862f3e522686557fb8f559b17fc002) combines sections 2-5.
The actual bridge is UpperTheory.Comparison₂.formB (Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean, 2dc9b4e690951c66ffe443e279fcada259bcce13): level_family supplies F, the signal equality and the zero-free equivalence. It instantiates delta=la-1 and C=1, where la>1 is the window exponent. This is an explicit proof-term reference, not inferred from filenames.
UpperTheory.Top.zeroFreeAll_of_topG (CharacterBoxes/ZeroFreeAllOfTopG.lean, 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1) passes level_gm_le_on_family_scales and formB to zeroFreeOn_of_tiedWin_cyc. The latter still needs its own reconstruction. plugWin uses la=3/2 (so delta=1/2), shapeWin and supplyChi; supplyChi requires VWinAt psi 401 (CharacterBoxes/SupplyChi.lean, 339885b77069601fb716a60739369805241e8222). Do NOT assume these arithmetic inputs have now been proved by the analytic chapter.
Finally UpperTheory.Top.imprimitive (CharacterBoxes/Imprimitive.lean, 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa) extends primitive nonvanishing to arbitrary chi. Its L-function is the primitive L-function times finitely many Euler factors 1-chi_prim(p)p^-s. For Re s>1/2, |chi_prim(p)|<=1 and p^-Re(s)<1, so no factor vanishes. The excluded principal-character-at-one condition is transferred using changeLevel_primitiveCharacter and changeLevel_one. This establishes EveryCharacter once ZeroFreeAll is available. The reflection chapter then gives RH.

## Execution and limitations
Fetched original source at pinned revision and inspected declarations, signs, exception cases and quantifier scopes. This is source-matched prose, not executed Lean. Independent formal verification is reported at https://math.mit.edu/~drew/grh/; our own translation audit remains open. Current sandbox has about 30 GB free vs 61.57 GB raw export, 5.8 GiB RAM, no Lean installed, and MIT hostname lookup fails. Compressed export 7,699,933,588 bytes; checksum verified against publication text, not against downloaded bytes. No full-corpus graph run, no URT speedup claim. Do not attempt to download/unpack the full file in the same constrained session.
RESUME HERE: reconstruct zeroFreeOn_of_tiedWin_cyc and the source of level_gm_le_on_family_scales, then tie its arbitrarily large window guarantee to the upper arithmetic/geometry hypotheses. Separately unpack the seven-input every_character_of_theta_integrals_local_matching adapter. Preserve exact one-sided bounds and residue positivity.
HANDOFF TO: math, character boxes, positivity and integration lanes.



---

## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md
Working-repo blob 6b3c337c9a2fe1acc41d8246a79a6ca8e565ee66.

# Reflection and nonvanishing junction — manual continuation

Status: SOURCE-MATCHED, not locally elaborated. Original upstream revision 40e56bab026552e089d7afcfeff08d2defb9c005.

## Exact source-matched reconstruction
- src/Main.lean (blob dbd5db70bc11b35f18fa5751216ab335321e7bfc): riemannHypothesis uses rhOfAll.
- src/Supplements/Kernels/MainTheorems.lean (6a542d7ce969a791fd12ce575f587e6bc29044bf): rhOfAll uses Formalism.VW.rh_of_every allChi; allChi uses UpperTheory.FinalTheorems.everyCharacter.
- src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean (6ac769568b67f85f33565ba3e1eef7b91f53c55f): all positive moduli N, all characters chi and all complex s with Re(s)>1/2, except chi=1 AND s=1, have nonzero L(chi,s).
- src/Formalism/GammaFactorNonvanishing/CritLine.lean (95fa4da5c50119db164aa93944d106f22fdb576d): specialize to the modulus-one character, identify its L-function with zeta. For primitive chi and 0<Re(s)<1, a left-half zero would give a zero of the completed L-function (gamma factor nonzero); the functional equation transfers it to inverse chi at 1-s, violating EveryCharacter. A right-half zero violates EveryCharacter directly. Inverse character remains primitive; s and 1-s are nonzero; neither relevant point is the excluded pole.
- src/Formalism/GammaFactorNonvanishing/RhOfRight.lean (3604637147a33e72248faddd775ea750e7846ead): for any nontrivial zeta zero s unequal to 1, rule out s=0 using zeta(0)=-1/2. Right-half nonvanishing excludes Re(s)>1/2. If Re(s)<1/2 put t=1-s; Re(t)>1/2, t!=1, t is not a nonpositive integer. The functional equation zeta(1-t)=2(2pi)^(-t) Gamma(t) cos(pi*t/2) zeta(t) then contradicts zeta(s)=0: all factors nonzero, including cosine since cosine zero forces s=-2k for integer k, with k<0 impossible by Re(s)<1/2, k=0 excluded, k>0 trivial zero excluded. Thus Re(s)=1/2.

## Upstream junction
MainConclusion.lean (ee340012ab19713a8acfecf8adc6a331cbc2f1a4): the row theorem supplies the tuple of literature inputs (h, recTExists, h) and the window vwin_of_row h. VwinOfRow.lean (4cba179acd45ac08d3cad21f51c9b9d62715a9a4) constructs the window from OpenImageCondition.mk h and baseChangeN h. RowSrc.lean (f769999ac5e49241993e5efbf81e4d2cded18acd) gets the row from galoisRepresentations_of_thetaLift tLiftK.
EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: published_results_eigen O, published_results_first O, both projections of theta_integrals_agree_and_local_matching_of_literature O, topCovolSlim2_use_alt_alt (15 explicit inputs), local_langlands_gl_recT_exists_of_literature O, hV. Preserve both projections even when sharing their producer. This is a source-level interface map, not the complete kernel dependency graph.

## Avoid duplicate full compilation
Public independent verification report https://math.mit.edu/~drew/grh/ updated 2026-11-24 03:30 UTC reports 175187 compiled modules; full export 61570595788 bytes, SHA256 prefix 5ea74b91 suffix 244e; con-leche accepted 1468418 declarations; standard axiom set propext, Classical.choice, Quot.sound. Lean community confirmation https://leanprover-community.github.io/blog/posts/riemann-hypothesis/. Distinguish external proof verification from our translation verification. Existing verified export or precompiled environment is preferred to rebuilding all modules for dependency extraction. Public repo README https://github.com/leanprover-community/riemann-hypothesis describes cache and original commit. Exact export availability and checksum must be checked, not assumed.

## Tests and limitations
Actual connector fetches of the listed original files succeeded; source-level count executed. Local shell has neither Lean nor Lake and no GitHub DNS; no local kernel check, no full export transfer or URT full-corpus benchmark performed. Prior reported exporter commit could not be identified by commit search. Do not treat that report as current verified persistence.

RESUME HERE (dependencies): locate the verified export or pinned precompiled original cache; obtain exact exporter artifact from prior lane; test its compilation or implement streaming export parser on actual format and extract root-reachable declarations in O(V+E) after expression-DAG reference indexing. Do not assume import counts are kernel-edge counts.
HANDOFF TO (math): unpack every_character_of_theta_integrals_local_matching with all seven exact input types, and the prime-window argument; preserve both shared theta projections and arithmetic obligations. No physics assumptions or new axioms.

