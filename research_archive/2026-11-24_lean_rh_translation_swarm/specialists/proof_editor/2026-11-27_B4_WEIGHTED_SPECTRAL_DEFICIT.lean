import Mathlib

/-!
# Lane 15 — B4: weighted lower spectral deficit, no range-projector SVD

27 November 2026. Human source-matched conditional reduction. Scalar Lean
certificate PREPARED, UNCOMPILED; no new root closure. Credit Alpöge,
Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
744922562b7ecc7c4a8594fd8344e387947b01d0,
c65f3342c5cf41c503519f74a03a9aa7c46af064 and protocol/AGENTS/handoff.
Prior editor budgeted-spans 3b9809d9, centered filling 5fb8da26,
integration ramified-projector spectral tail e652114c. The last route
requires a count of eigenvalues below a threshold and a projector
trace-norm bridge. This alternative controls their weighted depth
directly on the existing normalized Poincare operator, dispensing with
SVD, ramified range-projector comparison and a count at a discontinuity.

## Exact caller and premises

New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
Fits.exists_translate_finrank_comap_le (same normalization t*Q=P,
t²*c_native*unipCovolume=1, t nonzero).
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76,
Data.ramifiedColumns_fill_rows and Data.finrank_rows_ne_zero.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7,
ramifyingOp_finrank_comap_and_short, rank component.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
Data.enough_forms and Data.short_forms. Use the same coordinates,
unitary representation rho, central orthogonal projector R, column
dimension c>0, row space W=im R and d=dim W, same scalar seesaw choice.
Put eta=b^-2, delta=b^-4=eta², b>=1000, A=PP*, and
T=(1/|G|)sum_s rho(s) A rho(s)*, T_W=RTR restricted to W.
Retain the two native first-moment estimates exposed in 5fb8da26:
sum_i ||(P*P-I)e_i|| <= delta*c and tr((I-R)A)<=4 delta*c.
These are actual normalized inputs, not assumed orthonormality of P.
They already imply d>0: if d=0 then R=0 and
(1-delta)c<=tr A<=4 delta c, contradiction. Do not invoke original
sharp spread to get positivity. For the ramifying operator E the
codimension of im E is <= f*c/(N-1) <= b^-8*c from actual size
guards f<=b, N-1>=b^9 and card_piPlaces=f. Set alpha=b^-8.
Retain all exact coordinate identifications in FillingTheorem.

## New sufficient supplier

Write lambda_i>=0 for the eigenvalues of T_W with multiplicities.
Define the positive-part deficit, a single nonnegative number,
    D_minus = sum_i max(0,c/(2d)-lambda_i).
It suffices to establish, for each actual admissible D,
    D_minus/c + delta + alpha <= eta.                 (DEFICIT)
No control on the top of the spectrum and no bound on the number of
eigenvalues just below the threshold is needed.

Proof: fix any row subspace F, let Pi be the orthogonal projector onto
F-perp within W and r=d-dim F. Since T_W >= (c/(2d))I - K in Loewner
order, K=(c/(2d)I-T_W)_+ >=0, tr K=D_minus, we have
    tr(Pi T_W) >= c*r/(2d) - D_minus.
No commutativity of Pi and T_W is asserted. Equivalently, diagonalize
T_W and take weights w_i=<Pi e_i,e_i> in [0,1], sum w_i=r.

Let L_s=Pi rho(s) P on the full column space (extend Pi by zero on
W-perp). Let J_s be the orthogonal projector onto ker(L_s)^perp.
Then L_s=L_s J_s and L_s*L_s <= P*P. Thus
    ||L_s||_HS² = tr(J_s L_s*L_s J_s)
                 <= tr(J_s P*P J_s)
                 <= rank L_s + delta*c.
For the last step, trace cyclicity gives
tr(J_s(P*P-I)J_s)=tr((P*P-I)J_s), whose absolute value is at most
sum_i ||(P*P-I)e_i|| since ||J_s e_i||<=1. Here the Hermitian Gram
error is in the actual native column orthonormal basis.
For every s, rank(L_s E) >= rank L_s - codim im E:
quotient the domain by im E, or use dim(im L_s/im(L_s E)) <=
dim(Column/im E). The normalization t and seesaw scalar are nonzero,
so do not change these ranks. The map Pi B_s, with B_s the ACTUAL
full-column ramified map of FillingTheorem, has that rank.
Average over s; mean ||L_s||_HS²=tr(Pi T_W). Consequently some s has
    rank(Pi B_s) >= c*r/(2d) - D_minus - (delta+alpha)c.
Under DEFICIT this is >= c*(r/(2d)-eta). Rank-nullity proves exactly
the original IsSpread conclusion, hence also the weaker editor
budgeted reachable-span condition. In particular no change in A/C,
shortness, original index budget 5d log(1+b²), or scalar star proof.
Use the existing greedy and star proof, not a new manuscript.

## Compatibility with old B3 moment (fallback only)

The native normalized energy estimate is
||T||_HS² <= (1+9 delta)c²/d, with unipCovolume already included.
The first two inputs give tr T_W >=(1-5 delta)c. Orthogonal
compression cannot increase HS norm, so, expanding the square
BEFORE taking estimates,
    ||T_W-(c/d)I||_HS²
     <= [(1+9 delta)-2(1-5 delta)+1]c²/d = 19 delta*c²/d.
For any real x, max(0,1/2-x) <= (1-x)^2/2, since the difference
from 1/2-x is x²/2 and the square is nonnegative. Sum with
x=d*lambda_i/c. It follows exactly that
    D_minus <= (d/(2c))*||T_W-(c/d)I||_HS²
            <= (19/2)delta*c.
Then D_minus/c+delta+alpha <= (21/2)delta+alpha <= eta
using eta<=10^-6, delta=eta² and alpha=eta^4. No centered variance
square root or SVD needed at this caller. This is a compatibility
proof using existing B3; an independent derivation of DEFICIT on
actual D is still missing. In particular, no B3 dependency is
retired by citing this fallback. The primitive first-moment and
ramification obligations remain even on the alternate route.

## Strict separation from both previous numerical suppliers

Abstract unitary example only, not actual arithmetic Data: c=1,d=2,
G=C2 with generator diag(1,-1), R=I, E=I, one isometric column P
whose squared coordinate magnitudes are p=(1/4-eta/2,3/4+eta/2).
Group averaging cancels the off-diagonal exactly, so T_W=diag p
and the ramified image-projector average M=T_W. With b=1000 the
weighted deficit is eta/2; even charging the full delta+alpha it
satisfies DEFICIT. However the old low-eigenvalue count TAIL of
e652114c has k=1>eta*d, and the old normalized second moment
fails: sum p_i²=1250001000001/2000000000000 >
1000000000009/2000000000000=(1+9delta)/2.
Thus the alternate numerical criterion genuinely permits data
excluded by both earlier tests; not a claim that it is universally
weaker than TAIL without the bridge assumptions.

Exact arithmetic executed in CPython using fractions.Fraction:
```python
from fractions import Fraction as F
from itertools import product
cnt=0
for q in range(1,13):
 for i in range(4*q+1):
  x=F(i,q)
  assert max(F(0),F(1,2)-x)<=(1-x)**2/2
  cnt+=1
print("scalar_grid",cnt)
b=1000; eta=F(1,b*b); delta=eta**2; alpha=delta**2
p=(F(1,4)-eta/2,F(3,4)+eta/2)
assert sum(p)==1
D=sum(max(F(0),F(1,4)-x) for x in p)
assert D+delta+alpha<=eta
assert sum(x<F(1,4) for x in p)>2*eta
assert sum(x*x for x in p)>(1+9*delta)/2
assert F(21,2)*delta+alpha<=eta
print("C2",p,"deficit",D,"HS2",sum(x*x for x in p),
      "old_bound",(1+9*delta)/2)
n=0
for d in (2,3,4):
 for xs in product(range(9),repeat=d):
  if sum(xs)!=4*d: continue
  xs=[F(x,4) for x in xs]
  D=sum(max(F(0),F(1,2)-x) for x in xs)
  assert D<=sum((1-x)**2/2 for x in xs)
  for ws in product((F(0),F(1,2),F(1)),repeat=d):
   assert sum(w*x for w,x in zip(ws,xs))>=sum(ws)/2-D
   n+=1
print("aggregate_checks",n)
```
Actual output: scalar_grid 324; C2 (499999/2000000,1500001/2000000),
deficit 1/2000000, HS2 and old bound as above; aggregate_checks 41337.
These are regression controls, not a native actual-host computation.

## Dependency and audit status

Original path: star -> family/enough + row positivity -> full spread ->
Fits.exists_translate_finrank_comap_le -> native first moments, sharp
energy, size and coordinate suppliers, ramification. Alternate path:
star -> family/enough + row positivity -> DEFICIT + first moments +
ramification + exact coordinate bridge -> rank gain. The alternate
first-moment positivity proof avoids a circular use of sharp spread.
The fallback proves DEFICIT using the old energy and therefore retains
that entire dependency. Keep original graphs/axioms, unresolved B1–B4
and A/C suppliers. This is source-visible dependency evidence only,
not a native recursive graph. Context key includes pin, same D,
normalized P, R, c,d,b and same E. Backtrack to original moment if
the alternate direct deficit estimate fails. No local lean/lake on PATH
(checked); native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier
not executed, scalar Lean below UNRUN. No new CI PASS claimed.
Prior B2 joint native receipt is not evidence for this file.

RESUME HERE: derive the direct weighted DEFICIT for the actual
finite-level isotypic multiplicity matrices of T_W, with its original
normalization and the SAME admissible D; use Schur averaging to
aggregate only lower deficits, not the old global squared energy.
If unsuccessful retain fallback. Coordinate scalar and actual caller
replay through existing shared compact runner, not a competing build.
HANDOFF TO integration, B3/B4, audit and kernel. RH remains OPEN.
-/

namespace RHEditorWeightedDeficit
open Finset

theorem scalar_deficit (x : ℝ) :
    max 0 (1 / 2 - x) ≤ (1 - x)^2 / 2 := by
  apply max_le
  · positivity
  · nlinarith [sq_nonneg x]

theorem weighted_lower (w x : ℝ) (hw0 : 0 ≤ w) (hw1 : w ≤ 1) :
    w / 2 - max 0 (1 / 2 - x) ≤ w * x := by
  by_cases hx : 1 / 2 ≤ x
  · rw [max_eq_left (sub_nonpos.mpr hx)]
    nlinarith [mul_nonneg hw0 (sub_nonneg.mpr hx)]
  · rw [max_eq_right (sub_nonneg.mpr (le_of_lt (lt_of_not_ge hx)))]
    nlinarith [mul_nonneg (sub_nonneg.mpr hw1)
      (sub_nonneg.mpr (le_of_lt (lt_of_not_ge hx)))]

theorem sum_deficit {ι : Type*} (s : Finset ι) (x : ι → ℝ) :
    (∑ i ∈ s, max 0 (1 / 2 - x i)) ≤
      ∑ i ∈ s, (1 - x i)^2 / 2 :=
  Finset.sum_le_sum fun i _ ↦ scalar_deficit (x i)

theorem total_budget (η : ℝ) (h0 : 0 ≤ η) (h1 : η ≤ 1 / 1000) :
    (21 / 2 : ℝ) * η^2 + η^4 ≤ η := by
  have hsq : η^2 ≤ η / 1000 := by
    nlinarith [mul_nonneg h0 (sub_nonneg.mpr h1)]
  have hsq1 : η^2 ≤ 1 := by nlinarith
  have hfour : η^4 ≤ η^2 := by
    nlinarith [mul_nonneg (sq_nonneg η) (sub_nonneg.mpr hsq1)]
  linarith

#print axioms scalar_deficit
#print axioms weighted_lower
#print axioms sum_deficit
#print axioms total_budget
end RHEditorWeightedDeficit
