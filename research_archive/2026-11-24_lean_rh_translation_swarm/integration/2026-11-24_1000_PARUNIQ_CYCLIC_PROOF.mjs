/*
# Tame local parameter uniqueness — integration chapter, 24 Nov 2026
SOURCE-MATCHED conditional human derivation, not independent upstream Lean replay. Extends the 09:00 RecT graph and the math lane's guarded GoodMap/JunkEx chapter. This run expands ParUniq rather than duplicating ParEx existence. All ambient hypotheses are retained in RecTTransport and the typed graph below. The full RH proof is not reconstructed.

1. Orbit identity. For z in K× write f_j(z)=θ(z^(g^j)). Since |K|=g^n, f_(j+n)=f_j. Shifting the n-factor product cyclically does not change it. If two InFor polynomials agree at each inertia t, the coefficient of X^(n-1) is minus the corresponding orbit sum. Surjectivity of R extends equality to every z in K×. Distinct multiplicative complex characters are linearly independent (the source's linearIndependent_monoidHom). The orbit sums are finitely supported combinations with integer multiplicities. Their coefficient functions must coincide. θ' occurs in its own orbit with multiplicity at least one (j=0, n>0), so appears in the first: θ'=θ^(g^j) for some j<n. This private lemma needs no regularity of θ'; the surrounding TameUniq and NameLaws require regular θ. Do not conflate these conditions.

2. Tame generator and cyclic basis. TameUniq.pair_of_gen uses degree MINUS ONE Frobenius φ and a tame inertia generator t0. For a tame irreducible WD representative put M=ρ(t0), G=ρ(φ). The smooth tame generator theorem gives MG=GM^g (normV w=g); both operators are invertible. A common stable subspace is stable under the full Weil action by that theorem, hence the pair is irreducible. st1a: if Mv=zv, then M(G^j v)=z^(g^j)G^jv. The finite eigenvalue set gives a collision; choose z on a periodic orbit of least positive length d. E_z is stable under G^d. Choose a nonzero eigenvector v of the restriction of G^d to E_z over C, with eigenvalue μ≠0 by invertibility. The vectors b_j=G^jv for 0≤j<d are independent because their M-eigenvalues are distinct. Their span is stable under both M and G because G b_(d-1)=μ b_0. Irreducibility makes it the entire space: d=dim V. No prior diagonalizability hypothesis is added.

3. st1b: determinant fixes the closing coefficient. Given two n-dimensional pairs as in the graph, choose both cyclic bases with initial eigenvalue z. If the second eigenvalue initially given is z^(g^i), apply G'^(n*i-i) to its eigenvector, which moves it to z by periodicity. In these bases M,M' are the same diagonal matrix and G,G' cyclic shifts with final multipliers μ,μ'. Their determinants equal (-1)^(n-1)μ and (-1)^(n-1)μ'. The Lean proof instead uses a diagonal comparison whose last entry is μ/μ', then determinant multiplicativity. Either route gives μ=μ' using equality of determinants and μ'≠0. Sending b_j to b'_j intertwines both pairs. Without determinant equality this conclusion fails in general, because the closing coefficient is still free. The full WD isomorphism additionally needs the smooth tame generator theorem and zero monodromy of irreducible WD reps, retained dependencies.

4. TameUniq third projection: take both irreducible tame WD representatives via exists_good. The inertia characteristic polynomial at t0 has degree n, giving both dimensions. st1a gives z with exact period n. InFor gives z as the i-th character value, so the second polynomial contains z^(g^(n-i)), the zeroth character value; use st1b with this offset. The determinant character equality at every Weil element gives equal determinants at φ. The pair intertwiner lifts to WD isomorphism and WD.mk_eq_mk gives V'=V. This is not a classification of arbitrary nontame WD objects.

5. ParUniq first projection: fix y cuspidal depth zero and Par(a,y,V). Obtain n>0, D via extEx, R via resEx, finite cuspidal type τ and its inflation via typeEx, regular name θ via nameLaws. Par's universal TypeAt field gives InFor for every W with Par(a,y,W), using these same D,R,θ,τ. Choose the central character ω by clBasic. If Par(a,y,V'), both irreducibility and tameness plus common InFor and the exact central laws give equal determinant characters on every Weil element. TameUniq third projection gives V'=V.

6. Reverse projection: let y' also be cuspidal depth zero and Par(a,y',V). The dimension fields force equal ranks. Choose type τ' and regular θ' over the SAME D,K,R. TameUniq second projection says θ'=θ^(g^j); NameLaws third projection gives τ'.character=τ.character. Choose ω' for y'. For each unit z, local Artin surjectivity gives s with a(s)=z. The two central laws imply ω'(z)=ω(z), so ω'=ω, not merely equality of moduli. detByType identifies y'=y from finite-character equality, both inflation maps and both exact central laws. detByType uses iso_of_char to transport one inflation map to the common finite representation, preserving its nonzero and intertwining properties. With common central character and two type maps, equiv_of_typeMaps supplies p-adic representation equivalence and class equality. This proves precisely the two guarded projections in RecTTransport; no unconditional local correspondence or bad-to-bad injectivity follows. NameLaws actually calls native greenRegularCharacters and pin; peer Green companion checks remain conditional on their named upstream inputs.

The executable below emits JSON for eight selected nodes with the actual source paths and blob identities, named frontier, and updated project index. Reproduce using node THIS_FILE /path/to/rh-clone (checks git blob hashes and runs same source assertions). Connector-read bytes and reported SHA were used for this run, not an independent clone. Modular arithmetic illustrates the cyclic determinant formula; it is not the Lean proof. Tests include eight source deletions; the first attempt failed because replacing only the first occurrence of the Frobenius-degree clause left a duplicate. Corrected mutation replaces all occurrences. No URT benchmark or advantage claimed.

Continuity: protocol, AGENTS, research state/log/protocol, handoff, continuity, summary #360 PASS at 09:58:18 UTC (run 45366981032; unrelated to RH kernel verification), latest 09:56 manuscript, cancellation/guarded cusp math, audit removable pole, dependency/structure export checkpoints, kernel and acceleration, native family T8/T1 and Green/Galois commit records inspected. Blueprint PDF readable text retrieved as navigation, not proof input. Literal RESUME_HERE.md and root RESEARCH_PROTOCOL.md paths 404; dated files and nested protocol recovered from commit records. Some specialist checkpoints remain unchecked; complete lane inventory not asserted. Guessed ParEx.lean/CuspT.lean paths 404; no invented proof. Both retry and native fixture status files 404; no success inferred. Upstream main observed 73958da58a8a4d1f61b789745c5444baf6247cae, Main blob differs from pin, no equivalence assumed. No unrelated records touched.

RESUME HERE: follow actual parEx producer via GoodMap.CentralUnit in coordination with math, or if already claimed expand the substantive equiv_of_typeMaps input to detByType. Editor append this chapter; audit review degree-minus-one Frobenius and both depth-zero guards. Dependencies retain selected source versus kernel labels. Full proof remains OPEN.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
export const graph={
  "schema": "RH selected source obligation extension v1",
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "source_ledger": {
    "types": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/RecTTransport.lean",
      "631f12febe08029e0d1d11139a704a6aaab367fb"
    ],
    "par": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ParUniq.lean",
      "87d971db5f5faa95d960b55914583b51d6baf31d"
    ],
    "tame": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TameUniq.lean",
      "79c1421916a98253dca5785cf687c3d425cd73eb"
    ],
    "names": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/NameLaws.lean",
      "bacce9b1591f33a3d01f365d52dea406fd415dce"
    ],
    "det": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/DetByType.lean",
      "df921e1cb033a12cb6d93974fbcff4746d3e60c9"
    ],
    "typeEx": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TypeEx.lean",
      "1fe68a05883be17946a5f6d797d22d9fe552b993"
    ],
    "good": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/GoodMap.lean",
      "1223776d8052ec8c0e7fba84b94780fda55a60f2"
    ],
    "cyclic": [
      "src/Development/WeilBound/RepresentationTheoryGL/GaloisPermutationReps/SubquotientEquivalence/EquivariantPartsOfFiniteType.lean",
      "fe27c490c35dee802a0b450a260f27ac3c01be5a"
    ],
    "pair": [
      "src/Development/WeilBound/RepresentationTheoryGL/GaloisPermutationReps/SubquotientEquivalence/PairingFactorsThroughPeriods.lean",
      "c192d0275052888b9606ea9e3a748099e21d39ea"
    ]
  },
  "root": "par",
  "status": "SOURCE-MATCHED, not kernel replay",
  "base": "2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json",
  "nodes": [
    {
      "id": "par",
      "source": "par",
      "range": [
        15,
        54
      ],
      "premises": [
        "E number field; Ω algebraic closure; A,w,h place data; all source typeclasses",
        "a local Artin map with ha",
        "prime g, continuous p-adic field isomorphism i",
        "y.IsCusp",
        "DZ y",
        "Par a y V"
      ],
      "conclusions": [
        "∀ V', Par a y V' → V'=V",
        "∀ y', y'.IsCusp → DZ y' → Par a y' V → y'=y"
      ],
      "deps": [
        "extEx",
        "resEx",
        "typeEx",
        "nameLaws",
        "clBasic",
        "tameUniq",
        "detByType"
      ]
    },
    {
      "id": "tameUniq",
      "source": "tame",
      "range": [
        160,
        214
      ],
      "premises": [
        "TameSys h g n R including n>0, normV=g, rank n, surjectivity, open kernel, wild and Frobenius laws",
        "regular θ",
        "InFor g n R θ V"
      ],
      "conclusions": [
        "every Frobenius shift gives InFor",
        "every alternate θ' giving InFor is in the orbit",
        "V'=V for irreducible tame V,V', same InFor, equal determinant characters on all Weil elements"
      ],
      "deps": [
        "pow_period",
        "prod_shift",
        "orbit_of_sums",
        "pair_of_gen",
        "st1a",
        "st1b",
        "wd_leaves"
      ]
    },
    {
      "id": "orbit_of_sums",
      "source": "tame",
      "premises": [
        "n>0",
        "equality of orbit character sums at every z in K×"
      ],
      "conclusions": [
        "∃ j<n, θ'=θ^(g^j)"
      ],
      "deps": [
        "linearIndependent_monoidHom"
      ]
    },
    {
      "id": "st1a",
      "source": "cyclic",
      "premises": [
        "finite dimensional complex V, nontrivial",
        "M,G units",
        "MG=GM^q",
        "only common invariant subspaces are zero and full V"
      ],
      "conclusions": [
        "an eigenvalue z of exact q-power period dim V"
      ],
      "deps": [
        "linear_algebra"
      ]
    },
    {
      "id": "st1b",
      "source": "pair",
      "premises": [
        "n>0, both dimensions n",
        "G,G' invertible",
        "MG=GM^q, M'G'=G'M'^q",
        "z exact period n",
        "z eigenvalue M, z^(q^i) eigenvalue M'",
        "det G=det G'"
      ],
      "conclusions": [
        "linear equivalence intertwining both pairs"
      ],
      "deps": [
        "basis_side"
      ]
    },
    {
      "id": "detByType",
      "source": "det",
      "range": [
        284,
        313
      ],
      "premises": [
        "ambient p-adic field isomorphism; n>0",
        "cuspidal τ",
        "τ'.character=τ.character",
        "both inflation witnesses",
        "common central character ω"
      ],
      "conclusions": [
        "cls σ'=cls σ"
      ],
      "deps": [
        "finite_char_iso",
        "type_maps",
        "equiv_of_typeMaps"
      ]
    },
    {
      "id": "nameLaws",
      "source": "names",
      "premises": [
        "prime g,n>0,rank K=n"
      ],
      "conclusions": [
        "regular names exist",
        "names unique modulo Frobenius",
        "same Frobenius orbit yields equal cuspidal characters",
        "transport along field isomorphism"
      ],
      "deps": [
        "greenRegularCharacters",
        "pin"
      ]
    },
    {
      "id": "typeEx",
      "source": "typeEx",
      "premises": [
        "ambient p-adic field isomorphism, n>0",
        "cuspidal depth-zero class for existence"
      ],
      "conclusions": [
        "finite cuspidal type and inflation",
        "finite characters agree for equal classes and both types"
      ],
      "deps": [
        "exists_cusp",
        "fixed_eq_range",
        "char_eq"
      ]
    }
  ],
  "unexpanded": [
    "extEx",
    "resEx",
    "clBasic",
    "pow_period",
    "prod_shift",
    "pair_of_gen",
    "wd_leaves",
    "linearIndependent_monoidHom",
    "linear_algebra",
    "basis_side",
    "finite_char_iso",
    "type_maps",
    "equiv_of_typeMaps",
    "greenRegularCharacters",
    "pin",
    "exists_cusp",
    "fixed_eq_range",
    "char_eq"
  ],
  "consumer_edges": [
    [
      "GoodMap.twist_eq_of_tw_eq",
      "par first projection"
    ],
    [
      "GoodMap.ofChar_eq_of_tw_eq",
      "par first projection"
    ]
  ],
  "edge_scope": "Selected source applications, not complete implicit/kernel references; frontier nodes are not asserted axioms.",
  "index": {
    "manuscript": "../specialists/proof_editor/2026-11-24_0956_INTEGRATED_MANUSCRIPT.md",
    "guarded_cusp": "../math/2026-11-24_guarded_cusp_map_algebra.md",
    "prior_graph": "2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json",
    "green_peer_commit": "f5bf62fe2b84df817e2cf8cff49a2f96d1594334",
    "native_family_peer_commit": "854a153db0f7027904c1f6c11323ddf2eea8fbaa",
    "audit_peer_commit": "cc0abbc2045168168b0206f110dda3fe637a86eb",
    "export_checkpoint": "WHOLE_PROOF_COVERAGE_AND_EXPORT_RUN.md"
  },
  "coverage": {
    "selected_nodes": 8,
    "source_modules": 9,
    "full_kernel_denominator": null,
    "full_translation_percent": null
  }
};
export const clauses={
  "types": [
    "structure Par ",
    "def ParUniq : Prop",
    "y.IsCusp → DZ y → ∀ V : WD h, Par a y V",
    "∀ y' : IrrGL (w.adicCompletion E), y'.IsCusp → DZ y' → Par a y' V → y' = y",
    "IsIrrWD V → IsIrrWD V' → IsTameWD V → IsTameWD V'",
    "(∀ σ, (V.eig σ).prod = (V'.eig σ).prod) → V' = V"
  ],
  "par": [
    "UpperTheory.Zero.LLC.extEx E Ω A w h g i hi n hn",
    "UpperTheory.Zero.LLC.resEx E Ω A w h g i hi n hn D",
    "UpperTheory.Zero.LLC.typeEx E Ω A w h g i hi n hn c.rep",
    "hW.type g i hi n hn D R hR θ hθ τ hτ hθτ c.rep hcl hinf",
    "hVu V' hV.irr hV'.irr hV.tame hV'.tame",
    "hV.central ω hω s, hV'.central ω hω s",
    "have hm : m = n := hV'.dim.symm.trans hV.dim",
    "hθu θ' hIF'",
    "hNchar τ τ' θ j hτ hτ' hθ hθτ hθτ'",
    "obtain ⟨s, rfl⟩ := ha.surj z",
    "hτ hch hinf hinf' hω hω'"
  ],
  "tame": [
    "FiniteField.pow_card",
    "hv.finsuppLinearCombination_injective hl",
    "l1 θ' = 0",
    "l2 θ' ≠ 0",
    "obtain ⟨t, rfl⟩ := hR.surj z",
    "congrArg Polynomial.nextCoeff",
    "deg φ = -1",
    "pair_of_gen φ hφ",
    "rw [hR.normV_eq] at hc hc'",
    "st1a (Fin m → ℂ)",
    "exact hdet φ",
    "st1b (Fin m → ℂ) (Fin m' → ℂ)",
    "irreducible_monodromy_zero a hirra",
    "mem_of_tame_generator_frobenius"
  ],
  "names": [
    "PositivityTheory.Stage1.PM.greenRegularCharacters",
    "UpperTheory.Zero.LLC.pin g n hn K hK",
    "regular_pow hn hK hθ j"
  ],
  "det": [
    "GlobalTheory.Top.Lq.iso_of_char",
    "φ'.comp e.toLinearMap",
    "equiv_of_typeMaps (finCusp_comp i hi τ hτ) σ' σ hω' hω h2 h1"
  ],
  "typeEx": [
    "exists_cusp i hi hn R hcusp.2 hdz",
    "fixed_eq_range i hi τ",
    "exact char_eq τ τ'"
  ],
  "good": [
    "(parUniq E Ω A w h a ha g i hi y₁ c₁ d₁ V₁ p₁).1",
    "(parUniq E Ω A w h a ha g i hi y₀ c d V₀ p).1"
  ],
  "cyclic": [
    "M.exists_eigenvalue",
    "Nat.find hP",
    "LinearMap.restrict (G ^ d) hmaps",
    "Module.End.eigenvectors_linearIndependent'"
  ],
  "pair": [
    "basis_side M G hG hMG hz hr",
    "basis_side M' G' hG' hMG' hz hr'",
    "if j = Fin.last m then μ / μ' else 1",
    "rw [hdet] at h1",
    "div_eq_one_iff_eq hμ'"
  ]
};
export function verify(src,clauses,graph){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 function source(s){let n=0;for(const [k,ss] of Object.entries(clauses))for(const t of ss){ck(s[k].includes(t),"missing "+k+": "+t);n++}return n}
 const count=source(src);let neg=0;for(const [k,i] of [["types",3],["par",4],["par",5],["par",9],["tame",4],["tame",6],["pair",3],["det",2]]){let rejected=false;try{source({...src,[k]:src[k].split(clauses[k][i]).join("REMOVED")})}catch{rejected=true}ck(rejected,"mutation survived "+k);neg++}
 const ids=new Set(graph.nodes.map(n=>n.id)),frontier=new Set(graph.unexpanded);let edges=0;ck(ids.size===graph.nodes.length,"duplicate graph IDs");for(const n of graph.nodes){ck(graph.source_ledger[n.source]&&n.premises.length&&n.conclusions.length,"bad node");for(const d of n.deps){ck(ids.has(d)||frontier.has(d),"unaccounted edge "+d);edges++}}
 const mod=(a,p)=>(a%p+p)%p;const pow=(a,n,p)=>{let r=1n;for(let i=0;i<n;i++)r=mod(r*a,p);return r};
 const det=(a,p)=>{if(a.length===0)return 1n;let r=0n;for(let j=0;j<a.length;j++)r+=((j%2)?-1n:1n)*a[0][j]*det(a.slice(1).map(row=>row.filter((_,i)=>i!==j)),p);return mod(r,p)};
 const mul=(a,b,p)=>a.map(r=>b[0].map((_,j)=>mod(r.reduce((s,x,k)=>s+x*b[k][j],0n),p)));
 const eq=(a,b)=>a.every((r,i)=>r.every((x,j)=>x===b[i][j]));
 let cases=0,detNeg=0,orbits=0;for(const [p,q,z,n] of [[7n,2n,2n,2],[31n,2n,2n,4]]){let orb=[z];for(let i=1;i<n;i++)orb.push(pow(orb[i-1],Number(q),p));ck(new Set(orb).size===n&&pow(orb[n-1],Number(q),p)===z,"bad orbit");orbits++;const M=orb.map((x,i)=>orb.map((_,j)=>i===j?x:0n));const G=mu=>orb.map((_,i)=>orb.map((_,j)=>i===(j+1)%n?(j===n-1?mu:1n):0n));const Mq=orb.map((x,i)=>orb.map((_,j)=>i===j?pow(x,Number(q),p):0n));for(let mu=1n;mu<p;mu++){let A=G(mu);ck(eq(mul(M,A,p),mul(A,Mq,p)),"cyclic relation");ck(det(A,p)===mod((n%2?1n:-1n)*mu,p),"det sign");cases++;for(let nu=1n;nu<p;nu++)if(mu!==nu){ck(det(A,p)!==det(G(nu),p),"det guard");detNeg++}}}
 return {source_clauses:count,source_mutations_rejected:neg,typed_nodes:ids.size,accounted_selected_edges:edges,finite_orbits:orbits,finite_cyclic_examples:cases,unequal_determinant_controls:detNeg};
}
export const observed={
  "source_clauses": 51,
  "source_mutations_rejected": 8,
  "typed_nodes": 8,
  "accounted_selected_edges": 25,
  "finite_orbits": 2,
  "finite_cyclic_examples": 36,
  "unequal_determinant_controls": 900
};
const rh=process.argv[2];if(!rh)throw Error('provide RH clone path');const src={};for(const [k,[path,sha]] of Object.entries(graph.source_ledger)){const b=execFileSync('git',['-C',rh,'show',graph.pin+':'+path]);const h=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==sha)throw Error('blob mismatch '+k);src[k]=b.toString('utf8')}console.log(JSON.stringify({graph,tests:verify(src,clauses,graph)},null,2));
