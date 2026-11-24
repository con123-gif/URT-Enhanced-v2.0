# RUN14 — Native level construction and tame residue descent
2026-11-24. SOURCE-MATCHED / DONE for conditional LevCh construction and immediate suppliers, not native Main reachability or kernel replay.
Continuity: read AGENTS, swarm protocol, handoff queue, expansion, research-state/log/protocol and continuity excerpts, CI checkpoint #393 PASS (not RH), RUN13 and recent notes of nine other specialist lanes, integration, math, structure and dependencies. Audit and acceleration/grok latest full notes and external blueprint not reread. No physics changes. RUN13 ended at exists_levCh; this is its actual proof, not another proof of uniform LevOf.

## Pinned sources
Repository leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Below B=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/.
- B/IsUnitaryOfOrderDvd.lean ac9fd804343227e4607117d441179d73f4942c3e, GlobalTheory.LevelChoices.mem_crdLat, coe_crdLat (L19–33), dualL_crdLat (34–51), isSDFrame_of_one (53–58), isUnitary_of_orderDvd (60–68), exists_levCh (70–113), exists_levCh_unit (115–122).
- src/Formalism/LocalToGlobal/IndefiniteReal/LinksDefs.lean 898ac55d7ecb1c1aa007bfd98e9dd0e4af10a6bc, IsSDFrame 208–209, ChrEq/IsRes 287–293, LevCh 388ff, LevCh.Is 444–465.
- B/ExistsCmAdeleUnitCharacterReadingHeckeCharStatement.lean 188af35efc5034d653aa95d76f89fc735ce15472, GlobalTheory.T.exists_cmAdeleUnitCharacter_reading_heckeChar.
- B/ExistsCmAdeleUnitCharacterReadingHeckeChar.lean 0786c38c2dd1a2ba1314c5e5cc18ff2cb05d9642, GlobalTheory.CharTransport.exists_chrEq 138–160.
- B/ExistsIsResOfTameAt.lean 62d47df9274cf64468e6731284166174c290f07f, GlobalTheory.TameResidue.locK_eq_of_congr 16–44, exists_lift 46–55, exists_res 57–71, GlobalTheory.exists_isRes_of_tameAt 75–77.
- B/ExistsSelfDualAdelicFrameLevelOneStatement.lean 669dce78b2584ddf5ee4630f465bb26acefcda13, GlobalTheory.T.exists_selfDual_adelic_frame_level_one.
- B/ExistsSelfDualAdelicFrameLevelOne.lean b12d4b957f5655dccb14f4e3d3dec2367e29fc51, GlobalTheory.AdelicFrame.exists_isSDFrame 197–211.
- B/ExistsLevOfAll.lean 05a79753fd361dd3c71c966f8c67c974ac4e0d74, caller exists_levOf_all (17–53).

## The exact existence claim
For every D:D7, C:CharFrame D, type T (not assumed finite here), reference μ0:T, characters ξ:T→HChar E, finite sets Q(t) of places of E, require:
1. ξ injective; ξ(μ0)=1.
2. For each t there exists a positive integer n (depending on t) with OrderDvd n; ξ(t) trivial on host.F; tame at every place.
3. Each Q(t) satisfies IsTwistPlaces D.host.g. For every P∈Q(t), the product QS*q*d*sp.T and separately every (D.mem u).A.T (u any word) lie outside P.
4. For every p in {pde,pde'}, there exists a prime 𝔭 of O_K such that for every t and P∈Q(t) lying above p, P.under(O_K)=𝔭. This is hde, not constructed inside exists_levCh. RUN13 caller splits membership into the two designated primes and invokes their respective primality and exists_under_of_selHalf. Witness may depend on p, not on t or P; if no occurrence the condition is vacuous. No assumption of distinctness of these primes introduced here.
5. For every t and P, not UnrAt iff P∈Q(t) or P is conjugate to a member of Q(t).
Then there exists L:LevCh D T with L.C=C, L.xiH=ξ, L.Q=Q, for every j L.ΛY(j)=crdLat(Yc D j)(Yc D j).L0, and L.Is μ0. All dependent host/space instances are retained. In particular this is not existence of admissible twist characters; ξ and all nine named hypotheses (hinj,hbase,hfin,htriv,htame,hpl,hoff,hde,hram) are inputs.

## Proof
A. If χ^n=1 for n>0, evaluate at every idele a: |χ(a)|^n=1, so |χ(a)|=1 by nonnegativity and positive exponent. Thus each ξ(t) unitary. The supplied base character frame already has unitary and tame facts. The reading wrapper calls actual exists_chrEq: choose continuous ring hom Θ with diagonal and local-idele compatibility (exists_hom, retained). Map units via Θ and compose χ, taking values in Circle by unitarity. Multiplicativity, continuity, triviality on diagonal units and finite-place readback follow from Θ's two compatibilities and χ's own conditions. Choose these readings for C.mu0(j), C.eta and each ξ(t). This is classical choice, not a computational algorithm.

B. Tame residue descent: let a,b be integral representatives of the same nonzero residue modulo P, k,l their field units. Since b∉P and a-b∈P, a∉P. Their P-adic valuations are 1 (multiplicative convention), and valuation(a-b)≤exp(-1). Hence k/l is a local unit with k/l-1 in the maximal ideal. Tameness gives χ.locK(P,k/l)=1, i.e. χ.locK(P,k)=χ.locK(P,l). Every residue unit has an integral lift by quotient surjectivity; it cannot be in P, hence nonzero and defines an E-unit. Choose one lift f(u). Define c(u)=χ.locK(P,f(u)). Independence of lift just proved; to show multiplicativity compare the lift of uv with the product of the lifts of u,v, which has the same residue. This supplies IsRes (with all representative quantifiers), not a statement that χ is trivial on every local unit. Choose r(j,P) for frame characters and s(t,P) for ξ. The stored L.chi is r inverse, because the Is field tests its inverse; inv_inv restores r. L.xiR=s.

C. Coordinate lattice: write e=crd V, Λ=e(V.L0). Membership is equivalent to e⁻¹x∈V.L0. The original pairing identity hT_crd and baseLattice_isUnimodular give Λ^#=Λ by testing integrality against all y and substituting e(y); both directions proved. Λ equals L0c by definition and basis reconstruction. The frame wrapper calls exists_isSDFrame: identify Λ with latC V, obtain finite generation and full E-span from standardTuple_isLattice, then choose β using exists_isFrame (body remains open). With exponent 0, use dual equality, 1>0 and the L0c equality in both inclusion fields of IsBaseFrame. Definition IsSDFrame(V,β,Λ,N) = ∃c, IsBaseFrame(V,β,Λ,N^c). Level-one witness means IsBaseFrame(...,1); pick c=0 for ANY N, even zero in the Lean natural power convention. No claim that the same β works with a prescribed strictly positive exponent. This supplies the Y-frame condition at g0*g1 without modifying β or Λ; X,V,W at level one directly.

D. Assemble L. mu0(j) is the chosen reading indexed by natural truncated j−1 when j−1<m, otherwise 1; only j=i+1 with i∈Fin m is tested. chi has same indexing with inverse r, otherwise 1. Do not assert the fallback at j=0 (Nat subtraction saturates; when m>0 j=0 reads index 0). Pg is finite union of aboveF(C.P.pb k) over k; membership is exactly ∃k, Div k P. Copy C, ξ, Q, assign the four coordinate lattices and their selected β's. Field checks of Is: mu0,eta,xi from readings; xi_inj/base/fin/triv/tame from input; Pg by finite-union definition; Q_pl/off/de/ram directly from hpl/hoff/hde/hram (host.condN definitional conversion); chi and xiR from residue readings; βY/X/V/W from C. All 19 fields covered; the four returned equalities are definitional. The proof is direct choice and assembly, no induction on T. Unit special case uses T=Unit, ξ=1 and Q=empty, n=1, trivial/tame identity; Q_pl/off/de vacuous with C.P.pb 0 as witness for either designated prime, and identity unramified proves ramification equivalence. This does not establish the nontrivial-twist premises without upstream arithmetic.

## Execution and dependency status
Connector V8: 89 successful assertions (8 blob hashes, literal source anchors and current comparison). Six complete theorem texts match after trim at current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same head as RUN13): mem_crdLat, coe_crdLat, dualL_crdLat, isSDFrame_of_one, exists_levCh, exists_levCh_unit. Current blob 6a263123fd8396edb7e81e5bbd638452858de0cf clumps the self-dual frame statement wrapper and replaces local isUnitary_of_orderDvd with alias Formalism.L2.Host.HChar.isUnitary_of_order. No claim all upstream sources unchanged or alias kernel-equivalence.
The named wrapper edges above are source references, not elaborated dependency export. Native Main reachability, Θ construction, exists_isFrame, hT_crd, host frame properties and original character input suppliers remain open. No hypotheses removed. Exact finite regressions (below) executed in V8: quotient 38636, mul 3016, level 279, indices 528, neg 3. Finite rings/exponent models test the algebra only, not native adelic existence. No Lean run or speed benchmark.

Reproduce the finite regressions in Node (same code as executed):
```js
function regress(){
 const A=(v,m)=>{if(!v)throw Error(m)};
 let quotient=0,mul=0,level=0,indices=0,neg=0;
 for(const p of [3,5,7,11,13]){
  const log=new Map();for(let g=2;g<p;g++){log.clear();let x=1;for(let i=0;i<p-1;i++){log.set(x,i);x=x*g%p}if(log.size===p-1)break}
  A(log.size===p-1,"primitive root");
  const units=Array.from({length:p*p},(_,i)=>i).filter(i=>i%p!==0);
  for(let k=0;k<p-1;k++){
   const chi=x=>k*log.get(x%p)%(p-1);
   for(const a of units)for(let t=0;t<p;t++){const b=(a+t*p)%(p*p);A(chi(a)===chi(b),"descent");quotient++}
   for(let a=1;a<p;a++)for(let b=1;b<p;b++){A(chi(a*b)===(chi(a)+chi(b))%(p-1),"hom");mul++}
  }
 }
 for(let N=0;N<=30;N++)for(let c=0;c<=8;c++){A(1n**BigInt(c)===BigInt(N)**0n,"level one");level++}
 for(let m=1;m<=32;m++)for(let j=0;j<m;j++){A(Math.max(j+1-1,0)===j&&j<m,"index");indices++}
 A(4%3===1&&2%6!==0,"non-tame control");neg++;
 A(2n**1n!==1n,"fixed positive exponent invalid");neg++;
 A(2n**0n===1n&&2n!==1n,"zero order not unitary");neg++;
 return {quotient,mul,level,indices,neg}
}
console.log(regress())
```
For source checks use git rev-parse P:path against the eight hashes above and git show P:path for all named declaration bodies, then compare six theorem blocks to H:path. This manual reproduction recipe is not a claim of executed local git. The finite tests do not prove native hypotheses.

RESUME HERE: expand GlobalTheory.AdelicFrame.exists_isFrame in pinned ExistsSelfDualAdelicFrameLevelOne, prove the local-basis to restricted adelic frame construction, preserving finite support and full-span/FG hypotheses; then Θ exists_hom in CharTransport. Request role-labelled native edges for exists_levCh, exists_levCh_unit, exists_chrEq, exists_res, locK_eq_of_congr, exists_isSDFrame and exists_isFrame; retain initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf and Keep/Pins suppliers. HANDOFF TO kernel, dependency, integration, editor, theta, Galois, audit. Project OPEN.
