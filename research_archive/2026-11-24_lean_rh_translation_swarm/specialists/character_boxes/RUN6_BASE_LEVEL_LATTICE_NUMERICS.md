# RUN6 — Exact base-level lattice and three numerical identities

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the complete three-field NumTie producer, including the projected lattice and transported Hermitian dual. No independent Lean replay, complete proof or URT-specific acceleration. 

## Continuity and source lock
Read AGENTS, RESEARCH_STATE, runner log/protocol, continuity, physical CI #368 PASS (unrelated to RH), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, own RUN4–5 and recent peer handoffs (Galois, theta, Landau, prime, literature, positivity, editor, integration, kernel, acceleration, dependencies, structure, math). The blueprint is a navigation reference, not independently reread here. Prior RUN4 established theta factorisation, RUN5 the complex span; neither established the integral lattice equality. This run is nonduplicate and keeps the original family. Other lanes' geometry, SWFull, local reciprocity, family-scale estimates and kernel extraction are separate. No physics changes.

Source leanprover-community/riemann-hypothesis @40e56bab026552e089d7afcfeff08d2defb9c005. Moving main observed 26c37b400bc9cfd43c81d798aa5e798af5c55b94 (2026-11-24 12:39:27 UTC); NumbersEqConcreteNumbersAtBaseLevel.lean changed from 9cf0934c44661d941505ed28f7cb6db637c340a9 to ac736cb41c4b89e3dc650716721fb67920a0e68a. Current body switches two wrapper calls to actual ThRead.thDef3_thTheta and DivisionRationalLift.divisionRows_rationalLift and replaces the pinned direct lattice-span supplier with explicit denominator clearing. See §6. Do not merge revisions or infer equivalent complete proof.

## 1. Quantifiers and exact source dependencies

DivisionCompatibleAtReadIdentifications.lean:45 calls GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel to fill num. Its statement wrapper calls GlobalTheory.Mem.ReadIndexNumerics.numTie_of_read. The exact universally quantified data: D:D7, finite group G, Pl0,I0,T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, Xd:DivX D and JM:MjHIds D A3.A Xd (A3.indefDown (s0Of R F)). Inputs Pins R F cG, Holds R F, MjHTie D A3.A Xd (A3.indefDown (s0Of R F)) Z.jW JM, IdxDefs D Xd. All retained. Full DivRows3 still needs the real-group premises, group ties, BuRational and BtVanish for other fields; this local producer does not use those latter two.

Let K=D.what₂.LL, O=𝓞 K, S0=A3.indefDown (s0Of R F). RowSideTie.lean:236–245 defines NumTie as three independent universally quantified identities:
- Ij: for EVERY i:Fin D.R.m, t:T, w:place, D.what₂.Ij(Y.tup t,i+1,w)=S0.Iw(i,t,D.plEq w).
- jw: same quantifiers, D.what₂.jw(Y.tup t,i+1,w)=DivisionValues.jw(HT(i,t),D.plEq w,Tl(i,t)).
- etaJ: EVERY i,w (NO t), D.what₂.etaJ(i+1,w)= if D.plEq w ∈ S0.Tw then A3.A.fam.etaJ(F.P0,F.ψ0,Zs,i,S0.μ(D.plEq w),D.plEq w) else 0, with Zs=A3.fam3.toSub2(zsOf R F).

For fixed i,t put j=i+1, μ=Y.tup t, p=D.plEq w. IdxDefs.Ij_def and jw_def apply only for 1≤j≤D.R.m; both follow from i:Fin D.R.m, including vacuity when m=0. No level-zero j=0 equality asserted. The data called base level refer to the chosen row side F.P0, not setting the numerical level to zero. MjHTie supplies exactly the two projections used in this proof: hM.j_eq i compares Xd.jM∘JM.eW with Z.jW on ALL coordinates; (hM.hlat i).lat identifies (Xd.MjH j).L with the O-linear image of S0.M i by JM.eW i. These are not arbitrary lattice isomorphisms chosen separately. The full record declaration/producer remains a separate source-tracing obligation.

## 2. Projected integral lattice, not just a complex span

Source TjL_eq_map_matLat (LatticeTjEqImageOfCoordinateLattice.lean), with hP orthogonal projection matrix certificate, hF FormsTie, hL OLatTie, hZ RUN5 span, hθ equality of theta on x and its projected coordinates. Write E=Y.eMt i t, J=jMt∘E, Zm=lZ0, P=lPrj, H=lH, N=lNab, T=Tl(i,t). P Zm=I. The native T is the coordinate projected lattice (the final proof unfolds its image membership); preserve that definition rather than assuming T=O^d.

Let S=Idx.Z0. By RUN5 S is the complex span of J(Zm z). The residual Jx−JZmPx is orthogonal to S: on each generator JZmz its pairing vanishes by hF.inner and hform_orth hP, and this extends across the complex span. Thus the uniqueness of orthogonal projection gives proj_S(Jx)=JZmPx (hproj).

The theta equality θ(Jx)=θ(JZmPx) holds on all coordinate vectors by RUN4 and PZm=I. Since their J-images span the complex ambient space (hF.span), complex-linear extension gives θ=θ∘proj_S on the whole ambient space (hθall). Consequently S^⊥⊆ker θ. Taking orthogonal complements with the native projection/finite-dimensional structure gives ker θ^⊥⊆S; S⊆ker θ^⊥ by definition. Hence the native Zj=range θ†=ker θ^⊥ is S (hZj). As eMt is idempotent, it fixes its range, which contains S. Thus eMt proj_Zj=proj_S (h4').

The coefficient-field lift of this projector is π=E Zm P E^{-1}, restricted to O-linear maps; its image need NOT preserve the original integral lattice. hπ identifies jMt(πx) with the native eMt proj_Zj(jMt x). The source h6 identifies the O-span of preimages of the native MtLat carrier under jMt with E(N). Forward: use the OLatTie coefficient witness and E inverse (including OtoLL and O_int). Reverse: express the carrier point as a finite sum over its given generators, lift each generator using MtLat_sub, then use sum induction and injectivity jMt_injective to identify the preimage. This step uses genuine lattice data, not a complex-span substitution.

The native TjSet is the image of that carrier under eMt proj_Zj. Since every carrier point has a jMt preimage (carrier_subset) and jMt is injective, hset identifies its preimage exactly with π of the carrier preimage. Commuting O-span with linear image gives
    TjL = π(E(N)) = E(Zm(T)).
The final equality uses the native projected-coordinate lattice definition by the two image membership inclusions. This is the exact integral-module equality required by both following indices. Do not infer saturation, equality to all rational points of S, or preservation of integrality in the original coordinate basis.

## 3. First index: theta image and reference lattice

Source NumbersEqConcreteNumbersAtBaseLevel.lean, ijIdx_eq. Let Θ=S0.θ i t, eW=JM.eW i, M=S0.M i. Input hθ says θ(Jx)=jW(Θ P x), hj says Xd.jM(eW z)=jW z, hl says reference lattice L=eW(M), hT is §2. For x=E Zm z, z∈T,
    θ(jMt x) = jW(Θ P Zm z) = jW(Θ z) = Xd.jM(eW Θ z).
By injectivity of Xd.jM (Idx.jM_inj), the target coordinate preimage is unique. Thus thTj=eW(Θ T): forward extract z from membership in TjL; reverse choose x=E Zm z. No independent surjectivity onto the whole target space is required here.

By Idx.IjIdx definition, IjIdx=lidx_p(L,thTj). The common injective K-linear eW identifies both lattices. SkeletonIndexLemmas.lidx_map gives
    lidx_p(eW M,eW ΘT)=lidx_p(M,ΘT)=S0.Iw(i,t,p).
The latter is the definition Iw in IndefSide.lean. This is a signed local index, not an unsigned cardinality; preserve operand order. lidx_map is proved by injective maps preserving intersections (Submodule.map_inf) and localization lengths (locLen_map transports quotients by linear equivalence, preserving length). The theorem itself does not require a new finite-index inclusion hypothesis.

## 4. Second index: transport the Hermitian dual

Source LatticeJwIndexEqConcreteLiftIndex.lean, jwIdx_eq_jw. Additional native hypotheses beyond §2: H_T=Zm* H Zm (conjugate transpose on first Zm), span_K T=K^d. Define f=E∘Zm. It is injective because E is an equivalence and PZm=I. hTL rewrites TjL=f(T); hTV uses full K-span to give TjV=range f. hF.inner and the Gram identity give for all y,z:
    <jMt f(y),jMt f(z)> = embLL(hform(H_T,y,z)).
This is a transported pairing, not an assertion that f is unitary for arbitrary unrelated metrics.

The concrete O-dual T^# consists of z∈K^d for which for EVERY y∈T there exists c∈O with hform(H_T,y,z)=c (mem_dual_iff). The native TjDual consists of x∈TjV pairing integrally with every member of TjL (DataIdx.lean). If x belongs to it, x=f(z) since TjV=range f. Test against each f(y) and cancel injective embLL to get z∈T^#. Conversely z∈T^# gives f(z)∈TjV and integral pairing against all f(y). Therefore
    TjDual=f(T^#).
Both primal and dual are carried by the SAME f, not two unrelated changes of basis. Again lidx_map gives
    jwIdx=lidx_p(f(T),f(T^#))=lidx_p(T,T^#)=jw(H_T,p,T).
The native Gram supplier is BlockDat.lf_lE_form(hB i t); full span is (BlockDat.lf_Tl_isLattice(hB i t)).span_eq_top at the pin. This argument does not assert positive jw, integral T⊆T^#, or a discriminant formula; DataIdx.FactGram is a separate predicate with its own hypotheses. The determinant relation is not required in this proof. The concrete source lidx_latOf shows sign convention lidx(A,γA)=v_p(det γ) under its own independence/nonzero determinant assumptions.

## 5. Assemble all three fields

numTie_of_read obtains the same hθ and hZ0 via RUN4–5, hB from Holds.ok.ok2 (conj,irr,lifts), hOP from BlockDat.lf_l_proj, hT from §2 using Y.formsL, Y.latL. It discharges both IdxDefs guards and invokes §§3–4. The third identity uses Z.etaJ, with a case split on D.plEq w∈R.twPl. S0.Tw is the same set definitionally; in the membership case both branches give the same native value by rfl; outside both are zero. No numerical determinant enters this branch.

TupUsed.lean:92–110: NumTieG weakens Ij,jw to Used0 D(P.I.tup t)→∀w, but etaJ remains unguarded. numTieG_of restricts; numTie_of_G uses TupAllUsed for each t; without universal coverage there is no reverse implication. This completes the local num field, conditionally on every original input. It does not establish existence of MjHTie, IdxDefs, Pins or Holds. Nor is this the later division inequality or GRH itself.

## 6. Current-head explicit span supplier (navigation only)
At observed head the same local proof makes hsp explicit: for arbitrary z, x=B.fE z. For each finite component c, finite generation of Nab c gives one nonzero denominator d_c clearing all pairings of S.I x c with its generators. Span induction, including star-stability of O, extends integrality to all of Nab c. The source uses good.dual_le and del_le to place d_c S.I x c in Nab c. Multiply a=∏_c d_c≠0, so d_c|a and a S.I x c∈Nab c for every c. mem_valLatF gives ax∈S.nabLat; lf_cutZ_le implies az∈B.Tl. Since a is nonzero in K, z=a^{-1}(az) lies in span_K B.Tl. This explains why the proof is denominator clearing, not a basis count. The new helper premises and its dependencies are not independently rechecked; no pinned-to-current equivalence claim.

## 7. Reproducibility
Actual V8 connector source assertions: 12 pinned files, 12 reported blob hashes and 80 literal source anchors (92 total). Static source matching only; not elaborated dependencies. Below is a compact independent checkout replay for 12 blob hashes and one declaration anchor each (24 checks), not the full 92-assertion run. Copy ledger to run6_sources.json and run from a checkout:
~~~python
from pathlib import Path
from hashlib import sha1
import json
for path,h,a in json.load(open("run6_sources.json")):
    b=Path(path).read_bytes()
    assert sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==h,path
    assert a in b.decode(),(path,a)
print("24 source checks")
~~~
~~~json
[
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DivisionCompatibleAtReadIdentifications.lean",
    "b6594122a28670a9dca1e61b23f5be9594f7f877",
    "num := GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/NumbersEqConcreteNumbersAtBaseLevelStatement.lean",
    "3b054eef14c42c47cbb19bb253a863fe3281d566",
    "GlobalTheory.Mem.ReadIndexNumerics.numTie_of_read"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/NumbersEqConcreteNumbersAtBaseLevel.lean",
    "9cf0934c44661d941505ed28f7cb6db637c340a9",
    "theorem numTie_of_read"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LatticeTjEqImageOfCoordinateLatticeStatement.lean",
    "1762312315fbf0e802d959b24cf42f724a7ffdf9",
    "GlobalTheory.Mem.LiftForms.TjL_eq_map_matLat"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LatticeTjEqImageOfCoordinateLattice.lean",
    "56cb7a9169d71af0aacdf269942fe76fb6311a00",
    "theorem TjL_eq_map_matLat"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LatticeJwIndexEqConcreteLiftIndexStatement.lean",
    "c7c7fa95cca082e6d73f83090c228142516a8b96",
    "GlobalTheory.Mem.JwLift.jwIdx_eq_jw"
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LatticeJwIndexEqConcreteLiftIndex.lean",
    "b0b28074852b96f4c3e68042856911eb45e210de",
    "theorem jwIdx_eq_jw"
  ],
  [
    "src/Formalism/LocalRingCardinality/DataIdx.lean",
    "3c508b4f1d3efa3e1f8b5c5d76998dfbd7f41795",
    "structure IdxDefs"
  ],
  [
    "src/Formalism/LocalToGlobal/Divisibility/RowSideTie.lean",
    "7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa",
    "structure NumTie"
  ],
  [
    "src/Formalism/LocalToGlobal/Divisibility/TupUsed.lean",
    "478364841e4931ae1cf32aa2dd7e2d95253e2336",
    "theorem numTie_of_G"
  ],
  [
    "src/Formalism/LocalRingCardinality/CoeNeZeroOfNotMem.lean",
    "30d49af7170d77b6cde08218b8a91771e77d3e98",
    "theorem lidx_map"
  ],
  [
    "src/Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean",
    "bd368accfbed7af9b034507d0a5348dc32bb0225",
    "def Iw"
  ]
]
~~~

Exact finite rank-one regression (K=Q,O=Z, integer H=diag(h,k), Zm=(a,b)^T, D=ha²+kb², Pr=(ha,kb)/D). Tests the projected coefficient lattice via Bezout, exact rational dual pairing and signed valuation invariance under common injective scaling. These are algebra regressions, NOT native arithmetic inputs or proof of Pins/Holds. The actual V8 results were {"projections":17496,"dual":16848,"indices":55296,"guards":78,"bezout":216,"negative":6}. In the dual test every lattice pairing is integral iff the generator pairing is integral. Integer arithmetic stays within JS exact integer range. The finite rank-one model is not a general number-field computation; negative controls are explanatory omitted-premise examples. Reproduce in Node:
~~~js
function regression(){
 const gcd=(a,b)=>{a=Math.abs(a);b=Math.abs(b);while(b){[a,b]=[b,a%b]}return a};
 const eg=(a,b)=>{if(b===0)return [Math.abs(a),Math.sign(a),0];let [g,x,y]=eg(b,a%b);return [g,y,x-Math.trunc(a/b)*y]};
 const val=(p,n)=>{n=Math.abs(n);if(!n)throw Error("zero valuation");let v=0;while(n%p===0){n/=p;v++}return v};
 const vq=(p,n,d)=>val(p,n)-val(p,d);
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let projections=0,dual=0,indices=0,guards=0,bezout=0,negative=0;
 for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++){if(!a&&!b)continue;
 for(let h=1;h<=3;h++)for(let k=1;k<=3;k++){
 const u=h*a,v=k*b,D=h*a*a+k*b*b,g=gcd(u,v);const [gg,r,s]=eg(u,v);
 ck(gg===g&&u*r+v*s===g,"Bezout witness");bezout++;
 // Tl=(g/D)Z in coefficient space; project numerator u*x+v*y.
 for(let x=-4;x<=4;x++)for(let y=-4;y<=4;y++){
 const c=u*x+v*y;
 ck(c%g===0,"image contained");ck(u*(r*c/g)+v*(s*c/g)===c,"image reverse");
 ck(u*(D*x-a*c)+v*(D*y-b*c)===0,"weighted orthogonality");
 ck(u*a+v*b===D,"PrZ identity");projections++;
 }
 // dual coefficients z = n/(g*d), test all pairings against generator g/D:
 // h_T(g/D,z)=n/d, integral exactly when d divides n.
 for(let n=-6;n<=6;n++)for(let d=1;d<=6;d++){
 const integral=(D*g*n)%(D*g*d)===0;
 ck(integral===(n%d===0),"dual pullback integral");
 // Same coefficient expressed in ambient coordinates, with H diag(h,k).
 ck(((h*a*a+k*b*b)*g*n)%(D*g*d)===0===integral,"ambient pairing");
 dual++;
 }
 for(let t=1;t<=4;t++)for(let m=1;m<=4;m++)for(let scale=1;scale<=4;scale++)for(const p of [2,3,5,7]){
 // target reference lattice mZ, image theta Tl = t*g/D Z.
 ck(vq(p,scale*t*g,D*scale*m)===vq(p,t*g,D*m),"Ij index invariant");
 // dual (1/g)Z, primal (g/D)Z. Use the common line f, not whole ambient.
 ck(vq(p,D,g*g)===vq(p,scale*D,scale*g*g),"jw index invariant");
 indices++;
 }
 }}
 for(let m=0;m<=12;m++)for(let i=0;i< m;i++){ck(1<=i+1&&i+1<=m,"Fin level guard");guards++}
 // Concrete witnesses of invalid simplifications.
 ck((1/2)!==Math.trunc(1/2),"projection onto (1,1) not necessarily integral");negative++;
 ck(1*1!==2*1,"altering HT changes dual pairing");negative++;
 ck(vq(2,2,1)!==vq(2,2,2),"changing just reference lattice changes Ij");negative++;
 ck(vq(2,1,2)===-vq(2,2,1),"index not unsigned");negative++;
 ck(0===0&&1!==0,"zero map loses distinct preimages");negative++;
 ck(!(1<=0),"unguarded j=0 cannot invoke IdxDefs");negative++;
 return {projections,dual,indices,guards,bezout,negative}
}
console.log(regression())
~~~

RESUME HERE: trace the remaining colsBk producer GlobalTheory.T.rationalPairing_eq_columnPairing from DivisionCompatibleAtReadIdentifications.lean into RationalPairingEqColumnPairingStatement.lean and its actual implementation; reconstruct the rational bilinear pairing vs column pairing with the full hC, hBu and hBt inputs, especially why base-tuple vanishing is needed. Do not repeat RUN2–6. After that, return to the outstanding actual producers of MjHTie and IdxDefs and the sharpRR/baseRR real-group lattice metric comparisons. HANDOFF TO integration, editor, audit, theta, Galois and math. Preserve both index argument orders and the tuple guards. Project OPEN.
