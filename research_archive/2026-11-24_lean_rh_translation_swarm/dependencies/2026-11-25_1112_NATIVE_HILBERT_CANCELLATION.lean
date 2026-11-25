import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.AdmissibleMonoIdeal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN29 — native integral Hilbert coefficient by exact cancellation
25 Nov 2026. Lane 12. SOURCE-MATCHED human derivation; native certificate
PREPARED, NOT compiled. RH OPEN. Integration-ready local proof block.

Preflight: current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity, research state/log/protocol
excerpts and live HUMAN_PROOF_ONE_EQUATION read. Latest peer commit list read;
Galois faa0d552 explicitly audits degree-zero orbit separation (do not
duplicate), integration d4c1ff4b CountV, literature 9211eae7 LemmaK, editor
109c156c signed count. Prior own RUN28 16a4341042c9bbb58acc9a6042765064cd001836.
Working head observed 82c81900d590e7d9f76e1cb6701d359abb325a5f.
Latest orchestrator 45597500194 passed (not new RH verification).
Upstream current Main blob eb95ca808793dd61984cc853ab5630f54a74490c uses
Claim.zeta; keep original pin separate. No Main imported here.

## Exact pinned source provenance
All paths below relative to src/Development/AutomorphicArithmetic/
AutomorphicVarieties/CommutativeAlgebra/GradedModulesLength/, upstream
40e56bab026552e089d7afcfeff08d2defb9c005. Actual bodies fetched:
AdmissibleMonoIdeal.lean 80e31b9fb109fd0b2456e96d2ed5b2e370d40461 (low_holds)
LkHolds.lean 387c23824dfaf8bcd82f7b7140fbe155d82c3fb8 (lk_holds)
LaDifPerm.lean d327f3f89083c0ad6bf9db1b1ae1f23d5cee9626 (la_holds)
FrobeniusInclusionXEqMulQ.lean 798fa8e4a58b1b322e9b2ac5b1f6fd9ec8c58b18 (num_holds)
ReesGradedPieceSurjection.lean fe3727483c29dc0dbf934bdb8201b209e754c633 (hf_holds)
ChartLeadingWeightTwo.lean cb83c416f08c8b92e8917258ca4648215bc786cb
ToDegInjective.lean 97af3567f20f3414761d99a42b84e7950a0fac37
Satfil.lean 2c05657eaeb7a49224bd84324859695395b2ee4f
Latfil.lean 84922beaf68e90dd5f2f5b6f431be6c5bd3bd8e5
GrEqRange.lean 172c50f5340280e09344dd8e1fbdbaecfa01b805.
../OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15.
IMPORTANT mDims: counts (-1,-2,+1,+2) are (r,s,r'+1,s'+1), no
weight-zero variables after the chart cut. The private num_holds proof
renames r-1 as r internally; using r+1 in the original statement is wrong.

## Short mathematical derivation of low_holds
Retain all original premises from RUN28. Let O be the DVR with uniformizer
pi and fraction field E, B=A_0, F=last weight -1 equation in satSq.
Let N=(A_-2,A_2,B F^2 + A_-2^2 A_2). For multi-degree d>=0,
R_d=N_0^d0 N_1^d1 N_2^d2. Write A_d=2d0+4d2 and B_d=2d1+2d2
(the integers A_d,B_d are not the ring A or B).

1. In the formal chart, negative and positive weighted degrees have
difference equal to the original weight. The chart respects augmentation.
For a weight -1 element of satSq, multiplying by a nonzero O scalar
puts it in the square of the augmentation ideal, so its constant and
linear coefficients vanish. Dividing in E preserves this vanishing.
Its negative weighted degree is at least two. A weight-zero element
in the augmentation kernel has negative degree at least one.
Thus every element of R_d has chart negative degree >= A_d and
weight B_d-A_d. Define q coefficientwise by strict negative degree
>A_d. This is homogeneous and an ideal by additivity of the lower
filtration bound under multiplication; it contains the coefficient
kernel of the chart and augmentation-zero degree-zero elements.
Nonzero O scalars are invertible in E, hence R/q has no O torsion.
For f,g of weight -1 with f-g in satSq, the product (f-g)(f+g)
has negative degree >=3. It follows that their squares agree in the
degree e0 piece of R/q. This proves the mechanism of lk_holds
using satfil_holds and latfil_holds, without assuming regularity
of the original unsaturated chart quotient.

2. Let I_d be the monomials with negative degree A_d and positive
degree B_d. The leading coefficient map R_d -> E^{I_d} has kernel
q_d; its image L_d is a finite O-module because R_d is finite over B
and B acts through the augmentation on these leading coefficients.
It spans E^{I_d}: for weight +/-1, use homogeneous chart elements
with the given unique linear coefficient. For weight +/-2, remove
the competing quadratic monomials using products of the +/-1 elements,
clearing denominators in O instead of dividing in A. This preserves
the desired coefficient and realizes each unique weight-two leading
monomial. Any monomial in I_d partitions into negative weight-two
blocks and positive weight-two blocks, since all absolute weights
are 1 or 2 and both totals are even. Multiply the leading
representatives, using A_-2^(d0+2d2) A_2^(d1+d2) <= R_d.
Their leading products are nonzero single monomials. Consequently
L_d is a full finite free O lattice (not necessarily O^{I_d} as an
embedded lattice), and the d-piece of (R/q)/pi is L_d/pi L_d.
Its B-length is |I_d| because B acts through O/pi. This is hf_holds,
including its integral rank-to-length step. No claim of integral
surjectivity of the chart is needed. Keep IsChart0.onto and weight
conditions, finite generation, and satSq regularity supplier.

3. The exact numerical part is much shorter by formal generating
series. Put a=r-1>=0, b=r', and let X,Y track the two weighted degrees.
By native mDims, cnt has generating function
  H=1/[(1-X)^r (1-X^2)^s (1-Y)^(b+1) (1-Y^2)^(s'+1)].
The difference operator in the actual num_holds multiplies H by
  (1-X^2)^(a+s) (1-Y^2)^(b+s') (1-X^4 Y^2).
Before estimating anything, cancel exact common factors:
  D=(1+X)^a (1+Y)^b (1-X^4Y^2)/[(1-X)(1-Y)(1-Y^2)]
   =(1+X)^a(1+Y)^b/[(1-X)(1-Y)]
    + (1+X)^a(1+Y)^b Y^2(1+X+X^2+X^3)/[(1-Y)(1-Y^2)].
All operations are formal power series over Z; denominators have
constant coefficient one. The second summand is a polynomial in X
of degree <=a+3. Therefore for A_d>=a+4=r+3 and B_d>=b the
coefficient of D is EXACTLY 2^(a+b) by the binomial theorem.
This supplies native num_holds with an explicit sufficient threshold,
for example d_i >= r+r'+3 for all i. No asymptotic Hilbert estimate,
limits, norm, or separate parity cases are required. The native
operator proof uses precisely the same cancellation and shift terms;
this is a human replacement, not a new stronger global bound.

4. In la_holds, multiplication by pi on R/q is injective (step 1).
Euler additivity for a product of sections splits the contribution
from pi^c y into c copies of the pi-section contribution plus that
of y; because pi has degree zero, the copies use the same degree.
The small-module rule identifies the former with finite differences
of hilb((R/q)/pi). Apply successively to the r squared Smith equations
with exponents 2c_i; permutation of degree differences makes all
the coefficient contributions identical. The remaining Euler term
with no pi powers is nonnegative by rulePos. Hence the sum is
>= (sum 2c_i) * 2^(r-1+r') = (sum c_i) * 2^(r+r').
The graded surjection from (R/J)/a onto R/q and ruleMono transfer
this lower bound to the native X_d of RUN28. Keep admissibility for
the joint list and modulo pi, valid degrees, grading and finite
generation. The existing Euler rules are NOT independently proved
by this reconstruction; they are the remaining foundational
suppliers to examine and must be cited or proved.

Together with RUN28, this reconstructs the local lower and signed
upper valuation assembly, not the whole arithmetic bound.
No removal of M4: peer faa0d552 confirms it still controls
local multiplicity. No changes to the original graph. Newly traced
source-call edges low_holds -> lk_holds, la_holds, hf_holds, num_holds,
mono_quo; lk_holds -> satfil_holds, latfil_holds; hf_holds ->
exists_mem_oz_pow_coeff_ne_zero_unique, length_localization_bound
(private); la_holds -> euler_rule_product_zero, ruleNzd, ruleSmall,
rulePos, euler_rule_two_of_graded_finite_iso. These are source
references, not new elaborated graph edges. Reduced view replaces
the combinatorial numerical subargument by the formal cancellation,
retains every mathematical input and all other unresolved leaves.
Cache per (pin, chart, weights, r,s,r',s', d, O, caller); no raw
archive rescan, no URT speedup or global complexity claim.

## Executed exact regression of the actual native count
Python 3 local, using integer coefficient DP for the ORIGINAL count
and the binomial expansion of the ORIGINAL difference operator
(independent of the simplified generating series). Reproduce:

from functools import lru_cache
from math import comb
@lru_cache(None)
def counts(n1,n2,N=40):
    a=[1]+[0]*N
    for w in [1]*n1+[2]*n2:
        for k in range(w,N+1): a[k]+=a[k-w]
    return a
def c(a,b,r,s,t,u):
    if min(a,b)<0:return 0
    return counts(r,s)[a]*counts(t+1,u+1)[b]
def d(A,B,r,s,t,u):
    m=r-1+s;n=t+u
    return sum((-1)**(i+j)*comb(m,i)*comb(n,j)*
        (c(A-2*i,B-2*j,r,s,t,u)-c(A-2*i-4,B-2*j-2,r,s,t,u))
        for i in range(m+1) for j in range(n+1))
checks=0
for r in range(1,6):
 for s in range(4):
  for t in range(5):
   for u in range(4):
    for A in range(r+3,23,3):
     for B in range(t,23,4):
      assert d(A,B,r,s,t,u)==2**(r-1+t),(r,s,t,u,A,B)
      checks+=1
assert d(2,2,1,0,0,0)==2!=1
print('exact coefficient comparisons:',checks,'; boundary control:',d(2,2,1,0,0,0))

Observed output: exact coefficient comparisons: 13440 ; boundary control: 2
Initial incorrect test using counts(r+1,s) failed at (1,0,0,0,4,0);
source mDims confirms correction to counts(r,s). Preserve this control.
These are regression tests of the native combinatorial formula, not
tests of RH or of a synthetic Galois representation.
Native Lean/Lake unavailable locally. Re-read actual prior CI outputs
45577239749 pass 98.87s, 45576756833 pass 77.94s; only earlier engines
and conditional strip root are certified (classical axioms, 324 pending
scan names). This new file has NOT been compiled or registered as a
new CI job; no new native PASS. Use existing pinned native environment
with engine oleans; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Original graph and prior axiom evidence preserved; new axiom audit pending.

RESUME HERE: inspect actual EulerRuleProductZero and RuleMono/RulePos
proofs used by la_holds and low_holds. Determine whether the standard
Koszul Euler-characteristic exact-sequence argument supplies all of
them under the native admissibility premises, and retain any missing
positivity/finite-length argument. Independently audit actual
up_holds support and multiplicity-one before claiming LemmaM closed.
Kernel lane: compile this batch and retain all scan/prune and axiom
outputs; no original dependency deletion without caller replay.
HANDOFF TO integration, Galois, kernel, audit, human editor.
-/

open Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

-- Exact polynomial numerator splitting used before taking coefficients.
theorem RHNativeHilbertFactor {R : Type} [CommRing R] (X Y : R) :
    1 - X^4 * Y^2 =
      (1 - Y^2) + Y^2 * (1-X) * (1+X+X^2+X^3) := by ring

-- Actual native numerical frontier; bounded reduction replay, NOT an
-- independent Lean formalization of the generating-series argument.
theorem RHNativeNumReplay
    (τ : Type) [Fintype τ] (wt : τ → ℤ) (r s r' s' : ℕ)
    (hr : 1 ≤ r) (hdim : ∀ j, Nat.card {i // wt i = j} = mDims r s r' s' 0 j) :
    ∀ᶠ d in atTop, dif (List.replicate (r - 1) (e 0) ++
      (List.replicate s (e 0) ++ List.replicate r' (e 1) ++
        List.replicate s' (e 1) ++ [e 2]))
      (fun d : Deg 3 => cnt wt (2*d 0+4*d 2) (2*d 1+2*d 2)) d =
      2^(r-1+r') := by
  first
  | rh_reduce 2 using [UpperTheory.V.Alg.M.num_holds]
  | exact UpperTheory.V.Alg.M.num_holds τ wt r s r' s' hr hdim

#print axioms RHNativeHilbertFactor
#print axioms RHNativeNumReplay
#print axioms UpperTheory.V.Alg.M.low_holds
#print axioms UpperTheory.V.Alg.M.lk_holds
#print axioms UpperTheory.V.Alg.M.hf_holds
#print axioms UpperTheory.V.Alg.M.la_holds
#print axioms UpperTheory.V.Alg.M.num_holds
rh_scan UpperTheory.V.Alg.M.low_holds limit 2000
rh_scan UpperTheory.V.Alg.M.hf_holds limit 2000
rh_scan UpperTheory.V.Alg.M.num_holds limit 2000
rh_prune UpperTheory.V.Alg.M.lk_holds as RHNativeLkReduced
rh_prune UpperTheory.V.Alg.M.hf_holds as RHNativeHfReduced
rh_prune UpperTheory.V.Alg.M.la_holds as RHNativeLaReduced
rh_prune UpperTheory.V.Alg.M.num_holds as RHNativeNumReduced
