import C2ExactReciprocalBudget
import IntegrationSignedCostEnvelope
import IntegrationGuardedFinitePower
import Lean

/-!
RUN97 acceleration — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read live mission/spine/ledger, SWARM/HANDOFF/EXPANSION/AGENTS and latest
peers including c87d7363, 9ccb174e and 5c8c0ef5. Reuse the new exact
reciprocal C supplier rather than duplicate its proof.

Source stages: C2ExactReciprocalBudget =
specialists/character_boxes/RUN96_COMPACT_C2_EXACT_RECIPROCAL_BUDGET.lean
(commit c87d736324f841644dd83ea7bbc3050b64596f4d);
IntegrationSignedCostEnvelope = integration/2026-11-28_SIGNED_MEASURABLE_COST_ENVELOPE.lean;
IntegrationGuardedFinitePower = integration/2026-11-28_GUARDED_FINITE_POWER_ENDPOINT.lean.
Original RUN95 (575f1cad) and RUN96 (e7fba27b) retained; no old pin
verification transferred. Native LongForms.lean blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05.

New actual signed-mean junction: E(u)=m² t x^999 is allowed to vary
along the measured fiber. Let U=x1² b²+x^99+4E, S=m*remainder.
Use the peer exact reciprocal theorem on the SAME y, index, volume:
  d(H-L-E)<=n(H-S+L)+2delta+(d-n)U.
Cancel H before bounding:
  n(S-2L) <= (d-n)(L+U-H)+dE+2delta.
Require ONE integrable weighted envelope M dominating that entire
right-hand side divided by n>0. No separate integrability or constancy
of E, no measurable choice of y, n, H, delta. Require fixed L, positive
normalization, polar/remainder identity and signed integral(wM)
<= (K-2L) integral(w). Retain all original local index and volume
premises. Compare complete pointwise caps, not isolated terms:
  old_cap-new_cap = (d/n)(L-E).
This is nonnegative if E<=L, strict if E<L; no assertion of uniform
improvement without that scale guard, and no absolute height bound.
For n=d the entire missing-rank cost vanishes, but E remains and
the cap is 2L+E+2delta/d. Omitting E would be invalid.

Reuse the existing signed endpoint with scalar arguments
L'=L/2, H'=H+L/2-E, delta'=delta+((d-n)U+nE)/2.
The transformed volume and cost inequalities are EXACT. delta' is
only a scalar argument, not a new IndexLe witness. No assumption of
nonnegative H,M or E needed for the implication. Reuse finite_power_scalar
unchanged, retaining every fixed-before-limit scale hypothesis.
This permits actual varying reciprocal cost without moving it outside
the integral. It does not construct the arithmetic envelope or its
weighted bound, or prove the count-escape premise.

Executed in connector: 10 unique anchors checked, 20 damaged
controls rejected; 12636 exact BigInt scalar transport/cap comparisons,
2808 strict E<L comparisons (scalar, not native admissible Data).
CI run 46108846902 job 140867652611 was actually queried: in_progress,
no accepted new receipt. No native rh_scan/prune/reduce/auto/frontier
or new recursive graph replay; original graphs retained.
No claimed RH theorem imported or used.

RESUME HERE: compile C2ExactReciprocalBudget, IntegrationSignedCostEnvelope
and IntegrationGuardedFinitePower in the retained authenticated workspace,
then this module as Run97VariableReciprocalCost; require both axiom
reports and direct guards, plus constructor-inclusive graphs for the
two new roots and old RUN96 counterparts. Preserve first real diagnostic
on failure; no duplicate cold build. HANDOFF integration/editor/audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Finset LinearMap Real Submodule LevelPlaces.LevelForm MeasureTheory

namespace RHAcceleration97

theorem exact_reciprocal_variable_cost_endpoint {α : Type*} [MeasurableSpace α]
    {P} (D : α → Data P) (μ : Measure α)
    (w Q M : α → ℝ) (C A L K e : ℝ)
    (hC : 0 < C) (hW : 0 < ∫ u, w u ∂μ)
    (hw0 : ∀ᵐ u ∂μ, 0 ≤ w u)
    (hw : Integrable w μ)
    (hQ : Integrable (fun u => w u * Q u) μ)
    (hM : Integrable (fun u => w u * M u) μ)
    (hid : ∀ᵐ u ∂μ, (D u).m * (D u).remainder + C*Q u = C*A)
    (hL : ∀ᵐ u ∂μ, (D u).logB * (D u).budget = L)
    (hfamily : ∀ᵐ u ∂μ, ∃ (n : ℕ) (y : Fin n → (D u).rows) (δ : ℝ),
      0 < n ∧ LinearIndependent ℂ y ∧ (D u).IndexLe y δ ∧
      (∀ σ, covolumeSq ((D u).Θ 1 ∘ y) σ ≤ exp
        (n * ((D u).mainHeight - (D u).m * (D u).remainder +
          (D u).logB * (D u).budget))) ∧
      (((D u).rowDim : ℝ) - (n : ℝ)) *
        (L + ((D u).x₁ ^ 2 * (D u).b ^ 2 + (D u).x ^ 99 +
          4 * ((D u).m : ℝ) ^ 2 * (D u).t * (D u).x ^ 999) -
          (D u).mainHeight) + (D u).rowDim *
          (((D u).m : ℝ)^2 * (D u).t * (D u).x^999) + 2*δ ≤ (n : ℝ)*M u)
    (hcost : (∫ u, w u*M u ∂μ) ≤ (K-2*L)*(∫ u, w u ∂μ))
    (hpolar : (∫ u, w u*Q u ∂μ) ≤ e*(∫ u, w u ∂μ)) :
    C*A ≤ K+C*e := by
  refine RHIntegration96.endpoint_of_signed_envelope μ w
    (fun u => (D u).m * (D u).remainder) Q M C A (L/2) K e
    hC hW hw0 hw hQ hM hid ?_ ?_ hpolar
  · filter_upwards [hfamily,hL] with u hf hl
    rcases hf with ⟨n,y,δ,hn,hi,hI,hV,hcostu⟩
    have hlong := Data.run96_integral_forms_long_exact_reciprocal hi hI hV
    rw [hl] at hlong
    let d : ℝ := (D u).rowDim
    let H := (D u).mainHeight
    let U := (D u).x₁ ^ 2 * (D u).b ^ 2 + (D u).x ^ 99 +
      4 * ((D u).m : ℝ) ^ 2 * (D u).t * (D u).x ^ 999
    let E : ℝ := ((D u).m : ℝ)^2 * (D u).t * (D u).x^999
    have hnR : 0 < (n : ℝ) := by exact_mod_cast hn
    change d*(H-L-E) ≤ (n : ℝ)*(H-(D u).m*(D u).remainder+L) +
      2*δ+(d-n)*U at hlong
    change (d-n)*(L+U-H)+d*E+2*δ ≤ (n : ℝ)*M u at hcostu
    refine ⟨d,(n : ℝ),H+L/2-E,δ+((d-n)*U+n*E)/2,hnR,?_,?_⟩
    · nlinarith only [hlong]
    · nlinarith only [hcostu]
  · have heq : K-4*(L/2) = K-2*L := by ring
    simpa only [heq] using hcost


theorem finite_power_variable_reciprocal_endpoint {α : Type*} [MeasurableSpace α]
    {P} (D : α → Data P) (μ : Measure α)
    (w Q M : α → ℝ) (C A L K e : ℝ)
    (hC : 0 < C) (hW : 0 < ∫ u, w u ∂μ)
    (hw0 : ∀ᵐ u ∂μ, 0 ≤ w u)
    (hw : Integrable w μ)
    (hQ : Integrable (fun u => w u * Q u) μ)
    (hM : Integrable (fun u => w u * M u) μ)
    (hid : ∀ᵐ u ∂μ, (D u).m * (D u).remainder + C*Q u = C*A)
    (hL : ∀ᵐ u ∂μ, (D u).logB * (D u).budget = L)
    (hfamily : ∀ᵐ u ∂μ, ∃ (n : ℕ) (y : Fin n → (D u).rows) (δ : ℝ),
      0 < n ∧ LinearIndependent ℂ y ∧ (D u).IndexLe y δ ∧
      (∀ σ, covolumeSq ((D u).Θ 1 ∘ y) σ ≤ exp
        (n * ((D u).mainHeight - (D u).m * (D u).remainder +
          (D u).logB * (D u).budget))) ∧
      (((D u).rowDim : ℝ) - (n : ℝ)) *
        (L + ((D u).x₁ ^ 2 * (D u).b ^ 2 + (D u).x ^ 99 +
          4 * ((D u).m : ℝ) ^ 2 * (D u).t * (D u).x ^ 999) -
          (D u).mainHeight) + (D u).rowDim *
          (((D u).m : ℝ)^2 * (D u).t * (D u).x^999) + 2*δ ≤ (n : ℝ)*M u)
    (hcost : (∫ u, w u*M u ∂μ) ≤ (K-2*L)*(∫ u, w u ∂μ))
    (hpolar : (∫ u, w u*Q u ∂μ) ≤ e*(∫ u, w u ∂μ)) :
    (m a Hthick T F B phi c eta eps X : ℝ) (k : ℕ)
    (hm : 0 < m) (ha : 0 < a) (hH : 0 < Hthick) (hB : 0 < B)
    (hphi : 0 ≤ phi) (hc : 0 ≤ c) (heta : 0 < eta) (hX : 0 ≤ X)
    (hCscale : C = m*a*Hthick) (hf : F = T*phi) (hthick : T/B ≤ Hthick)
    (hmlo : exp (X/2) ≤ m) (hlog : log B = eps*X)
    (hslack : ((k : ℝ)+1)*eps ≤ eta)
    (hK : K ≤ c*F*a*B^k) (he : e ≤ exp (-(1e6*X)))
    (habsorb : log (c*phi+1) ≤ 7*eta*X) :
    A ≤ exp (X*(8*eta+2⁻¹-1)) := by
  have hmean := exact_reciprocal_variable_cost_endpoint D μ w Q M C A L K e
    hC hW hw0 hw hQ hM hid hL hfamily hcost hpolar
  have hnorm : A ≤ K/m/a/Hthick+e := by
    apply le_of_mul_le_mul_left _ hC
    calc
      C*A ≤ K+C*e := hmean
      _ = C*(K/m/a/Hthick+e) := by
        rw [hCscale]
        field_simp [ne_of_gt hm, ne_of_gt ha, ne_of_gt hH] <;> ring
  exact hnorm.trans (RHIntegration97.finite_power_scalar K e m a Hthick T F B phi c eta eps X k
    hm ha hH hB hphi hc heta hX hf hthick hmlo hlog hslack hK he habsorb)


end RHAcceleration97

#print axioms RHAcceleration97.exact_reciprocal_variable_cost_endpoint
#print axioms RHAcceleration97.finite_power_variable_reciprocal_endpoint

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHAcceleration97.exact_reciprocal_variable_cost_endpoint,
        #[``Data.run96_integral_forms_long_exact_reciprocal,
          ``RHIntegration96.endpoint_of_signed_envelope]),
      (``RHAcceleration97.finite_power_variable_reciprocal_endpoint,
        #[``RHAcceleration97.exact_reciprocal_variable_cost_endpoint,
          ``RHIntegration97.finite_power_scalar])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN97 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN97 missing proof {n}"
    let deps := v.getUsedConstants
    unless req.all (fun a => deps.contains a) do
      throwError "RUN97 missing direct supplier {n}"
    for a in #[``Data.integral_forms_long, ``Data.audit_integral_forms_long_exact] do
      if deps.contains a then throwError "RUN97 stale direct supplier {a}"
  logInfo "RUN97_VARIABLE_RECIPROCAL_COST_GUARDS_OK"
