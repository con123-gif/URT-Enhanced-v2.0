# Run 12 — Weil–Deligne parameter independence under coefficient enlargement and local bridge change
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the common comparison theorem and its two applications, ending in the exact bridge-independence wrapper. Status OPEN for full RH and for the fixed-field supplier. This is a native source proof expansion, not Lean replay, not a new theorem of URT.

## Continuity / task choice
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run 11, Run 1/7/9/10, research state/log/protocol and continuity (large files in excerpts), latest CI summary (18:22:08Z run 45454648495, PASS for Cathedral checks, not RH). Recent peer notes reviewed: theta orbit restriction, Landau tails, prime allowances, kernel role masking, acceleration roots, integration signature, editor integrated manuscript, geometry residue descent, literature tangent gluing, character level tie, math primitive uniqueness; latest structure/audit/dependency commit scopes also inspected (their current artifacts are JS, not Markdown). No overlap. The exact native frob_laws and FrobLaws.exists_ext producers still could not be located by targeted import/filename/search inspection, so retain them as outstanding leaves from Run 11 instead of repeatedly paraphrasing them. Checked direct imports of the bridge comparison, LocTied, IsCrisP, DataNLoc, LocCoh, RingIface/CrisMaps, LocalIndepBridge, and related candidates; no producer found there. Some recursive Git trees are truncated; no absence claim. This run advances the distinct downstream comparison proof required even after the missing leaves are supplied. No physics queue changes.

## Provenance
Source repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005.
Observed upstream latest commit H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (changed since Run 11's 307cef33f046955ee79dba47e0d828d06496d75f).
File A: src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean.
P blob ffdce791714cb11064760245f465f9ba78449bbc; H blob 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Exact source links:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean#L234-L435
https://github.com/leanprover-community/riemann-hypothesis/blob/9282d3a102c4aff0e6026746db2a8990f5d9cddd/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean#L278-L483

## 1. Common comparison: wdPst_eq_of_map (P 251–292)
Fix a prime l, LocPrime P, a ring equivalence iota: Om(l) ≃ C, number field E, algebraic closure Omega/E, valuation subring A, place w of O_E and witness h that A lies over w. Fix the two local bridges B,B' with their respective commutative Z_l-algebras equipped with topologies, and Induces witnesses hj,hj'. The Weil group in this comparison is the same Weil(h). Let L1,L2 be finite local coefficient extensions, V1,V2 additive groups with L_i and Q_l module structures, compatible scalar towers, finite L_i-dimension. Representations rho_i live on GK(B.Kw), GK(B'.Kw), respectively. Assume finite U-dimension of DpstUr for each (U the algebraic maximal unramified extension), and potential semistability hV_i. Assume their L_i-dimensions are equal. These are not automatic from existence of an additive comparison.

Write D_i=Dpst(P,rho_i), m_i(c)=mulD(c), W_i(sigma)=weilD(sigma), N_i=monD, j_i=wdMk and X_i=WDSpace(P,iota,rho_i). Require:
- ring hom s:L1→L2 whose images in Om agree with original elements (hs), not an arbitrary coefficient conjugation;
- additive T:D1→D2, with T(bx)=s(b)T(x) for ALL b,x (hT);
- T m1(c)=m2(c) T for every c in U (hm);
- T W1(sigma)=W2(sigma) T for every Weil element (hw);
- a in L2, a≠0, and T N1=a N2 T (hN);
- for EVERY y in D2, j2(y) lies in the complex span of {j2(Tx):x in D1} (hsp).

Then wdPst(P,iota,B,h,hj,rho1)=wdPst(P,iota,B',h,hj',rho2). It is equality of the WD parameter values (via WD.sound), not equality of original representations, period rings, or arbitrary matrices.

Proof: EnlargeCoeff.chg, with hs,hT,hm and the two coefficient algebra structures induced by iota, yields the complex-linear Phi:X1→X2 with Phi(j1(x))=j2(Tx) by chg_mk. Its range is a subspace containing every j2(y) by hsp; span_wdMk says these generate X2. Thus Phi is surjective. LetterDim.finrank_wdSpace (Run 8) and hV1,hV2 give dim_C X_i=dim_L_i V_i. The equality of these ranks makes surjectivity imply injectivity. Hence Phi defines a complex-linear equivalence e.
On generators, hw implies e R1(sigma)=R2(sigma)e, where R_i=wdRho, and hN implies e M1=iota(a) M2 e, where M_i=wdN. Both extend to the full X1 by LinearMap.ext_on_range and span_wdMk. Here iota(a)≠0 because iota is injective. Notice hsp is only a span condition in X2: no surjectivity of T on D2 is assumed in this general theorem.

## 2. Nonzero monodromy scaling and Frobenius semisimplification (P 234–249, 289–292)
The helper iso_of_equiv_smul assumes two finite-dimensional complex spaces; a first pair (rho,N) with a Frobenius semisimplification A; a target representation rho' and N' with semisimplification B; smoothness of rho', nilpotence of N', the law rho'(sigma)N'=normV(w)^deg(sigma) N'rho'(sigma), a linear equivalence e, and z≠0 with e rho(sigma)=rho'(sigma)e and e N=zN'e. It constructs a semisimplification C of (rho',zN') by exists_isFrobSS: nilpotence survives scalar multiplication, and the Weil law survives because scalars commute. The cited uniqueness/compatibility ha.iso identifies A with C using e. The cited hb.iso_of_smul hz hc identifies B with C (nonzero scalar essential). Compose the first isomorphism with the inverse of the second. Do not replace this step by the false claim that N and zN are literally equal or that e itself always intertwines unscaled N.

isFrobSS_wdRep obtains its witness from wdRep_spec and isFrobSS_of_unipotent. In wdPst_eq_of_map, wdPst_of_isPst rewrites each WD value to the appropriate representative; isSmooth_wdRho, isNilpotent_wdN and wdRho_wdN supply the helper's target conditions. Finally WD.sound turns isomorphism into equality of WD values. The actual bodies of exists_isFrobSS, IsFrobSS.iso/iso_of_smul, wdRep_spec and WD.sound remain imported obligations (not independently established here).

Three exact negative controls (mathematical examples, not counted execution tests): if equal dimension is deleted, projection C²→C is surjective but not injective. If the spanning hypothesis is deleted, the zero map C→C intertwines trivial representations and zero monodromy but is not an equivalence. If z=0 is admitted, the two-dimensional nilpotent Jordan block N and the zero operator cannot be isomorphic (different ranks); this obstruction is also compatible with the Weil covariance, e.g. take Frobenius diagonal(q,1) and N sending the second basis vector to the first, q>1. Thus the scaling guard cannot be silently relaxed.

## 3. Coefficient enlargement (P 308–352)
mem_span_dQ handles the nontrivial span obligation. For Q_l-linear equivariant f:V1→V2, choose finitely many coefficients b_j∈L2 and Q_l-linear equivariant maps pi_j:V2→V1 with sum_j b_j f(pi_j(v))=v for every v. The tensor lift sum_tensQ gives x=sum_j b_j dQ(f)(dQ(pi_j)(x)) for x∈D2. Applying the additive map j2 and using wdMk_smul puts every summand in the span of j2(dQ(f)(D1)). This proves hsp without claiming f or dQ(f) is onto over Q_l.

wdPst_enlarge takes a finite coefficient inclusion L1≤L2, dimension m, representation r1 on GL_m(L1) of the decomposition group and potential semistability of B.repE(L1,r1). IsPst_enlarge supplies potential semistability after coefficient extension; hV_i.finite supplies the period finite-dimensional instances. exists_decomp gives b_j,pi_j and their equivariance and sum identity. The natural coordinate inclusion incV is equivariant by incV_mulVec; the hpi law for matrices supplies the reverse coordinate maps. Apply Section 1 to dQ(incV), natural ring inclusion, equal rank m, scalar action from tensQ_smul/incV_smul, U and Weil intertwining dQ_mulD/dQ_weilD, monodromy multiplier 1 via tensQ_onB, and Section 3's span identity. Hence enlarging coefficients does not change wdPst. Preserve exists_decomp, isPst_enlarge and the tensor identities as real dependencies, not consequences of equal rank.

## 4. Change of local embedding (P 354–403)
exists_map_conj assumes common coefficient field L with scalar tower, common vector space V, finite U-dimension for both periods, g∈GQ(l), equality g(B.j(x))=B'.j(x) for every x, membership equivalence x∈B.Kw iff g(x)∈B'.Kw, and transported representation equality rho'(k')=rho(k) whenever k'=gkg^{-1}. It returns L-linear S:D1→D2, a≠0, surjectivity, U-scalar intertwining, Weil intertwining and monodromy scaling.

Use the prior native twist existence theorem on rho' and g^{-1}: get invertible T which reverses g on U-scalars, commutes with the Galois and Frobenius actions, and satisfies T N2=a N2 T. The ordinary period conjugation conjD (the preceding Conj section of A) transports scalars by g and transports the original representation via hK,hρ. Set S=T∘conjD. It is onto because conjD is onto and T invertible. For c∈U, let c'=g(c) (BridgeInd.mem_Kur_iff). First conjD transports multiplication by c to c'; T transports c' back to c. BridgeInd.e_symm_conj and hg show the two local realizations of every Weil element are conjugate by g; the commutation of T with actD gives the required action intertwining. S intertwines phiU via conjD_phiD and the T-phi relation, and map_zpow_apply transports all integer powers including negative ones, so weilD_apply gives Weil intertwining. Finally conjD_monD and the twist monodromy relation supply hN. No claim that a is 1. Run 10/11's finite action, openness, Frobenius fixed-field and extension obligations remain in exists_isTwist.

wdPst_conj adds finite L-dimension and potential semistability on both sides, obtains S as above, and applies Section 1 with s=id_L, equal vector dimension, and hsp immediate from surjectivity of S.

## 5. Assembly for a representation valued in Om(l) (P 405–435)
wdAt_eq starts with ONE decomposition-group representation r:Dec→GL_a(Om(l)), assumed IsPstAt for BOTH local bridges. wdAt_of_isPstAt gives coefficient fields L1,L2, models r1,r2, equalities to r after inclusion, potentially semistable local representations and wdAt equalities e1,e2. Take the compositum L=L1∨L2 (supExt); both fields include into it. The two enlarged representations are equal because their images in Om(l) agree (hm1.2.trans hm2.2.symm); the native proof compares each matrix entry, using injectivity of the field inclusion. BridgeInd.exists_conj provides g,hg,hK from the two Induces witnesses. Extend potential semistability to L by isPst_enlarge. Apply wdPst_enlarge separately on both bridges, identify the enlarged representations, then apply wdPst_conj with BridgeInd.repE_conj. The outcome is equality of wdAt values for the original r.

The public wrapper wdAt_indep_bridge quantifies over l prime, P:LocPrime l, AI:LocAinf l P, Nonempty (LocTied l P AI), iota, E,Omega, their fields and algebraic closure/number field structures, A,w,O,O', both topological coefficient-ring bridges and Induces witnesses, rank a and r; assumes continuity of the matrix-valued map of r and both IsPstAt statements. Its body passes the latter to wdAt_eq and does not use the LocTied witness or continuity in this proof body. Retain these premises in the public signature: a theorem having weaker internal sufficient premises is not license to delete public inputs from later consumers.

## 6. Source chain and boundary
wdAt_indep_bridge → wdAt_eq → {wdPst_enlarge, wdPst_conj, BridgeInd.exists_conj, BridgeInd.repE_conj, wdAt_of_isPstAt}; both branches → wdPst_eq_of_map → {EnlargeCoeff.chg, LetterDim.finrank_wdSpace, iso_of_equiv_smul, WD.sound}. Conjugation branch also → exists_map_conj → exists_isTwist (Runs 9–11). This maps the actual source calls inside A, not an authenticated kernel path to Main. It clarifies the local parameter independence premise used in the earlier local-global/Row0b-to-parameter/window/nonvanishing chain; the precise external caller of wdAt_indep_bridge and its role-labelled Main reachability still require extraction. Do not mark those edges authenticated merely because the theorem names match.

## 7. Executed checks and upstream comparison
Actually executed via GitHub connector + JavaScript on both retrieved source snapshots: 51 exact pinned declaration substring assertions, nine declaration slices located. Seven complete slices are byte-identical; eight proof bodies (substring after first ':= by') are identical. Two declarations have source edits:
- wdPst_eq_of_map P251/H295: explicit Submodule.smul in hT,hN replacing notation, unchanged proof body.
- mem_span_dQ P308/H356: explicit Submodule.smul in two expressions and simplifier list dropping Submodule.coe_smul, replacing notation; statement unchanged, proof body text changed.
These are inspected textual changes, not a kernel-checked equivalence of revisions. All comparisons below were performed in JS; the equivalent local reproduction script is provided but not independently run in Python. No synthetic count of tests beyond these assertions; no Lean build, imported axiom audit, CI validation of RH, or measured URT improvement.

| Declaration | P line | H line | Entire slice identical | Body identical |
|---|---:|---:|---|---|
| iso_of_equiv_smul |234|278|yes|yes|
| isFrobSS_wdRep |244|288|yes|yes|
| wdPst_eq_of_map |251|295|no|yes|
| mem_span_dQ |308|356|no|no|
| wdPst_enlarge |330|378|yes|yes|
| exists_map_conj |354|402|yes|yes|
| wdPst_conj |391|439|yes|yes|
| wdAt_eq |405|453|yes|yes|
| wdAt_indep_bridge |425|473|yes|yes|

Reproduction (Python stdlib, local git clone with both revisions, run python check.py /path/to/clone; source assertions not Lean proof checks):
```python
import subprocess,sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
path="src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean"
def git(*args): return subprocess.check_output(["git","-C",repo,*args]).decode()
assert git("rev-parse",P+":"+path).strip()=="ffdce791714cb11064760245f465f9ba78449bbc"
assert git("rev-parse",H+":"+path).strip()=="6e6f30ca2a8b1428043c1212f4c75896a3c5d747"
p,h=(git("show",r+":"+path) for r in (P,H))
def decl(s,n):
    ls=s.splitlines()
    i=next(i for i,x in enumerate(ls) if x.startswith("theorem "+n+" "))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
checks={
"iso_of_equiv_smul":["exists_isFrobSS ρ' (z • N')","hn.smul z","hb.iso_of_smul hz hc"],
"isFrobSS_wdRep":["wdRep_spec","isFrobSS_of_unipotent"],
"wdPst_eq_of_map":["hV₁ : IsPst","hV₂ : IsPst","hdim : finrank","(s a : Om l) = (a : Om l)","(hT :","(hm :","(hw :","(ha : a ≠ 0)","(hsp :","EnlargeCoeff.chg","EnlargeCoeff.chg_mk","span_wdMk P ι ρ₂","LetterDim.finrank_wdSpace","LinearEquiv.ofBijective","LinearMap.ext_on_range","wdMk_smul","map_ne_zero ι","WD.sound"],
"mem_span_dQ":["(hsum :","sum_tensQ","wdMk_smul"],
"wdPst_enlarge":["isPst_enlarge","exists_decomp","incV_mulVec","dQ_weilD","mem_span_dQ"],
"exists_map_conj":["exists_isTwist P ρ' g⁻¹","BridgeInd.e_symm_conj","conjD_surjective","conjD_mulD","map_zpow_apply","conjD_monD"],
"wdPst_conj":["exists_map_conj","RingHom.id","Submodule.subset_span"],
"wdAt_eq":["wdAt_of_isPstAt","supExt L₁ L₂","hm₁.2.trans hm₂.2.symm","BridgeInd.exists_conj","wdPst_enlarge","BridgeInd.repE_conj"],
"wdAt_indep_bridge":["Nonempty (LocTied","Continuous","IsPstAt P Bw r","IsPstAt P Bw' r","exact wdAt_eq"]}
count=0
for n,anchors in checks.items():
    i,a=decl(p,n); j,b=decl(h,n)
    for x in anchors:
        assert x in a,(n,x)
        count+=1
    assert (a==b)==(n not in {"wdPst_eq_of_map","mem_span_dQ"}),n
    assert (a.partition(":= by")[2]==b.partition(":= by")[2])==(n!="mem_span_dQ"),n
    print(n,i,j)
assert count==51
print("51 pinned anchors; 7 identical declaration slices; 8 identical body slices. Not Lean validation.")
```

## RESUME HERE
Trace native BridgeInd.exists_conj and BridgeInd.repE_conj in A's LocalIndepBridge import and locate the actual external caller of wdAt_indep_bridge; preserve both local Induces witnesses and distinct field inclusions. Request authenticated type/value witnesses for GlobalTheory.Pst.BridgeParam.wdAt_indep_bridge, wdAt_eq, wdPst_eq_of_map, exists_map_conj, and outstanding GlobalTheory.MemLoc.frob_laws / FrobLaws.exists_ext (the latter two and EmbOrbitAlt still OPEN; do not infer source from name). Do not redo Runs 1–12; keep monodromy scaling and IsPst_enlarge / exists_decomp as dependencies. HANDOFF TO Galois, integration, editor, audit, theta, dependencies, kernel, acceleration. Project OPEN.
