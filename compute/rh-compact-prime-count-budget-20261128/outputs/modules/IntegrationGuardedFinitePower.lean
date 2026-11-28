import Run94StarGrid
import Lean

/-!
# Integration — finite-power guarded native endpoint (28 November 2026)
PREPARED, NOT native-compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, recent peers including audit 6b589f86,
math 3198fbc2, character boxes 861869c4 and acceleration 575f1cad.
Reuse RUN96 (7654aa1f) selected-data guards and the auditor's finite-power proof,
not another independent reduction of the same arithmetic. This contributes the actual
conditional endpoint certificate connecting both results and permits epsilon-dependent K.

Native source anchors: New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65,
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41,
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a.
RUN94 blob bb5b6bb13884b9d161481e38da357d5fee9a10c8 native receipt run
46102281476 remains conditional, not a check of this new file.

Fix P, eta in (0,1/100), and choose eps,K,C BEFORE the scale x grows,
with eps>0, eps<1/100, (K+1)*eps<=eta, C>=0. K may depend on eta and P;
C may also depend on the chosen eps. It suffices to establish, eventually
on the native quartic grid and only for D' meeting all five RUN96 guards,
    m*rem <= C*f*a*(log b)^K.
No uniform threshold over P or eta required. An arbitrarily large K is
permitted provided the product (K+1)*eps is small. The auditor's fixed-K
criterion supplies this by choosing eps=eta/(K+4). Do not take eps after x.
The signed remainder identity is unchanged. Cancel a before comparing:
    rem*m/(m*a*#thick) <= C*phi(N0)*B^(K+1)/m
        <= C*phi(N0)*exp((eta-1/2)*log x), B=log b,
using f=T*phi, T/B<=#thick, m>=exp(log x/2).
Add the native polar error <= exp(-10^6 log x). For x>=1 it is <=
exp((eta-1/2)*log x). The remaining fixed multiplier C*phi+1 is absorbed
by exp(7 eta log x) eventually, yielding exactly the accepted grid
x^(8 eta-1/2). This is a one-sided bound, not an absolute estimate.
No lower bound on the remainder or uniformity in d is introduced.
The exact original Data.remainder bridge is separately pending.

Source-checks actually executed: 7 unique RUN96 anchors checked, 14
removed/duplicated controls rejected, original quartic and principal bodies reused
with the explicit budget adapter. Prior art search found 4f5a2082 already relaxes
B moment/rank using exact C (b^-5/4), so we did not duplicate a b^-3/2 route.
The native C2 squared-cache job 46108846902 was in_progress, its status.json
and queued A1/B3/A2 statuses were 404 at inspection. No native result for them inferred.
No new kernel compile, graph, rh_scan/prune/reduce/auto/frontier run. All old graphs
and failed candidates preserved. No Main import, no claimed RH theorem as a proof.
The actual arithmetic, primitive supplier, native replay and human assembly remain open.

RESUME HERE: compile this module alone as IntegrationGuardedFinitePower in the
authenticated RUN94 endpoint workspace. Require normal kernel and five axiom
reports, guard the three actual native suppliers and export all five roots with
the existing strict constructor-inclusive 4.35 collector. Verify old star/RH
absence and retained exact remainder/scale guards; compare to RUN94 graph without
claiming global pruning. On failure preserve first actual diagnostic. No A/B/C
cold build; do not duplicate the currently running C2 cache job.
HANDOFF prime/editor/kernel/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHIntegration97

/-- Cancellation and fixed-log-power absorption. No native arithmetic
estimate or positivity of the remainder is inferred here. -/
theorem finite_power_scalar (S Q m a H T F B phi C eta eps X : ℝ) (K : ℕ)
    (hm : 0 < m) (ha : 0 < a) (hH : 0 < H) (hB : 0 < B)
    (hphi : 0 ≤ phi) (hC : 0 ≤ C) (heta : 0 < eta) (hX : 0 ≤ X)
    (hf : F = T*phi) (hthick : T/B ≤ H)
    (hmlo : exp (X/2) ≤ m) (hlog : log B = eps*X)
    (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (hstar : S ≤ C*F*a*B^K) (hpolar : Q ≤ exp (-(1e6*X)))
    (habsorb : log (C*phi+1) ≤ 7*eta*X) :
    S/m/a/H+Q ≤ exp (X*(8*eta+2⁻¹-1)) := by
  have hT : T ≤ H*B := (div_le_iff₀ hB).mp hthick
  have hF : F ≤ H*B*phi := by rw [hf]; exact mul_le_mul_of_nonneg_right hT hphi
  have hnum : C*F*a*B^K ≤ C*(H*B*phi)*a*B^K :=
    mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hF hC) ha.le)
      (pow_nonneg hB.le K)
  have hnorm : S/m/a/H ≤ C*phi*B^(K+1)/m := by
    apply (div_le_iff₀ hH).2
    apply (div_le_iff₀ ha).2
    apply (div_le_iff₀ hm).2
    calc
      S ≤ C*F*a*B^K := hstar
      _ ≤ C*(H*B*phi)*a*B^K := hnum
      _ = C*phi*B^(K+1)/m*H*a*m := by
        rw [pow_succ]
        field_simp [hm.ne'] <;> ring
  have hp : B^(K+1) ≤ exp (eta*X) := by
    calc
      B^(K+1) = exp (log B * ((K+1 : ℕ) : ℝ)) := by
        rw [← Real.rpow_natCast, Real.rpow_def_of_pos hB]
      _ = exp (((K : ℝ)+1)*eps*X) := by
        rw [hlog, Nat.cast_add, Nat.cast_one]
        congr 1 <;> ring
      _ ≤ exp (eta*X) := exp_le_exp.mpr (mul_le_mul_of_nonneg_right hslack hX)
  have hcp : 0 ≤ C*phi := mul_nonneg hC hphi
  have hmain : C*phi*B^(K+1)/m ≤ C*phi*exp ((eta-1/2)*X) := by
    calc
      _ ≤ C*phi*exp (eta*X)/m :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hp hcp) hm.le
      _ ≤ C*phi*exp (eta*X)/exp (X/2) :=
        div_le_div_of_nonneg_left (mul_nonneg hcp (exp_pos _).le) (exp_pos _) hmlo
      _ = _ := by rw [mul_div_assoc, ← exp_sub]; congr 1 <;> ring
  have htail : exp (-(1e6*X)) ≤ exp ((eta-1/2)*X) :=
    exp_le_exp.mpr (by nlinarith [mul_nonneg heta.le hX])
  have hconst : C*phi+1 ≤ exp (7*eta*X) := by
    calc
      _ = exp (log (C*phi+1)) := (exp_log (by linarith : 0 < C*phi+1)).symm
      _ ≤ _ := exp_le_exp.mpr habsorb
  calc
    S/m/a/H+Q ≤ C*phi*exp ((eta-1/2)*X)+exp ((eta-1/2)*X) :=
      add_le_add (hnorm.trans hmain) (hpolar.trans htail)
    _ = (C*phi+1)*exp ((eta-1/2)*X) := by ring
    _ ≤ exp (7*eta*X)*exp ((eta-1/2)*X) :=
      mul_le_mul_of_nonneg_right hconst (exp_pos _).le
    _ = _ := by rw [← exp_add]; congr 1 <;> ring

/-- Same five RUN96 guards, fixed epsilon, K and C, eventual threshold.
The original remainder-definition bridge is a separate module. -/
def GuardedBudgetOn (P : Parameters) (eps : ℝ) (K : ℕ) (C : ℝ) (A : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ A → ∀ D : Data P, D.x = x →
    log D.logB = eps * D.logX → towerDeg D.s / D.logB ≤ #D.thick →
    1e6 * D.logX ≤ D.logX₁ → D.logX₁ ≤ (1e6 * D.logX)^2 →
    primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁ ≤
      exp (-(1e6 * D.logX)) →
    D.m * D.run90Remainder ≤ C * (D.f : ℝ) * (D.a : ℝ) * D.logB ^ K

theorem eventually_primeError_on_set (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (A : Set ℝ) (hstar : GuardedBudgetOn P eps K C A) :
    ∀ᶠ x in atTop, x ∈ A → primeError P.d P.N₀ x ≤ x ^ (8 * eta + 2⁻¹ - 1) := by
  unfold GuardedBudgetOn at hstar
  have hthreshold : ∀ᶠ x : ℝ in atTop,
      log (C * (P.N₀.totient : ℝ) + 1)/(7*eta) ≤ log x :=
    tendsto_log_atTop (mem_atTop _)
  filter_upwards [he.elim (exists_data P), tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).exists_window_sub_mul_le (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left)), hstar, hthreshold, (mem_atTop (1 : ℝ))] with x ⟨D, _, _, l, e, H'⟩ W hs hab hx
  intro hxS
  subst x; simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  obtain ⟨u, ⟨a, b⟩, w⟩ := W (towerDeg D.s / #D.thick) ⟨by bound, D.le_of_hasLogBound⟩
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have starD' := hs hxS D' rfl e H' a b w
  have hm : (0 : ℝ) < D'.m := HasLogBound.pos D'
  have ha : (0 : ℝ) < D'.a := HasLogBound.pos D'
  have hH : (0 : ℝ) < #D'.thick := HasLogBound.pos D'
  have hB : 0 < D'.logB := HasLogBound.pos D'
  have hX : 0 ≤ D.logX := exp_le_exp.mp (by simpa only [exp_zero] using hx)
  have hf : (D'.f : ℝ) = (towerDeg D'.s : ℝ)*(P.N₀.totient : ℝ) := by
    rw [Data.f.eq_1, P.card_infinitePlace_E]
    push_cast <;> ring
  have hAbsorb : log (C*(P.N₀.totient : ℝ)+1) ≤ 7*eta*D.logX := by
    have h := (div_le_iff₀ (by positivity : 0 < 7*eta)).mp hab
    simpa [mul_comm] using h
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a / #D'.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [run90Remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ exp (D.logX*(8*eta+2⁻¹-1)) :=
      finite_power_scalar _ _ _ _ _ _ _ _ _ C eta eps D.logX K
        hm ha hH hB (by positivity) hC heta hX hf H' D'.m_mem.1 e hslack starD' w hAbsorb
    _ = D.x ^ (8*eta+2⁻¹-1) := by rw [Real.rpow_def_of_pos (exp_pos _), log_exp]

theorem endpoint_from_budget (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (hs : GuardedBudgetOn P eps K C RHPrimeWindow94.QuarticScales) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ eta := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1
    (eventually_primeError_on_set P heta he K C hC hslack RHPrimeWindow94.QuarticScales hs)
  obtain ⟨J,hJ⟩ := exists_nat_gt (max X 1)
  refine ⟨J, ?_⟩
  intro k hk
  have hKk : (J : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hk1 : (1 : ℝ) ≤ (k : ℝ) := (le_max_right X 1).trans (hJ.le.trans hKk)
  have hk4 : (k : ℝ) ≤ (k : ℝ)^4 := by
    have hk0 : (0 : ℝ) ≤ (k : ℝ) := by positivity
    have h2 : (k : ℝ) ≤ (k : ℝ)^2 := by
      nlinarith [mul_nonneg hk0 (sub_nonneg.mpr hk1)]
    have h2one : (1 : ℝ) ≤ (k : ℝ)^2 := hk1.trans h2
    have h4 : (k : ℝ)^2 ≤ (k : ℝ)^4 := by
      nlinarith [mul_nonneg (sq_nonneg (k : ℝ)) (sub_nonneg.mpr h2one)]
    exact h2.trans h4
  exact hX _ ((le_max_left X 1).trans (hJ.le.trans (hKk.trans hk4))) ⟨k,rfl⟩

/-- Quantifiers are deliberately eta -> eps,K,C -> eventual x. -/
def ClassGuardedBudget : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ eta : ℝ, 0 < eta → eta < 1/100 →
    ∃ (eps : ℝ) (K : ℕ) (C : ℝ), (0 < eps/6 ∧ eps < 1/100) ∧
      0 ≤ C ∧ ((K : ℝ)+1)*eps ≤ eta ∧
      GuardedBudgetOn P eps K C RHPrimeWindow94.QuarticScales

theorem principal_grid_from_budget (hin : ClassGuardedBudget) :
    RHPrimeWindow88.PrincipalGrid := by
  intro d hd
  let q : ℕ := 1
  have h : d = (9240 * q - 1 : ZMod (18480 * q)) := by
    change (d : ZMod 18480) = (9240 - 1 : ZMod 18480)
    have hcast : ((9240 - 1 : ℕ) : ZMod 18480) = (9240 : ZMod 18480) - 1 := by
      rw [Nat.cast_sub (by norm_num : (1 : ℕ) ≤ 9240)] <;> norm_num
    exact hd.trans hcast
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  refine ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩, ?_⟩
  intro ε he
  have hc : (P.d : ZMod 18480) = (9239 : ZMod 18480) := by
    change d = (9239 : ZMod 18480)
    exact hd
  have he' : 0 < (ε/2) / 6 ∧ ε/2 < 1 / 100 := by
    constructor <;> linarith [he.1,he.2]
  obtain ⟨eps,K,C,heps,hC,hslack,hg⟩ := hin P (by rfl) hc (ε/2) (by linarith [he'.1])
    he'.2
  exact endpoint_from_budget P (by linarith [he'.1]) heps K C hC hslack hg

theorem zeta_line_from_budget (hin : ClassGuardedBudget) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_budget hin)


end RHIntegration97

#print axioms RHIntegration97.finite_power_scalar
#print axioms RHIntegration97.eventually_primeError_on_set
#print axioms RHIntegration97.endpoint_from_budget
#print axioms RHIntegration97.principal_grid_from_budget
#print axioms RHIntegration97.zeta_line_from_budget

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHIntegration97.finite_power_scalar, #[]),
    (``RHIntegration97.eventually_primeError_on_set,
      #[``exists_data, ``IsPolar.exists_window_sub_mul_le, ``Data.run90Remainder_eq,
        ``RHIntegration97.finite_power_scalar]),
    (``RHIntegration97.endpoint_from_budget, #[``RHIntegration97.eventually_primeError_on_set]),
    (``RHIntegration97.principal_grid_from_budget, #[``RHIntegration97.endpoint_from_budget]),
    (``RHIntegration97.zeta_line_from_budget,
      #[``RHIntegration97.principal_grid_from_budget,``RHPrimeWindow88.zeta_line_from_endpoint_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "INTEGRATION97 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "INTEGRATION97 missing value {n}"
    unless req.all (fun k => v.getUsedConstants.contains k) do
      throwError "INTEGRATION97 missing direct supplier {n}"
  logInfo "INTEGRATION97_GUARDED_FINITE_POWER_OK"
