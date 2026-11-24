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