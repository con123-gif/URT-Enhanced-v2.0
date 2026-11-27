import Statements
import New.Endgame.OneSidedCriterion
import Lean

/-!
# RUN88 — isolate the actual RH-only analytic grid root from A/B/C builds
27 November 2026. SOURCE-MATCHED / PREPARED, NOT native checked.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Native source blobs: Statements 1cd1bce93344065936b2b392b23306254e0785ef,
New.Endgame.OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3,
PrimeError 63eb3d79d95ad815878e623b96f237240058c8e2,
New.Main 198ed5bf26aa294898931e0649bc2b88f1389f65 (read, NOT imported).
RUN85 205db835d09d9fc0e4d9bb55fd49ee5bf37295dc,
RUN86 d83e047a862cf2e0f1045e5abdf57cd34bae0cb5,
RUN87 31ac5cd0f90c109d83ebeffc35ce719f3e06c2b7.
Latest peer heads 796fd65b (B3 six-root prep), f26dee0f (A1/A2 same
Theorem A), 6b941c45 (A2 caller). C1/C2 shared 46055305146 in progress
on direct API read; 46050109450 completed success (peer only).

Actual obstacle: RUN85 imports DataExist and ShortAndEnough (the latter
imports LocalStatement, RowVolume, SeesawTheorem), so replaying its
analytic conclusion is unnecessarily tied to expensive A/B/C builds.
The data-independent exact endpoint statement is sufficient:
    ∃ K : ℕ, ∀ k ≥ K, R_M(k^4) ≤ (k^4)^(8η-1/2).
For each fixed d,M,η=ε/2, use the exact existing RUN86 chord and
RUN87 quartic cover to get eventual R_M(x) ≤ x^(8ε-1/2).
This is a specialization of RUN85, not a new estimate. At M=18480,
a=9239, retain exactly the two arithmetic guards on each d demanded
by entireL_ne_zero_of_primeError_le. Use its original β=8ε+1/2
with ε=(min(Re ρ,1)-1/2)/51. The fixed d threshold can depend on d,ε;
no uniform threshold over d is assumed. The reflection argument is
copied from the native New.Main endpoint, with principal-character
nonvanishing instead of all characters. Neither New.Main nor any
claimed RH theorem is imported.

Source-level data adapter (not needed for this analytic-only replay):
RUN85.pointwise_good_data with GoodGrid P η and TailGrid P η gives
EndpointGrid P.d P.N₀ η by K=max Kg Kt and one D from hg at each k.
Its exact construction, before any new native replay, is:
    obtain ⟨Kg,hg⟩ := hg
    obtain ⟨Kt,ht⟩ := ht
    refine ⟨max Kg Kt, ?_⟩
    intro k hk
    obtain ⟨D,hx,l,e,H',hs⟩ := hg k ((le_max_left Kg Kt).trans hk)
    exact RHPrimeWindow85.pointwise_good_data P he D hx l e H' hs
      (ht k ((le_max_right Kg Kt).trans hk))
For each native d in the class, use the SAME Parameters mk and both
guards from RUN85.principal_right_run85 / New.grh, N₀=18480. The
full data adapter still requires the heavy existing modules; do not
count it as replayed by this file. Original and reduced source-level
graphs: RUN85 good-data + tail -> pointwise -> chord/cover -> principal
-> reflection; RUN88 endpoint -> chord/cover -> native one-sided
criterion -> principal -> reflection. No original kernel edge or
axiom evidence deleted. All original files stay intact. The only
candidate change here is separation of native replay workspaces, not
closure of the arithmetic inequality. GoodGrid (star) and TailGrid
remain outstanding at native level. D1 admissibility alone is not star.

Actual verification: exact three peer blobs retrieved, helper
declaration identity checked against RUN85, RUN86 chord and RUN87
cover copied without editing proof bodies. Source imports compared
to actual compact pin. Local lean/lake absent; attempted official
release URL failed DNS resolution in container. No native proof,
scan, prune, auto or axiom audit executed. Shared C1 build already
in progress; no duplicate cold A/B/C build or workflow edit.
Do not infer PASS from the C2 run. Need actual compiler output and
all named axiom reports before promoting status.

RESUME HERE: in the existing pinned compact source workspace,
build only New.Endgame.OneSidedCriterion:olean if not cached, then
run lake env lean <absolute-path-to-this-file>; retain exact log,
exit code, seven root/supplier axiom reports and direct dependency
guards. If cover or chord fails, preserve error and replay standalone
RUN87 / RUN86 rather than rebuilding A/B/C. After success, use actual
RUN85 pointwise caller to supply EndpointGrid, then audit full
constructor-inclusive dependency graph. Handoff kernel/integration.
RH OPEN. No new kernel PASS or full RH proof.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Finset Filter
  MeasureTheory Nat Real vonMangoldt ZMod

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

end RHPrimeWindow84

namespace RHPrimeWindow87

theorem quartic_cover (M : ℕ) [NeZero M] (ε : ℝ)
    (he : 0 < ε) (he' : ε < 1 / 100) :
    ∀ K : ℕ, ∀ᶠ x : ℝ in atTop, ∃ (A k : ℕ) (a b t U V : ℝ),
      K ≤ k ∧ a = (k : ℝ)^4 ∧ b = ((k+1 : ℕ) : ℝ)^4 ∧
      0 < a ∧ 0 < b ∧ 0 < x ∧ a ≤ A ∧ b ≤ A ∧ x ≤ A ∧
      0 ≤ t ∧ t ≤ 1 ∧ 1/x = (1-t)/a+t/b ∧
      a ^ (8*(ε/2)+2⁻¹-1) ≤ U ∧ b ^ (8*(ε/2)+2⁻¹-1) ≤ U ∧
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) ≤ V ∧
      U+V ≤ x ^ (8*ε+2⁻¹-1) := by
  intro K
  have hrootT := (Real.tendsto_rpow_atTop (show 0 < (1/4 : ℝ) by norm_num)).eventually_ge_atTop
    ((max K 1 : ℕ) : ℝ)
  have hbudgetT := (Real.tendsto_rpow_atTop (show 0 < 4*ε by positivity)).eventually_ge_atTop
    (229 : ℝ)
  filter_upwards [eventually_ge_atTop (1 : ℝ), hrootT, hbudgetT] with x hx1 hrootT hbudget
  have hx : 0 < x := by linarith
  let k : ℕ := ⌊x ^ (1/4 : ℝ)⌋₊
  have hk : max K 1 ≤ k := (Nat.le_floor_iff' (by omega : max K 1 ≠ 0)).2 hrootT
  have hk1 : 1 ≤ k := (le_max_right K 1).trans hk
  let q : ℝ := k
  have hq : 1 ≤ q := by exact_mod_cast hk1
  have hq0 : 0 < q := by linarith
  let a : ℝ := q^4
  let b : ℝ := (q+1)^4
  let A : ℕ := (k+1)^4
  have ha : 0 < a := by dsimp [a]; positivity
  have hb : 0 < b := by dsimp [b]; positivity
  have hroot : (x ^ (1/4 : ℝ)) ^ (4 : ℕ) = x := by
    rw [← Real.rpow_natCast, ← Real.rpow_mul hx.le]
    norm_num
  have hf : q ≤ x ^ (1/4 : ℝ) := Nat.floor_le (Real.rpow_nonneg hx.le _)
  have hg : x ^ (1/4 : ℝ) < q+1 := Nat.lt_floor_add_one _
  have hax : a ≤ x := by
    rw [← hroot]
    exact pow_le_pow_left₀ hq0.le hf 4
  have hxb : x < b := by
    rw [← hroot]
    exact pow_lt_pow_left₀ hg (Real.rpow_nonneg hx.le _) (by decide)
  have hab : a < b := hax.trans_lt hxb
  have hgap0 : 0 < b-a := sub_pos.mpr hab
  have hA : (A : ℝ) = b := by simp [A,b,q]
  have hb16 : b ≤ 16*a := by
    calc
      b ≤ (2*q)^4 := by
        dsimp [b]
        exact pow_le_pow_left₀ (by positivity) (by linarith) 4
      _ = _ := by dsimp [a]; ring
  let t := b*(x-a)/(x*(b-a))
  have ht : 0 ≤ t := by dsimp [t]; positivity
  have ht1id : 1-t = a*(b-x)/(x*(b-a)) := by
    dsimp [t]
    field_simp [hx.ne', hgap0.ne'] <;> ring
  have ht1 : t ≤ 1 := by
    have hh : 0 ≤ a*(b-x)/(x*(b-a)) := by positivity
    rw [← ht1id] at hh
    linarith
  have hr : 1/x = (1-t)/a+t/b := by
    rw [ht1id]
    dsimp [t]
    field_simp [ha.ne',hb.ne',hx.ne',hgap0.ne'] <;> ring
  have hcurv : ((1-t)*a+t*b-x)/x = (x-a)*(b-x)/x^2 := by
    dsimp [t]
    field_simp [hx.ne',hgap0.ne'] <;> ring
  have hq2 : q ≤ q^2 := by nlinarith [mul_nonneg hq0.le (sub_nonneg.mpr hq)]
  have hq3 : q^2 ≤ q^3 := by nlinarith [mul_nonneg (sq_nonneg q) (sub_nonneg.mpr hq)]
  have hgap : b-a ≤ 15*q^3 := by
    calc
      b-a = 4*q^3+6*q^2+4*q+1 := by dsimp [a,b]; ring
      _ ≤ _ := by linarith
  have hprod : 4*((x-a)*(b-x)) ≤ (b-a)^2 := by
    nlinarith [sq_nonneg ((x-a)-(b-x))]
  have hgapSq : (b-a)^2 ≤ (15*q^3)^2 :=
    pow_le_pow_left₀ hgap0.le hgap 2
  have hxsq : a^2 ≤ x^2 := pow_le_pow_left₀ ha.le hax 2
  have hcross : ((x-a)*(b-x))*(4*q^2) ≤ 225*x^2 := by
    calc
      _ = q^2*(4*((x-a)*(b-x))) := by ring
      _ ≤ q^2*(b-a)^2 := mul_le_mul_of_nonneg_left hprod (sq_nonneg q)
      _ ≤ q^2*(15*q^3)^2 := mul_le_mul_of_nonneg_left hgapSq (sq_nonneg q)
      _ = 225*a^2 := by dsimp [a]; ring
      _ ≤ _ := mul_le_mul_of_nonneg_left hxsq (by norm_num)
  have hc0 : 0 ≤ (x-a)*(b-x)/x^2 := by positivity
  have hc : (x-a)*(b-x)/x^2 ≤ 225/(4*q^2) :=
    (div_le_div_iff₀ (by positivity) (by positivity)).2 hcross
  have hsqrt : 0 < Real.sqrt x := Real.sqrt_pos.2 hx
  have hbsqrt : Real.sqrt b = (q+1)^2 := by
    rw [show b = ((q+1)^2)^2 by dsimp [b]; ring, Real.sqrt_sq (by positivity)]
  have hrootle : Real.sqrt x ≤ 4*q^2 := by
    calc
      _ ≤ Real.sqrt b := Real.sqrt_le_sqrt hxb.le
      _ = (q+1)^2 := hbsqrt
      _ ≤ (2*q)^2 := pow_le_pow_left₀ (by positivity) (by linarith) 2
      _ = _ := by ring
  have hc' : 225/(4*q^2) ≤ 225/Real.sqrt x := by
    apply (div_le_div_iff₀ (by positivity) hsqrt).2
    linarith [mul_le_mul_of_nonneg_left hrootle (by norm_num : 0 ≤ (225 : ℝ))]
  let s : ℝ := 8*(ε/2)+2⁻¹-1
  have hs : s ≤ 0 := by dsimp [s]; norm_num at *; linarith
  have hs' : -(1/2 : ℝ) ≤ s := by dsimp [s]; norm_num; linarith
  have h16 : (16 : ℝ) ^ (-(1/2 : ℝ)) = 1/4 := by
    rw [Real.rpow_neg (by norm_num), ← Real.sqrt_eq_rpow]
    norm_num
  have h16s : (1/4 : ℝ) ≤ (16 : ℝ)^s := by
    rw [← h16]
    exact Real.rpow_le_rpow_of_exponent_le (by norm_num) hs'
  have h16pos : 0 < (16 : ℝ)^s := Real.rpow_pos_of_pos (by norm_num) _
  have hUa : a^s ≤ 4*x^s := by
    calc
      _ ≤ (x/16)^s := Real.rpow_le_rpow_of_nonpos (by positivity)
        (by linarith [hxb.le.trans hb16]) hs
      _ = x^s/(16 : ℝ)^s := Real.div_rpow hx.le (by norm_num) _
      _ ≤ _ := by
        apply (div_le_iff₀ h16pos).2
        have hmul := mul_le_mul_of_nonneg_left h16s (show 0 ≤ 4*x^s by positivity)
        nlinarith only [hmul]
  have hUb : b^s ≤ 4*x^s :=
    (Real.rpow_le_rpow_of_nonpos ha hab.le hs).trans hUa
  have hφ : 1 ≤ (Nat.totient M : ℝ) := by
    exact_mod_cast (Nat.succ_le_iff.mpr (Nat.totient_pos.mpr (NeZero.pos M)))
  have hφ0 : 0 < (Nat.totient M : ℝ) := by linarith
  have hneg : x ^ (-(1/2 : ℝ)) = (Real.sqrt x)⁻¹ := by
    rw [Real.rpow_neg hx.le, ← Real.sqrt_eq_rpow]
  have hV : ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) ≤ 225*x^s := by
    rw [hcurv]
    calc
      _ ≤ (x-a)*(b-x)/x^2 := by
        apply (div_le_iff₀ hφ0).2
        simpa using mul_le_mul_of_nonneg_left hφ hc0
      _ ≤ 225/Real.sqrt x := hc.trans hc'
      _ = 225*x ^ (-(1/2 : ℝ)) := by rw [hneg, div_eq_mul_inv]
      _ ≤ _ := mul_le_mul_of_nonneg_left
        (Real.rpow_le_rpow_of_exponent_le hx1 hs') (by norm_num)
  have hW : 4*x^s+225*x^s ≤ x ^ (8*ε+2⁻¹-1) := by
    calc
      _ = 229*x^s := by ring
      _ ≤ x^(4*ε)*x^s :=
        mul_le_mul_of_nonneg_right hbudget (Real.rpow_nonneg hx.le _)
      _ = _ := by
        rw [← Real.rpow_add hx]
        congr 1
        dsimp [s]
        ring
  refine ⟨A,k,a,b,t,4*x^s,225*x^s,(le_max_left K 1).trans hk,rfl,?_,
    ha,hb,hx,?_,?_,?_,ht,ht1,hr,?_,?_,hV,hW⟩
  · simp [b,q]
  · rw [hA]; exact hab.le
  · rw [hA]
  · rw [hA]; exact hxb.le
  · exact hUa
  · exact hUb

#print axioms quartic_cover

end RHPrimeWindow87

namespace RHPrimeWindow88

def EndpointGrid (d M : ℕ) [Fact d.Prime] [NeZero M] (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
    primeError d M ((k : ℝ)^4) ≤ ((k : ℝ)^4)^(8*η+2⁻¹-1)

theorem eventual_from_endpoint_grid (d M : ℕ) [Fact d.Prime] [NeZero M]
    (ε : ℝ) (he : 0 < ε / 6 ∧ ε < 1 / 100)
    (hg : EndpointGrid d M (ε/2)) :
    ∀ᶠ x in atTop, primeError d M x ≤ x^(8*ε+2⁻¹-1) := by
  obtain ⟨K,hpoint⟩ := hg
  filter_upwards [RHPrimeWindow87.quartic_cover M ε (by linarith [he.1]) he.2 K] with x hc
  obtain ⟨A,k,a,b,t,U,V,hk,ha,hb,ha0,hb0,hx0,hA,hB,hX,ht,ht1,hr,hUa,hUb,hV,hW⟩ := hc
  have haR : primeError d M a ≤ U := by
    rw [ha] at hUa ⊢
    exact (hpoint k hk).trans hUa
  have hbR : primeError d M b ≤ U := by
    rw [hb] at hUb ⊢
    exact (hpoint (k+1) (hk.trans (Nat.le_succ k))).trans hUb
  calc
    _ ≤ (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) :=
      RHPrimeWindow84.primeError_chord d M A a b x t ha0 hb0 hx0 hA hB hX ht ht1 hr
    _ ≤ (1-t)*U+t*U+V := add_le_add
      (add_le_add (mul_le_mul_of_nonneg_left haR (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbR ht)) hV
    _ = U+V := by ring
    _ ≤ _ := hW

/-- The two source arithmetic guards remain explicit. The quantified grid
bound is required only for the native class and fixed prime. -/
def PrincipalGrid : Prop :=
  ∀ d : Primes, d = (9239 : ZMod 18480) →
    (d.1 % 8 = 7 ∧ (18480 : ℕ).Coprime d) ∧
    ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → EndpointGrid d 18480 (ε/2)

theorem principal_right_from_endpoint_grid (hg : PrincipalGrid)
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
    IsUnit (9240 * q - 1 : ZMod (_ * q))) (fun d hd ↦ ?_) ρ (by grind) _ induced
  have hd' : d = (9239 : ZMod 18480) := by simpa [q] using hd
  obtain ⟨hguards,hgrid⟩ := hg d hd'
  have he : 0 < ε / 6 ∧ ε < 1 / 100 := by grind
  exact ⟨hguards, eventual_from_endpoint_grid d 18480 ε he (hgrid ε he)⟩

theorem zeta_line_from_endpoint_grid (hg : PrincipalGrid) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_from_endpoint_grid hg
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

end RHPrimeWindow88

#print axioms RHPrimeWindow84.hinge
#print axioms RHPrimeWindow84.log_correction
#print axioms RHPrimeWindow84.primeError_chord
#print axioms RHPrimeWindow87.quartic_cover
#print axioms RHPrimeWindow88.eventual_from_endpoint_grid
#print axioms RHPrimeWindow88.principal_right_from_endpoint_grid
#print axioms RHPrimeWindow88.zeta_line_from_endpoint_grid

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[``RHPrimeWindow84.hinge, ``RHPrimeWindow84.log_correction,
      ``RHPrimeWindow84.primeError_chord, ``RHPrimeWindow87.quartic_cover,
      ``RHPrimeWindow88.eventual_from_endpoint_grid,
      ``RHPrimeWindow88.principal_right_from_endpoint_grid,
      ``RHPrimeWindow88.zeta_line_from_endpoint_grid] do
    let axioms ← Lean.collectAxioms n
    unless axioms.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN88 unexpected axiom {n}: {axioms}"
  for (n, required) in #[
      (``RHPrimeWindow84.primeError_chord,
        #[``primeError_eq_sum, ``lambdaClass_nonneg_and_abs_le,
          ``RHPrimeWindow84.hinge, ``RHPrimeWindow84.log_correction]),
      (``RHPrimeWindow88.eventual_from_endpoint_grid,
        #[``RHPrimeWindow84.primeError_chord, ``RHPrimeWindow87.quartic_cover]),
      (``RHPrimeWindow88.principal_right_from_endpoint_grid,
        #[``entireL_ne_zero_of_primeError_le, ``RHPrimeWindow88.eventual_from_endpoint_grid]),
      (``RHPrimeWindow88.zeta_line_from_endpoint_grid,
        #[``RHPrimeWindow88.principal_right_from_endpoint_grid])] do
    let info ← Lean.getConstInfo n
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError m!"RUN88 no theorem value {n}"
    let deps := value.getUsedConstants
    for supplier in required do
      unless deps.contains supplier do
        Lean.throwError m!"RUN88 missing direct edge {n} -> {supplier}"
    Lean.logInfo m!"RUN88_DIRECT|{n}|{deps.map Lean.Name.toString}"
  Lean.logInfo "RUN88_ANALYTIC_GUARDS_OK"
