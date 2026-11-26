import New.Endgame.OneSidedCriterion
import Statements

/-!
# Compact RUN51 — prime-only Landau bridge and common witness
26 November 2026. Human mathematical derivation and source-level conditional
adapter, PREPARED (uncompiled). Primary source lsernau/grh-lean at
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742, latest expanded-workload
and compact migration instructions, unified reduction section read.
Read protocol, AGENTS, handoff, expansion, current manuscript sections 6a-c,
recent peer ef865994 (RUN53 prime-power tail), 15c60307 (fixed-scale adapter),
4f4bf8eb (residue audit), 20a967d4 (analytic endgame), d18891b2 (odd-Sha).
No repetition of already integrated second-scale selection, no URT detour.

Source ledger:
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2:
lambdaClass, logDerivMean, primeError, isPolar_primeError.
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3:
entireL_ne_zero_of_primeError_le.
Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9:
IsPolar.landau, entireL_ne_zero.
Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11:
zero_density_quadTwist, exists_entireL_quadTwist_ne_zero.
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
eventually_primeError_le_rpow, New.grh, New.zeta_zeros_on_line.
Statements.lean 1cd1bce93344065936b2b392b23306254e0785ef.
Do not import New.Main or Main.

1. Close the prime-only-to-Landau interface of peer RUN53.
Fix M=18480 and prime d=9239 mod M (or any fixed M and allowed d).
Let c_n be the actual lambdaClass(d,M,n) at proper prime powers, zero
otherwise. All c_n are nonnegative. At unramified primes only odd powers
k>=3 can contribute; at the ramified prime d include every k>=2.
The elementary bound A(y)=sum_(n<=y)c_n = O(y^(1/3) log^2 y), uniformly
in M,d, follows by counting possible bases <=y^(1/3), exponents <=log_2 y,
weights <=2 log y, and separately the ramified total <=log y.
This independently checks the peer tail estimate. In particular C(s)
= sum c_n n^(-s) is absolutely and locally normally convergent in
Re s>1/3 by partial summation, and H=C(1) exists.
Define P(x) as the genuine-prime-only ramp sum minus log(x)/phi(M)
minus (Re logDerivMean(d,M,1)-H). Then exactly
  P(x)=R_M(x)+T(x),
  T(x)=sum c_n min(1/n,1/x)=int_x^infty A(y)dy/y^2>=0
for x>=1. This is the mandatory centering correction; dropping it does
not yield an equivalent criterion.
In particular T(x)=O(x^(-2/3)log^2 x) as x->infinity.

2. Exact continuation for the correction; all zero orders preserved.
For Re s>1, interchange the sum and integral (absolute convergence).
For each n>=2 integrate min(1/n,1/x)x^(-s) over [1,n] and [n,infinity]:
  integral = 1/[n(s-1)] - n^(-s)/[s(s-1)].
Consequently
  int_1^infty T(x)x^(-s) dx = (H-C(s)/s)/(s-1).
The integral is holomorphic throughout Re s>1/3: on each compact subset
use the uniform integrable majorant from T(x)=O(x^(-2/3)log^2 x);
derivatives only add powers of log x. The right expression continues
there with removable value H-C'(1) at s=1. Hence the prime-only transform
has EXACTLY the same residues as the native transform on Re s>1/2.
The pole at 1 stays removable. No extra poles are introduced by the
normalization, including at a hypothetical real off-line zero.
For the actual consumer it is even shorter to use R_M<=P directly, so
the native IsPolar and Landau theorem apply without building a new
IsPolar package on the larger half-plane.

3. One common good auxiliary prime is enough; exceptional d allowed.
For each fixed 1/2<beta<1 suppose the subset G_beta of primes d=9239 mod
18480 for which P_d(x)<=x^(beta-1) eventually satisfies
  sum_(d in G_beta) 1/d = infinity.
This replaces the previous universal-in-d arithmetic premise by a
strictly weaker sufficient condition on a subfamily; thresholds and
the subset may depend on beta. In particular all but finitely many
primes, or any positive relative-density subfamily, suffice.
For an alleged zeta zero rho with beta<Re rho<1, set Y=|Im rho|.
For each character xi mod M the actual zero_density_quadTwist gives
O(X^(1-eta/2)) bad primes, where 0<9eta<min(1,beta-1/2). Finitely many
characters share the same fixed M. The union B of their bad primes has
convergent reciprocal sum: on [2^j,2^(j+1)) the sum is
O(2^(-j eta/2)). Therefore G_beta is NOT contained in B and one common
d belongs to G_beta minus B. No selection of different primes for
different characters, no assumption that an arbitrary fixed d is good.
All d in the class satisfy d=7 mod 8 and gcd(d,M)=1, since 8|M and
9239^2=1 mod M. This d is fixed BEFORE taking the eventual x bound.
No uniform threshold over d needed.

4. Actual consumer and full analytic implication.
For that d, R_M(x)<=P_d(x)<=x^(beta-1) eventually. In the native polar
residue formula all twisted orders vanish at rho and at each real
r in (beta,1). All untwisted orders are nonnegative; at real r the
denominator phi(M)r(1-r)>0. At r>=1 there are no poles. Thus
IsPolar.landau forces residue zero at rho. Yet the induced principal
character mod M has L(s,1_M)=zeta(s)prod_(p|M)(1-p^(-s)), with all
Euler factors nonzero for Re s>0, and rho!=1. Its entireL zero order is
positive, so the exact contradiction is
  0 = sum_xi ord_rho entireL(xi) / [phi(M) rho(1-rho)] != 0.
The standard functional equation and unconditional nonvanishing for
Re>=1 then give RH. This is a rigorous sufficient criterion, NOT a
proof of the prime estimate on G_beta. With the actual star/DataExist
route, universal fixed-d R bounds follow as before; the O(x^-2/3 log^2 x)
tail is absorbed by choosing beta' strictly between 1/2 and beta.
The converse transfer P<=bound -> R<=bound needs no slack. Thus the
prime-only route does not alter the star inequality or its witnesses.
Do not replace eventual x bounds by isolated sparse windows without a
separate proved transfer.

Original selected source graph:
Main -> New.grh -> eventual_primeError + entireL_ne_zero_of_primeError_le
 -> isPolar_primeError + exists_entireL_quadTwist_ne_zero + IsPolar.landau.
Reduced human graph:
same root and analytic data, but selected good d from harmonic-divergent
G_beta and summable bad set; one-d Landau adapter below with P>=R.
All original graphs, A/B/C, DataExist, same-witness constraints, pending
source/kernel dependencies and old axiom evidence preserved. For actual
universal-d arithmetic path retain native criterion as fallback.
No unconditional proof of a new prime bound or global graph deletion.

Execution: retrieved actual pinned bodies and current peers; hand checked
the above absolute convergence, residue, and harmonic-sum arguments.
Local lean/lake absent. Read actual CI status JSON: original engine runs
45577239749 and 45576756833 status pass/returncode 0 (old pin only);
compact run 45781154005 status error/returncode 1 RESOURCE_BLOCKED.
No native scan/prune/auto or certificate replay on compact toolchain;
no new #print axioms evidence. The following executable candidate copies
the actual local Landau body after witness selection, retaining every
nonvanishing and positivity guard. The human proof of the harmonic
selection and tail identity is not formalized by this candidate.
RESUME HERE: replay the one-d native bridge in shared compact environment;
integrate prime-only tail and the fixed-d quantifier order with RUN53,
then focus remaining human work on actual A/B/C suppliers rather than
more sufficient endpoint inequalities. If native runner still blocked,
retain source theorem as fallback and do not report native PASS.
HANDOFF TO integration, prime-window, audit, kernel, editor.
-/

open Complex Filter Nat Real Set MeasureTheory Topology

namespace CompactLandauRun51

/-- The actual local analytic consumer after selecting a single common d. -/
lemma entireL_ne_zero_of_one_good_prime {M : ℕ} [NeZero M]
    {β : ℝ} (hβ : 1 / 2 < β) (d : Primes)
    (hd : d.1 % 8 = 7 ∧ M.Coprime d)
    (hR : ∀ᶠ x in atTop, primeError d M x ≤ x ^ (β - 1))
    (ρ : ℂ) (hρ : β < ρ.re) (χ : DirichletCharacter ℂ M)
    (hZ : ∀ ξ s, β ≤ re s → |im s| ≤ |ρ.im| →
      entireL (@quadTwist M ξ d _) s ≠ 0) :
    entireL χ ρ ≠ 0 := by
  use by_cases (entireL_ne_zero χ) (flip ?_ ((hd.elim isPolar_primeError).landau
    (by bound) (le_total · 1 |>.rec ?_ ?_)
    (.mono (tendsto_exp_atTop hR) (by simp [exp_mul, mul_comm])) hρ))
  <;> simp +contextual (maxDischargeDepth := 3) [le_of_lt, div_re,
    (tendsto_sub_mul_logDeriv_entireL _).1.2, *, normSq, entireL_ne_zero,
    (hβ.trans hρ).trans', ← cast_sum, tendsto_sub_mul_logDeriv_entireL,
    ne_of_apply_ne re, ne_of_gt] <;> bound

/-- Prime-only bound implies the native bound when the actual tail identity
and nonnegative tail have been supplied. -/
lemma native_bound_of_prime_tail {M : ℕ} [NeZero M] (d : Primes)
    (P T : ℝ → ℝ) {β : ℝ}
    (hEq : ∀ᶠ x in atTop, primeError d M x = P x - T x)
    (hT : ∀ᶠ x in atTop, 0 ≤ T x)
    (hP : ∀ᶠ x in atTop, P x ≤ x ^ (β - 1)) :
    ∀ᶠ x in atTop, primeError d M x ≤ x ^ (β - 1) := by
  filter_upwards [hEq, hT, hP] with x he ht hp
  rw [he]
  linarith

#print axioms entireL_ne_zero_of_one_good_prime
#print axioms native_bound_of_prime_tail
end CompactLandauRun51
