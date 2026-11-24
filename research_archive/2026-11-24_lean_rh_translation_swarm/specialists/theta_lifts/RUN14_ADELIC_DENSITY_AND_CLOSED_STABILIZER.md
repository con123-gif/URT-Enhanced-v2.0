# Theta lifts RUN14 — adelic density and closed stabilizer

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both conclusions of PositivityTheory.SiegelWeilFormula.Afc.uEx and the actual scalar strong-approximation bridge, not merely an invocation of density. Project OPEN.

## Continuity and source lock
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol and continuity excerpts, CI checkpoint 392 (general Cathedral PASS, not RH validation), full theta RUN13 (4d885ec852632df13a23e891034148df18f1957e) and 14 other lanes' recent commit handoffs. Editor manuscript includes RUN13 and its next task, not a duplicate RUN14 proof. External blueprint was identified via handoff but not reopened. No unrelated physical gate or Queue changes.
P=40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis. Current observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (2026-11-24 18:24:32 UTC, PR #1313), unchanged since RUN13. At H ProjectedBlockUpperSum has blob 2d9d4e7a3eaee73390e3af745f661b59fd58e26b (107 lines including final empty line; no theorem uEx in that file); DenseRationalsPlusSinglePlaceAdeles has blob 84ff7b786562cbeb73eccf6de05fe8fbc9c2d748 (551 lines; dense_add_place starts 507). The two paths DenseRationalsPlusSinglePlaceAdelesStatement and WeakApproximationIntegral return 404 at H. This is path-level evidence only, not proof of deletion or migration equivalence. All deductions below are at P.

## 1. Exact quantified statement (LowerRankDatum:164–166)
For all number fields F,E with the Field, NumberField and Algebra F E instances, sigma:E→ₐ[F]E, d:SD sigma, R:RD d and L:LD d:
(a) there exist a function uM:V→d.G, measure nu and set Ucal with L.UData uM nu Ucal, where V=(AE F E)^(L.n).
(b) for EVERY such triple, EVERY infinite place w of F and EVERY continuous phi:d.G→C, suppose
  (i) for every u in L.ratV and every x in d.G, phi(uM(u)x)=phi(x);
  (ii) for every u in V and y in GR(d.n) with uM(u)=R.iota(w)(y), and every x, phi(uM(u)x)=phi(x).
Then for every u in V and x in d.G, phi(uM(u)x)=phi(x).
UData (117–119) contains the exact upper frame block, additive Haar measure, fundamental domain for ratV and nu(Ucal)=1. ratV (115) is the algebraic additive subgroup closure of the coordinatewise rational image, not its topological closure. No extra assumption of m<n, vacuum state, or positive definiteness of a Fourier label in UEx itself. The selected w need not vary with x or u. Local invariance (ii) is a separate premise, not a consequence of rational invariance alone.

## 2. Canonical shear and normalized fundamental domain
ProjectedBlockUpperSum:23–90,136–206,216–265.
Let N(u)=sum_j u_j E_(i0,em(j)). Since em(j) != i0 by LD.rng, N(u)N(v)=0 for all u,v; N is additive. With C=cA sigma, put
  Z(u)=diag(I+N(u), I-C(N(u))^T).
Then Z(u)Z(v)=Z(u+v), Z(0)=I, Z(-u)=Z(u)^(-1). In the frame the form is Q=[[0,I],[eps I,0]]. Involutivity of C follows from the good datum, and block multiplication yields Z(u)^T Q C(Z(u))=Q. Conjugation by the rational frame b constructs the actual group point U(u)=unipotentPoint L u, with inverse U(-u). Both value and inverse maps are continuous (175–178), not just the matrix entries of the value. Therefore U is a continuous additive-to-multiplicative homomorphism.
For an arbitrary UData witness uM the frame has first block A=I+N(u) and second block D'. Form preservation forces A^T C(D')=I. The canonical second block D has the same property. Because the matrices are square over the commutative adelic coefficient ring, the source uses mul_eq_one_comm to obtain C(D')A^T=I; thus C(D')=C(D')A^T C(D)=C(D). Involutivity and frame injectivity give uM=U (187–206). Do not assume an arbitrary uM is a homomorphism before this identification.
The rational subgroup is exactly incV(E^L.n) (216–230), by closure under addition and negatives. It is discrete by the coordinatewise neighborhood isolating the rational zero (232–252). It is cocompact by a finite product of compact scalar sets whose rational translates meet every coordinate (254–258). meanSquare_addFundamentalDomain_of_cocompact (264) supplies nu and Ucal, normalized to one. Together with the canonical shear this constructs (a), not just its assumed existence. The scalar discreteness/cocompactness and fundamental-domain theorem are independent imported suppliers.

## 3. Why rational vectors plus ONE infinite place are dense
Let A_F denote the base adele ring; define B_w={a in A_F : a_f=0, a_v=0 for v!=w}. The actual imported theorem GlobalTheory.T.dense_rationals_plus_single_place_adeles is a wrapper whose proof at P calls GlobalTheory.CompanionTheory.AddSA.dense_add_place (DenseRationalsPlusSinglePlaceAdelesStatement:5–6). This is additive strong approximation away from the chosen place, followed by an exact local correction, not density of the diagonal field by itself.

### 3a. Native base-field proof (DenseRationalsPlusSinglePlaceAdeles:12–104)
Given an arbitrary nonempty open neighborhood in A_F, use product neighborhoods O_v for the infinite components and a neighborhood U_f of the finite component y. For every v!=w we need a rational t with t_v in O_v, and simultaneously t_f in U_f. The exact finite-neighborhood argument is important: a finite set of arbitrary local approximations alone is insufficient to control the restricted product.
Translate U_f by -y. The native integral-neighborhood supplier gives a nonzero d in O_F with d times the integral finite adeles contained in U_f-y. Put e=d^(-1) diagonally in the finite adele ring. The exceptional finite set T2 contains places where e or ey is not integral; it is finite by restricted-product membership. At v in T2 impose the open condition e_v(t_v-y_v) integral, which contains y_v. Apply exists_approx_core with omitted place s=inl(w), T1=all infinite places except w, and T2 as above. It supplies t meeting all specified conditions and integral at all remaining finite places. At v outside T2 both e_v and (ey)_v are integral, so e_v t_v-(ey)_v is integral as well. Therefore e(t_f-y) is globally integral; multiplication by d proves t_f in U_f.
Now let b have its only nonzero possible component at w, equal to a_w-t_w, with finite part zero. Then t+b agrees exactly with a at w, retains t at all other places, and belongs to the specified neighborhood. Hence F+B_w is dense. This is the actual open-set argument of dense_add_place, not an assumption that a rational approximation converges at every place simultaneously.

### 3b. Concrete approximation-core supplier (WeakApproximationIntegral:182–269)
For any omitted place s, finite T1,T2 not containing s, target coordinates cI,cF, infinite neighborhoods OI, and open finite sets OF containing cF, the theorem supplies t in F satisfying OI on T1, OF on T2, and integrality at every finite place outside T2 except s. The current use is only s=inl(w).
Construct an adele x with infinite part cI and finite part xF supported on T2, taking the specified targets there. Choose radius r>0 so cI_v minus a ball of radius r lies in each required OI. Choose nonzero integral d scaling each local integral ball into cF_v-OF_v for v in T2 and preserving integrality elsewhere. Choose a compact set C of archimedean adeles such that each full adele can be translated by a rational to land in C at infinity and in the integral finite adeles at all finite places (imported GroundTheory.Global.exists_isCompact_forall_exists_sub_mem). Let R>0 bound its archimedean coordinates.
exists_small supplies nonzero y with |dy|_v<r/R at every infinite place v other than s and |y|_v<=1 at every finite place other than s. In the archimedean omitted-place branch (55–78), enlarge only the bound at w to meet the Minkowski volume threshold, then choose a nonzero algebraic integer by exists_bound; integrality at all finite places follows. This relies on adjust_f and Minkowski, not on a new RH result. The unused finite omitted-place branch uses a supported prime power and norm growth (79–116), retained as a theorem dependency but not required for this specialized argument.
Put y0=dy != 0. Translate y0^(-1)x by a rational k to obtain residual e0 in the compact/integral domain. The exact equation is
  x=y0*k+y0*e0.
Take t=y0*k. At each required infinite place, |y0_v e0_v| <= |y0_v| R < r. At each finite place other than s, y_v e0_v is integral; hence y0_v e0_v belongs to d times the local integral ring. This makes t_v=cF_v-y0_v e0_v lie in OF at T2, and t_v=-y0_v e0_v integral elsewhere. All signs and positivity assumptions retained. No bound on t at the omitted place is demanded. The compact fundamental-domain and Minkowski leaves remain independent mathematical obligations.

### 3c. Tensor-coordinate extension (ProjectedBlockUpperSum:273–314)
For the upper datum, S_w={z in AE : piInf(d.B.emb v)z=0 for v!=w, finOne*z=0}. For the finite F-basis b_k of E and its tensor-extended AF-basis b^A_k of AE, the map
  Phi:(AF)^r→AE, (a_k)↦sum_k a_k b^A_k, r=[E:F],
is continuous by the finite sum of continuous scalar multiplications and surjective by basis representation. The finite product (F+B_w)^r is dense. Its continuous surjective image is dense. If a_k=q_k+s_k with q_k rational in F and s_k in B_w, the rational part maps to inclR(sum q_k b_k), by tensor inclusion and scalar compatibility, while the correction sum s_k b^A_k belongs to S_w by its zero finite and off-w components. Thus inclR(E)+S_w is dense in AE. Taking L.n coordinate products gives dense_vec, precisely the density of D={incV(e)+s : e in E^L.n, all s_j in S_w}. This is a topological density statement, not exact decomposition of every adelic vector.

## 4. Why every single-place shear lies in the actual local subgroup
ProjectedBlockUpperSum:322–395. For all s_j in S_w, at v!=w the projected N(s)=0 and Z(s)=I, and the finite part of Z(s) is the finite part of I. At w put Z_w=cw_w Z(s) and Z'_w=cw_w Z(-s). They are inverse and Z_w preserves Qc(d.n,R.eps). With D_zeta=dZ(d.n,R.zeta), R.hζ implies zeta!=0 and the conjugated matrix M=D_zeta Z_w D_zeta^(-1) represents an element y in GR(d.n) (Krd.inG_conj). Its inverse is the corresponding conjugate of Z'_w. The original RD conditions at_w, off_w and off_f then identify R.iota(w)(y) and U(s) in all infinite and finite components. Place.cw_ext and frame injectivity establish actual group equality. This proves exists_iota. A vector supported at w is not merely approximately a local group element. The supplier RDIota:32–58,199–229 constructs the local embedding with precisely these component conditions; the proof still depends on the coordinate extensionality and form-conjugation leaves.

## 5. Closed stabilizer argument (ProjectedBlockUpperSum:397–434)
For the continuous function phi define S={u in V : for all x, phi(U(u)x)=phi(x)}. It is an additive subgroup:
- 0 acts as identity.
- if a,b stabilize, phi(U(a+b)x)=phi(U(a)U(b)x)=phi(U(b)x)=phi(x).
- if a stabilizes, apply its invariance at U(-a)x to get phi(x)=phi(U(-a)x).
For each fixed x the equalizer of u↦phi(U(u)x) and u↦phi(x) is closed since both are continuous and C is Hausdorff. Their arbitrary intersection is S, hence S closed. Rational invariance puts incV(E^L.n) in S, and exists_iota together with the SEPARATE local premise puts every single-place vector in S. Additivity gives D⊆S. Since closure(D)=V and S closed, S=V. This yields all u and x, completing (b). Neither compactness of S nor a finite set of x nor a limit of individual stabilizers is needed. In particular the logical mechanism is closure of a subgroup generated by two supplied invariance families; deleting either family is not licensed.

## 6. Actual consumers, provenance and validation
JointT:7 packages OrbRes, UEx and AuxiliaryPrimeFunction→FcConj. SiegelWeilStdOf:65 passes Afc.uEx to the rank step. HolCoefPf:88–110 directly applies H.uEx to the continuous Fourier coefficient; rational invariance comes from H.fcConj and local invariance comes from the separately established row stabilizer and determinant-one weight. Therefore UEx does not replace either of these analytic inputs. These are source-body references only, not authenticated kernel edges. Request role-labelled root-path witnesses for PositivityTheory.SiegelWeilFormula.Afc.uEx, .exists_udata, .uM_eq, .exists_iota, .dense_vec, .dense_Sw, GlobalTheory.T.dense_rationals_plus_single_place_adeles, GlobalTheory.CompanionTheory.AddSA.dense_add_place, .exists_approx_finite and GlobalTheory.CompanionTheory.PlaneSA.Additive.exists_approx_core.
This is a human reconstruction of native code using classical additive strong approximation, Minkowski geometry of numbers and continuity. No claim these classical mechanisms are novel, and no external publication attribution inferred from names. No explicit sorry/admit in the displayed uEx, dense_add_place or exists_approx_core bodies; transitive axiom/placeholder audit and independent Lean replay not done.

Executed in connector V8 JS: 90/90 literal source line anchors matched and all 9 returned Git blob IDs matched the recorded expected values (no failures). This is static source provenance only; no raw-byte rehash or Lean execution in this environment. Replay below rehashes all 9 files in a local upstream checkout and checks representative anchors (not separately executed here).
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
a="src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/"
rows=[
(b+"AdelicFormCongruences/ProjectedBlockUpperSum.lean","3cd16cff53587fc3e38a8dffb4401783092e0550",[(27,"theorem uN_mul"),(51,"theorem uZ_mul"),(175,"theorem continuous_unipotentPoint"),(187,"theorem uM_eq"),(260,"theorem exists_udata"),(288,"theorem dense_Sw"),(309,"theorem dense_vec"),(351,"theorem exists_iota"),(397,"theorem uEx"),(423,"isClosed_iInter"),(431,"closure_minimal"),(432,"dense_vec")]),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(115,"def ratV"),(117,"def UData"),(164,"def UEx"),(166,"R.ι w y")]),
(a+"DenseRationalsPlusSinglePlaceAdelesStatement.lean","95333c5806340adb6bffd30503f88250137ec9cf",[(5,"dense_rationals_plus_single_place_adeles"),(6,"dense_add_place")]),
(a+"DenseRationalsPlusSinglePlaceAdeles.lean","8e110bfbc14d90109c6f023d66366b27964aaf0a",[(12,"theorem exists_approx_finite"),(38,"exists_approx_core"),(56,"sub_mem"),(66,"theorem dense_add_place"),(79,"Function.update"),(101,"simpa using ht₂")]),
(a+"WeakApproximationIntegral.lean","1930fd367106622f38bdc34725da40e736d88879",[(17,"theorem exists_bound"),(55,"theorem exists_small"),(182,"theorem exists_approx_core"),(220,"exists_isCompact_forall_exists_sub_mem"),(228,"have hxe"),(269,"neg_mem")]),
(b+"CayleyTransform/RDIota.lean","4bc348af91d22145149221e45ae77047518b9a59",[(52,"theorem cw_atM"),(56,"theorem fin_atM"),(221,"theorem iotaEx")]),
(b+"AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(88,"H.uEx"),(89,"H.fcConj"),(110,"weight_factor_det_one")]),
(b+"AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")]),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(65,"Afc.uEx")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## RESUME HERE
Reconstruct AStep.holCoef_pf (HolCoefPf:52–110), specifically the local row-stabilizer/weight argument that supplies the separate local hypothesis in UEx and the dilation weight exp(tau*m). Expand WeightFactorDilation, stab_row, det_row and decW_pf suppliers and keep the pure-signature hypothesis pp=m,qq=0 or pp=0,qq=m. Do not repeat UEx or FcConj. Keep compact adelic-domain, adjust_f, normalized Haar and coordinate-extensionality leaves open. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.
