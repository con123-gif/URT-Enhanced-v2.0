# Theta lifts RUN9 — exact half-step spectral shift and restriction of the first Eisenstein coefficient

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of AStep.cOneVal_pf and its native COne.fcVal/hv_shift dependencies. Full RH proof OPEN; no Lean kernel replay, no URT speed claim.

## Continuity and provenance

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state excerpts, continuity, research protocol/log, current CI summary (physical checkpoint #377; unrelated to RH), RUN8, and peer handoffs (integration, math, Galois, character boxes, Landau, kernel, prime window, literature, acceleration, geometry, editor). Prior theta RUN8 derived incompatible dilation laws; the missing lower-rank value is this run's unique task. Peer handoffs inspected via recent compare and individual fetches; not all historic files or linked external blueprint reread. The prior kernel lane's explicit-export closure result is not a new kernel replay here. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; HEAD observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (2026-11-24); path check only, not semantic equivalence: [{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/SectionEqThetaZero.lean","old":"8c2954a4ed5807b833067ea5a53f5e6ff4a5b171","current":"550f3b0b9839149a4275f2fc8a12724b5b209dc4"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean","old":"1079d74072e904d278cba232030edc7bee2c9e2a","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean","old":"1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b","current":"50a6dbbb774c444de5da6b5e7900d599c6e7c4bb"}]. Keep original pin.

## 1. Native theorem and exact scope

SectionEqThetaZero.lean lines 113–182 proves cOneVal_pf; DegCut.lean cOneVal calls it verbatim. All fields/types of SD, RD, LD, Hyps (25 fields), both CoefData records, the two Fourier indices T,T', L.IsSub T T', arbitrary x, Schwartz hPhi, vacuum hv and hIH: MainV 2 R' retained. In the section hmn and hE are declared but not used by this lemma: do not add a strict rank condition or larger-rank EData to its standalone statement. The enclosing rank step does use them. Seven explicit H fields in the proof and its fcVal helper: iwaQ, vacK, thetaCoef, orbRes, polyKFin, secK, eisWk. All other packaged premises remain available to callers. No assertion of their independent truth.

Write n=d.n, n'=L.n, m=d.m, s=(m-n)/2, s'=(m-n')/2, j=L.j. Let FC_T and FC'_T' denote original normalized Fourier integrals with the same additive character d.B.psi but their own frames, measures and fundamental domains. cOne (FourierZero.lean) is FC'_T' of the lower-rank coset sum formed from the restricted higher-rank section and height, evaluated at identity, not at x or g0. Claim: its HolValueAt at s is 2 FC_T(I_Phi)(x).

## 2. Restrict the Schwartz vector after Iwasawa factorization

IwaQ gives q,g0,k,r,c with k in K, x=q j(g0) k, r>0 and a(j(g')x)=r a'(g'g0) for EVERY g'. Its other condition is the equality on all matrices X whose removed column i0 is zero:
T_d(om(j(g')q) Psi)(X)=c T_d(om(j(g')) Psi)(X)
for every Schwartz Psi and g'. The scalar c is complex; the source does NOT require c != 0. No division by c is valid or needed.

Schwartz stability (om_sch) and the first VacK field imply Phi_k=om(k)Phi is Schwartz and vacuum. The last VacK field constructs Phi' with lower vacuum and IsRes(Phi_k,Phi'): Schwartz and T'(Phi')(X|em)=T_d(Phi_k)(X) on zero-column matrices. LD.res upgrades this to equivariant restriction for every g. At X=0, submatrix_zero gives T'(om'(g)Phi')(0)=T_d(om(j(g))Phi_k)(0).

COne.T_zero uses d.ok.dbl.kill at zero and zero matrix multiplication to identify T_d(Psi)(0)=d.l(Psi); section_eq_theta_zero then says sec0(Phi)(x)=T_d(om(x)Phi)(0). Combine the group homomorphism law, IwaQ with Psi=om(j(g0))Phi_k, and equivariant restriction at zero. For every lower group element g':
sec0_d(Phi)(j(g')x) = c sec0_L(Phi')(g'g0).
This is hf, lines 128–136. It is not an asserted equality of all unrestricted Weil vectors.

## 3. Spectral shift and coset sum

COne.Ln proves n'+1=n, not a separate premise: em injectively enumerates the complement of i0, so Fin n' is equivalent to that complement and has cardinality n-1. Hence s'=s+1/2 and (z+1/2)-s'=z-s, for all complex z. This exact half-step is essential, including n'=0 if allowed by the inherited data.

Heights are a.toNNReal, not assumed arbitrary complex powers. Because r>0, max(ra,0)=r max(a,0) for all real a. The source ht_cpow factors Ht(j(g')x)^(z-s) into r^(z-s) Ht'(g'g0)^((z+1/2)-s') using the nonnegative-real complex-power product rule; it does not use a false general complex-power product rule. Together with hf this gives equality of each restricted section term with c r^(z-s) times its lower-rank translated counterpart. COne.cosetSum_factor transports the identity over the actual coset sum by associativity and tsum_mul_left; then linearity of the Fourier set integral moves the same scalar outside. The native hid is therefore
cOne(z,x)= c r^(z-s) FC'_T'(E'_Phi'(z+1/2))(g0).
Here g0 comes from IwaQ; evaluation at the identity in the original cOne is the reason it becomes g0 on the right. Both sides retain the same lower Fourier character factor. This is a pointwise equality of the defined functions; convergence of the raw series at the special point is not asserted.

## 4. Carry the lower-rank special value through the Fourier functional

hIH (MainV 2 R') is a pointwise HolValueAt for every admissible vacuum Phi' and every group point, not yet a coefficient theorem. COne.fcVal converts it into a coefficient HolValueAt.

Use vacK's vacuum inclusion in the Fock submodule, polyKFin and secK to get a valid section. EisWk gives U,p,Ehat,t: U open right-domain containing s', p nonzero, spectral holomorphy and joint continuity, left rational invariance, compact uniform summable majorants and Ehat=p E' on the far-right region. Let k0=rootMultiplicity_s'(p).

FcCont.fcAll proves the Fourier functional is complex-linear on continuous left-rational-invariant functions and bounded by a compact sup norm. Its proof uses additive rational cocompactness to choose compact representatives; the character has absolute value one and is continuous; the finite measure of the fundamental domain is exactly one. This is why the bound has coefficient one, not an untracked Haar volume. Integrability follows by the compact bound and finite measure. DerivInv.lamDeriv applies the native holomorphic functional derivative statement, giving holomorphy and commutation of all iterated derivatives at s'. This is not an interchange based merely on pointwise convergence.

For each group point y and 0<=i<=k0, ordVal applied to hIH gives Ehat^(i)(s',y)=p^(i)(s')*2 I'_Phi'(y). Apply the Fourier functional, commuting derivatives and scalars, to obtain identical equalities for regularized coefficient derivatives. Below k0 these derivatives vanish by pderiv_lt; at k0 their value is p^(k0)(s')*2 FC'_T'(I'_Phi')(g0). wrap removes the common root factor locally and proves the required coefficient HolValueAt, including k0=0. This proves fcVal conditionally, not the source of hIH.

COne.hv_shift now composes the holomorphic representative with z->z+1/2 and multiplies by c r^(z-s). r>0 gives an entire multiplier with value c at z=s; the source uses positive-real slit-plane membership, meromorphic extension composition and product. Thus cOne has HolValueAt at s with value 2 c FC'_T'(I'_Phi')(g0). This works even if c=0.

## 5. Exact original theta coefficient

It remains to identify this value without introducing an extra volume or character. H.thetaCoef on the two models writes FC_T(I_Phi)(x)=orb_d(T,om(x)Phi) and FC'_T'(I'_Phi')(g0)=orb_L(T',om'(g0)Phi'). The IsSub guard means T has zero removed row and column and T' is its submatrix. H.orbRes (second field) applies to these orbit sums provided the correct restriction is shown. Set Psi=om(x)Phi and Psi'=c • om'(g0)Phi'. The lower vector is Schwartz by om_sch and submodule scalar closure. On each zero-column X, LD.res at g0 yields T'(om'(g0)Phi')(X|em)=T_d(om(j(g0))Phi_k)(X). IwaQ at g'=1 (not g0) for Psi0=om(j(g0))Phi_k yields T_d(om(q)Psi0)(X)=c T_d(Psi0)(X). T_smul and hx imply IsRes(Psi,Psi'). Thus orbRes gives equality of higher orbit sum and lower orbit sum at Psi'. COne.orb_smul extracts c from the actual normalized orbit average and infinite sum; no new measure identification is assumed outside OrbRes. Consequently
FC_T(I_Phi)(x)=c FC'_T'(I'_Phi')(g0).
Substitute in the value from section 4, proving HolValueAt(cOne(.,x),s,2 FC_T(I_Phi)(x)). The factor 2 comes solely from hIH, not from deleting a row, from Iwasawa normalization, or from a fitted constant.

## 6. Proof obligations and provenance

Native local source-body edges: cOneVal -> cOneVal_pf -> om_sch, section_eq_theta_zero -> T_zero, Ln, ht_cpow, cosetSum_factor, fcVal -> fcAll, lamDeriv, ordVal, wrap, hv_shift, orb_smul -> T_smul; projected hypotheses as above. No new independent publication theorem asserted: elementary linearity, finite-measure bounds, cardinality, holomorphic continuation and scalar-factor arguments are standard; actual local Iwasawa, restriction, theta coefficient/orbit and rank-induction inputs are explicit source premises. Locate their native producers separately, not label as proved by citation. This advances RUN8's lawSep input with all scope retained. No theorem-only or elaborated dependency closure measured here.

## 7. Executed reproducibility check

7 exact Git blob IDs matched against prior pinned observations, 84 source anchors found by fail-on-missing checks in connector JS. Current path checks recorded above. This is an actual static source check; no synthetic numerical model and no Lean build. Reproduce on a pinned upstream git checkout: save the JSON below as run9_sources.json and execute:

```python
import json,subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
rows=json.load(open("run9_sources.json"))
n=0
for r in rows:
    b=subprocess.check_output(["git","show",pin+":"+r["path"]])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==r["sha"]
    lines=b.decode().splitlines()
    for i,a in r["anchors"]:
        assert a in lines[i-1],(r["path"],i,a)
        n+=1
print(len(rows),"blob IDs;",n,"source anchors")
```

```json
[
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/SectionEqThetaZero.lean",
    "sha": "8c2954a4ed5807b833067ea5a53f5e6ff4a5b171",
    "anchors": [
      [
        15,
        "theorem om_sch"
      ],
      [
        18,
        "theorem T_zero"
      ],
      [
        27,
        "theorem section_eq_theta_zero"
      ],
      [
        30,
        "theorem T_smul"
      ],
      [
        36,
        "theorem orb_smul"
      ],
      [
        42,
        "theorem Ln"
      ],
      [
        44,
        "Equiv.ofInjective L.em L.inj"
      ],
      [
        50,
        "theorem cosetSum_factor"
      ],
      [
        56,
        "theorem ht_cpow"
      ],
      [
        61,
        "theorem hv_shift"
      ],
      [
        66,
        "Complex.ofReal_mem_slitPlane.2 hr"
      ],
      [
        73,
        "theorem fcVal"
      ],
      [
        78,
        "H.polyKFin"
      ],
      [
        79,
        "H.secK"
      ],
      [
        80,
        "H.eisWk"
      ],
      [
        82,
        "fcAll d' hc T g"
      ],
      [
        83,
        "lamDeriv"
      ],
      [
        86,
        "ordVal U p"
      ],
      [
        87,
        "hMV Ψ hΨ hv g'"
      ],
      [
        95,
        "rw [hComm _ hs i]"
      ],
      [
        100,
        "refine wrap"
      ],
      [
        103,
        "pderiv_lt"
      ],
      [
        115,
        "theorem cOneVal_pf"
      ],
      [
        119,
        "H.iwaQ"
      ],
      [
        120,
        "COne.om_sch d k hΦ"
      ],
      [
        121,
        "(H.vacK F E σ d R).1"
      ],
      [
        122,
        "(H.vacK F E σ d R).2.2"
      ],
      [
        126,
        "L.res _ hΦk"
      ],
      [
        127,
        "Matrix.submatrix_zero"
      ],
      [
        128,
        "have hf"
      ],
      [
        134,
        "hTq _ hΨ g' 0"
      ],
      [
        137,
        "have hs'"
      ],
      [
        138,
        "COne.Ln L"
      ],
      [
        139,
        "have hid"
      ],
      [
        142,
        "have ex : z + 1 / 2"
      ],
      [
        150,
        "COne.ht_cpow"
      ],
      [
        156,
        "COne.cosetSum_factor"
      ],
      [
        157,
        "unfold cOne"
      ],
      [
        40,
        "integral_const_mul"
      ],
      [
        160,
        "COne.fcVal H R' hIH"
      ],
      [
        162,
        "COne.hv_shift"
      ],
      [
        163,
        "have hv1"
      ],
      [
        164,
        "H.thetaCoef"
      ],
      [
        165,
        "H.orbRes"
      ],
      [
        165,
        "COne.orb_smul"
      ],
      [
        168,
        "COne.T_smul"
      ],
      [
        171,
        "hTq _ hΨ 1 X hX"
      ],
      [
        176,
        "rw [e, h2]"
      ],
      [
        180,
        "rw [hfun, hv1]"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean",
    "sha": "1079d74072e904d278cba232030edc7bee2c9e2a",
    "anchors": [
      [
        5,
        "import Development.WeilBound.CoreStatements.AutomorphicKernels.SiegelWeilFormula.AdelicDilations.SectionEqThetaZero"
      ],
      [
        56,
        "theorem cOneVal"
      ],
      [
        60,
        "cOneVal_pf H R L R' hIH hΦ hv hc hc' hT x"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/FourierZero.lean",
    "sha": "3b892acbdefc04bd96ca0818751096d202069c47",
    "anchors": [
      [
        11,
        "structure Hyps"
      ],
      [
        15,
        "thetaCoef : ThetaCoef"
      ],
      [
        31,
        "vacK : VacK"
      ],
      [
        32,
        "iwaQ : IwaQ"
      ],
      [
        36,
        "orbRes : OrbRes"
      ],
      [
        53,
        "def cOne"
      ],
      [
        56,
        "T' 1"
      ],
      [
        40,
        "def EData"
      ],
      [
        41,
        "p ≠ 0"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean",
    "sha": "1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",
    "anchors": [
      [
        94,
        "structure LD"
      ],
      [
        98,
        "rng : ∀ i"
      ],
      [
        112,
        "def IsRes"
      ],
      [
        121,
        "def IsSub"
      ],
      [
        119,
        "ν 𝓤 = 1"
      ],
      [
        126,
        "def MainV"
      ],
      [
        147,
        "def VacK"
      ],
      [
        150,
        "def IwaQ"
      ],
      [
        24,
        "0 < r"
      ],
      [
        175,
        "def OrbRes"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/FcCont.lean",
    "sha": "cde3c01a796de6eb1cad61b1666f03bc5567f63a",
    "anchors": [
      [
        14,
        "theorem fcAll"
      ],
      [
        20,
        "hvol"
      ],
      [
        27,
        "kfour.nF_cocompact"
      ],
      [
        31,
        "‖χ β‖ = 1"
      ],
      [
        50,
        "Measure.integrableOn_of_bounded"
      ],
      [
        61,
        "norm_setIntegral_le_of_norm_le_const"
      ],
      [
        62,
        "lam.real 𝓖 = 1"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DerivInv.lean",
    "sha": "599346241479f91ea4b012ce39ecf2606f407c81",
    "anchors": [
      [
        20,
        "theorem lamDeriv"
      ],
      [
        4,
        "AutomorphicFunctionalHolomorphicDerivativeStatement"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean",
    "sha": "7a79c77e00affe229c88b89f0eef23832a4272ed",
    "anchors": [
      [
        65,
        "theorem ordVal"
      ],
      [
        85,
        "theorem wrap"
      ],
      [
        36,
        "theorem polyFac"
      ],
      [
        9,
        "theorem iterDerivPow"
      ]
    ]
  }
]
```

RESUME HERE: reconstruct the pinned native producer of IwaQ (start from the IwaQ argument at SiegelWeilStdOf.lean AStep.stepOf, trace its imports to the exact theorem body), preserving positive height ratio, both group positions, uniformity over Schwartz vectors, zero-column restriction and no c!=0 requirement. Then VacK restriction and OrbRes producers independently. HolLead, FourierZero and RUN3 lInt2 deeper producers still open. HANDOFF TO theta, integration, editor, audit, literature. No physics changes.
