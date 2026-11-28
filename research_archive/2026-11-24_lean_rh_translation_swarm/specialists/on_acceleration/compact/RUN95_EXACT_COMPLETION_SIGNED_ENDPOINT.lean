import AuditExactCompletion
import IntegrationSignedCostEnvelope
import Lean

/-!
RUN95 acceleration — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and current peer work.
Integration 8cab66c3 notes native C still demands near-full rank;
do NOT use the rounded C theorem with low rank. Existing audit
82213351 already prepares the actual rank-free C replacement;
do not redo it. This file joins that replacement to the latest
signed measurable-envelope endpoint, at native Data and IndexLe.

Inputs to stage in the retained compact workspace:
AuditExactCompletion = audit/2026-11-27_C_EXACT_COMPLETION_CALLER_AUDIT.lean
  blob 3246d8ef051ac8d138be5fc3649af1cb8132ea1a
IntegrationSignedCostEnvelope = integration/2026-11-28_SIGNED_MEASURABLE_COST_ENVELOPE.lean
  blob 37fa94ede6897fc423c49f0008f5973edffa506f
  imports Run94MeanNormalizedRankBudget (previous acceleration file).
EditorPolarMean candidate d6c08ec8cd4c003f4f3c4da6ae9d807e146a7dad
is a separate prerequisite for actual polar-window application, not
imported by this module. All these new modules still require native replay.

Exact C source: LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05,
OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6,
CrudeRows.lean e84f4b0e67ed7dbfd727f8ec2dbf05a8d1e5440c,
CostsSquares.lean 3842be43cd82966d3398d9929f72dd7667a62f4d.
Use audit's exact completion cost U=x1^2*b^2+x^99+4*m^2*t*x^999,
INCLUDING the goodProjTranslate norm cost x^99 (omitted in the
historical editor 05bb424d note). Same actual y, integral index I,
all-conjugate volume, fit twists and nonvanishing witness remain.

New caller-level junction:
For a.e. u let d=rowDim, n>0 be the rank of one actual family,
H=mainHeight, S=m*remainder, L=logB*budget (fixed across the fiber).
Let M be an integrable signed cost envelope. Require the actual
A/B family with V=n(H-S+L) and the single local cost inequality
  (d-n)(2L+U-H)+2delta <= n M(u).
The exact audit C gives
  d(H-2L) <= n(H-S+L)+2delta+(d-n)U.
Cancel H BEFORE any absolute bounds or averaging:
  S <= 3L+M(u).
This allows the weighted budget integral(wM) <= (K-3L) integral(w)
rather than K-4L in the rounded route, but M includes the completion
cost U; no general strict improvement over all prior premises claimed.
No rank threshold at the C interface, no measurable witness choice,
no independent rank-weighted polar average, no dropped index or volume
conditions. The local witnesses may vary with u.

Reuse the already prepared integration endpoint exactly via
  L'=3L/4, H'=H+L/4, delta'=delta+(d-n)U/2.
Then d(H'-3L')=d(H-2L),
n(H'-S+L')+2delta'=n(H-S+L)+2delta+(d-n)U, and
(d-n)(3L'-H')+2delta'=(d-n)(2L+U-H)+2delta.
The adjusted delta' is ONLY a scalar argument to the endpoint;
never assert IndexLe y delta' or choose a new p-adic witness.
K-4L'=K-3L. This reuses its remainder identity and integrability
argument verbatim; no redundant measure-theoretic proof.

Open: construct such same-witness A/B families and the signed cost
envelope with its integral estimate; prove the native mean theorem
and connect the fixed fiber / remainder identity / scale comparison.
Even the older pointwise arithmetic premise is not proved. Do not
claim RH, improved runtime, or global deletion of B3/B4/C leaves.
Original graphs and failed routes are retained.

Executed here: authenticated three peer blobs and seven source
anchors, inspected pinned native determinant, crude rows, costs,
norm projection, covolume and actual IndexLe/Theta interfaces.
Local Python SymPy expanded the exact volume residual, cost residual
and mean budget residual independently; all three identically zero.
No local lean/lake/elan. No new native rh_scan/prune/reduce/auto/frontier
or graph replay. Existing RUN95 endpoint receipt b58fac802d12d1f3313fe5dc65ab06520577b841
retrieved; arithmetic_premise_proved=false and full_RH_replay=false.
C2 squared cache status path still 404; this file is not in that receipt.

RESUME HERE: stage and kernel-compile AuditExactCompletion in the
authenticated retained LongForms workspace, then compile this junction
after IntegrationSignedCostEnvelope. Audit both old/new C roots and
this actual Data caller with strict constructor-inclusive graphs,
standard axioms and absence of rounded C/claimed RH. Preserve actual
first diagnostic if replay fails; do not rebuild or repeat scalar checks.
HANDOFF TO audit / integration / editor / character boxes. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Finset LinearMap Real Submodule LevelPlaces.LevelForm
open MeasureTheory

namespace RHAcceleration95

theorem exact_completion_endpoint {α : Type*} [MeasurableSpace α]
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
        (2*L + ((D u).x₁ ^ 2 * (D u).b ^ 2 + (D u).x ^ 99 +
          4 * ((D u).m : ℝ) ^ 2 * (D u).t * (D u).x ^ 999) -
          (D u).mainHeight) + 2*δ ≤ (n : ℝ)*M u)
    (hcost : (∫ u, w u*M u ∂μ) ≤ (K-3*L)*(∫ u, w u ∂μ))
    (hpolar : (∫ u, w u*Q u ∂μ) ≤ e*(∫ u, w u ∂μ)) :
    C*A ≤ K+C*e := by
  refine RHIntegration96.endpoint_of_signed_envelope μ w
    (fun u => (D u).m * (D u).remainder) Q M C A (3*L/4) K e
    hC hW hw0 hw hQ hM hid ?_ ?_ hpolar
  · filter_upwards [hfamily,hL] with u hf hl
    rcases hf with ⟨n,y,δ,hn,hi,hI,hV,hcostu⟩
    have hlong := Data.audit_integral_forms_long_exact hi hI hV
    rw [hl] at hlong
    let d : ℝ := (D u).rowDim
    let H := (D u).mainHeight
    let U := (D u).x₁ ^ 2 * (D u).b ^ 2 + (D u).x ^ 99 +
      4 * ((D u).m : ℝ) ^ 2 * (D u).t * (D u).x ^ 999
    have hnR : 0 < (n : ℝ) := by exact_mod_cast hn
    change d*(H-2*L) ≤ (n : ℝ)*(H-(D u).m*(D u).remainder+L) +
      2*δ+(d-n)*U at hlong
    change (d-n)*(2*L+U-H)+2*δ ≤ (n : ℝ)*M u at hcostu
    refine ⟨d,(n : ℝ),H+L/4,δ+(d-n)*U/2,hnR,?_,?_⟩
    · nlinarith only [hlong]
    · nlinarith only [hcostu]
  · have heq : K-4*(3*L/4) = K-3*L := by ring
    simpa only [heq] using hcost

end RHAcceleration95

#print axioms RHAcceleration95.exact_completion_endpoint

open Lean in
run_cmd do
  let n := ``RHAcceleration95.exact_completion_endpoint
  let axs ← collectAxioms n
  unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
    throwError "RUN95 unexpected axiom {axs}"
  let info ← getConstInfo n
  let some v := info.value? (allowOpaque := true) | throwError "RUN95 missing value"
  for required in #[``Data.audit_integral_forms_long_exact,
      ``RHIntegration96.endpoint_of_signed_envelope] do
    unless v.getUsedConstants.contains required do
      throwError "RUN95 missing required supplier {required}"
  for forbidden in #[``Data.integral_forms_long,``Data.heightLe_volume_rows] do
    if v.getUsedConstants.contains forbidden then
      throwError "RUN95 rounded C supplier used directly {forbidden}"
  logInfo "RUN95_EXACT_COMPLETION_ENDPOINT_GUARDS_OK"
