import New.Filling.Moments
import New.Filling.FillingTheorem

/-!
RUN52 — 2026-11-26. SOURCE-MATCHED human proof; native replay pending.
Compact pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit original authors Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. Mission blob 23f64d503b7d64bb13b9667156b499021038d742.
Latest manuscript e0cf5402bda7772a8ab2556b61d9d67859b36630; prior RUN51
025426f92fc87ece6dbe883d1b31c20a2d9b2581. Latest peer heads inspected:
bf254a7b (audit), 2999f952 (character), 898feb42 (literature), d93adfe1
(math); these target different branches.

1. Discriminant/index inequality (GramLiouville.sublatticeDisc_mul_index_sq_le).
Keep H with left inverse, the native primitive lattice basis m of V,
and the independent test columns xw with w finite adelic invertible.
Write xw=mA. Primitivity of Hm and integrality of Hxw imply that A is
integral (apply its integral left inverse locally). Nonzero Gram
determinant implies A invertible over finite adeles in this setting,
as in the native proof. Put d=sqrt(genIndex det(m* m)), where * denotes
conjugate transpose. Then by multiplicativity and star invariance:
  D = genIndex det((xw)* (xw)) = d^2 genIndex(det A)^2.
The image of the test lattice under YH is contained in K. Its index
in the corresponding full image lattice is a divisor of the original
lattice index genIndex(det A), since quotienting by the kernel of Y
can only reduce that index. More explicitly the full image modulo
K intersect the full image is a quotient of the module modulo A;
its cardinal i divides genIndex(det A). Thus i>=1 and (di)^2<=D.
Here d>0 by the independent basis Gram and positivity of genIndex,
using the CM/star hypotheses and the native nonzero determinant guard.
This is the source argument; no assumption that Y is injective.

2. Rank-one subspace height sum (NearTerms.tsum_sublatticeDisc_inv_le).
For the native ambient hermitian lattice at rank k>=1 and f>=1
archimedean places, its Euclidean dimension is n=2fk. The source
one_le_firstMinimum gives distance >=1 between distinct lattice
points, including the distance to zero. Disjoint radius-1/2 balls
give at most (1+2R)^n points in a closed radius-R ball (boundaries have
measure zero). On the shell 2^j<=||v||<2^(j+1), j>=0, the count is at
most 5^n 2^(jn). Hence
  sum_(v!=0) ||v||^(-2f(k+1))
     <= 5^(2fk)/(1-2^(-2f)) <= 5^(2f(k+1)).
The last inequality follows from f>=1 and 1/(1-1/4)=4/3<=25^f.
For each codimension-s space V the actual siegel_lemma selects an
ordered tuple of s nonzero ambient lattice vectors X_i whose Hermitian
orthogonal kernel is V, with
  (prod_i ||X_i||)^(2f) <= (8fs rd_E)^(fs) d(V).
This is an injective assignment of V to tuples (different kernels
cannot have the identical tuple). Raising to k+1 and dividing gives
  d(V)^(-k-1) <= (8fs rd_E)^(fs(k+1))
                    prod_i ||X_i||^(-2f(k+1)).
Sum nonnegative terms over all tuples, using Tonelli; s<=k, so
  sum_codim=s d(V)^(-k-1) <= (200fk rd_E)^(f(k+1)s).
This retains the native constant exactly. For s=0 there is one full
space and the empty tuple bound is 1 by the same native Siegel lemma;
k=0 reduces to that case. The Euclidean separation and native
siegel_lemma itself (Jacobi complementary discriminant and
Minkowski second theorem) are retained foundations, not assumed
proved by this packing step. For the actual frequency caller k=2,s=1,
the result is sum d(V)^(-3) <= (400f rd_E)^(3f).

3. Actual GlobalSieve.sum_frequencies_le.
Use the source assumptions [WeilData E], [T.StarStable], B>=1,
|c_v|^-1 <= |x_v| <= B, and a finite X of nonzero T-integers y.
Let r_v=|Phi_v(y)|>0, a_v=|c_v|^-1, D_y=denomIndex O(ratToPlaces T y)
>=1, J_y=genIndex(ratToPlaces T y). Nonzero y and the finite-place
integrality guards are essential. The product formula, discarding
the >=1 factors of genIndex off T, gives sqrt(J_y)<=prod_v r_v.
Take the exact rational column (1,y)^t; its integral preimage lattice
is generated adelically by a coefficient a (native
exists_preimageLattice_eq_colLattice). Integrality of the first
coordinate forces a integral, so A=genIndex(a)>=1. The preimage
index comparison A<=D_y is the actual source's final divisibility
argument: the index of the set of coefficients making both coordinates
integral is bounded by the denominator index, via restriction to
the first coordinate (off T, y is already integral). Equivalently
locally the coefficient ideal has valuation max(0,-ord_w(y)).
The scalar Gram of (1,y) is 1+conj(y)y; its norm is
prod_v (1+r_v^2)^2, so section 1 with Y=0 gives
  d(span(1,y)) <= A prod_v(1+r_v^2) <= D_y prod_v(1+r_v^2).
The choice of A is exactly the preimage basis for this same y.

Cancel the undamped powers before estimating:
  (prod_v (a_v/r_v)^k) J_y^(k/2) <= prod_v |x_v|^k.
For r<=B, 1+r^2<=2B^2, and for r>=B, 1+r^2<=2r^2,
a<=B. In either case
  min(1,a/r)^6 <= (1000 B^2/(1+r^2))^3.
Thus the actual summand is bounded by
  (prod_v |x_v|^k (1000 B^2)^3) /
               (D_y^6 prod_v(1+r_v^2)^3)
 <= (prod_v |x_v|^k (1000 B^2)^3) / d(span(1,y))^3.
Here D_y>=1 allows D_y^6>=D_y^3, and d<=D_y prod(1+r_v^2)
gives the correct direction for the reciprocal. The line map is
injective: equality of lines forces (1,y)=lambda(1,z) and lambda=1.
Apply section 2 and 1000<=b,400f<=b (native size bounds), obtaining
  sum_(y in X) (prod_v dampedPower k |c_v Phi_v y|^-1)
      * sqrt(J_y)^k / D_y^6
  <= (prod_v |x_v|^k (b B^2)^3) (b rd_E)^(3f).
This reconstructs the actual frequency sum, not an estimate for
an unrelated proxy lattice.

4. Actual head-weight factorization in GlobalSieve.sieve.
For a prefix p in A^i (A the actual finite T-unit set), write
m_j=p_0 ... p_(j-1), j=1,...,i, m_0=1. Its image in the product
of the individual finite sets X_j={m_j(p): p in A^i} is injective:
p_(j-1)=m_j/m_(j-1). No assumption of surjectivity is required.
The real product head is precisely the product of dampedPower at
|c_(v,j) Phi_v(m_j)|^-1, c_(v,j)=prod_(a<j) frameScaleSq(v,a).
The finite head is zero unless each partial product is integral
on T; when it is integral the denominator index is 1 and its
factor is sqrt(J_(m_j))^K. So each head weight is bounded by
the product of the nonnegative section-3 summands with K=n_shape^6.
Extending the injective image to the entire Cartesian product gives
the product of the i frequency sums, with X_j and B=N^i,
x_v=N^i as in the native call. The conditions on c_(v,j) and the
subsequent comparison of that product to Gamma C_i use the exact
frameScaleSq/N/kappa/rd guards in sieve and are retained; this note
does NOT claim the final scale-exponent arithmetic or the second
frequency-size substitution for beta is independently reconstructed.
The i=0 empty product is 1. This factorization is valid for the
actual head, not a claim that arbitrary correlated weights factor.

Consumer chain (unchanged source dependency graph):
sublatticeDisc_mul_index_sq_le + siegel_lemma + separated lattice
 -> tsum_sublatticeDisc_inv_le -> sum_frequencies_le
 -> sieve (both beta and head budget) -> energy_fixingSet_le
 -> sum_le_of_positive_type -> Fits.exists_translate_finrank_comap_le
 -> Data.ramifiedColumns_fill_rows -> Data.enough_forms -> star_inequality.
RUN51 reconstructed the other one_sided_poisson branch; retain its
same finite-system Z and Gram witness. All source dependencies, axioms
and pending nodes preserved. No proof-term pruning claim. Source blobs:
New/Filling/GramLiouville.lean e0e55155b72a00bb6c11d618bf1961e52a4e696c
New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce
New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372
New/Filling/EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76.
Native Lean/Lake absent (command -v on both); old 4.33 engines and
CI are incompatible with compact 4.35, not evidence for these lemmas.
Below executable scalar and native-axiom audit commands are prepared,
not executed. No new CI PASS or root closure is claimed.

RESUME HERE: finish the exact b-power arithmetic in both invocations
of sum_frequencies_le in sieve; then reconstruct energy_fixingSet_le
with its native finite-system/top-correlation supplier and backwards
induction sum_le_of_positive_type. Do not redo the discriminant
packing or scalar cancellation. Keep Siegel's lemma and the finite
index/chart foundations visible until audited. HANDOFF TO integration,
human editor, audit and shared compact kernel lane.
-/

namespace RHPositivityCompact

/-- The scalar damping estimate before dividing by the positive r^2
    and cubing; uses the source's sufficient constant 1000. -/
theorem damped_square (a r B : ℝ) (ha : 0 ≤ a) (hB : 1 ≤ B)
    (haB : a ≤ B) (hr : 0 < r) :
    (min r a)^2 * (1+r^2) ≤ 1000*B^2*r^2 := by
  have hminr : min r a ≤ r := min_le_left .. 
  have hmina : min r a ≤ B := (min_le_right ..).trans haB
  have hm : 0 ≤ min r a := le_min hr.le ha
  have hb : 1 ≤ B^2 := by nlinarith
  by_cases h : r ≤ B
  · have h1 : (min r a)^2 ≤ r^2 := by nlinarith
    have h2 : 1+r^2 ≤ 2*B^2 := by nlinarith
    calc
      _ ≤ r^2 * (1+r^2) := mul_le_mul_of_nonneg_right h1 (by positivity)
      _ ≤ r^2 * (2*B^2) := mul_le_mul_of_nonneg_left h2 (by positivity)
      _ ≤ _ := by nlinarith [mul_nonneg (sq_nonneg r) (sq_nonneg B)]
  · have hbr : B ≤ r := le_of_not_ge h
    have h1 : (min r a)^2 ≤ B^2 := by nlinarith
    have h2 : 1+r^2 ≤ 2*r^2 := by nlinarith
    calc
      _ ≤ B^2 * (1+r^2) := mul_le_mul_of_nonneg_right h1 (by positivity)
      _ ≤ B^2 * (2*r^2) := mul_le_mul_of_nonneg_left h2 (by positivity)
      _ ≤ _ := by nlinarith [mul_nonneg (sq_nonneg r) (sq_nonneg B)]

#print axioms damped_square
#check Filling.sublatticeDisc_mul_index_sq_le
#check Filling.siegel_lemma
#check Filling.tsum_sublatticeDisc_inv_le
#check Filling.sum_frequencies_le
#check Filling.sieve
#print axioms Filling.sublatticeDisc_mul_index_sq_le
#print axioms Filling.tsum_sublatticeDisc_inv_le
#print axioms Filling.sum_frequencies_le
#print axioms Filling.sieve

end RHPositivityCompact
