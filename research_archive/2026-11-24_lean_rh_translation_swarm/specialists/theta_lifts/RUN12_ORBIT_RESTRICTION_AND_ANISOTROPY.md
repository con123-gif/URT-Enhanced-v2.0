# Theta lifts RUN12 — rank obstruction and exact orbit restriction

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both branches of PositivityTheory.SiegelWeilFormula.Afc.orbRes and the actual anisotropy supplier. OPEN project. No Lean replay or URT gain asserted.

## Continuity and snapshot
Read AGENTS, research state/log/protocol and continuity excerpts, CI checkpoint 386 (unrelated physical checks PASS), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, full theta RUN11, recent integration, dependency, structure, kernel, acceleration, prime, Landau, editor, geometry, literature, character-box, Galois, math and audit handoff excerpts. No conflicting orbit-restriction task found. The linked blueprint text was fetched from the Drive file, including its definite-side Siegel–Weil discussion; the native proofs below supply details beyond that sketch. No assumption taken from the blueprint.
Upstream leanprover-community/riemann-hypothesis pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed head H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, merge PR #1313, 2026-11-24 18:24:32 UTC. At H the original GramExtendZeroEmbedded.lean blob is 2902e85ad3afd87adcb7564299ec44f059917d5e (73 lines including final empty line), LowerRankDatum.lean 50a6dbbb774c444de5da6b5e7900d599c6e7c4bb (133), SiegelWeilStdOf.lean ba9124032c534e1ddb55f57c44896c58c699a144 (645); their original counts are 171,199,72. In these same paths at H, the original orbRes/OrbRes declaration and Afc.orbRes caller anchors are absent. This is source drift, not evidence of theorem deletion or proof invalidity. No equivalence to H established; all arguments below use P.

## 1. Exact quantified result
Let F,E be number fields with the original Field/NumberField instances and Algebra F E; sigma:E→ₐ[F]E; d:SD sigma with all Wk data, in particular good, sign, min(r,s)=0 and dimensions m,n≥1. The field F, E and all instances are universally quantified by LowerRankDatum.lean:175–176 (OrbRes).
(i) If d.m<d.n, then for EVERY T:nF sigma d.Y d.b with IsND T (det of its underlying matrix T.1.1 nonzero in AE F E), and EVERY Phi:d.Fn, d.orb T Phi=0.
(ii) For EVERY L:LD d, EVERY upper T and lower T', if L.IsSub T T', then for EVERY Phi:d.Fn and Phi':L.sd.Fn with L.IsRes Phi Phi', d.orb T Phi=L.sd.orb T' Phi'.
No m<n in branch (ii), no K-finiteness or vacuum hypothesis in either branch, and no upper Schwartz assumption in OrbRes itself. IsRes includes lower Schwartz membership and pointwise equality on the zero-column slice. Do not delete that membership even though the orbit equality proof only uses its second conjunct. LowerRankDatum:90–106 preserves A, m, mu and D under rank reduction; LD includes i0, injective em:Fin L.n→Fin d.n with image all indices except i0, the embedded group map and action compatibility res. IsSub (121–122) requires the entire deleted row AND column of the target matrix to be zero, and T' to equal the retained submatrix. This is stronger than determinant zero alone.

Write iota:E→AE F E for inclR and J=d.A.J. Put G(X)=X^T J sigma(X) (entrywise sigma, X rational over E). Native gram_incM and cond_iff establish that the adelic Gram constraint is exactly iota(G(X))=(-2) T.1.1, with entrywise inclusion. Define S_T to be the subtype of all X∈Mat_(m×n)(E) satisfying this constraint. AuxiliaryPrimeFunction.lean:121–123 defines
  orb_d(T,Phi)= Avg_(g∈D,mu) [sum'_(X∈S_T) T_d Phi(mat(g^-1) iota(X))].
Here Avg is the native set-average operator, not an unnormalised integral; sum' is Lean's tsum, not an asserted finite sum. The group acts on rows. The symbol T_d is the Schwartz transform, not the Fourier label T.

## 2. Nonsingular orbit impossibility (orb_zero, lines 48–66)
Assume m<n and X∈S_T. Over E, rank(G(X))≤rank bound m: factor G(X)=X^T(J sigma(X)), where X^T has m columns. If det G(X)≠0, its rank would be n, contradicting m<n. Thus det G(X)=0. Apply determinant to iota(G(X))=(-2)T.1.1. Determinant commutes with the ring homomorphism iota, so 0=(-2)^n det(T.1.1) in AE F E. Although AE F E need not be a field, (-2)^n is a unit: -2 is nonzero in the characteristic-zero number field E, and its unit maps to a unit under iota. Cancel the unit, obtaining det(T.1.1)=0, contradicting IsND. Hence S_T is empty; tsum_empty yields zero for every g and the average of the zero function is zero. This argument neither assumes the adelic ring is an integral domain nor uses the positivity of J. It does not rule out nonsingular coefficients when m=n. The strict dimension inequality is essential to this proof.

## 3. Actual anisotropy supplier (UnfoldB.lean:14–49)
HasSig.aniso: for a complex form matrix M with HasSig M r s and min(r,s)=0, the equation x^T M conjugate(x)=0 implies x=0. HasSig supplies an invertible change of frame A taking M to D=diag(I_r,-I_s) (with the given dimension identification). The Lean proof obtains left and right inverse identities and writes x=Ay. The equation becomes y^T D conjugate(y)=0. Since either r=0 or s=0, D equals -I or I, respectively. Therefore sum_j |y_j|²=0, so y=0 and x=0. Retain the exact sign cases and congruence; an indefinite form does not have this implication.

GlobalTheory.ThK.Dbl.aniso_of: assume Base.IsGood sigma, A.IsHerm sigma B r s or A.IsSkew sigma B r s, and min(r,s)=0. Take an infinite place w of F (existence is used). The good-CM embedding law sends the sigma-conjugation into complex conjugation, and a zero rational self-pairing into a zero complex self-pairing. In the Hermitian branch use HasSig.aniso directly; in the skew branch the specified scalar conversion of the form preserves zero and HasSig.aniso applies. Injectivity of the field embedding now gives the original vector zero coordinatewise. Thus Aniso sigma J. No global positive-definiteness for arbitrary adelic vectors or all indefinite signatures asserted.
Afc.col_zero (101–109) applies precisely this supplier with d.ok.good, the two branches of d.ok.sign and d.ok.aniso. The diagonal entry G(X)_(i0,i0) is the self-pairing of column X_i0; the source rewrites finite sums to match form. If it vanishes then the entire rational column vanishes. This is the indispensable extra property for branch (ii), distinct from the rank argument. As a mathematical negative control (not a native computational test), an indefinite matrix diag(1,-1) has nonzero isotropic vector (1,1); a zero diagonal entry alone then fails to force a zero column. The proof does not generalize by forgetting d.ok.aniso.

## 4. Bijection of representation fibres (Afc.eqv, 121–146)
Let P(X)=X.submatrix id em, and I(X')=ext0 L X', inserting a zero at i0 and copying every retained column. Since em is injective with image the complement of i0, P I=id everywhere, and I P=id on the zero-column slice (extension_zero_sub, submatrix_extend_zero).
- P maps S_T to S_T': the retained Gram entries agree by gE_sub, and IsSub identifies T' with the retained block of T.
- I maps S_T' to S_T: retained Gram entries agree by gram_extend_zero_embedded, and any entry whose row or column is i0 vanishes by gram_extend_zero_left/right, matching both zero conditions in IsSub.
- For X∈S_T, the diagonal Gram equation gives iota(G(X)_(i0,i0))=0. The native kfour.inclR_injective (DoubledGroupTopologicalProperties:98–103, via tensor-product includeRight injectivity and Nontrivial AF) gives rational G(X)_(i0,i0)=0. Section 3 gives X_i0=0; therefore I P X=X. The opposite inverse P I X'=X' is immediate from em injectivity.
These maps are the actual Lean Equiv eqv between the two Gram-constrained subtypes. Anisotropy is used to prove the left inverse, not to identify or collapse arbitrary rational matrices. Neither cardinality of the fibres nor a convergence assumption is added. Bijection preserves all multiplicities of the index set.

## 5. Transfer of the actual orbital sum (Afc.orb_res, 148–161)
For each g in the same upper/lower unitary group, let Y=mat(g^-1)iota(X). Since X_i0=0, left matrix multiplication leaves the missing column zero: Y_i0=0. It also commutes with column deletion:
  P(mat(g^-1)iota(X))=mat(g^-1)iota(P X).
Apply IsRes.2 at Y:
  T_d Phi(Y)=T_L Phi'(P Y)=T_L Phi'(mat(g^-1)iota(P X)).
Hence each upper summand equals the lower summand indexed by eqv(X). The native Equiv.tsum_eq reindexes the entire tsum and tsum_congr equates summands; function extensionality gives pointwise equality in g. Both integrands then have the same native average on the same D and measure mu by congrArg. No rescaling of measure or additional scalar, no division by an orbit coefficient, no swapping of sum and integral, and no extra absolute convergence proof claimed here. The formal identity uses the native totalized tsum and average definitions; analytic identification of these with classical convergent expressions is a separate obligation.
Afc.orbRes (165–166) is exactly the pair (orb_zero, orb_res), and Afc.afc_all (JointT:7) packages it alongside uEx and fcConj_of. This finishes the two conditional source statements with the original constraints.

## 6. Exact source-body consumers (not elaborated dependency graph)
Fin.siegelWeilStd_of, SiegelWeilStdOf:63–67, supplies Afc.orbRes as the 25th argument of AStep.stepOf alongside the other 24 hypotheses (see LowerRankDatum:180–182). AStep.ndZero (NdZero:29–30) first uses H.thetaCoef on the genuine Schwartz input then H.orbRes.1 with m<n and IsND. Hence the theta Fourier coefficient vanishes; the Eisenstein-side vanishing still needs WhitLow and ordVal, not OrbRes alone.
In AStep.cOneVal_pf (SectionEqThetaZero:164–169), H.thetaCoef is applied twice and H.orbRes.2 to the actual transformed vectors d.om x Phi and c•L.sd.om g0 Phi'. The latter satisfies lower Schwartz membership by scalar stability and the Schwartz action, while IsRes.2 comes from L.res, IwaQ and T_smul. The resulting lower orbit is scaled by c via COne.orb_smul. This proves the theta coefficient comparison, not all of CTSplit. RUN9/RUN10 explain that scalar and the half-rank spectral shift separately. In particular c need not be nonzero.
These are explicit original source references. Request authenticated type/value role evidence for exact names PositivityTheory.SiegelWeilFormula.Afc.orbRes, .orb_zero, .orb_res, .eqv, .col_zero, GlobalTheory.ThK.Dbl.aniso_of, GlobalTheory.ThK.Dbl.HasSig.aniso; preserve constructor structural dependencies separately. Acceleration RUN12 has native manifest entries for Avac.vacK_of and its two helpers, but it does not establish the present direct edges. No reachability to Main inferred from source membership.

## 7. Provenance and replay
Executed on pinned original sources using connector JS: 10/10 returned blob IDs matched expected IDs and 84/86 literal line anchors initially matched. Two off-by-one line citations in UnfoldB (Nat.min_eq_zero_iff and dotProduct_self_star_eq_zero) corrected from 29/34 to 28/33 and both rechecked successfully; thus 86 corrected anchors checked, with the initial locator failures retained here. This is not a byte-level local rehash or Lean replay. Below is a minimal representative anchor and raw Git blob replay for a local upstream checkout (not executed here). All ten source identities preserved. No numerical synthetic test or runtime superiority claim.

```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
t="src/Development/WeilBound/ThetaLifts/LatticeBasics/"
rows=[
(b+"AdelicFormCongruences/GramExtendZeroEmbedded.lean","bb0d11111f10813ec5ea0fbe7789822e9615a614",[(48,"theorem orb_zero"),(59,"Matrix.rank_mul_le_left"),(65,"isUnit_neg_two_pow"),(101,"theorem col_zero"),(102,"aniso_of d.ok.good"),(121,"def eqv"),(145,"kfour.inclR_injective"),(148,"theorem orb_res"),(152,".tsum_eq"),(160,"rw [← hr.2"),(165,"theorem orbRes")]),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(92,"μ := d.μ, D := d.D"),(98,"i ≠ i₀ ↔ i ∈ Set.range em"),(113,"Φ' ∈ L.sd.sch"),(122,"T.1.1 L.i₀ i = 0"),(175,"def OrbRes"),(176,"L.IsRes Φ Φ'"),(182,"OrbRes → Step")]),
(b+"AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(23,"aniso : min r s = 0"),(121,"def orb"),(122,"⨍ g in d.D, ∑' X"),(123,"mat g⁻¹ * incM F X.1")]),
(b+"DefsPlus.lean","c785165cd72cbd00daa51ff67e0e400d77566980",[(34,"T.1.1.det ≠ 0")]),
(t+"UnfoldB.lean","35a4f7205dc1825af4056d48b7ebca680735fa63",[(14,"theorem HasSig.aniso"),(28,"Nat.min_eq_zero_iff"),(33,"dotProduct_self_star_eq_zero"),(41,"theorem aniso_of"),(49,"map_eq_zero")]),
(b+"FourierCompactness/DoubledGroupTopologicalProperties.lean","96f0f6387018aafb150983deb78e83ab64f3955f",[(98,"theorem inclR_injective"),(103,"Algebra.TensorProduct.includeRight_injective")]),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(63,"AStep.stepOf"),(65,"Afc.orbRes")]),
(b+"AdelicDilations/NdZero.lean","05314df049d2034876de64be326e9e518ce7ff6b",[(30,"(H.orbRes F E σ d).1")]),
(b+"AdelicDilations/SectionEqThetaZero.lean","8c2954a4ed5807b833067ea5a53f5e6ff4a5b171",[(115,"theorem cOneVal_pf"),(165,"(H.orbRes F E σ d).2"),(169,"L.res")]),
(b+"AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",pin+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"blob checks;",n,"representative anchors")
```

## 8. Trust boundaries and next action
The rank, definiteness, determinant cancellation and reindexing arguments are classical linear algebra and sum identities, not claimed novel mathematics or newly attributed published results. The named native producers have actual proof bodies in P. No claim of placeholder freedom, axiom audit, published provenance of the wider analytic formula, or Lean kernel validation. All 2 OrbRes conjuncts and original conditions retained; no added hypotheses. Complexity of these proof terms not benchmarked. Source-to-upstream migration and actual root-reachable typed dependencies remain to be checked.

RESUME HERE: reconstruct Afc.fcConj_of from AdelicFormCongruences/CongUnip.lean and its actual imports (ExistsGlCol, projected blocks), especially the singular T to T0 rational conjugation and distinct ratV invariance branch, preserving the auxiliary-prime condition and the Fourier-domain change of variables. Do not redo OrbRes or vacK. Keep Afc.uEx, LD.res construction, CTSplit, HolLead, FourierZero, lInt2 deeper suppliers open. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.
