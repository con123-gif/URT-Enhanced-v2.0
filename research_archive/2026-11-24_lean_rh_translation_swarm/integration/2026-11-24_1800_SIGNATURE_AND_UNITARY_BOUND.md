# Signature and unitary induction bound — integration run 11, 2026-11-24

RESULT: SOURCE-MATCHED / PARTIAL. One contribution: fill the two native positivity inputs used in the previous two-block reducibility chapter. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 307cef33f046955ee79dba47e0d828d06496d75f. No substitution of latest head. This is mathematical source reconstruction, not a kernel replay or the full RH proof.

## Index and peer handoff

Read SWARM_PROTOCOL first, AGENTS, state/log/protocol, continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, prior integration, editor volume VIII and latest lane checkpoints via commits (see table). Root log/protocol and guessed RESUME_HERE.md files returned 404; recovered runner paths and actual committed filenames. An initially mistyped audit SHA failed 422; recovered exact SHA. A guessed Signature.lean returned 404; actual producer is PosMkIff.lean. Not all nested Grok archives or external blueprint reread. Latest general CI checkpoint #384 PASS (45447821218, 17:43:15Z), not this proof's validation.

Main reading index: [editor volume VIII](../specialists/proof_editor/2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), which links I–VII, plus [prior integration](2026-11-24_1700_TWO_BLOCK_REDUCIBILITY_REVERSAL.md). Editor reports 107 prior primary + 7 supporting, nine new primary + one supporting = 116 primary + 8 supporting peer entries, not unique theorem or full-proof coverage. Add this chapter separately (not yet editor-integrated). Prior export count 1,484,705 declarations under conservative policy is a reported denominator, not a count of translated declarations. No percentage computed.

| Lane | Latest checkpoint commit prefix | Next obligation |
|---|---|---|
| dependency | c35d085 | role-labelled outgoing projection for seven authentic frontier refs; ctor has three fields incl. both Row slots, no proof value |
| structure | 4ad5898 | enlarge authenticated owner ideal once outgoing roles available |
| math | 98ed759 | changeLevel_injective and unit-map surjectivity |
| audit | 91ebc5c | DerivInt/GPsi derivative producer and y>=1 guard |
| acceleration | 6f308d9 | matched 15-scan solution baseline |
| kernel | b28cdca | downstream fixture for imported axiom cache |
| prime | 64ee566 | actual LinkG retained-top producer |
| Landau | d380871 | kernelIntegral incomplete-gamma tails |
| theta | 2f75644 | orbRes zero-column and nonsingular vanishing |
| Galois | d1216e7 | frob_laws source and fixed-field proof |
| boxes | c85e003 | actual finiteGroupIdentification_fixedPlaces |
| literature | 421b2b2 | smooth-reduced supplier and affine factorization |
| geometry | 11d241e | holomorphic_extension_section_reading |
| editor | acb198d | volume VIII / host construction; keep conditional |
| integration | a20bf40 | this chapter fills Signature and Bound |

Reviewer finding from kernel RUN11: fresh collector sees guardProp on all three isolated queries, while shared queries depend on order; imported cache undercount propagation remains an open experiment, not a kernel soundness defect or evidence against RH. Retain all conservative edges and separate axiom reporting from independent kernel validation. No claim that this chapter has independent reviewer approval.

## 1. Signature — exact hypotheses and uniqueness

Let W be finite-dimensional complex vector space, I any index type, iota:I→I surjective (retain the source hypothesis; the body introduces it anonymously), and T_s(i) complex-linear endomorphisms. For every i,w,linear functional l, s→l(T_s(i)w) is continuous on R. For every s>=0 the only subspaces invariant under all T_s(i) are 0 and W. At each such s there exists a nonzero Hermitian sesquilinear form B, linear first and conjugate-linear second, with B(T_s(i)v,w)=B(v,T_s(iota(i))w). At zero there exists a positive definite such form. The conclusion is that EVERY nonzero Hermitian invariant form at EVERY s>=0 is either positive definite or negative definite. W is nontrivial in the concluding branch because B is nonzero. No continuous choice of B_s is a premise.

For fixed s, the left radical of an invariant B is invariant under all T_s(i), directly from the invariance identity. If B≠0, simplicity forces radical zero (ker_bot). For a nonzero B0 and arbitrary invariant B, map W into C^n by evaluating their conjugate-linear functionals at a basis. Evaluation E is injective; E∘B0 is injective and, by equal finite dimensions, bijective. The complex endomorphism A=(E∘B0)^(-1)∘E∘B has an eigenvector x≠0 with eigenvalue c. Thus (B-cB0)(x,-)=0. The difference is invariant; if nonzero its radical would be zero. Therefore B=cB0 (uniq). When both forms are Hermitian, evaluate at a pair where B0(v,w)≠0 and compare conjugates to get c=conj(c), hence real (real_of). Nonzero B implies c≠0. This does not require the operators T_s to be a group representation.

## 2. Closed and open positive-form locus

Define D={s: there exists a Hermitian invariant positive form}; P=D∩[0,∞) as a subset of the half-line. The source uses a fixed basis, Gram entries M_ij=B(e_i,e_j), and the finite polynomial q_M(x,y)=sum x_i conjugate(y_j) M_ij. The inverse construction mk(M) and gram are mutually inverse. Scale any nonzero form by the positive reciprocal Gram norm so its Gram matrix is on the compact unit sphere; the normalization is legal because gram is injective. This preserves Hermiticity and invariance. For s_n→p, choose normalized forms and a strictly increasing subsequence converging to M of norm one. Coordinate continuity of T, finite sums and complex conjugation imply mk(M) remains Hermitian and invariant at p, and its evaluations are pointwise limits (lim_form). Norm one prevents the limit from being zero.

Closedness: if s_n∈P, take positive forms; their limit is nonnegative on every diagonal. By ker_bot it is nondegenerate. To see strict positivity, suppose v≠0 and B(v,v)=0. Hermiticity makes B(w,w)=b real. Set z=B(v,w) and a=-t z, t real. Nonnegativity at v+aw gives 0<=|z|²(-2t+t²b). Choose t=1/(|b|+1)>0. Then tb<1, so if z≠0 the expression is negative. Hence z=0 for every w and v is in the radical, contradiction. This is pos_of, not an assumption that every nonsingular Hermitian form is positive.

Openness: the native proof shows P^c is sequentially closed. If s_n outside P tends to p∈P, choose the supplied nonzero invariant Hermitian forms at s_n (not positive), normalize and extract as above. The limit B is a nonzero real multiple c of the positive form B0 at p by uniq and real_of. Pick sign σ∈{-1,1} with σc>0. On the compact unit sphere in W the quadratic evaluation for σM is strictly positive; continuity gives a whole neighborhood of Gram matrices positive on that sphere (pos_open), and homogeneity extends positivity to every nonzero vector. Thus for some subsequence index σ times the normalized form is positive, contradicting s_n outside P. No global continuous family of forms was assumed, and the sign is chosen at the limit, not independently for each vector. Since [0,∞) is preconnected and P is nonempty (contains 0), both closed and open imply P is the whole half-line. At the target s, uniq and real_of give the desired sign dichotomy. The previous complementary_of chapter transports this local finite-dimensional result to compact-fixed spaces and then globally to the induced representation.

## 3. BoundB — exact domain and the contracted block

Let k be a nonarchimedean local field, d natural, W a nontrivial complex module, τ a smooth Levi representation of GL_d(k)×GL_d(k). Assume normalized parabolic induction π is admissible and unitarisable. Let t∈k^× have nabs(t)<=1 and suppose τ(diag(tI_d,I_d)) acts on every w by c∈C. Then |c| nabs(t)^(d²/2)<=1. This is the full Bound predicate; do not silently assume irreducibility or strict inequality on nabs(t).

Put Z=diag(tI_d,I_d). It is parabolic with specified Levi projection. For m>=1 let K be principal congruence subgroup of level m. Iwahori factorization in the source gives κ=xyz for every κ∈K, with x upper unipotent, y Levi, z opposite unipotent, each in K. Conjugation Z^(-1)zZ keeps z in K: upper entries vanish, same-block entries unchanged, lower off-diagonal entries multiplied by t, whose valuation is <=1 in the multiplicative convention. Apply the same to z^(-1) to check the inverse congruence condition (conj_mem'). Therefore, for K-fixed induced function f, using right-translation action and right K-invariance,
    f(κZ)=f(xyZ(Z^(-1)zZ))=f(xyZ).
The normalized induction transformation law first for xyZ, then for xy, and f(xy)=f(1), give f(κZ)=μ f(1), with μ=δ_P^(1/2)(Z)c. The scalar action on all W is used here. The modulus formula uses determinant t^d with exponent d on the first block and determinant 1 with exponent -d on the second; δ_P(Z)=nabs(t)^(d²). This is the native zval and modulus_scalar_block derivation; Iwahori factorization itself remains a named imported obligation.

## 4. Evaluation, finite-dimensional eigenvalue and contraction

Choose u≠0 in W. Native exists_indSp_apply_one supplies f with f(1)=u; smoothness/admissibility and congruence neighborhood basis give m=m0+1>=1 with f K-fixed. K is compact open, and E=π^K finite-dimensional by admissibility. Put H=K∩ZKZ^(-1), as subgroup of K. It is open in compact K, so K/H is finite (left cosets, not assumed normal). For a choice of coset reps q define
    A v = (1/[K:H]) sum_q π(q)π(Z)v.
For v∈E, π(Z)v is H-fixed by conjugation. Left multiplication permutes cosets, so Av∈E. The zval identity yields ev(Av)=μ ev(v) for ev(v)=v(1), on E. Since ev(f)=u≠0, A|E-μI is not surjective (its image lies in ker ev). Equal finite dimension implies noninjective, giving v≠0 with Av=μv. Do not assume f is that eigenvector or that its evaluation is nonzero; the proof only needs existence of some eigenvector.

Let B be the positive invariant Hermitian form from unitarisability; x=π(Z)v and w=μv=Av. Every coset representative fixes w. Consequently
    B(w,w)=average B(π(q)x,w)=B(x,w),
    B(x,x)=B(v,v), B(w,w)=|μ|² B(v,v).
Hermiticity and nonnegativity of B(x-w,x-w) give
    0<=B(v,v)-B(w,w)=(1-|μ|²)B(v,v).
The last factor is strictly positive; hence |μ|<=1. Substitute μ, positive modulus and sqrt(a^(d²))=a^(d²/2) for a=nabs(t)>0. This proves BoundB.bound_main and boundB. It does not need a Hilbert completion, a normal H, or a norm estimate on a nonunitary representation. In the prior chapter t is selected with strict nabs(t)<1 and d>0 to get the contradiction at s=d. Those stricter guards occur in the consumer, not in Bound itself.

## 5. Evidence, typed graph and limitations

Executed V8 source matching against five pinned connector blob IDs and literal anchors, finite integer regressions and graph reachability. Exact output: {"sourceFiles":5,"anchors":62,"nodes":29,"edges":31,"radical":63024,"project":40401,"lift":15625,"valuation":6888,"negative":5,"graphNeg":2}. Regressions validate radical inequality, projection norm identity, finite-dimensional eigenvalue witness in a small matrix family and valuation divisibility model. They are not proof of the imported infinite-dimensional/local-field facts. Five mathematical weakening controls are explicit elementary witnesses, two graph corruptions actually rejected. No independent Lean replay, byte-level local rehash or new CI verdict; no URT speed claim. Imported Mathlib and local producer leaves remain open; no axiom set discarded. Upstream comparisons at same paths recorded below, not proof of revision equivalence.

Reproduce with Node: paste and invoke the function below. Source ledger in JSON gives paths, exact blob IDs and representative source anchors. On upstream clone compare git rev-parse PIN:PATH and git show PIN:PATH; connector compared reported blob IDs, not recomputed raw byte hash.

```js
function regression(){
 const ck=(v,m)=>{if(!v)throw Error(m)};let radical=0,project=0,lift=0,valuation=0,negative=0;
 // Multiply the radical contradiction by (|b|+1)^2, keeping integers.
 for(let b=-50;b<=50;b++)for(let re=-12;re<=12;re++)for(let im=-12;im<=12;im++){let d=re*re+im*im;if(!d)continue;let den=Math.abs(b)+1;ck(d*(-2*den+b)<0,"semidefinite null diagonal forces cross term zero");radical++}
 // Average two isometries (identity and swap). For x=(a,b), w=(a+b)/2*(1,1), verify
 // 4||x-w||²=4(||x||²-||w||²) and orthogonality in scaled integer coordinates.
 for(let a=-100;a<=100;a++)for(let b=-100;b<=100;b++){let q=a+b;let left=(2*a-q)**2+(2*b-q)**2;let right=4*(a*a+b*b)-2*q*q;ck(left===right&&right>=0&&(2*a-q)*q+(2*b-q)*q===0,"projection norm");project++}
 // ev=(1,0) and A=[[mu,0],[c,d]]. ev A=mu ev, so mu is eigenvalue, even if eigenvector lies in ker ev.
 for(let mu=-12;mu<=12;mu++)for(let c=-12;c<=12;c++)for(let d=-12;d<=12;d++){let x=mu===d?0:mu-d,y=mu===d?1:c;ck(x!==0||y!==0,"nonzero");ck(mu*x===mu*x&&c*x+d*y===mu*y,"lift");lift++}
 // Integral model for lower block contraction; v_p(t)>=0 preserves p^m divisibility.
 for(const p of [2,3,5,7])for(let m=1;m<=6;m++)for(let r=0;r<=6;r++)for(let a=-20;a<=20;a++){const mod=BigInt(p)**BigInt(m);let z=BigInt(a)*mod,t=BigInt(p)**BigInt(r);ck(z*t%mod===0n,"congruence");valuation++}
 // Explicit witnesses for missing hypotheses, not counterexamples to source theorem.
 ck(1>0&&-1<0,"diag(1,-1), identity family: nonsimple permits indefinite forms");negative++;
 ck(1>0&&0===0,"diag(1,0) semidefinite but degenerate");negative++;
 ck(2*2>1,"A=2 on C with no unitarity");negative++;
 ck(8%4===0&&2%4!==0,"p=2,m=2, t=1/4 can break contraction");negative++;
 ck(0===0&&2!==1,"zero evaluation map on A=2 cannot force mu=1");negative++;
 return {radical,project,lift,valuation,negative};
}
console.log(regression());
```

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "root": "red",
  "scope": "selected typed obligation links; not complete kernel references or full proof; some grouped/transitive links",
  "nodes": [
    {
      "id": "red",
      "kind": "theorem",
      "declaration": "redClC",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "status": "SOURCE-MATCHED PRIOR",
      "requires": [
        "comp",
        "bound",
        "otherRed"
      ]
    },
    {
      "id": "comp",
      "kind": "theorem",
      "declaration": "complementary_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "status": "SOURCE-MATCHED PRIOR",
      "requires": [
        "sig",
        "otherComp"
      ]
    },
    {
      "id": "sig",
      "kind": "theorem",
      "declaration": "signature",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "ker",
        "uniq",
        "real",
        "pos",
        "open",
        "normal",
        "lim",
        "clopen"
      ]
    },
    {
      "id": "ker",
      "kind": "theorem",
      "declaration": "Sig.ker_bot",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "uniq",
      "kind": "theorem",
      "declaration": "Sig.uniq",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "ker",
        "eig"
      ]
    },
    {
      "id": "real",
      "kind": "theorem",
      "declaration": "Sig.real_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "pos",
      "kind": "theorem",
      "declaration": "Sig.pos_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "open",
      "kind": "theorem",
      "declaration": "Sig.pos_open",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "compactSphere"
      ]
    },
    {
      "id": "normal",
      "kind": "theorem",
      "declaration": "Sig.normalize",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "gram"
      ]
    },
    {
      "id": "lim",
      "kind": "theorem",
      "declaration": "Sig.lim_form",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "gram",
        "compactSphere"
      ]
    },
    {
      "id": "bound",
      "kind": "theorem",
      "declaration": "boundB",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "main"
      ]
    },
    {
      "id": "main",
      "kind": "theorem",
      "declaration": "BoundB.bound_main",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "zval",
        "ineq",
        "mod",
        "avg",
        "fix",
        "indEval",
        "congBasis",
        "finiteQuot"
      ]
    },
    {
      "id": "zval",
      "kind": "theorem",
      "declaration": "BoundB.zval",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "conj",
        "iwahori"
      ]
    },
    {
      "id": "conj",
      "kind": "theorem",
      "declaration": "BoundB.conj_mem'",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "conj1"
      ]
    },
    {
      "id": "conj1",
      "kind": "theorem",
      "declaration": "BoundB.conj_mem",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "ineq",
      "kind": "theorem",
      "declaration": "BoundB.ineq",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "mod",
      "kind": "theorem",
      "declaration": "BoundB.modulus_scalar_block",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "avg",
      "kind": "theorem",
      "declaration": "BoundB.avL_fixed",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "fix",
      "kind": "theorem",
      "declaration": "BoundB.hfixH",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "gram",
      "kind": "definition and lemmas",
      "declaration": "Sig.gram, mk, expand, mk_gram, gram_mk",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "otherRed",
      "kind": "premise bundle",
      "declaration": "compact, herm_ofB, conjProd, conjDual, prodModel, cuspUnit, cuspPairIrr",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "status": "OPEN OR PRIOR PARTIAL",
      "requires": []
    },
    {
      "id": "otherComp",
      "kind": "premise bundle",
      "declaration": "averaging, admissibility, invariant form and smoothness inputs",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "status": "PRIOR PARTIAL",
      "requires": []
    },
    {
      "id": "eig",
      "kind": "imported theorem",
      "declaration": "Module.End.exists_eigenvalue",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "compactSphere",
      "kind": "imported theorem",
      "declaration": "isCompact_sphere and subsequence/compact-uniform positivity lemmas",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "clopen",
      "kind": "imported theorem",
      "declaration": "isPreconnected_Ici, IsClopen.eq_univ",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "indEval",
      "kind": "imported theorem",
      "declaration": "GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "congBasis",
      "kind": "imported theorem bundle",
      "declaration": "GroundTheory.Automorphic.GLnLocal.hasBasis_nhds_one, compactness, antitone and congruence tests",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "finiteQuot",
      "kind": "imported theorem",
      "declaration": "Subgroup.quotient_finite_of_isOpen and finite-dimensional injective iff surjective",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "iwahori",
      "kind": "imported theorem",
      "declaration": "GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization'",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    }
  ],
  "sourceLedger": [
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/Complementary.lean",
      "blob": "cdcb4ad9486adfa4d5b9444d833141ad9518a2d0",
      "anchors": [
        "def Signature : Prop",
        "Function.Surjective ι",
        "def Bound : Prop",
        "[Nontrivial W]",
        "IsAdmissible (parInd (blk2 d) τ)",
        "IsUnitarisable (parInd (blk2 d) τ)",
        "nabs k t ≤ 1",
        "def Complementary : Prop"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "blob": "dc54f7d3f4921d7add75e4938a994af9900d19b1",
      "anchors": [
        "theorem ker_bot",
        "theorem inv_sub",
        "theorem uniq",
        "Module.End.exists_eigenvalue A",
        "theorem real_of",
        "theorem pos_of",
        "1 / (|(B w w).re| + 1)",
        "theorem pos_open",
        "eventually_forall_of_forall_eventually",
        "theorem normalize",
        "theorem lim_form",
        "tendsto_subseq",
        "tendsto_nhds_unique",
        "theorem signature : Signature",
        "let D : Set ℝ",
        "have hcl : IsClosed P",
        "have hop : IsClosed Pᶜ",
        "IsClopen.eq_univ",
        "obtain ⟨σ, hσ⟩",
        "rcases lt_or_gt_of_ne hc0"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "blob": "35e0cd0ce0af5c0c7abb7be0351d14743a2f5321",
      "anchors": [
        "theorem val_le_one",
        "def Zt",
        "theorem leviProj_Zt",
        "theorem conj_mem",
        "theorem conj_mem'",
        "theorem avL_fixed",
        "theorem hfixH",
        "theorem ineq",
        "have hA : B w w = B x w",
        "have hpos : 0 ≤",
        "theorem zval",
        "congruenceSubgroup_iwahoriFactorization'",
        "theorem modulus_scalar_block",
        "theorem bound_main : Bound k",
        "exists_indSp_apply_one",
        "hasBasis_nhds_one",
        "haveI hfd",
        "quotient_finite_of_isOpen",
        "let A'",
        "let evI",
        "have hev",
        "let S",
        "have hns",
        "have hni",
        "have hμ := ineq",
        "Real.sqrt_eq_rpow",
        "theorem boundB"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "blob": "168c1aea2166006780855063060e567f700901ad",
      "anchors": [
        "theorem complementary_of (h : Signature)",
        "rcases h G W (fun g => g⁻¹)",
        "hinvW",
        "hresne"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "blob": "edef839707f5530496e6d41f642809d6f8ef78aa",
      "anchors": [
        "theorem redClC",
        "someRed_of k (complementary_of signature) (compact k) (boundB k)",
        "theorem rhoNuRhoReducibleC"
      ]
    }
  ],
  "headObservations": [
    [
      "Complementary.lean",
      "efa6e6da58bdcf3de9cc4b96409c3a82c0c01e98",
      "changed blob, no semantic equivalence claimed"
    ],
    [
      "PosMkIff.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "BoundB.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "ComplementaryOf.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "2bea20d3d259ec562afda4c716e33f467b77df5b",
      "changed blob, no semantic equivalence claimed"
    ]
  ]
}
```

Graph verification (source-visible links only, not complete dependency closure):

```js
const ck=(v,m)=>{if(!v)throw Error(m)};
function graphcheck(ns){let m=new Map(ns.map(n=>[n[0],n]));ck(m.size===ns.length,"duplicate");const visiting=new Set(),seen=new Set();function visit(id){ck(m.has(id),"missing "+id);ck(!visiting.has(id),"cycle");if(seen.has(id))return;visiting.add(id);for(const d of m.get(id)[5])visit(d);visiting.delete(id);seen.add(id)}visit("red");ck(seen.size===m.size,"orphan");return {nodes:seen.size,edges:ns.reduce((a,n)=>a+n[5].length,0)}}
// Convert JSON nodes to [id,kind,declaration,path,status,requires] and call graphcheck.
```

RESUME HERE: reconstruct the native supplier of GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one and GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization' from their actual pinned imports (not classical assertions alone). Request exact tagged membership and direct role witnesses for PositivityTheory.RgGu.NR.signature, PositivityTheory.RgGu.NR.BoundB.bound_main, PositivityTheory.RgGu.NR.boundB and PositivityTheory.RgGu.NR.Sig.lim_form; do not infer Main-reachability. HANDOFF TO dependency, kernel, audit, editor, integration. Full project OPEN. Preserve all unrelated records.
