import Mathlib

/-!
# RUN65 — determinant-period measure at the actual critical pair caller
26 November 2026. SOURCE-MATCHED HUMAN DERIVATION, conditional on the named
upstream geometric suppliers; new scalar certificates PREPARED, not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; current
HUMAN_PROOF_COMPACT blob 0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9.
Resume previous lane fb2fa75c030047f90f06a14b2ce8cf2fe4d2392f.
Peers checked: integration 3d8ec587; dependency a5929b54 (C period/rank
supplier), Galois e57db995 (reciprocity/double cocycle); do not duplicate their
branches. No old-pin theorem imported as shortcut. No URT used.

## 1. Local determinant filter, before class averaging

Actual target: ChainValuation.lean lines 22–83,
blob 19e853dfa8c645bfcdf3b3e21183f9b432620ef7:
detKernel_embFin_mul, detPeriod_eq_stdClassSum_sum, detPeriod_insert.
Fix a positive rank n, alpha of weight -c, tame part psi trivial outside
modulus M. M' adds exactly a new place v. Both are native moduli with
disjoint conjugate places. Consequently v is split, vbar is not in M',
and alpha is unramified at v and vbar. No arbitrary inert-place insertion
is asserted. q=#k_v; T=(alpha.frobValue n v)^(-1), nonzero. The old
modDatum is vacuum at v (integral matrix indicator times the other
local and infinite factors); retain the same polynomial P.

For a subspace U of k_v^n, let j=dim U and choose basicCosetRep U as
in HeckeGL.lean (923db13430eeb318ab80421c84b9a18a3d021ad3).
In a basis of the lattice, its elementary divisors are pi (j copies)
and 1 (n-j copies); its residue kernel is U. The translate of the
vacuum by the transpose representative, as in the actual first
HeckeTransfer summand, is supported at integral matrices x whose
reduction has transpose-kernel containing U. Indeed x^t B^{-1} is
integral iff x is integral and ker(B mod pi) is contained in
ker(x^t mod pi): x^t=(x^t B^{-1})B proves necessity; conversely
pi B^{-1} is integral and reduction of x^t(pi B^{-1}) is zero because
its columns land in ker(B mod pi). Dividing by pi proves sufficiency.
No support assertion for nonintegral x is lost.

Use exact local Weil action pairWeil_name_on, PairSumNegation.lean
d2f45383d2e972574a7e749da0f2b4bb9283c6da: the scalar of the second
group translation is spaceChar(alpha,n)(det B) |det B|^(-n/2).
The determinant has valuation j, and the unramified character kills
the unit, so this is (alpha.frobValue n v)^j; UniformiserScalar.lean
51969de5cd90a47fac42404faf1a7b4fcce39645 gives the precise sqrt(q)^n.
This scalar cancels T^j in the coefficient (-T)^j q^{j(j-1)/2}
BEFORE evaluating norms. In fact with general T the sum on x is
  sum_{U<=ker(xbar^t)} (-T alpha.frobValue)^dim U q^{choose(dim U,2)}
  = prod_{i< n-rank(xbar)} (1-q^i T alpha.frobValue).
For completeness, if a(d,j) counts j-subspaces in dimension d,
split along a fixed hyperplane: a(d,j)=a(d-1,j)+q^(d-j)a(d-1,j-1).
The second term follows by choosing a (j-1)-subspace of the hyperplane
and one transverse generator modulo it. Multiplying by
(-Y)^j q^{j(j-1)/2} and summing gives S_d(Y)=(1-q^(d-1)Y)S_{d-1}(Y)
with S_0=1. This proves the native q-binomial identity, including
d=0. At Y=1 it is EXACTLY 1 for full rank, 0 for every smaller rank.
Thus the Hecke sum inserts precisely the new residue determinant
unit indicator (psi_v=1 as a multiplicative character extended by
zero on nonunits). It changes neither P nor any other local factor.
This reconstructs the actual first equality of
HeckeTransfer.sum_heckePolyCoeff_smul_pairWeil (blob
9145e115beff2378fb879e699ce56a40149f62cd) at its determinant caller,
rather than assuming a generic Hecke transfer for unrelated data.

## 2. Class averaging: no additional index factor

For f(g)=detKernel(...)(g), the product of determinant polynomials
has exact weight +c, cancelling alpha's weight -c under rational
left translations (native twoSidedSubst_stackedDetProd and
modKernel_embFin_mul). Right Kf invariance follows because the
right action on the residue function chi(det x) multiplies it by
the opposite determinant character; chi agrees with alpha on units
by the tame-part hypothesis. Keep the actual rational equivariance,
finite class-type and smoothness premises here. The class integral
normalized at Kf is right-translation invariant on these smooth
left-rational invariant functions; see ClassMean.classIntegral_sum
and classIntegral_eq_classSum. Equivalently refine Kf by its
intersection with translated stabilizers and count each finite orbit
with its reciprocal stabilizer order. Thus integrating the local
identity from section 1 gives EXACTLY
   Lambda(M') = [prod_{i=0}^{n-1}(1-q^i T)] Lambda(M).
The same level Kf is used for the two class sums; do not divide by
|GL_n(k_v)|. For n=2 the coefficient is
   1-(q+1)T+qT^2 = (1-T)(1-qT).
Here the number of lines in k_v^2 is (q^2-1)/(q-1)=q+1. The term
qT^2 is indispensable. This supplies detPeriod_insert at the actual
ValueFamilies critical (z=1) branch.

## 3. Integral coefficients for the same finite modulus

ValueFamilies.lean blob 22b608a059e66ce3154e8e8e2d42d779cff0acad.
For a ramified p with z=1, set c_tau=p.c_tau-1 (nonnegative by le_c),
alpha_theta=p.nu * theta.toAutChar * upsilonU1, P=prod_tau det^{c_tau}.
The character has weight -c. Polynomial P has integer coefficients
and total degree 2 sum_tau c_tau, precisely the d supplied to
MemberKernels.exists_modKernel_integral_bound
(be36c0175fe559376780b105052249fc0c9f1f4f, lines 138–167).
It supplies one N != 0 independent of modulus, theta and prime,
for the degree and fixed D. Fix a declared Q and M=D.m(theta,2).
Do NOT require Q to be the exact conductor. Choose Kf-class
representatives h and residue group lifts k of GL_2(O/M) once.
Write g_x=h*k, u_x=detFin(1,g_x), A_h=#classAut(h), G=D.chosenGroupOrder.
By linearity in the residue datum, expand chi(det matrix) as the sum
of translates of the delta indicator of identity. The translated
kernel at g_x has exactly the factor theta(u_x), since modKernel_twist
(TwoLineTerms) is mu(det h)/mu'(det g), and first argument is identity.
Consequently
   G N Lambda(theta) = sum_x c_x theta(u_x),
   c_x=(G/A_h) N detKernel_{alpha_1,c,M}(delta_1)(g_x).
Here alpha_1=p.nu*upsilonU1, with the SAME enlarged M; not the smaller
modulus of the trivial twist. All c_x are independent of theta within Q.

At every rational prime ell prime to levelNorm(Q) and every specified
embedding, G/A_h is integral by the native stabilizer divisibility
card_classAut_dvd_chosenGroupOrder (rank 2 bounded by D's scale).
Use ClassReps.exists_mul_mem_integralAbove to choose a rational
left translate of g_x integral above ell. By detKernel_embFin_mul
this does not change the kernel value; in particular the determinant
twist factor has already been extracted, so it does not alter u_x.
The first argument is identity and integral, delta_1 has values 0 or
1, P is integral and homogeneous, and the actual D.norm_mul_gProd_pow_mem_modulus
gives levelNorm(Q)*D.gProd^2 in M. These check the hypotheses of
the FIRST (local integral) clause of MemberKernels, without needing
its archimedean bound. Hence c_x belongs to integralAway(levelNorm Q).
The rational translates may depend on ell, but coefficients and N do
not. This distinction is necessary for the all-prime measure.

Now define F(theta)=|G N Lambda(theta)|^2. The theta character has
values of complex absolute value 1. Multiplication by the complex
conjugate gives the integral group ring expansion
   F(theta)=sum_{x,y} c_x conjugate(c_y) theta(u_x/u_y).
Conjugating a coefficient preserves integrality at all embeddings
above ell, because the composite with complex conjugation is again
one of the embeddings in integralAway. No chosen embedding is
assumed fixed by conjugation. Products are integral. This is exactly
the norm_sq construction at TriangleLevelExponent.lean
(e1b3a17423c1f003c1d5311ef484638973750ac4, lines 23–34).

## 4. Euler insertion and ratio normalization of this SAME F

The base change of upsilonU1 is upsilon^2
(SplittingCharOnU1.lean 12af091740ccb57e363bf3b37c208f9b95fe059e).
For y=(p.nu*theta.toAutChar).baseChange.atUnif(v) of complex norm 1,
spaceChar(alpha_theta,2)=baseChange(p.nu*theta.toAutChar).
Thus alpha_theta.frobValue(2,v)=q*y, T=y^{-1}/q. By sections 1–2,
Lambda(theta')=(1-y^{-1}/q)(1-y^{-1})Lambda(theta) if theta'
has the same underlying/tame character and just adds v to Q.
Taking the square modulus (now, and not before cancellation) yields
   F(theta')=F(theta) prod_{k=0,1} prod_{eps=+1,-1}
                   (1-y^eps/q^(1-k)).
This is exactly the z=1 Euler law with K=univ in exists_isIntegralMeasure.
For z>1 retain the distinct native integral algebraic L-part branch
(TriangleLevelExponent.isIntegralMeasure_intAlgPart and
intAlgPart_eq_mul_L); its K={0}, m=0 and not the above squared period.

For normalization use Carrier.stdClassSum_det_modKernel_eq (blob
f0b7f97f299904aa73a928432147a932cac9be40, lines 154–171), at rank 2,
same polynomial c and actual IsTameFor. It gives a constant C
independent of theta and a gamma_theta with gamma_theta Lambda_theta=1,
|gamma_theta|^2=C/Lprod_theta, where
Lprod_theta=lValueProd(M.places,(p.nu*theta.toAutChar)^(-1),1).
The upsilon factor cancels in alpha_theta^{-1} upsilonU1. The nonzero
gamma at theta=1 and finite nonzero Lprod there give C>0; likewise
Lambda_theta is nonzero. Consequently C F(theta)=|G N|^2 Lprod_theta.
TriangleLevelExponent.Pair.lValueProd_eq at z=1 and sign +1 gives
Lprod_theta=levelNorm(theta)*Lprod_1*ratio(theta)^2 (lowerPoint 1=p).
Cancel C exactly, retaining F(1)!=0:
   F(theta)=F(1)*levelNorm(theta)*ratio(theta)^2.
This establishes the critical measure law with m=1, and supplies
the actual Data.Pair.exists_isIntegralMeasure -> exists_isFamily
-> TwistForRows.exists_mFoldTwist_selmerLengthLe field. RUN64's
signed Artin interpolation handles the two signs separately and
removes the auxiliary conductor valuation since ell is coprime to Q.
The simultaneous common twist and balanced-row length are still
distinct premises; they have not been deduced from this scalar law.

## Surviving dependencies and verification

Original source-visible graph: FitTwistsExist -> TwistForRows ->
ValueFamilies.exists_isFamily -> Data.Pair.exists_isIntegralMeasure
-> ChainValuation.detPeriod_insert, detPeriod_eq_stdClassSum_sum,
MemberKernels.exists_modKernel_integral_bound, Carrier.stdClassSum_det_modKernel_eq,
TriangleLevelExponent.norm_sq, lValueProd_eq, isIntegralMeasure_intAlgPart.
Reduced human graph: determinant-support/rank filter -> normalized
class integral -> common coefficient family -> four Euler factors
and single common C cancellation -> signed repayment.
Preserve all underlying rational equivariance, class-type/right
invariance, tame/support, coefficient denominator and period matching
premises. In particular Carrier.explicit_matching / Rallis and
Siegel–Weil, local standardData/vacuum integrality, nonzero L-value
and z>1 lift norm foundations remain upstream leaves, not discharged
by this note. No new global graph deletion, no new axiom edge claim,
no import of Main or RH. Context key (pin,D,p,z=1,Q,c,v,ell,iota,
fixed coefficient family); the sign-specific Artin family is distinct.
Existing original and reduced native graphs remain intact. Peers'
period orthogonality and reciprocity results not duplicated.

Local command -v lean/lake/elan: all absent; no rh_prune, rh_scan,
rh_reduce, rh_auto, rh_auto_frontier or new kernel replay executed.
Prior actual CI reread: state branch compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769. Six named native checks of TiltingLemma and Filling.Moments
with propext, Classical.choice, Quot.sound; module_1 build timeout 124
after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
Not evidence of this file passing. Scalar certificates below are
prepared executable Lean, not a native proof of the deep inputs.
No redundant finite numerical trials or fabricated CI. Shared
kernel lane should batch this with RUN64 rather than duplicate a build.

RESUME HERE: at Carrier.stdClassSum_det_modKernel_eq inspect
explicit_matching at rank 2 and zero complementary rank; identify the
exact remaining exchange scalar/nonzero supplier versus the already
integrated period orthogonality. If owned by geometry, take
RowBalanced.IsRow.eventually_isBalanced local_length_le plus final
10 f n crudeUnit budget; do not redo the critical determinant measure.
HANDOFF TO integration/editor, kernel and audit: integrate sections
1–4 at the critical branch; preserve other open primitives and check
the native normalization, support and common coefficient witnesses.
Human RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes65

theorem rank_two_filter (q T : ℂ) :
    1 - (q + 1) * T + q * T^2 = (1 - T) * (1 - q * T) := by
  ring

theorem rank_two_nonunit_filter (q : ℂ) :
    1 - (q + 1) + q = 0 := by
  ring

theorem four_euler_factors (a b qinv : ℂ) :
    ((1 - a * qinv) * (1 - a)) * ((1 - b * qinv) * (1 - b)) =
      ((1 - a * qinv) * (1 - b * qinv)) * ((1 - a) * (1 - b)) := by
  ring

theorem critical_period_repayment (C G F F0 L L0 N R : ℝ)
    (hC : C ≠ 0) (hF : C * F = G * L) (hF0 : C * F0 = G * L0)
    (hL : L = N * L0 * R^2) :
    F = F0 * N * R^2 := by
  apply (mul_left_cancel₀ hC)
  calc
    C * F = G * L := hF
    _ = (G * L0) * N * R^2 := by rw [hL]; ring
    _ = C * (F0 * N * R^2) := by rw [← hF0]; ring

#print axioms rank_two_filter
#print axioms rank_two_nonunit_filter
#print axioms four_euler_factors
#print axioms critical_period_repayment

end CompactCharacterBoxes65
