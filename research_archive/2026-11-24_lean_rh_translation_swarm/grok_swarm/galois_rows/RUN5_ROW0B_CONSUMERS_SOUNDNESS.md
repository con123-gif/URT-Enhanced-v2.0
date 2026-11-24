# galois_rows RUN 5 — Row0b consumers: do they only need tame compatibility at `IsQpBig` places?

Upstream: leanprover-community/riemann-hypothesis @ `40e56bab026552e089d7afcfeff08d2defb9c005`. Paths under `src/Development/AutomorphicArithmetic/` unless noted. Every file:line below is text-matched by `RUN5_replay_checks.py` (90/90, `RUN5_VALIDATION_LOG.txt`). Source-level only; nothing upstream was elaborated. Status: **SOURCE-MATCHED, PARTIAL (lexical census; see §5)**.

Overlap check (2026-11-24 GMT; re-checked at pre-push head `0ea69dd`, no new file touches these targets): no file in the swarm directory covers the Row0b consumer side; RUN1 (this lane) established that `Row0b` is weaker than `Row0`; the spine (`integration/END_OF_DAY_MANUSCRIPT_SPINE.md` item 3) records "vwin_of_row h uses OpenImageCondition.mk h, baseChangeN, h" as OPEN. This chapter closes that soundness question at source level; it does not touch the VWin producer itself.

## 1. The weakening, exactly (TypeConditions/WeightsConjBis.lean)

- `IsQpBig w n` (:15–16): there is a prime g and a continuous ring isomorphism ℚ_g ≅ E_w, and (n = 1 or 16n² < g).
- `AwayB x y` (:26–31) differs from `Away` only in `tame0`: the tame clause "x.mono0 ∧ charPol x g = charPol y g for all deg-0 g" is promised only under `IsQpBig w y.lpDim` (instead of `IsQp w`). `dim` and `tor` are unchanged.
- `AboveB.nice` (:48) differs from `Above.nice` only in its guard: `(IsQpBig w a ∧ TmW ∧ Sqf) ∨ Tor`.
- `Props.big` / `Row0.row0b` (:75–86) prove `Row0 → Row0b` (via `IsQpBig.isQp`, :18), so the weakening is implied by the stronger row (sound in the producer direction).

## 2. The three entry points of `h : Row0b IsRecT` on the main path

`MainConclusion.lean:8`: `every_character_of_literature_of_vWin ⟨h, recTExists, h⟩ (vwin_of_row h)`. So h enters at:

| # | entry | where it goes | first PropsB-projecting gateway |
|---|---|---|---|
| E1 | `OpenLiteratureStatements.galoisRepOfPolarizedPairLit` (ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean:218; type `One.M.Row` = `Row0b IsRecT`, Foundations/UnitarySphericalFixing/SatakeParameters/RecT.lean:6) | `pair_u_of_literature` (:286) → `field_of_starFull_alt` (ThirdPlaceSeries/SOfStar.lean:52–53) → `pairU_of_star_alt` (:41) | `isGalU_of_props_alt` (SOfStar.lean:33–40) |
| E2 | `OpenLiteratureStatements.caraianiLocalGlobalDual` (EveryCharacterOfLiteratureOfVWin.lean:216) | `carU_local_global_of_literature` (:460) → `ofDual_star_alt` (SOfStar.lean:54) → `carU_of_star_alt` (:44–51); also stored as `literature_automorphy.car` (:618) | `carU_of_star_alt` (SOfStar.lean:44–51) |
| E3 | `vwin_of_row h` (AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean:4–5) = `automorphic_window_of_inputs (OpenImageCondition.mk h) baseChangeN h` | (a) `OpenImageCondition.mk h`: its single field `galoisRepOfPolarizedPairLit : RowT` (TemperedProductOfSquareIntegrable.lean:208) is **never projected anywhere in src** (the only occurrences of the field name are the two structure declarations and EveryCharacterOfLiteratureOfVWin.lean:286, which projects the *other* structure); the `*_of_open` theorems ignore `O`. (b) the explicit third argument `gal` → `v_window_of_depth_zero_residual_bc_cm` (TopMainZj.lean:55) → `automorphic_inputs_from_literature` field `gal := gal` (TopMainZj.lean:47; `LiteratureAutomorphyHypothesis.gal : RowT`, LitAut.lean:39) | RowT consumers listed in §3 (GuPolG, CompatTOf, SVPatch, rank-two patching) |

So `OpenImageCondition.mk h` needs **nothing** from h; `vwin_of_row` and `every_character_of_literature_of_vWin` need only what the gateways in §3 extract.

## 3. Census of every use of a weakened clause (whole `src` tree)

Only two fields of PropsB are weaker than in Props: `away.tame0` and the `nice` guard. Lexical census (replay part B): `.tame0` is projected at exactly **2** sites in src, and `IsQpBig` occurs on exactly **8** lines.

| site | what is used | guard supplied |
|---|---|---|
| Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean:33 (`Away.big`) | `Away.tame0` (strong, producer direction) | `IsQpBig.isQp` |
| TypeConditions/OfStar.lean:40 (`away_nice`) | **`AwayB.tame0`** | IsQpBig witness from `star_guard k` (left disjunct); right disjunct → `AwayB.tor` |
| ThirdPlaceSeries/SOfStar.lean:39, 40, 50 (E1, E2) | `AboveB.nice` | `star_guard'_alt hrc n` (from `NcW`) |
| TypeConditions/OfStar.lean:66, 67, 79 (recFull twins of the above) | `AboveB.nice` | `star_guard' hrc n` |
| SOfStar.lean:36, 51; OfStar.lean:63, 80 | `away` → `aw_of_away` / `away_nice` | via OfStar.lean:40 |
| DenseThresholdCases/GuPolG.lean:28, 31; AutomorphyLifting/PolarizedLinkage/CompatTOf.lean:184, 190; DenseThresholdCases/SVPatch.lean:77, 82; RankTwoPatching/GaloisRankTwoAutomorphyOfPatching.lean:153, 158 | `AboveB.nice` | **`Or.inr` (the Tor disjunct)**: never uses the IsQpBig branch |
| GuPolG.lean:30; SVPatch.lean:33, 75, 96; GaloisRankTwo…:57, 151, 172; DenseThresholdCases/FrobOfProps.lean:30 | `away … .tor` | none needed (unchanged clause) |
| RankTwoPatching/FrobOfProps.lean:43; GaloisRankTwo…:42 | `nice … h1 h2` | guard passed through unchanged (these *build* a PropsB for a conjugate r′) |
| InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean:173 | `IsQpBig` as the place class of a hypothesis (producer side, RUN1 §2) | — |

**Answer.** Yes, at source level: every consumer on the main path uses the tame clause only through `away_nice`/`star_guard`, i.e. only at places that are `IsQpBig`; all other consumers use the toral clause. No consumer needs tame compatibility at a non-big place.

## 4. Why that suffices — human-readable proof of the gateway (OfStar.lean:22–44; PowEqOneOfRoots.lean, `tor_of_ncW` at :51)

Let y be a Weil–Deligne datum at a finite place w of E, n = dim y, and assume **NcW y** (WeightsConj.lean:27): (i) TmW (wild inertia acts unipotently: inePol σ = (X−1)ⁿ for wild σ), (ii) mono0 (N = 0), (iii) SqW: for a tame generator γ, every root z of the inertia polynomial with multiplicity ≥ thr(w,n) satisfies z^{q−1} = 1, q = Nw. Here thr(w,n) = 2 if w lies over a prime p that splits completely in E with (n = 1 or 16n² < p), else 1 (Transported.lean:11–12).

**`star_guard` (case split).** *Case thr = 2.* Then w lies over a totally split p with the size bound, so E_w ≅ ℚ_p continuously (`exists_continuous_ringEquiv_padic_of_totally_split`), which is `IsQpBig w n`; TmW is (i); `Sqf` (multiplicity ≥ 2 roots are (q−1)-th roots of unity) is (iii) with thr = 2. *Case thr = 1.* `tor_of_ncW`: by (i) the representation is tame. Every root of ρ(γ)'s characteristic polynomial (multiplicity ≥ 1) is a (q−1)-th root of unity by (iii); ρ(γ) is semisimple, so ρ(γ)^{q−1} = 1 (`pow_eq_one_of_roots`, same file). The tame relation φγφ⁻¹ = γ^q gives ρ(φγφ⁻¹) = ρ(γ)^{q−1}ρ(γ) = ρ(γ), so ρ(φ) commutes with ρ(γ). Since γ together with wild inertia topologically generates inertia and ρ kills wild inertia, anything commuting with ρ(γ) commutes with all of ρ(inertia) (`mem_of_gen`, same file); hence ρ(inertia) is commutative and commutes with ρ(φ). Writing s = φ^a τ, t = φ^b τ′ (τ, τ′ ∈ inertia) gives ρ(s)ρ(t) = ρ(t)ρ(s), so ρ([s,t]) = 1, i.e. `Tor y`.

**`away_nice`.** Given `AwayB x y` and NcW y: in the big case apply `tame0` (exactly the IsQpBig-guarded clause); in the toral case `tor` gives x = y, so the conclusion holds trivially (mono0 from (ii), equal char polys). **`aw_of_away`** packages this as `Aw x y`, the form used downstream; its `unr` clause uses `tor_of_unr` (unramified ⇒ toral, since commutators have degree 0 and lie in inertia). ∎

Consequence: `Aw`, `IsGalUAlt`, `CarUAlt` — the interfaces downstream of E1/E2 — contain no IsQp/IsQpBig hypothesis at all; the place-size condition is consumed and discharged inside the gateway.

## 5. Limits

- The census is lexical: it finds named projections (`.tame0`, `.nice`, `.away`) and the token `IsQpBig`. An anonymous-constructor destructuring of a PropsB/AboveB/AwayB value would not be found; a targeted search of the 73 files mentioning Row0b/RowT/One.M.Row/PropsB/AboveB/AwayB found none. Lean's kernel would reject any use of `tame0` without an `IsQpBig` proof regardless, so the census documents *how* the guard is met; it is not needed for soundness, which reduces to compilation (not run here).
- The intermediate record pass-throughs of `gal`/`car` (e.g. `LitN.aut.car`, AutomorphicForms/Hypotheses2.lean:25–26; CuspidalSupport/CsdMonoOddLitN.lean) were not each followed; they carry already-converted `IsGalU`/`CarU`-type data or RowT into the gateways listed.
- Companion `RUN5_Row0bGuardSchema.lean` checks only the propositional shape of `away_nice`/`star_guard` (core Lean, exit 0; `away_nice` uses no axioms, `star_guard` uses propext/Classical.choice/Quot.sound because of `Classical.byCases`).

## RESUME HERE
Follow E3(b) through `v_window_of_literal_automorphy_n` to the first theorem that destructures `LiteratureAutomorphyHypothesis.gal`, and confirm it is one of the §3 gateways (expected: `polG_of_printsH_of_rT` or `compatTOf`).
