import New.Endgame.LongForms

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option pp.fullNames true
set_option maxHeartbeats 4000000

/-!
# 27 November 2026 — lane 15: budgeted reachable-span B4 criterion

SOURCE-MATCHED HUMAN DERIVATION; LEAN CANDIDATE PREPARED, NOT COMPILED.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Read mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, AGENTS, SWARM,
HANDOFF, EXPANSION. Read peer 17b030d0 adaptive budget and c61bd4dd
Hodge frame; B2/C2 shared replay queued in 85fca362. This is a
different weakening from changing eta or the C payment.

Exact immutable sources: OneDeterminant 329f004f845b9e2becc896419c8594e82dfef0a6,
ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a,
LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05,
New/Main 198ed5bf26aa294898931e0649bc2b88f1389f65,
FillingTheorem 801448ae9b895babd0d69dc4f7967d86eb006e76,
SeesawTheorem 0e6f5541f15ddb75c30751d22163bfdbd4194d91.

New reduction: at the actual A+B family caller, full IsSpread tests
EVERY subspace F. The native greedy proof calls it ONLY on
T(t)=sum_{s in t} range(B_s), where t is already affordable:
    |t| v <= 5 d log(1+1/eta).
Here B_s is the map on the original full Column, ramified by E,
with the SAME chosen seesaw scalar D.seesaw.choose (not independent
scalars per translate); v=dim Column, d=dim rows.
Thus one needs only the budgeted reachable-span condition
    exists s: dim B_s^{-1}(T(t)) <= ((1+dim T(t)/d)/2+eta)v
for affordable finite t. No requirement on nonreachable subspaces.
Keep eta=b^(-2), original index and C budgets; no change to D.

Human proof (d>0): take a maximal reachable span with
  |t|v + psi(T(t)) <= K = 5d log(1+1/eta),
  psi(F)=5d log(1+(d-dim F)/(eta*d)).
The empty set is feasible and psi>=0. Hence t is affordable,
so the restricted premise supplies s. If r=d-dim T(t)>4eta*d,
rank-nullity on the quotient gives a gain g>=v(r/(2d)-eta).
Then g>0 and
  psi(T(t)+range B_s)-psi(T(t))
  =5d log(1-g/(r+eta*d))
  <= -5d*g/(r+eta*d) <= -v
because r>=4eta*d. Adding s costs at most v, contradicting
maximality. Thus rank is >=(1-4eta)d at the original index budget.
The d=0 case of the abstract selection is trivial, but at the
actual star caller it must be ruled out: t=empty is always affordable.
If d=0 then T(empty)=0=rows, so every comap is all Column and
v <= (1/2+eta)v, impossible for v>0 and eta<1/2. Do not weaken
further to tests only at deficient t without adding this initial
positivity guard. This avoids reintroducing sharp spread via the
original finrank_rows_ne_zero. The map range sits inside the range
of projectedPoincare via E's range restriction, with the SAME c.
Short forms, index and all-conjugate norms stay on one family.
The original C and scalar cancellation are unchanged.

Strictness control, actually executed in JS using exact integers:
W=C^8, V=C^3, eta=1/100; six maps with images
span(e1,e2,e_{j+2}), j=1,...,6, all injective. A nonempty proper
reachable subset of size k has dim k+2 and a remaining map has
preimage dimension 2; empty has 0; full has 3. All 64 subsets
checked (zero failures), multiplying the inequality by 1600:
  1600*rank <= 3*(800+100*dim+16).
The nonreachable plane F=span(e1,e2) gives rank=2 for every map,
3200>3048, violating full IsSpread. All subsets are affordable
since 18 < 40 log 101. Thus the new premise really is weaker,
not just a rearrangement of the old universal quantifier.
The control is a finite-dimensional counterexample to converse,
not data D or a proof of its moment estimates.

Source transformations: 11 exact single-occurrence substitutions
executed against the four pinned theorem bodies. No local lean/lake
on PATH (command checked); native rh_scan/rh_prune/rh_reduce/rh_auto/
rh_auto_frontier unavailable. Native status of this file: UNRUN.
Previous verified B2 checks do not certify it.
Original displayed edges: star -> family -> enough -> full spread
and star -> row positivity -> full spread.
Candidate displayed edges: star_budgeted -> family_budgeted ->
enough_budgeted -> restricted span premise, and row positivity ->
same restricted premise at empty. Original short_forms and
integral_forms_long remain, with all transitive obligations;
no claim of global dependency deletion or that the restricted
condition holds for actual D. Keep old graphs and axiom evidence.
The previous A/B split certificate 01a56bcd remains unmodified;
after verification its short-only branch can be substituted
into family_budgeted. Do not build duplicate shared environments.

RESUME HERE: in the existing compact shared runner replay this
single module (lake build +New.Endgame.LongForms:olean; lake env
lean --tstack=400000 EditorBudgetedSpans.lean), inspect first error,
axioms and actual caller dependencies. Then ask B3/B4 to prove
the restricted condition directly for affordable T(t), without
using original sharp IsSpread; full spread is a bridge/control
only. Keep C and A suppliers, no use of New.Main as a proof input.
HANDOFF TO integration, B3/B4, kernel and audit. RH remains OPEN.
-/

section Greedy
open Module InnerProductSpace Finset Real Submodule LinearMap

variable {Θ V W : Type} [AddCommGroup V] [Module ℂ V]
  [NormedAddCommGroup W] [InnerProductSpace ℂ W]
  [Module.Finite ℂ V] [Module.Finite ℂ W]

/-- Only affordable spans generated by the maps themselves are tested. -/
def EditorBudgetedSpread (B : Θ → V →ₗ[ℂ] W) (η : ℝ) : Prop :=
  ∀ t : Finset Θ, #t * finrank ℂ V ≤ 5 * finrank ℂ W * Real.log (1 + η⁻¹) →
    ∃ s, finrank ℂ (comap (B s) (⨆ a ∈ t, (B a).range)) ≤
      ((1 + (finrank ℂ ↥(⨆ a ∈ t, (B a).range) : ℝ) / finrank ℂ W) / 2 + η) *
        finrank ℂ V

lemma editor_budgeted_of_spread {B : Θ → V →ₗ[ℂ] W} {η : ℝ}
    (h : IsSpread B η) : EditorBudgetedSpread B η :=
  fun t _ ↦ h (⨆ a ∈ t, (B a).range)

lemma editor_exists_few_translates_budgeted {B : Θ → V →ₗ[ℂ] W} {η} (hη : 0 < η) (h : EditorBudgetedSpread B η) [Nontrivial V] :
    ∃ t, #t * finrank ℂ V ≤ 5 * finrank ℂ W * Real.log (1 + η⁻¹) ∧
    (1 - 4 * η) * finrank ℂ W ≤ finrank ℂ ↥(⨆ s ∈ t, (B s).range) := by
  let T (t : Finset Θ) := ⨆ s ∈ t, (B s).range
  let ψ (F : Submodule ℂ W) := 5 * finrank ℂ W * Real.log (1 + finrank ℂ (W ⧸ F) / finrank ℂ W / η)
  refine (exists_maximalFor_of_wellFoundedGT (fun t ↦ #t * finrank ℂ V + ψ (T t) ≤ _) T ⟨∅, by
    simp [ψ]; grw [finrank_quotient_le, div_self_le_one]; simp⟩).imp fun t ⟨ht, m⟩ ↦
    (h t (ht.trans' (by bound))).rec fun s _ ↦ ⟨ht.trans' (by bound), ?_⟩; by_contra
  obtain ⟨_ | _, m⟩ := em (finrank ℂ W = 0), @m (insert s t), (T t).finrank_quotient_add_finrank,
    ((T t).mkQ ∘ₗ B s).index_eq_of_finiteDimensional <;> simp_all [T, index, t.iSup_insert]
  grw [range_comp, ker_comp, ker_mkQ, card_insert_le] at *
  have : ψ (T t ⊔ (B s).range) - ψ (T t) ≤ -finrank ℂ V
  grw [← mul_sub, ← log_div, log_le_sub_one_of_pos] <;> try positivity
  rify [field, (quotientQuotientEquivQuotientSup ..).finrank_eq] at *; nlinarith
  simpa [T, m (by grind), finrank_pos.ne']
end Greedy

section ActualCallers
open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm LinearMap
variable {P} (D : Data P)

noncomputable abbrev Data.editorBudgetMap (s : D.G) :=
  D.goodProjTranslate s ∘ₗ D.poincare ∘ₗ (D.seesaw.choose.1 • D.ramifyingOp .univ)

lemma Data.editor_rows_ne_zero_budgeted
    (h : EditorBudgetedSpread D.editorBudgetMap (D.b ^ 2)⁻¹) :
    finrank ℂ D.rows ≠ 0 := by
  intro e
  obtain ⟨s, hs⟩ := h ∅ (by simp [e])
  have hz : (⊥ : Submodule ℂ D.rows) = ⊤ :=
    Submodule.eq_of_le_of_finrank_le bot_le (by simp [e])
  have hs' : (finrank ℂ D.Column : ℝ) ≤
      (1/2 + (D.b ^ 2)⁻¹)*finrank ℂ D.Column := by
    simpa [hz, e] using hs
  have hv : (0 : ℝ) < finrank ℂ D.Column := by
    exact_mod_cast finrank_pos_iff.2 D.columnCoords.nontrivial
  have hle := le_of_mul_le_mul_right hs' hv
  have hlt : (D.b ^ 2)⁻¹ < (1/2 : ℝ) := D.lt_of_hasLogBound
  linarith

lemma Data.editor_enough_forms_budgeted (h : EditorBudgetedSpread D.editorBudgetMap (D.b ^ 2)⁻¹) : 0 < finrank ℂ D.Column ∧ 0 < D.rowDim ∧
  ∃ t, #t * finrank ℂ D.Column ≤ 5 * D.rowDim * log (1 + D.b ^ 2) ∧ (1 - 4 / D.b ^ 2) * D.rowDim ≤
  finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) := have := D.columnCoords.nontrivial
  ⟨finrank_pos, (D.editor_rows_ne_zero_budgeted h).pos, (editor_exists_few_translates_budgeted (W :=
    D.rows) (HasLogBound.pos D) h).imp fun _ ↦ .imp (by simp)
    (·.trans (mod_cast finrank_mono (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))⟩

lemma Data.editor_family_budgeted (D : Data P) (h : EditorBudgetedSpread D.editorBudgetMap (D.b ^ 2)⁻¹) : ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
    (1 - 4 / D.b ^ 2) * D.rowDim ≤ n ∧
  (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧ ∀ σ,
  covolumeSq (D.Θ 1 ∘ y) σ ≤ exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms, D.editor_enough_forms_budgeted h
  -- the family: a basis among the translates
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  -- index and length
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩
end ActualCallers

section Star
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module
lemma Data.editor_star_budgeted {P} {D : Data P}
    (spread : EditorBudgetedSpread D.editorBudgetMap (D.b ^ 2)⁻¹) : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  (D.editor_family_budgeted spread).elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast (D.editor_rows_ne_zero_budgeted spread).pos
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
end Star

#print axioms editor_budgeted_of_spread
#print axioms editor_exists_few_translates_budgeted
#print axioms Data.editor_rows_ne_zero_budgeted
#print axioms Data.editor_enough_forms_budgeted
#print axioms Data.editor_family_budgeted
#print axioms Data.editor_star_budgeted
