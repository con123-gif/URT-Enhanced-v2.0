# RUN8 — Two-level row-lattice and metric compatibility

2026-11-24. SOURCE-MATCHED conditional reconstruction of sharpRR/baseRR in DivRows3. Initial MjHTie/IdxDefs producers remain OPEN; later IdxDefs transport traced. No independent Lean replay or URT speed claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol, continuity excerpts, physical CI #374 (not RH), RUN7 and latest accessible handoffs from Galois RUN8, Landau RUN8, theta RUN8, prime RUN8, geometry RUN7, literature RUN7, kernel RUN8, acceleration RUN8, editor 1356, integration, math, dependencies, structure and Grok. Blueprint not reread. No duplication of RUN6 index equalities or RUN7 pairing. Tried to locate initial MjHTie/IdxDefs caller: GitHub default-branch code searches returned no matches; recursive root tree truncated; scoped trees IwasawaDecomposition 7769 entries, LocalToGlobal 5733 and LocalRingCardinality 175 enumerated. Rather than invent an initial producer, traced adjacent unfinished row-lattice and metric obligations.

Pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 9477923066c923e6dbf7292da17019f8d08d0db8 (2026-11-24 14:18:56 UTC). At that revision DivisionCompatibleAtReadIdentificationsStatement.lean blob e34a9fe4644fa2038729074eea6d86bc557fc70a retains divTied3_read (176) and sharpRR/baseRR (195–196). RowLatticesMetricsAgreeOfRealGroupTheorems.lean blob 5d59980ce4303c890f8f8b9eec1bdc09946ec743 contains relocated majAt_rows_fixed (720), majAt_eq_of_diag (808), metric_base_fixed (849), rowLat_ties (921). Old IpMSmulMeasureSelf and MajAtSmulRightOf paths 404. IdxDefsUp.lean blob db05a811dc5caf4604b858dfda3c6095d06bd31b retains idxDefs_up (91). Source migration, not kernel equivalence.

## 1. Exact local statement
GlobalTheory.T.rowLattices_metrics_agree_of_realGroupTheorems invokes GlobalTheory.Mem.R3.rowLat_ties. Assume hC = DiscreteSeriesCover ∧ HarishChandraModules ∧ CasselmanWallach ∧ HarishChandraFinite ∧ CuspRapidDecay; for every D:D7, finite group G, types Pl0 I0 T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, assume Pins R F cG and Holds R F. Then BOTH
  HLatTie (RowSide.sharp D).RR (A3.indefDown (s1Of R F)).RR (A3.indefDown (s1Of R F)).XE Z.eRR
and
  HLatTie X0.s.RR (A3.indefDown (s0Of R F)).RR (A3.indefDown (s0Of R F)).XE Z.eRR0.
For each level let e be its K-linear equivalence, A native Hermitian lattice and L,X coordinate lattice/metrics. HLatTie consists of A.L=e(L) as O_K-submodules AND ∀ infinite places v, ∀ x,y, majAt(A,v,e x,e y)=majAt(X,v,x,y). Not equality of K-spans alone. Parent divTied3_read assumes hMj,hIdx,hBu,hBt for DivRows3; this local pair does not use those four, but all parent hypotheses remain.

## 2. Integral gluing for each level
Obtain hD=rowSide_definition_both_levels(hC,Pins,Holds) and hOk=hH.ok.ok2: A3.A.fam.Ok 1. For S=indefDown(s_b), Y.muAt identifies every native finite-place tuple with tup(S.μ(D.plEq w)). The adopted theorem takes hOk, hD.1 or hD.2, Z.rr or Z.rr0 (RRDef), Y.muAt and Y.stable or Y.stable0; keep eRR/eRR0, jA/jA0 paired with their respective levels.

V0 is zero subspace, U=V0∩ker iota, Q=V0∩U^⊥. For x∈V0 subtract its Q-projection. Residual y∈V0∩Q^⊥. Subtract U-projection of y; remainder belongs to Q∩Q^⊥ and vanishes. Thus y∈U and iota(proj_Q x)=iota(x). RRset_eq_iota_image identifies RRset with iota(Mtilde.carrier∩V0), not the whole ambient image.

span_le_lemma_8 starts with a rational row generator y with jEE y∈RRset. Lift to u∈carrier∩V0. integral_iff_matrix_indefinite_side gives F∈Mt, and hX.iota identifies its image as jEE(eRR(ι_t Pq_t F)); jEE injective by complex independence of basis images and field embedding injectivity. This places y in eRR(matLat(ι_t,abelian₂_t)). le_span_lemma_9 reverses it: given F in the coordinate lattice, the reverse integral characterization and the finite-sum premise hint express jA(rV0 F)=Σ c_u u with u in carrier∩V0. Each u has rational lift z_u with jEE z_u=iota(u). Semilinearity and injectivity give eRR(ι_t Pq_t F)=Σ c_u z_u, and each z_u belongs to the generating row set. Both inclusions are over O_K. The adopted theorem derives hint via stability under integral scalars, zero and addition: an x already in the intersection admits singleton {x}, coefficient 1. This does NOT assert original generators are individually in V0.

Set L_w=matLat(ι_(μ(w)),abelian₂_(μ(w))). The glued lattice intersects the local conditions ∃d∈O_K, d∉p_w, d x∈L_w. By e^{-1}(d y)=d e^{-1}(y) and equivalence of places D.plEq, mem_glued_lemma_10 proves
  (∀ native w, ∃d∉p_w, d y∈e(L_(D.plEq w))) ⇔ e^{-1}y∈S.RR.
This uses all places, not a sampled list or one denominator uniform in w. RRDef yields A.L=e(S.RR). No integral determinant unit requirement. The upstream integral_iff_matrix_indefinite_side remains a named deeper dependency.

## 3. Hermitian metric compatibility
For v≠v0, use Z.met/Z.met0. At v0 sharp uses MetSharp.majAt_rows_fixed, base MetBase.metric_base_fixed. PrincipalLevelLattice.majorant_at_base_place_eq_inner gives coordinate majorant nP_b^{-1} times the Hilbert pairing of iC at μ0, with source conjugation convention; needs H2 and nP_b>0. Native norm matches jEE/jEE0 at the designated embedding. Read tie transports to the Petersson pairing with measure nP_b^{-1}ν0. HE model is injective, with original inner product. Sharp norm_sq_rows separates zero and nonzero z; nonzero forces an IsMultIP witness since ipM defaults to zero if none exists. ipM_smul_measure_self uses IntegrableOn and integral_smul_measure, then uniqueness of Petersson coefficient using nonzero vectors in all tensor factors. Base uses ipM_smul_of_vec with nonzero evaluation witness, or separately the zero vector. Consequently both diagonal forms agree. Conjugation of inner_self leaves it unchanged. Exact normalization is inverse nP, not nP or its square.

For base polarization put D(x,y)=H_native(e x,e y)−H_coord(x,y), conjugate-linear in first slot and linear in second via σ=v.embedding. From D(x,x)=0 for every K-vector:
  D(x,y)+D(y,x)=0.
Choose a∈K with σ(a)≠conj σ(a) via exists_nonreal, IsComplex, ptField_main/IsTotallyComplex. Expand for x+a y:
  σ(a)D(x,y)+conjσ(a)D(y,x)=0.
Subtract conjσ(a) times first equation, so (σ(a)−conjσ(a))D(x,y)=0 and D(x,y)=0. This works over K without assuming K=C. Sharp uses majAt_eq_of_normAt after matching norms. Real embedding alone insufficient: distinct positive Hermitian matrices 2I and [[2,i],[-i,2]] agree on diagonal evaluations of real vectors but not cross terms. Combine both integral and metric fields to obtain the two HLatTie values consumed by divTied3_read.

## 4. Index producer boundary
DataIdx.lean defines IjIdx=lidx(p_w,X.MjH(j).L,thTj X μ j), jwIdx=lidx(p_w,TjL,TjDual). IdxDefs requires BOTH equalities for EVERY μ,j,w with 1≤j≤D.R.m. IdxDefsUp.idxDefs_up transfers IdxDefs(w.D Z,divBack Y) to IdxDefs(w.D(SRe.upL Z S' N h),Y) via with_unfolding_all for both fields. divBack retains DivX and retypes md. Not an initial existence theorem. numTie_of_read consumes JM.eW i with hM.j_eq i and (hM.hlat i).lat on the same i and eW; a separate equivalence is insufficient. Initial MjHTie and IdxDefs producers not located; leave them open.

## 5. Source/test certificate
12 pinned source files, 83 returned-blob-format and exact anchor presence assertions executed in connector V8 (not independent hashing or elaboration). Replay with git hash-object at pin and verify named anchors. Paths abbreviated P=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, F=src/Formalism/. Ledger:
- P/DivisionCompatibleAtReadIdentifications.lean: b6594122a28670a9dca1e61b23f5be9594f7f877; divTied3_read, intro hMj hIdx hBu hBt, sharpRR, baseRR.
- P/RowLatticesMetricsAgreeOfRealGroupTheoremsStatement.lean: 25b73b84f494bb924a2d69e481a86b2f1afb9f20; rowLat_ties.
- P/RowLatticesMetricsAgreeOfRealGroupTheorems.lean: 46a94b1eb789adc8ad9ab35bcef9fa2be5af4e37; rowLat_ties, hH.ok.ok2, Y.muAt, Z.rr/Z.rr0, Y.stable/Y.stable0, Z.met/Z.met0.
- F/LocalToGlobal/Divisibility/RowSideTie.lean: 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa; HLatTie lat metric.
- P/IndefiniteSideRowLatticeAdoptedStatement.lean: 9c0c9174fb263ba16b799406271e91c92a7329ac; Adopt.indefinite_side_row_lattice_adopted.
- P/IndefiniteSideRowLatticeAdopted.lean: 0761b2c0d2e71f2c9bf88933f3b131d3d28d43d6; iota_starProjection_Qsp, RRset_eq_iota_image, span_le_lemma_8, le_span_lemma_9, span_ratPoints_eq_matLat, mem_glued_lemma_10, rrDef_iff_glued, exists_finset_sum_of_mem_V0_Mtilde.
- P/MajAtSmulRightOf.lean: a35700275601f7bffcdc5f4f6651d86f410ebe1c; majAt_eq_of_diag, exists_nonreal, metric_base_fixed.
- P/IpMSmulMeasureSelf.lean: 64f98203a57cbef83e131f3c3ce9bc69b8033634; ipM_smul_measure_self, norm_sq_rows, majAt_rows_fixed.
- F/LocalToGlobal/IndefiniteReal/PrincipalLevelLattice.lean: ea4e713700a8fb33ac97ea566d26ee41dbb60054; majorant_at_base_place_eq_inner.
- F/LocalRingCardinality/DataIdx.lean: 3c508b4f1d3efa3e1f8b5c5d76998dfbd7f41795; IdxDefs, Ij_def, jw_def, IjIdx, jwIdx.
- P/IdxDefsUp.lean: 661e022794a6f4b74d105a589e695a314df16879; divBack, idxDefs_up.
- P/NumbersEqConcreteNumbersAtBaseLevel.lean: 9cf0934c44661d941505ed28f7cb6db637c340a9; numTie_of_read, JM.eW, hM.j_eq, hM.hlat, hI.Ij_def, hI.jw_def.

Executed exact finite explanatory regressions in V8: polarization=4100625, glue=76800, witness=47488, negative=3. These are not native automorphic computations or Lean checks. Reproduce below with Node (counts per loop case, each may contain multiple assertions). First save attempt timed out after tests; subsequent retrieval 404. This is the compact retry artifact.

```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, S=[-2,-1,0,1,2];
 const add=(a,b)=>[a[0]+b[0],a[1]+b[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],conj=a=>[a[0],-a[1]], sub=(a,b)=>add(a,[-b[0],-b[1]]), eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],i=[0,1];
 const av=(x,y)=>x.map((v,j)=>add(v,y[j]));
 const vals=[-1,0,1];const V=[];for(const a of vals)for(const b of vals)for(const c of vals)for(const d of vals)V.push([[a,b],[c,d]]);
 let polarization=0,glue=0,witness=0,negative=0;
 for(const a of S)for(const b of S)for(const c of S)for(const d of S){
  const H=[[[a,0],[c,d]],[[c,-d],[b,0]]];
  const B=(x,y)=>{let z=[0,0];for(let j=0;j<2;j++)for(let k=0;k<2;k++)z=add(z,mul(conj(x[j]),mul(H[j][k],y[k])));return z};
  const Q=x=>B(x,x);
  for(const x of V)for(const y of V){
   const z=B(x,y),u=B(y,x),iy=y.map(v=>mul(i,v));
   const A=sub(sub(Q(av(x,y)),Q(x)),Q(y));
   const C=sub(sub(Q(av(x,iy)),Q(x)),Q(iy));
   ck(eq(A,add(z,u))&&eq(C,sub(mul(i,z),mul(i,u))),"expansion");
   ck(eq(A,[2*z[0],0])&&eq(C,[-2*z[1],0]),"reconstruction");polarization++;
  }
 }
 const gcd=(a,b)=>{a=Math.abs(a);b=Math.abs(b);while(b){let t=a%b;a=b;b=t}return a};
 const red=(n,d)=>{let g=gcd(n,d);return [n/g,d/g]};
 const local=(n,d,m,p)=>{let [u,v]=red(n,d*m);return [v%p!==0,v,u]};
 for(let a=0;a<=3;a++)for(let b=0;b<=3;b++)for(let n=-12;n<=12;n++)for(let d=1;d<=12;d++)for(let r=1;r<=4;r++)for(let s=1;s<=4;s++){
  const m2=2**a,m3=3**b,l2=local(n,d,m2,2),l3=local(n,d,m3,3);
  const k2=local(n*r*s,d*s*r,m2,2),k3=local(n*r*s,d*s*r,m3,3);
  ck(l2[0]===k2[0]&&l3[0]===k3[0],"local transport");
  ck((l2[0]&&l3[0])===(k2[0]&&k3[0]),"intersection");
  if(l2[0]){ck((l2[1]*n)%(d*m2)===0&&l2[1]%2!==0,"2 witness");witness++}
  if(l3[0]){ck((l3[1]*n)%(d*m3)===0&&l3[1]%3!==0,"3 witness");witness++}
  glue++;
 }
 for(const x of V.filter(x=>x.every(z=>z[1]===0))){ck(mul(conj(x[0]),mul(i,x[1]))[0]===0,"real-field example")}
 ck(!eq([0,0],i),"distinct cross pair");negative++;
 ck(local(1,3,1,2)[0]&&!local(1,3,1,3)[0],"omitted prime");negative++;
 ck(1%2!==0,"wrong lattice substitution");negative++;
 return {polarization,glue,witness,negative};
}
console.log(regress())
```

RESUME HERE: obtain the pinned reverse-import index from dependency/kernel/acceleration lane for DivisionCompatibleAtReadIdentificationsStatement; locate its actual caller and initial MjHIds.eW, MjHTie.j_eq/hlat and IdxDefs producers (not idxDefs_up). If unavailable, trace RowSideFamily/BaseDivisionAmbientCompatibilityFamily actual definitions and caller imports. Keep integral_iff_matrix_indefinite_side as a separate deeper dependency. HANDOFF TO integration, editor, audit, theta, Galois and dependencies. Project OPEN; no physics queue changes.
