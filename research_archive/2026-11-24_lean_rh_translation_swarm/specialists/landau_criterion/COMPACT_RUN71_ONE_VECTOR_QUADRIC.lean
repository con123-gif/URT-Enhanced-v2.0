import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN71 — one-vector Fourier normalization, uniform Gauss bound and quadric caller
27 Nov 2026. Human source-matched derivations, with named retained inputs;
not a fresh Lean verification. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, latest completion-first
amendment and mandatory reduction section read; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION and compact manuscript ea51739eda55a41749858377bc5635f7e9c49d41 consulted.
RUN70 59c0332f. Peer 9ce5a9fb (band), 55d81106 (integration), 22990488
(prime) retrieved; no duplicate real-place Gram proof. Actual B consumer:
FiniteSystem.siegel_sum_le_lintegral_quadric -> sum_blocks_le_topKernel ->
Moments.energy_fixingSet_le -> filling. Preserve all other A/B/C leaves.

## 1. One-vector Siegel formula with actual constants
OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff, 24–161;
SiegelWeilFormula.lean 4277ff0a84d10e7e1f73516d9ff76505072899ea.
Let E, CMType, WeilData, K, Phi0, alpha be precisely those of classSum_norm_eq:
k=card kappa >=3, K open level, Phi0 nonnegative locally constant compact
support and K-invariant, alpha self-adjoint with alpha_v>0 at ALL infinite
places. Write R=E^+, q(x)=x* x. Use the native additive character and
measures, in particular volume(codifferent E 1)=1. In the mixed model take
f with coefficient exp(-sum_v q(x)_v) Phi0(x_f), constructed in lines 52–54,
151–161 from the adapted vacuum and translation. Retain the mixed-model
realization and the adapted vacuum existence as explicit source suppliers.

For self-adjoint adelic z put
 o_z=psi(-z alpha/2) omega(n(z),1)f.
Its mixed coefficient is gamma(x) Phi0(x_f) psi(z(q(x)-alpha)/2), where
gamma(x)=exp(-sum_v q(x)_v), by the source radical action (N, lines 76–80).
Let D0=Omega x codifferent E 1, the native fundamental domain for R embedded
diagonally in the self-adjoint adeles. Its volume in these measures is
|disc E|^(-1/4): the trace-dual real lattice has covolume
|disc R|^(-1/2) and |disc E|=disc(R)^2 in the stably unramified WeilData
context. This is the normalization of exists_fundDomain_prod used in
lines 60–69,119–127, not an arbitrary convention for Haar. Retain that
fundamental-domain theorem and exact mixed-action identities.

Integration of o_z on D0 is rational norm selection: for rational x, the
character of the compact additive quotient R\A_R is trivial iff
q(x)=alpha. Indeed psi(z(q-alpha)/2) restricts to the trace character
of R, since trace E/R on self-adjoint elements multiplies by 2.
For a nonzero q-alpha translation by one quotient element with nontrivial
character annihilates the integral (native rational-adelic duality).
Multiply the integrated vector by exp(sum_v alpha_v)|disc E|^(1/4).
The coefficient of x after right translation by h is now exactly
1_(q(x)=alpha) Phi0(h^-1 x_f). This proves the coefficient identity A,
including the zero coefficient at x=0. The native absolutely convergent
theta coefficient theorem gives summability and identifies its theta sum
with the norm count. K-invariance identifies the quotient mean with
classSum by integral_quotMeasure_eq_classSum, retaining the SAME class
normalization on the count and on the constant function 1.

Apply the rank-one case of the convergent Siegel-Weil identity siegel_weil
(the native rank condition is 2*1<k) to that averaged vector. All
isotropic rational lines of the split rank-two space except the line
at infinity have the form graph(j^-1 beta) for beta in R; the omitted
line's zero term is the coefficient at x=0 and hence vanishes (alpha>0).
Absolute zero-term norm summability and integration over the compact
fundamental domain permit Fubini and the unfold over R of the graph
lines (W, hP in the source). The resulting integral on the self-adjoint
adeles separates into the finite Fourier integral F and the archimedean
product, with
 G_v(t)=exp(2 pi i alpha_v t) [pi/(1+2 pi i t)]^k.
For Re a>0, polar coordinates on C give
 integral_C exp(-a |w|^2)dw=pi/a.
For integer k>=3, the L1 function
  g(u)=1_(u>=0) u^(k-1) exp(-u)/(k-1)!
has Fourier transform (1+2 pi i t)^(-k), by the elementary Laplace
integral; the transform is L1 since k>1 and g is continuous including
at 0. Fourier inversion gives
 integral_R G_v(t)dt=pi^k alpha_v^(k-1) exp(-alpha_v)/(k-1)!.
The exponential factors cancel EXACTLY against the averaging vector
normalization. Consequently the native class sum equals
  classSum(1) |disc E|^(1/4)
     prod_v [pi^k alpha_v^(k-1)/(k-1)!] * integral F(z) dz.
This derives the one-vector conversion, conditional on the stated
convergent Siegel-Weil, mixed-model, rational Fourier and quotient
measure suppliers. No replacement by an unverified literature citation.
The general Siegel-Weil theorem itself, including its operator-norm
summability, is still a separate human proof dependency.

## 2. Uniform finite Gauss majorant before absolute-value loss
TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15:
lintegral_gauss_sum_le_idealZeta. Let O be the integral finite adeles,
V=vol(O)>0, k=card kappa. For self-adjoint b, define the finite-index
ideal I_b={a in O : psi_f(b a r)=1 for every r in O}; put d=[O:I_b].
It is open (contains a suitable integral open ideal by continuity
and the conductor), hence finite index by compactness.
Let J_b=integral_O^k psi_f(b q(w)/2)dw. Translation by a in O^k and
Fubini on the compact lattice give
  |J_b|^2 = integral_a psi_f(b q(a)/2)
                         integral_w psi_f(b Re(a* w))dw da
(up to the immaterial conjugation from the order of the difference).
The inner character equals psi_f(b a* w) by the self-adjoint trace
identity psi_f_half, not by assuming 2 is a unit at finite places.
Thus the inner integral is V^k on I_b^k and zero elsewhere, by ordinary
compact character orthogonality and star stability of I_b. Hence
  |J_b|^2 <= V^(2k) d^(-k).
The factor psi_f(-b Gamma/2) has unit modulus for arbitrary fixed Gamma;
it does not affect this bound. The set of b with given I_b=I lies in
the union of at most d cosets of codifferent E 1: the character
psi_f(b .) on O factors through O/I, which has d characters, and equal
characters differ by the conductor. Each nonempty coset has measure 1.
For each shell,
  d^mu * measure(shell) * |J_b| <= V^k d^(mu+1-k/2) <= V^k
since k>=2(mu+1). Sum over ideals to obtain exactly
  integral |J_b| db <= idealZeta(O,mu) V^k.
The ideal zeta finiteness and the uniform arithmetic bound on its power
remain as in the native source. The countable shell majorant is valid
even if the exact ideal shell is replaced by the union of cosets in
the native proof. No positivity assumption on the Gauss integral.

## 3. Fourier slab identity and off-place mass
FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271,
enorm_integral_codifferent and mass_near_quadric_off_places_le.
Let s be the native positive integer, m=s^-1 as a finite adele,
beta self-adjoint, C=codifferent E s. For any self-adjoint y,
orthogonality on the compact subgroup C yields
 integral_C psi_f(z y/2) dz = vol(C) 1_(m y in O).
Here the annihilator equivalence uses the exact half-trace identity
and traceOneAdele: for necessity test z proportional to a+star(a)
with a in the dual lattice, and use self-adjointness of y; for sufficiency
write the trace as a+a* using traceOneAdele. This is the source
forall_psi0_mul_eq_one_iff/psi_f_half argument, not a dyadic division.
Fubini is valid for a finite measure because the integrand has norm 1
and C finite volume. Hence the absolute value of the double integral
is exactly vol(C) times the nonnegative slab mass.

Fix the native star-stable T and use the product A_f(E)=A_T x A^T.
Let G be the set of x integral off T with m(q(x)-beta) integral off T.
It imposes only off-T conditions. Put v=measure(G intersect
{x:x_T in R_T^k}); this is finite since the intersection lies in O^k.
Push forward restricted Haar on G to A_T^k. The pushforward is
v times local Haar (vol R_T^k=1): translation invariance in the T
coordinates, finite on compact sets, and normalization at R_T^k.
Equivalently use the product decomposition of Haar. Thus for any local
shift a and nonnegative measurable f, the global slab integral over
integral-off-T x, weighted by f(x_T), equals v times the T slab integral
with the same shift and f. This gives the actual native factorization.

Let delta be the native skewUnit and nu the skew Haar measure.
Put H={Gamma:m_T delta^-1 Gamma in R_T}. For each x in G with
x_T integral, the slab condition with
 alpha(Gamma)=beta-section_T(delta^-1 Gamma+beta_T)
is m_T(q(x_T)+delta^-1 Gamma) in R_T. Its set of Gamma is a translate
of H, since delta q(x_T) is skew. All such Gamma are integral because
delta^-1 Gamma=s r-q(x_T) is integral and delta is an integral unit.
Also alpha(Gamma) is self-adjoint (T star-stable). Conversely if x in O^k
and satisfies the global slab, then x in G. Tonelli gives EXACTLY
 vol(C)*nu(H)*v
 = integral_(Gamma integral skew) vol(C) *
             measure{x in O^k:m(q(x)-alpha(Gamma)) in O} dnu(Gamma).
The integral skew lattice has nu-mass one. By the preceding Fourier slab
identity, each inner quantity is the modulus of the truncated Gauss
integral on C with Gamma-dependent alpha. The triangle inequality,
enlargement to the full self-adjoint finite adeles, and section 2 bound
each by idealZeta(O,mu) V^k. Therefore
  vol(C)*nu(H)*v <= idealZeta(O,mu) V^k.
This is precisely the off-place mass supplier including its uniform
quantifiers in s, beta, T and local test. Rank k>=2(mu+1) remains.

## 4. Actual near-quadric caller and constant cancellation
StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4 lines 37–61.
Under its Hermitian-unit and hyperbolic-basis hypotheses, write the
coordinate e=tailVector(pi,tau,y), pi*pi*=N. The form is
q(y)-tau*tau*/N and its distinguished coordinate is tau. The native
linear change of measure gives the factor md(pi) in the pushforward
from dy d tau to the floor coordinates. Retain its exact determinant
identity and floor disintegration theorem. For a nonnegative continuous
compactly supported test Phi, the fiber integral is continuous at -N
by that disintegration theorem. If c exceeds its value, all small
measurable slabs S have integral <= md(pi) nu(delta S)c, by integrating
the fiberwise bound; this proves the stated near-quadric comparison
conditional on these geometric suppliers, including the strict c guard.

FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7, 47–148.
Set beta=(t*t* - N^2)/N (here t*t* means t times conjugate t).
Then beta_v>0 by the actual |t|_v>N, and beta*=beta.
The step-function minorant from RUN70 gives Psi, and the adelic test
Phi0(x)=1_(x integral off T) Psi(tailVector(pi,t_T,x_T)).
Its compact support follows by the invertible local tail chart and
compact standard lattice; K-invariance uses columnLevel inclusion
in besselH intersect the local congruence subgroup (source lines 73–80).
Let A=sum_z c_z. If A=0 the target is immediate. Otherwise the class
sum formula gives A<=C0 |integral F|, where
  C0=#Classes |disc E|^(1/4)
       prod_v [pi_const^k beta_v^(k-1)/(k-1)!].
F is integrable: its integral is nonzero by this inequality and
the convention that a nonintegrable Bochner integral is zero.
Use r=(1+b^-6)/(1+2^-n)>1 (retain native scale guards).
Then A<r C0 |integral F|. Dominated convergence jointly in
(s,tau) near (0,t_T) on the finite adeles gives
 A<r C0 |integral_(codifferent E s) F(z)
          psi_f(-z section_T(b(tau))/2) dz|,
where b(tau)=tau*tau*/N -N-beta_T and b(t_T)=0.
Indeed the cutoff eventually includes each fixed z, phase tends to 1,
and the integrable majorant is |F|. No uniform absolute summability
over every rational vector is assumed.

For any sufficiently small clopen L and strict upper bound c of the
localized floor integral, choose ONE positive integer s with s O
inside the required finite-adelic neighborhood and s R_T inside the
near-quadric slab neighborhood. The source cofinality lemma
mem_nhds_zero_finAdele_iff gives this choice. Set m=s^-1.
Integrate the preceding strict inequality over tau in t_T+L.
Apply section 3 to its Fourier modulus and then the exact pushforward
factorization; the slab condition at T is precisely
q(y)-tau*tau*/N+N in s R_T. The Psi test at t_T equals the test at tau
because L is small and Psi invariant under the required translations.
The near-quadric bound yields
 A vol(L) <= r C0 idealZeta(O,mu) V^k md(pi) c.
Decrease c to the nonnegative localized floor integral (if infinite
the desired inequality is automatic). The source ideal-zeta power
bound implies idealZeta(O,mu)<=1+2^-n. The product formula and
pi*pi*=N give md(pi)=N^-f where f=numInfPlaces E; keep integrality-off-T
of N and its inverse. Writing G=prod_v (|t_v|^2-N^2)^(k-1), we have
 C0 V^k N^-f = #Classes G siegelConst,
since beta_v^(k-1)= (|t_v|^2-N^2)^(k-1) / N^(k-1).
The factor r cancels the ideal-zeta slack, leaving exactly
 A vol(L) <= (1+b^-6) #Classes G siegelConst *
                integral_(distinguished coordinate - t_T in L) f d floorQuadric.
This is the one-sided Siegel input of RUN70, not yet its full
unconditional proof. The disintegration continuity and change-of-measure
identities, general Siegel-Weil, and mixed-model supplies remain explicit.

## Evidence / graph / audit
Source-visible original: B -> Moments -> FiniteSystem.sum_blocks_le_topKernel
 -> siegel_sum_le_lintegral_quadric -> {classSum_norm_eq,
 exists_step_function, eventually_mass_near_quadric_le,
 mass_near_quadric_off_places_le, idealZeta_intAdeles_pow_le}.
classSum_norm_eq -> {siegel_weil, mixed-model, rational duality,
 fundamental domain, theta summability, quotient classSum}.
mass_near_quadric_off_places_le -> {enorm_integral_codifferent,
 map_restrict_addHaar_eq, lintegral_gauss_sum_le_idealZeta}.
Reduced human chain: exact quotient projection, rank-one SW,
Gaussian/Laplace inversion, compact Fourier orthogonality, ideal shell
bound, off-T factorization, slab disintegration, joint DCT, exact N
and zeta cancellation. No global native edge deletion; all previous
graphs, unresolved axioms, Rallis and noncoherent pair dependencies retained.
Context key compact pin + E/WeilData, K, alpha, T, s, same Phi0, same
Haar and classSum conventions. Independent audit pending.
Local command -v lean/lake/elan returned empty. Old-pin status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved and report pass;
not compact verification. No new native rh_scan/prune/reduce/auto/frontier
execution, no new CI PASS. Scalar certificates and actual source probes
below prepared only; no numerical surrogate or invented execution.
RESUME HERE: integrate sections 1–4 into RUN70 at the Siegel caller.
Audit the actual Haar determinant and rank-one mixed-model realization,
then prove floor disintegration continuity and the general convergent
Siegel-Weil suppliers if not discharged by exact published theorem bridge.
Distinct remaining B noncoherent pair and absolute-exchange bounds and
C Rallis test-space normalization are not resolved here. HANDOFF TO
integration/editor, positivity, literature, audit and shared kernel runner.
Human reconstruction incomplete.
-/

namespace CompactLandauRun71

theorem shell_rank_cancel (q v : ℝ) (hq : 1 ≤ q) (hv : 0 ≤ v)
    (mu k : ℕ) (hk : 2*(mu+1) ≤ k)
    (h : q^k * v ≤ 1) : q^(2*(mu+1))*v ≤ 1 := by
  have hq0 : 0 ≤ q := le_trans zero_le_one hq
  have hpow : q^(2*(mu+1)) ≤ q^k := pow_le_pow_right₀ hq hk
  exact (mul_le_mul_of_nonneg_right hpow hv).trans h

theorem siegel_slack_cancel (e z c : ℝ) (hz : 0 < z) :
    ((1+e)/z)*c*z = (1+e)*c := by
  field_simp
  <;> ring

theorem rank_one_normalization (N g a : ℝ) (hN : N ≠ 0)
    (k f : ℕ) :
    (a*g/N^((k-1)*f)) / N^f =
      a*g / (N^((k-1)*f) * N^f) := by
  ring

#print axioms shell_rank_cancel
#print axioms siegel_slack_cancel
#print axioms rank_one_normalization
end CompactLandauRun71

#check integral_fourierChar_mul_inv_pow
#check classSum_norm_eq
#check siegel_weil
#check lintegral_gauss_sum_le_idealZeta
#check enorm_integral_codifferent
#check IntegralPlace.mass_near_quadric_off_places_le
#check HyperbolicBasis.eventually_mass_near_quadric_le
#check Filling.IsFillingLevel.siegel_sum_le_lintegral_quadric
#print axioms classSum_norm_eq
#print axioms IntegralPlace.mass_near_quadric_off_places_le
#print axioms Filling.IsFillingLevel.siegel_sum_le_lintegral_quadric
