import New.TwistedHecke.Counting
import Mathlib.Tactic

/-!
RUN59 — Deep-form cost and dimension supplier, 26 November 2026.
Human source-matched argument, native replacement/probes PREPARED ONLY.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb;
manuscript a1cd58ab264179f0e35001a50da0853ef4b9d858;
protocol, handoff, expansion and AGENTS read. Latest integration
ce3f88d1, editor 3c29c488, math 1c42c408, geometry 329c06fd,
audit 57db85ec. Theta 1cc71623 already derived class mean and projector:
do not duplicate. Kernel 2e27597e handles root lemma. Own RUN58
2da8ca92 provides independent coefficient transport. Continue at
the separate deep-cost supplier, NOT the already sufficient projector.

Source ledger, relative to grh-compact/src (bodies retrieved):
Lib/General/Algebra/ZerosCostDegree.lean f572d0f6d5038d5e13b6de766797f44128a5990b
  exists_le_cost_of_vanishing.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  polyAction_X, deepIndicator, rootVar, frobenius_pow_congr.
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
  sum_deepIndicator, exists_le_weight_of_mem_deepForms.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  HeckeSizes, sum_finrank_deepForms_le.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  hasType_twisted_hecke, exists_depth_factorization.

1. Weighted multiplicity lemma (actual exists_le_cost_of_vanishing).
Over a field L, finitely many variables u have integer kappa_u>0 and
cost 1/kappa_u. Let z_t be distinct points, count >= prod kappa_u.
Assume H_u=X_u^kappa_u-g_u vanishes at every point, each term of g_u
having cost <1. Write any exponent uniquely alpha+kappa*gamma with
0<=alpha_u<kappa_u. Products B_{alpha,gamma}=X^alpha prod H_u^gamma_u
have exactly one leading monomial X^(alpha+kappa*gamma) and all other
terms of strictly lower cost. Costs lie in a discrete nonnegative
rational lattice (common denominator prod kappa_u), so induction on
cost proves these products are a basis of the polynomial space.
Independence follows by taking greatest cost in a finite linear
combination, where distinct leading monomials cannot cancel.
Expansion of f of cost <d uses only products of cost <d.
For d=0 the desired assertion is immediate for f nonzero; take d>0.
Jet map J to the coefficients of total order <d at all points is
surjective by CRT for powers of the pairwise comaximal point ideals.
Products with |gamma|>=d are in every point ideal to power d, hence
in ker J. The remaining products therefore span the image. Their
count is (prod kappa_u)*# {gamma: |gamma|<d}, at most the dimension
of the image by the given point count. Thus their images are a
basis, not just a spanning family. A nonzero f of cost <d expands
only in these products, so cannot have all jets zero. This proves
the native weighted multiplicity lemma over arbitrary fields;
no characteristic-zero derivatives or extra separability premise.

2. Native residue points and exact triangular inverse (DeepFormCost.entry).
Use precisely the native k,N,r,P=p^o0, q=P^N, 2r<=k, 2r<N,
char K=p. Parity alternates, so N is even and every index is deep
in N/2 letters. The maps iota_s:W->K factor through the residue
field: for b in the maximal ideal, 1-b^(q-1) is a unit, while
Frobenius around N gives iota_s(b)^q=iota_s(b). A nonzero iota_s(b)
would make the image of that unit zero. The induced unital maps
are field embeddings. Iterate Frobenius to get
iota_(s+j)(y)=iota_s(y)^(P^j) for residue y.
Put m=k-2r. Take I={(b,h): 0<=b<r, 0<=h<=m}, with
rho(b,h)=b and sigma(b,0)=b+r, sigma(b,h)=k-h for h>0.
Use L=Frac(K[X_v: v=(index,letter)]), the native rational-function
field. For v, define
c(v,t)=sign(v.letter)*X_(opposite root variable of t at v.letter)
if v is the root variable of t, zero otherwise (even sign +,
odd sign -). Thus c is zero on shallow v. Define the actual points
z_y(v)=sum_t c(v,t)*iota_s(y_t), y in residueField(W)^I, s=v.letter.
All coefficients here are the native c, not invented matrices.
Frobenius gives
z_y(v)^(P^j)=sum_t c(v,t)^(P^j)*iota_(s+j)(y_t).
The native kappa(v)=P^(deep(v)*(1 if index<2r else 2r)).
For every fixed target letter i, choose j(t)=0 for h=0,
and j(t) in {2b,2b+1} with i-j(t) even for h>0.
Set v_t=rootVar(rho(t),sigma(t),i-j(t)). These are deep.
The matrix of coefficients c(v_t,t')^(P^j(t)) is invertible over
L: specialize the original X_(a,s) to 0^max(floor((i-s mod N)/2)-a,0)
(i.e. 1 exactly when a>=floor((i-s mod N)/2)).
In lex order (b,h), for h>0 the letter is even and a nonzero
entry requires sigma(t')=sigma(t)>=2r, hence h'=h>0.
The complementary index is b', so the entry is nonzero only
if b'>=b. For h=0, j=0; if i is even, sigma=b+r is unique;
if i is odd, equality of source b requires b'=b and allows
any h'>=0. In all cases below-diagonal entries are zero and
diagonals equal +/-1. Thus determinant of this specialization
is a unit, and original determinant is nonzero. This proves
the exact source's triangular claim without a generic-rank assumption.
Every linear functional of the coordinates iota_i(y_t) is therefore
a linear combination of z_y(v_t)^(P^j(t)). Its representing polynomial
has monomials of cost P^j/kappa(v_t)<1: h=0 costs 1/P;
h>0 costs P^(j-2r), with j<=2r-1. The r=0 case is the empty system.
This is the native entry statement for all i and linear forms.

3. Verify every hypothesis of the multiplicity lemma at the SAME points.
Injectivity of y->z_y follows by entry at i=0 and all coordinate
linear forms, using injectivity of the residue embedding.
For shallow v, z_y(v)=0 and g_v=0. For deep v write kappa(v)=P^j.
The displayed Frobenius identity and entry at s+j express
z_y(v)^kappa(v) by a polynomial of cost <1. The point count
matches exactly (the source only requires an inequality):
  |I|=r(k-2r+1),
  log_P(prod_v kappa(v))
    =(N/2)[2r+(k-2r)*2r]=N*r*(k-2r+1)
    =log_P(q^|I|).
This is an integer identity using alternating parity, not a
logarithmic estimate or a count obtained by simulation.

For F nonzero in deepForms n r d, regard its polynomial as a
polynomial f in the deep variables over L, substituting the shallow
variables by their independent images in L. It is nonzero: evaluating
all remaining variables at their original independent images recovers
the original polynomial embedded in L. Fix any y and choose residue
representatives for A=sum_t y_t E_{rho(t),sigma(t)} over W.
All rho<r<=sigma, so A^2=0 and g=1+A has inverse 1-A.
The polynomial of F is the action of g^-1 on the polynomial of
rho(g)F. Since F is deep in EVERY frame, each monomial of rho(g)F
has >=d deep factors. Under g^-1 a deep variable at even s becomes
X_sigma - sum iota_s(y_t) X_rho, and at odd s becomes
X_rho + sum iota_s(y_t) X_sigma (sums over the matching indices).
After shallow substitution these vanish at z_y. Hence every such
monomial lies in the d-th power of the point ideal; summing proves
f is in that ideal power for every y. Apply section 1, yielding a
deep exponent of cost >=d with nonzero coefficient. That coefficient
is a sum of original coefficients times shallow monomials; a nonzero
sum implies at least one original coefficient nonzero. Its deep cost
is identical, and shallow variables have weight zero in the desired
statement. Thus the actual exists_le_weight_of_mem_deepForms holds:
there exists beta with F_beta !=0 and
  d <= sum_v beta_v deep(v)/P^(1 if index<2r else 2r).
No finite-to-infinite inference; proof for arbitrary native dimensions.

4. Actual consumer, aggregate before taking bounds.
For each d, coefficient restriction from deepForms to monomials
of cost >=d is injective by section 3. Therefore
sum_{d<M} dim deepForms(d) <= sum_beta min(M, floor(cost(beta))+1)
                         <= sum_beta (1+cost(beta)).
Let B=card(Monomials(Fin k,n))^N. By permutation symmetry within
each letter, the sum of exponent at any coordinate is B*n/k
(k>0 at the caller). Each index is deep for exactly N/2 letters.
Consequently the mean cost is EXACTLY
  (N*n/(2*k))*(2*r/P+(k-2*r)/P^(2*r)).
For the native HeckeSizes, r>=1 and 2r<=k, hence the mean is <=
N*n*(1/P^(2*r)+r^2/(k*P)) <= z. Its other scale guards imply
2r<N (the source uses 3r<ell), so section 3 applies. This proves
sum_finrank_deepForms_le with native constant (1+z)*B, not an
altered size requirement. This independently supplies the deep
dimension estimate needed in hasType_twisted_hecke.
Original dependency branch: weighted multiplicity -> entry and
point vanishing -> deep-cost -> deepForms dimension -> twisted
Hecke type -> marked operator -> local index -> Theorem A.
Proposed human replacement covers the first four nodes, preserving
all original statement hypotheses, all typed/axiom evidence and
the separate excess-cone dimension, projector, two factorizations,
pairing and stage support edges. No globally deleted node.
The class mean/projector derivation is owned by theta 1cc71623.
No new architectural redesign, URT premise, or Main/RH import.

5. Executed regression checks (V8, exact integer comparisons).
For k=2..12, r=1..floor(k/2), even N from 2r+2 to 20, every
i=0..N-1, both parity phases:
  7136 source-formula specialized matrices,
  812672 entries checked for zero below diagonal and +/-1 diagonal,
  7136 point-count exponent equalities,
  21408 integer-cross-multiplied mean bounds (P=5,7,25).
Negative control: reversing the specialization inequality
(other>=floor(j/2) to other<=floor(j/2)) yields 35436 nonzero
below-diagonal entries across those same cases. These are finite
regressions of the symbolic identities only, not RH-scale tests,
native compilation, nor a complexity/speed claim.
Reproduction: I in lex (b,h); sigma=h==0?b+r:k-h; j as section 2;
for every row t and column t', require matching root variable;
entry equals sign if the complementary index >= floor(j/2), else 0.
Point count: sum over v of deep(v)*(index>=2r?2r:1).
Mean check after multiplying by 2*k*P^(2r):
2*r*P^(2r-1)+(k-2r) <= 2*k+2*r^2*P^(2r-1).
Local lean/lake absent. Actual shared native receipt re-read:
run 45803534769, state status.json a56e2d3a = error, returncode 1.
Prior editor ledger records six B/C native checks but A build timeout.
No native PASS for this file or new rh_scan/prune/reduce/auto/frontier;
old tools pinned to a different toolchain. Prepared probes/scalar
certificates below, replay only in authorized compact shared runner.
No protected workflow changes; original/reduced dependency graphs
and previous axiom evidence remain intact. New replacement axioms
unknown until kernel check; this is an independently auditable
human derivation, not an executed native replacement.

RESUME HERE: integrate sections 1–4 into A deep dimension supplier,
independently audit triangular specialization and weighted jet basis.
Then inspect separate InterlacingCone/Counting flag-volume supplier
against peer prime/geometry work, focusing only on unresolved parts;
native replay this batch and actual caller with axiom export when
shared runner permits. HANDOFF TO theta, prime, kernel, audit,
integration. Human RH reconstruction remains incomplete.
-/

namespace AccelerationRun59

theorem deep_point_exponent (h r m : ℕ) :
    h * (2*r + m*(2*r)) = (2*h) * (r*(m+1)) := by ring

theorem deep_cost_margin (a b r m : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hr : 1 ≤ r) (hm : 0 ≤ m) :
    2*r*a+m*b ≤ 2*(2*r+m)*b+2*r^2*a := by
  have h1 : 0 ≤ (r-1)*r*a :=
    mul_nonneg (mul_nonneg (by linarith) (by linarith)) ha
  have h2 : 0 ≤ r*b := mul_nonneg (by linarith) hb
  have h3 : 0 ≤ m*b := mul_nonneg hm hb
  nlinarith

end AccelerationRun59

#check exists_le_cost_of_vanishing
#check TwistingData.sum_deepIndicator
#check TwistingData.exists_le_weight_of_mem_deepForms
#check TwistingData.sum_finrank_deepForms_le
#check TwistingData.hasType_twisted_hecke
#print axioms AccelerationRun59.deep_point_exponent
#print axioms AccelerationRun59.deep_cost_margin
#print axioms exists_le_cost_of_vanishing
#print axioms TwistingData.exists_le_weight_of_mem_deepForms
#print axioms TwistingData.sum_finrank_deepForms_le
#print axioms TwistingData.hasType_twisted_hecke
