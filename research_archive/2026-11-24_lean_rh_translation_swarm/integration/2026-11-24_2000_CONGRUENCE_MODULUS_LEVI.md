# Congruence neighbourhood, smooth half-modulus and Levi-kernel suppliers — integration 20:00

2026-11-24. SOURCE-MATCHED / PARTIAL. One contribution: fill the three source-visible supplier obligations left by [19:00](2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.md). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from previous run. No equivalence to that newer revision asserted.

## 1. Congruence neighbourhood basis
CentralExponentBoundOver L83–150. Fix a nonarchimedean local field k with its valuation v and topology, finite index type n with decidable equality, value-group unit gamma<=1. Write K_gamma={g in GL(n,k): v((g-I)_ij)<gamma for every i,j}. Strict inequality is essential; gamma is nonzero. The source first proves mul_small: if A has integral entries (v<=1) and each entry of B has valuation <gamma then the same holds for AB. Each product has valuation <=v(B_sj)<gamma; finite ultrametric sum preserves the strict inequality, including the empty sum because gamma is positive.

K_gamma lies in KOne by weakening <gamma<=1; the imported KOne_le_KO and intM_of_mem_KO give integral entries for g and its inverse (KOne is a subgroup). The exact noncommuting identities
  gh-I=g(h-I)+(g-I),  g^{-1}-I=-g^{-1}(g-I)
therefore establish closure under multiplication and inversion by mul_small and the ultrametric sum bound; identity is immediate. No commutativity of matrices assumed. The coefficient inequalities alone are not substituted for inverse integrality: the imported KO lemma is explicitly used.

Openness: the set is the finite intersection of preimages of {x:v(x)<gamma} under continuous g↦(g-I)_ij. Each ball is open: for any x in it, translation by an element y with v(y)<gamma keeps x+y in it. Compactness (separate L125–128) follows as a closed subgroup contained in compact KO; an open subgroup is closed. No assertion that compactness is needed by exists_openSubgroup_GL.

Neighbourhood cofinality: use the imported SplitFlip.isEmbedding_val_GL.nhds_eq_comap to choose a matrix neighbourhood T of I whose preimage is contained in U. Translate to T0={A:A+I in T}, neighbourhood of 0. In the finite product of entry topologies choose an entrywise ball with common value-group unit radius gamma<=1 inside T0; the native proof realizes this using the filter atBot × top and the map (r,A)↦A if all v(A_ij)<r, else 0. For each fixed positive test radius s, eventually r<=s; either branch gives valuation <s in every entry. Hence the map tends to 0. Eventually all matrices in the second coordinate map into T0; choose one radius gamma<=1 using mem_prod_top. For g in K_gamma apply this to A=g-I; the conditional returns A, and A+I=g. Thus g∈U. This retains the original arbitrary-neighbourhood quantifier and the GL embedding dependency.

## 2. Smooth modulus character
IsSubquotientDetRepParInd L18–88, 181–224. Same local field and finite linearly ordered block type alpha with finite decidable block indices. nabs(x) is the positive multiplicative Haar-scaling character of k^×, not an arbitrary fitted norm. If v(x)=1, multiplication by x preserves the valuation ring O: membership is unchanged because v(x^{-1})=1. O is compact, open, nonempty; normalize additive Haar measure with measure(O)=1. Its scaled copy xO has the same measure, so the defining Haar-scaling formula yields nabs(x)=1. This uses positivity/finiteness and the named Haar normalization lemma, not merely invariance of arbitrary compact sets.

For s∈C define absPow_s(x)=nabs(x)^s (complex principal power of a positive real). Positivity and the positive-real cpow product lemma ensure multiplicativity, and v(x)=1 implies absPow_s(x)=1. Any unramified character chi is smooth: the intersection of the two open preimages of O under x↦x and x↦x^{-1} is a neighbourhood of 1 in k^×; both valuation inequalities imply v(x)=1, so the neighbourhood is contained in ker chi. A subgroup containing an identity neighbourhood is open. Smoothness here means open kernel, not differentiability.

For block dimensions d_a, set E_a=sum_{b>a}d_b−sum_{b<a}d_b. For g in the Levi product,
  delta(g)=prod_a nabs(det(g_a))^{E_a},
  deltaHalf(g)=prod_a absPow_{E_a/2}(det(g_a)).
All bases positive; deltaHalf(g)=sqrt(delta(g))>0 in the complex embedding. This follows by real-power multiplication and finite product of square roots, not choice of a complex sign. Each determinant is continuous into k^×, each coordinate evaluation continuous; composing smooth characters with these maps and taking finite products preserves open kernels. This is the actual proof of isSmoothChar_deltaHalf. For the companion isLocallyConstant_modulus (IsLocallyConstantModulus L205–210,266ff), right multiplication by any u in the open kernel preserves deltaHalf, hence delta by the positive square root identity. Translating the identity neighbourhood to x gives local constancy. No compactness of the whole Levi group is assumed.

## 3. Parabolic projection / radical
InductionParabolicGroups L99–186. For F a field, Fin n, linearly ordered labels beta, P block upper triangular subgroup of GL, M block diagonal subgroup. L(p) deletes cross-block entries. For (i,j) with beta(i)=beta(j), every summation term p_ik q_kj vanishes unless beta(i)<=beta(k)<=beta(j), hence equality of all three labels. This gives L(pq)=L(p)L(q) including off-block entries (both sides zero there); L(p^{-1}) is inverse of L(p), relying on P being a subgroup. L restricts to identity on M, via inclusion i:M→P. The source defines N as image of ker L under P↪GL, so for p∈P, p∈N iff L(p)=1; membership is precisely block upper plus identity diagonal blocks. For p∈P,u∈N, p u p^{-1} lies in P and its image is L(p)1L(p)^{-1}=1. Thus N normal in P. Finally L(i(L(p))^{-1}p)=L(p)^{-1}L(p)=1. Therefore i(L(p))^{-1}p∈N, exactly leviProj_inv_mul_mem; reversing order needs the normality identity, not commuting the factors. This also holds in the opposite order by changing beta to order dual. These close the selected algebraic supplier steps, not imported block-upper construction or Iwahori membership premises.

## 4. Coverage / review
Master manuscript [X](../specialists/proof_editor/2026-11-24_1956_INTEGRATED_MANUSCRIPT.md) reports 134 primary and 11 supporting entries before this contribution; not a unique-declaration numerator. Prior authenticated conservative denominator reported 1,484,705 declarations; no completion percentage. General Cathedral CI 45471620274 PASS at 19:59, not a validation of this contribution. All imported leaves below remain open; global axiom audit and independent Lean replay not claimed. Kernel RUN12 reports downstream masking investigation remains open; dependency latest 593acf8 reconciles 47 projections, but no root membership claimed here. Peer checkpoints read: structure 9b7dbd7, math 1c79a78, audit c242308, acceleration 2d679cf commit summaries; specialist RUN13 boxes, Galois, Landau, literature, geometry, prime, theta, acceleration and editor X, kernel RUN12. Grok nested lane latest commit summaries inspected, not full nested RESUME files. Initial root log/protocol paths 404 recovered runner paths; integration/RESUME_HERE.md absent, recovered 19:00 handoff; one lane listing exceeded call limit, split; code search returned no hits for isSmoothChar_deltaHalf, located by pinned import traversal. No other research files changed. No URT benchmark.

## 5. Typed selected dependency graph (JSON)
Node arrays = [id,kind,fileIndex,one-based inclusive line range,requires]. Open imports grouped by topic, not exact kernel constants. The graph is not a replacement for the source or all proof obligations. Consumer factor points to previous 19:00 Iwahori chapter. Source SHA/path ledger is embedded. 31 nodes, 44 directed edges; checked target existence and acyclicity in V8. No source-to-export equivalence asserted.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "source-selected only; no authenticated root membership or kernel edges asserted",
  "files": [
    [
      "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/CentralExponentBoundOver.lean",
      "15c5d5b8b52fd25b3de410ae0696ff186298a926"
    ],
    [
      "src/Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/IsSubquotientDetRepParInd.lean",
      "7eef4a1515820c62f2a9b1cd306f2dfa7a13d334"
    ],
    [
      "src/GroundTheory/AutomorphicForms/InductionParabolicGroups.lean",
      "0c1312ea9b95772d1d0c9838d9414f951e8a1b1d"
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsIrreducibleSecondFactorOfIrreducibleProduct.lean",
      "486fdd6e3b310f838b3ead5aa9509c71e47ace25"
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/IsLocallyConstantModulus.lean",
      "29dcf1602f58a1f7350d106a5a347608711d9d99"
    ]
  ],
  "nodes": [
    [
      "eval",
      "consumer",
      3,
      [
        95,
        107
      ],
      [
        "basis",
        "open",
        "half"
      ]
    ],
    [
      "basis",
      "theorem",
      0,
      [
        130,
        150
      ],
      [
        "cong",
        "topology"
      ]
    ],
    [
      "open",
      "theorem",
      0,
      [
        113,
        123
      ],
      [
        "cong",
        "topology"
      ]
    ],
    [
      "cong",
      "definition",
      0,
      [
        95,
        111
      ],
      [
        "small",
        "integral"
      ]
    ],
    [
      "small",
      "theorem",
      0,
      [
        87,
        91
      ],
      [
        "valuation"
      ]
    ],
    [
      "compact",
      "theorem",
      0,
      [
        125,
        128
      ],
      [
        "open",
        "integral",
        "compactKO"
      ]
    ],
    [
      "half",
      "theorem",
      1,
      [
        220,
        224
      ],
      [
        "unram",
        "smooth",
        "det",
        "smoothProd"
      ]
    ],
    [
      "unram",
      "theorem",
      1,
      [
        71,
        72
      ],
      [
        "abs",
        "nabs"
      ]
    ],
    [
      "abs",
      "definition",
      1,
      [
        47,
        53
      ],
      [
        "haar",
        "cpow"
      ]
    ],
    [
      "nabs",
      "theorem",
      1,
      [
        27,
        45
      ],
      [
        "haar",
        "valuation"
      ]
    ],
    [
      "smooth",
      "theorem",
      1,
      [
        76,
        88
      ],
      [
        "topology",
        "valuation"
      ]
    ],
    [
      "det",
      "theorem",
      1,
      [
        181,
        183
      ],
      [
        "continuousDet",
        "smoothProd"
      ]
    ],
    [
      "valhalf",
      "theorem",
      1,
      [
        200,
        218
      ],
      [
        "abs",
        "haar",
        "cpow"
      ]
    ],
    [
      "locally",
      "theorem",
      4,
      [
        266,
        273
      ],
      [
        "half",
        "valhalf",
        "local"
      ]
    ],
    [
      "local",
      "theorem",
      4,
      [
        205,
        210
      ],
      [
        "topology"
      ]
    ],
    [
      "factor",
      "consumer",
      null,
      null,
      [
        "normal",
        "split"
      ]
    ],
    [
      "normal",
      "theorem",
      2,
      [
        174,
        182
      ],
      [
        "ker",
        "proj"
      ]
    ],
    [
      "split",
      "theorem",
      2,
      [
        184,
        186
      ],
      [
        "ker",
        "section"
      ]
    ],
    [
      "ker",
      "theorem",
      2,
      [
        165,
        172
      ],
      [
        "rad"
      ]
    ],
    [
      "rad",
      "definition",
      2,
      [
        128,
        152
      ],
      [
        "proj"
      ]
    ],
    [
      "section",
      "theorem",
      2,
      [
        116,
        124
      ],
      [
        "proj"
      ]
    ],
    [
      "proj",
      "definition",
      2,
      [
        99,
        114
      ],
      [
        "blockDiag"
      ]
    ],
    [
      "topology",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "integral",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "valuation",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "compactKO",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "smoothProd",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "haar",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "cpow",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "continuousDet",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "blockDiag",
      "open imported obligations",
      null,
      null,
      []
    ]
  ]
}
```

## 6. Regression certificate
Actual V8 execution: {"congr":794884,"inv":1444,"proj":70052,"normal":2204,"weights":157464,"negative":9}. Positive counts are finite cases; one case can perform multiple assertions. Finite quotient tests specialize to Z/p^(k+1), k>=1, and exercise square-zero inverse/closure at that depth, not general local-field topology. Upper triangular 2x2 matrices over finite prime fields exercise the exact projection and normality identities; exponent fixture tests ordering with zero-sized blocks allowed. Controls: swap matrix outside P breaks diagonal projection multiplicativity; gamma=p>1 permits diag(p,1) but not its inverse over Q_p (valuation 1 versus p); nonunit determinant can yield nonzero exponent. Initial exponent reverse test was tautological; replaced by recomputing exponents on reversed block sizes and valuations, and reran. No numerical fixture establishes Haar normalization, topology, or kernel soundness. Pinned source blobs and 44 source text anchors checked separately via GitHub connector; reproduce using git rev-parse PIN:PATH and git show PIN:PATH (not executed locally). New CI verdict pending; this embedded standalone JS is not registered as a CI check.

```js
function certificate(){
let congr=0,inv=0,proj=0,normal=0,weights=0,negative=0;
const ck=(b,m)=>{if(!b)throw Error(m)},eq=(a,b)=>a.every((v,i)=>v===b[i]),I=[1,0,0,1];
for(const p of [2,3,5])for(const k of [1,2]){
const q=p**(k+1),t=p**k,mod=x=>(x%q+q)%q;
const mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod);
const K=a=>a.every((x,i)=>mod(x-I[i])%t===0);
const all=[];for(let a=0;a<p;a++)for(let b=0;b<p;b++)for(let c=0;c<p;c++)for(let d=0;d<p;d++)all.push([1+t*a,t*b,t*c,1+t*d]);
for(const g of all){const gi=g.map((x,i)=>mod(2*I[i]-x));ck(K(gi)&&eq(mul(g,gi),I)&&eq(mul(gi,g),I),"inverse");inv++;for(const h of all){ck(K(mul(g,h)),"closure");congr++}}
}
for(const p of [2,3,5,7]){
const mod=x=>(x%p+p)%p,mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod),D=a=>[a[0],0,0,a[3]],iv=x=>{for(let z=1;z<p;z++)if(mod(z*x)===1)return z;throw Error("inverse")};
const all=[];for(let a=1;a<p;a++)for(let d=1;d<p;d++)for(let b=0;b<p;b++)all.push([a,b,0,d]);
for(const g of all){const [a,b,,d]=g,gi=[iv(a),mod(-iv(a)*b*iv(d)),0,iv(d)],u=mul([iv(a),0,0,iv(d)],g);ck(eq(D(u),I),"section");for(const h of all){ck(eq(D(mul(g,h)),mul(D(g),D(h))),"projection");proj++}for(let x=0;x<p;x++){ck(eq(D(mul(mul(g,[1,x,0,1]),gi)),I),"normal");normal++}}
const w=[0,1,1,0];ck(!eq(D(mul(w,w)),mul(D(w),D(w))),"nonparabolic");negative++;
}
const exponent=(m,v)=>m.reduce((s,_,i)=>s+v[i]*m.reduce((t,n,j)=>t+Math.sign(j-i)*n,0),0);
for(let a=0;a<=5;a++)for(let b=0;b<=5;b++)for(let c=0;c<=5;c++)for(let x=-4;x<=4;x++)for(let y=-4;y<=4;y++)for(let z=-4;z<=4;z++){const m=[a,b,c],v=[x,y,z],s=exponent(m,v);ck(s===b*x-a*y+c*x-a*z+c*y-b*z,"exponent");ck(s===-exponent(m.slice().reverse(),v.slice().reverse()),"order reverse");weights++}
for(const p of [2,3,5,7]){ck(1<p&&p>=p,"gamma=p: diag(p,1) in, inverse out");negative++}
ck(exponent([1,1],[1,0])!==0,"nonunit determinant");negative++;
return {congr,inv,proj,normal,weights,negative}
}
console.log(certificate());
```

RESUME HERE: expand SplitFlip.isEmbedding_val_GL and KOne_le_KO/intM_of_mem_KO from the pinned imports of CentralExponentBoundOver; preserve the forward and inverse topology and integrality witnesses. Request authenticated role-labelled root paths for GlobalTheory.CentralExponent.exists_cong_subset, isOpen_cong, GlobalTheory.SmGL.isSmoothChar_deltaHalf, nabs_eq_one, GroundTheory.Automorphic.Parabolic.conj_mem_unipotentRadical and leviProj_inv_mul_mem. HANDOFF TO dependencies, kernel, editor, audit, integration. Project OPEN.
