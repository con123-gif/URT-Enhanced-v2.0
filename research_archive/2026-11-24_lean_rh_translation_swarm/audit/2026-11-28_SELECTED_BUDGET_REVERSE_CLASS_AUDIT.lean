import EditorSelectedRecord
import Lean

/-!
# Audit — reverse selected-budget implication; exact class obstruction
28 November 2026. Human conditional proof / PREPARED scalar certificate.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Read mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484;
AGENTS, SWARM, HANDOFF and relevant latest peer commits 69d79aa2,
45f43a9e, 8f441c84, 7c395ef8, e4f993ab. This audits the actual
SelectedCountBudget interface, not an alternate proof of RH. No duplicate
scalar forward budget, endpoint selection or count canonicalization.

## Exact reverse direction with the necessary class guard
The previous audit 1ee12799532d9ac29360af641b1a2057be5398d8 establishes
the fixed-P Vinogradov–Korobov PNT tail at u*=(10^6 log x)^2, using
Thorner–Zaman arXiv:2108.10878v2 Corollary 1.4 and Remark 1.5.
Reuse that explicit analytic input, with P fixed before x. In particular
|Q_D(u*)|<=x^(-10^6) eventually, uniformly in T/H<=B=x^eps.
The native exact remainder identity is S=m*a*H*(A-Q), where
A=primeError P.d P.N₀ x, H=#thick, T=towerDeg D.s, B=D.logB,
S=m*run90Remainder and f=number of infinite places.
The existing lightweight run90Remainder_eq is the exact identity used;
no assumption of a kernel equality with the original heavyweight definition.

Define ClassGrid to be RUN82 CountEscapeGrid with the additional guard
d = 9239 mod 18480 for every prime in S. Then, under the previously
audited fixed-P PNT tail and native DataExist, the ALL-tolerance
ClassGrid and the editor's SelectedCountBudget are mathematically
equivalent. This is a human implication, not a native replay.
Forward selected -> ClassGrid is the existing editor endpoint implication,
plus the native parameter congruence d_congr:
  M | 2(d+1), not M | (d+1), M=18480.
This is equivalent to d=9239 mod M by elementary division by 2.

Reverse: fix target tolerance 0<e<1/100, take ClassGrid at tau=e/32.
Retain that exact S. Its CountEscape exponent 1-2*tau/9 is larger than
1-2*e/9; if the count were O of the latter it would be O of the former,
a contradiction (on natural X>=1). For each prime d in S construct P
with N₀=M,d=d, divisibility M|M, d.Prime and the class congruence.
Fix eps=e/4, K=1, C=4 BEFORE x. Then (K+1)*eps=e/2 exactly.
The stronger endpoint hypothesis gives A<=x^(-1/2+4*tau)
=x^(-1/2+e/8) at all sufficiently large quartic scales.
Use exists_data P eps to select one native D at x with B=x^eps and
T/B<=H; update its logX1 to u* exactly as in 1ee12799.
The original and new scale clauses hold eventually; this does not
transport any geometric row witnesses. At u*, |Q|<=x^(-10^6).
Let z=x^(e/8); for x>=1, A*sqrt(x)<=z, -Q*sqrt(x)<=z and z<=B.
Native m_mem gives 0<m/sqrt(x)<=2; H<=f since thick is a Finset
of the f infinite places, and both H,f positive. Therefore
  S/(a*f) = (m/sqrt(x))*(H/f)*(sqrt(x)*(A-Q))
          <= 4*z <= 4*B.
This remains valid when A-Q is negative; do not multiply a negative
upper bound by an upper estimate for a positive prefactor.
Thus the selected weak budget is obtained with K=1,C=4, exactly the
required exponent slack, the same P and the same S. No need to select
a different S for different x. The reverse direction uses the stronger
tolerance tau, NOT the endpoint at the same e. Neither direction is
an unconditional proof of the arithmetic count equation.

## Scope correction: do not silently drop the class
The actual native Parameters structure, Different.lean blob
44f64349db3642e89b752cc92979999edac5c185, requires d_congr, not merely
d%8=7 and M.Coprime d. RUN82 CountEscapeGrid only imposes those latter
two guards; the unrestricted set can be supported entirely on another
reduced residue class, e.g. 23 mod 18480. Dirichlet PNT gives that
class count ~ X/(phi(M) log X), which escapes every fixed exponent <1,
but none of those primes are admissible P. This is a counterexample to
a general COUNT-ONLY transfer by intersecting with the required class,
NOT a counterexample to the analytic endpoint estimate or to RH.
A reverse implication from the unrestricted CountEscapeGrid cannot
be justified merely by count monotonicity or the parameter constructor.
The class-restricted equivalence removes geometric record selection
from the sufficient endpoint criterion without an extra mathematical
assumption beyond the explicitly retained class and fixed-P tail.
It also identifies why further optimizing the selected budget is not
a strictly easier all-tolerance arithmetic target than ClassGrid.

Source blobs: New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41,
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65.
EditorSelectedRecord 03d0e2968201611d277835e99ac5f32361ca5f30,
RUN82 edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9. RUN85 constant-free
window transport 45f43a9e is compatible provided the class is retained
when comparing back to native records. No claim of transitive deletion.

## Executed checks and current replay obstruction
Local Python (exact Fraction), 18480 residue enumeration, 99 exponent
checks, 83160 signed scalar checks:
```python
from math import gcd
from fractions import Fraction as F
M=18480
allowed=[d for d in range(M) if (2*(d+1))%M==0 and (d+1)%M!=0]
wide=[d for d in range(M) if d%8==7 and gcd(d,M)==1]
assert allowed==[9239] and 23 in wide and 23 not in allowed
assert len(wide)==960
for j in range(1,100):
 e=F(j,10000); ep=e/4; tau=e/32
 assert 0<ep<F(1,100) and 2*ep==e/2 and 4*tau<ep and 1-2*tau/9>1-2*e/9
for m in [F(i,8) for i in range(8,17)]:
 for H in [F(i,8) for i in range(1,9)]:
  for z in range(1,12):
   for B in range(z,13):
    for A in [-2*z,-z,0,F(z,2),z]:
     for Q in [-z,0,z]:
      assert m*H*(A-Q)<=4*B
```
These are arithmetic/logic controls, not prime estimates or Lean tests.
Local lean and lake unavailable. Actual RUN99 status (state branch
compute/rh-compact-prime-count-budget-20261128/status.json,
blob 294e96059d7723a0ca2162d790ff0d7aeb5dea6b) is ERROR returncode 1,
run 46129085575, timestamp 09:36:01Z. Read actual outputs:
DepCountEscape82.log fdad789a55c6f91d705110f1255d566be6abd34f
has ambiguous names and sorryAx; IntegrationGuardedFinitePower.log
8b5208362be88e343ddab26c35c1712c16b426c3 has unsolved goals at line
142:78 and sorryAx in downstream declarations, but finite_power_scalar
reports standard axioms. Run94StarGrid.log db27056333f7cddc8cbc67c70e7576b76252f99a
reports standard axioms and guard marker for its four original statements;
no aggregate native PASS. Do not import a rejected object.
No native scan/prune/reduce/auto/frontier execution, no new graph
or root proof. Preserve all original/reduced graphs and evidence.

RESUME HERE: in the existing RUN99 repair workspace, fix the first
actual DepCountEscape82 ambiguity and recheck the selector with exact
names and standard axioms before staging the selected-record reverse
certificate; the arithmetic class-restricted endpoint estimate is
still open. Coordinate with dependency and prime lane, no duplicate
cold build, protected workflow or schedule changes.
HANDOFF TO dependency/prime/editor/integration. PARTIAL.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
namespace RHAuditSelectedReverse

theorem signed_reverse_scalar (m H A Q z B : ℝ)
    (hm0 : 0 ≤ m) (hm : m ≤ 2) (hH0 : 0 ≤ H) (hH : H ≤ 1)
    (hz : 0 ≤ z) (hzB : z ≤ B) (hA : A ≤ z) (hQ : -z ≤ Q) :
    m*H*(A-Q) ≤ 4*B := by
  have hmh0 : 0 ≤ m*H := mul_nonneg hm0 hH0
  have hmh : m*H ≤ 2 := calc
    m*H ≤ m*1 := mul_le_mul_of_nonneg_left hH hm0
    _ ≤ 2 := by simpa using hm
  have haq : A-Q ≤ 2*z := by linarith
  calc
    _ ≤ (m*H)*(2*z) := mul_le_mul_of_nonneg_left haq hmh0
    _ ≤ 2*(2*z) := mul_le_mul_of_nonneg_right hmh (by positivity)
    _ ≤ 4*B := by linarith

end RHAuditSelectedReverse

#print axioms RHAuditSelectedReverse.signed_reverse_scalar
open Lean in
run_cmd do
  let axs ← collectAxioms ``RHAuditSelectedReverse.signed_reverse_scalar
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "AUDIT_SELECTED_REVERSE nonstandard axiom {axs}"
