import Run94StarGrid
import Lean

/-!
# Dependency RUN87 — actual normalized guarded budget for a fixed weighted block
28 November 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED Lean; NOT native replayed.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, continuity, state/protocol inspected. Current peer math
b8d892fa480c741958e435466041a6e1c4f92290, audit 17fd8c2630c6d84798812e62d0fca99bb08f8d93,
prime f700db289fd7714b0b7a89f17bdf5c6694e71505 and pair grid 8f441c844617f1bccbb49901246655334c30d34c read.
The RUN102 repair receipt/status paths both returned 404 on state branch.
No new compiler result inferred; RUN99 failure and accepted RUN94 stay separate.
Search weighted block / block quartic / fixed block / weighted aggregate found
no equivalent actual guarded finite-block transport; audit 17fd8c26 explicitly
requests it. Do not duplicate RUN102 repair or the dyadic count equivalence.

## Exact supplier and quantifier order

Reuse the *accepted* RUN94 module bb5b6bb13884b9d161481e38da357d5fee9a10c8,
actual run 46129085575: its native identity, exists_data and polar window
construction. Integration97 blob ff20a7853578c8e3672914710cadf25d98766140
retains all five guards; RUN100 b5dc0f6289561c097357e69a05998efdd47d751c
uses the separate exact cost supplier for pairs. RUN101 already establishes
the pair quartic chord; use the same accepted Run88Endpoint chord/cover.
This file does not require any of the failed RUN99 or unreplayed RUN100 objects.

Fix admissible analytic epsilon, 0<epsilon<.01; fix a finite block of
distinct eligible primes d_i in (X,2X], common M=18480, fixed native
P_i with P_i.d=d_i, P_i.N0=M, positive fixed weights w_i=log(d_i)/d_i,
W=sum_i w_i>0. Fix each construction eps_i in (0,.01) before x grows.
For all sufficiently large common x=k^4, choose independently one record
D_i at x and its polar-adjusted second scale. The five native guards are:
 log D_i.logB=eps_i*log x;
 towerDeg D_i.s/D_i.logB<=#D_i.thick;
 10^6 log x<=D_i.logX1<=(10^6 log x)^2;
 T_i=primeError(d_i,M,x1_i)-towerDeg/#thick*primeError(d_i,1,x1_i)
      <=Q=x^(-10^6).
Existence of a record with these guards for each fixed P_i is exactly
the exists_data and IsPolar.exists_window_sub_mul_le construction in
RUN94.eventually_primeError_on_set, up to the point immediately BEFORE
its hstar invocation. That construction uses no arithmetic star.
A finite intersection of eventual thresholds and finite choice give
the tuple for the same x; x1_i may differ. All denominator positivity
is supplied by D_i.hasLogLower_of_le and HasLogBound.pos as in RUN94.
There is no uniform threshold in X and none is needed because the
block stays fixed as x grows. Do NOT switch the block with k.

Set A_i=m_i*a_i*#thick_i>0, S_i=m_i*run90Remainder_i. Exact identity:
 R_i(x)=S_i/A_i+T_i.
The new arithmetic obligation is only the following ONE signed
aggregate on a selected guarded tuple, at all sufficiently large quartics:
             sum_i w_i S_i/A_i <= W*(x^(4epsilon-1/2)-Q).       (B)
It is not required on every tuple; independent existence of guarded
tuples does not imply existence of one satisfying (B). It is also
enough to substitute signed upper costs K_i>=S_i from the same records
if available; their positivity is not required. No separate per-prime
finite log-power upper bound is assumed. Keep the denominator inside
the sum, even if it varies with x. Summing the exact identity, then
using the upper polar bound, gives sum_i w_i R_i(x)<=W*x^(4epsilon-1/2).
One can weaken (B) further by retaining signed tails exactly as in
RUN101, but the version here isolates an arithmetic budget with only
native automatically selectable polar guards.

At common modulus M, the accepted scalar chord has the same correction
C=((1-t)*a+t*b-x)/x/phi(M) for every record. Sum with fixed nonnegative
weights before estimating: sum_i w_i R_i(x) <= (1-t)*sum_i w_i R_i(a)
 +t*sum_i w_i R_i(b)+W*C.
Apply the actual accepted quartic_cover at tolerance epsilon as in
RUN101. Divide by W only after collecting the common correction.
This yields the exact eventual mean required by audit 17fd8c26:
             sum_i w_i R_i(x)/W <= x^(8epsilon-1/2).
Then retain the audit's real-zero exclusion, dyadic block size
>=X^(1-2epsilon/9), density and logarithmic multiplicity bounds; these
provide the conditional weighted Landau route. This file certifies
the budget/chord transport only, not finite weighted IsPolar, density
contamination, actual cost witnesses, (B), or the global RH root.
No implication from a mere average over blocks depending on x.
No claim (B) holds or is easier for actual data.

Counterexample to dropping normalization: A=(1,10), S=(2,-2), w=(1,1).
Raw signed sum is zero but normalized sum=9/5>0. In particular, a
nonpositive raw signed sum does not prove a nonpositive normalized sum.
Do not use a common normalizer unless it is proved equal on the SAME data.
Original graph RUN98/RUN82, pair RUN84/RUN101 and peer block graph preserved.
New source graph: selected guarded tuple + (B) -> exact RUN94 identity
-> finite weighted budget -> accepted chord/cover -> fixed weighted mean.
No constructor-inclusive graph deletion or new native axiom result.

## Executed finite regression (connector JS, exact small integer arithmetic)
```
let n=0, pass=0, split=0;
for(let a=1;a<=4;a++)for(let b=1;b<=4;b++)for(let w=1;w<=3;w++)for(let v=1;v<=3;v++)
for(let s=-4;s<=4;s++)for(let r=-4;r<=4;r++)for(let t=-2;t<=1;t++)for(let u=-2;u<=1;u++){
 n++;const N=w*s*b+v*r*a,W=w+v,den=a*b;
 if(N>W*den)continue;
 pass++;
 if(N+(w*t+v*u)*den>2*W*den)throw Error("aggregate transport");
 if(s+a*t>2*a || r+b*u>2*b)split++;
}
let chords=0;
for(let w=1;w<=3;w++)for(let v=1;v<=3;v++)for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)
for(let c=-3;c<=3;c++)for(let d=-3;d<=3;d++)for(let t=0;t<=4;t++){
 const C=3,W=w+v,x=(4-t)*a+t*b+C,y=(4-t)*c+t*d+C;
 if(w*x+v*y !== (4-t)*(w*a+v*c)+t*(w*b+v*d)+W*C)throw Error("chord");
 chords++;
}
if(2-2!==0 || 2*10-2<=0)throw Error("raw normalization negative control");
```
186624 examined, 158112 satisfying premise, zero failures; 8784
accepted aggregate cases exceed target at at least one individual endpoint.
108045 chord identities, zero failures; raw-normalization control passed.
These are synthetic exact scalar regressions, not prime data.
Local lean/lake absent; no native rh_scan/prune/reduce/auto/frontier.
All unresolved obligations, source pins and prior axiom evidence retained.

RESUME HERE: in the shared accepted RUN94 analytic environment compile THIS
module as DepWeightedGuardedBlock87, check its four axiom reports, direct
supplier guards, and strict constructor-inclusive graph; only then hand
the weighted endpoint to the audit finite weighted IsPolar consumer.
Do not launch another cold A/B/C build, alter shared schedules or claim
the arithmetic (B) from these checks. HANDOFF prime / audit / integration.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHDepWeightedGuarded87

noncomputable def totalWeight {ι : Type*} [Fintype ι] (w : ι → ℝ) : ℝ :=
  ∑ i, w i

noncomputable def weightedPrimeSum {ι : Type*} [Fintype ι]
    (P : ι → Parameters) (w : ι → ℝ) (x : ℝ) : ℝ :=
  ∑ i, w i * primeError (P i).d (P i).N₀ x

noncomputable def normalizedRemainder {P : Parameters} (D : Data P) : ℝ :=
  D.m * D.run90Remainder / D.m / D.a / #D.thick

noncomputable def tail {P : Parameters} (D : Data P) : ℝ :=
  primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁

theorem primeError_eq_normalized {P : Parameters} (D : Data P)
    (hthick : towerDeg D.s / D.logB ≤ #D.thick) :
    primeError P.d P.N₀ D.x = normalizedRemainder D + tail D := by
  have := D.hasLogLower_of_le hthick
  simp [normalizedRemainder, tail, run90Remainder_eq, tops,
    card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]

theorem weighted_budget_at {ι : Type*} [Fintype ι]
    (P : ι → Parameters) (w : ι → ℝ) (hw : ∀ i, 0 ≤ w i)
    (D : ∀ i, Data (P i)) (x U Q : ℝ)
    (hx : ∀ i, (D i).x = x)
    (hthick : ∀ i, towerDeg (D i).s / (D i).logB ≤ #(D i).thick)
    (htail : ∀ i, tail (D i) ≤ Q)
    (hbudget : (∑ i, w i * normalizedRemainder (D i)) ≤ totalWeight w * (U-Q)) :
    weightedPrimeSum P w x ≤ totalWeight w * U := by
  classical
  calc
    _ = ∑ i, w i * (normalizedRemainder (D i) + tail (D i)) := by
      unfold weightedPrimeSum
      apply Finset.sum_congr rfl
      intro i _
      rw [← hx i, primeError_eq_normalized (D i) (hthick i)]
    _ ≤ ∑ i, w i * (normalizedRemainder (D i) + Q) := by
      apply Finset.sum_le_sum
      intro i _
      exact mul_le_mul_of_nonneg_left (add_le_add_left (htail i) _) (hw i)
    _ = (∑ i, w i * normalizedRemainder (D i)) + totalWeight w * Q := by
      simp only [mul_add, Finset.sum_add_distrib, Finset.sum_mul, totalWeight]
    _ ≤ _ := by linarith only [hbudget]

theorem weighted_chord {ι : Type*} [Fintype ι]
    (P : ι → Parameters) (w : ι → ℝ) (hw : ∀ i, 0 ≤ w i)
    (M A : ℕ) (hM : ∀ i, (P i).N₀ = M)
    (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b) (hx0 : 0 < x)
    (hA : a ≤ A) (hB : b ≤ A) (hX : x ≤ A)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : 1/x = (1-t)/a+t/b) :
    weightedPrimeSum P w x ≤
      (1-t)*weightedPrimeSum P w a+t*weightedPrimeSum P w b+
      totalWeight w*(((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ)) := by
  classical
  let c := ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ)
  have h : ∀ i, primeError (P i).d (P i).N₀ x ≤
      (1-t)*primeError (P i).d (P i).N₀ a+t*primeError (P i).d (P i).N₀ b+c := by
    intro i
    have hi := RHPrimeWindow84.primeError_chord (P i).d (P i).N₀ A a b x t
      ha hb hx0 hA hB hX ht ht1 hx
    have hc : ((Nat.totient (P i).N₀ : ℕ) : ℝ) = (Nat.totient M : ℝ) := by rw [hM i]
    rw [hc] at hi
    exact hi
  calc
    _ ≤ ∑ i, w i * ((1-t)*primeError (P i).d (P i).N₀ a+
          t*primeError (P i).d (P i).N₀ b+c) := by
      unfold weightedPrimeSum
      exact Finset.sum_le_sum (fun i _ => mul_le_mul_of_nonneg_left (h i) (hw i))
    _ = ∑ i, ((1-t)*(w i*primeError (P i).d (P i).N₀ a)+
          t*(w i*primeError (P i).d (P i).N₀ b)+w i*c) := by
      apply Finset.sum_congr rfl
      intro i _
      ring
    _ = _ := by
      change _ = (1-t)*weightedPrimeSum P w a+t*weightedPrimeSum P w b+totalWeight w*c
      simp only [weightedPrimeSum, totalWeight, Finset.sum_add_distrib,
        Finset.mul_sum, Finset.sum_mul]

theorem eventual_weighted_grid {ι : Type*} [Fintype ι]
    (P : ι → Parameters) (w : ι → ℝ) (hw : ∀ i, 0 ≤ w i)
    (M : ℕ) [NeZero M] (hM : ∀ i, (P i).N₀ = M)
    (ε : ℝ) (he : 0 < ε/6 ∧ ε < 1/100)
    (hg : ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
      weightedPrimeSum P w ((k : ℝ)^4) ≤ totalWeight w*((k : ℝ)^4)^(8*(ε/2)+2⁻¹-1)) :
    ∀ᶠ x : ℝ in atTop, weightedPrimeSum P w x ≤ totalWeight w*x^(8*ε+2⁻¹-1) := by
  classical
  have hW : 0 ≤ totalWeight w := Finset.sum_nonneg (fun i _ => hw i)
  obtain ⟨K,hpoint⟩ := hg
  filter_upwards [RHPrimeWindow87.quartic_cover M ε (by linarith [he.1]) he.2 K] with x hc
  obtain ⟨A,k,a,b,t,U,V,hk,ha,hb,ha0,hb0,hx0,hA,hB,hX,ht,ht1,hr,hUa,hUb,hV,hUV⟩ := hc
  have haR : weightedPrimeSum P w a ≤ totalWeight w*U := by
    rw [ha] at hUa ⊢
    exact (hpoint k hk).trans (mul_le_mul_of_nonneg_left hUa hW)
  have hbR : weightedPrimeSum P w b ≤ totalWeight w*U := by
    rw [hb] at hUb ⊢
    exact (hpoint (k+1) (hk.trans (Nat.le_succ k))).trans (mul_le_mul_of_nonneg_left hUb hW)
  calc
    _ ≤ (1-t)*weightedPrimeSum P w a+t*weightedPrimeSum P w b+
        totalWeight w*(((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ)) :=
      weighted_chord P w hw M A hM a b x t ha0 hb0 hx0 hA hB hX ht ht1 hr
    _ ≤ (1-t)*(totalWeight w*U)+t*(totalWeight w*U)+totalWeight w*V :=
      add_le_add (add_le_add (mul_le_mul_of_nonneg_left haR (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbR ht)) (mul_le_mul_of_nonneg_left hV hW)
    _ = totalWeight w*(U+V) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hUV hW

end RHDepWeightedGuarded87

#print axioms RHDepWeightedGuarded87.primeError_eq_normalized
#print axioms RHDepWeightedGuarded87.weighted_budget_at
#print axioms RHDepWeightedGuarded87.weighted_chord
#print axioms RHDepWeightedGuarded87.eventual_weighted_grid

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHDepWeightedGuarded87.primeError_eq_normalized, #[``Data.run90Remainder_eq]),
    (``RHDepWeightedGuarded87.weighted_budget_at, #[``RHDepWeightedGuarded87.primeError_eq_normalized]),
    (``RHDepWeightedGuarded87.weighted_chord, #[``RHPrimeWindow84.primeError_chord]),
    (``RHDepWeightedGuarded87.eventual_weighted_grid,
      #[``RHDepWeightedGuarded87.weighted_chord,``RHPrimeWindow87.quartic_cover])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN87 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN87 missing supplier {n}"
  logInfo "RUN87_WEIGHTED_GUARDED_BLOCK_OK"
