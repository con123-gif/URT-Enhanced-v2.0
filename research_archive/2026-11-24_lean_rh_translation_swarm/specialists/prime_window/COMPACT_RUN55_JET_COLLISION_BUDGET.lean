import New.Columns.LocalStatement

/-!
# RUN55 — human reconstruction of the local prime gain and error budget
2026-11-26; prime-window lane. Compact pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive focus);
unified witness 7ad9c7c64f53c621ad20422226ad9d0b756ee28e.
RUN54 5441bebcfcdc978a46a39aedb1c24f3de8d3fb6d.
Peer heads read c0a35b56, 0a45200e, c885dc85, 837e9bc7, 6bdfdba6;
theta RUN52 f33fddae concerns neighbour/glue, not this local arithmetic.
Status: source-matched mathematical derivation; scalar Lean checks prepared
but NOT compiled. No synthetic arithmetic tests. No root theorem imported.

Source ledger (relative to grh-compact/src):
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  lines 19–65 (localAsk, gain, loss, collisions), 69–78 (couplingCount, κ),
  96–102 (hasSum_live_inv_pow).
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  lines 21–36, 49–92 (orders, marking, conjugation and balance),
  115–122 (jetExponent and collision divisibility),
  128–151 (collisionSum_le, mul_collisionSum_le_loss, full mark),
  155–163 (lowBoxes and lowColumns), 168–204 (le_jetExponent),
  208–221 (sum_lowColumns_le).
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  lines 184–196 (gaugeLe_markOperator_pow), 233–240 (index bound),
  255–276 (served and unserved gauges), 285–307 (local consumer).
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  lines 15–18 (marked elementary-divisor estimate).
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  lines 25–39 (localAsk regrouping), 83–103 (allowedLoss and sum bound).
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  lines 29–31 (scale), 134 (nominalWeight), 143 (budget).
New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0
  lines 161–162 (log_N_mem_Icc).
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
  Data.short_forms, using local gauge on same ramified rows.

## 1. Exact cancellation of the live prime-power main term

Fix admissible D, prime p<x1 with chi=chiK(d,p) != 1, stage j<m,
and ANY finite set ev of infinite places. Set omega=(1-chi)/2, L=log b,
u=a/(pm), A_sigma=a*1_(sigma in tops), w_sigma=nominalWeight sigma,
B_sigma=lowBoxes j sigma, r_sigma=lowColumns j sigma.
Put t_sigma=A_sigma*1_(sigma notin ev).
At exponent e>=1 write P_e=p^e and sigma'=placeOfInt(-p^e)*sigma.
The actual coupling term is
 C_e(sigma)=min(t_sigma/P_e,r_sigma'+t_sigma')+
             r_sigma/P_e+min(B_sigma/P_e,B_sigma').
Use native lowBoxes bounds kw<=B<=kw+x^60, r<=w+x^60,
a/x1<=w<=a/x, and scale guards x^60<=u, r_sigma/p<=u
(the latter follows from m/x<=1/2 and m*x^60<=a/2).
All quantities are nonnegative. At every live e, put
 M_e=min(A_sigma/P_e,w_sigma')+
       k*min(w_sigma/P_e,w_sigma').
The following upper bound is pointwise:
 C_e(sigma)<=M_e+(A_sigma/P_e)*1_collision
                   - (a/x1)*1_(e=1, sigma in tops intersect ev) + 3u. (*)

Proof: if t_sigma,t_sigma' are both positive this is a collision and
the first minimum is at most A_sigma/P_e, so the added collision term
covers it. If t_sigma>0 and t_sigma'=0, first minimum is at most
min(A_sigma/P_e,w_sigma')+u. If t_sigma=0 it vanishes; on the specified
e=1 correction event min(a/p,w_sigma')>=a/x1, so the subtraction is
valid. In all cases the middle term is <=u. The final minimum is at
most k*min(w_sigma/P_e,w_sigma')+u (both arguments bounded by their
nominal values plus u, since P_e>=1). This proves (*) with 3u; use the
native larger 4u in the summation.

Now use the EXACT identity min(s,t)=s-(s-t)^+ BEFORE applying any
norm, so M_e = (A_sigma+k*w_sigma)/P_e minus the two local asks
before multiplying by omega. Since B_sigma>=kw_sigma, one can replace
the numerator by A_sigma+B_sigma in this upper bound. This is an
inequality in the correct direction, not an assertion of equal boxes.
The native total box count is Nbox=sum_sigma(A_sigma+B_sigma).
For e live (positive and odd or p=d), the geometric coefficient
omega*sum_e p^(-e)=1/(p-1)-nonsplitWeight d p:
for chi=-1 the geometric series is p/(p²-1), omega=1;
for chi=0 it is 1/(p-1), omega=1/2. This is hasSum_live_inv_pow.
Hence Nbox times that coefficient in jetExponent cancels the
Nbox/P_e sum exactly. For e above q=floor(log_p Nbox) the actual
coupling term is absent; the bound WITHOUT 4u is nonnegative
(M_e is nonnegative, no correction e=1 there, and the box replacement
adds nonnegative mass). Here q>=1 from a nonempty tops and
Nbox>=a>=x1>p. Thus no infinitely repeated additive error.
Sum over sigma and e, keeping 4u only on 0<=e<=q, and use
omega<=1, n_(j+1)^3<=u and 5(q+1)<=L² (native scale guards in
le_jetExponent lines 176–180). The result is exactly the native
hypothesis, with no new asymptotic constants:
 J_j(p,ev) >= gain(p)/m - collisionSum(p,ev)
              + omega * #(tops intersect ev) * a/x1
              - f L² a/(pm).
The collision coefficient omega was weakened to 1 since the sum
is nonnegative; no loss of sign. All series are convergent by
domination by a geometric series for p>=2. This reconstructs the
arithmetic part of le_jetExponent, NOT the separate Schur-jet
valuation theorem which supplies the actual local gauges.

## 2. Exact collision support and geometric bound

A collision at e implies p!=d, e odd, o0(p) divides e (native
IsCollision.ne_and_odd_and_dvd, derived from top class and the
order of -p). Thus for non-split p it is inert, and if p is not
short and not served, o0 is odd and o0>r=ceilLogM(p). Consequently
e>=r+1. For any o with every collision at e>=o,
 sum_sigma sum_e (a/p^e)1_collision <= f*a*p^-o/(1-p^-1)
 <=2fa/p^o.
For a short prime use o=1 and L²>=2; for a nonshort unserved prime
use o=r+1 and p^r>=m. In both cases
 m*collisionSum(p,empty)<=loss(p).
If a full mark Λ is available, every top induces l in Λ or star l
in Λ. A collision has odd e, so its two places induce conjugate
primes by inducedPlace_neg_pow_mul_of_odd. At least one place is
therefore in evenPlaces(Λ), contradicting the definition requiring
both outside ev. Thus collisionSum(p,evenPlaces Λ)=0 exactly.
For completeness the balance of marked weights comes from the
permutation sigma -> placeOfInt(-p)*sigma: on marked or conjugate
marked support neither sigma nor its partner is thick (native
notMem_thick). The weight w_j agrees on this support and the induced
prime is conjugated, so the two finite sums are termwise matched
(sum_inducedPlace_sub_star_eq_zero). No independent absolute-value
estimate on these signed terms.

## 3. Same-stage cancellation at the actual gauge caller

In a full mark p is inert, omega=1. Write E=#(tops intersect
evenPlaces Λ)*a/x1, l=loss(p), g=gain(p). The native
sum_lowColumns_le supplies
 #Λ*deltaP(p)+r*sum_even lowColumns <= l/m+E.
The preceding jet bound supplies J_j>=g/m+E-l/m (because full
mark collisions vanish and f L²a/p<=l).
Subtract BEFORE taking any upper bound:
 #Λ*deltaP+r*sum_even lowColumns-J_j <= (2l-g)/m.
Sum j<m, obtaining exponent 2l-g with NO additional E term.
This is precisely the exponent of gaugeLe_Bmu_of_isMarked (255).
It uses the actual same Λ and each actual stage, not independent
optimizers. For ev empty the exponent is at most
 m*collisionSum+l-g<=2l-g for unserved p (264).
For any non-split p the geometric bound o=1 gives collisionSum
<=2fa/p, so multiplying an integral column by p^jetCeil with
jetCeil=ceil(2mfa/p) cancels this entire additional loss:
 valuation exponent <= l-g (272).
The served column module is the SUM Y^m M + p^jetCeil M, not its
intersection, where Y=product of the native markOperators on Λ.
Both summands satisfy the weaker common gauge exponent 2l-g.
Linearity and the nonarchimedean integral lattice imply the same
for their sum; no independent choices for different twists.
The native HasType bound for Y^m gives IndexDvd exponent <=3l dim.
Since l>=1, integer beta<g-3l+1 implies beta<g-2l; hence the
p^(-beta) scaling is integral on this same submodule. For unserved
p the whole M suffices with index exponent zero. For ordinary
primes p!=N outside nonsplitPrimes, native gaugeLe_one (p!=d is
forced by p outside the nonsplit range and d<x1), allowedLoss=0,
and integer beta<1 implies beta<=0. At p=N the Fourier operator
supplier remains unchanged. Every conclusion keeps all padic
places, all coprime twists, good data and ramified restrictions of
exists_indexDvd_Bmu_divisible. This does NOT prove the underlying
marked elementary-divisor, Hecke transfer, Schur-jet valuation,
or level Fourier operator assertions from scratch.

## 4. Direct finite allowed-loss budget

Let t=log x1, L=log b, H=sum_(1<=c<=floor x1) 1/c<=1+t.
The native IsShortPrime for p>=2 is m|(p-1) or m|(p+1);
write p=mc±1 with c>=1 (m>=2). Each sign gives an injective
index c<=floor x1; m/p<=2/c. For ANY finite prime subset below
x1, assign nonshort primes to c=p, and bound short primes by the
two sign sums. Then the sum of weights 1/p (nonshort) or m/p
(short) is <=H+2H+2H=5H. All summands are nonnegative, so the
arbitrary finite U of natural numbers in the native theorem causes
no problem, including p=0,1 where allowedLoss is zero.
Multiplying by log p<=t and 3fa L² gives <=15fa L² t(1+t).
The single separate level term is at most
 4mfb log N <=120m²fb L<=480fa L
using log_N_mem_Icc, m²<=4x, a>=xb. N>x1, so no double count.
Divide by fa L²>0. It suffices that 15t(1+t)+480/L<=L.
From scale t>=1, L>=10^6 t and t^6<=L. If t<=100 then
t²<=100t<=L/10000; if t>100 then t^6>=10000*t², same bound.
Thus 15t(1+t)<=30t²<=3L/1000, and 480/L<=1<=L/1000.
Sum <=4L/1000<=L. This proves sum_allowedLoss_mul_log_le
for all finite U, with the native budget fa L³ and no prime
distribution theorem. Do not use smaller constants elsewhere.

## Dependency / verification boundary

Original DAG for this slice retained: localAsk/lowBoxes/collision
support -> le_jetExponent; marked support and sum_lowColumns_le
+ le_jetExponent -> gaugeLe_Bmu_of_isMarked via gaugeLe_markOperator_pow;
collisionSum and jetCeil -> both unserved and scaled columns;
HasType and level Fourier -> exists_indexDvd_Bmu_divisible;
finite loss sum and rational normalization -> Data.short_forms.
Reduced human slice replaces only scalar summation and cancellation
arguments in that graph, NOT their geometric suppliers or the full
root proof. No global edges deleted; no new axioms introduced in
the human argument. Native rh_prune/rh_scan/rh_reduce/rh_auto/
rh_auto_frontier unavailable locally (lean and lake both absent);
the source-matched scalar certificates below are ready for replay,
not claimed checked. Targeted CI 45799225653 was actually queried:
pick, run (rh-compact-targeted-replay-20261126), record all success;
that historical job does NOT compile this new file. Original and
reduced graph archives and axioms evidence left untouched.

RESUME HERE: take the actual Schur-jet primitive norm_schurJet_le
used in LocalStatement.mem_raises, and then its marked operator
elementary-divisor supplier Columns.hasType_markOperator in
TwistedHeckeType.lean. Reconstruct one actual uniform stage witness
rather than refine the sufficient scalar loss budget. Coordinate
with theta and character specialists; keep all source guards.
HANDOFF TO: integration/editor (sections 1–4), formal audit
(pointwise min and all e quantifiers), theta/character and kernel
(targeted replay). No completed human RH proof claimed.
-/

namespace PrimeWindowRun55

lemma min_error (a b u : ℝ) {x y : ℝ}
    (hx : x ≤ a + u) (hy : y ≤ b + u) :
    min x y ≤ min a b + u := by
  rcases le_total a b with h | h
  · rw [min_eq_left h]
    exact (min_le_left x y).trans hx
  · rw [min_eq_right h]
    exact (min_le_right x y).trans hy

lemma stage_cancel {X J l g E m : ℝ} (hm : 0 < m)
    (hX : X ≤ l / m + E) (hJ : g / m + E - l / m ≤ J) :
    X - J ≤ (2 * l - g) / m := by
  rw [sub_div, mul_div_assoc]
  linarith

lemma unserved_budget {m C l g : ℝ} (h : m * C ≤ l) :
    m * C + l - g ≤ 2 * l - g := by linarith

lemma scaling_budget {C l g m j : ℝ} (h : m * C ≤ j) :
    m * C + l - g - j ≤ l - g := by linarith

lemma allowed_loss_scalar {t L : ℝ} (ht : 1 ≤ t)
    (hL : 1000000 * t ≤ L) (hpow : t ^ 6 ≤ L) :
    15 * t * (1 + t) + 480 / L ≤ L := by
  have hp : 0 < L := by linarith
  have hlarge : 1000000 ≤ L := by linarith
  have ht2 : t ^ 2 ≤ L / 10000 := by
    by_cases h : t ≤ 100
    · nlinarith [mul_nonneg (sub_nonneg.mpr h) (show 0 ≤ t by linarith)]
    · have ht4 : 10000 ≤ t ^ 4 := by
        have h2 : 10000 ≤ t ^ 2 := by nlinarith [sq_nonneg (t - 100)]
        nlinarith [sq_nonneg (t ^ 2 - 10000)]
      have hprod : 0 ≤ (t ^ 4 - 10000) * t ^ 2 :=
        mul_nonneg (sub_nonneg.mpr ht4) (sq_nonneg t)
      nlinarith
  have hdiv : 480 / L ≤ 1 := (div_le_iff₀ hp).2 (by linarith)
  nlinarith [mul_nonneg (sub_nonneg.mpr ht) (show 0 ≤ t by linarith)]

#check Data.le_jetExponent
#check Data.mul_collisionSum_le_loss
#check Data.IsFullMark.collisionSum_evenPlaces_eq_zero
#check Data.IsMarked.sum_lowColumns_le
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#check Data.exists_indexDvd_Bmu_divisible
#check Data.sum_allowedLoss_mul_log_le
#print axioms stage_cancel
#print axioms allowed_loss_scalar
end PrimeWindowRun55
