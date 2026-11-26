import New.Columns.JetExponentBound
import Mathlib.Tactic

/-!
# RUN63 — numerical suppliers at the actual A local index caller
26 Nov 2026. Human source-matched derivation, independent audit and native
replacement compilation pending. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first,
mandatory engine); current manuscript blob d6bcd68693074c5d4220541d68c61a222287cb42.
Peer HEAD 059f9ed689e4e62a89a26a31a299966227968c25; e1d32e04 editor,
44a5d463 vacuum and ac8374d8 level N. Predecessor RUN62 5a6ce275.
No URT assumptions, new architecture, or finite regression in lieu of proof.

Source ledger:
- New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a:
  lowColumns_lowBoxes_bounds, le_jetExponent, IsMarked.sum_lowColumns_le.
- New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b:
  localAsk, gain, loss, couplingCount, κ, hasSum_live_inv_pow.
- New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b:
  IsMarked, evenPlaces, lowColumns, lowBoxes.
- New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
- New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
- New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
- New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
  255–309 gaugeLe_Bmu_of_isMarked, gaugeLe_collisionSum, gaugeLe_pow_jetCeil_smul,
  exists_indexDvd_Bmu_divisible.

## 1. Three low-column/box inequalities

Fix D admissible, p prime < x1 nonsplit, j<m. Write n=n(j+1), E=x^60,
u=a/(pm), w_sigma=nominalWeight(sigma), R_sigma=lowColumns(j,sigma),
B_sigma=lowBoxes(j,sigma). The unique height k<n contributes
k*(w_1-floor((k+t+1)/2)) boxes. Here k>1, w_1>=w_sigma+h2, and
h2>=floor((k+t+1)/2) by Magnitudes, so B_sigma>=k*w_sigma.
The other heights contribute at most h columns each by κ; there are at
most n heights and each height <n. Hence
 R_sigma <= w_sigma + x^42 + n*h,
 B_sigma <= k*w_sigma + k*x^42 + n^2*h.
For example from the actual HasLogBound exponents (logX is enormous),
n<=x^6, k<=x^6, h<=x^41, f<=x^12, m<=2 sqrt(x),
x^42+n*h<=x^60 and k*x^42+n^2*h<=x^60.
These prove the exact three bounds used at le_jetExponent.
No estimate for the height-one columns is used here.

Useful shared scale consequences (all from admissible D):
u>=a/(x1*m)>=x^100, since a>=exp(logB+logX),
logB>=10^6 logX1 and logX1>=10^6 logX;
E<=u/2, n^3<=u; R_sigma<=a/m, since
w_sigma<=a/x, m<=2 sqrt(x), E<=a/(2m), m<=x/2.
Therefore R_sigma/p^e<=u for every e>=1.
For p=d, d<=P.c<=log(logB)/10^12<=logX/10^14,
so d*m<=x/2 and k*d*m<=x1/2. Consequently
R_sigma<=u at EVERY sigma and B_sigma<=u for nonthick sigma
when p=d. These statements retain the actual scales and p<x1.

## 2. Exact termwise live coupling bound, including the rebate

Set omega=(1-chiK(p))/2 in {1/2,1}; let S_sigma=a if sigma is top,
0 otherwise, and t_sigma=S_sigma if sigma outside ev, 0 otherwise.
For e>=1 live (odd or p=d), q=p^e and sigma'=place(-p^e)*sigma.
Write A=S_sigma/q, t'=t_sigma', B=B_sigma, B'=B_sigma',
w=w_sigma, w'=w_sigma', R'=R_sigma'. The unweighted local ask
at sigma is I_top*(a/q-w')_+ + k*(w/q-w')_+.
Let rebate=a/x1 if e=1 and sigma in tops intersect ev, else 0.
The claim (stronger than necessary because the asks are unweighted) is
 couplingCount + unweighted ask + rebate
 <= (S_sigma+B)/q + I_collision*a/q + 4u.                 (T)

For the B part, if w/q<=w' the positive part is zero and min(B/q,B')
<= B/q. Otherwise use B'<=k*w'+E, B>=k*w to cancel w':
 min(B/q,B') + k*(w/q-w') <= k*w/q+E <= B/q+E.

For the height-one part there are exactly four cases.
- Not a top: t_sigma=0, ask and rebate zero.
- Top in ev: t_sigma=0. At e=1, w'>=a/x1 and p<x1 imply
  (a/p-w')_+ + a/x1 <= a/p. At e>1 there is no rebate and
  (a/q-w')_+<=a/q.
- Top outside ev and target not an unmarked top: t'=0 and
  R'<=w'+E. Thus min(a/q,R')+(a/q-w')_+<=a/q+E
  by splitting a/q<=w' or >w'.
- Both are unmarked tops: exactly IsCollision at this e.
  Bound min(a/q,R'+t') and the ask by a/q each; the second
  a/q is the collision term. There is no rebate.

The remaining R_sigma/q<=u. Combining these inequalities gives
(T) with error 2E+u<=4u (in fact <=2u). For e above the finite
cutoff log_p N the coupling is omitted and the same argument,
now using (a/q-w')_+<=a/q and k*(w/q-w')_+<=B/q,
bounds ask+rebate by (S_sigma+B)/q with NO 4u error. In the
rebate case the stronger inequality above applies even when the
cutoff is zero. For e>=1 nonlive all terms vanish.

## 3. Exceptional e=0 and summation without losing the ramified factor

At e=0 there is no ask, no collision, no rebate, no live-power
contribution. If p!=d, the coupling is excluded by the finite filter.
If p=d, the partner is place(-1)*sigma, NOT sigma. The two
places cannot both be tops or both be thick: the class of -1 mod N0
is not 1 (native P.pow_d_ne_neg_one at exponent 0); tops have
class 1, thick have class -1. If source t is nonzero then
t'=0 and min(t,R'+t')<=R'<=u; otherwise this term is zero.
The R term is <=u at all sigma; one partner is nonthick so the
B minimum is <=u. Thus the exceptional coupling <=3u<=4u.

Let N=boxes κ n = #tops*a+sum_sigma B_sigma, J=log_p N.
Sum (T), the tail version and e=0 over e and sigma, with
the factor omega on the WHOLE inequality. The geometric
series converge (each positive ask bounded by its initial weight/p^e).
By hasSum_live_inv_pow the base is exactly
 (1/(p-1)-nonsplitWeight(d,p))*N.
By definition omega times the asks sum to gain(p)/m. The
rebate sums to omega*#(tops intersect ev)*a/x1; it is live
at e=1 for every nonsplit p. The collision sum has coefficient
omega<=1, and errors <=4*f*u*(J+1). Therefore
 jetExponent >= gain/m - collisionSum
    + omega*#(tops intersect ev)*a/x1
    - f*(4u+n^3)*(J+1).
This includes the p=d factor 1/2 exactly, not by treating every
nonsplit prime as inert. For the last error use n^3<=u,
N<=f*(a+k*a/x+E)<=exp(2 logB) (the above bounds on f,k,a
give log N<=logB+20logX+O(1), with logB overwhelmingly larger).
Since p>=2, J<=2 logB/log 2, hence 5(J+1)<=logB^2.
The error <= f*logB^2*u, exactly the allowance in the native
Data.le_jetExponent. No extra cutoff error or count of live
terms outside the finite cutoff.

## 4. Marked low-column budget: direct two-case proof

Write r=ceilLogM p. For Lambda marked, every even sigma is
nonthick by IsMarked.notMem_thick; w_sigma=a/x1. If Lambda empty
the desired bound is immediate. Otherwise p served (inert,
not short, order o0 odd and <=r). The following bounds suffice:
 r*R_sigma <= u + I_top*a/x1 for every even sigma,
 deltaP=r*f*(n_m+r)<=u.
Indeed r<=x (m<=2 sqrt x,p>=2); hence deltaP<=2x^19<=u and
r*E<=x^61<=u/2. If p<=m, r*m*p<=x*m^2<=4x^2<=x1/2,
so r*a/x1<=u/2. If p>=m, r=1 (m>1).
Then o0=1, and every even sigma is top: it induces the prime
of some top by served_top, and inducedPlace_eq_or_star_iff
puts it in that top's (-p)-orbit; the placeClass modulo N0 of
(-p) is 1 by orderOf_eq_one_iff. Thus R_sigma<=a/x1+E.
Sum over the even set and use #Lambda<=f:
 #Lambda*deltaP + r*sum_even R_sigma
 <= 2*f*u + #(tops intersect ev)*a/x1
 <= loss(p)/m + #(tops intersect ev)*a/x1
since logB^2>=2 and loss>=f*logB^2*a/p.
This is Data.IsMarked.sum_lowColumns_le, without new
prime estimates or stronger restrictions on the chosen marks.

## 5. Integration at the same A caller

Insert sections 3 and 4 into RUN62 section 3, on the same marked
operator product and actual Lambda. For full nonempty marks omega=1,
collisionSum=0; the top rebates cancel BEFORE summing the stages:
 (#Lambda deltaP+ r sum_even R)-JET <= (L+U-G)/m,
 L=loss(p), U=f logB^2*a/p<=L, G=gain(p).
For the empty mark use the no-rebate version. The unmarked and
jetCeil branches in LocalStatement use precisely this same numerical
JET bound; retain the collision geometric bound from RUN62.
Thus the two numerical supplier gaps explicitly left open in RUN62
now have human derivations. The root path still requires the
actual theta normal form, integral frame/Schur and Hecke witnesses
and their independent audit; no global proof-term dependency deletion
is asserted. Other A local p=N and archimedean/level branches retain
peer derivations and original hypotheses.

Original graph: lowColumns_lowBoxes_bounds -> le_jetExponent and
IsMarked.sum_lowColumns_le -> gaugeLe_Bmu_of_isMarked,
gaugeLe_collisionSum -> gaugeLe_pow_jetCeil_smul ->
exists_indexDvd_Bmu_divisible -> Data.short_forms -> star_inequality.
Reduced HUMAN graph replaces the first three nodes by §§1–4
and retains their consumers and all geometric/arithmetic premises.
Do not overwrite native original/reduced graphs or axiom evidence.
No local Lean/Lake (checked executable paths). Native compact CI
compute/rh-compact-primitives-replay-20261126/status.json retrieved:
error, 5147.99s, some requested checks failed or not reached,
run 45803534769. Prior partial native successes are not a PASS
for this replacement. Prepared scalar Lean proofs and native
interface probes below; not executed. Native engines on older pin
not run against this compact source.

RESUME HERE: independent audit of the actual low-box lower bound
and exceptional ramified e=0 class(-1) guard; integrate §§1–4
with RUN62 into the A local caller, then inspect remaining
normal-form/frame and marked HasType suppliers against latest
theta/prime/kernel peer results; use one shared native batch
when the compact cache becomes available. Do not redo numerical
JET/low-column supplier algebra unless audit finds an error.
HANDOFF TO integration, theta, audit, kernel extractor.
-/

namespace AccelerationRun63

theorem min_ask (a b r e : ℝ) (he : 0 ≤ e) (hr : r ≤ b + e) :
    min a r + max (a-b) 0 ≤ a+e := by
  rcases le_total a b with h | h
  · rw [max_eq_right (sub_nonpos.mpr h)]
    linarith [min_le_left a r]
  · rw [max_eq_left (sub_nonneg.mpr h)]
    linarith [min_le_right a r]

theorem min_box_ask (v b w w' k e : ℝ) (hk : 0 ≤ k)
    (he : 0 ≤ e) (hv : k*w ≤ v) (hb : b ≤ k*w'+e) :
    min v b + k*max (w-w') 0 ≤ v+e := by
  rcases le_total w w' with h | h
  · rw [max_eq_right (sub_nonpos.mpr h), mul_zero]
    linarith [min_le_left v b]
  · rw [max_eq_left (sub_nonneg.mpr h)]
    linarith [min_le_right v b]

theorem rebate (a w t : ℝ) (h₁ : t ≤ a) (h₂ : t ≤ w) :
    max (a-w) 0 + t ≤ a := by
  rcases le_total a w with h | h
  · rw [max_eq_right (sub_nonpos.mpr h)]
    linarith
  · rw [max_eq_left (sub_nonneg.mpr h)]
    linarith

theorem zero_exponent (t t' r r' b b' u : ℝ)
    (hu : 0 ≤ u) (hr : r ≤ u) (hr' : r' ≤ u)
    (ht : t = 0 ∨ t' = 0) (hb : b ≤ u ∨ b' ≤ u) :
    min t (r'+t') + r + min b b' ≤ 4*u := by
  have h₁ : min t (r'+t') ≤ u := by
    rcases ht with h | h
    · rw [h]; linarith [min_le_left (0:ℝ) (r'+t')]
    · rw [h, add_zero]; linarith [min_le_right t r']
  have h₂ : min b b' ≤ u := by
    rcases hb with h | h
    · exact (min_le_left b b').trans h
    · exact (min_le_right b b').trans h
  linarith

theorem marked_budget (d r u f L T : ℝ)
    (hd : d ≤ f*u) (hr : r ≤ f*u+T) (hL : 2*f*u ≤ L) :
    d+r ≤ L+T := by linarith

#print axioms min_ask
#print axioms min_box_ask
#print axioms rebate
#print axioms zero_exponent
#print axioms marked_budget
end AccelerationRun63

#check Data.lowColumns_lowBoxes_bounds
#check Data.le_jetExponent
#check Data.IsMarked.sum_lowColumns_le
#print axioms Data.le_jetExponent
#print axioms Data.IsMarked.sum_lowColumns_le
