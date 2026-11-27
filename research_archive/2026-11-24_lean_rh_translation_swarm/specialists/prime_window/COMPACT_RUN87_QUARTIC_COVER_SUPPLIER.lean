import Mathlib

/-!
# RUN87 — close the HUMAN GridCover supplier; standalone native candidate
27 November 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED, NOT kernel checked.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 600487957c8cff9ab77705c1441d0ef4559138ce.
Actual source PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2.
Actual consumer RUN85 (7cd4a52dc7f5e1fab5cb8d5fa73b4b9dae87c9f4),
GridCover and eventual_from_good_grid; RUN86 helper blob
d83e047a862cf2e0f1045e5abdf57cd34bae0cb5.
Read latest peer and shared receipts. RUN86 has no native receipt; local lean/lake
absent. Do not repeat the chord derivation or change the prime sum. Supply
its pending geometry independently, without a cold build of A/B/C.

HUMAN PROOF (the earlier sharper constant is unnecessary here):
Fix 0 < epsilon < 1/100 and K natural, put s=4epsilon-1/2.
For sufficiently large x>=1, q=floor(x^(1/4))>=max(K,1) and
x^(4epsilon)>=229. Set a=q^4,b=(q+1)^4,A=(q+1)^4 (natural),
t=b(x-a)/(x(b-a)). Then a<=x<b<=16a, 0<=t<=1, and
1/x=(1-t)/a+t/b. Both endpoint powers are at most
a^s <= (x/16)^s = x^s/16^s <=4x^s, since -1/2<s<0.
Exact cancellation before estimates:
((1-t)a+tb-x)/x = (x-a)(b-x)/x^2 = C>=0.
The gap b-a=4q^3+6q^2+4q+1<=15q^3. The product
4(x-a)(b-x)<=(b-a)^2. As x>=q^4,
C<=225/(4q^2). Since sqrt(x)<=(q+1)^2<=4q^2,
C/phi(M)<=C<=225/sqrt(x)<=225 x^s (M>0, phi(M)>=1).
Choose U=4x^s,V=225x^s. U+V=229x^s<=x^(8epsilon-1/2).
This is precisely the RUN85 GridCover body with eta=epsilon/2, not
a new prime hypothesis. All thresholds may depend on K and epsilon.
No dependence on D, d or unknown prime data, no new root assumptions.
The existing human proof is thereby expressed as a standalone candidate
for native replay; no claim of a stronger sampling theorem or new RH proof.

Native candidate uses pinned Mathlib Real.lean blob
97c12aed7085a7fc77727567d87e508064b49a18 (rpow/floor algebra),
Asymptotics.lean blob fe64eac072e34331646fe1c3173eeba13c5d016e
(tendsto_rpow_atTop), Nat.totient_pos and Nat.le_floor_iff'.
No Main import. No original kernel edges retired. Source-level candidate
edge: eventual_from_good_grid -> GridCover <- quartic_cover;
GoodGrid (contains star) and TailGrid (fixed P PNT) stay explicit.
After replay, append the checked namespace below to RUN85 (imports first)
and use the exact caller adapter:
  theorem RHPrimeWindow85.gridCover_run87 (P : Parameters) (epsilon : ℝ)
      (he : 0 < epsilon / 6 ∧ epsilon < 1 / 100) :
      RHPrimeWindow85.GridCover P (epsilon/2) epsilon := by
    exact RHPrimeWindow87.quartic_cover P.N₀ epsilon (by linarith [he.1]) he.2
Then specialize zeta_line_from_good_grid hg ht with this supplier. Do not
invoke the claimed upstream RH theorem. Original RUN85/86 unchanged.
Backtrack to RUN85 human GridCover if this tactic proof fails; preserve log.

ACTUAL verification this run: read exact source and Mathlib signatures;
local command -v lean/lake yielded no executable. No new native PASS.
Shared C2 independent determinant chain status blob
5d9bb6069a96cbf0916a8988ba6c595b6023db52, run 46050109450,
returncode 0, ten interface declarations, two full original statements,
four complete graph roots, full_RH_replay=false. This is PEER evidence,
not verification of the prime lane. A1/A2 status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678
returncode 1; repair status not yet published. No registry/workflow changes.

RESUME HERE: run lake env lean on this standalone file in the shared pinned
Mathlib cache, retain exact log and axiom report; then append the adapter
to the actual RUN85 caller with RUN86 chord and replay the combined root.
No duplicate cold A1/A2 build. Hand off to kernel/integration/audit.
RH OPEN: star remains unproved; fixed-P PNT tail and caller native replay
still pending. No completion percentage.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Filter

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
