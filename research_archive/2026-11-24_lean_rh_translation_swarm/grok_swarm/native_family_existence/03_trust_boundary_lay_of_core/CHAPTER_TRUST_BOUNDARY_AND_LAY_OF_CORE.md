# Native family existence, part 03: where `SmallPrimeOne` and `SiegelMassRatioCM` are discharged, and `lay_of_core`

Lane: `grok_swarm/native_family_existence/` (Grok executor), run 3, 2026-11-24.
Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
Paths below are under `src/`.

## Honest status

- **What this document is.** It is a source-reading reconstruction. I did not build the upstream project, did not run `#print axioms`, and did not run the comparator.
- **What the source check covers.** `verify_trust_and_laycore.py` ran with 0 failures across 33 cited files and 70 verbatim tokens (see `verify_run.log`). The source was read from `/workspace/rh_orig`, a checkout of `homeowmorphism/riemann-hypothesis-original` at `4e8bb36`. The script compares the blob ids of both git trees. Its `src/` matches the pin's `src/` exactly: 175,187 files, 0 differing. The only extra file is `src/Challenge.lean`.
- **Scans run over that `src/`.**
  - 0 files declare an `axiom`.
  - The only file containing `sorry` or `admit` is `src/Challenge.lean`, the comparator's challenge stub.
- **Abstract Lean file.** `LayOfCoreMechanismAbstract.lean` uses core Lean 4.33.1 only. It typechecked with exit 0, and its axioms are `[propext, Quot.sound]` (see `lean_run.log`). It models only the integer skeleton of `tameDistinct_gen`.
- **Companion file.** `RH_TrustLayCoreCompanion.lean` is NOT EXECUTED.
- No gate is closed. URT is not used.

## 1. Trust boundary: both hypotheses are discharged by closed in-repo theorems

**Top level.** `src/Main.lean:4` reads `theorem riemannHypothesis : RiemannHypothesis := rhOfAll`. So the top-level theorem has **no hypotheses**.

The original environment's `comparator.json` lists `permitted_axioms` as `propext`, `Quot.sound` and `Classical.choice`. That is that repo's own configuration. I did not run the comparator.

Combined with the 0-`axiom` scan, any `SmallPrimeOne` or `SiegelMassRatioCM` on the path must be proved inside the repo. The real question is which term does it on the main path. The answers are below.

### 1a. `SmallPrimeOne`

```lean
def SmallPrimeOne : Prop := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A
```
This is defined at `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean:87`. It is a Linnik-type bound on the least prime ≡ 1 mod M.

On the main path (the first-run chain `classSel → recS`), it is discharged inside `UpperTheory.Top.recS`, at `Development/AutomorphicArithmetic/CharacterBoxes/ObjCTrue.lean:33`:
```lean
have hS : SmallPrimeOne := GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds
```
That `hS` is then used immediately in `hostQ hS la G hH`.

The discharge chain:
- `GlobalTheory.EX.smallPrimeOne_of_primesRel : GlobalTheory.Lin.PrimesRel → SmallPrimeOne` (`…/Proofs/GlobalInterpolation/SmallPrimeOneOfPrimesRel.lean:18`). It imports no `PublishedTheorems` module.
- `GlobalTheory.Lin.primesRel_holds : GlobalTheory.Lin.PrimesRel` (`…/Proofs/GlobalInterpolation/PrimesInProgressionsRelativeError.lean:22`) is a closed theorem built from three closed statements. Each statement file is a one-line `first | exact @…` wrapper around a native theorem:
  - `GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion` wraps `GlobalTheory.ExceptionalPair.main`. This is the zero-free region with at most one exceptional real zero.
  - `GlobalTheory.T.chebyshevPsiProgression_relative_error` wraps `GlobalTheory.Lin.PsiRel.psiAP_relative`. This is ψ(x; M, b) with relative error.
  - `GlobalTheory.T.primeCount_relative_error_of_psi_relative_error` wraps `GlobalTheory.Lin.pi_rel_of_psi_rel`.

**Verdict.** At the pin, `SmallPrimeOne` is not a hypothesis of RH. It is discharged by an in-repo closed proof (Linnik's theorem derived from the exceptional-zero zero-free region plus the prime number theorem in progressions with relative error).
- No `GlobalTheory.Published.*` hypothesis enters this chain at the level I traced.
- There is also an alternative producer, `smallPrimeOne_of_tzRat : GlobalTheory.Mem.An.TZRat → SmallPrimeOne`. It imports `PublishedTheorems/AutomorphicForms₂/*` and is used by `HostExOfPublished.lean`, `ExistsRichRecordOverChoices.lean` and `GlobalRowsOfSizeParameters.lean`. It is **not** the one `recS` uses.
- Not unpacked: the proofs of `ExceptionalPair.main`, `PsiRel.psiAP_relative` and `pi_rel_of_psi_rel`. They are the next trust items (T-1, T-2, T-3).

### 1b. `StandardLattice.SiegelMassRatioCM`

It is defined at `Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean:281`. The main-path flow, consumer first:
1. `recExP_of_recAtG` (run 02, D-2) gets it from `memberTop_final_contextParameters h1 …` (`ClassSel.lean`). That in turn calls `existsLayeredData_of_goodScaleContexts hAll`.
2. `classSel`'s first argument `h1 : SiegelMassRatioCM` is supplied as `hP` in `UpperTheory.Top.classSel hP (fun D => hU D) …`. This happens in `nonempty_hyps_of_allRows_alt` (`…/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean:51`), whose first premise is `SiegelMassRatioCM`.
3. In `hypotheses_nonempty_of_unramified_exponents_alt` (`…/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean:43,57`), we have `obtain ⟨hP, hMem, hEx⟩ := large_unramified_exponent_bundles_exist_alt …` and then `exact nonempty_hyps_of_allRows_alt hP …`.
4. `member_bundles_large_unramified_exponents_alt` (`…/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean`) returns `⟨hA.a18, …⟩`, where `hA := GlobalTheory.T.compatibleSystem_member_hypotheses P.globalArtinReciprocity …`.
5. `GlobalTheory.compatibleSystem_hypotheses_of_localInputs` (`…/LocalTypeDictionary/CompatibleSystemHypothesesOfLocalInputs.lean`) fills field `a18 : StandardLattice.SiegelMassRatioCM` of `HypAAlt` with **`GlobalTheory.Mass.massRatio_all_unramified_cmFields`**. This is a closed term. It does **not** come from any of the `GlobalTheory.Published.*` arguments (`ar cm we hm cd cw hf cl ce fd sw`) that the same constructor takes.
6. `massRatio_all_unramified_cmFields := standardMassRatio_of_modelMassRatio siegelMassRatio_holds` (`…/Proofs/GlobalInterpolation/MassRatioAllUnramifiedCmFields.lean:8`).
7. `GlobalTheory.Mass.siegelMassRatio_holds := siegelMassRatio_of_LI binary_hermitian_represents liStat` (`…/Proofs/FlagMeasures/SiegelMassRatioUnimodularDefinite.lean:9`). Its inputs:
   - `siegelMassRatio_of_LI (hH : HermRepUnram) (hLI : LIStat)` (`Formalism/GL3MeanSquares/GenusMeanAsymptotics/UnimodularClassRepresentatives/SiegelMassRatioOfLI.lean:35`);
   - `GlobalTheory.Mass.binary_hermitian_represents : HermRepUnram` (`…/Proofs/FlagMeasures/BinaryHermitianRepresents.lean:12`);
   - `liStat : LIStat := liStat_of liRatio liPin` (`…/UnimodularClassRepresentatives/LiStatOf.lean:24`).

**Verdict.** At the pin, `SiegelMassRatioCM` is not a hypothesis of RH, and on this path it is not taken from a `Published.*` input. It is discharged by the closed in-repo theorem `massRatio_all_unramified_cmFields`.
- **Caveat:** the surrounding theorems on the path do carry a large bundle `P : UnitaryGroupThirdPlaceHypotheses` of `GlobalTheory.Published.*` propositions (Artin reciprocity, Harish-Chandra, Casselman–Wallach, Siegel–Weil, …). Those must themselves be discharged further up, because the top theorem is closed. That belongs to the theta lane; I did not trace it here.
- Not unpacked: `siegelMassRatio_of_LI`, `binary_hermitian_represents`, `liRatio`, `liPin` (T-4 to T-7).

**What would actually confirm §1:** run `#print axioms` on `riemannHypothesis`, `primesRel_holds` and `massRatio_all_unramified_cmFields` against a build (companion §1). This is for lean_validation.

## 2. `lay_of_core` (R-3)

```lean
theorem lay_of_core : Ev fun K => ∀ (X : Stages) (f : Fr X.B.toPre) (T : TwDat X.B) (c : V4.Core K X f T),
    StandardLattice.VolumeEqMass₂ X.toD7 → ∃ Y : Lay X.toD7, layObj Y = c.O ∧ Over X.toD7 K.P K.Lv ∧ RecOK K.s K.C K.cD X.toD7 ∧
      LedOK K.s K.C K.cD K.ch Y K.a K.b ∧ DQ.TupUsedAt X.toD7
```
Location: `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean:105`. Proof term: `ev_imp TamePow.tame_of_pow (fun _ hK X _ _ c hv => ⟨lay c hv, layObj_lay c hv, isOver c, ⟨…RecOK…⟩, ledOK c hv, tupUsed c⟩)`.

**Structure.** A core `c : V4.Core K X f T` (`…/Definitions/AutomorphicMembership/RationalRootsDef.lean:38`) already carries almost all the data. `lay_of_core` is mostly repackaging. Only two genuine steps occur: the tame-distinctness argument (§2.3) and the size identification from the volume hypothesis (§2.1).

### 2.1 The layer `Y := lay c hv`, with `layObj Y = c.O` by `rfl`

- `Y` is `c.O` extended by fields read off `c`: `ties`, `rrDef`, `th_io`, `vram`, `fills_all`, `idx`, `kap_def`, `lam_def`, `kapR_def`, `piG_lev`, `piT_lev`, `seen`, `tauOf`, `nch_tie`, `rationalRoots_def` and `gauge_def`.
- `dgam` (the `DGamDef` condition) follows from `c.col.one`, which says all `DGam`s agree, together with `(chTw u' μ').dvd_DGam`.
- `duStar_def` and `Dstar_def` come from `sizes_eq_count K X c.isOver hv c.dsig_eq` (`SizesEqCount.lean:30`). This is the **only use of `hv : VolumeEqMass₂`**. In the proof:
  - `K.Over` gives the size equations;
  - `hv.2`, at the Y₀ signature, gives `volY0 = massI X.toD7 r`;
  - `c.dsig_eq` identifies each `dsig τ` with `trueDsig`.

  Together these make `Dstar` equal the standard `DstarD`, and each `duStar u` equal `duStarU`.

### 2.2 `Over X.toD7 K.P K.Lv`

`isOver` repackages `c.isOver : K.Over X.B.toPre` with witness `X` and `rfl`.

### 2.3 `RecOK K.s K.C K.cD X.toD7`, field by field (`SetUnipotentTranslate.lean:121`)

| field | source | content |
|---|---|---|
| `del` | `c.del` | `Del = Delv s cD` |
| `etaF` | `c.etaF` | `etaF = 6 x^(-CF)` |
| `untw` | `untw c` | `Aj j w = 0` at untwisted places, from `c.row.untw` at `w` and at `conj w` |
| `fin` | `fin c` | finitely many twisted places: a subset of the finite set in `TwFin.tw_fin`, via `c.mu.sub`/`c.mu.off` |
| `dgam`, `full` | `Full.dgam_pos_and_full` | `DGam > 0` from `DGam_pos`; every vector has a nonzero multiple in `MramL`, via `exists_nsmul_mem_of_span` (a lattice of full span) |
| `tame` | `hK X c.isOver c.chiT` | **genuine step, below** |
| `mink`, `atT` | `c.col.mink`, `c.col.atT` | carried by the core |

**The tame step: `TamePow.tame_of_pow` (`FourMulRootLt.lean:105`).**

- *Exceptional case (`Ev` is trivial here).* `Ev` is discharged with ε₀ = 1 and every other threshold 0 (`refine ⟨1, one_pos, ?_⟩`). So the statement holds for every context K, not just eventually.
- *Inputs.* `c.chiT` gives a generator `w` of `(ℤ/g)ˣ` (order g − 1) with `chiT k v j = w^{2(j+1)}` for j < m. Here `g = g_k` is the host prime.
- *Size bound.* `bound_of_over` gives 4m·g^{1/4} < g − 1, from `K.Over` and the context's `RankVal`/`HostVal`:
  - m ≤ 2√x and k ≥ x⁴, so with b ≥ e we get max(2, m) + 3 ≤ k·b;
  - `HostVal` gives (k·b)⁸ ≤ g;
  - `four_mul_root_lt` (with m ← max(2, m), k ← k·b) then gives the bound. Its key step: with t = g^{1/4} ≥ k², we have 4m·t < k²·t ≤ t² < t⁴ − 1.
- *Tame distinctness.* `tameDistinct_gen` (`PowEqOfPartEq.lean:84`) proves `TameDistinct r g (j ↦ w^{2(j+1)})`, given `1 ≤ r` (from `two_le_m`). Write each `tameList` value as `w^{2e}`, where e ∈ {0, ±(j+1)}, so |e| ≤ m (`tameList_eq`, `expo_bound`).
  1. *Injectivity.* If `w^{2e} = w^{2e'}` with e ≠ e', then (g − 1) divides D := |2e' − 2e|, and 0 < D ≤ 4m (`dvd_of_pow_eq`). So g − 1 ≤ 4m, which contradicts the size bound. (Core-Lean skeleton: `NFE3.exps_distinct`.)
  2. *Prime-to-ℓ parts injective for ℓ ∉ BB r g.* We argue by contraposition: assume two prime-to-ℓ parts agree; we show ℓ ∈ BB r g.
     - By `pow_eq_of_part_eq`, x^{ℓ^a} = y^{ℓ^a}. So (g − 1) divides D·ℓ^a.
     - Write g − 1 = ℓ^v·M with gcd(M, ℓ) = 1. Then M divides D, so g − 1 ≤ 4m·ℓ^v. (Core-Lean skeleton: `NFE3.prime_to_part_bound`.)
     - Combined with the size bound: g^{1/4} < ℓ^v, i.e. g < ℓ^{4·v_ℓ(g−1)}. That is exactly `Exc g 1 ℓ`, so ℓ ∈ `BB r g` (`Formalism/CyclotomicNorms/StatementI.lean`).
     - Note: the clause applies to every prime ℓ outside BB, including ℓ = g. That case is harmless, because g ∈ BB by definition.
  3. *Squares.* `w^{2(j+1)} = (w^{j+1})²`.

### 2.4 `LedOK` (`ledOK c hv`)

- The first conjunct (Fval vanishing at untwisted places) is `c.fval`. Its "w ∉ Wt" premise comes from `TwFin.tw_fin` and `c.mu`.
- The second conjunct uses three ingredients:
  - `c.gy.led`;
  - `NP_full`, with the exponent read from `c.gatNum` and `Ce = 1` (from `K.std.1`, `FC.Fixed`);
  - `hs : L.sc = K.s`.

### 2.5 `TupUsedAt` (`tupUsed c`)

Each tuple slot μ has `xi μ ∈ T.set f = {1, del, del'} ∪ range xiTw`. We split into cases:
- The value is 1, del or del': injectivity of `c.mu` (`mu0`, `star`, `star'`) identifies μ.
- The value is `xiTw w`:
  - if w ∈ Wt, then μ is the twisted slot of w (`c.mu.tw`, `c.mu.on`);
  - if w ∉ Wt, then ψ w = 1 (`c.mu.supp`). So `xiTw w` is del or del' (depending on whether `resChar w = pde`), which reduces to the previous case.

**Hypotheses and edge cases kept:**
- `hv` is used only in `sizes_eq_count`.
- The `Ev` wrapper of `tame_of_pow` is uniform in K.
- `r ≥ 1` comes from `two_le_m`.
- `g ∈ BB` is covered by definition.
- The case w ∉ Wt with ψ = 1 is handled in §2.5.
- The `Ce = 1` normalisation comes from `K.std`.

## 3. Remaining dependencies (exact names)

| id | name | note |
|---|---|---|
| T-1 | `GlobalTheory.ExceptionalPair.main` | zero-free region with an exceptional zero (feeds SmallPrimeOne) |
| T-2 | `GlobalTheory.Lin.PsiRel.psiAP_relative` | ψ in progressions with relative error |
| T-3 | `GlobalTheory.Lin.pi_rel_of_psi_rel` | from ψ to π |
| T-4..7 | `siegelMassRatio_of_LI`, `GlobalTheory.Mass.binary_hermitian_represents`, `liRatio`, `liPin` | Siegel mass ratio |
| T-8 | the discharge of `P : UnitaryGroupThirdPlaceHypotheses` (Published.* bundle) up to `rhOfAll` | theta lane |
| L-1 | `V4.Core` producers (the data `c.col`, `c.gy`, `c.row`, `c.chiT`, `c.dsig_eq`, …) | they come from FirstG/SecondG (galois/theta via `MemberE`) |
| L-2 | `TwFin.tw_fin`, `exists_nsmul_mem_of_span`, `NP_full`, `GlobalTheory.NatMulIntegerMultiple.main` | small native lemmas |

## RESUME HERE
1. T-1 to T-3 (the analytic number theory behind `SmallPrimeOne`), starting at `GlobalTheory.ExceptionalPair.main`.
2. T-4 to T-7.
3. `window_lower` (R-5 from run 02).

## HANDOFF TO
- **lean_validation:** run `#print axioms` for `riemannHypothesis`, `GlobalTheory.Lin.primesRel_holds` and `GlobalTheory.Mass.massRatio_all_unramified_cmFields` (companion §1). This would turn §1 from source-reading into an executed result.
- **theta lane:** T-8.
