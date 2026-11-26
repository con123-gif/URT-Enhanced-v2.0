# RUN56 — Local Cartan denominators and comparison norm, 26 November 2026

Status: SOURCE-MATCHED human derivation, not native replay. Actual consumer:
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1,
heightLe_liftVolume_ratio, through exists_comparison_forms. Source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude as upstream.
Read latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb
(binding primitive-closure, expanded workload and allocation), manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96, SWARM_PROTOCOL
4b77b161d6876915c15cea5a4d4a519beaf5de74, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, handoff and repository
rules. Reviewed prior RUN55 and latest peer commits including
dd58f1202c86cd04fe67171c9e35afcde8a58382 (tested-form denominator)
and c423f7ffc801dd991c5a0c01e60be57401b04b4e (other primitive
closures). No changes to their work.

## 1. Exact column payment before a norm (native CartanIntegrality)

Source New/Rows/CartanIntegrality.lean
6f1276b49ff736fb17fece1309ce6a3d2a75bb57,
DividedSplitting.norm_schur_inv_cols_le_weylGauge.
Fix its O, V, L, inclusion f:l→n, HasColumnsBelow n l κ,
g,h,v,S and M positive in the chosen-place ideal. Retain its exact
hypothesis g^{-1}[:,f]=incl_f h^{-1}. Write t=O.genIdele and
R=O.chosenModulusSq.ResRing. The matrix G=t gamma_L^{-1}
is integral; its reduction is L.reducedInverse
(GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e).
The actual hS says that there is K in GL_l(R) such that
t*(G[:,f]K) vanishes modulo the square ideal off S.
Lift K to k in K0 by reductionK₀_surjective. This is one common
lift for all columns, not a separately optimized lift for each
embedding. Write h=h0 k^{-1}; right K0 invariance preserves its
zero-det-exponent gauge. At a chosen place t is a uniformizer
(up to a unit); the off-S condition tG[:,f]k∈(t²) implies
G[:,f]k∈(t) there. Hence A=gamma_L^{-1} incl_f k is integral
off S. On S it has denominator at most t, so multiplication by
M clears it. At every other place t is a unit and G is integral,
and k is integral; no new denominator appears. Consequently
with D_S=diag(M if j∈S, 1 otherwise),

                  B=A D_S is integral at ALL finite places.       (1)

This is the exact native reduction_levelModulus_eq_zero_iff
argument, not an assertion that gamma_L is integral.
It uses the original M ideal membership, hS and the integral lift.
The desired rectangular matrix factors exactly:
(g gamma_L)^{-1}[:,f] = B D_S^{-1} h0^{-1}.

Apply the Schur matrices at each weight embedding. HasColumnsBelow
gives the compatible ranks and zero extra determinant exponent in
the rectangular composition; retain this native premise.
The integral B gives a Schur matrix with integral entries, hence
nonexpansive for the nonarchimedean max norm, by Schur base change
and norm_schur_mulVec_le. No bound on individual entries of h0 is
needed. It remains to bound the diagonal Schur action.

## 2. Exact tableau budget; no enumeration or coefficient loss

SchurMatrix.lean 8c91b4b7888c99e604df5fa2dd38a130b4fea7bb,
schur_diagonal and schur_map; Hook.lean
ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
sum_tableauWeight_le. In the chosen filling basis the diagonal
Schur factor indexed by tableau T is M^{-w(T)}, where
w(T)=sum_tau sum_{a∈S} tableauWeight(T,tau,a).
A column of height h has pairwise distinct entries, so at most
min(h,|S|) of its entries lie in S. Add over the κ_tau(h) columns:

 w(T) ≤ ν_sharp = Σ_tau Σ_{h<|l|} κ_tau(h) min(h,|S|)
       ≤ ν = Σ_tau |S| Σ_{h<|l|} κ_tau(h).                       (2)

The strict-height range is the native one. This is also the
diagramWeight sum of the first |S| entries in Hook. The proof
does not require counting tableaux, selecting a favorable tableau,
or a harmonic assumption. Since |M|_p≤1, (1) and (2) give
||Schurκ((g gamma_L)^-1[:,f]) v||_p
 ≤ |M|_p^{-ν} weylGauge(κ,0,h,v).
This is the actual statement of norm_schur_inv_cols_le_weylGauge.
The refined ν_sharp is a local optional inequality, not a change
to the frozen loss used by the caller. No search for maximal
weights is necessary, nor is a claim of exact sharpness required.

## 3. Same Cartan witness and integrality at the comparison caller

Source CartanIntegrality.weylGauge_cartanProduct_le and
ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a,
comparisonForm_mem_integralForms. Fix native IsGlued s L and the
same split h=(h1,h2). For the positive columns take
S=univ.map V.dividedEmb and its actual IsGlued.exists_cols_eq_zero;
for the negative columns take the whole small index (the
off-set requirement is then vacuous and K=I is permitted).
Apply (1) and (2) to both factors. The negative matrix is
transported by the unitary inverse-conjugate-transpose identity
and adeleExtension_star, at the embedding iota_p∘conj.
The Cartan identity (native weylRep_cartanProduct, V.low and
map_cartanProduct) intertwines the full determinant exponent
with the two Schur factors of determinant exponent zero.
The integral Cartan map is nonexpansive for the max norm; the
tensor of two vectors has max norm the product. The resulting
combined payment is exactly

 loss=Σ_tau (|a| Σ_{h<|N|} colsPlus_tau(h)
              +|m| Σ_{h<|m|} colsMinus_tau(h)).
 gauge(full cartan at block(h) gamma_L)
 ≤ |M|_p^{-loss} gauge(y,h1,iota_p)
                        gauge(star eta,h2,iota_p∘conj).        (3)

Retain the actual embeddings and both Cartan identities;
do not use a complex norm in this p-adic step.

Now set M=D.gProd. It lies in the chosen ideal because
piGBar*star piGBar=gProd and
ideal_untwistedModulus_eq_span (LineCoordinates.lean
fe2cbde49a8d88f37308a8c28f742efb73a7d6a0).
For p coprime to the twist's levelNorm, the SAME lineScale
provides gauge(y,h1)≤1 for y=star(lineScale*lineMultiplier),
from LineArithmetic.lean f6235933aecfcf1a1c82be94b4ad3edbe5057794,
lineMultiplier_integral_and_small. The table hypothesis is the
second bound in (3), for eta=ζ(i,c), at c.out with the conjugate
embedding. The native delta-form gauge inequality for a
finite-order level character transports (3) to each productForm
summand; retain its level and finite order hypotheses. In the
rowFixingLevel class sum stabilizers are trivial at the native
rank bound, so there are no classAut denominators. Multiply by
the exact scalar already in the definition of comparisonForm:

                   |gProd|_p^loss |gProd|_p^{-loss}=1.           (4)

This cancellation precedes summing, and each summand is integral.
The ultrametric integral lattice is closed under finite sums.
This proves the actual comparisonForm_mem_integralForms from the
stated native Cartan, delta and lineScale inputs, at every p
coprime to levelNorm, INCLUDING p dividing gProd. Do not assume
gProd is a unit or impose p coprime to it. No new witness or
loss factor in the comparison determinant caller. Formula (4)
is not a proof of the independent lineMultiplier supplier.

## 4. Archimedean comparison: aggregate table norms before a crude cap

Actual ComparisonForms.normSqAt_comparisonForm_le at twist 1.
Let B be the table index set (i,c), C_V the number of output
classes at the native level, H_i the number of classes at the
rowFixingLevel indexed by i, A=D.chosenGroupOrder, g=D.gProd,
L=loss, H=smallHookNumber j. For fixed σ∈Aut(C) set
v_b=sqrt(weylNormSq(σ∘ζ_b)). The native lineScale bound at
empty twist is exp(r B0) for squared norm, the Cartan norm
identity after σ is the product of the squared Gram norms,
and weylNormSq_deltaForm_le with
card_classAut_dvd_chosenGroupOrder supplies pointwise squared
norm ≤ A² exp(r B0) v_b². Keep σ on the actual coefficients;
do not assert that an arbitrary complex automorphism commutes
with complex conjugation or preserves the standard norm.
ClassSumBounds.lean c6139c29f46898cb1444d94e1960844722647d66
gives the square-root triangle bound for class sums (each
stabilizer order is positive so reciprocal ≤1). Thus at each
output class the native sum of point forms has norm at most
g^L A exp(r B0/2) Σ_b H_i v_b.
Cauchy-Schwarz on the SAME finite table gives

 H normSqAt(gl_1 ζ,σ)
 ≤ H C_V g^(2L) A² exp(r B0)
      (Σ_b H_i²) (Σ_b v_b²).                                   (5)

Here normSqAt is the stabilizer-weighted class sum
(LevelForms.lean fffc85cdb75f20ad53d25ed6100b330e6b458896).
No new measure normalization. This estimate uses one factor
|B| rather than |B|² if H_i≤b uniformly; the native proof's
single_le_sum bounds each v_b² by the full sum before
the triangle inequality. The latter is weaker since |B|≥1
(the actual table is inhabited); (5) is valid also when empty.
This is a genuine aggregate alternative at the norm consumer,
not an improvement claimed to change the main proof constants.

For clarity the scalar guard sufficient for (5) is
 log H+log C_V+2L log g+2 log A+log|B|+2log(max_i H_i)≤r B0.
The original proof uses the same guard with 2log|B| instead.
Its actual cardinal supplier is SizeEstimates.lean
0b666c5f3cead375b65b97c6af8a25675486b473,
card_stdClasses_le_exp_mul_log with G=gProd² and rank≤2 n(m),
then the native scale comparison gives each of the relevant
class counts ≤b. All level inclusions in ComparisonForms are
retained. The exact table cardinality is
 |B|=|R|^(3m |BigIndex|) * C_flat * C_small
          * (6m+1)^(f*reducedHalfGap*2m),
from LineCoordinates.MemberIndex and LineChoice. The native
card_resRing_le, card_detIndex, column bound colsMinus≤h,
hookNumber_le and ChosenPlaceLevels (d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3)
log A≤x^32 control the remaining prefactor. The original
logarithmic scalar discharge is in the body of
normSqAt_comparisonForm_le (final D.le_of_hasLogBound).
It is RETAINED here, not independently reconstructed in full
or replaced by numerical evidence; the improved bound requires
no stronger scalar premise. Given that original guard, (5)
immediately gives the exact exp(2rB0) bound needed by
heightLe_liftVolume_ratio. Keep the independent tested-form
orthogonality and common A, gamma_theta, gl_theta from prior
RUN55; no global source edge deleted. Remaining human primitive
for this section: expand the precise scalar log guard and
the upstream lineScale/delta-form transport, if not yet merged.

## 5. Actual finite congruence regression and controlled candidate ranking

Executed in JavaScript tool sandbox. This is a finite algebraic
regression of (1)-(2), not a simulation of the adelic objects or
proof of an infinite arithmetic assertion. The candidate search
is the actual mod-p column-kernel condition used in hS, restricted
to 2x2 residue matrices. For p=2,3 enumerate all G mod p² and
all invertible K mod p, use their integer lifts, all four S,
and M∈{p,p²,2p}; test entry and exterior-minor divisibility.
For every admissible residue rank and s=0,1,2 compare lexicographic
GL enumeration with the original pi/e and golden-angle projected
spiral as a fixed priority, and direct kernel/complement construction.
This tests ranking only, not the full URT physics/control algorithm.
Actual output:
{"localCases":391200,"entryChecks":4694400,"minorChecks":5868000,"rankCases":142,"lexCandidates":493,"harmonicCandidates":314,"directWitnesses":142,"negativeControls":4}

Harmonic order reduces candidate count in this particular finite
test versus the fixed lex order, but still tests 314 candidates
where the conventional kernel construction supplies one valid
witness in each of 142 cases. No wall-time comparison or general
URT/linear-proof-search advantage. The direct ordinary
kernel construction and tableau sum remain the recommended route.
The original native proof already assumes a common K from IsGlued;
this benchmark does NOT imply that it actually enumerates GL or
that we removed that premise. Negative controls: off-S omitted,
or M not in the ideal, leaves a pole. No fabricated native outputs.

Reproduce with node (standalone, exact small-integer arithmetic):

```javascript
const check=(c,m)=>{if(!c)throw Error(m)};const mod=(a,p)=>((a%p)+p)%p;
const mats=(q)=>Array.from({length:q**4},(_,z)=>Array.from({length:4},(_,i)=>Math.floor(z/q**i)%q));
const det=a=>a[0]*a[3]-a[1]*a[2];
const mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]];
let out={localCases:0,entryChecks:0,minorChecks:0,rankCases:0,lexCandidates:0,harmonicCandidates:0,directWitnesses:0,negativeControls:0};
for(const p of [2,3]){
 const q=p*p, ks=mats(p).filter(k=>mod(det(k),p)!==0);
 const phi=(1+Math.sqrt(5))/2,kappa=Math.PI/Math.E;
 const harmonic=ks.map((k,i)=>({k,i})).sort((a,b)=>kappa**b.i*Math.cos(2*Math.PI*b.i/phi**2)-kappa**a.i*Math.cos(2*Math.PI*a.i/phi**2)).map(x=>x.k);
 for(const G of mats(q))for(const K of ks){
  const A=mul(G,K);
  for(let mask=0;mask<4;mask++){
   const bad=[0,1].filter(j=>!(mask>>j&1)),s=2-bad.length;
   if(!bad.every(j=>A[j]%p===0&&A[j+2]%p===0))continue;
   out.localCases++;
   for(const M of [p,p*p,2*p]){
    const B=A.map((x,i)=>x*((mask>>(i%2))&1?M:1));
    check(B.every(x=>x%p===0),"scaled integrality");out.entryChecks+=4;
    for(let j=0;j<2;j++){for(let i=0;i<2;i++){check((A[2*i+j]*M**Math.min(1,s))%p===0,"one-minor bound");out.minorChecks++;}}
    check((det(A)*M**Math.min(2,s))%q===0,"two-minor bound");out.minorChecks++;
   }
  }
 }
 for(const G of mats(p))for(let s=0;s<=2;s++){
  const rank=G.every(x=>x===0)?0:mod(det(G),p)!==0?2:1;
  if(rank>s)continue;
  const good=K=>{const A=mul(G,K);return [0,1].filter(j=>j>=s).every(j=>A[j]%p===0&&A[j+2]%p===0)};
  const a=ks.findIndex(good),b=harmonic.findIndex(good);check(a>=0&&b>=0,"search");
  let K=[1,0,0,1];
  if(s===1&&rank===1){const [u,v]=G[0]||G[1]?G.slice(0,2):G.slice(2);K=u?[1,mod(-v,p),0,u]:[0,mod(-v,p),1,u];}
  check(mod(det(K),p)!==0&&good(K),"direct kernel basis");
  out.rankCases++;out.lexCandidates+=a+1;out.harmonicCandidates+=b+1;out.directWitnesses++;
 }
 check(1%p!==0,"off-S negative");out.negativeControls++;
 check((1*1)%p!==0,"M negative");out.negativeControls++;
}
console.log(JSON.stringify(out));
```

## Verification / handoff

Local command -v lean / lake produced no executable. Native
comparison certificate commands prepared (unrun; import only
the native supplier, never Main or the claimed RH theorem):

```lean
import New.Rows.ComparisonForms
#check DividedSplitting.norm_schur_inv_cols_le_weylGauge
#check DividedSplitting.weylGauge_cartanProduct_le
#check comparisonForm_mem_integralForms
#check normSqAt_comparisonForm_le
#print axioms DividedSplitting.norm_schur_inv_cols_le_weylGauge
#print axioms comparisonForm_mem_integralForms
#print axioms normSqAt_comparisonForm_le
```

Existing targeted CI run 45803534769 and 45799225653 fetched from
GitHub Actions API this run, completed/success at heads
2ba4fee750f6f5cbd30f2db9e6b44bf3931ca84c and
4c55b565a0583f08b6c87de5ae3ddfa8d3a9747a respectively.
These are historical targeted runs, not a replay of this note;
RUN29 has partial native coverage per prior peer record.
No new kernel-verified closure or axiom assertion, no graph
deletions. Source and reduced frontiers remain separate.
External formal certification is distinct from our incomplete
human reconstruction.

RESUME HERE: integrate §§1–3 at the actual comparison form
consumer, audit (5) and expand the exact scalar log guard from
the native ComparisonForms tactic. Then reconstruct remaining
lineMultiplier_integral_and_small / denominator suppliers at
their callers, checking the latest peer ledger first. Do not
repeat already sufficient determinant/endgame redesign.
HANDOFF TO integration, editor, formal audit, theta and shared
kernel extractor. Retain all original hypotheses and graphs.
