# Geometry RUN12 — exact holomorphic-extension readout and support transfer
2026-11-24. DONE for this bounded source-level reconstruction. SOURCE-MATCHED / human argument; exact finite regression executed. Full project OPEN; no independent Lean replay.

## Continuity and provenance
Read AGENTS, research-state/log excerpts, continuity/research protocols, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, previous geometry RUN11 (11d241e868501e1990811f96329034bc061eaaa6), recent peer commit messages and available RESUME notes (audit, literature, math, character, Galois, theta, structure, Landau, prime, dependencies, kernel, acceleration, integration, editor). No competing readout reconstruction found. Some peer diffs lacked a RESUME line; no assertion of exhaustive collision search. CI summary branch read attempted; no CI result for this new work. The linked external PDF was not reopened; original source governs. No physics queue changes.

Pinned upstream P = 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream H = 9282d3a102c4aff0e6026746db2a8990f5d9cddd, merge #1313, timestamp 2026-11-24T18:24:32Z. GitHub-returned blob identifiers, not independently hashed raw bytes:
- src/Development/WeilBound/CoreStatements/ProjectiveValuations/HolomorphicExtensionSections.lean — 70552a9e54f3c0a673c504a9445430c966082a3f
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/HolomorphicExtensionSectionReading.lean — f653184c498379a0ff7d3bbaa1ee69a5775d5f6a
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/HolomorphicExtensionSectionReadingStatement.lean — 2545d108a4cbf648e0cbf3d7c00a134f7f99bcc4
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/OffZero.lean — eee4910349795a98ab9d7b950379f146835b2ec7
- src/Development/AutomorphicSpectrum/Definitions/GlobalGeometry/ExistsVanBdOfMemExtVanZ.lean — 000a714749b88ecc49f57ca4154f18918d6fbb89
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean — 3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean — 73af5a84e8e43d8a3d0e4b4066937e39941a83fe
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean — 0c0ad5b8910bc85997bb107de3caab75c487ed0c

The first three paths and VuOntoC return 404 at H. The principal theorem and caller now occur in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean (H blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e). The complete principal theorem's 26 normalized nonblank lines match exactly (P L8, H L719). Other matching normalized declaration blocks: Reads (P20/H50), OffZero (27/57) at H blob 7c76f89d283db0cf7358bad89c8d100bce3f39b1; ruleTop (45/69), evR_ruleTop (83/107), mem_vanOut_iff_le (60/84), ruleTop_mem_extVanZ (95/119) at H blob 3eb2ef749524e7a0b72ba2919aab8094090c3c1c. Seven equal blocks in total. The eighth comparison, exists_comb (P20/H1409), differs by replacing the two wrapper calls with direct calls to _root_.GlobalTheory.CompanionTheory.VanDescent.vanish_descent and _root_.DifferentiableLines.holomorphic_extension_sections at H1446/1449. The original wrappers are retained in P provenance, not presumed present at H. Comparison trims each line and drops blanks; no kernel equivalence claim.

## 1. Exact quantified readout
GlobalTheory.T.holomorphic_extension_section_reading delegates to GlobalTheory.CompanionTheory.Ar.HolExt.reads_comb, which delegates to DifferentiableLines.holomorphic_extension_sections. For every E with Field, NumberField, IsCMField instances; H:Host E, D:Datum H, l:Level H, Xo:Moduli D l, c:Coeff l, r:natural, σ:c.F→+*C, V:Unf Xo c σ r, T:TorFlag Xo c, e:Ix D→Z, k:V.Comp, P:Frame (V.X k).Ψ r→C and h a chart-indexed function on complex points of flagStr T.X, assume Reads V T e k P h. For every natural m, coefficients a_j∈C and sections s_j∈(T.X.LL e).Sec, assume the **function equality**
  h = Σ_{j∈Fin m} a_j • secVal(flagStr T.X,σ,s_j).
Then for **every x∈(V.X k).dom**,
  P(x) = Σ_j a_j rdU(V,ruleTop(T.X,e,H0.ofSec(flagStr T.X,top,s_j)),k,x).
Neither good embedding, IsUnf, e(none)=0, smoothness, cusp vanishing, holomorphicity itself, nor boundary support is an extra hypothesis of this local theorem. Those are used to establish its premises in the caller. No tensor equality, no claim outside dom, m=0 allowed, integer weights including negative ones. The name “holomorphic extension” does not itself supply holomorphicity.

## 2. Source proof, with geometry explicitly separated
Fix an admissible x and put p=V.un k ⟨x,hx⟩. Let z=T.X.ptY(p). Since CAt σ has the local-ring instance of C, exists_chart_of_isLocalRing gives chart i and hz: top≤z⁻¹(U_i). T.X.lies_ptY supplies the flag incidence. T.X.top.exists_chartFr on frX_snd and this incidence supplies a chart frame Q; hQ.exists_frBor supplies t:Ix D→(CAt σ)^× with FrBor(t,Q,p). The point is over the open flag locus: rewrite z using T.X.pt_inc and use le_preimage_map, top_le_inc, le_top to give hO:top≤z⁻¹(flagOpen T.X). Thus y=(z,ptY_str) is the specified complex point, in ptsIn of U_i. CAt σ also inherits reducedness from C.
Define χ=toC((∏_{ix} t(ix)^e(ix)).val). Every t is a unit, so negative integer powers are legitimate. Reads is universal in x,hx,i,y,hz,Q,t and in the three witness conditions (point equality, ChartFr, FrBor); apply it to these selected witnesses:
  P(x)=χ h(i,y).
The supplied equality of functions implies by evaluating the two argument slots (Finset.sum_apply twice):
  h(i,y)=Σ_j a_j secVal(s_j)(i,y).
No summands are dropped, and the sum is not a Hermitian pairing.

## 3. The common multiplier is exactly the rule evaluation
Write S_j=H0.ofSec(flagStr T.X,top,s_j), f_j=ruleTop(T.X,e,S_j). The native definition of ruleTop is restriction to flagOpen followed by the inverse linear equivalence secOf and the subtype inclusion into Rul. Its defining inverse identity is secOf_ruleTop. For every commutative reduced c.F-algebra A, section S, frames P,Q, chart i, z:Spec A→T.X.YY, chart containment hz and flag-open containment hO, with ChartFr and FrBor t Q P, the source theorem evR_ruleTop gives:
  evR(Xo,c,ruleTop(S),P)=(∏ t(ix)^e(ix)).val * H0.val(z,i,top,hz,S).
The proof invokes evR_eq_val_secOf using hO,hQ,ht, rewrites secOf_ruleTop, then uses evalPt_res with the intersection-open inequalities. Reducedness must not be erased from this general lemma. Restriction and the inverse equivalence explain why this is the same evaluation, not a new normalization.
Now specialize to CAt σ and S_j. For each j the four identities actually used are:
(a) rdU(V,f_j,k,x)=toC(evR(Xo,c,f_j,p)) by dif_pos hx.
(b) secVal(s_j)(i,y) is its chart evaluation by CxPts.ev_eq hy.
(d) evR_ruleTop as above.
(f) H0.val_ofSec identifies the top-section evaluation with that of s_j at the chart.
Substitute these into χ h(i,y) and use distributivity and mul_left_comm:
  P(x)=χ Σ_j a_j secVal(s_j)(i,y)
      =Σ_j a_j [χ secVal(s_j)(i,y)]
      =Σ_j a_j rdU(V,f_j,k,x).
This is the whole local readout. No divisions by a_j or by section values, no nonvanishing section premise, no need to select a_j real. The source's final rfl is a definitional identification, not a new analytic argument. All chart existence, frame comparison, open-locus factorization and evaluation lemmas remain separately cited dependencies.

## 4. Support transfer and the actual caller
VuOnto.exists_comb assumes hσ:GoodEmb c σ, hU:IsUnf V, he:e none=0, hT:∀k,Tw V e k (la k), hP:∀k,P k∈(V.X k).SS(la k). It constructs a finite component sum h=Σ_k h_k using open_secZ, and holoOn_bdZ plus open_holoZ for each component. OffZero asserts zero at chart points not reached by that component. Different components cannot reach the same point of the flag under the source groupoid and IsUnf hypotheses, so when evaluated in the component-k reading condition all h_k' for k'≠k vanish. The source obtains this via the two FrBor witnesses and IsUnf, ending in Sigma.mk.inj. Thus Reads holds for the single h, for each k. Off the open locus every h_k vanishes by mem_open_of_ptY, so h does also. The GAGA bridge AnRead.bijective_valC under projectivity and line-bundle assumptions produces xC with SecC.val(xC)=h; smoothness gives locally finite type. RUN11's descent gives a common m,a_j,s_j with nonzeroLocus(s_j)≤flagOpen and equality of evaluated functions. This is the equality used in section 1, for each k with the SAME coefficients and sections.
For each j, use H0.bijective_ofSec_top to identify toSec(S_j)=s_j. The definitions are:
  vanOut = sections whose germs in all charts outside flagOpen lie in the stalk maximal ideal;
  extVanZ = image of vanOut under ruleTop.
mem_vanOut_iff_le is exactly s∈vanOut iff nonzeroLocus(toSec(s))≤flagOpen. It uses the preceding mem_vanOut theorem: an outside nonzero point gives a chart with unit germ, contradicting the maximal ideal condition, and conversely a unit germ contradicts absence from nonzeroLocus. The stronger equivalence ruleTop_mem_extVanZ uses injectivity of ruleTop (density of flagOpen and restriction injectivity plus secOf inverse); for the forward construction of f_j, the image membership direction suffices. Hence every f_j∈extVanZ, not merely their complex linear combination. This completes the local assembly from the hypotheses, while GAGA and analytic boundary suppliers are explicitly OPEN. No assertion that P itself is algebraic over c.F.

## 5. Executed finite checks and reproduction
Executed in V8: {"empty":225,"single":3600,"double":57600,"term":118800,"projective":192,"negative":4}. 61,425 readout cases, 118,800 per-summand checks (nested, not independent of readout counts), 192 concrete O(2) transition checks on P1, four negative controls. Gaussian rational arithmetic uses exact BigInt numerator pairs and common denominators; no floating rounding. The O(2) example is a separate chart transition illustration, NOT an instantiation of the unitary moduli hypotheses. The third negative control merely guards the zero/nonzero distinction; it does not establish domain behavior of rdU. No geometry existence, kernel proof or acceleration validated by this finite test. Save code as run12.mjs and run node run12.mjs:
~~~js
function run(){
 const g=(a,b=0,d=1)=>[BigInt(a),BigInt(b),BigInt(d)];
 const add=([a,b,d],[c,e,f])=>[a*f+c*d,b*f+e*d,d*f];
 const mul=([a,b,d],[c,e,f])=>[a*c-b*e,a*e+b*c,d*f];
 const inv=([a,b,d])=>{if(a===0n&&b===0n)throw Error("zero unit");return [a*d,-b*d,a*a+b*b]};
 const eq=([a,b,d],[c,e,f])=>a*f===c*d&&b*f===e*d;
 const pow=(z,n)=>{let v=g(1);if(n<0){z=inv(z);n=-n}for(let i=0;i<n;i++)v=mul(v,z);return v};
 const sum=xs=>xs.reduce(add,g(0));
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const values=[g(0),g(1),g(0,1),g(1,-1,2)],units=[g(2),g(1,1),g(0,-1)];
 const counts={empty:0,single:0,double:0,term:0,projective:0,negative:0};
 for(const t of units)for(const u of units)for(let e=-2;e<=2;e++)for(let f=-2;f<=2;f++){
  const chi=mul(pow(t,e),pow(u,f));
  for(const as of [[],...values.map(a=>[a]),...values.flatMap(a=>values.map(b=>[a,b]))]){
   const ss=as.length===0?[[]]:as.length===1?values.map(a=>[a]):values.flatMap(a=>values.map(b=>[a,b]));
   for(const vs of ss){
    const h=sum(as.map((a,j)=>mul(a,vs[j])));
    const lhs=mul(chi,h),rhs=sum(as.map((a,j)=>mul(a,mul(chi,vs[j]))));
    ck(eq(lhs,rhs),"readout");
    for(let j=0;j<as.length;j++){ck(eq(mul(chi,mul(as[j],vs[j])),mul(as[j],mul(chi,vs[j]))),"term");counts.term++}
    counts[["empty","single","double"][as.length]]++;
   }
  }
 }
 // O(2) on P1: z=X/Y, w=Y/X. pY(z)=z² pX(1/z).
 for(const z of units)for(const a of values)for(const b of values)for(const c of values){
  const w=inv(z),pY=sum([a,mul(b,z),mul(c,pow(z,2))]),pX=sum([c,mul(b,w),mul(a,pow(w,2))]);
  ck(eq(pY,mul(pow(z,2),pX)),"projective transition");counts.projective++;
 }
 ck(!eq(pow(g(2),-1),pow(g(2),1)),"inverse exponent");counts.negative++;
 ck(!eq(mul(g(0,1),g(0,1)),mul(g(0,-1),g(0,1))),"no conjugation");counts.negative++;
 ck(!eq(g(1),g(0)),"nonzero section does not evaluate as zero off chart by fiat within chart");counts.negative++;
 try{inv(g(0));throw Error("accepted zero")}catch(e){ck(e.message==="zero unit","zero unit control");counts.negative++}
 return counts;
}
console.log(JSON.stringify(run()));
~~~
On a pinned clone, compare each provenance blob with git rev-parse P:<path> (replace P by full commit above); source links use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. Source body references only: VuOnto.exists_comb → GlobalTheory.T.holomorphic_extension_section_reading → GlobalTheory.CompanionTheory.Ar.HolExt.reads_comb → DifferentiableLines.holomorphic_extension_sections → evR_ruleTop / H0.val_ofSec / CxPts.ev_eq. No authenticated elaborated root reachability asserted.

RESUME HERE: reconstruct PositivityTheory.UnitarySelfGeneration.VuOnto.tendsto_arc_readsZ from pinned VuOntoB, specifically the two component branches and cancellation chr ee t=1 using ht1 (all some coordinates) AND hee (none exponent zero). Preserve every analytic boundary arc, lifting, monodromy, nontriviality, period and cusp-decay supplier. Then holoOn_bdZ and GAGA separately; do not redo this readout or RUN11. Request role-labelled root evidence for exists_comb, holomorphic_extension_section_reading, reads_comb, DifferentiableLines.holomorphic_extension_sections and evR_ruleTop, distinguishing removed relays at H. HANDOFF TO geometry, integration, editor, audit, literature, dependency, kernel. Project OPEN.
