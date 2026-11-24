# galois_rows RUN6 — where the `gal` field is first unpacked, and the 28 PublishedHodgeBundleTheorems fields

Pin: riemann-hypothesis `40e56bab026552e089d7afcfeff08d2defb9c005`. Source reading only; every file:line is replayed by `RUN6_replay_checks.py` (output and the embedded tsv are in `RUN6_VALIDATION_LOG.txt`; 167 checks ok, 0 bad).
No compilation of repo code was done in this run, and no gate is marked closed. The companion resolution and SNC faithfulness chapter is `../covolume_premises/RUN2_RESK_RESOLUTION_FAITHFULNESS.md`.
Below, D = `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases`.

## A. Trace of `LiteratureAutomorphyHypothesis.gal`

| # | step | file:line |
|---|---|---|
| G0 | field `gal : _root_.UpperTheory.V.Z.Win.RowT` of `structure LiteratureAutomorphyHypothesis` (:31) | D/LitAut.lean:39 |
| G1 | `RowT := UpperTheory.GalStar.Row0b fun h rc => IsRecT h rc`, which is the Row0b statement audited in RUN5 | …/AutomorphyLifting/WeakOfAtt.lean:47 |
| G2 | filled by `gal := gal` in `automorphic_inputs_from_literature` (RUN5) | D/TopMainZj.lean:47 |
| G3 | wrapped as field `aut` of `LiteratureRankNHypothesis` (:59) | D/LitAut.lean:61 |
| G4 | `v_window_of_literal_automorphy_n hN := v_window_of_automorphy_csd_ss_mono_odd hN`; that is `vwin_of_hypotheses_H_E_alt (published_hypotheses_from_patching_alt hN descWeak)`. Neither destructures hN. | D/WindowBoundOfLiteratureLevel.lean:33–34, :31 |
| G5 | `published_hypotheses_from_patching_alt` passes **all of** hN to its fields: `litN := hN`, `cohC := clozelCohC_alt hN` (uses only `lit.aut.coh`, TPCohC.lean:23), and `galR := galois_rep_exists_totally_real_rank_two_of_base_change hN …` | D/PublishedHypothesesFromPatching.lean:99–100 |
| **G6** | **first theorem that unpacks `gal`:** `galois_rep_exists_totally_real_rank_two_of_base_change` (SVPatch.lean:103), at `obtain ⟨r, wt, HT, hr⟩ := rowOf' litN.aut.gal ↥Q.K Ω l ι a ha P χ' hregP hχ'` | **D/SVPatch.lean:127** |
| G7 | `rowOf' (h : RowT) : RowT := h`, which is the identity, so G6 applies Row0b directly | …/RankTwoPatching/GaloisRepExistsTotallyRealGL2.lean:60 |

**What G6 uses it for.** A totally real F and a regular algebraic polarized cuspidal π on GL_a are given. For each quadratic CM extension Q.K in an infinite family S, the proof base-changes π to P on Q.K. It gets regularity and polarization of P from `regular_algebraic_and_polarized_of_quadratic_base_change`, and then **instantiates Row0b over the CM field Q.K** to obtain a Galois representation r_Q with weights and HT data. That representation satisfies `PropsB` with local–global compatibility `IsRecT` (SVPatch.lean:122–128). The family {r_Q} is then patched (`galois_rep_patching_infinite_family`) into a representation over F. This is the standard "patching over CM quadratic extensions" construction for GL_n over totally real fields (Harris–Lan–Taylor–Thorne / Scholze style; reference from memory, not re-opened).

**What "first" means here.**
- G6 is the first *textual projection* `.aut.gal` reached along the VWin evaluation path G4→G5 (field order in G5: `litN`, `cohC`, `galR`).
- `cohC` (TPCohC.lean) projects only `.aut.coh`.
- Inside G6, the two calls before line 127 that take the whole `litN` were checked. `regular_algebraic_and_polarized_of_quadratic_base_change` (BcRegAlgPolarizedPairStatement.lean, 16 lines) contains no `.aut.*` projection. `inertia_le_range_of_unramified_alt` projects `N.aut.art` (InertiaLeRangeOfUnramified.lean:18), not `gal`.
- I did **not** chase every transitive callee that takes the whole hN, so "first" is a claim about direct projections on this path.
- A repo-wide census finds **27** textual `.aut.gal` projections, listed in the log. Other consumers (e.g. CrystallineBaseChange/*, TemperedLocalComponents/*, FrobOfProps.lean:42, RRFree.lean:111) reach `gal` through `HypothesesH'.litN` after G5.
- **Soundness of these uses was not re-audited this run.** RUN5 audited Row0b's weakened clauses (`tame0`, `IsQpBig`); in G6, `hr` is used at SVPatch.lean:131–132 (`.cont`, `.ss`, `attRes_alt`), :137 (`props_iso`) and :140 (`hbc`).

## B. The 28 fields of `PublishedHodgeBundleTheorems`

- **Correction:** earlier notes said 24 fields. The structure at `…/HodgeBundleWeights/ToKnownTheoremsOf.lean:7–35` has **28** (p1 p2 p3 p4 p5 p8 p12 p13 p14 p16 p19 p20 p22 p23 p25 p26 q1 q4 q6 q7 q8 q9 q10 q11 q13 q15 q16 q18).
- **Where they are filled:** `published_results_arithmetic O` (EveryCharacterOfLiteratureOfVWin.lean) fills each one with `*_of_literature O`.
- **Mechanical check:** for every one of these 28 wrappers, and for the 2 helper wrappers they call (`grothendieck_deformation`, `abelian_lifting`), the replay confirms that the body contains **no projection `O.<field>`** of `OpenLiteratureStatements`. Every one of them ignores O and is filled by a named repo theorem.

| field | wrapper (line in EveryCharacterOfLiteratureOfVWin.lean) | producer named in the body |
|---|---|---|
| p1 | toroidal_compactification (521) | GlobalTheory.toroidalCompactification_holds |
| p2 | vol_ge (531) | VolBr.volGe_of_hilbertSamuel (wrappers q9, p4, q7) |
| p3 | vol_nef (533) | ArithHilbertSamuel.volNef (wrapper q9) |
| p4 | ar_calc (249) | ArakelovDirectHeights.arCalc_direct poincareLelong **resK** |
| p5 | abelian_de_rham (239) | PositivityTheory.DualRT.abelianDeRham |
| p8 | ray_class_field_st (489) | PositivityTheory.Stage1.PM.rayClassFieldSt |
| p12 | semistable_reduction_st (501) | GlobalTheory.SS.semistableReductionSt |
| p13 | strong_approx_su (517) | StrongApproxSUProof.strongApproxSU |
| p14 | green_series_st (401) | Prw.greenSeriesSt_of Stage1.PM.greenCuspidal |
| p16 | good_chern_weil (395) | GlobalTheory.GoodMetric.goodChernWeil |
| p19 | landherr_st (453) | (QNorm.landherr_and_landherrSt).2 |
| p20 | hasse_norm_st (417) | GlobalTheory.QNorm.hasseNormSt |
| p22 | semi_abelian_hom_extension (497) | GlobalTheory.semiAbelianHomExtension_holds |
| p23 | induced_simple_lowest_alcove (441) | GlobalTheory.Alc.inducedSimpleLowestAlcove |
| p25 | principal_polarisation_one_section (409) | AbLaw.principalPolarisation_unique_section |
| p26 | ab_mul_n_st (237) | GlobalTheory.abMulN_holds |
| q1 | grothendieck_messing (407) | GrothendieckDeformation.grothendieckMessing (wrapper grothendieck_deformation (405), which uses p5 and abelian_lifting (403) = abelianScheme_hom_lifting_nilpotent_dividedPowers) |
| q4 | prismatic_dieudonne_hodge (475) | UpperTheory.Lit.prismaticDieudonneHodge |
| q6 | kawamata_viehweg (447) | KVFromPair.kawamataViehweg_of_nadelVanishingPair nefNumerics_outright (NSI.nadelVanishingAndNonKltDivisor).1 |
| q7 | nef_numerics (469) | GlobalTheory.nefNumerics_outright |
| q8 | l2_extension_log_canonical (451) | GlobalTheory.l2ExtensionLogCanonical' |
| q9 | arith_hilbert_samuel (255) | arithHilbertSamuel_of_principalisation (wrapper q16) |
| q10 | chow_form_exists (325) | Published.chowFormExists_holds |
| q11 | cycle_heights (347) | ArakelovDirectHeights.cycleHeights_direct poincareLelong **resK** |
| q13 | serre_holomorphic_sections (503) | Published.serreHolomorphicSections_holds |
| q15 | nadel_vanishing_and_non_klt_divisor (467) | NadelVanishingSeparation.NSI.nadelVanishingAndNonKltDivisor |
| q16 | principalisation (253) | ResPlug.WeightsCompactStabilizer.principalisation_closed |
| q18 | formal_algebraisation (381) | PositivityTheory.FormalThickening.formalAlgebraisation |

Consequences and limits:
1. `PublishedHodgeBundleTheorems` does not depend on `O` at the wrapper level. Two fields, p4 and q11, run through `resK`, which ties this table to the covolume RUN2 chapter.
2. I did **not** open each producer's own proof. Their status rests on the RUN4 repo-wide finding (no `axiom`/`sorry`) and on the kernel check that the upstream CI would perform, which I did not run.
3. Whether each `GlobalTheory.Published.*` statement is a faithful rendering of the named literature theorem was **not** assessed here. That is the next audit item, and it is the same kind of question §3 of covolume RUN2 answered for resolution.
4. Cross-check against T8 (`native_family_existence/04_*/T8_LITERATURE_WRAPPER_TABLE.md`) was **not** done this run. Disclosed rather than implied.
