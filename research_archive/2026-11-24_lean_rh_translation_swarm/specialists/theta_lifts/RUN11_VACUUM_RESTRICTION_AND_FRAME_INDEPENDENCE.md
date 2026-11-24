# Theta lifts RUN11 — vacuum restriction, frame independence and compact stability

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of native Avac.vacK_of and all three conjuncts of VacK. Mathematical premises retained; no Lean replay, complete RH proof, or URT gain asserted. Project OPEN.

## Continuity
Read AGENTS, research state/log and protocol excerpts, continuity, swarm protocol/queue/expansion, CI checkpoint 383 (unrelated physical checks PASS), full RUN10 and recent handoffs from integration, kernel, Galois, windows, Landau, literature, geometry, prime, editor, acceleration, structure, dependencies, audit, math. No overlapping vacuum restriction task identified in these notes. Linked external blueprint not reopened this session. Upstream pinned leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed head 307cef33f046955ee79dba47e0d828d06496d75f (merge PR #1266), differs from RUN10's head. VacTop, ContinuousIns and original UnitaryFramesPreserveNormSqSum paths return 404 at that head. This shows path drift, not disappearance or invalidity of the theorem; no migration equivalence claimed. All reconstruction uses original pin.

## 1. Exact statement and application
Namespace PositivityTheory.SiegelWeilFormula.Avac. VacTop.lean:14–16 proves
  vacK_of (hT : TAll) (hF : FockMem) (hO : LocOpEx) (hI : LocInst) (hA : FinAct) : VacK
using the tuple (vac_K', vac_le_fock, vac_res'). LowerRankDatum.lean:147–148 defines VacK universally for number fields F,E, their field/NumberField instances, Algebra F E, sigma:E→ₐ[F]E, d:SD sigma, R:RD d:
(i) for every Phi in d.sch with T_d Phi in R.vac, and each k in d.K, T_d(om_d(k)Phi) in R.vac;
(ii) R.vac ≤ R.fock;
(iii) for EVERY L:LD d and R':RD L.sd, every Phi in d.sch with T_d Phi in R.vac admits Phi' with L.IsRes Phi Phi' and T_L Phi' in R'.vac.
IsRes explicitly means Phi' in L.sd.sch and equality T_L Phi'(X.submatrix id L.em)=T_d Phi(X) for every X with distinguished column i0 zero. No rank inequality m<n assumed here. All SD, RD, LD field requirements and five packaged hypotheses are retained. Fin.siegelWeilStd_of uses hVK at lines 58,62,64,67 for WhitLow, Step and final standard formula; these are source-body references.

## 2. Constant polynomial vacuum inclusion
Define G_R(X)=product over infinite places w of fP(1)(R.loc w X); let vg_R(g)(X)=G_R(X) g(crd_fin X). R.vac is the complex linear span of these functions for g in SB (locally constant, compactly supported finite-adelic functions). R.fock permits a polynomial at each infinite place. For every generator choose all polynomials 1. VacCut.vac_le_fock proves the inclusion by span_le, not by claiming all Fock states are vacua.

## 3. Frame independence — actual native supplier
ContinuousIns.gauss_ext uses FrameLin.norm_frame_eq, which calls GlobalTheory.T.unitary_frames_preserve_norm_sq_sum; its statement wrapper invokes GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames. The latter has a substantive proof (not an assumed statement).

For m≥1, J a complex m×m matrix, invertible frames A,B, phases ζ,ζ' each in {1,i}, signs s,s' in Z^×={±1}, assume
  ζ A^T J conjugate(A)=s I,   ζ' B^T J conjugate(B)=s' I.
Put Q(v)=v* conjugate(J) v and α=s conjugate(ζ), α'=s' conjugate(ζ'). Conjugating the first congruence gives conjugate(ζ) A* conjugate(J) A=s I. Set w=A^-1 v; since s²=1, normSq_eq_scalar_mul_form gives
  ||A^-1 v||²=α Q(v),   ||B^-1 v||²=α' Q(v).
Use e0, the first coordinate unit vector, existing because m≥1. Both squared norms are strictly positive (invertible matrices cannot send e0 to zero); Q(e0)≠0. Dividing yields α'/α=||B^-1 e0||²/||A^-1 e0||²>0. But α and α' belong to {1,-1,i,-i}, so their ratio is a fourth root of unity, and its only positive real possibility is 1. Thus α'=α, giving equality of squared norms for ALL v. Lean instead enumerates phases and signs and uses linarith, with the same positivity witness. No blanket assertion that arbitrary frames are unitary. The frame congruences and discrete phases are indispensable. This proof is a human rearrangement of the existing native proof, not a novel theorem or extra premise.

## 4. Exact restriction of vacuum generators
ContinuousIns defines ext_L(X') by inserting zero in missing column and copying other columns through em; injectivity and range complement ensure ext_L(X.submatrix id em)=X on the zero-column slice. Finite adelic coordinates obey crd_fin(ext_L X')=ins_L(crd_fin'(X')), with ins_L the corresponding insertion on coordinate triples. The projection prj_L is continuous and satisfies prj_L∘ins_L=id; ins_L is continuous (each coordinate is either a projection or constant zero).

For g∈SB, g'=g∘ins_L is locally constant by continuity. Compact support is not inferred from continuity alone: tsupport(g') ⊆ ins_L^-1(tsupport(g)) ⊆ prj_L(tsupport(g)), the last set compact as a continuous image; tsupport(g') is closed. Thus g'∈SB by SB_ins. This addresses the potential noncompact-preimage error.

At each infinite place, sum_loc writes the Gaussian exponent as the sum over columns of the squared norm of the inverse-frame-transformed column; conjugations in RD.loc preserve norms. The missing column contributes zero, and each kept column agrees by the native norm_frame_eq from section 3 (the upper and lower datum share the form J; RD.hfr supplies congruences and RD.hζ the discrete phases). Fintype.sum_of_injective uses em and injectivity. Hence fP(1)(R.loc w ext_L X')=fP(1)(R'.loc w X') for arbitrary R,R'. Taking products and using crd_ext yields the exact formula
  vg_R(g)(ext_L X')=vg_R'(g∘ins_L)(X').
Define resL(f)=f∘ext_L, a complex linear map. The generator identity implies R.vac ≤ (resL)^-1(R'.vac), by span_le and SB_ins (ContinuousIns.res_vac). No extension of arbitrary lower Schwartz functions or surjectivity of resL is asserted. For Phi as in (iii), f'=resL(T_d Phi)∈R'.vac⊂R'.fock; FockMem gives f'∈L.sd.schM, and TAll.1 (TBij) gives a lower Schwartz preimage Phi' with T_L Phi'=f'. The ext_sub identity gives IsRes at every zero-column X, and T_L Phi' remains in R'.vac. This establishes (iii) for arbitrary L,R'. It does not construct LD or prove LD.res itself.

## 5. Compact stability, including the finite-adelic residual
CwInvIota.iota_vg: for a single infinite place w and y∈local K, LocOpEx supplies a local operator and LocInst supplies its data and compact compatibility. SchwartzOfConstantPolynomialOne.vg_tens decomposes vg as a local Gaussian times psiW from all other places and finite coordinates. psiW_indep proves independence under changes supported solely at w using additivity of coordinates and zero projections. The constant polynomial Gaussian is Schwartz by the native KMain.schwartz_polyGauss. The local action and kvac law give T_d(om(R.iota_w y)Phi)=vg_R(c g) with c=F0(p,q,e,y). No need to divide by c.

For k∈d.K, kdec supplies y at a chosen w with equal frame component and InK. It uses form preservation and conjugation by dZ(ζ); star ζ=ζ^-1 makes this conjugation preserve unitarity. The factor k0=(R.iota_w y)^-1 k has identity at w and the same components at every other infinite place (RD.off_w). In peel, induct over a finite subset S of infinite places where components are unitary and require identity outside S. At S empty, use FinAct on the actual adelic residual, not k0=1: finite places need not be trivial. gauss_indep says the archimedean product is independent of pure finite changes. FinAct returns g0∈SB and T_d(om(k0)Phi)=vg_R(g0). At insert w, apply induction to the peeled element; Schwartz stability supplies its transformed vector as the input to iota_vg, and complex scalar closure of SB gives c g0∈SB. The group law reconstructs k=R.iota_w y·k0. Take S=all infinite places and d.ok.stdK to obtain vg_K'.

For arbitrary linear combinations, define S'={Phi∈d.sch: for every k∈d.K, T_d(om(k)Phi)∈R.vac}. This is a submodule by linearity of T and om and vacuum span closure. Every generator vg_R(g) has a Schwartz preimage by FockMem, vac_le_fock and TAll.1; by vg_K' that preimage is in S'. Hence R.vac≤T_d(S'). Given any original Schwartz Phi with T_d Phi∈R.vac, choose Phi1∈S' with T_d Phi1=T_d Phi; T_inj from TBij (TAll.1) on Schwartz vectors gives Phi1=Phi (via the difference and linearity). Thus Phi belongs to S' and (i) holds. This is the original span-map proof, not a claim about arbitrary functions without T injectivity.

## 6. Provenance, trust and accelerator handoff
All five premises TAll/FockMem/LocOpEx/LocInst/FinAct remain. Deeper producers include KFock.fockMem, locOpEx_of_tAll, KAway.finAct_of_tAll, local compact kvac and Schwartz action; LD existence and LD.res remain open as before. General linear algebra, compact-support topology and group factorization are classical; named unit-frame result here has an actual source proof, not a publication attribution, and no new literature attribution is verified. No placeholder/axiom status asserted without elaborated audit.

Acceleration RUN11 reported a separately recovered candidate exact manifest name PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' (ID 8981975, encoded type/value refs 721071981,721077114), different from iwaQ_of'_k. We checked the literal namespace and theorem declaration of pinned IwaTop.lean, so this is the correct fully qualified SOURCE name, not the short Avac.iwaQ_of' request. Manifest membership and typed role evidence are still separate; peer IDs not independently extracted here. Please query exact tagged name, preserving type/value roles and distinct _k declaration. Request analogous exact roots PositivityTheory.SiegelWeilFormula.Avac.vacK_of, .vac_K', .vac_res', and GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames. No claim of kernel-level path to Main from static reference checks.

## 7. Reproducible source certificate
Executed connector JS at original pin: 11/11 supplied blob IDs matched and 77/77 literal source anchors matched. No numerical surrogate, no byte-level local rehash, no Lean kernel replay. Python replay below is an independent reproducible minimal representative-anchor and raw-byte blob check on the upstream git checkout; it was not executed in this session. Full source identities preserved.
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
a="src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/"
rows=[
(b+"VacuumIwasawa/VacTop.lean","c427bc7204967c7c87a0df6c1810eff906d6d944",16,"vac_res' L hT hF R R'"),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",147,"def VacK"),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",58,"Avac.vacK_of"),
(b+"VacuumIwasawa/VacCut.lean","fedc07b92fa916c586e9bac5fbb48d61c086a2b9",20,"theorem vac_le_fock"),
(b+"VacuumIwasawa/ContinuousIns.lean","5039849e7ea2ccce981ba59dfb171243be8aa124",113,"theorem vac_res'"),
(b+"VacuumIwasawa/CwInvIota.lean","aee15299b46ce4b16f056acc69514397dc9ebfac",103,"theorem vac_K'"),
(b+"VacuumIwasawa/SchwartzOfConstantPolynomialOne.lean","22f88d1ff2787d719a1801643fd06601a24d0925",52,"theorem psiW_indep"),
(b+"VacuumIwasawa/FrameLin.lean","59d70a9487991bda2439f7ab11075a1d1af53bc1",12,"theorem norm_frame_eq"),
(a+"UnitaryFramesPreserveNormSqSumStatement.lean","96ad911f9c068a75d3f28d98140fcc9ff948c2b3",6,"theorem _root_.GlobalTheory.T.unitary_frames_preserve_norm_sq_sum"),
(a+"UnitaryFramesPreserveNormSqSum.lean","18bc0686cbfaf8b13ed3ba5cf8a727beac520f9a",47,"theorem normSq_eq_of_unit_frames"),
(b+"VacuumIwasawa/IwaTop.lean","fc0a326c9635f836f0e78f145cc65d63b0edf6c3",17,"theorem iwaQ_of'")]
for p,sha,i,t in rows:
    raw=subprocess.check_output(["git","show",pin+":"+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,p
    assert t in raw.decode().splitlines()[i-1],(p,i)
print(len(rows),"blob IDs and representative source anchors")
```
Complexity not benchmarked; no URT experiment. No physics queue changes.

RESUME HERE: reconstruct actual Afc.orbRes (caller SiegelWeilStdOf line 65), especially the zero-column orbit restriction and nonsingular-orbit vanishing for m<n; preserve both distinct branches and its dependence on IsRes and full-rank impossibility. Do not redo vacK or IwaQ. Keep LD.res construction, CTSplit, HolLead, FourierZero and lInt2 deeper suppliers open. HANDOFF TO theta, integration, editor, kernel, dependency, audit, acceleration and literature. Project OPEN.
