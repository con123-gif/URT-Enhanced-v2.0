import Lib.Cyclotomic.OddSha.OddShaBound

/-!
# Editor RUN54: small-prime detector and weight-zero class group at actual C caller
26 November 2026. Human source-matched derivation of two previously
retained suppliers in manuscript §6f; common all-prime length budget
assembled with previously recorded component and reciprocity results.
Prepared scalar Lean certificate and native interface audit, NOT compiled.
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; base branch 40f4331a6c91325d1f5c8b5ebfa1eadbd3830af2; manuscript 3fa86279f0ca475a1738cf84a4979d5d3d196311.
Read mission, AGENTS, swarm protocol, handoff, expansion and current
manuscript; new peer commits 4c8f4b0b,15b7768e,40e57948,7929e2d6,
d064b084. No unrelated URT or physics, no new determinant redesign.

Exact source ledger (relative grh-compact/src; actual bodies inspected):
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
  exists_detecting_points_cocycles; exists_length_shaOdd_le.
Lib/ClassField/Places/SelmerDefs.lean ce10f7c03f6155db4ccd49bc228eb03bc23e2347
  tateTwist, shaLocalSet, shaOdd.
Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547
  component, cycPowDirichlet.
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b
  nsmul_component_eq_zero; exists_detecting_points_component.
Lib/Cyclotomic/Stickelberger/GaussSums.lean b242e0965fdabcf6a8dcc3da33511507bf8bd4bf
  exists_jacobi_family (peer RUN53 reconstructs the actual six fields).
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
  exists_isFitFamily: actual finite-prime budget consumer.

1. Uniform detector; construct it BEFORE choosing O,n,e.
Fix E inside Q(mu_N), N>=1, a prime l. Let M=N*l^2, K=Q(mu_M),
H=G_K normal in G_E. Choose one representative of each coset G_E/H
(including identity if desired); their number is <=phi(M)<=M.
K is totally complex since M>=4. Write d=[K:Q]<=M and S for its
finite places above l. Global class field theory gives an exact
sequence from the product of local unit pro-l completions at S
onto the kernel of A -> Cl(K){l}, where A is the maximal abelian
pro-l Galois group unramified away from S. This is the ordinary ray
class exact sequence in the inverse limit, not a class-number bound
on the full ramified group. The image is closed by compactness.
Each local unit pro-l completion is a product of a finite cyclic
l-primary roots-of-unity group and Z_l^[K_v:Q_l] (standard local-field
unit structure, also valid at l=2). It has at most [K_v:Q_l]+1
topological generators. Thus the kernel has at most d+|S|<=2d
generators, using sum_v [K_v:Q_l]=d. Lift at most log_2 h_K
generators of the finite l-primary class group, since a finite
abelian group of order h has at most log_2 h nontrivial cyclic
factors. These, with the local generators, topologically generate
A. Choose preimages in H. Union with the coset representatives
is one finite detector s, independent of O,n,e.

For the count, the standard cyclotomic discriminant bound is
|D_K|<=M^d<=M^M. Minkowski supplies an integral ideal of norm
<=sqrt(|D_K|) in each class: its constant is <=1 since d is even
and d!/d^d <=2^(-d/2), while (4/pi)^(d/2)<2^(d/2).
There are at most B^d integral ideals of norm <= B for B>=1.
Indeed for each rational prime assign its at most d primes
in K to distinct slots; an ideal exponent a at residue degree f
becomes the rational exponent fa in that slot. Prime factorization
makes this an injection into d-tuples of positive integers with
product equal to the ideal norm. Each coordinate is <=B.
Hence log_2 h_K <= (d/2) log_2 |D_K| <= M^3/2, using log_2 M<=M.
For every y with N<=y and l<=y^2, y>=2 (integer), M<=y^5, so
       |s| <= 3 M + log_2 h_K <= 3 y^5+y^15 <= y^20.       (D)
For the last inequality y^5>=32 and y^15>=y^5, so even
4y^15<=y^20. This supplies the exact numerical bound at the
native exists_detecting_points_cocycles interface. No estimate on
the size of a ray group at an unbounded modulus has been assumed.

2. Verify detection for the same s at every exponent.
Take any allowed PadicIntegerRing O l, any n,e, and a locally
constant cocycle z:G_E -> O/l^n for cyc_l^(-e), unramified outside
l and vanishing on s. Induct on k for z killed by l^k, with
initial k=n. At k=0 trivial. At k+1, l z also vanishes on s
and obeys the same relations, hence l z=0 by induction. On H
the cyclotomic character is 1 modulo l (indeed modulo l^2);
therefore H acts trivially on the l-killed submodule of O/l^n,
even for ramified O and l=2. The restriction z|H is a continuous
homomorphism into a finite l-primary group, unramified outside
S by restriction of inertia. It factors through A, so the
chosen generator values imply it is zero. For g=h r with
h in H and r the fixed coset representative, the cocycle law
gives z(g)=z(h)+cyc_l(h)^(-e) z(r)=0. This proves the required
all-exponent detector assertion. We never suppose the action on
all of O/l^n is trivial, nor use a new generating set for each
exponent. The source uses a ray quotient with explicit M-power
bound; this alternative uses the standard local unit structure
and class field exact sequence, avoiding the finite ray-size
calculation. These standard theorems retain their full hypotheses.

3. Weight zero uses the actual local condition, not a general
claim that every Tate-twisted class is unramified at l.
In SelmerDefs, e=0 makes tateTwist trivial and shaLocalSet the
union of inertia groups above l. The Selmer module already
kills all inertia outside l, and the extra oddness condition
is only imposed for e!=0. Thus shaOdd(l,E,O,0,n) consists of
continuous homomorphisms unramified at EVERY finite place.
E is CM in the caller and has no real places. Global class
field theory identifies this module with Hom(Cl(E),O/l^n).
If Cl(E)=direct sum_j Z/d_j, the Hom module is the direct sum
of (O/l^n)[d_j]. Over the native DVR its length is
sum_j min(v_O(l^n),v_O(d_j)) <= sum_j v_O(d_j)=v_O(h_E).
No inversion of l or of class number, including l=2.

4. Preserve the common integer at the actual fit-family caller.
For 0<e<t use X_e from the native IsStickelbergerBound, uniform
in l,O,n,psi. The component annihilator 4X_e^2 and the undivided
Fourier bridge 4phi(N) give Y_e=16phi(N)X_e^2 killing shaOdd.
The small-prime detector from 1-2 handles l<=y^2 with y=N+t+3.
For l>y^2, the native component detector count
phi(N)^2*(v_l(X_e)+1)<=y^2*(y^6+1)<=y^20 applies through the
same character-commutator evaluation map (retain odd component
membership and the full Kolyvagin descent). 4phi(N) is a unit
ONLY in this large-prime case. Evaluation embeds shaOdd into at
most y^20 copies of (O/l^n)[Y_e]. Their lengths are <=v_O(Y_e).
Take the one common positive integer
        X_all=h_E*prod_(0<e<t) Y_e^(y^20).
Step 3 handles e=0, including empty product. For positive e,
v_O(X_all) bounds the length independently of n,l,O. Since
X_e<=2^(y^6), phi(N)<=y and y>=4,
log_2(X_all/h_E)<=y^21(4+y+2y^6)<=4y^27.
This is exactly the native budget, not a larger asymptotic bound.
FitTwistsExist uses the SAME X_all before the prime sum:
sum_(l in T) v_l(X_all) log l <= log X_all for any finite
prime set T. The remaining C primitives include the actual
Artin/Kummer reciprocity and Kolyvagin bottom/transition audit,
crystalline local defects, balanced row existence and comparison
forms. No conclusion about RH from this length lemma alone.

Peer integration: 4c8f4b0b gives the six-field Jacobi family by
prime-field Gauss binomial leading term, all-place distribution,
and principal-unit congruence. 15b7768e gives the five-copy inverse
carrier, tight-frame section and vacuum denominator with retained
theta inputs. 7929e2d6 gives all-character Fourier separation
for rank-one period vanishing with retained integrability, level
and Witt conditions. The main manuscript incorporates their
actual caller roles; none is labeled kernel-replayed.

Original source-level edges retained: SelmerDefs -> local ray
generator count -> exists_detecting_points_cocycles -> 
exists_length_shaOdd_le -> exists_isFitFamily -> C -> star.
Reduced HUMAN argument replaces the local detector construction
by ordinary class field exact sequence + local unit structure +
Minkowski count + socle induction; weight zero uses the local
condition directly. No elaborated edges deleted, no graph or
axiom evidence overwritten, no new native root retirement.
Context: pin,N,E,l,embedding,O,n,e and exact Selmer conditions.

Actual execution: JS BigInt coefficient expansion at y=z+2 for
y^20-y^15-3y^5 (21 coefficients) and y=z+4 for
2y^27-y^22-4y^21 (28 coefficients); all nonnegative. Negative
controls at y=1 both negative. Reproduce by binomial expansion:
for each term a*y^j add a*binom(j,k)*shift^(j-k) to coefficient k.
These are exact unbounded-domain scalar certificates, NOT
checks of class field theory or of Lean. Six source blob IDs
confirmed from GitHub. Native compact targeted replay 45799225653
actually completed success; state JSON blob
23de197bd48f404ca2074c69676de289c4f7934e explicitly says
full_RH_replay=false. Its ten native/four scalar roster does not
include the new detector derivation. Current primitive replay
not established. No old-pin engine used on compact source.

RESUME HERE: audit the same-lattice crystalline defect and local
rank/duality supplier at the balanced-row caller, rather than
recomputing the now sufficient common odd-Sha integer. Independently
audit the standard ray exact sequence/local-unit construction
and peers' Jacobi/reciprocity/derivative transition before
claiming the C primitive chain complete. Retain all outstanding
A/B suppliers, prior graphs and source/axiom evidence.
HANDOFF TO: integration, C mathematics, literature and formal audit.
-/

namespace CompactEditor54
theorem detector_scalar (y : ℝ) (hy : 2 ≤ y) :
    3 * y^5 + y^15 ≤ y^20 := by
  have h5 : (4 : ℝ) ≤ y^5 := by
    calc
      (4 : ℝ) ≤ 2^5 := by norm_num
      _ ≤ y^5 := by gcongr
  have h10 : (1 : ℝ) ≤ y^10 := by
    calc
      (1 : ℝ) ≤ 2^10 := by norm_num
      _ ≤ y^10 := by gcongr
  have h15 : y^5 ≤ y^15 := by
    calc
      y^5 ≤ y^5 * y^10 := by nlinarith [mul_nonneg (show 0 ≤ y^5 by positivity) (sub_nonneg.mpr h10)]
      _ = y^15 := by ring
  have h20 : 4*y^15 ≤ y^20 := by
    calc
      4*y^15 ≤ y^5*y^15 := by nlinarith [mul_nonneg (sub_nonneg.mpr h5) (show 0 ≤ y^15 by positivity)]
      _ = y^20 := by ring
  linarith
end CompactEditor54

#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#check exists_detecting_points_component
#check exists_jacobi_family
#print axioms CompactEditor54.detector_scalar
#print axioms exists_detecting_points_cocycles
#print axioms exists_length_shaOdd_le
