import Statements
import New.Data.DataExist
import New.Endgame.ShortAndEnough
import New.Endgame.PrimeError
import Lean

/-!
# RUN85 — pointwise same-data star to quartic cover to actual principal caller
27 November 2026. HUMAN SOURCE-MATCHED integration; Lean PREPARED, NOT replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current mission/spine/ledger, AGENTS, SWARM, HANDOFF, EXPANSION and
recent peer head ca25fd3d (strict graph), c4faecaf3 (A1 elaboration repairs),
f8ecd08a (A2 area-cancellation repair), 73e689b8 (B3 fixing energy target).
Source blobs: New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65,
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2,
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e.
RUN83 blob 8baf3c0cf93d003bc3c42dc017b755753848cc7a, RUN84 blob 1a431780edf213c28f2b7918627c7983acbf75bc.
No new optimization of grid or arithmetic constants. Instead close the
candidate interface gap: RUN83 was eventual on REAL x, so it cannot
directly consume RUN84's eventual NATURAL index witnesses. Factor the
actual remainder_eq / HasLogBound calculation out as a pointwise
supplier, then apply it separately at k^4 and (k+1)^4 with one common
threshold, not one common D. This prevents illicit filter transfer.

Exact premises:
P fixed, eta=epsilon/2, 0<eta/6 and eta<1/100, P.N0=18480.
For all natural k>=Kg a good D with x=k^4 and the five RUN83 properties;
for all k>=Kt the fixed-P uniform PNT tail at that same grid scale.
Take K=max Kg Kt, and at each sufficiently large real x let k=floor
(x^(1/4)), a=k^4, b=(k+1)^4. Then k>=max(K,1), a<=x<=b.
Use t=(1/a-1/x)/(1/a-1/b), and natural A=(k+1)^4. No endpoint
requires the other endpoint's data. The exact signed primeError
identity and positivity yield the RUN84 chord; the corrective term
is at most 225/(4 phi(M) sqrt(x)). For 0<epsilon<1/100 set
U=4*x^(4epsilon-1/2), V=225/(4 phi(M) sqrt(x)).
Because b<=16a, the two endpoint powers with exponent
8eta-1/2=4epsilon-1/2 are <=U. U+V<=x^(8epsilon-1/2)
eventually, since division by x^(4epsilon-1/2) leaves
4+225/(4 phi(M) x^(4epsilon)) <= x^(4epsilon).
This is the HUMAN proof of the explicit GridCover interface below;
the floor/rpow eventual cover and fixed-P PNT tail are not yet native
certificates. Do not count either as a verified Lean supplier.
The good-data existence itself remains UNPROVED. D1 only provides
admissibility, not star. No unconditional root closure.

Replay detail: RUN84's reciprocal_curvature used nlinarith after
clearing denominators. Replace its implicit polynomial search by the
explicit zero multiplier (1/x-(1-t)/a-t/b)*a*b*x; its target difference
is exactly that numerator divided by x^2. This is a pre-elaboration
repair, NOT a reported compiler error. Reuse all other RUN84 helpers
verbatim from the recorded blob; principal_right copied verbatim from
RUN83. All historical files and graphs remain untouched.
Original graph: Main.star_inequality, DataExist, polar window ->
Main.eventually_primeError_le_rpow -> principal -> reflection.
Candidate graph: per-grid star+PNT tail -> pointwise remainder_eq and
HasLogBound -> endpoint bounds -> finite chord/cover -> same principal
and reflection. No claimed transitive dependency deletion. Guard
direct edges and print actual axioms on successful replay; full graph
audit remains pending. Cache key pin,P,eta,k,D and cutoff A,a,b,t.
Backtrack to RUN83 real-scale formulation if native grid transport fails.

Actual verification: retrieved pinned source, compared exact main
consumer and the two prepared artifacts; checked threshold and
endpoint quantifiers algebraically. Local lean/lake absent, so no
native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier, no new
kernel PASS, no claimed execution of prepared guards. The state
branch A1/A2 compute status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678
was re-fetched: returncode 1, run 46023465491; peer repairs are
prepared, not verified. Do not infer PASS from workflow green.
Current shared compute registry has no separate grid replay job;
coordinate with kernel/integration, reuse existing compact workspace,
do not launch another cold A1/A2 build or edit protected workflows.
RESUME HERE: replay first the RUN84 helper part in this exact file with
only New.Endgame.PrimeError (copy the helper block to a separate file);
then in the existing shared compact workspace run the full file with
lake env lean, retain first errors or exact axiom/edge guards; native
GridCover and PNT tail remain explicit pending suppliers.
HANDOFF TO kernel, integration, editor and audit. RH OPEN.
-/

open ArithmeticFunction DirichletCharacter Complex Finset Filter
  MeasureTheory Nat Real vonMangoldt

namespace RHPrimeWindow84

theorem hinge (u v t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    max ((1-t)*u+t*v) 0 ≤ (1-t)*max u 0+t*max v 0 := by
  apply max_le
  · exact add_le_add
      (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (le_max_left _ _) ht)
  · positivity

theorem log_correction (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hx : 0 < x) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    (1-t)*Real.log a+t*Real.log b-Real.log x ≤ ((1-t)*a+t*b)/x-1 := by
  calc
    _ = (1-t)*Real.log (a/x)+t*Real.log (b/x) := by
      rw [Real.log_div ha.ne' hx.ne', Real.log_div hb.ne' hx.ne']
      ring
    _ ≤ (1-t)*(a/x-1)+t*(b/x-1) := add_le_add
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos ha hx))
        (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos hb hx)) ht)
    _ = _ := by ring

theorem reciprocal_curvature (a b x t : ℝ) (ha : a ≠ 0) (hb : b ≠ 0)
    (hx0 : x ≠ 0) (hx : 1/x = (1-t)/a+t/b) :
    ((1-t)*a+t*b)/x-1 = (x-a)*(b-x)/x^2 := by
  have h : a*b-((1-t)*b+t*a)*x = 0 := by
    calc
      _ = (1/x-((1-t)/a+t/b))*(a*b*x) := by
        field_simp [ha,hb,hx0] <;> ring
      _ = 0 := by rw [hx]; ring
  apply eq_of_sub_eq_zero
  calc
    _ = (a*b-((1-t)*b+t*a)*x)/x^2 := by
      field_simp [hx0] <;> ring
    _ = 0 := by rw [h]; simp

/-- Exact compact prime-error chord on a COMMON finite cutoff. -/
theorem primeError_chord (d M : ℕ) [Fact d.Prime] [NeZero M]
    (A : ℕ) (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b) (hx0 : 0 < x)
    (hA : a ≤ A) (hB : b ≤ A) (hX : x ≤ A)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : 1/x = (1-t)/a+t/b) :
    primeError d M x ≤ (1-t)*primeError d M a+t*primeError d M b+
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) := by
  let S (z : ℝ) := ∑ n ∈ Finset.Icc 1 A,
    lambdaClass d M n * ((A : ℝ)/n-(A : ℝ)/z)⁺ / (A : ℝ)
  let K := (logDerivMean d M 1).re
  have hRa : primeError d M a = S a-Real.log a/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A ha hA)
  have hRb : primeError d M b = S b-Real.log b/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hb hB)
  have hRx : primeError d M x = S x-Real.log x/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hx0 hX)
  have hS : S x ≤ (1-t)*S a+t*S b := by
    dsimp [S]
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro n hn
    have hn0 := (lambdaClass_nonneg_and_abs_le d M n).1
    have hid : (A : ℝ)/n-(A : ℝ)/x =
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)+t*((A : ℝ)/n-(A : ℝ)/b) := by
      calc
        _ = (A : ℝ)/n-(A : ℝ)*(1/x) := by ring
        _ = _ := by rw [hx]; ring
    have hh : ((A : ℝ)/n-(A : ℝ)/x)⁺ ≤
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+t*((A : ℝ)/n-(A : ℝ)/b)⁺ := by
      change max _ 0 ≤ (1-t)*max _ 0+t*max _ 0
      rw [hid]
      exact hinge _ _ t ht ht1
    calc
      _ ≤ lambdaClass d M n *
          ((1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+
            t*((A : ℝ)/n-(A : ℝ)/b)⁺)/(A : ℝ) :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hh hn0)
          (Nat.cast_nonneg A)
      _ = _ := by ring
  have hL := log_correction a b x t ha hb hx0 ht ht1
  have hL' : (1-t)*Real.log a+t*Real.log b-Real.log x ≤
      ((1-t)*a+t*b-x)/x := by
    calc
      _ ≤ ((1-t)*a+t*b)/x-1 := hL
      _ = _ := by field_simp [hx0.ne']
  have hLd := div_le_div_of_nonneg_right hL'
    (Nat.cast_nonneg (α := ℝ) (Nat.totient M))
  calc
    _ = S x-Real.log x/(Nat.totient M : ℝ)-K := hRx
    _ ≤ ((1-t)*S a+t*S b)-Real.log x/(Nat.totient M : ℝ)-K :=
      sub_le_sub_right (sub_le_sub_right hS _) _
    _ = (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*Real.log a+t*Real.log b-Real.log x)/(Nat.totient M : ℝ) := by
      rw [hRa,hRb]; ring
    _ ≤ _ := add_le_add_left hLd _

/-- Explicit cover interface; the quartic arithmetic and same-D supplier
are proved conditionally in the human argument, not hidden in this lemma. -/
theorem eventual_from_cover (d M : ℕ) [Fact d.Prime] [NeZero M]
    (U V W : ℝ → ℝ)
    (hcover : ∀ᶠ x in atTop, ∃ (A : ℕ) (a b t : ℝ),
      0 < a ∧ 0 < b ∧ 0 < x ∧ a ≤ A ∧ b ≤ A ∧ x ≤ A ∧
      0 ≤ t ∧ t ≤ 1 ∧ 1/x = (1-t)/a+t/b ∧
      primeError d M a ≤ U x ∧ primeError d M b ≤ U x ∧
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) ≤ V x)
    (hbudget : ∀ᶠ x in atTop, U x + V x ≤ W x) :
    ∀ᶠ x in atTop, primeError d M x ≤ W x := by
  filter_upwards [hcover,hbudget] with x hc hW
  obtain ⟨A,a,b,t,ha,hb,hx,hA,hB,hX,ht,ht1,hr,haU,hbU,hV⟩ := hc
  calc
    _ ≤ (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) :=
      primeError_chord d M A a b x t ha hb hx hA hB hX ht ht1 hr
    _ ≤ (1-t)*U x+t*U x+V x := add_le_add
      (add_le_add (mul_le_mul_of_nonneg_left haU (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbU ht)) hV
    _ = U x+V x := by ring
    _ ≤ W x := hW

end RHPrimeWindow84


open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHPrimeWindow85

/-- Pointwise native cancellation, independent of which filter selected x. -/
theorem pointwise_good_data (P : Parameters) {η x : ℝ}
    (h : 0 < η / 6 ∧ η < 1 / 100)
    (D : Data P) (hx : D.x = x) (l : D.logX₁ = x ^ (η / 6))
    (e : log D.logB = η * log x) (H' : towerDeg D.s / D.logB ≤ #D.thick)
    (hs : D.m * D.remainder ≤ D.logB ^ 2 * D.budget)
    (W : ∀ c ∈ Set.Icc (0 : ℝ) (exp (η * log x)),
      primeError P.d P.N₀ (exp (x ^ (η / 6))) -
      c * primeError P.d 1 (exp (x ^ (η / 6))) ≤ exp (-(1e6 * log x))) :
    primeError P.d P.N₀ x ≤ x ^ (8 * η + 2⁻¹ - 1) := by
  subst x
  simp only [log_exp] at e W
  have := D.hasLogLower_of_le H'
  have hb : D.logB = exp (η * D.logX) := by
    rw [← e, exp_log (HasLogBound.pos D)]
  have hc : towerDeg D.s / #D.thick ∈ Set.Icc (0 : ℝ) (exp (η * D.logX)) :=
    ⟨by bound, by rw [← hb]; exact D.le_of_hasLogBound⟩
  have w := W _ hc
  rw [← l] at w
  calc primeError P.d P.N₀ D.x = D.m * D.remainder / D.m / D.a / #D.thick +
      (primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁) := by
      simp [remainder_eq, tops, card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]
    _ ≤ D.logB ^ 2 * D.budget / D.m / D.a / #D.thick + exp (-(1e6 * D.logX)) := by
      grw [hs, w]
    _ ≤ _ := D.le_of_hasLogBound (by grind)

/-- Explicit grid good-data input, NOT a consequence of admissible-data existence. -/
def GoodGrid (P : Parameters) (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k → ∃ D : Data P,
    D.x = (k : ℝ)^4 ∧ D.logX₁ = ((k : ℝ)^4) ^ (η / 6) ∧
    log D.logB = η * log ((k : ℝ)^4) ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget

/-- Tail on the very same fixed-parameter grid; ordinary PNT supplier retained. -/
def TailGrid (P : Parameters) (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
    ∀ c ∈ Set.Icc (0 : ℝ) (exp (η * log ((k : ℝ)^4))),
      primeError P.d P.N₀ (exp (((k : ℝ)^4) ^ (η / 6))) -
      c * primeError P.d 1 (exp (((k : ℝ)^4) ^ (η / 6))) ≤
        exp (-(1e6 * log ((k : ℝ)^4)))

/-- Geometric real-scale cover, independent of prime-error estimates.
The exact HUMAN proof and the remaining native floor/rpow task are above. -/
def GridCover (P : Parameters) (η ε : ℝ) : Prop :=
  ∀ K : ℕ, ∀ᶠ x in atTop, ∃ (A k : ℕ) (a b t U V : ℝ),
    K ≤ k ∧ a = (k : ℝ)^4 ∧ b = ((k+1 : ℕ) : ℝ)^4 ∧
    0 < a ∧ 0 < b ∧ 0 < x ∧ a ≤ A ∧ b ≤ A ∧ x ≤ A ∧
    0 ≤ t ∧ t ≤ 1 ∧ 1/x = (1-t)/a+t/b ∧
    a ^ (8*η+2⁻¹-1) ≤ U ∧ b ^ (8*η+2⁻¹-1) ≤ U ∧
    ((1-t)*a+t*b-x)/x/(Nat.totient P.N₀ : ℝ) ≤ V ∧
    U+V ≤ x ^ (8*ε+2⁻¹-1)

theorem eventual_from_good_grid (P : Parameters) {η ε : ℝ}
    (he : 0 < η / 6 ∧ η < 1 / 100)
    (hg : GoodGrid P η) (htail : TailGrid P η) (hcover : GridCover P η ε) :
    ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8*ε+2⁻¹-1) := by
  obtain ⟨Kg,hg⟩ := hg
  obtain ⟨Kt,htail⟩ := htail
  let K := max Kg Kt
  have hpoint (k : ℕ) (hk : K ≤ k) :
      primeError P.d P.N₀ ((k : ℝ)^4) ≤ ((k : ℝ)^4) ^ (8*η+2⁻¹-1) := by
    obtain ⟨D,hx,l,e,H',hs⟩ := hg k (le_trans (le_max_left Kg Kt) hk)
    exact pointwise_good_data P he D hx l e H' hs
      (htail k (le_trans (le_max_right Kg Kt) hk))
  filter_upwards [hcover K] with x hc
  obtain ⟨A,k,a,b,t,U,V,hk,ha,hb,ha0,hb0,hx0,hA,hB,hX,ht,ht1,hr,hUa,hUb,hV,hW⟩ := hc
  have haR : primeError P.d P.N₀ a ≤ U := by
    rw [ha] at hUa ⊢
    exact (hpoint k hk).trans hUa
  have hbR : primeError P.d P.N₀ b ≤ U := by
    rw [hb] at hUb ⊢
    exact (hpoint (k+1) (le_trans hk (Nat.le_succ k))).trans hUb
  calc
    _ ≤ (1-t)*primeError P.d P.N₀ a+t*primeError P.d P.N₀ b+
        ((1-t)*a+t*b-x)/x/(Nat.totient P.N₀ : ℝ) :=
      RHPrimeWindow84.primeError_chord P.d P.N₀ A a b x t ha0 hb0 hx0 hA hB hX ht ht1 hr
    _ ≤ (1-t)*U+t*U+V := add_le_add
      (add_le_add (mul_le_mul_of_nonneg_left haR (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbR ht)) hV
    _ = U+V := by ring
    _ ≤ _ := hW

lemma principal_right_run85
    (hbound : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 →
      ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1))
    (ρ : ℂ) (hρ : 1 / 2 < ρ.re) (hpole : ρ ≠ 1) :
    LFunction (1 : DirichletCharacter ℂ 1) ρ ≠ 0 := by
  intro z
  let q : ℕ := 1
  letI : NeZero q := ⟨by norm_num [q]⟩
  let χ : DirichletCharacter ℂ q := 1
  have zero : LFunction χ ρ = 0 := z
  have pole : χ ≠ 1 ∨ ρ ≠ 1 := Or.inr hpole
  set ε := (ρ.re ⊓ 1 - 2⁻¹) / 51
  have induced : entireL (χ.changeLevel (dvd_mul_left q 18480)) ρ = 0 := by
    rw [entireL]
    grind [LFunction_changeLevel, changeLevel_eq_one_iff]
  refine entireL_ne_zero_of_primeError_le (β := 8 * ε + 2⁻¹) (by grind)
    (.of_mul_eq_one (9240 * q - 1) (by grind [natCast_self (18480 * q)]) :
    IsUnit (9240 * q - 1 : ZMod (_ * q))) (fun d h ↦ ?_) ρ (by grind) _ induced
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  exact ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩,
    hbound P (by rfl) ε (by grind)⟩

theorem zeta_line_from_good_grid
    (hg : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 → GoodGrid P (ε/2))
    (ht : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 → TailGrid P (ε/2))
    (hc : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 → GridCover P (ε/2) ε) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_run85 (fun P hP ε he ↦
    eventual_from_good_grid P (η := ε/2) (ε := ε)
      (by constructor <;> linarith [he.1,he.2])
      (hg P hP ε he) (ht P hP ε he) (hc P hP ε he))
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

end RHPrimeWindow85

#print axioms RHPrimeWindow84.reciprocal_curvature
#print axioms RHPrimeWindow84.primeError_chord
#print axioms RHPrimeWindow85.pointwise_good_data
#print axioms RHPrimeWindow85.eventual_from_good_grid
#print axioms RHPrimeWindow85.principal_right_run85
#print axioms RHPrimeWindow85.zeta_line_from_good_grid
