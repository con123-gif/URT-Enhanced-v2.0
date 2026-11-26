# RUN57 — Explicit comparison-form scalar discharge and theta scaling
26 November 2026. SOURCE-MATCHED human argument, conditional on the
native named inputs; not a new native replay. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Read current mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb
(primitive-closure and binding specialist allocation), manuscript
d185408f9b17703c84b1584444bfde1f65d57e74, SWARM_PROTOCOL
4b77b161d6876915c15cea5a4d4a519beaf5de74, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, HANDOFF_QUEUE and
repository continuity rules. Resume RUN56 (92215c44). Peer
integration/2026-11-26_COMPACT_COMPARISON_LINE_DENOMINATOR.md
already expands the common lineScale supplier; do not duplicate
its proof. Here discharge the remaining scalar guard at its
actual comparison caller, audit a small ambiguity in the peer
line budget, then expose the actual homogeneous theta scaling.

## 1. Actual caller and source premises
* New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a,
  normSqAt_comparisonForm_le and exists_comparison_forms.
* New/Rows/CartanIntegrality.lean 6f1276b49ff736fb17fece1309ce6a3d2a75bb57,
  loss; New/Rows/LineCoordinates.lean fe2cbde49a8d88f37308a8c28f742efb73a7d6a0,
  card_detIndex, MemberIndex, LineChoice, SmallClasses.
* New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  actual HasLogBound instances; AdmissibleData.lean
  04208a5044bb7cf6464ef142a14d939148bed834.
* Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
  hookNumber_le; New/Exchange/CrudeModularData.lean
  2be49b2690280e070d21691f8a569fc81e113b2b, Modulus.card_resRing_le;
  New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473,
  card_stdClasses_le_exp_mul_log; New/Data/ChosenPlaceLevels.lean
  d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3, log chosenGroupOrder.

Use X=log x, B=log b, Y=log x1, g=gProd, A=chosenGroupOrder,
H=smallHookNumber, L=splittingV.loss, T=the actual MemberIndex
times SmallClasses table, N_T=|T|. Fix j and the SAME untwisted
comparison map as RUN56. Write C_V for output class count and
C_i for row-fixing class count for member i. All class counts
in this paragraph are the actual levels in ComparisonForms,
not estimates for arbitrary level. Native c in that proof
supplies C_V,C_i,C_flat,C_small <= b using rank <= 2 n(m)
and the principal-level inclusion. Explicitly its logarithmic
estimate is x^29(1+2log g) <= B? No: the needed statement
is <= B (because final class cap is exp B=b). This deserves
a check: B=x^epsilon is MUCH SMALLER than x^29, so that
inequality is FALSE. The actual native tactic instead gives
x^29(1+2log g) <= b, hence C <= exp(b), not <= b.
This distinction changes the previous RUN56 and peer informal
class caps. We retain the actual native bound
 log C <= x^29(1+2 log g) <= x^31
using B <= x^(1/100) and x huge, which is sharper for this
purpose than exp(b). Do not use the erroneous C<=b cap.
The following discharge works with these actual log bounds.
For full-level class counts in the lineScale note, the native
card_stdClasses_le_exp already gives log C <= x^30.

Check source carefully: ComparisonForms local c calls
card_stdClasses_le_exp_mul_log then exp_le_exp.2
(D.le_of_hasLogBound (G := D.b)); consequently c indeed
returns C <= exp(b). We can bypass this relaxation and use
the original x^29(1+log(g^2)) bound directly with precisely
the same level inclusions and rank guards.

## 2. All polynomial and exponential costs in one budget
From the exact scale, 1e12 P.c <= log B, 100 log B <= X,
1e12 X <= B, P.c >=64. In particular X and B are far above
all the numerical constants used below, x>=10^10, B<=x^(1/100),
and x^q <= b for q<=1e12. Use the Magnitudes instances and
definitions to obtain
 m<=2sqrt(x)<=x, r<=3x^5, t=5r<=x^6,
 h=2r^8<=x^41, f<=exp(P.c)x^11 B^(1/5)<=x^12,
 a>=xb, k<=r, log g<=22B, log A<=x^32,
 b1,b2<=e^2 b, h+mh<=b.
For the last, h+mh<=2x^42<=x^43<=b. Both positive
and negative index sizes in the splitting are <=t:
 BigIndex=r+3m+(6m+1), SmallIndex=r+(t-9m-1-r)_+;
 100m<=k<=r gives r+9m+1<=t, and SmallIndex<=t.
The divided index has exactly 3m elements.
For every tau, the native card_detIndex bound gives
 sum_{h<|BigIndex|} colsPlus_tau(h)
 <= b1+b2+h+mh <= (2e^2+1)b <16b.
The native hm in ComparisonForms gives colsMinus_tau(h)<=h_data
for every column height h (write h_data=D.h to avoid shadowing).
Thus the exact Cartan loss obeys
 L <= 48mfb + f t^2 h_data <=49mfb
because t^2 h_data<=x^53<=b and m>=1.
In particular
 2 L log g <= 2156 m f b B.                                (S1)

The total negative diagram box number is <= f t^2 h_data
<=x^65. Put J=f t^2 h_data, a positive integer. The actual
hookNumber_le yields H <= J^(3J). Hence
 log H <=3J log J <=195 x^65 X <=x^67.
Use the exact table count
 N_T=|R|^(3m |BigIndex|) C_flat C_small
            (6m+1)^(f reducedHalfGap 2m).
The untwisted modulus contains g^2 as a rational integer
(norm_mul_gProd_pow_mem_modulus and the level inclusion);
Modulus.card_resRing_le gives |R|<=g^(4f). This intentionally
uses the safe rational-integer norm bound, without assuming
a smaller residue cardinal. Therefore
 log N_T <= 264 m t f B + 2x^31
              +2 f h_data m log(6m+1)
          <= x^21 + 2x^31 + x^56 <= x^57.
Here 264 m t f B<=264 x^20<=x^21; the last term is
<=2x^54 log(7x)<=x^56. The exact class bounds above use
x^29(1+44B)<=x^31, since B<=x^(1/100).
Combining all NON-Cartan costs, even for the original
less sharp table-square estimate,
 log H+log C_V+2 log A+2 log N_T+2 log(max_i C_i)
 <= x^67+3x^31+2x^32+2x^57 <=x^70<=b<=mfbB.
Together with (S1),
 log(H C_V g^(2L) A^2 N_T^2 (max_i C_i)^2)
 <=2157 m f b B <=2200 m f b B.
The native allowance B0=f a B^3/(m k), and the same scales
give rB0/(mfbB)=(r/k)aB^2/(m^2 b)>=B^2/4>=2200.
Thus the ACTUAL required scalar guard is established:
                 H C_V g^(2L) A^2 N_T^2 (max_i C_i)^2
                           <= exp(r B0).                    (S2)
No improvement in the native constant is needed. The proof
also covers the tighter aggregate Cauchy bound from RUN56,
which uses only N_T rather than N_T^2. All indices are
nonempty in the native construction; the zero-table case
is trivial by linearity.

## 3. Actual caller consequence; audit of earlier estimates
For a fixed sigma let v_a=sqrt(weylNormSq(sigma∘ζ_a)).
The already established lineScale input gives the point
form norm bound A exp(r B0/2) v_a using the actual delta
norm and Cartan product at sigma. The class-sum triangle
bound yields at each output class
 ||gl_1 ζ|| <= g^L A exp(r B0/2) Σ_a C_i v_a.
Cauchy-Schwarz, or the original per-coordinate sum bound,
and the stabilizer weights <=1 yield
 H normSqAt(gl_1 ζ,σ)
 <= H C_V g^(2L) A² exp(r B0)
                N_T²(max_i C_i)² Σ_a v_a²
 <= exp(2 r B0) Σ_a v_a².
The last step is (S2), so the actual final scalar discharge
of normSqAt_comparisonForm_le is no longer a black box in
the human argument. Keep the lineScale, Cartan/delta norm,
class-count and hook inputs, and SAME gl, A, gamma from
exists_comparison_forms. The companion local p-adic
integrality remains RUN56 and peer lineScale proof.

Peer integration line-denominator note (L5) says "first
six terms" are <= b. This would include log H, which has
not been bounded by b and may have scale proportional to b.
It should say the first FIVE displayed summands, i.e.
3x1+2log A+log C1+log C2+log|GL_{3m}(R0)|. The coefficient
sum is 8, so their bound 8 exp(10^-6 B)<=b is valid with
the native full-level class counts. Using the safe
log|R0|<=4f log g rather than 2f log g gives
 log|GL_{3m}(R0)|<=36fm² log g<=3168 x^13 B<=x^34,
which leaves their conclusion unchanged. log H is already
budgeted separately in their 105 d0 B. This corrects the
wording and avoids any need for the smaller residue-ring
bound. More importantly, do NOT propagate the erroneous
C<=b assertion in RUN56 or any dependent informal proof;
the original source cardinality bound and (S2) suffice.
No native lemma was contradicted.

## 4. The next deep supplier: precise homogeneous jet transport
Actual New/Rows/MemberKernels.lean
be36c0175fe559376780b105052249fc0c9f1f4f,
exists_modKernel_integral_bound, uses
Parameters.norm_jet_le_of_isAdmissibleComb with degree d,
w=0. In that application put u=log(|sigma c|²/Omega).
The native polynomial assumption is |sigma Q(z)|<=B_Q
whenever every |sigma z_i|<=g^4. Given its sufficient size
guard exp(u)(d+1)<=g^8, any R>=0 and z with
 Σ_i |sigma z_i|² <= exp(u)(2d+2)R
satisfies for z'=sigma^{-1}(exp(-R)) z,
 |sigma z'_i|² <= exp(u)(2d+2)R exp(-2R)
                <= exp(u)(d+1) <=g^8,
since 2R<=exp(2R). Homogeneity over the actual complex
coefficients, including the inverse automorphism on the
scaling scalar, gives
 |sigma Q(z)| = exp(d R)|sigma Q(z')| <= B_Q exp(d R).
This is precisely the growth premise of the native jet
bound, with no assumption that sigma is continuous or
preserves the real exponential. If R<0 the antecedent
is impossible (the native RHS is negative). This works
also for d=0. The pointwise coefficient bound is therefore
transported before the Gaussian integration without
coordinatewise coefficient loss. The native choice of c,
jet standardData, CM semilinear conjugacy and quantitative
Gaussian majorant, and final exp(x1) prefactor remain
explicit unresolved human suppliers. This is a local
argument, not a proof of the whole MemberKernels theorem.

## 5. Exact regression and verification boundary
Executed JavaScript finite algebra check of the table
aggregation (not a simulation of native adelic data):
```js
let counts={vectors:0,identity:0,aggregate:0,negative:0};
for(let n=1;n<=4;n++)for(let z=0;z<16**n;z++){
 let a=[],b=[];
 for(let i=0;i<n;i++){let v=Math.floor(z/16**i)%16;
 a.push(v%4);b.push(Math.floor(v/4));}
 let aa=a.reduce((s,x)=>s+x*x,0),bb=b.reduce((s,x)=>s+x*x,0),
 ab=a.reduce((s,x,i)=>s+x*b[i],0),diff=0;
 for(let i=0;i<n;i++)for(let j=i+1;j<n;j++)
 diff+=(a[i]*b[j]-a[j]*b[i])**2;
 if(aa*bb-ab**2!==diff)throw Error("Lagrange");counts.identity++;
 if(ab**2>aa*bb||aa*bb>n*Math.max(...a)**2*bb)
 throw Error("aggregate");counts.aggregate++;counts.vectors++;
}
if((1+1)**2<=1+1)throw Error("missing cardinal negative");
counts.negative++;
if(2200*4>100**2)throw Error("B guard");
console.log(counts);
```
Actual output {vectors:69904,identity:69904,aggregate:69904,negative:1}.
The negative control shows an unweighted cardinal factor
cannot simply be erased. The uniform estimates in §2
are analytic inequalities, not extrapolations from tests.
No genuine candidate search remains in scalar discharge;
no meaningful URT comparison here, no claimed benefit.
Failed route: C<=b obtained by confusing exp(b) with b.
Direct exact budget recovers the intended conclusion.

Native lean/lake not on local PATH (checked); no new
kernel replay. Prepared independent scalar certificate,
not executed:
```lean
import Mathlib
theorem comparison_scalar_run57
    (B P Q : ℝ) (hB : 100 ≤ B) (hP : 0 ≤ P)
    (hQ : 2200 * P ≤ Q) : 2157 * P ≤ Q := by
  linarith
#print axioms comparison_scalar_run57
```
This small certificate checks the last arithmetic weakening
only, not the source-matched estimates; hB is unused in
this version because hQ already carries the scale. The
meaningful human proof is §§1–4. Native caller commands
(unrun in this environment):
```lean
import New.Rows.ComparisonForms
#check normSqAt_comparisonForm_le
#print axioms normSqAt_comparisonForm_le
#check exists_comparison_forms
#print axioms exists_comparison_forms
```
Historical orchestrator state summary blob
69dd9d51c762fe461d4fc8f396e8d76a3370de79 reports successful
run 45842546462 at ec8134c (15:06:50Z); this is unrelated
to native verification of this new note. No graph deletion,
no new kernel-verified closure, no new axiom assertion.
External formal certification and incomplete human
reconstruction remain distinct.

RESUME HERE: integration/editor replace informal comparison
class caps with actual logarithmic bounds and insert (S2)
at normSqAt_comparisonForm_le; independently audit the
shared lineScale note's L5 correction. Next specialist
obligation: expand MemberKernels.norm_jet_le_of_isAdmissibleComb
from the actual semilinear CM conjugacy and Gaussian bound,
and check the exact c and exp(x1) prefactor at its caller.
HANDOFF TO integration, editor, audit, theta and kernel lanes.
Preserve all remaining primitive obligations and original
dependency evidence; no protected workflow changes.
