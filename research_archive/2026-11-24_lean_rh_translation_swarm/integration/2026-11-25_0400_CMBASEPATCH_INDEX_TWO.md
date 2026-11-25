# Integration 04:00 — CM base patch and the finite quadratic-twist exclusion

2026-11-25. RESULT: SOURCE-MATCHED human reconstruction of the native patching junction, including its actual cofinite selection proof. One contribution, not a proof of RH or a kernel replay. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head fcb6eac7534875d32d68030967e2deae6d686151 (2026-11-25 02:41:16Z), not adopted. Previous integration 8a6c269a4a247c5d9a91876d28a7e5c493e3e6f0. The missing producer is in ResInjective.lean, not a file named CMBasePatch. Source import navigation (not kernel dependency evidence): CoreAllOfRowStarCoreInp -> ExAllOfGood -> ResInjective -> ImportsSide -> EqOneOrEqOfKer.

## Source ledger

All five files retrieved at the pin and connector blob IDs matched; lines inclusive.
- src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean, 894cd3878a45a90662e07a57502169d65829ca79, L1–14, 466–491, 538–550. Actual caller is UpperTheory.Gal.Int.Inp.ex_all_of_good, not the parallel similarly named GlobalTheory.RoadU.ex_all_of_good.
- src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExAllOfGood.lean, 61fb23ed644abcf384a41172fb4515a9ed40f2ba, import header and parallel adapter.
- src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean, 8f9936214030167b27b9644b1d26e2cfb9524fea, L41–284.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ImportsSide.lean, 080932f53879e8ebe7aa98bffbfe7a294b15b51b, import header.
- src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean, 2d2a78b5f0ccc6a41008af1f2692a61c76ccc750, L15–165.

## Human-readable proof of the patching junction

**Exact theorem CMBasePatch.main (R L279–284).** Retain AutomorphicFormsFiniteGL as an explicit premise even though this particular proof introduces it as an anonymous ignored argument. Let E be a CM number field, Ω an algebraic closure with E-algebra structure, l a natural prime, ι: Qbar(l) ≃+* C a ring equivalence, a a natural rank, π:CuspSub E a, S an infinite set of native QCM(E,Ω). For each Q in the subtype S let P_Q:CuspSub Q.K a, r_Q:G(Q.K,Ω)→GL_a(Qbar(l)) a group homomorphism, with IsLift(π,P_Q) and Weak(P_Q,ι,r_Q). There exists ONE continuous semisimple homomorphism ρ:G(E,Ω)→GL_a(Qbar(l)), such that for cofinitely many Q in the subtype S, RepIso(r_Q,ρ∘res_Q). The theorem does not assert a common conjugating matrix for all Q, compatibility for every Q, or uniqueness of ρ. No positivity hypothesis on a is added. The wrapper obtains cofinite Satake existence hsatE from ResW.exists_satFam_of_isDiscrete E a and uniqueness from HasSat.unique; it uses Weak's continuity, semisimplicity and AttC components, and att_of_lift below to invoke SatSysPatch.patch.

**Attached systems (R L48–88,259–273).** For base F, sat(v,B) with unique multiset B of nonzero complex numbers at v, AttSys(sat,ι,L,r) means that for cofinitely many height-one primes w of O_L, for EVERY natural f satisfying norm(w)=norm(w under F)^f, there exists B at w under F and FrobEig of r at w with the algebraically normalized multiset (algSat(a,norm(w under F),B)).map(z↦z^f). This quantifier order is preserved. The proof att_of_lift intersects the pulled-back cofinite Satake existence and AttC event, obtains B and B', and uses IsLift.sat at the actual residue degree f; uniqueness identifies B' with B.map(z↦z^f). Normalization commutes with this operation by (q^f)^((a−1)/2)=(q^((a−1)/2))^f in the native real-rpow convention for nonnegative q, then multiplication and multiset map commute with powers (R L54–60). No new choice of weight normalization. The tower proof pulls the event along the cofinite-preserving under map, composes under-under, invokes Frobenius power compatibility, and uses norm≥2 to cancel exponents and identify f with the product of the two residue degrees; map composition is multiplication of these exponents. The uniqueness proof for two continuous semisimple reps on the same K takes the intersection of their AttSys events, picks the actual residue degree, uses uniqueness of the same base Satake multiset, and invokes IsoOfFrobFree.main. This theorem, not equality at finitely many primes, gives RepIso.

**Conjugation and overlap (R L92–212).** For g∈G(F,Ω) and a surjective c:G(K,Ω)→G(K,Ω) satisfying res(c(s))=g res(s)g⁻¹, the forward and backward fixed-field arguments establish that g and g⁻¹ carry K into K. Thus obtain a ring automorphism γ of K fixing F, induce e on O_K, and send w to its comap under e⁻¹. This prime map is injective (apply e to test elements), preserves the prime under F (γ fixes F), preserves norm (isomorphic quotient rings), and sends a valuation ring A over w to g·A over the transported prime. The pulled-back cofinite event remains cofinite by injectivity. Transport inertia and Frobenius using ine_conj and frob_conj, preserving inverse-Frobenius convention via map_inv, to establish AttSys for r∘c. For a quadratic K/F, normality provides conjugation c and its surjectivity, continuity and the semisimple restriction result; apply uniqueness to r and r∘c. If res(s')=g res(s)g⁻¹, injectivity of res (evaluation on Ω) gives s'=c(s); cyclic trace removes conjugation by the intertwining matrix. For two QCMs K,K', form M=K∨K' as an intermediate field, finite over F and normal over F, with all scalar tower and algebraic-closure instances. Restrict both reps to G(M,Ω). Tower supplies AttSys, normal subgroup restriction supplies semisimplicity, and restriction is continuous. Uniqueness gives conjugacy on M. For equal images of s and s' in G(F,Ω), their common element fixes both K and K', hence M by fixingSubgroup_sup. Lift it to G(M,Ω); its restrictions are precisely s,s'. Evaluate the conjugacy there and take traces. No comparison of traces on group elements not in the intersection.

**Reduction to index-two patching (R L214–257).** SignChar.main supplies an injective map Q↦η_Q:G(F,Ω)→{±1} with open kernel exactly the restriction image. The restriction map is injective; its image equality gives a multiplicative equivalence e_Q:G(Q.K,Ω)≃ker η_Q. Transport r_Q by e_Q⁻¹. The map e_Q is continuous, and compact source plus Hausdorff target makes its inverse continuous. Semisimplicity transfers by the normal restriction theorem applied to the surjective inverse (range is the whole group). The preceding trace conjugation and intersection results now meet the exact two trace hypotheses of IndexTwoPatch.main, with infinite subtype S and injective signs. This produces a global continuous semisimple ρ with **cofinite equality of traces** on the kernels. For each good Q, restriction of ρ to G(Q.K,Ω) is semisimple because its image is the normal sign kernel. TraceConj.main converts equality of traces at EVERY s to RepIso, reversing the equality orientation as the Lean proof does. It is this final separate theorem that upgrades trace agreement to representation isomorphism.

## IndexTwoPatch.main — why cofinite, not all (T L15–165)

Exact assumptions: Γ topological group; k algebraically closed field of characteristic zero with topological ring structure; natural n; infinite index type J; injective η:J→Hom(Γ,Zˣ); each ker η_i open. For each i, r_i:ker η_i→GL_n(k) continuous and semisimple. For all i,g,h,h' with h'=ghg⁻¹ in the ambient group, tr r_i(h')=tr r_i(h); for all i,j and h,h' in their respective kernels with equal ambient image, tr r_i(h)=tr r_j(h'). Output: one continuous semisimple ρ on Γ and, cofinitely in j, for every h∈ker η_j, tr ρ(h)=tr r_j(h).

1. The imported extension theorem extends each r_i to a continuous semisimple ρ_i agreeing as matrices on its kernel. Choose i₀ with η₀≠1 (injectivity and infinitude) and t with η₀(t)=−1. Let B be the set of quadratic characters χ admitting a nonzero matrix X with ρ₀(g)X=χ(g)Xρ₀(g) for all g. The imported finite_quadratic_characters_in_adjoint' proves B finite; this is not inferred from the abstract infinitude of J. Outside B every such intertwiner is zero. For g in two kernels, the extensions have equal traces by the given intersection premise.

2. The elementary lemma eq_one_or_eq_of_ker: if ker η₀⊆ker η, either η=1 or η=η₀. If η is nontrivial choose t with η(t)=−1; then η₀(t)=−1. For s with η₀(s)=1 the assumed inclusion gives η(s)=1; otherwise η₀(st)=1, so η(s)η(t)=1 and η(s)=−1. This proves equality of the sign characters on every s. Consequently, if η is neither 1 nor η₀ there exists s with η₀(s)=1, η(s)=−1.

3. The private helper (T L43–74) has additional hypotheses: semisimple global ρ₀,ρ_j, their traces equal on the common kernel, η neither 1 nor η₀, and no nonzero intertwiners of ρ₀ twisted by η or ηη₀. Apply the imported intersection conjugacy theorem to find P. Use the preceding separating element s, then intertwiner_zero_of_character_twist and exists_rep_agreeing_on_kernels to obtain a global rep ρ' agreeing exactly with ρ₀ on ker η₀ and conjugate on ker η to ρ_j. Its restriction to ker η₀ is semisimple by QuadKernelConj.isSSRep_ker and the equality of reps there; index-two semisimplicity ascends using t. Cyclic trace gives the stated trace equality on ker η. These imported constructions remain proof obligations.

4. Set P(χ)=(χ∉B ∧ χη₀∉B ∧ χ≠1 ∧ χ≠η₀). Its failure set is exactly D₁=B ∪ {χ:χη₀∈B} ∪ {1,η₀}, a finite set since multiplication by η₀ is a bijection. Injectivity of η implies the preimage of D₁ in J is finite. Choose j₁ outside it. Write β=η(j₁). The failure set for P(χ) ∧ βχ∉B ∧ βχη₀∉B is D₂=D₁ ∪ {χ:βχ∈B} ∪ {χ:βχη₀∈B}, again finite by cancellation. The preimage of D₂ in J is finite, hence this stronger predicate holds cofinitely. In cardinal terms |D₁|≤2|B|+2, |D₂|≤4|B|+2 (upper bounds, not equality claims). No uniform finite set of places substituted for the exceptional indices J.

5. Apply the helper first to j₁ to obtain ρ₁. It is continuous by continuous_of_open from exact equality with continuous ρ₀ on the open ker η₀. For a j outside the second exceptional set, apply the helper to j obtaining ρ'_j. Both agree with ρ₀ on ker η₀ and are semisimple. The six twists β, χ, βχ, βη₀, χη₀, βχη₀ are all outside B by the precise guards; on the intersection ker β∩ker χ their traces agree by the original compatibility premise. Invoke intertwiner_zero_of_quadratic_twists, with all six vanishing conditions and these trace premises, to get the equality used by Lean as hall h. Then for h∈ker χ, tr ρ₁(h)=tr ρ'_j(h)=tr ρ_j(h)=tr r_j(h). This yields a single ρ₁ for the cofinite set, not a family of chosen ρ'_j as the output. In particular one cannot discard either mixed twist condition or claim exact equality of the global reps. The deep six-twist theorem is not proved in this chapter.

## Typed graph / obligation tree

The nine incoming edges below are preserved from the 300-target peer manifest, not newly extracted. The final coreAll_of_core owner is a requested projection; its outgoing records are not yet retrieved. All subsequent edges are explicitly SOURCE-MATCHED source-value calls rather than authenticated kernel edges. Do not promote the source import chain to proof reachability. No omitted type, structural, proof-irrelevance or axiom references are asserted absent. The JSON gives the new chapter's machine-readable incremental tree; retain previous graph and manuscripts unchanged.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "manifestBlob": "83f126194a507eec7cb6c52bdc4758fa7aaef8f4",
  "manifestCommit": "b7b220822e8c8a5aecc40f479429b34933a0e494",
  "authenticatedIncoming": [
    {
      "owner": 14065054,
      "target": 14065053,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212062,
      "expressionRoot": 1065212062,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "riemannHypothesis"
      ],
      "targetNameParts": [
        "rhOfAll"
      ]
    },
    {
      "owner": 14065053,
      "target": 14065052,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212060,
      "expressionRoot": 1065212061,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "rhOfAll"
      ],
      "targetNameParts": [
        "allChi"
      ]
    },
    {
      "owner": 14065052,
      "target": 14065051,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212058,
      "expressionRoot": 1065212058,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "allChi"
      ],
      "targetNameParts": [
        "UpperTheory",
        "FinalTheorems",
        "everyCharacter"
      ]
    },
    {
      "owner": 14065051,
      "target": 14065050,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212056,
      "expressionRoot": 1065212057,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "FinalTheorems",
        "everyCharacter"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_recParameter"
      ]
    },
    {
      "owner": 14065050,
      "target": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212052,
      "expressionRoot": 1065212054,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_recParameter"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisRepresentations_of_thetaLift"
      ]
    },
    {
      "owner": 14009158,
      "target": 13235289,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644800,
      "expressionRoot": 1062644804,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisRepresentations_of_thetaLift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_of_geometry_lift"
      ]
    },
    {
      "owner": 13235289,
      "target": 13235288,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1004086667,
      "expressionRoot": 1004086672,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_of_geometry_lift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobal_of_geometry_lift"
      ]
    },
    {
      "owner": 13235288,
      "target": 13208115,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1004086650,
      "expressionRoot": 1004086661,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobal_of_geometry_lift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "coreAll_of"
      ]
    },
    {
      "owner": 13208115,
      "target": 13175074,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1002624502,
      "expressionRoot": 1002624515,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "coreAll_of"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "Inp",
        "coreAll_of_core"
      ]
    }
  ],
  "sourceOnlyEdges": [
    {
      "owner": "UpperTheory.Gal.Int.Inp.coreAll_of_core",
      "target": "UpperTheory.Gal.Int.Inp.ex_all_of_good",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "lines": "538–550",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "UpperTheory.Gal.Int.Inp.ex_all_of_good",
      "target": "GlobalTheory.CMBasePatch.main",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "lines": "491",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.ResW.exists_satFam_of_isDiscrete",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "281",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.SatSysPatch.patch",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "282",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.SatSysPatch.att_of_lift",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "283",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.RealGal.SignChar.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "218",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.IndexTwoPatch.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "237–248",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.SatSysPatch.trace_conj",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "242–243",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.SatSysPatch.trace_eq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "247–248",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.TraceConj.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "254",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_conj",
      "target": "GlobalTheory.SatSysPatch.comp_conj",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "162–163",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_conj",
      "target": "GlobalTheory.SatSysPatch.uniq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "164–165",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_eq",
      "target": "GlobalTheory.SatSysPatch.tower",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "191–192",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_eq",
      "target": "GlobalTheory.SatSysPatch.uniq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "197",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.uniq",
      "target": "GlobalTheory.IsoOfFrobFree.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "82",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.att_of_lift",
      "target": "GlobalTheory.SatSysPatch.algSat_pow",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "272",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "78–80",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.finite_quadratic_characters_in_adjoint'",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "95",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "private exists_ne_zero_smul_mem_of_mem_span'",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "141,147",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.intertwiner_zero_of_quadratic_twists",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "149–164",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.conj_on_inter_quadraticKernels_of_trace_eq",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "54",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.IndexTwoPatch.eq_one_or_eq_of_ker",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "59",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.intertwiner_zero_of_character_twist",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "63",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.exists_rep_agreeing_on_kernels",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "64",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    }
  ],
  "unresolved": [
    "complete type/value/structural edges for CMBasePatch and SatSysPatch; transitive axiom ledger",
    "index-two extension producer",
    "finite adjoint character producer",
    "two intertwiner vanishing producers",
    "TraceConj and IsoOfFrobFree imported proofs",
    "Satake existence and sign-character suppliers",
    "normal restriction and local Frobenius transport suppliers"
  ]
}
```

## Executed regression / reproducibility

V8 actually checked 5 pinned connector blob identifiers, 40 source substring/range anchors and 11 manifest identity/path checks (56 assertions total). Initial source anchor L12 for ExAllOfGood import failed; corrected to L1–14 and all reran. Root-level log/protocol paths 404, corrected to runner paths. Requested compute/rh-post151-role-frontier-20261125/status.json returned 404; do not call the projection completed. Source text anchors are not kernel checks; Git blob IDs supplied by connector, not independently rehashed. For independent reproduction, fetch the five paths at the pin via git show, inspect cited lines, and compare git rev-parse PIN:PATH to the above blob IDs. For path replay parse const requests and const paths in pinned peer manifest b7b2208, select owner 13175074 and assert consecutive target/owner identities. The finite exact regression below models the sign-character group of (Z/2)^d, using xor for multiplication and parity for evaluation. It is an illustrative check of steps 2 and 4, not a substitute for the native general theorem or its infinite-family hypothesis. Executed in V8: {"inclusion":1364,"union":35840,"guard":2016,"negative":2}. Negative controls specifically delete each mixed exclusion. No Lean/Lake execution or transitive axiom replay in this run. Run with node after extracting this JS block.

```js
function finite(){
 let inclusion=0,union=0,guard=0,negative=0;
 function ck(b){if(!b)throw Error("regression")}
 const par=x=>{let v=0;for(;x;x>>=1)v^=x&1;return v};
 for(let n of [2,4,8,16,32])for(let a=0;a<n;a++)for(let b=0;b<n;b++){
   let incl=true;for(let x=0;x<n;x++)if(!par(a&x)&&par(b&x))incl=false;
   ck(incl===(b===0||b===a));inclusion++;
 }
 const n=8;
 for(let mask=0;mask<1<<n;mask++){
  const B=new Set(Array.from({length:n},(_,i)=>i).filter(i=>mask>>i&1));
  for(let a=1;a<n;a++){
   const bad1=new Set([...B,...[...B].map(x=>x^a),0,a]);
   const P=x=>!B.has(x)&&!B.has(x^a)&&x!==0&&x!==a;
   for(let x=0;x<n;x++){ck(bad1.has(x)===!P(x));union++}
   for(let b=0;b<n;b++)if(P(b)){
    const bad2=new Set([...bad1,...[...B].map(x=>x^b),...[...B].map(x=>x^b^a)]);
    for(let x=0;x<n;x++){
     const full=P(x)&&!B.has(b^x)&&!B.has(b^x^a);
     ck(bad2.has(x)===!full);union++;
     if(full){ck([b,x,b^x,b^a,x^a,b^x^a].every(y=>!B.has(y)));guard++}
    }
   }
  }
 }
 // Dropping either mixed exclusion admits a bad character even with P(b), P(x).
 for(let [B,a,b,x,omitted] of [[new Set([6]),1,2,4,0],[new Set([7]),1,2,4,1]]){
  const P=y=>!B.has(y)&&!B.has(y^a)&&y!==0&&y!==a;
  ck(P(b)&&P(x));ck(omitted===0?B.has(b^x)&&!B.has(b^x^a):!B.has(b^x)&&B.has(b^x^a));negative++;
 }
 return {inclusion,union,guard,negative};
}
console.log(finite());
```

Continuity: SWARM_PROTOCOL first, AGENTS, state/log/protocol and continuity excerpts, HANDOFF_QUEUE; latest peer checkpoints for audit, math, structure, dependencies, character boxes, Galois, kernel, Landau, literature, on_acceleration, positivity geometry, prime window, theta and editor. Dependency 300-target manifest b7b2208, kernel 54787ab TLiftK instance coherence (syntactic not definitional equality), structure 0324 release, editor latest 0356 manuscript blob b532ab4b932f22a755b9c4e85e36de417f72515d, volume 18, 224 peer documents under editor's document-count convention (not unique declarations; no coverage percentage). Galois RUN2 explicitly left CMBasePatch as separate obligation; Galois RUN21 works on Borel class numbers, no duplicate found in inspected notes. Acceleration main RUN21 staged build; general CI #416 at 04:00:42 UTC run 45540458272 PASS (physical/general checks, before this commit). Grok latest commit b600c829 reviewed commit metadata only, not integrated. External blueprint not reopened. No independent reviewer verdict of this chapter yet; request audit of the trace-to-isomorphism boundary and six guard preservation. No unrelated Cathedral records changed or unbenchmarked URT claim.

RESUME HERE: expand the actual imported exists_extension_rep_index_two_of_trace_invariant producer and its index-two extension/semisimplicity construction; retain finite adjoint character and six-twist vanishing as open imported obligations. In parallel request compact authenticated outgoing role records for coreAll_of_core and ex_all_of_good from the 300-target output, then exact Main-root paths to CMBasePatch.main, SatSysPatch.patch and IndexTwoPatch.main; do not rescan the raw archive unnecessarily. HANDOFF TO dependency, kernel, Galois, editor, audit, acceleration. Full human-readable RH reconstruction OPEN.
