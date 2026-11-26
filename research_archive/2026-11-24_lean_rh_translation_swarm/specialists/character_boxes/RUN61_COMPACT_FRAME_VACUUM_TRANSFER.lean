import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN61 — common frame, integral vacuum, and actual local jet transfer
26 Nov 2026. Human source-matched derivation, independent audit pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, current manuscript
bd4fd350d614e72f9e39fcc71596857737940c5c; previous lane RUN60
4aee920f1bb4e15c220514b33556622991faf38c. Read coordination files and
latest peer commits 6843df9f, 12c745a4, 6328abd9, 76a10b40;
these address A local index and C reciprocity, not this frame bridge.

Pinned source paths below relative to grh-compact/src:
New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14
New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1
New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4
Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4
Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08
Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1
Lib/Shimura/GoodReduction/ThetaOrthogonality.lean 759f783ca424063e815a89a9626fed7be4eba028
New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547

## 1. Exact common-frame construction (exists_finitePart_of_isTightFrame)
Let V standard of rank r, E=P.E(s), f=number of infinite places,
C a CM curve with period a in its lattice. Let delta be a quadratic
integer with delta*bar(delta)=D≠0. Tight frame w_i of degree m_i
and length M means sum_i m_i Phi_tau(w_i) conjugate(Phi_sigma(w_i))
=M delta_(tau,sigma) and finiteImage(w_i) integral. Preserve the
actual monomial sections of degree m_i. Put b=a/bar(delta).
The area assumption is A_C=|b|^2 M sqrt(d)/2, and areaScale^2=2pi/sqrt(d).
Set A_(i,k)(z)=(b/areaScale) sum_tau conj(Phi_tau(w_i)) z_(tau,k).
Then by the frame identity the sum of pulled-back hermitian forms is
   sum_(i,k) m_i H_C(A_ik(u),A_ik(v))
   = [pi |b|^2 M/(A_C areaScale^2)] sum_(tau,k) conj(u_tau,k) v_tau,k
   = sum_(tau,k) conj(u_tau,k) v_tau,k.
This is the precise Fock metric, not an inequality.

For rational gamma with finiteImage(gamma) integral, herm_mem_quadInt
shows the Hermitian pairing of gamma_k with each w_i is in O_K.
For a lattice shift associated to bar(delta)*gamma, A_ik of that
shift is a times this pairing (up to the common sign), hence in C's
lattice. The monomial multiplier identity, pullback of the Riemann
form, and the exact sum just proved give the canonical Fock multiplier
of the product S(z)=prod_(i,k) G_ik(A_ik(z)). In this step keep the
native b-map of FockThetaFunctions (multiplication by conjugate of
Phi(traceOne)); do not replace the semicharacter by a bare period.
The product formula semichar_finiteImage identifies the archimedean
canonical multiplier with the inverse finite factor. Thus the
hypotheses of Space.exists_entireTheta_eq apply to S.

Here the analytic theta-space identification is retained: the
Appell-Humbert positive datum, full lattice, dual-lattice rational
representatives, thetaSpace_le_of_thetaShift_mem and injectivity
of entireTheta. Its Schur orthogonality supplier is precisely
IsAppellHumbert.sum_shift_mul_shift. In that theorem the sum of
conjugates of a rank-one operator commutes with every theta
translation (dual translation permutes the index representatives
modulo the period lattice; phases cancel in conjugation). The
irreducible theta action makes it scalar, trace gives the scalar
card(T)/dim(theta space), and dim^2 is the lattice relative index.
Retain the established theta-space irreducibility/dimension and
duality theorems. This explains the exact card factor below; it
is not an approximate frame reconstruction. FockThetaFunctions
uses the quotient dual lattice / D dual lattice, whose size is
D^(2fr), and gives the native VacuumExpansion.

For the resulting F, translation by finiteImage(gamma) replaces
each G_ik by its twisted translate at
 y_ik=-(a/bar(delta))*sum_tau Phi_tau(gamma_k) conj(Phi_tau(w_i)).
This follows by applying the Fock translation formula and
distributing its exponential using the hermitian identity.
Taking theta value and Taylor coefficients gives precisely the
product and linear substitutions in FrameSections. For the Taylor
identity, restrict to every complex line z=t v and compare the
one-variable Taylor coefficients; homogeneous polynomials that
agree on every v agree coefficientwise. No formal interchange of
infinite coefficient sums is required for a fixed degree.
Any finite adelic point is approximated by rational gamma with
exactly the same translate of F, by local constancy and density.
Clear rational denominators by an integer q, so D q*y_ik is a
period by herm_mem_quadInt and delta*bar(delta)=D. The native
norm_translate_le_naiveHeight_pow with N=0, and
norm_monomialSection_le at the argument zero, bound every
translated factor by 1 (naiveHeight(0)=1). This applies at ALL
p, including primes dividing q; no prime-to-q premise in this
value-integrality argument. Therefore |iota(F(finVec x))|<=1
for every x,p,iota, via theta_rho and finite product.

## 2. Same F,F' and exact common conjugation (generator)
Set N=P.N1(s)>0. Use the N powers of zeta, each repeated N times,
with degree-one theta sections; there are N^2 factors per coordinate.
The frame identity follows from the geometric series of the
nontrivial ratio of distinct embeddings (the embeddings agree on
K, and zeta generates E/K); diagonal sum=N^2.
Original delta=N, D=N^2, a=Omega0, area formula holds.
Conjugate curve for sigma has area |Omega_sigma|^2 sqrt(d)/2 and
period a'=e_sigma*Omega_sigma, by RUN60; take delta'=N*e_sigma,
D'=(N*e_sigma)^2. Crucially retain the SAME frame length N^2:
|a'|^2 N^2/D'=|Omega_sigma|^2. Obtain F' from step 1.
For rational gamma define labels
 l_(j,k)=-Tr_(E/K)(gamma_k*conj(zeta^j))/N in K.
By RUN60 select one a_beta in K for all these labels, with
sigma(Taylor U_(Omega0*l)theta_C)=
 Taylor U_(Omega_sigma*a_beta*l)theta_Csigma,
and with the same action on F' as B_sigma=finiteAdeleIncl(beta)
on finiteImage(gamma). Trace is K-linear, so the new labels at
a_beta*gamma are exactly a_beta*l. No independent choice per factor.
For original jetScale=periodFactor*areaScale/Omega0, the linear
coefficient is periodFactor/N times the conjugate embedding of
zeta^j; after conjugating and permuting infinite places it equals
the coefficient on F' with t=sigma(periodFactor)*areaScale/Omega_sigma:
   (Omega_sigma/N)/areaScale * t = sigma(periodFactor)/N.
The conjugation and place permutation here are on the CM field
E, not a claim arbitrary automorphisms of C commute with complex
conjugation on C. Thus all Taylor factors agree. Apply the finite
product identity from step 1 to get J on rational gamma. Both
sides are locally constant as functions of x, including the
composition x -> B_sigma*x; equality extends from the dense
finiteImage range to every x. The exact |t|^2=bigOmega^-1 was
established in RUN60. B_sigma depends on sigma,s before V.
At gamma=0, every theta factor is 1, so theta(F)=1.

## 3. One nonzero scaled vacuum and both norm bounds
Let K index VacuumExpansion for original F, Q=|K|=N^(4fr)>0,
y_j its shifts and m its natural multiplier. Abbreviate
R_x=rho(finVec x), v=vacElem, inner(v,v)=1. Its exact equation is
   sum_j m ell(R_yj v) R_(-yj)F = Q ell(F) v       (VE)
for every complex-linear ell. Apply ell=theta, then inner(v,-).
Since theta(F)=1, the sum is Q≠0. Thus m≠0 and some j0 has
a=inner(v,R_(-yj0)F)≠0. Choose ell=m^-1 inner(v,R_(-yj0)(-)).
Cancelling m before taking norms yields
   c v = sum_j eta_j R_(-yj) F,   c=(Q/m)*a ≠ 0,
   eta_j=inner(v,R_(-yj0) R_yj v).                 (V)
By the finite Heisenberg composition and dataInner_rho_of_vacElem,
eta_j is 0 off y_j-y_j0 in the standard lattice and a product of
finite additive-character phases on that lattice. finVac is the
indicator times the semicharacter. Nonzero eta_j has finite
multiplicative order (isOfFinOrder_psi_f); every field embedding
therefore gives it norm 1. Evaluating R_(-yj)F at x changes its
argument to x-y_j and multiplies by another such phase; this is
the native rho_finVec/finHeisOp identity. Hence (V), evaluated at
x and mapped to Cp, has each summand of norm at most 1 by step 1.
Ultrametric triangle inequality gives |iota(c*v(x))|<=1 without
ever dividing by a possibly nonunit m in the estimate. Dividing
(V) by c also puts v in span of the translates of F, a subspace
stable under R_x by the composition law. The native finitePart
is generated by the finite Heisenberg orbit of v, so all of it
is in this span.

For the archimedean norm choose one real B>=1 bounding the
normalized theta-translate values on every conjugate CM curve.
The actual a1(C) is algebraic by isAlgebraic_of_padic and its
p-adic unit bound; choose its nonzero annihilating polynomial.
All sigma(a1(C)) belong to its finite root set. For each
realized root, choose a representative CM datum. The normalized
translate norm ranges of that datum are compact by
isCompact_range_norm_thetaShift (continuous norm periodic
modulo the full lattice). The same a1 determines the normalized
theta norm range, as in the native choice/simp of
ConjugateGenerator; retain this CM identification, not an
equidistribution assumption. A finite union is bounded. Choose
the native C=ceil_nonnegative(B)+4 (or a larger bound).
This depends on P, not s,V,sigma or x.
By J, take the constant coefficient: sigma of theta(R_x F)
equals theta(R_(B_sigma*x)F'). Since theta_rho is evaluation,
each sigma-conjugate value of F equals a value of F'. For F'
approximate by rational gamma, and use its product expression:
there are N^2*r factors, each bounded by B. Hence every
conjugate summand in (V) has size <= B^(N^2*r).
The ordinary triangle inequality gives
   |sigma(c*v(x))| <= N^(4fr) B^(N^2*r)
                    <= exp((4+ceil(B))*N^2*r).
Indeed f=phi(N) <= N, log N<=N, log B<=ceil(B).
This also covers rank zero (empty products and Q=1).
The archimedean and p-adic bounds use the SAME c from (V),
not a different choice at each prime. This supplies
exists_isJetConjugate_generator. The remaining CM-identification
and theta-space input theorems must be checked at their source;
they are not replaced by a blanket claim of CM reciprocity.

## 4. Actual local transfer to A's marked Hecke gauge
IntegralVacuum chooses kappa0=c from rank one. Its factorization
v_V(x)=product over coordinates of v_rank1(x_k) gives
intVacuum=kappa0^r v_V with the same p-integrality and archimedean
bound at rank r. No separate scalar choice in each lifted space.
For fixed prime p, choose M=p*(d*N)^6+1, coprime to p. The native
exists_isTightFrame with length M^2 and R=0 supplies a frame
(repeat multiplicities). Keep this theorem's constructive
hypotheses; its general length/unit-vector proof is not done here.
Apply step 1 with delta_frame=M, D=M^2, a=Omega0; get F_M with
theta(F_M)=1 and VE whose Q_M=M^(4fr) is a p-unit.
Apply VE to ell=(kappa0^r/Q_M)*theta:
   intVacuum = sum_j [m/Q_M * intVacuum(finVec y_j)] R_(-yj)F_M.
Each bracket is integral: m is natural, Q_M a p-unit, scaled
vacuum integral by step 3. Translating by x with delta*x integral
above p only inserts finite-order phases. Choose rational gamma
with finiteImage(gamma)-(x-y_j) integral and the same action on
F_M. Because M*y_j is integral everywhere from VacuumExpansion,
delta*M*finiteImage(gamma) is integral above p. Clear remaining
denominators with q prime to p: rational finite vectors have
only finitely many negative valuations, and those at p are
already nonnegative. The trace pairing proves that
 q*M^2*delta*y_ik is a period for
 y_ik=-(Omega0/M)*Tr_(E/K)(gamma_k*bar(w_i)).
The two coprimality conditions for thetaProducts are therefore
p coprime M^2 and p coprime q*M^2. At jet scale c0*jetScale
the exact linear coefficient is c0*periodFactor/M times
conj(Phi(w_i)). Its p-adic scalar norm is |iota(c0*periodFactor)|
since M is a p-unit. Thus the translated F_M jet is exactly
a member of the thetaProducts set at the specified radius,
not an approximation.

For any complex-linear functional L on series bounded by r0 on
all such products, apply L to the displayed expansion of every
generator of standardData. Each coefficient is integral and the
ultrametric norm of the sum is at most r0. Then use the definition
of standardData as the span over the embedding valuation ring
to extend to every datum. This is the actual norm_jetSeries_le
in ConjugatesOfJets, and norm_jet_jetSeries_le_one follows with
c0=bar(delta)*d and the native integral jet_theta_prod_integral.
More importantly Data.IsGoodDatum.mem_raises in LocalStatement
applies this very lemma to L = proj_i' o proj_i o schurJet, with
delta=1 and local p-power radius. The input bound is obtained
by thetaProducts_normal_form and norm_schurJet_le, not assumed
for arbitrary series. The diagonal-weight cancellation and
markExponent/liftLoss arithmetic in that caller remain the
A lane's separate obligations. The transfer above makes no
use of the claimed RH theorem.

## Evidence, graph, and status
No Lean/lake/elan in local environment (command -v checked).
Prepared scalar archimedean budget and exact period/label
cancellation certificate below, not compiled. No synthetic
diagnostics. Retrieved actual CI run 45803534769 and receipt
compute/rh-compact-primitives-replay-20261126/status.json
(a56e2d3afb99ed8275e81fd63c8494306e57c43f) and
outputs/targeted_results.json (088cd2ec0e935ee1a282f10096949bcf671cc804)
from state branch: six named native checks have three standard
axioms; JetExponentBound build 124, all_requested_checks_ok=false.
Workflow success is not mathematical replay success. No new
certificate covered. Old-pin reduction tools not run on
incompatible source. Preserve all original/reduced native graphs
and earlier axiom records.

Source-context edges:
generator -> common CM (RUN60), frame, VacuumExpansion,
finite phases, compact theta bound -> IntegralVacuum ->
norm_jetSeries_le -> norm_jet_jetSeries_le_one and
Data.IsGoodDatum.mem_raises. Frame -> hermitian identity,
exists_entireTheta_eq -> sum_shift_mul_shift and exact theta
space theorem; frame -> translation/product/integrality.
Reduced human edges: tight frame and area -> same F,F' and J;
VE -> one c -> both bounds + spanning -> rank-one tensor scaling;
p-unit VE -> thetaProducts -> bounded functional on standardData.
Retain open actual general exists_isTightFrame, Fock theta-space
surjectivity/duality and CM datum identification, and the
semilinear Weil law and archimedean moving-vacuum bound. No
global native edge removal claimed. Context cache key:
pin,P,s,V,r,sigma,p,iota,delta,M,frame,coefficient L.
RESUME HERE: prove the constructive general-length
Parameters.exists_isTightFrame in TightFrameExists, especially
the cyclotomic different factor, quadratic congruence permutation,
frame block orthogonality and distinguished p-unit vector.
Then audit its consumers norm_jetSeries_le (this run) and
the signed Hecke jet-exponent branch. For C also construct the
semilinear conjugation and actual moving-vacuum bound in
ConjugatesOfJets.exists_semilinear_isJetConjugate.
HANDOFF TO integration/editor, A theta/local-index lane, formal audit,
compact native replay. Human RH reconstruction incomplete.
-/

namespace CompactCharacterBoxes61

theorem arch_budget (N f l b B : ℝ)
    (hN : 0 ≤ N) (hf : 0 ≤ f) (hfN : f ≤ N)
    (hl : 0 ≤ l) (hlN : l ≤ N) (hb : b ≤ B) :
    4 * f * l + N^2 * b ≤ (4+B)*N^2 := by
  have hfl : f*l ≤ N*N := mul_le_mul hfN hlN hl hN
  have hbb : N^2*b ≤ N^2*B :=
    mul_le_mul_of_nonneg_left hb (sq_nonneg N)
  calc
    4*f*l + N^2*b ≤ 4*(N*N)+N^2*B := by linarith
    _ = (4+B)*N^2 := by ring

theorem frame_period_cancel (a N S t : ℂ)
    (ha : a ≠ 0) (hN : N ≠ 0) (hS : S ≠ 0) :
    (a/N)/S*(t*S/a) = t/N := by
  field_simp [ha,hN,hS] <;> ring

theorem torsion_label_cancel (a N q d z : ℂ) (hN : N ≠ 0) :
    (q*N^2*d)*(-(a/N)*z) = -a*(q*N*d*z) := by
  field_simp [hN] <;> ring

end CompactCharacterBoxes61

#check Space.VacuumExpansion.sum_eq
#check Space.exists_entireTheta_eq
#check Parameters.exists_finitePart_of_isTightFrame
#check Parameters.exists_isJetConjugate_generator
#check Parameters.norm_jetSeries_le
#check Data.IsGoodDatum.mem_raises
#print axioms Space.exists_entireTheta_eq
#print axioms Parameters.exists_finitePart_of_isTightFrame
#print axioms Parameters.exists_isJetConjugate_generator
#print axioms Parameters.norm_jetSeries_le
#print axioms Data.IsGoodDatum.mem_raises
#print axioms CompactCharacterBoxes61.arch_budget
#print axioms CompactCharacterBoxes61.frame_period_cancel
#print axioms CompactCharacterBoxes61.torsion_label_cancel
