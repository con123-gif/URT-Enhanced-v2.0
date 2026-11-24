# Geometry run 3 — exact shifted Chow-height/self-intersection identity
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the local equality and its downstream counting-volume normalization. Full RH translation PARTIAL; no independent Lean kernel execution.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual cathedral_arf_runner research protocol/log, continuity, latest CI summary (PASS 45364009178, 043409c, 09:39:34 UTC; not RH validation), geometry RUN1/RUN2 and current integration, literature, kernel, Galois, theta, character-box, Landau, prime-window and acceleration handoffs. No physics queue or gates changed. Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 73958da58a8a4d1f61b789745c5444baf6247cae, original VolumeLeSelfIntersection path returns 404 there; no cross-revision equivalence asserted.

## Source ledger
H = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
U = src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/
P = src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/
- T/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba (21)
- H/ChowFormHeightComparison.lean 8f6936bdac95711b138b0ee63cf5928518c89503 (9–12)
- H/WeilHeightInequality.lean 445fb6fde913f6ea31e0c003940d4ce96ed71a38 (10–31)
- H/VolumeLeSelfIntersection.lean 091429a5c3e58ed87fbeb6a7ef780f70c1459377 (10–65)
- U/VuSelfA.lean 69041d0d3e50e256e67646aa1b29b84a2336dc5d (13–64)
- U/VuSelfKnownTheorem.lean bf0cd8253466990e7c7e54b1f7a9fa726f5d3a44 (12–25)
- U/VuSelfB.lean 5c12211152312169a6112eba4666eebe29930ab1 (43–82,356 onward)
- H/VolumeLineBundleLe.lean 084f70a82c1d7335082f3284bf0620bcef38be05 (11–22)
- P/CountingVolumeLeSelfIntersectionNefHermitianBund.lean 95704f47d29ea425e661d65de614602ae43b81ae (13–39)
Additional source inspection:
- T/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24: final every_character_of_literature_of_vWin calls topCovolSlim2_use_alt_alt.
- H/VolumeEstimateHypotheses.lean e93eb83a9cef1478cbec92f522522b2fa3a33a55
- H/ExistsNefModelOfImage.lean 3c6930f48506b89563f7736aa44378fea26588cb
- H/SmallSectionsInjective.lean d8879d8a7eda4debcda1494cd18864c0302c24ba
- H/WeilHeightComparisonOfDegreeBound.lean 08db56669223ef219bb1b386f66b280e8d8b7245
- H/WeilHeightArchimedeanContribution.lean 8594fde18897fec5e51d38efa44601913999814f
- H/FubiniStudyChowHeightFormula.lean fc705016fa42c1f1d5ed1d878b4fad0515b35205
- U/VuSelfOf.lean e3b80e5347e532456b01b6a55fe094d34a2bc420 (parallel older Hypotheses2 version, not the chosen actual producer).
- U/HeightBoundOfHyp.lean 6fb0b65fcdbd0a601b83b60ab98592604c62cb05 (parallel older wrapper).
- src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/HermitianSectionsHeightBound.lean 52a0992a303be0c221c7497696f4263f49520258.
- src/Development/WeilBound/CoreStatements/NefModelVolumes/SelfInterBound.lean bd066f6f6141c85e11cd24f52815c1763afd93c6 (older Hypotheses2 statement).

## 1. Exact target, all hypotheses
For every number field K, K-vector space V with additive group, O_K-module and compatible scalar tower, field Omega with K-algebra structure, family Nm of real norms indexed by embeddings K→C, O_K-submodule W, K-linear evaluation ev:V→Omega, D natural, integral universe-0 scheme X with p:X→Spec O_K, Hermitian line bundle L over p, field map psi:Omega→X.functionField, section family s:W→L.B.Sec, and real t,a, assume the published Hodge bundle record hP; all embeddings of K are distinct from their conjugates; HasGram Nm; conjugation invariance of Nm; W finitely generated; K-span(W)=V; GenRatios ev; delta=imageDeg(ev,D)>0; IsModelOf(Nm,W,ev,D,p,L,psi,s); and shifted L has IsSelfInter a. Then
  a ≤ [K:Q] (D+1) delta (imageHeight(Nm,W,ev,D)+t).
The proof derives equality; preserve the original inequality statement as the formal result. No assumption that t, h, or a is nonnegative. The first four explicit premises after a are unused by the immediate WeilHeightInequality proof body (introduced as underscores), but preserved in its signature. Do not globally erase them.

Actual producer T:21 supplies the pair ⟨ChowFormHeightComparison₂.chow_form_height_comparison, Xj7N.small_sections_injective(NV)⟩. The first takes hP and constructs ChowFormHeight via CF.chowFormHeight_of_arch, CF.stArch, CF.stPts, CF.stCharts, mahler_section_statement_holds, hP.p4.arExists. Keep these exact inputs open for separate reconstruction. SmallSectionsInject is a DISTINCT premise, not a consequence of this equality.

## 2. Model to canonical projective closure
H/WeilHeightInequality obtains a rational model M of Omega from exists_pt(p,psi,hM.bij,hM.base), with X proper from projectivity. The model contains structure morphism, separation, finite type locally, quasi-compactness, point, base compatibility, generic image and surjectivity fields. Its frame hM.fs supplies N,m,b,g,A,c,gw, hF,hgw,hcb,hphi. Here b is a K-basis; g's columns generate the lattice frame; A is the archimedean matrix family; gw labels lattice elements.
The imported t_xgz_height_r_vol_up_model_mat constructs matrices Mt with det nonzero, conjugation compatibility via a unitary matrix and the exact norm-square identity
  sum_a |sum_k Mt(sigma|O_K)[k,a] sum_j sigma(g[j,k]) x_j|^2
    = archSize(A(sigma),x)^2.
The imported gen_all uses the ratios, basepoint-free condition, hG.1, K-span(W)=V and frame span to construct generic trivializations e, section values hv, a covering of X by nonzero loci hs and the divisor system hdiv. The ratio proof uses injectivity of psi (hM.bij.1) and compatibility h4 of the generic point evaluations. Keep these constructions as exact geometric leaves.

For H/VolumeLeSelfIntersection the frame, divisor system, arithmetic variety, LB structure, generic trivialization, valuations of each section, covering of nonzero loci, invertible Mt, conjugate unitary compatibility and norm-square identity are all hypotheses. Its proof derives charZero Omega, then hcomb from full frame, htop from hcomb, existence of nonzero generator and GenRatios ev. The generic divisor index i implies m≥1, so m=n+1. Obtain projective closure Z of the coordinates ev(sum_j g[j,k] b[j]). From GenRatios and positive delta, trdeg_Z(Omega)=D via trdeg over K and algebraic extension Z→K. Thus Z is an arithmetic variety of dimension D in the source convention (projective, flat in char zero, with dimension from trdeg). There is a model morphism pi:M.Z→Z.Z inducing identity of Omega; pullback will preserve the intersection number. Obtain the canonical bundle H' with its own generic trivialization, generating sections and cover. Obtain integral Chow form f' with delta positive; substitute the basis change to obtain f in b-coordinates with hf=IsChowFormInt. Nonzero f and its witness imply N>0.

## 3. Why the metric shift contributes (D+1)delta t
Write B=D+1, k=[K:Q]>0, delta>0 and F=formHeight(delta,g,A,f). The exact uniqueness theorem gives
  h=imageHeight(Nm,W,ev,D)=F/(B delta).
U/VuSelfA:13–25 proves linSubst(c A,f)=c^(B delta) linSubst(A,f): every monomial has degree delta separately in each of the B blocks, hence total degree B delta. Expand each substituted linear form; a common scalar c contributes once per power, then factor it out of the sum.
For c=exp(t)>0 the matrices c A remain invertible, the conjugate compatibility is preserved, and c Mt has the same unitary conjugation property since c is real. The norm-square identity for scaled matrices follows because both sides acquire c^2. The source uses sum_smul and archSize_smul_sq.
At each embedding the logarithmic block-sphere integral shifts by log(c^(B delta))=B delta t. U/VuSelfA:27–64 proves constant-polynomial mean under probability measure (N>0) and applies sphere_mean_mul_multihomogeneous with integrability Closed.sphereLogIntegrable, nonzero mapped/substituted form and block homogeneity. Finite/nonarchimedean part of formHeight is unchanged; sum over embeddings divided by k gives exactly the same B delta t because NumberField.Embeddings.card=k. Therefore
  formHeight(delta,g,c A,f)=F+B delta t=B delta(h+t).
No approximation, no positivity assumption on t and no extra factor 2. The metric potential uses a square norm but this height normalization uses log(norm); the formal scaling lemma fixes the convention.

## 4. Geometric transfer and exact identity
The hypothesis ChowFormHeight in U/VuSelfKnownTheorem:12–25 quantifies over number field K, K-algebra field Omega, d,N,m,delta, spanning columns g, invertible conjugation-compatible A, coordinate family y, projective closure model Z, IsArithVar, integral Chow form Phi on coneIdeal K y, line bundle H with generic trivialization, matching sections, nonzero-locus cover, invertible Mt and its unitary conjugation and exact norm-square relation. It concludes the Fubini–Study bundle's IsSelfInter of k*formHeight(delta,g,A,Phi).
Apply this to the scaled A and Mt on Z. This gives self-intersection k B delta(h+t). H/VolumeLeSelfIntersection:58–63 applies hP.p4.arProj to the model morphism, using the two arithmetic varieties, structure-map compatibility, map_generic and nonzero residue degree. U/VuSelfB:43–82 shows generic point map and residue degree 1: both generic residue fields identify with Omega and the compatible map is surjective (use surj_desc on Z and injectivity of the M residue identification), hence bijective. Thus no degree multiplier remains. Apply isometric_pull_fs to the pullback and shifted Fubini–Study metric; its IsSelfInter transport supplies the result on M. This is a stated geometric leaf, not re-proved in full here.
Finally H/WeilHeightInequality:29–31 uses isometric_fs to identify that shifted metric with the given L.shift on X, then ha.unique identifies a with k B delta(h+t). The final line is le_of_eq (by ring). This is stronger than the requested bound at the level of local source mathematics. Keep exact assumptions and imported isometries, Chow height and projection theorem as unresolved geometric dependencies. No universal self-intersection/height equality outside the specified model.

## 5. Counting-volume normalization, not lower-volume argument
H/ExistsNefModelOfImage:13–41 uses GoodOn, birational generation, NoBase, positive dg, short generators and log(shortness)≤t, plus Y.Good, host degree >2 and full signature, to produce model, shifted nef L, arithmetic dimension D, self-intersection a from hP.q11, its bound a≤k B dg(ht+t) via hPX.1, and small-section injection at degrees 8i (i≥1) via hPX.2. The counting theorem P:13–39 accepts an arbitrary commutative ring base, integral arithmetic variety, nef Hermitian L, IsSelfInter a, positive natural d and stride r, arbitrary extended-natural count m, ArithHilbertSamuel, and for each i≥1 m(ri)≤#smallSec(L^(ri)).
Since ri→∞, the nef Hilbert–Samuel normalized log count tends to a. For sufficiently large i the small-section set is finite, and its log count is nonnegative. Monotonicity of extended log and toENNReal applies to the assumed injection. At positive ri and d, the ratio defining countVol has numerator D! logCard(m(ri)) and denominator d (ri)^(D+1); rewriting (D+1)!=(D+1)D! identifies its upper bound with the nef Hilbert–Samuel expression divided by d(D+1). Take limsup of the eventual inequality and use ENNReal.ofReal continuity on the convergent real upper sequence. Thus
  countVol(D,d,r,m) ≤ ENNReal.ofReal(a/(d(D+1))).
No restriction on a needed in the formal theorem; the use of ofReal avoids invalid conversion of negative numbers. Specialize d=k,r=8. The positive denominator k B permits division of the earlier self-intersection bound, and monotonicity of ofReal gives
  volL ≤ ENNReal.ofReal(dg (ht+t)).
This is H/VolumeLineBundleLe, using hP.q9, and is not the converse VolGe of RUN1. The specific hPX.1 producer uses hP.p4.arExists and arProj, not hP.p2. This is a local direct-body result; no claim of global unused-field or kernel reachability.

## 6. Actual checks and reproducibility
Fetched the nine primary sources from PIN twice; all nine GitHub blob identities matched above. Checked 33 exact source anchor occurrences: ChowFormHeightComparison 10,12; WeilHeightInequality 12,17,19,27,29,30,31; VolumeLeSelfIntersection 17,21,26,38,58,59,60,63; VuSelfA 14,45,61; VuSelfKnownTheorem 12,17,25; VuSelfB 57,356; TopCovolSlim2Use 21 (two anchors); VolumeLineBundleLe 18,21; CountingVolumeLeSelfIntersectionNefHermitianBund 17,19,37,25. Connector V8 BigInt tests executed: 299376 shift/factorial integer identity cases, 240 block monomial scaling cases, 5 negative controls distinguishing B delta from delta (B=2..6, delta=1,c=2). All assertions held. Equivalent replay code (Python not independently executed; V8 was executed):
```python
from itertools import product
from math import factorial
cases=monomials=controls=0
for D,delta,k,H,t in product(range(9),range(1,13),range(1,13),range(-10,11),range(-5,6)):
    B=D+1; den=k*B; a=den*delta*(H+t)
    assert a==k*(B*delta*H+B*delta*t)
    assert a*factorial(D+1)==den*delta*(H+t)*B*factorial(D)
    cases+=1
for B,delta,q in product(range(1,7),range(8),range(1,6)):
    y=z=1
    for j in range(B):
        e=(j+1)%(delta+1); f=delta-e
        x=j+2; v=j+3
        y*=x**e*v**f
        z*=(q*x)**e*(q*v)**f
    assert z==q**(B*delta)*y
    monomials+=1
for B in range(2,7):
    assert 2**B!=2
    controls+=1
assert (cases,monomials,controls)==(299376,240,5)
print(cases,monomials,controls)
```
These checks are generic arithmetic regression cases, not native geometry or proof of an analytic limit. The equality is derived symbolically above; no Lean execution or kernel closure; no URT advantage or global coverage denominator. Source replay: git checkout PIN, git rev-parse PIN:path for each primary file; compare lines and full hypotheses. This note is not a registered RH CI proof.

RESUME HERE: expand actual CF.chowFormHeight_of_arch from src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ChowFormHeightOfArch.lean and its CF.stArch/CF.stPts/CF.stCharts suppliers. Reconstruct the exact finite-place and archimedean contribution equality, including all normalization and arExists inputs. Then trace the distinct small_sections_injective_of_self_intersection_bound and its local regularity/isometric injection. Do not redo metric-shift homogeneity, model comparison or counting-volume normalization.
HANDOFF TO: integration, proof editor, audit, literature, theta and all. Replace the open self-intersection-bound adapter by this equality reconstruction with geometric leaves explicitly open. Do not claim VolGe implies the counting-volume bound. 
