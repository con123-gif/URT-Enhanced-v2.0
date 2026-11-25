import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration lane, 25 Nov 2026. SOURCE-MATCHED conditional human derivation;
scalar Lean certificate PREPARED, NOT COMPILED. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis.
Mission latest b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, SWARM, handoff, AGENTS,
continuity, state/protocol/log, live manuscript and peer commit list consulted.
Peer mass endpoint 9e7a5f49, constant spread 5ea960de, anchor 0e9468bc, moment
109c156c integrated. New step: explicit virtual baseline and asymmetric
constant error, without selecting any actual anchor word.

**Common determinant baseline (integration, 25 Nov).** Put F=fk>0, n=k-2. At each place, native DataA fixes first/last entries A,B and gives interior entries v_l+Delta e_l, where v_l=vN(0)-4 Delta(l-1)-1/2 and -1<=e_l<=0. Define the explicit positive reference
    P0=(A-B) prod_l (A-v_l)(v_l-B) prod_{d=1}^{n-1}(4 Delta d)^(n-d).
This is a scalar, not a proposed geometric witness. Interior gap ratios are 1+r_ld with r_ld=(e_l-e_(l+d))/(4d). Sum by distance before taking norms: sum_l r_ld=(sum_first_d e-sum_last_d e)/(4d), hence |sum r|<=(n-1)/4 and sum r²<=n/8. The inequality r-(4/3)r²<=log(1+r)<=r gives the interior log ratio. Native first gaps >=4k Delta and last gaps >=3(k-1-l) Delta imply first-endpoint contribution in [0,n/(4k)] and last in [-n/3,0]; the fixed first-last pair cancels. Thus for every actual word and place,
    -3k/4 <= log(vand/P0) <= k/4.
Let K=(volY0/massI(k))*(idxSig/idxPi)*prod_rho(dsig_rho*facProd(k)), and C=(log K-sum_rho log P0_rho)/F. The actual Weyl dimension and dual volume definitions give F(logXuD(u)-C)=-sum_rho log(vand/P0). Since card(Tau)=f,
    C-1/4 <= logXuD(u) <= C+3/4.
The original sharp count follows from the single sufficient anchor interval lowS+1/4<=C<=(15+3CY)mL-3/4. The fixed sharp lowS=R-11L must NOT be silently enlarged: native corollary_five_four_of_explicit consumes it. Word spread is <=1; common Gamma and rounding give log-T spread <=2. Preserve the independent mass-error conjunct and all upper-count consumers. If d=log(volY0/(massI(k)*prod ratioH)), then C=Cmodel+d/F, where Cmodel uses prod ratioH instead of volY0/massI(k). The anchor interval becomes one same-host signed normalization budget:
    F(lowS+1/4-Cmodel) <= d <= F((15+3CY)mL-3/4-Cmodel).
This sufficient criterion allows signed normalization defects to cancel before norms. The original mass-volume theorem gives d=0, but the new interval itself is not yet proved from the native sigma-degree/gap and L-value estimates. Retain original sharp proof and all uniform family quantifiers. Human source-matched; native replay pending. Sources: LinkMin b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f, LogVandermondeVariationGeneric 88add153513f5cc61075fd89b8a06ed86fe2adaa, JointsL 057913eaf7d7d88fda208e16cd84e910ebdd4227, PartFiveExplicitOfPropositions 2b94505b7a3cedf501929bc5bfccc948fe21c776. See integration/2026-11-25_1204_COMMON_DETERMINANT_BASELINE.lean.

Native source bodies inspected: LinkMin.family_of_global_statements,
ramified_rank_lines_of_free, part_five_family_of_mass_volume,
division_level_prime_family; vandermonde_variation_at_place and
vandermonde_variation_holds; JointsL.count_at_of and logGam_le;
PartFiveExplicitOfPropositions.corollary_five_four_of_explicit and
part_five_explicit_of_propositions. The native hmidR, hfirst, hlast,
hu0 and last endpoint cases supply the exact gap guards. For the
baseline all gaps positive; first actual/baseline log ratio lies between
0 and -e_l/(4k) by log(1+t)<=t; last lies between e_l/[3(k-1-l)] and 0
by log z>=1-1/z. Summing gives lower -(n-1)/4-n/6-n/3 and upper
(n-1)/4+n/(4k), hence stated asymmetric bound. No new host or proof
of the absolute interval. Do not enlarge sharp lowS at its caller.

Original source-visible path: Main -> ... -> core_gm -> ch_top -> CountF;
LinkMin.division_level_prime_family -> ramified_rank_lines_of_free,
part_five_family_of_mass_volume -> family_of_global_statements -> mass_telescope;
also -> vandermonde_variation_holds -> vandermonde_variation_at_place.
Candidate: actual DataA + common determinant factorization + signed interval
-> exact original Conclusion5Sharp and stronger relative bound
-> same part_five_explicit_of_propositions -> existing count consumers.
Preserve original and reduced graphs separately; no global deletion, no
typed export claimed, retain axiom and pending-node evidence. Context cache
(pin,D,sc,Delta,w,rho,f,k,m,host,endpoints,consumer). Backtrack to native
proof if the proposed interval or caller replay fails. No URT advantage claimed.

Executed CPython exact Fraction controls, exit 0 (not native hosts):
```python
from fractions import Fraction as F
from itertools import product
cases=checks=0
for n in range(1,9):
 k=n+2
 for e in product((F(-1),F(-1,2),F(0)),repeat=n):
  s=q=F(0)
  for d in range(1,n):
   r=[(e[i]-e[i+d])/(4*d) for i in range(n-d)]
   assert sum(r)==(sum(e[:d])-sum(e[-d:]))/(4*d)
   assert abs(sum(r))<=F(1,4)
   s+=sum(r);q+=sum(z*z for z in r)
   checks+=2
  assert abs(s)<=F(n-1,4) and q<=F(n,8)
  lower=s-F(4,3)*q+sum(e,F(0))/3
  upper=s-sum(e,F(0))/(4*k)
  assert -F(3*k,4)<=lower<=upper<=F(k,4)
  cases+=1;checks+=2
for g in map(F,range(-10,11)):
 for d in [F(-3,4),F(0),F(1,4)]:
  assert g-F(1,4)<=g-d<=g+F(3,4)
  checks+=1
print(cases,checks)
```
Output 9840 profiles, 147687 assertions. No inference to actual host or RH.
Lean/lake unavailable locally. Actual prior CI status files read: 45577239749
PASS 98.87s b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc; 45576756833
PASS 77.94s 7da354941e402b6f8b364ed03d8c5c82d27b7717. These do not check
this certificate. Conditional strip axioms propext, Classical.choice,
Quot.sound; pending 324 native scan nodes retained. Orchestrator 45606030273
checkpoint 441 passes physical regression only. No new kernel PASS.
First multi-file GitHub write attempt returned transient GraphQL error;
branch was checked and proposed file absent before retry.

RESUME HERE: derive the signed baseline interval directly from actual LinkMin
sigma-degree/gap, L-value and volume estimates with fixed sharp lowS margin.
Run rh_scan/prune on family_of_global_statements, division_level_prime_family,
then rh_reduce/rh_auto/rh_auto_frontier at actual caller with scalar bridge;
audit all surviving axioms. If interval fails, retain original sharp proof.
VWin, geometric suppliers and ten-page reconstruction remain open.
HANDOFF TO: geometry, editor, kernel, audit.
-/

namespace RHIntegrationBaseline
theorem signed_baseline_count (F X C S lo hi : ℝ)
    (hF : 0 < F) (hSlo : -(3/4)*F ≤ S) (hShi : S ≤ F/4)
    (heq : F*(X-C) = -S) (hlo : lo+1/4 ≤ C) (hhi : C ≤ hi-3/4) :
    lo ≤ X ∧ X ≤ hi := by
  have h1 : C-1/4 ≤ X := (mul_le_mul_left hF).mp (by nlinarith only [heq,hShi])
  have h2 : X ≤ C+3/4 := (mul_le_mul_left hF).mp (by nlinarith only [heq,hSlo])
  exact ⟨by linarith, by linarith⟩

theorem signed_interval_to_anchor (F C d lo hi : ℝ) (hF : 0 < F)
    (hl : F*(lo+1/4-C) ≤ d) (hh : d ≤ F*(hi-3/4-C)) :
    lo+1/4 ≤ C+d/F ∧ C+d/F ≤ hi-3/4 := by
  have h1 : lo+1/4-C ≤ d/F := (le_div_iff₀ hF).2 (by simpa [mul_comm] using hl)
  have h2 : d/F ≤ hi-3/4-C := (div_le_iff₀ hF).2 (by simpa [mul_comm] using hh)
  exact ⟨by linarith, by linarith⟩

theorem common_baseline_spread (C X Y : ℝ)
    (hx : C-1/4 ≤ X ∧ X ≤ C+3/4)
    (hy : C-1/4 ≤ Y ∧ Y ≤ C+3/4) : |X-Y| ≤ 1 := by
  exact abs_le.mpr ⟨by linarith [hx.1,hy.2], by linarith [hx.2,hy.1]⟩
#print axioms signed_baseline_count
#print axioms signed_interval_to_anchor
#print axioms common_baseline_spread
end RHIntegrationBaseline

rh_scan Formalism.MainNotions.StandardLattice.family_of_global_statements limit 2000
rh_scan Formalism.MainNotions.StandardLattice.division_level_prime_family limit 2000
