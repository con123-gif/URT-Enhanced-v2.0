import New.Rows.ComparisonForms
import New.Rows.HeckeValueHeight

/-!
# RUN65 — one period-vanishing supplier for BOTH C consumers
26 Nov 2026. Human source-matched reconstruction; native replay NOT RUN.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src.
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript 0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9.
Branch head observed 6822e2d21da925e52a011f0ce1f44427ac8e2dde.
Previous lane result 84ff12029ec85bd14341c39bf38eb580ccc84587.
RUN52 already assembled the class-period interface; this run expands its
previously unproved analytic period and Hecke tower suppliers, and checks
both actual callers. Recent peer commits 3d8ec587, a6dfbea2, 131aaf2d,
76590e96, 84fdd5d5 reviewed by summaries; no duplicate crystalline period
or Fock orthogonality work.

## Pinned source ledger (actual bodies)
New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1:
  descentsVanish_hypSum, stdClassSum_period_eq_zero,
  DividedSplitting.stdClassSum_inner_productForm_eq_zero.
New/SiegelWeil/AuxPairVanishing.lean 8613d2aaed78ee56e6866907ddda2d7a8e951eee:
  AuxPair.exists_annihilator_or_congr_inclMatrix,
  AuxPair.smul_chosenGLRep_eq, AuxPair.descentsVanish_of_reflectionSum.
New/SiegelWeil/DescentsVanishPlanes.lean 837e8a95ebb14d58a1e379cbba0426fc79b652b3:
  eq_zero_of_heckePolyOp_eq_zero, DescentsVanish.integral_sourceTerm_eq_zero,
  descentsVanish_add_planes.
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd:
  maximum_principle, heckePolyOp_eq_sum, hecke_transfer_of_equivariant.
Lib/Weil/DualPair/DescentsVanishDef.lean a3c77325a8cf3026687b2b74416ad877fcb46bfb:
  DescentsVanish (all data fixed by specified vacuum projection).
Lib/Shimura/ComplexTheta/PeriodVanishing.lean 0cdc82478a980a49506166275445304b76fdb530:
  period_eq_zero.
Lib/Weil/DualPair/FourierCoefficient.lean f2756c5504bd6cdc8b38c8cf17c4310ec5d38ff8:
  exists_tsum_thetaTerm_le, centreCoeff_integral_eq_tsum,
  centreCoeff_eq_integral_stabilizer.
Lib/Adelic/QuotientMeasure/CocompactIntegrable.lean 2e4fa030a20738c99389a926add53ef1a2ddc5a2:
  integral_quotMeasure_stages, exists_integral_stages_eq_mul.
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a:
  tableTheta_adjoint_eq_zero.
New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84:
  exists_test_form_inner_kernelForm, heightLe_inv_ratio.

## 1. Reflection extension, including the three distinct branches
Fix O, y and its conjugate coordinate u. Let C_z be the descent functional
on the coset indicator with centre z and fixed local scale t, after fixing
the polynomial and evaluation g. Continuous linearity of the lift and
the Schwartz--Bruhat coset spanning argument reduce to these C_z, but
only within the actual vacuum projection. At each chosen place append the
scale matrix tI to the (row-scaled at Q) centre matrix. The appended
matrix has a left inverse. Saturating its column lattice gives a primitive
matrix P with integral left inverse L; (PL-I) annihilates the matrix.
If the chosen-column residue of every row of PL-I is zero, the reduction
of LP on the chosen chart gives the invertible change of columns in
exists_annihilator_or_congr_inclMatrix. Retain the exact valuation
conditions in that lemma (not a uniform bound on all arbitrary centres).

Use the native covariance lv, with local matrices A,B and residue block
s=I+B^T A, to compare C_q applied to the character-weighted translate
of y with C_z(y). Invertibility of I+AB^T follows from Sylvester's
determinant identity and the invertibility of s modulo the maximal ideal.
The left/right place distinction, transpose, and residue conditions in lv
are essential, not arbitrary GL covariance. For a fixed row of the
annihilator, let m_j be its restriction to the chosen columns mod j.

(a) If a row restriction at an M-place is nonzero, use the stabilizers
s=I+x m_j with det(s) nonzero, identity elsewhere. The source H shows
each weighted translate has the SAME C_z value. The reflection sum
kills y, so 0=C_z(reflectionSum y)=number_of_terms*C_z(y).
Identity belongs to this nonempty finite set; char zero gives C_z(y)=0.

(b) If a row restriction at a Q-place is nonzero, choose a coordinate b
with m_b != 0 and a unit d with psi_j(d) != 1 (hypothesis hQ). Take
x=e_b(d-1)/m_b. Then det(I+x m)=1+m x=d. Covariance gives
C_z(y)=psi_j(d)^(-1) C_z(y), and the nontrivial character forces zero.
No estimate or bound for the character sum is needed.

(c) If every restriction vanishes, the actual annihilator lemma supplies
the local changes of columns A. The residue datum Psi after this change
satisfies Psi(z)!=0; it is constant on the relevant scale cosets by the
valuation estimate (ha). The source's H shows, for each q with Psi(q)!=0,
Psi(q) C_q(y)=C_(inc A^-1)(y), with the same value on every such coset.
Expand Psi as the finite coset sum and evaluate the assumed zero descent
at gA. Its value is a positive integer times C_(inc A^-1)(y), up to
the nonzero Weil covariance scalar. Hence this common value vanishes;
apply H at z and Psi(z)!=0. The source obtains Psi(z)!=0 from the
integral chart, not from h0. The finite expansion is not a claim that
all local data are group translates of one datum.
The two local chart/covariance lemmas, coset spanning, nonzero Weil scalar,
and highest-vector cyclicity at descentsVanish_hypSum remain explicit
source suppliers; this is the branching argument given those suppliers.

## 2. Exact rank budget in climbing the theta tower
Let r=dim W, p=number of added hyperbolic planes, m=r+2p, n=dim V,
k=n-m. At the actual split place q>=2, the root magnitude is
 |X|=q^(r/2+1-n).
For p>0, the transfer identity and adjoint Hecke action in
descentsVanish_add_planes give the spherical larger-source descent F:
  [prod_(j=0..k-1)(1-z_j)] H_m(X') F=0,
  |z_j|=q^(j+m/2)|X|, |X'|=q^(k/2)|X|.
Use the precise native conjugate place, character and vacuum guards:
unit-modulus character factors drop ONLY after taking magnitudes. Since
 j<=k-1, |z_j| <= q^(-p)<1.
Thus the whole scalar factor is nonzero and can be cancelled exactly.
The rank hypothesis n>2r+2p+3 means n>=2r+2p+4, hence
 q^(m+1)|X'| = q^(r+p+2-n/2) <= 1.
This is precisely the input hX of eq_zero_of_heckePolyOp_eq_zero,
not the untransferred X. The p=0 base is handled by the actual
zeroTerm/sourceTerm identity (no inversion of this product at p=0).

For the native spherical Hecke sum on a rank m space the coefficient
of the zero subspace is 1. At Y=g/r(0), moving that term to the other
side gives
 |F(g)| <= sum_(U!=0) |c_U| |F(g/r(0)*r(U))|.
The q-binomial identity gives the sum of ALL coefficient magnitudes
 prod_(i=0..m-1)(1+q^i|X'|).
Its log is <= |X'| sum_i q^i
 <= q^(-m-1)(q^m-1)/(q-1) < 1/(q(q-1)) <= 1/2 < log 2.
Consequently sum_(U!=0)|c_U|<1. For the bounded F, taking the supremum
gives M<=cM, 0<=M<infty and c<1; F=0. This is the native maximum
principle (source uses the equivalent doubled coefficient inequality).
No spectral estimate or assertion of attainment of the supremum.
The essential boundedness is not supplied by mere moderateness:
subtract the last-plane zero term; sourceTerm vanishes by induction on
p and the adapted Iwasawa decomposition. Native covariance of the
difference under the radical, short isotropic vector and rational Witt
transport give an integrable constant bound for the difference using
exists_norm_name_le and definiteness of V (first minimum exactly one).
The source's final norm_integral_le_of_norm_le_const then bounds F.
The analytic short-vector/weighted-moment estimate, equivariant transfer
and integral convergence of this step remain retained suppliers;
the above closes their scalar rank and strict contraction assembly.

## 3. Nondegenerate coefficient to actual period (analytic bridge)
Use the notation of period_eq_zero. V definite; i embeds the complementary
U(n2) block, a=blockEmb(h1,1), t(g)=g^-1 a, y=standard n1 frame.
The stabilizer of y is exactly i(H): fixing its orthonormal columns
forces the complementary unitary block, by unitarity.
Set eta(g)=g.mat*y, Phi(g)=|vacuumFn(scale*eta(g))|^2 and
 e_g(u)=stdAddChar(invDifferent*(1-idem(T.conjClosure))*u dot eta(g)).
Let B(g)=int_[H] Y(i(h)*a*g^-1) dh. It is continuous, by boundedness
of Y (definite compact quotient), finite measure, dominated convergence.
It is constant on fibres of eta: if eta(g)=eta(g'), g'=g i(v) for
some v, a commutes with i(v), and right quotient invariance changes
the variable h. In particular B(1) is the desired complementary period.

The native mixed-model identity with vacuum data and translated finite
Heisenberg parameter u, followed by the nondegenerate coefficient
unfolding centreCoeff_eq_integral_stabilizer, gives for every u
  int_[i(Gamma_H)\G] e_(t(g))(u) Phi(t(g)) Y(g) dg=0.   (P)
The native summable theta term bound is uniform here because V is
definite; multiplying by bounded Y and using finite volume justifies
absolute integrability before selecting the coefficient and unfolding.
Witt identifies the Gram=I frames as ONE rational orbit. The vacuum
mixed-model scalar is nonzero, so cancellation yields P. Retain the
actual adapted homSource, additive-character normalization, central
coefficient and away-level vacuum hypotheses. No arbitrary Fourier
interchange with a conditionally convergent series is used.

Suppose B(1)!=0. Let K=U(n)(R) x Kf, compact since definite. The bad
compact set is the image under e of {k in K: Re(B(k)/B(1))<=0}.
It excludes e_1: equality of e characters, by additive duality, gives
equality of eta coordinates off T.conjClosure with the standard frame.
Replace the off-level components by identity using closurePart T. This
preserves eta and hence B; the remaining compact translate is supported
on T.conjClosure and fixes Y by hK. Thus B(k)=B(1), contradiction.
Choose a bounded continuous nonnegative function phi on the character
image with phi(e_1)>0 and phi=0 on the bad compact set. The source
uses complete regularity. If Phi(g)>0, local vacuum support and the
integral Witt extension give k in K with eta(k)=eta(g); the real
component already belongs to the definite compact group.
Consequently the weighted character image is supported in e(K).
The evaluation functions e->e(u) form a self-adjoint algebraic span:
e(u)e(v)=e(u+v), conjugate=e(-u), e(0)=1, and they separate characters.
Stone--Weierstrass on e(K) and absolute integrability of Phi(t(g))Y(g)
allow approximation of phi, so P implies
  int_[i(Gamma_H)\G] phi(e_(t(g))) Phi(t(g)) Y(g) dg=0.  (Pphi)
This compact support argument is an alternative direct justification of
the native strongIntegral_apply and stone_weierstrass_span step.

Now apply exists_integral_stages_eq_mul with the actual closed block
embedding, left discrete subgroup i(Gamma_H), and
 rho(g)=phi(e_(t(g))) Phi(t(g)) B(t(g))/B(1).
Its real part is nonnegative by the compact representative above:
whenever the first two factors are positive, the character image
avoids the bad set. At g=a, t(g)=1, so Re rho(a)>0 (vacuum at standard
frame nonzero), and continuity gives the required neighbourhood.
For left translate i(h)g, t(i(h)g)=t(g)i(h)^-1 and eta is unchanged.
Thus integrating the Pphi integrand first over [H] gives exactly
 phi(e_(t(g))) Phi(t(g)) B(t(g)) = rho(g) B(1).
The stage lemma supplies nonzero R, hence
                         0 = R B(1).
Contradiction. This is the actual period, for each h1 separately.
The measure-stage lemma itself is supplied by quotient Fubini: the
left closed group acts properly, the orbital cutoff disintegration
preserves the Haar integral, and nonnegative real part positive near
a point forces nonzero integral (full support on the quotient).
Retain these topological/measure hypotheses, the local integral Witt
lemma, and the actual mixed-model coefficient supplier. The result is
a source-matched human argument, not an independent kernel replay.

## 4. Both actual C consumers, same period lemma
In MemberOrthogonality expand the equivariant Cartan map C on the
nabla basis j of the small block. Let v be the complementary kernel
chosen by the nonzero vacuum pairing, phi_j=boxProd(v,modDatum_j),
and L_j the gramForm of C on basis j. The native F is
  sum_j pairTheta(phi_j)(g,h)*conj(algFormCoeff(1,L_j,Xi)(h*(1,x*A))).
The finite sum is invariant under rational points; the two factors
have the compatible away-level vacuum/character (projection on the
tensor product, upsilon determinant cancellation at Kf, x*A supported
at chosen places). Descent to the hyperbolic block is zero: split the
source box product, translate the coefficient by x*A, apply block 1
then block 2 to every j, and sum absolutely integrable terms.
The precise rank hypothesis remains 2*card r+2*card N+3<card n.
The source product identity on h1 and complementary h gives
 F(block(h1,y,h)) = c * conj(f(h)),
where c=pairTheta(O.W,stdSpace N,O.a,b^-1,v)(g,h1)!=0 is the SAME
constant at every h. Equivariance of C handles the real y action; it
does not permit replacing it by a scalar map in the comparison case.
Block 3 gives period zero. Rational and K-invariance (the two hk
conditions) identify this integral with stdClassSum K, including
its actual class weights. Therefore
                  0=c*conj(stdClassSum K f)
and c!=0 implies the class sum vanishes. No norm bound is required.

Actual caller 1: ComparisonForms.tableTheta_adjoint_eq_zero uses
splittingV.stdClassSum_inner_productForm_eq_zero at principalLevel l
varpi and the equivariant Cartan product composed with conjugation.
The good central projector and orthogonality to goodLift give theta
zero by adjointness; reflectionSum_mul_e0 and the Hecke kernel give
the other two hypotheses. The row-fixing level and glued lattice are
the same as RUN60. A singleton member table then gives
tableTheta_j((comparisonForm)^* Xi)_i(g)=0, preserving all level/class
guards. This is used in exists_comparison_forms and lift volume height.

Actual caller 2: HeckeValueHeight.exists_test_form_inner_kernelForm
calls stdClassSum_period_eq_zero DIRECTLY in the final test-orthogonality
proof, with epsilon=refl, the span-singleton map composed with
gramForm for the rank (2p.z-20) flat partner, chosen support x=1,
and reflectionSum_mul_labelIdem rather than reflectionSum_mul_e0.
The hypotheses are exactly hy.2 (theta), hy.1.2 (Hecke),
hy.1.1.choose_spec (label projector), hE and le_m (rank), and psi_ne_one
at the twist places; level covariance remains required. Each outer
finsum term vanishes, hence the constructed Xi is IsTestForm, without
changing its pairing or the local normalization proved in RUN64.
The two callers do NOT have interchangeable projectors or Cartan maps.

## Source role graph / frontier
Original: both C height callers -> stdClassSum_period_eq_zero ->
  descentsVanish_hypSum -> reflection / Hecke transfer / tower growth;
  period_eq_zero -> coefficient + staged quotient measure + character
  separation + integral Witt; classSum conversion, nonzero vacuum
  pairing, equivariance and level covariance.
Reduced exposition: branches (M,Q,chart) -> descent at initial W;
  tower rank budget + bounded Hecke contraction -> larger descent;
  coefficient + separation + stage identity -> actual period;
  period + SAME nonzero multiplier -> class vanishing -> BOTH callers.
No original edge globally deleted; all other native A/B/C, Selmer,
and analytic endgame obligations unchanged. Cache context
(pin,O,twist,Xi,w,root,r,n,N,projection,level,h1,C,character,role).
Original graphs and prior axiom ledger untouched. This supplies the
shared human argument, conditional on named retained suppliers, rather
than asserting a new independently discharged root obligation.

## Execution and replay
Local command -v lean/lake/elan returned no executable. Actual compact
CI run 45803534769 re-read from status.json a56e2d3afb99ed8275e81fd63c8494306e57c43f
and outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
six native checks in TiltingLemma and Filling.Moments with three standard
axioms; module_1 timeout (124), all_requested_checks_ok=false,
full_RH_replay=false. These are not checks of this period bridge.
Old pin rh_prune/rh_scan and rh_reduce/auto/frontier passes do not
transfer to this toolchain. No new kernel execution or benchmark;
native replay queries and two local scalar bridges prepared below.
No imported RH theorem or URT premises. No competing CI job.

RESUME HERE: prove the precise boundedness step in descentsVanish_add_planes:
extract exists_norm_name_le at the short isotropic vector with the
difference of theta and its last-plane zero term; track weightedNorm,
the rank guards and exact first minimum one. In parallel inspect
exists_annihilator_or_congr_inclMatrix and the local level covariance
lv for the remaining finite-chart bridge. Do not redo scalar
contraction or period separation. Ask kernel lane to include these
actual declarations and the two actual C consumers in the next
allowed shared targeted replay, then inspect real axioms/results.
HANDOFF TO integration/editor, theta, positivity, character boxes, kernel.
-/

namespace CompactPeriod65

/-- Doubled exponents in the actual tower transfer. The first inequality
makes every extra Euler factor nonzero; the second is the small-root
guard after transfer, not before. -/
theorem rank_budget (r p m n k : ℕ)
    (hp : 0 < p) (hm : m = r + 2*p) (hk : n = m+k)
    (hn : 2*r+2*p+3 < n) :
    2*(k-1)+m+r+2 < 2*n ∧ 2*(m+1)+k+r+2 ≤ 2*n := by
  omega

/-- The period conversion cannot introduce another normalization loss. -/
theorem cancel_period (c z : ℂ) (hc : c ≠ 0)
    (h : c * star z = 0) : z = 0 := by
  have hz : star z = 0 := (mul_eq_zero.mp h).resolve_left hc
  simpa using congrArg star hz

#print axioms rank_budget
#print axioms cancel_period
end CompactPeriod65

#check AuxPair.descentsVanish_of_reflectionSum
#check descentsVanish_add_planes
#check eq_zero_of_heckePolyOp_eq_zero
#check hecke_transfer_of_equivariant
#check Space.Splitting.centreCoeff_eq_integral_stabilizer
#check exists_integral_stages_eq_mul
#check period_eq_zero
#check stdClassSum_period_eq_zero
#check DividedSplitting.stdClassSum_inner_productForm_eq_zero
#check tableTheta_adjoint_eq_zero
#check exists_test_form_inner_kernelForm
#print axioms AuxPair.descentsVanish_of_reflectionSum
#print axioms descentsVanish_add_planes
#print axioms period_eq_zero
#print axioms stdClassSum_period_eq_zero
#print axioms tableTheta_adjoint_eq_zero
#print axioms exists_test_form_inner_kernelForm
