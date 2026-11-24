# Theta lifts RUN8 — singular Fourier coefficients, incompatible dilation weights and removal of the regularization polynomial

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction of native AStep.stepOf including deg, lawSep, holCoef, ndZero, strong induction and wrap. OPEN as a full RH proof. Not kernel replay and not an independently established published theorem.

## Continuity
Read AGENTS, swarm protocol, handoff, expansion, research state, research protocol/log, continuity, theta RUN7, current physical CI summary (checkpoint #374 PASS, 45410580111, 14:27:38 UTC, unrelated to RH), and retrieved peer handoffs for the dedicated lanes. No duplicate of this precise task found. Blueprint linked in queue not reread. Original pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest observed 9477923066c923e6dbf7292da17019f8d08d0db8 at 14:18:56 UTC (quick-check diagnostic merge). Path-level migration check (not semantic equivalence): [{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean","old":"f6f68c195888579f8d05362afa946ee169153cf0","current":"ba9124032c534e1ddb55f57c44896c58c699a144"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/NdZero.lean","old":"05314df049d2034876de64be326e9e518ce7ff6b","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ExpNeOfLt.lean","old":"8214159335009d04c57924614b348e08d1b612a6","current":"445821f9bc878c405cceb7fd549a793dd3c3012b"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/AvgHolPf.lean","old":"4673a7f5fb7831b10990c909e09dc75764d6e4aa","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean","old":"7a79c77e00affe229c88b89f0eef23832a4272ed","current":"abdf35ccabcedb3e89361c63e0d8c0a44d873e55"}]. Stay on original pin.

## 1. Actual entry and scope
The import in SiegelWeilStdOf.lean directly names AdelicDilations.NdZero. AStep.stepOf takes the 25 StepOf hypotheses in LowerRankDatum.lean and packages them into Hyps before calling step. Preserve exact order: HolLead, HolT, TAll, ThetaCoef, AuxiliaryPrimeFunction, CoefEx, FockMem, LiftEx, LocOpEx, LocInst, GSplit, PolyKFin, SecK, EisWk, LamBd, LamSing, FourierZero, Unfold, WhitLow, VacK, IwaQ, CTSplit, UEx, FcConj, OrbRes. For every pair of number fields F,E with F-algebra E and sigma, every SD datum d, RD d R, LD d L and RD L.sd R', assume m<n and MainV(2,R'). For every Schwartz Phi with d.T Phi in R.vac and every x, establish HolValueAt of the original Eisenstein sum at s=(m-n)/2 with value 2 I_Phi(x). This is a rank step, not the entire SW theorem. All structural, topological, measure, local representation and exact matching premises within SD/RD/LD are retained.

EisWk and SecK (using VacK and PolyKFin) give EData: open right-domain U containing s, nonzero polynomial p, holomorphic-in-z regularized series Ê(z,g) on U, jointly continuous, left rational-invariant, absolute compact-uniform summable majorants and equality Ê=p E far right. Let k=rootMultiplicity_s(p); A_j(g)=partial_z^j Ê(s,g), P_j=p^(j)(s), B_j(g)=A_j(g)-2P_j I_Phi(g). Want B_j=0 for 0<=j<=k. In induction assume A_i=0 globally for i<j (not merely at x). All coefficients are normalized fundamental-domain Fourier integrals; the argument compares derivatives at s, not convergence of original series there.

## 2. Nonsingular coefficients and weighted holomorphy
ndZero: for any CoefData and nonsingular T, thetaCoef and OrbRes give fc_T(I_Phi)=0 because m<n. LamBd makes the coefficient linear and compact-bounded; lamDeriv commutes spectral derivatives. Unfold and WhitLow give unfolded integral HolValueAt(s,0); ordVal in IsExtAtOfDiff proves its regularized derivatives through k vanish. Thus fc_T(A_j)=fc_T(B_j)=0. This is not enough to conclude B_j=0: singular coefficients still needed.
CntFalse.ndA applies the same argument to every functional in d.lamSet. vac_tens expresses vacuum at w as fP(1) tensor away factor (span induction); LocOpEx and LiftEx give lift phi(1)=Phi via injectivity of coordinate transform; LocInst and definite signature give (pp,qq)=(m,0) or (0,m). GSplit supplies local factorization and positive height multiplier; LamSing upgrades ndA to all singular-test integrals zero. HolLead uses the lower-derivative vanishings and these integral vanishings to conclude each translate of A_j is IsHolW(pp,qq,e). HolLead is an input, not replaced by a heuristic.

## 3. Singular coefficient with zero row/column: two transformation laws
FcConj brings any singular T to conjugate T0 with deleted row/column zero and lower index T', preserving the coefficient at rationally translated x. Work at that T0 (write T). Fix infinite place w and y the dilation at i0 with tau=1, Yx=R.iota(w,y)*x. holCoef_pf: local beta_W has zero i0 row/column by L.IsSub. Character translation comes from Fourier shift; HolT.1 implies the Levi law for transformations stabilizing beta_W. HolPhi uses HolT.2, compact representatives, finite normalized measure and unit-modulus additive character to obtain weighted holomorphy of Fourier integrals. The diagonal dilation stabilizes beta_W, and weight_factor_dilation with either definite signature gives fc_T(A_j)(Yx)=exp(m) fc_T(A_j)(x). The row unipotents also stabilize beta_W, have determinant 1 (zero diagonal entry and only one supported row), and give invariance. UEx extends rational and local unipotent invariance to all u. Therefore normalized average of fc_T(A_j) equals fc_T(A_j) exactly, since nu(Ucal)=1. These invariances are proved in HolCoefPf, not implied by CTSplit alone.

CTSplit supplies, only far to the right, average(fc_T(E))(z,x)=c1(z,x)+c2(z,x), where c1 is lower-rank restricted Eisenstein coefficient and c2(z,Yx)=exp(n-2z)c2(z,x). The arbitrary choice of c2 outside the right half-plane has no analytic significance. cOneVal supplies HolValueAt(c1(.,x),s,2fc_T(I_Phi)(x)) via MainV(2,R') and matching. cOneLaw_pf proves the first summand's distinct law: d.a(Yg)=exp(2tau)d.a(g), section dilation exp(tau*m), lower-rank j commutes with Y. Thus c1(z,Yx)=exp(tau(2z+n))c1(z,x), using complex power of positive real exponential, scalar transport through coset sum and integral. valLaw transports this right-domain identity to the holomorphic values; n+2s=m, so fc_T(I_Phi)(Yx)=exp(m)fc_T(I_Phi)(x). Do not assume c2 is holomorphic or independently defined at s.

## 4. lawSep: analytic separation without illicit evaluation
Let a(z)=avg(fc_T(Ê(z)))(x), a'(z) its value at Yx (prime denotes second location, not derivative). Both holomorphic on U by avgHol_pf: rational periodicity gives compact Fourier and unipotent representatives, normalized finite measures give compact sup bound, then lamDeriv applies. Lower derivatives vanish by the global hlow and derivative commutation. On common right half-plane a=p(c1+c2), a'=p(c1'+c2'), c2'=exp(n-2z)c2. Let C,C' holomorphic extensions of c1,c1', v=C(s), v'=C'(s). p=(z-s)^j gp, where gp=(z-s)^(k-j)q and q(s)!=0. Analytic vanishing gives a=(z-s)^j ga and a'=(z-s)^j ga' locally. The meromorphic identity theorem identifies a'-p C' with exp(n-2z)(a-p C) on punctured neighborhood: both extend the same right-domain expression p c2'. Divide by (z-s)^j off s, then continuity extends to s. Hence ga'(s)-gp(s)v'=exp(n-2s)(ga(s)-gp(s)v). Multiply by j!; iterDerivPow identifies jth derivative with j! times leading coefficient. This is exactly lawSep, including j=0 and j=k. No premise c2 holomorphic required; no evaluating raw c2 at s.

Since avg derivative equals fc_T(A_j) by normalized unipotent invariance, lawSep gives fc_T(B_j)(Yx)=exp(n-2s)fc_T(B_j)(x). Section 3 simultaneously gives fc_T(B_j)(Yx)=exp(m)fc_T(B_j)(x). Therefore [exp(2n-m)-exp(m)] fc_T(B_j)(x)=0. exp_ne_of_lt uses injectivity of real exponential and the natural subtraction cast justified by m<n. Since 2n-m>m, the factor is nonzero; the singular coefficient residual vanishes. At m=n the multiplier is zero and this argument cannot be used; RUN7 equal-rank branch is mandatory.

## 5. Global vanishing and regularization removal
stepJ: B_j continuous and left-rational invariant (famCont, derivInv and theta automorphy). FourierZero, with normalized CoefData, gives B_j=0 pointwise: nonsingular case ndZero, singular case FcConj then deg. Strong induction on j<=k: when i<j, i<k (also for j=k); pderiv_lt gives P_i=0; prior B_i=0 yields A_i=0 globally. Thus B_j=0 for all j<=k. Consequently A_i=0 below k, A_k=2p^(k)(s)I_Phi.
wrap: factor p=(z-s)^k q, q(s)!=0 because p!=0; analytic order criterion factors Ê(z,x)=(z-s)^k g_x(z) locally. k! cancellation gives g_x(s)=q(s)*2 I_Phi(x). Meromorphic extension of E via Ê/p is legitimate on sufficiently far right since nonzero polynomial has finitely many zeros. Punctured local ratio equals g_x/q, which has the prescribed finite limit and holomorphic representative. Therefore HolValueAt(E,s,2I_Phi). This handles k=0 too. Does not claim pointwise convergence of E at s.
Classical tools: identity theorem, analytic order and Taylor derivatives, Fourier uniqueness, positive measure, real exponential injectivity. Native local representation/dilation formula and arithmetic matching are source premises with their exact producers identified where above. No publication equivalence, full root reachability, no-sorry or axiom status proved here.

## 6. Executed checks
13 pinned files fetched through connector; 12 previously observed blob IDs compared exactly, one caller recorded on this run; 111 line anchors found with fail-on-missing checks, and five current-path fetch attempts recorded. This was executed in connector JS; not a Lean build. To reproduce with a full local pinned git checkout, save the JSON block as run8_sources.json and run:
```python
import json,subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
rows=json.load(open("run8_sources.json"))
count=0
for r in rows:
    b=subprocess.check_output(["git","show",pin+":"+r["path"]])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==r["sha"]
    lines=b.decode().splitlines()
    for i,a in r["anchors"]:
        assert a in lines[i-1],(r["path"],i,a)
        count+=1
print(len(rows),"blob hashes;",count,"source anchors")
```
No numerical proxy or URT performance test. Source-matched local dependency edges only, not elaborated closure.
```json
[
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean",
    "sha": "f6f68c195888579f8d05362afa946ee169153cf0",
    "anchors": [
      [
        23,
        "import Development.WeilBound.CoreStatements.AutomorphicKernels.SiegelWeilFormula.AdelicDilations.NdZero"
      ],
      [
        63,
        "AStep.stepOf hH Holtb.holT"
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
        36,
        "def HolT"
      ],
      [
        141,
        "def WhitLow"
      ],
      [
        155,
        "def CTSplit"
      ],
      [
        178,
        "def Step :"
      ],
      [
        180,
        "def StepOf :"
      ],
      [
        162,
        "d.n - 2 * z"
      ],
      [
        119,
        "ν 𝓤 = 1"
      ],
      [
        168,
        "def FcConj"
      ],
      [
        175,
        "def OrbRes"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/NdZero.lean",
    "sha": "05314df049d2034876de64be326e9e518ce7ff6b",
    "anchors": [
      [
        13,
        "theorem ndZero"
      ],
      [
        30,
        "H.orbRes"
      ],
      [
        39,
        "H.whitLow"
      ],
      [
        52,
        "theorem stepJ"
      ],
      [
        65,
        "H.fourierZero"
      ],
      [
        69,
        "ndZero H R"
      ],
      [
        72,
        "exact deg H"
      ],
      [
        74,
        "theorem step ("
      ],
      [
        81,
        "Nat.strong_induction_on"
      ],
      [
        86,
        "pderiv_lt p"
      ],
      [
        88,
        "refine wrap"
      ],
      [
        94,
        "theorem stepOf"
      ],
      [
        95,
        "step ⟨h1"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ExpNeOfLt.lean",
    "sha": "8214159335009d04c57924614b348e08d1b612a6",
    "anchors": [
      [
        13,
        "theorem exp_ne_of_lt"
      ],
      [
        18,
        "Real.exp_injective"
      ],
      [
        22,
        "theorem deg"
      ],
      [
        49,
        "holA H R"
      ],
      [
        50,
        "holCoef H R"
      ],
      [
        53,
        "H.cTSplit"
      ],
      [
        60,
        "Classical.choose (hspl"
      ],
      [
        73,
        "avgHol H"
      ],
      [
        75,
        "lawSep U p"
      ],
      [
        96,
        "cOneVal H"
      ],
      [
        105,
        "huA uM"
      ],
      [
        106,
        "hu.2.2.2"
      ],
      [
        110,
        "valLaw"
      ],
      [
        112,
        "cOneLaw H"
      ],
      [
        114,
        "d.n : ℂ) + 2 * s = d.m"
      ],
      [
        121,
        "d.n : ℂ) + -2 * s"
      ],
      [
        126,
        "exp_ne_of_lt hmn"
      ],
      [
        129,
        "linear_combination -hsep"
      ],
      [
        130,
        "mul_eq_zero.1 key"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean",
    "sha": "1079d74072e904d278cba232030edc7bee2c9e2a",
    "anchors": [
      [
        29,
        "theorem holA"
      ],
      [
        32,
        "exists_isHolW_iteratedDeriv"
      ],
      [
        36,
        "theorem holCoef"
      ],
      [
        42,
        "holCoef_pf"
      ],
      [
        46,
        "theorem avgHol"
      ],
      [
        52,
        "avgHol_pf"
      ],
      [
        56,
        "theorem cOneVal"
      ],
      [
        60,
        "cOneVal_pf"
      ],
      [
        64,
        "theorem cOneLaw"
      ],
      [
        68,
        "cOneLaw_pf"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/CntFalse.lean",
    "sha": "d5247f88431b918ce08dd635a226c282dfed64b4",
    "anchors": [
      [
        21,
        "theorem vac_tens"
      ],
      [
        40,
        "theorem ndA"
      ],
      [
        55,
        "H.whitLow"
      ],
      [
        57,
        "ordVal U p"
      ],
      [
        74,
        "theorem exists_isHolW_iteratedDeriv"
      ],
      [
        89,
        "H.locInst"
      ],
      [
        94,
        "hLD.sign"
      ],
      [
        99,
        "H.holLead"
      ],
      [
        102,
        "H.gSplit"
      ],
      [
        106,
        "H.lamSing"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/HolCoefPf.lean",
    "sha": "a837d56f6202729ebe9ae87402622de560350bff",
    "anchors": [
      [
        13,
        "theorem holPhi"
      ],
      [
        44,
        "H.holT.2"
      ],
      [
        52,
        "theorem holCoef_pf"
      ],
      [
        62,
        "hT.1 l"
      ],
      [
        64,
        "hT.1 k"
      ],
      [
        75,
        "H.holT.1"
      ],
      [
        83,
        "stab_diag"
      ],
      [
        84,
        "weight_factor_dilation"
      ],
      [
        88,
        "H.uEx"
      ],
      [
        110,
        "stab_row"
      ],
      [
        110,
        "weight_factor_det_one"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/AvgHolPf.lean",
    "sha": "4673a7f5fb7831b10990c909e09dc75764d6e4aa",
    "anchors": [
      [
        49,
        "theorem avgHol_pf"
      ],
      [
        60,
        "ratV_cocompact"
      ],
      [
        70,
        "H.fcConj"
      ],
      [
        82,
        "ν 𝓤 < ⊤"
      ],
      [
        26,
        "have hbd"
      ],
      [
        105,
        "lamDeriv"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/COneLawPf.lean",
    "sha": "9ecfe07fbcc9c0d5817a73c8eeeeaa232f43e1de",
    "anchors": [
      [
        18,
        "theorem cOneLaw_pf"
      ],
      [
        27,
        "j_comm_dil"
      ],
      [
        28,
        "a_dil"
      ],
      [
        29,
        "section_dilation_exp"
      ],
      [
        22,
        "Complex.exp (τ * (2 * z + d.n))"
      ],
      [
        54,
        "tsum_mul_left"
      ],
      [
        57,
        "integral_const_mul"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean",
    "sha": "7a79c77e00affe229c88b89f0eef23832a4272ed",
    "anchors": [
      [
        9,
        "theorem iterDerivPow"
      ],
      [
        36,
        "theorem polyFac"
      ],
      [
        65,
        "theorem ordVal"
      ],
      [
        85,
        "theorem wrap"
      ],
      [
        91,
        "hq0 hp"
      ],
      [
        124,
        "theorem valLaw"
      ],
      [
        132,
        "theorem lawSep"
      ],
      [
        153,
        "Nat.add_sub_cancel' hj"
      ],
      [
        173,
        "hX'.eventuallyEq hY'"
      ],
      [
        184,
        "mul_left_cancel₀ hne"
      ],
      [
        187,
        "eqNhds hlim"
      ],
      [
        189,
        "j.factorial : ℂ"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SingularHermitian/FourierStep.lean",
    "sha": "a6c6ce0f91f81e6f970cafb5c0cd765a21a0e1d0",
    "anchors": [
      [
        14,
        "theorem fourierStep"
      ],
      [
        47,
        "hψ.2.2"
      ],
      [
        48,
        "hL (fun f"
      ],
      [
        51,
        "hFZ F E σ"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ADil.lean",
    "sha": "4049d675a926f883c8038a162c261f59087a89e0",
    "anchors": [
      [
        15,
        "theorem a_dil"
      ],
      [
        16,
        "Real.exp (2 * τ)"
      ],
      [
        29,
        "absE_adrU"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/HolomorphicTheta/HolomorphicAverageUniform.lean",
    "sha": "0fd4083591381494ee126f661b677a56e0ed49d6",
    "anchors": [
      [
        15,
        "theorem holomorphic_average_uniform"
      ],
      [
        30,
        "differentiableOn_integral_of_bdd"
      ],
      [
        27,
        "spherical_section_ne_zero_group"
      ],
      [
        68,
        "theorem holT"
      ]
    ]
  }
]
```

RESUME HERE: trace cOneVal_pf actual source body via DegCut imports (especially SectionEqThetaZero / COneLawPf transitive imports), prove how IwaQ, VacK restriction and OrbRes turn the restricted Eisenstein coefficient into 2 times the original theta coefficient with correct spectral shift and character factors. Preserve hIH and all measure normalizations. Then trace HolLead native analytic producer and FourierZero supplier separately. RUN3 exact lInt2 source remains open. HANDOFF TO theta, editor, integration, audit and literature. No unrelated Cathedral changes.
