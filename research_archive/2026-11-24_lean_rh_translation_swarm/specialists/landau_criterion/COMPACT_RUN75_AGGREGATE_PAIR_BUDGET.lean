import New.Filling.CrudeEnergy
import Mathlib.Tactic

/-!
# RUN75 — one aggregate noncoherent budget, replacing the level recursion
27 November 2026. HUMAN SOURCE-MATCHED conditional reduction; prepared Lean
scalar certificates, not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005,
src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc reread.
Current default Main.lean differs (blob 6feb2eac1ed5fe318526ae74b89f92bc83be8c9f,
New.zeta_zeros_on_line New.grh); do not change either frozen pin.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a00585.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 incl mandatory engine,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity inspected.
RUN69 and RUN74 read; latest peer 38cee09b (direct orbit cancellation),
42bc7348 (exchange support), 85d03bf7 (majorant), a26c8f8c (finite probes)
inspected. No duplication of their orbit/majorant/determinant arguments.

## 1. Stop the actual pair proof before its final exponential budget

Source CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
energy_le_of_level_pairs (especially the displayed summed pair bound and
the last four lines ending in pow_le_tailScale). BlockBound.lean
6c68e80e3b1ea2b7983696716305493a37f2b1fd, sum_pairWeight_le.
SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea, energy, linkEnergy.
ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5,
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18 read.

Fix SAME admissible filling S, side=cut, stable T, Omega, X!=0,
all s in Omega fixing norm >= X, C>=d1, normal-form-zero trigger
C>=tau^20*d1, and actual omitted-link condition for top level only.
Write N=rho+1, tau=tailScale, nu=unipCovolume>0.
All the pointwise arithmetic/geometric arguments in energy_le_of_level_pairs
up to sum_pairWeight_le remain as actual supplier obligations.
In particular the displayed H budget, pairInvariant_mul_le, two
xRowsIndex/saturation lower bounds, two link/classGauge splits, and
enorm_amplitudeSum_le_classSize are NOT removed by this reduction.

For a stable subset of a single level j, the native proof first
bounds the unnormalized energy by the diagonal kept-link term plus
    (C/tau^3)*nu^2 * sum_(c,c',a,b)(P_j(b,a)+P_j(a,b)),
where P_j is the exact nonnegative pairWeight (with c,c' retained).
Absolute summability, injection dropping s and pi, and classSize
product domination are the premises of this step. Symmetry swaps
a,b in the same full pair index set, not in an arbitrarily restricted
subset. The sum of each P_j orientation is at most 2*tau^2 by
sum_pairWeight_le. Divide by nu^2 only AFTER summing and cancel tau^2:
    energy_j <= w + 4*C/tau.                         (R)
This is the actual intermediate result of the native proof, BEFORE
its final exponent budget, not an assumed new independent pair bound.
All quantities nonnegative and finite by the displayed native bounds.
No attempt to improve the deep arithmetic packing estimate here.
If j<N, R=empty, w=0, the omitted-link hypothesis is vacuous.
This yields a uniform one-level estimate independent of j.

## 2. One finite partition, one Cauchy-Schwarz

At energy_le_of_level_lt let 0<=n<=N. Suppose every agreeing gamma in T
has some level j<n, exactly as in the native premise. Use disjoint stable
pieces T_j = T intersect HasLevel(j) minus union of earlier level sets,
j=0,...,n-1. Stability follows from isStable_hasLevel, intersection and
complement; uniqueness of level is NOT assumed. The remaining stable
piece has no agreeing gamma and its amplitude is zero by the native
character-vanishing supplier (or editor 38cee09b). Absolute summability
gives the exact finite identity A_T=sum_j A_Tj for each c,s,c'.
Every subset inherits the actual normal-form-zero trigger.

In the finite Hilbert direct sum over (c,c',s in Omega), use the norm
scaled by 1/nu, so its square is exactly energy. Triangle then scalar
Cauchy-Schwarz gives
    energy_T <= n * sum_j energy_j <= 4*n^2*C/tau.   (A)
Equivalently use pointwise squared norm <= n sum of squared norms and
sum over the finite (c,c',s). No orthogonality of levels claimed.
For n=0 the residual is all of T, so energy=0 directly.
The scalar inequality 4*n^2 <= 4^n for positive integer n follows from
n+1<=2n and induction starting n=1. Hence one common guard suffices:
    tau >= b^30 * 4^N
      ==> energy_T <= C/(b^30*4^(N-n)).
For a fixed n the weaker sufficient guard is
    tau >= 4*n^2*b^30*4^(N-n).
The native size payment tau>=b^(N+31) used at j=0 of the
original proof implies the common guard since b>=1000>=4.
This is a genuine local replacement of the final geometric payment;
it does not relax the distinct upstream uses of tau inside H or
the packing estimates. At n>=3 the factor 4*n^2/4^n is strictly <1
relative to the common-guard budget. At n=1,2 equality is possible.
At the actual full/cut consumer n=N, use (A) for the zero-discriminant
part; RUN69's final scalar assembly remains valid unchanged. The
top-level nonzero-discriminant piece still uses the original link
bound (or (R) with its own payment). No change to the coherent or
off-Bessel proof inputs or to the global admissibility class.

Original source-visible edges: energy_le_of_level_lt ->
{amplitudeSum_eq_zero_of_not_charsAgree, amplitudeSum_split,
energy_add_le, energy_le_of_level_pairs with its j-dependent payment,
recursive induction}. Reduced HUMAN candidate:
{same absolute summability, same stable sets, same character-vanishing,
raw pair estimate R with all its premises, finite partition,
finite Hilbert inequality, common scalar guard} -> same conclusion.
The raw pair estimate R must be separately exported/replayed; the
generic certificate below checks only the scalar last stage, not the
pointwise geometry or the native partition. Original graph, old
axiom evidence and all other consumers preserved. Context key:
same compact pin, S, side, T, Omega, X, C, n, j, b, tau, nu,
same class and pair weights, same inherited trigger and stable sets.
No global native dependency retirement; no URT advantage claimed.

Actual local execution (Python stdlib Fraction, no lean/lake found):
for N in range(1,81):
 for n in range(1,N+1):
  assert 4*n*n <= 4**n
  for b in (4,1000,1001):
   tau=b**30*4**N
   assert Fraction(4*n*n,tau)<=Fraction(1,b**30*4**(N-n))
   assert tau<=b**(N+31)
Output: 9720 exact scalar budget comparisons passed; no analytic/kernel verification.
Sharp cases n=1,2; n=3 strict saving. Proof above, not inference
from finite checks.
Historical published status.json files b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 reread: old engine/conditional
root runs 45577239749,45576756833 report pass, returncode 0; root only
propext, Classical.choice, Quot.sound, bounded scan 324 pending.
Neither checks this file. Native rh_scan/prune/reduce/auto/frontier
not executable locally. No fresh axiom print, no new CI pass.

RESUME HERE: export R at the actual native energy_le_of_level_pairs
proof just before the final pow_le_tailScale payment; replay the
finite stable partition/Hilbert inequality and scalar bridge below in
the compact environment. Independently audit the pointwise classSize
product to pairWeight comparison and the full weighted packing at
BlockBound.sum_pairWeight_le; these are distinct remaining suppliers,
not closed by this scalar aggregate. Keep coherent-link, Rallis,
A/C primitives, original graphs, and the prime-window lower bound open.
HANDOFF TO integration, formal audit, positivity, native runner.
-/

namespace CompactLandauRun75

theorem four_mul_nat_sq_le_pow (n : ℕ) :
    4 * (n : ℝ)^2 ≤ (4 : ℝ)^n := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    by_cases h : n = 0
    · subst n
      norm_num
    · have hn : (1 : ℝ) ≤ (n : ℝ) := by
        exact_mod_cast (show 1 ≤ n by omega)
      have hsq : ((n : ℝ) + 1)^2 ≤ 4 * (n : ℝ)^2 := by
        nlinarith [sq_nonneg ((n : ℝ) - 1)]
      push_cast
      rw [pow_succ]
      linarith

theorem raw_pair_budget (C τ ν P Q F w : ℝ)
    (hC : 0 ≤ C) (hτ : 0 < τ) (hν : 0 < ν)
    (hP : P ≤ 2*τ^2) (hQ : Q ≤ 2*τ^2)
    (hF : F ≤ w*ν^2 + (C/τ^3)*ν^2*(P+Q)) :
    F/ν^2 ≤ w+4*C/τ := by
  apply (div_le_iff₀ (by positivity : 0 < ν^2)).2
  calc
    F ≤ w*ν^2+(C/τ^3)*ν^2*(P+Q) := hF
    _ ≤ w*ν^2+(C/τ^3)*ν^2*(2*τ^2+2*τ^2) := by gcongr
    _ = (w+4*C/τ)*ν^2 := by field_simp; ring

theorem common_guard (n N : ℕ) (b τ C e : ℝ)
    (hb : 0 < b) (hτ : 0 < τ) (hC : 0 ≤ C)
    (hn : n ≤ N) (hscale : b^30 * (4:ℝ)^N ≤ τ)
    (he : e ≤ 4*(n:ℝ)^2*C/τ) :
    e ≤ C/(b^30*(4:ℝ)^(N-n)) := by
  apply he.trans
  apply (div_le_div_iff₀ hτ (by positivity : 0 < b^30*(4:ℝ)^(N-n))).2
  have hpow : (4:ℝ)^n * 4^(N-n) = 4^N := by
    rw [← pow_add, Nat.add_sub_of_le hn]
  calc
    4*(n:ℝ)^2*C*(b^30*(4:ℝ)^(N-n))
        ≤ (4:ℝ)^n*C*(b^30*(4:ℝ)^(N-n)) := by
          gcongr
          exact four_mul_nat_sq_le_pow n
    _ = C*(b^30*((4:ℝ)^n*4^(N-n))) := by ring
    _ = C*(b^30*(4:ℝ)^N) := by rw [hpow]
    _ ≤ C*τ := mul_le_mul_of_nonneg_left hscale hC

#print axioms four_mul_nat_sq_le_pow
#print axioms raw_pair_budget
#print axioms common_guard
end CompactLandauRun75
#check Filling.energy_le_of_level_pairs
#check Filling.sum_pairWeight_le
#check Filling.energy_le_of_level_lt
#print axioms Filling.energy_le_of_level_lt
