# Geometry run 4 — arithmetic Bézout recursion and Chow-height comparison
2026-11-24. RESULT: SOURCE-MATCHED local reconstruction of the finite/archimedean recursion, its dimension induction, and the model glue. Deep analytic and arithmetic existence leaves remain open; no kernel replay. Not a new RH proof.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual cathedral_arf_runner protocol/log, continuity, current CI summary (45373263454 PASS at 10:36:09 UTC, physical suite not RH verification), RUN3, latest editor and specialist handoffs. This is the distinct RUN3 frontier, not a repeat of metric scaling or the lower/counting-volume inequalities.
Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed cb4dc6e23a6187db392c96664295415c55b6b01e; pinned ChowFormHeightOfArch path 404 at that head. No equivalence across revisions claimed.

## Source ledger (all 14 pinned blobs re-fetched and 46 source anchors matched)
M=src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/
B=src/GroundTheory/HeightsAndTheta/Heights/ArithmeticBezout/
- M/ChowFormHeightOfArch.lean 6125310ae93f6438dd123609d603e26eeda73582 lines 14,15,16.
- M/GenIdeal.lean 10ebca1592125bca23c10ddac5eda40a3124d836 lines 92,126,77,104; full definitions StPts/StPull/StDiv/StVert/StCharts/StArch/StForm/StModel/StDim/StMain at 56–135.
- M/IsClosedOfCoheight.lean 8341150d5b8cfba3ffce52c7b969063abdcf658f lines 382,338,431,565,641,657,673; full core argument 271–680.
- M/SumNormSqUnitary.lean ba8001ffbb63f1c5fd63072b1be0e9911d455435 lines 64,80,91.
- M/FormHeightOneEq.lean 9d0aa18a4027c472ef9db40b30b8aa719629576e lines 53,131,111.
- M/IntegralOfLintegral.lean f4fc3a54cc5497db9ae6bc623265421bab42fcbf lines 22,118,186,194,207.
- M/StCharts.lean 72c1aaec797d4e62d1f49a4040ec37f3dd58625a lines 50,83,102.
- M/SpecializesIff.lean 98fa12ea4f56cac9fcf53a77807e2041b8a27d85 lines 276,306.
- B/Statements.lean 631ffa68c7ab0b2945864057ea600a61d64f3f4c lines 195,121,166,247,226.
- B/PRecursion.lean 35a3b54f4e89d741d029d27c05c7cd005285a478 lines 45,58,71,81.
- B/OfLeaves.lean 71029ac4e3add2b4c88466e0875a969937a62e19 line 44.
- M/DescEval.lean fbebe406f2346255efdb9c3a1aad646c9587d57b lines 77,110.
- M/ChowDegreeSection.lean ec5834d2108dad605a1316891f8cd7f73f809423 lines 146,19.
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/ChowFormHeightComparison.lean 8f6936bdac95711b138b0ee63cf5928518c89503 line 10 (two anchors).
Additional direct inspection: B/Assembly.lean bfc6dfcef3b6d8154e79a9be24606b49a82696e9; src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuSelfKnownTheorem.lean bf0cd8253466990e7c7e54b1f7a9fa726f5d3a44; src/Development/AutomorphicSpectrum/Proofs/AlgebraProofs/MahlerSectionStatementHoldsStatement.lean f4b35dcacb448ec2296d774393267d5f26c94574. These are not included in the 14 repeat-fetch assertion count.

## 1. Exact normalization and premises
Let K be any number field, k=[K:Q]>0, n the number of homogeneous coordinates, e the relative dimension, delta a natural, H a Hermitian norm family with conjugate compatibility, I a relevant homogeneous projective prime over K, f its Chow form in e+1 blocks, of degree delta in EACH block, and u an integral coefficient vector over O_K such that its linear form l_u is not in I. These are exactly the premises of ChowHeightRecursion.Statement, with all quantification in B/Statements:247–259. No positivity of height or logs is assumed. Set g=specFirst(f,u), the polynomial obtained by substituting u in the first block; e blocks remain. For each finite place v, write F_v(f)=log gaussNorm_v(f), where gaussNorm is the maximum of the local absolute values of coefficients on the finite support. Write M_sigma(f)=mahler(H_sigma,e+1,f mapped by sigma). Set c=harmonic(n-1)/2. The exact source definition of normalized Chow height is
  k C_{e+1,delta}(f) = sum_v F_v(f) + sum_sigma [M_sigma(f)+(e+1)delta c].
Every complex embedding is counted, not one from each conjugate pair. The formula uses log(norm), not log(norm squared); its harmonic correction is essential. The corresponding formula for g has e delta c, not (e+1) delta c.

For each v define V_v as the sum over relevant components W of the integral-model hyperplane intersection whose contraction to O_K is v:
  V_v = sum_W localMult(W) * chowDegree(reduceMod_v W,e+1) * log(absNorm(v)).
The ideals defining localMult and the index set are exactly integralModel(I)+span(l_u) in Statements:112–129; the vertical term is V=sum_v V_v. Define
  J_sigma = cycleIntegral(H_sigma,fundCycle(I extended by sigma),e,fsLog(H_sigma,sigma(u))).
Here fsLog is log(|sum u_j y_j|/dualNorm(y)), dualNorm(y)=|| (H.mat^T)^(-1)y ||_2. Cycle integral is a multiplicity-weighted sum of normalized Hausdorff integrals over the cone unit ball, real dimension 2(e+1); the denominator is the measure of the standard coordinate ball of that dimension. Keep the exact source conventions for Real.log at zero (Lean totalizes it); do not infer integrability merely from the formula.

## 2. Exact finite and infinite place cancellation (PRecursion.proof)
Four explicit input theorems: ChowFormSectionVertical.Statement, MahlerSection.Statement, ChowFormBaseChange.Statement, BaseChangeAvoid.Statement. These are NOT discharged by algebra.
The finite-place theorem says F_v(f)-F_v(g)=V_v. The source uses log_gaussNorm_support_finite for nonzero f, splits g=0 versus g≠0 using Lean's total log to establish finite support, and bounds support of V by the union of the two supports. Consequently summing is legitimate:
  F(f)=F(g)+V.
BaseChange identifies the complex Chow cycle and its projective primes; BaseChangeAvoid proves the linear form avoids every component. Mapping the first specialization commutes with coefficient embedding by map_specFirst. MahlerSection applied to the mapped multihomogeneous form then gives
  M_sigma(g)=M_sigma(f)+delta c+J_sigma.
Thus
  M_sigma(f)+(e+1)delta c=M_sigma(g)+e delta c-J_sigma.
Summing these equations and dividing by k proves the desired recursion:
  C_{e+1,delta}(f)=C_{e,delta}(g)+(V-sum_sigma J_sigma)/k.
This exact sign is necessary. The infinite-place contribution is SUBTRACTED. Omitting the harmonic correction or double-counting conjugates changes the normalization. The four leaves are supplied at CF.chowFormHeight_of_arch by ChowFormSectionVertical.full, hM, ChowFormBaseChange.full, BaseChangeAvoid.full; OfLeaves:44 passes them straight to the proof. The actual hM producer is T.mahler_section_statement_holds, forwarding to GlobalTheory.CompanionTheory.Ar.Short.mahlerSection, not a standalone verified assertion in this note.

## 3. Why the geometric height obeys the same recursion (IsClosedOfCoheight)
Assume an integral ambient arithmetic variety X over Spec O_K, Hermitian line bundle L, section embedding Emb, compatible FS norms for each embedding, and an arithmetic height function h satisfying L.IsArithHeight. For each horizontal integral closed immersion i:Z→X of topological Krull dimension e+1 assume contraction of its generic-point ideal Q to O_K is zero, and take f the Chow form of Q extended to K of block degree delta. This is the exact scope of core and core_lemma. The statement is h(i eta_Z)=k C_{e+1,delta}(f). In particular e is a relative dimension, not the dimension of the arithmetic scheme.

StPts identifies points with projective primes, inclusion with specialization, provides existence of points above the generic ideal and equivalence between a section's nonzero locus and the linear form avoiding that prime. StPull preserves these on closed immersions. By covering, choose a generating section s_j nonzero at the generic point, and u the jth unit coefficient vector. The prime contraction and localization map/comap ensure l_u avoids the generic K-ideal. StDiv identifies the nonzero Cartier multiplicities mu_z with the relevant components of Q+span(l_u) and their local multiplicities. Its actual proof begins in SpecializesIff:306 with a nonzero chart, Noetherian coordinate domain, and the height-one characterization of minimal primes over a nonzero principal ideal; no independent replay of all local length isomorphisms here.

The arithmetic height axiom and step give
  h(i eta_Z)=sum_z mu_z h(i z)-sum_sigma J_sigma.
For e>0 this uses recursion_sec; e=0 uses curveDeg_sec plus closedPoint values, with all complex points lying above the generic point, and the zero-dimensional archimedean sum. Embeddings O_K→C are in bijection with K→C (bijective_comp). No multiplicity 2 is inserted. Relevant components are finite by Noetherianity; injectivity of the point-ideal map and point existence establish a bijection with the finite nonzero-divisor support. Each closure Z_z is an integral closed subscheme of dimension e by stDim and coheight one.

Partition the finite sum into vertical components (nonzero prime contraction to O_K) and horizontal components (zero contraction).
* Vertical: height_vertical proves h(i z)=chowDegree(reduceMod_v W,e+1) log(absNorm(v)); this uses StVert's top self-intersection over the residue field and finite residue-field cardinality equals absNorm. Then vertTerm_eq identifies the sum of mu_z h(i z) exactly with V, not just an upper bound.
* Horizontal: divCycle_eq identifies the horizontal divisor weights with the generic-fibre cycle. ChowFormSection supplies g=c0 product_W f_W^(mu_W), c0 nonzero, all f_W nonzero Chow forms. For e>0, each factor has a block degree delta_W (exists_isMultiHomog_of_isChowForm_dvd), and uniqueness of the weighted degree of nonzero g gives delta=sum_W mu_W delta_W. By the induction hypothesis h(i z)=k C_{e,delta_W}(f_W) on each horizontal closure. Multiplicativity of Chow height and scalar product formula (chowHt_C_mul_prod) give sum_horizontal mu_z h(i z)=k C_{e,delta}(g). These are real dependencies; polynomial factorization by itself is not the height equality.
* At e=0, horizontal section cycle is empty: a projective prime cannot have a Chow form with zero blocks, using ProjPrimeHasPoint and not_isChowForm_zero. Then g is a nonzero scalar, and C_{0,delta}(g)=0 by chowHt_zero_groups_eq_zero. The horizontal sum is zero; no induction hypothesis at negative dimension is used.

Substitute the vertical and horizontal identities into the geometric recursion to obtain h(i eta_Z)=k C_e(g)+V-sum_sigma J_sigma=k C_{e+1}(f). The induction is precisely on e, with arbitrary closed immersed Z at each stage. stMain_of applies this to i=id and a witness h for L.IsSelfInter(a), using ambient charZero and dimension. Thus a=k C_{e+1,delta}(f). This derives the equality from the original premises, not a general unconditional intersection theorem.

## 4. Archimedean geometric bridge (actual stArch supplier)
GenIdeal:92–103 quantifies over K, integral Z, p, LB B, m sections s, e, Emb, IsArithVar, existence of Chow form of genIdeal, IsProjPrime, embedding sigma, smooth metric phi, HermNorm, IsFS, and u avoiding genIdeal. It asserts equality of chernInt on the nonzero-linear-form locus with J_sigma, and at e=0 also equality of the finite sum over complex points with J_sigma.
StCharts constructs a homogeneous q avoiding the generic prime whose nonvanishing locus admits algebraic etale charts. The construction in StCharts:50–99: complement of the generic etale open is a finite union of irreducible closed components; each generic prime contains a homogeneous polynomial absent from the ambient generic prime. Product q avoids the ambient prime by primality, and vanishes along every complementary component by specialization. StPts supplies these ideal-point properties, with stPts at SpecializesIff:276. The etale chart theorem is a separate geometric input.
IntegralOfLintegral:118–210 implements stArch. Cone-side lemmas give integrability, cycle identification and a null exceptional set including zero and q=0; q remains nonzero after localization. The function fsLog is invariant under nonzero complex scaling, since numerator and denominator acquire the same absolute scalar. Using measurable coordinates, chart coverage off the null set, and C.lintegral_cone, for every nonnegative measurable G the unnormalized cone integral of G(fsLog) equals b times the Chern-measure integral, where b is the positive finite coordinate-ball mass. The exact lemma integral_of_lintegral:22–40 converts this to equality for signed fsLog: test G=abs in extended nonnegative reals to infer integrability, then G=positive part and G=negative part; subtract and divide by b.toReal≠0. No sign assumption on fsLog is needed. With IsFS and smoothness, chernPart_neg=0; outside the section's nonzero locus the source totalized log is zero, so the signed integral agrees with chernInt. For e=0 all complex points admit charts because their underlying scheme point is generic; each chart source is a singleton. Compact discrete space is finite, and the zero-dimensional Chern measure is counting measure, proved via chart density one. This supplies both clauses of StArch. Cone-side integrability, null exceptional set, C.lintegral_cone (Jacobian and measure comparison), etale charts and all original hypotheses remain explicit obligations. We have reconstructed the glue, not independently proved those deep analytic ingredients.

## 5. Model glue to actual target
CF.chowFormHeight_of_arch accepts StArch, MahlerSection.Statement, Published.ArExists and explicitly composes stVert(stPts,stPull,stDiv), the four-leaf recursion, ChowFormSection.full, ChowHeightMul.full and ProjPrimeHasPoint.full into StMain. Then glue receives StMain, StModel, StForm and ArExists. Full ChowFormHeight hypothesis list is at VuSelfKnownTheorem:12–25, preserved in RUN3: number field, extension field, d,N,m,delta, spanning g, invertible conjugation-compatible A, coordinates y, projective closure RatModel, arithmetic variety, integral Chow form Phi, line bundle with generic trivialization, section valuations and nonzero-locus cover, invertible Mt with conjugate-unitary relation and exact norm-square identity.
DescEval.stModel gives section embedding and equality of the generic ideal to the cone ideal on coordinates g^T y. FormHeightOneEq.stForm uses a right inverse P of g (gP=1) from spanning columns, preserves irreducibility and block degree and transports incidence zeros in both directions; the image cone satisfies x=g^T P^T x. It identifies formHeight(delta,g,A,Phi) with C_{d+1,delta}(linSubst(g,Phi)), using equality of local Gauss norms, block-sphere means and the exact dual-norm relation; no assumption of square g. In glue, construct H_sigma from Mt^{-1}. Unitary conjugation proves compatibility; the dual norm is the square root of the supplied sum of squared norms. The first projection of hAr applied to the FS bundle yields an arithmetic height witness h0 satisfying IsArithHeight. This is the actual arExists input, not proved here or deemed an axiom merely because of the namespace. The FS norm formula proves the needed IsFS for every embedding. Apply StMain to h0(eta) and rewrite via the StForm height equality. Hence IsSelfInter(k*formHeight(delta,g,A,Phi)). This is the exact ChowFormHeight target used in RUN3. Actual caller uses h.p4.arExists and the Mahler producer above. The deeper producer of ArExists still needs tracing.

## 6. Executed reproducible local checks
Re-fetched all 14 primary blobs above and checked 46 literal anchors at recorded lines. Actual V8 BigInt execution, all assertions passed:
- 1,377,810 exact scalar recursion instances (arbitrary integer multiples of a common unit; not real analytic integrals).
- 1,180,980 wrong-sign negative controls, detecting every nonzero J in that grid.
- 86,436 exact weighted block-degree/multiplicative correction instances.
Equivalent replay (Python version supplied for portability, not executed here; V8 version executed):
```python
from itertools import product
cases=bad_sign=weighted=0
for e,d,h,F,A,V,J in product(range(9),range(9),range(6),range(-4,5),range(-4,5),range(5),range(-3,4)):
    before=F+V+A-d*h-J+(e+1)*d*h
    after=F+A+e*d*h
    assert before==after+V-J
    cases+=1
    if J:
        assert before!=after+V+J
        bad_sign+=1
for a,b,d,e,H,G in product(range(1,7),range(1,7),range(7),range(7),range(-3,4),range(-3,4)):
    delta=a*d+b*e
    k,c=3,5
    assert a*(H+k*d*c)+b*(G+k*e*c)==a*H+b*G+k*delta*c
    weighted+=1
assert (cases,bad_sign,weighted)==(1377810,1180980,86436)
print(cases,bad_sign,weighted)
```
These are checks of the scalar reconstruction, not proof of native geometric hypotheses, actual integration, or independent Lean validation. No source assumptions discarded. No global coverage percentage or URT advantage claimed.

RESUME HERE: reconstruct the distinct SmallSectionsInject producer Xj7N.small_sections_injective(NV) from TopCovolSlim2Use and trace small_sections_injective_of_self_intersection_bound, locating the exact regularity and norm comparison establishing the injection at degrees 8i. Also retain the open CF.C.lintegral_cone and ArExists producer as separate geometric leaves for subsequent sessions; do not redo the Chow-height recursion, metric shift, or counting normalization. HANDOFF TO: integration, editor, audit, literature, theta. Mark the Chow-height equality as source-matched conditional on the exact listed native inputs, not kernel-certified. No physics changes.
