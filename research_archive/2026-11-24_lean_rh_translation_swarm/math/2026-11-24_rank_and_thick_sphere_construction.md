# Explicit native ranks and Behrend thick-set construction
Status: SOURCE-MATCHED mathematical derivation of selected constructive lemmas. Not proof of the full host geometry. Pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.

## 1. Native rank existence is constructive
Sources: src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsRanksRankValFrame.lean (f383bc28266dc3b81f4b1cf1f33e04c53ebc2d43), exists_even_between, exists_ranks_of_frame, exists_ranks_rankVal_frame; src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b), RankVal, TOv, nWv. 
Fix x>=16, 0<eps<1/52 and a frame phi of order n in [x^(2+8eps),2x^(2+8eps)]. Let A=sqrt(x*delta1)=x^(1/2-eps/16), K=x^(9/2+10eps). Choose m=2 ceil(A/2), k=2 ceil(K/2). For any a>=2 the choice a_even=2ceil(a/2) lies in [a,a+2] subset [a,2a]. Here A>=2, A<=x and K>=x^4. Since n>=x^2 and n<=2x^3, we obtain m>=2, m<=2x<=2n, m+3<=k and 2n<=k. This uses only eps range and x>=16.
Define r=k+m-1, f=2n, T=ceil(x^377),
 W=ceil(10*r*(f+f^2*(k-1)^3*x^(2eps)/m)/8),
 t=8fr+4+8TW-r.
The source constructs Ranks with this t; r is odd, t positive odd since r is odd and 8fr+4+8TW is even and exceeds r. The equality r+t=8fr+4+T*nWv holds, nWv=8W. All other Ranks constructor side conditions are retained in exists_ranks_of_frame; this note does not infer a full arithmetic-geometric host solely from these numbers. RankVal follows immediately from the chosen ranges and equality. At x>=2^(100/eps) the factor 2 in RankVal is absorbed by x^(eps/100), implying the three SizeN/M/K windows from ElevenLe. This implication does NOT supply the other 21 SizesAt conditions.
The actual supply path: src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean (15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17), admissibleClassesTwistedChar uses this theorem and admitted via exists_host; CharacterBoxes/SupplyChi calls it. The user-facing square-root exponent is imposed by constructive choice of rank, not derived from a physical golden ratio.

## 2. Thick set: actual geometric combinatorial mechanism
Sources: src/Formalism/FrobeniusOrbits/HostThickExists.lean (NoRel, HostThickExists); src/Formalism/FrobeniusOrbits/FrobeniusOrbitsProofs/ThickExists.lean (02c657a83fc154f32f088844242192d5395d3160), coeff_zero, sphere_rel, noRel_image, card_image, hostThickExists; src/Development/AutomorphicArithmetic/ThickFrames/ThickFrame2Large.lean (1fefe906dfa8c444e8297ce225ec01dd955a38e0), thickFrame2.
For n natural, L>=2, construct T subset naturals such that 4Ls<n for all s in T, and no three distinct s1,s2,s3 obey j(s2-s1)=i(s3-s1) with nonzero integer i,j, |i|,|j|<=L, i!=j. Want |T|>=n exp(-32 sqrt(log n log L))/L. Handle n=0 by empty set, or lower bound <=1 and n>0 by {0}.

For positive nontrivial case let u=log n, v=log L>1/2, z=sqrt(uv). Then u>32z+v so z>32v>16. Set S=floor(z/v)>=32, a=(u-v-3)/S, d=floor(exp(a)/(4L)), B=4Ld. Since z/(2v)<=S<=z/v, a<=2z. Also a>=z-(v^2+3v)/z>32v-(v+3)/32>=v+7 (use v>1/2). Thus exp(a)>=8L, d>=exp(a)/(8L)>=1, B<=exp(a).
Choose the largest equal-squared-norm subset of the digit box {0,...,d-1}^S. At most S(d-1)^2+1<=Sd^2 possible squared norms, so some sphere has at least d^S/(Sd^2) points. Encode each digit vector by integer sum v_j B^j. Injectivity holds by radix uniqueness. Its image is T. Every s<B^S, and 4LB^S<=4L exp(aS)=4n/e^3<=n. Thus the range constraint holds.
If j(s2-s1)=i(s3-s1), each signed digit coefficient has magnitude <=2L(d-1)<B. A sum of such coefficients times B^k is zero only if all coefficients are zero: reduce modulo B to see the constant coefficient is a multiple of B of smaller magnitude, then divide by B and repeat. Hence the corresponding digit vectors obey the same vector equation. Since i,j are nonzero and unequal and all three vectors are distinct, they are three different collinear points on the same Euclidean sphere, impossible: writing v2=v1+lambda(v3-v1), equal squared norms imply lambda(lambda-1)||v3-v1||^2=0. This proves NoRel, retaining all nonzero/distinct hypotheses.
Cardinality: n=e^(aS)*L*e^3, d>=e^a/(8L), d<=e^a. From S<=z/v, a<=2z, v>1/2, z>16,
 3+S(7+v)+S+2a <=3+21z<=32z.
Therefore e^3(8L)^S*S*e^(2a)<=e^(32z), and
 d^S/(S d^2)>=e^(aS)/[(8L)^S*S*e^(2a)]>=n e^(-32z)/L.
This recovers the exact 32 constant and construction, rather than treating thickFrame2 as an opaque density assumption. The alternative elementary inequality for a>=v+7 is mathematically equivalent to the source budget.

## 3. From subpower loss to the native density
The frame has n=o*n0, with 1<=o<=Co fixed, n<=Co*x^(2+8eps), and Lw<=CL log x, Lw>=2. Applying the preceding construction with n0 and Lw gives T. The construction in thickFrame2 produces the strengthened statement with CT=64 (twice 32), positive labels and 4Lw*|T2|<=n0, in addition to NoRel and range. Those extra selection details remain in the source theorem. For the density bound of that T2, take logs of its lower envelope:
 log(n/|T2|)<=log Co+log Lw+64 sqrt(log n0 log Lw).
Divide by log x. Since log n0=O(log x), log Lw=O(log log x), the quotient tends uniformly to zero for fixed Co,CL,eps. Thus for every eps>0 and sufficiently large x the loss is <=eps log x, giving |T2|>=n*x^(-eps). This is a human simplification of the source's explicit eventual threshold calculation (not an assumption that each x has the same T2).
src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean (261b566b0ea0d155ef1a434889d720c3b439735f), hof_thick invokes thickFrame2 with CL=4084+60/eps, Co'=max(Co,2); hof_exists_host preserves T2. The distinct top subset TT is obtained through topsChoiceH (30fc631d84ac2188105d8ee9a92d2ed37ba43b7d), which invokes topsBase (d3a34386069e27091a1cd44e9f2bbb52044b591d), then topsFrame. It retains the cardinal interval, bad-orbit weighted bound and Shares approximation. Do not conflate the digit-sphere construction with the Bernoulli top-set selection. The latter is the next mathematical frontier.

## 4. Exact route to selected family and remaining obligations
FamP in ParConsts.lean (c3a5cddc3af0b027ad62b50a79cdb008712613a6) requires SizesAt at every index x>x1. The actual theta TopShape calls designExists_of_tuSize_aux4n_litThin in ThirdPlaceSeries/LinkEx.lean (e28c35e57535a15a17a9dfc7f7c1ded20e38ff82). This produces DesignExists from designChoices_upN(hEx minkowski_bound_rat), hTu, chosenProviso via class number plus second Chern rank ties, and chosenThin_closed. hEx remains substantive. Do not use alternate GlobalInterpolation/LinkEx as the exact caller. 
Actual HypsAlt producer (ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e): large_unramified_exponent_bundles_exist_alt -> (hP,hMem,hEx); hyps_e_third_layer_ser_n_of_geometric_galois -> prN,serN; final_alt_alt yields hNrow, stronger-extension monotonicity transports hO and hNrow; allRows_of_open0_alt consumes those and hL3,hF; nonempty_hyps_of_allRows_alt combines hP,hMem,hEx,hAll and named geometric packages. NonemptyHypsOfAllRows.lean (6a09205dfc3e57486ecbc27517072f3c27f09a51) constructs one common class/selection via classSel and packages all its RowL conditions. The full proof still requires these geometry and automorphic producers; none dropped.

## Executed regressions
{
  "rounding": 1224,
  "ranks": 3420,
  "spheres": 64,
  "vectors": 1976,
  "distinctOrderedTriples": 55320
}
Exact rational ceiling inequalities (small safe integer numerators), abstract BigInt rank identities, and small digit spheres tested exhaustively for NoRel by reduced integer ratios; these are tests of the elementary construction only, not actual large native geometry or a Lean kernel check.
Replay:
```js
function verify(){
 let rounding=0,ranks=0,spheres=0,triples=0,vectors=0;
 for(let den=1;den<=17;den++)for(let num=2*den;num<10*den;num++){
   const m=2*Math.ceil(num/(2*den));
   if(m%2||m*den<num||m*den>2*num)throw Error("rounding");
   rounding++;
 }
 for(let n=1n;n<=18n;n++)for(let m=2n;m<=2n*n;m+=2n)for(let k=2n*n+4n;k<=2n*n+12n;k+=2n)for(const T of [0n,3n])for(const W of [0n,2n]){
  if(m+3n>k)continue;
  const f=2n*n,r=k+m-1n,t=8n*f*r+4n+8n*T*W-r;
  if(t<=0n||t%2n!==1n||r+t!==8n*f*r+4n+8n*T*W||m>t+1n)throw Error("rank");
  ranks++;
 }
 function gcd(a,b){a=Math.abs(a);b=Math.abs(b);while(b)[a,b]=[b,a%b];return a;}
 for(let S=1;S<=4;S++)for(let d=1;d<=4;d++)for(let L=2;L<=5;L++){
  const B=4*L*d,g=new Map();
  for(let p=0;p<d**S;p++){let q=p,k=0,v=0,b=1;for(let i=0;i<S;i++){const z=q%d;q=Math.floor(q/d);k+=z*z;v+=z*b;b*=B;}if(!g.has(k))g.set(k,[]);g.get(k).push(v);vectors++;}
  const a=[...g.values()].sort((u,v)=>v.length-u.length)[0];
  if(a.length*S*d*d<d**S||new Set(a).size!==a.length||a.some(t=>t>=B**S))throw Error("sphere cardinal");
  for(let i=0;i<a.length;i++)for(let j=0;j<a.length;j++)for(let k=0;k<a.length;k++){
   if(i===j||j===k||i===k)continue;
   const u=a[j]-a[i],v=a[k]-a[i],z=gcd(u,v);
   if(Math.abs(u/z)<=L&&Math.abs(v/z)<=L)throw Error("NoRel");
   triples++;
  }
  spheres++;
 }
 return {rounding,ranks,spheres,vectors,distinctOrderedTriples:triples};
}
console.log(verify());
```

RESUME HERE: reconstruct topsFrame from topsBase imports, HostTops Bernoulli selection and its simultaneous Shares bound, then native family formation hEx / classSel / designChoices. The rank and thick-sphere elementary arguments are now closed conditionally on the specified frame and growth hypotheses; do not rederive them. Add to proof_editor manuscript and update numbered open ledger.