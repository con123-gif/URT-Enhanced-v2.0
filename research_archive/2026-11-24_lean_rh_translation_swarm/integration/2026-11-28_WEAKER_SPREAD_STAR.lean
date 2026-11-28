import C2ExactReciprocalBudget
import Lean

/-!
# Integration: quantitatively weaker B3/B4 spread is sufficient
28 November 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED Lean, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF and recent peer commits including cbba4f59
(direct selected record), 108e8dac (exact fiber obstruction), d6d56f3d
(joint witness), 3751e66b (B3 cutoff), fe2e582a (geometric conditioning).
No further a.e./strict mean endpoint variants: the audit correction is
accepted. The next genuine arithmetic reduction is to WEAKEN the precision
required of the actual B spread supplier, not another selector.

Source blobs: New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6
(IsSpread, exists_few_translates for arbitrary positive eta);
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76;
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a;
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e;
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 (read only).
Stage C2ExactReciprocalBudget from
specialists/character_boxes/RUN96_COMPACT_C2_EXACT_RECIPROCAL_BUDGET.lean,
blob daa6714e88afb7277734fda3dc09f4f037286e2a. This peer candidate is NOT
kernel accepted. Its exact completion theorem removes the original
near-full-rank premise from C; using original integral_forms_long instead
would invalidate the weakening.

Let B=budget, L=logB*B, d=rowDim, H=mainHeight, S=m*remainder,
E=m² t x^999, U=x1² b²+x^99+4E, q=b sqrt(b).
Replace the native IsSpread error eta_old=b^-2 by eta_new=1/(4q).
Only the additive error changes; all maps, rank normalization, signs,
quantifiers, and the SAME A/C family are retained.
The native arbitrary-eta theorem gives n≥(1-1/q)d and index at most
5d log(1+4q)B≤5d log(1+b²)B, since 4q≤b².
Row positivity follows from the same weak spread at F=top if d=0:
the entire nonzero column space is the comap, yet its dimension would
be at most (1/2+eta_new) times itself.

Exact C gives d(H-L-E)≤n(H-S+L)+2delta+(d-n)U, hence
n(S-2L)≤(d-n)(L+U-H)+dE+2delta.
By native scale inequalities, q≥2, E≤L, -H≤b² x^99 and
W=L+U+b² x^99 ≤ q L. The last comparison uses lower exponent
log(q L)≥(5/2)log b +12 log x +4 log(log b) from native f,a;
upper terms W have b-exponent at most 2 with x1² and x^99 overhead,
absorbed by scale 10^6 log x≤log x1 and 10^6 log x1≤log b.
The E term has only powers of x, no b. L itself has b-exponent 1.
Thus (d-n)(L+U-H)≤(d/q)(qL)=dL; n≥d/2>0.
Put J=10 log(1+b²)B. Then
n(S-2L)≤d(2L+J)≤2n(2L+J),
so S≤6L+2J≤logB² B (same native scale calculus).
This is the original star conclusion with weaker conditional B precision.
Allowed rank deficit relative to old: (1/q)/(4/b²)=sqrt(b)/4;
same ratio for additive spread error. This is a tolerance improvement,
not a speedup or an unconditional proof of the weaker spread.
Do not infer that every previous intermediate B1/B2/B3 error budget can
be relaxed by that ratio: trace each exact normalized caller first.

Actual execution: local Python/SymPy expanded the C-to-signed-cost
difference to exactly 0 and simplified the tolerance ratio to sqrt(b)/4.
No lean/lake on local PATH. Source anchors retrieved and native general
eta theorem read. No new native graph, rh_scan/prune/reduce/auto/frontier
or axiom execution. State branch A1 RUN71 actual error receipt
run 46114460776, run71.json blob e804506c3f6bab967b5bf5a8ce1cffbf07c8bb98,
a1/a1_transport.log 7eeabea8b131893ee29b5749f37e251179da01b0:
cache verified, actual matrix/set and HasType elaboration failed.
RUN99 count, C2 path repair, B3 layout, A2 leaf and C1 cache statuses
returned 404; not evidence of failure or success. Preserve all prior
graphs, old rank threshold and all A/B/C and audit obligations.
No claimed RH theorem imported.

RESUME HERE: after C2ExactReciprocalBudget native receipt, compile this
module as IntegrationWeakSpreadStar in the retained compact workspace,
including the exact native scale comparisons and all three axiom/edge
guards; then transport the weaker eta into the actual B3 Fits caller
without changing its normalizations. This is a new sufficient B supplier
target, not a completed supplier. HANDOFF integration/B3/kernel/audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Finset LinearMap Real Submodule LevelPlaces.LevelForm Module Filling

namespace RHIntegrationWeakSpread

variable {P} (D : Data P)

noncomputable def slackScale : ℝ := D.b * Real.sqrt D.b

noncomputable def weakEta : ℝ := (4 * slackScale D)⁻¹

theorem enough_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    0 < finrank ℂ D.Column ∧ 0 < D.rowDim ∧
      ∃ t, #t * finrank ℂ D.Column ≤ 5 * D.rowDim * log (1 + D.b ^ 2) ∧
        (1 - 1 / slackScale D) * D.rowDim ≤
        finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) := by
  have := D.columnCoords.nontrivial
  have hq : (2 : ℝ) ≤ slackScale D := by
    unfold slackScale
    exact D.le_of_hasLogBound
  have hqpos : 0 < slackScale D := by linarith
  have he : 0 < weakEta D := by
    unfold weakEta
    positivity
  have hehalf : weakEta D < 1/2 := by
    unfold weakEta slackScale
    exact D.lt_of_hasLogBound
  have hqb : 4 * slackScale D ≤ D.b ^ 2 := by
    unfold slackScale
    exact D.le_of_hasLogBound
  have heq : 4 * weakEta D = 1 / slackScale D := by
    unfold weakEta
    field_simp [ne_of_gt hqpos] <;> ring
  have hlog : log (1 + (weakEta D)⁻¹) ≤ log (1 + D.b ^ 2) := by
    unfold weakEta
    rw [inv_inv]
    exact Real.log_le_log (by positivity) (by linarith)
  have hr : finrank ℂ D.rows ≠ 0 := by
    intro hz
    obtain ⟨s, h⟩ := hs 1 ⊤
    have hv : (0 : ℝ) < finrank ℂ D.Column := by
      exact_mod_cast (finrank_pos : 0 < finrank ℂ D.Column)
    simp [finrank_top, hz] at h
    nlinarith only [h, mul_pos (show 0 < 1/2 - weakEta D by linarith) hv]
  refine ⟨finrank_pos, hr.pos, (exists_few_translates (W := D.rows) he (hs _)).imp fun t h ↦ ?_⟩
  refine ⟨h.1.trans (mul_le_mul_of_nonneg_left hlog (by positivity)), ?_⟩
  rw [heq] at h
  exact h.2.trans (mod_cast finrank_mono (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))

theorem family_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    ∃ n, ∃ y : Fin n → D.rows, LinearIndependent ℂ y ∧
      (1 - 1 / slackScale D) * D.rowDim ≤ n ∧
      (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧
      ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤
        exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms, enough_of_weak_spread D hs
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

theorem star_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget := by
  obtain ⟨n,y,i,big,⟨δ,index,I⟩,short⟩ := family_of_weak_spread D hs
  let d : ℝ := D.rowDim
  let q := slackScale D
  let H := D.mainHeight
  let L := D.logB * D.budget
  let E := (D.m : ℝ)^2 * D.t * D.x^999
  let U := D.x₁^2 * D.b^2 + D.x^99 + 4*E
  let S := (D.m : ℝ)*D.remainder
  let J := 10*log (1+D.b^2)*D.budget
  have hd : 0 < d := by exact_mod_cast (enough_of_weak_spread D hs).2.1
  have hq : 2 ≤ q := by
    dsimp [q, slackScale]
    exact D.le_of_hasLogBound
  have hqp : 0 < q := by linarith
  have hL : 0 < L := HasLogBound.pos D
  have hJ : 0 ≤ J := by
    dsimp [J]
    exact mul_nonneg (mul_nonneg (by norm_num) (log_nonneg (by nlinarith))) (HasLogBound.pos D).le
  have hE : E ≤ L := by
    dsimp [E,L]
    exact D.le_of_hasLogBound
  have hH : -H ≤ D.b^2*D.x^99 := by
    have h := D.abs_mainHeight_add_remainder_le
    have hm : (0 : ℝ) ≤ D.m := by positivity
    dsimp [H]
    linarith only [h, neg_le_abs D.mainHeight, mul_nonneg hm (abs_nonneg D.remainder)]
  have hW : L+U+D.b^2*D.x^99 ≤ q*L := by
    dsimp [q,slackScale,L,U,E]
    exact D.le_of_hasLogBound
  have hg0 : 0 ≤ d - (n : ℝ) := sub_nonneg.2 (mod_cast Fintype.card_fin n ▸
    i.fintype_card_le_finrank : (n : ℝ) ≤ D.rowDim)
  have hg : d - (n : ℝ) ≤ d/q := by
    change (1-1/q)*d ≤ (n : ℝ) at big
    nlinarith only [big]
  have hh : d/q ≤ d/2 := (div_le_iff₀ hqp).2 (by
    have h := mul_le_mul_of_nonneg_left hq (show 0 ≤ d/2 by positivity)
    nlinarith only [h])
  have hn : 0 < (n : ℝ) := by linarith [hg.trans hh]
  have hprod : (d-(n : ℝ))*(L+U-H) ≤ d*L := calc
    _ ≤ (d-(n : ℝ))*(q*L) := mul_le_mul_of_nonneg_left (by linarith only [hH,hW]) hg0
    _ ≤ (d/q)*(q*L) := mul_le_mul_of_nonneg_right hg (by positivity)
    _ = _ := by field_simp [ne_of_gt hqp] <;> ring
  have hidx : 2*δ ≤ d*J := by
    change δ ≤ 5*d*log (1+D.b^2)*D.budget at index
    dsimp [J]
    nlinarith only [index]
  have hC := Data.run96_integral_forms_long_exact_reciprocal i I short
  change d*(H-L-E) ≤ (n : ℝ)*(H-S+L)+2*δ+(d-(n : ℝ))*U at hC
  have hcost : (n : ℝ)*(S-2*L) ≤ d*(2*L+J) := by
    nlinarith only [hC,hprod,hidx,mul_le_mul_of_nonneg_left hE hd.le]
  have hdn : d ≤ 2*(n : ℝ) := by linarith [hg.trans hh]
  have hcost' := hcost.trans (mul_le_mul_of_nonneg_right hdn (show 0 ≤ 2*L+J by positivity))
  have hS : S ≤ 6*L+2*J := le_of_mul_le_mul_left (by nlinarith only [hcost']) hn
  exact hS.trans (by dsimp [L,J]; exact D.le_of_hasLogBound)

end RHIntegrationWeakSpread

#print axioms RHIntegrationWeakSpread.enough_of_weak_spread
#print axioms RHIntegrationWeakSpread.family_of_weak_spread
#print axioms RHIntegrationWeakSpread.star_of_weak_spread

open Lean in
run_cmd do
  for (n, req, forbid) in #[
    (``RHIntegrationWeakSpread.enough_of_weak_spread,
      #[``exists_few_translates], #[``Data.enough_forms,``Data.finrank_rows_ne_zero,``Data.ramifiedColumns_fill_rows]),
    (``RHIntegrationWeakSpread.family_of_weak_spread,
      #[``Data.short_forms,``RHIntegrationWeakSpread.enough_of_weak_spread],
      #[``Data.exists_family_covolumeSq_le,``Data.enough_forms]),
    (``RHIntegrationWeakSpread.star_of_weak_spread,
      #[``RHIntegrationWeakSpread.family_of_weak_spread,``Data.run96_integral_forms_long_exact_reciprocal],
      #[``Data.integral_forms_long,``Data.exists_family_covolumeSq_le,``Data.finrank_rows_ne_zero])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "WEAK_SPREAD unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing value {n}"
    let deps := v.getUsedConstants
    unless req.all (fun a => deps.contains a) && forbid.all (fun a => !deps.contains a) do
      throwError "WEAK_SPREAD wrong direct dependencies {n}"
  logInfo "INTEGRATION_WEAK_SPREAD_GUARDS_OK"
