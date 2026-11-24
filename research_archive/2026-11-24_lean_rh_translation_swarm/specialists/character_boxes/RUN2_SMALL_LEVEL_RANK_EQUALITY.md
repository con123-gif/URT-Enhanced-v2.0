# Run 2 — small-level rank equality from surjective level projections
2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the actual fourth link in TopShape's nine-link conjunction. Project remains OPEN. No kernel validation and no URT performance claim.

## Continuity and provenance
Read all three swarm protocols, AGENTS, continuity, research state, actual runner log/protocol, physical CI summary (45352595797 PASS, unrelated to RH), prior character-box run 1 and recent integration, math, theta, Galois, prime-window, Landau, kernel, acceleration and positivity handoffs. Run 1 already covered the connected-family witness and character transfer; this run takes its expressly open rank-equality frontier. Other math notes cover native host rank budgets, not this adjoint/range proof. All derivations below refer to upstream leanprover-community/riemann-hypothesis at 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed b37b32c236352418f6edf1ed85dd2e4b14420686, 08:32 UTC: the three old ThirdPlaceSeries Link/RankZeroOfRowConditions/BaseRowsEqRecordRows paths returned 404 at that commit; Formalism/LocalToGlobal/NormalizedHeckeFactors/BaseRowsEqRecordRows changed to blob 9000af1d3a539f8a1a89cf6400f1f4babe3b7239. No inference about deleted theorem contents or equivalence across versions.

## 1. Statement and actual route
SmallLevelRankEq(Fm) means: there exists x0 such that for every x >= x0, every i in Fm.Ix(x), every j in SizeData₂.lifts(D) (D=Fm.D(x,i)), the rank dZ0 of the small level j equals the base row count D.what₂.D0. This is NOT a claim of zero dimension. The source uses Finset.mem_Icc on the lifts, giving 1 <= j <= D.R.m.
Actual theta TopShape calls GlobalTheory.Top.link_alt_alt_alt, not the parallel old smallLevelRankEq_closed_of_levelProjection_surjective route. Its hypotheses are the common family class A and the typed selections sel, selS, selP, selDH, selC, selB, all-realisation primitivity hPA, lambda rows hLamP, divisor rows hDivG, and closed surjective level projection zL. These all refer to the SAME selected records.
For each relevant Fm in D3(3,A), zL supplies xr with the following eventual property: for x>Fm.x1, x >= selected threshold s and x >= xr, every i and k in Fin(D.R.m), the selected level projection lPrj at the base type P.A3.A.μ0 is surjective. No universal xr across families is asserted.

## 2. Produce the required local row conditions
At any allowed selected point, P is the first component of selP and its second component proves RowSideDeterminedAlt for the tied data T. hLamP gives RowsHoldLam3 P.
- hDivG is DivRows3G. The realisation Q from selB has Q.charW.tup.mu_used: each type is base or a place-indexed type. In BaseRankEqOfRealisation.tup_all_used_of_realisation, the place case is transported by D.plEq.symm and the identity Q.Rl.mu=P.S0.μ. This gives TupAllUsed(P), so hDivG.toRows yields the actual DivRows3 with all selected A3,P0,ψ0,Ps,ψs,Zs,S0,S1,p0,C,NuC,I arguments.
- AllRealisationsPrimitive consists of PrimRows3 for the chosen indefinite realisation AND TypesSep3. selP_condition_zero_of_primAll extracts both, then calls that realisation's rowsHold0 with selected column compatibility ok1. Result: RowsHold0_3 P. Neither primitivity nor type separation is replaced by surjectivity.
- BaseRowsEqRecordRows uses RowsHold0_3 to derive well-formedness wf0 from famOk, zsSt, zsBl, famSep, then transports row structure via rows0. Consequently dW(i)=P.S0.D and the E_p subspaces form an independent family spanning the entire base carrier.
The local rank step still presupposes the geometric/automorphic producers of these row conditions. We have not proved them from nothing.

## 3. Human proof of the local rank step
Fix one allowed point and k in Fin(D.R.m), one type t in P.T. Write j=k+1. Assume the local projection L=lPrj(...,k,t).mulVec is surjective; assume the row hypotheses just listed. The actual theorem is Formalism.L2.N.ExtNRows3.thetaT_injective_and_finrank_Zj_eq_D0_of_surjective.

(a) Base count: let E_c be the row subspaces P.S0.Ep(c). Independence and spanning give dim(base)=sum_c dim E_c. RowsHoldLam3 provides the map cOf from embeddings σ to classes c and its third component h3 identifies each dim E_c with sum over embeddings satisfying cOf(σ)=c of nRows0(σ). Because the fibers of a function partition its domain,
    P.S0.D = sum_c sum_{σ:cOf(σ)=c} nRows0(σ) = sum_σ nRows0(σ) = D.what₂.D0.
The last equality is the finite cardinality of the sigma-fiber decomposition of ft0 on Fin(D0). This is the actual sum_finrank / sum_fiberwise / sigmaFiberEquiv argument, not a dimension assumption.

(b) Level space M_j: the selected division data P.tied.div.th provides a linearly independent spanning family indexed by Fin(P.S0.dW(k)). It is a basis, so dim M_j=dW(k)=P.S0.D=D0. The equalities use finrank_Mj_eq_dW, dW_eq_D, base_rows_eq_record_rows_alt.

(c) Surjectivity transfer: set B=(P.S0.θ k t).mulVec. RowsHold0_3 gives rows0 and the l1c.2.1 field proving B bijective. For each coordinate basis vector e_a, choose z such that Bz=e_a; then choose y with Ly=z (surjectivity of L). DivRows3.thTheta is the required commutative identity: thetaP(y) is the basis embedding P.I.jW(k) applied to B(Ly), with domain coercions as in the Lean source. Thus thetaP(y)=jW(k)e_a, the corresponding spanning vector of M_j. The range of thetaP contains the spanning family, hence equals all of M_j. This proves thetaP surjective. Both the bijective B and the thTheta identity are indispensable; merely asserting that L is surjective is insufficient.

(d) Adjoint: thetaT is the adjoint of thetaP in the relevant finite-dimensional complex inner-product spaces. If thetaT(v)=0, choose u with thetaP(u)=v. Then <v,v>=<thetaP(u),v>=<u,thetaT(v)>=0 (up to inner-product convention), so v=0. Hence thetaT is injective. The definition Rows.Data.Zj is the range of thetaT, so dim Z_j(t)=dim M_j=D0 by the rank-of-injective-range theorem. This step uses adjoint_injective, thetaP_surj and LinearMap.finrank_range_of_inj, not any numerical approximation.

## 4. Family and type quantifiers
The outer rank_zero_of_row_conditions_alt accepts T and P pointwise above a fixed threshold x0, and all four row hypotheses, plus: at each point there exists t with P.I.tup(t)=D.what₂.mu0 and for ALL k the local projections at t are surjective. link_alt_alt_alt supplies exactly t=P.A3.A.μ0 via P.tied.div.tup.mu0 and zL. It is not a separately chosen t for each k. Choose x0=max(s,xr). The rank-zero wrapper uses X=max(x0,Fm.x1+1) to make the strict x>Fm.x1 premise automatic. At every x>=X and index i, any lift 1<=j<=m corresponds to k=j-1 in Fin(m); apply the local lemma and rewrite the selected type by htup. This is the source equality (Fm.L x i).dZ0 j=D0. No induction on j, no global choice of a threshold independent of Fm. If m=0 there are no such j.
Finally Closed.imp maps zL to the desired eventual rank property for all members, and closed_of_mem removes the repeated membership premise under the Closed class. The Closed quantifiers, design witness and all original selections remain in place.

## 5. Downstream and upstream joins
TopShape passes the resulting Closed(SmallLevelRankEq) as the fourth condition in topDesWin. DesWin combines it with the same-family HypV and LinkN to invoke divinN_of_hypV. There the equality is consumed as h4 x g4 i j hj in divinN_at (the argument hd); it supplies exactly the replacement of L.dZ0(j) by D0, allowing the common division budget. The analytic argument is NOT thereby independent of the arithmetic geometry.
Upstream: AllRowsAlt.zL is Lg1 KP Q Q' with SlotZeroLocusCondition; NonemptyHypsOfAllRows converts it to RowL SelectionZeroLocus, adds it to the nested hall conjunction, and classSel chooses the one common class and raw selection σ. The extracted zL is assigned directly to HypsAlt.zL. ShapeOf passes h.zL (and hPA,hLamP, and the divRows3G_iff conversion of hDivG) to the actual TopShapeAlt. This traces the record flow to the common selection; the substantive SlotZeroLocusCondition producer remains open, not silently discharged.

## Source inventory
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
F = src/Formalism/LocalToGlobal/NormalizedHeckeFactors/
C = src/Development/AutomorphicArithmetic/CharacterBoxes/
Pinned blob identities returned by GitHub (not independently rehashed during this run):
- T/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd
- T/Link.lean 2e303ba7a042b38d3edb0630fee6b519442b546f
- T/RankZeroOfRowConditions.lean a3b28b058716ef66ed61a86e9fda3fdf619667e5
- T/BaseRowsEqRecordRows.lean c224498f474ad9be9f8fe4fb0a9d9cb60f2a6615
- F/BaseRowsEqRecordRows.lean de4ad89a82942891d722dba018a7385cdea991bf
- T/BaseRankEqOfRealisation.lean 73832da09224c40d0aed60316629b1b80d6c55d1
- T/IndefiniteRealisationChoice.lean 9f48b3c9d62cb8f49d7d3787e40dcf496b3a66d9
- src/Formalism/SharpRestriction/GlobalTheoremInputs.lean ba31f5120ed089d48968754ae577427912d467c5
- T/Hyps.lean 7e51220c82d43cf3a9345e87a9aa8751b38a5a25
- T/NonemptyHypsOfAllRows.lean 6a09205dfc3e57486ecbc27517072f3c27f09a51
- T/AllRows.lean be24ab5328945e90d2b981ff43ed9f20bb8b86ac
- T/ShapeOf.lean 236d0eadd60b292bd0a832114f8c4a6253131250
- C/DivinNOfHypV.lean 5321920359316653b7627951429a6d7555c311b0

## Executed checks and reproducibility
V8: 13 connector blob-identity assertions and 71 literal source assertions (84 total) all succeeded. Inspected actual theorem bodies. For example replay from the pinned upstream checkout: git show PIN:T/Link.lean, replacing T by its full path; check rank_zero_of_row_conditions_alt, selP_condition_zero_of_primAll and tup_all_used_of_realisation calls; in T/RankZeroOfRowConditions check thetaT_injective_and_finrank_Zj_eq_D0_of_surjective; in F/BaseRowsEqRecordRows check hR.thTheta, hb.2 (Pi.single k 1), hl z, adjoint_inner_left; in T/BaseRowsEqRecordRows check sum_finrank, Finset.sum_fiberwise, sigmaFiberEquiv, LinearMap.finrank_range_of_inj; in C/DivinNOfHypV check h4 x g4 i j hj. Rehash via git hash-object --stdin against the above blobs. Literal tests are not elaborated dependency verification.

Executed independent finite elementary-algebra regression (real integer matrices, hence complex rank agrees; NOT native geometric operators). Exact BigInt rank elimination without division, all 2x3 projections and 2x2 factors over entries {-1,0,1}. 59,049 pairs: 29,952 both full rank yielded full-rank composite and injective transpose; 29,097 singular composite cases. Negative controls: 5,040 cases projection deficient but B invertible, 20,592 cases projection full rank but B deficient; both demonstrate necessity in this generic argument. Also 3,280 finite fiber maps, 7,572 threshold implications, 5,050 one-based/zero-based lift conversions. The universal proof is the linear algebra above, not these bounded cases. Actual code run in V8:
```js
function rank(a){a=a.map(r=>r.map(BigInt));let h=0;for(let j=0;j<a[0].length&&h<a.length;j++){let k=h;while(k<a.length&&a[k][j]===0n)k++;if(k===a.length)continue;[a[h],a[k]]=[a[k],a[h]];for(let i=h+1;i<a.length;i++){let c=a[i][j],p=a[h][j];for(let z=j;z<a[0].length;z++)a[i][z]=p*a[i][z]-c*a[h][z];}h++;}return h}
function mat(n,r,c){return Array.from({length:r},()=>Array.from({length:c},()=>{let z=n%3-1;n=Math.floor(n/3);return z;}))}
const mul=(a,b)=>a.map(r=>b[0].map((_,j)=>r.reduce((s,x,k)=>s+x*b[k][j],0))),tr=a=>a[0].map((_,j)=>a.map(r=>r[j]));
let full=0,singular=0,negP=0,negB=0,fiber=0,threshold=0,index=0;
for(let p=0;p<729;p++){let P=mat(p,2,3),rp=rank(P);for(let b=0;b<81;b++){let B=mat(b,2,2),rb=rank(B),A=mul(B,P),ra=rank(A),rt=rank(tr(A));if(ra!==rt)throw Error("adjoint rank");if(rp===2&&rb===2){if(ra!==2)throw Error("full rank failure");full++}else {if(ra===2)throw Error("singular unexpectedly full");singular++;if(rp<2&&rb===2)negP++;if(rp===2&&rb<2)negB++;}}}
for(let n=0;n<=7;n++)for(let map=0;map<3**n;map++){let v=map,cs=[0,0,0];for(let j=0;j<n;j++){cs[v%3]++;v=Math.floor(v/3)}if(cs.reduce((a,b)=>a+b,0)!==n)throw Error("fiber");fiber++}
for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++)for(let c=-4;c<=4;c++)for(let x=-4;x<=12;x++){if(x>=Math.max(a,b,c+1)){if(!(x>=a&&x>=b&&x>c))throw Error("threshold");threshold++}}
for(let m=0;m<=100;m++)for(let j=1;j<=m;j++){let k=j-1;if(!(0<=k&&k<m&&k+1===j))throw Error("index");index++}
console.log({full,singular,negP,negB,fiber,threshold,index});
```
No changed hypotheses. No independent Lean execution; exact kernel dependencies, the upstream SlotZeroLocusCondition producer and geometric row producer proofs remain unresolved. No full-proof denominator. No Cathedral physics edits or new speed benchmark.

RESUME HERE: locate the definition and actual producer of SlotZeroLocusCondition by following AllRowsAlt.zL back through allRows_of_open0_alt (from HypothesesNonemptyOfUnramifiedExponents imports) and the SelectionZeroLocus / RowL adapter. Translate why the actual selected lPrj is surjective for ALL k, retaining the uniform eventual xr and common σ. If it reduces to an open-orbit condition, trace the specific implication, not a generic linear-algebra assertion. Do not repeat the rank-equality implication above. Coordinate geometric producers with positivity/theta lanes.
HANDOFF TO: integration, proof editor, audit, theta, positivity, math and Galois lanes. Add this as the local proof of fourth condition, keeping zL and row producers as explicit open dependencies.
