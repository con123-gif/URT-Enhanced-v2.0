# Theta lifts RUN13 — singular Fourier congruence and Haar transfer

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both branches of PositivityTheory.SiegelWeilFormula.Afc.fcConj_of, including the shared actual proof fc_levi and its normalization argument cNA_pres. Project OPEN; no Lean replay, novel theorem or URT speedup claimed.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts, CI checkpoint 389 (general Cathedral checks only), full theta RUN12 and 14 recent peer commit file lists/handoff excerpts. No duplicate of this task found. Peer editor manuscript not reread in full; external blueprint identified from handoff, not reopened this run. Prior RUN12 is commit 72b9ed732ee45bda1e7711816378a14c896bddbb. No physical gate or baseline Queue changes.

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (PR #1313, 2026-11-24 18:24:32 UTC), unchanged since RUN12. At H CongUnip.lean has blob 81206fd632f95d3df4d081cb3b888f84688869dd (86 lines including final empty line), IncMFromBlocks.lean cf88816c109ef25ce5ff4e207e4a0e0705d6e672 (398 lines), LowerRankDatum.lean 50a6dbbb774c444de5da6b5e7900d599c6e7c4bb (133 lines); at P counts 180,354,199. The original anchors fcConj_of, fc_deg, fc_U and FcConj are absent in the same H paths; fc_levi remains. No claim of deletion from the corpus, migration equivalence or validation of H. Everything below uses P.

## 1. Exact theorem and quantifier order
Afc.fcConj_of (CongUnip:174–175) has type AuxiliaryPrimeFunction → FcConj. Its first argument is literally ignored by the proof term (fun _ ...). Keep it in the source theorem/interface; the two proofs do not require its evidence. Despite its name, AuxiliaryPrimeFunction is a package of a covolume datum, a rational Weyl witness and topological group/local compactness/Hausdorff/second-countability conditions (AuxiliaryPrimeFunction:206–207), not a new prime-number restriction. Do not infer a hidden arithmetic condition from the name.

FcConj (LowerRankDatum:168–173) universally quantifies over number fields F,E, their Field/NumberField and Algebra F E instances, sigma:E→ₐ[F]E, upper datum d:SD sigma, L:LD d, nb, lam, Gcal and hc:CoefData. Write K=nA sigma d.Y d.b, Lambda=nF sigma d.Y d.b, G=d.G, Gamma=rat2 sigma d.Y, iota=inclR and C=cA sigma. Let T be a rational Fourier label (in Lambda); write its underlying matrix simply T. CoefData consists of the specified upper triangular frame for nb, additive Haar measure lam, additive fundamental domain Gcal for Lambda, and lam(Gcal)=1 (DefsPlus:24–32). Define
  F_T[f](x)=integral_(beta in Gcal) f(nb(beta)x) psi(-Tr_(AE/AF)(tr(T beta))) dlam(beta).
Here tr is matrix trace, Tr is algebra trace, psi the specified additive character of AF. These are the native definitions, not arbitrary Fourier integrals.

(i) For EVERY T with NOT IsND(T) (det(T)=0 in AE), there EXIST gamma in Gamma and T0,T' (upper and lower rational labels), with L.IsSub T0 T', such that for EVERY continuous f:G→C invariant under all left Gamma translations, and EVERY x,
  F_T[f](x)=F_T0[f](gamma x).
The witnesses are chosen before f and x. IsSub means zero entire distinguished row AND column, and T' is the retained submatrix.

(ii) For EVERY uM,nu,Ucal with L.UData, EVERY T,T' satisfying IsSub, EVERY continuous left-Gamma-invariant f, EVERY u in L.ratV and x,
  F_T[f](uM(u)x)=F_T[f](x).
UData contains the specified diagonal block frame, additive Haar property, ratV fundamental domain and nu(Ucal)=1 (LowerRankDatum:117–119). The native fc_U proof uses the frame part only; preserve the other conditions in the packaged statement. Neither branch assumes m<n, a vacuum state or positive definiteness of the Fourier label. Continuity of f is present in FcConj, although the helper fc_levi does not require it.

## 2. The shared covariance theorem fc_levi
IncMFromBlocks:273–349. Hypotheses: sigma involutive, IsFrame2, psi trivial on the rational base field F, CoefData, g in Gamma with frame diag(A,D), rational Fourier labels T,T1, the equality C(A)^transpose T A=T1, f left-Gamma-invariant, arbitrary x. Its exact orientation is
  F_T[f](g x)=F_T1[f](x).
Let Ac=C(A)^transpose and Dc=C(D)^transpose. The form preserved by a group element in this frame is Q=[[0,I],[eps I,0]], eps an integer unit. From blk_rel and transpose obtain Dc A=A Dc=I and Ac D=D Ac=I. Thus A,D have genuine inverses even in the adelic coefficient ring; no field cancellation assumed there. The inverse frame is diag(Dc,Ac). The map
  tau(beta)=Dc beta D,    tau^-1(beta)=A beta Ac
is the native additive homeomorphism cNA: conjugation by g and g^-1 preserves K, and matrix multiplication is continuous. In particular nb(beta)g=g nb(tau(beta)) (309–312). Because g and its inverse are rational, rat_blocks supplies rational lifts A0,D0 and mem_nF_iff implies tau(Lambda)=Lambda, in both directions. This is stronger than preservation of K alone.

The change of Fourier label is forced by the trace identity:
  tr(T1 tau(beta))
   =tr(Ac T A Dc beta D)
   =tr(Ac T beta D)
   =tr(D Ac T beta)=tr(T beta).
This uses cyclicity of matrix trace over the commutative ring and the inverse equations, not a claim that trace is unchanged under arbitrary left and right multiplication. Consequently the original integrand equals H(tau(beta)), where H(beta)=f(nb(beta)x) psi(-Tr(tr(T1 beta))). The f factor follows by left Gamma invariance.

### Why there is no measure multiplier (cNA_pres, 232–271)
The pushed Haar measure tau_*lam is a scalar multiple of lam by Haar uniqueness. The inverse homeomorphism likewise pushes Haar to Haar, hence is quasi-measure-preserving. Because tau induces a bijection of the rational lattice and is additive, tau(Gcal) is again an additive fundamental domain for Lambda. The equal-measure theorem for fundamental domains gives lam(tau(Gcal))=lam(Gcal)=1. Meanwhile (tau_*lam)(tau(Gcal))=lam(Gcal)=1. Comparing the two expressions forces the Haar scalar factor to equal 1. This uses the specified fundamental domain normalization, not an arbitrary Jacobian cancellation. The source supplies local compactness, second countability and Borel structure from nA_top, and uses both lattice inclusions to construct the actual equivalence eF.

### Why the domain can be changed back (337–349)
For gamma0 in Lambda, nb(gamma0+beta)=nb(gamma0)nb(beta), with nb(gamma0) rational. Thus the f factor in H is periodic. Both T1 and gamma0 have rational lifts; the matrix trace of their product lies in E and its algebra trace lies in F after inclusion (psi_rat_trace:227–230, using Dense.trace_tmul). The rational-character factor therefore equals 1. So H is Lambda-periodic. The source uses hpres.setIntegral_image_emb and hfd.setIntegral_eq hc.2.2.1 hH to move the integration domain first to tau(Gcal), then to Gcal. This is the actual complete covariance argument at the level of the stated Lean integral identities. For continuous inputs the separate FcCont.fcAll establishes integrability; no unrestricted classical integrability assertion for arbitrary f is made here. The final two integral lemmas and Haar uniqueness are imported results, not newly proved here.

## 3. Singular label to zero-row/column form (fc_deg, CongUnip:113–172)
Lift T to M in Mat_n(E) using mem_nF_iff. The determinant homomorphism and injective iota show det M=0 over the number field E. Choose nonzero v with Mv=0. The source exists_gl_col (ExistsGlCol:71–83) constructs P in GL_n(E) with column i0 equal to v: take j with v_j nonzero, replace column j of identity by v (determinant v_j), then swap j and i0. The determinant remains nonzero. This does not require a basis choice depending on f or x.

For the rational form label M, nCond_rat gives M^transpose=-eps sigma(M), since the original frame has sign eps. Set M0=sigma(P)^transpose M P. Then column i0 of M0 is sigma(P)^transpose Mv=0. The row also vanishes: sigma(v)^transpose M=-eps sigma(Mv)^transpose=0. Both statements follow over E, and their images under iota give the required adelic equalities. The second identity explicitly uses the conjugate symmetry, not merely singularity. Congruence and retained-submatrix closure of nCond (ExistsGlCol:53–69) give the upper and lower form conditions. The signs agree by eps_eq (37–47), which derives eps from the underlying form sign (MemRatVIff:45–53); mixed Hermitian/skew-Hermitian cases would force the common nonzero-dimensional form A.J to be zero, contradicting its signature witness (ExistsGlCol:19–35). Rationality of the new labels follows directly from M0 and its rational retained block. Thus T0=iota(M0), T'=retained block satisfy IsSub.

The rational Levi supplier levi_ex (IncMFromBlocks:145–178) explicitly constructs diag(B,sigma(B^-1)^transpose) in the frame from any B in GL_n(E), with explicit rational inverse, preservation of Q, and rat_of. Apply it to B=P^-1 to obtain gamma. Then C(A)^transpose T0 A=T because A=iota(P^-1); indeed sigma(P^-1)^transpose sigma(P)^transpose M P P^-1=M. Applying fc_levi with input label T0 gives F_T0[f](gamma x)=F_T[f](x); reverse the equality. Using B=P instead of P^-1 in this step would in general reverse the intended label transfer. No division by a Fourier coefficient occurs.

## 4. Rational shear invariance (fc_U, CongUnip:47–98)
For u in ratV, MemRatVIff:17–32 proves u=iota(v) for v in E^(L.n): the image is closed under addition, zero and negation, so its additive subgroup closure is its image. This is algebraic closure, not topological closure. Put N=sum_j v_j E_(i0,em(j)). Since em(j) never equals i0, N²=0. Thus B=I+N is invertible over E with inverse I-N. UData supplies uM(u) with upper diagonal frame block iota(B) and an unspecified second block. The rational Levi construction supplies g with this same first block and second block C(iota(B)^-1)^transpose. By blk_rel and involutivity, the second block of any such group element is forced to be the same; injectivity of inFrame gives uM(u)=g in Gamma. This establishes rationality for the actual uM witness, not merely existence of some rational group element.

Write S=iota(N). The zero row/column condition on T gives T S=0 and C(S)^transpose T=0. Therefore
  C(I+S)^transpose T (I+S)
    =T+T S+C(S)^transpose T+C(S)^transpose T S=T.
CongUnip:26–45 (cong_unip) proves this for every adelic vector u, without rationality; the rationality of u is separately necessary in fc_U for left automorphy and the Fourier change of variables. Apply fc_levi with T1=T. This is branch (ii). Do not conclude invariance under all adelic shears from this lemma: the separate UEx density bridge plus archimedean invariance and continuity is needed.

## 5. Actual source consumers and frontier
JointT:7 packages OrbRes, UEx and AuxiliaryPrimeFunction → FcConj. Fin.siegelWeilStd_of (SiegelWeilStdOf:63–67) directly supplies (Afc.fcConj_of hA) as the 24th of 25 AStep.stepOf premises. AStep.stepJ (NdZero:70–72) applies branch (i) to the continuous left-invariant residual Bj, then uses deg on the normalized singular label. Branch (ii) is used in AStep.holCoef_pf (HolCoefPf:88–89) as the rational invariance input of UEx, alongside the separate local-place invariance; and in AStep.avgHol_pf (AvgHolPf:65–70) to replace arbitrary u by a rational translate lying in a compact set, enabling a uniform bound for the averaged holomorphic family. Those are source-body references, not authenticated kernel edges. They explain exactly why two branches are needed. Request role-labelled dependency witnesses for PositivityTheory.SiegelWeilFormula.Afc.fcConj_of, .fc_deg, .fc_U, .fc_levi, .cNA_pres, .levi_ex, .exists_gl_col, .cong_unip and .eps_eq. No claim of root reachability from names alone.

## 6. Executed source check and replay
14 pinned files retrieved, 13 independently supplied expected Git blob IDs matched, 1 additional blob ID recorded (SigmaSigmaOfGood), 117/117 exact literal line anchors matched in V8 connector JS, no locator failures. This checks source locations only, not the proof's validity. Representative replay below (not separately run in a local upstream checkout) rehashes the 14 raw Git blobs and tests selected anchors; the full 117 anchors were checked during this run. No artificial numerical test used.

```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicFormCongruences/CongUnip.lean","a0aba4e26b13b65da9a0f589309948d095a1ec6f",[(26,"theorem cong_unip"),(47,"theorem fc_U"),(57,"mem_ratV_iff"),(61,"N0 * N0 = 0"),(96,"refine fc_levi"),(113,"theorem fc_deg"),(130,"exists_mulVec_eq_zero_iff"),(132,"levi_ex hσ hb a'⁻¹"),(142,"have hcol"),(146,"have hrow"),(163,".symm"),(174,"theorem fcConj_of")]),
("AdelicFormCongruences/ExistsGlCol.lean","2ab2ba1deb3c076e11e342d2b53f842d7b9a914a",[(37,"theorem eps_eq"),(53,"theorem cong_nCond"),(63,"theorem sub_nCond"),(71,"theorem exists_gl_col"),(78,"Equiv.swap")]),
("AdelicFormCongruences/MemRatVIff.lean","e167d9eb6476b9fe2498e324a3d051ca6e16b684",[(17,"theorem mem_ratV_iff"),(45,"theorem eps_of_sign")]),
("AdelicFormCongruences/IncMFromBlocks.lean","c357c339293dcc98f56347365c4dcd6d3bf04fae",[(145,"theorem levi_ex"),(232,"theorem cNA_pres"),(258,"lam (τ '' 𝓖) = 1"),(267,"addHaarScalarFactor lam = 1"),(273,"theorem fc_levi"),(306,"let τ"),(309,"have key"),(314,"have hτF"),(318,"have hτF'"),(337,"have hH"),(344,"psi_rat_trace"),(348,"setIntegral_image_emb"),(349,"setIntegral_eq")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(117,"def UData"),(121,"def IsSub"),(168,"def FcConj"),(182,"UEx → FcConj → OrbRes")]),
("DefsPlus.lean","c785165cd72cbd00daa51ff67e0e400d77566980",[(27,"def CoefData"),(30,"def fc"),(34,"def IsND")]),
("AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(206,"def AuxiliaryPrimeFunction")]),
("FourierCompactness/SigmaSigmaOfGood.lean","99495bbe69e76dcf7a35f0adb7c97cd4ba80d404",[(125,"theorem mem_nA_iff"),(197,"theorem mem_nF_iff"),(365,"theorem sigma_sigma_of_good")]),
("AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")]),
("SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(65,"(Afc.fcConj_of hA)")]),
("AdelicDilations/NdZero.lean","05314df049d2034876de64be326e9e518ce7ff6b",[(70,"(H.fcConj"),(72,"exact deg")]),
("AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(88,"H.uEx"),(89,"H.fcConj")]),
("AdelicDilations/AvgHolPf.lean","4673a7f5fb7831b10990c909e09dc75764d6e4aa",[(70,"H.fcConj")]),
("AdelicFormCongruences/ProjectedBlockUpperSum.lean","3cd16cff53587fc3e38a8dffb4401783092e0550",[(397,"theorem uEx"),(432,"dense_vec")])]
n=0
for p,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",pin+":"+b+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,p
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(p,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## 7. Status and next step
Both original quantified branches preserved. Zero additional hypotheses. Classical matrix congruence, rational Levi embedding, additive Haar uniqueness and Fourier quotient change of variables are not asserted new mathematics; native theorem bodies and named imported lemmas are distinguished. No placeholder/axiom audit of the transitive chain, no kernel replay, no source migration equivalence, no speed benchmark. Deeper suppliers Dense.trace_tmul, Haar/fundamental-domain lemmas and topology/character constructions are open for dependency expansion. No full proof completion.

RESUME HERE: reconstruct Afc.uEx in AdelicFormCongruences/ProjectedBlockUpperSum.lean:397–434 and its actual suppliers exists_udata, uM_eq, exists_iota, dense_vec and dense_Sw (especially the tensor-coordinate extension of GlobalTheory.T.dense_rationals_plus_single_place_adeles). Prove the stabilizer is a closed additive subgroup and explain why one chosen archimedean place plus rational vectors suffices, retaining the separate local invariance hypothesis. Do not redo FcConj or OrbRes. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration and literature. Project OPEN.
