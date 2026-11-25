# Lane 10 — independent pole-window audit and a power-saving exception criterion
25 November 2026. RESULT: REVIEW / conditional RH-only implication; mathematical proof below, no kernel replay. RH OPEN. No URT or Cathedral physics.

Preflight: first read ONE_EQUATION_MISSION at e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d), SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, state/log/runner/continuity excerpts, current CI summary and latest peer commit list. Read outer-shell transfer 596dc680 (blob 8a3f0715f9f93cb9b3fe37867cb4724b47b0667f), Landau RUN25 ce3c04a5 (5614997ff5bfb1b0ac43e9ed5aeaa6e119bfc6ef), forward prime jump c7531de (37ca2fcad8cd4a1d56ce5d21f0cf20f5b2b46b90), reverse transfer e7c5909b (f2dfb241af914ad63a1856a331d4b4ebd6091963), square mesh 7a9ec19f and Galois integer 0ea93dcb. Latest observed upstream 75e2012dcc6f3093e223ef8d327b88395ff7d27c; not mixed with pin. General CI checkpoint #427, run 45566261630, passed before this contribution. Not an exhaustive peer archive/blueprint reread.

## One genuinely weaker sufficient test

Let c=1-log 2, D(x)=cx-sum_{x/2<p<=x}(2-x/p)log p and let
    B_theta(Y,V)=sum_{Y<p<=V, D(p)>p^theta} log p.

For every theta=1/2+eps, 0<eps<1/2, it suffices to establish **any fixed positive power saving**:
    B_theta(Y,Y^(1+delta)) <= (Y^(1+delta))^(1-eta)
on arbitrarily large Y, for some fixed delta>0 and eta in (0,1) (both may depend on theta). In fact an arbitrary sequence of theta decreasing to 1/2 suffices.

This materially relaxes the previously sufficient B_theta <= Y^(theta+o(1)) from c7531de. The saving may be arbitrarily small, but must be fixed for the chosen theta. No such saving is proved here. A merely logarithmic saving is not justified by the argument.

## Proof, including the necessary exponent

Write Theta=sup{Re(rho): rho nontrivial zeta zero}. For any theta<Theta with 1/2<theta<1 and every fixed v>1 we prove
    lim_{Y->infty} log(1+B_theta(Y,Y^v))/log(Y^v) = 1.       (A)

1. Standard truncated explicit formula and N(T)=O(T log T) imply, without assuming RH,
    psi(x)-x = O(x^Theta log^2(2x)).
Indeed use T=x in von Mangoldt's formula; the error is O(log^2(2x)), the sum is bounded by x^Theta times sum_{|gamma|<x} 1/|rho|=O(log^2(2x)). The finitely many low zeros cause no difficulty, and the midpoint endpoint convention changes psi by at most (log x)/2. Higher powers contribute O(sqrt(x) log(2x)), so P(x)=sum_{p<=x}log p=x+E(x) with E=O(x^Theta log^2(2x)) since Theta>=1/2. The classical inputs are K. S. Kedlaya, Analytic Number Theory, chapter 8, Theorems 8.2 and 8.6 and section 8.1, checked at https://kskedlaya.org/ant/chapter-8.html (not a new proof of these inputs). Stieltjes integration by parts with the zero lower endpoint weight gives exactly
    D(x)=-E(x)+x integral_{x/2}^x E(t)/t^2 dt.
Thus |D(x)|<=C x^Theta log^2(2x), including the case Theta=1. No supremum attainment is required.

2. I independently checked the human quantitative Landau proof in ce3c04a5: the centered shell Laplace transform is J(s)(zeta(s)+zeta'(s)/zeta(s)), sJ(s)=1-integral_1^2 t^(-s)dt, so J cannot vanish in Re(s)>0; the pole at 1 cancels and the positive real axis has no zeta zeros. Choose 1<c0<1+delta, l>=max((2c0+1)/(c0-1),(2c0+1)/(1+delta-c0)), and sigma arbitrarily large satisfying the peer's two explicit thresholds. The right-tail coefficient equals -l(1+delta-c0)+2c0+c0(2+l)^2/(sigma-2-l)<=-1/2. The left equals -l(c0-1)+2c0+c0(l-2)^2/(sigma-2+l)<=-1/2. Since l>2, rounding k=ceil(c0 sigma U) increases only the right-tail upper bound, by at most log(sigma/(sigma-2-l)). This validates the adjustable sigma argument, which is stronger than the bare existential source landau_tails statement.

For a fixed hypothetical zero beta+i*tau with beta>theta, choose sigma sufficiently large before U varies so that |sigma-rho0|<sigma-theta. The nearest real-center pole is nonreal; shifting the center vertically toward it strictly decreases the minimum distance. On the same vertical line avoid the finitely many equidistance ties in the compact disk under consideration; distinct poles of the same imaginary part cannot tie since both real parts are less than sigma. Thus the complex center has a unique nearest pole at d<D0 (the real-center minimum), with d<e<D0 chosen inside the holomorphic remainder region. Cauchy bounds give |A_k(z)|+Re A_k(sigma)>=|res|/d^(k+1)-M/e^k. The Laplace triangle inequality bounds this combination by 2 times the positive-part moment, not the signed moment. The tail estimate plus u^k exp(-(sigma-theta)u)/k! <= (sigma-theta)^(-k) yields the claimed exponential lower bound with any rate b<c0 sigma log((sigma-theta)/d). The latter has liminf at least c0(beta-theta) as sigma grows because d<=|sigma-rho0|<=sigma-beta+tau^2/(2(sigma-beta)). All choices precede U, and the shell baseline error <=2 and nonnegative higher powers give g(log x)<=D(x)+2. Consequently for each fixed w>1,
    integral_A^(A^w) D_+(x)x^(-theta-1)dx >= A^b
eventually for every b<w(beta-theta). I find no missing quantifier in this argument. This is a human review, not Lean elaboration.

3. The prime-jump transfer (E) from c7531de is valid: D'=c+sum log(p)/p>=c away from events, d=D_+<=cx; hence (d^2 x^(-theta-1))'>=(1-theta)c d x^(-theta-1). At p the downward energy jump is at most 2d(p)log p+log^2 p; at 2p the departure is continuous. Right-continuous endpoints give the BV identity. The unconditional PNT selects a terminal prime in (V/2,V] with d(b)<=3 V^theta S_theta(a,V), where S is the post-jump budget sum d(p)log(p)p^(-theta-1) over (a,V]. Thus (E) holds with its stated constants and V>=2a. Using the just-audited pole lower bound on a fixed shorter window inside [a,V/2], taking a=V^(1-h) for fixed 0<h<1-1/v, gives
    S_theta(a,V) >= V^(beta-theta-r)
eventually for every 0<r<beta-theta. Explicitly choose w>1 with (1-h)w<1 but as close to 1 as required, and choose the strictly smaller exponent b in step 2 with (1-h)b>beta-theta-r. Constants and the summable squared-log error are absorbed by this strict margin.

4. Good primes contribute at most sum_{p<=V}log(p)/p=O(log^2 V), even summing over all integers. Bad primes satisfy d(p)<=C p^Theta log^2(2p). Since q=Theta-theta-1<0, their contribution for p>a is at most C log^2(2V) V^((1-h)q) B_theta(Y,V), as a>Y. Subtract the polylogarithmic good contribution from the previous positive-power lower bound. We obtain
    B_theta(Y,V) >= C' V^(1-(Theta-beta)-h(1+theta-Theta)-r) / log^2(2V).
Given any fixed eta in (0,1), choose an actual zero beta sufficiently near the supremum so that Theta-beta<min(eta/8,(Theta-theta)/2); choose h<min(eta/8,1-1/v) and r<min(eta/8,beta-theta). All are fixed before V varies. The exponent exceeds 1-eta/2. Therefore B_theta(Y,V)>V^(1-eta) eventually. Upper bound B_theta<=O(V) follows from Chebyshev (or <=V log V trivially). This proves (A), with no assumed off-line zero at the supremum and no uniformity in eta required.

Contraposition proves the displayed sufficient test, then vary theta down to 1/2 and use the functional equation. Conversely RH implies D=O(sqrt(x) log^2(2x)), so B_theta=0 for sufficiently large Y. The argument establishes the sufficient test, not the saving itself.

## Negative controls and limitations

- Cannot replace fixed eta>0 by eta tending arbitrarily to zero with Y; the contradiction uses fixed margins and nonuniform constants. A full exponent 1 can coexist with logarithmic savings. 
- Cannot fix one theta>1/2 and infer RH; the argument only rules out zeros with real part greater than that theta.
- Do not replace a supremum by a maximum of real parts; a near-supremum zero is all that is used.
- The independent reverse transfer e7c5909b retains an initial boundary energy, which is necessary on arbitrary short intervals. It is not used in this proof.
- No deduction from a finite prime count or a signed mean to a positive saving. No independent verification of the CountI supplier, original Main reachability, sorry status or transitive axioms. Native Lean/Lake not on PATH; native git ls-remote failed DNS. Connector reads succeeded. No new CI verdict yet.

Pinned Lean provenance: leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005, exact blobs fetched:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, PoleData and WindowHypU.
- same directory LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a, landau_window and key.
- same directory LandauTheorems/landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436, landau_tails_chernoff, landau_tails_pow, landau_tails.
The new sufficient test is an independently argued human extension; not a Lean theorem claimed present in those files.

## Actual exact arithmetic regression

Executed local CPython, exit 0. This checks parameter inequalities only; beta and Theta below are rational model parameters, NOT actual zeta zeros. No synthetic tests treated as prime evidence.
Output: exact tail cases=36; exact exponent cases=320; invalid premise controls=2.

```python
from fractions import Fraction as Q
from math import ceil
nt=0
for delta in map(Q,['1/20','1/4','1','3']):
 for f in map(Q,['1/10','1/2','9/10']):
  c=1+f*delta
  l=max((2*c+1)/(c-1),(2*c+1)/(1+delta-c))
  for extra in [0,1,100]:
   s=Q(ceil(max(2+l+2*c*(2+l)**2,2*c*(l-2)**2,3))+extra)
   am,ap=s-2-l,s-2+l
   assert l>2 and am>0 and ap>0
   assert -l*(1+delta)+c*s*(2+l)/am<=Q(-1,2)
   assert l+c*s*(2-l)/ap<=Q(-1,2)
   nt+=1
n=0
for theta in map(Q,['51/100','3/5','3/4','9/10','99/100']):
 for r in map(Q,['1/100','1/2','99/100','1']):
  T=theta+(1-theta)*r
  for v in map(Q,['1001/1000','11/10','2','5']):
   for eta in map(Q,['1/10000','1/100','1/4','9/10']):
    h=min((1-1/v)/2,eta/8)
    gap=min((T-theta)/2,eta/8)
    beta=T-gap
    err=min((beta-theta)/2,eta/8)
    q=T-theta-1
    assert 0<h<1-1/v and -1<q<0 and theta<beta<T<=1
    lower=beta-theta-err
    upper=(1-h)*q+1-eta
    assert lower>0 and lower>upper
    assert lower-(1-h)*q==1-(T-beta)-h*(1+theta-T)-err
    assert lower-(1-h)*q>1-eta/2
    n+=1
theta,T,beta,h,err=map(Q,['3/5','4/5','79/100','1/100','1/100'])
assert beta-theta-err <= (1-h)*(T-theta-1)+1
assert Q(3,5)<Q(7,10) and Q(3,5)>Q(1,2)
print(f'exact tail cases={nt}; exact exponent cases={n}; invalid premise controls=2')
```

RESUME HERE: seek an unconditional power-saving exceptional-prime estimate for every theta>1/2, however small the saving, with the fixed-window quantifiers above. In particular assess a genuine arithmetic mean-square or higher-moment estimate for this shell, not signed cancellation, and if none is available, return to the actual native ASK-MAIN/CountI suppliers rather than add another equivalent representation.

HANDOFF TO prime-window, Landau, mathematics, integration and audit. AGREE with ce3c04a5 quantitative pole argument and c7531de forward transfer in the zeta-only setting; DISAGREE with dropping fixed positive saving or varying the threshold only once; PARTIAL overall because the power saving and RH are unproved, and no kernel or axiom replay was possible.
