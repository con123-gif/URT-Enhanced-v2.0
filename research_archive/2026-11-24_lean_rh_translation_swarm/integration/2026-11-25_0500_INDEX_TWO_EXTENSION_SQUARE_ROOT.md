# Integration — index-two extension by a centralizing polynomial square root
2026-11-25. SOURCE-MATCHED local reconstruction, not independent Lean replay or full RH. Pinned 40e56bab026552e089d7afcfeff08d2defb9c005; observed current head 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (04:16:12Z) uses Claim.zeta in Main, not adopted. Previous integration acb84a8ac68a7ccf64e802a7b3dc04b28435e866.

## Exact statement and proof
Statement file L6–7 calls IndexTwoExt.main (implementation L194–337). Let Γ be a topological group, k an algebraically closed characteristic-zero topological field (the Lean assumptions are Field, CharZero, IsAlgClosed, TopologicalSpace and IsTopologicalRing), n natural including zero, η:Γ→ℤˣ, H=ker η open. Suppose r:H→GL_n(k) continuous and semisimple (invariant-complement definition); for all g∈Γ and h,h'∈H with h'=ghg⁻¹, tr r(h')=tr r(h). There exists continuous semisimple ρ:Γ→GL_n(k) agreeing exactly with r on H. No uniqueness; trivial sign allowed.

1. Implementation L197–204: if η is trivial, Γ→H is the canonical bijection; pull back r. Continuity by continuous subtype construction, semisimplicity by surjective pullback L106–113: every invariant subspace for the pullback is invariant under the original action by surjectivity, and its complement pulls back.
2. L205–231: otherwise choose t with η(t)=−1, c(h)=tht⁻¹ on H, s=t²∈H. Conjugation by t⁻¹ is its inverse, c(s)=s and c²(h)=shs⁻¹. Trace invariance and semisimplicity of both r and r∘c (surjective pullback) give P with r(c(h))=P r(h) P⁻¹ by TraceConj.conj_of_trace_eq. This imported theorem is not inferred from finite trace samples.
3. L232–252: substitute s to obtain P commuting with r(s); apply conjugacy twice to get P²r(h)P⁻²=r(s)r(h)r(s)⁻¹. Hence C=P⁻²r(s) commutes with P and all r(h). Need a square root commuting with the entire centralizer, not just an arbitrary square root.
4. L116–169: for f with f(0)≠0 show f divides q²−X by degree induction. Nonzero constant: q=0. Otherwise algebraic closedness gives μ with f=(X−μ)g, μ≠0, g(0)≠0, degree one lower. Induction q²−X=g e. Set Q=q+a g; Q²−X=g(e+2a q+a²g). Choose a making g(μ)a²+2q(μ)a+e(μ)=0. If g(μ)=0 then q(μ)²=μ≠0, solve linearly a=−e(μ)/(2q(μ)) (char zero). Otherwise use algebraic closedness for the quadratic. Factor theorem gives f | Q²−X. This explicitly covers repeated roots.
5. L172–190,253–283: invertible C has charpoly(C)(0)≠0 by determinant identity. Apply polynomial lemma and Cayley–Hamilton: D=q(C) has D²=C. Polynomial evaluation commutes with every matrix commuting with C, by constant/addition/monomial induction. Thus D commutes with C⁻¹, P and r(h); two-sided inverse DC⁻¹ makes D invertible. B=PD has B²=r(s), B r(h)=r(c(h)) B.
6. L284–324: unique normal form h t^ε, ε=0,1; for negative sign h=g t⁻¹. Define ρ(h t^ε)=r(h)B^ε. The source extends r by 1 outside H as f, but uses f only on H. Four products (h,0)(k,0)=(hk,0), (h,0)(k,1)=(hk,1), (h,1)(k,0)=(h c(k),1), (h,1)(k,1)=(h c(k)s,0). First two follow by multiplicativity of r, third by intertwining, fourth additionally B²=r(s). Noncommuting factor order retained. This establishes homomorphism and exact restriction.
7. L325–337: H open and contains 1, so ρ continuous at 1 by its restriction r and therefore continuous everywhere. No separate continuity of η required. Apply semisimplicity ascent to ρ. The separate continuous_of_open L95–104 is not a direct call in main.
8. L15–93: for any Γ-invariant W, H-semisimplicity supplies H-invariant complement W'. Projection p onto W along W' commutes with σ(H), where σ is the column representation of ρ. Average Q=(p+σ(t)pσ(t)⁻¹)/2. Second term commutes with H by normality; conjugation by t swaps summands since t²∈H. Thus Q commutes with Γ. Both terms map into W and fix W (W invariant under t and t⁻¹). Therefore Q is a projection, and its kernel is Γ-invariant by commutation. Kernel gives invariant complement; char zero permits division by two.
9. ColRepSemisimple L23–55: native semisimplicity gives semisimplicity of the column representations, then TraceIso.exists_equiv_of_trace_eq supplies an intertwining linear equivalence. Matrix of that equivalence and inverse give P via injectivity of toLin'. TraceIso remains an imported proof obligation.

## Source ledger and typed incremental graph
Ledger entries [path,blob,anchors]; graph locations index into ledger, inclusive lines. All edges source-value calls, not authenticated elaborated role records. Keep previous authenticated incoming edges intact, no assertion of exhaustive dependencies or empty axiom set.
```json
{
  "spec": [
    [
      "src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsExtensionRepIndexTwoOfTraceInvariant.lean",
      "ef7874385c789c8a3cc81686f8cc3ac41aec2515",
      [
        [
          15,
          93,
          "LinearMap.ker q"
        ],
        [
          116,
          169,
          "q + g * C a"
        ],
        [
          172,
          190,
          "Matrix.aeval_self_charpoly"
        ],
        [
          194,
          204,
          "r.comp φ"
        ],
        [
          205,
          231,
          "conj_of_trace_eq"
        ],
        [
          232,
          252,
          "hCr"
        ],
        [
          260,
          283,
          "B * B = r s"
        ],
        [
          284,
          321,
          "f (g * t⁻¹) * B"
        ],
        [
          322,
          337,
          "hcomp"
        ]
      ]
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsExtensionRepIndexTwoOfTraceInvariantStatement.lean",
      "11a456d02a0981b3e8a0e9bf2b9215611254d7ec",
      [
        [
          6,
          7,
          "GlobalTheory.IndexTwoExt.main"
        ]
      ]
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean",
      "182a2b8d161eb8c3cd85b4247c98cd90cd915d3d",
      [
        [
          39,
          41,
          "GlobalTheory.TraceIso.exists_equiv_of_trace_eq"
        ]
      ]
    ],
    [
      "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "2d2a78b5f0ccc6a41008af1f2692a61c76ccc750",
      [
        [
          78,
          82,
          "exists_extension_rep_index_two_of_trace_invariant"
        ]
      ]
    ]
  ],
  "graph": {
    "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
    "nodes": [
      {
        "id": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          1,
          6,
          7
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.IndexTwoExt.main",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          194,
          337
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.IndexTwoExt.isSSRep_of_ker",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          15,
          93
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private isSSRep_comp_of_surjective",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          106,
          113
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private exists_dvd_sq_sub_X_of_eval_zero_ne_zero",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          116,
          169
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private exists_sqrt_commute_of_isUnit_det",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          172,
          190
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          2,
          33,
          55
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
        "kind": "theorem",
        "status": "OPEN",
        "location": [
          2,
          39,
          41
        ],
        "locationKind": "call-site"
      },
      {
        "id": "GlobalTheory.IndexTwoPatch.main",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          3,
          78,
          82
        ],
        "locationKind": "source-range"
      }
    ],
    "edges": [
      {
        "owner": "GlobalTheory.IndexTwoPatch.main",
        "target": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "line": 78,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "target": "GlobalTheory.IndexTwoExt.main",
        "line": 7,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private isSSRep_comp_of_surjective",
        "line": 202,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private isSSRep_comp_of_surjective",
        "line": 226,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "line": 225,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private exists_sqrt_commute_of_isUnit_det",
        "line": 260,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "GlobalTheory.IndexTwoExt.isSSRep_of_ker",
        "line": 335,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "private exists_sqrt_commute_of_isUnit_det",
        "target": "private exists_dvd_sq_sub_X_of_eval_zero_ne_zero",
        "line": 180,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "target": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
        "line": 39,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      }
    ],
    "unresolved": [
      "complete elaborated role records and Main-root linkage",
      "transitive axiom ledger",
      "TraceIso supplier",
      "Mathlib polynomial root, division, Cayley-Hamilton, complement and continuity suppliers",
      "finite adjoint character and six-twist vanishing"
    ]
  }
}
```
## Executed tests
V8: 4 blob-ID comparisons and 12 source anchor checks. Finite identity regression: {"products":1280,"corrections":32,"projections":17,"polynomial":16,"negative":2}. F17 is not algebraically closed or characteristic zero; examples only check identities. D4 tests noncommuting conjugation; C4 tests t² nontrivial. Repeated-root polynomial checks modulo (X−μ)^2. Negative controls uncorrected P and zero repeated root (289 coefficient pairs). No Lean kernel replay. Execute JS below using node.
```js
function test(){
 const p=17,m=x=>(x%p+p)%p,inv=x=>{for(let i=1;i<p;i++)if(m(i*x)===1)return i;throw Error("zero")},I=[1,0,0,1],R=[0,16,1,0],S=[1,0,0,16],mm=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(m),sc=(a,c)=>a.map(x=>m(c*x)),eq=(a,b)=>a.every((x,i)=>x===b[i]),pw=(a,n)=>{let r=I;while(n--)r=mm(r,a);return r},ck=(v)=>{if(!v)throw Error("regression")};
 let products=0,corrections=0,projections=0,polynomial=0,negative=0;
 for(const [H,t] of [[Array.from({length:4},(_,i)=>pw(R,i)),S],[[I,pw(R,2)],R]])for(let z=1;z<p;z++){
 const ti=pw(t,3),s=mm(t,t),P=sc(t,z),Pi=sc(ti,inv(z)),C=mm(mm(Pi,Pi),s),D=sc(I,inv(z)),B=mm(P,D),c=h=>mm(mm(t,h),ti),F=(h,e)=>e?mm(h,B):h;
 ck(eq(mm(D,D),C)&&eq(mm(B,B),s));corrections++;
 for(const h of H)for(const k of H)for(let e=0;e<2;e++)for(let f=0;f<2;f++){ck(eq(mm(F(h,e),F(k,f)),F(mm(mm(h,e?c(k):k),e&&f?s:I),e^f)));products++}
 }
 for(let a=0;a<p;a++){const P=[1,a,0,0],Q=sc(P.map((x,i)=>m(x+mm(mm(S,P),S)[i])),inv(2));ck(eq(Q,[1,0,0,0])&&eq(mm(Q,Q),Q));projections++}
 // Repeated-root case modulo (X-mu)^2, with q=a+b(X-mu).
 for(let a=1;a<p;a++){const mu=m(a*a),b=inv(m(2*a));ck(m(a*a-mu)===0&&m(2*a*b-1)===0);polynomial++}
 ck(!eq(mm(sc(S,2),sc(S,2)),I));negative++;
 for(let a=0;a<p;a++)for(let b=0;b<p;b++)ck(!(m(a*a)===0&&m(2*a*b)===1));negative++;
 return {products,corrections,projections,polynomial,negative};
}
console.log(test());
```
Continuity: SWARM_PROTOCOL first, AGENTS, research state/log/protocol and continuity excerpts, HANDOFF_QUEUE, expansion; read dependency 0412, structure 0324, math conductor, audit 0448, boxes RUN20, Galois RUN22, kernel RUN19, Landau RUN22, literature RUN22, acceleration RUN22, geometry RUN23, prime RUN22, editor 0456, theta RUN22 handoffs. CI #418 PASS 04:38:50Z, general repository not RH kernel. Editor volume 19 reports 234 cumulative documents, not theorem coverage. Failed root-level log paths corrected to runner paths; stale lexical RUN9 ordering corrected by numeric order. First TraceIso source anchor L40–55 failed, actual call L39. Subsequent connector disconnected, path readback 404; retry reduced artifact. Blueprint not reopened. No independently authenticated new root path from 300-target export; acceleration compact DB still pending. Independent review pending; ask audit to examine polynomial cases and factor order. No unrelated changes or URT advantage claim.

RESUME HERE: expand TraceIso.exists_equiv_of_trace_eq via exact import NonemptyLinearEquivOfCharpolyEq.lean; preserve char zero and semisimplicity. Then finite adjoint character and six-twist vanishing. Request cached role-labelled path to IndexTwoExt.main from dependency/kernel. HANDOFF TO audit, editor, dependencies, kernel, Galois, acceleration. Full RH reconstruction OPEN.
