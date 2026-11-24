# Landau criterion: complete conditional analytical argument (first reconstruction)

Date 2026-11-24. Status SOURCE-MATCHED / independently auditable human derivation; finite regression executed, not independently Lean-elaborated. This is a conditional downstream proof chapter, not a proof of the upstream arithmetic window or the entire RH. No Cathedral physics input.

## Provenance and preflight
Upstream leanprover-community/riemann-hypothesis, immutable commit 40e56bab026552e089d7afcfeff08d2defb9c005. The paths below are relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/. All named files were retrieved by exact pin. Source Git blob IDs:
- CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
- LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
- LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
- LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
- LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
- LandauTheorems/WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a
- LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109
- LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1
- LandauTheorems/LogDerivLocal.lean 56dd45f8630096e041bdad64152e07862e0d4c27
- LandauTheorems/mellinGchiOfNeOne.lean 675a25d278977948c8327f0e1e2e31fb3a990a7d
- LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc (initial 6500 characters inspected; final statement included, final proof body not fully inspected)
- LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
- LandauTheorems/LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0
- LandauTheorems/LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2
- LandauTheorems/LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5
- LandauTheorems/LandauCoeff.lean dc8287f2dbe7c767dcb77893eaf53d07092ed1f3
- LandauTheorems/IteratedDerivLaplace.lean c1c05ec801b258064f1e14fb9d7e624eb7345382
- LandauTheorems/landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef
- LandauTheorems/landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436
- LandauTheorems/kernelIntegral.lean d785c54e03a55b0ef6c0fcb64bc4f8158e803642
- LandauTheorems/LandauKernelMax.lean b230a9e40c3710eac205f32ceb8a44f2d003b647
- LandauTheorems/LandauGrowthContra.lean bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda
- LandauTheorems/LandauPoleReLe.lean 205c7380b79e78b2752ed67aeb069f2a9d12cc77
- LandauTheorems/LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7
- LandauTheorems/LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b

Read protocol, handoff, expansion, AGENTS, continuity, state/log/protocol and latest state-branch CI summary (physical CI PASS at 9aa5afb, not evidence for this chapter). Peer prime-window RUN1 already establishes the elementary power/log window bridge; no duplication of its finite prime tests. Read integration reflection/export, dependencies inventory, kernel and acceleration RESUME notes. No own lane file existed at preflight. Upstream main observed 6c6821263d6b80f4ec3d7479b0159340c1b2f65e at 07:18:26 UTC. Its CharFamily, LandauZeroFreeCriterion, landauWindow blobs differ (cac521ab291c9dab261508613d4d12195cdfb799, f4c5124f8a0188f85b60b2687864d531f9c0a3d8, 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc); the old paths ZeroFreeOfRpowWindow, lemmaL, poleData return 404 at that head. Semantic equivalence of revisions NOT established. All conclusions below exclusively about original pin.

## 1. Statement and exact logical direction
For a finite family F of Dirichlet characters chi_i with moduli N_i>0, each either modulus one or nonprincipal, and strictly positive real weights a_i, define Gm(F,y)=sum_i a_i Re Gchi_i(y) (CharFamily.lean). For fixed real theta, delta, C with 0<theta<1 and delta>0, suppose
  forall real Y0 exists real Y>=Y0 forall y in [Y,Y^(1+delta)]: Gm(F,y)<=C*y^theta.
Then forall i and complex s, theta<Re(s) implies L(chi_i,s)!=0 (Lean convention). No assumption C>=0; no absolute-value upper bound required. No conclusion on Re(s)=theta. The ordinary meromorphic zeta pole at s=1 is not a zero; Lean's totalized value at 1 is nonzero, not the value of a holomorphic extension of zeta itself.

zeroFree_of_rpow_window = lemmaL applied to windowHyp_of_rpow. Prime lane has reconstructed the latter: enlarge Y>=1 as necessary, choose R(y)=|C| y^theta, weighted integral exactly |C| delta log Y <=Y^eta for each eta>0. WindowHyp requires an integrable weighted nonnegative majorant, not nonnegativity of Gm. Under y=e^u, U=log Y, obtain WindowHypU(g,theta,delta) for g(u)=Gm(F,e^u): for every eta>0 and real U0 there are U>=U0 and R(u)>=max(0,g(u)) on [U,(1+delta)U] with R(u)e^(-theta u) integrable there and integral <=e^(eta U). U can be chosen >=1 by asking for larger U0. Do not reverse the implications or assume windows are eventually contiguous.

## 2. Constructing PoleData (poleData.lean)
For an entire function f with f(1)!=0, let b=f'(1)/f(1), kappa a complex constant, and N(s)=f'(s)/f(s)-s b+kappa(1-s). Define P(s)=-N(s)/[s(s-1)] away from 1 (at 1 extend using divided difference of N). Since N(1)=0, the apparent singularity at 1 is removable, and P is holomorphic away from 0 and the zeros of f. The identity theorem (f(1)!=0) implies isolated zeros. At a zero rho!=0 with order m>=1, factor f(s)=(s-rho)^m h(s), h(rho)!=0. Then f'/f=m/(s-rho)+h'/h. Since rho!=1, multiply by -1/[s(s-1)] and separate its value at rho from its analytic divided difference. The result is
  P(s)=m*(-1/[rho(rho-1)])/(s-rho)+analytic remainder.
At a nonzero non-root take m=0. Source logDeriv_local preserves analytic order and all the local eventual-equality conditions. This residue formula includes multiplicities; a multiple L-zero becomes a simple logarithmic-derivative pole.

Nonprincipal chi: f=L(chi,.), kappa=0, entire and f(1)!=0 by imported Mathlib results. For modulus-one chi take f(s)=(s-1)zeta(s) for s!=1, and f(1)=1 by the residue at 1. Its derivative at 1 is Euler's constant gamma_E, and kappa=1. Source uses riemannZeta_one_ne_zero to identify zeros even at the totalized point. Thus
  P_nonprincipal(s)=-(L'/L(s)-s L'/L(1))/(s(s-1)),
  P_modone(s)=-(zeta'/zeta(s)+1/(s-1)+1-(1+gamma_E)s)/(s(s-1)).
These identities away from 1 are exactly the Mellin transforms of Gchi at Re(s)>1. For the explanatory calculation, each ramp (y/n-1)_+ has Mellin integral n^(-s)/(s(s-1)), n>=1. Interchange prime-weighted sum/integral by absolute integrability, using the twisted von Mangoldt series = -L'/L. Correction y times b gives b/(s-1). For modulus one, -y log y+(1+gamma_E)y gives -1/(s-1)^2+(1+gamma_E)/(s-1), hence the displayed formula. The source uses MellinRamp, LSeriesSummable_twist_vonMangoldt and Gchi correction integrability. The full final proof body of mellin_Gchi_modOne and its transitive Mathlib prerequisites remain an audit frontier, not silently certified.

For the actual family use P_i for chi_i and P'_i for inverse chi_i (prime here denotes inverse-character label, not derivative). Conjugation Gchi_inv=conj Gchi makes real part half the sum. Define Phi(s)=sum_i (a_i/2)(P_i(s)+P'_i(s)). Change variables y=e^u, dy/y=du, so for Re(s)>2:
  Phi(s)=integral_0^infinity g(u)e^(-su)du.
Measurability and |g(u)|<=C0 e^(2u) follow from measurable_Gchi, Gchi_growth and finite positive weighted sum (these imported estimates still need separate leaf audit). The bound makes the integral absolutely convergent on Re(s)>2. Z= {rho : Re(rho)>0 and some chi_i has L(chi_i,rho)=0 or L(chi_i,conj rho)=0}. Conjugate zero iff inverse-character zero (poleData_inv_zero). At any rho in Z, at least one multiplicity among the original and inverse characters is positive; the entire finite family contributes
  S=sum_i (a_i/2)(m_i+m'_i)>0,
  residue c=-S/[rho(rho-1)].
Crucial: weights are positive and all factors share the same complex phase at this particular rho; no cancellation, even at a nonreal zero. By the source's one_le_re nonvanishing theorem, rho!=1; when rho is real, 0<rho<1, so c=S/[rho(1-rho)] is strictly positive real. This covers real exceptional zeros rather than assuming their absence. The family transform is holomorphic off Z in Re(s)>0, and Z is locally discrete there, including at points not in Z. These are all seven PoleData fields: meas, growth, laplace, pos, diff, iso, pole. Finite family can be empty (Z empty, conclusion vacuous); positivity at an alleged zero uses an existing index witness.

## 3. The signed window estimate: no absolute prime bound
Write A_k(z)=(-1)^k Phi^(k)(z)/k!, k>=0. By dominated differentiation (for a small disc around Re(z)>2, dominate by C0 u^k exp(-b u), b>0), A_k(z)=integral g(u)u^k e^(-zu)/k! du. This is landau_coeff and iteratedDeriv_laplace, where the signs cancel exactly.

Fix sigma>2 and let w(u)=u^k e^(-sigma u)/k!>=0 for u>=0. Triangle inequality gives |A_k(sigma+i t)|<=integral |g|w, while Re A_k(sigma)=integral gw. Thus
  |A_k(sigma+i t)|+Re A_k(sigma) <= integral (|g|+g)w.
The left second term is SIGNED, not absolute. On the chosen window, |g|+g=2 max(g,0)<=2R, regardless of arbitrarily negative g. The elementary exponential-series estimate u^k e^(-a u)/k!<=a^(-k) for a>0 gives w<= (sigma-theta)^(-k)e^(-theta u). Outside the window use |g|+g<=2C0 e^(2u). Therefore (landau_window_ineq)
  |A_k(sigma+i t)|+Re A_k(sigma)
   <= 2 (sigma-theta)^(-k) integral_window R e^(-theta u)
      +2C0 integral_outside u^k exp(-(sigma-2)u)/k!.
This is the key to exploiting a one-sided bound.

## 4. One derivative order suppresses both tails
Let l=2+6/delta, M=l(1+delta), sigma=M(2+l)>2; fix these before choosing eta or U. For U>=1 take k=ceil((1+delta/2)*sigma*U)>=U, V=(1+delta)U. Gamma integral integral_0^infty u^k e^(-a u)/k! du=a^(-k-1). Chernoff splitting, s=sigma-2>l, bounds outside [U,V] by
  e^(-l V)/(s-l)^(k+1) + e^(l U)/(s+l)^(k+1).
With a=s-l and b=s+l, use log(sigma/a)<= (sigma-a)/a and likewise b. Exact algebra and the ceiling bounds yield
  -l V+k(sigma-a)/a <= 1,
  l U+k(sigma-b)/b <= 0.
Indeed (sigma-a)/a=1/(M-1) and (1+delta/2)sigma=M(M-1); also (1+delta/2)(l-2)=l+1 and l(sigma-2+l)<=(l+1)sigma. Hence the tail integral <= C_tail/sigma^k, C_tail=e/a+1/b. No large-k limit approximation; source landau_tails constructs these constants explicitly. The certificate tests exact rational exponent inequalities.

Combine Sections 3–4: for E=sigma-theta>0, C_key=2+2 C0 |C_tail|, for every eta>0,U0 there are U>=max(U0,1) and k>=U such that for ALL real t,
  |A_k(sigma+i t)|+Re A_k(sigma) <= C_key e^(eta U)/E^k.
Here sigma,C_key fixed and U,k do not depend on t (landau_window_key). Critical quantifier uniformity: choose t from pole geometry before or after using this bound; no averaging over t, no assumption of positive g.

## 5. A pole to the right of theta forces a faster-growing derivative
Abstract PoleData implies every pole Re(rho)<=2: integral bound |Phi(s)|<=C0/(sigma0-2) for Re(s)>=sigma0>2; a nonzero residue in that region contradicts boundedness because (s-rho)Phi(s)->c!=0. So all poles strictly left of fixed sigma.

Assume rho0 in Z with Re(rho0)>theta. Write E=sigma-theta<sigma. Compact discs lying in Re>0 meet only finitely many poles: local punctured isolation at every point yields finite subcover of the compact disc. The source uses landau_finite and landau_dichotomy.

Dichotomy: if no pole in closed disc of radius E around real sigma, take D=E. Otherwise minimize the distance to real sigma over that finite nonempty set, take D this minimum. In either case open disc radius D is pole-free. If there is a pole rho1 with horizontal gap sigma-Re(rho1)<D, this is Case A. If not, the minimum-distance pole must be real beta=sigma-D, because distance>=horizontal gap>=D and equality forces Im=0. It is unique at distance D; since rho0 has horizontal gap<E, D<E. Choose a radius r with D<r<=E and no other pole in open disc using finiteness. This is Case B. The empty-closed-disc branch always falls in A. No global rightmost zero assumed, and no supremum attained assumed.

Case A: choose vertical center z=sigma+i t near sigma+i Im(rho1) by a perturbation less than epsilon=min(D-(sigma-Re(rho1)),sigma-D)/2>0. The enlarged closed disc of radius D+epsilon lies in Re>0 and contains finitely many poles. Avoid the finite set of vertical bisector heights of pairs (equal height distinct poles cannot tie since Re<sigma). For unequal heights the forbidden t is
  ((sigma-Re a)^2+(Im a)^2-(sigma-Re b)^2-(Im b)^2)/(2(Im a-Im b)).
Thus the closest pole rho to z is unique and has d=|z-rho|<D; choose d<r<=D so open disc radius r contains only rho. Poles outside enlarged disc cannot enter this disc by triangle inequality. This is landau_nearest.

Subtract c/(s-rho), and extend remainder at rho using its local analytic expansion; it is holomorphic throughout disc radius r. On circle of radius e=(d+r)/2, Cauchy coefficient estimate gives
  |A_k(z)-c/(z-rho)^(k+1)| <= M1/e^k.
The real center disc of radius D is pole-free; same e<D gives |A_k(sigma)|<=M2/e^k. Cauchy constants are finite circle norms/averages, independent of k. By reverse triangle inequality and Re A_k(sigma)>=-|A_k(sigma)|,
  |A_k(z)|+Re A_k(sigma) >= (|c|/d)/d^k -(M1+M2)/e^k.
We have 0<d<e<=E. This handles complex poles without assuming their residues positive real.

Case B: real beta>theta, closest isolated pole, d=sigma-beta>0, and d<r<=E. Again Cauchy after subtracting the pole, e=(d+r)/2, gives
  Re A_k(sigma) >= (Re c/d)/d^k - M1/e^k
with Re c>0. Add the nonnegative |A_k(sigma)| on the left and apply key estimate with t=0. A real negative residue would not provide this lower bound: the positive residue field is indispensable to this branch. This is why strictly positive family weights matter and why exceptional real zeros are accounted for.

## 6. Exponential contradiction and final implication
Both cases imply constants c_*>0, 0<d<e<=E, M_*,C_key such that for every eta>0,U0 there are U>=U0 and natural k>=U with
  c_*/d^k <= M_*/e^k + C_key e^(eta U)/E^k.
Take U>=0, majorize right by C_* e^(eta U)/e^k where C_*=|M_*|+|C_key|. Put L=log(e/d)>0, eta=L/2, U0=2C_*/(c_* L). Then e^(eta U)>=1+eta U>=1+C_*/c_*, so C_*<c_*e^(eta U); and k>=U implies e^(2eta U)<=e^(kL)=(e/d)^k. Hence C_*e^(eta U)/e^k < c_*/d^k, contradiction. This exactly follows landau_growth_contra and landau_window_contra. No sign of M_* or C needed in abstract growth lemma; their absolute values suffice. Thus every rho in Z satisfies Re(rho)<=theta.

Finally lemmaL: suppose L(chi_i,s)=0 and Re(s)>theta. Source splits Re(s)>=1, excluded by charFamily_LFunction_ne_zero_of_one_le_re (modulus one uses zeta nonzero; nonprincipal uses Dirichlet nonzero), and Re(s)<1, where Re(s)>theta>0 implies s in Z via the original-character disjunct. landau_window gives Re(s)<=theta, contradiction. Strict threshold and both branches preserved. Combining the peer's power/log bridge proves the conditional zeroFree_of_rpow_window. The arithmetic proof of the initial window hypothesis is separate and must not be inferred from this criterion.

## 7. Executed finite regression certificate
Local Python 3 standard library. Copy block to a Python file and execute; not a proof of universal inequalities or Lean verification.
~~~python
from fractions import Fraction as Q
from itertools import product
from math import ceil, exp, log
def run():
    counts = dict(tails=0, residue=0, signed_bound=0, geometry=0, growth=0)
    for delta,U in product(map(Q,['1/100','1/8','1/2','1','3','10']),map(Q,['1','3/2','4','10','100'])):
        l=2+6/delta; M=l*(1+delta); sigma=M*(2+l)
        k=ceil((1+delta/2)*sigma*U); a=sigma-2-l; b=sigma-2+l
        assert sigma>2 and a>0 and b>0 and k>=U
        assert -l*(1+delta)*U+k*(sigma-a)/a<=1
        assert l*U+k*(sigma-b)/b<=0
        counts['tails']+=1
    for rho,m,n,a,b in product(map(Q,['1/100','1/4','1/2','99/100']),range(3),range(3),map(Q,['1/3','2']),map(Q,['1/7','3'])):
        S=a*m/2+b*n/2
        assert (S>0)==(m+n>0)
        if S: assert -S/(rho*(rho-1))>0
        counts['residue']+=1
    for g,R,w in product(range(-5,6),range(6),map(Q,['0','1/7','3'])):
        if g<=R:
            assert (abs(g)+g)*w<=2*R*w
            counts['signed_bound']+=1
    sigma=Q(3); points=[(x,y) for x in map(Q,['1/4','1/2','3/4','1','2']) for y in range(-2,3)]
    def dsq(p,t): return (sigma-p[0])**2+(t-p[1])**2
    for p,q in product(points,repeat=2):
        if p==q: continue
        if p[1]==q[1]: assert dsq(p,0)!=dsq(q,0)
        else:
            t=((sigma-p[0])**2+p[1]**2-(sigma-q[0])**2-q[1]**2)/(2*(p[1]-q[1]))
            assert dsq(p,t)==dsq(q,t) and dsq(p,t+1)!=dsq(q,t+1)
        counts['geometry']+=1
    for c,d,e,C in product([0.1,1,3],[0.25,1,2],[3,4,10],[0.0,0.5,10]):
        L=log(e/d); eta=L/2; U0=2*C/(c*L)
        for U in [U0,U0+1,U0+10]:
            for k in [ceil(U),ceil(U)+1,ceil(U)+10]:
                assert C==0 or log(C)+eta*U < log(c)+k*L
                counts['growth']+=1
    print(counts)
    print('All finite tests passed; not a Lean/kernel verification.')
if __name__=='__main__': run()
~~~
Actual stdout:
{'tails': 30, 'residue': 144, 'signed_bound': 153, 'geometry': 600, 'growth': 729}
All finite tests passed; not a Lean/kernel verification.
927 exact rational/integer cases and 729 floating-point log-space cases = 1656 finite tests. No Lean or Lake executable found. No new CI run verified. No full-corpus proof coverage percentage or URT speed claim. 25 pinned modules read, one partly. Seven abstract fields preserved; two geometrical branches reconstructed; one main conditional analytical criterion reconstructed at source level; no extra premises or removed hypotheses. Arithmetic window remains OPEN in this lane's chapter.

RESUME HERE: finish the final body of mellin_Gchi_modOne.lean and retrieve GchiGrowth.lean, measurableGchi.lean, GchiConj.lean, LFunctionConj.lean and MellinRamp.lean at original pin. Reconstruct the exact growth/measurability/conjugation and Mellin leaf obligations, including the real exceptional-zero and modulus-one pole convention; compare current upstream renamed/moved files only as a separate revision audit. Then send complete pole construction for independent audit. Do not repeat prime-window witness producer research assigned to prime lane.

HANDOFF TO: integration, human proof editor, audit, prime-window and character-box lanes. The signed coefficient bound, tail choice, noncancelling residues, pole geometry dichotomy, and growth contradiction are ready for independent source-level review.