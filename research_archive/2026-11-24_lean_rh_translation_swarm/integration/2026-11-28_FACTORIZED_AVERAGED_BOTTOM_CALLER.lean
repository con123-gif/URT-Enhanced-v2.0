import Mathlib

/-!
# Integration — factorized averaged bottom at the actual weighted B3 caller
28 November 2026. SOURCE-MATCHED conditional human derivation; Lean helpers
PREPARED, not compiled. Credit Alpöge, Sernau, Anthropic collaborators and
Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 /
579ecc1cafdb28eae7d1c97565700c571dfa7484.

Reuse the averaged Fourier unrolling 3c19ec1b, convex sieve b4804e50,
common head/Gram audit 3751e66b, exact scale calibration bd496d07,
and 77c78c4f (separate uniform relaxed fixing route). Do NOT repeat the
common cofinality audit or relabel the per-vector bottom proof as an
averaged one. The new junction below identifies precisely which single
normalized LOCAL average must replace the old sharp bottom estimate.
No need to assume the same massRatio for different direction choices.

Sources read on compact pin:
* FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9:
  exists_intermediateGroup_one_prime (explicit H.map p), and
  exists_intermediateGroup_lines (Q, H Z exact Haar product identities).
* FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7:
  sum_blocks_le_topKernel and exists_finite_sieveSystem, last bottom
  calculation starting grw [ite_eq_left zero_le, ... massRatio ...].
* Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444;
  GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372;
  CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18;
  CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f
  energy_le_of_linkEnergy_le (actual factors (1+b^-4)^2 and b^-12).
Read AGENTS, SWARM, live mission and latest B/C/rank/math peers.

## 1. Exact ratio before taking any average
Fix the SAME global finite set of places T and filling level F supplied
by the common cutoff audit 3751e66b. Fix the ordering of the f chosen
places w_i and proper prefix length j<f. Local places are T intersect
{w_i,star w_i}, plus the complementary block. Choose their filling
levels consistently for every occurrence of that block. The actual
local intermediate subgroup for a direction v is H.map p as in
FixedLines, H the preimage of its native vectorFixer and p the
localization homomorphism. Its construction, containment and level
inclusions use the original hT and reduction hypotheses but not the
sharp shell estimate in the last numerical bound. The local block and
H depend only on the one selected place and direction, not on the
other prefix directions. On the complementary block use K itself.
Retain the full F.groupMeasure and F.floorZeroForm; do not restrict the
noncompact integral to the integral matrices.

Write M(G)=groupMeasure G, F0(G)=floorZeroForm G for a given block,
K the native full integral group. Define the local nonnegative ratio
  R_i(v) = [F0(Z_i(v))/M(Z_i(v))]/[F0(K_i)/M(K_i)].
All group masses are finite and strictly positive by compact openness;
F0(K)>0 follows from the source congruence integral lower bound
M(K)^2 M(congGroup). Use the existing finite upper bounds on F0;
we are not replacing the analytic finiteness or frequency estimates.
FixedLines H Z explicitly gives
  F0(Q Z) = |t.toReal|^2 t * prod_i F0(Z_i),
  M(Q Z) = t * prod_i M(Z_i)
with the SAME Haar factor for Q Z and Q K. It is finite positive
(by the mass formula and positive compact-open masses). Thus for the
global product subgroup at prefix tuple a, by cancellation BEFORE
estimating,
  [F0(Z_a)/M(Z_a)]/[F0(K)/M(K)] = prod_{i<=j} R_i(a_i).       (1)
The complement contributes exactly 1, even though its block changes
with j. The old native proof bounds each R_i by b^-6k; (1) itself
does not need that numerical bound.

The final bottom proof of FiniteSystem uses the normalized
massRatio=M(Z)/M(K) through the displayed ENNReal rearrangements.
Stop before rewriting by the sharp inequality hk from FixedLines.
Instead use (1) at that exact step, then retain the rest of the native
unconditioned K bound, yielding the candidate bottom field
  e_a = (1+b^-6) prod_{i<=j} R_i(a_i).
The archimedean band system, head/step integrability, PSD, continuity,
frequency and off-diagonal bounds do NOT change. This is a human
source-matched substitution to replay, not an elaborated replacement
for exists_finite_sieveSystem. No assumption of invariance of the
local phase under conjugation of different vector stabilizers.

## 2. Exact product of means, not mean of unnormalized kernels
Use the direction probabilities pi_i of 3c19ec1b (both dual sides and
all leading orders, padded to the full native frame). They are
nonnegative and sum to one. Put mu_i=sum_v pi_i(v) R_i(v).
For weights c_a=L^j prod pi_i(a_i), L=K_Fourier/(1-c_Fourier)
in that note, finite distributivity gives the exact weighted bottom
budget
  sum_{proper a} c_a e_a =
       (1+b^-6) S_mu,
  S_mu = sum_{j=0}^{f-1} L^j prod_{i=1}^j mu_i.              (2)
This removes the joint tuples from the bottom target, not from the
top subgroup containment or the native top packet proofs. In
particular averaging F0 and M separately before dividing is INVALID.
Only the normalized local ratios enter. No independence of group
elements or arithmetic places is assumed: the product measure is
only the deliberate finite choice of fixer directions.

## 3. One sufficient bottom guard and the same native empty moment
Write d=b^-4, u=b^-6, a=b^-9, v=b^-10, h=b^-6k,
E=mainEnergy>=0, P=sum_{j<f} L^j, A_h=sum_{j<f}(Lh)^j.
For the convex mixture use ebar=(1+u)S_mu/P, NOT (1+u)A_h/P.
The common top/Gram, global sieve and exact packet/r/nu normalization
of 3751e66b and bd496d07 give the weighted normalized link-energy
bound
  Wlink <= (1+u)(1+a) E [(1+u)(1+v)^f S_mu + v h^f P].      (3)
The additive frequency error still uses the ORIGINAL h^f P, not
a product of mu_i or the relaxed exponent. Since h^f P<=A_h and
Lh<=4b^-9 by 3c19ec1b, A_h<=1+d for b>=1000. The same scalar
calibration bd496d07 gives (1+u)(1+a)[(1+u)(1+v)^f+v]<=1+d.
Thus the SINGLE sufficient new arithmetic guard
  S_mu <= 1+b^-4                                           (4)
implies Wlink <= (1+d)^2 E.

For each proper tag use the original stable-pair crude estimate with
X=q^j, R=all links and C_a=h^j E (or the larger (1+d)h^j E of
b4804e50). All native tail and besselEnergy guards remain:
tailScale^20 besselEnergy<=h^j E and R omits no link. Summing gives
  AVGleft <= (1+d)^2 Wlink + d^3 A_h E
          <= [(1+d)^4+d^3(1+d)] E <= (1+8d) E.
The last inequality follows by expansion:
1+4d+6d^2+5d^3+2d^4 <=1+8d for 0<=d<=1/32.
The full-mask terminal bound remains the old separate crude estimate
in 3c19ec1b. Hence its unchanged unrolled Fourier inequality yields
the original (1+9b^-4)E empty-mask moment. Retain the separate
complement/central-trace estimates and all A/C/row positivity inputs.
No new final rank or height premise. Guard (4) must hold uniformly at
the actual cofinal choices of T, levels and local systems in the
common-cutoff proof (a cofinal family with all required integrality
also suffices); a numerical check at one T is not enough.

A concrete local sufficient condition for (4) is
  mu_i <= b^(-28k/5) for the proper prefix positions i<f.
Indeed q in [b^10,b^11], n<=b, r=k+2n-1, h_minor<=n,
K_Fourier <= n q^(n+r/2)/(q-1), 1-c_Fourier>=1/2 and
22n<=k/10 give L<=4n b^(11k/2+22n-10).
Multiplying by b^(-28k/5) gives L mu_i<=4b^-9.
Then S_mu<=sum_{j<f}(4b^-9)^j<=1+d. This is the exponent
relaxation in 157aec2c now at the AVERAGED NORMALIZED local bottom
interface, not a uniform assertion for every stabilizer. Guard (4)
also allows variable means; the individual inequalities are sufficient,
not necessary. Neither (4) nor these local average inequalities has
been established without the retained shell machinery. The fallback
native sharper shell estimate implies them, but that is not a new
dependency-free arithmetic proof. The central-trace and frequency
callers also still use shell bounds.

## 4. Verification and dependency boundary
Actual local CPython Fraction test: 49 exact assertions, including
one negative control for the invalid ratio-of-averages. This models
the finite product identities, not arithmetic Haar measures.
Reproducible calculation:
```python
from fractions import Fraction as Q
from itertools import product
from math import prod
p=[[Q(1,3),Q(2,3)],[Q(1,4),Q(1,4),Q(1,2)],[Q(2,5),Q(3,5)]]
Z=[[(Q(2),Q(4)),(Q(3),Q(12))],
   [(Q(4),Q(2)),(Q(1),Q(8)),(Q(3),Q(4))],
   [(Q(1),Q(2)),(Q(3),Q(8))]]
K=[(Q(6),Q(3)),(Q(5),Q(2)),(Q(4),Q(1))]
mu=[sum(w*(f/m)/(K[i][0]/K[i][1])
        for w,(f,m) in zip(p[i],Z[i])) for i in range(3)]
checks=0
for t in [Q(1,5),Q(1),Q(11,3)]:
 for j in range(4):
  S=Q(0)
  for a in product(*(range(len(p[i])) for i in range(j))):
   z=[Z[i][a[i]] if i<j else K[i] for i in range(3)]
   Fz=t**3*prod(x[0] for x in z); Mz=t*prod(x[1] for x in z)
   Fk=t**3*prod(x[0] for x in K); Mk=t*prod(x[1] for x in K)
   S+=prod(p[i][a[i]] for i in range(j))*(Fz/Mz)/(Fk/Mk)
  assert S==prod(mu[:j]);checks+=1
wrong=(sum(w*f for w,(f,m) in zip(p[0],Z[0]))/
       sum(w*m for w,(f,m) in zip(p[0],Z[0])))/(K[0][0]/K[0][1])
assert wrong!=mu[0];checks+=1
for b in (1000,1001,2000):
 d=Q(1,b**4);u=Q(1,b**6);a=Q(1,b**9);v=Q(1,b**10)
 for f in (1,2,7,15):
  assert (1+u)*(1+a)*((1+u)*(1+v)**f+v)<=1+d;checks+=1
  assert (1+d)**4+d**3*(1+d)<=1+8*d;checks+=1
  assert sum((4*a)**i for i in range(f))<=1+d;checks+=1
print(checks)
```
Local lean/lake/elan PATH absent. Shared registered convex-leaf
queue f2f9ff47 status.json and outputs/convex_receipt.json both
returned 404; no verdict, no duplicate queue. A2 accepted leaf
receipt 492e6c7c2590f849ba59eae6f11517b646d72f44 remains scoped to
chosen-level freeness. No new native rh_scan/prune/reduce/auto/frontier,
axiom or graph execution. Existing graph and original proofs preserved.
Candidate path: explicit local groups -> exact Haar ratio (1) ->
weighted scalar (2) -> retained normalized top/convex sieve (3) ->
crude estimate -> averaged moment -> original filling caller.
Unresolved arithmetic (4), normalized bottom caller and all native
replacement audits remain. No global supplier removed.

RESUME HERE: after inspecting the already queued RUN100 convex-leaf
receipt, extract the actual FixedLines product construction with
its last sharp bound replaced by equality (1), and substitute
e_a in FiniteSystem.norm_bot_le in the retained compact workspace.
Check actual original/reduced caller graphs, including frequency
and central trace dependencies; use existing replay rather than a
duplicate cold build. HANDOFF integration / positivity / Landau / audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false

namespace RHIntegrationAveragedBottom

/-- Scalar cancellation in the exact Haar product formula. -/
theorem haar_ratio_cancel (t Fz Mz Fk Mk : ℝ)
    (ht : t ≠ 0) (hMz : Mz ≠ 0) (hFk : Fk ≠ 0) (hMk : Mk ≠ 0) :
    ((t^3 * Fz) / (t * Mz)) / ((t^3 * Fk) / (t * Mk)) =
      (Fz / Mz) / (Fk / Mk) := by
  field_simp [ht, hMz, hFk, hMk] <;> ring

/-- The coefficient budget for the crude-energy caller, with its
    actual squared prefactor and separate cubic error. -/
theorem crude_budget (d E w A avg : ℝ)
    (hd : 0 ≤ d) (hdsmall : d ≤ 1/32) (hE : 0 ≤ E)
    (hw : w ≤ (1+d)^2*E) (hA : A ≤ (1+d)*E)
    (havg : avg ≤ (1+d)^2*w+d^3*A) :
    avg ≤ (1+8*d)*E := by
  have h2 : d^2 ≤ d/32 := by nlinarith [mul_nonneg hd (sub_nonneg.mpr hdsmall)]
  have h3 : d^3 ≤ d^2/32 := by
    nlinarith [mul_nonneg (sq_nonneg d) (sub_nonneg.mpr hdsmall)]
  have h4 : d^4 ≤ d^3/32 := by
    nlinarith [mul_nonneg (pow_nonneg hd 3) (sub_nonneg.mpr hdsmall)]
  have hpoly : (1+d)^4+d^3*(1+d) ≤ 1+8*d := by
    nlinarith only [hd,h2,h3,h4]
  calc
    avg ≤ (1+d)^2*w+d^3*A := havg
    _ ≤ (1+d)^2*((1+d)^2*E)+d^3*((1+d)*E) :=
      add_le_add (mul_le_mul_of_nonneg_left hw (sq_nonneg _))
        (mul_le_mul_of_nonneg_left hA (pow_nonneg hd _))
    _ = ((1+d)^4+d^3*(1+d))*E := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right hpoly hE

#print axioms haar_ratio_cancel
#print axioms crude_budget

end RHIntegrationAveragedBottom
