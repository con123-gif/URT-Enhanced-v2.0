# Native arithmetic family existence: `classSel` → `recS` → `designS` → `exists_famP_of_kits`

**Lane:** native arithmetic family existence (Grok swarm). **Agent:** Grok. **Date:** 2026-11-24.
**Upstream:** `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
**Status:** SOURCE-MATCHED conditional reconstruction. The source files and tokens were checked by an executed script. An abstract skeleton was typechecked in Lean. The upstream-typed companion was **NOT EXECUTED**.
This chapter does **not** prove that a native family exists unconditionally. It reconstructs exactly how the formal proof *derives* family existence and which named producers it still consumes. No gate is closed. No URT premise is used.

Not redone here (reused): the `HypsAlt` outer constructor (`math/2026-11-24_hypsalt_unramified_constructor.md`), the 24-field size algebra, the guarded cusp map, the depth-zero Frobenius parameter, the induced Weil parameter, the Bernoulli top-set selection, the thick-sphere/rank chapters, and the `DIVinN` algebra.
Lanes not entered: Galois rows, the Green regular-character theorem, and Lean kernel extraction.

---

## 0. Where family existence sits in the proof (the junction)

The analytic side consumes `FamilyClassConnected (G.cls la)`, produced by `UpperTheory.Top.topDesWin` (DesWin.lean `94820ef3`). Its only existence premise is

    hEx : DesignExists (WithTw (WithSm 𝒞')) C0 .

In the actual root path (theta `TopShape.lean` `3f791ca1`, `shape_closed_link_n_of_green`), that premise is

    hE := designExists_of_tuSize_aux4n_litThin (fun Fm => 𝒜 Fm ∧ G.cls la Fm) cT (fun hM => hEx hM la G hla hH) …

with `hEx : MinkDiv → UpperTheory.Top.ExS 𝒜 cT`, a *field* of `TopShapeAlt` (TopShapeAlt.lean `0c6a19a0`) and hence of `HypsAlt`. Inside `designExists_of_tuSize_aux4n_litThin` (LinkEx.lean `e28c35e5`) the guard is discharged unconditionally by `hEx minkowski_bound_rat`. The result is then passed through `designChoices_upN` and `designExists_of_choices` (DesignExistsOfChoices.lean `bad4dbc2`), together with `hTu`, `hProv` and `chosenThin_closed … hLit`.

The field `HypsAlt.hEx` is built in `nonempty_hyps_of_allRows_alt` (theta NonemptyHypsOfAllRows.lean `6a09205d`) as

    hEx := fun hM la G hla hH => working_classes_frozen.2 _ _ (fun hM' => hE hM' la G hla hH) hM

where `hE : DC.MinkDiv → ExD 𝒜 cT` is the **first output of `UpperTheory.Top.classSel`** and `cT := fun _ y => cTmin y`.
`working_classes_frozen.2` (WorkingClassesFrozen.lean `92140623`) only re-reads `DC.DesignChoices` as `Formalism.MainNotions.DesignChoices`. The two records have the same 18 conjuncts. Only `TameDistinctF` (via `tameDistinctF_iff`) and `CodeUpF` (via `codeUpF_iff`, `Iff.rfl`) are converted.

**So "native family existence" is precisely the statement `DC.MinkDiv → ExD 𝒜 cT` for the class `𝒜` chosen by `classSel`.** The remainder of this chapter derives that statement down to named producers.

## 1. Shared mechanism, derived once: the eventual-parameter prefix is closed under ∧ (Lemma M)

Every existence statement below has the same quantifier prefix:

    ∃ε0>0 ∀eps∈(0,ε0] (eps<1/52) [∀C8≥1 …] ∃K0 ∀C (Std C, C.P.Cpde=C8, C.Large K0 C.P.CF)
      ∃c1 ∀cD≥c1 ∃c2 ∀ch≥c2 ∃x0 ∀(objects at scale x≥x0) …

This prefix appears in `ParEv`, `EvP`, `EvGd`, `ObjC`, `ObjCP`, `HostWW`, `KitCPW`, `RecExP`, `DesignChoices` and `Closed`.

**Lemma M.** If two statements with this prefix hold, their conjunction holds. Take `ε0 = min`, `K0 = K.sup K'`, `c1 = max`, `c2 = max` and `x0 = max`.

*Proof.* The only non-order-theoretic input is `large_of_sup` / `fc_large_of_sup`: `C.Large (K.sup K') CH → C.Large K CH ∧ C.Large K' CH`. This holds because `Large` is a list of lower bounds `max(K c, K' c) ≤ …` and `max` dominates each argument. Every other step is monotonicity of `≤` under `min` and `max`. ∎

Upstream instances that are exactly this lemma: `ParEv.and`, `EvP.and`, `ev_and`, the opening of `kitS`, the opening of `hostWW`, the threshold bookkeeping in `designS`, `designExists_of_choices` (`min ε0 ε1`, `K.sup K'`) and `topDesWin` (`min ε1 ε3`).
Below, "by M" means that the thresholds are merged this way. Nothing else happens at those steps.

## 2. NF-4 `UpperTheory.Top.classSel` (ClassSel.lean `bb17cd65`)

**Statement (all binders kept).** Assume
- `h1 : StandardLattice.SiegelMassRatioCM`;
- `h2 : ∀ D : D7, VolTie D → VolumeRatio₂ D`.

Then for all `KP`, slots `Q Q'`, `Bd : BdT`, `Lk : LkT Bd`, row property `H : ∀ 𝒜, RawSel Bd 𝒜 → Prop` and `cT`, if
- `hc : DC.MinkDiv → BaseCond KP ∧ FirstG KP Q ∧ ExportF KP Q ∧ SecondG KP Q Q'`,
- `hx : ExBL KP Q Q' Lk`, and
- `hr : RowL KP Q Q' Lk H`,

then there are a class `𝒜` and a raw selection `σ : RawSel Bd 𝒜` with
- (i) `DC.MinkDiv → ExD 𝒜 cT`;
- (ii) `∀ eps Fm, 𝒜 Fm → Duty7 Fm ∧ MtStableF Fm`;
- (iii) `IsSel Q' Lk (fun _ _ _ _ _ => True) 𝒜 σ`;
- (iv) `H 𝒜 σ`.

**Definitions used** (ValidFor…EventuallyWorking.lean `6f511130`; EventuallyAllScaleContextsAndOfBoth.lean `9cf715e7`):
- `QOf E κ D O := κ.Pos → ∀ c, ∃ b : Bd D O c, Built κ D O c b ∧ E κ D O c b`. Here `Built` means that b arises from a genuine built point `β : BPt K` with `κ.Of K`, `β.Is Q` and `Lk K β c b`.
- `cls E := clsP (QOf E)`, and `clsP QO Fm := ∃ κ, Link κ Fm ∧ DQ.cls7 (QO κ) Fm`.
- `pick E Fm hc x hx i := Classical.choose (cls_at …)`.
- `Row Q Lk H := ∃E, RowE E ∧ ∀ 𝒜 σ, IsSel E 𝒜 σ → H 𝒜 σ`.
- `ExBL := ∃R, LargeBaseCondition KP Q R ∧ ExB (sAnd Q' R) Lk`.
- `RowL H := ∃R, LargeBaseCondition KP Q R ∧ Row (sAnd Q' R) Lk H`.

**Proof.**
1. *One common slot.* `RowL.elim hx hr` intersects the existence slot `R_x` and the row slot `R_r` into `R = sAnd R_x R_r`. It does this with `LargeBaseCondition.and` (M again, at the level of scale contexts). The result is `r : LargeBaseCondition KP Q R`, `ExB (sAnd Q' R) Lk` and `Row (sAnd Q' R) Lk H`. The existence witness is transported to the stronger slot by `EvP.mono`, and the row by `Row.strengthen` (shrinking the slot only weakens the hypothesis `β.Is`).
2. *Canonical class.* `Row.elim` gives `E` such that
   - (a) `EvP (fun κ K => ∀β, β.Is (sAnd Q' R) → QOf E κ β.D β.O)`. This is `QOf₂`: combine `ExB` (some datum exists) with `RowE` (every linked datum satisfies `E`).
   - (b) `H (cls E) (pick E)`, because `pick_isSel` shows that `pick E` is a selection for `cls E`, and `Row` quantifies over *all* selections.
3. Set `𝒜 := cls (sAnd Q' R) Lk E` and `σ := pick …`. Then (iv) is 2(b).
4. (iii): `pick_isSel` weakened in `E` by `IsSel.mono` to `True`, then from slot `sAnd Q' R` to `Q'` by `isSel_of_sAnd` (ExistsClassSelOfRowL.lean).
5. (ii): `sevenDuties_of_class` unpacks `clsP` and applies `DQ.familyClass_sevenDuties_and_stableLattices` (named dependency D-10).
6. (i): apply `recS (QOf (sAnd Q' R) Lk E) cT`, which needs `DC.MinkDiv → RecExP (fun κ => withQD (QOf … κ))`. Given `hm : MinkDiv`, take `⟨a,b,c,d⟩ := hc hm`. Upgrade `d : SecondG KP Q Q'` to `d' : SecondG KP Q (sAnd Q' R)` using `secondG_sAnd_of_largeBase KP Q Q' R a (evG_of_ev r) d` (D-9). Then `memberTop_final_contextParameters h1 h2 KP Q (sAnd Q' R) (QOf …) a b c d' (2a)` returns `RecExP (fun κ => withQD (fun D O => κ.Pos → QOf … κ D O))`.
   **Guard identity:** `QOf` already begins with `κ.Pos →`, and `(P → P → X) ↔ (P → X)`. So the doubled guard equals `QOf` (`funext` + `propext`), and the required `RecExP` follows. ∎

**What `classSel` does and does not do.**
- `𝒜` is *defined* as the class of all `FamP`s linked to some parameter κ whose every point carries a selected built datum. `classSel` does not exhibit a member of `𝒜`.
- Non-emptiness, and in fact design-quality members for every small `eps` and every transport `K`, is exactly (i), and (i) is supplied wholly by `recS`.
- The selection uses `Classical.choose` and is non-constructive.
- The row conclusions `H` cost nothing extra because they are stated for every selection.

## 3. NF-5 `memberTop_final_contextParameters` (MemberTopFinalContextParameters.lean `57bbacba`)

Under `SiegelMassRatioCM` and `∀D, VolTie D → VolumeRatio₂ D`, with `BaseCond KP`, `FirstG KP Q`, `ExportF KP Q`, `SecondG KP Q Q'`, and `EvP (fun κ K => ∀β, β.Is Q' → QO κ β.D β.O)`, we get `RecExP (fun κ => withQD (fun D O => κ.Pos → QO κ D O))`. It is a composition of two wrappers:
- `volumes_eq_masses_of_unfold hU`, which turns VolumeRatio into VolumeEqMass;
- `layeredAutomorphicData_exists_of_twoPasses`, which equals `GroupRetwisting.recAtG_of_two_passes` and gives `RecAtG (FromCoreAt Q' ∧ TupUsedAt ∧ TwAllAt ∧ MtStableAt)`;
- `existsLayeredData_of_goodScaleContexts`, which equals `GlobalTheory.Fc.recExP_of_recAtG` and lifts it to `RecExP`.

**This is the deepest automorphic input of family existence.** It says that at every good scale context there is layered automorphic data `(D, Y)` over the prescribed `(P, Lv)`, and that every led part of that data satisfies the object property. The two producers `recAtG_of_two_passes` and `recExP_of_recAtG` are not unpacked here (D-1, D-2).

## 4. NF-3 `UpperTheory.Top.recS` (ObjCTrue.lean `abb0785a`)

**Statement.** For `QO`, `cT`, `hR : DC.MinkDiv → RecExP (fun κ => withQD (QO κ))` and `hM : DC.MinkDiv`, we get `ExD (clsP QO) cT`. That is, for every `la > 1`, every `G : FReq` and every `HostExW la G.req`,

    DC.DesignChoices (DC.WithTw fun Fm => clsP QO Fm ∧ G.cls la Fm) 3 cT .

**Proof.** Fix `la`, `G`, `hla` and `hH`.
1. `hS : SmallPrimeOne := smallPrimeOne_of_primesRel primesRel_holds` (D-3, stated unconditionally upstream).
2. Get `hO : ObjCP (fun κ => withObj (ptO (withQD (QO κ))))` from `existsObjects_of_admissibleTwistDatum _ (normPrimes_and_levelPrime_unconditional.2) (hR hM)` (D-4, D-5). Layered data at every good context becomes, at every admissible (scale, ranks, host, twist words, injective code `c`, start index `u0 < R.n`), a point `p : Pt C` at that scale with `Val`, `HostArith`, `From H a b c u0`, `CanonInst` and the object property.
3. `hW : HostWW la G.req := hostWW _ la _ hla (hostQ hS la G hH) (objC_true hO) windowShareRequirementClosedForm_proof`.
   - `objC_true` forgets the object property to `True`, so the host statement does not depend on `QO`.
   - `hostQ` turns `HostExW la G.req` plus SmallPrimeOne into `HostExQW` (the host prime `q0 = q0H H`) (D-6).
   - `hostWW` merges host existence, object existence and window-share closure by M (D-7).
4. Apply `designS` to `kitS _ la G hW hO`. ∎

**Definitional step not re-checked here.** The `designS` conclusion has class `(∃κ, Link κ Fm ∧ DC.cls (ptO (withQD (QO κ))) Fm) ∧ G.cls la Fm`. Upstream accepts it as `clsP QO Fm ∧ G.cls la Fm`, i.e. `DC.cls (ptO (withQD (QO κ)))` unfolds to `DQ.cls7 (QO κ)`. We record this as an elaboration fact of the upstream build. It was not re-elaborated here.

## 5. `kitS` (KitS.lean `0c36d8f9`): one kit per admissible scale

From `HostWW la G.req` and `ObjCP Q`, `kitS` gives `KitCPW la (withDuty (Q κ) ∧ WallPt ∧ G.pt)`. By M it merges the host and object prefixes and adds two further thresholds:
- `exists_injective_words` gives an injective code `c : Fin M → Fin (R.k-2) → Bool` with `M = ⌈3·exp(CΓ m⁵ f L)²·x^CF⌉`;
- `small_prime_lt` gives `q0 < X'`.

At every window scale `s ≥ x0` it takes the host `(R, H, q0, a, b)` and chooses one point `pt i` for each `i : Fin R.n`, each with start index `u0 = i`. It then checks:
- the kit invariants: `same` via `TieSame.same_of_from`, a common word-embedding `eW`, and the cover of weights;
- the point properties via `has_withDuty_wall_and_choices` and `G.at_of_from`.

**The kit index type is `Fin R.n`, which is nonempty since `R.n > 0`.**

## 6. NF-2 `UpperTheory.Top.designS` (DesignS.lean `94baadfe`)

**Statement.** For `Q`, `cT`, `la > 1`, `G`, `DC.MinkDiv` and `KitCPW la (withDuty (withObj (Q κ)) ∧ WallPt ∧ G.pt)`, we get `DC.DesignChoices (WithTw ((∃κ, Link κ Fm ∧ DC.cls (Q κ) Fm) ∧ G.cls la Fm)) 3 cT`.

**Proof.**
- Take the threshold `min ε0 (1/53)`. Then `eps < 1/52` (an exceptional range kept).
- For `eps` and a transport `K`, obtain `(CT2, C8, C5, c6, Cb, K0)` with `C8 ≥ 1` and `C5, c6, Cb > 0`.
- `exists_std_large (thrTu K (cT eps 9)) K0 CT2 C8` picks one standard constant pack `C` that is large for both transports (D-8).
- Merge the kit thresholds with those of `szRow_numAt` (D-11) by M. This gives `cD = max c1 c1'`, `ch = max c2 c2'` and `x1 := max 2 (max x0 x0') > 1`.
- Choose a kit `k s` at every window scale `s ≥ x1`. `NumAt`, `ChTT_at` and `ChCode_at` hold at every kit point.
- **Glue** with `exists_famP_of_kits` (§7).

Then verify the 18 `DesignChoices` conjuncts for `setTu Fm (cT eps 9)`:

| conjunct | source of truth |
|---|---|
| class membership | `Link ⟨eps,C,cD,ch,C5,c6,Cb⟩` (`pre/out/mid/last` from the glue equalities; `out` after `setTu`), plus `setTu_cls` with `classOf` of the kit property, `fix_and_win_of_numAt` (PageFix, PageWin) (D-12) |
| `G.cls la` | windows: for every `y`, `S.windows y` gives `Y ≥ y` with `[Y, Y^la] ⊆ Win = Fm.Win`; pointwise `G.At` from `G.pt` on kit points |
| `TwGood` | `classOf_twPt` (D-13) |
| `0 ≤ CH`, `CH = C.P.CF ≥ 1` | `hStd` middle constants |
| `Large K CH` | `setTu_large` with the glue equalities and `hLK` |
| `ThickSetEventually`, `ChosenTT`, `ChosenBad Cb`, `ChosenCode 3 CF` | transported pointwise from kit points (threshold 0) |
| `ChosenQD C5` | kit `ChQD_at`, rewritten with `L_x` / `L_eps` for `x ≥ x1+1` |
| `BoxesF`, `QDRowsF` | `classOf_reqPt` (D-13) |
| `DGamDvdF` | from the kit's Minkowski choice **and `hM : MinkDiv`** (the only use of MinkDiv) |
| `TameDistinctF` | kit point property |
| `CodeUpF 3 CF` | `card Word = ⌈3Γ²x^CF⌉ ≤ 3Γ²x^CF + 1` (`Nat.ceil_lt_add_one`, x ≥ 0) |
| `CYL ≤ 9` and `cT eps CYL ≤ CTu` | PageFix gives `CYL = 9`, and `CTu` was *set* to `cT eps 9`, so the second holds **with equality** |

The last row shows a structural trick: the tuning constant `CTu` is not estimated at all. It is overwritten after the gluing by `setTu`. This is legitimate only because `Link.out` is stated for `setTu Fm κ.C.CTu` and `exists_std_large` chose `C` large for `thrTu K (cT eps 9)`. ∎

## 7. NF-1 `GlobalTheory.EX.exists_famP_of_kits` (ExistsFamPOfKits.lean `b5246ad2`): the gluing theorem

**Statement.** Assume `0 < eps < 1/52`, `1 < x1`, `1 ≤ la`, `Std C`, `C.GK.Nonneg`, window scales `S : Scales la`, and a kit `k s : Kit C cD ch s` for **every** scale `s` with `s.eps = eps`, `x1 ≤ s.x` and `S.Mem s`, such that every kit point has `Nonempty (NumAt C …)`. Then there is `Fm : FamP eps` with:
- `x1`, `cPre`, `cMid`, `cLast` and `CTu` inherited from `C`, `cOut = C.cOut.set 15 C.P.Cpde`, `J = S.J`, `Win = S.Win` and `Co = C.P.Cpde`;
- (transfer-1) every `PtProp` holding at all kit points holds as `classOf` on `Fm`;
- (transfer-2) every pointwise relation `Rr D L Gx` holding at all kit points holds at all `(x, i)` of `Fm`.

**Proof.**
- `S.unb` gives a window point `y ≥ x1`.
- Define `cutScale x` to be the scale at `x` itself if `x1 < x ∧ x ∈ Win`, and the fixed fallback scale at `y` otherwise. Then `x1 ≤ (cutScale x).x` and `S.Mem (cutScale x)`, so `k (cutScale x)` is defined for **every real** `x`.
- `famOfKits` sets `Ix x := {i : (k (cutScale x)).Ix // x ≤ x1 ∨ x ∈ Win}`, `D x i := (k (cutScale x)).pt i`, and so on. Every one of the roughly 80 `FamP` fields is discharged by a kit invariant (`same`, `val`, `sc_eq`) or by `NumAt`.
- `L_x` (the scale of the data at `x` is `x`) is required only for `x > x1`, and there `i.2` forces `x ∈ Win`, so `cutScale_alt` applies.
- `J ≤ Cpde` is read off one kit point (`host.J_le`), which makes the `cOut` slot 15 equal to `max(J, Cpde) = Cpde`.
- The two transfers hold because every point of `Fm` is literally a kit point. ∎

**Exceptional cases that must not be dropped.**
- (a) For `x > x1` with `x ∉ Win`, `Ix x` is **empty**. Every `∀ i : Fm.Ix x, …` is vacuous there, so the family carries data *only on windows*. This is why `G.cls la` and every downstream window statement need `Windows la`.
- (b) For `x ≤ x1` the indices exist, but the data are copies of the fallback kit at `y`, and `L_x` is not claimed.
- (c) `Ix_win` holds at window points and `Ix_zero` at `x = 0`, both from the kit's `ne`. `Ix_zero` uses `0 ≤ x1`.
- (d) `eps < 1/52`, `1 < x1` and `1 ≤ la` are all genuinely used.

## 8. Remaining dependencies (exact names; none is proved here)

| id | declaration | role |
|---|---|---|
| D-1 | `GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes` (IwasawaDecomposition/LayeredAutomorphicDataExistsOfTwoPasses.lean) | layered automorphic data at good contexts (core automorphic existence) |
| D-2 | `GlobalTheory.Fc.recExP_of_recAtG` (IwasawaDecomposition/ExistsLayeredDataOfGoodScaleContexts.lean) | RecAtG ⇒ RecExP |
| D-2b | `GlobalTheory.Mem.VolMass.volumes_eq_masses_of_unfold` | VolumeRatio ⇒ VolumeEqMass |
| D-3 | `GlobalTheory.EX.smallPrimeOne_of_primesRel`, `GlobalTheory.Lin.primesRel_holds` | small prime supply (primes in progressions) |
| D-4 | `GlobalTheory.T.existsObjects_of_admissibleTwistDatum` → (Statement wrapper `6affb818`) | RecExP ⇒ ObjCP |
| D-5 | `GlobalTheory.EX.normPrimes_and_levelPrime_unconditional` | LevelPrime |
| D-6 | `hostQ` (location not resolved in this run) | HostExW + SmallPrimeOne ⇒ HostExQW |
| D-7 | `UpperTheory.Top.hostWW` internals; `GlobalTheory.T.windowShareRequirementClosedForm_proof` | host/window merge, WClosed |
| D-8 | `exists_std_large` (GlobalInterpolation/ExistsStdLarge.lean) | one standard constant pack large for two transports |
| D-9 | `GlobalTheory.Mem.Top.GroupRetwisting.SecondG.sAnd_of_largeBase` | SecondG stable under adding a large-base slot |
| D-10 | `DQ.familyClass_sevenDuties_and_stableLattices`, `DQ.familyClass_points_satisfy_objectProperty` | duties of class members; `cls_at` |
| D-11 | `szRow_numAt`, `exists_injective_words`, `small_prime_lt`, `TieSame.same_of_from`, `DC.has_withDuty_wall_and_choices` | per-kit numerics and invariants |
| D-12 | `fix_and_win_of_numAt`, `setTu_cls`, `setTu_large` | PageFix/PageWin, the tuning overwrite |
| D-13 | `classOf_twPt`, `classOf_reqPt` | TwGood, BoxesF/QDRowsF |
| D-14 | `minkowski_bound_rat` (location not resolved in this run) | discharges MinkDiv in LinkEx |
| D-15 | premise producers of `classSel` in the root path: `SiegelMassRatioCM` (`hP`), `ExBL` (`hEx`) and `MemberE` from `large_unramified_exponent_bundles_exist_alt`; `hc` (BaseCond/FirstG/ExportF/SecondG); `∀ D, MassRatioUnderVolume D` | theta/Galois lanes (see the HypsAlt constructor chapter) |
| D-16 | `designChoices_upN`, `chosenThin_closed`, `chosenProviso_min`, `second_chern_linked_closed_rank_ties` | downstream DesignChoices ⇒ DesignExists (junction side) |

**Cross-lane named dependencies.**
- D-15's `hc` and `ExBL` come from the Galois/theta producers (`grok_swarm/galois_rows/` lane and the theta lane).
- None of the above uses the Green regular-character theorem. That theorem enters only at `closed_linkIRR_of_join_count hGreen` in `TopShape`, i.e. *beside* family existence in `topDesWin`, not inside it.

## 9. Validation actually performed (2026-11-24, this box)

1. **Source verifier (EXECUTED).** `verify_native_family_sources.py --source-root <sparse blobless checkout at 40e56bab>` checked 23 files and 83 verbatim tokens: every git blob id matched and every token was present, with 0 failures. The log is in `verify_run.log`. This checks transcription only, not mathematics.
2. **Abstract Lean skeleton (EXECUTED, typechecked).** `NativeFamilyMechanismAbstract.lean`: Lean 4.33.1 (commit 819816b2), core only, exit 0. It typechecks `pick_isSel`, `Row.elim`, `classSel_shape`, `cut_ge/cut_win/cut_eq`, `FIx_empty` (the off-window vacuity), `FIx_nonempty` and `glue_transfer`.
   - `#print axioms`: `Classical.choice` (plus `propext` and `Quot.sound` for the gluing lemmas).
   - The upstream types are replaced by opaque parameters and the ParEv/EvP layer is dropped. **This is not evidence that the abstraction is equivalent to upstream.** It shows only that the selection/gluing logic as described here is sound.
   - The log is in `lean_run.log`; the file has sha256 `452c4d03…`.
3. **Upstream-typed companion `RH_NativeFamilyExistenceCompanion.lean`: NOT EXECUTED.** It needs the compiled upstream environment, which is not present. Its statements are copied from upstream and closed by the upstream declarations (NF-1 … NF-6). It may also need `open` adjustments: there are several `Kit`/`cls` names across namespaces.

## 10. RESUME HERE

Unpack **D-1 `GroupRetwisting.recAtG_of_two_passes`** and **D-2 `recExP_of_recAtG`** at the pinned revision (IwasawaDecomposition/). Record their full quantifier prefix and show which of `BaseCond / FirstG / ExportF / SecondG` each pass consumes. These are the remaining substantive automorphic content of native family existence.
Preview, read from the source but not yet derived: `recAtG_of_two_passes` takes `EvG.inter` of `FirstG`, `ExportF` and `SecondG` (merged by `large₂`, i.e. Lemma M), together with `BaseCond.ex` and `LayOfCore.lay_of_core`. Pass 1 (`h1`) builds a core satisfying `Q` over an untwisted datum `TwDat.untw`, using `untw_set_eq : set = {1, del, del'}`. Pass 2 (`h3`) retwists it to a core satisfying `Q'`. `lay_of_core` then supplies the layer `Y`, and the volume tie supplies `VolumeEqMass₂`. The file contains no `sorry` token (checked with rg). Then elaborate `RH_NativeFamilyExistenceCompanion.lean` once the lean_validation lane has a cached upstream environment.

HANDOFF TO: lean_validation (elaborate the companion), integration/editor (insert §0–§7 between the HypsAlt constructor chapter and `topDesWin`), theta/Galois (D-15).
