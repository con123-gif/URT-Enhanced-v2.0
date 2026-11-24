# Native family existence, part 02: `recAtG_of_two_passes` and `recExP_of_recAtG`

Lane: `grok_swarm/native_family_existence/` (Grok executor). Run 2, 2026-11-24.
Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
Paths below are relative to `src/Development/AbelianVarietyTheory/` unless they start with `src/`.

**Honest status**
- This is a human-readable reconstruction of two upstream proofs, made by reading the pinned source. It is **not** a new formal proof, and the upstream project was **not** built or elaborated here.
- `RecAtGMechanismAbstract.lean` is a core-Lean abstract skeleton (no Mathlib, no upstream imports). It was typechecked with Lean 4.33.1 and exited 0; see `lean_run.log`. It checks only the logical shape of the shared mechanisms.
- `RH_RecAtGCompanion.lean` restates the upstream statements so they can be checked against an upstream build. It is **NOT EXECUTED**.
- `verify_recatg_sources.py` was run against a local partial clone at the pin: 25 files, 67 verbatim tokens, 0 failures (`verify_run.log`). Its first run flagged 2 tokens that I had paraphrased rather than copied verbatim. I corrected them and re-ran; both runs are described in the log header.
- No gate is closed by this document. URT is not used anywhere as a premise.

These are first-run items D-1 and D-2 from `../CHAPTER_NATIVE_FAMILY_EXISTENCE.md`, and they are the last two links between the native family chain and its inputs. D-1 consumes the four conjuncts of `MemberE` (the Galois/theta producers' output). D-2 turns D-1's output into `RecExP`, which `recS` in the first-run chapter consumes.

---

## 1. Exact statements (copied verbatim from the pin)

**D-1a** `GlobalTheory.Mem.Top.GroupRetwisting.untw_set_eq` (`Proofs/IwasawaDecomposition/LayeredAutomorphicDataExistsOfTwoPasses.lean:12`)
```lean
theorem untw_set_eq (B : Base) (pl : Finset ℕ) (f : Fr B.toPre) :
    (TwDat.untw B pl).set f = {1, f.del, f.del'}
```

**D-1** `GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes` (same file, line 22)
```lean
theorem recAtG_of_two_passes : (∀ D : D7, Formalism.L2.Theta.VolTieG D → StandardLattice.VolumeEqMass₂ D) →
    ∀ (KP : GroupRetwisting.BaseP) (Q Q' : V4.Slot), GroupRetwisting.BaseCond KP → GroupRetwisting.FirstG KP Q → GroupRetwisting.ExportF KP Q → GroupRetwisting.SecondG KP Q Q' →
      RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D)
```

**D-2** `GlobalTheory.Fc.recExP_of_recAtG` (`Proofs/IwasawaDecomposition/ExistsLayeredDataOfGoodScaleContexts.lean:16`)
```lean
theorem recExP_of_recAtG : StandardLattice.SiegelMassRatioCM → ∀ (Q' : V4.Slot) (QO : Par → ∀ D : D7, Obj D → Prop), RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D) → (EvP fun κ K => ∀ β : BPt K, β.Is Q' → QO κ β.D β.O) → RecExP (fun κ => DQ.withQD (fun D O => κ.Pos → QO κ D O))
```

### Definitions used (unfolded from `Definitions/AutomorphicMembership/{CmQuadraticFormEqAlternatingForm,NotBaseCondFalse}.lean`)

- `Ctx` is a scale context. Its fields are `s, C, cD, ch, P, q1, a, b, c, std, ok, Lv, du_eq, Ds_eq, Gam_eq`.
- `Ev p` is the eventual-parameter prefix ∃ε0 ∀eps ∃K0 ∀C ∃c1 ∀cD ∃c2 ∀ch ∃x0, quantified over contexts.
- `EvG p` is `Ev` with extra `C5 c6 Cb` and the guard `K.Good C5 c6 Cb`, where `Ctx.Good` is `ChGood` (`Definitions/GlobalTwisting/SetUnipotentTranslate.lean:61`; it consists of `ok : ChOK …` and `host : HostGood …`).
- `large₂ K p` holds when there are finite algebraic demand sets `S₁ P₁ A S₂` such that, for every base `B`, frame `f` and twisting datum `T`, the following four conditions together imply `p B f T`:
  - `K.Over B.toPre`
  - `Has₂ B (S₁ …) (S₂ … (T.set f))`
  - `P₁ … ⊆ T.pl`
  - `T.Avoids A …`
- `EvLgG p := EvG fun K => large₂ K (p K)`.
- `RecAtG QL := EvG fun K => ∃ D Y, Over D K.P K.Lv ∧ RecOK ∧ LedOK ∧ TWAt D Y.nch Y.xd ∧ QL K D Y`.
- `TwDat.untw B pl` is the untwisted datum: `Q = ∅`, `k = 0`, `ψ = 1`.
- `TwDat.set f = {1, del, del'} ∪ range (xiTw f)`, where `xiTw w = (if resChar w = pde then del' else del) * ψ w`.
- `BaseCond KP` has two fields:
  - `ex`: EvG gives some `Pre P` over K with frame `f₀`, such that for any algebraic `S₁, S₂` there is a `Base B` with `B.toPre = P`, `f ≅ f₀`, `KP B f` and `Has₂`;
  - `enl`: KP is stable under enlargement.
- `Forced K B T`: every prime equal to some `g i`, equal to `d`, or with `p ≤ X'' n` lies in `T.pl`. `lg_forced K : large₂ K (Forced K)` holds with `P₁ = {g0, g1, d} ∪ range(⌊X''⌋+1)`.
- `Step KP p q := EvLgG (KP → Forced → p → q)`.
- `FirstG KP Q := Step KP (T = untw B T.pl) (HasCore Q)`.
- `ExportF KP Q`: `KP → T = untw → Q c → ExportAt` (large-field form).
- `SecondG KP Q Q' := Pass KP Q (HasCore (Q ∧ TwAllAt ∧ Q'))`. Here `Pass` means: given KP, untw, `Q c` and ExportAt, then for all algebraic `A, S₂` there exist `B' f' T'` with:
  - `Enl B B'`
  - `f' ≅ f`
  - `T'.pl = T.pl`
  - `T'.Avoids A`
  - the `S₂` membership
  - the target `r`.
- `FromCoreAt Q K D Y`: some core `c` satisfies `Q`, and `⟨D, layObj Y⟩ = ⟨X.toD7, c.O⟩`.

## 2. Shared mechanisms (derived once)

**Lemma M** (from run 1): the Ev/EvG prefix is closed under ∧. Take `min` of the ε's, `K.sup` of the field thresholds (via `large_of_sup`), and `max` of the c- and x-thresholds. Its instances are `EvG.inter` (line 339) and `EvG.imp` (line 327) in `CmQuadraticFormEqAlternatingForm.lean`; `evG_of_ev` (line 302) forgets the guard.

**Lemma L** (new): `large₂ K ·` is closed under ∧ and is monotone. These are `large₂.inter` (line 278) and `large₂.imp` (line 282).
- *Proof idea:* take the union of the two demand quadruples `(S₁ ∪ S₁', P₁ ∪ P₁', A ∪ A', S₂ ∪ S₂')`. Any `(B, f, T)` meeting the union meets each part. Upstream does this through `lg_iff_lgOn` / `LgOn.inter`; I did not unpack those (dependency R-9).
- An abstract version (demand = list, union = append) is `NFE2.Large.inter` / `Large.imp` in `RecAtGMechanismAbstract.lean`, which was typechecked.

## 3. Human proof of D-1 (`recAtG_of_two_passes`)

Hypotheses: `h2v` (volume tie ⇒ VolumeEqMass₂, for every D7), `KP`, `Q`, `Q'`, `hK : BaseCond KP`, `hF : FirstG`, `hX : ExportF` and `hS : SecondG`. No other assumption is used.

**Step 0: merging the eventual conditions.**
- `hF`, `hX` and `hS` are each `EvG (large₂ …)`. Use Lemma M to merge them under one parameter prefix. Then, inside, use Lemma L to merge the three large-field conditions together with `lg_forced K`. The result is one `hL : EvG fun K => large₂ K (FirstG-step ∧ Forced ∧ ExportF-step ∧ SecondG-step)`.
- Use Lemma M again to merge `hK.ex`, `hL` and `evG_of_ev lay_of_core` (the Ev form of `lay_of_core`, which carries no guard).
- After this merge, fix the parameters and a context `K` satisfying the guard `K.Good C5 c6 Cb`. The guard is inherited from EvG and is not dropped.

**Step 1: choosing the base.**
- From `hK.ex` we get `Pre P` over K, a frame `f₀`, and the base-producing clause `hks`.
- From `hL` we get demand sets `S₁ P₁ A S₂` (algebraic) and the forcing clause `hlg`.
- Apply `hks` to `S₁ P f₀` and to `S₂ P f₀ F F₀ {1, f₀.del, f₀.del'}`. This gives a Base `B` with `B.toPre = P`, a frame `f ≅ f₀`, `KP B f`, and `Has₂` for these sets.

**Step 2: first pass, on the untwisted datum.**
- Let `T₀ := TwDat.untw B (P₁ …)`. We check the four hypotheses of `hlg` at `(B, f, T₀)`:
  - `Over` comes from `B.toPre = P`.
  - `Has₂` holds because `untw_set_eq` gives `T₀.set f = {1, f.del, f.del'}` (every ψ is 1, so each `xiTw` value is `del` or `del'`). This matches exactly the set the base was chosen for.
  - `P₁ ⊆ T₀.pl` holds by reflexivity.
  - `T₀.Avoids A` holds vacuously because `Q = ∅`.
- So we get the conjunction `⟨⟨h1, hfo⟩, h2, h3⟩`. `hfo : Forced` holds because `lg_forced`'s primes were merged into `P₁`.
- `h1 hKP hfo rfl` gives a core `c` with `Q` at `(B, f, T₀)`. The `rfl` is the FirstG side condition `T₀ = untw B T₀.pl`.

**Step 3: export and second pass.**
- `h2 … c hQ` gives `ExportAt`.
- `h3 … c hQ (ExportAt) (fun _ => ∅) (fun _ _ _ => ∅)` applies the second pass with trivial extra demands (`A = ∅`, `S₂ = ∅`). It produces:
  - an enlargement `B'` of `B` (same Pre, larger field);
  - `f' ≅ f`;
  - `T'` with the same place set `T'.pl = T₀.pl`;
  - a core `c'` with `Q ∧ TwAllAt ∧ Q'` at `(B', f', T')`.
- Exceptional case: the extra avoid set and number set are deliberately empty, so the Avoids and S₂ conclusions are trivial. The place set is not enlarged. `BaseCond.enl` is **not** used in this proof.

**Step 4: laying the core.**
- `c'.real.vol` is the volume tie `VolTieG`, and `h2v` turns it into `VolumeEqMass₂` for `X'.toD7`.
- `lay_of_core` (at this K) applied to `⟨B', …⟩ f' T' c'` gives `Y` together with:
  - `layObj Y = c'.O`;
  - `Over X'.toD7 K.P K.Lv`, `RecOK` and `LedOK` (`k1`–`k3`);
  - `TupUsedAt` (`k4`).

**Step 5: assembling the RecAtG conclusion.**
- `D := X'.toD7`, and Y is the layer from Step 4.
- `TWAt D Y.nch Y.xd` comes from `TwAllAt`, after rewriting `Y.nch = c'.O.nch` and `Y.xd = c'.O.xd` (both from `layObj Y = c'.O`), and then `.twAt`.
- `FromCoreAt Q'` has witness `⟨_, f', T', c', hQ'⟩`, and the Sigma equation follows from `hY`.
- The remaining conjuncts are `TupUsedAt` from `k4`, `TwAllAt` from `hTw'`, and `MtStableAt` from `c'.mtStable`. ∎

An abstract shape check (first → export → second → volume tie → lay) is `NFE2.two_pass` in the Lean skeleton, which was typechecked.

## 4. Link to `MemberE` (why the inputs are the Galois/theta outputs)

`Definitions/AutomorphicMembership/ThetaChr.lean:102`:
```lean
def MemberE (𝒮 : Slots) : Prop :=
  BaseCond KPx ∧ FirstG KPx (IsBuiltE 𝒮) ∧ ExportF KPx (IsBuiltE 𝒮) ∧ SecondG KPx (IsBuiltE 𝒮) (IsGoodE 𝒮)
```
- So `recAtG_of_two_passes h2v KPx _ _ h.1 h.2.1 h.2.2.1 h.2.2.2` applies to any `h : MemberE 𝒮`. This instance is restated in the companion (NOT EXECUTED).
- On the RH path, `hMem` comes from `GlobalTheory.T.large_unramified_exponent_bundles_exist_alt` and is passed as `(fun _ => hMem)` to `GlobalTheory.Fc.nonempty_hyps_of_allRows_alt` (in `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean`, lines 43 and 61).
- `KPx B f := (∃ δ, B.KsExact δ f) ∧ PrePin B.toPre` (`PositionOfIntro.lean`).

## 5. Human proof of D-2 (`recExP_of_recAtG`)

Hypotheses:
- `hconds : SiegelMassRatioCM`
- `Q'`, `QO`
- `h : RecAtG (…)`, the output of D-1
- `hq : EvP (∀ β : BPt K, β.Is Q' → QO κ β.D β.O)`

**Parameter merge (Lemma M, written out by hand upstream).**
- `ε := min ε0 ε1`.
- Given `eps ≤ ε` and `C8 C5 c6 Cb`, take `K0` from `h` and `K1` from `hq`, and use `K0.sup K1` (split with `large_of_sup`).
- Lower bound on `cD`: `max (max c1 c1') 0`. **The 0 is essential.** It forces `0 ≤ cD`, which `window_lower` requires.
- `c2 := max (max c2 c2q) c2'`, where `c2'` comes from `window_lower hconds eps C he he52 hstd cD`.

**Choosing x3 (exceptional case).**
- By cases on `Par.Pos κ` for the current parameter tuple `κ = ⟨eps, C, cD, ch, C5, c6, Cb⟩`:
  - if it holds, `x3` comes from `hq`;
  - if not, `x3 := 0` and the clause is vacuous (`absurd`).
- This is why the conclusion only carries `κ.Pos → QO κ D O`.

**Thresholds.**
- `x1` comes from `window_lower` (at `ch`), and `x2` from `exists_du_nat eps he he52`.
- The RecExP witness uses scale constant `cs = 1` and `x0 := max (max x0 x3) (max x1 x2)`.

**Main step.** Given `s P a b c`, `hs : s.eps = eps`, `hx : x0 ≤ s.x` and `d3 : ChGood …`:
1. `hok := d3.ok`. It fixes `q1 = DC.q0H P.H`, which is forced by `ChGood.ok`.
2. `exists_du_nat` gives `du` (positive naturals) with `du u = duP P u`.
3. `DsP_pos_and_lower P` gives `0 < DsP P` and its lower bound. The RecExP data is `du`, `Ds := DsP P`, with positivity.
4. The log-size inequality for each `u` follows from `hlow` (`window_lower`), after `one_mul` (because `cs = 1`).
5. For each level choice `Lv` with equations `h1 h2 h3`, build the context `K := ⟨s, C, cD, ch, P, _, a, b, c, hstd, hok, Lv, (du_eq via h1), h2, h3⟩`. `h K rfl rfl rfl hs hx0 d3` (D-1's output at K; the guard is satisfied by `d3`) gives `D, Y, g1..g4` and `⟨X, f, T, co, hQ, he⟩`, `u1 u2 u3`.
6. For each led part `p` (with `p1..p4`):
   - **Pos branch:** `Sigma.mk.inj he` identifies `D = X.toD7` and `Y.obj` with `co.O` (heterogeneous equality). Then `hq' hp K ⟨rfl, rfl, rfl, hs, d3⟩ hx3` is applied to the BPt `⟨X, f, T, co, Y, eq_of_heq he, p, p1..p4, ⟨C5, c6, Cb, d3⟩, g2, g3, u1, u2⟩` and `hQ`, giving `QO κ D (Y.obj p)`.
   - **QD part, unconditional:** `DQ.qd_setDiv D (Y.obj p) (nPrime p.L) p.ht ⟨u1, u2, u3⟩`. ∎

Exceptional cases preserved:
- the non-Pos vacuous branch;
- `cD ≥ 0` forced by `max … 0`;
- `cs = 1`;
- `q1` pinned by `ChGood.ok`;
- the guard `d3` reused both for D-1's EvG guard and for the BPt.

## 6. `hostQ` and `minkowski_bound_rat` (located this run)

**`UpperTheory.Top.hostQ`** is at `src/Development/AutomorphicArithmetic/CharacterBoxes/SmallestPrimePolynomialBound.lean:64`. My earlier searches missed it because it is declared with the full dotted name.
```lean
theorem UpperTheory.Top.hostQ :
    SmallPrimeOne → ∀ (la : ℝ) (G : FReq), HostExW la G.req → DC.HostExQW la G.req
```
- `SmallPrimeOne := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A` (`Definitions/GlobalTwisting/LogCondLeThree.lean:87`). This is a Linnik-type bound on the least prime ≡ 1 mod M. It is a **hypothesis** of `hostQ`; I have not traced where it is discharged (R-12).
- Proof outline:
  1. Keep `CT2 C5 c6 Cb x0 S`, and replace `C8` by `(3 + 2·C8)·A`, which is ≥ C8 because A ≥ 1 and C8 ≥ 1.
  2. For each host H, relevel it at `q0 := q0H H`. Coprimality `q0H H ⊥ H.QS` follows from `q0H H ≡ 1 mod QS·q·d`, which holds because `QS·q·d > 1`.
  3. The private lemma `smallest_prime_polynomial_bound` gives `q0H H ≤ (QS·q·d)^((3+2C)A)`.
  4. Splitting of the five listed primes at the new level comes from `har` and `HostSplit.split_of_one_mod`.
- Used at `CharacterBoxes/ObjCTrue.lean:35` (`hostWW … (hostQ hS la G hH) …`).

**`minkowski_bound_rat`** is at `src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/MinkowskiQ.lean:6`. I found it by an import-graph BFS from `Proofs/GlobalInterpolation/LinkEx.lean`; 600 files were read from git objects.
```lean
theorem minkowski_bound_rat : PI.MinkowskiBoundQ := PI.MkQ.minkowskiBoundQ
```
- `PI.MinkowskiBoundQ := ∀ N (G : Subgroup (GL (Fin N) ℚ)), Finite G → Nat.card G ∣ minkowskiM N`. This is Minkowski's theorem on finite subgroups of GL_N(ℚ).
- `PI.MkQ.minkowskiBoundQ` (`…/UnitaryGroupMassFormula/MinkowskiTorsionFree/Lattice.lean:124`) works in two steps:
  1. It embeds G injectively (`phi_injective`) into a finite subgroup of the integral group.
  2. It applies `card_dvd_minkowskiNumber : PI.MinkowskiBound` (the GL_N(ℤ) version, built from `minkowskiBound_of_steps traceStep powerSumStep`).
- **Type match at the use site.** `LinkEx.lean:35` feeds it where `Formalism.MainNotions.MinkDiv := ∀ n, MinkMult n (minkM n)` is expected. That works by unfolding:
  - `MinkMult n M := ∀ H : Subgroup (GL (Fin n) ℚ), Finite H → Nat.card H ∣ M`;
  - `minkM n := Formalism.HermitianLatticeCounting.S6.minkowskiM n`;
  - `S6.minkowskiM`/`S6.minkowskiExp` and `PI.minkowskiM`/`PI.minkowskiExp` have character-identical bodies (checked by the verifier): `∏ p ∈ (range (N+2)).filter Prime, p ^ Σ_{i<N+1} N / (p^i (p-1))`.
  - I did **not** elaborate this definitional equality. The upstream build accepting `LinkEx.lean` would be the real check.
- **Executed transcription check.** In the Lean skeleton, `#eval` of the same formula for N = 0..8 gives `[1, 2, 24, 48, 5760, 11520, 2903040, 5806080, 1393459200]`. This equals OEIS A053657 (Minkowski's bound, offset 1). I fetched the OEIS entry with curl this run.

## 7. Remaining dependencies (exact names; not unpacked here)

| id | name | role | owner / note |
|---|---|---|---|
| R-1 | `GlobalTheory.T.large_unramified_exponent_bundles_exist_alt` / `GlobalTheory.Fc.StageOneU.member_bundles_large_unramified_exponents_alt` | produces `MemberE` (all 4 D-1 inputs) | **galois_rows** / theta lane (named dependency) |
| R-2 | producer of `h2v : ∀ D, VolTieG D → VolumeEqMass₂ D` (`volumes_eq_masses_of_unfold` per run 1) | D-1 hypothesis | native; not unpacked |
| R-3 | `GlobalTheory.Mem.Top.LayOfCore.lay_of_core` internals: `TamePow.tame_of_pow`, `lay`, `layObj_lay`, `isOver`, `ledOK`, `tupUsed`, `Full.dgam_pos_and_full`, `c.col.mink`, `c.col.atT` | Step 4 | native; next task |
| R-4 | core fields `V4.Core.real.vol`, `V4.Core.mtStable`, `TwAllAt.twAt` | Steps 4–5 | definitional/structure fields |
| R-5 | `GlobalTheory.EX.WinLow.window_lower` (+ `vandermonde_place_lower_bound`, `places_ok`, `scale_sizes`, `rank_consts`, `hostBounds`) | D-2 log-size bound | native |
| R-6 | `exists_du_nat` (`Inh.g_big`, `DuInt.duStarOf_nat`) | D-2 du | native |
| R-7 | `GlobalTheory.Mem.Top.DsLow.DsP_pos_and_lower` (`massTelescope_std_pos`) | D-2 Ds | native |
| R-8 | `DQ.qd_setDiv` | D-2 QD part | native |
| R-9 | `lg_iff_lgOn`, `LgOn.inter` | Lemma L internals | native |
| R-10 | `GroupRetwisting.lg_forced` | Step 0 | native |
| R-11 | `StandardLattice.SiegelMassRatioCM` | D-2 hypothesis | discharge not traced |
| R-12 | `SmallPrimeOne` | `hostQ` hypothesis | discharge not traced |
| R-13 | `PI.MkQ.phi_injective`, `card_dvd_minkowskiNumber`, `PI.Mk.traceStep`, `PI.Mk.powerSumStep` | Minkowski bound proof | native (Formalism/PeriodIntegrals) |

## 8. Validation actually run

- `lean_run.log`: `OMP_NUM_THREADS=1 nice lean RecAtGMechanismAbstract.lean` with Lean 4.33.1 (core) exited 0 and printed the Minkowski list. The first attempt failed with a parse error because `export` is a keyword; the parameter was renamed `exportF`.
- `verify_run.log`: 25 files, 67 tokens, 0 failures (second run). The first run found 2 non-verbatim tokens; I corrected them.
- Not run: any upstream elaboration, including `RH_RecAtGCompanion.lean`.

## RESUME HERE
1. Unpack `lay_of_core` (R-3) in `Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean:105`, starting with `TamePow.tame_of_pow` and `Full.dgam_pos_and_full`.
2. Trace the discharge of `SiegelMassRatioCM` (R-11) and `SmallPrimeOne` (R-12) on the RH path.
3. If a box with an upstream build becomes available, run `RH_RecAtGCompanion.lean`.

## HANDOFF TO
- **galois_rows:** R-1 (the `MemberE` producer) is the only input of D-1 that comes from outside this lane.
- **lean_validation:** run `RH_RecAtGCompanion.lean` against an upstream build at the pin; it is NOT EXECUTED.
