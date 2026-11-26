import New.Columns.JetExponentBound
import Mathlib.Tactic

/-!
RUN59 — 26 November 2026. Exact stage support and marked low-column
charge, human source-matched derivation. Native replacement replay pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(latest commit returned by upstream connector), Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
d185408f9b17703c84b1584444bfde1f65d57e74. Read protocol/handoff/expansion,
AGENTS, continuity/state/log excerpts. Peer theta 663c88ca closes e=0;
acceleration 03380f28 aggregates marked orbit mass; kernel 5c9704e4
independently audits RUN58 weighted interpolation and supplies depth mass.
Do not duplicate those results. RUN55 invoked sum_lowColumns_le without
deriving it; here prove that exact supplier and explicit stage support.

Source ledger (relative to grh-compact/src):
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  35–57 (short, loss, ceilLogM, deltaP, served); 75–78 kappa.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  77–106 IsMarked, IsFullMark, evenPlaces, lowColumns, lowBoxes.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  29–35 scale; 80–116 k,t,h,n; 126–134 tops and weights.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  21–35 c_ge, thick class; 131–181 size bounds; 195–211 k,t,h2.
New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
  29–37 exact w bounds.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  64–92 marked support/balance; 155–163 low-column/box bounds;
  208–221 marked stage charge.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  255–260 exact gauge consumer; 285–307 local index consumer.

1. Exact stage support from kappa, before bounding.
Fix actual D, j<m and any sigma. Write k=D.k>=2, t=D.t,
H=D.h, L0=t+1>0, Q_sigma=(D.w 1 sigma-floor((k+L0)/2))_+
and C=(H-L0)_+, with natural truncated subtraction.
The stage cutoff is n(j+1)=k+(j+1)L0. Excluding h=1, the only
possible nonzero kappa columns are h=k with count Q_sigma and
h=k+i L0, i=1,...,j, each with count C. The endpoint i=j+1 is
excluded by the strict range. This includes j=0 and zero counts.
Thus exactly
  R_j(sigma)=Q_sigma+j C,
  2 B_j(sigma)=2 k R_j(sigma)+L0 C j(j+1).
No dependency on top membership is left in these counts; only
the two nominal weight classes remain. This is a mathematical
closed form for the native lowColumns and lowBoxes, not a claim
that Lean has pruned any binder.

Let w=nominalWeight(sigma). Weights.29 gives w1>=w+h2,
and k+t+1<=h2, so Q_sigma>=w. Weights.36 gives Q_sigma<=w+x^42.
Hence R>=w, B>=kw. From the SAME D size conditions:
  x>=2, m<=x, k<=x^6, L0<=x^6, H<=x^41,
  n(m)<=x^6, f<=x^12, a>=xb.
For example log x>=100 log logB>=10^14 P.c, P.c>=64;
m<=2 sqrt x; k<=r<=3x^5, L0<=15x^5+1;
H<=exp(27)x^40, n(m)<=exp(12)x^5.5.
The f guard follows from log f<=11 log x+(log logB)/5+P.c
<= (11+.002+1e-14) log x.
Therefore R<=w+2x^42<=w+x^60 and
  B<=kw+2x^48+x^49<=kw+x^60
since j(j+1)/2<=m^2<=x^2. This derives all three original
lowColumns_lowBoxes_bounds with the original constants.
The finite sums can now be evaluated by the same two closed
forms, with cache keyed by D,j,thick membership; not a measured
speedup or a new asymptotic prime bound.

2. Marked support and exact symmetry.
Fix the actual prime p and IsMarked Lambda. If Lambda empty,
its evenPlaces is empty, both charge terms zero. Otherwise
p is served; let g=placeOfInt(-p), pi=class modulo N0, d0=ord(pi(g)).
For any sigma inducing l or star(l), l in Lambda, choose the
native top tau_l inducing l. The native inducedPlace_eq_or_star_iff
gives sigma=g^i tau_l. Since pi(tau_l)=1 and d0 odd, pi(sigma)
lies in an odd-order cyclic subgroup and cannot be -1, whose
order is 2 (N0>2 in actual P). Thus every such sigma is nonthick.
This proves the nonthick support from the group orbit, not a
counting heuristic. Multiplication by g conjugates induced
places, so both endpoints are nonthick and w_j equals at both
for every j. The signed sum_inducedPlace_sub_star_eq_zero follows
by this single bijection, for every G as in the native theorem.
R_j and B_j are also constant on that support by section 1.
If d0=1 all these sigma are tops, by the same expression for
pi(sigma). No need to assume thick is the full class -1.

3. Supply the exact sum_lowColumns_le at the marked gauge caller.
Write r0=ceilLogM(p), u=a/(pm), L=logB, E=#(tops intersect evenPlaces)*a/x1.
From p<x1, a>=xb and m<=x we have u>=b/x1>=x^64:
log b-log x1>=64 log x by scale. Also x1>=x^1000000.
Since p>=2 and m>=1, r0<=m (p^m>=m). The native deltaP=r0*f*(n(m)+r0).
It is <=2x^19<=x^20<=u. Since #Lambda<=f,
  #Lambda*deltaP <= f*u.
For each even sigma, section 2 and the actual low-column estimate give
  R_j(sigma)<=a/x1+x^60.
Case p<m: using r0<=m, 2m^2 p<=2m^3<=x1 gives
r0*a/x1<=u/2. Also r0*x^60<=x^61<=u/2.
Hence r0*R_j<=u.
Case p>=m: since m>1, r0=1. The served condition d0<=r0
forces d0=1, so every even sigma is a top. Thus
r0*R_j<=u+a/x1. Combining these cases gives for EVERY even sigma
  r0 R_j(sigma)<=u+1_(sigma in tops)*a/x1.
Sum over the same evenPlaces; its cardinality<=f. Adding delta:
  #Lambda*deltaP+r0*sum_even R_j<=2f*u+E<=loss(p)/m+E,
where L^2>=2 and le_loss gives f L^2 u<=loss(p)/m.
This is precisely Data.IsMarked.sum_lowColumns_le for every j<m,
including empty Lambda, with no new mark or p-dependent witness.
RUN55's same-stage subtraction now applies without leaving this
arithmetic supplier as a premise; theta 663c88ca supplies its
previously missing ramified e=0 bound on the jet side.
Keep the native Schur-jet gauge, Hecke transfer, marked type
and level Fourier and all other A/B/C prerequisites separate.

4. Verification boundary and reproducible exact regression.
Local Python executed the following finite structural checks
(exact total 34920): 17280 column, 17280 box,
180 delta, 34 small-p, 146 large-p; no violations. These tests use
the literal natural kappa/range shape with small parameters and
an integer model of the scalar inequalities, not a construction
of native admissible D or a proof of the universal estimates.
```python
from collections import Counter
c=Counter()
for k in range(2,14):
 for t in range(1,13):
  for j in range(8):
   for H in (0,t,t+1,t+2,3*t+7):
    for w in (0,(k+t+1)//2,2*(k+t+1)+1):
     n=k+(j+1)*(t+1)
     def kap(h):
      if h==1:return 17
      if h==k:return max(0,w-(k+t+1)//2)
      if h>k and (h-k)%(t+1)==0:return max(0,H-(t+1))
      return 0
     R=sum(kap(h) for h in range(n) if h!=1)
     B=sum(h*kap(h) for h in range(n) if h!=1)
     q=max(0,w-(k+t+1)//2); C=max(0,H-(t+1))
     assert R==q+j*C;c['column_identity']+=1
     assert 2*B==2*k*R+(t+1)*C*j*(j+1);c['box_identity']+=1
for x in range(2,20):
 for m in (1,x):
  f=x**12;n=x**6;a=x**100;x1=x**10
  for p in (2,max(2,m-1),max(2,m),m+1,x1-1):
   if p>=x1:continue
   R=0;v=1
   while v<m:v*=p;R+=1
   assert f*R*(n+R)*p*m<=a;c['delta_budget']+=1
   if p<m:
    assert R*(a+x**60*x1)*p*m<=a*x1;c['small_p_budget']+=1
   else:
    assert R<=1 and x**60*p*m<=a;c['large_p_budget']+=1
print(dict(c),sum(c.values()))
```
No lean/lake executable (command -v checked). Native RUN29 actual
status a56e2d3a / targeted_results 088cd2ec read from state branch:
run 45803534769 A timeout 2700.11s; B/C six named probes report
standard three axioms, all_requested_checks_ok=false. Later
orchestrator summary 69dd9d51 is not native validation.
Native rh_scan/prune/reduce/auto/frontier not executable locally.
Prepared scalar certificates below, not native replacement proofs.
Original static chain: kappa/range -> lowColumns_lowBoxes_bounds ->
marked support, deltaP -> sum_lowColumns_le -> gaugeLe_Bmu_of_isMarked
-> exists_indexDvd_Bmu_divisible -> short_forms -> star_inequality.
Candidate substitutes closed-form arithmetic and exact marked support
at those same consumers. All original and reduced graph/axiom archives
untouched; no claim of kernel edge deletion or RH closure.

RESUME HERE: independent audit of section 3 at exact JetExponentBound
208–221 and source scale inequalities; integrate sections 1–3 with
RUN55, theta 663c88ca and acceleration 03380f28. Next inspect actual
Schur-jet charge transfer at LocalStatement.mem_raises lines 95–143
(the tableau-column injection, not the already settled marked orbit
or scalar budget). Native kernel lane to batch A-only replay using
approved runner; no competing job. Keep level Fourier in theta lane.
HANDOFF TO integration, editor, theta, audit, kernel.
-/

namespace CompactPrimeRun59

theorem stage_charge_small (r w err u : ℝ)
    (hr : 0 ≤ r) (hw : r*w ≤ u/2) (he : r*err ≤ u/2)
    {R : ℝ} (hR : R ≤ w+err) : r*R ≤ u := by
  calc
    r*R ≤ r*(w+err) := mul_le_mul_of_nonneg_left hR hr
    _ = r*w+r*err := by ring
    _ ≤ u := by linarith

theorem stage_charge_aggregate (K f delta u E S lossOverM : ℝ)
    (hK : K ≤ f) (hd : delta ≤ u) (hd0 : 0 ≤ delta)
    (hf : 0 ≤ f) (hS : S ≤ f*u+E) (hL : 2*f*u ≤ lossOverM) :
    K*delta+S ≤ lossOverM+E := by
  have h : K*delta ≤ f*u :=
    (mul_le_mul_of_nonneg_right hK hd0).trans
      (mul_le_mul_of_nonneg_left hd hf)
  linarith

end CompactPrimeRun59

#check Data.lowColumns_lowBoxes_bounds
#check Data.IsMarked.notMem_thick
#check Data.IsMarked.sum_inducedPlace_sub_star_eq_zero
#print axioms Data.IsMarked.sum_lowColumns_le
#print axioms CompactPrimeRun59.stage_charge_small
#print axioms CompactPrimeRun59.stage_charge_aggregate
