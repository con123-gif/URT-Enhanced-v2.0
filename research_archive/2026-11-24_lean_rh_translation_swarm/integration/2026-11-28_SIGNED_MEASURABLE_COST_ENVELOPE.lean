import Run94MeanNormalizedRankBudget
import Lean

/-!
# Integration — signed measurable envelope for the actual fixed-fiber star
28 November 2026. HUMAN DERIVATION / PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, latest editor 55e967d5, prime 7654aa1f,
acceleration d6e7591b, C2 replay 02c94c3a, prior integration 8aa381a7.

## One genuine reduction: no measurable selection of arithmetic witnesses
The fixed-fiber signed polar mean is the editor's alternative to the
accepted RUN94 pointwise endpoint. Use exactly its SAME record fiber
D_u, J=[t,t²], measure μ=volume.restrict J and w=u^ceil(t²/9) exp(-3u).
Set A=primeError(P.d,P.N₀,x), C=m*a*#thick>0, L=logB*budget,
K=logB²*budget, S(u)=m*D_u.remainder, Q(u)=polar error.
C,A,L,K are constant along this fiber (not across arbitrary D choices).
ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
Data.remainder_eq, gives S+C Q=C A on J, hence μ-a.e.
Use the editor's native-shaped polar mean (d6c08ec8cd4c003f4f3c4da6ae9d807e146a7dad)
for integrability of w, wQ and the signed mean bound. It is PREPARED.

The acceleration RUN94 (acf899303fc0cc59e046dc0facb73770f9521b72)
requires functions q,j and integrability of their weighted combined cost.
Avoid selecting those functions altogether. It suffices to find ONE
integrable weighted upper envelope M, with integral wM <= (K-4L) integral w,
such that for μ-a.e. u there EXIST d,n,H,δ from the SAME local A/B/C family:
    n>0,
    d(H-3L)<=n(H-S+L)+2δ,
    (d-n)(3L-H)+2δ <= n M(u).
All these are scalar consequences of the actual arithmetic witnesses,
not independent freely selectable variables. Cancel H before any norms:
    n S <= 4nL+(d-n)(3L-H)+2δ <= n(4L+M(u)).
Thus S<=4L+M(u). No measurable selections of y, d, n, H or δ, no
integrability of their quotients, no separate crude bound -H<=b²x^99,
no change to the polar weight. S's weighted integrability follows from
the exact remainder identity: wS=(CA)w-C(wQ) μ-a.e. Reuse RUN94's
mean_star_of_normalized_cost on M, not a new integral comparison.
Integrate the same identity on the RESTRICTED measure, not outside J:
    CA W = integral wS + C integral wQ <= (K+C exp(-t)) W.
W>0 by the native weight on the nondegenerate interval. Divide by W
to obtain exactly the editor mean-star endpoint estimate, then divide
by C and use native HasLogBound and existing quartic endpoint.
This removes an explicit measurable-witness obligation and keeps the
signed height rather than replacing it by a crude absolute majorant.
It does NOT provide the cost envelope or its integral estimate.
No claim of strict premise implication in both directions or of RH.

## Critical native C premise audit
LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
the section variable hn is (1 - 4 / D.b ^ 2) * D.rowDim <= n.
Data.heightLe_volume_rows includes hn and Data.integral_forms_long
explicitly calls heightLe_volume_rows i hn I hV o. The same hn occurs
in Data.exists_family_covolumeSq_le. The minimal signed common star
(1cda73bdccdb67a5f47ad023e918e00ce81c1792) transports that exact C
statement, so retains this premise. Hence one MUST NOT use low rank
with the existing C supplier merely because a normalized average
passes. To relax native near-full rank requires a new C theorem.
Our envelope does not assume a measurable family of C witnesses;
it still requires actual C at each a.e. point, including its rank
premise and same y, index, volume, twist and Data. The signed cost
improvement is compatible with the native rank restriction. No
global rank-premise retirement is justified.

## Exact checks and boundaries
Actual connector JS read RUN95 state receipt b58fac802d12d1f3313fe5dc65ab06520577b841
(run 46102281476), all_requested_checks_ok=true and all 15 guards true;
arithmetic_premise_proved=false, original_definition_native_bridge_checked=false,
full_RH_replay=false. The new envelope is NOT included in that receipt.
Four LongForms source anchor counts 2,1,1,1 verified. Executed
10530 integer-scaled boundary/slack checks for d=1..12, n=1..d,
L=0,1,7; H=-16,0,3,10,99; δ=0,1,9; slack=0,1,13.
3315 cases have negative signed cost; 3510 sharp boundary controls
reject tightening the exact cost by one scaled unit. Pure scalar
control d=8,n=4,H=10,L=1,δ=0,S=-3,M=-7 satisfies both equalities;
using |H| instead gives cost 13. This is not an admissible native
Data or proof that C allows that rank. It tests the signed scalar
cancellation only. Local lean/lake/elan absent, git DNS unavailable.
No new native compilation, rh_scan/prune/reduce/auto/frontier,
axiom or graph execution. Existing graphs/failed routes remain
preserved, and no claimed RH theorem imported.

RESUME HERE: compile this file as IntegrationSignedCostEnvelope
after the existing standalone Run94MeanNormalizedRankBudget in the
authenticated compact environment; require both theorem axioms,
the direct guard below, and a strict constructor-inclusive audit.
At the actual editor mean caller instantiate μ=volume.restrict J
and the exact native remainder identity, and derive the envelope
estimate from actual A/B/C with C's hn retained. Do not substitute
a scalar toy or assume measurable witness selection. This is an
alternative only; do not delay the prior native definition junction
or the queued squared-star replay. HANDOFF TO editor / acceleration /
character boxes / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

namespace RHIntegration96

theorem signed_pointwise_envelope (d n H S L delta M : ℝ)
    (hn : 0 < n)
    (hvol : d*(H-3*L) ≤ n*(H-S+L)+2*delta)
    (hcost : (d-n)*(3*L-H)+2*delta ≤ n*M) :
    S ≤ 4*L+M := by
  apply le_of_mul_le_mul_left _ hn
  nlinarith only [hvol,hcost]

open MeasureTheory in
theorem endpoint_of_signed_envelope {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (w S Q M : α → ℝ) (C A L K e : ℝ)
    (hC : 0 < C) (hW : 0 < ∫ u, w u ∂μ)
    (hw0 : ∀ᵐ u ∂μ, 0 ≤ w u)
    (hw : Integrable w μ)
    (hQ : Integrable (fun u => w u * Q u) μ)
    (hM : Integrable (fun u => w u * M u) μ)
    (hid : ∀ᵐ u ∂μ, S u + C*Q u = C*A)
    (hvol : ∀ᵐ u ∂μ, ∃ d n H delta : ℝ, 0 < n ∧
      d*(H-3*L) ≤ n*(H-S u+L)+2*delta ∧
      (d-n)*(3*L-H)+2*delta ≤ n*M u)
    (hcost : (∫ u, w u*M u ∂μ) ≤ (K-4*L)*(∫ u, w u ∂μ))
    (hpolar : (∫ u, w u*Q u ∂μ) ≤ e*(∫ u, w u ∂μ)) :
    C*A ≤ K+C*e := by
  have hp : ∀ᵐ u ∂μ, S u ≤ 4*L+M u := by
    filter_upwards [hvol] with u hu
    rcases hu with ⟨d,n,H,delta,hn,hv,hc⟩
    exact signed_pointwise_envelope d n H (S u) L delta (M u) hn hv hc
  have hSae : (fun u => (C*A)*w u-C*(w u*Q u)) =ᵐ[μ] (fun u => w u*S u) := by
    filter_upwards [hid] with u hu
    calc
      (C*A)*w u-C*(w u*Q u) = (S u+C*Q u)*w u-C*(w u*Q u) := by rw [hu]
      _ = w u*S u := by ring
  have hS : Integrable (fun u => w u*S u) μ :=
    ((hw.const_mul (C*A)).sub (hQ.const_mul C)).congr hSae
  have hs := RHAcceleration94.mean_star_of_normalized_cost μ w S M L K
    hw0 hp hw hS hM hcost
  have heqae : (fun u => (C*A)*w u) =ᵐ[μ]
      (fun u => w u*S u+C*(w u*Q u)) := by
    filter_upwards [hid] with u hu
    calc
      (C*A)*w u = (S u+C*Q u)*w u := by rw [hu]
      _ = w u*S u+C*(w u*Q u) := by ring
  have heq := integral_congr_ae heqae
  simp only [integral_add hS (hQ.const_mul C), integral_const_mul] at heq
  apply le_of_mul_le_mul_right _ hW
  nlinarith only [heq, hs, mul_le_mul_of_nonneg_left hpolar hC.le]

end RHIntegration96

#print axioms RHIntegration96.signed_pointwise_envelope
#print axioms RHIntegration96.endpoint_of_signed_envelope

open Lean in
run_cmd do
  for n in #[``RHIntegration96.signed_pointwise_envelope,
      ``RHIntegration96.endpoint_of_signed_envelope] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "INTEGRATION96 unexpected axiom {n}: {axs}"
  let info ← getConstInfo ``RHIntegration96.endpoint_of_signed_envelope
  let some v := info.value? (allowOpaque := true) | throwError "INTEGRATION96 missing value"
  unless v.getUsedConstants.contains ``RHIntegration96.signed_pointwise_envelope &&
      v.getUsedConstants.contains ``RHAcceleration94.mean_star_of_normalized_cost do
    throwError "INTEGRATION96 missing supplier"
  logInfo "INTEGRATION96_SIGNED_ENVELOPE_GUARDS_OK"
