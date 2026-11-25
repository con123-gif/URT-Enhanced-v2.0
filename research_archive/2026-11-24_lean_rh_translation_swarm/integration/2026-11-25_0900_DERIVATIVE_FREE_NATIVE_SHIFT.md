# Integration lane — derivative-free native principal shift, using the actual one-sided window
25 Nov 2026. One new SOURCE-MATCHED human reduction, conditional at the actual ChCore consumer. RH OPEN. No new Lean replay; no URT. Supersedes only the derivative-shift component of 86122968 and the R term of editor f5bab469, not the other hypotheses or graph.

## One equation
Use the principal host A0=H, h=|H|, F0=2h, r=|TT|>0, d=|T2|/h>0, m,b,k>0, x>=3, A_t=a(t), S=sum_t A_t, y_t=A_t/b. All definitions, same-host ties and positive-kernel hypotheses are those of f5bab469. Write F(y) for its four-character signed ramp, not the group cardinality F0. The actual native height window is much narrower than |y_t-x|<=1:
    
    0 <= y_t-x <= w := 1/(k*x^12).

Indeed DataParams₂.lean Scale.A=26, Scale.a=x*b, SizeData₂.aT_win states a<=aT<=a+a/(k*x^(26/2)). Divide by b>0, transport aT through Mod.pt_w, top_of, s_sc, s_x, s_k and the common av table. Mod.av_facts gives the lower endpoint explicitly and the weaker abs bound. In the proposed one-witness caller, transport the same aT_win at the selected carrying member (top_of is for arbitrary u0, not only 0); if that table tie or common k is absent, retain the actual weaker [x,x+1] and take w=1. Do not infer one-sidedness from generic SizesA alone.

The key exact cancellation uses the *normalized* signed ramp:
    
    F(y)/y + log y = C + sum_n c_n max(1/n-1/y,0),     c_n>=0.

Here by inner_eq and orthogonality_ramified, c_n=2 Lambda(n) sum_{g in C0} Re Kc(n,g), C0={(1,0,k0):k0 in H}; hence c_n>=0 for prime powers, other terms vanish, and the trivial-character centering contributes exactly -log y. Equivalently use the principal four-character identity in 86122968: c_n=Lambda(n)(1+(n/q))(1-(n/d)), with the actual primitive characters at ramified primes. The sums have finite support at each positive y. This derivation uses no inequality on C (which contains the signed log derivatives). For y>=x>0 the right side is nondecreasing, so

    F(x) <= x F(y)/y + x log(y/x) <= x F(y)/y + (y-x).

Multiply by y>0, sum over TT, and use sum y_t=S/b. Without assuming F(x)>=0, obtain the exact replacement

    F(x) <= (bx/S) sum_t F(y_t) + w.                 (A)

For x>=3, k>=1, w<=3^-12, and w decreases polynomially. This replaces the earlier shift R=7 log(x+1)+|gamma+L| by the actual width, with exact positive normalization instead of a potentially invalid unweighted shift. The sign of F(x) is unrestricted; do NOT replace bx/S by 1/r in a signed sum without a sign argument. The bound x log(y/x)<=y-x uses log u<=u-1 (Mathlib source verified). This is a genuine local deletion of a separate log-derivative magnitude condition, not a global removal of DerivInt or ell from host construction.

Combine (A) with f5bab469's single selected witness/two-scale identity. Its arithmetic score M(u), selected maximizer u*, L_ref,T_ref and thick prime mass Msum=sum_t sum_{g in C0} sum_{n<=y_t} Lambda(n) Kc(n,g) are exactly as in that note. With eta>=0, the same actual witness gapA(u*)<=Err yields

    mean M = (bd/2) sum_t F(y_t) + L_ref+T_ref -(eta+1)d*Msum,
    m mean M <= Err + 3mS/x.

Thus the entire reduced local endpoint is

    F(x) <= w + (2x/(d*S)) * (Err/m + 3S/x - L_ref - T_ref + (eta+1)*d*Msum).     (B)

This is the new joined equation, no R or derivative estimate. Msum<=2 sum_t psi(y_t) remains an optional unconditional simplification. Keep signs in the reference contractions. The exact denominator S is important for a signed numerator. It equals sum A_t>=r*x*b and is positive. In particular the positive Err coefficient is no larger than the earlier 2/(r*m*b*d) if Err>=0. The centering cost is exactly 6/d in this version. The auxiliary signed ramp bound at x is still required to recover the zeta-only discrepancy; no cancellation estimate asserted.

## Compact root/obligation ledger (original graph preserved, proposed specialized overlay)
- Native root: Main.riemannHypothesis -> rhOfAll -> rh_of_every at modulus one -> rh_of_right; independently native-tested alternative conditional half-strip root (open premise: no zeros for 1/2<Re(s)<1). Original all-character graph, type/value/constructor roles and axiom records remain untouched.
- Direct prime route: weighted outer-shell lower bound on arbitrarily distant windows for each eps -> singleton Landau bridge -> half-strip. OPEN arithmetic leaf: signed far-pair R_H after unconditional near-diagonal removal (8bfe5c65); b0afce1d shows the L2 resolvent does not improve the needed scale. Floor-quotient supplier rejected in 003dfd86. Do not retry that shortcut.
- Native arithmetic branch: actual corGK -> integral cotangent length -> VVle -> VWinAt -> supplyChi. 91c8057c allows fixed quasipolynomial VVle, fcdd6e85 gives saturated determinant identity, 9402fbb4 gives conditional real character-field reduction. OPEN: full-length uniform bound incl. 2-primary/minus, CountI/II/V/Vs and local quantifiers; Vandiver not assumed.
- Native geometry/analytic branch original: linkGLOBAL_of -> common host/table + CoverAll + hChr -> CoreAtH/ChainTied -> CoreGm/ch_top -> ch_core/core -> th_le,ch_balance,sum_Th,one_char -> GmA/SigA transfer -> family window. Retain these original edges and other consumers. Proposed overlay: common tied aT table (aT_win) + inner_eq/orthogonality_ramified -> normalized monotonicity -> (A); same-host selected score and single geometry witness + two fixed signed contractions -> (B) -> remaining size transfer. The derivative-magnitude node is not needed in this *local* overlay. OPEN: common table/host existence, selected witness geometry, actual TopG/ASK-MAIN rank/count bounds, thin reference estimates, signed auxiliary window suppliers (05530e1b), formal caller replacement and final quantifier transfer. No globally removed original dependency claimed.
- All native axiom evidence remains in prior exports. Context key: (source pin, principal A0, D, ell, TT,T2,k, common av table, b,x, eta, reference cutoffs). Changing a host/table invalidates reuse. Revert to the original branch if the one-sided aT_win tie is unavailable; generic SizesA has only an absolute displacement. No proof-search optimality, full graph coverage or RH proof percentage.

## Pinned source and run provenance
Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005. Retrieved pinned files:
- src/Formalism/LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b (Scale.a, Scale.A, SizeData₂.aT_win line 80);
- src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean blob 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (Mod.a line 429, s_sc/s_x/s_k 526–533, top_of 799–803, av_facts 814–824, winO 1461ff);
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean blob 878f5077bc382426c7da988e5a375b85deeaa7de (sum_A,sum_Th,one_char,core,ch_core);
- same directory ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4 (ch_balance);
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (inner_eq 655, Kc, orthogonality_ramified).
- Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474: Mathlib/Analysis/SpecialFunctions/Log/Basic.lean, log_div and log_le_sub_one_of_pos declarations retrieved.
Read latest mission incl 4b677bc2 first, SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, state/runner/log/continuity excerpts; latest branch history through f5bab469 and relevant peer checkpoints f5bab469,2f135e5b,cc5937fc,a31ec62d,9402fbb4,53e08a78,b0afce1d,cb92aa3a,05530e1b,fcdd6e85,51592596,32968b08,8bfe5c65,bba1c8d9,003dfd86,faa3cd45. Not an exhaustive archive reread. Root-level RESEARCH_PROTOCOL.md and RESEARCH_LOG.md guesses 404; corrected to research_archive/cathedral_arf_runner. General CI #431 run 45576261976 PASS 08:47 UTC predates this contribution and is not RH evidence.
Native tools sources read (RHRecursiveReductionFixed, AutoV3, RHProofTermPrune). Directly fetched published status.json of both baseline jobs on cathedral-research-state: rh-recursive-reduction-strip-root-20261125 status pass returncode 0, 98.87s; rh-proof-term-prune-native-20261125 pass returncode 0, 77.94s. These are prior jobs only, not this certificate. Neither lean nor lake available on local PATH. No actual new rh_scan/rh_prune/rh_reduce/rh_auto execution, no new CI PASS claimed. Prepared certificate below; use actual pinned environment, not Main. No new registry entry or CI execution in this run; handoff to kernel to batch with caller work.

## Executed exact finite regression
CPython, exit 0. This tests the normalized coefficient inequality on genuine quadratic character prime-power coefficients and exact signed algebra; it is not native geometric data or asymptotic evidence.
```python
from fractions import Fraction as Q
from math import isqrt
from itertools import product
N=2000
p=[n for n in range(2,N+1) if all(n%d for d in range(2,isqrt(n)+1))]
def leg(n,l):
 if n%l==0:return 0
 return 1 if pow(n%l,(l-1)//2,l)==1 else -1
rows=[]
for q,d in [(3,23),(11,263),(19,151)]:
 for a in p:
  n=a
  while n<=N:
   c=(1+leg(n,q))*(1-leg(n,d))
   assert 0<=c<=4
   rows.append((n,c,a));n*=a
checks=0; strict=0
for x,k,frac in product([Q(3),Q(7,2),Q(10),Q(97),Q(1000)], [1,2,13], [Q(0),Q(1,3),Q(1)]):
 y=x+frac/(k*x**12)
 assert 0<=y-x<=1/(k*x**12)
 for n,c,a in rows:
  diff=c*(max(Q(1,n)-1/y,0)-max(Q(1,n)-1/x,0))
  assert diff>=0
  checks+=1;strict+=diff>0
bridges=0
for x,k,f,g in product([Q(3),Q(17,2),Q(100)], [1,5], [-10000,-1,0,1,10000], [0,1,10]):
 ys=[x,x+1/(2*k*x**12),x+1/(k*x**12)]
 fs=[y*(Q(f)/x-(y-x)/x+g) for y in ys]
 s=sum(ys)
 assert Q(f)<=x*sum(fs)/s+1/(k*x**12)
 bridges+=1
x=Q(3);w=1/x**12;y=x+w; f=-100*x; fy=-100*y
assert fy < f-w and f <= x*fy/y+w
assert max(Q(1,2)-1/Q(3),0)-max(Q(1,2)-1/Q(4),0)<0
print('prime-power coefficient rows',len(rows),'exact ramp checks',checks,'strict',strict,'signed normalized bridge checks',bridges,'negative controls',2)
```
Observed: prime-power coefficient rows 999 exact ramp checks 44955 strict 942 signed normalized bridge checks 90 negative controls 2. The controls show unweighted transport without sign and reversal of the one-sided window are invalid. Failed native access: lean/lake absent; no alternative numerical test substituted for Lean.

## Prepared executable Lean scalar/finite-sum certificate (NOT EXECUTED)
Save as RHNormalizedShift.lean in pinned Mathlib environment. The source bridge still needs native instantiation using actual aT_win and Fourier kernel.
```lean
import Mathlib
open Finset
namespace RHNormalizedShift

theorem ramp_mono {ι : Type*} (s : Finset ι) (c v : ι → ℝ)
    (hc : ∀ i ∈ s, 0 ≤ c i) {x y : ℝ} (hx : 0 < x) (hxy : x ≤ y) :
    (∑ i ∈ s, c i * max (v i - 1/x) 0) ≤
      ∑ i ∈ s, c i * max (v i - 1/y) 0 := by
  have hdiv : 1/y ≤ 1/x := one_div_le_one_div_of_le hx hxy
  exact Finset.sum_le_sum fun i hi =>
    mul_le_mul_of_nonneg_left (max_le_max (sub_le_sub_left hdiv (v i)) le_rfl) (hc i hi)

theorem shift {x y f g : ℝ} (hx : 0 < x) (hxy : x ≤ y)
    (hmono : f/x + Real.log x ≤ g/y + Real.log y) :
    f ≤ x*(g/y) + (y-x) := by
  have hy : 0 < y := lt_of_lt_of_le hx hxy
  have hl := Real.log_le_sub_one_of_pos (div_pos hy hx)
  rw [Real.log_div hy.ne' hx.ne'] at hl
  have ht : f/x ≤ g/y + (y/x-1) := by linarith
  have hm := mul_le_mul_of_nonneg_left ht hx.le
  have h1 : x*(f/x) = f := by field_simp
  have h2 : x*(y/x-1) = y-x := by field_simp
  rw [mul_add, h1, h2] at hm
  exact hm

theorem sum_shift {ι : Type*} (s : Finset ι) (y g : ι → ℝ) {x f w : ℝ}
    (hx : 0 < x) (hw : ∀ i ∈ s, x ≤ y i ∧ y i-x ≤ w)
    (hm : ∀ i ∈ s, f/x + Real.log x ≤ g i/y i + Real.log (y i)) :
    (∑ i ∈ s, y i)*f ≤ x*(∑ i ∈ s, g i) + w*(∑ i ∈ s, y i) := by
  have hi : ∀ i ∈ s, y i*f ≤ x*g i + w*y i := by
    intro i hmem
    have hy : 0 < y i := lt_of_lt_of_le hx (hw i hmem).1
    have hs := shift hx (hw i hmem).1 (hm i hmem)
    have hb := mul_le_mul_of_nonneg_right
      (hs.trans (add_le_add_left (hw i hmem).2 (x*(g i/y i)))) hy.le
    have he : x*(g i/y i)*y i = x*g i := by field_simp
    calc
      y i*f = f*y i := by ring
      _ ≤ (x*(g i/y i)+w)*y i := hb
      _ = x*g i+w*y i := by rw [add_mul, he]
  calc
    (∑ i ∈ s, y i)*f = ∑ i ∈ s, y i*f := by rw [Finset.sum_mul]
    _ ≤ ∑ i ∈ s, (x*g i+w*y i) := Finset.sum_le_sum hi
    _ = x*(∑ i ∈ s, g i)+w*(∑ i ∈ s, y i) := by
      simp only [Finset.sum_add_distrib, Finset.mul_sum]

#print axioms ramp_mono
#print axioms shift
#print axioms sum_shift
end RHNormalizedShift
```
Native follow-up: lake env lean -DwarningAsError=true RHNormalizedShift.lean. In a caller file import the existing three engines and actual ChCore (not Main); rh_scan Deduction.CharacterBalanceMoves.core limit 2000; rh_scan Deduction.CharacterBalanceMoves.one_char limit 2000; rh_prune Deduction.CharacterBalanceMoves.one_char as RHOneCharPruneCandidate (generic candidate, no global deletion). For the actual principal normalized shift use rh_reduce 3 using [RHNormalizedShift.sum_shift, RHNormalizedShift.shift, RHNormalizedShift.ramp_mono] with the real aT/positive coefficient hypotheses, then rh_auto / rh_auto_frontier for remaining typed goals. Audit generated terms, axiom sets and caller-level replacement; preserve unclosed frontier and negative controls. No claim that these commands have run here.

RESUME HERE: kernel/geometry lanes instantiate (A) at the actual tied aT table and install (B) at the principal consumer; pursue the selected-u* geometry constructor and its true count/rank budget rather than more analytic reparametrizations. Integration next inspect whether the native thin-reference supplier can be reduced by its actual conductor/scale bounds without assuming GRH. HANDOFF TO mathematics, geometry, kernel, audit, editor and character-box lanes. All prior graphs/logs unchanged. RH OPEN.
