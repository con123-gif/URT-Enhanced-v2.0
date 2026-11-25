# RUN27 — unconditional elimination of within-block variation at the RH exponent
25 Nov 2026. Mission lane 3. PARTIAL: human mathematical reduction and executed real-prime regression; remaining long-range signed block budget OPEN. No RH proof.

Preflight: read current ONE_EQUATION_MISSION (blob 8dc6705e1bc6540b600f6c22309294466ec88fd0, including 4b677bc2 mandatory engine), SWARM, HANDOFF, EXPANSION, AGENTS, continuity and state/runner/CI excerpts, RUN25 7a9ec19f and RUN26 003dfd86, latest 20 commits through 2bfc11da. Relevant peers inspected: 8bfe5c65 short-gap pair removal, b0afce1d L2 resolvent, 2bfc11da Gaussian tail, 6fec2cae dyadic witness, d5e73014 derivative-free shift, 05530e1b signed auxiliary characters. Unlike the short-gap pair estimate, the present bound controls all centered within-cell variation at width X^(1/2+eps) without needing a prime pair theorem or short-interval PNT. Unlike RUN25 this takes signed means, not square-node pointwise values. No exhaustive peer archive reread.

## Actual unconditional estimate
Put c=1-log 2, W(x)=sum_{x/2<p<=x}(2-x/p)log p and D(x)=cx-W(x). Fix real alpha=1/2+eps in (1/2,1), dyadic integer X>=2 and H=floor(X^alpha)>=1. Partition [X,2X] into consecutive intervals I=[a,b] of integer length h<=H (last may be shorter); endpoints are immaterial to integrals. Let A_I=int_I D(x)dx and m_I=A_I/h.

The prime exits at x=2p continuously (weight zero) and enters at x=p with a downward jump log p in D. Between events D'(x)=c+sum_{x/2<p<=x}log(p)/p. Elementary Chebyshev theta_P(t)<=4(log 2)t, as in RUN25, follows by induction using primes in (ceil(n/2),n] dividing binomial(n,floor(n/2)); hence 0<=D'<=c+8log 2<6. Total variation on a cell is at most V_I=6h+sum_{a<p<=b}log p, using the right-continuous convention. All sums use actual primes. Summing V_I over the partition gives <=(6+8log 2)X. No assumption on local prime distribution.

Exact signed averaging BEFORE absolute values:
  int_I (D-m_I) = 0,
  int_I (D-m_I)_+ = (1/2)int_I |D-m_I|.
Jensen for the absolute value, then the variation measure |dD|, gives
  int_I |D-m_I| <= (1/h)int_I int_I |D(x)-D(t)| dx dt
    <= (2/h) int_I (v-a)(b-v) |dD|(v)
    <= (h/2)V_I.
The middle inequality follows by Fubini on pairs straddling v; endpoints have zero kernel. Also A_I^+<=int_I D_+ and D_+<=(m_I)_+ + (D-m_I)_+. Therefore the decisive unconditional bound is
    0 <= int_X^(2X) D_+(x)dx - sum_I (A_I)_+
       <= ((6+8log 2)/4) X H.
This removes all within-cell signed oscillation from the positive-part budget at width X^alpha (no logarithmic loss). By the zero mean, the exact energy identity also holds: int_I D^2=h*m_I^2+int_I(D-m_I)^2, with zero mixed term. Do not replace signed A_I by an integral of |D| before applying this argument. The positive-part result does not require a mean-square estimate.

## Remaining single sufficient scalar budget
For every alpha=1/2+eps in (1/2,1), it suffices to prove that there are fixed C>=0 and delta>0 such that for arbitrarily large integers J, each complete dyadic block X=2^j, J<=j<floor((1+delta)J), obeys
    sum_{I in partition(X,floor(X^alpha))} (int_I D)_+ <= C X^(1+alpha).     (OPEN)
Only O(X^(1-alpha)) signed cell integrals enter a dyadic block. No requirement to bound every cell or every individual prime pair. This is a sufficient aggregate budget, not a proof it holds. On each such dyadic block, monotonicity of x^(-alpha-1) gives int D_+(x)x^(-alpha-1)dx <= C+(6+8log 2)/4. Summing O(J) blocks covers [Y,Y^(1+delta/2)] for Y=2^J sufficiently large. By peer 596dc680 let g(u)=-B_2(exp u), where B_2 is the centered von Mangoldt shell. The bounded deterministic baseline discrepancy <=2 and nonnegative higher prime powers give g(log x)<=D(x)+2. Set R=max(g,0), U=log Y; measurability and local integrability follow from the actual finite shell sums, and int_U^((1+delta/2)U) R exp(-alpha*u)du=O(J). For every eta>0 this is <= exp(eta U) eventually along the same arbitrarily large J, with delta/2 fixed before eta and any U0. This is precisely WindowHypU; nonvanishing multiplier, pole data and functional equation are from 596dc680, not independently rechecked in Lean here. No control on D outside the selected windows, no RH assumption. If a global estimate is available it also suffices. The direct signed block averages can be evaluated by the primitive
    Q(t)= c*t^2/2 - sum_{p<=t} (p log p/2)*(1-clamp(2-t/p,0,1)^2),
    A_I=Q(b)-Q(a).
The identity follows by integration of each triangular ramp. It provides an exact finite aggregate of actual primes with no pair expansion. The unresolved problem is long-range cancellation of these signed increments, not the within-cell variation bound. No improvement on the RH exponent of the actual coarse budget is asserted.

## Provenance / original and proposed graph
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Fresh upstream head ef451fc356cbc66861df031531aaafd2843797ac at 25 Nov 09:07:15 UTC (advanced from RUN26's 75e2012d); not mixed into proof. Fresh pinned source:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, PoleData L15–23, WindowHypU L25–29.
- same directory LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a, landau_window_key L40–73 and landau_window L83–84.
- LandauTheorems/ZeroFreeOfRpowWindow.lean blob 2ed00ad3aa862f3e522686557fb8f559b17fc002, zeroFree_of_rpow_window L11–14 calls lemmaL and windowHyp_of_rpow.
- LandauTheorems/WindowHypOfRpow.lean blob dde1c159371538875c28374574ca7e452b0450d9, windowHyp_of_rpow_eventually L9–25, windowHyp_of_rpow L27–57 (exact log integral).

Original graph retained (no deletions): Main.riemannHypothesis -> rhOfAll -> rh_of_every -> EveryCharacter -> original theta/Green/TopG and family suppliers -> zeroFree_of_rpow_window -> lemmaL -> landau_window. Proposed RH-only overlay: conditional half-strip root <- principal zeta nonvanishing <- generic landau_window plus peer singleton PoleData <- positive-part WindowHypU <- OPEN signed block budget + unconditional BV estimate above. Original graphs, types, value, constructor edges, other consumers, unresolved axioms and pending nodes retained. Context key (pin, principal character, alpha, fixed delta, dyadic X, partition width H, exact centered prime shell); no cache reuse across changed observable or alpha. Backtracking: if signed aggregate cannot be estimated, retain direct prime bound and native all-character supplier route; do not infer from finite means. Not claiming this new overlay is the pinned proof's elaborated dependency graph.

Native engine source read RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, AutoV3 a113dc56ea987abac3bf29eb480782140b82ab4a, RHProofTermPrune f6d3e7f6047a7895ecf183be3fb54c203f4fc46a. Verified published actual CI status tails on cathedral-research-state: strip-root b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc pass (98.87s), reduced_strip_root axioms propext/Classical.choice/Quot.sound; prune 7da354941e402b6f8b364ed03d8c5c82d27b7717 pass (77.94s), rh_of_right 2000 visited 324 pending, no binder deletion, same three axioms. Prior CI only, not this reduction. General CI #432 (45579236958) predates result. No lean/lake on local PATH. Prepared source-matched positive-part adapter and actual theorem scan/prune commands below, not executed/queued; handoff to kernel lane to batch with full pinned environment. Do not report native PASS for this run.

## Actual local regression
Local CPython/NumPy, exit 0; 82,025 primes through 2^20, 1,712 cells in 12 dyadic partitions. Exact-on-affine-pieces integration with floating logs (no quadrature, no interval-certified arithmetic). Max D slope 1.0199145735686592; max actual centered positive variation / theoretical cell budget 0.08216167741508211; max absolute energy decomposition residual 8.344650268554688e-07. All cell inequalities held with stated roundoff tolerances. At X=524288, alpha=.51, H=826, normalized coarse positive sum .20280085; normalized fine excess .0010646484; normalized bound 1.7491499. At alpha=.6, H=2702, coarse .061606463, fine excess .00070708047, bound 1.7491445. At alpha=.75, H=19483, coarse .0081972133, fine excess .00044543742, bound 1.7442845. These are finite checks only.

Reproduce (extract Python block, run with NumPy):
```python
import math
import numpy as np
N=2**20
s=np.ones(N+1,dtype=bool); s[:2]=False
for p in range(2,math.isqrt(N)+1):
    if s[p]: s[p*p::p]=False
pr=np.flatnonzero(s); lp=np.log(pr.astype(float))
P=np.r_[0.,np.cumsum(lp)]; R=np.r_[0.,np.cumsum(lp/pr)]
c=1-math.log(2)
def posint(a,b):
    aa=np.maximum(a,0); bb=np.maximum(b,0)
    out=(aa+bb)/2
    crossing=(a<0)&(b>0)|(a>0)&(b<0)
    out[crossing]=(aa[crossing]+bb[crossing])**2/(2*np.abs(b[crossing]-a[crossing]))
    return out
count=0; max_ratio=0.; max_slope=0.; max_orth=0.
for X in [2**10,2**14,2**18,2**19]:
    j=np.arange(X,2*X,dtype=np.int64)
    l=np.searchsorted(pr,j/2,side='right'); r=np.searchsorted(pr,j,side='right')
    slope=c+R[r]-R[l]
    a=c*j-2*(P[r]-P[l])+j*(R[r]-R[l]); b=a+slope
    max_slope=max(max_slope,float(slope.max())); assert np.all((slope>=c-1e-12)&(slope<=6))
    pa=posint(a,b); signed=(a+b)/2; energy=(a*a+a*b+b*b)/3
    for theta in [.51,.6,.75]:
        H=int(X**theta); starts=np.arange(0,X,H); ends=np.r_[starts[1:],X]; h=ends-starts
        agg=np.add.reduceat(signed,starts); m=agg/h
        coarse=np.maximum(agg,0); actual=np.add.reduceat(pa,starts)
        mm=np.repeat(m,h); fine=np.add.reduceat(posint(a-mm,b-mm),starts)
        lo=np.searchsorted(pr,X+starts,side='right'); hi=np.searchsorted(pr,X+ends,side='right')
        tv=6*h+P[hi]-P[lo]; budget=h*tv/4
        gap=actual-coarse
        assert np.all(gap>=-1e-6) and np.all(gap<=fine+1e-6)
        assert np.all(fine<=budget+1e-6)
        assert float(np.sum(budget))<=((6+8*math.log(2))/4)*X*H+1e-6
        fine2=np.add.reduceat(((a-mm)**2+(a-mm)*(b-mm)+(b-mm)**2)/3,starts)
        resid=np.max(np.abs(np.add.reduceat(energy,starts)-h*m*m-fine2))
        max_orth=max(max_orth,float(resid)); assert resid<1e-4
        max_ratio=max(max_ratio,float(np.max(fine/budget)))
        count+=len(h)
        print('X',X,'theta',theta,'H',H,'cells',len(h),'coarse',format(float(np.sum(coarse)/X**(theta+1)),'.8g'),'fine_excess',format(float(np.sum(gap)/X**(theta+1)),'.8g'),'fine_bound',format(float(np.sum(budget)/X**(theta+1)),'.8g'))
print('primes',len(pr),'cells',count,'max_slope',max_slope,'max_fine/budget',max_ratio,'max_orth_abs_resid',max_orth)
```

## Prepared Lean bridge (NOT COMPILED)
Extract to a module in pinned Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474 with the three engine modules on LEAN_PATH. Does not import Main or use RH. This formalizes the final positive-part witness adapter, NOT the BV proof or OPEN coarse budget. Attempt rh_reduce/rh_auto on actual adapter, use rh_prune/rh_scan on original reachable source declarations; check output before claiming deletion or axiom status.
```lean
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.WindowHypOfRpow
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

open MeasureTheory Set
noncomputable section
namespace RHPrimeBlock

theorem positive_window {g : ℝ → ℝ} {θ δ : ℝ}
    (h : ∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U : ℝ, U₀ ≤ U ∧
      IntegrableOn (fun u => max (g u) 0 * Real.exp (-θ * u)) (Icc U ((1+δ)*U)) ∧
      ∫ u in Icc U ((1+δ)*U), max (g u) 0 * Real.exp (-θ*u) ≤ Real.exp (η*U)) :
    Deduction.WindowHypU g θ δ := by
  intro η hη U₀
  obtain ⟨U,hU,hi,hb⟩ := h η hη U₀
  exact ⟨U,hU,fun u => max (g u) 0,hi,
    fun u _ => ⟨le_max_right _ _,le_max_left _ _⟩,hb⟩

theorem reduced_pole_bound {g : ℝ → ℝ} {Φ : ℂ → ℂ} {Z : Set ℂ} {θ δ : ℝ}
    (hp : Deduction.PoleData g Φ Z) (ht : 0 < θ) (ht1 : θ < 1) (hd : 0 < δ)
    (h : ∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U : ℝ, U₀ ≤ U ∧
      IntegrableOn (fun u => max (g u) 0 * Real.exp (-θ*u)) (Icc U ((1+δ)*U)) ∧
      ∫ u in Icc U ((1+δ)*U), max (g u) 0 * Real.exp (-θ*u) ≤ Real.exp (η*U)) :
    ∀ ρ ∈ Z, ρ.re ≤ θ := by
  have hw : Deduction.WindowHypU g θ δ := by
    rh_reduce 3 using [positive_window]
  exact Deduction.landau_window hp ht ht1 hd hw

theorem pospart_transfer (d m r : ℝ) (h : d ≤ m+r) :
    max d 0 ≤ max m 0 + max r 0 := by
  apply max_le
  · linarith [le_max_left m 0, le_max_left r 0]
  · linarith [le_max_right m 0, le_max_right r 0]

-- Search on actual positive-part witness context; no assumption admitted.
theorem pospart_transfer_auto (d m r : ℝ) (h : d ≤ m+r) :
    max d 0 ≤ max m 0 + max r 0 := by
  rh_auto_frontier 2
  all_goals first | exact pospart_transfer d m r h | rh_auto 2

rh_prune Deduction.windowHyp_of_rpow as RHPrimeBlock.windowHyp_rpow_pruned
rh_scan Deduction.landau_window limit 2000
#print axioms positive_window
#print axioms reduced_pole_bound
#print axioms pospart_transfer
end RHPrimeBlock
```

RESUME HERE: estimate the signed increments Q(b)-Q(a) on all coarse cells in the same window, preferably via a genuine native signed supplier or arithmetic dispersion bound; within-cell oscillations need no more estimates at this scale. Audit the BV Fubini constant and fixed-delta quantifiers; kernel lane to replay the adapter and source prune/scan when actual source environment is available. HANDOFF TO math, Landau, audit, kernel, integration. RH OPEN. No URT test or improvement claim; prior work preserved.
