import New.Endgame.LongForms
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option pp.fullNames true
set_option debug.skipKernelTC false
set_option maxHeartbeats 4000000

/-!
# 27 November 2026 — adaptive spread-to-star caller audit
AGREE / PARTIAL. Source-matched mathematical derivation and prepared Lean;
not compiled. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, SWARM, AGENTS,
HANDOFF, continuity/state/log/protocol. Read previous audit 4215e7c
and peer 4f5a2082, 440d4d62, dbcfaee8, current active B2 record.
Do not duplicate the ongoing B2 graph replay.

Actual source anchors (all five immutable blob checks and all fifteen
substring checks executed through GitHub fetch_file, not kernel):
New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6:
  exists_few_translates, Real.log (1 + η⁻¹), (1 - 4 * η)
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:
  ramifiedColumns_fill_rows, finrank_rows_ne_zero, D.ramifiedColumns_fill_rows 1
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  short_forms, enough_forms, D.ramifiedColumns_fill_rows _
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
  exists_family_covolumeSq_le, D.short_forms, D.enough_forms, exists_fun_fin_finrank_span_eq
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
  star_inequality, D.finrank_rows_ne_zero.pos, integral_forms_long i big I short

New contribution: connect the signed criterion of 4215e7c to the
actual generic translate selector rather than a fixed eta. Let
d=rowDim, n=card y, B=budget, H=mainHeight, R=m*remainder,
L=logB*B, S=logB^2*B, K=exact completion cost from 82213351.
Put A=S+K-H-L. The previous J is EXACTLY
  (d-n) A + 2 delta <= d(S-3L).
For arbitrary 0<eta<1/4, the native generic exists_few_translates
gives the SAME-family n >= (1-4eta)d and delta <= 5d log(1+1/eta)B.
It therefore suffices to check ONE joint payment:
  4eta max(A,0) + 10 B log(1+1/eta) <= S-3L.       (P)
This is a parameter-dependent sufficient budget, not a new moment
estimate. It does not require H>=0, a fixed b-power for eta, or a
separate crude completion <= dL. Retain the SAME data D and all
A short-column/index and C determinant/reciprocal height premises.
Proof: because 0<=d-n<=4eta d, multiply by max(A,0), bound the
index from the very same translate set, and use (P). Thus J holds;
combine with exact C, expand and cancel H before dividing by n>0.
The supplied positive row dimension plus eta<1/4 ensures n>0.

Specific dependency trap: the original native finrank_rows_ne_zero
itself calls the old sharp ramifiedColumns_fill_rows at c=1, F=top.
One cannot use it to justify the relaxed B4 caller and claim removal
of the sharp spread supplier. Positive row dimension is explicit
in the candidate below; independently it follows from the relaxed
spread itself: if d=0, F=top gives v <= (1/2+eta)v with v>0
from D.columnCoords.nontrivial, contradiction. Thus no old sharp
spread is needed for THIS logical step. The exact C argument is
an explicit parameter for serial integration with the 4215e7c
certificate. Do not use the original Main or integral_forms_long.

Actual negative control executed with exact small integer JS:
d=n=1,H=7,R=3,L=1,K=S=J=0, eta=1/8, A=-8.
C holds (5=5), unsafe P replacing max(A,0) by A holds (-4<=-3),
but R>S; correct P fails (0<=-3 false). Hence clipping the
signed coefficient is essential; using upper deficit bound
with a negative coefficient reverses the inequality.
No repeated scalar sweep claimed. Reproduce by the numbers above.

Local command -v lean/lake returned no paths; no new Lean kernel
or rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier execution.
Old-pin CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 were fetched and
confirmed PASS for their stated restricted baseline only.
Current shared compact run 46006832164 status blob
9459c0acbb3e68b78e7f46ebb36a45a25ee7647d reports ERROR overall
(returncode 1) although b2_build, active_b2_energy (7 declarations),
original_callers exit 0 and negative_missing_projector_guard exit 1
as expected. The requested full graph is NOT accepted. Do not
infer PASS from workflow job success. No changes to jobs or schedules.

Original local graph:
star -> exists_family_covolumeSq_le -> short_forms,enough_forms
     -> enough_forms -> exists_few_translates, sharp spread
     -> finrank_rows_ne_zero -> sharp spread
star -> integral_forms_long -> rank-restricted heightLe_volume_rows.
Candidate local graph:
audit_star_of_adaptive_spread -> audit_family_of_adaptive_spread
  -> short_forms, exists_few_translates, explicit relaxed spread
  -> audit scalar payment, explicit positive dimension, exact C.
These are source-level edges, not recursive kernel evidence.
All previous graphs/axiom receipts untouched. Transitive use of old
suppliers in other retained proofs not ruled out. No root closure.

RESUME HERE: replay this file together with 4215e7c in the shared
compact workspace, supplying Data.audit_integral_forms_long_exact
as C; inspect all axiom and direct guards, then inspect the
constructor-inclusive graph for any remaining sharp-spread path.
HANDOFF TO: integration/B4/kernel. Missing mathematics: actual
relaxed spread/moment and remaining A/C primitives; native
replacement verification pending. RH remains OPEN.
-/

open Finset LinearMap Real Submodule LevelPlaces.LevelForm Module

namespace RHAdaptiveBudgetAudit

theorem payment {d n H R L K δ S J η : ℝ}
    (hd : 0 < d) (hn : 0 < n) (hnd : n ≤ d)
    (hmiss : d-n ≤ 4*η*d) (hidx : δ ≤ d*J)
    (hC : d*(H-2*L) ≤ n*(H-R+L)+2*δ+(d-n)*K)
    (hpay : 4*η*max (S+K-H-L) 0+2*J ≤ S-3*L) : R ≤ S := by
  have hm : (d-n)*(S+K-H-L) ≤ 4*η*d*max (S+K-H-L) 0 :=
    (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr hnd)).trans
      (mul_le_mul_of_nonneg_right hmiss (le_max_right _ _))
  have hp := mul_le_mul_of_nonneg_left hpay hd.le
  have hj : (d-n)*(S+K-H-L)+2*δ ≤ d*(S-3*L) := by
    nlinarith only [hm, hp, hidx]
  have hr : n*R ≤ n*S := by nlinarith only [hC, hj]
  exact le_of_mul_le_mul_left hr hn

-- Reject the erroneous signed upper-deficit substitution.
example : (4 : ℝ)*(1/8)*(-8)+2*0 ≤ 0-3*1 := by norm_num
example : ¬ ((4 : ℝ)*(1/8)*max (-8) 0+2*0 ≤ 0-3*1) := by norm_num

end RHAdaptiveBudgetAudit

variable {P} (D : Data P)

/-- Same native short-family construction, with a general spread parameter
and without invoking the original fixed-precision enough_forms. -/
lemma Data.audit_family_of_adaptive_spread {η : ℝ} (hη : 0 < η)
    (spread : ∀ c : ℂˣ,
      IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
        (c.1 • D.ramifyingOp .univ)) η) :
    ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
      (1-4*η)*D.rowDim ≤ n ∧
      (∃ δ ≤ 5*D.rowDim*log (1+η⁻¹)*D.budget, D.IndexLe y δ) ∧
      ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤
        exp (n*(D.mainHeight-D.m*D.remainder+D.logB*D.budget)) := by
  have := D.columnCoords.nontrivial
  have enough : ∃ t, #t * finrank ℂ D.Column ≤
      5 * D.rowDim * log (1 + η⁻¹) ∧
      (1-4*η)*D.rowDim ≤ finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) :=
    (exists_few_translates (W := D.rows) hη (spread _)).imp fun _ ↦
      .imp (by simp) (·.trans (mod_cast finrank_mono
        (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, t, ht, big⟩ :=
    D.short_forms, enough
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht
    (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

noncomputable def Data.auditAdaptiveCost : ℝ :=
  D.x₁^2*D.b^2+D.x^99+4*(D.m : ℝ)^2*D.t*D.x^999

/-- Actual star conclusion with a generic spread supplier and exact C.
The positive dimension is deliberately explicit, not a call to
finrank_rows_ne_zero (which would reintroduce the sharp spread). -/
lemma Data.audit_star_of_adaptive_spread {η : ℝ} (hη : 0 < η)
    (hη4 : η < 1/4) (hd : 0 < (D.rowDim : ℝ))
    (spread : ∀ c : ℂˣ,
      IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
        (c.1 • D.ramifyingOp .univ)) η)
    (C : ∀ {n : ℕ} {y : Fin n → D.rows} {δ V : ℝ},
      LinearIndependent ℂ y → D.IndexLe y δ →
      (∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V) →
      D.rowDim*(D.mainHeight-2*(D.logB*D.budget)) ≤
        V+2*δ+((D.rowDim : ℝ)-(n : ℝ))*D.auditAdaptiveCost)
    (pay : 4*η*max (D.logB^2*D.budget+D.auditAdaptiveCost-
        D.mainHeight-D.logB*D.budget) 0+
      10*D.budget*log (1+η⁻¹) ≤ D.logB^2*D.budget-3*(D.logB*D.budget)) :
    D.m*D.remainder ≤ D.logB^2*D.budget := by
  obtain ⟨n,y,i,big,⟨δ,index,I⟩,short⟩ :=
    D.audit_family_of_adaptive_spread hη spread
  have hcoef : 0 < 1-4*η := by linarith
  have hn : (0 : ℝ) < n := (mul_pos hcoef hd).trans_le big
  have hnd : (n : ℝ) ≤ D.rowDim := mod_cast
    Fintype.card_fin n ▸ i.fintype_card_le_finrank
  have hmiss : (D.rowDim : ℝ)-n ≤ 4*η*D.rowDim := by nlinarith only [big]
  have hidx : δ ≤ (D.rowDim : ℝ)*(5*log (1+η⁻¹)*D.budget) := by
    convert index using 1 <;> ring
  have hpay : 4*η*max (D.logB^2*D.budget+D.auditAdaptiveCost-
      D.mainHeight-D.logB*D.budget) 0+2*(5*log (1+η⁻¹)*D.budget) ≤
        D.logB^2*D.budget-3*(D.logB*D.budget) := by
    convert pay using 1 <;> ring
  exact RHAdaptiveBudgetAudit.payment hd hn hnd hmiss hidx (C i I short) hpay

#print axioms RHAdaptiveBudgetAudit.payment
#print axioms Data.audit_family_of_adaptive_spread
#print axioms Data.audit_star_of_adaptive_spread

run_cmd do
  for nm in #[``Data.audit_family_of_adaptive_spread,
      ``Data.audit_star_of_adaptive_spread] do
    let info ← Lean.getConstInfo nm
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "Missing proof value"
    let deps := value.getUsedConstants
    for forbidden in #[``Data.finrank_rows_ne_zero, ``Data.enough_forms,
        ``Data.ramifiedColumns_fill_rows, ``Data.integral_forms_long,
        ``Data.exists_family_covolumeSq_le] do
      if deps.contains forbidden then
        Lean.throwError "Old sharp-spread/rank supplier called directly"
    if nm == ``Data.audit_family_of_adaptive_spread then
      for expected in #[``Data.short_forms, ``exists_few_translates] do
        unless deps.contains expected do Lean.throwError "Missing native supplier"
    else
      for expected in #[``Data.audit_family_of_adaptive_spread,
          ``RHAdaptiveBudgetAudit.payment] do
        unless deps.contains expected do Lean.throwError "Missing adaptive supplier"
  Lean.logInfo "Adaptive caller direct dependency guard (not recursive graph)"
