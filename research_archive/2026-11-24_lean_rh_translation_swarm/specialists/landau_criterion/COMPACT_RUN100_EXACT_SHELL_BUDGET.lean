import New.Filling.TopFloor
import RHRun85

/-!
# RUN100 — expose the exact finite-shell exponent budget at the real bottom caller
28 November 2026. SOURCE-MATCHED PREPARED, NOT native checked.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS/SWARM/HANDOFF/EXPANSION/continuity, current peers d8fe4185
(adjustable B4 spread), f1f3df92 (convex six-field sieve).
Reuse RUN99 32cb51c0; do not rederive its depth-discounted moment.

## Actual native verification received
Run 46120566249; state branch
compute/rh-compact-b3-caller-layout-repair-20261128/outputs/run93_caller_receipt.json
blob a40e5ea34dec3ddf16ca751db3ef642a5d64703e:
all_requested_checks_ok=true, new_Lean_execution=true, caller compile 4.58s,
ten complete axiom reports standard propext/Classical.choice/Quot.sound,
25/25 guards, 73916 nodes, 2104697 edges, zero missing.
Old floor/self/positions, real formConst and finite shells absent from
all five replacement roots; direct replacement edges checked.
Graph SHA256 ca27f114532a382c0ed2551b8a0adfc3f5c0a1535b6edb63e17032d57c41db1c.
Accepted RHRun92Callers.olean SHA256
9015f1b4cb15d8d39283e3d954e2da43cea55974b089285d9b6a4bf1743b37af.
Do NOT report aggregate run PASS: status.json blob
41affef9910fd37de51b286754fff4ed3ea8c164 is error; run94/run94_receipt.json
blob 405ea599a2d965728d45276ea8380aecaface2cd has returncode 124,
2700.05s, new_Lean_execution=false. Build log ends at 9436/9471 and
TIMEOUT: bounded targeted job, not a mathematical failure. No new RUN94
replacement compilation. Integration peer d8fe4185 already records this.
Reuse accepted objects, not a repeated cold build or graph scan.

## New source-matched reduction (not a new independent primitive)
TopFloor blob 9762970967aef90b3a4e025b7f2891d892c70111, lines 275-333 (finite shells) and
387-415 (bottom). LocalTheorem positions uses accepted direct-chart
supplier RHRun85, source blob cba0a141fd47c34b792021c679b5451ebde7d3bf.
StandardLevel blob ec149f4a38c54931f75c7e106ce94d1d6e65c5a4;
LevelGauge 05b4a710e4192b2f3d289a8e52161a6d12a2866e.
BigCell HyperbolicBasis.card_eq is k+1=card iota+2*M+2.

In the general shell proof the explicit expenditure of decay exponent is
400 n^2 * (200000 n^2) + u <= s, i.e. 80,000,000 n^4 + u <= s.
The old rank guard u+10^8 n^4<=k is a sufficient proxy. Keep the actual
ideal-content covering, the zeta bound, pivot cap, integrability/positions,
gauge, and pairingNorm-to-massRatio; replace only the proxy at its
explicit use by the exact budget and call the accepted direct-chart
positions integral. The min-power step splits the decay into the content
summability part and the u part without assuming e>0 or discarding e=0.
The remaining tactic obligations must be replayed: implicit use of the
old rank guard by any tactic is not ruled out by text inspection.

At floor zero the SAME off-congruence indicator and cap proof is copied
from the actual source, not a guessed bound. The exact shell exponent is
u=t+1+n+10^9 n^4. Hence a sufficient budget for that call is
    s >= t+1+n+1,080,000,000 n^4.
On the native F : Level ... (m+1), k+1=c+2(m+1)+2,
s=c-(3n+1+(m+1)), and m<9n, so k-s=3m+3n+5<=30n+2
whenever the subtraction is nonnegative (the proposed rank guard
ensures this). Thus a sufficient rank guard, derived before the norm
estimate, is
    k >= t+1,080,000,000 n^4+31n+3.
The original bottom proxy t+10^10 n^4<=k is not used in the
candidate bottom theorem. The sharper native volumeExponent guard
is the primary statement, not a new free parameter. No head/frequency
or empty-mask change. The exact congruence term stays unchanged.
This gives a source-level direct route for the RUN99 restricted t
through the same pivot/content/positions primitives, rather than
calling the old full shell or old bottom lemma. Does NOT establish
the primitive cap independently, or the new caller graph.

## Evidence
14 exact source-anchor and reverse-roundtrip checks executed in JS
(including the two complete roundtrips); 200 BigInt boundary
arithmetic cases n=1,...,100, m=0 or 9n-1, including equality at
the worst m. Universal arithmetic proof below; tests are not Lean.
No local lean/lake/elan, no new native rh_scan/prune/reduce/auto/frontier
or graph/axiom execution. This file has two reconstructed native
declarations and one explicit rank-to-volume-budget arithmetic lemma.
It is an executable candidate, not a checked theorem.
Keep all old and new graphs, receipts and open premises.
RESUME HERE: compile this file against the retained authenticated
RHRun85 and compact TopFloor objects, check all three axiom reports
and actual transitive caller graphs; resolve the first real diagnostic
(if remaining tactics used hr, expose the smallest additional guard).
Then use the accepted budgeted bottom theorem at RUN99 t in FixedLines
and retain the existing FiniteSystem comparison coefficient.
Do not duplicate the RUN94 build; coordinate with integration/kernel.
HANDOFF integration / positivity / audit. B3/B4/star and RH OPEN.
-/

noncomputable section
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Finset Subgroup ENNReal InnerProductSpace Level Matrix MeasureTheory IntegralPlace Place
  QuotientGroup SemilocalField Set Size MeasureTheory.Measure Measure ComplexOrder Function Filter

attribute [local simp] div_eq_top mul_eq_top mul_mem indicator Units.smul_def weylRatio intVectors
  le_of_lt mul_assoc mul_pow genIndex_pos prod_mem

variable {A ι} {𝔰 : Shape} [SemilocalField A] [StarRing A] [P :
  IntegralPlace A] [Fintype ι] {m} {T : 𝔰.Form A}
  [IsHermUnit T.splitGram] {F : Level ι T (m + 1)} {x y u k : T.G} {g : Aˣ} {u' : T.G} {g' : Aˣ}
variable (Z : F.IntermediateGroup) [h : IsStdLevel F] {j K : ℕ} (r t)
  {p q : ℕ → Aˣ} {ξ : Aˣ} {Γ : Gauge F} (hj : j ≤ 𝔰.ϱ)

namespace IntegralPlace.IsStdLevel

lemma lintegral_shells_le_budgeted (hj : j ≤ 𝔰.ϱ) (hBudget : 400 * 𝔰.n ^ 2 * (200000 * 𝔰.n ^ 2) + t ≤ F.volumeExponent) {α a sα} (hΓ : Γ =
  gauge α a sα) (H : Γ.IsHead j p ∧ Γ.IsHead j q ∧ (j ≠ 0 → ↑F.g⁻¹ ∈ Γ.ofSize 1)) {f : _ →
  _} {e} (hf : ∀ {x}, f x ≤ F.formMajorant j
  p q Z.besselVector Z.besselVector x) (he : e < 1 → ∀ x ∈ F.positions, f x ^ 2 ≤ (e ^
  F.volumeExponent) ^ 2 * Γ.selfNormProduct j p q Z.besselVector Z.besselVector x) : F.headDensity j
  p q * ∫⁻ x, f x ∂F.groupMeasure ≤ min 1 e ^ t * Z.massRatio * Γ.Λ ^ (10 ^ 9 * 𝔰.n ^ 4) := by
  obtain ⟨hk, _, _, ζ, V⟩ := isCut_besselVector Z, h.zeta_rank, F.card_eq,
    le_two_of_pow_le_ofReal h.zeta_rank.1, by
    simpa [volume_O] using h.gauge.floorMassLe_one ⟨j, by lia⟩ h.gauge.hasFibreBound_floorQuadric
  let D (x : T.G) := (Option.elim · 1 (F.g⁻¹.1 • (x.1.1 - 1)).uncurry)
  grw [← setLIntegral_eq_of_support_subset fun x hx ↦ ?_, ← withDensity_apply',
    ← setLIntegral_const F.positions, lintegral_le_idealZeta_mul ζ (V := min 1 e ^ t * Z.massRatio *
    Γ.Λ ^ (9 * 10 ^ 8 * 𝔰.n ^ 4) * 2 ^ (10 ^ 5 * 𝔰.n ^ 2)) ({x ∈ F.positions | {ε | ∀ i,
    ε * D x i ∈ R} = R.subtype '' ·}) (.of_forall fun x y ↦ ?_), ζ, Γ.two_le_and_pairs_le.1]
  rotate_left
  obtain ⟨c, -, -, -, E⟩ :=
    inv_surjective.exists.1 (exists_content (p := D x) (i := none) isUnit_one)
  have hc := mul_one c.1 ▸ (E c).2 (by simp) none
  obtain ⟨z, I, i, b, l⟩ := isAdelic.1.1 hc, exists_ideal_cardQuot_eq c hc
  use I, i, ⟨y, b ▸ ext E⟩
  let ⟨σ, eσ⟩ : ∃ σ, σ ^ (400 * 𝔰.n ^ 2) = P.md c * Γ.Λ ^ ((10 * 𝔰.n + 1) * (99 * 𝔰.n)) :=
    ⟨_, rpow_inv_natCast_pow (by lia) _⟩
  let Γ' := h.gauge (star c * c) (mul_mem z hc)
  grw +useKAbstract [l, b, ← md_inv, Γ'.md_le 1 _ (by simp [Γ', z]), pow_le_pow_right₀
    (by simp) (by lia : m ≤ 50000 * 𝔰.n ^ 2), withDensity_apply', Γ.lintegral_positions_le_via_directChart Γ'
    hk hk.1 hj H.2.1 (e := min (min σ 1) e ^ F.volumeExponent * Γ.Λ ^ (9999 * 𝔰.n)) (sq _).ge
    (fun x k ↦ ⟨k.1, fun _ _ ↦ by simpa [Γ'] using! mul_mem z (k.2.ge (by simp) (some (_, _)))⟩)
    fun x hx ↦ ?_, min_assoc, pow_le_pow_right_of_le_one' (by simp) hBudget, pow_add, pow_le_pow_left' inf_le_right t,
    inf_le_left, pow_mul σ, eσ, ← pairingNorm_mul_le_massRatio Z,
    ← (md_ne_zero_and_ne_top (star c * c)).elim (@ENNReal.mul_div_cancel _ 2)]
  simp [Γ', data_mem]; rotate_left
  rw [min_def_lt']; split
  grw [he (by order) x hx.1, ← Γ.one_le_Lambda]; simp
  grw [hf, Γ.formMajorant_sq_le (σ := min σ 1 ^ 2) hk hk.1 hj H.1 hx.1 V (by bound)
    hk.isNear_of_ne_zero fun o _ z N N' ↦ ?_, Γ.two_le_and_pairs_le.1]
  rotate_left
  simp [sq] at o; by_contra! n
  choose d hd E V using (exists_unit_mem_floorValues Z · x z); let C := ∏ i with j ≤ i.1, d i
  have ⟨hC, u⟩ : C.1 ∈ R ∧ ∀ i, j ≤ i.1 → (C / d i).1 ∈ R := by simp_all [C, ← prod_erase_eq_div]
  have w := mul_mem (pow_mem a (10 * 𝔰.n + 1)) (isAdelic.1.1 hC)
  let Γ' := h.gauge (α ^ _ * star C * C) (mul_mem w hC)
  have K := hx.2.le (Option.rec (Γ'.zero_one_mem_ofSize _).2
    (Prod.rec (Γ'.hasMatSize_sub_one_of_floorValues Γ hj H.1 H.2.1 (fun a c m ↦
    by simpa +arith [Γ', mul_left_comm] using mul_mem hC (mul_mem (isAdelic.1.1 hC)
    (hΓ ▸ Γ.mul_mem_ofSize (H.2.2 a) m :))) (exists_close_of_inner_ne_zero Z z) N N' fun i l ↦
    ⟨_, E i, by simpa [Γ'] using! mul_mem w (u i l)⟩)))
  apply ((md_ne_zero_and_ne_top (C ^ (99 * 𝔰.n * 2))).elim ENNReal.mul_lt_mul_left o).not_ge
  simp [C]
  grw [← V, ← n, min_eq_left o.le, prod_const, ← pow_mul, ← pow_mul, ← pow_succ',
    ← pow_le_pow_right_of_le_one' o.le (by grw [card_finset_fin_le]; lia : _ ≤ 400 * 𝔰.n ^ 2), eσ,
    ← Γ.md_le _ (c⁻¹ * (star C * C) ^ _) (by simpa [hΓ, ← pow_mul, mul_left_comm] using K),
    ← map_mul]
  simp [C, pow_mul, sq]; simp_all
  obtain ⟨y, -, a⟩ := exists_ne_zero_of_ae ae_stackMeasure_mem (ne_bot_of_le_ne_bot hx hf)
  obtain ⟨σ, -, a⟩ := exists_ne_zero_of_pivotModulus (left_ne_zero_of_mul a)
  obtain ⟨u, _, v, _, -, k⟩ := exists_of_inner_besselVector_ne_zero Z a
  exact h.box_eq.2.2.2.2 ▸ ⟨_, ⟨σ * y, v⁻¹ * u, by bound, rfl⟩, _, k, by simp⟩
  all_goals ring_nf; clear * - m; gcongr <;> simp

lemma floorZeroForm_le_main_term_budgeted
    (hBudget : 400 * 𝔰.n ^ 2 * (200000 * 𝔰.n ^ 2) +
      (t + 1 + (𝔰.n + 10 ^ 9 * 𝔰.n ^ 4)) ≤ F.volumeExponent) : F.floorZeroForm Z ≤ F.groupMeasure Z * F.groupMeasure
  F.congGroup * (F.groupMeasure Z + volume (P.R \ P.intUnits) ^ (t + 1) * 2⁻¹ ^ 𝔰.n) := by
  let Γ := h.gauge; have H : Γ.IsHead 0 1 := by simp [IsHead, Γ]
  have k := Γ.isPairingKernel_self (isCut_besselVector Z) 0; let e :=
    min (volume (P.R \ P.intUnits)) 2⁻¹
  have h_meas : MeasurableSet (SetLike.coe F.congGroup) := measurableSet_unitaryLevel
  grw [floorZeroForm, ← lintegral_add_compl _ h_meas,
    floorZeroForm_on_congGroup, (enorm_integral_phase_eq_upperPairing Z).le,
    k.enorm_upperPairing_le, (mul_pow ..).le]
  with_unfolding_all grw +useKAbstract [lintegral_mul_const' _ _ (by simp), ← lintegral_indicator
    h_meas.compl, (one_mul (lintegral ..)).ge.trans
    (lintegral_shells_le_budgeted Z (t + 1 + (𝔰.n + 10 ^ 9 * 𝔰.n ^ 4)) bot_le hBudget (.refl Γ) ⟨H,
    H, by simp⟩ (indicator_apply_le ?_) fun _ x hx ↦ ?_), inf_le_right, IntermediateGroup.massRatio,
    mul_right_comm (e ^ _), mul_assoc, ENNReal.div_mul_cancel (by simp)
    (by simp), pow_add e, pow_le_pow_left' inf_le_left, pow_le_pow_left' inf_le_right]
  simp [Γ, pow_add, ← mul_pow, ENNReal.inv_mul_cancel]; ring_nf; rfl
  simp [formMajorant, descConv, sq]
  by_cases n : x ∈ F.congGroup; simp_all
  have M {y} : F.IsNear 0 y := ⟨y⁻¹, by simp [h.box_eq]⟩
  have C := Γ.pivotModulus_sq_le_of_capped (g := 1) (ε := e) k hx fun _ _ a ↦ by_contra fun b ↦
    n (h.integral_data.1.mem_unitaryLevel h.integral_data.2.2.1 (by simpa [Γ] using!
    (Γ.hasMatSize_sub_one_of_floorValues Γ bot_le H H (by simp) (exists_close_of_inner_ne_zero Z
    (by simp_all)) M M fun i l ↦ (exists_unit_mem_floorValues Z i x a).imp fun u k ↦
    ⟨k.2.1, by_contra fun m ↦ b ⟨i, l, k.2.2.trans (le_min (md_le_volume fun r a ↦
    ⟨mul_mem k.1 a, fun ⟨_, v, b, e⟩ ↦ m (by simp [Γ]; grind [mul_mem a b, Units.mul_inv])⟩)
    ((exists_ideal_cardQuot_eq u k.1).elim fun I ⟨a, b, e⟩ ↦ by simpa [le_inv_iff_le_inv, ← e,
    Nat.two_le_iff, a] using (m <| by simpa [·, Γ] using congr(1 ∈ $b))))⟩⟩)))
  simp_all [descConv, Gauge.selfNormProduct, Level.selfNorm, floorWeight, ← pow_mul Γ.Λ]
  grw [C, (by lia : 10000 * _ ≤ 1500000 * 𝔰.n ^ 3)] <;> ring_nf <;> simp

end IntegralPlace.IsStdLevel

namespace LandauRun100

/-- Exact arithmetic adapter for a native Level of index m+1. -/
theorem bottomBudget_of_rank (n m k c s t : ℕ)
    (hcard : k + 1 = c + 2 * (m + 1) + 2)
    (hm : m < 9 * n) (hs : s = c - (3*n + 1 + (m+1)))
    (hr : t + 1080000000 * n^4 + 31*n + 3 ≤ k) :
    400*n^2*(200000*n^2) + (t + 1 + (n + 10^9*n^4)) ≤ s := by
  have hp : 400*n^2*(200000*n^2) = 80000000*n^4 := by ring
  rw [hp]
  norm_num at *
  omega

end LandauRun100

#print axioms IntegralPlace.IsStdLevel.lintegral_shells_le_budgeted
#print axioms IntegralPlace.IsStdLevel.floorZeroForm_le_main_term_budgeted
#print axioms LandauRun100.bottomBudget_of_rank
