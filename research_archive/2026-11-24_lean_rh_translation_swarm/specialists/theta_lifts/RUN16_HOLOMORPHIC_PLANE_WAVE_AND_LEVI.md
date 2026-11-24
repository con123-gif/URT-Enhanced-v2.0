# Theta lifts RUN16 — holomorphic plane-wave normal form and Levi stabilizer

2026-11-24. RESULT: SOURCE-MATCHED / conditional reconstruction of PositivityTheory.Rg.Sw.HSt.HolTPf.holomorphic_translation_levi, with its two sign branches and actual domain, surjectivity, and weight suppliers. Project OPEN. No kernel replay, full RH translation or URT speed claim.

## Continuity / revisions
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts; general Cathedral CI checkpoint 398 PASS is not RH proof verification. Read RUN15 and the latest available Markdown handoff sections for dependency, structure, integration, math, kernel, acceleration, Galois, character boxes, prime, Landau, geometry, literature, editor and Grok native-family lanes. Editor 2156 agrees that this is theta's next target. Formal-audit lane handoff not recovered from the tree inventory; blueprint not independently reread this run. Do not duplicate RUN15 holomorphic averaging, local dilation weight or RUN14 adelic density. No physics gate or queue edits.

Source repository leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, 2026-11-24 18:24:32 UTC, merge PR #1313, unchanged from RUN15. Target pinned path returns 404 at H; this is path drift, not evidence the theorem was deleted or altered. All arguments below concern P. Exact source paths, blob IDs and replay anchors appear at the end.

## 1. Precise theorem (HolomorphicTranslationLevi:106–110)
For every n,p,q natural (no pure-signature, positive-rank or m<n assumption here), integer e, and function phi:GR(n)→C with IsHolW(p,q,e;phi), and every complex n×n matrix beta (NOT assumed Hermitian), suppose for EVERY Hermitian h and EVERY x,y∈GR(n) satisfying mR(x)=nU(h) that
  phi(xy)=exp(i tr(beta h)) phi(y).
Then for EVERY a,a' complex n×n and EVERY x,y∈GR(n) satisfying mR(x)=diag(a,a') and a† beta a=beta, one has
  phi(xy)=F0(p,q,e;x) phi(y).
No nonvanishing of phi, beta, or any Fourier coefficient required. No additional continuity premise on phi beyond IsHolW. That predicate supplies one H holomorphic on D={W: Im_H(W)>0} and the identity phi(y)=F0(y) H(Z(y)), where Im_H(W)=(W-W†)/(2i); Z(y)=zOf(y) if q=0, and -zOf(y)† otherwise. LowerRankDatum:13–18,36–41.

## 2. Exact domain and coordinate action
HolTBase:19–20 defines D by positive definiteness; ContinuousQuad:15–100 proves the equivalent Hermitian quadratic form description, openness and real convexity. For openness, continuity of Re(v† Im_H(W)v) and compactness of the unit sphere make positivity uniform near each W; any nonzero v is a positive norm times a unit vector. For convexity, Im_H is real-linear and every nonzero test vector has strictly positive quadratic form for both endpoints, hence for every convex combination (including endpoints). Thus D is open and line segments lie in it. No assumption about topology of a general automorphic quotient is used here.

ContinuousQuad:102–166 proves zOf lands in D, not just formally. Write mR(y) in blocks A,B,C,D0; put X=iA+B and U=iC+D0. The group relation mR(y)† J mR(y)=J, J=[[0,I],[-I,0]], yields the four block relations -C†A+A†C=0, -C†B+A†D0=I, -D0†A+B†C=-I, -D0†B+B†D0=0. Expansion gives X†U-U†X=-2i I. If Uv=0 then v†(X†U-U†X)v=0=-2i||v||², so v=0. Finite square U is invertible. Multiplying the skew relation by U^{-†},U^{-1} proves
  Im_H(XU^{-1})=U^{-†}U^{-1}>0.
The last inequality follows by applying the nonzero vector U^{-1}v. This also explains why the first Cayley denominator is invertible. ContinuousQuad:168–177 proves Im_H(-W†)=Im_H(W), so both sign choices land in the same tube.

Surjectivity is proved constructively in ZOfSurjBdd:14–88. For W∈D write W=X0+iY with X0,Y Hermitian, Y>0. The positive spectral decomposition gives Y=S S† with S=V diag(sqrt(lambda_j)), all eigenvalues strictly positive, and inverse T=diag(1/sqrt(lambda_j)) V†. Both ST=TS=I are checked. The group element with matrix nU(X0) diag(S,T†) has zOf=W by zOf_nm. For q≠0 first lift -W† and apply the involution again. No assumption W symmetric; arbitrary complex matrices are used. These facts supply both hdom and hsurj at HolomorphicTranslationLevi:117–132.

SphericalSectionUnipotentInvariant:37–65 establishes zOf(xy)=zOf(y)+h for mR(x)=nU(h), and F0(xy)=F0(y): upper Cayley numerator changes by hU, lower Cayley blocks stay fixed, and det(nU(h))=1. For block diagonal mR(x)=diag(a,a'), the group relation supplies a†a'=I, hence (a')^{-1}=a†; numerator is left multiplied by a and denominator by a'. This gives zOf(xy)=a zOf(y) a†, while both lower Cayley blocks multiply by a' and the full determinant multiplies, giving F0(xy)=F0(x)F0(y) (67–99). Nonvanishing F0(y) is proved at 24–35 using det_mR_ne and detU1 (both Cayley determinants), then nonzero integer powers. The deeper detU1 and group-block sources remain explicit imported dependencies.

Set c=1 for q=0 and c=-1 otherwise. In either branch Z(xy)=Z(y)+c h under unipotent translations because h=h†, and Z(xy)=a Z(y) a† for Levi elements because adjoint reverses multiplication. Also c²=1 and conjugate(c)=c. These are the exact two branches at HolomorphicTranslationLevi:133–147.

## 3. Remove the character: full holomorphic normal form
For any W∈D and Hermitian h, surjectivity gives y0 with Z(y0)=W; nU_mem' gives x0 with mR(x0)=nU(h). Substitute phi=F0 H∘Z into the assumed character law. Cancel only F0(y0)≠0, using its unipotent invariance:
  H(W+c h)=exp(i tr(beta h)) H(W).
This is HolomorphicTranslationLevi:148–161. Define
  G(W)=exp(-c i tr(beta W)) H(W).
The matrix trace is complex-linear in W, hence the exponential and G are holomorphic on D. For every Hermitian k, put h=c k, also Hermitian because c is real, and use c²=1. Then H(W+k)=exp(c i tr(beta k))H(W). Trace additivity and exp(z+w)=exp(z)exp(w) give G(W+k)=G(W). No reality condition on beta or its trace is used.

Why does invariance under the REAL Hermitian directions imply constancy in the WHOLE complex matrix domain? The exact proof const_of_transl (19–72) supplies the answer. For W∈D, openness converts DifferentiableOn to complex differentiability at W. Every Hermitian k yields the real path t↦W+t k on which G is constant; the chain rule after restriction of scalars gives D_C G(W)[k]=0. Every complex matrix v is the sum
  v = (v+v†)/2 + i (v-v†)/(2i)
of a Hermitian matrix and i times another Hermitian matrix. Complex linearity of the derivative therefore gives D_C G(W)[v]=0 for every v. Real convexity of D and the vanishing derivative imply constancy on D, by the actual Mathlib lemma convex_dom'.is_const_of_fderivWithin_eq_zero (with the open-domain derivative conversion). This includes n=0; no positive-rank premise was added.

The source's exp_trace_mul_H_const_on_dom (74–104) proves exactly that G takes the same value at every pair of domain points. Equivalent human-readable form, choosing W*=Z(1)∈D:
  H(W)=C exp(c i tr(beta W)) for all W∈D,
  C=exp(-c i tr(beta W*)) H(W*).
C may be zero. This is a repackaging of the native lemma by multiplication by a nonzero exponential, not a new source theorem or a claim about extension outside D. It is a single holomorphic plane-wave normal form on the tube; no identity theorem, division by H, or analyticity at boundary is needed.

## 4. Levi conclusion (168–179)
If a† beta a=beta, then by trace cyclicity
  tr(beta a W a†)=tr(a† beta a W)=tr(beta W).
Both W=Z(y) and aWa†=Z(xy) belong to D. Constancy of G gives equality of the two H values after cancelling their common NONZERO exponential. Therefore
  phi(xy)=F0(xy)H(Z(xy))=F0(x)F0(y)H(Z(y))=F0(x)phi(y).
The two sign branches have already been accounted for by c; no sign-dependent stabilizer is necessary. This proves the original implication conditional on the precise source hypotheses and suppliers.

## 5. Linkage and trust
Actual source consumer Holtb.holT in HolomorphicAverageUniform:68 pairs this theorem with holomorphic_average_uniform, thereby supplying the first member of HolT used as H.holT.1 in RUN15 HolCoefPf:75. That previous stage combines the Levi result with an exact character, row stabilizer and dilation weight to feed AStep.stepOf. These are static source-body edges, not an authenticated elaborated root-to-leaf path. Retain all previous upstream obligations, notably pure signature and singular testing for IsHolW, the actual detU1 proof, group membership and the arithmetic Fourier coefficient supplier. Classical Hermitian decomposition, spectral factorization, chain rule, convex derivative constancy and trace cyclicity are established general methods; no publication or novelty attribution is inferred merely from source names. No explicit sorry/admit in the target body; no transitive axiom/trust audit or Lean replay.

## 6. Reproducibility
Executed in connector JavaScript against the pinned source: 103/103 literal line checks and 7/7 expected returned Git blob IDs matched, zero mismatches. Additional source body ContinuousQuad:102–154 read after that test. This is a static source provenance test, not a theorem checker. The following independent replay uses git object bytes and representative anchors (not separately run in a local clone in this session). Run inside an upstream clone with P present.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/"
c="RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/"
d="CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
(c+"HolomorphicTranslationLevi.lean","82b2b9033cbc5296b75e47c7b13e518937a88898",[(19,"theorem herm_re"),(24,"theorem herm_im"),(31,"theorem split_re_im"),(38,"herm_Hpk_smul_left"),(45,"theorem const_of_transl"),(48,"fderiv ℂ G W = 0"),(51,"isOpen_dom'"),(57,"restrictScalars"),(60,"herm_Hpk_smul_left"),(62,"hcomp.unique"),(66,"split_re_im"),(68,"map_smul"),(71,"convex_dom'"),(74,"exp_trace_mul_H_const_on_dom"),(75,"c * c = 1"),(81,"apply const_of_transl"),(84,"Differentiable ℂ"),(91,"hcs"),(94,"hc"),(96,"trace_add"),(98,"trace_smul"),(100,"hT W hW"),(102,"Complex.exp_add"),(106,"theorem holomorphic_translation_levi"),(107,"h.IsHermitian"),(109,"aᴴ * β * a = β"),(112,"⟨H, hH, hφH⟩"),(114,"if q = 0"),(115,"if q = 0 then 1 else -1"),(121,"zOf_mem'"),(122,"neg_conj_mem'"),(127,"zOf_surj'"),(128,"neg_conj_mem'"),(136,"zOf_nU'"),(139,"hh.eq"),(144,"zOf_levi'"),(147,"conjTranspose_mul"),(152,"nU_mem'"),(154,"spherical_section_unipotent_invariant"),(159,"spherical_section_ne_zero_group"),(162,"c * c = 1"),(165,"star c = c"),(168,"exp_trace_mul_H_const_on_dom"),(171,"Matrix.trace_mul_comm"),(172,"ha]"),(174,"hlevi y"),(177,"Complex.exp_ne_zero"),(178,"spherical_section_levi_mul")]),
(c+"ContinuousQuad.lean","009b4d8fa860717c83552ef517f68c28c3e3ac40",[(15,"def imM"),(25,"theorem mem_dom_iff"),(45,"theorem continuous_quad"),(54,"theorem isOpen_dom'"),(57,"isCompact_sphere"),(60,"eventually_forall_of_forall_eventually"),(71,"norm_pos_iff"),(78,"mul_pos"),(80,"theorem convex_dom'"),(84,"imM"),(96,"ha.eq_or_lt"),(155,"theorem zOf_mem'"),(164,"conjTranspose_I_smul_add_sub_eq_neg_two_I"),(166,"posDef_imM_mul_inv_of_skew_relation"),(168,"theorem neg_conj_mem'")]),
(c+"ZOfSurjBdd.lean","9293e7953a5d1f4e1333e94bdd596b00c512986d",[(14,"theorem nU_mem'"),(19,"theorem inG_mab"),(24,"theorem inG_nm"),(27,"theorem zOf_nm"),(30,"Matrix.inv_eq_right_inv"),(36,"theorem posdef_factor"),(48,"spectral_theorem"),(50,"Real.sqrt_pos"),(74,"theorem zOf_surj'"),(76,"posdef_factor"),(81,"inG_nm"),(82,"zOf_nm")]),
(c+"SphericalSectionUnipotentInvariant.lean","e998cc4a76ac847af0ec3740da5b313ce1427d26",[(24,"theorem det_mR_ne"),(28,"theorem isUnit_first_cayley_block"),(29,"detU1"),(31,"theorem spherical_section_ne_zero_group"),(35,"zpow_ne_zero"),(37,"theorem zOf_nU'"),(42,"isUnit_first_cayley_block"),(50,"Matrix.mul_nonsing_inv"),(53,"theorem spherical_section_unipotent_invariant"),(63,"Matrix.det_fromBlocks_zero₂₁"),(67,"theorem levi_inv"),(68,"IwaPf.inG_blocks"),(72,"theorem zOf_levi'"),(75,"Matrix.inv_eq_left_inv"),(83,"Matrix.mul_inv_rev"),(86,"theorem spherical_section_levi_mul"),(98,"mul_zpow")]),
(c+"HolTBase.lean","6bbc10f2ecd77f62c7687f8f1aebb250ae0c57b6",[(19,"def Dom"),(20,"PosDef")]),
(d+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(13,"def zOf"),(16,"def IsHolW"),(17,"DifferentiableOn"),(18,"if q = 0"),(36,"def HolT"),(39,"Complex.exp"),(41,"F0 p q e")]),
(d+"HolomorphicTheta/HolomorphicAverageUniform.lean","0fd4083591381494ee126f661b677a56e0ed49d6",[(2,"HolomorphicTranslationLevi"),(68,"⟨holomorphic_translation_levi, holomorphic_average_uniform⟩")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"source anchors")
assert n==103
```

## RESUME HERE
Trace the actual producer of exists_isHolW_iteratedDeriv used by AStep.holA (AdelicDilations/DegCut:29–32, RUN15) through the HolLead predicate (LowerRankDatum:20–34). In particular retain all lower derivative vanishing quantifiers, singular test-function annihilation, the right-domain and absolute convergence premises and the pure signature disjunction. Do not infer holomorphicity of the Eisenstein derivatives from today's conditional plane-wave theorem. Request authenticated role-labelled root paths for holomorphic_translation_levi, const_of_transl, exp_trace_mul_H_const_on_dom, zOf_mem', zOf_surj', posdef_factor, spherical_section_ne_zero_group, spherical_section_unipotent_invariant, spherical_section_levi_mul, Holtb.holT, and RUN15 pending obligations. HANDOFF TO theta, editor, integration, kernel, dependencies, acceleration, audit, literature. Project OPEN.
