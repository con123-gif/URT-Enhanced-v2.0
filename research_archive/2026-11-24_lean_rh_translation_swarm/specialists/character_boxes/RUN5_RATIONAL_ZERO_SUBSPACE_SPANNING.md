# Run 5 — rational zero-space spanning and the exact kernel complement

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction of the actual divisionRows_rationalLift producer, with exact finite algebra regression. No independent Lean replay or full proof/URT speed claim.

## Continuity and revision lock

Read AGENTS, research state, runner protocol/log, continuity, CI summary (run 45382352602 PASS, physical checks only), swarm protocol, queue, expansion, Run 3/4 and current peer handoffs (theta, Galois, prime, Landau, kernel, acceleration, literature, geometry, integration, math, editor). Prior work: Run 2 established conditional rank equality; Run 3 established conditional level projection surjectivity; Run 4 reconstructed the theta-coordinate factorisation (not the rational zero-space equality). None is repeated. Theta lane is investigating SWFull, literature is investigating square-zero lifts; these are distinct. Blueprint reference in queue noted, not independently reread this run. The user's RH-specific assignment is independent of the physics queue.

Source repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. All pinned references below are to this exact revision, not moving main. At retrieval current main was bb9476b875a219608a9068f8f18d8c56b4e7f1ca (24 Nov 2026). Current ZeroSubspaceSpannedByDataZeroSubspaceLifts blob 8ccc6b36e855b5052f33b4735e7088777fbc9e0c; statement wrapper blob 45f2d7008509e8eea5eaada39a2d32bbbd9bf371. Direct comparison of implementation from mulVec_map_injective through end of Main section finds two changed lines: map_add now specifies (f := _), and the hTh,hθ acquisition calls _root_.GlobalTheory.Mem.ThRead.thDef3_thTheta directly rather than the pinned wrapper GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data. Imports/module context also changed. DivisionCompatibleAtReadIdentifications old path returned 404 at head. No equivalence or current-head reachability claimed without migration/kernel evidence.

## 1. Actual dependency and hypotheses

In DivisionCompatibleAtReadIdentifications.lean:43, the second conjunct of GlobalTheory.divTied3_read fills divisionRows_rationalLift by calling GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts with hP,hH. The statement wrapper invokes GlobalTheory.Mem.R3.DivisionRationalLift.divisionRows_rationalLift, whose proof calls orth_ker_inf_range. The original definition of Idx.Z0 is in Formalism/LocalRingCardinality/DataIdx.lean:92–93:
    Z0(D,μ,j) = ker(thetaP(μ,j))^⊥ ∩ range(eMt(μ,j)).
It is not defined as a rational-coordinate image.

The full producer is quantified over D:D7, finite group G, Pl0,I0,T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, then Pins R F cG and Holds R F, and for ALL i:Fin D.R.m, t:T. Fix these data, and use j=i+1, μ=Y.tup t. This is the same family and reading as Run 4, not an independently chosen one.

Abstract core notation (ZeroSubspaceSpannedByDataZeroSubspaceLifts.lean:39–49):
- K is the coefficient number field with StarRing and σ:K→+*ℂ, M is a complex inner-product space and W a complex module. No additional completeness or finite-dimensional hypothesis on M is imposed.
- J:K^n→M and jW:K^e→W are σ-semilinear. The J-images of the standard n coordinate vectors span M over ℂ (hsp). Their inner products satisfy <Jx,Jy>=σ(hform(H,x,y)) (hin).
- eM:M→M is complex-linear and eM Jx=J(Ex) (hop) for the coefficient-field level matrix E.
- Zm:K^d→K^n and Pr:K^n→K^d are matrices satisfying the exact source IsOrthProj H Zm Pr (hP); in particular Pr Zm=I and Zm^* H(I−Zm Pr)=0. E fixes Zm z for every z (hEZ).
- The e standard coordinate images under jW are ℂ-linearly independent (hW).
- Θ:K^d→K^e is injective on coordinate vectors (hΘ).
- θ':M→W is complex-linear with θ'Jx=jW(Θ Pr x) for EVERY x (hθ).

These are the entire abstract theorem's inputs. Preserve also the upstream concrete hP,hH and the other five fields of DivRows3; the rational-pairing and base-tuple hypotheses are still needed for that full record.

## 2. Human proof — complexification of an injective coordinate matrix

An injective matrix Θ between finite-dimensional K vector spaces admits a K-linear left inverse L (extend a basis of its image). Thus LΘ=I_d. Applying the ring homomorphism σ entrywise gives σ(L)σ(Θ)=I_d, because matrix multiplication is finite sums and products and σ preserves 0 and 1. If σ(Θ)c=0 for c∈ℂ^d, then multiplying by σ(L) gives c=0. This is the exact argument of mulVec_map_injective, lines 26–37. In particular injectivity on K^d does not need to be independently assumed on ℂ^d. It follows by a left inverse, NOT by restricting c to K^d.

Also, for any matrix Zm and any z∈K^d, semilinearity gives
    J(Zm z)=Σ_k σ(z_k) J(Zm e_k).
Each basis image is itself in J(range_K Zm). Taking complex spans both ways proves the span_range_mulVec lemma (SpanRangeMulVec.lean:262–277). This equality does not assert that every complex combination has a preimage in K^d. For K=ℚ, M=ℂ, J inclusion, Zm=1, the complex span is ℂ but i is not in the rational image.

## 3. Human proof — exact theta-kernel complement

Define the complex subspaces
    S=span_ℂ J(range_K Zm),
    N=span_ℂ J(ker_K Pr).
For y∈ker Pr and z∈K^d, hform_orth (SpanRangeMulVec.lean:109–116) gives
    <J(Zm z),Jy>=σ(hform(H,Zm z,y))
                 =σ(hform(H,Zm z,Zm Pr y))=0.
By sesquilinearity this extends to the entire complex spans. Thus S⊥N (hSN).

For x∈K^n, Pr(x−Zm Pr x)=0 by Pr Zm=I (hker). Consequently
    Jx=J(Zm Pr x)+J(x−Zm Pr x)
with the summands in S,N respectively. Applying this identity to each coordinate generator and using hsp establishes M=S+N (htop); their orthogonality gives a direct sum. This proof uses algebraic finite spans and needs no Hilbert-space closure argument.

For each y∈ker Pr, θ'Jy=jW(Θ Pr y)=0. Complex linearity gives N⊆ker θ' (hNk).

For a∈S, write a=Σ_k c_k J(Zm e_k), now with genuinely complex c_k. By hθ, Pr Zm=I and σ-semilinearity of jW,
    θ'a=Σ_l (σ(Θ)c)_l jW(e_l).
If θ'a=0, independence hW implies σ(Θ)c=0. The left-inverse lemma gives c=0 and therefore a=0 (hSk). This proof does not assume J is complex-linear on K^n or assume that jW's coordinate images span W. Independence suffices.

Thus every w∈ker θ' decomposes as a+b (a∈S,b∈N), with θ'a=0, hence a=0 and w∈N. Together with hNk, ker θ'=N. More directly, the source proves both inclusions of ker θ'^⊥=S:
1. For v∈ker θ'^⊥ write v=a+b. Since b∈ker θ' and b⊥a, 0=<b,a+b>=||b||², so b=0 and v∈S.
2. For a∈S and w∈ker θ', decompose w into S+N; injectivity on S forces its S part to vanish. Orthogonality gives <w,a>=0, so a∈ker θ'^⊥.
No double-perp closure theorem or topology is being smuggled in. This is hmain, lines 117–133.

Finally each generator J(Zm z) is fixed by eM:
    eM J(Zm z)=J(E Zm z)=J(Zm z).
Such a fixed vector belongs to range eM, and the range is a complex subspace. Hence S⊆range eM (hSZ), so
    ker θ'^⊥ ∩ range eM = S
                           = span_ℂ {J(Zm e_k):k∈Fin d}.
This is orth_ker_inf_range. The intersection is redundant **under these exact hypotheses**, not for arbitrary operators. Neither self-adjointness nor idempotence of eM is needed as a further abstract hypothesis here. The concrete level structure still has all of its original assumptions.

## 4. Native instantiation and guard

Set K=D.what₂.LL, σ=the embedding in the read maps, J=(D.what₂.jMt μ j)∘Y.eMt i t, H=lH, E=lE, Zm=lZ0, Pr=lPrj (at the exact level and family in the theorem), eM=D.what₂.eMt μ j, jW=Z.jW i, Θ=(A3.indefDown (s0Of R F)).θ i t, θ'=D.what₂.thetaP μ j.

The source producer (lines 141–155) makes the following calls; these are remaining upstream facts, not abstract assumptions invented to make the lemma work:
- hR = complex_data_conditions_base_level_of_primitive_links hH.ok hH.sep hP.char hH.prim.
- hb = CxData.liftMat_bij (R.toCx3 F) F.cr false hR.kForm hR.ewNorm (hR.h4pos.2.2 false) hR.lifts0.1 hR.ratTh i t. The core uses hb.1 (injectivity); retain full native bijectivity and its premises.
- hB:BlockHyp of A3.A.fam.L i t, A3.A.fam.lvlA F.P0 F.ψ0, A3.A.v0, level 1, built using hH.ok.ok2.conj, irr, lifts i t.
- hp = BlockDat.lf_l_proj hB, he = GlobalTheory.Mem.LiftForms.lvlOp_lE hB. The latter obtains the level-operator fixed-vector equality from the native representation and idempotent identities, using injectivity of the level coordinate embedding (SpanRangeMulVec.lean:222–232).
- hTh,hθ = GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data ... hP hH. Its second conjunct is Run 4's equality, and its first supplies hTh.li i (target ℂ-linear independence), retained as an essential separate obligation.
- hf=Y.formsL i t, with hf.span, hf.inner, hf.op_eq supplying hsp,hin,hop respectively.

The argument establishes the unguarded equality for each i,t with the producer's original Pins/Holds hypotheses. The later DivRows3.toG restriction to Used0 does not prove the converse for unused tuples; DivRows3G.toRows requires the same universal TupAllUsed evidence from Run 4. Do not treat a proper used subset as universal coverage. All statements stay attached to the same dependent bundle.

## 5. Exact scope and remaining obligations

This fills the divisionRows_rationalLift local proof in the six-field DivRows3 assembly. The result is stronger than a dimension match: it identifies the actual subspace as the complex span of specific number-field coordinate columns. It does NOT identify every vector with a number-field point, prove lattice equality, prove an arbitrary level is admissible, establish the full DivRows3 construction without its other hypotheses, or independently derive the underlying Pins/Holds and theta-coordinate data.

The next distinct producer is the number identity field num, from GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel. Its hMj and hIdx arguments were not needed for this spanning lemma but are indispensable to the original full construction. Do not repeat Run 2 rank, Run 3 right inverse, Run 4 theta factorisation, or this span proof.

## 6. Reproducibility

Actual source retrieval: 6 pinned files, connector-reported SHA checked against each expected blob and 45 literal anchors checked (51 total assertions). Source matching is static; the pinned sources were not elaborated. In a clean pinned checkout the following Python script independently checks the byte-level Git blob IDs and anchors. Paths and SHA ledger:

~~~python
from pathlib import Path
from hashlib import sha1
I="src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
ledger=[
(I+"DivisionCompatibleAtReadIdentifications.lean","b6594122a28670a9dca1e61b23f5be9594f7f877",["divisionRows_rationalLift := GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts","hP hH","thTheta := hthT"]),
(I+"ZeroSubspaceSpannedByDataZeroSubspaceLiftsStatement.lean","89a1aa5551cd2ab439f9bf03ae77c2974c6a787b",["theorem _root_.GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts","Pins R F cG → Holds R F → ∀ (i : Fin D.R.m) (t : T)","GlobalTheory.Mem.R3.DivisionRationalLift.divisionRows_rationalLift"]),
(I+"ZeroSubspaceSpannedByDataZeroSubspaceLifts.lean","17cbec013a07325171620219581a87d2ec04d1b3",["theorem mulVec_map_injective","exists_leftInverse_of_injective","← Matrix.map_mul, hL","theorem orth_ker_inf_range","have hSN","have hker","have htop","have hNk","have hSk","have hcomp","Fintype.linearIndependent_iff.1 hW","mulVec_map_injective Θ hΘ","have hSZ","have hmain","inner_self_eq_zero","inf_eq_left.2 hSZ","theorem divisionRows_rationalLift","complex_data_conditions_base_level_of_primitive_links","CxData.liftMat_bij","BlockDat.lf_l_proj hB","GlobalTheory.Mem.LiftForms.lvlOp_lE hB","have hf := Y.formsL i t","exact orth_ker_inf_range","hf.span","hf.inner","hf.op_eq","hTh.li i","hb.1","hθ i t"]),
(I+"SpanRangeMulVec.lean","7160584f4f4c3ad52d9d5b2ca065ad38b4be23c4",["theorem hform_orth","theorem lvlOp_lE","theorem span_range_mulVec","Matrix.mulVec_smul, map_smulₛₗ"]),
(I+"LiftCuspFormSpaceThetaMapEqDataStatement.lean","1e4844972e2f5c0238dd34dcaa58bfa9f5dc4560",["theorem _root_.GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data","ThDef3 D A3.A","GlobalTheory.Mem.ThRead.thDef3_thTheta"]),
("src/Formalism/LocalRingCardinality/DataIdx.lean","3c508b4f1d3efa3e1f8b5c5d76998dfbd7f41795",["def Z0","(LinearMap.ker (D.what₂.thetaP μ j))ᗮ ⊓ LinearMap.range (D.what₂.eMt μ j)","def ThetaBij"])
]
checks=0
for path,digest,anchors in ledger:
    b=Path(path).read_bytes()
    assert sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==digest,path
    checks+=1
    for a in anchors:
        assert a in b.decode(),(path,a)
        checks+=1
assert checks==51
print(checks)
~~~

Exact finite regression executed in V8 (replay in Node). This is a finite model of the algebra, not a substitute for the original arithmetic operators or a proof of their existence. Use a weighted Hermitian form diag(h,k,1), Zm(u,v)=(au,bu,v), Pr(x,y,w)=((ha x+kb y)/D,w) with D=ha²+kb²>0, and a rectangular injective Θ(u,v)=(u+2v,v,2u−v). Gaussian integer coordinates are exact; all divisions are cleared by D. The good-level projection in the model is Zm Pr. Tested all selected parameters and vectors, not random samples. Actual results: 157464 vectors satisfying split, orthogonality, kernel annihilation, left-inverse and fixed-range assertions, plus 17496 independent coefficient-pair instances satisfying Pr Zm identity, injectivity and column-span identity. Counts are not additive across predicates tested on the same vectors. Six illustrative omitted-hypothesis counterexample checks below; these checks are not claims about failure of the original source.

~~~js
function regression(){
const add=(u,v)=>[u[0]+v[0],u[1]+v[1]],sub=(u,v)=>[u[0]-v[0],u[1]-v[1]],sc=(n,u)=>[n*u[0],n*u[1]],mul=(u,v)=>[u[0]*v[0]-u[1]*v[1],u[0]*v[1]+u[1]*v[0]],conj=u=>[u[0],-u[1]],eq=(u,v)=>u[0]===v[0]&&u[1]===v[1],z=[0,0],zero=u=>eq(u,z),same=(u,v)=>u.every((x,i)=>eq(x,v[i])),allzero=u=>u.every(zero),assert=(x,m)=>{if(!x)throw Error(m)};
const C=[];for(let i=-1;i<=1;i++)for(let j=-1;j<=1;j++)C.push([i,j]);
const theta=([u,v])=>[add(u,sc(2,v)),v,sub(sc(2,u),v)],left=([u,v,w])=>[sub(u,sc(2,v)),v];
let split=0,ker=0,rank=0,span=0,range=0;
for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++){if(!a&&!b)continue;
 for(let h=1;h<=3;h++)for(let k=1;k<=3;k++){
  const D=h*a*a+k*b*b;
  const E=([u,v])=>[sc(a,u),sc(b,u),v];
  const Pnum=([x,y,w])=>[add(sc(h*a,x),sc(k*b,y)),sc(D,w)];
  for(const x of C)for(const y of C)for(const w of C){
   const v=[x,y,w],p=Pnum(v),s=E(p),n=v.map((t,i)=>sub(sc(D,t),s[i]));
   assert(same(s.map((t,i)=>add(t,n[i])),v.map(t=>sc(D,t))),"split");
   assert(allzero(Pnum(n)),"kernel");
   const inn=add(add(sc(h,mul(conj(s[0]),n[0])),sc(k,mul(conj(s[1]),n[1]))),mul(conj(s[2]),n[2]));
   assert(zero(inn),"orthogonality");
   assert(allzero(theta(Pnum(n))),"theta kills N");
   assert(same(left(theta(p)),p),"left inverse over C");
   assert(allzero(theta(p))===allzero(p),"injectivity");
   assert(same(E(Pnum(s)),s.map(t=>sc(D,t))),"fixed level range numerator");
   split++;ker++;range++;
  }
  for(const u of C)for(const v of C){
   const s=E([u,v]);
   assert(same(Pnum(s),[sc(D,u),sc(D,v)]),"PE identity");
   assert(same(left(theta([u,v])),[u,v]),"complex left inverse");
   assert(allzero(theta([u,v]))===allzero([u,v]),"theta injective");
   assert(same(s,[sc(a,u),sc(b,u),v]),"complex column span");
   rank++;span++;
  }
 }
}
assert(!zero([0,1]),"i is not a real rational coordinate");
assert(allzero([z,z])&&!allzero([[1,0],z]),"noninjective theta: zero map on nonzero S");
assert(zero(add([1,0],[-1,0])),"dependent target columns: identical columns cancel");
assert(!zero(mul(conj([1,0]),[1,0])),"nonorthogonal P: E=(1,0), P=(1,1), kernel (-1,1) not orthogonal");
assert(!same([z,z],[[1,0],z]),"zero level operator does not fix S");
assert(!allzero([z,[1,0]]),"incomplete J span: extra direction may remain in ker theta orthogonal");
return {split,ker,range,rank,span,negative_examples:6};
}
console.log(regression());
~~~

Actual V8 output: {"split":157464,"ker":157464,"range":157464,"rank":17496,"span":17496,"negative_examples":6}. No original assumptions removed. No kernel validation, full-proof percentage, or measured URT speedup. No unrelated physics changes.

RESUME HERE: trace GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel from DivisionCompatibleAtReadIdentifications.lean:45 into NumbersEqConcreteNumbersAtBaseLevelStatement.lean and its actual implementation at the pin. Reconstruct each concrete number identity, the MjHTie and IdxDefs dependencies, and the role of the same coordinates/lattice at the same level; identify any separate finite-index or discriminant formulas. Check peers first; do not repeat Run 2–5 or conflate numerical index identities with the rationality and BtVanish inputs of colsBk. Current main migration to be kept separate.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois, math. Mark rational zero-space spanning source-matched conditional with proof in §§2–4, retain full native producer obligations and guards. Project OPEN.
