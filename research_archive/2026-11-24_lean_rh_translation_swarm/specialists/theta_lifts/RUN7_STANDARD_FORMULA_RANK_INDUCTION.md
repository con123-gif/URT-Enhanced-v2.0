# Theta lifts run 7 — actual Siegel–Weil standard proof assembly and rank induction

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the standard Siegel–Weil assembly, equal-rank Fourier-to-value step and finite rank induction; deeper analytic and local matching obligations remain OPEN. No kernel replay. This is the immediate dependency of RUN6, not a second gluing proof.

## Continuity and pin

Read AGENTS, swarm protocol, handoff, expansion, latest theta RUN6, runner log/protocol, continuity, research-state excerpt and other lanes' latest handoffs (kernel, Galois, boxes, Landau, literature, prime, positivity, editor, speed, integration, structure, dependency and math). No overlapping specialist on this exact rank-induction task found. Physical CI checkpoint #370 PASS (45397353015 at 13:09:55 UTC), not RH validation. The required blueprint is noted in the queue but not independently reread here. Original upstream 40e56bab026552e089d7afcfeff08d2defb9c005; current main observed e26756e547b281cbf137eb7e0f16cccb738f3f84. Source migration comparison of six exact paths (not semantic equivalence): [{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean","old":"f6f68c195888579f8d05362afa946ee169153cf0","current":"d1f341f7124a9ca4d58ede9ecbd6ddaa42eef426","unchanged":false},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/SiegelWeilStdLeaves.lean","old":"92a2b237757ef37522d5fa2a416b6337f7a3110a","current":"b3bceb1b95b1c1bb6ef08f78e7c648c4b2ce951f","unchanged":false},"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}",{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/MainLe.lean","old":"490d93a65825cce0c5342afff4ee1716ca491fde","current":"0583185d7669c9d58911d0a05122b95562b8ada4","unchanged":false},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/MainEq.lean","old":"b0d028b531b918cdea818486e5e023b3feb5693f","current":"cef80cdae4a09fd3d8d1185d5f278cc0555490bf","unchanged":false},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean","old":"1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b","current":"45ce4f9ccf4c7a81e4d48176bbe3489c6d0c6d67","unchanged":false}].

## 1. Actual standard formula and all premises

For number fields F,E with F-algebra map and involution σ, good base B, positive ranks m,n, spaces A,Y of ranks m,n and signatures (r,s),(r',s'), assume min(r,s)=0 and A hermitian/Y skew or A skew/Y hermitian. χ is a Hecke character with ResEtaPow on the embedded base-field unit subgroup at exponent m. Given finite coordinate type κ, doubled model dd,om,S,l satisfying IsDbl, standard frame b and K with IsFrame2 and IsStdK, height a with IsHgt, Haar measure μ and fundamental domain D of ratU, Schwartz Φ and finite-dimensional right K-orbit span, write I_Φ(x)=the set-average over D of thetaSum F (om x (S g Φ)). Let E_Φ(z,x) be the Eisenstein coset sum of the section a^(z-s0) l(om(.)Φ), s0=((m:ℂ)-n)/2. The target is EisValueAt: for each x, a globally meromorphic representative agreeing with the right-half-plane sum, analytic at s0, value c I_Φ(x), c=1 if n<m and c=2 otherwise. No convergence at s0 is asserted. Standard frame is still required; RUN6 handles frame transport separately.

The actual proof is not a direct invocation of a published Siegel–Weil formula. Fin.siegelWeilStd_of has eight inputs TAll, LocInst, GIdil, KFinPoly, PolyKFin, LDEx, CTSplit, HolLead. It constructs auxiliary prime function, Fock membership, local operators, global splitting, vacuum stability, then three separate local coefficient packages WhitK (n<m), WhitEq (n=m), WhitLow (m<n on vacuum). AStep.stepOf consumes HolLead, HolT, TAll, ThetaCoef, AuxiliaryPrimeFunction, CoefEx, FockMem, LiftEx, LocOpEx, LocInst, GSplit, PolyKFin, SecK, EisWk, LamBd, LamSing, FourierZero, Unfold, WhitLow, VacK, IwaQ, CTSplit, UEx, FcConj, OrbRes (all 25 inputs, not interchangeable). Atop.siegelWeilStd_of has 17 inputs: AbsThm, TAll, ThetaCoef, LocOpEx, LocInst, GSplit, GIinv, GIdil, KFinPoly, PolyKFin, Unfold, WhitK, WhitEq, AbsSt.GenCore, LDEx, VacK, Step. Its actual body additionally constructs EisBL, SecK, AuxiliaryPrimeFunction, RDEx, FockMem, LiftEx, LamBd, LamSing, EisWk. The two rank regimes then split via hMain=KMain.mainOf, hLt=Khead.headOf, hEq=Atop.mainEq_of, hVA=Atop.vacAllOfC, hLe=Atop.mainLeOf, and finally Atop.fieldOf hBL hSK hLt hLe.

## 2. Equal rank: coefficient identity to full value

Let d be SD σ (the full global datum with the hypotheses in section 1), Φ a K-finite Schwartz vector, d.T the coordinate transform, R an RD supplied by RDEx, w an infinite place. MainC(c,d) is the assertion for EVERY K-finite Φ and every x that E_Φ(.,x) has HolValueAt(s0,c I_Φ(x)). MainV(c,R) replaces K-finiteness with Φ in Schwartz and d.T Φ in R.vac. WhitAt(c,d,Φ) only asserts that, for all valid CoefData (nb,λ,𝓖), Weyl coordinates ε,w and nonsingular T, the unfolded integral of the flat section against the additive character has HolValueAt at s0 equal to c times the orbital expression d.orb T (d.om x Φ). These are three different propositions.

At equal rank WhitEq supplies WhitAt(2,d,Φ) for all K-finite Φ. MainEq.lean proves mainC_of for arbitrary c under d.n≤d.m, d.EisAll and WhitAt(c,d,Φ) for every K-finite Φ, together with its 18 named structural inputs (hA,hT,hTC,hRD,hAux,hFM,hLE,hLo,hLI,hGS,hGI,hGD,hKP,hPK,hSK,hLB,hLS,hU). In perLiftC, fix a polynomial P, away component Ψ in R.away w, and linear lift φ with R.IsLift w Ψ φ. All φ(P) are K-finite from PolyKFin and FockMem. The local operator relation and injectivity of d.T on Schwartz establish the exact intertwiner d.om(R.ι(w,k))φ(P)=φ(ρ(k)P) on the local compact group. Define I_l(P)=c I_{φ(P)}, s_l(P)=sec0(φ(P)); both linear by the actual theta sum and representation linearity.

The proof constructs GlobData with twelve fields: ιcont, split, Icont, Ileft, Ik, Iinv, Idil, eis, Λadd, Λbd, Λsing, Λval. In the last field the nonsingular coefficient identity is:
fc_T(c I_{φ(1)})(x) = c fc_T(I_{φ(1)})(x) = c orb_T(om(x)φ(1)).
Unfold supplies right-half-plane equality between the Fourier coefficient of the Eisenstein sum and the local unfolded integral. WhitAt supplies that integral's holomorphic value. HolValueAt.congr transfers it across EqRight; no interchange at the exceptional point is presumed. Λsing is separately supplied by LamSing; equality only of nonsingular Fourier coefficients is NOT sufficient on its own. The abstract theorem AbsThm applied to the entire GlobData gives HolValueAt(E_{φ(P)}(.,x),s0,c I_{φ(P)}(x)); its body remains an obligation.

To extend from polynomial lifts to an arbitrary K-finite Φ, FockMem and KFinPoly give d.T Φ=Σ_i R.tens_w(fP(P_i),Ψ_i), a finite sum. LiftEx gives φ_i; injectivity on Schwartz implies Φ=Σ_i φ_i(P_i). Theta integration gives I_Φ=Σ_i I_{φ_i(P_i)}. For each i choose a right-half-plane threshold t_i from EisAll and absolute coset convergence (using the singleton compact set {x}). Take t=Σ_i |t_i|, then Re(z)>t implies Re(z)>t_i for every i, including negative thresholds; summable coset terms permit commuting the finite sum and infinite sum. Thus E_Φ=Σ_i E_{φ_i(P_i)} on that half-plane. HolValueAt_finsum and congr give the result for Φ with constant c. The empty sum case uses HolValueAt of zero. MainEq fixes c=2, hmn:m=n, uses hmn.ge and EisWk+SecK for EisAll, and hWE to discharge WhitAt. The separate strict n<m route uses perLift/mainOf with c=1, WhitK and n<m; its headOf producer is retained, not conflated with equal rank.

## 3. Higher rank: two nested finite inductions

Set k=n-m in natural numbers, retaining m≤n, m≥1. The proof rank_difference_induction has seven inputs RDEx, LDEx, VacK, PolyKFin, MainEq, Step, VacAll. MainV is proved first for ALL valid d and ALL R with difference k. At k=0, m=n (using m≤n), so MainEq yields MainC(2,d). VacK gives R.vac≤R.fock; PolyKFin converts every Schwartz vacuum vector to K-finite, so MainC implies MainV. At k=j+1, n≥2 because m≥1; LDEx supplies L with deleted index i0, embedding em and its exact range complement. The bijection Fin L.n ≃ {i:Fin n | i≠i0} proves L.n+1=n. L.sd preserves m, A,B,χ, signatures, μ,D, basis; RDEx supplies R' for that smaller datum. Hence m≤L.n and L.n-m=j, and the induction hypothesis gives MainV(2,R'). Step transfers to MainV(2,R), keeping the SAME factor 2. At the original d, RDEx provides R and VacAll extends MainV to MainC. The proof is induction on n-m, not signature p+q (that was RUN2).

VacAll itself is finite induction on archimedean places s. R.gens(s) are products of local polynomial Gaussians with P_w=1 off s, times a finite adelic Schwartz factor; R.vacOn(s)=span of these generators. Empty s gives the vacuum; inserting w replaces only that local vacuum by an arbitrary polynomial. LiftEx, Fock membership and PolyKFin produce the needed K-finite lifts, and the induction hypothesis supplies the value at P_w=1. The actual genAt hG (AbsSt.GenCore) transfers that value to arbitrary P_w. Finite linear-combination membership and injectivity of d.T extend to the span (ident_lincomb). Finally s=all infinite places includes the Fock subspace, and KFinPoly places every K-finite vector there. This second induction does not drop the GenCore analytic premise.

## 4. What HolLead and CTSplit actually supply

For m<n, WhitLow gives the nonsingular orbital value zero on vacuum, not the whole theta mean zero. HolLead applies to the first nonzero spectral derivative j of a polynomial-regularized Eisenstein series: all derivatives of lower order vanish at every g, and all singular-test integrals of the jth derivative vanish. With the definite signature (p,q)=(m,0) or (0,m), positive local height factor, right-domain, pointwise holomorphy, joint continuity, and locally compact majorants on the initial right half-plane, it concludes weighted holomorphy IsHolW of each real-group translate. Actual producer HSt.holLeadB = conj (asmH locTau secFz crLem). HolT additionally handles translation/Levi law and averages over finite measures with compact support and bounded weight. No proof of these deep analytic ingredients is supplied in this chapter.

CTSplit, for valid section, Eis continuation, coefficient data in both ranks, normalized unipotent fundamental domain and compatible submatrix indices T,T', gives on a sufficiently far right half-plane:
average_u fc_T(E)(u_M(u)x) = fc_T'(lower-rank restricted Eisenstein sum)(1) + c₂(x).
The extra term obeys c₂(ι_w(y)x)=exp(τ(n-2z)) c₂(x) for the one-coordinate dilation y at τ. It cannot simply be discarded. The lower-rank restriction must respect L.IsRes and L.IsSub. This exact CTSplit is supplied by ctSplit_of_parts indepDom cptDom absConv firstEq (secLaw_of (secUnf_of absConv)); arguments AuxiliaryPrimeFunction and CoefEx are syntactically unused in that wrapper. The deeper proof AStep.stepOf must show that the unwanted term is controlled and that the first nonzero derivative/regularity argument works; do not infer its conclusion from CTSplit alone. Both actual producers are separate from the standard meromorphic continuation EisBL.

## 5. Final conversion into the requested meromorphic representative

FieldOf splits n<m vs not(n<m). The strict branch uses Khead.siegelWeilStd_lt, preserving its 16-field datum, and simplifies if_pos to 1. Otherwise it builds SD with the original data, uses m≤n and MainLe to obtain MainC(2,d), and calls eisValue_of. That lemma uses EisBL and SecK to obtain a global meromorphic Ê(.,x), agreeing with the actual coset sum on Re(z)>t. HolValueAt from MainC supplies H' analytic at s0 and H'(s0)=cI_Φ(x). Both extend the same original sum; IsExtAt.eventuallyEq gives equality on a punctured neighborhood. Updating Ê at exactly s0 to cI_Φ(x) produces a function locally equal to H', hence analytic there and still globally meromorphic. Increasing threshold to max(t,Re(s0)) preserves original HasSum. This does not assert original pointwise convergence at s0. It is an assembly step distinct from RUN6's *joint* holomorphy/growth continuation.

Classical mathematical ingredients include finite-dimensional representation theory, theta Fourier coefficients, meromorphic identity, finite-sum linearity, rank induction and the Siegel–Weil formula. Exact local coefficient formulas, AbsThm, GenCore and Step are not independently derived here; their source producer references are not independent proof of publication equivalence or absence of axioms.

## 6. Execution

Executed 94 line-anchor checks over 11 pinned source files through the connector, comparing each blob ID to the previously retrieved pin. All matched. Actual static checks only; no local git replay, no Lean kernel verification, no theorem-level axiom audit and no URT benchmark. Reproduce by extracting the JSON block below into run7_sources.json and running from a local pinned git checkout:

```python
import json, subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
records=json.load(open("run7_sources.json"))
count=0
for r in records:
    blob=subprocess.check_output(["git","show",pin+":"+r["path"]])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=blob).decode().strip()==r["sha"]
    lines=blob.decode().splitlines()
    for i,s in r["anchors"]:
        assert s in lines[i-1],(r["path"],i,s)
        count+=1
print(len(records),"blob hashes;",count,"source anchors")
```
```json
[
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean",
    "sha": "f6f68c195888579f8d05362afa946ee169153cf0",
    "anchors": [
      [
        52,
        "theorem siegelWeilStd_of"
      ],
      [
        59,
        "KWhit.whitK_of"
      ],
      [
        61,
        "KWhit.whitEq_of"
      ],
      [
        62,
        "KWhit.whitLow_of"
      ],
      [
        63,
        "AStep.stepOf hH Holtb.holT"
      ],
      [
        65,
        "hCT Afc.uEx"
      ],
      [
        66,
        "Atop.siegelWeilStd_of"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/SiegelWeilStdLeaves.lean",
    "sha": "92a2b237757ef37522d5fa2a416b6337f7a3110a",
    "anchors": [
      [
        40,
        "theorem Atop.siegelWeilStd_of"
      ],
      [
        53,
        "have hMain"
      ],
      [
        54,
        "have hLt"
      ],
      [
        55,
        "have hEq"
      ],
      [
        56,
        "have hVA"
      ],
      [
        57,
        "have hLe"
      ],
      [
        58,
        "exact Atop.fieldOf"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/FieldOf.lean",
    "sha": "15fc6761926cdc2bdae165c7b687d1e4ed0fa23b",
    "anchors": [
      [
        15,
        "theorem eisValue_of"
      ],
      [
        18,
        "hBL F E"
      ],
      [
        29,
        "meromorphicOn_of_weak"
      ],
      [
        33,
        "hext'.eventuallyEq hext"
      ],
      [
        34,
        "Function.update"
      ],
      [
        39,
        "Function.update"
      ],
      [
        40,
        "max t"
      ],
      [
        53,
        "by_cases hlt : n < m"
      ],
      [
        54,
        "Khead.siegelWeilStd_lt"
      ],
      [
        63,
        "hLe F E σ d (not_lt.mp hlt)"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/MainLe.lean",
    "sha": "490d93a65825cce0c5342afff4ee1716ca491fde",
    "anchors": [
      [
        13,
        "theorem LD.n_succ"
      ],
      [
        15,
        "Equiv"
      ],
      [
        24,
        "rank_difference_induction"
      ],
      [
        28,
        "hPK"
      ],
      [
        34,
        "hEq"
      ],
      [
        38,
        "hLD"
      ],
      [
        39,
        "hRD"
      ],
      [
        41,
        "hStep"
      ],
      [
        48,
        "hVA"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/MainEq.lean",
    "sha": "b0d028b531b918cdea818486e5e023b3feb5693f",
    "anchors": [
      [
        31,
        "theorem perLiftC"
      ],
      [
        51,
        "let Il"
      ],
      [
        52,
        "c • d.I"
      ],
      [
        100,
        "Λval"
      ],
      [
        103,
        "hWh"
      ],
      [
        104,
        "hC :="
      ],
      [
        107,
        "fc_smul"
      ],
      [
        108,
        "hWh.congr"
      ],
      [
        109,
        "exact hA"
      ],
      [
        119,
        "hFM"
      ],
      [
        123,
        "hΦeq"
      ],
      [
        125,
        "sub_eq_zero"
      ],
      [
        149,
        "∑ i, |tt i|"
      ],
      [
        161,
        "holValueAt_finsum"
      ],
      [
        176,
        "mainC_of 2"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/FockVacuumBounds/VacAll.lean",
    "sha": "887850c379828b2c4f102bca37152955a7eb911d",
    "anchors": [
      [
        16,
        "RD.gens"
      ],
      [
        20,
        "RD.vacOn"
      ],
      [
        67,
        "have hvac"
      ],
      [
        75,
        "genAt hG"
      ],
      [
        78,
        "Submodule.mem_span_set'"
      ],
      [
        87,
        "ident_lincomb"
      ],
      [
        102,
        "Finset.induction_on"
      ],
      [
        105,
        "fock_le_vacOn_univ"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean",
    "sha": "1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",
    "anchors": [
      [
        20,
        "def HolLead"
      ],
      [
        21,
        "m < n"
      ],
      [
        31,
        "∀ j"
      ],
      [
        33,
        "iteratedDeriv"
      ],
      [
        126,
        "def MainV"
      ],
      [
        129,
        "def MainC"
      ],
      [
        132,
        "def WhitAt"
      ],
      [
        139,
        "WhitEq"
      ],
      [
        141,
        "WhitLow"
      ],
      [
        143,
        "MainEq"
      ],
      [
        155,
        "CTSplit"
      ],
      [
        160,
        "+ c₂ x"
      ],
      [
        162,
        "d.n - 2 * z"
      ],
      [
        178,
        "def Step"
      ],
      [
        181,
        "HolLead"
      ],
      [
        182,
        "CTSplit"
      ],
      [
        184,
        "VacAll"
      ],
      [
        190,
        "MainLe"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/EisensteinMeromorphy/SiegelWeilStdLt.lean",
    "sha": "5a7bc192ca190ef0e6e2715612502f1c1af6df22",
    "anchors": [
      [
        10,
        "n < m"
      ],
      [
        11,
        "min r s = 0"
      ],
      [
        12,
        "ResEtaPow"
      ],
      [
        16,
        "FiniteDimensional"
      ],
      [
        18,
        "if n < m then 1 else 2"
      ],
      [
        22,
        "hgood"
      ],
      [
        26,
        "if_pos hnm"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/ThetaSchwartzSums/HolValueAtFinsum.lean",
    "sha": "c0319b2940b7644a8e5f78f9401e53fe84c1e3b0",
    "anchors": [
      [
        12,
        "holValueAt_finsum"
      ],
      [
        20,
        "cosetSum_finsum"
      ],
      [
        24,
        "Summable.tsum_finsetSum"
      ],
      [
        31,
        "theorem perLift"
      ],
      [
        83,
        "hU"
      ],
      [
        88,
        "rw [hC]"
      ],
      [
        90,
        "exact hA"
      ],
      [
        93,
        "theorem mainOf"
      ],
      [
        127,
        "∑ i, |tt i|"
      ],
      [
        139,
        "holValueAt_finsum"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilActions/CtSplitOf.lean",
    "sha": "31e5cfa8f0fe81980cf4ad07a7c4ad52cfd0048e",
    "anchors": [
      [
        10,
        "fun _ _"
      ],
      [
        11,
        "ctSplit_of_parts"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolLeadB.lean",
    "sha": "485b1709704b6c3e5dfac0fd29aeb2f0de86f5ec",
    "anchors": [
      [
        9,
        "theorem holLeadB"
      ]
    ]
  }
]
```

RESUME HERE: locate actual AStep.stepOf body (follow import closure, not filename assumption) and reconstruct its singular Fourier coefficient rank-lowering step, especially how the CTSplit extra exponential term is handled by HolLead/HolT and the precise m<n guard. This is the essential outstanding higher-rank analytic argument. Preserve separate WhitK/WhitEq/WhitLow constants and AbsThm/GenCore obligations. RUN3 lInt2 exact source supplier remains open. HANDOFF TO theta, editor, integration, audit and literature; no unrelated physics changes; project OPEN.
