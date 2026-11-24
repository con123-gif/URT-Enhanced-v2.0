# Geometry run 5 — small automorphic forms inject into metrized model sections
2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction, local scalar regression executed. Full proof OPEN. No kernel replay.

## Continuity and revision
Read AGENTS, RESEARCH_STATE, continuity, RESEARCH_LOG and RESEARCH_PROTOCOL, CI summary, all three swarm coordination documents, geometry RUN3/4 and other lanes' latest located handoffs (editor, literature, Landau, character boxes, Galois, theta, prime, acceleration, kernel, dependencies, integration, structure, math and audit). Existing RUN2 concerns a different small-section comparison; RUN3 and RUN4 concern Chow/self-intersection equality and recursion. This is a separate producer named by the RUN4 handoff. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed head 5f2c8594adf1f48032d37583118512cd7bbf3afa (2026-11-24 11:41:50 UTC), old HodgeBundleWeights/SmallSectionsInjective.lean and SmallSectionsInjectiveOfSelfIntersectionBound.lean return 404 at that head; no migration equivalence claimed. Geometry lane only; no physics gate or queue changes. External blueprint not reopened in this run; source proof is primary.

## Source ledger
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean` blob `0e1bad41f4b165c0d9b1693f419530309e1da5ba`; anchors at 21, 21.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjective.lean` blob `d8879d8a7eda4debcda1494cd18864c0302c24ba`; anchors at 13, 14, 14.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjectiveOfSelfIntersectionBound.lean` blob `c7b76d680093c367262f0d5dead7c738caa57143`; anchors at 31, 35, 39, 46, 54, 58, 59, 61, 69, 72, 73.
- `src/Development/WeilBound/CoreStatements/NefModelVolumes/InjectivityWeightSectionsOf.lean` blob `a45a05e177dfd35f22b46e8107c512eeeb9b5913`; anchors at 27, 37, 40, 46, 62, 72, 74, 79, 82.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/HeightLowerBoundOfRegulator.lean` blob `56c6300f425734f6830a74b0ba50bf64c49d7693`; anchors at 15, 17, 18.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/RegulatorLowerBound.lean` blob `8d9ecd9a5a2a978a056e8f02b60776859d11e71e`; anchors at 11, 13, 19.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsHeightEstimate.lean` blob `c0606a7c83a6a15d54e7530c39c0ed0020cbf196`; anchors at 28, 30, 34, 49.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsCdvrEstimate.lean` blob `cf67718c710bd3d497ef3955e6174ed97e983c30`; anchors at 80, 90, 118, 153, 172.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean` blob `4d2546abb6eaa7950fcfeb20dd8adca341631fa2`; anchors at 35, 49, 78, 102, 162, 173, 180.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/MemOfForallValuationSubring.lean` blob `52382959baccb186d46f53c8f3d153b40993c4a5`; anchors at 7, 20, 23, 94.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightComparisonOfDegreeBound.lean` blob `08db56669223ef219bb1b386f66b280e8d8b7245`; anchors at 13, 15.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean` blob `8594fde18897fec5e51d38efa44601913999814f`; anchors at 43, 44, 50.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FiniteTypeSections.lean` blob `7d66d140748c6d2029e07d4ba528c76a369b75c0`; anchors at 35, 39, 41, 44, 72, 85, 114, 126.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ContinuousAeval.lean` blob `30e5a81f94814c59f5b07146a9d4785b8c86b05a`; anchors at 30, 48, 88, 124, 132, 141, 149.
- `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/IsModelOf.lean` blob `ffd442f45da6543771bd9a265874bbe994ab8a4a`; anchors at 21, 27, 29, 31, 33, 36, 38.
- `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SecZEqZeroOfGenVal.lean` blob `f71bf6deac8fb37c92f9a4a9aa9900e11055315a`; anchors at 37, 48, 16.

## 1. Exact context and target
The actual call in ThirdPlaceSeries/TopCovolSlim2Use is PositivityTheory.Xj7N.small_sections_injective with NV from exists_nonvanishing_of_toroidal hH.sieg hX.ks. Its other argument is PublishedHodgeBundleTheorems. In the original quantifier order: D:D7, T:Core D, j:nat, Y:Deep T j, e:nat, o:real, Y.Good e o, 2 < finrank_Q(D.host.E)/2 (retain the source division and coercions), Z:Comp Y.d.Xo₂ Y.d.c₂, u:Weight(T.Q.Dw j), integral scheme X, p:X→Spec O_K with K=Y.d.c₂.F, HermLB L over p, ring hom psi:Om Z→X.functionField, section assignment s on W=latOn Y.U Z G with G=wtOf(T.Q.Dw j) u 0, t:real, GoodOn (the original U, xiR D, D.sp.W j, dict, Z, G), DegVal.BirOn U Z G, NoBase U Z G, 0<Y.dg u Z, and IsModelOf for the original normOn, W, genPoint, dimFlag and p,L,psi,s. Finally every i:nat with 1≤i. Put tau=8i and F=smallL at that degree and t (same U, xiR, W j, dict,Z,G). The result is encard(F)≤encard(((L.shift t).pow tau).smallSec). This is an extended cardinal inequality, not a claim of finiteness, linearity, norm equality, or surjectivity of the map. Preserve all declared premises even when a local subproof does not use them.

IsModelOf has seven fields: arithmetic projective variety of the specified dimension, normal scheme, bijective psi, agreement of scalar base maps, generic section ratio, basepoint-free section cover, and an FS presentation. The latter contains basis b, generator matrix g, matrices A_sigma, reverse coefficients c, integral generators gw, IsFrame, both change-of-generators relations, and exact chart metric formula. No general equality with an arbitrary line bundle is used.

## 2. One global denominator
Write a(v)=genVal_Z(v) and F_k(v)=generic rational value of local section s(v) in chart k. The model ratio says psi(a(v)) F_k(w)=psi(a(w)) F_k(v).
If all W have a(v)=0, GoodOn's full-span field implies the entire linear genPoint is zero. imageDeg_zero forces dg=0, contradicting positive dg. Choose w1 with nonzero a(w1).
Independently, the bpf cover supplies w with s(w) nonzero at the generic point. A chart k0 exists there. If a(w)=0, the ratio for w1,w gives psi(a(w1)) F_k0(w)=0, contradicting injectivity of psi and fnOf_sec_ne_zero. Thus a(w)≠0. This is one w fixed for every f, not one chosen per f. Set
  h_f = psi(a(f)) / psi(a(w))^tau,
  r_{f,k} = h_f F_k(w)^tau.
The target section is a rational multiple of s(w)^tau. The nonzero denominator is logically essential; do not divide by F_k(w) at an arbitrary point.

## 3. Regularity — two exact routes
The source uses regulator_lower_bound (generic-fibre wrapper of regulator_bound_all), then height_lower_bound_of_regulator to extend to all points; despite their names these are regularity statements, not numerical regulator or self-intersection inequalities.
For the all-point route, normality makes each stalk integrally closed. By mem_of_forall_valuationSubring a rational element is regular if it lies in every valuation subring containing the stalk. Pull such a valuation ring O back via psi. The model base identity puts O_K in it. exists_refine constructs O' contained in the pulled-back O, centered over a nonzero height-one prime la of O_K: form the residue-congruence subring of elements congruent to a base integer modulo the original valuation maximal ideal, choose a maximal ideal of O_K containing the contracted center, lift it to a proper ideal, and dominate by a valuation subring; nonunit containment gives the needed inclusion. Retain all ordered valuation group hypotheses.
fin_small_gen gives l in W with nu(a(f))≤nu(a(l))^tau in multiplicative notation. Via valuation_le_iff there is c in O' with a(f)=c*a(l)^tau. The ratio and nonzero psi(a(w)) yield
  r_{f,k}=psi(c) F_k(l)^tau.
The two factors are in O (local section is regular, and c is in the refinement), so r_{f,k} belongs to every such valuation ring and hence the normal stalk. This also supplies generic-fibre regularity.

The second route in height_lower_bound_of_regulator splits on (p x).asIdeal=bottom. Use the first route on the generic fibre. At a nonzero base prime, assume r is not regular. SmallGenerators.exists_val supplies a valuation O containing the stalk, strictly less than one on its maximal ideal, and nu(r)>1. It constructs the valuation by adjoining r^-1 to the local ring; if the ideal generated by the maximal ideal and r^-1 were the unit ideal, a reversed polynomial with unit leading coefficient would make r integral, contrary to normality and nonregularity. A maximal ideal and dominating valuation then give the separating inequality. zeroAt_const ensures the strict center condition at la. Apply fin_small_gen to nu composed with psi. By the ratio, nu(r)≤nu(F_k(l))^tau≤1, contradiction. No normality-free descent or sign reversal is valid.

The finite generator lemma fin_small_gen actually proves the inequality by contradiction, not by assuming an arbitrary generator maximizes the desired bound. Choose finitely many O_K generators w_j from GoodOn.FG, spanning over K. BirOn ensures a_j=a(w_j) not all zero and their ratios to a maximal-valuation a_0 generate Om Z. If every nu(a_j)^tau<nu(b), b=a(f), then y_j=a_j/a_0 have nu≤1 and q=a_0^tau/b has nu<1; a_0,b nonzero. Apply exists_cdvr_point_gen to these finite elements, the chart coordinates and protected nonzero denominators; obtain a specialization into a complete DVR and preserve strict positivity for q in ADDITIVE order. intAll_ramified supplies an integral frame after ramified extension. The common nonzero frame multiplier C_u appears for weight G and C_u^tau for weight tau G. Set X0=C_u phi(rho(a_0)), Y0=C_u^tau phi(rho(b)), q'=phi(rho(q)); then X0^tau=q'Y0, ord(q')>0. The depth lower bound from hf.1 la at the resulting recVals member gives tau ord(X0)≤ord(Y0): all generators have normalized order at least that of X0, extending to W via le_of_mem_span, then infimum; the positive ramification normalization r'*e cancels. But the exact product identity gives tau ord(X0)=ord(q')+ord(Y0)>ord(Y0), contradiction. This reconstructs the proof logic, not the deeper CDVR specialization or integral-frame construction. These remain named native obligations.

## 4. Archimedean estimate and passage to every complex point
WeilHeightArchimedeanContribution constructs the holomorphic spanning comparison using NV, the dimension bound dimFlag≥1, a toroidal flag bundle, local_unit_map_surjective and extVan_section_has_cusp_form_match. For each good embedding and holomorphic P, express it on frames as a finite complex linear combination Q of cusp forms (pointwise equal). norm_small_le with the original unfolded-domain conditions, even_wtOf, and IsFrame then supplies for every field embedding rho:Om Z→C extending sigma:
  |rho(a(f))|≤exp(tau*t) * archSize(A_sigma,(rho(a(b_m)))_m)^tau.
The result applies for all positive tau; at 8i positivity follows from i≥1. Do not replace this norm bound by a comparison at a single embedding.

WeilHeightComparisonOfDegreeBound calls GenericDenseBound.norm_le_of_emb. IsModelOf.fs supplies coefficients c_jm with b_m=sum_j c_jm gw_j. On an affine neighborhood of a complex point y where the rational coefficient r is regular, the coordinate ring is a finitely generated Z-domain (projectivity, number ring finite type) and its fraction field is X.functionField. For a field embedding rho of that fraction field, let lambda=rho(F_k(w)/psi(a(w))). Then the local rational coefficient evaluates to rho(psi(a(f)))*lambda^tau and each generator section to rho(psi(a(gw_j)))*lambda. Combining the reverse basis coefficients with A gives the common lambda factor in each of the sums defining the FS norm. Define Q as the sum of squared absolute values of those linear combinations of local generator section values; Q≥0. Squaring the generic bound and factoring |lambda|^(2tau) gives |r|²≤exp(2tau*t) Q^tau, including lambda=0, without division by lambda.
The lemma ContinuousAeval.bound_of_emb passes this inequality from field embeddings to arbitrary complex points of the affine ring: present it as a quotient of a finite-variable integer polynomial ring, use a rational prime ideal, and approximate each point by generic zeros with exactly that ideal (countably many open dense nonvanishing conditions and Baire, using ratPrimeDense). The approximating evaluations are injective on the ring and extend to its fraction field. The finitely many number-field embeddings allow a frequently constant embedding subsequence; continuity gives the inequality at the point and identifies the restriction to the given O_K embedding. All this is essential: generic evaluation alone is not enough. Keep the RatPrimeDense proof leaves, finite type, fraction field and continuity hypotheses.

The original metric is phi_k(y)=log Q(y). For Q>0, cancel the positive Q^tau; for Q=0 use Lean's totalized log(0)=0 and 0^0=1, treating tau=0 correctly in the general lemma final_ineq. Thus
  |ratVal(r_{f,k})(y)|² exp(-tau phi_k(y)) ≤ exp(2tau*t).
We have not independently reconstructed local_unit_map_surjective, norm_small_le, or all analytic density leaves.

## 5. Global section and injection
exists_rat_small presents L^tau as Cartier divisor of the nonzero rational section s(w)^tau. The all-point regularity condition says h_f lies in its rational-function section space; presents_divOfRatSec gives a genuine global S_f and an injective rational-function encoding R with R(S_f)=h_f. At every complex point the actual chart coordinate is the ratVal of r_{f,k}, by the presentation and local evaluation identity. The shifted power has metric weight tau*(phi+2t), so
  norm_shifted(S_f)^2 = |ratVal(r)|² exp(-tau phi) / exp(2tau*t) ≤1.
The metric shift is doubled in the weight, NOT 2t added only once after tensoring. The denominator is strictly positive for all real t, including negative t.
Select S_f for each f. If S_f=S_g, apply R and cancel the common nonzero inverse power of psi(a(w)), then use psi injective to get a(f)=a(g). The difference f-g is in the same cusp submodule and has zero generic value at Z. It is supported on Z, so its generic values on other components vanish by evC_eq_zero. secZ_eq_zero_of_genVal gives f-g=0 (via generic frame atlas and radical Jacobson ideals; those named inputs retained). Therefore the section map is injective on F, and its image lies in smallSec. Extended cardinal monotonicity proves the target. No hidden assumption of finite sets, linearity, isometry, or a positive self-intersection is introduced.

## 6. Executed check
Re-fetched 16 pinned primary source blobs, matched all 81 literal anchors at the lines above against their returned hashes. V8 BigInt regression actually executed: {"cancel":17640,"valuation":11060,"metric":1944,"zeroQ":297,"negativeControls":244}. Exact finite-grid checks of cancellation, additive valuation direction, shift scaling, totalized-log zero branch, and insufficient valuation counterexamples; not a Lean build or native arithmetic variety test. No new mathematical assumption is used in the local reconstruction. No URT benchmark or global proof coverage claim.

Reproduce source matching using this ledger on a checkout of the pinned upstream commit (compare git rev-parse PIN:path and exact string occurrences):
```json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean",
    "sha": "0e1bad41f4b165c0d9b1693f419530309e1da5ba",
    "locations": [
      [
        21,
        "Xj7N.small_sections_injective"
      ],
      [
        21,
        "exists_nonvanishing_of_toroidal"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjective.lean",
    "sha": "d8879d8a7eda4debcda1494cd18864c0302c24ba",
    "locations": [
      [
        13,
        "theorem PositivityTheory.Xj7N.small_sections_injective"
      ],
      [
        14,
        "weil_height_comparison_of_degree_bound"
      ],
      [
        14,
        "weil_height_archimedean_contribution hNV"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjectiveOfSelfIntersectionBound.lean",
    "sha": "c7b76d680093c367262f0d5dead7c738caa57143",
    "locations": [
      [
        31,
        "hGood.2.2"
      ],
      [
        35,
        "imageDeg_zero"
      ],
      [
        39,
        "hM.bpf"
      ],
      [
        46,
        "hM.ratio w₁ w"
      ],
      [
        54,
        "exists_rat_small"
      ],
      [
        58,
        "height_lower_bound_of_regulator"
      ],
      [
        59,
        "regulator_lower_bound"
      ],
      [
        61,
        "choose! Sf"
      ],
      [
        69,
        "mul_right_cancel₀ hc h1"
      ],
      [
        72,
        "eq_zero_of_genVal'"
      ],
      [
        73,
        "hinj.encard_image"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/InjectivityWeightSectionsOf.lean",
    "sha": "a45a05e177dfd35f22b46e8107c512eeeb9b5913",
    "locations": [
      [
        27,
        "theorem exists_rat_small"
      ],
      [
        37,
        "presents_divOfRatSec"
      ],
      [
        40,
        "CartierDiv.mem_sections"
      ],
      [
        46,
        "hPr.exists_rat_eq"
      ],
      [
        62,
        "Weight.zpow_φ"
      ],
      [
        72,
        "Real.exp (2 * (τ : ℝ) * t))⁻¹"
      ],
      [
        74,
        "mul_inv_le_iff₀"
      ],
      [
        79,
        "theorem eq_zero_of_genVal'"
      ],
      [
        82,
        "secZ_eq_zero_of_genVal hf.1.1"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/HeightLowerBoundOfRegulator.lean",
    "sha": "56c6300f425734f6830a74b0ba50bf64c49d7693",
    "locations": [
      [
        15,
        "by_cases hp"
      ],
      [
        17,
        "SmallGenerators.reg_of_val"
      ],
      [
        18,
        "O.valuation.comap ψ"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/RegulatorLowerBound.lean",
    "sha": "8d9ecd9a5a2a978a056e8f02b60776859d11e71e",
    "locations": [
      [
        11,
        "theorem regulator_bound_all"
      ],
      [
        13,
        "exact reg_of_val"
      ],
      [
        19,
        "RegularPointExistence.regulator_bound_all"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsHeightEstimate.lean",
    "sha": "c0606a7c83a6a15d54e7530c39c0ed0020cbf196",
    "locations": [
      [
        28,
        "mem_of_forall_valuationSubring"
      ],
      [
        30,
        "exists_refine"
      ],
      [
        34,
        "ValuationSubring.valuation_le_iff"
      ],
      [
        49,
        "O.mul_mem"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsCdvrEstimate.lean",
    "sha": "cf67718c710bd3d497ef3955e6174ed97e983c30",
    "locations": [
      [
        80,
        "theorem exists_val"
      ],
      [
        90,
        "IsIntegrallyClosed.isIntegral_iff"
      ],
      [
        118,
        "zeroAt_const"
      ],
      [
        153,
        "apply hO3"
      ],
      [
        172,
        "pow_le_one' hFl"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean",
    "sha": "4d2546abb6eaa7950fcfeb20dd8adca341631fa2",
    "locations": [
      [
        35,
        "Finite.exists_max"
      ],
      [
        49,
        "let q : Om Z := a i₀ ^ τ / b"
      ],
      [
        78,
        "exists_cdvr_point_gen"
      ],
      [
        102,
        "intAll_ramified"
      ],
      [
        162,
        "prod_exZ_nsmul"
      ],
      [
        173,
        "hρL Q hqG hq hρQ"
      ],
      [
        180,
        "div_le_div_iff_of_pos_right hE"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/MemOfForallValuationSubring.lean",
    "sha": "52382959baccb186d46f53c8f3d153b40993c4a5",
    "locations": [
      [
        7,
        "theorem mem_of_forall_valuationSubring"
      ],
      [
        20,
        "Subring.exists_le_valuationSubring_of_isIntegrallyClosedIn"
      ],
      [
        23,
        "theorem exists_refine"
      ],
      [
        94,
        "ValuationSubring.nonunits_le_nonunits"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightComparisonOfDegreeBound.lean",
    "sha": "08db56669223ef219bb1b386f66b280e8d8b7245",
    "locations": [
      [
        13,
        "GenericDenseBound.norm_le_of_emb"
      ],
      [
        15,
        "(8 * i) (by omega)"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean",
    "sha": "8594fde18897fec5e51d38efa44601913999814f",
    "locations": [
      [
        43,
        "local_unit_map_surjective"
      ],
      [
        44,
        "extVan_section_has_cusp_form_match"
      ],
      [
        50,
        "exact norm_small_le"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FiniteTypeSections.lean",
    "sha": "7d66d140748c6d2029e07d4ba528c76a369b75c0",
    "locations": [
      [
        35,
        "theorem final_ineq"
      ],
      [
        39,
        "Real.log_zero"
      ],
      [
        41,
        "Real.exp_log h0"
      ],
      [
        44,
        "theorem norm_le_of_emb"
      ],
      [
        72,
        "bound_of_emb"
      ],
      [
        85,
        "set lam"
      ],
      [
        114,
        "Real.sq_sqrt hS"
      ],
      [
        126,
        "refine final_ineq"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ContinuousAeval.lean",
    "sha": "30e5a81f94814c59f5b07146a9d4785b8c86b05a",
    "locations": [
      [
        30,
        "theorem generic_dense"
      ],
      [
        48,
        "dense_iInter_of_isOpen"
      ],
      [
        88,
        "theorem exists_seq_emb"
      ],
      [
        124,
        "IsFractionRing.lift"
      ],
      [
        132,
        "theorem bound_of_emb"
      ],
      [
        141,
        "frequently_exists.1"
      ],
      [
        149,
        "le_of_tendsto_of_tendsto_of_frequently"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/IsModelOf.lean",
    "sha": "ffd442f45da6543771bd9a265874bbe994ab8a4a",
    "locations": [
      [
        21,
        "structure IsModelOf"
      ],
      [
        27,
        "normal :"
      ],
      [
        29,
        "bij :"
      ],
      [
        31,
        "base :"
      ],
      [
        33,
        "ratio :"
      ],
      [
        36,
        "bpf :"
      ],
      [
        38,
        "fs :"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SecZEqZeroOfGenVal.lean",
    "sha": "f71bf6deac8fb37c92f9a4a9aa9900e11055315a",
    "locations": [
      [
        37,
        "theorem secZ_eq_zero_of_genVal"
      ],
      [
        48,
        "Ideal.jacobson"
      ],
      [
        16,
        "evR_eq_zero_of_genVal_eq_zero"
      ]
    ]
  }
]
```
Replay the scalar regression in Node or another JS runtime:
```js
function assert(v,msg){if(!v)throw Error(msg);}
function regression(){
 let cancel=0,valuation=0,metric=0,zeroQ=0,neg=0;
 // Rational equality with a common nonzero denominator; cross products use exact integers.
 for(let i=1;i<=4;i++)for(let w=-5;w<=5;w++)if(w)for(let a=-10;a<=10;a++)for(let b=-10;b<=10;b++){
   const d=BigInt(w)**BigInt(8*i);
   assert(d!==0n,"denominator");
   assert((BigInt(a)*d===BigInt(b)*d)===(a===b),"cancellation");cancel++;
 }
 // Additive valuation ord, reversing the multiplicative order. ratio implies ord(s_l)=ord(a_l)-ord(a_w)+ord(s_w).
 for(let i=1;i<=4;i++)for(let a=-4;a<=4;a++)for(let w=-4;w<=4;w++)for(let sw=-4;sw<=4;sw++){
   let sl=a-w+sw;if(sl<0)continue;
   for(let excess=0;excess<=6;excess++){
     const tau=8*i,b=tau*a+excess;
     assert(b-tau*w+tau*sw===excess+tau*sl,"valuation equality");
     assert(b-tau*w+tau*sw>=0,"regularity");valuation++;
   }
   if(sl===0){assert(8*i*a-1-8*i*w+8*i*sw<0,"strictly insufficient valuation");neg++;}
 }
 // metric exponent: exact powers of 2, Q=2^q, exp(2*t)=2^s; a=2^k.
 const p2=n=>n>=0?[2n**BigInt(n),1n]:[1n,2n**BigInt(-n)];
 const mul=(a,b)=>[a[0]*b[0],a[1]*b[1]];
 const le=(a,b)=>a[0]*b[1]<=b[0]*a[1];
 const eq=(a,b)=>le(a,b)&&le(b,a);
 for(let i=1;i<=4;i++)for(let q=-4;q<=4;q++)for(let s=-4;s<=4;s++)for(let slack=0;slack<=5;slack++){
   let tau=8*i,k=tau*(q+s)-slack;
   assert(le(p2(k),p2(tau*(q+s))),"unshifted");
   assert(le(mul(p2(k),p2(-tau*q)),p2(tau*s)),"metric bound");
   assert(eq(mul(mul(p2(k),p2(-tau*q)),p2(-tau*s)),p2(-slack)),"shift");metric++;
 }
 for(let tau=0;tau<=32;tau++)for(let s=-4;s<=4;s++){
   const upper=tau===0?p2(tau*s):[0n,1n];
   assert(le(upper,p2(tau*s)),"total log zero");zeroQ++;
 }
 return {cancel,valuation,metric,zeroQ,negativeControls:neg};
}
console.log(regression());
```

RESUME HERE: trace the genuine fin_small_gen prerequisite exists_cdvr_point_gen in MinimalPrimeDimensions/ExistsPointOfValGen.lean and its actual specialization and integral-frame producers; reconstruct exactly how the finite set of bounded/strictly bounded and protected nonzero elements survives the CDVR specialization (including positive ramification). This is a distinct native geometric obligation, not another cardinality or Chow-height calculation. Keep local_unit_map_surjective and norm_small_le as separate open archimedean leaves. HANDOFF TO: editor, integration, audit, literature, theta, prime-window. Mark the small-section injection as source-matched with named open geometric leaves. No physics changes.
