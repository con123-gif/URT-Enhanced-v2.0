import New.Selmer.DenominatorBound

/-!
RUN60 — actual final Ribet coefficient payment at the Theorem C caller.
26 November 2026. SOURCE-MATCHED HUMAN DERIVATION; scalar certificate PREPARED, not run.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
manuscript e0d380953dc20148e368ad40d143a9a0f611e9da;
peer head observed 622fbfec9a1ab0c00ffda5042dd0417f046fa0ea.
Peers already supplied Kummer reciprocity (6328abd9) and the paired tame
transport audit (4d94ebdc); do not repeat them. Integrate RUN59 at its
actual SelmerLengthLe consumer below. No URT, no new RH premise.

Pinned source ledger:
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18,
  rowBudget, sum_blockLoss_le, ribet_columns, especially 150–223.
* New/Selmer/RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f,
  ribet_first_order, exact coefficient cost in conclusion.
* New/Selmer/TateTwistSteps.lean 941e383bd401d51e8a8c2d856320ef61c7fa17e7,
  hasTriangleCost_tateTwist.
* New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c,
  IsAuxTwist, IsPrimeTriangle.detect, prod_dvd.
* New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c,
  SelmerLengthLe, crudeUnit.
* New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d,
  exists_mFoldTwist_selmerLengthLe.
* Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195,
  exists_length_shaOdd_le (one nonzero X for ALL l,e,moduli).
* New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534,
  denominatorLe_rowBudget (actual consumer).
* New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  nat_le_of_hasLogBound, k_add_t_add_one_le_h₂.
* New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df,
  IsRowType.rank_mem and t_le.

Fix the very same D,V,c,theta, finite labels and lift subset Xset, index pi,
auxiliary twist psi,Q and triangle as ribet_columns. Let r=card row rank,
t0=V.rankDiff, t=D.t, f=D.f, H=D.h₂, c_l=crudeUnit, L=loss D l,
A=v_l(X) for the single nonzero odd-Sha integer chosen in rowBudget.
Write v for normalized valuation (v(l)=1); raw O-length is divided by
the positive ramification index. No changing O between the cost terms:
the source chooses one sufficiently large O' in the intersection of
the lattice, primitive-root, coefficient and defect eventual conditions.
The size facts are 1<=r<=D.r, t0<=t<=H, f<=H, H>=2, 0<=h<=v_l(Mk)<=c_l
where Mk=D.chosenGroupOrder; H>=2 also follows from k+t+1<=H and k>0.
Keep the exact target rowBudget = H^27*(c_l+A)+4*f*L.

1. Supply the strict row modulus to ribet_first_order (lines 184–191).
Let Z0 be the row obeyingCocycles module at modulus l^m0 with zero
values at the triangle inertia pairs and at the scalar gamma_pi.
Let R0 be its intersection with obeying(crysRels(T_pi)).
The exact length sequence gives
   len Z0 = relLength(Z0,crysRels(T_pi)) + len R0.
The first term is at most the row blockLoss (relations in the SAME
column lattices). For the second use obeyingCocycles.mem_selmerModule,
the zero-tame evaluation at every triangle place, and
IsNewPlaces.mem_selmerModule_of_tame_eq_zero: remove the triangle
ramification, not the auxiliary twist ramification. Outside the original
bad places and Q union conjugate Q, the row action is trivial on inertia
because psi=1 there and the untwisted row is unramified there.
Thus R0 injects into the SelmerLengthLe module with gamma_pi zero.
After normalization, writing B0 for this row bound and L0 for the
normalized row defect,
   B0 <= (10*f*r+1)*c_l + L0.
All lengths are finite from these bounds. The simultaneous block loss
theorem gives L0+sum_e L_e <= 4*r*f*L. Since the full scalar budget
proved in step 3 dominates this row contribution, B0 <= r*rowBudget.
The consumer selects m0=floor(D.r*rowBudget)+1, so
   B0 <= r*rowBudget <= D.r*rowBudget < m0 = v(l^m0).
Positive normalization reflects this strict inequality back to raw
addVal O' (l^m0). This is the actual hlt hypothesis of ribet_first_order;
a weak inequality would not suffice. No assumption of torsion crystalline
reduction-surjectivity is used.

2. Supply the character costs and both tame sets (lines 192–210).
For each e in Fin t0 the native hasTriangleCost_tateTwist supplies
b_e from the relative crystalline length plus length shaOdd at modulus
l^nu, with normalization <= L_e + A. Its second conclusion in the
ribet_first_order callback is the detecting-set implication after
zero tame values remove the triangle primes. The detecting set s0 is
from tri.detect, not chosen separately for each e. These are the
actual hypotheses of the callback; the even classes are handled by
the native triangular reciprocity, NOT bounded by A.
Thus sum_e normalized(b_e) <= sum_e L_e+t0*A.
The same X works at every prime, every e<t and every nu, by
exists_length_shaOdd_le; retain its cyclotomic embedding and roots
of unity hypotheses and its independent proof.

The auxiliary index z is Q disjoint-union G0, where G0 consists of
places dividing the two chosen g-primes and not above l; the source
then uses BOTH idOrConjInv copies of each. For the Q half the polynomial
is psi(delta)-X (here X is a polynomial variable, NOT the odd-Sha
integer); its value at 1 has valuation v(psi(delta)-1).
Anticyclotomicity gives identical values on the two conjugate-inverse
generators. IsAuxTwist bounds the sum over the original Q by c_l, so
the paired cost is <=2*c_l, regardless of |Q|. For G0 use
o(X)=sum_{i=0}^{Mk-1} X^i, hence o(1)=Mk, giving exactly two copies
of |G0|*v_l(Mk). The source's card_le_of_subset_placesAboveG bound
|G0|<=4f is sufficient. The annihilation hypotheses come from
(u_x(delta)-psi(delta)I)(u_x(delta)-I)=0 for Q and from the finite
tame eigenvalue order dividing Mk for G0. They are not inferred merely
from the values at 1. Consequently
   sum_delta v(o_delta(1)) <= (2+8f)*c_l.
This accounts for BOTH sets; in particular one must not charge |Q|c_l.

Let j=card triangle index K, d=card original detecting set s0.
Set C=l^(H*h); v(C)=H*h. Native tri.detect gives
   (j+d)*H*h <= H^22*h.
The first-order detecting set is s'=s0 union image(withConjInv tau),
so |s'|<=d+2j. Thus
   2*|s'|*v(C) <= 4*H^22*h <= 6*H^22*c_l,
   (j+1)*v(C) <= (H^22+H)*c_l.
Use the latter conservative 6 constant to stay within the original
budget, not to change its definition. Crucially never divide by h:
when h=0 neither cardinal bound follows by itself, but every weighted
cost is zero. All tie costs are at the original moduli and triangle.

3. Close the actual coefficient bound without an extra input.
The exact abstract conclusion of ribet_first_order is
 v(d_coeff) <= B0 + sum_e b_e
                 + t0*(sum_delta v(o_delta(1))+2*|s'|*v(C))
                 + (j+1)*v(C).
Multiply the coefficient by Mk^3 as required by denominatorLe_rowBudget;
this adds 3*v_l(Mk), not a new determinant cost. Substituting steps
1–2 and the block defect sum gives the explicit safe majorant
 v(Mk^3*d_coeff)
 <= [4+10*f*r+t0*(2+8*f+6*H^22)+H^22+H]*c_l
       +t0*A+4*r*f*L
 <= r*([4+10*f+t*(2+8*f+6*H^22)+H^22+H]*c_l
       +t*A+4*f*L).
This uses a deliberately slightly looser intermediate scalar expression
than the native final simp/grw expression at 221–223; it has the SAME
final rowBudget, so no changes to D, parameters or downstream theorem.
For H>=2, t,f<=H the coefficient in brackets is at most
   4+13H+8H^2 +6H^23+H^22
 <= 16H^2 +7H^23 <= 8H^23 <= H^26 <= H^27.
Indeed 4<=H^2, 13H<=7H^2, 16<=H^4 and H^6<=H^23.
Also t<=H<=H^27. Hence
   v_l(Mk^3*d_coeff) <= r*(H^27*(c_l+A)+4fL) = r*rowBudget.
The strict row bound in step 1 is noncircular: its upper bound
(10fr+1)c_l+L0 is itself dominated by the same displayed scalar
majorant before applying ribet_first_order, independently of d_coeff.
The coefficient conclusion supplies exactly the divisibility cost at
denominatorLe_rowBudget, whose hypotheses require m0=floor(D.r*rowBudget)+1
for every relevant row on the SAME fitted twist. Its subsequent
projection/Gram determinant argument is still retained.
The raw-to-normalized conversion uses additivity of O'.normLength on
finite lengths and normLength_addVal for nonzero integer and coefficient;
if d_coeff=0 the finite upper bound would be impossible, hence it is
nonzero. No invented lower bound on the coefficient is used.

Original source path: RowBalanced -> TwistForRows -> SelmerLengthLe,
OddShaBound + OnePlaceDefect -> sum_blockLoss_le,
TrianglePrimes -> IsPrimeTriangle.detect / TateTwistSteps,
RibetFirstOrder + IsTraceIdeal -> RibetElement.ribet_columns
-> DenominatorBound.denominatorLe_rowBudget -> LongForms C -> star.
Reduced HUMAN path: same dependencies; exact row length splitting,
weighted triangle budget and combined scalar payment above. No native
graph removal or new axiom evidence. The deep row/lattice existence,
crystalline defect, odd-Sha uniform bound, triangle reciprocity and
first-order Fitting proof remain named source obligations, with peer
derivations to be audited. Do not count this as a full C proof.

Execution: command -v lean/lake/elan returned no path. No native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier executed here;
old-pin native checks do not carry over. Independently retrieved
targeted CI run 45799225653 jobs and receipt blob
23de197bd48f404ca2074c69676de289c4f7934e, all_requested_checks_ok=true,
full_RH_replay=false; includes RUN50 prefix certificates, NOT this file.
No new kernel validation. Scalar certificates below prepared, not
compiled. No synthetic diagnostics. Preserve original/reduced graphs.

RESUME HERE: integration/editor insert the strict modulus and complete
coefficient payment into C immediately after the RUN59 row length
and existing odd-Sha/triangle suppliers; audit the latter exact
reciprocity and chart hypotheses rather than re-estimating the budget.
Galois next: actual trace-conjugacy integral block lattice construction
at RibetElement 150–170 and its nondegenerate trace form bridge if not
already fully integrated; then remaining first-order Fitting supplier.
HANDOFF TO integration, editor, formal audit, shared compact CI.
-/

namespace RHGaloisRun60

theorem weightedTriangle (j d s a B : ℝ)
    (hj : 0 ≤ j) (hd : 0 ≤ d) (ha : 0 ≤ a)
    (hs : s ≤ d + 2*j) (hB : (j+d)*a ≤ B) :
    2*s*a ≤ 4*B := by
  have h₁ : s*a ≤ (d+2*j)*a := mul_le_mul_of_nonneg_right hs ha
  have h₂ : 0 ≤ d*a := mul_nonneg hd ha
  nlinarith

theorem strictRowModulus (b r R budget m : ℝ) (hr : r ≤ R)
    (hbudget : 0 ≤ budget) (hb : b ≤ r*budget)
    (hm : R*budget < m) : b < m :=
  lt_of_le_of_lt (hb.trans (mul_le_mul_of_nonneg_right hr hbudget)) hm

theorem scalarPayment (r c A L f t H B : ℝ)
    (hr : 1 ≤ r) (hc : 0 ≤ c) (hA : 0 ≤ A)
    (ht : t ≤ H^27) (hB : B ≤ H^27)
    (hv : 0 ≤ f) (hL : 0 ≤ L) :
    r*(B*c+t*A+4*f*L) ≤ r*(H^27*(c+A)+4*f*L) := by
  have h₁ := mul_le_mul_of_nonneg_right hB hc
  have h₂ := mul_le_mul_of_nonneg_right ht hA
  apply mul_le_mul_of_nonneg_left _ (by linarith)
  linarith [mul_add (H^27) c A]

#print axioms weightedTriangle
#print axioms strictRowModulus
#print axioms scalarPayment
#check ribet_first_order
#check ribet_columns
#check denominatorLe_rowBudget
#check IsPrimeTriangle.detect
#check exists_length_shaOdd_le

end RHGaloisRun60
