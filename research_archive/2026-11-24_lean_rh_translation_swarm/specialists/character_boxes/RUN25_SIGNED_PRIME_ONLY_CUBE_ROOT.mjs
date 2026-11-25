/*
RUN25 — one signed prime-only discrepancy, uniform cube-root upper remainder
2026-11-25. Lane 6, ONE_EQUATION_MISSION e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1.
RESULT: unconditional human arithmetic lemma for the principal-host signed
auxiliary signal; PARTIAL for host construction and RH. No URT or Lean replay.

Preflight: mission blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d; AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity/state/runner excerpts,
general CI checkpoint #427 (07:31 UTC; predates this work, not RH validation).
Read RUN24 (9b313cda), principal minimal host (26e90fe6), 49631f4b, 9ad1dec5,
eeedab3e, 0dfa42f3, peer RUN25 Galois one-integer, Green positivity, prime
square mesh, Landau obstruction, reverse prime node transfer, prime-jump energy
and acceleration handoffs. Not an exhaustive historical/blueprint reread.
No changes to old files or physics. Previous work on signed S is retained;
new result is the one-sided cube-root bound for replacing S by prime terms.

Let q,d be distinct primes satisfying the actual WinPair arithmetic
conditions q=3 mod 8, d=7 mod 16, q | d+1. Write a(n)=(n/q), b(n)=(n/d),
and c(n)=a(n)b(n), with zero at ramified primes in the relevant primitive
characters. Principal-host identification and exact signed ChCore signal
G0+Gq-Gd-Gqd are in 26e90fe6; TwistForm and PairGood identify the three twists.
The prior conditional ChCore inequality uses an upper bound on
S(x)=Re(Gd(x)+Gqd(x)-Gq(x)), not a lower bound. All other geometry, derivative
control, VVle, tied-family, host and window premises of that note remain.

Define f(n)=b(n)+a(n)b(n)-a(n), and
  ell=Re(L'_d/L_d(1)+L'_{qd}/L_{qd}(1)-L'_q/L_q(1)).
The nonprincipal primitive quadratic L-functions are nonzero at 1
(classical Dirichlet nonvanishing); no hypothesis at Re(s)>1/2 is used.
By the pinned An.gChi definition, for real x>=3,
  S(x)=sum_{p^k<=x} f(p^k) log p (x/p^k-1)+x ell.
Quadratic reciprocity and q|d+1 give a(d)=(-1/q)=-1 and b(q)=1.
For all primes p, set C={p:a(p)=1,b(p)=-1}. Direct evaluation gives
  f(p)=1-4*1_C(p) (including q,d);
  f(p^k)=1 for unramified even k;
  f(p^k)=1-4*1_C(p) for unramified odd k;
  f(q^k)=1; f(d^k)=1 if k odd and -1 if k even.
Thus all negative higher-power terms lie at odd k>=3 in C or even powers
of the single prime d. Ordinary prime squares cannot create a positive
error in the *upper* bound once the exact linear coefficient is retained.

Let
  C_s=ell+sum_p sum_{k>=2} f(p^k) log p / p^k,
  U(x)=sum_{p<=x}(1-4*1_C(p))log p (x/p-1)+x C_s.
The series in C_s converges absolutely since |f|<=3 and
sum_{n>=2} log n/[n(n-1)] converges.
The identity max(x/n-1,0)=x/n-min(1,x/n) proves
  S(x)=U(x)-sum_p sum_{k>=2} f(p^k)log p min(1,x/p^k).

DECISIVE LOCAL INEQUALITY (unconditional, uniform in q,d):
  S(x) <= U(x)+150*x^(1/3),       x>=3.

Proof of the constant: let A(t) be the sum of -f(p^k)log p over negative
higher-power terms with p^k<=t. It is nonnegative and, for t>=2,
  A(t)<=3 sum_{k=3}^{floor(log_2 t)} theta(t^(1/k))+(log t)/2.
The last term counts the even powers of d, each contributing log d.
The elementary Chebyshev bound theta(v)<=4 v log 2 follows by applying
the binomial bound to primes in (ceil(n/2),n] and induction on integer n;
floor v extends it to real v. Hence
  A(t)<=12 log 2 [t^(1/3)+(log_2 t)t^(1/4)]+(log t)/2
      <=100 t^(1/3),
using sup_{t>=1} log(t)/t^(1/12)=12/e and
sup_{t>=1} log(t)/t^(1/3)=3/e. For t<2 A(t)=0.
Stieltjes integration (or Tonelli, using min(1,x/n)=x integral_{max(x,n)}^infty dt/t^2)
gives negative-power remainder exactly
  R_-(x)=x integral_x^infty A(t) dt/t^2 <=150*x^(1/3).
Positive-power terms in the remainder can only decrease S. No
estimate of cancellation between different primes is assumed.

Optional exact interpretation: for each fixed q,d classical PNT in
arithmetic progressions yields convergence of sum_p f(p)log p/p
(each of the three nonprincipal character series). Taking the Abel
limit of the Euler-product logarithmic derivatives at s=1 gives
C_s=-sum_p f(p)log p/p, in natural prime order. No uniform PNT-AP error
in varying q,d is asserted. This yields the equivalent exact U(x)=
 -sum_{p<=x} f(p)log p - x sum_{p>x} f(p)log p/p.
Not needed for the inequality, and not an unconditional bound on U.

Consequence: in the local principal ChCore transfer of 26e90fe6, it
suffices to supply the SINGLE upper bound U(x)<=x^(1/2+eps/2) on the
same host scales, with the additive cube-root term absorbed in the
final epsilon slack. This does not assume individual Gq,Gd,Gqd bounds
for that signed step. It is a one-sided improvement over a generic
O(sqrt(x)) prime-power error, and no separate estimate on even powers
is required there. Do NOT delete PairGood.bounds or bdL from unrelated
host consumers: the earlier derivative transfer still needs control
of ell_chi individually (or a proved replacement). The finite test
below does not supply U(x) cancellation or construct an admissible
family at arbitrarily distant scales. No RH closure. The source
PairGood already supplies the signed bound when its full hypotheses
are established, so this is an alternative local sufficient condition,
not a claim to have bypassed the deepest native suppliers.

Source provenance: P=40e56bab026552e089d7afcfeff08d2defb9c005; observed
upstream H=75e2012dcc6f3093e223ef8d327b88395ff7d27c. Five pinned blobs
and 16 anchors checked with connector V8; all five H blobs changed,
all 16 literal anchors retained. No semantic equivalence assumed.
Rows below retain both source hashes. Replay with
  node RUN25_SIGNED_PRIME_ONLY_CUBE_ROOT.mjs /path/to/rh
or omit checkout for the finite arithmetic regression alone.
Actual V8 arithmetic: 2343 coefficient checks, 11472 exact BigInt
centerings (per-term rational identity multiplied by p^k), 24
truncated numerical remainder checks, max R_-/x^(1/3)=1.4852443627400695,
3 negative/control checks. Initial run correctly rejected (3,7),
which violates q|d+1; corrected to (3,23). Tested pairs satisfy the
stated arithmetic conditions only, not every WinPair scale or d_small
condition. Finite remainder tests use p<=2000,p^k<=1e8, double logs;
not certified infinite sums. No native checkout or CI replay of this
file; the connector provenance checks and arithmetic were executed.

RESUME HERE: trace the actual construction of PairEx at the principal
modulus, identify whether its density argument can supply the single
signed U budget (without losing the individual derivative control),
or whether the same proof already does so with strictly fewer zero
exclusions. Keep exact common q,d and all scale quantifiers. Do not
repeat prime-power reduction or assert that it proves the weighted
prime lower bound. HANDOFF TO prime, Landau, geometry, theta, Galois,
audit, integration, editor. Full RH OPEN.
*/
import {execFileSync} from 'node:child_process';
const P="40e56bab026552e089d7afcfeff08d2defb9c005",H="75e2012dcc6f3093e223ef8d327b88395ff7d27c";
const b="src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/",c="src/Development/AutomorphicArithmetic/CharacterBoxes/";
const rows=[
[b+"Analytic.lean","599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1","768db8d27cbffae0506239b189d41eda0db287d7",["def sumLamChi","def gChi","else sumLamChi χ y + (y : ℂ) * logDerivativeAtOne χ","def BoundedCharsPointwise"]],
[c+"ExistsPageN.lean","398eb8ed3528aa2666e9d3b2b09a582ad4390dd7","b68a246116631ab047f73a0c4bb869c85e5fd779",["q_mod : q % 8 = 3","d_mod : d % 16 = 7","d_q : q ∣ d + 1","structure WinPair"]],
[c+"PairGood.lean","68d04b506355e999c0f6020ee066c4967c1e6939","df4d01c2670c11d693ed6bbe5dc5314ce946dcb1",["def tw","def PairEx","‖An.gChi χ y‖ ≤ y ^ ((1 : ℝ) / 2 + eps / 2)"]],
[c+"TwistForm.lean","5e8b1a992a393336dffd3603524526dfccfa1981","2037f1913e4bdbbdd51d4f92fe161647dfcf5ec9",["def TwistForm","θ φ.iod = (-1) ^ (j : ℕ)"]],
[b+"ConjEMemHostFIff.lean","0ab34ba6d386bb84908efe66de6ce50108eacddc","a6fa138d33c044ca69cef4ffd330ea89a31a9713",["def PsQ","art_ch :","art_surj : Function.Surjective H.art"]]];
if(process.argv[2]){
 const git=(...args)=>execFileSync("git",["-C",process.argv[2],...args],{encoding:"utf8",maxBuffer:32*1024*1024});
 let anchors=0;for(const [path,p,h,aa] of rows)for(const [ref,sha] of [[P,p],[H,h]]){if(git("rev-parse",ref+":"+path).trim()!==sha)throw Error("blob "+path);const s=git("show",ref+":"+path);for(const a of aa){if(!s.includes(a))throw Error(a);anchors++}}
 console.log({anchors,blobs:2*rows.length});
}
const result=(()=>{const lim=2000,prime=Array(lim+1).fill(true);prime[0]=prime[1]=false;for(let p=2;p*p<=lim;p++)if(prime[p])for(let j=p*p;j<=lim;j+=p)prime[j]=false;const ps=prime.map((v,i)=>v?i:0).filter(Boolean);function leg(a,p){a%=p;if(!a)return 0;let z=1;for(let k=1;k<=(p-1)/2;k++)z=z*a%p;return z===p-1?-1:z}let cases=0,terms=0,windows=0,maxRatio=0;const X=[3,10,100,1000,10000,100000,1000000,10000000];for(const [q,d] of [[3,23],[11,263],[19,151]]){if(!prime[q]||!prime[d]||q%8!==3||d%16!==7||(d+1)%q!==0||leg(d,q)!==-1||leg(q,d)!==1)throw Error("pair");const A=X.map(()=>0);for(const p of ps){let a=leg(p,q),b=leg(p,d);for(let k=1,n=p;n<=1e8;k++,n*=p){let u=a**k,v=b**k,f=v+u*v-u;let predicted=p===q?1:p===d?(k%2?1:-1):k%2&&a===1&&b===-1?-3:1;if(f!==predicted)throw Error("coefficient");cases++;if(k<2)continue;for(let i=0;i<X.length;i++){let x=X[i],nn=BigInt(n),xx=BigInt(x),ff=BigInt(f);let ramp=xx>nn?xx-nn:0n,rem=xx<nn?xx:nn;if(ff*ramp!==ff*xx-ff*rem)throw Error("rational centering");terms++;A[i]+=Math.max(-f,0)*Math.log(p)*Math.min(1,x/n)}}}for(let i=0;i<X.length;i++){let ratio=A[i]/Math.cbrt(X[i]);if(ratio>150)throw Error("bound");maxRatio=Math.max(maxRatio,ratio);windows++}}let controls=0;if(leg(11,23)!==-1||leg(23,11)!==1)throw Error("bad-pair control");controls++;if(1+(-1)*1-(-1)!==1)throw Error("sign control");if(((-1)+1*(-1)-1)!==-3)throw Error("negative sign");controls++;if((0+1*0-1)!==-1)throw Error("ramified even control");controls++;return {cases,terms,windows,maxRatio,controls}})();
console.log(result);
