import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN57 O(N) lane, 26 November 2026. Exact marked orbit aggregation at
the actual A local-index caller. Source-matched human reduction; scalar
Lean certificates PREPARED, NOT COMPILED. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96 read. Recent peer corrections
e7cdaea4, 727c85e5; theta 663c88ca (same-module determinant transport),
kernel 2e27597e. Previous RUN56 prefix c561038c independent.

Source ledger (grh-compact/src):
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834

1. Uniform orbit size and parity (MarkedPrimeType.hasType_markOperator).
For served p let G=D.Phi, g=placeOfInt(-p), pi=placeClass to the mod-N0
group, d=order(pi(g)), c=g^d, h=order(c). Tops=ker(pi).
Native IsServed gives d odd and m|order(g), m a power of 2.
Since d|order(g), order(g)=d*h; gcd(d,m)=1 implies m|h.
For l in Lambda choose tau_l top inducing l (IsMarked.served_top).
Native inducedPlace_eq_or_star_iff identifies tops inducing l or
star(l) with exactly tau_l<c>: if sigma=g^i tau_l is top then pi(g)^i=1,
so d|i. Conversely such powers lie in that pair and are tops.
The map ZMod(h) -> tau_l<c>, s -> c^s tau_l, is bijective by order
and the preceding identity. Multiplication by c switches conjugate
primes (d odd, p inert); they are distinct by IsMarked.star_ne.
Thus h even and each side has h/2 elements. Retain native Frobenius
embedding maps, intertwining and marked elementary-divisor supplier.

2. Sum orbit masses before paying index. K=#Lambda, T=#tops, f=D.f,
a=D.a, m=D.m, L=D.logB, J=jetCeil(p)=ceil(2mfa/p).
The prime pairs are disjoint by star_notMem and star involutive.
Thus K*h<=T<=f, m*K<=T and sum_l A_l=a*K*h/2<=a*T/2.
For IsFullMark the count K*h=T and sum A_l=a*T/2 are exact.
For empty Lambda both aggregate inequalities hold without served
hypothesis, product identity. The common orbit size can be cached
at fixed (D,p), not across contexts.

3. Actual consumer LocalStatement.hasType_prod_markOperator_pow.
The native individual HasType cost per column dimension is
  128*A_l*L/(m*p) + J/x^14 + x^40.
Use SAME ordered Y=prod_l markOperator(l), repeated m times.
Native HasType.prod (peer 663c88ca) gives determinant divisibility
for Y^m M + p^J M, no finite freeness or new witness. Exact cost:
 total = 128*L/p * sum_l A_l + m*K*(J/x^14+x^40)
      <= 64*f*a*L/p + f*(J/x^14+x^40).
Sufficient scalar scale guards: L>=64, 2*m*f<=x^14,
x^40+1<=a/p, x>=1. They follow from native scale:
log(m)<=log2+logX/2; HasLogBound_f upper gives
log(f)<=11 logX+log(logB)/5+P.c. From 100 log(logB)<=logX
and 1e12 P.c<=log(logB), log(2mf)<=log4+(11.502+1e-14)logX
<14 logX. Data scale and positive parameter constant give x>=2
and L>=64. Since p<x1 and a>=xb, log(a/p)>logX+logB-logX1
>=41 logX; x>=2 implies x^41>=x^40+1. J<2mfa/p+1 now gives
 J/x^14+x^40<=a/p+1+x^40<=2*a/p.
Therefore total<=f*(a/p)*(64L+2)<=3*f*(a/p)*L^2<=3*loss(p).
The last uses native loss factor >=1 (equals one for served p).
Multiply by unchanged nonnegative column dimension. For Lambda
empty cost zero, avoiding served-only steps. No change to
3*loss constant or the chosen submodule. This supplies the scalar
budget at hasType_prod_markOperator_pow from individual marked
HasType. Same exists_indexDvd_Bmu_divisible caller uses separate
gauge bounds. Individual elementary divisors and Schur-jet
valuation are not established by this.

Algorithm: enumerate encountered tops once, use induced prime +
star pair as key, increment mass; retain representative and parity
at fixed native context. O(T) map operations assuming constant-time
hash operations; group arithmetic, bit complexity, input construction
separate. No enumeration of actual enormous D or measured speedup.

Execution: 28 exact source guards across seven fetched pinned
bodies; 7 missing-guard controls detected. No artificial arithmetic
parameters used. Latest RUN29 status a56e2d3a (run 45803534769)
ERROR: A timeout, previous six B/C checks only. No A-only job
found in current registry. No new native compilation, rh_scan/prune
or rh_auto result. Old native graphs and axiom evidence retained.
Original: individual marked HasType -> repeated ordered product ->
native scalar budget -> hasType_prod_markOperator_pow ->
exists_indexDvd_Bmu_divisible -> short_forms -> star_inequality.
Candidate: same individual HasType and ordered product ->
exact common orbit mass + scalar guards below -> SAME bound/caller.
Keep all original and unresolved type/value edges until native
bridge and independent audit. No essential RH obligation retired
globally. No URT assumptions.

RESUME HERE: theta/integration may use aggregate budget in local
index paragraph after independent audit. Kernel A-only retry and
actual source bridge of orbit/scale guards; compile scalar lemmas
below in approved runner. Do not refine constants further. Next
priority Columns.hasType_markOperator -> TwistedHecke elementary
divisor supplier, or level-N support if ready. Preserve every
local representation/Frobenius hypothesis.
HANDOFF TO theta, kernel, audit, integration. Human proof incomplete.
-/

namespace AccelerationRun57

/-- Normalized marked-product scalar budget: A=sum mark exponents/p,
u=a/p, K=m*#Lambda, B=J/x^14+x^40. -/
theorem marked_aggregate_budget (A u K B f L : ℝ)
    (hA : A ≤ f*u/2) (hK : K ≤ f)
    (hB : B ≤ 2*u) (hBn : 0 ≤ B)
    (hf : 0 ≤ f) (hu : 0 ≤ u) (hL : 64 ≤ L) :
    128*A*L + K*B ≤ 3*f*u*L^2 := by
  have hLn : 0 ≤ L := by linarith
  have h1 : 128*A*L ≤ 128*(f*u/2)*L :=
    mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_left hA (by norm_num)) hLn
  have h2 : K*B ≤ f*(2*u) :=
    (mul_le_mul_of_nonneg_right hK hBn).trans
      (mul_le_mul_of_nonneg_left hB hf)
  have hh : 64*L+2 ≤ 3*L^2 := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hL) hLn, sq_nonneg (L-64)]
  calc
    128*A*L + K*B ≤ 128*(f*u/2)*L + f*(2*u) := add_le_add h1 h2
    _ = (f*u)*(64*L+2) := by ring
    _ ≤ (f*u)*(3*L^2) := mul_le_mul_of_nonneg_left hh (mul_nonneg hf hu)
    _ = 3*f*u*L^2 := by ring

theorem marked_ceiling_budget (J m f u X Y : ℝ)
    (hX : 1 ≤ X) (hu : 0 ≤ u) (hmf : 2*m*f ≤ X)
    (hJ : J ≤ 2*m*f*u+1) (hY : Y+1 ≤ u) :
    J/X+Y ≤ 2*u := by
  have hXp : 0 < X := by linarith
  have hprod := mul_le_mul_of_nonneg_right hmf hu
  have hdiv : J/X ≤ u+1 := (div_le_iff₀ hXp).2 (by nlinarith)
  linarith

end AccelerationRun57

#print axioms AccelerationRun57.marked_aggregate_budget
#print axioms AccelerationRun57.marked_ceiling_budget
#print axioms Data.IsMarked.hasType_markOperator
#print axioms Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Data.exists_indexDvd_Bmu_divisible
