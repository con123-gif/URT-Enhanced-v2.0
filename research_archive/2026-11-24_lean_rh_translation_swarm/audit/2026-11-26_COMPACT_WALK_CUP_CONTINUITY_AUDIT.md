# Compact C audit — four-test walk, exact cup cancellation, and continuous descent

26 Nov 2026. AGREE / PARTIAL; independent source-matched audit and exact diagnostics, NOT a native Lean replay. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (latest binding primitive closure supersedes old window-only target); manuscript 2eea9dc47d0e037627e4f4c1894f0bc86426454e. Prior audit 1b2053e998b7dec44dd22474669d9e4e842fa6db. Reviewed editor 9a920a1a85651be37a94f9e0cc6f6da041f1c336 and integration 9e1dbfbe583d6c248b7687f7abb421698b913482; literature 3b3720f77ac06cb16aa1bf411376ddc4eeb1960d supplies frame/retraction, a separate remaining dependency. Read latest mission, AGENTS, protocol, state/log excerpts, handoff and peer commits. No URT premise or RH import.

## 1. Actual walk: source-context and four-test audit

Source paths relative to grh-compact/src:
- New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141, HasDeepPoint, isSafe_sum, phi_pow_smul_mem_pointsOver, isSafe_of_exponents, scaledCupBounds_of_points_at_cuts (68–77, 86–101, 218–308).
- New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046, frobExponent, tensor/exponent transfers.
- New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c:62–122.
- New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395:196–245 actual caller with e1=e2=25κ, e3=κ and 51κ≤E.
- New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79 actual defect consumer.
- Lib/PadicHodge/WachGamma/KisinModuleDefs.lean 344ef024f5ddaee84ab62c0753b8beafbfd602cb:89–127, smallPart_spec.
- Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791:100–102, galMonoid = image of inr restricted to Γ'. Thus g,h are genuinely Galois elements; not arbitrary powers of φ. KummerChartExists.lean class KummerChart supplies index_coprime.

Let l(i)>0 be the least positive backward distance to a cut, guaranteed for EVERY i. d_top(i)=0 at cuts, otherwise l(i); d_bottom=l; d_Q=0 only at a cut satisfying Q. Minimality gives l(i)=1+d_top(σ^{-1}i) by separating whether the predecessor is a cut. Reindexing finite letter sum shows φU_top(y)=U_bottom(y); no inverse integral Frobenius needed. All transported points project to the SAME p-power times constant at the target letter. Their sum projects to p^e(1⊗c) by sum_letterProj. Use the actual same witnesses x=U_top(y), w=U_Q(y), x'=U_top(y').

Write A,B for top at i, A0,B0 for bottom and W for Q first-side point. The exact four tests of CupProductBound.of_isSafe are:
1. ((g−1)A,g(h−1)B); 2. (W−A,(g−1)B); 3. ((g−1)W,g(B0−B)); 4. (A0−W,(g−1)B0).
At noncuts tests 2–4 vanish identically, test 1 uses ordinary preceding cut transport. At a cut Q=true: W=A, test 2 zero, test 3 uses first leading inequality with its OWN r, test 4 uses previous ordinary second-side depth. At a cut Q=false: W=A0, test 4 zero, test 2 uses second leading inequality with its OWN r, test 3 uses previous ordinary first-side depth. The third point for test 2 or 3 need not be at the previous cut l. Test 1 uses ordinary first depth and ordinary second point exponent (stable under h−1 and g); it does not require the second depth to equal the point exponent. The two directions of isSafe_of_exponents must be used as stated, not by assuming P is symmetric.

For the old-cut tests at a<l, leading point exponent ≥stdExponent(l)=0, old transported point exponent 0, old depth 1 and old third exponent 0. Thus 1+min(cur,0)=1>0. At a≥l, leading exponent cur≥−u; min(cur,old)≥min(−u,old), and reindexing (i.stepBack l).stepBack(a−l)=i.stepBack a reduces to the old ordinary inequality. The source profile guards are indispensable for this reasoning. This independently confirms editor RUN58's table.

## 2. Audit the strictness bridge and both exponent inequalities

Let Z(q) be the transported third profile at fixed a, antitone in q. For allowed jumps u,v and tensor test jump t≥u+v, strict integral inequality Z(−u−v−1)+o+o'>0 gives 1−Z(−t−1)≤o+o'. For third test jump q with q+t≤−1, antitonicity gives Z(q)+(1−Z(−t−1))≥1. This checks both actual applications of wittPairing_mem_withExponents, not only equality of jumps. If Z is not antitone the first implication fails already at u=v=0,t=1,Z(−1)=1,Z(−2)=0,o=o'=0. If >0 is weakened to ≥0 the unit Tate threshold fails at three zeros. Strictness of kernel inclusion, integral exponent tensor transport, Tate integral-lattice theorem at exponent 1, chart Teichmuller maximal-ideal property and normalized zTauUnit difference are retained. Distinct letters pair to zero by unit difference of their eigenvalues, not by a rank-dependent estimate. This independently confirms the two inequalities in integration 9e1dbfbe. No claim to have proved the foundational frame or BdR approximation theorem.

## 3. Ordered bilinear audit and continuity at the actual cup consumer

Write X,W,Y for first coordinates of x,w,x'. Let B be the bilinear pairing with p^e3 inserted. c_g,d_g are the additive extension-action offsets (the p^e1 and p^e2 multiples of native cocycles), fixed by φ. Set a_g=gX−X+c_g, b_g=gY−Y+d_g, A_g=gW−W+c_g, F=φX−X, F'=φY−Y. Retain equivariance of B and both cocycle equations. In M=W(C^flat)⊗Z/p^m(1) let S0=smallPart. Use smallPart_spec surjectivity of φ−1 to choose y with (φ−1)y=B(W,F'). Then the native D_g at 100–104 is
    D_g=B(c_g,gY)−B(X,b_g)+gy−y.
Exact ordered bilinear cancellation:
    (φ−1)D_g=B(A_g,gF')−B(φX−W,φ b_g)−B(W−X,b_g).
The terms on the right are precisely tests 3,4,2. The identity φ b_g=b_g+gF'−F' uses that d_g is Frobenius-fixed. Thus (φ−1)D_g∈S0. By smallPart_spec, choose unique κ(g) in Z/p^m(1) with D_g−1⊗κ(g)∈S0. No arbitrary choice of continuous cochain is made.
    δD(g,h)=B(c_g,g d_h)−B(a_g,g b_h).
Test 1 kills the second term modulo S0. Since S0 is Galois-stable and its intersection with constants is zero, this yields EXACTLY in the Tate module
    δκ(g,h)=scaled cup(c_g,d_h),
before multiplying by the remaining p-power r=p^(E−e1−e2−e3). This equality is not merely congruence modulo S0. No interchange of the two slots of B is justified or needed; an independent noncommutative symbolic expansion confirms both identities.

Explicit continuity argument (source 95–99,112–119): the native eventual p^m divisibility statements for the offsets imply c_h,d_h contribute zero for h sufficiently near identity; smallPart_spec applied to the fixed linear map B(X,·) and fixed Y gives B(X,hY−Y)∈S0 there. Apply the same spec with the Tate representation and identity linear map to y to obtain hy−y∈S0 there. The finite intersection of these eventual neighborhoods is still eventual; after nearOne_eq_nhds_one it is a neighborhood in the specified topology. Then D_h∈S0, whence κ(h)=0. For fixed g, d_h vanishes in the p^m pairing, hence δκ(g,h)=0 on that neighborhood and
    κ(gh)−κ(g)=gκ(h)−δκ(g,h)=0.
This gives local constancy at EVERY g by right variation, not only at the identity. The original global cup cocycle has the native continuity proof using eventual divisibility of the two cocycles and representation at fixed vectors; retain that separate proof, along with the open embedding hypothesis. Local constancy of κ near identity alone would not imply global continuity without the displayed coboundary equality. Keep the unscaled κ until after this argument; scaling cannot be inverted.

Finally restriction to the open subgroup Γ' kills the class by the actual continuous coboundary. Restriction-corestriction gives [Γ:Γ']·class=0. Since p^m also kills the cohomology and the chart index is coprime to p, Bézout gives class=0. The index premise is not optional: for Γ=C_p, subgroup {1}, trivial F_p coefficients, f(a,b)=floor((a+b)/p) for representatives a,b∈{0,...,p−1} is a normalized 2-cocycle (carry identity). Its restriction is zero but it is not a coboundary: summing δk(a,1) over a gives p k(1)+telescoping=0 mod p, while Σ_a f(a,1)=1. This is a rigorous counterexample to dropping the coprime-index guard, not to the native theorem. Thus all four safety tests, strict threshold, normalized kernel transfer, continuity and prime-to-p restriction are justified at the actual consumer with no extra orbit-size factor. In scaledCupBounds_of_cut_windows the same e1=e2=25κ, e3=κ yield E≥51κ, and crystalline_defect_le uses these via its actual cupOrthogonal/normLength_defect_le bridge.

## 4. Executed independent diagnostics and prepared certificate

Python 3 + SymPy, exact ordered symbolic expansion and integer arithmetic, no p-adic simulations. Reproduce:
```python
from itertools import product
from collections import Counter
from math import gcd
from sympy import symbols, expand
C=Counter()
c,X,W,gW,F,b,f,gf,gX,gY,gc,gb,gd,ghY=symbols('c X W gW F b f gf gX gY gc gb gd ghY',commutative=False)
L=c*gf-F*b-(X+F)*(gf-f)+gW*gf-W*f
R=(gW-W+c)*gf-(X+F-W)*(b+gf-f)-(W-X)*b
assert expand(L-R)==0; C['ordered_identities']+=1
L=gc*ghY-gX*gb-(c+gc)*ghY+X*(b+gb)+c*gY-X*b
R=c*gd-(gX-X+c)*gb
assert expand(L.subs(ghY,gY+gb-gd)-R)==0; C['ordered_identities']+=1
terms=[(gW-W+c)*gf,-(X+F-W)*(b+gf-f),-(W-X)*b]
for t in terms: assert expand(t)!=0; C['formal_nonzero_residuals']+=1
assert expand((gX-X+c)*gb)!=0; C['formal_nonzero_residuals']+=1
for n in range(1,9):
 for a in product(range(3),repeat=n):
  if not any(a): continue
  l=[next(k for k in range(1,n+1) if a[(i-k)%n]) for i in range(n)]
  top=[0 if a[i] else l[i] for i in range(n)]
  mid=[0 if a[i]==2 else l[i] for i in range(n)]
  for i in range(n):
   assert l[i]==top[(i-1)%n]+1
   A=((i-top[i])%n,top[i]); A0=((i-l[i])%n,l[i]); W=((i-mid[i])%n,mid[i])
   assert (W==A,W==A0,A==A0)==((True,True,True) if not a[i] else ((False,True,False) if a[i]==1 else (True,False,False)))
   C['walk_letter_states']+=1
for l,a,u,old,extra in product(range(1,7),range(13),range(-7,8),range(-7,8),range(5)):
 std=0 if a<l else -u; cur=std+extra; shifted=0 if a<l else old
 if a<l: assert 1+min(cur,shifted)>0
 else: assert min(cur,shifted)>=min(-u,old)
 C['old_cut_profile']+=1
for u,v,t,s,jump,intercept in product(range(-4,5),range(-4,5),range(-8,9),range(4),range(-7,8),range(-3,4)):
 if t<u+v: continue
 Z=lambda q:intercept-s*q+(2 if q<=jump else 0)
 z=Z(-u-v-1); z2=Z(-t-1)
 assert z2>=z
 assert 1-z2<=1-z
 for q in (-t-1,-t-2,-t-5): assert Z(q)+(1-z2)>=1
 C['antitone_transport']+=1
assert 1+min(-2,0)<=0
assert 0+min(0,0)<=0
Z=lambda q: 1 if q==-1 else 0
assert Z(-1)>0 and 1-Z(-2)>0
assert not (0+0+0>0)
k=[0,0,0,1]; assert k[2]==0 and k[3]!=k[1]
for p in (2,3,5,7,11,13):
 f=lambda a,b:(a+b)//p
 for a,b,c in product(range(p),repeat=3):
  assert (f(b,c)-f((a+b)%p,c)+f(a,(b+c)%p)-f(a,b))%p==0
  C['carry_cocycle']+=1
 assert sum(f(a,1) for a in range(p))%p==1
 if p<=5:
  for k in product(range(p),repeat=p):
   assert sum(k[1]-k[(a+1)%p]+k[a] for a in range(p))%p==0
   C['carry_non_coboundary_cochains']+=1
for p,m,n in product((2,3,5,7),range(1,5),range(1,25)):
 if gcd(n,p)!=1: continue
 for x in range(p**m):
  assert (n*x)%(p**m)!=0 or x==0
  C['coprime_annihilator']+=1
print(dict(C)); print('negative controls: 5; nonzero formal residuals: 4; carry obstruction: 6 primes')
```
Actual stdout: {'ordered_identities': 2, 'formal_nonzero_residuals': 4, 'walk_letter_states': 73776, 'old_cut_profile': 87750, 'antitone_transport': 306180, 'carry_cocycle': 4031, 'carry_non_coboundary_cochains': 3156, 'coprime_annihilator': 76680}. Negative controls: 5; nonzero formal residuals: 4; carry obstruction: 6 primes. Nonzero residual means formal algebra alone cannot drop the corresponding test, not proof of logical independence of native tests. These finite tests supplement the universal arguments, not a kernel certificate.

Prepared scalar probe (extract as WalkCupAudit.lean; NOT compiled):
```lean
import Mathlib
namespace WalkCupAudit
theorem tensor_threshold (Z : ℤ → ℤ) (hZ : Antitone Z)
    (u v t o o' : ℤ) (ht : u+v ≤ t)
    (h : 0 < Z (-u-v-1)+o+o') :
    1-Z (-t-1) ≤ o+o' := by
  have hh : -t-1 ≤ -u-v-1 := by omega
  have hz := hZ hh
  omega
theorem dual_threshold (Z : ℤ → ℤ) (hZ : Antitone Z)
    (q t : ℤ) (h : q+t ≤ -1) :
    1 ≤ Z q + (1-Z (-t-1)) := by
  have hh : q ≤ -t-1 := by omega
  have hz := hZ hh
  omega
theorem near_identity_step (kg kh gkh kgh cup : ℤ)
    (h : gkh-kgh+kg=cup) (hkh : kh=0)
    (hgkh : kh=0 → gkh=0) (hc : cup=0) : kgh=kg := by
  have := hgkh hkh
  omega
end WalkCupAudit
#print axioms WalkCupAudit.tensor_threshold
#print axioms WalkCupAudit.dual_threshold
#print axioms WalkCupAudit.near_identity_step
```
Actual native probes for shared bounded runner: import New.Lift.LongGap; #check and #print axioms Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_points_at_cuts, Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents, Lift.Pairing.ScaledCupBounds.of_isSafe. No import Main.

## 5. Verification boundary and next step

Actual targeted CI run 45799225653 jobs fetched and all successful; receipt blob 23de197bd48f404ca2074c69676de289c4f7934e: ten native named declarations and four scalar certificates, standard three axioms, full_RH_replay=false. Actual primitive receipt 088cd2ec0e935ee1a282f10096949bcf671cc804: six native successful probes, same three axioms, module_1_build returncode 124, all_requested_checks_ok=false. Neither receipt certifies the new walk/cup audit. Lean and Lake absent locally. Old-pin rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not run on mismatched compact pin. No new native closure or axiom assertion. No change to graphs or unresolved nodes; cache key compact pin + chart + letter + side + selected cut and r + point/depth profile + same witnesses + actual topology/subgroup. No protected workflow or schedule change. All foundational frame, relation transfer, BdR approximation, chart division and row/comparison primitives remain explicit.

RESUME HERE: independently audit literature RUN58's integral frame/retraction transport (3b3720f77ac06cb16aa1bf411376ddc4eeb1960d), starting with the actual PeriodMatrixBasis.exists_basis and PeriodMatrixFrame.exists_frame minimal-support descent and uniform radius hypotheses. Integrate this audit's exact continuity equation and coprime-index counterexample into C without duplicating the editor walk or integration cup algebra. HANDOFF TO editor, integration, C mathematics/literature and shared native runner.

Verdict AGREE / PARTIAL. External formal certification distinct from incomplete human reconstruction.
