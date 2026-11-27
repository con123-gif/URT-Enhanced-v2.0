import New.Endgame.ShortAndEnough
import Mathlib.Tactic

/-!
# RUN71 — actual A projection and loss-budget audit
27 November 2026. HUMAN-DERIVED alternative at the actual A caller,
independent audit of peer assembly; native certificates prepared only.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
protocol, handoff, expansion, AGENTS and current manuscript read.
Peer RUN68 acceleration 08696edb, RUN69 a9b37b94, theta aee9e04a,
integration b0fe2a3e and prime RUN70 f5180dc9 inspected. The manuscript
already has the global harmonic estimate and the rational normalization.
Do not count either as a new result; this audit supplies the explicit
level magnitude bridge and an independent elementary projector supplier.

## 1. One trace proves both projection integrality and conjugate bound
At New/Rows/MonomialCoefficientVector.lean 38–72 the native action is
  iota_theta(goodProjTranslate(s,z))(g)
    = sum_t (|G| e0_t) iota_theta(z)(g groupLift(theta,t s)).
Use the SAME good idempotent e0 and the actual twist and group lift.
The needed coefficient assertion has an elementary proof without the
character decomposition of the regular representation. For a finite
group G and ANY central idempotent e=sum_t e_t[t] in C[G], let E=L_e
act by left multiplication on C[G] in the group basis. E^2=E,
so C[G]=im E direct sum ker E. Left translation L_(t^-1)
commutes with E, hence preserves both summands. Its matrix trace on
the whole space after E is precisely the trace on im E:
  |G| e_t = Tr(L_(t^-1) E)
           = Tr(L_(t^-1) restricted to im E).
Indeed the coefficient on the diagonal for EVERY group basis element
[h] is the coefficient of identity in [t^-1]e, namely e_t.
The restricted translation has finite order dividing ord(t).
Its eigenvalues are roots of unity, counting multiplicity (even if
im E=0). Thus the trace is an algebraic integer and every complex
conjugate has absolute value <= dim im E <= |G|. Equivalently
|sigma(e_t)|<=1 for every field automorphism sigma of C. This uses
only centrality, idempotence and the finite group action, not
self-adjointness or a character formula. The source still constructs
the actual e0 using isCentralProj_e0 (GoodIdempotent.lean 166);
do not remove that construction or other consumers of positivity.

For each padic embedding the trace is integral, so |iota(|G|e_t)|<=1.
The groupLift belongs to Kf, hence the original local level/gauge
invariance holds. Multiplying the entire action by the SAME scalar
a, apply the ultrametric gauge to the sum. If a*iota_theta(z) was
integral then all projected values are integral, with no factor
|G| in the valuation loss and no division by |G|. This is exactly
goodProjTranslate_mem_integralForms, including primes dividing |G|.

At the trivial twist, apply sigma and the triangle inequality in
the square-root Weyl norm, retaining the native uniform pointwise
bound exp(B) for the squared norm. The square-root bound for the
projected value is |G|^2 exp(B/2). The class-sum weights are
1/|Aut|<=1, so the squared class sum is <= exp(x^30)|G|^4 exp(B).
The actual card_stdClasses_le_exp and card_Y_le give the first
factor (same principal level as in MonomialCoefficientVector 65–67).
The native card_GL_dvd_chosenGroupOrder and HasLogUpper instance in
ChosenPlaceLevels 95–97 give log |G|<=log chosenGroupOrder<=x^32.
Consequently x^30+4*x^32<=x^99 (x>=100), and the exact native
normSqAt_goodProjTranslate_le follows. No stronger guard on z,
sigma or s. This is a human replacement for the projection
coefficient estimates at this caller only; not native global pruning.

## 2. Independent audit of the actual simultaneous local index
Fix p, embedding iota, and use beta=ceil(gain_p-err_p), with gain_p=0
outside nonsplitPrimes. Then beta<gain_p-err_p+1 and
g_p=floor(err_p-gain_p)=-beta. For the positive rational
q=prod p^g_p, |iota(q)|=p^beta; it differs from p^(-beta) by a
valuation unit. The local theorem supplies S and l BEFORE the
twist, good datum and ramified column are chosen. It is S that is
pulled back to integral ramified columns. The seesaw chooses
one family Psi_theta, not a separate scalar for every projected row.
Thus the integral lift of q Poincare follows by replacing p^(-beta)
by q using that unit; section 1 preserves it for all s.

For clarity the actual IndexDvd.sup can be proved by an induction
on the number of projections: write a finite family in the sum
of the images plus the target integral module N' as a sum of
one finite preimage family per projection and a family in N'.
Apply the local determinant witness to the first preimage family;
it makes its contribution integral and transforms ALL remaining
families by the same matrix. Their entries stay in their respective
O-modules. Repeat for each projection. The resulting product
matrix has determinant dividing (p^l)^|T|. It acts on the original
row tuple; no choice of independent row witnesses or assumption
that the row tuple is independent. This is precisely the native
IndexDvd.map/trans/sup argument on its actual module, including
the arbitrary finite family in the image2 in short_forms 163.
Divisibility is det U | p^(l|T|), so
  |iota(det U)| >= p^(-l|T|)
                  >= exp(-|T| dim(Column) err_p log p).
The direction is important; it is not an upper bound on |det U|.
For T empty the matrix identity applies (only empty tuple in
actual image2); the span-plus-N' variant works for all tuples.
No uniformity in the matrix across different iota or theta is
claimed or needed. S is uniform across those theta and data at
fixed iota; the exponent bound is uniform across iota.

## 3. Complete explicit level-payment guard in the existing loss proof
Let L=logB, H=logX1, X=x. The native scales imply H>=10,
L>=H^6 and L>=64; use the positivity and magnitude comparisons
of Magnitudes, not a free asymptotic choice. Let a>=X b from
roundUp, m<=2 sqrt X from m_mem, and log N<=30mL from IndexTypes.
Then the full exceptional level expense satisfies
  4mfb log N <=120 m^2 f b L <=480 f a L.
This proves the earlier manuscript's retained guard
4mfb log N<=6 f a L^2 whenever L>=80 (native L>=H^6).
No circular use of the global loss estimate.

For completeness audit the harmonic argument with the log factor
retained. For p<x1 not short, p contributes at most 3faL^2 H/p.
For a short p, p=mc+1 or mc-1 with c>=1 (p>=2), c<=floor(x1),
m/p<=2/c since m>=10000. Each branch injects p into c; if both
congruences held choose one (m>=10000 actually excludes overlap).
Even summing both gives the valid bound
  sum_nonsplit err_p log p <=15faL^2 H(1+H).
Here sum_{c<=floor(x1)}1/c<=1+log(x1) by the decreasing integral.
Overlapping N with nonsplitPrimes can only REDUCE the total
relative to adding the exceptional cost, since allowedLoss is
defined by priority. Nonprimes outside its support give zero.
With H>=10, H+1<=2H and H^4>=10000, obtain
15H(H+1)<=30H^2<=H^6/2<=L/2. Also 480<=L^2/2.
Hence for EVERY finite natural-number subset U,
  sum_U err_p log p <= faL^2 [15H(1+H)+480/L] <= faL^3.
This is the native global budget with the missing level comparison
made explicit, not a new prime distribution theorem. Note that
dropping log p from the harmonic estimate would be invalid.

Finally at the actual archimedean caller, q is positive rational
and invariant under every sigma. Floor <= argument gives
  2 log q + 2 sum_nonsplit gain_p log p
     <=2 sum_T err_p log p<=2 budget.
Add short-column budget, chain budget, heightPerRow budget and
the projection cost X^99. Since X^99<=budget and L>=64, the
total is <=6 budget<=L budget. This deliberately keeps the
projection overhead visible (rather than silently omitting it).
This proves the exact height target from its retained suppliers,
not those suppliers themselves. Section 2 plus section 3 proves
the original bound |T| dim(Column) budget on IndexLe.

## Source ledger and verification
Compact paths (relative to grh-compact/src):
 New/Rows/MonomialCoefficientVector.lean
  18eefab455e1da09f1ad14995afb31a9da4c1959 lines 38–72.
 New/Trace/GoodIdempotent.lean
  638eaebb14d06d09a7e028258d4ecd84716ccf1f line 166.
 New/Data/ChosenPlaceLevels.lean
  d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3 lines 51–52,95–97.
 New/Endgame/ShortAndEnough.lean
  b99eea0689be372d84362c58272b705e104b6a3a lines 21–26,128–168.
 New/Core/ModuleIndex.lean
  214cc116f97852925f444db42bfa36cf563af508 IndexDvd.map/trans/sup.
 New/Columns/LocalStatement.lean
  9d5bd0d698b0db2850cbd306d8d400d7e99a3547 lines 233–307.
 New/Columns/SizeEstimates.lean
  0b666c5f3cead375b65b97c6af8a25675486b473 lines 81–104.
 New/Curve/LiveSum.lean
  3efab3907b063bb2c59d182df981ad62862f8a1b lines 33–39.
 New/Data/AdmissibleData.lean
  04208a5044bb7cf6464ef142a14d939148bed834 lines 29–31,86–101.
 New/Data/Magnitudes.lean
  306fe7e22378322422d11b1f8415fcdac75ffd6e le_of_hasLogBound, le_m.
 New/Seesaw/IndexTypes.lean
  10e0416c5d653fedde38fcd6bf895a2127a3e1a0 lines 161–162.

Original source-visible edges: good central projector -> character
coefficient integral/bound + groupLift and class sums -> projected
integrality and norm -> short_forms -> star_inequality.
Reduced human edge replaces character coefficient estimates at that
caller by regular trace on image; keeps actual centrality, all gauge,
class counts, native local S and seesaw and spanning/chain suppliers.
Original graphs, axiom evidence, and all other consumers retained.
Context key compact pin, actual G/e0, theta, iota, sigma, D, p,
S, q, T, tuple and original local gain/loss; no global deletion.
Native lean/lake/elan not available on local PATH (checked).
Actual published CI targeted_results.json from
cathedral-research-state compute/rh-compact-primitives-replay-20261126
re-read: six B/C declarations audited with three standard axioms;
A build timeout returncode 124 at 2700.11s;
all_requested_checks_ok=false; full_RH_replay=false.
No new native rh_scan/prune/reduce/auto/frontier execution or PASS.
Scalar bridge below prepared; no claim it was compiled. No numerical
simulations, no URT, no claimed RH theorem imported as a shortcut.

RESUME HERE: integration/editor merge the regular-trace proof at the
actual A projection caller and the explicit level guard into the
existing section; audit the retained stage jet and seesaw inputs.
The theta peer aee9e04a retains the actual log-theta derivative
supplier; coordinate rather than repeat it. Next prime-window task
inspect the native seesaw scalar at D.seesaw and its exact norm
transport; preserve original hypotheses and avoid duplicating
already integrated arguments. Request independent audit and native
module-level replay when resources permit. A primitive leaves and
B/C remain open; no proof closure.
HANDOFF TO integration, editor, formal audit, theta, native runner.
-/

namespace CompactPrimeRun71

theorem level_payment (m f b a X L n : ℝ)
    (hf : 0 ≤ f) (hb : 0 ≤ b) (hL : 0 ≤ L) (hm : 0 ≤ m)
    (hn : n ≤ 30*m*L) (hm2 : m^2 ≤ 4*X) (ha : X*b ≤ a) :
    4*m*f*b*n ≤ 480*f*a*L := by
  calc
    4*m*f*b*n ≤ 4*m*f*b*(30*m*L) :=
      mul_le_mul_of_nonneg_left hn (by positivity)
    _ = 120*(m^2)*f*b*L := by ring
    _ ≤ 120*(4*X)*f*b*L := by gcongr
    _ = 480*f*(X*b)*L := by ring
    _ ≤ 480*f*a*L := by gcongr

theorem budget_assembly (fa L H : ℝ)
    (hfa : 0 ≤ fa) (hL : 0 < L)
    (h1 : 15*H*(1+H) ≤ L/2) (h2 : 480 ≤ L^2/2) :
    15*fa*L^2*H*(1+H)+480*fa*L ≤ fa*L^3 := by
  have a := mul_le_mul_of_nonneg_left h1 (show 0 ≤ fa*L^2 by positivity)
  have b := mul_le_mul_of_nonneg_left h2 (show 0 ≤ fa*L by positivity)
  nlinarith only [a,b]

theorem height_payment (B L E : ℝ) (hB : 0 ≤ B)
    (hL : 6 ≤ L) (hE : E ≤ B) : 5*B+E ≤ L*B := by
  have := mul_le_mul_of_nonneg_right hL hB
  linarith

#print axioms level_payment
#print axioms budget_assembly
#print axioms height_payment
end CompactPrimeRun71

#check Data.goodProjTranslate_mem_integralForms
#check Data.normSqAt_goodProjTranslate_le
#check IndexDvd.sup
#check Data.sum_allowedLoss_mul_log_le
#check Data.short_forms
#print axioms Data.goodProjTranslate_mem_integralForms
#print axioms Data.normSqAt_goodProjTranslate_le
#print axioms Data.sum_allowedLoss_mul_log_le
