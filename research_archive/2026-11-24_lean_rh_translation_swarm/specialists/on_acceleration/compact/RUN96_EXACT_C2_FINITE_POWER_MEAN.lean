import Run95ExactCompletionSignedEndpoint
import C2ExactCompletionTransport
import IntegrationGuardedFinitePower
import Lean

/-!
RUN96 acceleration — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read SWARM, HANDOFF, EXPANSION, AGENTS and new peer results.
Stage modules (same compact workspace):
Run95ExactCompletionSignedEndpoint = specialists/on_acceleration/compact/RUN95_EXACT_COMPLETION_SIGNED_ENDPOINT.lean
  ac239b98078d642b015e9aa5f658267a57a9af0d
C2ExactCompletionTransport = specialists/character_boxes/RUN95_COMPACT_C2_EXACT_COMPLETION_TRANSPORT.lean
  4bc8550273b71a944c57af6103afe73bc4879e3f
IntegrationGuardedFinitePower = integration/2026-11-28_GUARDED_FINITE_POWER_ENDPOINT.lean
  ff20a7853578c8e3672914710cadf25d98766140
All three new candidates require native replay. Reuse their transitive module
staging instructions; do not duplicate the active C2 squared-cache job.

Two actual junctions, not another independent scalar derivation:
1. Substitute the peer's rank-free C2 theorem at the exact RUN95 endpoint
   proof-only edge. Require definitionally equal supplier types and level
   parameters, exact unchanged endpoint statement and exact direct value-edge
   delta, no old direct C supplier, and standard axioms. This retains all
   measure, integrability, same-y index/volume and completion-cost premises.
   Indirect reachability of the old theorem is NOT decided by a direct check.
2. Combine signed mean and the peer's finite-power absorption. Set
   C=m*a*Hthick, Kbudget <= c*f*a*B^k, B=log b, X=log x.
   The existing endpoint gives C*A<=Kbudget+C*e, so cancel the positive
   normalization to obtain A<=Kbudget/m/a/Hthick+e.
   Use the existing finite_power_scalar, with S=Kbudget and Q=e.
   This yields A<=exp((8 eta-1/2)X) when log B=eps X, m>=exp(X/2),
   T/B<=Hthick, f=T*phi, (k+1)eps<=eta,
   e<=exp(-10^6 X), log(c*phi+1)<=7 eta X.
   All scale equalities and inequalities are explicit. No uniform pointwise
   star bound is needed at this conditional mean interface. In application
   choose eps,k,c before X grows, along the SAME native fixed fiber; apply
   the existing quartic/principal endpoint only after proving that fiber
   and its envelope, remainder identity, polar mean and scale premises.
   No selection of measurable arithmetic witnesses or absolute value of H
   (mainHeight) is added. Hthick below is the positive thickness, not H.

Actual connector checks: 5 unique anchors verified, 10 removed/duplicated
controls rejected. Signature of finite_power_exact_completion_endpoint is
copied verbatim from RUN95 through hpolar, except for the new name and
explicit scale hypotheses. No local lean/lake. Shared CI run 46108846902
job 140867652611 was in_progress; no PASS inferred. No new native
rh_scan/prune/reduce/auto/frontier or recursive graph execution.
Existing original/reduced graphs and failures retained. No claimed RH
theorem used. Arithmetic envelope proof, exact completion replay and
root closure remain open.

RESUME HERE: in the authenticated compact workspace after the three staged
modules compile, run this file as Run96ExactCompletionFinitePower; require
the two guard markers and strict constructor-inclusive old/new endpoint
and finite-power root graphs. Compare direct and recursive edges separately,
record actual first diagnostic on failure. Handoff integration/editor/audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
run_cmd do
  let old := ``RHAcceleration95.exact_completion_endpoint
  let fresh := `RHAcceleration96.exact_completion_endpoint_c2
  let a := ``Data.audit_integral_forms_long_exact
  let b := ``Data.run95_exact_completion_c2
  let ai ← getConstInfo a
  let bi ← getConstInfo b
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
  unless ai.levelParams == bi.levelParams && same do
    throwError "RUN96 supplier statement mismatch"
  let .thmInfo orig ← getConstInfo old | throwError "RUN96 original theorem missing"
  let before := orig.value.getUsedConstants
  unless before.contains a && !before.contains b && !orig.type.getUsedConstants.contains a do
    throwError "RUN96 expected distinct proof-only edge"
  let revised := orig.value.replace fun e =>
    match e with
    | .const n us => if n == a then some (.const b us) else none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams, type := orig.type, value := revised })
  let .thmInfo checked ← getConstInfo fresh | throwError "RUN96 inserted theorem missing"
  let expected := before.map fun n => if n == a then b else n
  let got := checked.value.getUsedConstants
  unless checked.type == orig.type && checked.levelParams == orig.levelParams &&
      expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "RUN96 unintended statement or direct value-edge delta"
  unless got.contains b && !got.contains a &&
      got.contains ``RHIntegration96.endpoint_of_signed_envelope do
    throwError "RUN96 missing exact C2 or signed endpoint supplier"
  for n in #[old, fresh] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN96 unexpected axiom {n}: {axs}"
  logInfo "RUN96_EXACT_C2_ENDPOINT_TRANSPORT_OK"

open Finset LinearMap Real Submodule LevelPlaces.LevelForm MeasureTheory

namespace RHAcceleration96

theorem finite_power_exact_completion_endpoint {α : Type*} [MeasurableSpace α]
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
    (m a Hthick T F B phi c eta eps X : ℝ) (k : ℕ)
    (hm : 0 < m) (ha : 0 < a) (hH : 0 < Hthick) (hB : 0 < B)
    (hphi : 0 ≤ phi) (hc : 0 ≤ c) (heta : 0 < eta) (hX : 0 ≤ X)
    (hCscale : C = m*a*Hthick) (hf : F = T*phi) (hthick : T/B ≤ Hthick)
    (hmlo : exp (X/2) ≤ m) (hlog : log B = eps*X)
    (hslack : ((k : ℝ)+1)*eps ≤ eta)
    (hK : K ≤ c*F*a*B^k) (he : e ≤ exp (-(1e6*X)))
    (habsorb : log (c*phi+1) ≤ 7*eta*X) :
    A ≤ exp (X*(8*eta+2⁻¹-1)) := by
  have hmean := exact_completion_endpoint_c2 D μ w Q M C A L K e
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

end RHAcceleration96

#print axioms RHAcceleration96.exact_completion_endpoint_c2
#print axioms RHAcceleration96.finite_power_exact_completion_endpoint

open Lean in
run_cmd do
  let n := ``RHAcceleration96.finite_power_exact_completion_endpoint
  let axs ← collectAxioms n
  unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
    throwError "RUN96 unexpected finite-power axiom {axs}"
  let info ← getConstInfo n
  let some v := info.value? (allowOpaque := true) | throwError "RUN96 missing value"
  for required in #[``RHAcceleration96.exact_completion_endpoint_c2,
      ``RHIntegration97.finite_power_scalar] do
    unless v.getUsedConstants.contains required do
      throwError "RUN96 missing finite-power supplier {required}"
  logInfo "RUN96_FINITE_POWER_MEAN_GUARDS_OK"
