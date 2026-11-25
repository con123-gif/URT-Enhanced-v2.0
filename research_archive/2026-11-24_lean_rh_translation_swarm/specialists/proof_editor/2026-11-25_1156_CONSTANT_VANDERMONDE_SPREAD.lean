import Formalism.SharpRestriction.GlobalSchurBounds.GlobalRankLatticeProofs.LogVandermondeVariationGeneric
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 15: cancel interior Vandermonde variation before absolute values
25 Nov 2026. Human source-matched proof of a stronger LOCAL supplier;
Lean certificate PREPARED, NOT COMPILED. RH and ten-page reconstruction OPEN.

Pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream
251c7b05dd869ceba1aa42c6001c00b4010f23f9 (batch 17), not substituted.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; protocol, handoff,
expansion, AGENTS, continuity and live manuscript consulted.
Prior geometry RUN29 0e9468bc, editor moment 109c156c; recent audit
db618414, theta 6c4bfc68, kernel 82c81900; no duplicate of this interior
distance-class cancellation located in recent commits.
This is a compact proof block for the existing manuscript, not another
independent RH criterion or a new assumed moment.

## Actual native supplier, with proof
Source under src/Formalism/SharpRestriction/GlobalSchurBounds/:
GlobalRankLatticeProofs/LogVandermondeVariationGeneric.lean
88add153513f5cc61075fd89b8a06ed86fe2adaa
(vandermonde_variation_at_place, vandermonde_variation_holds).
In the former proof, DataA gives k>=44, Delta>=1, equal first and last
entries across words, and the actual hmidR bound
  vN(0)-4 Delta(l-1)-1/2-Delta <= u_l <= vN(0)-4 Delta(l-1)-1/2
for 1<=l<=k-2 at every rho. The actual G0/G1 bounds there imply:
first-to-other gaps >=4k Delta, last-to-interior gaps >=3(k-1-l)Delta;
their changes across words have magnitude <=Delta by hmidR and the
fixed endpoints. All gaps are positive. These are native proof facts,
not an invented column model.

Put n=k-2, e_l=(u_l-[vN(0)-4 Delta(l-1)-1/2])/Delta in [-1,0].
The interior gap is exactly 4 Delta d (1+r_{l,d}),
  r_{l,d}=(e_l-e_{l+d})/(4d), 1<=d<n, 1<=l<=n-d.
For fixed d, SUM BEFORE taking any absolute values:
  sum_{l=1}^{n-d} r_{l,d}
   = (sum_{l=1}^d e_l - sum_{l=n-d+1}^n e_l)/(4d).
This holds even for overlapping prefix/suffix (subtract both
decompositions of the whole sum). Each numerator lies in [-d,d].
Thus |sum_l r_{l,d}|<=1/4 and |sum_{l,d}r|<=(n-1)/4.
Also |r_{l,d}|<=1/(4d) and
  sum_{l,d} r^2 <= n/16 sum_{d>=1} d^(-2) <= n/8,
using 1/d^2 <= 1/(d(d-1)) for d>=2 and telescoping.

For |r|<=1/4, standard log inequalities give
  r-(4/3)r^2 <= r/(1+r) <= log(1+r) <= r.
Indeed log z >=1-1/z, and r-r/(1+r)=r^2/(1+r)<=4r^2/3.
Therefore, relative to the same interior baseline product
P0=prod_{d=1}^{n-1}(4 Delta d)^(n-d),
  -(n-1)/4-n/6 <= log(P_int(u)/P0) <= (n-1)/4.
Compare two words: their interior log products differ by at most
(n-1)/2+n/6, without a harmonic log k factor.

For the first endpoint, log difference per interior pair is <=1/(4k)
by the original abs_log_sub_le_div (same first entry).
For the last endpoint it is <=1/(3(k-1-l))<=1/3 (same last entry).
The first-last pair cancels identically. Hence
  |log vand(u)-log vand(u')|
    <= (n-1)/2+n/6+n/(4k)+n/3 < k.
(The coarser sum is n-1/4.) This proves the stronger per-place bound
with exactly the same DataA and D7 inputs.

The native vandermonde_variation_holds already factors
  duStarU(D,u)=K(D)*prod_rho vand(uColR(D,u,rho))
where K(D)=massI(D,k)*idxPi(D,g0,g1)/prod_rho facProd(k).
Use its existing positivity/zero guards and logXu definition.
The same common-factor cancellation and card(Tau)=f yield
  |logXuD(D,u)-logXuD(D,u')| <= f*k/(f*k)=1.
For f=0 the native totalized definition gives zero variation;
the actual scale has f>0. No mass-ratio or volume-equality theorem
is needed for this RELATIVE estimate (absolute level still needs them).
JointsL.lean 057913eaf7d7d88fda208e16cd84e910ebdd4227:
same Gamma on the same word family, t_u=logXuD(u)-2log Gamma/(fk)+r_u,
0<=r_u<=log(1+1/(fk)) <=1. Consequently
                 |t_u-t_v| <= 2.
This replaces a logarithmically growing spread budget by an absolute
constant in the native determinant branch. It also supplies the relative
variation input in geometry RUN29's anchor transfer. The earlier weighted
moment follows under the original absolute count lower supplier and
this improved spread by the same weighted arithmetic mean argument:
Q_i<=exp(F(C-R)), Q_i/Qmin<=exp(2F), hence
Qbar^h (Qbar/Qmin)^nu <= exp(F[h(C-R)+2nu]).
Keep h,nu>=0, F=f*k>0 and the same native R lower count.
This is a proved conditional implication, not a new independent proof
of the absolute lower count. No assertion of a better final RH exponent.
The anchor still requires MassRatio2, VolumeEqMass2,
SigmaDegreeTwoSidedBoundOfGap, PartFourSectionBData, DataA, actual host.
LogWeightMinusLogBBound.lean 8d9b1ee9cc0e41975f2b5339b1ec183dd35bb626
and LemmaFiveOneOfTheoremTwo.lean 2b7d6755659146ca64a2aad8f1a426b6f196bd87
(log_word_scale_closed_form) inspected: their absolute formula contains
the mass ratios, local index factor and sigma/Weyl dimensions;
none is eliminated globally by the relative estimate.

## Reproducible exact finite checks (local CPython, actual execution)
The following checks the interior algebra on all binary endpoint choices
of the permitted interval up to n=10; NOT a native host realization and
NOT a proof for continuous offsets or asymptotic RH. The above algebra
covers arbitrary real offsets in the interval.
Python:
from fractions import Fraction as F
from itertools import product
cases=checks=0
for n in range(1,11):
 for e in product((F(-1),F(0)),repeat=n):
  linear=F(0); sq=F(0); det=F(1)
  for d in range(1,n):
   r=[(e[i]-e[i+d])/(4*d) for i in range(n-d)]
   assert sum(r)==(sum(e[:d])-sum(e[-d:]))/(4*d)
   assert abs(sum(r))<=F(1,4)
   assert all(abs(v)<=F(1,4*d) for v in r)
   linear+=sum(r);sq+=sum(v*v for v in r)
   for v in r: det*=1+v
   checks+=3
  assert abs(linear)<=F(n-1,4) and F(4,3)*sq<=F(n,6) and det>0
  cases+=1;checks+=3
print(dict(binary_profiles=cases,exact_assertions=checks))
Actual output: {'binary_profiles': 2046, 'exact_assertions': 55302}.
No floating point tests, no actual-host test or URT improvement claim.

## Dependency overlay and audit
Original source-visible root path retained: Main -> ... -> core_gm ->
ch_top -> each_unit_bound_statement -> Count5/CountF -> count_at_of ->
part_five_explicit_eventually -> vandermonde_variation_holds ->
vandermonde_variation_at_place -> log_vandermonde_variation_of_separated.
Also retain TuSize and SlopesMF shared consumers, both absolute count
sides and the original mass/volume/degree/gap hypotheses.
Proposed replacement of per-place variation: actual hmidR and fixed
endpoints -> distance-class telescoping -> quadratic log error ->
per-place bound k -> same native product factorization -> spread <=1
-> same rounded family -> spread <=2. Context key=(pin,D,sc,Delta,w,rho,
same word fibre,k,f,Gamma). Backtrack to original bound if native replay
fails. This is source-visible overlay only, NOT a new typed dependency
export or global axiom deletion.
Lean/lake not found in local shell. Old CI status files retrieved:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc pass 98.87s;
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 pass 77.94s.
Conditional strip-root axioms propext, Classical.choice, Quot.sound
and original scan pending 324 retained, not a new axiom audit.
New certificate below not executed; existing jobs do not validate it.
Coverage: one native per-place variation supplier strengthened, out of
one targeted supplier; no global proof-coverage percentage.

RESUME HERE: formalize the finite distance-class sum, square budget,
and native hmidR endpoint bridge, then replay at
vandermonde_variation_at_place and its product consumer with actual
DataA. For further mathematical closure, use the now bounded spread
and derive a single absolute anchor from log_word_scale_closed_form
with the native sigma-degree/gap and mass/volume inputs; do not add
another moment conjecture. Integration: insert the above compact
proof block into the existing live manuscript only if useful.
HANDOFF TO: geometry, integration, audit, kernel. Independent audit
requested for signs, endpoint bound, and preservation of absolute count.
-/

namespace RHConstantVandermondeSpread
open Finset
open scoped BigOperators

theorem distance_telescoping (e : ℕ → ℝ) (n d : ℕ) (hd : d ≤ n) :
    (∑ i ∈ range (n-d), (e i - e (i+d))) =
      (∑ i ∈ range d, e i) - ∑ i ∈ range d, e (n-d+i) := by
  have h1 : (∑ i ∈ range n, e i) =
      (∑ i ∈ range d, e i) + ∑ i ∈ range (n-d), e (d+i) := by
    calc
      _ = ∑ i ∈ range (d+(n-d)), e i := by rw [Nat.add_sub_of_le hd]
      _ = _ := by rw [Finset.sum_range_add]
  have h2 : (∑ i ∈ range n, e i) =
      (∑ i ∈ range (n-d), e i) + ∑ i ∈ range d, e (n-d+i) := by
    calc
      _ = ∑ i ∈ range ((n-d)+d), e i := by rw [Nat.sub_add_cancel hd]
      _ = _ := by rw [Finset.sum_range_add]
  rw [Finset.sum_sub_distrib]
  have h3 : (∑ i ∈ range (n-d), e (i+d)) =
      ∑ i ∈ range (n-d), e (d+i) := by simp [Nat.add_comm]
  rw [h3]
  linarith

theorem log_quadratic (r : ℝ) (hr : -(1/4:ℝ) ≤ r) :
    r-(4/3:ℝ)*r^2 ≤ Real.log (1+r) ∧ Real.log (1+r) ≤ r := by
  have hp : 0 < 1+r := by linarith
  have hl := Real.one_sub_inv_le_log_of_pos hp
  have hu := Real.log_le_sub_one_of_pos hp
  have hid : 1-(1+r)⁻¹ = r-r^2/(1+r) := by
    field_simp <;> ring
  have hq : r^2/(1+r) ≤ (4/3:ℝ)*r^2 := by
    apply (div_le_iff₀ hp).2
    have hnon := mul_nonneg (sq_nonneg r)
      (show 0 ≤ (4/3:ℝ)*(1+r)-1 by linarith)
    nlinarith only [hnon]
  rw [hid] at hl
  constructor <;> linarith

theorem endpoint_join (n k a b c : ℝ) (hn : 0 ≤ n) (hk : k=n+2)
    (ha : a ≤ (n-1)/2+n/6) (hb : b ≤ 1/4) (hc : c ≤ n/3) :
    a+b+c ≤ k := by linarith

theorem rounded_spread (t1 t2 x1 x2 common r1 r2 : ℝ)
    (ht1 : t1=x1-common+r1) (ht2 : t2=x2-common+r2)
    (hx : |x1-x2| ≤ 1) (hr1 : 0 ≤ r1 ∧ r1 ≤ 1)
    (hr2 : 0 ≤ r2 ∧ r2 ≤ 1) : |t1-t2| ≤ 2 := by
  have h := abs_le.mp hx
  exact abs_le.mpr ⟨by linarith [h.1,hr1.1,hr2.2],
    by linarith [h.2,hr1.2,hr2.1]⟩

theorem rounded_spread_auto (t1 t2 x1 x2 common r1 r2 : ℝ)
    (ht1 : t1=x1-common+r1) (ht2 : t2=x2-common+r2)
    (hx : |x1-x2| ≤ 1) (hr1 : 0 ≤ r1 ∧ r1 ≤ 1)
    (hr2 : 0 ≤ r2 ∧ r2 ≤ 1) : |t1-t2| ≤ 2 := by
  first | (rh_reduce 3 using [rounded_spread]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact rounded_spread t1 t2 x1 x2 common r1 r2 ht1 ht2 hx hr1 hr2

rh_scan Formalism.MainNotions.StandardLattice.vandermonde_variation_at_place limit 2000
rh_prune Formalism.MainNotions.StandardLattice.vandermonde_variation_at_place as RHConstantVandermondeSpread.native_pruned
#print axioms distance_telescoping
#print axioms log_quadratic
#print axioms endpoint_join
#print axioms rounded_spread
end RHConstantVandermondeSpread
