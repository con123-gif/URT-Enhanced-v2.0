import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN32: one ordered cover and finite telescoping instead of cumulative integral
25 Nov 2026. Lane 10 independent audit of lane 6 RUN31 (5d85634d).
Human source-matched conditional proof; scalar Lean certificate PREPARED
(not compiled). RH OPEN. No independent RH detour.

Preflight: mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc including
mandatory engine, SWARM, HANDOFF, AGENTS, state/log/protocol excerpts,
continuity and manuscript 7beedb2752d934a81d4c92b5a19c1c48362e0dc9.
Peers 0e5b40dc, bc38f13b, c0de628b, a987e3f9, 7284c64a inspected;
previous audit a543f365. No duplicated geometric route. Initial connector
fetch rejected wrong argument name; corrected. No native Lean/Lake found.

## Independently audited premises (retain exact native scope)
Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
J = src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/.
DeuringHeilbronnM.lean c88517739b211c9cb0da65b0f6bc59611f809901:
  ZeroSum, etaOf, excW, LogDensityM.
PNTDHBSt.lean 7466805c5bbd5a7d1aa2693973b04051939151fe:
  ZeroSumOfB = LogDensityM -> DeuringHeilbronnMB -> ZeroSum.
PNTZSumB.lean d23a92d81ccbe2c6a7a1da9ab8fc918399439e28:
  density_norm and ell_bounds (actual proofs inspected).
PNTZSumL.lean 2d1438deccaebf79100398eddc33ad8a9b8e3627:
  zero_sum_bound_lossy (actual body inspected).
PNTEOf.lean 69fb97f9bd646a9fb357b6ba1739cf82a173e9ed:
  zero_in_region, etaOf_far, etaOf_pos, etaOf_some, eOf_exc.
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c:
  actual pnt_progressions_relative_weak_holds calls zero_sum_bound_lossy.
All pins match RUN31. No reliance on upstream RH conclusion.

Fix native density constants a>=1, B>=0, C>=1 and repulsion constants
c0,c1,c2>0,N natural. Set kappa=min(c0,1/20); fix C1 and A1>=1 first.
Take native M>0 with 8|M, zero sets Z_chi and integer multiplicities
with all native zero, simplicity, height and local unit-window
hypotheses, and y>=2. Put l=log M, K=A1+2, H=M^A1+3,
L=log(MH), t=log y/L, c=cZ, eta=etaOf M, eta0=min(c/2,c1/K).
Native ell_bounds: 2<=l<=L<=Kl. eta0>0, eta>0. Native zero_in_region
plus the simplicity premise cancels exactly the inside-region summands.
Outside region w=L(1-Re rho)>=c, since |Im rho|+2<=H. Drop only
the outside-region subtraction of excW, which is nonnegative.

Audit RUN31 theta=min(1,eta*L^N/eta0): theta>0, eta0*theta<=eta*L^N.
If theta<1 then eta<eta0<=min(c/2,c1/K)<1. etaOf_none and etaOf_far
exclude none and outside-region selection; eta=(1-beta1)l from
etaOf_some. Thus (1-beta1)L<=K eta<c1, and the selected pair differs
from every outside-region pair. Native lossy DH applies since
Re rho>1-kappa, |Im rho|<=H and eOf_exc supplies the required real
quadratic zero. Since theta=(1-beta1)l L^N/eta0 >=
(1-beta1)L^N/c1, obtain w>=c2 log(1/theta). For theta=1 this last
bound is automatic. Hence every retained pair has
v0=max(c,c2 log(1/theta)) <= w. No RH assumption.

## New proof block for integration/editor: entirely finite
RUN31 forms a fresh maximal separated subset at every cutoff v and
integrates the resulting cumulative density. Both can be avoided.

Order ALL outside-region pairs by nondecreasing w, break ties
arbitrarily (fixed deterministic order suffices). Greedily keep a
pair only if no previously kept pair of its OWN character is at
imaginary distance <1. Assign each rejected pair to one such earlier
kept pair and each kept pair to itself. This gives ONE separated
representative set. Every cluster has multiplicity mass <= |C1| L
by the original hwin at its representative; its members have
w >= the representative's w. All prefixes of the representative
list are separated and lie at w<= the last prefix element.

Write w_1<=...<=w_s for their weights and D=C L^B.
Native density_norm applied to each prefix gives i <= D exp(a w_i).
Set u=t-a and require t>=2a (already ensured by RUN31's threshold).
For nonempty list put f_i=exp(-t w_i), f_(s+1)=0, and
g_i=exp(-u w_i), g_(s+1)=0. Exact summation by parts and positivity:
  sum_i f_i = sum_i i (f_i-f_(i+1))
            <= D sum_i exp(a w_i)(f_i-f_(i+1))
            <= 2D sum_i (g_i-g_(i+1))
             = 2D exp(-u w_1) <= 2D exp(-u v0).
For i<s, write d=w_(i+1)-w_i>=0, r=exp(-u d) in (0,1].
Since t<=2u, exp(-t d)>=r^2. Therefore
  1-exp(-t d) <= 1-r^2 = (1-r)(1+r) <= 2(1-r).
Multiplying by exp(-u w_i) proves the penultimate bound. Terminal
term has factor 1 rather than 2. Empty list gives zero directly.
This uses only exact factorization, monotonicity and finite sums;
no layer-cake integration, no changing cutoff-dependent covers,
no imaginary floor parity, and no infinite limit exchange.

Consequently with the native multiplicity mass,
  W <= 2 |C1| C L^(B+1) exp(-(t-a) v0).
Use the identical RUN31 explicit threshold
C0=K*(2*a+2/c2+2*(B+1+N)*(1+log K)/c).
From log y>=C0*l*log(l+2), derive
t>=2a+2/c2+2*(B+1+N)*log L/c using log L<=
(1+log K)*log(l+2). As v0>=c and v0>=c2 log(1/theta),
(t-a)*v0 >= t*c/2+log(1/theta)+(B+1+N)*log L.
Thus the same complete native ZeroSum conclusion follows:
  W <= (2 |C1| C / eta0) eta exp(-c log y/(2 K l)).
All constants fixed before M,Z,m,y. C1 may be negative or zero;
absolute value is legitimate and empty-family case retained.
Original hmin and hms retained; no claim of changed analytic inputs.

## Audit and dependency ledger
AGREE with RUN31's mathematical theta and integral argument and
its existential constant budget. This finite alternative avoids
the additional calculus obligation, without changing its output
bound or theorem interface. DISAGREE with using an arbitrary
maximal cover in the new weighted argument: its representative
may have larger w than a rejected zero, reversing the comparison.
The order is essential. Likewise t>=2a is essential for the
local factor-2 bound; see exact negative control.

Original local graph:
PNTFinal -> zero_sum_bound_lossy -> zeroSum_core, pow_absorb,
density_norm, ell_bounds, etaOf_far, eOf_exc, DH; zeroSum_core
retains its original multiplicity, bin and geometric-series edges.
Peer overlay RUN31: density_norm, changing maximal covers,
layer-cake integral, exponent budget, all exception/DH dependencies.
Audit overlay: density_norm, ONE ordered separated cover, prefix
density, finite Abel identity, scalar gap factor, same exception
and exponent budget. Original graphs and unresolved dependencies
untouched, no global deletion asserted. Context cache key includes
source pin, actual character family, ordered retained set, M, Z,
m, eOf, A1,C1, all density/DH constants, t and v0; prefix counts
are reused within the same context, not across different families.
Original source and peer proof retained as fallback if replay fails.
No new authenticated Main-root reachability or axiom evidence;
native caller is source-visible only. No URT performance claim.

Actual baseline CI status JSON inspected:
45577239749 pass, 98.87s, b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass, 77.94s, 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Tail explicitly reports reduced_strip_root axioms propext,
Classical.choice, Quot.sound; rh_of_right scan 2000 visited,
1642 values, 358 no-value, 324 pending. Prior results only.
Attempt to fetch result.json at job-root returned 404; status.json
contains actual log tail. No local lean/lake; no new kernel PASS.

Executed exact Python algebra regression (not actual L-zero data
and not proof of the analytic suppliers; this is a scalar identity
test). Reproduce by saving and running the following Python:
```python
from fractions import Fraction as F
from itertools import combinations_with_replacement
gaps=prefix=0
for k in range(2,8):
    for i in range(1,13):
        for j in range(1,i+1):
            x,y=F(i,12),F(j,12)
            assert (x**k-y**k)/x <= 2*(x**(k-1)-y**(k-1))
            gaps+=1
    for n in range(1,7):
        for z in combinations_with_replacement(range(1,9),n):
            xs=[F(i,8) for i in reversed(z)]
            D=max((i+1)*x for i,x in enumerate(xs))
            f=[x**k for x in xs]+[F(0)]
            assert sum(f[:-1]) == sum((i+1)*(f[i]-f[i+1]) for i in range(n))
            assert sum(f[:-1]) <= 2*D*xs[0]**(k-1)
            prefix+=1
r=F(9,10)
assert 1-r**3 > 2*(1-r)
assert F(1,2)**2 < F(3,4)**2 and abs(F(0)-F(1,2))<1
print(f'gap={gaps}; prefix={prefix}; negative_controls=2')
```
Actual stdout: gap=468; prefix=18012; negative_controls=2.
The first control corresponds to a=2,t=3,u=1,d=-log(9/10).
The second uses an unordered representative with exp(-a w)=1/2
and an earlier-ranked nearby rejected element with exp(-a w)=3/4.
No synthetic zero claims. The new proof is human mathematics;
Lean below certifies the scalar gap only, PREPARED not compiled.

RESUME HERE: kernel-check the finite Abel/ordered-cover replacement
at ZeroSumOfB, including actual finite lists and assignment fibers;
audit PNTDHB's native repulsion supplier and native root reachability.
HANDOFF TO character_boxes, kernel, integration and editor.
Verdict AGREE/PARTIAL: exact local reduction, analytic inputs retained;
canonical G(x)<=x^(1/2+9 eps) remains unproved in this reconstruction.
-/

namespace RHAuditFiniteDensity32

theorem gap_factor (r s : ℝ) (hr : 0 ≤ r) (hr1 : r ≤ 1)
    (hs : r^2 ≤ s) : 1-s ≤ 2*(1-r) := by
  nlinarith [sq_nonneg (1-r)]

theorem exponential_gap (a t d : ℝ) (ha : 0 ≤ a)
    (ht : 2*a ≤ t) (hd : 0 ≤ d) :
    1-Real.exp (-t*d) ≤ 2*(1-Real.exp (-(t-a)*d)) := by
  have hu : 0 ≤ t-a := by linarith
  have hr1 : Real.exp (-(t-a)*d) ≤ 1 := by
    rw [← Real.exp_zero]
    apply Real.exp_le_exp.mpr
    nlinarith [mul_nonneg hu hd]
  have hs : Real.exp (-(t-a)*d)^2 ≤ Real.exp (-t*d) := by
    rw [pow_two, ← Real.exp_add]
    apply Real.exp_le_exp.mpr
    nlinarith [mul_nonneg (show 0 ≤ t-2*a by linarith) hd]
  exact gap_factor _ _ (Real.exp_pos _).le hr1 hs

theorem replay (r s : ℝ) (hr : 0 ≤ r) (hr1 : r ≤ 1)
    (hs : r^2 ≤ s) : 1-s ≤ 2*(1-r) := by
  first | (rh_reduce 3 using [gap_factor]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact gap_factor r s hr hr1 hs

end RHAuditFiniteDensity32

rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.density_norm limit 2000
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy as RHAuditFiniteDensity32OriginalPruned
rh_prune RHAuditFiniteDensity32.gap_factor as RHAuditFiniteDensity32GapPruned
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy
#print axioms RHAuditFiniteDensity32.gap_factor
#print axioms RHAuditFiniteDensity32.exponential_gap
#print axioms RHAuditFiniteDensity32.replay
