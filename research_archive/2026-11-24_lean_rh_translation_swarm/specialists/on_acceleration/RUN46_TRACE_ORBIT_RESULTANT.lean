import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46 lane 14, 26 Nov 2026. HUMAN SOURCE-MATCHED exact algebra; executable
integer regression run; Lean PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (including unified engine),
SWARM, HANDOFF, EXPANSION, AGENTS, state/protocol/continuity consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Sources relative to src/Development/AutomorphicArithmetic/:
Foundations/GaloisRepresentations/AdmissibleResidues/FrobeniusTraceCountBoundOfRatEigensystemCount.lean
  fc375ef5c996180c985df22cc3f15655a9765126 (native hE, hprod, hF, hne).
AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/
  KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7 (D1.sum D2).
  FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970
  (all characters of kernel H, inverse evaluation at normV w).
RUN45 9a71ca2cc4e0ac57591277d30213cb01c8bd708b preserved.
Latest peers 65d0f958 (direct coarse exponent 18), 425c27c5 (native Borel/Clozel),
06c6e652 (small-prime budget), e3f9d949 (twisted Kummer torsion cancellation),
086052c6 (flag), 27896ee5 (same-presentation level witness), e827b4fe, e87829c2,
59085d33, 5744b095, bbb56405, 893007c3, 3bdeddd5, 4695f11c, d7f428d4
reviewed at commit-list level, with relevant detailed handoffs read.
Do NOT duplicate peer max-exponent compression 054230d9/3b2b21cf.
The rank-three level witness and uniform Kummer/Sha quantitative bound remain.

RESULT: eliminate explicit evaluation of each reduced character factor by
quadratic resultant, BEFORE absolute values, logarithms, or p-adic norms.
For the exact native factor, Q=q^e, A=Q(t-1), B=Q^2,
  F(z)=Q*(t-eis3(q,e,z))=A-z-B/z.
Let a+b=A, ab=B (quadratic roots in C, repeated roots allowed).
Then (-z)F(z)=(a-z)(b-z).
For any finite label type U with nonzero z and P(X)=prod_u(X-z_u):
  P(0)*prod_u F(z_u)=P(a)P(b).
At the actual nonempty FPropGKU orbit, RUN45 identifies reduced labels
with primitive d-th roots, d=order of normV(w) mod H; P=Phi_d.
The polynomial has constant term 1 for d>1 and -1 for d=1.
Consequently the same exact product M across D.S is
  M=prod_s [Phi_d(a_s)Phi_d(b_s)/Phi_d(0)].
The multiplicity r=phi(H.index)/phi(d) from RUN45 is RETAINED: NN=M^r.
The empty original orbit remains the empty product 1; do not apply the
nonempty quotient construction in that case. Trace labels are not merged.
No extra arithmetic assumption needed for existence of a,b over C;
the prepared local Lean lemma takes the roots and polynomial identity
explicitly, not a proof of the actual orbit construction.
The result is symmetric in a,b. In particular no numeric root
approximation or floating-point logarithm is required.

For ALL d use the exact integer-polynomial Lucas recurrence:
 S_0=2, S_1=A, S_(n+2)=A*S_(n+1)-B*S_n; S_n=a^n+b^n.
 R_n=prod_(z^n=1) F(z)=S_n-B^n-1 (P=X^n-1, P(0)=-1).
 R_n=prod_(d|n) P_d, where P_d=prod_(ord z=d) F(z).
 Thus P_d=prod_(k|d) R_k^mu(d/k), denominator nonzero by native hF.
 In the integral coefficient ring this is exact division, not division
 modulo a prime at which an R_k might vanish. At actual algebraic t,
 A=Q*t-Q is integral, not necessarily a rational integer. Preserve
 the algebraic number field; do not cast t to Z.
 For the dyadic special case d=2^j>=2 (NOT assumed for all native H):
 k=d/2, Phi_d=X^k+1, P_d=B^k+S_k+1, with no division.
 d=1 gives A-B-1. Fast doubling:
 S_2n=S_n^2-2B^n,
 S_(2n+1)=S_n*S_(n+1)-A*B^n,
 S_(2n+2)=S_(n+1)^2-2B^(n+1).
 This reduces dyadic product evaluation to O(log d) coefficient-ring
 stages per trace; general case O(sum_(k|d,mu!=0) log k) plus divisor
 generation, exact division and products. NOT a bit-complexity bound:
 output coefficient sizes can grow linearly in d and degree of field
 may be large. No implication of improved proof-search complexity.
 Same native hF/hne/Galois integrality and injection valuation inequality
 survive unchanged. This computes the SAME NN, not a smaller valuation
 budget. Does not solve the catalogue bound or weighted prime inequality.

Original selected graph retained: CountI -> FPropGKU -> KeepNumU ->
D1.sum D2 -> native frobenius_trace_norm_nonzero_log_bound -> hprod,
integrality, log bound, injective classes, valuation. RUN45 candidate
groups orbit; RUN46 adds optional exact resultant evaluator at that
same hprod, with no deletion of original fallback or unresolved edges.
Cache key: source/toolchain, K,N,H,w,q,e,D1,D2, catalogue trace label,
d, r, exact coefficient ring and instantiated consumer. Share only
equal keys, preserve type/value/constructor and axiom ledgers.
Backtrack to literal product if orbit/polynomial identities not verified.

Executed /tmp/rh46_test.py (Python + SymPy, exact ZZ arithmetic):
1536 comparisons against independent cyclotomic polynomial resultants,
1536 binary/linear Lucas comparisons; no mismatches.
q in {7,11,49}, e in {1,2}, t in {-2,0,1,3}, d=1..64.
These are source-admissible scalar regression cases, NOT genuine host
trace catalogues or experiments on RH. Isolated reference resultant
time 0.17103s (polynomial construction excluded), candidate 0.03222s
(including divisor/Mobius generation); one local run, no native speedup.
Dyadic d=64,256,1024,4096: linear steps 32,128,512,2048 vs binary
stages 6,8,10,12; exact outputs agreed. No URT used.
Reproduction (run separately as Python):
import sympy as s
x=s.symbols('x')
def lucas(n,A,B):
    u,v,b=2,A,1
    for digit in bin(n)[2:]:
        u2=u*u-2*b; v2=u*v-A*b; b2=b*b
        if digit=='0': u,v,b=u2,v2,b2
        else: u,v,b=v2,v*v-2*B*b,b2*B
    return u,b
def direct(n,A,B):
    u,v=2,A
    for _ in range(n): u,v=v,A*v-B*u
    return u,B**n
def all_roots(n,A,B):
    u,b=lucas(n,A,B)
    return u-b-1
def cyclo(d,A,B):
    if d==1: return A-B-1
    if d & (d-1)==0:
        u,b=lucas(d//2,A,B)
        return u+b+1
    p=m=1
    for k in s.divisors(d):
        mu=int(s.mobius(d//k))
        if mu==1: p*=all_roots(k,A,B)
        if mu==-1: m*=all_roots(k,A,B)
    assert m and p%m==0
    return p//m
for q in (7,11,49):
 for e in (1,2):
  for t in (-2,0,1,3):
   Q=q**e; A=Q*(t-1); B=Q**2
   for d in range(1,65):
    p=s.Poly(s.cyclotomic_poly(d,x),x,domain=s.ZZ)
    ref=int(p.resultant(s.Poly(x*x-A*x+B,x,domain=s.ZZ)))//int(p.eval(0))
    assert cyclo(d,A,B)==ref and ref!=0
    assert lucas(d,A,B)==direct(d,A,B)
for d in (64,256,1024,4096):
 assert lucas(d//2,14,49)==direct(d//2,14,49)

Local lean/lake absent. Actual CI jobs 45577239749,45576756833,45670987597
retrieved completed/success for previous baselines only. No new native
PASS or axiom closure, no dispatcher available in this run.
RESUME HERE: stage this module with the existing three engine modules
and RUN45 in the pinned native environment, run lake env lean, check
actual published output/axioms. Formalize the primitive-root polynomial
identity using the actual FPropGKU cyclic quotient; substitute at native
hprod and compare exact NN, not only log bounds. If no native execution
is available, preserve all open edges. Then prioritize the same-host
Rank3LevelWitness21 and uniform arithmetic suppliers rather than another
product rewrite. No essential obligation discharged.
HANDOFF TO kernel, Galois, integration, audit.
-/

noncomputable section
open scoped BigOperators
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
namespace UpperTheory.GalN.V.Win

theorem trace_factor_resultant46 (q e : ℕ) (t z a b : ℂ)
    (hq : q ≠ 0) (hz : z ≠ 0)
    (ha : a + b = (q : ℂ)^e * (t - 1))
    (hb : a * b = ((q : ℂ)^e)^2) :
    (0 - z) * ((q : ℂ)^e * (t - eis3 q e z)) = (a-z)*(b-z) := by
  have hqc : ((q : ℂ)^e) ≠ 0 := pow_ne_zero _ (by exact_mod_cast hq)
  have hE : (q : ℂ)^e * (t - eis3 q e z) =
      (q : ℂ)^e * t - (z + (q : ℂ)^e + ((q : ℂ)^e)^2 * z⁻¹) := by
    simp only [eis3]
    rw [mul_sub]
    congr 1
    rw [mul_add, mul_add, ← mul_assoc, mul_inv_cancel₀ hqc, one_mul,
      mul_one, ← mul_assoc, sq]
  rw [hE]
  calc
    _ = z^2 - ((q : ℂ)^e * (t-1))*z + ((q : ℂ)^e)^2 := by
      field_simp [hz] <;> ring
    _ = _ := by rw [← ha, ← hb]; ring

theorem trace_orbit_resultant46 (q e : ℕ) (t a b : ℂ)
    (hq : q ≠ 0)
    (ha : a+b = (q : ℂ)^e * (t-1))
    (hb : a*b = ((q : ℂ)^e)^2)
    (U : Type) [Fintype U] (z : U → ℂ)
    (hz : ∀ u, z u ≠ 0) (P : ℂ → ℂ)
    (hP : ∀ x, (∏ u, (x-z u)) = P x) :
    P 0 * (∏ u, (q : ℂ)^e * (t-eis3 q e (z u))) = P a * P b := by
  calc
    _ = (∏ u, (0-z u)) * (∏ u, (q : ℂ)^e * (t-eis3 q e (z u))) := by
      rw [hP 0]
    _ = ∏ u, (0-z u) * ((q : ℂ)^e * (t-eis3 q e (z u))) := by
      rw [Finset.prod_mul_distrib]
    _ = ∏ u, (a-z u)*(b-z u) := by
      apply Finset.prod_congr rfl
      intro u _
      exact trace_factor_resultant46 q e t (z u) a b hq (hz u) ha hb
    _ = (∏ u, (a-z u)) * (∏ u, (b-z u)) := by
      rw [Finset.prod_mul_distrib]
    _ = _ := by rw [hP a, hP b]

theorem trace_catalogue_resultant46 (q e : ℕ) (hq : q ≠ 0)
    (U S : Type) [Fintype U] [Fintype S] (z : U → ℂ)
    (hz : ∀ u, z u ≠ 0) (t a b : S → ℂ)
    (ha : ∀ s, a s + b s = (q : ℂ)^e * (t s-1))
    (hb : ∀ s, a s * b s = ((q : ℂ)^e)^2)
    (P : ℂ → ℂ) (hP : ∀ x, (∏ u, (x-z u)) = P x)
    (hP0 : P 0 = 1) :
    (∏ u, ∏ s, (q : ℂ)^e * (t s-eis3 q e (z u))) =
      ∏ s, P (a s)*P (b s) := by
  rw [Finset.prod_comm]
  apply Finset.prod_congr rfl
  intro s _
  have h := trace_orbit_resultant46 q e (t s) (a s) (b s) hq
    (ha s) (hb s) U z hz P hP
  simpa only [hP0, one_mul] using h

theorem trace_orbit_dyadic46 (q e k : ℕ) (t a b : ℂ)
    (hq : q ≠ 0) (hk : 0 < k)
    (ha : a+b = (q : ℂ)^e*(t-1))
    (hb : a*b = ((q : ℂ)^e)^2)
    (U : Type) [Fintype U] (z : U → ℂ) (hz : ∀ u, z u ≠ 0)
    (hP : ∀ x : ℂ, (∏ u, (x-z u)) = x^k+1) :
    (∏ u, (q : ℂ)^e*(t-eis3 q e (z u))) =
      (((q : ℂ)^e)^2)^k + (a^k+b^k)+1 := by
  have h := trace_orbit_resultant46 q e t a b hq ha hb U z hz
    (fun x => x^k+1) hP
  have h1 : (∏ u, (q : ℂ)^e*(t-eis3 q e (z u))) =
      (a^k+1)*(b^k+1) := by
    simpa only [zero_pow hk.ne', zero_add, one_mul] using h
  rw [h1]
  calc
    _ = (a*b)^k+(a^k+b^k)+1 := by rw [mul_pow]; ring
    _ = _ := by rw [hb]

theorem lucas_double46 (a b : ℂ) (n : ℕ) :
    a^(2*n)+b^(2*n) = (a^n+b^n)^2-2*(a*b)^n := by
  rw [show 2*n=n*2 by omega, pow_mul, pow_mul, mul_pow]
  ring

theorem lucas_odd46 (a b : ℂ) (n : ℕ) :
    a^(2*n+1)+b^(2*n+1) =
      (a^n+b^n)*(a^(n+1)+b^(n+1))-(a+b)*(a*b)^n := by
  rw [show 2*n+1=n+n+1 by omega]
  simp only [pow_add, pow_one, mul_pow]
  ring

-- Actual source-matched consumer interface, bounded backtracking.
example (q e k : ℕ) (t a b : ℂ) (hq : q ≠ 0) (hk : 0 < k)
    (ha : a+b = (q : ℂ)^e*(t-1))
    (hb : a*b = ((q : ℂ)^e)^2)
    (U : Type) [Fintype U] (z : U → ℂ) (hz : ∀ u, z u ≠ 0)
    (hP : ∀ x : ℂ, (∏ u, (x-z u)) = x^k+1) :
    (∏ u, (q : ℂ)^e*(t-eis3 q e (z u))) =
      (((q : ℂ)^e)^2)^k + (a^k+b^k)+1 := by
  first
  | (rh_reduce 2 using [trace_orbit_dyadic46]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact trace_orbit_dyadic46 q e k t a b hq hk ha hb U z hz hP

end UpperTheory.GalN.V.Win

rh_scan UpperTheory.GalN.V.Win.frobenius_trace_norm_nonzero_log_bound limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_adm2A_imp_adm2B limit 2000
rh_scan UpperTheory.GalN.V.Win.trace_catalogue_resultant46 limit 2000
rh_prune UpperTheory.GalN.V.Win.trace_orbit_dyadic46 as RHTraceOrbitDyadicPruned46
#print axioms UpperTheory.GalN.V.Win.trace_factor_resultant46
#print axioms UpperTheory.GalN.V.Win.trace_orbit_resultant46
#print axioms UpperTheory.GalN.V.Win.trace_catalogue_resultant46
#print axioms UpperTheory.GalN.V.Win.trace_orbit_dyadic46
