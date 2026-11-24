# Two-block reducibility and reversed Jacquet exclusion — 2026-11-24 17:00 UTC

RESULT SOURCE-MATCHED / PARTIAL. One integrated contribution continuing 1600_NATIVE_SEGMENT_PRODUCERS: derive the obstruction to irreducibility of adjacent cuspidal twists, and show precisely how it rules out the reversed fine Jacquet constituent. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream HEAD 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z), not substituted. This is conditional human reconstruction with open native leaves; no kernel replay.

## Project index / peer handoff

Read SWARM_PROTOCOL first; AGENTS, research state/log and runner protocol, continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, previous integration, dependency targeted-role witness, structure 1624, tied-core audit, math pair-share, RUN10 of all ten specialist lanes, Grok Green RUN8/Galois RUN6/final audit RUN8/covolume RUN2/native-family checkpoint. Latest physical CI checkpoint 381 PASS (45437036754, 16:46:03Z); does not certify this proof. Root RESEARCH_LOG.md and RESEARCH_PROTOCOL.md fetches returned 404, recovered correct runner paths. Directory endpoint returned empty content; recursive tree recovered lane paths. External blueprint and all nested historical checkpoints not reread.

Main reading index: END_OF_DAY_MANUSCRIPT_SPINE.md and ../specialists/proof_editor/2026-11-24_1656_INTEGRATED_MANUSCRIPT.md (volumes I–VII, 107 primary + seven supporting entries, not unique declarations or proof coverage). This chapter adds the next source-linked segment expansion. Peer status: kernel RUN10 isolated fresh/cached collector retry not executed there; dependency targeted-role and acceleration authenticated membership still pending native reconciliation; structure 1624 preserved projection job error; audit tied-core preserves subgroup/owner guards; math QH.pair_share proceeds to pair_exists; specialists character-box ReadL initial constructor, Galois frob_laws, Landau landau_coeff, literature tanS_away_lift, geometry complex_section_finite_combination, theta vacK_of, prime window loss_bound_at are separate open obligations. Green WJ/WhMul remain open; its mass companion is reported closed only in that companion. No duplicate peer work claimed. Full authenticated export statistics from 1600 chapter remain reported, not re-executed: 1,484,705 reachable declarations under conservative export policy, zero hard missing references, five metadata-only missing members; source-to-export equivalence and independent kernel replay remain open.

## 1. Why a reducibility point must occur

In the source notation x is a smooth irreducible cuspidal class of positive rank d, assumed unitarisable. Let nu be the normalized determinant absolute-value twist, P_s = prodIrr[x.nu(-s), x.nu(s)] for real s >= 0. SomeRed k asks for one such s for which P_s is not irreducible, universally over the rank equality witness. Suppose no such s exists. The negation yields an irreducibility witness at every nonnegative s; transport the rank equality to d+d (not an arbitrary rank).

Compact supplies a common representation space, compact open K0, and the family F_s equivalent to P_s by ProdModel. Its K0 action is constant, and each orbit is a finite real-exponential sum. Each P_s is smooth; by the assumed irreducibility the native admissibility theorem applies. Herm supplies a nonzero invariant sesquilinear form for each P_s, NOT positivity in advance. At s=0, the external tensor of two copies of x is unitarisable, the scalar character has norm one, and normalized induction preserves unitarisability. Transport all these data through the stated equivalences.

Complementary, produced from Signature by complementary_of, now gives unitarisability for every s>=0. Its proof compresses the action to each nonzero finite-dimensional K-fixed subspace W for open K<=K0 by averaging e; compactness/admissibility make W finite dimensional. The kernel of e annihilates W on both sides of every invariant form (span of group differences). Compressed action e F_s(g)|W is continuous by the finite exponential formula. It is simple: the span of the orbit of a nonzero vector in an invariant compressed subspace is all of V by irreducibility, and applying e gives all W. A nonzero invariant form restricts nontrivially because its radical is invariant and zero; use the averaging identity to move the second argument into W. Hermitian symmetrization and the initial positive form give the hypotheses of Signature. Signature forces each restriction definite, with either sign. For a fixed nonzero v1, intersect K0 with its stabilizer and then with each v's stabilizer: both nonzero vectors are in the same nonzero W, so their signs agree. Thus H or -H is positive on all nonzero vectors. This explains why local positivity becomes global; Signature itself remains an open leaf.

Now choose s=d and a field unit t with 0<a=nabs(t)<1. A smooth central character omega exists for x; evaluating an invariant positive form on a nonzero vector shows |omega(t)|=1 (do not assume it for an arbitrary central character). On the Levi block diag(t I_d,I_d) the twisted external tensor acts by c=chi(d,s,g) omega(t). On pure tensors this is immediate and it extends by tensor induction. Since det(t I_d)=t^d, |c|=a^(-ds). The proof establishes nontriviality of the tensor from irreducibility of the equivalent induced module before applying Bound. Bound, with smooth tensor, admissible and unitarisable induction, a<=1, and the scalar action, gives

  a^(-ds) a^(d*d/2) <= 1.

At s=d>0 the left side is a^(-d*d/2)>1, contradiction. This proves SomeRed conditional on the actual five inputs Complementary, Compact, Bound, Herm, ProdModel. No assertion that every P_s is unitarisable without the contradiction hypothesis, or that the bound alone supplies an existence theorem.

## 2. Why that point is exactly one half

CuspUnit expresses any positive-rank cuspidal y as rho.nu(z), z real, with rho cuspidal and unitarisable. Apply SomeRed to rho and retain its s>=0. CuspPairIrr says a pair of cuspidal classes u,v induces irreducibly provided v != u.nu(1) AND u != v.nu(1). In the pair u=rho.nu(-s), v=rho.nu(s), failure of irreducibility requires at least one equality. Real-twist injectivity at positive rank turns these respectively into s=-s+1 or -s=s+1. The second is impossible for s>=0, the first gives s=1/2. This is not an assumption of a first reducibility point or a topological threshold argument.

If prodIrr[y,y.nu(1)] were irreducible, twist both factors by t=-(z+1/2). The common twist is an equivalence of products up to the determinant character, preserves irreducibility, and changes the pair to [rho.nu(-1/2),rho.nu(1/2)]. Transport the rank proof using irr_congr and contradict SomeRed at its actual s. This is redCl_ofC. rhoNuRho_ofC transports actual segment terms via IrrGL.of, twistEquiv and multiProdEquiv, explicitly matches consecutive blocks with stdBlocks and the total rank 2d, and applies RedCl. rhoNuRhoReducibleC supplies the native inputs through redClC. CuspPairIrr itself comes from nuPair_of with derivative_jacquet_holds, jmTheta and derFin_of/derEquiv; those producer bodies remain separate obligations.

## 3. The saturation theorem is a separate step

For cuspidal x != y, P=prodIrr[x,y], and an injective intertwiner f:W->P, surjective_of_jm assumes BOTH ordered Jacquet multiplicities jm([x,y],W)>=1 and jm([y,x],W)>=1, with the rank equalities for both orders and IrreducibleAdmissibleGL. W is not assumed irreducible in this theorem.

If f is not surjective, Q=P/image(f) is nonzero, smooth and finite length. Choose a smooth irreducible quotient tau of Q. This is a subquotient of P. JacquetLeft.exists_embedding supplies two classes u with the first cuspidal and positive rank, a rank sum, and an injective map of tau into prodIrr(u). Frobenius multiplicity gives jm(u,tau)>=1 and subquotient monotonicity jm(u,tau)<=jm(u,P).

If the second rank is zero, the single-nonzero-factor product equivalence and irreducibility identify tau with a positive-rank cuspidal representation. CuspNotInd gives zero multiplicity of that class in P, impossible. This case cannot be removed by assuming both ranks positive at the start.

Otherwise both ranks are positive. The geometric lemma expresses jm(u,P) as a sum over cells, one nonzero term. For each row i the support multiset is the singleton {x_i}; its decomposition into column multisets must have exactly one nonempty slot r(i), the singleton itself. Every column has positive total rank, hence receives a nonempty slot. The row-to-column function is therefore a surjection between equal finite sets, a bijection. The column support is the single class assigned to it, and the native singleton-support theorem identifies u_j with that class. Consequently u is either [x,y] or [y,x]. The actual geometric-cell support transfer, rank sum and singleton-support identification are retained as native inputs, not proved by this finite combinatorial argument.

For either order v, the cuspidal-product multiplicity formula counts permutations matching that order with [x,y]. Distinctness x!=y gives at most one. The relevant assumption on W gives jm(v,W)>=1, and tau gives jm(v,tau)>=1. Exactness of Jacquet and multiplicity additivity give jm(v,P)=jm(v,W)+jm(v,Q), with jm(v,tau)<=jm(v,Q). Thus 2<=jm(v,P)<=1, contradiction, also valid for extended natural multiplicities. This establishes surjectivity. Neither positive multiplicity alone nor arbitrary distinct representations without cuspidality is sufficient.

## 4. Exclusion of the reversed constituent

In jhMult_rev_jac_sub the field is nonarchimedean local, d>0, sigma smooth irreducible cuspidal, S an irreducible subrepresentation of the two-term product, hG GeometricLemma, hR RhoNuRhoReducible, and h1 the ordered Jacquet multiplicity equals one. Suppose the reversed multiplicity is nonzero. Put x=IrrGL.of(sigma), use the two termwise twist equivalences to identify P with prodIrr[x,x.nu(1)], and compose the inclusion of S with this equivalence. The rank witnesses both equal 2d. Transport h1 and the supposed nonzero reversed multiplicity to jm lower bounds in the respective orders. Positive rank gives x!=x.nu(1) by natural-twist injectivity. Saturation then makes the inclusion surjective. Transport back through the product equivalence to conclude S=top as an actual subrepresentation. Irreducibility of S transfers through topEquiv to P, contradicting hR. Therefore reversed multiplicity is zero. hG is retained in the stated interface even though the proof uses the globally supplied geometric results through saturation.

In segTwo_of, uniqueness/multiplicity-one gives S, and the constituent theorem leaves only the ordered or reversed tensor. An equivalence to the latter would supply its nonzero subquotient multiplicity, just ruled out. FineStep gives an actual equivalence of the Jacquet module to the ordered tensor. This joins the 1600 chapter without changing its premises.

## 5. Executed tests / limits

Connector retrieval at pin checked 10 reported Git blob SHAs against fixed ledger and 95 exact source substring anchors. V8 exact finite regression and selected graph reachability executed in this run, with result {"source_files":10,"anchors":95,"nodes":31,"edges":32,"exponent":5050,"shift":2430,"bound":270,"split":405,"support":50069,"negative":5,"graph_negative":3}. Finite tests check only arithmetic, multiplicity and support logic, not infinite-dimensional representation theory. The source anchors are not kernel dependency edges. No independent reviewer accepted this chapter yet, no Lean replay, no independent blob-byte hash recomputation, no URT speed claim. New CI not yet known. Failed preflight paths recorded above; no arithmetic failure. The fifth negative control below explicitly illustrates a missing strict guard; it is not a counterexample to the actual source.

Reproduce exact finite checks in Node (paste the following function and call regress):

```js
function regress(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 let exponent=0,shift=0,bound=0,split=0,support=0,negative=0;
 // s=m/n, exact guards for y=x+1 or x=y+1
 for(let n=1;n<=50;n++)for(let m=0;m<=100;m++){
  let first=2*m===n,second=2*m===-n;
  ck(!second,"nonnegative s forbids second link");ck((first||second)===(2*m===n),"half");exponent++;
 }
 // all values scaled by 2n, z=a/n; shift t=-z-1/2.
 for(let n=1;n<=30;n++)for(let a=-40;a<=40;a++){
   let z=2*a,t=-2*a-n;ck(z+t===-n&&z+2*n+t===n,"common twist");shift++;
 }
 // nabs(t)=1/q^2, s=d; exact modulus times bound q^(d*d)>1.
 for(let d=1;d<=30;d++)for(let q=2;q<=10;q++){
   let Q=BigInt(q),e=BigInt(d*d);ck(Q**(2n*e)>Q**e&&Q**e>1n,"bound");bound++;
 }
 // Exact multiplicity constraint m(P)=m(W)+m(Q), m(tau)<=m(Q).
 for(let w=0;w<=8;w++)for(let q=0;q<=8;q++)for(let tau=0;tau<=q;tau++){
   let p=w+q;ck(!(p<=1&&w>=1&&tau>=1),"multiplicity");split++;
 }
 // one labelled singleton in each row; positive support in both columns forces permutation.
 for(let l=1;l<=6;l++){let n=l**l;for(let a=0;a<n;a++){let z=a,cols=Array(l).fill(0);for(let i=0;i<l;i++){cols[z%l]++;z=Math.floor(z/l)}if(cols.every(x=>x>0))ck(cols.every(x=>x===1),"permutation");support++}}
 ck(2*(-1)===-2,"negative s allows reverse link");negative++;
 ck(1+1===2,"remove multiplicity upper bound");negative++;
 ck(1+0===1,"remove quotient positivity");negative++;
 ck([2,0].some(x=>x===0),"remove positive column rank");negative++;
 ck(1===1,"nabs(t)=1 cannot yield strict contradiction");negative++;
 return {exponent,shift,bound,split,support,negative}
}
console.log(regress())
```

The graph is additive, scoped to this chapter; source references and open leaves are deliberately not treated as discharged.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "Selected source-visible obligation tree, not extracted kernel dependencies. Some edges transitive; shared leaves retained.",
  "root": "segTwo",
  "sources": [
    {
      "id": "seg",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/SegRepOf.lean",
      "blob": "a83f6f8d9e4e6e15c0d3e78294b7b0f14c954095",
      "anchors": [
        "theorem segTwo_of",
        "SRC.jhMult_rev_jac_sub hG hR",
        "jhMult_ne_zero_iff.2"
      ]
    },
    {
      "id": "rev",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/JhMultRevJacSub.lean",
      "blob": "7465f1a832b6a4d80caea2a4cd7b5a3467ccd6aa",
      "anchors": [
        "theorem jhMult_rev_jac_sub",
        "(hG : GeometricLemma) (hR : RhoNuRhoReducible)",
        "(hS : S.toRepresentation.IsIrreducible)",
        "= 1) :",
        "by_contra h2",
        "hA := GlobalTheory.CompanionTheory.BZCuspPair.irrAdm",
        "have hx : x.IsCusp",
        "have hf : Function.Injective f",
        "have j1 : 1 ≤ jm",
        "have j2 : 1 ≤ jm",
        "IrrGL.nu_natCast_inj hd",
        "CuspPairSub.surjective_of_jm",
        "have hι : Function.Surjective ι",
        "have htop : S = ⊤",
        "exact hR k d hd σ hσ"
      ]
    },
    {
      "id": "red",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoOfC.lean",
      "blob": "e69c5128ca987d48041e406455512cd7b1a4f242",
      "anchors": [
        "theorem redCl_ofC",
        "(h1 : SomeRed k) (h2 : CuspUnit k) (h3 : GlobalTheory.BZSeg.CuspPairIrr k)",
        "obtain ⟨ρ, z, hρ, hu, rfl⟩",
        "obtain ⟨s, hs0, hs⟩",
        "have hs2 : s = 1 / 2",
        "IrrGL.nu_ofReal_inj hpos",
        "set t : ℂ := -((z : ℂ) + 1 / 2)",
        "irr_congr key hd",
        "irr_tw _ hd t hirr",
        "theorem rhoNuRho_ofC",
        "multiProdEquiv",
        "consecBlocks_val",
        "stdBlocks_val",
        "exact h k y hyc"
      ]
    },
    {
      "id": "redroot",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "blob": "edef839707f5530496e6d41f642809d6f8ef78aa",
      "anchors": [
        "theorem redClC",
        "someRed_of k (complementary_of signature)",
        "(compact k) (boundB k)",
        "(herm_ofB k (conjProd k) (conjDual k))",
        "(prodModel k)) (cuspUnit k) (cuspPairIrr k)",
        "theorem rhoNuRhoReducibleC"
      ]
    },
    {
      "id": "some",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SomeRed.lean",
      "blob": "75812479af7b72b9290d3c111190ec6654fd2798",
      "anchors": [
        "theorem someRed_of",
        "push_neg at hcon",
        "have hirr : ∀ s : ℝ, 0 ≤ s",
        "obtain ⟨K₀, F, hKo, hKc, hF, hFe⟩",
        "have hU0 : IsUnitarisable (F 0)",
        "have hUs := h1",
        "set s : ℝ := (d : ℝ)",
        "exists_smooth_hasCentralChar",
        "exists_nabs_lt_one",
        "have hω1",
        "have hW : Nontrivial",
        "have hb := h3",
        "have hnc : ‖c‖ = nabs k t ^ (-((d : ℝ) * s))",
        "Real.one_lt_rpow_of_pos_of_lt_one_of_neg"
      ]
    },
    {
      "id": "defs",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/Complementary.lean",
      "blob": "cdcb4ad9486adfa4d5b9444d833141ad9518a2d0",
      "anchors": [
        "def Complementary : Prop",
        "def Compact : Prop",
        "def Bound : Prop",
        "def Herm : Prop",
        "def ProdModel : Prop",
        "def CuspUnit : Prop",
        "def SomeRed : Prop",
        "def RedCl : Prop",
        "Function.Surjective ι"
      ]
    },
    {
      "id": "pair",
      "path": "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/CuspidalPairSubGeneric.lean",
      "blob": "814a2b78940cfd6f6b24c02109d10987d2e09607",
      "anchors": [
        "theorem exists_eq_singleton_of_sum'",
        "theorem exists_equiv_of_cell",
        "have hsurj : Function.Surjective r",
        "theorem exists_equiv_of_jm_ne_zero",
        "theorem jm_le_one",
        "theorem false_of_sub_quot",
        "jhMult_jac_exact",
        "(1 : ℕ∞) + 1 ≤ 1",
        "theorem surjective_of_jm",
        "(hne : x ≠ y)",
        "(h1 : 1 ≤ jm",
        "(h2 : 1 ≤ jm",
        "exists_irreducible_smooth_quotient",
        "JacquetLeft.exists_embedding",
        "by_cases hz : (u 1).1 = 0",
        "CuspNotInd.jhMult_eq_zero_of_isCusp",
        "exists_equiv_of_jm_ne_zero ![x, y]",
        "exact false_of_sub_quot ![x, y]",
        "exact false_of_sub_quot ![y, x]"
      ]
    },
    {
      "id": "pairdef",
      "path": "src/Development/WeilBound/CoreStatements/TemperedRepresentationTheory/MirabolicDerivatives/SegmentCuspLines/CuspLinesIrr.lean",
      "blob": "71acaca30a8afc83843f118b87aa8e70a176d2b2",
      "anchors": [
        "def CuspPairIrr : Prop",
        "y ≠ x.nu 1 → x ≠ y.nu 1"
      ]
    },
    {
      "id": "pairirr",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/CuspPairIrr.lean",
      "blob": "bc4303f043cbf390141c7ae44345cdf2cad4c143",
      "anchors": [
        "theorem nuPair",
        "derivative_jacquet_holds",
        "(jmTheta k) (derFin_of k (derEquiv k))",
        "theorem cuspPairIrr",
        "cuspPairIrr_of k (nuPair k)"
      ]
    },
    {
      "id": "compl",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "blob": "168c1aea2166006780855063060e567f700901ad",
      "anchors": [
        "theorem complementary_of (h : Signature)",
        "have hsimple",
        "have hforms",
        "have hpos0",
        "rcases h G W",
        "let K₁ : Subgroup G",
        "let Kv : Subgroup G",
        "refine ⟨-H"
      ]
    }
  ],
  "nodes": [
    {
      "id": "segTwo",
      "kind": "consumer",
      "source": "seg",
      "declaration": "segTwo_of",
      "dependencies": [
        "reverse",
        "unique",
        "fine"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "reverse",
      "kind": "theorem",
      "source": "rev",
      "declaration": "jhMult_rev_jac_sub",
      "dependencies": [
        "pairSat",
        "reducible",
        "twistDistinct",
        "repTransport"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "pairSat",
      "kind": "theorem",
      "source": "pair",
      "declaration": "surjective_of_jm",
      "dependencies": [
        "properQuot",
        "leftEmbedding",
        "cuspExclusion",
        "perm",
        "multSplit"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "properQuot",
      "kind": "obligation",
      "source": "pair",
      "declaration": "finite length + nonzero smooth irreducible quotient",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "leftEmbedding",
      "kind": "obligation",
      "source": "pair",
      "declaration": "JacquetLeft.exists_embedding + FrobJm.one_le_jm + JmMono",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "cuspExclusion",
      "kind": "obligation",
      "source": "pair",
      "declaration": "rank-zero second block: ProdSingle + CuspNotInd",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "perm",
      "kind": "theorem",
      "source": "pair",
      "declaration": "exists_equiv_of_jm_ne_zero",
      "dependencies": [
        "cell",
        "geomLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "cell",
      "kind": "theorem",
      "source": "pair",
      "declaration": "exists_equiv_of_cell",
      "dependencies": [
        "supportLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "multSplit",
      "kind": "theorem",
      "source": "pair",
      "declaration": "false_of_sub_quot",
      "dependencies": [
        "multCap",
        "exactLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "multCap",
      "kind": "theorem",
      "source": "pair",
      "declaration": "jm_le_one",
      "dependencies": [
        "jacFormula"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "reducible",
      "kind": "theorem",
      "source": "redroot",
      "declaration": "rhoNuRhoReducibleC",
      "dependencies": [
        "redCl"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "redCl",
      "kind": "theorem",
      "source": "red",
      "declaration": "redCl_ofC + rhoNuRho_ofC",
      "dependencies": [
        "someRed",
        "cuspUnit",
        "pairIrr",
        "twistDistinct",
        "repTransport"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "someRed",
      "kind": "theorem",
      "source": "some",
      "declaration": "someRed_of",
      "dependencies": [
        "complementary",
        "compact",
        "bound",
        "herm",
        "prodModel",
        "centralChar"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "complementary",
      "kind": "theorem",
      "source": "compl",
      "declaration": "complementary_of",
      "dependencies": [
        "signature"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "pairIrr",
      "kind": "theorem",
      "source": "pairirr",
      "declaration": "cuspPairIrr",
      "dependencies": [
        "nuPair"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "nuPair",
      "kind": "obligation",
      "source": "pairirr",
      "declaration": "nuPair_of + derivative_jacquet_holds + jmTheta + derFin",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "signature",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "signature",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "compact",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "compact k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "bound",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "boundB k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "herm",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "herm_ofB + conjProd + conjDual",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "prodModel",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "prodModel k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "cuspUnit",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "cuspUnit k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "centralChar",
      "kind": "open_leaf",
      "source": "some",
      "declaration": "central character, invariant positive form, exists_nabs_lt_one",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "twistDistinct",
      "kind": "open_leaf",
      "source": "rev",
      "declaration": "positive-rank nu_natCast_inj / nu_ofReal_inj",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "repTransport",
      "kind": "open_leaf",
      "source": "rev",
      "declaration": "prodIrr transport, twist, topEquiv",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "geomLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "geometric lemma and finite filtration",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "supportLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "support transport and singleton support identification",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "exactLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "jhMult_jac_exact and quotient subquotient monotonicity",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "jacFormula",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "jacquet_multiplicity_cuspidal_product",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "unique",
      "kind": "open_leaf",
      "source": "seg",
      "declaration": "exists_unique_irred_sub (prior 1600 chapter)",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "fine",
      "kind": "open_leaf",
      "source": "seg",
      "declaration": "FineStep.nonempty_equiv_of_jhMult_eq_one (prior 1600 chapter)",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    }
  ]
}
```

Graph regression (paste the JSON as variable graph):
```js
function validate(ns){let m=new Map(ns.map(x=>[x.id,x]));if(m.size!==ns.length)throw Error("duplicate");let seen=new Set(),active=new Set();function go(id){if(!m.has(id)||active.has(id))throw Error("missing or cycle "+id);if(seen.has(id))return;active.add(id);for(let dep of m.get(id).dependencies)go(dep);active.delete(id);seen.add(id)}go("segTwo");if(seen.size!==ns.length)throw Error("orphan");return seen.size}
console.log(validate(graph.nodes))
```

RESUME HERE: reconstruct native Signature producer and BoundB estimate (from RhoNuRhoReducibleC imports); first obtain their actual proofs and retain finite-dimensional normalization and compact-open averaging hypotheses. Do not repeat the half-twist reduction or saturation argument. HANDOFF TO dependencies, kernel, audit and proof editor: seek role-labelled edges for PositivityTheory.RgGu.SRC.jhMult_rev_jac_sub, GlobalTheory.CompanionTheory.CuspPairSub.surjective_of_jm, PositivityTheory.RgGu.NR.someRed_of. Full reconstruction OPEN.
