# RUN27 — unconditional Gaussian high-frequency elimination at the RH-only Landau frontier
25 Nov 2026. Lane 4. Human analytic theorem + executed finite regression + prepared (not compiled) native bridge. RH OPEN. This is a bounded reduction of the arithmetic/analytic frontier, not a new proof of the remaining signed low-frequency estimate.

Preflight: latest ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 (including 4b677bc2 unified pipeline), AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol excerpts, RUN26 (8ea50395f5777860c606d310437f878cefdcc5fe), single discrepancy and outer-shell transfer, recent 35-commit list, peer 6fec2cae (dyadic mean witness), b0afce1d (L2 resolvent), a31ec62d (signed thin correction), d5e73014 (derivative-free shift). These address different estimates. Not exhaustive peer archive reread. Native Lean/Lake absent locally. Actual published CI status files on cathedral-research-state: strip-root b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc returncode 0 and axiom output for reduced_strip_root; prune 7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0, rh_of_right visited 2000, 324 pending, 3 axioms propext/Quot.sound/Classical.choice; no binder drop there. These are prior engine results only. Neither result.json nor logs/result.json at those paths resolved; status tails were read directly. New theorem not native checked.

## One exact analytical reduction

Let c=1-log 2, D(x)=cx-sum_(x/2<p<=x)(2-x/p)log p. Define g(v)=e^(-v)D(e^(2v)) for v>=0 and zero otherwise, and F(s)=integral_0^infty g(v)e^(-sv)dv for Re(s)>1. By Chebyshev's elementary upper bound, |g(v)|<=C exp(v). Set w=(s+1)/2 and J(w)=integral_1^2 (2-y)y^(-w-1)dy. Absolute convergence on Re(s)>1 and exact cancellation before taking norms give
    F(s)=c/(s-1) - J(w)/2 * sum_p log(p)p^(-w).
For Re(w)>1/2 the higher-power series H(w)=sum_(p,k>=2) log(p)p^(-kw) is locally normally convergent (geometric bound followed by sum_n log(n)n^(-2 Re(w))). Consequently the meromorphic continuation is
    F(s)=c/(s-1)+J(w)/2 * (zeta'(w)/zeta(w)+H(w)).
J(1)=c, so the apparent s=1 pole cancels exactly. At a zero rho of multiplicity m with Re(rho)>1/2, F has a simple pole at s_rho=2rho-1 with residue m J(rho), nonzero: integration by parts gives w J(w)=1-integral_1^2 y^(-w)dy, whose second term has modulus <1 if Re(w)>0. No positive real s_rho occurs, by alternating eta series for 0<w<1 and Euler product for w>1; w=1 is the removed pole. Thus positivity of real residues is vacuous. No RH assumption.

Now convolve on the whole line with phi(t)=exp(-t^2/2)/sqrt(2pi):
    h(u)=integral_R phi(u-v)g(v)dv.
It exists absolutely, is continuous, and |h(u)|<=C exp(u+1/2). For u<0 a sharper bound is C exp(u+1/2) Phi_normal(u+1) (complete the square, v>=0), giving Gaussian decay as u -> -infty. Here Phi_normal is the standard real normal CDF. The negative-half transform E(s)=integral_(-infty)^0 h(u)e^(-su)du is entire by dominated holomorphic integration. Absolute Fubini on Re(s)>1 and the exact Gaussian transform give the half-line transform
    F_h(s)=exp(s^2/2)F(s)-E(s).
Hence each off-line pole survives with residue exp(s_rho^2/2)*m J(rho) != 0; subtracting E cannot cancel it. Isolation, differentiability off Z={2rho-1:Re(rho)>1/2}, growth and Laplace conditions in native PoleData hold. The proof does not assume that Gaussian smoothing transfers a bound on the original window; the smoothed function is itself a new valid input to the generic Landau theorem. This avoids an invalid inference through the Gaussian's noncompact support.

## Actual unconditional elimination

On the absolutely convergent line Re(s)=2, set
    M = c + (1/2) sum_p log(p)p^(-3/2) < infinity.
Since J(3/2)<1, |F(2+it)|<=M by triangle and the integral representation of J. Fourier inversion of the integrable exponentially weighted Gaussian convolution yields
    h(u)=exp(2u+2)/pi * integral_0^infty exp(-t^2/2) Re[exp(it(u+2)) F(2+it)]dt.
Use real conjugation symmetry BEFORE norms. Define L(u) by exactly the same integral cut off at T(u)=2 sqrt(u), u>=1. The Gaussian tail inequality integral_T^infty exp(-t^2/2)dt <= exp(-T^2/2)/T gives the decisive unconditional estimate
    |h(u)-L(u)| <= M exp(2)/(2 pi sqrt(u)),    u>=1.
This removes the ENTIRE tail t>2 sqrt(u) at bounded cost in the rescaled discrepancy. In original x=e^(2u), the cost is O(sqrt(x)/sqrt(log x)) and the retained height in the original w-variable is |Im(w)|<=sqrt(u)=sqrt(log x/2), on the fixed absolutely convergent line Re(w)=3/2. It does not truncate the actual zeta zero set: every fixed off-line zero survives the exact Gaussian transform. No assumptions about zero density or prime pair cancellation are used in this tail bound.

**Sufficient unresolved scalar target:** for every eps in (0,1/2), there exist fixed delta>0 and C_eps>=0 such that arbitrarily large U satisfy
    L(u) <= C_eps exp(2 eps u) throughout [U,(1+delta)U].
Indeed h(u)<=L(u)+M exp(2)/(2pi), so choose R(u)=(C_eps+M exp(2)/(2pi)) exp(2eps u) on that window, with theta=2eps in (0,1), delta>0, U>=1. Its weighted integral is (C_eps+M exp(2)/(2pi))*delta*U <= exp(eta U) for every eta>0 for sufficiently large U, and U may exceed any prescribed U0. These are exactly WindowHypU for h; apply landau_window to F_h and Z, giving Re(2rho-1)<=2eps. Vary eps, apply the existing conditional strip root to conclude RH. This is a replacement of a sufficient frontier, not a proof of the remaining inequality and not a globally pruned upstream dependency. The remaining low-frequency integral is signed; bounding its absolute integrand gives O(exp(2u)) and does not close it. This route is useful only if the signed low band can be bounded more easily than the far-pair remainder of RUN26. No claim of novelty or URT improvement.

## Original and proposed graph, axiom evidence, backtracking

Retain original source graph from RUN24: Main.riemannHypothesis -> rhOfAll -> rh_of_every -> EveryCharacter -> actual theta/Green/TopG suppliers -> Comparison₂.formB -> zeroFree_of_rpow_window -> lemmaL -> landau_window. No deletion of any original nodes, types, recursors, shared consumers, or pending axioms. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Fresh fetch at pin: src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (PoleData, WindowHypU), LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a (landau_window, landau_window_key), LandauTheorems/ZeroFreeOfRpowWindow.lean blob 2ed00ad3aa862f3e522686557fb8f559b17fc002. Fresh upstream head ef451fc356cbc66861df031531aaafd2843797ac, 25 Nov 09:07:15 UTC; new batch merge, not substituted for pin, declaration equivalence not checked. Toolchain pin Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Proposed RH-only overlay (human): reduced_strip_root <- nonvanishing in 1/2<Re<1 <- landau_window specialized to (h,F_h,Z,2eps,delta) <- PoleData bridge (proved above in human math) + WindowHypU dominated by low band plus fixed constant <- signed low-band inequality OPEN. Accepted ordinary foundations: Chebyshev upper bound, Euler product/log derivative, holomorphic normal convergence, Gaussian integral/transform, Fubini, Fourier inversion and functional equation; all native theorem identity and axiom checks for the new bridge remain pending. Cache key includes source pin, exact h/F_h/Z and theta=2eps, not simply landau_window. Keep RUN26 signed far pair and native ChCore/TopG alternate suppliers open; if this smoothing route cannot yield an independent estimate, backtrack to those. No import of the claimed RH theorem.

Prepared native bridge (not compiled; save as RHLandauDomination.lean in pinned Lean environment). It checks actual consumer, keeping all PoleData obligations as inputs, not manufacturing them. With RHProofTermPrune and RHRecursiveReductionAutoV3 built on search path, append the indicated scans, and use rh_reduce/rh_auto/rh_auto_frontier on candidate premises with no admissions; inspect original and reduced graph and #print axioms. No CI for this new lemma yet.

~~~lean
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow

namespace Deduction
theorem landau_of_eventual_domination
    {g b : ℝ → ℝ} {F : ℂ → ℂ} {Z : Set ℂ} {θ δ : ℝ}
    (hP : PoleData g F Z) (hθ : 0 < θ) (hθ1 : θ < 1)
    (hδ : 0 < δ) (hdom : ∀ u ≥ 1, g u ≤ b u)
    (hW : WindowHypU b θ δ) : ∀ ρ ∈ Z, ρ.re ≤ θ := by
  apply landau_window hP hθ hθ1 hδ
  intro η hη U₀
  obtain ⟨U,hU,R,hR1,hR2,hR3⟩ := hW η hη (max U₀ 1)
  have hU1 : 1 ≤ U := (le_max_right _ _).trans hU
  refine ⟨U,(le_max_left _ _).trans hU,R,hR1,?_,hR3⟩
  intro u hu
  exact ⟨(hR2 u hu).1, (hdom u (hU1.trans hu.1)).trans (hR2 u hu).2⟩
#print axioms landau_of_eventual_domination
end Deduction
-- In the native engine harness, after imports:
-- rh_scan Deduction.landau_window limit 2000
-- rh_prune Deduction.landau_of_eventual_domination as RHLandauDominationPruned
-- rh_scan RHLandauDominationPruned limit 2000
~~~

## Executed finite regression (local CPython, numpy/scipy, exit 0)

Use actual primes <=10000, truncate the prime series at N in both independent expressions; this is not a numerical certificate for the infinite prime series or any asymptotic bound. Direct Gaussian integration via real normal CDF vs Fourier integral on Re(s)=2, and tail bound for the finite series (same proof with M_N). 512-node Gauss-Legendre quadrature and independent 256-node control; float arithmetic not interval-certified. Output:
~~~
u=1 full_residual=4.45033e-13 band_error=0.0602998 bound=1.11103
u=1.5 full_residual=1.14284e-12 band_error=0.0378513 bound=0.907149
u=2 full_residual=3.0963e-12 band_error=0.0190751 bound=0.785614
u=3 full_residual=2.25109e-11 band_error=0.00782688 bound=0.641451
u=4 full_residual=1.62945e-10 band_error=0.0143096 bound=0.555513
u=5 full_residual=1.14782e-09 band_error=0.0203443 bound=0.496866
u=6 full_residual=8.0116e-09 band_error=0.0017589 bound=0.453574
u=8 full_residual=3.66558e-07 band_error=0.0141218 bound=0.392807
primes 1229 M 0.9447461869233859 window checks 8 max absolute residual 3.665575150080258e-07 max tail/bound 0.05427396849655982 negative controls 1 tail checks 6
~~~
Reproduce:
~~~python
from math import log, sqrt, exp, pi, isqrt
import numpy as np
from scipy.special import ndtr, roots_legendre
N=10000
sieve=bytearray(b'\1')*(N+1); sieve[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
    if sieve[p]: sieve[p*p::p]=b'\0'*((N-p*p)//p+1)
p=np.array([i for i in range(2,N+1) if sieve[i]],dtype=float)
lp=np.log(p); a=lp/2; b=a+log(2)/2; c=1-log(2)
M=c+0.5*np.sum(lp*p**(-1.5))
def J(z):
    return 2*(-np.expm1(-z*log(2)))/z - np.expm1((1-z)*log(2))/(1-z)
def F(t):
    s=2+1j*t; z=(s+1)/2
    P=np.exp(-z[:,None]*lp[None,:])@lp
    return c/(s-1)-0.5*J(z)*P
def exact(u):
    def I(l):
        return exp(l*u+0.5)*(ndtr(b-u-l)-ndtr(a-u-l))
    return c*exp(u+0.5)*ndtr(u+1)-np.sum(lp*(2*I(-1)-I(1)/p))
def low(u,T,n=512,shift=2):
    x,w=roots_legendre(n); t=(x+1)*T/2
    f=np.real(np.exp(-t*t/2+1j*t*(u+shift))*F(t))
    return exp(2*u+2)/pi*T/2*np.dot(w,f)
maxerr=0; maxratio=0; checks=0
for u in (1.,1.5,2.,3.,4.,5.,6.,8.):
    true=exact(u); full=low(u,12); half=low(u,12,256)
    residual=abs(full-true); tol=1e-7*max(1,abs(true))
    assert residual<tol and abs(full-half)<tol,(u,true,full,half)
    T=2*sqrt(u); partial=low(u,T); err=abs(partial-true)
    bound=M*exp(2)/(pi*T)
    assert err<=bound+tol,(u,err,bound)
    maxerr=max(maxerr,residual); maxratio=max(maxratio,err/bound);checks+=1
    print(f'u={u:g} full_residual={residual:.6g} band_error={err:.6g} bound={bound:.6g}')
assert abs(low(2,12,shift=0)-exact(2))>1e-3
for T in (0.5,1,2,4,8,12):
    assert sqrt(2*pi)*ndtr(-T)<=exp(-T*T/2)/T
print('primes',len(p),'M',M,'window checks',checks,'max absolute residual',maxerr,'max tail/bound',maxratio,'negative controls',1,'tail checks',6)
~~~

RESUME HERE: attack signed L(u) using exact arithmetic on the convergent line, cancel c/(s-1) against the actual prime Dirichlet series before estimating, or return to native ChCore/TopG if it yields a genuine supplier. Do not attempt to bound the absolute integrand as a replacement. Kernel lane: compile actual landau_of_eventual_domination, run native scans/prune and preserve all pending role edges; no claim of native validation for Gaussian PoleData. HANDOFF TO mathematics, prime_window, audit, kernel_extractor, integration. RH OPEN.
