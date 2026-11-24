# RUN10 — Exact level index and five Pins consequences
2026-11-24. SOURCE-MATCHED human derivation with finite explanatory regression; not Lean replay. Main reachability still requires authenticated elaborated evidence.

## Selection and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity/research state/log/protocol, physical CI checkpoint #380 (not RH), RUN9 and relevant RUN1/2/6/8, recent handoffs in kernel, acceleration, theta, Galois, prime, Landau, literature, geometry, editor, dependency, structure, math and integration. Audit directory has scripts but no recent markdown handoff. Blueprint not reread this run. No duplication of previous lattice identities or row-to-window argument. Local git DNS failed and Lean executable absent. GitHub code search gave zero results for divisionCompatible_at_readIdentifications, divTied3_read, MjHIds (not proof of no callers). The authenticated targeted-role job status reports exit 1 after source-anchor mismatch (LFunction_modOne_eq) and projection child failure; only six different anchors projected, not our roots. The earlier stream-closure job likewise reports exit 1 (byte/hash mismatch). RC1 isolated job passes on synthetic cycle fixture, not RH. Do not repeat those jobs. ReadL definition located, not its initial producer. Choose a distinct bounded direct dependency of divTied3_read that has not been translated in RUN1–9: pins_card_index_ranks. This supplies the group-index input of the DivDef3 branch, not the outstanding MjHTie or IdxDefs existence claims.

## 1. Exact theorem and quantifiers
Pinned source leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.Mem.R3.pins_card_index_ranks: for every D:D7, finite group G, types Pl0,I0,T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, assume Pins R F cG. Then ALL five equations hold:
1. Fintype.card G = D.what₂.restRowsFiniteGroupCard.
2. Nat.card F.P0 = Nat.card F.P1 * (D.host.g 0 * D.host.g 1)^(D.R.k * D.R.f).
3. A3.A.r = D.R.r.
4. A3.A.t = D.R.t.
5. A3.A.v0 = InfinitePlace.mk D.what₂.embLL.
The theorem does not require Holds, ReadL, MjHTie or IdxDefs. It uses two fields of Pins: h.char.base.fam.tie (gramR,c0R,c0L,hT) and h.keep.psi (Pg,pl,res,ψ,eC,hL,another field). Retain the complete Pins premise, including phs and trSem, and all Keep/WeakCharacterisation fields. Do not infer Pins itself from these five consequences.

## 2. Count the level subgroups without enumeration
GlobalTheory.Mem.GrpCount.card_unitri: for a commutative ring κ, rank r, relation Fr on Fin r × Fin r with Fr(i,j) implying i<j, and an EXISTING subgroup H of GL_r(κ), assume exact membership characterization: all entries below the diagonal zero, every diagonal entry 1, every upper entry outside Fr zero. Let S={(i,j):Fr(i,j)}. Define f:S→κ ↦ M_f with diagonal 1, free entries f, all others 0. Since upper triangular and unit diagonal, det M_f=1, so it is invertible even over a commutative ring. Membership follows by the reverse implication of hH. Reading free entries in an H-element is the inverse map, by the forward implication of hH and entrywise equality. Thus Nat.card H = (Nat.card κ)^(Nat.card S), via Nat.card_congr and Nat.card_fun. Lean states Nat.card without a Fintype κ premise; for the actual finite residue fields this is ordinary finite cardinality. No claim that arbitrary Fr defines a subgroup: hH is required, e.g. allowing only entries (0,1),(1,2) but not (0,2) is not closed under multiplication.

card_unip uses all i<j, hence N=r(r−1)/2 free entries. card_unipCol(a,c) excludes the entries (i,c) with a≤i<c. card_pairs_split assumes a≤c<r: excluded entries are bijective with Fin(c−a), via i↦i−a, inverse j↦(a+j,c). Partition upper positions into excluded and retained, so N=N_retained+(c−a), including a=c. For any finite residue field with q elements, ordinary upper unipotent group has q^N elements, the prescribed column subgroup has q^(N−(c−a)) elements. This is cardinality, not a claimed group isomorphism to an additive group or normal quotient. card_pi gives the cardinality of a finite product of subgroups via the subtype equivalence.

## 3. Apply the exact level tie
GlobalTheory.Mem.GrpCount.index_of_lvlTie: universally quantified D, group G, subgroups Q0,Qs and characters ψ0,ψs, eG:G≃*G0g D.nd, Pg finite place set, pl:(Σ k:Fin 2,D.nd.PlG k)≃Pg, residue-ring equivalences res(kv):kP(pl kv)≃+*ZMod(D.host.g kv.1), ψ local additive-character family, eC:G≃*G0 Pg D.R.r. Assume h:LvlTie D Q0 ψ0 Qs ψs eG Pg pl res ψ eC. Then Nat.card Q0 = Nat.card Qs * (g0*g1)^(k*f), where k=D.R.k, f=D.R.f, g_i=D.host.g i.

Set r=D.R.r, a=D.R.rS, c=a+k. Original Ranks.rS, Ranks.r, D.R.two_le_m imply c<r. symPos_injective for a+k≤r supplies injectivity of the native index map; finite self-injection is a bijection σ. It is used to reindex both rows and columns of each local matrix, not just one index. h.p0 identifies Q0 through eC with the native P0 product of unip subgroups. h.ps identifies Qs through eC followed by σ reindexing with PsharpSym product of unipCol subgroups. Both directions of h.ps are needed; the existential y is forced by entrywise equality. These are equivalences of subtypes for cardinality.

For each place PP∈Pg write q_PP=Nat.card(kP PP). The two cardinalities are products of q_PP^N and q_PP^(N−k), respectively. By card_pairs_split and pow_add:
  |Q0| = |Qs| * product_PP q_PP^k.
The bijection pl reindexes the last product. The ring equivalences res give q_PP=g_i by Nat.card_zmod, and D.nd.card_PlG gives f places for EACH i=0,1. Thus product_PP q_PP^k = (g0*g1)^(k*f). No division by a potentially zero cardinality, no inequality or limiting step, no assumption about ordinary integer primality beyond the original arithmetic data. The two families of places, exact reindexing and same k are essential.

## 4. Remaining four Pins equations and downstream guard
For total group cardinality use the composite equivalence R.eG.trans cG; rewrite with D.nd.restN_card_levelGroup_eq, Nat.card_pi, Fintype.prod_sigma and D.nd.card_PlG. In the target, the repeated GL(Fin r,ZMod(g_i)) cardinality is taken f times for each of two i. No independent GL-order formula is needed by this proof. The rank equations and distinguished infinite-place equality are projections hT.ranks.2.1, hT.ranks.2.2, hT.v0. The underlying proofs of hT and hL are not supplied by this lemma.

GlobalTheory.divTied3_read obtains ⟨hcard,hidx,hr,ht,hv0⟩ from this theorem; the first two arguments discharge the exact guard hGrp : card equality → level-index equality → GrpTie. The original hGrp is an additional hypothesis, not a result of counting. hr,ht fill ranks with rfl; hv0 fills the appropriate tup field with Y.tup0,Y.muAt and injectivity from Y.tupT_tup. This completes the group/cardinality/rank/infinite-place *adapter*, not full DivDef3: sharp,base,mt,th,cols are still the original inputs/producers. DivRows3 remains a separate implication requiring MjHTie, IdxDefs, D.BuRational and CxData.BtVanish.

ReadL definition (StableIffCarrierEq lines 200–217) is a dependent data record with two linear equivalences eRR/eRR0; jEE/jEE0 for all coordinates; met/met0 for every infinite place other than A3.A.v0 and all coordinate pairs; rr/rr0; jW for every i:Fin m; jW_read for all i,y; etaJ for all i,w with a twisted-place membership branch. This is NOT an existence theorem. Its initial producer is still unlocated.

## 5. Source manifest / actual static checks
Paths under src/; P=Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, D=Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/.
- P/PinsCardIndexRanks.lean blob 04985046149dee04230630862a68aa6cc8b9fa29, lines 14–225, declarations card_unitri, card_unip, card_unipCol, card_pairs_split, card_pi, symPos_injective, index_of_lvlTie, pins_card_index_ranks.
- P/DivisionCompatibleAtReadIdentifications.lean blob b6594122a28670a9dca1e61b23f5be9594f7f877, GlobalTheory.divTied3_read, hGrp hcard hidx.
- P/DivisionCompatibleAtReadIdentificationsStatement.lean blob 177af5c6db7dba139da090fad705db744787566c, GlobalTheory.T.divisionCompatible_at_readIdentifications delegates to GlobalTheory.divTied3_read.
- D/StableIffCarrierEq.lean blob fb830f947211844fc7ac84cf567912d29cf09601, lines 63–91 Keep/Pins/Holds, 200–217 ReadL.

Executed 50 connector V8 source assertions (4 returned SHA equalities, 46 substring anchors). Reproduce via git rev-parse PIN:src/PATH and git show PIN:src/PATH, check declaration/anchors above. Anchor inventory for exact replay by source order:
1. theorem card_unitri; hFr : ∀ i j, Fr i j → i < j; hH : ∀ g : GL; Matrix.det_of_upperTriangular; Matrix.nonsingInvUnit; Nat.card_congr e, Nat.card_fun; theorem card_unip; theorem card_unipCol; theorem card_pairs_split; (hac : a ≤ c) (hc : c < r); p.1.1.val - a; theorem card_pi; theorem symPos_injective; theorem index_of_lvlTie; D.R.two_le_m; h.p0 g; h.ps g; card_pairs_split; Nat.card_zmod; D.nd.card_PlG; pow_add; theorem pins_card_index_ranks; h.char.base.fam.tie; h.keep.psi; hT.ranks.2.1; hT.ranks.2.2; hT.v0.
2. theorem GlobalTheory.divTied3_read; pins_card_index_ranks; grp := hGrp hcard hidx; ranks := ⟨rfl, hr, ht⟩; Y.muAt, hv0; MjHTie; IdxDefs; intro hMj hIdx hBu hBt.
3. theorem _root_.GlobalTheory.T.divisionCompatible_at_readIdentifications; exact @GlobalTheory.divTied3_read.
4. structure Keep; psi : PsiPPTie; structure Pins; char : R.WeakCharacterisation F; keep : Keep; structure Holds; structure ReadL; jW_read; etaJ.

Observed /branches/main and /commits/main both 1da818b50f1e18808db2792b9dc735bda8cb84d8, merge #1198 at 2026-11-24 15:42:48 UTC. Different from RUN9's previously observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780; no claim about ordering/ancestry without compare. At observed head: PinsCardIndexRanks blob 3a1cd7ccbb58b0239eba43247323eafe4af2da05 (27/27 anchors), StableIffCarrierEq eb4f88177f5c4e9ad7258036b507f423453d26b5 (9/9). Old DivisionCompatibleAtReadIdentifications path 404, wrapper file e34a9fe4644fa2038729074eea6d86bc557fc70a contains relocated theorem GlobalTheory.divTied3_read at line 176, pins_card_index_ranks at 178 and grp := hGrp hcard hidx at 184; exact wrapper name not located at this file. No equivalence assertion for new revision.

## 6. Reproducible finite regression
Actually executed in connector V8: matrices=16594, columnCases=165173, partitionCases=60, productCases=5400, neg=3. Models are finite integer arrays over Z/qZ with q=2,3,5, not native automorphic data. Tests illustrate the counting identity and preserve the bounds; source proof above is the general reason. No runtime benchmark or kernel proof. Copy to Node and run:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)}; let matrices=0,columnCases=0,partitionCases=0,productCases=0,neg=0;
 for(let r=0;r<=4;r++)for(const q of [2,3,5]){
  const pairs=[];for(let i=0;i<r;i++)for(let j=i+1;j<r;j++)pairs.push([i,j]);
  const cuts=[];for(let c=0;c<r;c++)for(let a=0;a<=c;a++){let blocked=pairs.map(([i,j])=>a<=i&&i<c&&j===c);ck(blocked.filter(Boolean).length===c-a,"partition");partitionCases++;cuts.push({a,c,blocked,count:0})}
  for(let n=0;n<q**pairs.length;n++){
   let x=n,M=Array.from({length:r},(_,i)=>Array.from({length:r},(_,j)=>+(i===j)));
   for(const [i,j] of pairs){M[i][j]=x%q;x=Math.floor(x/q)}
   let back=0;for(let s=pairs.length-1;s>=0;s--){let [i,j]=pairs[s];back=back*q+M[i][j]}
   ck(back===n&&M.every((row,i)=>row.every((v,j)=>j<i?v===0:j===i?v===1:true)),"unitri bijection");matrices++;
   for(const cut of cuts){let ok=pairs.every(([i,j],s)=>!cut.blocked[s]||M[i][j]===0);if(ok)cut.count++;columnCases++}
  }
  for(const cut of cuts)ck(cut.count===q**(pairs.length-(cut.c-cut.a)),"column count");
 }
 for(let r=1;r<=8;r++)for(let c=0;c<r;c++)for(let a=0;a<=c;a++)for(let f=0;f<=4;f++)for(const q0 of [2n,3n,5n])for(const q1 of [2n,3n,5n]){
  let N=BigInt(r*(r-1)/2),k=BigInt(c-a),F=BigInt(f);
  ck(q0**(N*F)*q1**(N*F)===q0**((N-k)*F)*q1**((N-k)*F)*(q0*q1)**(k*F),"product");productCases++
 }
 const A=[[1,1,0],[0,1,0],[0,0,1]],B=[[1,0,0],[0,1,1],[0,0,1]];
 ck(A[0].reduce((s,x,k)=>s+x*B[k][2],0)===1,"nonclosed support");neg++;
 ck([0,1,2].filter(i=>i<3&&[0,1,2].includes(3)).length!==3,"out of range cut");neg++;
 ck((!(true&&false)||false)&&!false,"guard not unconditional");neg++;
 return {matrices,columnCases,partitionCases,productCases,neg}
}
console.log(regress())
```
The third negative control is a Boolean guard illustration only. No original premise removed.

RESUME HERE: request authenticated reverse edges for GlobalTheory.divTied3_read and GlobalTheory.T.divisionCompatible_at_readIdentifications from dependency/kernel lane (current six-anchor projection failed; not available for our targets). Locate actual initial ReadL constructor using its full dependent record in StableIffCarrierEq and imports, then MjHIds/MjHTie/IdxDefs producer, not idxDefs_up. If no reverse index, trace h.keep.psi's PsiPPTie/LvlTie producer rather than repeating cardinality. HANDOFF TO integration, editor, audit, Galois, theta, dependency and kernel. Project OPEN. No physics queue edits.
