# Compact C audit — cut selection and exact safety profiles (26 Nov 2026)

Status: PARTIAL / source-matched human derivation and executed finite regressions, not new native replay. Attribution: compact RH/GRH proof, Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Current mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript blob 57e7f36aa8032da2dd16f54a539e23d992a7cf96. Prior audit 129d788fbbd30b331faaf99d14e4429e622c101b; integration c423f7ffc801dd991c5a0c01e60be57401b04b4e and 248ac90ffbebd880fc50e0ecd41858646ad01902. Use compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Older outer-shell mission is superseded by the current compact migration. No URT premise, no protected workflow changes.

## 1. Exact native interfaces
Paths relative to grh-compact/src:
- New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395, lines 164–286, killsCokernel_at_cut, scaledCupBounds_of_cut_windows, scaledCupBounds_sparse_thick and scaledCupBounds_two_sizes.
- New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141, HasDeepPoint lines 75–79, pointsOver_nonempty_of_killsCokernel 153–159, pointsOver_nonempty_of_costs 197–206, scaledCupBounds_of_points_at_cuts, pointsOver_nonempty_of_long_gap.
- New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046, improvedExponent line 35.
- New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487, raisedAtE and sum_twoWindows_le.
- New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79 calls the sparse and two-size lemmas in the first two cases of crystalline_defect_le. Third few-low branch is separate. New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc supplies the actual universalSide and mem_cupOrthogonal_of_scaledCupBounds. Keep all native chart, coefficient, integrality, cocycle, rank and local-group hypotheses.

Write sigma for letterFrob, stepBack(a)=sigma^(-a), and J for the native walk parameter. All statements below assume the source guards of scaledCupBounds_of_cut_windows, including hW, hU, hX, hκ, hδ, h8, hη, hs, hy, hK, hz, hd, he, hL, H. No assertion of these guards by numerical experiments. In particular W>=V+4η, η>=1, β_i+s_i+W<=2b, s_i<β_i at every cut (or s_i=0), and l(i) is the least POSITIVE backward cut, <=2J+1. The conditional long-gap case H carries unramified, p>=5, s_(previous cut)=0, t+J+1=l, (s_i=0 or t=0), N=s0+G sum_(j=0)^J p^j<β_(stepBack t), and its opposite-sign/short-window constraints.

## 2. Sparse-thick cut and exact exception index

Take C(i) iff no thick letter T occurs in the next J forward positions. Suppose no C in the backward range 1..2J+1 from i. At depth 2J+1 the absence of C supplies a thick letter at depth a in [J+1,2J]. Absence of C there supplies a second thick letter at depth a-d>=1 with 1<=d<=J. Absence of C at the second gives a third within J forward steps. This violates the native three-thick prohibition, including for periodic orbits (letters need not be distinct). Thus a positive backward cut exists in the range.

If a thick letter occurs at backward depth 0<a<l, it is not a cut by minimality. Choose a following thick letter within J steps. Then C holds at depth a+J+1: a thick letter in its next J positions would give a preceding thick letter within J of the thick letter at a, completing a forbidden triple. Minimality gives l<=a+J+1; C at depth l forbids a thick within J, so l>=a+J+1. Hence **a+J+1=l**. In particular at most one thick letter with positive depth <l; depth zero may be thick too. The proof must not assume at most one thick in the entire half-open segment.

Since the thin window β+V<=η is contained in [-η,η], if all non-negligible letters have the same sign, use the ordinary branch of H with any representative of that sign (or t=0 if none). Otherwise the only two non-negligible letters are depth 0 and t=l-J-1>0, with opposite signs; use that positive t in the exceptional H branch. The sparse lemma takes s identically zero, n=2W, G_parameter=2W, s0=floor(3b/5). All letters strictly between t and l are thin; their β+W<=2W. For p>=2, sum_(a=0)^J p^a <=2p^J. Consequently s0+2W sum <=3b/5+4Wp^J < b by b>=11(p^J+1)W (W>0). The exceptional sign case needs the native disjunction unramified p>=7 or constant signs; constant signs force the ordinary branch. The other numerical caller guards remain as in the source, not inferred merely from this cut lemma.

## 3. Two-size cut and exact floor

Use source p>=7, 5W<=G<=b, b<Kp², 2G<Kp, W<=K, and W>=V+4η, η>=1. Put B=floor(b/p), s_i=max(B-7K,0) when sigma(i) is thick, else 0. The cut predicate is s_i<β_i with β_i=b or G. Every thick letter is a cut since s_i<=B<b (b>0). A noncut must be thin, have thick successor, and satisfy B>=G+7K. Hence consecutive noncuts are impossible; the positive backward cut distance is at most 2 (source permits 3). When l=1, H's ordinary branch applies. When l=2, the intermediate letter is noncut thin, i is thick, and the previous cut has s=0 since its successor is thin. Choose t=0; if signs agree or thin is negligible the ordinary branch applies; otherwise use exceptional branch, with J=1, s0=B+12K, G_parameter=G+W. The requisite strict inequality is exact:
 b-[B+12K+(G+W)(1+p)]
 >= (p-1)(G+7K)-12K-(p+1)(G+W)
 >= -2G+(6p-20)K > (5p-20)K > 0.
No replacement of B by b/p inside s_i and no division by a potentially zero quantity. The other numerical guards of scaledCupBounds_two_sizes still have to be checked at the actual caller; no claim of complete independent reconstruction of killsCokernel_at_cut.

## 4. Exact depth profiles and both HasDeepPoint inequalities

Fix a cut i and a side with orientation ρ=±1, its opposite side oriented -ρ. At every backward position a, u is an allowed jump of the first side (large window sign -ε/ρ), v of the other. Define
 A(a)=η if a<=2J, else 0;
 std_l(a,u)=0 if a<l, else -u;
 R_ρ(i,a,u)=max(std_l(a,u),-u-A(a)) if the side leads, else -u-A(a).
The side leads precisely when ε(stepBack(t))=ρ. The other side's R' and any previous cut's R' are always >=-v-A(a) at their own position a. The third profile is Z_i(a,w)= -w-s_i*1_(a=0); at the Tate weight w=-u-v-1 this is u+v+1-s_i*1_(a=0). Retain the +1 exactly.

Ordinary point: initial profile and depth L0=-u-s_i*1_(a=0) via pointsOver_nonempty_of_killsCokernel. Raise depth to D=-u+s_i*1_(a=0)+A(floor(a/2)). After pointsOver_nonempty_of_costs the point profile is D if L0>0, else min(D,0), by improvedExponent. It dominates R: for a>=l this follows from L0=-u and D>=-u. For a<l, R can be positive only if u<-η, hence u is a large negative jump, giving L0>0 since s_i<β_i or s_i=0. When leading on the ordinary branch all significant letters before l have the selected sign, so u<=η and D>=0; this verifies the additional std_l=0 requirement even if L0<=0. A nonleading side only requires R=-u-A. This also covers the ordinary side in the exceptional branch. At a=0 all s_i guards are used before taking the minimum.

For the first HasDeepPoint comparison, using R'>=-v-A(a) gives
 Z_i(a,-u-v-1)+D(a,u)+min(-v,R') >= 1+A(floor(a/2))-A(a) >= 1.
For the leading comparison choose the same cut r=0. Before l the other side has v>=-η so min(R',0)>=-v-A(a). From l onward the transported other profile is >=-v-A(a-l). Since l<=2J+1, A(floor(a/2)) dominates both A(a) and A(a-l) for a>=l. This proves
 Z_i+D+min(R',F_(l,0)R'_previous)>=1.
It is wrong to use A(a) in place of A(floor(a/2)) in this calculation: at a=l+2J the previous-cut margin can still be η when A(a)=0.

Exceptional leading point: use pointsOver_nonempty_of_long_gap at letter stepBack(t), length J+1, with height 2b, N=s0+G sum p^j<β_(stepBack t), and δ=X; hδ supplies e_chart*2b<=p^(J+1)X and h8 supplies its lower guard. Its exponent is κ+4X. Transport t steps: initial point profile is 0 for a<t, min(2b,-u-N) for a=t, and std_l(a,u) for a>t. The transported depth before t is 1 (not 0), at t is 2b, thereafter std_l. Raise to D(a,u)=2b for a=t, else std_l(a,u)+3A(floor(a/2)). At a<t and t<a<l the side's significant jumps have positive sign (or are negligible) so u>=-η; R=0 and D>=0. At a=t a negative jump below -η is in the large window and -u>N, so the initial profile is positive; D=2b dominates R. For other jumps at t, R=0. For a>=l the earlier ordinary argument proves dominance. This establishes the needed point profile on the SAME chosen lift.

The first comparison in this exceptional case: D>=-u+s_i*1_(a=0)+A(a). For a<l, a!=t, u>=-η, D=3η, and s_i=0 if a=0!=t. At t use β_i+s_i+W<=2b and W>=V+4η (if t>0 no s_i term); beyond l it follows from the delayed margin. Thus Z_i+D+min(-v,R')>=1.

For the second comparison choose r=l, the earlier cut with s_(stepBack l)=0, NOT r=t. Before l both transported profiles from that cut are zero. At a!=t the other side has v<=η, so min(R',0)>=-2η while D=3η. At t min(R',0)>=-v-η if v>=-η; that lower bound is valid here because v is in the positive window or small. With v<=β+V, D=2b, W>=V+4η and β+W<=2b, the sum is strictly positive. From l onward the transported third profile is u+v+1, and 3A(floor(a/2)) dominates both delayed margins in the minimum. This yields the exact second HasDeepPoint comparison. The third profile is antitone in its weight; its own point is the unchanged cokernel lift. The two sides together give all four native safety pairings via LongGap.scaledCupBounds_of_points_at_cuts; do not silently replace the 1 in difference-depth transport by 0. This audit checks the two quantified input comparisons of each side, not independently the integral-Hodge safety lemma.

## 5. Payment at the actual walk

Use the finite set of depth steps I in SparseThickLetters lines 228–234, positions a<4J+2 and twoWindows radius W+s_i*1_(a=0), centered at the signed β (the sign opposite the large jump). For ordinary depth increments this follows from -u-s to -u+s+A. For the exceptional case the t position has no increment, positions a<l other than t run from 0 or 1 to 3η (inside the central window), and positions a>=l run from -u to -u+3A. There are no other increments. Apply native sum_twoWindows_le with hd and hs: each position costs <=72X. For a>0 use W<=n, 4n+2<=6n, a<=4J+1 and hX. At a=0 a positive s_i forces the unramified branch of hK, where differentExp=0; otherwise radius W<=n. This avoids multiplying the potentially large s_i by the different exponent. Total cost <=72(4J+2)X; initial κ+4X plus that is <=25κ since κ>12(J+1)X. Ordinary initial cost κ is smaller. The third point costs κ. Then 25κ+25κ+κ=51κ<=e. This is the rank-free actual same-witness exponent, not a sum over the number of letters or rank.

Original source frontier (unchanged): crystalline_defect_le -> scaledCupBounds_sparse_thick / scaledCupBounds_two_sizes -> scaledCupBounds_of_cut_windows -> killsCokernel_at_cut, long-gap, pointsOver_nonempty_of_costs, HasDeepPoint, walk -> safety / period ring; mem_cupOrthogonal -> defect -> C. Reduced human view replaces the finite cut selection and the quantified profile inequalities/payment by §§2–5 only. All cokernel, long-gap, integral frame, depth operator, continuity and period-ring inputs remain; no deletion in the elaborated graph, no new axiom audit, no imported RH theorem. Other consumers unchanged. The native pruning/auto tools for the old pin do not automatically check this compact replacement. lean and lake absent locally; context key is the compact pin + side orientation + current/earlier cut + actual jump window, never declaration alone.

## 6. Executed regression certificate
Python 3 in local container, exact integers, no simulated Lean result. The following is the executed script (finite bounded diagnostics, NOT proof of universal claims).

```python
from itertools import product
from collections import Counter
C=Counter()
for L in range(1,10):
 for bits in product((0,1),repeat=L):
  for J in range(1,5):
   T=lambda i: bits[i%L]
   if any(T(i) and T(i+s) and T(i+s+t) for i in range(L) for s in range(1,J+1) for t in range(1,J+1)): continue
   cut=lambda i: not any(T(i+t) for t in range(1,J+1))
   for i in range(L):
    l=next((a for a in range(1,2*J+2) if cut(i-a)),None)
    assert l is not None; C['sparse_backward']+=1
    for a in range(1,l):
     if T(i-a): assert a+J+1==l; C['sparse_exception']+=1
for p in (7,11,13,17):
 for K in range(1,7):
  for W in range(1,K+1):
   for G in range(5*W,(K*p-1)//2+1):
    for b in range(G,K*p*p):
     B=b//p; s=max(B-7*K,0)
     assert s<b
     if s>=G:
      assert B+12*K+(G+W)*(1+p)<b
      C['two_size_gap']+=1
     C['two_size_floor']+=1
examples=[(1,1,0,True,False,5,[1],[40],0),(1,2,0,False,False,5,[1,1],[40,40],0),
 (2,3,0,True,False,0,[1,1,1],[40,5,40],0),(2,4,0,True,True,5,[1,-1,-1,-1],[40,5,5,5],15),
 (2,4,1,True,True,0,[-1,1,-1,-1],[40,40,5,5],15),(2,4,1,False,False,0,[1,-1,1,1],[40,40,5,5],15)]
for J,l,t,lead,exception,s,signs,betas,N in examples:
 eta,V,W,b=2,2,10,40
 A=lambda a:eta if a<=2*J else 0
 std=lambda a,u:0 if a<l else -u
 for a in range(6*J+5):
  sign=signs[a] if a<l else (-1 if a%2 else 1); beta=betas[a] if a<l else 40
  jumps=lambda r: sorted(set(range(-eta,eta+1))|set(r*x for x in range(beta,beta+V+1)))
  R=lambda u:max(std(a,u),-u-A(a)) if lead else -u-A(a)
  R2=lambda v: -v-A(a)
  prev=lambda v:0 if a<l else -v-A(a-l)
  for u,v in product(jumps(-sign),jumps(sign)):
   if exception:
    lo=0 if a<t else min(2*b,-u-N) if a==t else std(a,u)
    d=2*b if a==t else std(a,u)+3*A(a//2)
    zlead=0 if a<l else u+v+1
   else:
    lo=-u-(s if a==0 else 0)
    d=-u+(s if a==0 else 0)+A(a//2)
    zlead=u+v+1-(s if a==0 else 0)
   z=u+v+1-(s if a==0 else 0)
   improved=d if lo>0 else min(d,0)
   assert improved>=R(u)
   assert z+d+min(-v,R2(v))>0; C['first_safety']+=1
   if lead:
    assert R(u)>=std(a,u)
    assert zlead+d+min(R2(v),prev(v))>0
    C['leading_safety']+=1
   C['point_profile']+=1
assert 0+0+0==0
J,l,eta=2,4,2; a=l+2*J
assert a>2*J and a-l<=2*J and 1-eta<=0
print(dict(C)); print('negative controls: 2')
```
Actual stdout: {'sparse_backward': 8307, 'sparse_exception': 1015, 'two_size_floor': 1095560, 'two_size_gap': 226974, 'first_safety': 5760, 'leading_safety': 3968, 'point_profile': 5760}; negative controls: 2. The profile fixtures are bounded arithmetic diagnostics (some deliberately relax unrelated guards), not examples of actual Galois representations. Negative controls are algebraic failures of dropping the Tate shift or the delayed margin, not RH counterexamples.

Prepared executable Lean scalar certificate (extract to CutProfileAudit.lean in compact environment; NOT compiled or queued here; full native hypothesis bridge still requires local modules):
```lean
import Mathlib
namespace CutProfileAudit
theorem safety (u v s D R A : ℤ) (hD : -u + s + A ≤ D)
    (hR : -v - A ≤ R) (hA : 0 ≤ A) :
    0 < u + v + 1 - s + D + min (-v) R := by
  rw [lt_min_iff] at * <;> try omega
  rcases le_total (-v) R with h | h
  · rw [min_eq_left h]; omega
  · rw [min_eq_right h]; omega
theorem delayed (J l a : ℕ) (h : l ≤ 2*J+1) (ha : l ≤ a)
    (hprev : a-l ≤ 2*J) : a/2 ≤ 2*J := by omega
theorem payment (J X k : ℕ) (h : 12*(J+1)*X < k) :
    k+4*X+72*(4*J+2)*X ≤ 25*k := by nlinarith
#print axioms safety
#print axioms delayed
#print axioms payment
end CutProfileAudit
```
The preceding certificate is a prepared candidate, not a kernel result. Baseline receipt actually retrieved from cathedral-research-state/compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json, run 45799225653 completed success, source head 4c55b565a0583f08b6c87de5ae3ddfa8d3a9747a, named checks and standard axioms only. Run 45803534769 wrapper completed success but manuscript records task timeout in JetExponentBound; six individual named checks only. Neither run certifies this note. Preserve old logs and graphs.

RESUME HERE: Independently expand the remaining killsCokernel_at_cut induction (the invariant p^(J X) z^(x+n) and exact factorial budget), then the long-gap integral coefficient extraction at its actual caller. Check the prepared scalar candidate through existing allowed native replay if resources permit. HANDOFF TO: integration / human editor / mathematics. Integrate §§2–5 as source-matched only; do not mark C or RH human proof complete.

Verdict: AGREE / PARTIAL. Exact cut combinatorics and quantitative profiles reconstructed under source hypotheses, finite diagnostics actually run, native root closure count zero.
