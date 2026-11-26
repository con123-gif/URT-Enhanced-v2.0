import Lib.DiscreteSeries.CuspKernel.SchurOrthogonality
import Mathlib.Tactic

/-!
# RUN59 — Schur reproduction, L² embedding and Casimir at the actual B consumer
26 November 2026. Human source-matched derivation, pending independent audit and
native replay. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, latest completion-first
directive and mandatory engine; manuscript a1cd58ab264179f0e35001a50da0853ef4b9d858.
RUN58 blob 2be1c9fed09758142339c67a49b969ce3dc7092d. Peer RUN59 geometry
329c06fd (one-vector B unfolding), dependencies 4dcf2dd6 (C Rallis), editor
3c29c488 (integration), 3347d944 (A jets), ce3f88d1 (C frame), 5974a9fe
(latest mission) inspected; no duplication. No URT or imported RH root.

## Source and exact frontier
Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean 7be5411c2c4c3662db6f10be4c7fda7f63c27287:
isKHighest_dsGenerator, integral_mul_dsCoeff_translate,
exists_smear_dsCoeffSmooth_eq, exists_decay_bound, memLp, formalDegree_pos,
dsCoeff_schur_orthogonality, toL2_spec, isUnitaryCasimirGe_dsAction.
FlenstedJensen/PsiBasic.lean d888fafb9db9b1a5e78aa2551a1480f0cf057d20:
dsCoeff_one, dsCoeff_inv, dsCoeff_neg, dsCoeff_of_mem_maxCompactU.
FlenstedJensen/KTypeProjection.lean f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a:
integral_conj_weightMinors_mul_dsCoeff (retain the native lowest K-type case).
FlenstedJensen/PsiDecay.lean 2ca9efe4949fe0b10512153a3562daf2b97d2edf:
norm_dsCoeff_sq_mul_det_pow_le_one, norm_dsCoeff_le_pow (retain).
FlenstedJensen/FlenstedJensenInvariance.lean 46f4a4931a139742e73fc43f519da651ed680233:
analyticAt_dsCoeff, flenstedJensen_eq_of_accretive, Borel derivative.
FlenstedJensen/CasimirOnPsi.lean cab16656f94119a04d3e39249c16b3ef17f5316c.
Holomorphic/MinorEquivariance.lean 062b3ebed0519f48edeb7853533ed8ccdda4370a.
Rigidity/CasimirBound.lean f47bbb602c8e77086cbc4506f6580739716dd2b7.
CuspKernel/BumpConvolution.lean b62172c4d3b2e75c7466ecfd73ed40c080ad062f.
Haar/RegularRepL2.lean 6a3f37e076f6d5fce2dc6943adf74cf3b003e7e8.
All relative to Lib/DiscreteSeries unless specified.

## 1. Lowest-weight projection yields the exact group reproducer

Let G=U(J), n>=1, K=G intersect U(n), dk Haar probability,
dg the original unimodular Haar measure, l=2lambda of gap 500n^3+A,
Lambda=lowestKType(l), psi=dsCoeff(l), m=weightMinors(Lambda)|K,
c=int_K |m|²>0. Keep the native complex function, not an arbitrary
coefficient from a possibly differently normalized discrete series.
Native basic identities: psi(1)=1, psi(g^-1)=conj psi(g),
psi|K=m, |psi|<=1. Use only the following lowest K-type case of
KTypeProjection:
    int_K conj(m(k)) psi(x k b) dk = c psi(x)psi(b).       (P)
The other-weight exclusion is not needed in this local proof; no global
deletion of it. Its native holomorphic proof remains an open human input.

For w integrable with int_K conj(m(k)) w(k^-1 g) dk=c w(g),
insert this equation into c int_G w(g) psi(x g a) dg. Fubini is
justified by compactness, bounded m and psi, left invariance and w in L¹.
Change g=k h before estimating. Equation (P) gives exactly
    int w(g)psi(xga) dg = psi(x) int w(g)psi(ga) dg.       (T)
No irreducibility assumption or unspecified Schur constant.

## 2. Generate every derivative vector by a compact smear; decay

Choose a nonnegative smooth left-K-invariant bump h(g) of compact
support with h(1)>0, e.g. a smooth nonnegative cutoff of
||g* g-I||_F², with support in a finite norm ball (properness of G).
Set w(g)=h(g)psi(g^-1) and beta(y)=w(y^-1).
Then w(k^-1 g)=h(g)psi(g^-1 k), so (P) proves the required
w projection. Equation (T) with a=1 shows
    smear_psi(beta)(x)=q psi(x), q=int h(g)|psi(g)|² dg>0.
Positivity follows from continuity near 1 and positive Haar measure;
q finite by compact support. Thus psi is in the linear smear range.
For any X in real Lie algebra, change y to exp(tX)y in
smear(beta)(x exp(tX)); differentiation falls on beta(y^-1 exp(tX)).
Compact support remains compact locally in t; dominated differentiation
is valid on that compact set. Complex-linear extension covers gl_n(C).
Hence the range is stable under right derivatives and contains the
entire cyclic module D=U(gl_n)psi. This is the native
exists_smear_dsCoeffSmooth_eq, not merely density in D.

Retain native decay |psi(g)| <= (2/||g||)^j for 0<=j<=500n^3+A.
For f=smear_psi(beta), use ||g||<=||gy|| ||y^-1|| and ||y^-1||=||y||:
    |f(g)| <= (2/||g||)^j int |beta(y^-1)| ||y||^j dy.
The last integral is finite by compact support. For 0<=C<=A+1
take j=C+8n²+1 (within the native gap, n>=1). The Haar norm-tail
bound from RegularRepL2 makes f(g)||g||^C integrable.
Taking C=0 gives L¹ and the j=0 estimate gives boundedness,
hence L². This precedes any use of formal degree or the improved
degree-times-tail bound; using RUN58's degree estimate here would
be circular. The non-degree norm-tail theorem is the earlier input.

## 3. Schur identity, normalization, evaluation contraction

Let I=int_G |psi|² in (0,infty), d=I^-1. For w(g)=psi(g^-1),
(P) gives the required projection, so (T) applies. At a=1 it says
int psi(xg)conj psi(g)=I psi(x). Conjugating this last identity
with x=a^-1 and changing g to g^-1 (unimodular Haar), we obtain
int psi(ga)conj psi(g)=I psi(a). Consequently
    d int psi(x g a) conj psi(g) dg = psi(x)psi(a).        (S)
The same d is the native formalDegree; not a free scalar.

Use the original right regular action R(g)F(t)=F(tg) on L².
With i(f)=sqrt(d) f as an L² class, v=i(psi), ||v||²=dI=1.
For f=smear_psi(beta), Fubini with (S) gives
    <v,R(g)i(f)>
       = d int conj psi(t) int beta(y^-1)psi(t g y) dy dt
       = int beta(y^-1)psi(g y) dy
       = f(g).                                          (E)
Fubini here is valid since int |psi(t)psi(tgy)| dt<=I by
Cauchy-Schwarz and right Haar invariance, uniformly in y;
int |beta(y^-1)| finite. Conjugate-linear first-slot convention.
Thus i injective: i(f)=0 implies f(g)=0 for every g.
Moreover the original module norm is induced by i and
    |f(g)|=|<v,R(g)i(f)>|<=||f||.                         (N)
For the derived-action clause, the same compact smear is a
Bochner integral in L² of R(y)v times beta(y^-1); its norm
integral bounded by ||v|| int |beta(y^-1)|. Strong continuity
of R is native RegularRepL2 (or translation continuity by
density of C_c). Under R(exp(tX)), change y as in section 2.
Compact support and uniform bounds on derivatives of beta
permit differentiation in L², giving i(rho(X)f). This proves
the derived action without assuming a priori that all smooth
pointwise derivatives converge in L². The remaining inner
product formula is exactly d int conj f(t) h(tg) dt.
These establish the three clauses of native toL2_spec.

## 4. Highest K-type and full Casimir, at the same generator

Here retain native independence of accretive splitting and
minor Borel semi-invariance (not merely invariance on K).
Write a=blockDiagPart(g^-1) and z=a^-1 g^-1. By PsiBasic,
psi_l(g)=psi_{-l}(g^-1); both sides holomorphic in a neighbourhood
of g, and equality extends from the real form U(J) (totally real
of real dimension n², equal to ambient complex dimension) by
analytic uniqueness. If b is near 1, block-diagonal and in the
Borel -l, use splitting b^-1 a of b^-1 g^-1, so z is unchanged.
The numerator m_{-Lambda}(b^-1 a k) multiplies by
diagChar_{-Lambda}(b^-1)=diagChar_Lambda(b) by opposite-Borel
semi-invariance; denominator unchanged. Thus
    psi_l(g b)=diagChar_Lambda(b) psi_l(g)
on this local holomorphic slice. In particular for E_ab with
same sign and l_b<=l_a, differentiate b=1+tE_ab:
rho(E_ab)psi=delta_ab Lambda_a psi. This is precisely
IsKHighest.of_E_eq_smul in CasimirBound. No claim about
arbitrary b or global complex continuation.

For the full Casimir eigenfunction use a fixed block-diagonal
a=blockDiagPart(g) in the analytic germ near g, allowed by
openness of accretivity and flenstedJensen_eq_of_accretive.
For each k in K the integrand has constant numerator and variable
denominator m_{-mu}(k^-1 a^-1 x k), mu=paramAddRho(l).
At x -> x k b k^-1 with b near 1 in Borel l, the denominator
multiplies by diagChar_{-mu}(b) and the integrand by its inverse
diagChar_mu(b). Hence it is highest for the twisted full compact
Lie algebra with parameter -l and weight mu. This is a statement
on a germ, not an assertion that the integrand is a global
representation on G. By the compact Casimir formula (pair the
positive/negative roots via [E_ab,E_ba]=E_aa-E_bb) and invariance
of the full Casimir under conjugation by k, its eigenvalue is
    sum_i mu_i(mu_i-2rho_i)
     = sum_i (lambda_i²-rho_i²) = casimirValue(l).
Here mu=lambda+rho; 2rho is the signed integer root count.
The k-dependent integrands and their first/second derivatives
are uniformly bounded on a sufficiently small neighbourhood
of g by compact K and accretive nonvanishing denominators.
Integrate the eigenidentity, retaining the normalizing c, to
get Omega psi=casimirValue(l)psi as in CasimirOnPsi. Since
Omega is central (the matrix-unit commutators cancel in pairs),
the identity extends to the cyclic module D.
Unitarity of R makes its derived real Lie algebra action
skew-adjoint as a form on D. For complexification the real-form
conjugation is tau(X)=-J X* J; the form adjoint of rho(X) is
-rho(tau(X)), giving rho(E_ab)^*=epsilon_a epsilon_b rho(E_ba)
on D. No claim about unbounded operator closures.
Together with (N) and ||v||=1 this gives every clause of
isUnitaryCasimirGe_dsAction with exact eigenvalue (hence >=).

## Actual B consumer and unresolved graph

Original local source DAG:
KTypeProjection + PsiBasic + PsiDecay + BumpConvolution +
RegularRepL2 -> SchurOrthogonality (smear, memLp, Schur, toL2);
FlenstedJensenInvariance + MinorEquivariance + CasimirBound ->
CasimirOnPsi and isKHighest_dsGenerator;
these -> isUnitaryCasimirGe_dsAction -> TailBounds.norm_dsCoeff_sub_le
-> half_le_norm_dsCoeff -> measure_ball_le_integral_dsCoeff
-> New/DiscreteSeries/GaussianShape.lean dsCoeff_gaussian_shape
-> RestrictionLemma.IsTwoFactor.laplace_method -> Bessel peak (RUN55).
Human reduced DAG: the same input leaves, (P)->(T)->smear+decay->L²
->(S)->(E)->(N), local Borel derivative + central eigenvalue -> unitary
Casimir, then RUN58 direct generator bound and RUN57 Gaussian.
No global edge deletion and no altered native axiom evidence. In
particular P, explicit minor decay, accretive splitting independence,
and non-degree Haar mass/properness are still retained and must
be justified in the manuscript or matched to a precise accepted
external theorem. The actual source's proof of P is a holomorphic
circle mean, not an unproved appeal to Schur orthogonality.
Next do that circle-mean projection, or the minor decay if blocked.

Status: mathematical derivation of the connected representation
supplier under explicit retained lower-level native inputs; not a
closed proof of all B. No new finite diagnostics because these
are analytic identities, not empirical claims. Local lean/lake
absent (command -v both returned no path), hence no rh_scan/prune/
reduce/auto/frontier run on the compact environment. Prepared below
are scalar bridges and native declaration/axiom queries for shared
replay, not a proof-term replacement. Historical Actions runs
45577239749, 45576756833, 45799225653 jobs actually re-read as
successful; those do not certify this file. No fresh compact replay
or new axiom results; leave historical graphs unchanged.

RESUME HERE: reconstruct lowest K-type instance of
KTypeProjection.integral_conj_weightMinors_mul_dsCoeff from the
analytic-path circle mean, preserving c and same x,b. Then
PsiDecay.norm_dsCoeff_sq_mul_det_pow_le_one via complementary
minors/Fischer, and FlenstedJensenInvariance splitting derivative.
Do not redo the Schur/L² argument or its scalar normalization.
HANDOFF TO integration/editor (section 3 B), formal audit,
literature (precise projection/decay theorem), shared compact
kernel verification. No full RH human proof closure.
-/

namespace CompactRun59

lemma casimir_scalar (lambda rho : ℝ) :
    (lambda + rho) * (lambda + rho - 2 * rho) =
      lambda ^ 2 - rho ^ 2 := by ring

lemma reproduce_eval_bound {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (v w : H) (hv : ‖v‖ = 1) :
    ‖inner ℂ v w‖ ≤ ‖w‖ := by
  simpa [hv] using (norm_inner_le_norm v w)

#print axioms casimir_scalar
#print axioms reproduce_eval_bound
#check integral_mul_dsCoeff_translate
#check exists_smear_dsCoeffSmooth_eq
#check dsCoeff_schur_orthogonality
#check HCParam.HasLargeGap.toL2_spec
#check HCParam.HasLargeGap.isUnitaryCasimirGe_dsAction
#check isKHighest_dsGenerator
#check casimir_dsCoeffSmooth
#print axioms HCParam.HasLargeGap.toL2_spec
#print axioms HCParam.HasLargeGap.isUnitaryCasimirGe_dsAction

end CompactRun59
