import Development.AutomorphicArithmetic.MeanSquareBounds.BadShare
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — lane 13, 25 Nov 2026. Human source-matched replacement for
the maximal mean-square branch, with scalar/actual-S caller certificate
PREPARED, NOT COMPILED. RH OPEN.

Preflight: latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
live manuscript 464e82f81f646d4af85e1f5f70d379026df46261, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
continuity 61459cfddab270c187cf628ed60b84749d290a0c, research protocol
ca67d897ba247a6bac1d0f7bc5ff37bb3bf2e461, handoff and state inspected.
Peers 141537e1 (Landau), b158e108 (Gram), 46b28d29 (unit page),
3003c0aa (slice) inspected. Distinct from own 5de8466b pair selection.
Source pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Paths below relative to
src/Development/AutomorphicArithmetic/MeanSquareBounds/:
BadShare.lean 5cd176ccccf4c232a31c6f852536aa579320d4d3,
StagePow.lean 2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7,
PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8,
Stage1Succ.lean 79f79fe71e41f403a4d22e5b86540410748ac7c3,
CharOf.lean 3eeed8077330efa249cde313d99d89a7c09d8ba6,
PairShare.lean 712579c16be75074705a2c5c00f69e2f5d835cf9.

EDITOR BLOCK (one paragraph, exact original bad_share interface):
Fix C>=0, tau>0, Y>=2, X>=Y, finite P and |kappa(n)|<=1.
Let S_q(v)=sum_{1<=n<=floor Z} Lambda(n) kappa(n) Jacobi(n,q)
min(1,v/n), and D_q(v)=sum_{v<n<=floor Z} Lambda(n) kappa(n)
Jacobi(n,q)/n. These are EXACTLY S and bsD of the native BadShare;
S_q(w)-S_q(Y)=integral_Y^w D_q(v)dv (piecewise linear).
The native bs_mul_D_eq_S masks kappa by n>v, so the original MeanSq
hypothesis gives sum_P |D_q(v)|^2 <= C |P| log(v)/v on [Y,X].
For any q-dependent witness w_q in [Y,X], triangle and Cauchy-Schwarz
give |S_q(w)|^2 <= 2|S_q(Y)|^2 + 2(w-Y) integral_Y^w |D_q(v)|^2 dv.
Divide by w^(1+2tau) BEFORE bounding the integrals. Since w>=Y,
w-Y<=w and w>=v on the integration interval, we obtain
 |S_q(w)|^2 / w^(1+2tau)
 <= 2|S_q(Y)|^2/Y^(1+2tau)
    + 2 integral_Y^X v^(-2tau)|D_q(v)|^2 dv.
Sum over any B subset P, extend the nonnegative terms to P, and
use MeanSq at Y and the masked MeanSq above. Thus
 sum_B |S_q(w_q)|^2/w_q^(1+2tau)
 <= 2 C |P| [Y^(-2tau) log Y + integral_Y^X log(v) v^(-1-2tau)dv]
 <= 2 C |P| (1/tau+1/tau^2) Y^(-tau),
using log(v)<=v^tau/tau and integrating v^(-1-tau) directly.
Each bad witness contributes >1/4. Consequently
 |B| <= 8 C (1/tau+1/tau^2) Y^(-tau) |P|.
Choose Y0 large enough that the coefficient is <= eta, independent
of X,Z,P,B,kappa; X<Y forces B empty. This preserves every
quantifier of QH.bad_share; no modulus-one simplification of the
auxiliary family and no assumption of RH. It replaces the dyadic
decomposition, bs_block, bs_markov and infinite geometric-series
summation; keep the piecewise-linear FTC, masked mean-square and
Cauchy-Schwarz. The use of arbitrary witness scales does NOT permit
a q-dependent mask in MeanSq: the mask at each integration variable
v is COMMON to every q. This is crucial.

Graph delta (source-visible local, not elaborated reachability):
Original stage -> bad_share -> {bs_markov, geometric sum}
bs_markov -> bs_block -> {bs_normSq_S_le, bs_sum_D_le};
bs_normSq_S_le -> {bs_S_sub_S, bs_sq_integral_le}.
Proposed stage -> bad_share_global -> {global witness bound,
bs_S_sub_S, bs_sq_integral_le, bs_sum_D_le, elementary power integral}.
Native actual stage retains box_of_S, meanSqK, count_bad, count_a,
primitive twist and ind_unique. No global deletion claim. Existing
full role graph and original source untouched; no new axiom evidence.
The code below checks scalar normalization and the actual witness
count consumer, conditional on the explicit global energy supplier.
Formal integration of that supplier is OPEN, not silently assumed.

Executed locally: rational algebra controls with actual prime powers
n<=20 (12), 15 actual primes q>400, q=3 mod 8, two coefficient masks
(trivial and real mod 4), tau=1,2,3, Y=2, X=16, 29 half-step witnesses.
2610 inequalities passed with exact fractions; coefficients use unit
weights on prime powers (not numerical von Mangoldt tests). This is
only a check of the homogeneous algebra, not the analytic hypothesis.
Reproduce with Python stdlib fractions + sympy:
 N=20; Y=F(2); X=F(16)
 Q=[q for q in s.primerange(401,700) if q%8==3]
 ns=[n for n in range(2,21) if len(s.factorint(n))==1]
 for q in Q:
   for p0 in (1,3):
     c={n:F(int(s.legendre_symbol(n,q)))*(1 if p0==1 else
       (0 if n%2==0 else (-1)**((n-1)//2))) for n in ns}
     S=lambda t:sum(a*min(F(1),t/n) for n,a in c.items())
     D=lambda t:sum(a/n for n,a in c.items() if t<n)
     for tau in (1,2,3):
       E=sum(D(F(v))**2*(F(v)**(1-2*tau)-F(v+1)**(1-2*tau))/
         (2*tau-1) for v in range(2,16))
       for k in range(4,33):
         w=F(k,2)
         assert S(w)**2/w**(1+2*tau)<=2*S(Y)**2/Y**(1+2*tau)+2*E
Local lean/lake absent. Original job statuses fetched:
45577239749 success, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 success, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Conditional root has propext, Classical.choice, Quot.sound; bounded
scan has 324 pending. Neither job verifies this new file.
Failed retrievals: GoodQ.lean and GoodD.lean not separate source files;
definitions found in PrimeSetTwoBounds.lean. EXPANSION_PLAN.md 404.
No URT comparison asserted: direct weighting removes the partition.
Context cache key: source pin, bad_share, (C,tau,Y,X,Z,P,B,kappa);
witness-dependent masks forbidden. Original dependency graph remains.
RESUME HERE: copy the three private native FTC/CS/masked-energy helpers
into a new namespace or expose checked bridges, kernel-check the
weighted integral supplier and substitute at StagePow.stage.
HANDOFF TO audit/kernel/integration: check exact weight v^(-2tau)
and all witness quantifiers, then include the editor paragraph.
-/

namespace QH
open Finset

theorem normalized_energy_scalar13 (a b p q r s : ℝ)
    (hp : 0 < p) (hq : 0 < q) (hqp : q ≤ p)
    (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hr : 0 ≤ r) (hbr : b ≤ p*r)
    (hs : r ≤ s) :
    (2*a+2*b)/p ≤ 2*a/q+2*s := by
  have h1 : a/p ≤ a/q := by
    apply (div_le_div_iff₀ hp hq).2
    exact mul_le_mul_of_nonneg_left hqp ha
  have h2 : b/p ≤ r := (div_le_iff₀ hp).2 (by simpa [mul_comm] using hbr)
  rw [add_div, mul_div_assoc, mul_div_assoc]
  linarith

-- Actual S, actual bad witnesses: no synthetic graph or RH assumption.
-- This bridge isolates the only new native integration obligation.
theorem bad_share_from_witness_budget13 (Y X Z eta : ℝ)
    (P B : Finset ℕ) (kappa : ℕ → ℂ) (tau : ℝ)
    (hY : 0 < Y)
    (hB : ∀ q ∈ B, ∃ y ∈ Set.Icc Y X,
      y ^ (1/2+tau) / 2 < ‖S Z y q kappa‖)
    (hbudget : ∀ w : ℕ → ℝ, (∀ q ∈ B, w q ∈ Set.Icc Y X) →
      ∑ q ∈ B, (‖S Z (w q) q kappa‖ / (w q)^(1/2+tau))^2
        ≤ eta * (P.card : ℝ) / 4) :
    (B.card : ℝ) ≤ eta * P.card := by
  classical
  have hex : ∀ q : ℕ, ∃ w : ℝ, q ∈ B →
      w ∈ Set.Icc Y X ∧ w^(1/2+tau)/2 < ‖S Z w q kappa‖ := by
    intro q
    by_cases hq : q ∈ B
    · obtain ⟨w,hw,hs⟩ := hB q hq
      exact ⟨w,fun _ => ⟨hw,hs⟩⟩
    · exact ⟨Y,fun h => (hq h).elim⟩
  choose w hw using hex
  have hupper := hbudget w (fun q hq => (hw q hq).1)
  have hlower : (B.card : ℝ) * (1/4) ≤
      ∑ q ∈ B, (‖S Z (w q) q kappa‖ / (w q)^(1/2+tau))^2 := by
    rw [← nsmul_eq_mul]
    refine Finset.card_nsmul_le_sum _ _ _ (fun q hq => ?_)
    have hp : 0 < (w q)^(1/2+tau) :=
      Real.rpow_pos_of_pos (lt_of_lt_of_le hY (hw q hq).1.1) _
    have hs : (1/2:ℝ) ≤ ‖S Z (w q) q kappa‖ / (w q)^(1/2+tau) := by
      apply (le_div_iff₀ hp).2
      linarith [(hw q hq).2]
    nlinarith [sq_nonneg (‖S Z (w q) q kappa‖ / (w q)^(1/2+tau) - 1/2)]
  first | rh_reduce 2 using [] | linarith

-- Test automated search on the actual scalar consequence.
theorem bad_share_budget_auto13 (b p eta : ℝ) (h : b/4 ≤ eta*p/4) :
    b ≤ eta*p := by
  first | rh_auto 2 | linarith

theorem bad_share_budget_frontier13 (b p eta : ℝ) (h : b/4 ≤ eta*p/4) :
    b ≤ eta*p := by
  rh_auto_frontier 2
  all_goals linarith

end QH

rh_scan QH.bad_share limit 2000
rh_scan QH.bad_share_from_witness_budget13 limit 2000
rh_prune QH.bad_share_from_witness_budget13 as RH13BadShareWitnessPruned
#print axioms QH.bad_share
#print axioms QH.normalized_energy_scalar13
#print axioms QH.bad_share_from_witness_budget13
