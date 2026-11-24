# Run 4: T-8 (Published.* bundle on the main path) and T-1 (`GlobalTheory.ExceptionalPair.main`)

Lane: native arithmetic family existence. Date 2026-11-24 (GMT). Upstream pin `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`.
Reading copy: `homeowmorphism/riemann-hypothesis-original@4e8bb36`, whose `src/` matches the pin exactly: 175,187 shared files, 0 differing, plus `src/Challenge.lean`. `verify_run.log` re-checks this.
Status vocabulary: SOURCE-MATCHED means quoted text and blob ids were checked by the verifier, which was run. No upstream file was elaborated or compiled by this lane. No gate is closed. URT is not used as a premise.

## Part I: T-8. Where the `Published.*` bundle on the main path is discharged

### I.1 Prior work reused, not redone
- `specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md` §1 and §3 already gives a lexical census of the adapter file `EveryCharacterOfLiteratureOfVWin.lean` (blob a13ba1f8): 195 declarations reachable from the final adapter, and the four literal `O.field` readers (L283, L285, L459, L609). My closure script reproduces both numbers independently in Python (`closure_run.log`: 196 parsed, 195 reachable, 0 unresolved, the same 4 readers).
- `math/2026-11-24_every_character_adapter_derivation.md` (EC-S1, EC-S7) derives the adapter; `P = published_results_eigen O` is the full `UnitaryGroupThirdPlaceHypotheses` record.
- `grok_swarm/green_regular_character/...CHAPTER.md` covers the `greenRegularCharacters` field (:694).

New in this run: (a) how `O` itself is instantiated on the main path; (b) for every reachable wrapper, where its producer constants are defined, and what kind of declaration each producer is (`T8_LITERATURE_WRAPPER_TABLE.md`; the JSON outputs are regenerable by the two scripts).

### I.2 The file/line chain from `riemannHypothesis` (SOURCE-MATCHED)
1. `src/Main.lean` (dbd5db70): `theorem riemannHypothesis : RiemannHypothesis := rhOfAll`
2. `src/Supplements/Kernels/MainTheorems.lean` (6a542d7c): `theorem rhOfAll : RiemannHypothesis := Formalism.VW.rh_of_every allChi`, and `theorem allChi : UpperTheory.EveryCharacter := UpperTheory.FinalTheorems.everyCharacter`
3. `.../CharacterBoxes/MainConclusion.lean` (ee340012):
   - `everyCharacter := everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter`
   - `everyCharacter_of_row h := UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin ⟨h, UpperTheory.Zero.LLC.recTExists, h⟩ (UpperTheory.One.vwin_of_row h)`
4. `.../ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` (a13ba1f8):
   - L215: `structure ... OpenLiteratureStatements : Prop where` with fields `caraianiLocalGlobalDual : _root_.UpperTheory.One.M.Row`, `localLanglandsExists : _root_.UpperTheory.Zero.LLC.RecTExists`, `galoisRepOfPolarizedPairLit : _root_.UpperTheory.One.M.Row`.
   - L666: `theorem ... published_results_eigen (O : ...) : _root_.GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses where`. This is P.
   - L810: `every_character_of_literature_of_vWin O hV := _root_.UpperTheory.Lit.every_character_of_theta_integrals_local_matching (published_results_eigen O) ...`. Its other record arguments are `published_results_first O` (ThetaLocalInputs), the theta-integral and local-matching pair, `topCovolSlim2_use_alt_alt`, `local_langlands_gl_recT_exists_of_literature O`, and `hV`.

### I.3 How `O` is discharged on the main path (SOURCE-MATCHED)
`O` is not an assumption on the main path. It is the anonymous constructor `⟨h, recTExists, h⟩`, built from closed theorems:
- `caraianiLocalGlobalDual` and `galoisRepOfPolarizedPairLit` are both given `h := galoisLocalGlobalStrong_recParameter` (`RowSrc.lean:6`, f769999a): `theorem galoisLocalGlobalStrong_recParameter : UpperTheory.GalStar.Row0b recT := galoisRepresentations_of_thetaLift UpperTheory.TP.K.tLiftK`. Its internal content belongs to the galois_rows lane.
- `localLanglandsExists` is given `UpperTheory.Zero.LLC.recTExists` (`RecTExists.lean`, 26878657), which is a theorem.
- `hV` is `UpperTheory.One.vwin_of_row h`, a theorem applied to the same h.

So the four O-reading wrappers (L283 returns `O.localLanglandsExists`; L285, L459 and L609 feed their field into a further theorem) are discharged on the main path by these closed theorems. The `Published.*`-named Prop definitions behind the Row type (e.g. `CaraianiLocalGlobalDual` and `GaloisRepOfPolarizedPairLit`, which are `def ... : Prop` per the provenance ledger §2) are therefore not hypotheses here. Their values are produced by `galoisLocalGlobalStrong_recParameter`.

### I.4 Every `Published.*` value reachable from the adapter, and how each is discharged
- 195 adapter declarations are reachable. 155 of them have a type in `GlobalTheory.Published.*`, covering 154 distinct `Published.*` names; one more, `_root_.GlobalTheory.Published.HeckeLAdicParameterAboveAlt`, is spelled with `_root_`. The full name list is reproduced below. The per-declaration table, with line, type, O-use and producers, is in `T8_LITERATURE_WRAPPER_TABLE.md`.
- Every wrapper body is a theorem application (or a record built from theorem applications) of in-repo constants. The 201 distinct producer constants break down as follows:
  - 196 are located by source search, and **all 196 are `theorem` declarations**. None is a `def`, a structure field, an `axiom` or an `opaque`. The keyword at each located line was checked in this run.
  - 52 of the 196 live in paths containing `Published` (`PublishedTheorems/`, `PublishedTheoremStatements/`, `StandardTheoremStatements/`, `InertiaEigenvalues/`). 14 are under `PublishedTheorems/` directories. All 52 are theorems.
  - The other 5 are not located because they are not global constants: `And.left`, the three `O.*` projections (handled in I.3) and `UpperTheory.V.Af.cuspSpectrumGL.2.2`, which is a projection out of a located theorem.
- Of the 14 producers under `PublishedTheorems/`:
  - 4 are implications. Each takes a premise that is itself another wrapper result: `Published.ArithHilbertSamuel.volNef`, `Published.CycleHeights.heightProjection`, `Published.GlobalArtinReciprocity.rayCharacterArtin` and `Published.GrothendieckDeformation.grothendieckMessing`.
  - The other 10 are closed: `automorphicFormsFiniteGL`, `nefNumerics_outright`, `jacquetShalika`, `jacquetShalikaRigidity`, `casselmanWallach`, `clozelPurity` (which applies `clozelPurity_of_bounded` to `cuspFormsBoundedGL`, per the provenance ledger), `globalEulerChar_full`, `globalFiniteness`, `poitouTateNormalised_holds` and `cuspidalMultiplicityOne`.
- Repo-wide context, from the verifier run: no file in `src/` has a top-level `axiom` declaration, and `sorry`/`admit` occur only in `src/Challenge.lean`, which is off the main path. The original `comparator.json` permits only `propext`, `Quot.sound` and `Classical.choice`. I did not run comparator.

**Answer to T-8 (source level).** On the main path, P and every other `Published.*` record reachable from the adapter are discharged by **native in-repo theorems**. Some of those theorems sit in `PublishedTheorems/` directories, but they are theorems, not structure fields and not assumptions. The only hypothesis-shaped object, `O`, is instantiated in `MainConclusion.lean` by the closed theorems `galoisLocalGlobalStrong_recParameter` (twice) and `recTExists`.

**Limits.**
- This is a syntactic source closure of the adapter file plus a keyword check of each producer's definition site. It is not an elaboration.
- `Published.*` names used *inside* the proofs of those producer theorems, or inside other closed main-path theorems (e.g. under `recS` or `recAtG`), are discharged internally, because those theorems carry no hypotheses. They are not enumerated here.
- Whether each producer's proof is mathematically substantive, and whether each `Published.*` Prop faithfully states the cited literature, is not assessed. The provenance ledger §2 marks this OPEN.

`Published.*` names reachable from the adapter (154, prefix `GlobalTheory.Published.` omitted):
AbMulNSt AbelianDeRham AbelianLifting AlgebraicCharacterWD ArCalc ArDegree ArithHilbertSamuel AutomorphicFormsFiniteGL BaseChangeDefiniteUnitaryGroup BaseChangeIsobaricTransfer BernsteinUnitaryProductIrreducible BernsteinZelevinskyFiniteness BhattScholzeCrystallineLattices BhattScholzeIntegral BlochKatoLocal BorelCasselman BrauerDegreeZero CMCurveGoodOutsidePrimeSt CasselmanWallach ChebotarevDegreeOne ChevalleyUnits ChowFormExists ClozelCohomological ClozelPurity ComplexMultiplicationJSt CuspBounded CuspDecayBound CuspDecaySobolev CuspFormsBoundedGL CuspRapidDecay CuspTraceClass CuspidalMirabolic CuspidalMultiplicityOne CuspidalSpectrumGL CycleHeights DeRhamPotSemistable DeligneRibet DepthZeroInduction DepthZeroJacquetInjective DepthZeroSupport DiscreteSeriesClassification DiscreteSeriesCover DiscreteSeriesCoverExists DiscreteSeriesExists DiscreteSeriesHermitianUnique DiscreteSeriesLowestKType DiscreteSeriesUpqExists DixmierMalliavinFactorisation DoublingMethodLocalZetaIntegrals DualAbelianScheme EllipticMainTheoremCM EssSquareIntegrableSegments FlathFactorisation FlathTensorProduct FontaineBcris FormalAlgebraisation FormalDegreeCompactDual GKGlobalisation GLHoweDuality GelfandKazhdanDual GenericUnitaryDualGL GenericUnlinkedGL GeometricLemma GeometricLemmaFiltration GlobalArtinReciprocity GoodChernWeil GreenCuspidal GreenRegularCharacters GreenSeriesSt GrothendieckDeformation GrothendieckMessing GrothendieckRingPolynomial HarishChandraAnalyticity HarishChandraFinite HarishChandraModules HasseNormSt HeckeLAdicCharacter HeckeLAdicCharacterAbove HeckeLAdicCharacterCrystalline HeckeLAdicCharacterDeRham HeckeLEntireAndNonzeroAtOne HeckeLPartialContinuation HeckeTateFunctionalEquation HermitianHassePrinciple HermitianLocalGlobal HilbertClassFieldJ HolomorphicDiscreteSeries HoweDualityReal IdealInvariantsOneOrbitSt InducedSimpleLowestAlcove IrreducibleAdmissibleGL JacquetShalika JacquetShalikaRigidity KFiniteVectorsUnitary KawamataViehweg KudlaSplittingSplitUnitary L2ExtensionLogCanonical LandherrSt LanglandsExhaustionGL LanglandsMultisegments Linnik LocalConverseGL MetaplecticRepresentation MoyPrasadJacquetIso NadelVanishingAndNonKltDivisor NefNumerics PartialZetaFunctionalEquation PointSeparationPair PoitouTateNormalised Principalisation PrismaticDieudonneHodge QuadraticClassFieldTheory RadfordShufflePolynomial RallisInnerProductConvergent RayCharacterArtin RayClassFieldSt RealMetaplecticRepresentation RegularAlgebraicPurity SchurOrthogonalitySquareIntegrable SegmentRepresentation SemiAbelianHomExtension SemiAbelianLieSeminegative SemistableReductionSt SerreHolomorphicSections SiegelEisensteinContinuation SiegelKlingenDeligneRibet SiegelSetUnitary SiegelToroidalIntegral SiegelWeilUnitaryConvergent SiegelWeilUnitarySchrodinger SquareIntegrableSegment StandardCosocleGL StandardFunctorsFiniteLength StoneVonNeumann StrongApproxSU TemperedProductOfSquareIntegrable ThetaRationalInvariance ToroidalCompactification ToroidalForFanKS TotallyDisjointProductIrreducible UnitaryIrreducibleAdmissible UnlinkedProductIrreducible UnramifiedDoublingGL UnusedSlot72 VolGe VolNef WeberRayFieldSt WeilRepresentationExists WeilRepresentationUnitaryPair WeilSiegelFormulaUnitary WeilThetaConvergence WeylBranching ZelevinskyPolynomialRing principalPolarisationOneSection.
The name `UnusedSlot72` is reported as found. Whether its content matters downstream was not checked.

## Part II: T-1. `GlobalTheory.ExceptionalPair.main`

### II.1 Exact declarations (SOURCE-MATCHED; path prefix `src/Development/AbelianVarietyTheory/`)
`Proofs/GlobalInterpolation/ExceptionalDirichletZeroUniqueZeroFreeRegion.lean` (5924cc49), L47:
```lean
theorem main : ∃ c₀ : ℝ, 0 < c₀ ∧ ∀ c₁ : ℝ, 0 < c₁ → c₁ ≤ c₀ → ∃ c : ℝ, 0 < c ∧ ∀ (M : ℕ) [NeZero M], 3 ≤ M → (∀ (χ χ' : DirichletCharacter ℂ M) (β β' : ℝ), IsExc c₁ χ β → IsExc c₁ χ' β' → χ = χ' ∧ β = β') ∧ (∀ (χ : DirichletCharacter ℂ M) (β : ℝ), IsExc c₁ χ β → χ ≠ 1 ∧ 7 / 8 ≤ β ∧ LFunction χ β = 0 ∧ ord χ β = 1 ∧ c / ((M : ℝ) ^ 2 * Real.log M) ≤ 1 - β) ∧ ∀ (χ : DirichletCharacter ℂ M) (ρ : ℂ), ρ.re < 1 → LFunction χ ρ = 0 → (ρ.im = 0 ∧ IsExc c₁ χ ρ.re) ∨ ρ.re ≤ 1 - c / Real.log (M * (|ρ.im| + 2)) := by
```
It is restated, with the same type, as `_root_.GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion` in `...ZeroFreeRegionStatement.lean` (9aec3498) via `exact @GlobalTheory.ExceptionalPair.main`. That restatement is what `primesRel_holds` uses (run 3).

`Definitions/GlobalTwisting/ZerosDisc.lean` (23e05538):
```lean
def ord {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ) : ℕ :=
  analyticOrderNatAt (DirichletCharacter.LFunction χ) ρ
def IsExc (c₁ : ℝ) {M : ℕ} [NeZero M] (χ : DirichletCharacter ℂ M) (β : ℝ) : Prop :=
  χ ^ 2 = 1 ∧ 1 - c₁ / Real.log M < β ∧ β < 1 ∧
    haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
    DirichletCharacter.LFunction χ.primitiveCharacter β = 0
```
Note that `IsExc` refers to the zero of the **primitive** L-function, and it does not require χ ≠ 1.

### II.2 The five inputs (exact statements, SOURCE-MATCHED)
- **(U)** `GlobalTheory.RealZeroNearOne.main` (`OrderNeTop.lean:89`, 6ad3eec0). This is the Landau–Page uniqueness-and-simplicity input: `∃ c, 0 < c ∧ ∀ q [NeZero q] (χ ψ) (β β'), χ ≠ 1 → ψ ≠ 1 → χ^2 = 1 → ψ^2 = 1 → 1 - c/log(2q) ≤ β → 1 - c/log(2q) ≤ β' → L(χ,β) = 0 → L(ψ,β') = 0 → χ = ψ ∧ β = β' ∧ deriv (LFunction χ) β ≠ 0`.
- **(P)** `GlobalTheory.ZeroFreePrincipal.zero_free` (`ZeroFreePrincipal.lean:281`, 641a2e37): `∃ c > 0, ∀ q [NeZero q] s, s ≠ 1 → LFunction (1 : DirichletCharacter ℂ q) s = 0 → s.re < 1 - c / log(q(|s.im|+2))`. Its proof starts from `exists_re_lt_one_sub_div_log_of_riemannZeta_eq_zero`.
- **(Z)** `GlobalTheory.ZeroFreeComplex.zero_free_region` (`LFunctionConjEqZero.lean:290`, 94ffe758): `∃ c > 0, ∀ q χ s, χ ≠ 1 → L(χ,s) = 0 → (χ^2 ≠ 1 ∨ s.im ≠ 0) → s.re < 1 - c / log(q(|s.im|+2))`.
- **(S)** `GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one` (Statement file 1fd99e9a): `∃ c > 0, ∀ q χ ρ, (χ ≠ 1 ∨ ρ ≠ 1) → L(χ,ρ) = 0 → |ρ.im| ≤ 1 → c / (q^2 · log(3q)) ≤ 1 - ρ.re`.
- **(D)** `GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros` (Statement file b4446a9f): `∀ q χ s, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → (L(χ,s) = 0 ↔ L(χ*,s) = 0) ∧ ord χ s = ord χ* s`.

Mathlib facts used in the proof:
- `Real.exp_one_lt_d9`, which gives log M ≥ 1 for M ≥ 3;
- `Real.log_mul` and `Real.log_le_log`;
- `AnalyticAt.analyticOrderAt_eq_one_of_zero_deriv_ne_zero`, applied with `RealZeroNearOne.analyticAt_L`.

### II.3 Human proof, keeping every hypothesis
Write L = log M. All the elementary lemmas need M ≥ 3. They are:
- **(e1)** L ≥ 1, since e < 3 ≤ M;
- **(e2)** log(aM) ≤ 2L for 0 < a ≤ 3, since log a ≤ log M;
- **(e3)** L ≤ log(aM) for a ≥ 1;
- **(e4)** if 0 ≤ c and c₁ ≤ c/2, then c₁/L ≤ c/log(2M), from (e2) and (e3);
- **(e5)** monotonicity of division: if 0 ≤ a ≤ b and 0 < x ≤ y, then a/y ≤ b/x.

**Constants.** Take c_u, c_p, c_z and c_s from (U), (P), (Z) and (S). Set **c₀ = min(1/8, c_u/2, c_p/2)**, which is > 0. Given 0 < c₁ ≤ c₀, set **c = min(c₁, c_z, c_p, c_s/2)**, which is > 0. Then c₁ ≤ 1/8, c₁ ≤ c_u/2, c₁ ≤ c_p/2, and c ≤ c₁, c_z, c_p, c_s/2. Now fix M with NeZero M and 3 ≤ M. By (e1), c₁/L ≤ c₁ ≤ 1/8.

**Key lemma (hexc).** Suppose IsExc c₁ χ β. Then:
- **(i) 7/8 ≤ β**, because β > 1 − c₁/L ≥ 7/8.
- **(ii) L(χ,β) = 0.** We have β > 0, and β ≠ 1 as a complex number because β < 1. So (D), in its second-disjunct form, transfers the primitive zero to L(χ,·).
- **(iii) β ≥ 1 − c_u/log(2M)**, by (e4) with c₁ ≤ c_u/2.
- **(iv) χ ≠ 1.** If χ = 1, then (P) at s = β (with s ≠ 1, im 0, |0| + 2 = 2) gives β < 1 − c_p/log(2M). But (e4) with c₁ ≤ c_p/2 gives c₁/L ≤ c_p/log(2M), so β < 1 − c₁/L, which contradicts IsExc.

**Clause 1 (uniqueness).** For two exceptional pairs, hexc gives χ, χ' ≠ 1 with real zeros of L(χ,·) and L(χ',·) in the (U)-window 1 − c_u/log(2M) ≤ β, β'. Both are quadratic by IsExc. So (U) gives χ = χ' and β = β'.

**Clause 2.**
- χ ≠ 1, 7/8 ≤ β and L(χ,β) = 0 come from hexc.
- **ord = 1:** (U), applied to the pair (χ,β) with itself, gives deriv L(χ,·)(β) ≠ 0. L(χ,·) is analytic at β because χ ≠ 1. A zero with nonzero derivative has analytic order 1, so `ord χ β = analyticOrderNatAt … = 1`.
- **Lower gap:** apply (S) with χ ≠ 1, the zero β and |im| = 0 ≤ 1, to get c_s/(M²·log 3M) ≤ 1 − β. Then
  c/(M²L) ≤ (c_s/2)/(M²L) = c_s/(2M²L) ≤ c_s/(M²·log 3M).
  The last step uses (e5) with M²·log 3M ≤ 2M²L, from (e2) at a = 3. All denominators are positive because M ≥ 3.

**Clause 3 (trichotomy for any zero ρ with Re ρ < 1).**
- **Case A: χ² = 1 and Im ρ = 0.**
  - (A1) If Re ρ > 1 − c₁/L, then Re ρ > 0 and ρ ≠ 1 (because Re ρ < 1). By (D) we get L(χ*, Re ρ) = 0, and IsExc c₁ χ Re ρ holds. The left disjunct follows.
  - (A2) Otherwise Re ρ ≤ 1 − c₁/L ≤ 1 − c/log(2M), using c ≤ c₁ and L ≤ log 2M. With |Im ρ| = 0 this is the right disjunct.
- **Case B: not (χ² = 1 and Im ρ = 0).**
  - (B1) If χ = 1, then χ² = 1, so Im ρ ≠ 0 and hence ρ ≠ 1. (P) gives Re ρ < 1 − c_p/log(M(|t|+2)) ≤ 1 − c/log(…), using c ≤ c_p.
  - (B2) If χ ≠ 1, then either χ² ≠ 1 or Im ρ ≠ 0, which is exactly the side condition of (Z). (Z) with c ≤ c_z gives the bound. The log is positive because M(|t|+2) ≥ 6 > 1.

The strict bounds from (P) and (Z) weaken to the stated ≤.

**Edge cases.**
- (A1) can formally include χ = 1. The theorem does not exclude this in clause 3, and the proof does not need to. hexc then shows it cannot actually occur.
- M = 1 and M = 2 are excluded by `3 ≤ M`, which is where L ≥ 1 comes from.
- c₀ depends only on c_u and c_p. c depends on c₁, c_z, c_p and c_s. Neither depends on M, χ or ρ.

The propositional shape of clause 3, and the window argument of clause 1, are typechecked in `ExceptionalPairCaseSkeleton.lean` (core Lean 4.33.1; `lean_run.log`, exit 0). That file uses abstract Props only. It is not a proof of `main`.

### II.4 Remaining dependencies (exact names; not reconstructed in this run)
These are the next targets:
- **T-1a** `GlobalTheory.RealZeroNearOne.main`, the Landau–Page step. It is the hardest of the five.
- **T-1b** `GlobalTheory.ZeroFreePrincipal.zero_free`, which reduces to `exists_re_lt_one_sub_div_log_of_riemannZeta_eq_zero`.
- **T-1c** `GlobalTheory.ZeroFreeComplex.zero_free_region`.
- **T-1d** `GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one`, the effective (q² log 3q) gap.
- **T-1e** `GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros`.

All five are theorems. The verifier scan found no `axiom` declarations anywhere. Their proofs were not reconstructed here.

## RESUME HERE
- T-8 is answered at source level (Part I). If needed, extend the enumeration to `Published.*` names inside the producer theorems' own proofs.
- For T-1, `main` is reconstructed. Next is T-1a, `RealZeroNearOne.main` (`OrderNeTop.lean:89`; it uses `exists_bound` at L33 and the imports `LogDerivDirichletLFunctionLocalZeroSumStatement` and `NegReLogDerivPrincipalLFunctionLe`). After that come T-1d, then T-2 and T-3 (`PsiRel.psiAP_relative`, `pi_rel_of_psi_rel`).

## HANDOFF TO
- galois_rows: the internal content of `galoisLocalGlobalStrong_recParameter`, which discharges both Row fields of O.
- literature_provenance: the faithfulness of the `Published.*` Props to the cited literature, which remains OPEN. The producer locations in `T8_LITERATURE_WRAPPER_TABLE.md` may help.
- lean_validation: if a Mathlib build is available, `#print axioms GlobalTheory.ExceptionalPair.main` and `#print axioms riemannHypothesis`. Neither has been run by this lane.
