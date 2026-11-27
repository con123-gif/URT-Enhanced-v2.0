import Lean
import New.Endgame.LongForms
import Mathlib.Tactic

/-!
# RUN80 — fixed-truncation local-to-global A1 caller replacement
27 November 2026. PREPARED source-typed Lean replacement; human source audit,
not compiled. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Historical old
pin 40e56bab026552e089d7afcfeff08d2defb9c005 unchanged.

Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
67e542df1b5557b2e1314643931ef1355bbdc50d, ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d, AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION and own RUN79 3b3629d3281d344c41bcca75900198d21f4ab5d2.
Recent peer commits include kernel 2f04e074 (marked support), acceleration
14287e58 (square frame), editor c1dc4f8b (B4), audit 7ee57746 (B2);
no uncompiled peer replacements are assumed here. D1/E1 already have
independent human audits. Do not reopen them; A1 is the assigned frontier.

Source ledger relative to grh-compact/src:
New/Columns/LocalStatement.lean blob 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
233–240 native HasType, 255–276 three gauge bounds, 285–307 local consumer.
New/Columns/SizeEstimates.lean blob 0b666c5f3cead375b65b97c6af8a25675486b473
nonsplitPrimes, allowedLoss and aggregate sum.
New/Columns/JetExponentBound.lean le_loss (line 26), mul_collisionSum_le_loss
(line 138), native marked dichotomy.
New/Endgame/ShortAndEnough.lean blob b99eea0689be372d84362c58272b705e104b6a3a
21–26 rational normalization, 138–168 actual Data.short_forms.
New/Main.lean star_inequality (121ff) consumes exists_family_covolumeSq_le.

## 1. Close the missing source-level splice, not another scalar estimate
RUN79 left hlocal as an explicit argument to a generalized A consumer.
The exact source proof has THREE cases: nonsplit, N, ordinary. In the
nonsplit case use its original full-mark/unserved dichotomy, the original
J=jetCeil p and original HasType at J. No adaptive truncation, no new
projector bound, no alternative count. For beta <= G-2L and L>=1:
  marked exponent 2L-G <= -beta;
  p^J summand exponent L-G <= -beta;
  unserved exponent C+L-G <= 2L-G <= -beta.
The local k argument is unchanged, and the original index bound 3L*v
is retained. The same lattice works BEFORE all good data/twist/column
quantifiers. Outside the nonsplit set use the unmodified native local
theorem. N (the exceptional level) is not treated as an ordinary prime.

## 2. Concrete adapter and full original-statement replacement
Define g(p)=ceil(2L-G) on the nonsplit set, and the original floor
elsewhere. On the first branch beta=-g <= G-2L by le_ceil; elsewhere
beta=ceil(G_p-E_p) < G_p-E_p+1. Thus the local conclusion has exactly
the same type as RUN79 hlocal, now with a constructed supplier. The
archimedean cap is g <= E_p-G_p: for nonsplit primes ceil(2L-G) <
2L-G+1 <= 3L-G, and otherwise floor_le. On the complement of the
finite support T, g=0. These two facts are the only global scalar
guards, and are separate from the index bound.

The code below provides the fixed-J local theorem, the exponent and its
support/cap, the actual local adapter, and a full replacement of
Data.short_forms with its original statement. It copies the native
consumer's seesaw and IndexDvd.sup assembly, not its theorem as a proof.
No new choice of D or twist; B and C must consume the same resulting q.
The proof of the original statement is the replacement bridge; not a
claim that an already compiled LongForms declaration uses it.

Original source occurrence graph: three gauge bounds + HasType +
allowedLoss -> local theorem -> rational q and seesaw + IndexDvd.sup
-> short_forms -> exists_family_covolumeSq_le -> star.
Candidate: same gauge/HasType + fixed-J beta guard -> explicit local
adapter -> same seesaw/index assembly -> same original short_forms type.
The exceptional/ordinary branch retains original local theorem. Thus
no global dependency is retired. Marked support, frame, Hecke,
short-column span, CM, B/C and all native graph/axiom evidence remain.
Context key: source pin,D,p,PadicPlace,mark,J,beta,g,q,same seesaw
datum and t,y. No cross-D, cross-embedding or cross-pin cache reuse.

## 3. Verification boundary
Local command -v lean and command -v lake returned no executables;
native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not run.
No new repeated scalar benchmark: RUN79 already checked rounding.
This file is a prepared replay target; elaboration errors remain possible.
Do not report a kernel verdict until actual logs and axiom reports exist.

Actual CI receipts retrieved:
old-pin engine/conditional root 45577239749 (blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc) and bounded scan
45576756833 (7da354941e402b6f8b364ed03d8c5c82d27b7717) pass only
their recorded scopes; scan 324 pending.
Compact targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
six original B/C checks standard axioms, JetExponentBound timeout
124, all_requested_checks_ok=false, full_RH_replay=false.
New B2 status.json d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d,
run 45986308748 actually reports 8 helpers and 6 original caller
axiom probes, negative control rejected, caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false. Not A1 evidence.
No new A-module PASS. No RH proof. No URT performance claim.

RESUME HERE: shared native runner replay this one file in the compact
ShortAndEnough workspace (first LocalStatement if resource blocked);
inspect all five named axiom reports and the original-statement
replacement, then substitute at LongForms.exists_family_covolumeSq_le.
Do not re-optimize exponents or rerun scalar samples. Independent audit
requested of exact local argument and simultaneous quantifiers.
HANDOFF TO kernel, theta, formal audit, integration/editor.
-/

open Polynomial Finset Gf Kernel Module Parameters Real Submodule
open Stirling LevelPlaces.LevelForm

section Local
variable {P} {D : Data P} {p : ℕ} [hp : Fact p.Prime] [PadicPlace p]

/-- Fixed native truncation, strengthened nonsplit valuation threshold. -/
lemma Data.exists_indexDvd_Bmu_divisible_nonsplit_run80
    (hm : p ∈ D.nonsplitPrimes) {β : ℤ}
    (hc : (β : ℝ) ≤ D.gain p - 2 * D.loss p) :
    ∃ l : ℕ, l ≤ D.allowedLoss p * finrank ℂ D.Column ∧ ∃ S,
      IndexDvd D.integralColumns S (p ^ l) ∧ ∀ ϑ Ψ,
      D.IsGoodDatum ϑ Ψ → p.Coprime ϑ.levelNorm → ∀ φ ∈ S,
      φ ∈ D.ramifiedColumns →
      (p : ℂ) ^ (-β) • D.Bμ ϑ Ψ φ ∈ integralFormsAt ⊤ 1 := by
  have k {ϑ Ψ φ} {c : ℝ} (h : GaugeLe 1 (p ^ c) (D.Bμ ϑ Ψ φ))
      (e : c ≤ -β := by linarith) :
      (p : ℂ) ^ (-β) • D.Bμ ϑ Ψ φ ∈ integralFormsAt ⊤ 1 := ⟨⟨⟩, fun g ↦ by
    erw [weylGauge_smul]
    grw [h g, e] <;> simp [norm_p_eq_inv, rpow_neg, NeZero.one_le, NeZero.ne]⟩
  rw [allowedLoss, if_pos hm]
  have h := hm
  simp [Nat.lt_ceil, hp.1] at h
  have := D.hasLogUpper_of_le_of_nonneg h.1.le
  have hL := D.le_of_hasLogBound (F := 1).trans (D.le_loss p)
  obtain ⟨Λ, hΛ⟩ | s := (em _).imp (D.exists_isMarked h.1) (mul_collisionSum_le_loss h)
  · peel hΛ.hasType_prod_markOperator_pow.2
    refine ⟨_, this, fun _ _ G Q _ e _ ↦ ?_⟩
    obtain ⟨_, ⟨u, U, rfl⟩, _, ⟨v, V, rfl⟩, rfl⟩ := mem_sup.1 e
    simpa using!
      add_mem (k (G.gaugeLe_Bmu_of_isMarked Q U hΛ)) (k (G.gaugeLe_pow_jetCeil_smul Q V h))
  · use 0, mod_cast by bound, D.integralColumns, by simp
    intro ϑ Ψ G Q φ c _
    exact k (G.gaugeLe_collisionSum Q c h)

end Local

section Global
variable {P} (D : Data P)

noncomputable def Data.normExponent_run80 (p : ℕ) : ℤ :=
  if p ∈ D.nonsplitPrimes then ⌈2 * D.loss p - D.gain p⌉
  else ⌊D.allowedLoss p - ite (p ∈ D.nonsplitPrimes) (D.gain p) 0⌋

lemma Data.normExponent_run80_zero (p : ℕ)
    (h : p ∉ D.nonsplitPrimes ∪ {D.N}) :
    D.normExponent_run80 p = 0 := by
  have hm : p ∉ D.nonsplitPrimes := fun hp ↦ h (mem_union_left _ hp)
  have hN : p ≠ D.N := fun he ↦ h (mem_union_right _ (by simpa [he]))
  simp [Data.normExponent_run80, allowedLoss, hm, hN]

lemma Data.normExponent_run80_cap (p : ℕ) :
    (D.normExponent_run80 p : ℝ) ≤ D.allowedLoss p -
      ite (p ∈ D.nonsplitPrimes) (D.gain p) 0 := by
  classical
  by_cases hm : p ∈ D.nonsplitPrimes
  · haveI hp : Fact p.Prime := ⟨(mem_filter.mp hm).2.1⟩
    have h := hm
    simp [Nat.lt_ceil, hp.1] at h
    have := D.hasLogUpper_of_le_of_nonneg h.1.le
    have hL := D.le_of_hasLogBound (F := 1).trans (D.le_loss p)
    rw [Data.normExponent_run80, if_pos hm, allowedLoss, if_pos hm, if_pos hm]
    have hc := Int.ceil_lt_add_one (2 * D.loss p - D.gain p)
    linarith
  · rw [Data.normExponent_run80, if_neg hm]
    exact Int.floor_le _

lemma Data.normExponent_run80_local (p : ℕ) [hp : Fact p.Prime] [PadicPlace p] :
    ∃ l : ℕ, l ≤ D.allowedLoss p * finrank ℂ D.Column ∧ ∃ S,
      IndexDvd D.integralColumns S (p ^ l) ∧ ∀ ϑ Ψ,
      D.IsGoodDatum ϑ Ψ → p.Coprime ϑ.levelNorm → ∀ φ ∈ S,
      φ ∈ D.ramifiedColumns →
      (p : ℂ) ^ (D.normExponent_run80 p) • D.Bμ ϑ Ψ φ ∈ integralFormsAt ⊤ 1 := by
  classical
  by_cases hm : p ∈ D.nonsplitPrimes
  · have hc : ((-(D.normExponent_run80 p) : ℤ) : ℝ) ≤ D.gain p - 2 * D.loss p := by
      push_cast
      rw [Data.normExponent_run80, if_pos hm]
      have h := Int.le_ceil (2 * D.loss p - D.gain p)
      linarith
    simpa only [neg_neg] using
      (D.exists_indexDvd_Bmu_divisible_nonsplit_run80 hm hc)
  · have hc : ((-(D.normExponent_run80 p) : ℤ) : ℝ) <
        ite (p ∈ D.nonsplitPrimes) (D.gain p) 0 - D.allowedLoss p + 1 := by
      rw [Data.normExponent_run80, if_neg hm, ← Int.ceil_neg]
      simpa [neg_sub] using
        (Int.ceil_lt_add_one (ite (p ∈ D.nonsplitPrimes) (D.gain p) 0 - D.allowedLoss p))
    simpa only [neg_neg] using (D.exists_indexDvd_Bmu_divisible hc)

/-- Original statement of Theorem A, with concrete altered q and fixed-J supplier. -/
lemma Data.short_forms_run80 : ∃ q > (0 : ℚ), ∃ B,
    B = (q : ℂ) • D.projectedPoincare ∧ (∃ S ⊆ D.integralRamified, span ℂ S = ⊤ ∧
    ∀ φ ∈ S, ∀ s σ, (D.Θ 1 (B s φ)).normSqAt σ ≤ exp (D.mainHeight -
      D.m * D.remainder + D.logB * D.budget)) ∧ ∀ (t : Finset D.G) n (y : Fin n → _),
    (∀ i, y i ∈ Set.image2 (B ·) t D.integralRamified) →
    D.IndexLe y (#t * finrank ℂ D.Column * D.budget) := by
  classical
  obtain ⟨q, q0, e, v⟩ := exists_rat_log_eq_and_padic_norm_eq
    (D.nonsplitPrimes ∪ {D.N}) D.normExponent_run80
    (by grind [N_prime]) (fun l h ↦ D.normExponent_run80_zero l h)
  have hs : ∑ l ∈ D.nonsplitPrimes ∪ {D.N}, (D.normExponent_run80 l : ℝ) * log l ≤
      ∑ l ∈ D.nonsplitPrimes ∪ {D.N},
        (D.allowedLoss l - ite (l ∈ D.nonsplitPrimes) (D.gain l) 0) * log l :=
    sum_le_sum fun l _ ↦ mul_le_mul_of_nonneg_right
      (D.normExponent_run80_cap l) (log_natCast_nonneg l)
  choose Ψ G S using D.seesaw.choose_spec
  refine ⟨q, q0, _, rfl, ⟨_, fun φ k l _ _ ↦ ⟨φ.1.2, k.1 l⟩,
    D.span_short_ramifiedColumns, fun φ k s σ ↦
    (map_smul (D.projectedPoincare s) .. ▸ normSqAt_goodProjTranslate_le
    (S .. ▸ weylNormSq_Bmu_le (B := 2 * log q + D.budget)
    (G 1) (by simpa [two_mul, exp_add, exp_log, q0, sq] using k.2 σ ·) ·)).trans (by
    grw [e, heightPerRow_le, hs]
    simp [sub_mul, -mem_filter, -union_singleton]
    grw [sum_allowedLoss_mul_log_le]; ring; simpa using D.le_of_hasLogBound)⟩,
    fun t n y h ↦
    ⟨fun l ↦ #t * finrank ℂ D.Column * (_ * log l),
    fun U ↦ by grw [← mul_sum, sum_allowedLoss_mul_log_le], fun l _ ι ϑ c ↦
    (D.normExponent_run80_local l).elim fun n a ↦ a.2.elim fun _ b ↦
    (IndexDvd.sup (N' := (integralForms ι).comap ((D.Θ ϑ).restrictScalars embValRing)) (f :=
    ((q : ℂ) • D.projectedPoincare · |>.restrictScalars embValRing)) (fun s ↦ b.1.comap
    (D.ramifiedColumns.subtype.restrictScalars _) le_rfl fun φ _ h ↦ congr($((D.Θ ϑ).map_smul ..) ∈
    integralForms ι).mpr (goodProjTranslate_mem_integralForms ι (fun g ↦ by
    erw [weylGauge_smul, congr($(S ..).1 g)]
    simpa [v, weylGauge_smul] using (b.2 _ _ (G ϑ) c _ h φ.2).2 g) s)) t _ y
    fun k ↦ subset_span (.inl (Set.image2_subset_left (by exact fun _ ↦ (· l)) (h k)))).imp
    fun u ⟨k, h⟩ ↦ ⟨?_, h⟩⟩⟩
  · apply (Valuation.valuationSubring.integers _).le_of_dvd at k
    simp [norm_p_eq_inv, ← NNReal.coe_le_coe] at k
    grw [← k, ← le_log_iff_exp_le] <;> simp [NeZero.pos]
    linarith [mul_le_mul_of_nonneg_right a.1 (mul_nonneg (#t).cast_nonneg (log_natCast_nonneg l))]

end Global

#print axioms Data.exists_indexDvd_Bmu_divisible_nonsplit_run80
#print axioms Data.normExponent_run80_zero
#print axioms Data.normExponent_run80_cap
#print axioms Data.normExponent_run80_local
#print axioms Data.short_forms_run80
#check Data.short_forms

open Finset LinearMap Real Submodule LevelPlaces.LevelForm
section Run81Family
variable {P}
lemma Data.exists_family_covolumeSq_le_run81 (D : Data P) : ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
    (1 - 4 / D.b ^ 2) * D.rowDim ≤ n ∧
  (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧ ∀ σ,
  covolumeSq (D.Θ 1 ∘ y) σ ≤ exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms_run80, D.enough_forms
  -- the family: a basis among the translates
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  -- index and length
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

end Run81Family

open Real Finset Filter Data Parameters Module
lemma star_inequality_run81 {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le_run81.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound

/- RUN81 independent native guards. No New.Main import. The star statement
is copied verbatim from pinned Main.lean; its exact type is also checked
against the explicit source signature below. -/
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  star_inequality_run81

set_option pp.fullNames true
run_cmd do
  let pairs : Array (Lean.Name × Lean.Name × Lean.Name) := #[
    (``Data.short_forms, ``Data.short_forms_run80, ``Data.normExponent_run80_local),
    (``Data.exists_family_covolumeSq_le, ``Data.exists_family_covolumeSq_le_run81,
      ``Data.short_forms_run80)]
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (orig, repl, supplier) in pairs do
    let oi ← Lean.getConstInfo orig
    let ni ← Lean.getConstInfo repl
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oi.type ni.type
    unless same do
      Lean.throwError "RUN81 original declaration type differs"
    let some nv := ni.value? (allowOpaque := true) |
      Lean.throwError "RUN81 replacement proof unavailable"
    let some ov := oi.value? (allowOpaque := true) |
      Lean.throwError "RUN81 original proof unavailable"
    let nd := nv.getUsedConstants
    if nd.contains orig then
      Lean.throwError "RUN81 replacement invokes original target"
    unless nd.contains supplier do
      Lean.throwError "RUN81 supplier absent"
    let oa ← Lean.collectAxioms orig
    let na ← Lean.collectAxioms repl
    unless na.all (fun x => allowed.contains x && oa.contains x) do
      Lean.throwError "RUN81 unexpected/new axiom"
    Lean.logInfo m!"RUN81 {orig} original_type_edges {oi.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 {orig} original_value_edges {ov.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 {repl} replacement_type_edges {ni.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 {repl} replacement_value_edges {nd.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 {orig} original_axioms {oa.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 {repl} replacement_axioms {na.map Lean.Name.toString}"
    Lean.logInfo m!"RUN81 checked type and supplier: {repl}"
  let si ← Lean.getConstInfo ``star_inequality_run81
  let some sv := si.value? (allowOpaque := true) |
    Lean.throwError "RUN81 star proof unavailable"
  let sd := sv.getUsedConstants
  unless sd.contains ``Data.exists_family_covolumeSq_le_run81 do
    Lean.throwError "RUN81 star has not consumed replacement family"
  if sd.contains ``Data.exists_family_covolumeSq_le then
    Lean.throwError "RUN81 star uses old family"
  unless sd.contains ``Data.integral_forms_long do
    Lean.throwError "RUN81 star missing reciprocal-height input"
  let sa ← Lean.collectAxioms ``star_inequality_run81
  unless sa.all (fun x => allowed.contains x) do
    Lean.throwError "RUN81 unexpected star axiom"
  Lean.logInfo m!"RUN81 star type_edges {si.type.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"RUN81 star value_edges {sd.map Lean.Name.toString}"
  Lean.logInfo m!"RUN81 star axioms {sa.map Lean.Name.toString}"
  Lean.logInfo "RUN81 checked star supplier and axioms"
#print axioms Data.exists_family_covolumeSq_le_run81
#print axioms star_inequality_run81
