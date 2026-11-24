# Theta lifts run 6 — construction of SWFull and removal of the exceptional spectral point

2026-11-24. RESULT: SOURCE-MATCHED conditional proof of swFull_of and IsEisCont.update, with both actual upstream standard analytic producers located. This supplies RUN5's SWFull input, not independent proofs of all upstream analytic/representation-theoretic lemmas.

## Continuity
Read AGENTS, swarm protocol, handoff queue, expansion, runner protocol/log, continuity, research-state excerpt and recent lane handoffs (character boxes, Galois, kernel, Landau, literature, acceleration, positivity, prime, editor, integration, structure, dependencies, math), plus theta RUN1–5. Physical CI PASS run 45387831523 at 12:12:53 UTC is unrelated to RH. Blueprint caveat noted from queue; not independently reread PDF. Work at original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed c6d67c05b648be9f1993aa84bd32c29ea9d2fb72 at 12:17:35 UTC, CI ready-command merge. Current SWFull, EisCont, SiegelWeilAnisoOf have different blob hashes e790066b86d65dd9d4fff2aa50233362ea4845a7, b91b7a002f605c33003a7f63c65eaa1230948c55, df81ac67ed4621704a2106f9a442b1dc406f12ba respectively. Current Reductions/TopPolarZero/PolZero has 6bc5abdaf8999a267bc96aa7541b435d49ed4e09. No equivalence claimed. This chapter uses only original pinned declarations.

## 1. Exact actual construction

PolZero.lean (Reductions/TopPolarZero) constructs p1 = siegelWeilAniso_of p0 frameConj finLevel stab2Cpt and l1 = boxSec_of finLevel stab2Cpt; its coefficient-transfer call is swFull_of p1.1 (eisContinues_of p2 frameConj) l1. Here p0 : SiegelWeilStd and p2 : EisBL are actual arguments of polynomial_vanishing_of_compactness. They are not identical statements.

Fix number fields F,E, algebra and involution sigma, base B.IsGood, positive integer ranks m,n, hermitian A of signature (r,s) with min(r,s)=0, skew-hermitian Y of signature (r',s'), good model M, Hecke character chi with ResEtaPow on the embedded base-field unit subgroup at exponent m, doubled representation dd,om,S,l with IsDblCoord and IsDbl, compact stabilizer K and height a with IsStab2 and IsHgt, and Phi1,Phi2 in PolData B M. These are precisely the SWFull premises; the typeclass instances and all universally quantified choices are retained. Write Phi=boxFun(Phi1,star Phi2), f(x)=l(om(x)Phi), s0=(m-n)/2 (complex subtraction, not truncated natural subtraction), and f_z(x)=a(x)^(z-s0) f(x).
The three explicit inputs to swFull_of are:
1. SWAniso: for every x separately there exists a global meromorphic function e_x(z) agreeing with the original Eisenstein sum on a sufficiently far right half-plane, analytic at s0, and taking at s0 the value
V(x) = (if n<m then 1 else 2) times the set-average over M.dom of thetaSum F (om(x)(S(g)Phi)) with measure M.mu.
2. EisContinues: for any appropriate section f there is one common function E(z,x) and open preconnected U, satisfying all seven IsEisCont fields and local pole-clearing regularization IsRegAt at EVERY complex point, including points outside U.
3. BoxSec: the chosen f is a continuous section with the exact parabolic law chi(det t) absE(det t)^(s0+n/2) and finite-dimensional span of right K-translates.

The proof first uses 3 and 2, obtaining U,E, then uses 1 at the SAME section and s0, plus the pole-clearing witness at s0 from 2. By IsEisCont.update it defines U'=U union {s0}, E'(z,x)=E(z,x) off s0, V(x) at s0. This is the exact conclusion SWFull. It does NOT assume that E was regular at s0 or that the original sum converges there. The rank factor stays 1 for n<m and 2 otherwise (including equality); in CoefLine m=a', n=a+a', so it is 2. No change of normalization.

## 2. Why the exceptional point can be inserted

The helper mero_eq is meromorphic uniqueness on U: for fixed x, e_x-E(.,x) is meromorphic on U because E is holomorphic there. On a half-plane beyond the maximum of the two convergence thresholds, equality follows from uniqueness of HasSum. Its meromorphic order is top (identically zero germ) at one point there and hence throughout preconnected U. At any s in U where e_x is continuous, equality of punctured germs and uniqueness of limits give actual pointwise equality. The continuity requirement matters because a meromorphic function represented with an arbitrary value at an isolated point need not have that value determined by its punctured germ.

IsEisCont.update, SWFull.lean:50–103, proves all seven fields, not only pointwise holomorphy:
- isOpen: U is open; the disc field supplies a punctured neighborhood of s0 contained in U. Thus U' is open.
- conn: s0 lies in closure U by the same punctured-neighborhood property; preconnectedness persists upon adjoining a closure point.
- disc: inherited by inclusion U subset U'.
- half: increase the threshold to max(t,Re(s0)), ensuring no point of that half-plane is updated and the exact original HasSum survives.
- hol: for z != s0 local equality with E. At s0 fix x, use analyticity of e_x on a neighborhood; on the punctured part mero_eq identifies it with E, and at s0 the supplied value V(x) agrees by definition. Therefore E'(.,x) has the same analytic germ as e_x there.
- cont: choose a closed disk centered at s0 in U' and inside the regularization neighborhood. On its boundary circle E' equals E. For any fixed x0, joint continuity there and compactness of the circle give uniform smallness of |E'(z,x)-E'(z,x0)| for x near x0. For fixed x this difference is holomorphic on the disk and continuous on its closure; the maximum modulus principle transfers that same bound to its interior. Add continuity of E'(.,x0) to obtain joint continuity at (s0,x0). This is contAt_of_sphere, lines 28–48. Away from s0 joint continuity is inherited.
- grow: the pole-cleared witness H from IsRegAt has H(z,x)=(z-s0)^k E(z,x) off s0 and |H(z,x)|<=C height(x)^N on a neighborhood. Choose disk radius rho>0 within both neighborhoods. On the circle the resulting bound is |E'(z,x)|<= (C/rho^k) height(x)^N, uniformly in x. The maximum modulus principle for each fixed x gives that bound throughout the disk. Away from s0 shrink the old growth neighborhood so it excludes s0. The original exponent N is unchanged in the updated disk, the constant increases if rho<1 and k>0. Both positivity of rho and the common disk independent of x are essential.

This gluing argument is an actual proof body in the pin. In particular pointwise existence of e_x alone does not establish joint continuity or uniform growth; those use the common continuation and the pole-clearing witness. The proof never assumes a common convergence threshold for all e_x: mero_eq is applied at fixed x and takes max of the two relevant thresholds there.

## 3. Derivation of the two different analytic inputs

SWAniso is the first component of SiegelWeilAniso = SWAniso AND SWAnisoX (do not omit the second component from the parent theorem). In SiegelWeilAnisoOf.lean, siegelWeilAniso_of takes SiegelWeilStd, FrameConj, FinLevel, Stab2Cpt. Both hermitian/skew variants are covered. The first branch uses polData_kfin and box_kfin to prove the finite-dimensional orbit condition of the standard statement. Its helper sw_transl changes from K to a standard frame K0=p^{-1}Kp with p parabolic, positive d=absE(det t), a0(x)=d a(xp^{-1}) and Phi0=om(p^{-1})Phi. The standard formula evaluated at xp uses the meromorphic function e(z). Multiplying by d^(s0-z) cancels the extra height factor from the flat section, and is entire since d>0. At s0 the multiplier is 1, and dbl_comm (proved using the injectivity of the Schrödinger translates of the theta distribution via character orthogonality) commutes the parabolic om(p^{-1}) action past S(g). The original theta average is recovered. The second variant additionally uses transpose and the stipulated doubled-coordinate identification; it is not invoked by p1.1 but remains a parent proof obligation.

EisContinues is supplied by eisContinues_of EisBL FrameConj. The same change of frame transports a section f to f0(x)=f(xp^{-1}), preserving its finite-dimensional right-orbit space by conjugacy. EisBL gives convergence and holomorphy in a right half-plane and, at every s0', a neighborhood U0, integer k and weakly holomorphic H into the moderate-growth function space modFun with H=(z-s0')^k E on the punctured neighborhood. Weak here means all linear functionals bounded on each fixed height-growth unit ball (IsGrowForm), not just point evaluations.

The source's reg_of_weak upgrades this to strong local regularity: compact spectral neighborhoods and weak holomorphy bound every growth-bounded linear functional. RegOfBound.unif_bound proves a common C,N by contradiction. If none exists choose (s_j,x_j) with |H(s_j)(x_j)|>j 2^j height(x_j)^j. Weighted evaluations w_j=2^{-j}/height(x_j)^j give linear maps B(f,c)=sum_j c_j w_j f(x_j) for bounded sequences c. For fixed polynomial growth degree N, the terms are geometrically summable because height>=1 and all j>=N have height(x_j)^(N-j)<=1; finitely many initial terms give a finite constant. Thus for each c, B(.,c) is IsGrowForm and the operators c->B(H(s_j),c) are pointwise bounded. Banach–Steinhaus bounds their operator norms, contradicted by testing on the j-th unit vector (value >j). Point evaluation also proves separate holomorphy; reg_of_bound uses a local holomorphic disk estimate and the continuity of the height to obtain joint continuity. Reg.mul transports these bounds under the scalar d^(s1-z) and right translation using height(xp)<=height(x)height(p).

eisCont_of_reg defines U as the set where E is locally regular. Reg.punct divides by (z-s0')^k on punctured neighborhoods; Reg.remove includes the right-half-plane points where pointwise holomorphy already holds, using the boundary circle argument. An.preconn derives countability of the complement via Lindelöf and hence preconnectedness of its complement in the complex plane (real rank two). IsEisCont's fields follow from Reg and convergence, and the original local pole-clearing data give IsRegAt at all points. No independent analytic continuation theorem has been proved from scratch in this chapter: EisBL and the frame/section premises remain inputs to these derivations.

## 4. Provenance of the actual two source producers

The original EveryCharacterOfLiteratureOfVWin.lean:561–566 calls PositivityTheory.RgEis.Hd.eisBL and PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd via wrappers that accept O but do not use it in their bodies. The actual bodies are located, not inferred from names.

- SiegelWeilStd.lean: siegelWeilStd_of_ct (Act.ctSplit_of kfour.auxEx kfour.coefEx). SiegelWeilStdOfCt passes TW.Twp.poisson to siegelWeilStd_pre. The latter builds tWeyl_of from TBij.tBij, tTheta, TW.UpToPf.upTo_of TW.Twu.uniq, Poisson and TW.ThetaWPf.thetaW; supplies KFP.kFinPoly_of and Ald.ldEx_of to siegelWeilStd_mid. Mid invokes siegelWeilStd_of with tAll_of, locInst_of, Kdil.gIdil_full, KFinPoly, KK.polyKFin_of, LDEx, CTSplit and HSt.holLeadB. The exact ctSplit_of body takes AuxiliaryPrimeFunction and CoefEx as unused arguments and calls ctSplit_of_parts indepDom cptDom absConv firstEq (secLaw_of (secUnf_of absConv)). This is an observed syntactic fact, not a claim that those two terms never appear in elaborated proof types or transitive dependencies.
- EisBL actual producer is in SiegelEisensteinHalfPlane/SchwartzBruhatMajorants/SiegelMultOf.lean, NOT the similarly named Published.SiegelEisensteinContinuation wrapper. It calls BRoad.eisBL_of with GlobalTheory.T.eisenstein_half_holds, siegelMult_of and GlobalTheory.CompanionTheory.Entire.local_factorisation. Multiplicativity uses section/wall laws, dictionaries, good multiplier, topological-group/parabolic data and sgAll_of. The latter has an actual strong induction on finite rank: rank one SgOne, rank >1 SgStep with all smaller positive ranks; both use the same adCM and character conditions. The construction of its premises uses mirGen, gallery, transfer, twist, Levi and convergence laws, all retained in the source application. The producer has a body; no independent kernel replay, literature equivalence, or proof of its leaves established.

These explicit code producers resolve RUN1's location question and RUN5's SWFull assembly. They do not certify classical published results as matching exact formal statements. Classical ingredients include meromorphic identity, maximum modulus, Banach–Steinhaus and Poisson summation; their use here is distinguished from the not-yet-reconstructed exact local and global formulas. No assertion about hidden axioms or placeholders without kernel evidence.

## 5. Execution and reproducibility

Executed 68 literal line-anchor assertions against 16 actual pinned source files; all connector blob SHA checks matched. This is static source checking, not Lean kernel validation, theorem-level axiom extraction, or an empirical test of analytic continuation. No synthetic matrices or benchmark used; no URT speedup asserted. Source manifest (paths, connector blob IDs, exact 1-based line anchors) follows. To replay independently with a local upstream git checkout, save the JSON array to run6_sources.json and run:
```python
import json, subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
records=json.load(open("run6_sources.json"))
n=0
for r in records:
    spec=pin+":"+r["path"]
    blob=subprocess.check_output(["git","show",spec])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=blob).decode().strip()==r["sha"],spec
    lines=blob.decode().splitlines()
    for i,s in r["anchors"]:
        assert s in lines[i-1],(spec,i,s)
        n+=1
print(len(records),"blob hashes;",n,"source anchors")
```
Local git replay not executed in this run; connector checks above executed. Source manifest:
```json
[
 {
  "path": "src/Development/WeilBound/ThetaLifts/Reductions/TopPolarZero/PolZero.lean",
  "sha": "53e3dd1eecd90129f30180a66820109d0c8b54be",
  "anchors": [
   [
    38,
    "have p1 := siegelWeilAniso_of p0 frameConj finLevel stab2Cpt"
   ],
   [
    40,
    "have l1 := boxSec_of finLevel stab2Cpt"
   ],
   [
    43,
    "swFull_of p1.1 (eisContinues_of p2 frameConj) l1"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/SWFull.lean",
  "sha": "f2554f1ffc45ae43660e0c29b363fd8f3f40d211",
  "anchors": [
   [
    13,
    "theorem mero_eq"
   ],
   [
    21,
    "meromorphicOrderAt_ne_top_of_isPreconnected"
   ],
   [
    28,
    "theorem contAt_of_sphere"
   ],
   [
    39,
    "isCompact_univ.eventually_forall_of_forall_eventually"
   ],
   [
    50,
    "theorem IsEisCont.update"
   ],
   [
    70,
    "(h1 s (max_lt_iff.1 hs).2).unique"
   ],
   [
    93,
    "C / ρ ^ k"
   ],
   [
    105,
    "theorem swFull_of"
   ],
   [
    110,
    "hE.update hk"
   ],
   [
    74,
    "Set.mem_insert _ _"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/Hypotheses2.lean",
  "sha": "803e1ac677566855e89aa7437ea49c0b78db3602",
  "anchors": [
   [
    53,
    "structure IsEisCont"
   ],
   [
    76,
    "def EisValueAt"
   ],
   [
    80,
    "def SWAniso"
   ],
   [
    87,
    "if n < m then 1 else 2"
   ],
   [
    95,
    "def IsRegAt"
   ],
   [
    101,
    "def EisContinues"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/HypothesesS.lean",
  "sha": "eebec2a1e0933b18ea25d351752a093a882afe9d",
  "anchors": [
   [
    11,
    "def SiegelWeilStd"
   ],
   [
    13,
    "min r s = 0"
   ],
   [
    19,
    "FiniteDimensional"
   ],
   [
    21,
    "if n < m then 1 else 2"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/HypothesesE.lean",
  "sha": "bea91cbe6a4c4b1c2fbc6a230f641556d38a5417",
  "anchors": [
   [
    13,
    "def SiegelWeilAniso"
   ],
   [
    43,
    "def IsGrowForm"
   ],
   [
    46,
    "def EisBL"
   ],
   [
    53,
    "∀ μ, IsGrowForm μ"
   ],
   [
    55,
    "def FrameConj"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/SiegelWeilAnisoOf.lean",
  "sha": "d30fec8f143e11cd2d36a7aebb96de2997bbfdeb",
  "anchors": [
   [
    18,
    "theorem theta_inj"
   ],
   [
    58,
    "theorem dbl_comm"
   ],
   [
    73,
    "theorem sw_transl"
   ],
   [
    88,
    "have ha₀ : IsHgt K₀"
   ],
   [
    98,
    "(om p⁻¹ Φ)"
   ],
   [
    110,
    "Complex.cpow_zero"
   ],
   [
    112,
    "theorem _root_.GlobalTheory.ThK.Dbl.siegelWeilAniso_of"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/EisCont.lean",
  "sha": "a598385fcee6969f6a81f29780efe163553b4791",
  "anchors": [
   [
    36,
    "theorem reg_of_weak"
   ],
   [
    42,
    "An.unif_bound"
   ],
   [
    45,
    "theorem eisCont_of_reg"
   ],
   [
    53,
    "An.preconn disc"
   ],
   [
    56,
    "a.remove one_le_height_GL2"
   ],
   [
    67,
    "theorem eisContinues_of"
   ],
   [
    102,
    "reg_of_weak hU e5"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/RegOfBound.lean",
  "sha": "198c211a38fc0346c7cf1d282d9f8002228af5fc",
  "anchors": [
   [
    12,
    "theorem unif_bound"
   ],
   [
    51,
    "banach_steinhaus"
   ],
   [
    113,
    "theorem reg_of_bound"
   ],
   [
    129,
    "theorem Reg.punct"
   ],
   [
    139,
    "theorem Reg.remove"
   ],
   [
    160,
    "theorem preconn"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/ThetaLifts/LatticeBasics/PairsStable.lean",
  "sha": "15cdb3b0663f439d9ce45052db1299255f4196c9",
  "anchors": [
   [
    43,
    "def BoxSec"
   ],
   [
    51,
    "def SWFull"
   ],
   [
    58,
    "if n < m then 1 else 2"
   ]
  ]
 },
 {
  "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
  "sha": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
  "anchors": [
   [
    562,
    "PositivityTheory.RgEis.Hd.eisBL"
   ],
   [
    564,
    "PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStd.lean",
  "sha": "fa7cbd3fa829f36b8a35e68b62e1661857fed732",
  "anchors": [
   [
    8,
    "siegelWeilStd_of_ct (Act.ctSplit_of kfour.auxEx kfour.coefEx)"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOfCt.lean",
  "sha": "80df756458f29dd1bd4e6dda50fe6f470e22c067",
  "anchors": [
   [
    8,
    "siegelWeilStd_pre TW.Twp.poisson hCT"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdPre.lean",
  "sha": "43cdbcee0171674f12ffb4759d139412baf9e1aa",
  "anchors": [
   [
    19,
    "theorem siegelWeilStd_pre"
   ],
   [
    21,
    "siegelWeilStd_mid"
   ],
   [
    23,
    "Ald.ldEx_of hT kfour.auxEx"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdMid.lean",
  "sha": "1e8d46ad8e347e6ae7878469a529ae6b3f475f46",
  "anchors": [
   [
    16,
    "theorem siegelWeilStd_mid"
   ],
   [
    18,
    "siegelWeilStd_of hT"
   ],
   [
    20,
    "hLD hCT HSt.holLeadB"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilActions/CtSplitOf.lean",
  "sha": "31e5cfa8f0fe81980cf4ad07a7c4ad52cfd0048e",
  "anchors": [
   [
    10,
    "theorem ctSplit_of : AuxiliaryPrimeFunction → CoefEx → CTSplit := fun _ _ =>"
   ],
   [
    11,
    "ctSplit_of_parts indepDom cptDom absConv firstEq"
   ]
  ]
 },
 {
  "path": "src/Development/WeilBound/RepresentationTheoryGL/EisensteinSeries/SiegelEisensteinHalfPlane/SchwartzBruhatMajorants/SiegelMultOf.lean",
  "sha": "18f1ebab4c01d7d6a8011562eb1d8d361a66be8b",
  "anchors": [
   [
    77,
    "theorem sgAll_of"
   ],
   [
    82,
    "Nat.strong_induction_on"
   ],
   [
    101,
    "theorem eisBL"
   ],
   [
    106,
    "BRoad.eisBL_of GlobalTheory.T.eisenstein_half_holds"
   ],
   [
    113,
    "GlobalTheory.CompanionTheory.Entire.local_factorisation"
   ]
  ]
 }
]
```

RESUME HERE: open actual SiegelWeilStandard/SiegelWeilStdOf.lean at the original pin and reconstruct its exact use of HSt.holLeadB and CTSplit: how equality of the relevant constant/Fourier coefficients gives the meromorphic special-value identity, with both rank factors and all anisotropy/character restrictions. This is distinct from the just-completed gluing proof. In parallel notify literature/integration of the precise EisBL producer BRoad.eisBL_of and its three inputs; do not duplicate their work. RUN3 lInt2 exact supplier and all deeper analytic/representation-theoretic obligations remain open. HANDOFF TO: editor, integration, audit, literature, theta. Project OPEN, no physics changes.
