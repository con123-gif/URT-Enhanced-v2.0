import New.Columns.MarkedPrimeType
import Mathlib.Tactic

/-!
# RUN77 — residue-only marked Hecke pullback and exact letter orientation
27 November 2026. HUMAN SOURCE-MATCHED reduction, pending independent audit
and native replacement replay. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, main head
confirmed unchanged. Mission blob a69122b6ad568910a45d2bc13961ab9da4855143
including mandatory engine read; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION and continuity consulted. Resume theta RUN76 5b49b9ab.
Peers kernel RUN50 7e6fe010 (masked determinant), RUN36 46483cc0
(actual pairing assembly), acceleration 4a597803 (CM sections),
integration 847ff2e5 (exchange), and Landau 0a9f1882 checked for scope.
Do not duplicate their pairing, depth or CM work. Their separate
count/projector prerequisites are not discharged here.

Actual source ledger (compact grh-compact/src):
* New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  Columns.hasType_markOperator lines 146-239, hP 164, hD 178,
  delta 184, hgamma 189, generic elementary divisor call 200,
  injection 209, Hecke pullback 218, letter factors 224,
  global representative choice 236-239.
* New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8:
  IsMarked.hasType_markOperator (actual construction of T, hc, hA).
* New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144:
  twoBlock, letterMatrix, letterRep, deepIndicator, diagonal_pow_depth.
* New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307:
  hasType_twisted_hecke, hs and hY.
* Lib/Adelic/Hecke/HeckeBasic.lean d166991c495c40b0b5c2280a8822bcbb6806f41b:
  heckeFun_eq_sum_pullback (support coverage + exact coset equivalence).
* RUN76 retained geometric unramified pairing; this run instead addresses
  the separate marked-column supplier (not the unramified Weil transfer).

## 1. One-sided integrality suffices for the actual parahoric hP

At the actual marked place l, let W be the valuation ring of E at l,
O_l its completed valuation ring, K_l=GL_k(O_l), r=ceilLogM p,
d=diag(p I_r,I_(k-r)), and P the preimage of the lower-block
parabolic modulo the maximal ideal (twoBlock k r). Retain the actual
local split identification, valuation_p hypothesis (p generates the
maximal ideal), and reindexing q. For beta in GL_k(W), write
beta=[[A,B],[C,D]]. Then
  d^-1 beta d = [[A,p^-1 B],[p C,D]].
All its entries are integral iff B lies in p O_l, equivalently in
p W by the valuation comparison. Its determinant is det(beta), a
unit already. Therefore if its entries are integral, the inverse is
integral by the adjugate formula. No second independent inverse
integrality estimate is needed. This proves hP at this caller, with
the correct upper-right block (not the lower-left). Conversely K_l
membership forces the same condition. All r, including empty blocks,
are covered by this entrywise calculation.

## 2. Weaken support coverage to a single residue-field lift

For each actual class representative x, rho_x,l is in K_l from the
retained exists_reps_integralAbove choice. The Hecke support at l is
K_l d K_l by hD; the map used in heckeFun_eq_sum_pullback is
  delta_x(beta)=rho_x,l^-1 beta d.
For beta,beta' in GL_k(W),
  delta_x(beta)^-1 delta_x(beta')=d^-1 beta^-1 beta' d.
Hence exact coset equivalence holds by section 1.

Now take ANY h=k1 d k2 in that local support. The standard residue
isomorphism W/pW ~= O_l/pO_l follows from completion at l; all
elements of GL_k(O_l/pO_l) lift to GL_k(W) because arbitrary lifts
of the entries have determinant nonzero modulo p, hence unit.
Choose beta with reduction equal to rho_x,l k1. This single lift
gives C=beta^-1 rho_x,l k1 in the first congruence subgroup of K_l.
In particular C lies in the completed P_l, so d^-1 C d in K_l.
The decisive identity is
  delta_x(beta)^-1 h = d^-1 C d k2 in K_l.                 (1)
Thus every supporting coset is hit. This only needs local residue
surjectivity and integral representatives, not a fresh global
rational approximation for each double-coset element. In the
native line 237 the theorem exists_mul_mem_integralAbove is invoked
for exactly this support coverage. Section 2 supplies a candidate
replacement at that invocation, not a deletion of every other
consumer of the global theorem. No use of density at arbitrarily
many places, nor any assumption that GL_k(W)=K_l. Residue-field
finiteness is retained for the finite quotient sum.

## 3. The exact source-coset injection, before counting

Use the native class decomposition G(b), where b=(x,beta P),
with representative beta. Denote its source class by o_b and its
rational element by gamma_b. In the l coordinates hgamma is
  gamma_b=beta d g_b, with g_b in GL_k(W).
The generic elementary-divisor theorem is called with g_b^-1,
so its required injection hs is the map
  b -> (o_b, g_b^T P).
Suppose two outputs coincide. Then g_b'^T=g_b^T t, t in P.
Consequently
  gamma_b gamma_b'^-1
    = beta d t^-T d^-1 beta'^-1
    = beta (d^-1 t d)^-T beta'^-1 in K_l.                 (2)
This orientation is essential: replacing t by t^T without
inversion in this step reverses the group relation. At the conjugate
place use the native inverse-transpose unitary condition; at every
other place the G(b) decomposition gives the original level
condition (the source class o_b=o_b' cancels). Retain the same
global rational class-representative uniqueness and trivial
class automorphism premise classAut_columnLevel_eq_bot, exactly as
in eq_and_eq_one_of_doubleCoset_rep at line 209. With the local
maxCompactAt_le_columnLevel condition at l, this implies x=x'
and gamma_b=gamma_b'. Then
  d^-1 beta'^-1 beta d = g_b' g_b^-1 in K_l,
so beta'^-1 beta lies in P by section 1 and b=b'. The actual
hs follows. Since source and target are finite copies of X times
the same quotient, injectivity supplies surjectivity used by
exists_depth_factorization. No cardinal estimate, uniform
distribution or extra freeness assumption was substituted.
The global decomposition and class uniqueness are retained;
this is not a new proof of those primitives.

## 4. Mark normalization before symmetric powers

For each marked letter s, native letterMatrix is iota_s(g) if
even, iota_s(g^-T) if odd. Put
  D_s=diag(p^(deepIndicator(r,i,s))) =
    p d^-1 for even s, d for odd s.
Let A_s be the matrix of Phi_tau(conj gamma_b) at letter s,
in the fixed q coordinates. The actual hc and unitary identity
give A_s=iota_s(gamma_b^-T) for even s, and
A_s=iota_s(gamma_b) for odd s. Thus by hgamma:
  p A_s^T = iota_s(g_b^-1) (p d^-1) iota_s(beta^-1)
        = letterMatrix_s(g_b^-1) D_s letterMatrix_s(beta^-1)
        (even),
  A_s^T = iota_s(g_b^T) d iota_s(beta^T)
        = letterMatrix_s(g_b^-1) D_s letterMatrix_s(beta^-1)
        (odd).                                             (3)
All ring maps send the rational integer p to p; no p-adic norm
taken here. The even identity uses p times the inverse diagonal
exactly, not an extra p-adic denominator. Each homogeneous
degree-a one-row Schur factor takes a scalar p to p^a. The
native hA gives markExponent l=a*#even, so the scalar on the
whole marked operator is precisely the product of those p^a
factors; no leftover p-power and no uniform bound on A_s needed.

Apply the original one-row Schur coordinate isomorphism hpsi
(chosen at line 174), the native action on dual/column values
and the coefficient-index convention in line 224. Equation
(3) is the exact letter matrix identity used there, before
taking symmetric powers and products. In particular do NOT
assert symPow(A^T)=symPow(A)^T in an arbitrary monomial basis:
that generally requires a diagonal weighting. The actual
source hY uses entry (input j,output i) of the product, not a
Hermitian transpose. Multiplicativity of symPow, tensor
multiplicativity and diagonal_pow_depth yield the marked
operator factor
  letterRep(g_b^-1) diag(p^depth) letterRep(beta^-1)
in that convention. The unmarked factors are the integral
invertible matrices m from line 194 (or identity in weight
zero); retain their integral-place argument. Then the finite
sum furnished by (1) with these factors is the actual hY
used in hasType_twisted_hecke, conditional on the cited
coordinate and class decomposition facts. RUN36 and RUN50
supply the generic determinant assembly; do not redo it.

## 5. Evidence and remaining obligations

Human reduction: exact local pullback geometry and orientation
at the actual marked Hecke caller; the meaningful premise
weakening is replacement of global support-lift invocation
by residue surjectivity in (1). Original graph remains:
integral class reps / global decomposition / global lift /
local parahoric / one-row Schur / generic elementary divisor
theorem -> Columns.hasType_markOperator -> IsMarked.hasType_markOperator
-> LocalStatement marked gauge -> Theorem A.
Candidate reduced human graph: same except the support-lift
edge at lines 236-239 replaced by the residue lift + hP bridge.
Inverse-integrality subcheck follows from det-unit. No removal
from native elaborated graph until replay; preserve original,
reduced graph, axioms and other shared consumers. Remaining
foundations include class rep/decomposition/freeness, the
Schur coordinate theorem, the Frobenius cycle and HeckeSizes
suppliers of MarkedPrimeType, generic count/projector inputs,
unramified pairing and remaining A/B/C primitives. No weighted
prime window inequality newly proved. RH remains OPEN.

Exact local regression executed in Python Fraction arithmetic
(p=3,k=2,r=1): all 3888 matrices with entries 0..8 and unit
determinant checked for conjugate-entry integrality iff upper
right divisible by 3, also for inverse integrality. 2916
negative cases. Every 37th such matrix used as beta,g in
11236 ordered pairs; both identities (3) checked exactly;
11102 fail the deliberately reversed even multiplication
order. These are illustrative local identity controls, NOT
tests of the actual global class/Hecke data or a finite-to-
infinite argument. Reproduce by enumerating the 9^4 matrices
lexicographically, filtering det not divisible by 3, then
using rational matrix inverse and d=diag(3,1) with the
formulae above. No simulated RH evidence.

Local command -v lean/lake returned neither. Native certificates
below PREPARED only. CI state receipts checked: 45577239749
and 45576756833 status pass (earlier conditional root/engine);
compact 45803534769 actual status error (5147.99s, targeted
checks failed or not reached), blob a56e2d3afb99ed8275e81fd63c8494306e57c43f.
No fresh native PASS or rh_scan/prune/reduce/auto/frontier
execution on compact. No assertion of Lean proof completion.
Context key: compact pin, D,L,l,p,r,q,W,O_l,P,rho,x,beta,g,
T, parity and fixed Schur coordinates.

RESUME HERE: audit residue lift against the exact local source
valuation/level conditions; replay (1)-(3) and hY at
Columns.hasType_markOperator if compact cache is available.
Next source leaf is MarkedPrimeType's cyclic Frobenius residue
congruence, exact order/alternating cardinality and HeckeSizes
at its actual constructor; inspect peer results before deriving.
Retain unramified Weil pairing and all other unsolved obligations.
HANDOFF TO kernel, integration/editor, audit, acceleration.
-/

namespace ThetaRun77

-- Exact group cancellation in local support coverage.
theorem support_pullback {G : Type*} [Group G] (rho beta d k1 k2 : G) :
    (rho⁻¹ * beta * d)⁻¹ * (k1 * d * k2) =
      d⁻¹ * (beta⁻¹ * rho * k1) * d * k2 := by group

theorem coset_pullback {G : Type*} [Group G] (rho beta beta' d : G) :
    (rho⁻¹ * beta * d)⁻¹ * (rho⁻¹ * beta' * d) =
      d⁻¹ * (beta⁻¹ * beta') * d := by group

theorem source_inverse {G : Type*} [Group G] (beta d g : G) :
    (beta * d * g)⁻¹ = g⁻¹ * d⁻¹ * beta⁻¹ := by group

theorem recover_parahoric {G : Type*} [Group G] (beta beta' d g g' : G)
    (h : beta * d * g = beta' * d * g') :
    d⁻¹ * beta'⁻¹ * beta * d = g' * g⁻¹ := by
  calc
    d⁻¹ * beta'⁻¹ * beta * d =
        d⁻¹ * beta'⁻¹ * (beta * d * g) * g⁻¹ := by group
    _ = g' * g⁻¹ := by rw [h]; group

theorem mark_scale {R : Type*} [CommMonoid R] (p : R) (a n : ℕ) :
    (p ^ a) ^ n = p ^ (a*n) := by rw [pow_mul]

#print axioms support_pullback
#print axioms coset_pullback
#print axioms source_inverse
#print axioms recover_parahoric
#print axioms mark_scale
end ThetaRun77

#check heckeFun_eq_sum_pullback
#check Columns.hasType_markOperator
#check Data.IsMarked.hasType_markOperator
#check TwistingData.hasType_twisted_hecke
#check TwistingData.diagonal_pow_depth
#print axioms Columns.hasType_markOperator
#print axioms Data.IsMarked.hasType_markOperator
