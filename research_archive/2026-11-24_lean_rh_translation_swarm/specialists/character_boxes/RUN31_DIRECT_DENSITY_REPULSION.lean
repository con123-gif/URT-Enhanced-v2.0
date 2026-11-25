import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTFinal
import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN31 — one cumulative density integral replaces zero-sum bins and loss absorption
25 Nov 2026. Lane 6. Human source-matched conditional replacement of
the actual ZeroSum supplier; scalar Lean certificate PREPARED, not
compiled. No new root-kernel result. RH OPEN.

Preflight: latest ONE_EQUATION_MISSION blob
b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc including mandatory engine;
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity, state/log/
protocol excerpts, latest CI summary e711b0561a0a3e432c61f863ad826e20b68bbd50,
live HUMAN_PROOF_ONE_EQUATION 7beedb2752d934a81d4c92b5a19c1c48362e0dc9.
RUN30 18b7ff36acb36e5da8254431c427353f67ffcd2e. Recent peer handoffs:
Galois a987e3f9, theta 6821df81, structure 41d181ff, Landau 0b0399c1,
prime-window 7b758b50, integration 53d53663; none replaces the density
integral below. Not an exhaustive historic archive audit.

## Compact proof block for integration/editor

Keep the precise native ZeroSumOfB = LogDensityM -> DeuringHeilbronnMB
-> ZeroSum. Fix normalized density constants a>=1, B>=0, C>=1,
repulsion constants c0,c1,c2>0 and N in Nat, and kappa=min(c0,1/20).
Fix C1 and A1>=1 before choosing the uniform threshold and constants.
Take M divisible by 8, positive; native Z_chi, m_chi, hZ, hms, hwin and
hmin as in ZeroSum. Put l=log M, K=A1+2, H=M^A1+3, L=log(M H),
Y=log y, t=Y/L, c=cZ. Native ell_bounds: 2<=l<=L<=Kl.
All constants below are uniform over M,Z,m,y; no RH assumption.

1. Exception and cutoff. By PNTEOf.zero_in_region and hms, any zero
in InRegion c M is precisely the selected eOf M pair and is simple;
its m-excW is exactly zero. Outside the region, w=L(1-Re rho)>=c>0.
Dropping excW outside can only increase the sum (hmin also gives
nonnegativity of the actual multiplicities). Let eta=etaOf M>0 and
eta0=min(c/2,c1/K)>0, <=1. Choose ONE explicit number
   theta=min(1,eta*L^N/eta0).
Then 0<theta<=1 and eta0*theta<=eta*L^N. For theta=1 the required
repulsion w>=c2 log(1/theta)=0 is automatic. For theta<1,
eta<eta0 (L>=1), so eOf M cannot be none (eta=1) or outside the
region (etaOf_far gives eta>=c/2). Hence eOf M=(chi1,beta1) in
the region, eta=(1-beta1)l and (1-beta1)L<=K*eta<c1. All actual
repulsion premises hold: quadratic nontrivial chi1 and its real
zero by eOf_exc, beta1<1, height bound <=H, Re rho>1-kappa>=1-c0;
the pair is different because rho is outside the region. The lossy
native DH bound gives
   w >= c2 log(c1/((1-beta1)L^N)) >= c2 log(1/theta),
since theta=(1-beta1)*l*L^N/eta0 >= (1-beta1)*L^N/c1.
This removes the separate small/large loss cases but not DH itself.
In all cases w>=v0=max(c,c2 log(1/theta)).

2. Density with multiplicity, without floor parity. For any v>=v0,
let U_v be the finite set of pairs (chi,rho) outside the region
with w<=v. Pick a maximal subset S_v having imaginary distances
>=1 within each character (finite greedy addition suffices).
Every pair in U_v is within distance <1 of a representative of its
own character, or itself a representative. Thus nonnegative
multiplicities plus hwin imply
  D(v):=sum_{U_v} m_chi(rho) <= |S_v|*|C1|*L
       <= |C1|*C*L^(B+1)*exp(a*v).
The last inequality is density_norm at height H; the actual zeros
have Re rho>1-kappa>=1/2 and Re rho<1 outside the region, and all
other density premises hold. Each representative's unit
neighbourhood has mass <=|C1|L because |Im rho|+2<=H.
Overlaps only increase the sum of nonnegative neighbourhood masses.
No assumption of disjointness or globally separated zeros.
This replaces the factor 2 from splitting imaginary floor bins
by parity. The density estimate still counts distinct separated
pairs, not multiplicities directly.

3. Exact layer cake (finite sum, no limiting exchange). With
t>a, each exp(-t*w)=integral_w^infty t exp(-t*v) dv. Multiply by m,
sum, and use D(v)=0 below v0:
  W:=sum_chi sum_{rho in Z_chi} (m-excW)*y^(Re rho-1)
   <= integral_v0^infty t exp(-t*v) D(v) dv
   <= |C1|*C*L^(B+1) * t/(t-a) * exp(-(t-a)*v0).
This is a positive integral with an elementary exponential
antiderivative; the finite set may be empty. No unit bins and no
pow_absorb auxiliary lemma.

4. Absorb all logarithmic losses at once. Choose
  C0=K*(2*a+2/c2+2*(B+1+N)*(1+log K)/c).
The original predicate ZeroSum permits any fixed C0. If
Y>=C0*l*log(l+2), then t>=C0/K*log(l+2), and
log L<=log K+log l<=(1+log K)*log(l+2), since l>=2.
Therefore
  t >= 2*a + 2/c2 + 2*(B+1+N)*log L/c.
In particular t>=2a, t>a and t/(t-a)<=2. The exact exponent
budget, using v0>=c and v0>=c2 log(1/theta), is
  (t-a)*v0 >= t*c/2 + log(1/theta) + (B+1+N)*log L.
The finite sum then satisfies the single bound
  W <= 2*|C1|*C*theta*L^(-N)*exp(-c*t/2)
    <= (2*|C1|*C/eta0)*eta*exp(-c*Y/(2*K*l)).
Take the existential ZeroSum constants rate c/(2*K)>0,
amplitude 2*|C1|*C/eta0, and the displayed C0. This proves precisely
the native conditional ZeroSum proposition under its two original
analytic inputs, with a changed permitted threshold and explicit
uniform constants. No new dependence on M or on a zero. No need
to establish the exact fixed constants of zeroSum_core itself:
replace its caller zero_sum_bound_lossy of type ZeroSumOfB.
PNTFinal, projected RUN30 and interval RUN29 can all consume the
same existential ZeroSum. Keep the original proof as fallback.
This is a local reduction and not the decisive RH inequality.

## Provenance and native overlay

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; J prefix
src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/.
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c
(pnt_progressions_relative_weak_holds -> zero_sum_bound_lossy
logDensityM_proof' deuringHeilbronnMB_proof');
PNTZSumL.lean 2d1438deccaebf79100398eddc33ad8a9b8e3627
(zero_sum_bound_lossy, pow_absorb);
PNTZSum.lean cdc892744a760f3089f81d17be4df6bbac3024e3
(zeroSum_core, sum_zero_multiplicity_le_two_mul_of_separated,
pow_mul_exp_neg_le_of_large_Y);
PNTZSumB.lean d23a92d81ccbe2c6a7a1da9ab8fc918399439e28
(density_norm, ell_bounds);
PNTDHBSt.lean 7466805c5bbd5a7d1aa2693973b04051939151fe
(DeuringHeilbronnMB, ZeroSumOfB);
DeuringHeilbronnM.lean c88517739b211c9cb0da65b0f6bc59611f809901
(ZeroSum, excW, eOf, etaOf);
PNTEOf.lean 69fb97f9bd646a9fb357b6ba1739cf82a173e9ed
(zero_in_region, etaOf_far, etaOf_pos, etaOf_some, etaOf_none, eOf_exc).
src/Development/AutomorphicArithmetic/MeanSquareBounds/twistK.lean
07e569eaf54b3b91fedad4117991838a23b93603 explicitly invokes PNTFinal
and count_a. pairEx.lean 0020840fcf9b97e9e6e834c591e8516b9875e003.
Retain RUN26-30 caller and original graphs; no claim of new authenticated
Main-root reachability. Upstream current head d91ae2678eea19a0c3045ffca37f1da757c2e719
(25 Nov 13:24 UTC); PNTFinal changed blob
1fe9f0eae8d647c9f312b427778b4f2844be3df1; old PNTZSum, PNTZSumL,
PNTDHBSt and PNTEOf paths 404 at head. No mixing or deletion inference.

Original local source-body graph:
PNTFinal -> zero_sum_bound_lossy -> density_norm, ell_bounds, pow_absorb,
zeroSum_core, etaOf_far, eOf_exc, DH;
zeroSum_core -> zFRDirichlet, separated floor-parity multiplicity bound,
per-level density, pow_mul_exp_neg_le_of_large_Y, geometric sum.
New local overlay:
PNTFinal (or RUN30) -> ZeroSumOfB replacement -> {density_norm,
ell_bounds, zero_in_region, hwin, hms, eOf_exc, etaOf_far,
LogDensityM, DeuringHeilbronnMB, maximal finite separated cover,
finite layer-cake integral, scalar exponent budget}.
No global deletion, all original type/value/constructor/axiom
evidence retained. Original branch can be restored if replacement
replay fails. Context key=(pin,kappa,C1,A1,M,Z,m,eOf,eta,c1,c2,N,
a,B,C,y,theta); density cut changes with v and cannot reuse a
different zero family's bound. hmin still in target statement.

Actual execution: local container command -v lean/lake found neither.
SymPy exact symbolic checks (not simulated zeros or native Lean):
  E=(T-a)*w-T*c/2-z-b
  D=(T/2)*(w-c)+(w/r-z)+(b/c)*(w-c)+(T/2-a-1/r-b/c)*w
  simplify(E-D)==0;
  simplify(diff(-exp(-u*v)/u,v)-exp(-u*v))==0.
Both assertions executed successfully. These verify algebra and
antiderivative only; not the analytic density/repulsion inputs.
Native CI status JSON retrieved this run: 45577239749 pass,
98.87s, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass, 77.94s, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Those validate prior engine and conditional root only, with reported
axioms propext, Classical.choice, Quot.sound and 324 scan names pending.
New Lean checks below PREPARED ONLY; no new CI job/result.
No URT ranking experiment: no measured advantage on this single leaf.

RESUME HERE: trace and reconstruct the actual PNTDHB.deuring_heilbronn_lossy
supplier (not the stronger nonlossy proposition), retaining the power N
and same exceptional pair; cross-check its native zero-counting and
power-sum premises. Kernel lane: replay scalar budget, formalize maximal
separated cover and finite layer-cake, then prove the full ZeroSumOfB
replacement and actual PNTFinal bridge. Audit original/reduced graphs
and axioms; do not conflate the prior CI pass with this new certificate.
HANDOFF TO integration/editor, audit, kernel and character boxes.
Canonical G(x)<=x^(1/2+9 eps) remains OPEN.
-/

namespace RHDirectDensity31

theorem exponent_budget (t a w c r b z : ℝ)
    (ht : 0 ≤ t) (hw0 : 0 ≤ w) (hc : 0 < c) (hr : 0 < r)
    (hb : 0 ≤ b) (hw : c ≤ w) (hz : r*z ≤ w)
    (hbudget : t/2+a+1/r+b/c ≤ t) :
    t*c/2+z+b ≤ (t-a)*w := by
  have h1 : t*c/2 ≤ t*w/2 := by nlinarith [mul_nonneg ht (sub_nonneg.mpr hw)]
  have h2 : z ≤ w/r := (le_div_iff₀ hr).2 (by linarith [hz])
  have he : b/c*c = b := by field_simp
  have h3 : b ≤ b/c*w := by
    rw [← he] at ⊢
    exact mul_le_mul_of_nonneg_left hw (div_nonneg hb hc.le)
  have h4 := mul_le_mul_of_nonneg_right hbudget hw0
  have hrw : w/r = (1/r)*w := by ring
  rw [hrw] at h2
  nlinarith [h1, h2, h3, h4]

theorem exponential_envelope (t a w c r b z : ℝ)
    (ht : 0 ≤ t) (hw0 : 0 ≤ w) (hc : 0 < c) (hr : 0 < r)
    (hb : 0 ≤ b) (hw : c ≤ w) (hz : r*z ≤ w)
    (hbudget : t/2+a+1/r+b/c ≤ t) :
    Real.exp (b+z-(t-a)*w) ≤ Real.exp (-(t*c/2)) := by
  apply Real.exp_le_exp.mpr
  linarith [exponent_budget t a w c r b z ht hw0 hc hr hb hw hz hbudget]

theorem replay (t a w c r b z : ℝ)
    (ht : 0 ≤ t) (hw0 : 0 ≤ w) (hc : 0 < c) (hr : 0 < r)
    (hb : 0 ≤ b) (hw : c ≤ w) (hz : r*z ≤ w)
    (hbudget : t/2+a+1/r+b/c ≤ t) :
    t*c/2+z+b ≤ (t-a)*w := by
  first | (rh_reduce 3 using [exponent_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact exponent_budget t a w c r b z ht hw0 hc hr hb hw hz hbudget

end RHDirectDensity31

rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.zeroSum_core limit 2000
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy as RHDirectDensity31OriginalPruned
rh_prune RHDirectDensity31.exponent_budget as RHDirectDensity31BudgetPruned
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.zero_sum_bound_lossy
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.zeroSum_core
#print axioms RHDirectDensity31.exponent_budget
#print axioms RHDirectDensity31.exponential_envelope
