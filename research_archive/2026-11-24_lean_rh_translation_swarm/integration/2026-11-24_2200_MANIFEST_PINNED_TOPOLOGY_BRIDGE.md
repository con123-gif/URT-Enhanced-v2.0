# Manifest-pinned Mathlib topology bridge — integration 22:00

2026-11-24. RESULT: SOURCE-MATCHED / PARTIAL. Exactly one contribution: expand the four external suppliers of [the 21:00 GL topology argument](2026-11-24_2100_GL_TOPOLOGY_INTEGRAL_LIFT.md), without treating standard library lemmas as new RH-specific mathematics. RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged. The pinned lake-manifest.json binds Mathlib to 0df444a360eaa60ab8c11dca51a86af692955474; not current Mathlib main.

## Human reconstruction and exact premises

**1. Recover the unit topology from one coordinate (Units.isEmbedding_val_mk').** Let M be a monoid with a topology, not necessarily commutative and without assuming continuous multiplication for this particular lemma. The topology on Mˣ is induced by e(u)=(u.val,op(u.inv)); the map is injective since a two-sided inverse is unique. In the native topology_eq_inf this is the infimum of the two induced topologies. Suppose f:M→M is continuous on the subset of unit elements and f(u.val)=u.inv for every unit u. In the topology induced by val alone, val is continuous as a map into that subset, and composition with the restriction of f is continuous. Thus the second coordinate is already continuous for the first induced topology. The infimum equals that first topology (native proof: inf_eq_left, continuous_iff_le_induced and neighbourhood-filter characterization of continuousOn). Hence val is inducing and injective, so an embedding. Neither global continuity of f nor continuous multiplication of M is required here. Do not confuse this with the distinct closed-embedding theorem.

**2. Closedness of the two-coordinate embedding (Units.isClosedEmbedding_embedProduct).** Now require T1Space M and ContinuousMul M in addition to the monoid and topology. Its range is exactly the pairs (a,op b) satisfying ab=1 and ba=1: one direction follows from unit equations; the other constructs the unit with value a and inverse b. Both maps (a,op b)→ab and →ba are continuous by continuity of multiplication and unop. The singleton {1} is closed by T1, so the intersection of their inverse images is closed. Combine with isEmbedding_embedProduct. Both equations must remain: on the vector space of finitely supported sequences, right shift S(e_i)=e_(i+1) and left shift L(e_0)=0, L(e_(i+1))=e_i satisfy LS=I but SL≠I. This is why the source range is a two-equation set. This closed embedding, not an arbitrary continuous map, lets SplitFlip.isCompact_KO pull back the compact product O^(n×n) × op(O^(n×n)). Explicitly intersect the compact product with the closed range, then transport by the inverse homeomorphism of the embedding. The same closed embedding supplies locallyCompact_GL; no assertion that arbitrary continuous preimages preserve compactness.

**3. Matrix inverse continuity (continuousAt_matrix_inv).** Let R be a commutative topological ring, n finite with decidable equality, A a square matrix. The imported lemma assumes continuity at det(A) of Ring.inverse, the totalized ring inverse (zero on nonunits); it does NOT assume that A is invertible in its general statement. For any continuous matrix-valued function, determinant is continuous because its Leibniz expansion is a finite sum of finite products of continuous coordinates with constant signs. The adjugate entries are continuous using the transpose and column-replacement determinant formula: replacing one coordinate by a continuous vector is continuous coordinatewise. Matrix.inv_def is A⁻¹=Ring.inverse(det A) • adj(A). Compose scalar inverse with determinant and multiply by the continuous adjugate; this proves the stated conditional continuity at A. For the native GL application R=k is a field, det(A)≠0 for units, and Ring.inverse_eq_inv' identifies scalar inverse with field inverse, continuous there. The source therefore obtains continuity on the unit locus, as needed in step 1. At singular A no field-inverse continuity is inferred: over R, 1/n→0 but its inverse n is unbounded (inverse at zero is totalized to zero).

**4. Properness and second countability.** For a nontrivially normed field k with WeaklyLocallyCompactSpace, choose r>0 with compact closed ball B̄(0,r), and c with ||c||>1. In particular c≠0. Multiplication by c^n is continuous and sends that ball *onto* B̄(0,||c||^n r). Forward inclusion follows from multiplicative norm; reverse inclusion divides by the nonzero c^n and uses ||c⁻ⁿ||=||c||⁻ⁿ. Thus every such scaled ball is compact. Their radii tend to infinity since ||c||>1 and r>0. For arbitrary centre a and radius R, choose n with ||c||^n r≥R+dist(a,0); triangle inequality puts B̄(a,R) inside the compact ball at zero. The former is closed, hence compact. This is precisely ProperSpace.of_seq_closedBall. Its general source allows a nontrivial filter and eventual compactness, not only a sequence. For any proper pseudometric space, if nonempty choose x and cover by compact integer-radius balls; if empty, the constant empty cover works. Sigma-compact pseudometric spaces are second countable by the imported EMetric theorem. In the local field consumer, the native source installs the right additive uniform space, uniform additive group, and a rank-one valuation by composing the strict embeddings of the value group into the rank-one ordered group. The scoped Valued instances give the nontrivially normed field and compatible topology; the properness lemma then gives second countability, and the normed metric supplies T2. These rank-one/instance suppliers and EMetric.secondCountable_of_sigmaCompact are still explicit external obligations. This proof does not assume compactness of the whole field.

## Integration receipts and coverage

Read SWARM_PROTOCOL first, AGENTS, state and actual runner log/protocol, continuity, HANDOFF_QUEUE, preceding integration and peer records. Latest editor [21:56 manuscript](../specialists/proof_editor/2026-11-24_2156_INTEGRATED_MANUSCRIPT.md): 152 primary + 11 supporting entries, before this contribution, editorial counts not unique translated declarations. General Cathedral CI checkpoint 397 [PASS](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45491695921) 21:52:39 UTC; not RH verification. Source read receipts: 9/9 connector-reported blobs matched; 19 distinct source anchors located; manifest checked; 20 graph nodes and 40 edges validated for references and acyclicity. No independent byte-hash replay, Lean execution or kernel membership claim. This graph is a delta for the existing chapter, not a full dependency tree.

Peer checkpoints: dependency rh_literature_theta_frontier.mjs requests 71-target report; kernel run15_slot_and_record_audit.mjs requires exact role multiplicities, structural slots and retained root IDs; acceleration role_delta_run15.mjs reports 71 projected owners, 23 observed root-reachable owners, 15,553 typed edges (reported by peer, not rerun here); structure 2124 requests positive recursor slot support; audit sum_Th normalization retains separate denominator/positivity guards; math ext_iff_units_map_provenance returns to character chain. Specialist latest RESUME: character boxes RUN15 hom Θ, Galois RUN15 PlanEx, Landau RUN15 boundary nonvanishing, literature RUN15 crystalline totality, geometry RUN16 polynomial growth off hypersurface, prime RUN15 adm5, theta RUN15 holomorphic_translation_levi, editor 2156. Nested Grok sub-lanes listed but not all nested handoffs read; some earlier dependency/math/acceleration checkpoint selections superseded by the named scripts above. No claim of full index completeness. Keep kernel/source-matched statuses separate, and do not merge by target set alone.

Failed retrieval attempts: root RESEARCH_PROTOCOL.md and RESEARCH_LOG.md 404 (correct runner paths retrieved); integration/RESUME_HERE.md 404 (actual 2100 dated file retrieved); Mathlib Topology/Algebra/Monoid/Units.lean, Topology/Algebra/Module/Matrix.lean, Analysis/Normed/Field/LocallyCompact.lean and Topology/Algebra/Group/WithZero.lean 404 (correct paths below retrieved); Group/Units.lean did not contain target lemma. Batch peer listing hit call cap, resumed remaining lanes in separate call. External blueprint not reread. No unrelated Cathedral changes.

## Typed JSON graph

```json
{
  "sourcePin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "mathlibPin": "0df444a360eaa60ab8c11dca51a86af692955474",
  "manifestBlob": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
  "scope": "selected human proof obligations; root membership and exact axiom dependencies not established",
  "files": [
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "lake-manifest.json",
      "blob": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f"
    },
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/T2SpaceGeneralLinearGroup.lean",
      "blob": "141a89b315186ad19bd50a06f2945f52a87c4c91"
    },
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/SecondCountableAndT2LocalField.lean",
      "blob": "829125937719426936bae9f8be35ee5f482e05bd"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Algebra/Constructions.lean",
      "blob": "307e68a576fa997ce6677d1219fe29e62ec0efe4"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Algebra/Group/Basic.lean",
      "blob": "a726f7cc3df5fe4d8a70b071a793068c901e6c6b"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Instances/Matrix.lean",
      "blob": "b02644070922146b8f92be6270841947440fc5b4"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean",
      "blob": "b3ea61392d1cea6611deddfcf2c1da7938f3d9e6"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Analysis/Normed/Field/ProperSpace.lean",
      "blob": "22555e6cc03fcc58e26ad383fa1ae95e859fb022"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/MetricSpace/ProperSpace.lean",
      "blob": "818ccb53b6b04d544d55007586b54ee21b3f5c45"
    }
  ],
  "nodes": [
    {
      "id": "top",
      "file": 3,
      "line": 101,
      "anchor": "instance instTopologicalSpaceUnits",
      "kind": "instance",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inducing",
      "file": 3,
      "line": 105,
      "anchor": "theorem isInducing_embedProduct",
      "kind": "lemma",
      "requires": [
        "top",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "pair_embed",
      "file": 3,
      "line": 108,
      "anchor": "theorem isEmbedding_embedProduct",
      "kind": "lemma",
      "requires": [
        "inducing",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inf",
      "file": 3,
      "line": 118,
      "anchor": "lemma topology_eq_inf",
      "kind": "lemma",
      "requires": [
        "inducing",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "projection",
      "file": 3,
      "line": 128,
      "anchor": "lemma isEmbedding_val_mk'",
      "kind": "lemma",
      "requires": [
        "inf",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "pair_range",
      "file": 4,
      "line": 1410,
      "anchor": "theorem range_embedProduct",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "closed_pair",
      "file": 4,
      "line": 1422,
      "anchor": "theorem isClosedEmbedding_embedProduct",
      "kind": "lemma",
      "requires": [
        "pair_embed",
        "pair_range",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "det",
      "file": 5,
      "line": 213,
      "anchor": "theorem Continuous.matrix_det",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "update",
      "file": 5,
      "line": 220,
      "anchor": "theorem Continuous.matrix_updateCol",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "adj",
      "file": 5,
      "line": 239,
      "anchor": "theorem Continuous.matrix_adjugate",
      "kind": "lemma",
      "requires": [
        "det",
        "update",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inv_def",
      "file": 6,
      "line": 172,
      "anchor": "theorem inv_def ",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inv",
      "file": 5,
      "line": 246,
      "anchor": "theorem continuousAt_matrix_inv",
      "kind": "lemma",
      "requires": [
        "det",
        "adj",
        "inv_def",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "proper_seq",
      "file": 8,
      "line": 84,
      "anchor": "theorem ProperSpace.of_seq_closedBall",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "proper",
      "file": 7,
      "line": 37,
      "anchor": "lemma ProperSpace.of_nontriviallyNormedField_of_weaklyLocallyCompactSpace",
      "kind": "lemma",
      "requires": [
        "proper_seq",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "second",
      "file": 8,
      "line": 66,
      "anchor": "secondCountable_of_proper [ProperSpace",
      "kind": "instance",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "field",
      "file": 2,
      "line": 44,
      "anchor": "theorem secondCountable_and_t2_local_field",
      "kind": "RH consumer",
      "requires": [
        "proper",
        "second",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "gl",
      "file": 1,
      "line": 31,
      "anchor": "theorem isEmbedding_val_GL",
      "kind": "RH consumer",
      "requires": [
        "field",
        "projection",
        "inv",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "ko",
      "file": 1,
      "line": 73,
      "anchor": "theorem isCompact_KO",
      "kind": "RH consumer",
      "requires": [
        "field",
        "closed_pair",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "local_gl",
      "file": 1,
      "line": 47,
      "anchor": "instance locallyCompact_GL",
      "kind": "RH consumer",
      "requires": [
        "field",
        "closed_pair",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "external",
      "kind": "open imports",
      "requires": [],
      "status": "OPEN: primitive topology/filter lemmas, unit extensionality, scalar inversion, rank-one norm construction and instances, compact-ball existence, norm growth, sigma-compact second countability, typeclasses and exact axioms"
    }
  ]
}
```

## Executed regression

V8 exact integer algebra, {"matrixAdjugate":14641,"scaledBall":80000,"negative":3}. The 2×2 adjugate check and rational scaling are finite regressions of algebra, not proofs of continuity or compactness; the negative checks illustrate guards (the infinite shift and divergence arguments above are mathematical, not established by finite tests). No failing numerical cases. Save the following code as a .js file and run node. No CI verdict for this contribution yet.

```js
function certificate(){
 const out={matrixAdjugate:0,scaledBall:0,negative:0};
 const ck=(ok,msg)=>{if(!ok)throw Error(msg)};
 const mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]];
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 for(let a=-5;a<=5;a++)for(let b=-5;b<=5;b++)for(let c=-5;c<=5;c++)for(let d=-5;d<=5;d++){const A=[a,b,c,d],J=[d,-b,-c,a],D=a*d-b*c;ck(eq(mul(A,J),[D,0,0,D])&&eq(mul(J,A),[D,0,0,D]),"adjugate");out.matrixAdjugate++}
 // Rational ball scaling: x=i/j, c=u/v, r=a/b; compare |c*x| <= |c|*r with |x| <= r by exact cross products.
 for(let i=-12;i<=12;i++)for(let j=1;j<=8;j++)for(let u=1;u<=5;u++)for(let v=1;v<=5;v++)for(let a=1;a<=4;a++)for(let b=1;b<=4;b++){ck((Math.abs(u*i)*v*b<=u*a*v*j)===(Math.abs(i)*b<=a*j),"scale");out.scaledBall++}
 // One-sided inverse for shifts on finitely supported infinite sequences, checked on first 32 basis vectors.
 const S=i=>i+1,L=i=>i===0?-1:i-1;
 ck(Array.from({length:32},(_,i)=>L(S(i))===i).every(Boolean)&&L(0)===-1,"one-sided guard");out.negative++;
 // At singular zero, scalar inverse extended by zero cannot be continuous: n*(1/n)=1 and n>=2.
 ck(Array.from({length:32},(_,i)=>i+2).every(n=>n>1),"singular inversion guard");out.negative++;
 // Projection R -> point: inverse image of compact singleton contains all integers, no finite radius bounds it.
 ck(Array.from({length:32},(_,i)=>i+1).every(n=>n+1>n),"compact preimage guard");out.negative++;
 return out;
}
console.log(certificate());
```

**RESUME HERE:** trace the actual rank-one valuation-to-norm instance and topology compatibility used in Model.secondCountable_and_t2_local_field, but first check the next authenticated 71-target report for root-linked native consumers; if available prioritize those rather than recursively translating unrelated Mathlib. Request role-labelled root paths for SplitFlip.isEmbedding_val_GL, isCompact_KO, Model.secondCountable_and_t2_local_field, and CentralExponent.exists_cong_subset. HANDOFF TO dependency, kernel, editor, audit and integration. Full human proof OPEN; no URT advantage claimed.
