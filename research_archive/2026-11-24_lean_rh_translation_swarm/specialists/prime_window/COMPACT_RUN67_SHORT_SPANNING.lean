import New.Endgame.ShortAndEnough

/-!
COMPACT RUN67 (2026-11-26) — short ramified column spanning at the actual A caller.
Status: source-matched human derivation and prepared scalar certificates, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission current blob 9f4a2272265e847b3a46422b02d4b37e976bee10:
completion-first compact reconstruction, not the historical outer-shell route.
Latest integration 3d8ec587, kernel 02d32ee8, theta 131aaf2d,
own prior RUN66 de3f5a0b. No Main import, no use of RH as an antecedent.

1. Short basis in the actual standard unitary chart.
Source Lib/Adelic/Transference/MassBasic.lean
ab9b5714cab038182220a2e1631a96f2de1ddf78 lines 35-109,
exists_norm_sub_archCoords_le, exists_short_basis,
exists_short_basis_stdSpace. Keep weak_transference_covering_radius
(Lib/Adelic/QuotientMeasure/Unimodular.lean) with its exact hypothesis:
if every nonzero vector of the Euclidean integral dual of a full
lattice has norm >=rho>0, its covering radius is at most dim_R^2/rho.
This is the native transference input; no unverified external theorem
substitution is claimed.

For the actual stdSpace caller, g is a finite adelic unitary matrix,
L=E^n intersect g O_hat^n. This is a full Z-lattice in the real
space W=product_tau C^n, dim_R=2fn, f=[E:Q]/2. It is self-dual for
the O_E-valued standard Hermitian pairing: local dual of g O_w^n
under the paired conjugate places is g O_w^n, by g^*g=I.
Taking all finite places gives L^#=L. The real scalar product on W
is Re sum_tau conjugate(x_tau) dot y_tau, one embedding per pair.
Every integral linear functional on L extends Q-linearly to E^n
and is represented by a rational vector under the nondegenerate
trace pairing; thus the real Euclidean dual of L is exactly
2 different_E^{-1} L, not different_E^{-1} L. Indeed
Tr_E/Q h(x,y)=2 Re sum_tau h_tau(x,y); integrality against all
O_E-multiples gives the inverse different condition, and the
Hermitian duality above gives the module identity. The different
is stable under conjugation, so this is independent of the choice
of linear variable in h. In particular for a positive integer
d0 in the different, the Euclidean dual of (2/d0)L equals
d0 different_E^{-1} L and is contained in L.
For a nonzero x in L, h(x,x) is a nonzero totally positive
algebraic integer of the maximal real subfield. Its product over
real embeddings is at least 1, hence at least one summand is >=1;
the archimedean norm squared is >=1. This proves the rho=1 input
for the actual standard chart. Do not infer this for a general
nondefinite adelic space. Full lattice and trace identification
are the native baseLattice/archCoords facts in MassBasic.

Apply transference to (2/d0)L, then multiply the approximation by
d0: the lattice 2L has covering radius <=C=d0(2fn)^2. Direct
independent-vector construction replaces the native descending
lattice-span induction in this SPECIALIZED caller. If k<n
E-independent vectors have been chosen, the E-span extends to a
proper real subspace H of W (base change through every complex
embedding, dimension 2fk). Choose u perpendicular to H with
norm 2C, where C>0. Pick a in L with ||u-2a||<=C.
Then 2a is outside H, since dist(u,H)=2C>C, and
||a|| <= (||u||+C)/2 = 3C/2 = 6d0(fn)^2.
Induct until n independent E-vectors. The column matrix Y is
invertible over E, g^{-1}Y is integral at all finite places, and
every entry at every complex embedding is at most R=6d0(fn)^2
since each column norm is at most R. This is exactly
exists_short_basis_stdSpace; no claim that Y is an O_E-basis.
The general moved-space theorem is not globally replaced.

2. Spanning short algebraic forms, with all conjugates and all p.
Source New/Columns/ChainValuation.lean
19e853dfa8c645bfcdf3b3e21183f9b432620ef7 lines 91-149,
IsShort.sub_translate and span_isShort_eq_top.
For each class c at the free level K, choose Y(g) as above for
g=c and g=c^{e_tau}, where e_tau is the actual signed determinant
weight; do not replace negative exponents by positive ones.
Choose the same Y for every p and every field embedding. Define
A_f = (product_tau det f_tau(Y(c^{e_tau}))) *
      weylRep(kappa,0)(f_tau(Y(c))).
For any array y of roots of unity, let v=A_id weylEval(y).
A_id is invertible (all Y and determinants invertible). The
evaluation vectors span: a linear functional vanishing on all
these evaluations gives a polynomial vanishing on every tuple
of roots of unity; a polynomial in finitely many variables
vanishing on a product of infinite sets is zero by induction
on variables. Independence of the native nabla polynomials
(ext_weylEval) then gives zero functional. This uses the actual
finite coordinate support, not a density claim in a p-adic topology.
The free-level delta form map at c sends these spanning vectors
to a spanning set of the c-coordinate summand, and summing over
classes gives the whole space. Trivial stabilizers are essential.

For the specified p-adic embedding, apply c^{-1} in weight
(kappa,e). Combine determinants before taking norms: the result
is the Schur matrix of the integral c^{-1}Y(c) on weylEval(f(y)),
times the product of determinants of the integral
(c^{e_tau})^{-1}Y(c^{e_tau}). Both the Schur matrix and the
evaluation polynomials have integral coefficients and every
root of unity has norm one. Every coordinate is integral by
the ultrametric inequality. This is the native gauge <=1;
deltaForm transports it to all chart points. No assumption
that the individual signed determinant weights have unit norm.

At every complex conjugate, the native squarePart identity
writes the Schur-evaluation vector as schur(Z)u, where u is
the permArray evaluation of squared norm 1 and
Z_tau=Y_tau(c) squarePart(y)_tau. Every entry of Z is <=nR,
so its squared Frobenius norm <=n^4 R^2<=R^6 (R>=n>=1).
The native Weyl norm estimate weylNormSq_schur_le provides
nonnegative rho_{tau,i} with sum_i rho_{tau,i}<=||Z_tau||_F^2;
the norm multiplier is product rho_{tau,i}^{lambda_{tau,i}}.
All lambda are nonnegative and sum to boxes(kappa,n), with
the same rank/diagram convention as the caller. Thus the Schur
factor is <=R^{6 boxes}. Separately the determinant bound
|det Y_tau|<=||Y_tau||_op^n<= (n^2 R)^n<=R^{3n} gives
the squared product <=R^{6nf}. (Using the larger native
operator bound avoids changing any constants.) Overall
            ||A_f weylEval(f(y))||_Weyl^2 <= R^{6(nf+boxes)}.
This supplies the exact native M premise and R^{6M}<=B.
No stabilizer factor at a free class. Retain the polynomial
basis, squarePart, Weyl norm theorem, delta-form evaluation
and chart covariance as named underlying lemmas, not as
unproved claims of arbitrary Schur normalization. The readable
companion grh/src/New/UpperBound/Size/ShortColumns.lean,
weylNormSq_det_smul_weylRep_mulVec_weylEval_le and
span_isShort_eq_top, is consistent with these steps; the compact
statement is the governing pin.

3. Ramifying operator rank and shortness with the SAME spanning set.
ChainValuation lines 157-259: centralGen, exists_centralGen,
finrank_ker_one_sub_centralGen_le,
ramifyingOp_finrank_comap_and_short, span_short_ramifiedColumns.
At w|pi the residue field has size N (the level prime; it is
NOT the different integer d0). Lift a generator of F_N^times
to a local unit u. The norm-one scalar adele u/star(u) is
integral, supported at w and bar(w), and has order N-1 at w
modulo w. Here w!=bar(w) from the native split-level data.
Its scalar matrix z is in Kf, and central; hence it preserves
the column level K. If z^i lies in K, the last-row congruence
forces u^i=1 modulo w, so N-1 divides i. The group
K'=K join <z> is compact open in the chosen level, with finite
index i0=[K':K]>=N-1 by compactness and centrality. Both
levels have trivial stabilizers (K' contained in chosenLevel).
The fixed vectors of z on the K-level columns are precisely
the K'-level forms. The class covering has each fiber i0:
if two cosets of K in K' give the same class, their difference
lies in the stabilizer at the K' level, hence is trivial.
Each class has the same Weyl fiber dimension. Therefore
dim ker(1-z)=dim(Column)/i0<=dim(Column)/(N-1).
This is the actual central kernel supplier without estimating
individual eigenvalues. No assumption z has order N-1 globally.

For any linear T and subspace P, the restriction to T^{-1}P
has kernel ker T and image contained in P, hence
dim T^{-1}P<=dim P+dim ker T.
Iterating on the actual product of the central 1-z factors
gives dim ramifyingOp(s)^{-1}P<=dim P+|s|d_C/(N-1).
This is the native rank estimate; keep it separate from
shortness. For a B-short vector, the right translate by z
has the same uniform gauge and squared-norm bounds, since
z is integral and the norms are quantified over all g.
The difference is integral by the module property and the
parallelogram law gives squared norm <=4B. Thus the product
over s maps B-short vectors to 4^{|s|}B-short vectors.
Take s=all w|pi, |s|=f, and B=exp(budget)/4^f, using the
actual numerical inequality in span_short_ramifiedColumns:
R^{6M}<=exp(budget)/4^f (the native HasLogBound and
sum_height_mul_kappa_le supply it). Since the image of a
spanning set spans the image of a linear map, the resulting
short vectors span exactly ramifiedColumns, with uniform
bound exp(budget). This proves the actual short spanning
interface, retaining the explicit numerical inequality, not
a claim that all integral columns are short.

4. Actual A consumer and connection to the reconstructed local branches.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
lines 19-26,114-168. Define T=nonsplitPrimes union {N},
g_p=gain(p) on nonsplitPrimes and 0 otherwise,
err_p=allowedLoss(p), a_p=floor(err_p-g_p).
Choose q=product_{p in T} p^{a_p}>0, one rational for every
place, twist and translate. log q=sum a_p log p and |q|_p=p^{-a_p}.
At all primes beta=-a_p=ceil(g_p-err_p) satisfies the strict
native beta<g_p-err_p+1, even at integral endpoints.
The actual local interface exists_indexDvd_Bmu_divisible
(LocalStatement 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
285-307) supplies a module independent of theta/Psi with local
index exponent <=err_p*d_C, and integrality of p^{-beta} Bmu
on its ramified part. Since v_p(q)=-beta, the ratio is a
p-adic unit; multiply by it. Marked, collision, level and ordinary
branches remain exactly those of RUN55-66 and their open CM/Hecke
premises. RUN61 supplies the actual IndexDvd.sup consumer,
so do not duplicate its module argument. Summing determinant
costs over finite prime sets yields |t| d_C budget by
sum_allowedLoss_mul_log_le, with no factor n (number of forms).
For the short spanning set just constructed, the size theorem
weylNormSq_Bmu_le gives exponent
  2 log q + budget + heightPerRow + 2 sum g_p log p + budget.
Using heightPerRow<=mainHeight-m*remainder+budget and cancelling
2 log q +2 sum g_p log p <=2 sum err_p log p <=2 budget
gives at most mainHeight-m*remainder+5 budget, hence the
required mainHeight-m*remainder+logB*budget using the actual
HasLogBound logB>=5 and budget>=0. The good projection and
seesaw equalities are retained at their precise caller.
This checks that the SAME spanning family has the desired
size and that the uniform local module applies to all finite
families of integral columns. No inference that A is complete:
the archimedean lift norm, actual marked Hecke/good datum/CM
and finite generator foundations, plus B and C, remain.
The final prime-error inequality is not asserted.

Source-visible old graph: MassBasic weak transference + trace
duality -> short basis -> delta spanning and gauge/norm ->
span_isShort_eq_top -> central generator + kernel + ramifying
shortness -> span_short_ramifiedColumns -> Data.short_forms.
New human path specializes standard chart and replaces the
recursive spanning induction by perpendicular construction,
uses one simultaneous choice of Y and cancels q against the
prime gain before bounding. No native deletion, original and
reduced graph files and axiom ledgers untouched. Cache key
(pin,E,n,K,c,e,kappa,d0,g,p,iota,sigma,D,N,w,theta,Psi).
Native engines rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier
not run: lean/lake/elan absent locally; old engine pin differs.
No simulation or URT comparison. Actual CI state branch
compute/rh-compact-primitives-replay-20261126/{status.json,
outputs/targeted_results.json}, run 45803534769: A build timeout
124 after 2700.11 s, six named B/C checks with only propext,
Classical.choice, Quot.sound, all_requested_checks_ok=false,
full_RH_replay=false. New scalar certificates below are prepared,
not executed; check with matching compact dependencies and
independent audit. No claim of new kernel PASS.

RESUME HERE: editor merge sections 1-3 into the actual A short
spanning supplier; audit trace-dual factor 2 and central level
fiber argument, then trace the still-open archimedean size
supplier weylNormSq_Bmu_le (LocalStatement 201-226), especially
norm_jet_le_of_isAdmissibleComb, class-count bound and exact
seesaw/good datum. Retain peer CM/Hecke prerequisites and the
existing compact primeError endgame. HANDOFF TO integration,
formal audit, kernel, theta. Do not optimize completed estimates
or assert A/RH closure from this local chain.
-/

namespace PrimeWindowRun67

/-- Exact radius budget for the perpendicular short-vector construction. -/
theorem radius_budget (C u a : ℝ) (hu : u = 2*C)
    (ha : 2*a ≤ u+C) : a ≤ 3*C/2 := by linarith

theorem outside_budget (C d : ℝ) (hC : 0 < C)
    (hd : d = 2*C) : C < d := by linarith

/-- The aggregate size budget at the actual short_forms consumer. -/
theorem short_height (hmain rem m b q g err h0 logB : ℝ)
    (hb : 0 ≤ b) (hl : 5 ≤ logB)
    (hq : q + g ≤ err) (he : err ≤ b)
    (hh : h0 ≤ hmain-m*rem+b) :
    2*q+b+h0+2*g+b ≤ hmain-m*rem+logB*b := by
  have hx := mul_le_mul_of_nonneg_right hl hb
  linarith

theorem difference_budget (B a b c d : ℝ) (ha : a ≤ B)
    (hb : b ≤ B) (hc : 0 ≤ c) (h : d+c=2*a+2*b) :
    d ≤ 4*B := by linarith

end PrimeWindowRun67

#check Space.exists_short_basis_stdSpace
#check span_isShort_eq_top
#check Data.finrank_ker_one_sub_centralGen_le
#check Data.ramifyingOp_finrank_comap_and_short
#check Data.span_short_ramifiedColumns
#check Data.short_forms
#print axioms PrimeWindowRun67.radius_budget
#print axioms PrimeWindowRun67.outside_budget
#print axioms PrimeWindowRun67.short_height
#print axioms PrimeWindowRun67.difference_budget
#print axioms Data.span_short_ramifiedColumns
