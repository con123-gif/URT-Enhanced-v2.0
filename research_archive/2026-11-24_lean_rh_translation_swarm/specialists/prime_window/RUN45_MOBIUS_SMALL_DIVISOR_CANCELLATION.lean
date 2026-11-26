import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45, lane 3, 26 Nov 2026. HUMAN SOURCE-MATCHED ARITHMETIC /
PREPARED Lean scalar and actual native window adapter, NOT COMPILED. RH OPEN.

Current mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine; SWARM, HANDOFF, EXPANSION, AGENTS, state/log/protocol/
continuity openings and actual CI state read. Latest peer commits:
6615a312 (actual finite ramification), 86de3c73 (trace orbit),
edb25260 (length/trace separation), ce4476bd (discriminant),
8c83c632 (mass), 65a89b19 (one-index local budget). RUN44 preserved.
Commit search Mobius/Möbius/factorial/sieve checked: no exact duplicate
identified; factorial filter obstruction 2be931e7 remains in force.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream
e063a923620ee7787b4a1270421478645bf66bdb (26 Nov 01:02 UTC), not adopted.
Source paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
(defs ramp/G/Gm/WindowHyp);
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
(actual consumer). No imported RH theorem shortcut.

## Result: unconditional cancellation of small-divisor quadrature error
Start from the EXACT native principal G, for real x>=1:
 G(x)=sum_(n<=x) Lambda(n)(x/n-1)-x log x+(1+gamma)x.
Use the elementary identity Lambda(n)=sum_(d|n) mu(d) log(n/d).
It follows by summing prime-factor exponents in log n and Möbius
inverting, so it uses genuine primes including prime powers, not
a prime model. Define for y>=1
 K(y)=sum_(1<=k<=y)(y/k-1) log k,
 P(y)=y[(log y)^2/2-log y+1+gamma_1],
 c=log(2*pi)/2,
 where gamma_1=lim_(n→infinity)(sum_(k<=n) log k/k-(log n)^2/2).
Then EXACTLY G(x)=sum_(d<=x) mu(d)K(x/d)-x log x+(1+gamma)x.
DLMF 25.2.5 (https://dlmf.nist.gov/25.2.E5) fixes gamma_1 sign.
Stirling remainder from DLMF 5.11(ii), https://dlmf.nist.gov/5.11.ii.

Claim for all real y>=1: |K(y)-P(y)+c| <= (log y+3)/y.
Proof: f(t)=log(t)/t, f''(t)=(2log t-3)/t^3.
The trapezoid error over [j,j+1] is the integral of f'' times
(t-j)(j+1-t)/2, up to sign; absolute <= (1/8)int |f''|.
Summing the tail from integer n>=1 gives
 |sum_(k<=n) log k/k - (log n)^2/2 - gamma_1 - log n/(2n)|
 <= (1/8)int_n^infty (2log t+3)/t^3 dt
 = (log n+2)/(8n^2).
Stirling gives log(n!)=(n+1/2)log n-n+c+r_n,
0<r_n<=1/(12n). In K(n)=n*sum log k/k-log(n!) the two
half-log endpoint terms CANCEL EXACTLY before any norm:
 |K(n)-P(n)+c| <= (log n+3)/(8n).
For y in [n,n+1], K is affine (the new endpoint term is zero);
P''(t)=log(t)/t. Linear interpolation adds at most
log(n+1)/(8n), hence the total <=(2log(n+1)+3)/(8n)
<=(log y+3)/y since n>=y/2 and n+1<=2y.
This proves the claim independently of RH, PNT, any zero bounds or
empirical assumptions.

Put D=floor(sqrt x), M(D)=sum_(d<=D) mu(d) and define finite
 T(x)=sum_(d<=D) mu(d)P(x/d)+sum_(D<d<=x) mu(d)K(x/d)
      -x log x+(1+gamma)x.
The second sum actually ends at x/2 because K(y)=0 for 1<=y<=2.
Then
 G(x)=T(x)-c M(D)+E(x),
 |E(x)| <= ((log x+3)/x)*D(D+1)/2 <= log x+3.
The proof uses |mu|<=1 only AFTER the two endpoint terms cancel.
Thus the ENTIRE small-divisor quadrature approximation contributes
O(log x), not O(sqrt x log x) or O(x). Including the constant
M(D) term, |G(x)-T(x)| <= c sqrt x+log x+3 <=5 sqrt x.
Here c<1 and log x<=sqrt x for x>=1. No cancellation assumption about
mu is required for this proved bound.

For clarity T is a finite signed hyperbola budget, not a proof of
its smallness. Its small-divisor polynomial part can be evaluated
with three moment prefixes A_j(D)=sum_(d<=D) mu(d)(log d)^j/d:
 x[(.5 log^2 x-log x+1+gamma_1)A_0+(1-log x)A_1+.5 A_2].
Large d term can swap finite sums: sum_(2<=k<=x/(D+1)) log k *
 [(x/k)sum_(D<d<=x/k) mu(d)/d - sum_(D<d<=x/k)mu(d)].
No benefit claimed for RH runtime; this is a concrete arithmetic
localization, not a new proof-equivalent statement counted as closure.
The two large signed contributions must be treated JOINTLY.
For every theta=1/2+eps<1 and fixed delta>0, if T<=C*x^theta
on arbitrarily distant native windows, G<= (C+5)*x^theta there.
The actual Deduction.zeroFree_of_rpow_window consumer applies to
the singleton Gm=G under the original theta/delta conditions.
The T bound remains OPEN. Do not assume it from Davenport/logarithmic
Möbius bounds, or from finite computation.

## Executed arithmetic regression
Local CPython 3 NumPy 2.3.5 / mpmath 1.3.0, exit 0.
N=1,000,000; 78,498 actual primes, 78,734 nonzero prime powers;
5,998 kernel inequality checks, max observed ratio 0.26741869999916007;
349 native G checks, max convolution identity residual
3.643333911895752e-06; max finite approximation residual
0.04052519562700141; max observed small quadrature remainder ratio
0.01768555766132629. Floating point regression, NOT interval proof.
Negative control x=1,000,000: small polynomial part minus main =
81272.39088364132; signed large-divisor sum = -81259.51274836283;
absolute large-divisor sum = 22245530.34364415; T=12.878135278820992,
M(D)=2, G=11.040436083450913. Dropping the signed large-divisor term
or taking absolute values destroys the observed cancellation.
Reproduction (Python):
import numpy as np, math, mpmath as mp
N=1000000
p=np.ones(N+1,dtype=bool);p[:2]=False
for q in range(2,math.isqrt(N)+1):
 if p[q]: p[q*q::q]=False
pr=np.flatnonzero(p)
mu=np.ones(N+1,dtype=np.int8);mu[0]=0
lam=np.zeros(N+1)
for q0 in pr:
 q=int(q0);mu[q::q]*=-1
 if q*q<=N:mu[q*q::q*q]=0
 j=q
 while j<=N:lam[j]=math.log(q);j*=q
n=np.arange(N+1,dtype=float);ln=np.log(np.maximum(n,1))
A=np.cumsum(ln/np.maximum(n,1));B=np.cumsum(ln)
W=np.cumsum(lam/np.maximum(n,1));L=np.cumsum(lam)
g1=float(mp.stieltjes(1));g=float(mp.euler);c=math.log(2*math.pi)/2
def K(y):
 i=np.floor(y).astype(int);return y*A[i]-B[i]
def P(y):
 t=np.log(y);return y*(.5*t*t-t+1+g1)
ys=np.unique(np.r_[np.arange(1,5000)/8+1,np.geomspace(1,N,1000)])
err=np.abs(K(ys)-P(ys)+c);b=(np.log(ys)+3)/ys
assert np.all(err<=b+1e-6)
xs=np.unique(np.r_[np.geomspace(2,N,101),np.arange(2,250)+.375])
rr=approx=ratio=0
for x in xs:
 m=int(x);D=math.isqrt(m);d=np.arange(1,m+1);y=x/d
 exact=float(np.dot(mu[1:m+1].astype(float),K(y)))-x*math.log(x)+(1+g)*x
 direct=x*W[m]-L[m]-x*math.log(x)+(1+g)*x
 rr=max(rr,abs(exact-direct));assert abs(exact-direct)<1e-5
 finite=float(np.dot(mu[1:D+1].astype(float),P(y[:D])-c)+np.dot(mu[D+1:m+1].astype(float),K(y[D:])))-x*math.log(x)+(1+g)*x
 rem=float(np.dot(mu[1:D+1].astype(float),K(y[:D])-P(y[:D])+c))
 bound=(math.log(x)+3)*D*(D+1)/(2*x)
 assert abs(rem)<=bound+1e-8
 approx=max(approx,abs(finite-direct));ratio=max(ratio,abs(rem)/bound)
print(len(pr),np.count_nonzero(lam),len(ys),np.max(err/b),len(xs),rr,approx,ratio)
x=float(N);D=math.isqrt(N);d=np.arange(1,N+1);y=x/d
sv=float(np.dot(mu[1:D+1].astype(float),P(y[:D])))
lt=float(np.dot(mu[D+1:].astype(float),K(y[D:])))
base=x*math.log(x)-(1+g)*x
print(sv-base,lt,np.dot(np.abs(mu[D+1:]).astype(float),np.abs(K(y[D:]))),sv+lt-base,int(mu[1:D+1].sum()),x*W[N]-L[N]-base)
End Python.

Original source graph: Gm singleton=G -> native pointwise rpow budget
-> windowHyp_of_rpow -> lemmaL -> ZeroFree. Candidate arithmetic
producer: exact Mobius convolution -> K endpoint cancellation ->
small-divisor error + finite signed T -> same native rpow consumer.
Original graph and all upstream arithmetic/geometric obligations
preserved; this does NOT prune the quantitative native VWin producer.
Cache key pin, actual F and singleton identification, x, D, exact
gamma normalizations, theta, delta, same window. Backtrack to original
rpow route if adapter fails. No global deletion.
Local lean/lake absent. Retrieved actual historical CI status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (45577239749)
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 (45576756833);
baseline passes only. Latest orchestrator 45731114287 unrelated.
No new Lean PASS, no axiom retirement. The quadrature proof is human;
the following scalar aggregation and window adapter are prepared
for the native engine, not a formalization of the entire derivation.

RESUME HERE: audit exact K-P-c normalization and compile the adapter;
then attempt a direct JOINT bound of T via the three Möbius moments
and large-divisor hyperbola term, not separate absolute estimates.
If no RH-scale saving is obtained, retain canonical G and prioritize
the actual same-host quantitative arithmetic producer rather than
introduce more equivalent criteria. Independent audit requested.
HANDOFF TO math, Landau, integration, kernel extractor and formal audit.
-/

open scoped BigOperators
noncomputable section
namespace RHPrimeWindow45

theorem signed_error {ι : Type*} (s : Finset ι) (mu err b : ι → ℝ)
    (hm : ∀ i ∈ s, |mu i| ≤ 1) (he : ∀ i ∈ s, |err i| ≤ b i) :
    |∑ i ∈ s, mu i * err i| ≤ ∑ i ∈ s, b i := by
  classical
  have hb : ∀ i ∈ s, |mu i * err i| ≤ b i := by
    intro i hi
    rw [abs_mul]
    calc
      |mu i| * |err i| ≤ 1 * |err i| :=
        mul_le_mul_of_nonneg_right (hm i hi) (abs_nonneg _)
      _ ≤ b i := by simpa using he i hi
  apply abs_le.mpr
  constructor
  · have h : ∀ i ∈ s, -b i ≤ mu i * err i := fun i hi => (abs_le.mp (hb i hi)).1
    simpa only [Finset.sum_neg_distrib] using Finset.sum_le_sum h
  · exact Finset.sum_le_sum (fun i hi => (abs_le.mp (hb i hi)).2)

theorem tail_window (F : Deduction.CharFamily)
    (hF : ∀ y, Deduction.Gm F y = Deduction.G y)
    (T : ℝ → ℝ) {θ δ C : ℝ} (hθ : (1/2 : ℝ) ≤ θ)
    (hE : ∀ y ≥ 1, Deduction.G y ≤ T y + 5 * y ^ (1/2 : ℝ))
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Set.Icc Y (Y ^ (1+δ)), T y ≤ C * y ^ θ) :
    ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Set.Icc Y (Y ^ (1+δ)), Deduction.Gm F y ≤ (C+5) * y ^ θ := by
  intro Y₀
  obtain ⟨Y,hY,hB⟩ := h (max Y₀ 1)
  refine ⟨Y,(le_max_left _ _).trans hY,?_⟩
  intro y hy
  have hy1 : 1 ≤ y := (le_max_right _ _).trans (hY.trans hy.1)
  have hp : y ^ (1/2 : ℝ) ≤ y ^ θ := Real.rpow_le_rpow_of_exponent_le hy1 hθ
  rw [hF]
  have h1 := hE y hy1
  have h2 := hB y hy
  linarith [mul_le_mul_of_nonneg_left hp (show (0:ℝ) ≤ 5 by norm_num)]

theorem zeroFree_of_tail (F : Deduction.CharFamily)
    (hF : ∀ y, Deduction.Gm F y = Deduction.G y)
    (T : ℝ → ℝ) {θ δ C : ℝ} (hθ : (1/2 : ℝ) ≤ θ)
    (hθ1 : θ < 1) (hδ : 0 < δ)
    (hE : ∀ y ≥ 1, Deduction.G y ≤ T y + 5 * y ^ (1/2 : ℝ))
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Set.Icc Y (Y ^ (1+δ)), T y ≤ C * y ^ θ) :
    Deduction.ZeroFree F θ := by
  have hθ0 : 0 < θ := by linarith
  have hw := tail_window F hF T hθ hE h
  first
  | (rh_reduce 2 using [Deduction.zeroFree_of_rpow_window]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact Deduction.zeroFree_of_rpow_window F hθ0 hθ1 hδ hw

end RHPrimeWindow45
rh_prune RHPrimeWindow45.signed_error
rh_prune RHPrimeWindow45.tail_window
rh_scan Deduction.zeroFree_of_rpow_window limit 2000
rh_scan RHPrimeWindow45.zeroFree_of_tail limit 2000
#print axioms RHPrimeWindow45.signed_error
#print axioms RHPrimeWindow45.tail_window
#print axioms RHPrimeWindow45.zeroFree_of_tail
