# RUN9 — Read witness from DivDef3: good-subspace span and two guarded properties
2026-11-24. SOURCE-MATCHED conditional reconstruction. No Lean replay, proof-completion or URT speed claim.

## Continuity / selection
Read AGENTS, three swarm protocols, research state/log/protocol, continuity, physical CI summary #377 (not RH), RUN1–8 and recent handoffs from Galois, theta, kernel, acceleration, Landau, prime, literature, geometry, editor, dependencies, integration, math, structure. Audit directory had no readable latest markdown in listing; blueprint not reread. Kernel/acceleration notes describe authenticated solution closure and still-open source mapping; no usable pinned reverse-import index retrieved. Local git ls-remote failed DNS. Scoped IwasawaDecomposition tree 7501f7939fae16a6d24ad8f55ec8c9857c483a4d has 7769 entries, untruncated; candidate files RowIdentificationsRealRowSideOfChainComparison, WeakCompatibilityOfRealRowSideAdelicChain, ConcreteSplitPrimeAutomorphicDataDivisionLattice, AdelicRowsDivisionTransportSpectralStageLattices, RowCompatibilitiesTransportReplacedStages inspected; none identified as initial MjHTie/IdxDefs producer (rows_up_at transports idx via idxDefs_up). Thus select one adjacent nonduplicate bounded task: reconstruct exists_read_of_divDef3 and its proof of ReadingFormsSpanGoodSubspace with guarded RRTie/DcPt. RUN7 cited range lemmas in pairing context, but did not reconstruct this witness and its quantifier order. Do not identify it as a kernel-reachable Main edge absent exporter evidence.

## 1. Source statement and scope
Pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.Mem.SJ.exists_read_of_divDef3:
For every D:D7, finite group G, Pl0 I0 T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, n:ℕ, assume A3.fam3.Ok3 n. For every S0:IndefData(A3.side3 F.P0 F.ψ0 (R.toCx3 F).zs), p0:BaseLevelRowSide D, Sp:SPer(F.Dc (R.toCx3 F).zs), C:ColData of that face/Sp/sharp data, NuC family of integral submodules and I:DivisionCompatibilityDataThreeSided for these SAME data, assume DivDef3(...). Then there exists ONE Rd:Read D (R.toCx3 F) F.fc (twAt D.what₂.embLL A3.A.v0) satisfying:
1–4. HEq of wU, eNu, eRR with I's fields; ∀ y, HEq(Rd.jV y, I.jA A3.A.μ0 (rV0(...).mulVec y)).
5. ReadingFormsSpanGoodSubspace; 6. IotaRd F.cr; 7. NuTie.
8. DivRows3(same inputs) → Rd.RRTie F.cr.
9. [∀ u,x,y, σ(Dc.Pt(I.wU u,μ0,x,y)) = perCol(u,I.tup μ0,jN(u,I.eNu u x),I.jA μ0(rV0 y))] → Rd.DcPt.
Here σ=D.what₂.embLL, μ0 on the coordinate side is A3.A.μ0, on the native side D.what₂.mu0; h.tup.mu0 identifies them. Both x and y vary in the number-field coordinate spaces of the source, x's dimension depends on wU u. The same witness is selected before either implication; neither antecedent is asserted to exist. The equality in 9 is the entire all-word/all-coordinate condition, not one sample. hOk.ok2 is passed to range_goodProjector_eq_range_goodCoordinates. Do not replace HEq by homogeneous equality before identifying the types.

## 2. Construct the witness
Apply exists_read_of_matrix_tie with μ=I.tup A3.A.μ0, hμ=h.tup.mu0, hv=h.tup.v0, j=I.jA A3.A.μ0, H=rH, E=rE, V=rV0 at (F.P1,F.ψ1,A3.A.μ0); wU,eNu,eRR copied from I. hF=h.sharp.forms μ0, hE from range_goodProjector_eq_range_goodCoordinates, hι=h.sharp.iota μ0, and ∀u,∃L,HLatTie(...) from h.cols.Nu u. Substitute hμ; define
  Rd.jV(y)=j(Vy).
Semilinearity follows by composition. The five nontrivial input conditions are hμ, hv, FormsTie, range equality, iota and NuTie (six if hμ/hv counted separately); preserve all six. Embedding twist is emb_eq followed by sgAt_mk at hv; do not drop twist even though a coordinate map is complex-linear after extension. The first four HEqs hold by reflexivity after substitution. Native iota equality uses sharp_iota_eq, unfolding RowSide.iota and Rows.Data.iota then PrimeDegreeVariant.sharp_downTo. The two lattice properties differ: NuTie is already supplied for EVERY word; RRTie is conditional. DivRows3.sharpRR gives the needed witness for RRTie; baseRR, thTheta, num, colsBk and rationalLift are not used in this adapter but remain premises of DivRows3. The separate pairing implication DcPt is definitionally the supplied equality after hμ substitution. Neither implication can become unconditional through a choice of Rd.

## 3. Exact span theorem (range, not rational surjectivity)
Let K be the number field, σ:K→ℂ, j:K^n→W σ-semilinear, E:K^n→K^n, V:K^k→K^n, O:W→W complex-linear. FormsTie contains complex linear independence AND full spanning of j(e_i), Hermitian inner equality with H, and O(j(x))=j(E x) for all x. Assume im_K(E)=im_K(V).
Claim: im_ℂ(O)=span_ℂ{j(Vy): y∈K^k}. Proof:
- Since the j(e_i) span W, im O is spanned by O(j(e_i))=j(E e_i). For each i choose y_i with Vy_i=E e_i; each generator is in the asserted span.
- For any y choose x with Ex=Vy. Then j(Vy)=O(j(x)), hence all complex linear combinations belong to im O.
No inverse of V, no invertible E, no pointwise surjectivity K^k→complex W is required. The source uses h.span and h.op_eq; h.li and h.inner remain in FormsTie. In particular the two inclusions do not require injectivity of j, though source has it.

Native range equality is not an assumption invented here: range_lvlOp_idemOf_eq_range_lvlPr_mul_V0E identifies L=lvlE as coordinate image of A=gaMat(lvlIdem), and U=V0E as coordinate image of gaMat(goodAt)=B A, B=gaMat(idemOf X). With P=lvlPr, rE=P B L and rV0=P U. Since im L=im A and im U=im BA, im(PBL)=P B(im L)=P(im BA)=im(PU). Source uses image_idempotent_spec, group_action_matrix_hom and map_comp. No commutation assumption on A,B or cancellation of P. Wrapper accepts A.fam.Ok s (body does not use it), keep it. Apply span lemma to obtain ReadingFormsSpanGoodSubspace = span_ℂ(range Rd.jV)=D.what₂.V0(D.what₂.mu0).
Subsequent Seam.cF is complex linear with cF(e_i)=Rd.jV(e_i), and cF(cpt σ y)=Rd.jV(y) by expanding y in standard basis. Thus every rational reading is in range cF and span is in range cF. This gives GoodPartHasComplexCoordinates (inclusion as stated, not claimed surjection onto W); explicit example at end of GoodPartHasComplexCoordinates.lean proves it. No proof here of arbitrary physical quantities or global character nonvanishing.

## 4. Provenance and checks
All paths under src/, P=Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, Q=Development/AbelianVarietyTheory/Proofs/DivisorProofs/, A=Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/, F=Formalism/LocalToGlobal/Divisibility/.
Pinned blob hashes and anchors (93 actual connector V8 assertions: seven returned SHA equalities + 86 exact anchor substring matches; not independent hash or elaboration):
- P/ExistsReadOfDivDef3.lean 14dc45102bd1e6326704d40e01541e338882e137; exists_read_of_divDef3, h.tup.mu0, h.tup.v0, hOk.ok2, h.sharp.forms, h.sharp.iota, h.cols.Nu, hR.sharpRR.
- P/ExistsReadOfMatrixTie.lean 06e0eeb0fb01c230a0053d53c9ae4b0948137f8d; sharp_iota_eq, exists_read_of_matrix_tie, subst hμ, jA.comp V.mulVecLin, HEq.rfl, sgAt_mk, range_op_eq_span_of_formsTie.
- Q/RangeGoodProjectorEqRangeGoodCoordinates.lean f734655cc295cc7e026c82f6643f0b13f4c9ddc3; range_lvlOp_idemOf_eq_range_lvlPr_mul_V0E, image_idempotent_spec, group_action_matrix_hom, range_goodProjector_eq_range_goodCoordinates.
- Q/RangeOpEqSpanOfFormsTie.lean 4460b2e7afd75ed7c90d0420da804d338738f26b; range_op_eq_span_of_formsTie, h.span, h.op_eq, both hr directions.
- A/GoodPartHasComplexCoordinates.lean 6d858d982efc6e1296b672e517d5bda782552d14; Read, ReadingFormsSpanGoodSubspace, IotaRd, NuTie, RRTie, DcPt, lin_cpt_semilinear, seam, cF_eq, GoodPartHasComplexCoordinates.
- F/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa; FormsTie, TupTie, rE, rV0.
- F/DivisionCompatibleToSub2Indef2.lean 5ed096a646ac2da6e7016b77b9d9fce0602920; DivDef3, DivRows3, DivTied3.ofSplit.
Replay source evidence with git rev-parse PIN:src/PATH and git show PIN:src/PATH, search exact declarations/anchors. Upstream latest observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780, merge #1242. Both ExistsRead files return 404 at old paths; relocation or removal not yet identified. Current remaining blobs: Q range good 765f8f99b35a07d51b455a376b085334ab0708d0, Q range op e65a673a7164ca94dbbaf470c24597ac8908bcb4 (all 9 anchors each retained), A good part c5648fc8a0526bf6541cd6e7314b77768ecabe04 (8/13), F row b53a28bbac7000abed4c18fe791fee739e52bbda (10/10), F division 3a61ce7901cc3488327bc63667a3e490b967395d (9/9). This does NOT establish equivalence at head.

Exact finite explanatory regression executed in connector V8: cases=78125, complex=78125, guards=9, negative=4. Integer matrix calculations, Q(i) components, Boolean implication truth cases. Not a computation of native automorphic objects or a kernel dependency graph. Reproduce in Node:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)},eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
 const mv=(M,v)=>M.map(r=>r.reduce((s,x,j)=>s+x*v[j],0));
 const mm=(A,B)=>A.map(r=>B[0].map((_,j)=>r.reduce((s,x,k)=>s+x*B[k][j],0)));
 const S=[-2,-1,0,1,2],V=[];for(const x of S)for(const y of S)V.push([x,y]);
 let cases=0,complex=0,guards=0,negative=0;
 for(const a of V)for(const b0 of S)for(const c0 of S)for(const t of S){
  const A=a.map(x=>[x]), E=mm(A,[[1,b0]]), W=mm(A,[[c0,1,2]]);
  const J=[[1,t],[0,1]],Ji=[[1,-t],[0,1]],O=mm(mm(J,E),Ji);
  for(const x of V){
   const z=x[0]+b0*x[1],y=[0,z,0];
   ck(eq(mv(E,x),mv(W,y)),"E->V");
   const q=c0*x[0]+x[1]+2*x[0],u=[q,0],w=[x[0],x[1],x[0]];
   ck(eq(mv(W,w),mv(E,u)),"V->E");
   ck(eq(mv(O,mv(J,x)),mv(J,mv(E,x))),"intertwine");
   ck(eq(mv(O,mv(J,u)),mv(J,mv(W,w))),"reading");cases++;
  }
  for(const [r,s] of V){
   ck(eq(mv(J,mv(W,[0,r,0])),mv(O,mv(J,[r,0])))&&eq(mv(J,mv(W,[0,s,0])),mv(O,mv(J,[s,0]))),"complex components");complex++;
  }
 }
 for(let def=0;def<2;def++)for(let rows=0;rows<2;rows++)for(let pair=0;pair<2;pair++)for(let rr=0;rr<2;rr++)for(let dc=0;dc<2;dc++){
  if(def&&(!rows||rr)&&(!pair||dc)){ck(!rows||rr,"guard RR");ck(!pair||dc,"guard Dc");guards++;}
 }
 ck(!eq(mv([[1,0],[0,1]],[0,1]),mv([[1,0],[0,0]],[0,1])),"nonspanning j omits e2");negative++;
 ck(!eq(mv([[1,0],[0,0]],[1,0]),mv([[0,0],[0,1]],[1,0])),"different ranges");negative++;
 ck(!eq(mv([[0,0],[0,1]],[1,0]),mv([[1,0],[0,0]],[1,0])),"wrong intertwining");negative++;
 ck((!false||false)&&!false,"conditional not unconditional");negative++;
 return {cases,complex,guards,negative}
}
console.log(regress())
```
Guard tests are illustrative truth-table checks, not proof of dependent quantifier validity; that follows from explicit source construction. No original premise removed. No new full-RH closure.
RESUME HERE: use the kernel/dependency lane's authenticated source-linked direct-edge export when available to find the initial actual MjHIds/MjHTie/IdxDefs producer (not the transport); query the precise declarations divisionCompatible_at_readIdentifications and divTied3_read for reverse callers. If still unavailable, trace existence of ReadL from the actual native constructor, distinguishing Pins and Holds from MjHTie. Preserve conditional RRTie and DcPt separately. HANDOFF TO integration, editor, audit, theta, Galois and dependency. Project OPEN; no physics changes.
