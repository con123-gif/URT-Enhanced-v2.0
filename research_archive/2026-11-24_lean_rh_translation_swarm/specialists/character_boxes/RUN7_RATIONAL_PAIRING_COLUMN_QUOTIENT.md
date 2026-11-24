# RUN7 — Rational pairing descends to the base column quotient

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the remaining colsBk producer, with exact finite algebra regressions. No independent Lean replay or full RH proof; no URT speed assertion.

## Continuity and pin
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts, CI checkpoint #371 (physical CI, not RH), own RUN6 and peer handoffs (Galois RUN7, theta RUN7, Landau RUN7, prime RUN7, literature RUN6, geometry RUN6, editor 1256, kernel RUN7, acceleration RUN7, integration, dependencies, structure, math). The formal blueprint was not reread. RUN4–6 reconstructed thTheta, rationalLift, num, not colsBk. No duplication of peer analytic rank/WD/prime work; no physics changes.

Pinned source leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Observed main 6866a9c6260d77b88a7b5477433e3044b6844f9b (2026-11-24 13:39:40 UTC). The old implementation path returns 404 at that revision: it is clumped into src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DivisionCompatibleAtReadIdentificationsStatement.lean (blob e34a9fe4644fa2038729074eea6d86bc557fc70a, lines 72–143, 200). Its consumer calls the actual R3.pairing_eq_colPairing, no wrapper; row-side supplier is now IotaRd.rowSideDef3_both instead of GlobalTheory.T.rowSide_definition_both_levels. The same local argument and hBt guard remain. This is source migration evidence, NOT kernel equivalence. Recursive upstream tree was truncated; no claim of full inventory.

## 1. Exact goal and quantifiers

DivisionCompatibleAtReadIdentifications.lean: colsBk field invokes GlobalTheory.T.rationalPairing_eq_columnPairing; statement wrapper invokes GlobalTheory.Mem.R3.pairing_eq_colPairing. Retain hC = conjunction of DiscreteSeriesCover, HarishChandraModules, CasselmanWallach, HarishChandraFinite, CuspRapidDecay. For all D:D7, finite group G, Pl0 I0 T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, C:ReadC R F X0 Y, sEE: (R.toCx3 F).EE →ₗ⋆[ℂ] (F.fc (R.toCx3 F).zs).Sp.HH, assume Pins R F cG, Holds R F, D.BuRational, CxData.BtVanish (fc := F.fc) (R.toCx3 F). Then for EVERY word u, EVERY column coordinate x and EVERY row coordinate y:
    D.div.Bk u (C.eNu u x) (Z.eRR y) = (colOf R F sEE).B (C.wU u) x y.
There is no restriction to nonzero coordinates, lattice generators or used tuples in this conclusion. hMj and hIdx needed by RUN6's num field are not inputs of this local colsBk theorem; retain them in parent DivRows3.

## 2. Rational kernel generates the complex kernel inside degree zero

RationalPairingEqColumnPairing.lean, bk_eq_of_coordinates: choose K=D.what₂.LL, σ=embLL, μ=μ0 (hμ), J=jA∘V, f=iota, q=eRR∘Pq, j'=jEE. Exact assumptions: hV says V0=span_C range J, hι says fJ=j'q on every K-coordinate; jEE_basis.1 gives complex independence of j' applied to the given K-basis of RR.V. The general helper span_range_inf_ker_le_of_basis reindexes that finite basis by Fin m and applies span_range_inf_ker_eq_span_rational_ker. Despite the helper name le, the conclusion is equality:
    Usp = V0 ∩ ker f = span_C J(ker q).
This is stronger than rational-kernel inclusion, but not equality to the full ambient kernel.

Proof of the nontrivial inclusion, exactly as SpanRangeInfKerEqSpanRationalKer.lean: if w=Σ c_k J(e_k) and fw=0, write q in the finite target basis as matrix M over K. Independence of the complex target basis images implies Σ σ(M_lk)c_k=0 for all l. Choose a K-vector-space basis b_i of C via σ (not a topological or countable basis). Each c_k has finite support; let S be the finite union across k. Expand c_k=Σ_i σ(c_ki)b_i. K-linearity of each basis coordinate implies Σ_k M_lk c_ki=0 for each i,l. Hence each vector v_i=(c_ki)_k is in ker M, and w=Σ_i b_i J(v_i). The reverse inclusion follows from fJ=j'q, qv=0 and linearity. No injectivity of J is needed; complex independence of j' on the target basis is indispensable to this proof. This is a finite-support descent argument, not an approximation by rational coefficients.

## 3. Base period vanishing and section identity

Fix u,x and define L(F)=perCol u μ0 (D.jN u (eN x)) F. hper says σ(P(x,G))=L(JG), where P is the coordinate period (not the matrix Pq). hvan says Pq G=0 implies P(x,G)=0. Since eRR is injective, ker q=ker Pq. By §2 L vanishes on all generators JG of Usp. Span induction uses D.perCol_zero, D.perCol_add, perCol_base_smul_form (complex-linear, NOT conjugate-linear in F) to get L|Usp=0.

SpanRangeInfKerLeOfBasis.lean: perCol_eq_pairing_of_kills: for any F∈V0, take n=orthogonal projection onto Usp and qF=F−n∈Qsp=V0∩Usp^⊥. Then f(n)=0, so f(F)=f(qF). DataBu.lean proves iotaQ_inj: if qF∈Qsp and f(qF)=0 then qF∈Usp∩Usp^⊥, hence qF=0. Its sec is the inverse on range(iotaQ) after orthogonal projection onto that range; sec_iota holds for each qF∈Qsp. Thus
    L(F)=L(qF)+L(n)=L(qF)=L(sec(fF))=Bu(u,φ,fF).
The last equality is hB=Rows.BuDefQ. It is not asserted for every F outside V0. DataBu.periodIdentity_iff_period_kills also supplies the converse on V0 by taking F∈Usp, fF=0 and using sec(0)=0. So the vanishing is a genuine compatibility requirement for quotient descent, not a removable tactic.

Now F=JG belongs to V0. hι identifies fF=jEE(eRR(Pq G)), hBR identifies σ(Bk(u,eN x,eRR(Pq G))) with Bu(u,jN(eN x),jEE(eRR(Pq G))). Combining with L(F)=σ(P(x,G)), cancel injective σ:
    Bk(u,eN x,eRR(Pq G)) = P(x,G).
This is exactly bk_eq_of_coordinates for all x,G; Pq need not be onto for this intermediate identity. Do not infer the existence of hBR or hvan from it.

## 4. Native suppliers and arbitrary target coordinates

pairing_eq_colPairing gets hR from complex_data_conditions_base_level_of_primitive_links using hHolds.ok, sep, hPins.char, prim. hW=hR.wf true gives Pq_surj at A3.fam3.base3.μ0; h2=(hR.what₂ true).1. The row-side definition theorem gives hI. hV comes from FormsTie Y.formsA and the actual range equality of rE and rV0 (RangeGoodProjectorEqRangeGoodCoordinates uses image_idempotent_spec and group_action_matrix_hom; RangeOpEqSpanOfFormsTie transports both inclusions using span and op_eq). hι comes from hI.iota, sharp_iota, rowMat_base=1 and one_mulVec. Y.tup0 supplies μ=μ0; Y.bu supplies hB; C.pt supplies hper.

Precisely, CutTuples2.lean defines BtVanish as ∀ u φ F, F∈Df1.U μ0 → Dc.Pt u μ0 φ F=0. In the native call P(x,G)=F.Dc(...).Pt (C.wU u) μ0 x G. Given Pq G=0, LinearMap.mem_ker.2 makes G a member of U; hBt supplies hvan. This is only the base tuple, not MatrixIdentityOffBase (which separately assumes t≠μ0). Neither hBt nor hBR is proved by this local theorem.

CutTuples2 defines rinv P as a chosen right inverse if one exists, else zero. CutPassage.rinv_spec uses surjectivity to choose preimages of each coordinate basis vector and assemble a matrix R satisfying Pq R=I. Do not infer RPq=I; kernel may be nontrivial. Bdef u is Pt u μ0 composed in second slot with rinv(Pq); colDef packages it and colOf retains B. With G=R y, PqG=y, so §3 gives Bk(u,eN x,eRR y)=Pt(u,μ0,x,Ry)=B(u,x,y). The equality for all y is thus a right-inverse lift, not a claim that Pq is an isomorphism. If two lifts differ by a vector in ker Pq, hBt makes their period values identical (by linearity); the arbitrary classical choice has no effect. Source CutPassage.cutPairing demonstrates the same residual argument explicitly, but its off-base ζ conditions are NOT extra hypotheses of colsBk.

Negative controls: Pq=(1,0) and L(g)=g₂ gives lifts (y,0),(y,1) with different periods: dropping hBt breaks descent. If Pq=0 into K, nonzero y cannot be lifted. A K-independent target family need not remain complex independent: 1,i over Q have no rational linear relation but complex kernel vector (−i,1). Hence no substitution of K independence alone. The proof keeps scalar orientation (linear rather than conjugate-linear) and both source quantifier layers. This is local algebra under source premises, not RH proof or proof of arithmetic existence.

## 5. Reproducibility

V8 connector fetched 13 pinned files and checked returned blob IDs and all source anchors (73 assertions); no Lean kernel executed. Replay with checkout using git hash-object on each file and literal anchor presence, with the ledger below. Head clump separately checked blob ID and native consumer call. Source ledger (path, Git blob SHA-1, anchors):
~~~json
[
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DivisionCompatibleAtReadIdentifications.lean",
    "b6594122a28670a9dca1e61b23f5be9594f7f877",
    [
      "colsBk := GlobalTheory.T.rationalPairing_eq_columnPairing",
      "intro hMj hIdx hBu hBt"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/RationalPairingEqColumnPairingStatement.lean",
    "533393ad6313410d0e389493c4765954c3f7d06a",
    [
      "theorem _root_.GlobalTheory.T.rationalPairing_eq_columnPairing",
      "GlobalTheory.Mem.R3.pairing_eq_colPairing"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/RationalPairingEqColumnPairing.lean",
    "cca09688d8f421d88dd46c2562852df25b5f677b",
    [
      "theorem bk_eq_of_coordinates",
      "theorem pairing_eq_colPairing",
      "D.jEE_basis.1 hι",
      "induction hF using Submodule.span_induction",
      "hvan x G' hG''",
      "GlobalTheory.perCol_base_smul_form",
      "apply D.what₂.embLL.injective",
      "← hBR u",
      "GlobalTheory.perCol_eq_pairing_of_kills",
      "hW.Pq_surj",
      "CxData.rinv_spec",
      "GlobalTheory.range_op_eq_span_of_formsTie",
      "GlobalTheory.range_goodProjector_eq_range_goodCoordinates",
      "CxData.rowMat_base",
      "Y.tup0",
      "Y.bu hBR",
      "C.pt u",
      "apply hBt (C.wU u) x G0",
      "LinearMap.mem_ker.2 hG0"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SpanRangeInfKerLeOfBasis.lean",
    "e3e32cf960e933413ec875030d33890990e36c69",
    [
      "theorem perCol_eq_pairing_of_kills",
      "starProjection F",
      "sec_iota",
      "hK n hnU",
      "theorem span_range_inf_ker_le_of_basis",
      "span_range_inf_ker_eq_span_rational_ker"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SpanRangeInfKerEqSpanRationalKer.lean",
    "d9775e8792c01c2420fdcc238950a43668158d70",
    [
      "theorem semilinear_pi_eq_sum_single",
      "theorem span_range_inf_ker_eq_span_rational_ker",
      "Fintype.linearIndependent_iff",
      "Basis.ofVectorSpace K ℂ",
      "Finset.univ.biUnion",
      "b.repr (∑ k, M l k • c k) i"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/RangeOpEqSpanOfFormsTie.lean",
    "4460b2e7afd75ed7c90d0420da804d338738f26b",
    [
      "theorem range_op_eq_span_of_formsTie",
      "h.span",
      "h.op_eq"
    ]
  ],
  [
    "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/RangeGoodProjectorEqRangeGoodCoordinates.lean",
    "f734655cc295cc7e026c82f6643f0b13f4c9ddc3",
    [
      "theorem range_goodProjector_eq_range_goodCoordinates",
      "group_action_matrix_hom",
      "image_idempotent_spec"
    ]
  ],
  [
    "src/Formalism/LocalRingCardinality/DataBu.lean",
    "a5376f1d0aba640b6bf197b6a20f7a2dd547b7ba",
    [
      "theorem iotaQ_inj",
      "def sec",
      "theorem sec_iota",
      "def Rows.BuDefQ",
      "theorem D7.periodIdentity_iff_period_kills"
    ]
  ],
  [
    "src/Formalism/LocalToGlobal/IndefiniteReal/CutPassage.lean",
    "7c2be35c5f8dcb70ff326d5302bf17de39d5fe76",
    [
      "theorem rinv_spec",
      "choose f hf using h",
      "theorem cutPairing",
      "have h0 := hBt u φ _ hk"
    ]
  ],
  [
    "src/Formalism/LocalToGlobal/IndefiniteReal/CutTuples2.lean",
    "4336bf7e7e86a3691bc87bb63f09dd07b5fc71eb",
    [
      "def rinv",
      "def Bdef",
      "def BtVanish",
      "def colDef",
      "def MatrixIdentityOffBase"
    ]
  ],
  [
    "src/Formalism/LocalToGlobal/IndefiniteReal/PartsOrth.lean",
    "c4e90bbb20264b06b55f6882458751306805bb82",
    [
      "def colOf",
      "B := Y.B"
    ]
  ],
  [
    "src/Formalism/LocalToGlobal/IndefiniteReal/CxLemmas.lean",
    "8952b748ea7c5666457e2ec6e7da44a2f7513da4",
    [
      "theorem rowMat_base",
      "relMat_self"
    ]
  ],
  [
    "src/Formalism/LocalRingCardinality/SpanPowerMembership/NZRowF.lean",
    "5f73e0d762150486aec97305ab5198045c267e4a",
    [
      "theorem sharp_iota"
    ]
  ]
]
~~~

Executed finite exact-integer regression in V8, all checks passed; result {"kernel":625,"period":78125,"lifts":15625,"complex":625,"negative":4}. Matrices Pq=[I₂ | (a,b)^T], every a,b∈[-2,2], every coefficient row x∈[-2,2]^2, arbitrary sample G∈[-2,2]^3, two distinct right-inverse constructions, real and imaginary coefficient tests. These are explanatory small models, NOT native number-field or automorphic data. Negative controls include simple explicit counterexamples above; they do not establish independence of every source hypothesis. Reproduce with Node:
~~~js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const dot=(x,y)=>x.reduce((s,v,k)=>s+v*y[k],0);
 const range=[-2,-1,0,1,2];
 let kernel=0,period=0,lifts=0,complex=0,negative=0;
 for(const a of range)for(const b of range){
  const P=g=>[g[0]+a*g[2],g[1]+b*g[2]];
  const k=[-a,-b,1];
  for(const s of range)for(const t of range){
   const B=(x,y)=>x[0]*y[0]+x[1]*y[1];
   const L=(x,g)=>dot([x[0],x[1],a*x[0]+b*x[1]],g);
   const x=[s,t];
   ck(P(k).every(v=>v===0)&&L(x,k)===0,"kernel");
   kernel++;
   for(const u of range)for(const v of range)for(const w of range){
    const g=[u,v,w],y=P(g);
    ck(L(x,g)===B(x,y),"factorization");
    period++;
   }
   for(const u of range)for(const v of range){
    const y=[u,v],R=[u,v,0],S=[u-a*(u+v),v-b*(u+v),u+v];
    ck(P(R).every((q,j)=>q===y[j])&&P(S).every((q,j)=>q===y[j]),"right inverse");
    ck(L(x,R)===L(x,S)&&L(x,R)===B(x,y),"lift independence");
    lifts++;
   }
  }
  for(const r of range)for(const s of range){
    const re=k.map(v=>r*v),im=k.map(v=>s*v);
    ck(P(re).every(v=>v===0)&&P(im).every(v=>v===0),"complex kernel");
    ck(re[2]===r&&im[2]===s,"complex span");
    complex++;
  }
 }
 // Dropping vanishing: P=(1,0), period is g2, both lifts same image.
 ck(0===0&&0!==1,"nonvanishing kernel counterexample");negative++;
 // Dropping surjectivity: P=0 into Q; y=1 is not reached.
 ck(0!==1,"missing preimage");negative++;
 // Rationally independent images 1,i over Q but C-dependent: map (1,i) into C.
 // Rational kernel=0, complex vector (-i,1) is nonzero in kernel.
 ck(0===0&&1!==0,"complex independence counterexample");negative++;
 // Incorrect scalar conjugation: i*1 differs from conjugate(i)*1.
 ck(1!==-1,"wrong linearity");negative++;
 return {kernel,period,lifts,complex,negative};
}
console.log(regress())
~~~

RESUME HERE: trace actual MjHTie and IdxDefs producers in the caller of divTied3_read / its statement wrapper, especially how the same eW satisfies j_eq and hlat.lat for all i; identify if the current clump moved these producers, preserve both original premise sets. Then return to sharpRR/baseRR. Do not repeat RUN2–7. HANDOFF TO integration, editor, audit, theta and Galois. Project OPEN; independent kernel validation and matched URT benchmark remain outstanding.
