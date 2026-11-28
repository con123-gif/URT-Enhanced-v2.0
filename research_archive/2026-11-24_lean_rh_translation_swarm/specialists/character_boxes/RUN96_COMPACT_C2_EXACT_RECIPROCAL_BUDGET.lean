import AuditExactCompletion
import C2SquaredStarMinimal
import Lean

/-!
RUN96 character boxes — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION; latest acceleration RUN96
e7fba27b already transports RUN95 to the finite-power endpoint; do not
duplicate that caller. The next distinct reduction is the *other*
height estimate in LongForms: retain its exact chain normalization.

Source LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05, RowVolume.lean
925de9c592b40763516e70ddeae48b4ad1a35b88, CostsSquares
3842be43cd82966d3398d9929f72dd7667a62f4d, LiftVolumeHeight
87938141d4103b485fd5a7125721798f65f973f1. Stage AuditExactCompletion
3246d8ef051ac8d138be5fc3649af1cb8132ea1a and C2SquaredStarMinimal
1bd5f9339e7a588439173ccb8be396f208cfb120 per their existing instructions.
No additional cold build.

Let d=rowDim, H=mainHeight, L=logB*budget, E=m² t x^999,
U=x1² b²+x^99+4E, S=m*remainder. Native volume_iota_eq_prod_liftVolume
gives ONE common c with CostsSquares (m*m), nonzero volumes, exact
factorization. In heightLe_volume_ratio_sq, the product of lift ratios
has signed height d(L-H). The c ratio has height 2E, BEFORE rounding to
2L by HasLogBound. Squaring the lift product and raising the c ratio to d
gives exact reciprocal height 2d(L-H+E). This is a source-level removal
of a budget weakening, NOT another new factorization or a claim of
smaller actual dependency closure.

Combine this with audit_heightLe_volume_rows_exact (retaining its
actual index, all conjugates, completion, one_determinant, fit family)
and square the first bound. Cancel the SAME nonzero ratio, then apply
c2_heightLe_nonneg_arch:
  d(H-L-E) <= V+2delta+(d-n)U.
For V=n(H-S+L) and n>0, exact cancellation of H gives
  n(S-2L-E) <= (d-n)(L+E+U-H)+2delta.
Consequently if that last cost <= nM then S <= 2L+E+M.
No sign assumption on H, V or M. No added rank threshold. The native
rounded proof uses 2E<=2L; for d>=n and E<=L, the old local cost
(d-n)(2L+U-H)+2delta dominates the new one by (d-n)(L-E).
Thus for a fiber where L and E are fixed the allowable signed mean
budget is K-2L-E instead of K-3L, preserving all other hypotheses.
No proof of a uniform measurable envelope or fixed-fiber existence.
If E is NOT fixed, retain E inside the integrated cost; do not move
it outside an integral or choose a new Data. No unconditional strict
improvement claimed. All original/reduced graphs and obligations retained.

Executed in connector: five unique source replacements with exact
reverse round-trip; ten omitted/duplicated anchor controls rejected.
Local Python SymPy expanded the combined C/cost residual and ratio
budget residual to zero, and factored the old-minus-new cost as
(d-n)(L-E). These are scalar checks, not Lean. No local lean/lake on PATH.
Actual RUN94 job 140867652611 (run 46108846902) remains in_progress
at latest query; no completed native output yet. No new native rh_scan,
rh_prune, rh_reduce, rh_auto, rh_auto_frontier or full dependency audit.
The declarations below are executable candidates, standard axiom and
direct supplier guards included. No claimed RH theorem imported.

RESUME HERE: after actual RUN94 receipt, compile the existing
AuditExactCompletion and C2SquaredStarMinimal in the retained native
workspace, then stage this as C2ExactReciprocalBudget. Inspect the
first actual cast/normalization error if any; require original and
new reciprocal/C graph roots, standard axioms, retained nonzero and
all-conjugate suppliers and actual membership of HasLogBound (may
survive elsewhere). If accepted, offer this C to the signed-mean
integration lane with the fixed-E condition or E inside the envelope.
Do not duplicate RUN94 or the acceleration RUN96 caller. RH OPEN.
HANDOFF TO integration / acceleration / audit / kernel.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P}

lemma Data.run96_heightLe_volume_ratio_sq_exact {θ} (o : D.IsFitFamily θ) : HeightLe (2 * D.rowDim *
  (D.logB * D.budget - D.mainHeight + (D.m : ℝ)^2 * D.t * D.x^999)) fun ι ↦ D.𝔷 (1 : D.MFoldTwist) ^ 2 / D.𝔷 (θ ι) ^ 2 := by
  -- `vol : 𝔷 ϑ = ‖c ϑ‖ ^ D ∏ⱼ λⱼ ϑ`
  choose c const _ vol using D.volume_iota_eq_prod_liftVolume
  -- each of the `m` lifts has height `D k (log b B₀ - 𝖴)`; `m k B₀ = budget` and `m k 𝖴 = h_main`
  have lifts : HeightLe (D.rowDim * (D.logB * D.budget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) := (HeightLe.prod
    fun j h ↦ by exact heightLe_liftVolume_ratio o ⟨j, mem_Icc.1 h⟩).mono
    (by simp [mainHeight]; field_simp [(HasLogBound.pos D).ne']; rfl) fun _ ↦ le_rfl
  -- the constants have height `2 m² t x ^ 999`
  have consts : HeightLe (2 * (D.m : ℝ)^2 * D.t * D.x^999) fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹ :=
    by simpa only [Nat.cast_mul, pow_two, mul_assoc, mul_left_comm, mul_comm] using const θ o
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by apply le_of_eq; ring) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le


variable {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y) (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i I hV in
lemma Data.run96_integral_forms_long_exact_reciprocal :
    D.rowDim * (D.mainHeight - D.logB * D.budget -
      (D.m : ℝ)^2 * D.t * D.x^999) ≤
      V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999) := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999)) +
      2 * D.rowDim * (D.logB * D.budget - D.mainHeight +
        (D.m : ℝ)^2 * D.t * D.x^999) :=
    c2_heightLe_nonneg_arch ((((Data.audit_heightLe_volume_rows_exact i I hV o).pow 2).mul
      (Data.run96_heightLe_volume_ratio_sq_exact o)).mono le_rfl
      (by simp [field]; simp [(Z _).1]))
  linarith only [formula]

lemma run96_exact_reciprocal_signed_scalar (d n H L E U S δ M : ℝ)
    (hn : 0 < n)
    (hC : d*(H-L-E) ≤ n*(H-S+L)+2*δ+(d-n)*U)
    (hcost : (d-n)*(L+E+U-H)+2*δ ≤ n*M) :
    S ≤ 2*L+E+M := by
  apply le_of_mul_le_mul_left _ hn
  nlinarith only [hC,hcost]

open Lean in
run_cmd do
  let ratio := ``Data.run96_heightLe_volume_ratio_sq_exact
  let c := ``Data.run96_integral_forms_long_exact_reciprocal
  for (root, required, forbidden) in #[
    (ratio, #[``Data.volume_iota_eq_prod_liftVolume, ``Data.heightLe_liftVolume_ratio],
      #[``Data.heightLe_volume_ratio_sq]),
    (c, #[ratio, ``Data.audit_heightLe_volume_rows_exact, ``c2_exists_isFitFamily,
      ``c2_heightLe_nonneg_arch, ``Data.volume_iota_eq_prod_liftVolume],
      #[``Data.integral_forms_long, ``Data.audit_integral_forms_long_exact,
        ``Data.heightLe_volume_ratio_sq, ``HeightLe.nonneg])] do
    let .thmInfo info ← getConstInfo root | throwError "RUN96 missing theorem {root}"
    let deps := info.value.getUsedConstants
    for a in required do
      unless deps.contains a do
        throwError "RUN96 missing direct supplier {a} at {root}"
    for a in forbidden do
      if deps.contains a then
        throwError "RUN96 stale direct supplier {a} at {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN96 nonstandard axiom {root}: {axs}"
  logInfo "RUN96_EXACT_RECIPROCAL_BUDGET_GUARDS_OK"

#print axioms Data.run96_heightLe_volume_ratio_sq_exact
#print axioms Data.run96_integral_forms_long_exact_reciprocal
#print axioms run96_exact_reciprocal_signed_scalar
