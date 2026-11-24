# Human-readable RH reconstruction — seventeenth edition, end-of-day 24 November 2026

**INCOMPLETE — deadline audit.** Strongest available integrated reconstruction, not a completed proof of RH. Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream observed 82c577caf1b8a66c76212d78a399234f55813d28, 202 commits ahead of earlier 9282d3a102c4aff0e6026746db2a8990f5d9cddd (compare API). No migration. Working peer snapshot 28e13dddd23cec2d5fbaadeb0b14244140b432fc. Earlier linked volumes [1](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [2](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [3](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [4](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [5](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [6](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [7](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [8](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), [9](2026-11-24_1856_INTEGRATED_MANUSCRIPT.md), [10](2026-11-24_1956_INTEGRATED_MANUSCRIPT.md), [11](2026-11-24_2056_INTEGRATED_MANUSCRIPT.md), [12](2026-11-24_2156_INTEGRATED_MANUSCRIPT.md), [13](2026-11-24_2256_INTEGRATED_MANUSCRIPT.md); this is volume 14. Previous 161 primary + 11 supporting entries; eight new primary peer chapters and three supporting peer reports bring the editorial inventory to 169 + 14 = 183 (editor derivations excluded as previously). These are not unique translated declarations.

## Reading order and exact joins

1. Root nonvanishing, functional equation and imprimitive reduction in volume 1; then consult the 23:00 root-frontier concordance below for observed partial value paths. Source root calls allChi, not the alternative zeta-only size-window route.
2. Analytic chain: volume 12 explicit-formula adapter, volume 13 fixed-character decay, volume 10 log-derivative series; new Landau chapter for distinct zeta Laurent constants. Fixed-character bounds cannot replace uniform GoodFor. New ThinChoice chapter below follows actual producer; the old wrapper ignores its five arguments. This does not remove the five propositions from QDChoice.
3. Prime and conductor arithmetic: volume 9 QDChoice, new ThinChoice, prior rank/host/level/parameter bounds, new conductor powers/inversion and admission equivalence. No complete native FamP witness.
4. Galois/local-global: earlier PlanEx and geometric realization, new spectral trace (not simultaneous eigenfunction), finite adele base-change (not infinite/finite tensor split). Preserve separate sites and primes.
5. Theta and geometry: new leading-Eisenstein-derivative adapter retains HolLead and LamSing; two-section acyclicity only in indicated degrees; new Noether denominator, not full GAGA supplier. Earlier Hodge and comparison chapters remain conditional.
6. Return through same-family windows, character projection and Landau contradiction to root reflection; unresolved leaves remain explicit.

## New editor chapter — native ThinChoice and five unused wrapper arguments

SOURCE-MATCHED conditional human reconstruction of GlobalTheory.EX.thinChoice_host, QH.thin, QH.small_zeros and conductor class adapters. Native route HostExOfPublished.hostEx_of_zeroFreeRegion -> GlobalTheory.T.thin_choice_of_zero_density -> GlobalTheory.EX.thinChoice_of_explicit -> thinChoice_host. The third theorem body is exactly

    fun _ _ _ _ _ => thinChoice_host

Thus its five displayed assumptions ExplZeta, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet are syntactically unused in that wrapper, not proved or removed from the entire chain. QDChoice still consumes them. The actual ThinChoice supplier calls QH.thin and QH.small_zeros with their own source dependencies. No proof-term root reachability, independent kernel closure or noncircularity established by this observation.

### A. Exact proposition and uniformity

For every real eps with 0<eps<1/52, there exists c>0 such that for every real Co there exists x0, and for every Scale s, Ranks R and Host H of R, if s.eps=eps, x=s.x>=x0, RankVal s R, R.o<=Co, H.QS<=Co*R.n, log(H.QS*H.q*H.d)<=3*x^(eps/5)*(log x)^2, and RealBox H.toHostRaw, then ThinOK s c H. RealBox gives L(beta,chi)!=0 when 1-1/400<beta<1, for every real-valued primitive host character whose level N is divisible by q or d. ThinOK asks for every primitive host character at nonzero level N and y>=exp(x^(eps/3))/3:

    |gChi(chi,y)| <= y exp(-c x^(eps/8)).

Choose c=1/2 before Co. The upper eps bound and RankVal are not used directly by this proof but remain in the original proposition.

### B. Finite small-level zero-free strip

NoExc(a,chi) says L(beta,chi)!=0 for 1-a<beta<1. For each fixed positive level and each nonprincipal character, continuity along the real line and nonvanishing at 1 give an open interval around 1 of positive radius a_chi. For principal chi choose radius 1 because chi!=1 is vacuous. The character group at fixed level is finite, so the minimum radius is positive. Take the minimum over levels 1,...,N0. For N0=0 choose 1 and the nonzero-level premise excludes every N. This is QH.small_zeros, also for imprimitive characters. No uniform strip over unbounded levels.

Fix Co, let N0=ceil_nat(8 Co^2), choose c1>0 from small_zeros, and set c0=min(1/400,c1)>0. QH.thin at (eps,3,1/2,c0) supplies x0 before the host and character are chosen.

### C. Host character arithmetic

Using thinScales_iff_hostBound, take H.IsCharE chi. UpperTheory.GL.realClass yields N|H.condN=QS*q*d for every host character, with primitive status from the original host witness. Therefore log N<=log H.condN<=3*x^(eps/5)*(log x)^2 (N>0 by NeZero, H.condN>0).

Let O=ordCompl[2] QS, e the frame exponent and n=R.n=frame.ord. Source hypotheses give 2^(e+2)|QS, n<=o*2^e, o<=Co, QS<=Co*n. Since o>=0, Co>=0. Thus

    2^e O <= QS <= Co n <= Co o 2^e <= Co^2 2^e.

Cancel positive 2^e to get O<=Co^2. This is oddQS_le. If chi^2=1 then its values are 0,+1,-1, hence real. Conversely real-valued chi has square one because its values on units have absolute value one. The realClass dichotomy for a real host character is N|8 O or q|N or d|N, by real_cond (primitive quadratic conductor, 2-adic exponent <=3, odd exponent <=1), prime support of QS*q*d, and cancellation of q,d if coprime to N. Retain prime and primitive guards. In the first case N<=8 O<=8Co^2<=N0, using 8O>0; apply small_zeros. In the second case apply RealBox. For chi!=1 and 1-c0<beta<1, both cases give nonvanishing since c0<=c1 and c0<=1/400. Principal or nonquadratic chi satisfies the conditional NoExc premise without this test. No assertion of general complex zero exclusion in this step.

### D. Actual analytic adapter QH.thin

For positive eps,A,c,c0, primitive chi, log N<=A P with P=x^(eps/5)(log x)^2, assume chi^2=1 and chi!=1 imply NoExc(c0,chi). QH.psi_thin supplies C,b>0, uniform in N,chi,lam, with

    |psi0(chi,u)| <= C u (log u + lam)^2 exp(-b log u/(lam+sqrt(log u)))

when lam>=1, log N<=lam and u>=e. QH.int_thin at A+1 gives x1 such that this pointwise bound for u>=y implies

    |y integral_(y,infinity) psi0(chi,u)/u^2 du| <= y exp(-c x^(eps/8)),

for y>=exp(x^(eps/3))/3 and 1<=lam<=(A+1)P. Exact threshold x0=max(x1,e,3^(3/eps)). For x>=x0, P>=1 and x^(eps/3)>=3, whence y>=exp(3)/3>=e by exp(2)>=3. Set lam=max(1,log N)<= (A+1)P. QH.g_integral states G0(chi,y)=-y integral_(y,infinity) psi0/u^2, for primitive chi and y>=1. Norm removes the minus sign. This proves QH.thin conditional on these three actual source suppliers. psi_thin calls pt_zero_free, explicitFormula_closed, zerosWindow_closed; int_thin calls thin_integral; g_integral calls l21a. Their full internal proofs and exact root paths remain open.

### E. Last equality and conclusion

G0 splits at chi=1 into principal G1 and nonprincipal Gchi. gauss_sum_function_eq proves equality with Formalism.HC.An.gChi by removing max(y/n-1,0) for n in [1,floor_nat y], since such n implies y>=0 and n<=y. Empty sum is vacuous. Unfolding principal and nonprincipal corrections gives identical terms, including log derivative. Apply QH.thin with parameters from B and NoExc from C; transfer through equality and thinScales_iff_hostBound to ThinOK for the same H,N,chi,y. This reconstructs the native ThinChoice assembly, not all HostEx. Audit requested: unused lambda binders vs transitive dependencies, real-strip split, exact quantifier order, strict endpoints and same witness.

## Source ledger — 15 pinned connector blob identifiers, 43 literal anchors matched in preceding execution

- [src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExOfPublished.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExOfPublished.lean) — e3057342dc9bbeb5263ff97a9a786fec9c920d54; hostEx_of_zeroFreeRegion
- [src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ThinChoiceOfZeroDensityStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ThinChoiceOfZeroDensityStatement.lean) — 5caf98cc78431e6d457e29688b4f621c7ae420b2; thin_choice_of_zero_density
- [src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ThinChoiceOfZeroDensity.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ThinChoiceOfZeroDensity.lean) — 218520e37f02a66118c433130d47df9a998a782c; thinChoice_of_explicit; fun _ _ _ _ _ => thinChoice_host
- [src/Development/AutomorphicArithmetic/CharacterBoxes/ThinChoice.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/CharacterBoxes/ThinChoice.lean) — 00b6f5fe9348e1d26ef97b7cdcc16ada3a38b489; thinChoice_host, gauss_sum_function_eq, isReal_of_sq
- [src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean) — 8e3d3a30a2d801bf03b6f79dbee8415beb2484e3; ThinChoice, RealBox
- [src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ThinScalesIffHostBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ThinScalesIffHostBound.lean) — 1de433cc5ce2fa941ca72691bc75a3bccb667634; ThinOK, thinScales_iff_hostBound, isCharH_iff
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/Thin.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/Thin.lean) — d322f531dc42b40bee2cddc76f83f53a2f592ba6; thin
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/SmallZeros.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/SmallZeros.lean) — 181f5dee248928e109c200108f64da26ec04d21a; small_zeros, noExc_one, noExc_level
- [src/Development/AutomorphicArithmetic/ConductorsKronecker/realClass.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ConductorsKronecker/realClass.lean) — 6c587ab6f70e0c6596f85650ac579323be4edba5; realClass, realClass_sq, realClass_level_dvd
- [src/Development/AutomorphicArithmetic/ConductorsKronecker/OddQSLe.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ConductorsKronecker/OddQSLe.lean) — 0ce276c8360deffbf94a62fd3d4ccb51988d7294; oddQS_le
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean) — 45616f33334b6ef360b18a8e64c0eb325f9463b8; G0, NoExc
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/GIntegral.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/GIntegral.lean) — 2aec6ab92f2444079d849f50b20ec83a37343728; g_integral, l21a
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/PsiThin.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/PsiThin.lean) — 9e669a084dd244d41a04f1b9f46ad13cd0b3426c; psi_thin, pt_zero_free, explicitFormula_closed, zerosWindow_closed
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/IntThin.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/IntThin.lean) — 2f4793c5f745dd1d955aedd4702e9b46b231b5cb; int_thin, thin_integral
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/realCond.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/realCond.lean) — 0bd3d4fed640c917a47797773ee1ddaaf1982d65; real_cond

No independent raw-byte hash or Lean replay. V8 exact arithmetic regression executed: {"nOdd":177802,"nWindow":675,"nSmooth":15229,"negative":4}. Finite scalar tuples, rational window inclusions and smoothing guards only; negative controls illustrative, not L-function counterexamples. No analytic theorem proved by testing. Reproduce using Node:

```js
function regression(){
 let nOdd=0,nWindow=0,nSmooth=0,negative=0;const ck=(b,m)=>{if(!b)throw Error(m)};
 for(let e=0n;e<=6n;e++)for(let v=e+2n;v<=e+5n;v++)for(let odd=1n;odd<=35n;odd+=2n)for(let o=1n;o<=8n;o++)for(let C=o;C<=12n;C++){const q=2n**v*odd;for(let n=1n;n<=o*2n**e;n++){if(q>C*n)continue;ck(odd<=C*C,"odd-part budget");ck(8n*odd<=8n*C*C,"small conductor ceiling");nOdd++}}
 for(let c1=1n;c1<=80n;c1++)for(let beta=1n;beta<=4000n;beta++){const c=c1<10n?c1:10n;if(beta<c){ck(beta<c1&&beta<10n,"window inclusion");nWindow++}}
 for(let d=1n;d<=12n;d++)for(let y=-10n;y<=100n;y++)for(let n=1n;n*d<=y;n++){ck(y-n*d>=0n,"smoothing max");nSmooth++}
 ck(9n>2n**2n,"no QS bound");negative++;ck(9n>2n**2n,"no o bound");negative++;ck(15n<20n&&!(15n<10n),"max is not min");negative++;ck(1n-2n<0n,"smoothing outside summation window");negative++;return {nOdd,nWindow,nSmooth,negative};
}
console.log(regression());
```

## End-of-day coverage audit

- Export traversal denominator: previously reported 1,484,705 reachable declarations, 0 missing hard references under export policy. Independently translated unique reachable numerator unknown; no defensible completion percentage.
- Integration 23:00 selected frontier: 34 unexpanded native targets, 20 lexical matches, 14 no match, 1 fully qualified hit; zero translation closures credited. Selected frontier, not a representative sample.
- Observed value paths: 1263 identities, 92 expanded in four-projection report. Expansion is not mathematical translation. Registered 34-target native scan not independently retrieved as completed here.
- Editorial inventory: 183 entries in 14 linked volumes, not proof completion. Independent Lean replay, full source-to-export correspondence and URT advantage remain unestablished.

## Numbered remaining obligations — 24 November completion audit

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. PlanEx peer expansion conditional on 15 imported suppliers including specTopG, no root closure.
2. RecTExists/VWin and native host design: QDChoice and analytic estimates conditional; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor. Preserve common witnesses.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, actual HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. HolT first and second members now locally reconstructed with imported leaves. Crystalline totality/zero expanded; forget-forms acyclicity, restriction, linearity/cup, full Hodge comparison and naturality remain.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. Polynomial-growth argument and adm5 inequalities do not supply the entire native family. Adelic integral restricted-product comparison and topology compatibility open.
6. Actual analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, zero-density, Mertens, prime mean-square/count and window producers. Primitive fixed-character decay is now conditionally reconstructed, as is log-derivative consumer; uniform GoodFor branch retains its stronger antecedents. Boundary nonvanishing peer locally reconstructed with imported analytical leaves.
7. Source/build/export correspondence, typed projection and independent kernel replay/axioms. Prior mixed export closure denominator 1,484,705 declarations; unique independently translated reachable numerator unknown. New dependency report describes authenticated 71-target job, 142 expanded owner identities across combined reports, observed value-constant path 1263 identities with 92 expanded. These are report metrics, not translation coverage. Kernel RUN16 notes missing older report in its own retrieval and generated recursor RHS erasure counterexample; preserve roles. Do not treat metadata, type, value and structural slots as identical.
8. Independent proof and citation audit, exact joins, root reachability and external trust boundaries. No defensible completion percentage; 172 editorial entries are not unique proved declarations. The requested complete manuscript is not yet achieved.


Update to 2: native ThinChoice source now located and human assembly reconstructed; actual three analytic suppliers and internal leaves remain open. Update to 6: five explicit-formula propositions unused in ThinChoice wrapper but producers for QDChoice and other uses remain open. New peer admission, spectral certificate, local comparisons and Noether denominator do not discharge global existential inputs. Update to 7: selected 34-target frontier and pending scan; generated TLiftK proof fields not yet aligned. All eight broad groups remain open.

Continuity: AGENTS, swarm protocol/queue/expansion, end-of-day spine, state/log/protocol/continuity excerpts, CI #403 PASS (not RH validation), prior edition, peer handoffs, integration and audit/dependency/structure scripts inspected. Eleven peer document identifiers and pin strings checked; peer code and all underlying source assertions not independently rerun. External blueprint and nested Grok lane not fully reread. No physics changes or source migration.

**RESUME HERE:** Follow QH.psi_thin calls pt_zero_free, explicitFormula_closed, zerosWindow_closed to actual native producers and request role-labelled references with thinChoice_host and thinChoice_of_explicit. Distinct from earlier conditional explicit-formula adapter. Dependency lane owns 34-target scan, integration owns TLiftK generated proof alignment. Audit lane: check unused five binders, real-strip split and same-witness scope. HANDOFF TO all lanes. Deadline for complete manuscript not met; project OPEN.

## Additional peer reproducible scripts (immutable links, not rerun)
- [audit/2026-11-24_2348_cr_weighted_residual_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_2348_cr_weighted_residual_audit.mjs)
- [dependencies/rh_34_producer_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_34_producer_frontier.mjs)
- [structure/2026-11-24_2324_successor_signature_quotient.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_2324_successor_signature_quotient.mjs)
- [math/verify_conductor_zpow_inverse.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_zpow_inverse.py)
- [specialists/kernel_extractor/run17_raw_slice.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run17_raw_slice.mjs)
- [specialists/on_acceleration/run17_union.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run17_union.mjs)
- [specialists/on_acceleration/stream_reverse.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/stream_reverse.py)

## Integrated peer appendices — verbatim, preserving their original status


---

## Appendix 1: peer original — math/2026-11-24_conductor_zpow_inverse.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_conductor_zpow_inverse.md) — blob 880eee5106fcf4c6e56e0f87e292338807aae51e. Original text follows.

# MATH lane — powers cannot increase conductor; inversion preserves it

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of Mathlib `conductor_zpow_dvd`, its natural-power
corollary, and `conductor_inv`, with the exact use in the pinned RH source.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` (blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f`) pins Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | all three conductor declarations and their factor-through suppliers |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | commutative-group structure and integer powers of multiplicative characters |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | RH consumer `prim_mul` |

At current RH head `9282d3a102c4aff0e6026746db2a8990f5d9cddd`, the manifest instead pins
Mathlib `31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; the relevant current Basic file has blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct comparison found the bodies of
`conductor_zpow_dvd` and `conductor_inv` unchanged. The current RH consumer blob is
`4564722f96a5e2ca86092fb039e127a77a950c34`, and still uses `conductor_inv` in `prim_mul`.
This is source-text comparison, not elaborated-term equivalence.

## 1. Exact integer-power theorem

Let `R` be any type with `[CommMonoidWithZero R]`, let `n : Nat`, let
`chi : DirichletCharacter R n`, and let `m : Int`. There is no field, nontriviality, or nonzero-level
hypothesis. The source states

    conductor_zpow_dvd (chi) (m) : conductor(chi^m) | conductor(chi).

Thus every positive, zero, or negative character-group power may lose conductor but cannot acquire
a new conductor factor.

### Level zero

The proof begins with `eq_zero_or_neZero n`. If `n=0`,
`conductor_eq_zero_iff_level_eq_zero` gives

    conductor(chi) = 0,  conductor(chi^m) = 0.

The goal is therefore `0|0`, which is true. No primitive-character witness or nonzero-level theorem
is used in this branch.

### Nonzero level

Assume now `[NeZero n]` and write `c=conductor(chi)`. We know `c|n`. Apply
`mem_conductorSet_iff_conductor_dvd` to the character `chi^m` and the divisor `c|n`. It changes the
desired divisibility into the exact factor-through obligation

    c is in conductorSet(chi^m),

or equivalently, `chi^m` is the lift of some character of level `c`.

The lower-level witness is explicit:

    chi0 = chi.primitiveCharacter : DirichletCharacter R c,
    witness = chi0^m.

By definition of the primitive character,

    changeLevel(c|n, chi0) = chi.

The map `changeLevel(c|n)` is a monoid homomorphism between the commutative groups of
multiplicative characters, so `MonoidHom.map_zpow` gives

    changeLevel(c|n, chi0^m)
      = changeLevel(c|n, chi0)^m
      = chi^m.

This is the required factor-through witness. The conductor-minimality equivalence then returns
`conductor(chi^m)|c`.

The proof does not require values of `chi` to be invertible at nonunits. Integer powers are taken in
the character group: its identity character is one on units and zero on nonunits, and inverse powers
retain the mandated nonunit zero.

## 2. Natural powers

For `k : Nat`, Mathlib immediately derives

    conductor_pow_dvd (chi) (k) : conductor(chi^k) | conductor(chi)

by identifying the natural power with the integer power at exponent `(k:Int)` using
`zpow_natCast`. It introduces no additional premise or new factor-through argument.

The result is only divisibility. Equality fails: a nontrivial quadratic character of prime
conductor `p` has square equal to the principal character, whose conductor is `1` rather than `p`.

## 3. Exact inverse theorem

Under the same hypotheses on `R,n,chi`, with no `[NeZero n]`, Mathlib states

    conductor_inv (chi) : conductor(chi^-1) = conductor(chi).

Rewrite inversion as the integer power `-1`. The integer-power theorem directly gives

    conductor(chi^-1) | conductor(chi).                 (1)

For the reverse direction, apply the same theorem to the character `chi^-1`, again with exponent
`-1`:

    conductor((chi^-1)^-1) | conductor(chi^-1).         (2)

The double inverse is `chi`, so (2) is

    conductor(chi) | conductor(chi^-1).

Divisibility antisymmetry applied to (1) and (2) proves equality. This explains the compact source
sequence `dvd_antisymm`, `inv_inv`, two `zpow_neg_one` rewrites, and a second call to
`conductor_zpow_dvd`; none of those rewrites assumes a field of scalar values.

## 4. Exact downstream link

In RH private lemma `prim_mul`, let `A` and `B` be the two primitive characters lifted to the common
level `N`. To extract the conductor of `A` from the product `A*B`, the source applies
`conductor_mul_dvd_lcm_conductor` to `(A*B)` and `B^-1`. Character-group cancellation makes the
product `(A*B)B^-1=A`, while this theorem supplies

    conductor(B^-1) = conductor(B) = n.

Therefore

    conductor(A)=m | lcm(conductor(A*B),n).

The inverse-conductor equality is used only for this replacement; it does not itself prove product
primitivity. Coprimality and the product-level bounds finish `prim_mul` afterward.

## 5. Correction to the prior interpretation

The preceding report correctly described inverse-conductor equality as two applications of the
power bound, but did not reconstruct the factor-through witness or the level-zero branch. Those are
now explicit. Also, it contains a literal stray `+` after `[NeZero n]`; the
mathematical correction is: there is no `[NeZero n]` hypothesis on the general product bound,
`conductor_zpow_dvd`, or `conductor_inv`.

This report does not repeat the product-LCM construction, Jacobi evaluation, or the rest of
`prim_mul`.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_zpow_inverse.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_zpow_inverse.py

Observed output:

    conductor zpow/inverse regression: OK; report_checks=9, character_checks=114, fibre_checks=604, zpow_checks=2850, value_checks=160750, inverse_checks=228, negative_controls=3

The exact finite model enumerates all characters of products of the small cyclic unit groups listed
in the checker. Values are represented as root-of-unity exponents, with a separate nonunit zero.
For each character the conductor is recovered from constancy on fibres of the maps of unit groups.
The checker then exhausts integer exponents `-12..12`, verifies the lifted-value power law,
conductor divisibility, inverse equality and the double inverse. It includes strict-power,
identity-on-nonunits and zero-level controls.

This is an independently checkable finite regression, not a proof for arbitrary
`CommMonoidWithZero R`, a Lean replay, or an axiom audit.

## Failed attempts / limitations

- Replacing divisibility by equality fails for even powers of a quadratic character.
- Reasoning with pointwise scalar powers alone mishandles exponent zero and negative exponents at
  nonunits; the relevant operation is the character-group power, whose identity is also zero there.
- Proving only (1) yields one divisibility, not equality; the second application to `chi^-1` and
  the double inverse are necessary.
- Omitting the level-zero branch silently adds `[NeZero n]` to a theorem that does not assume it.
- The finite regression uses squarefree products of small odd primes. It does not establish the
  universal theorem or replace the pinned Lean proof term.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_changeLevel`, including both conductor-set divisibilities and
the injectivity step that returns the primitive character. Connect only its two uses establishing
`conductor(A)=m` and `conductor(B)=n` in `prim_mul`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.



---

## Appendix 2: peer original — specialists/character_boxes/RUN17_FINITE_ADELE_BASE_CHANGE.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN17_FINITE_ADELE_BASE_CHANGE.md) — blob abb027a8251dc14d4f3ef61aef9f334bcf32c02b. Original text follows.

# RUN17 — Finite adele base change: integral descent, injectivity and surjectivity
2026-11-24. SOURCE-MATCHED / DONE for human reconstruction of GlobalTheory.AdeleBaseChange.exists_toAd and the bijectivity/integrality arguments used in RUN16. Not a Lean replay, not a proof of RH, not an authenticated root-reachability certificate.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity protocol, research state/log/protocol excerpts, CI #402 (23:30:34 UTC, physics only), RUN16, 20 recent RH commit titles, and available RESUME HERE excerpts from 14 peer commit patches. No duplication of this theorem identified in those records. Some peer patches lacked markdown handoffs; external blueprint and full historical peer notes not reread. No changes to physics or protected files.

## Source pin and provenance
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned, unchanged since RUN16). All line ranges below are at P.
B=src/Development/AbelianVarietyTheory/Proofs/.
- A=B/IwasawaDecomposition/ExistsFiniteAdeleBaseChangeEquiv.lean (P blob 7452a948191f52df06f6501ac70ae5e69935bc72; H cb503c6d3abc89c06859c0d31c5e2d920cf59b13): exists_locMap 19–58, locMap_int 73–77, adMap 81–92, exists_toAd 105–112, exists_nat_mul_integral 114–121, exists_int_of_mem 123–128, exists_approx 134–147, coord 149–150, coord_tmul 152–154, sum_coord 156–162, exists_coord_denom 165–177, eq_zero_of_nsmul_eq_zero 179–182, eq_zero_of_divisible 184–193, exists_limit 195–218, map_tmul_one 225–226, map_mem_int 228–234, mem_int_of_map 236–242, map_injective 244–250, exists_map_eq_of_int 252–290, map_surjective 292–296, map_eps_mul_apply 298–302, prV_eq_zero_iff 304–321, prV_eq_one_iff 323–327, exists_finiteAdele_baseChange_equiv 331–346.
- S=B/UnitaryExistence/FiniteAdeleStrongApproximationModNat.lean (P b8e858e89e490cbed40cab54c3f73015f7352866; H 245f80f61e63ccaa9d753e0094f8e5f647b988f6): exists_valuation_sub_lt_of_injective 41–91, exists_sub_mem_adicCompletionIntegers' 93–134, exists_eq_algebraMap_add_nsmul 136–149, strong_approximation_mod_nat 151–169.
- C=B/UnitaryExistence/IntegralFiniteAdeleCompleteSeparated.lean (P 1017e864a696bc30726d16d7a25f7bc63255c8f2; H 3e5e5d653f2a51fc3c7ab251e433d53782a20): exists_nat_valued_pow_le 30–35, eq_zero_of_valued_le_natCast 37–42, exists_limit_of_compatible 44–62, valued_nsmul_le 64–69, integral_finiteAdele_complete_separated 71–105.
- L=src/Formalism/SatakeDualWeyl/AdelicIwasawaHecke/Levelaf.lean (P a82305067315c15f9bd280d1167ce411cf54a34a; H c82d28803f05d11639c9618f734f41f47787a843): levelaf_tmul_mem 169–177, levelafQ 210–212, levelafQ_tmul 236–244, levelafQ_mul 246–253, levelaf_decomp 255–267.
- Consumer B/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean (P 4125fd7aed8d975a8179e2debf22c365e01f237e), IdemSupport.exists_comp 181–206. RUN16 already translated this consumer. This run supplies its native finite base-change leaves.

## Quantifiers and notation
For every pair of number fields F,E with the original field, NumberField and Algebra F E instances, let A_F be the finite adele ring, Ô_F its everywhere-integral subring intAd F, T=E⊗_F A_F=AfE F E, R=RInt F E (the subring generated by integral pure factors). The chosen map i:T→A_E satisfies for ALL x∈E,a∈A_F, i(x⊗a)=diag(x)adMap(a). The later lemmas hold for ANY ring hom with this property hι, not only the chosen witness. No normality/Galois or extra field extension hypothesis, no assertion of a homeomorphism. All positive integers N below are arbitrary, not a single modulus; N=0 is never divided by. Completeness of local fields, finite generation of O_E over Z, height-one prime valuations, and ramification identities are preserved.

## Human proof

1. A:19–112. For P over v, extend F→E to the completions by uniform continuity and the completion map. The extension agrees on F. For an embedded field element a with |a|_v≤exp(−n), |a|_P=|a|_v^e≤|a|_v for positive ramification exponent e. On all completion elements the same bound follows by density in the open v-ball and closure of the inverse image of the closed P-ball. Consequently locMap_int (n=0). For a finite adele a, only finitely many base v violate integrality, and each has finitely many P above it; hence adMap(a)_P=locMap_P(a_v) belongs to the restricted product. Coordinatewise ring laws and diagonal agreement make adMap and E's diagonal map F-algebra homomorphisms. The tensor universal property produces i and its pure-tensor formula. This proves exists_toAd, but does not prove bijectivity yet.

2. S:41–169. Strong approximation modulo N: every a∈A_F can be written diag(x)+N b with x∈F,b∈Ô_F; if a is integral x can be chosen in O_F. To see the N=1 case, let T_bad be the finite set of nonintegral coordinates. For each v use density of F in F_v and openness of the integral ball to choose c_v∈F with a_v−c_v integral. Clear denominators of c_v on T_bad by one nonzero d∈O_F. Enlarge T_bad by the finite prime divisors of (d). CRT gives r∈O_F congruent to d c_v at v∈T_bad and 0 at the other primes in the enlarged set, modulo the corresponding powers v^{ord_v(d)}. Then w=r/d approximates c_v modulo local integers at bad v and is integral everywhere else. At a prime outside the enlarged set d has unit valuation, so no new pole is introduced. Thus a−diag(w)∈Ô_F. Apply this to a/N and multiply back to get arbitrary positive N. If a integral, diag(x)=a−N b is integral at every place, hence x∈O_F by the original global integrality theorem. Retain the Dedekind CRT, localization denominator lemma, valuation comparison, density and finite-factor premises; this is not CRT over an infinite set.

3. A:134–147. Every z∈T can be decomposed as x⊗1+r with x∈E,r∈R. For a pure tensor e⊗a choose positive m with me∈O_E (finite denominators via exists_nat_mul_integral). By step 2, a=diag(k)+m a' with k∈F,a'∈Ô_F. Then e⊗a=(ke)⊗1+(me)⊗a'. The last term is in R. The zero and additive cases give all tensors by tensor induction. This does not assume every tensor is pure.

4. L:169–267, A:228–242. Choose a finite Z-spanning family g_j of O_E. Every r∈R is a finite sum Σ g_j⊗r_j with r_j∈Ô_F. Indeed pure integral products are in R by factoring as (g⊗1)(1⊗r), and the class of displayed sums contains the generators and is closed under zero, one, addition, negation and multiplication (expand g_j g_k in the same Z-spanning family). Subring closure induction proves the representation. i maps R into Ô_E by the pure tensor formula and adMap_int. Conversely, if i(z)∈Ô_E, write z=x⊗1+r by step 3; then diag(x)=i(z)−i(r) is integral everywhere, so x∈O_E. Thus z∈R. This proves i⁻¹(Ô_E)=R without already assuming injectivity.

5. C:30–105. The two facts about Ô_F used later are separatedness ∩_{N≥1} N Ô_F={0} and existence of a compatible limit. For a place v choose p=absNorm(v)>0; p lies in v and |p^n|_v≤exp(−n). If y∈N Ô_F for ALL positive N, then |y_v|≤|p^n| for every n, hence y_v=0 at every place. For compatible integral x_N with x_{Nm}−x_N∈N Ô_F for positive N,m, the subsequence x_{p^n,v} is Cauchy and the original complete-local-field lemma produces t_v with |t_v−x_{p^n,v}|≤exp(−n). For a fixed positive N choose n with exp(−n)<|N|_v. Use the exact identity
   t_v−x_{N,v}=(t_v−x_{p^n,v})−(x_{p^nN,v}−x_{p^n,v})+(x_{Np^n,v}−x_{N,v}).
   Each term has valuation ≤|N|_v, hence the sum does by ultrametricity. Thus (t_v−x_{N,v})/N is integral. The case N=1 shows t itself is integral everywhere because x_1 is; both t and each quotient are consequently genuine restricted adeles. No uniform n across places required. All local completion and valuation facts remain obligations; no countable compactness shortcut.

6. A:149–218. Fix F-basis b_i of E (finite dimension). Coordinate maps c_i:T→A_F are F-linear, and z=Σ b_i⊗c_i(z) by tensor induction. A single positive integer D clears the F-coordinate denominators of the finitely many g_j from step 4, so D c_i(r)∈Ô_F simultaneously for ALL r∈R and i. This uses the finite generating family, not a denominator selected separately for each r. If z∈N R for all positive N then D c_i(z)∈N Ô_F for all N; step 5 gives zero, and characteristic zero cancels D, so z=0. For compatible x_N∈R with x_{Nm}−x_N∈N R, apply step 5 to D c_i(x_N) to obtain t_i with t_i−D c_i(x_N)∈N Ô_F for every N. Choose M>0 clearing the denominators of the b_i in E. Then y=Σ(Mb_i)⊗t_i satisfies y−MD x_N∈N R for every N. This proves exists_limit with one common scale MD and one y chosen before N; unscaled lifting is not assumed.

7. A:244–250. If i(z)=0, for each N>0 let w_N=((N⁻¹)⊗1)z. Then i(w_N)=0 lies in Ô_E and step 4 implies w_N∈R. Since z=N w_N, step 6 separatedness gives z=0. Hence i is injective. Characteristic zero and N>0 are essential to invert N, and reverse integrality is used before the kernel is shown trivial.

8. A:252–290. Fix integral s∈Ô_E. Step 2 supplies, for each positive N, x_N∈O_E and a_N∈Ô_E with s=diag(x_N)+N a_N. Choose these simultaneously (the source chooses dummy zero data at N=0). Subtract the equations at N and Nm:
   diag((x_{Nm}−x_N)/N)=a_N−m a_{Nm}∈Ô_E.
   Global integrality forces (x_{Nm}−x_N)/N∈O_E. Therefore X_N=x_N⊗1 forms a compatible family in R. Step 6 yields D>0 and y with y=D X_N+N w_N, w_N∈R, for every N>0. Subtract D s after applying i:
   i(y)−D s=N(i(w_N)−D a_N)∈N Ô_E.
   The target's separatedness (step 5 over E) forces i(y)=D s. Hence i(((D⁻¹)⊗1)y)=s. For general z∈A_E, write z=diag(x)+a via step 2 with N=1 and lift a; add x⊗1. This proves map_surjective. The scale D is canceled in the field algebra, not by dividing inside the integral subring. No circular appeal to surjectivity or to an inverse map.

9. A:298–346. The ring equivalence packages the proven bijectivity. Preserve all four advertised fields: diagonal identity, integral iff, support iff for units, and valuation estimate. For base v, multiplying by afsplitEps selects exactly P over v after i. The identity afsplit_decomp expresses this product in terms of prV. Thus prV(z)=0 implies i(z)_P=0 for all P over v; conversely those vanishings imply i(afsplitEps z)=0 at every P, hence afsplitEps z=0 by injectivity, and the split projection identities give prV(z)=0. Apply to z−1 to get prV(z)=1 iff all P over v have image 1. The suppAt condition is the intersection of kernels on every other base place v'; the latter equivalence converts it to i(z)_P=1 whenever P.under≠v. Finally for a∈A_F,k∈F, P over v and n∈N, the difference i(1⊗a)_P−diag(k)_P equals locMap_P(a_v−diag(k)_v), and step 1 gives the required estimate. No homeomorphism is asserted by this ring equivalence. The original afsplit identities remain named dependencies.

10. Actual RUN16 edge: IdemSupport.exists_comp calls exists_toAd, map_injective, map_surjective, map_tmul_one, map_mem_int and mem_int_of_map directly. Its full adele splitting and tensor swap are separate suppliers; do not confuse this finite equivalence with the full archimedean comparison or the continuous Θ. The packaged exists_finiteAdele_baseChange_equiv is also translated here, but it is not substituted for the direct caller edges or declared reachable from Main.

## Executed source and arithmetic checks
Connector V8 fetched 5 pinned files, 4 also at H; located 26 selected named declarations at both pins, found all 62 requested literal reference anchors in the corresponding P declaration slices, plus 6 qualified consumer references. 14 extracted declaration slices unchanged, 12 changed at H (exact text comparison, not semantic comparison). Primary changes observed include tactic map_add annotations, local transparency option, letI→let and zero_le spelling/whitespace; no blanket proof equivalence inferred. Strong approximation's four slices and the packaged equivalence's slice unchanged. Completeness local separation and limit slices changed, main completeness statement/proof slice unchanged. No root authentication or kernel check from lexical references.

Reproduction of the 62 anchors: for each row, inspect the named declaration slice via git show P:path; every listed token was found. Source extractor starts at theorem/private theorem, ends at next top-level theorem/private theorem/def/abbrev/variable/section/end/namespace/noncomputable/open/set_option. A, S, C, L as above:
```
A exists_toAd: Algebra.TensorProduct.productMap adMap_algebraMap
A exists_approx: TensorProduct.induction_on strong_approximation_mod_nat levelaf_tmul_mem
A exists_coord_denom: Module.Finite.exists_fin levelaf_decomp exists_nat_mul_integral
A eq_zero_of_divisible: exists_coord_denom sum_coord integral_finiteAdele_complete_separated eq_zero_of_nsmul_eq_zero
A exists_limit: exists_coord_denom exists_nat_mul_integral integral_finiteAdele_complete_separated sum_coord
A map_mem_int: levelaf_decomp adMap_int
A mem_int_of_map: exists_approx map_mem_int exists_int_of_mem
A map_injective: eq_zero_of_divisible mem_int_of_map
A exists_map_eq_of_int: strong_approximation_mod_nat exists_limit exists_int_of_mem integral_finiteAdele_complete_separated map_mem_int
A map_surjective: strong_approximation_mod_nat exists_map_eq_of_int
A prV_eq_zero_iff: map_injective map_eps_mul_apply afsplit_decomp
A prV_eq_one_iff: prV_eq_zero_iff
A exists_finiteAdele_baseChange_equiv: exists_toAd map_injective map_surjective map_mem_int mem_int_of_map prV_eq_one_iff locMap_valued
S exists_valuation_sub_lt_of_injective: exist_integer_multiples Ideal.finite_factors exists_forall_sub_mem_ideal
S exists_sub_mem_adicCompletionIntegers': denseRange_algebraMap exists_valuation_sub_lt_of_injective
S exists_eq_algebraMap_add_nsmul: exists_sub_mem_adicCompletionIntegers'
S strong_approximation_mod_nat: exists_eq_algebraMap_add_nsmul mem_integers_of_valuation_le_one
C exists_nat_valued_pow_le: Ideal.absNorm Ideal.pow_mem_pow
C eq_zero_of_valued_le_natCast: exists_nat_valued_pow_le exists_exp_neg_lt
C exists_limit_of_compatible: exists_nat_valued_pow_le GlobalTheory.Idele.exists_limit Valuation.map_add_le
C integral_finiteAdele_complete_separated: eq_zero_of_valued_le_natCast exists_limit_of_compatible valued_nsmul_le Filter.Eventually.of_forall
L levelaf_decomp: levelafQ_mul levelafQ_tmul
```
For the 26 declaration count add A exists_locMap, coord_tmul, sum_coord and L levelaf_tmul_mem to the rows (22 rows plus 4 additional declarations: A has 13 rows +3, S 4, C 4, L 1+1). Reproduce pin comparison by git rev-parse P:path and H:path; compare exact extracted slices after trimming end whitespace only. Consumer references listed in step 10.

Executed exact BigInt regression in connector V8 for the rational prime-power compatibility/CRT specialization (not a substitute for the general number-field proof). Output {"consumerEdges":6,"compat":58752,"sep":800,"crt":360,"neg":2}. Two negative controls witness failure of arbitrary congruence choices and of separation for modulus 1 alone. No synthetic Cathedral operators; no URT acceleration claimed.
```js
function val(n,p){if(n===0n)return Infinity;let k=0;while(n%p===0n){n/=p;k++}return k}
let compat=0,sep=0,crt=0,neg=0;
for(const p of [2n,3n,5n,7n]){
 for(let s=-25n;s<=25n;s++)for(let N=1n;N<=24n;N++)for(let m=1n;m<=12n;m++){
 const r=(a,b)=>(a%b+b)%b,x=r(s,N),y=r(s,N*m);
 if((y-x)%N!==0n)throw Error("compat");
 let n=0n;while(val(p**n,p)<=val(N,p))n++;
 const K=p**n,t=r(s,K),u=r(s,K*N);
 if(s-x!==(s-t)-(u-t)+(u-x))throw Error("identity");
 if(Math.min(val(s-t,p),val(u-t,p),val(u-x,p))<val(N,p))throw Error("valuation");
 compat++;
 }
 for(let z=-100n;z<=100n;z++)if(z!==0n){let N=p**BigInt(val(z,p)+1);if(z%N===0n)throw Error("sep");sep++}
}
for(let x=0n;x<8n;x++)for(let y=0n;y<9n;y++)for(let z=0n;z<5n;z++){
 const r=(x*225n+y*280n+z*216n)%360n;
 if(r%8n!==x||r%9n!==y||r%5n!==z)throw Error("crt");crt++;
}
if(2n%4n===0n)throw Error("negative");neg++;
if(1n%2n===0n)throw Error("negative");neg++;
console.log({compat,sep,crt,neg});
```
Original premises removed: zero. No wall-time or O(N) claim.

## RESUME HERE
Locate and reconstruct GlobalTheory.AdSplit.exists_adele_equiv, the full infinite/finite tensor splitting theorem used in IdemSupport.exists_comp L183. Find the native definition via exact source search/imports, preserve both projection identities and its remaining fields, and test the actual consumer edges. Do not repeat finite base-change proof. Request authenticated role-labelled root edges for all RUN17 direct suppliers, especially map_injective/map_surjective and the two completeness/approximation producers, plus RUN16/15 pending suppliers; initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins remain open. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.



---

## Appendix 3: peer original — specialists/galois_representations/RUN17_SPECTRAL_TRACE_CERTIFICATE.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN17_SPECTRAL_TRACE_CERTIFICATE.md) — blob b29cf64c9e841b94211f3eda45b135ec1eb03257. Original text follows.

# RUN17 — spectral trace certificate, not a simultaneous eigenfunction

2026-11-24. Status SOURCE-MATCHED / PARTIAL; RH reconstruction OPEN. No native Lean execution or URT benchmark. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, RUN16, research state/log/protocol/continuity excerpts, CI #402 (23:30:34 UTC, physical checks only), 30 recent commit titles and 14 peer commit file lists/available handoffs. No duplicate of this specific frontier found. Some full peer notes and external blueprint PDF not reopened. No physical queue changes.

## Provenance
Upstream leanprover-community/riemann-hypothesis P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, same as RUN16. All paths relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/; SC=ScalarCommutation/, PL=IntegralStructures/GeometricFlagBases/PrimeLevelLocalization/.
- P SC/SpecTopG.lean L9–21 blob e9d721ea10bf53b752b48b4e4048f850a0764bab; H relocated PL/SpecTopHolds.lean L1810–1821 blob 7c960104248ffcf7c4ebe725d4c436c94aa4dbb9. P PL/SpecTopHolds.lean L7–9 blob 8cf10d013812af3c28862907cfbf0d62847dd302.
- P SC/ExistsIdempotentHeckeOperatorWithRegularSupportAlt.lean (Alt) blob a7314bbf29c849520cee6730aeead6b2caa7b041; H same path 417872b093601eb9b59d411ec8e8bb026e0b0e2a. P L21–31 Extra/PlTr/RegTr, 56–62 auxiliary choices, 77–94 ForData/AuxiliaryInertOddPrime/TyEx, 96–123 TyTop/TyFact/AuxFn proposition/MemFn/MemComm, 135–144 SpecData/SpecTopG.
- P SC/SpecData.lean L36–60 and L64–161 blob 5f8593e828d8d3d62db8aa14b57c4223a3a5d333; H L1762–1861 blob a73cf880aa60cfaa39acf1cbc7ac2de70e51aa24.
- P SC/SpecOfF.lean L29–175 and 179–227 blob 2a619e581a3f64fd8a548f6dc7ad614a8b591ebf; H same path L1488–1548 blob 23062f58247690cfd25c1c6ff00abfae9581393c.
- P SC/TypeSlice.lean L53–79, 81–91, 121–126 blob 1c176ad18a52ea0eaa699e930cfcd2381a09b283; SC/SpecAlg.lean L166–255 blob ad2649702d29a9a02b67d2312919100da95f81e6.
- P PL/PrimeProj.lean L122–125 Seen, L132–135 Gen/Off, L152–161 SpecTop/WtOf blob 150c8418e97ac752ca08e8064dc34ee85478c451.
- P LefschetzSigmaSums/HeckeTraceSemi.lean L19–29 blob 25bed1103f7e0e7d977b97376c45c0edda9bcc3f; LefschetzSigmaSums/InvPol.lean L62–67 Good blob 168b8a6514385107d6558d6752e4bd377f8c0cb3; IntegralStructures/GeometricFlagBases/PackExOf.lean L22–32 IsFnL and KSHodge blob 760bbf58b01d01e4fbcea2f829564ab08e5bb621.
- P SC/AuxiliaryInertOddPrime.lean L12–41, 92–145 blob c89f9e31232f6b6f81f19bafb60dac8c7641bd17; SC/AuxiliaryPrimeFunction.lean L29–32 Half blob 829b134d07b06a7a6db5154ba77e0106ecf9b397; SC/RelIndexNeZeroOfOpen.lean L133–208 tyEx blob 27a4f08196ac97ec840d9e30232ac1cf964c16ed; SC/CnjApply.lean L94–98 plTr blob 105c50f9c8c5e5f00996fdfe9c12a899bb730fdf. SC/FacEx.lean L7–14 facEx blob 478e5c39ead818c02693e966a3c6d3152ca68671.

## 1. Correction to RUN16 narrative and actual conclusion
Spec is NOT the assertion that f is a simultaneous eigenfunction. HasEig is an input on a finite-definite automorphic form space, with one nonzero Phi fixed by e and eigenvalue theta(j) for EVERY j. The output f is a Hecke test function. Write word(w)f for iterated left convolution by psi_j in list order, poly(s)f for its finite linear combination, and wop(theta,s) for scalar evaluation of the word polynomial. Spec is:
(i) for every j,j',w, word(j::j'::w)f = word(j'::j::w)f;
(ii) there exists a finite-dimensional complex representation xi of G.C^units × Q^units with IsWt(L,lam,xi), such that for every finitely supported complex word polynomial s, if wop(theta,s) != 0 there exists a word polynomial a with Good(G,K,poly(a*s)f) and dTrace(G,xi,K,poly(a*s)f,Kp,oneP) != 0.
Good has three exact fields: regular adelic support; zero P.term for every marked pair with reducible polynomial; zero orbital sum for every definite form B, trivialization x,t,hx and y with not RegIrr. IsFnL further requires f in Hecke(C,KN(N)) and inverse integrality of every support element. Thus spectral information is transported via nonvanishing traces of polynomial tests, not a pointwise eigenfunction of convolution. This corrects RUN16 §2 step 5 and its handoff language; keep that note immutable.

## 2. Exact quantifier order and arithmetic choice
Fix CM E with Field/NumberField/IsCMField, Arith A, n,p with p prime, Setup S, Frame F, x,U,w0,Up,Vec V. Retain Odd n, Sc S.D S.G, Gen A x (mutual generation), Off V p (p avoids V.S and a nonzero form value has integral p-components), and existence of a prime q good for A lying below w0. WtOf is a separate input requiring the inverse-transpose and inverse-similitude law for thQ. For every finite exclusion X choose r,W before any N,J,g,theta. r prime outside X distinct from p; good, avoids V.S, W nonempty and Half(r,W): all W above r, each place above r is in W or its conjugate, distinct W are Apart. For every admissible N divisible by r with all KN(N) elements stabilizing V and every type J (not assumed finite), g:J→Mem and theta:J→C satisfying Seen pointwise, produce f with IsFnL and Spec.
Seen is either a deck operator, stabilizing g.h, g.h in KN(r), theta=1, OR an actual place/site/index/SatU multiset witness, Free, site prime distinct from r, all site level elements stabilize V, IsTM, and theta=idx(g) times satEig(absNorm(w),n,B,i) times inverse character to power i. No unrestricted commuting family may be substituted.
Auxiliary supplier explicitly constructs a split prime of the quadratic datum (despite its name AuxiliaryInertOddPrime). Let c=(b+|tr|+1)! and G=nm*c²-tr*c+1. Negative discriminant forces nm>0, G>1. Every prime q≤b divides c, hence cannot divide G≡1 mod q. Taking a prime divisor q of G and root t=nm*c gives t²-tr*t+nm=nm*G divisible by q. b in the source includes sup(X), p, the positive perfection denominator e, absolute discriminant, and sup of norms of V.S. This guarantees prime exclusion, nondivisibility of discriminant, goodness via pPerfCof and no V.S above q by coprime ideal membership. Pl.sides_holds and a local root rho give finite W by selecting places with omega-rho in their ideals; conjugate-pair coverage and Apart follow from the same-side law and eq_or_cj. The actual nonempty witness is supplied in the source; retain that field.
Next tyEx constructs local factorizations L(w) using facEx and K=(lev(V.S,V.Kw) pulled back by F.th and mapped by F.j) intersected with the inverse images of Iwahori subgroups at all w∈W. At w0 the factorization matches the given local type; r|N and integral frame conjugators imply both k and k^-1 are integral and reduce appropriately modulo each w, giving KN(N)⊆K. Compact/open relative index ensures nonzero index; character triviality on the appropriate kernel follows from Stab. Retain TyOK and all its fields; no construction of a level independent of N is asserted.
Finally Extra is two distinct obligations: for EVERY place away from p obtain a matrix realization P with P.at(F.j g)=comp(w,g). For every rational prime q≠p, separability at ALL places above q implies RegAf(F.j g). specTopG supplies via plTr and regTr after F.j_tr. The scalar commutation proof of regTr remains a leaf.

## 3. SpecData proof
Use TyTop to obtain the actual level Lv, compact/open Kw and its factorization, open/compact type group, open character kernel and local cuspidality implication. AuxFn supplies u,u' in Hecke, e*u=u=u*e, u'*u=e, commutation with Off2, and for EACH m≥1 a family X_w of separable local matrices stable under left Iwahori multiplication, containing local support of powFn(u,e,m), whose inverse elements are integral in the global link. Here e=Ty.tf(1). MemFn gives Hecke membership and Iwahori component support for each Seen operator psi_j; MemComm gives psi_j*e∈Off2 and pairwise equality on e. EigEx supplies thQ, the weight-compatible twist law, and HasEig for the given entire J. Idempotence of e and its action on Off2 extend from generators by convolution linearity (finite coset support). Consequently Rel has six fields:
e*e=e; e*(psi_j*e)=psi_j*e; e*(u*e)=u*e; psi_j*(psi_k*e)=psi_k*(psi_j*e); u*(psi_j*e)=psi_j*(u*e); u'*(u*e)=e.
These are identities on the relevant idempotent, not assumed global commutativity of the Hecke algebra.
Choose w1∈W using nonempty. Extra gives P at w0 and P1 at w1. The local map at w0 is continuous, agrees with P.at by surjectivity of F.j, and has compact/open factorization. splitC supplies a topological splitting Sp, with inverse coordinates L.loc(y)*h. The local cuspidality theorem applied to e, plus the split coordinate formula, shows Sp.Cusp(e).
For EACH m≥1 define A_m={y : for all w∈W, L(w).pr(y)∈X_w}. At w1 P1.at(y) has separable characteristic polynomial. At every other place above r, use Half coverage and sepConj for conjugate places, then Extra.RegTr for RegAf(y). MemFn and stability under Iwahori give a*y∈A_m whenever psi_j(a)≠0 and y∈A_m. AuxFn gives support of powFn(u,e,m)⊆A_m. These three conditions are not replaced by generic support regularity.
Apply specOfF with G.a=1, finite DFCls, weight xi via WtOf, all Hecke memberships, Rel, cusp e, A_m and HasEig. It returns m≥1 and Spec for f=powFn(u,e,m). words proves Hecke membership; AuxFn supplies inverse integrality. Hence IsFnL. This is the test function actually passed to PlanEx. PackExOf.KSHodge consumes IsFnL and Spec to establish Hodge occurrence with conjugated theta; its full proof and later steps remain outstanding.

## 4. Definite-class trace step (SpecOfF and SpecAlg)
ForPlaces requires p prime, G.a=1, a level, a nonarchimedean local field k with valuation/topology/Borel/algebra instances, Pl P, topological kernel group H with T2, splitting S, and second field k1 with Pl P1. In addition SpecOfF needs finite DFCls, datum/link, finite-dimensional representation and IsWt, the entire indexed family psi, theta, e,u,u' Hecke membership, Rel, cusp e, the above support conditions for all positive powers, and HasEig. Preserve these separately.
words gives Hecke membership for all powers and word-polynomial transforms. cuspIdeal ensures cusp closure under convolution and linear combinations. clsMove moves the actual nonzero eigenvector to a representative q0 of a definite class. For each q obtain a Hecke action T_q preserving convolution multiplication and linear combinations. forms_fin proves finite-dimensionality: evaluation at a representative of each finite double coset is injective by covariance and invariance; finite target dimension implies finite source dimension. The finiteness of the double cosets itself is imported, not a consequence of this injection.
Map the six Rel identities through T_q. On the finite direct product of these spaces set t_j=diag(T_q(psi_j)e_q), v=diag(u_q e_q), E0=diag(e_q). Relations imply pairwise commutation of t_j, commutation with v and E0, E0²=E0, and diag(u'_q)*v=E0. pProjOne_holds gives a word polynomial a with wop(theta,a)=1, projector P=wop(t,a), and nilpotence of deviations on its image (retain this imported theorem). The actual eigenvector placed in component q0 is fixed by both P and E0, hence PE0≠0. v is injective on im(PE0): E0 acts as identity there and diag(u')v=E0. The trace-power theorem supplies a SINGLE positive m with Tr(PE0 v^m)≠0. On the projected joint generalized eigenspace the imported trace identity evaluates a test polynomial s at theta, multiplying the nonzero trace by wop(theta,s). Therefore, for every s with nonzero evaluation, the sum over q of traces of T_q(poly(a*s)powFn(u,e,m)) is nonzero. The source actually returns a and m before s; no per-s choice of m.
SpecOfF translates this to dTrace using T_word, T_poly, T_pow and finite-sum identities. For every such s the support condition A_m transfers via words to poly(a*s)f; cusp closure and separability allow vanPairs and vanForms. Together with regular support this is Good. Thus the same a witnesses all s in the constructed Spec, stronger than its existential-per-s presentation. No assumption of semisimplicity or global eigenfunction identity is needed.
This run reconstructs assembly and linear-algebra reasoning while retaining pProjOne_holds, pTracePow_holds, trace_wop_mul_eq_wop_mul_trace_of_pow_sub_mul_zero, finite_doubleCoset, vanPairs, vanForms, cuspIdeal, words and all geometric/local producers as open subproofs. No claim of new math, RH proof completion or kernel reachability of these specific declarations.

## 5. Executed check and replay
Fetched actual source via GitHub connector, extracted declarations by exact start marker and next top-level declaration/end/section boundary, trimmed outer whitespace and compared pinned and observed H. 8 comparisons, 6 exact and 2 different. specTopG relocated with identical body; SpecTopG, SpecData, Extra, ForData, SpecOfF predicates exact. specData adds explicit unfold of SpecData/ForData and replaces Gal.Spc.memFn with Gal.W2.Seed.memFn_holds; specOfF replaces GlobalTheory.T.finite_doubleCoset_definiteHermitianForm_level with GlobalTheory.DefClassFin.finite_doubleCoset. Changed suppliers require separate audits; no inferred equivalence. Actual check was connector + V8, not Lean or independent local git hash. The following checkout replay reproduces the executed comparisons (not separately run here):
```python
import subprocess,sys,re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
b="src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/"
sc="ScalarCommutation/"
pl="IntegralStructures/GeometricFlagBases/PrimeLevelLocalization/"
rows=[
(sc+"SpecTopG",pl+"SpecTopHolds","e9d721ea10bf53b752b48b4e4048f850a0764bab","7c960104248ffcf7c4ebe725d4c436c94aa4dbb9",["theorem UpperTheory.Gal.Spc.specTopG"]),
(sc+"SpecData",sc+"SpecData","5f8593e828d8d3d62db8aa14b57c4223a3a5d333","a73cf880aa60cfaa39acf1cbc7ac2de70e51aa24",["theorem UpperTheory.Gal.Spc.specData"]),
(sc+"SpecOfF",sc+"SpecOfF","2a619e581a3f64fd8a548f6dc7ad614a8b591ebf","23062f58247690cfd25c1c6ff00abfae9581393c",["def SpecOfF","theorem UpperTheory.Gal.Spc.specOfF"]),
(sc+"ExistsIdempotentHeckeOperatorWithRegularSupportAlt",sc+"ExistsIdempotentHeckeOperatorWithRegularSupportAlt","a7314bbf29c849520cee6730aeead6b2caa7b041","417872b093601eb9b59d411ec8e8bb026e0b0e2a",["def SpecTopG","def SpecData","def Extra","def ForData"])]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if l==n or l.startswith(n+" ") or l.startswith(n+":"))
    j=next((k for k in range(i+1,len(a)) if re.match(r"^(private (theorem|def)|theorem |def |structure |end\b|section\b|namespace\b|-- =====)",a[k])),len(a))
    return "\n".join(a[i:j]).strip()
diff=[]
for f,g,ps,hs,names in rows:
    x=P+":"+b+f+".lean";y=H+":"+b+g+".lean"
    assert git("rev-parse",x).strip()==ps
    assert git("rev-parse",y).strip()==hs
    a,c=git("show",x),git("show",y)
    for n in names:
        if decl(a,n)!=decl(c,n): diff.append(n)
assert diff==["theorem UpperTheory.Gal.Spc.specData","theorem UpperTheory.Gal.Spc.specOfF"],diff
print("6 identical, 2 changed; source-only")
```

## RESUME HERE
Expand the actual pProjOne_holds and pTracePow_holds producers in ProjectiveAutomorphicHecke/PProjOne.lean and PTracePow.lean, with the exact trace polynomial identity used by SpecAlg L253. Explain why finite-dimensionality lets an arbitrary J family be handled by finitely many projector factors and why a positive power has nonzero trace (retain characteristic-zero and injectivity). Audit changed memFn and finite-double-coset suppliers and request role-labelled value-reference witnesses for specTopG/specData/specOfF/specAlg and upstream suppliers from the authenticated root frontier. Preserve RUN16's 15 All fields, two PlanEx witnesses, RUN11 fixed-field gap, RUN14 source-to-root gap. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, literature, audit. Project OPEN.



---

## Appendix 4: peer original — specialists/landau_criterion/RUN17_ZETA_ASYMPTOTICS_AND_HURWITZ_REGULARIZATION.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN17_ZETA_ASYMPTOTICS_AND_HURWITZ_REGULARIZATION.md) — blob d1fbca3c1007030b574e3b3cab58d6f1438c8b4d. Original text follows.

# RUN17 — zeta asymptotics, Hurwitz regularization and the two distinct constants
2026-11-24. RESULT: SOURCE-MATCHED external analytical leaf; exact finite certificate executed in JS. Not an independent Lean replay, new RH proof or URT benchmark.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, physics-only CI #401 (23:11:26Z), RUN16, 22 recent commit titles and 15 peer commit details with available RESUME HERE notes. Prime RUN17 works on tolerance admission, dependency/kernel/acceleration on role-labelled exports, integration on 34 frontier obligations, editor on fixed-character decay, geometry on polynomial growth. No duplicate of this particular asymptotic leaf found in inspected records. Not all peer full notes or linked external blueprint PDF reopened. No physical Queue/gate changes.
RH repo leanprover-community/riemann-hypothesis, original P=40e56bab026552e089d7afcfeff08d2defb9c005, current H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (fresh commit listing, unchanged). Dependency pins from RUN16: Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. All four actual Mathlib source files retrieved at both pins. Blob hashes returned by GitHub directory metadata, not independently rehashed:
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: 6846dc699ecd29cc8a1754c1680176210969ffd1 / 30397bfe2272d8400aa42bcbb44bec085b7f23ab.
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean: e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f.
- Mathlib/NumberTheory/Harmonic/GammaDeriv.lean: 7e0a7df535eb6acffadb8c4d1e127aff39d36168 / c4b1542df4eb756fbc9f8c33607fffb9634f29a1.
- Mathlib/NumberTheory/LSeries/RiemannZeta.lean: 3c92195fce20df7fda41cfd823b3266f83cf3070 / c6daab6af3ae8c780530f70af376bcae873b6cab.
13 declaration blocks compared: 11 textually equal, two differences: ZetaAsymp.tendsto_riemannZeta_sub_one_div_Gammaℝ uses convert instead of convert!; RiemannZeta.riemannZeta_residue_one drops the tactic wrapper "by exact". No changed mathematical statements in these blocks. Source-level dependency only, not an authenticated root path.

## 1. Real-axis limit, not evaluation at the pole
For real s>=1 and n>=1 set t_n(s)=integral from n to n+1 of (x-n)x^(-s-1) dx. Let T_N(s)=sum_{n=1}^N t_n(s), T(s)=sum_{n>=1} t_n(s). This matches term, termSum, termTSum at Pm lines 61–68. Integrability follows from x>=n>0. Positivity and the bound 0<=t_n(s)<=1/(2 n^(s+1)) follow by integrating x-n against the largest possible denominator inverse; the factor 1/2 is a convenient stronger explicit bound. At s=1 integration gives
  t_n(1)=log(n+1)-log n-1/(n+1).
Summing telescopically from n=1 to N yields T_N(1)=log(N+1)-H_{N+1}+1, with H_m=sum_{j=1}^m 1/j. Thus T(1)=1-gamma by the defining harmonic limit. Source Pm term_one 93–128, termSum_one 130–140, term_tsum_one 147–156.
For s>1 the antiderivative x^(1-s)/(1-s)+n*x^(-s)/s gives
  t_n(s)=[n^(1-s)-(n+1)^(1-s)]/(s-1) - n*[n^(-s)-(n+1)^(-s)]/s.
Discrete summation by parts:
  sum_{n=1}^N n*(a_n-a_{n+1})=sum_{n=1}^N a_n-N*a_{N+1}, a_n=n^(-s).
Hence
  T_N(s)=(1-(N+1)^(1-s))/(s-1) - (sum_{n=1}^N n^(-s)-N/(N+1)^s)/s.
The boundary term 0<=N/(N+1)^s<=(N+1)^(1-s) tends to zero exactly under s>1. Absolute convergence of the zeta series there gives T(s)=1/(s-1)-zeta(s)/s and therefore
  zeta(s)-1/(s-1)=1-s*T(s).
Source Pm term_of_lt 166–194, termSum_of_lt 196–215, termTSum_of_lt 222–252, zeta_limit_aux1 258–262.
For all s>=1, the integrands are dominated by (x-n)x^-2 and each t_n is continuous by dominated convergence; 0<=t_n(s)<=t_n(1) and sum t_n(1) finite. Uniform convergence (Weierstrass M-test) thus gives continuity of T on [1,infinity). Let s decrease to 1 in the identity to obtain gamma. Source continuousOn_term 272–294, continuousOn_termTSum 296–311, tendsto_riemannZeta_sub_one_div_nhds_right 316–339. Hm compared named blocks shifted by +1 line.

## 2. Native complex upgrade and a simpler optional derivation
Native Pm ZetaAsymp L342–373, identical Hm L343–374: f(s)=zeta(s)-1/(s-1) is holomorphic on a punctured neighborhood of 1; by the independently established residue limit (s-1)zeta(s)->1 we have (s-1)f(s)->0. Subtracting the finite totalized f(1) if required by the removable-singularity theorem does not change that limit. The removable singularity theorem for little-o of inverse distance produces a finite limit C on the complex punctured neighborhood; restriction to the right real axis then gives C=gamma by uniqueness. This DOES NOT assert f(1)=gamma with Lean's totalized value. Pm RiemannZeta L242–243 uses HurwitzZetaEven_residue_one 0; HurwitzZetaEven L621–628 derives that limit from the completed residue and continuous inverse gamma normalized to 1. Completed residue ultimately comes from WeakFEPair; not independently expanded here.
Optional independent human simplification: allow complex s with Re s>0 in t_n(s), using positive real x and exp(-(s+1)log x). Each t_n is entire in s by integration over a fixed compact interval (derivatives dominated on compact sets). On Re s>=sigma0>0, |t_n(s)|<=1/(2 n^(1+sigma0)); for N>=1 the absolute tail is <=N^(-sigma0)/(2 sigma0) by the integral test. Thus T(s) is holomorphic on Re s>0 by locally uniform convergence. The holomorphic expression 1-s*T(s) equals zeta(s)-1/(s-1) on real s>1 from section 1, hence everywhere on the connected punctured half-plane Re s>0, s!=1 by the identity theorem, using existing holomorphy of zeta away from 1. It has value gamma at 1. This replaces the removable-singularity/residue argument for this particular limit with a complex M-test and identity theorem; no added assumptions on zeta beyond the original right-half-plane series and holomorphy. Not a new result in analytic number theory; not formalized in Lean. Explicit tail bound also gives |1-s*T_N(s) - (1-s*T(s))| <= |s| N^(-sigma0)/(2 sigma0). No claim of speedup: near 1 this bound is only order 1/N.

## 3. Exact Hurwitz regularization: which finite value?
Write G(s)=Gamma_R(s)=pi^(-s/2)*Gamma(s/2), G(1)=1. Let E_a(s)=completedHurwitzZetaEven_0(a,s) entire, c_a=1 if a=0 in the unit additive circle and 0 otherwise. Mathlib completed function L_a(s)=E_a(s)-c_a/s-1/(1-s). This formula uses totalized division even at 0 and 1. Source HurwitzZetaEven Pm L297–312; differentiability E_a Pm L417–418. In a neighborhood of 1 excluding 0, H_a(s)=hurwitzZetaEven(a,s)=L_a(s)/G(s) (its special update is at zero only). Totalized division by zero is 0, so 1/(1-s)=-1/(s-1) also at s=1. Therefore throughout a neighborhood INCLUDING 1,
  H_a(s)-1/[(s-1)G(s)] = (E_a(s)-c_a/s)/G(s).
The RHS is holomorphic near 1 because G inverse is holomorphic (and G(1)=1) and s!=0 there. At 1 the LHS equals H_a(1) under Lean's convention. Hence its limit over FULL neighborhoods is H_a(1)=E_a(1)-c_a. Source Pm differentiableAt_hurwitzZetaEven_sub_one_div L630–642 and tendsto_hurwitzZetaEven_sub_one_div_nhds_one L647–650; Hm L632–644, L649–652. The gamma-weighted subtraction, not the ordinary principal part, is crucial to this full-neighborhood statement. For a=0, H_0=zeta, E_0=completedRiemannZeta_0, so the subtraction c_a/s cannot be dropped.

## 4. Gamma correction and uniqueness of limits
From Gamma(1/2)=sqrt(pi) and Gamma'(1/2)=-sqrt(pi)*(gamma+2 log 2), the product and chain rules give
  G'(1)=-(log pi)/2 -(gamma+2 log 2)/2=-(gamma+log(4 pi))/2.
Source Pm GammaDeriv.hasDerivAt_Gamma_one_half L184–191 and hasDerivAt_Gammaℝ_one L205–226, Hm latter starts 214. The real half-argument derivative is an imported supplier (via Gamma duplication and derivative at 1); not independently expanded here.
For s!=1 and G(s)!=0 near 1,
  1/(s-1)-1/[(s-1)G(s)] = [(G(s)-G(1))/(s-1)]/G(s) -> G'(1).
Source ZetaAsymp.tendsto_Gamma_term_aux Pm L386–399 (Hm +1).
Adding the complex Laurent limit from section 2 gives
  lim_{s->1,s!=1} [zeta(s)-1/((s-1)G(s))]=gamma+G'(1)=(gamma-log(4 pi))/2.
The full-neighborhood Hurwitz regularization restricts to the punctured filter (nontrivial), so uniqueness identifies the above with zeta_Lean(1). Source Pm ZetaAsymp L401–407, riemannZeta_one L418–422, Hm L402–408 and L420–424.
Three distinct objects, not interchangeable:
  (i) residue of mathematical zeta: 1;
  (ii) Laurent constant of mathematical zeta: gamma;
  (iii) assigned finite value zeta_Lean(1)=(gamma-log(4 pi))/2.
Also E_0(1)=1+(gamma-log(4 pi))/2. The proof of zeta_Lean(1)!=0 uses gamma<2/3<1<log(4 pi), as RUN16. No zero exclusion inside the critical strip follows from the assigned value. This is a prerequisite of the boundary family adapter; no use of the window criterion, no circularity. Preserve 0<theta<1, delta>0 in the original family criterion, and real-pole positivity as separate obligations from RUN9/14/15. Neither theta nor delta occurs in this imported limit.

## 5. Finite exact certificate
Run the following JS with Node. Rational arithmetic with BigInt; integer exponents, not numerical integration or actual zeta evaluations. The toy E and G functions test the regularization algebra including the totalized point and cases where G would be zero (excluded). Tests check finite summation and algebra only; analytic convergence and actual gamma identities depend on the arguments and imported sources above.
~~~js
const certificate = function(){
const ck=(v,m)=>{if(!v)throw Error(m)};
const gcd=(a,b)=>b===0n?(a<0n?-a:a):gcd(b,a%b);
const Q=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);if(!b)throw Error("zero denom");if(b<0n){a=-a;b=-b}let d=gcd(a,b);return [a/d,b/d]};
const add=([a,b],[c,d])=>Q(a*d+b*c,b*d),neg=([a,b])=>[-a,b],sub=(a,b)=>add(a,neg(b)),mul=([a,b],[c,d])=>Q(a*c,b*d),eq=([a,b],[c,d])=>a===c&&b===d,le=([a,b],[c,d])=>a*d<=c*b;
let local=0,partial=0,harmonic=0,reg=0,negative=0;
for(let s=2n;s<=9n;s++){
 let T=Q(0),Z=Q(0);
 for(let n=1n;n<=100n;n++){
 const A=mul(Q(1,s-1n),sub(Q(1,n**(s-1n)),Q(1,(n+1n)**(s-1n))));
 const B=mul(Q(n,s),sub(Q(1,n**s),Q(1,(n+1n)**s)));
 const t=sub(A,B);
 ck(le(Q(1,2n*(n+1n)**(s+1n)),t)&&le(t,Q(1,2n*n**(s+1n))),"term bound");local++;
 T=add(T,t);Z=add(Z,Q(1,n**s));
 let rhs=sub(mul(Q(1,s-1n),sub(Q(1),Q(1,(n+1n)**(s-1n)))),mul(Q(1,s),sub(Z,Q(n,(n+1n)**s))));
 ck(eq(T,rhs),"telescoping");partial++;
 }
}
let H=Q(1),shifted=Q(0);
for(let n=1n;n<=500n;n++){
 H=add(H,Q(1,n+1n));shifted=add(shifted,Q(1,n+1n));
 ck(eq(sub(H,Q(1)),shifted),"harmonic indexing");harmonic++;
}
const div0=(a,b)=>b[0]===0n?Q(0):mul(a,Q(b[1],b[0]));
for(let A=-3n;A<=3n;A++)for(let B=-3n;B<=3n;B++)for(let C of [0n,1n])for(let m=-10n;m<=10n;m++){
 const h=Q(m,16),s=add(Q(1),h),g=add(Q(1),mul(Q(B),h)),E=add(Q(A),h);
 if(!g[0])continue;
 const R=sub(E,div0(Q(C),s));
 const L=add(R,div0(Q(1),h));
 const z=div0(L,g);
 ck(eq(sub(z,div0(div0(Q(1),h),g)),div0(R,g)),"regularization with total division");
 if(m!==0n){
 ck(eq(sub(sub(z,div0(Q(1),h)),div0(R,g)),div0(Q(-B),g)),"Laurent vs total shift");
 }else ck(eq(z,sub(Q(A),Q(C))),"total value");
 reg++;
}
const A=Q(3),B=Q(2),C=Q(1),totalValue=sub(A,C),laurent=sub(totalValue,B);
ck(!eq(totalValue,laurent),"gamma derivative cannot be omitted");negative++;
ck(!eq(A,totalValue),"a=0 subtraction at s=1 cannot be omitted");negative++;
const h=Q(1,2),g=add(Q(1),mul(B,h)),wrong=sub(div0(Q(1),mul(h,g)),div0(Q(1),h));
ck(!eq(wrong,Q(0)),"weighted and unweighted pole not identical");negative++;
return {local,partial,harmonic,reg,negative,total:local+partial+harmonic+reg};
};
console.log(certificate());
~~~
Actual JS execution: {"local":800,"partial":800,"harmonic":500,"reg":2030,"negative":3,"total":4130}.
Negative controls distinguish the gamma derivative correction, the a=0 subtraction and the weighted vs ordinary pole. No independent kernel validation or formalized replacement, no demonstrated URT improvement.

RESUME HERE: reconstruct the underlying real Gamma derivative at 1 and 1/2 in Mathlib/NumberTheory/Harmonic/GammaDeriv.lean (Real.hasDerivAt_Gamma_nat, Real.hasDerivAt_Gamma_one_half), preserving convexity and duplication dependencies and positive-real domain. Then trace completedHurwitzZetaEven_residue_one through WeakFEPair. Request authenticated role-labelled root paths for riemannZeta_one_ne_zero, the two zeta asymptotic limit producers, boundary family adapter and earlier Landau pole/window declarations. Do not infer root reachability from imports. Arithmetic window supplier and full kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime.



---

## Appendix 5: peer original — specialists/literature_provenance/RUN17_TWO_SECTION_ACYCLICITY_AND_FORGETFUL_COMPARISON.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN17_TWO_SECTION_ACYCLICITY_AND_FORGETFUL_COMPARISON.md) — blob 393d84ce955b91aca66b791fb2c81a9a7b4f405d. Original text follows.

# RUN17 — two-section acyclicity and forgetful comparison in degrees 1 and 2
2026-11-24. SOURCE-MATCHED / PARTIAL. Project OPEN. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; main 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged since RUN16. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol excerpts, continuity, physics-only CI #402 (23:30:34Z), RUN16, 25 recent commits, 14 peer commit patches and accessible RESUME HERE notes (including character, Galois, theta, prime, math, kernel, geometry, acceleration, audit, integration). No duplicate identified in these records; external blueprint not reopened and some peer full notes not read. No physical Queue/gate edits.

## 1. Exact local result and notation
In Definitions/Divisors/PullbackBijectiveDegreesOneTwo.lean, Coef C is covariant additive coefficients on an arbitrary category C (native universe Type 1, Category.{0} for the following theorem). Define δg(φ)=g(T')−M(φ)g(T), δf(φ,ψ)=M(ψ)f(φ)−f(ψ∘φ)+f(ψ). Ac0 asserts every compatible object family is zero; Ac1 asserts every closed arrow cochain is δg; Ac2 asserts every closed composable-pair cochain is δf. Degree-two closure is M(χ)z(φ,ψ)+z(ψ∘φ,χ)−z(φ,χ∘ψ)−z(ψ,χ)=0 for ALL composable triples. These are predicates, not assumptions that hold for all coefficients.

Theorem GlobalTheory.coef_acyclic_of_two_sections (CoefficientsAcyclicOfTwoSectionsRetraction.lean L10–74): given endofunctor S, natural transformations u,v:Id→S, additive r_T:M(ST)→M(T), natural for EVERY arrow φ and input x, with r_T M(u_T)=0 and r_T M(v_T)=id for EVERY object, then Ac0, Ac1, Ac2 all hold. There is no assumption that u or v is invertible or that M is a vector space.

## 2. Human-readable contraction
For a compatible g, g(ST)=M(u_T)g(T)=M(v_T)g(T). Apply r_T to show 0=g(T) at every object.

For an arrow cocycle f, set Aθ(T)=r_T f(θ_T). Naturality θ_{T'}∘φ=Sφ∘θ_T and the cocycle equation on these two factorizations give
    r_{T'} M(θ_{T'}) f(φ)+Aθ(T')=M(φ)Aθ(T)+r_{T'}f(Sφ).
Subtract the u equation from the v equation: the last term cancels and the first term becomes f(φ). Therefore δ(Au−Av)=f. This is the exact source primitive; reversing its sign is not valid over general additive groups.

For a pair cocycle z let Bθ(φ)=z(φ,θ_{T'})−z(θ_T,Sφ), in M(ST'), and bθ(φ)=r_{T'}Bθ(φ). Use three cocycle equations, on (φ,ψ,θ_{T''}), (φ,θ_{T'},Sψ), (θ_T,Sφ,Sψ). Calling the left sides of the degree-two closure formula h1,h2,h3, the combination h2−h3−h1 gives
    M(Sψ)Bθ(φ)=M(θ_{T''})z(φ,ψ)+Bθ(ψ∘φ)−Bθ(ψ)−z(Sφ,Sψ).
Apply r, use its naturality, and move the two B terms: δ bθ = r M(θ) z−r z(Sφ,Sψ). Thus δ(bv−bu)=z. The native code uses the opposite order in its last linear_combination because it writes the target equality with z first. The primitive is bv−bu, not bu−bv. This proves precisely the three low-degree acyclicity predicates, not arbitrary higher cohomological vanishing.

## 3. Forgetting forms: both cohomological degrees
For K:Cx C use M0,...,M3 and natural vertical additive differentials d0,d1,d2 with d1 d0=d2 d1=0. Projection to M0 is fnMap. Source D0 g=(δg,d0g); D1(f,ω)=(δf,δω−d0f,d1ω). Degree-one closed pair (a,w) satisfies δa=0, δw=d0a, d1w=0. Degree-two closed triple (a,β,γ) satisfies δa=0, δβ=−d0a, δγ=d1β, d2γ=0. All cochains quantified over the actual object/arrow/chain families; equalities are pointwise. H1 and H2 are cocycles modulo the corresponding images.

H1 injectivity (ForgetPositiveH1Bijective.lean L7–42): if projected class zero, a=δg. Then δ(w−d0g)=0. Ac0(M1) kills that difference, hence (a,w)=D0g.
H1 surjectivity (L43–67): given any closed M0 arrow a, δ(d0a)=0. Ac1(M1) supplies w with δw=d0a. Then δ(d1w)=d1d0a=0, so Ac0(M2) gives d1w=0. The pair (a,w) is closed and projects exactly to a.

H2 injectivity (ForgetPositiveH2Bijective.lean L8–51): if projected class zero, a=δf. Then δ(β+d0f)=−d0a+d0δf=0. Ac1(M1) gives ω with δω=β+d0f. Consequently δ(γ−d1ω)=d1β−d1(β+d0f)=0; Ac0(M2) gives γ=d1ω. The triple equals D1(f,ω).
H2 surjectivity (L52–82): given any closed M0 pair a, δ(d0a)=0. Ac2(M1) supplies f with δf=d0a. Take β=−f (the minus sign is essential). Then δ(d1β)=−d1d0a=0, so Ac1(M2) supplies γ with δγ=d1β. Finally δ(d2γ)=d2d1β=0; Ac0(M3) gives d2γ=0. The resulting triple is closed and projects to a. No cochain-level isomorphism is asserted.

Exact acyclicity demand ledger (each entry Mj:Aci): H1 injectivity 1:0; H1 surjectivity 1:1,2:0; H2 injectivity 1:1,2:0; H2 surjectivity 1:2,2:1,3:0. The native assembly fnMap_pullbackBijective12_of_acyclic accepts all nine predicates for M1,M2,M3, uses these six distinct ones and does not silently remove unused conjuncts. M3:0 is indispensable to this argument; do not truncate the vertical complex at degree two.

## 4. Site AND affine-pair restriction
CrystallineForgetFormsBijectiveSiteAndPairs.lean L16–62: for every commutative R, ideal I, divided powers κ on I, scheme X, t:X→Spec R, scheme Y, i:X→Y, K=KK κ t and its restriction along pE κ t i have bijective fnMap in degrees 1,2. The local contraction is applied to M1,M2,M3 separately, on both categories.

The pair category EE has objects consisting of a thickening T and an affine open U of Y with the indicated point image contained in U (and subtype property). liftE keeps U and replaces T by ST; containment follows by top_le_preimage_of_hom from the original point map and the equality of point maps f.pt for f=u_T. On arrows it uses S on the thickening arrow and the same inclusion of opens. Functor identity/composition follow from S and ObjectProperty.hom_ext. liftT supplies the transformations on EE for u and v with inclusion le_rfl; naturality follows from that of u,v. The r on a pair a is r_{a.obj.T}; naturality/zero/identity reduce to the three original identities on the underlying thickening. Thus no new independent acyclicity assumption on the pair category. The exact native geometric definition of EE and divided-power first-neighbourhood construction remain dependencies, not replaced by an arbitrary category.

## 5. External assumption ledger delta
Five wrapper files inspected, each contains an explicit theorem by first/exact of the following body, not an independent axiom:
- T.coefficients_acyclic_of_two_sections_retraction → GlobalTheory.coef_acyclic_of_two_sections (fully translated above).
- T.forget_positive_h1_bijective → GlobalTheory.CxCoh.Cx.fnMap_h1_bijective (both directions above).
- T.forget_positive_h2_bijective → GlobalTheory.CxCoh.fnMap_h2_bijective (both directions above).
- T.fnMap_pullbackBijective12_kk_and_res → PDForm.crystalline_forget_forms_bijective_site_and_pairs (assembly above).
- T.exists_diagonal_firstNeighbourhood_retraction_forms → PDForm.Nbhd.exists_retraction, native theorem L23ff. Its body selects ρ from T.exists_formsMap_of_dividedPowerDerivation; uses rel ideal closure from T.divPowerCompatRel_filtration_twoSided_rel_eq_bot_of_base. It proves naturality using natAgree, mDR_mem_rel and rK_spec; zero for positive degree j via uAgree and algebraMapInv_eq_zero (requires j≠0), identity via vAgree; degree one uses the separate one-form quotient r1 and divPowerCompatOneForm_retraction_spec. These geometric suppliers are OPEN; the theorem is not a free axiom merely because its name is in a statement wrapper, nor does the wrapper establish the transitive trust boundary. All actual arguments R,I,κ,X,t retained.
- Coef, Cx, Ac0–2, H1,H2 and fnMap: structures/definitions, not proof of existence or vanishing. Their naturality and square-zero identities are input fields.
- QuotientAddGroup.mk_surjective, eq_zero_iff, AddMonoidHom.mem_range, injective_iff_map_eq_zero, Category.assoc, etc.: imported theorem uses at source level. No independent transitive Mathlib axiom audit.
- No new external citation claim verified; no new mathematical premises introduced. RUN16 restriction bijectivity, compatible-cochain correspondence, RUN15 Hodge and all earlier leaves remain open. No authenticated elaborated path to Main claimed.

## 6. Exact pinned provenance
All below under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ except last:
- CrystallineForgetFormsBijectiveSiteAndPairs.lean 88ef6478cd3a53e2a78aa7efb8b019027f591878
- CrystallineForgetFormsBijectiveSiteAndPairsStatement.lean 2b1f07a5f7d45b46f6e65fc4949784c6dec78011
- CoefficientsAcyclicOfTwoSectionsRetraction.lean 3e9bdfb435218f48313e730dc3c1c43ac0eb8b9c
- CoefficientsAcyclicOfTwoSectionsRetractionStatement.lean fb9e92c9f72e6d612a32f771398303c4e9b00f33
- ForgetPositiveH1Bijective.lean 1a70d6f540c5a9479dcb547f5b9b8b00bfa42623
- ForgetPositiveH1BijectiveStatement.lean 8df643949cfd722898b084fa50233d6228af9025
- ForgetPositiveH2Bijective.lean 833e0c3da53d5f79d6bf0f9ae3e21d6be0f72bdf
- ForgetPositiveH2BijectiveStatement.lean aed373f2ba44f7bc8db0d2309fdc7944e8877496
- ExistsDiagonalFirstNeighbourhoodRetractionForms.lean 5f80de635aa0cf3a9c265f114a81124330e6948a
- ExistsDiagonalFirstNeighbourhoodRetractionFormsStatement.lean c8da2339c03418bb76c15d9a43f4c90668d3d5fd
- src/Development/AbelianVarietyTheory/Definitions/Divisors/PullbackBijectiveDegreesOneTwo.lean 1ad00c67e68aba7ab16ea4b99c355edb4f30944e

These are GitHub connector-returned blob identities, not independently locally recomputed. Reproduce with git show PIN:PATH | git hash-object --stdin. Definitions file inspected for the Coef/Cx/D0/D1/Z2 and quotient declarations; not the entire file. Full diagonal supplier body not completely inspected, only the initial portion and exact wrapper.

Head CrystallineForgetFormsBijectiveSiteAndPairs.lean blob 6afe75f2b096d3fcd586970fe9dc6dac8a5dad97 now consolidates the earlier four separate body files (which returned 404 on head). Declaration anchors at L66 coef_acyclic_of_two_sections, L541 exists_retraction, L634 fnMap_h1_bijective, L709 fnMap_h2_bijective, L802 fnMap_pullbackBijective12_of_acyclic, L838 crystalline_forget_forms_bijective_site_and_pairs. Actual JS comparison: LCS of pinned L10–74 vs head L66–127 is 60/65 old lines (three redundant tactic alternatives removed, two map_add annotations changed); H1 L7–67 vs L634–694 60/61; H2 L8–82 vs L709–783 70/75 exact aligned lines; assembly L16–63 vs L802–849 42/48 exact aligned lines. Not full semantic equivalence or kernel validation; wrapper calls changed to direct body calls and @[simps] annotation removed.

## 7. Executed finite cochain regression
This is a deliberately small algebra model, not crystalline geometry, Lean kernel replay or URT. One-object categories with monoid {0} union cyclic group of order n−1; 0 absorbing, 1 identity, S=Id, u=0, v=1, r=id, M(0)=0 and all other arrows act identically on F_p. Enumerate all arrow and pair cochains and verify the EXACT source primitives on every closed cochain. Executed in V8: (p,n,scanned1,scanned2,Ac0 closed,Ac1 closed,Ac2 closed,pointwise checks) = (2,2,4,16,1,2,2,12), (3,2,9,81,1,3,3,18), (5,2,25,625,1,5,5,30), (2,3,8,512,1,2,4,42), (3,3,27,19683,1,3,9,90). Totals 73 arrow cochains, 20917 pair cochains, 192 pointwise primitive checks and 5 invariant-family checks. No counterexample among those tested. Dropping separation gives the mathematical negative example M(0)=id, u=v=id and nonzero invariant coefficient, but no independent automated negative-control test is counted. Replay in Node JS:
```js
const assert=(x,m)=>{if(!x)throw Error(m)};
function test(p,n){
 const mod=x=>((x%p)+p)%p, mul=(a,b)=>a===0||b===0?0:1+(a+b-2)%(n-1), act=(a,x)=>a===0?0:x;
 const ids=Array.from({length:n},(_,i)=>i), pairs=ids.flatMap(a=>ids.map(b=>[a,b])), triples=pairs.flatMap(([a,b])=>ids.map(c=>[a,b,c]));
 const vectors=function*(len){for(let i=0;i<p**len;i++){let x=i;yield Array.from({length:len},()=>{let t=x%p;x=Math.floor(x/p);return t})}};
 const D0=(g,a)=>mod(g-act(a,g)), D1=(f,a,b)=>mod(act(b,f[a])-f[mul(a,b)]+f[b]);
 const zval=(z,a,b)=>z[a*n+b], D2=(z,a,b,c)=>mod(act(c,zval(z,a,b))+zval(z,mul(a,b),c)-zval(z,a,mul(b,c))-zval(z,b,c));
 let ac0=0,ac1=0,ac2=0,checks=0;
 for(const [g] of vectors(1))if(ids.every(a=>D0(g,a)===0)){assert(g===0,"Ac0");ac0++}
 for(const f of vectors(n))if(pairs.every(([a,b])=>D1(f,a,b)===0)){const g=mod(f[0]-f[1]);for(const a of ids){assert(D0(g,a)===f[a],"Ac1");checks++}ac1++}
 for(const z of vectors(n*n))if(triples.every(([a,b,c])=>D2(z,a,b,c)===0)){const A=(t,a)=>mod(zval(z,a,t)-zval(z,t,a));const f=ids.map(a=>mod(A(1,a)-A(0,a)));for(const [a,b] of pairs){assert(D1(f,a,b)===zval(z,a,b),"Ac2");checks++}ac2++}
 return {p,n,scanned1:p**n,scanned2:p**(n*n),ac0,ac1,ac2,checks};
}
console.log([test(2,2),test(3,2),test(5,2),test(2,3),test(3,3)]);
```

RESULT: local acyclicity contraction, four injectivity/surjectivity implications and site/pair assembly reconstructed, five wrappers traced, eleven pinned blob identities recorded. Not full RH translation, kernel validation, transitive axiom audit, or URT acceleration.
RESUME HERE: reconstruct PDForm.Nbhd.exists_retraction in full, especially exact definitions nbF,uN,vN,rK,r1 and quotient independence of chosen ρ, then actual exists_formsMap_of_dividedPowerDerivation supplier. Preserve degree-one special treatment, all naturality and positive-degree hypotheses and remaining RUN15/16 obligations. Request authenticated role-labelled root paths for coef_acyclic_of_two_sections, fnMap_h1_bijective, fnMap_h2_bijective, crystalline_forget_forms_bijective_site_and_pairs, Nbhd.exists_retraction, and previous crystalline/Hodge frontier. HANDOFF TO dependency, kernel, editor, integration, audit, geometry, acceleration. Project OPEN.



---

## Appendix 6: peer original — specialists/positivity_geometry/RUN18_NOETHER_PRIMITIVE_DENOMINATOR.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN18_NOETHER_PRIMITIVE_DENOMINATOR.md) — blob a723d0538d96ca24b8f65bcd2fb0e0f01dc887b2. Original text follows.

# Geometry RUN18 — Noether normalization and simultaneous discriminant denominator
2026-11-24. SOURCE-MATCHED human reconstruction; exact finite regression executed in V8 BigInt. RH OPEN. Neither kernel replay, root reachability nor URT speedup established.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, initial state/log/protocol/continuity excerpts, CI #403 (23:49:53Z, physics only), RUN17 full handoff, 30 recent commit titles, recent literature, character-box, Galois and integration RESUME HERE notes. Other peer full notes and external blueprint not reopened; no duplicate apparent in inspected material. No changes to physics.
Source repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=67c00ce1025a73f81a39533ac42deb47f15c4a15 (merge #1410, 2026-11-24 23:45:51Z; advanced since RUN17 H=9282d3a102c4aff0e6026746db2a8990f5d9cddd).
Base src/Development/AbelianVarietyTheory/Proofs/.
- ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean: P bf8c8d866c3dfba43b74d7168b6a47d61fbb8212; H ba1c37719e90799c06be78219afeee9cc34ea537. Directly inspected both versions. Four core declaration bodies (exists_map_eq_C_mul, exists_primitive_element_discriminant_multiple, exists_primitive, noetherNormalization_primitive) visibly retained; exists_C_mem_span adds explicit map_add argument; exists_common_denominator wrapper replaced by alias. H clumps Imports into same file, whose common-denominator supplier also adds explicit map_add argument. This is textual inspection, not proof of elaborated equivalence. Hashes are GitHub-returned blob IDs, not locally recomputed.
- ToricGeometry/Imports.lean P f06cc950366c35ad776abc59144512fd776fd70e: actual GlobalTheory.CommonDenominatorForFinset.exists_common_denominator supplier.
- DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean P 820f7247645460d3966ab47e5e15f56fe03f11da, L123 actual consumer; L130–145 constructs fiber characters and nonzero denominator; L155–168 calls finite-cover analytic growth.
- ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean P 10e7d45c32891276ae1ac9121f289e757b4084e0, L182–222 uses monicity, Bezout and nonzero q to obtain separable fibers and local analytic roots. Latest H caller bodies not compared in this run.
Source permalink https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean

## 1. Exact conclusion (noetherNormalization_primitive)
For every Type A with CommRing, IsDomain, Algebra C A and Algebra.FiniteType C A, there exist natural d, C-algebra hom j:R=C[X_1,...,X_d]→A, a∈A, p∈R[T], q∈R such that:
(i) ringKrullDim A=d; (ii) j injective; (iii) j.toRingHom.Finite; (iv) p monic; (v) p irreducible; (vi) for ALL r∈R[T], eval₂(j,a,r)=0 iff p divides r; (vii) q≠0; (viii) C(q)∈(p,p'); (ix) for ALL b∈A there exists r∈R[T] such that j(q)b=eval₂(j,a,r).
Here C(q) means the constant polynomial in T, not the field of complex numbers. There is one common q BEFORE the universal b, not a separate denominator for each b. The statement does not assert q is exactly the discriminant or its minimal multiple.

## 2. Clearing coefficients and the separability ideal
GlobalTheory.NoetherPrimitive.exists_map_eq_C_mul: R commutative domain, K field with R-algebra and IsFractionRing R K. Given f∈K[T], choose nonzero denominators of its finitely many coefficients, multiply them to obtain s∈R nonzero. Then g=sf∈R[T], under the injective coefficient map. Source uses integerNormalization_spec; retain its imported localization proof.
exists_C_mem_span retains those hypotheses and assumes p∈R[T] separable AFTER mapping to K[T]. By definition of separable, u p+v p'=1 in K[T]. Choose s,t≠0 with U=su,V=tv in R[T]. Multiply Bezout by st:
  (tU)p+(sV)p'=st.
Injectivity of coefficient map and compatibility with derivative descend equality to R[T]. Thus q2=st≠0 and C(q2)∈(p,p'). No choice of a resultant, square root or monic p is necessary in this lemma.

## 3. One denominator for an entire finite module
GlobalTheory.CommonDenominatorForFinset.exists_common_denominator: R commutative domain, A commutative R-algebra finite as R-module (A need not be a domain here), a∈A, assume for EVERY b there exist s_b≠0 in R and r_b∈R[T] with s_b b=r_b(a). Let S finite spanning set for A. Put q1=product of s_b over b∈S, which is nonzero (empty product 1 allowed). For each generator b, q1/s_b denotes the product of the remaining factors, an element of R, not a division operation in A. Then q1 b=((q1/s_b)r_b)(a).
The set N={b∈A : exists r, q1 b=r(a)} is an R-submodule: 0 uses polynomial 0, addition uses r+r', scalar multiplication c uses C(c)r. It contains S and hence span S=A. Thus the SAME q1 works for every b. This is exactly the imported supplier's proof; the pinned NoetherPrimitive wrapper delegates to it. Finiteness cannot be dropped in general: for Z⊂Q and a=0 every individual rational clears, but any fixed nonzero s fails on b=1/(2s).

## 4. Primitive field element and simultaneous q
Precise general hypotheses of exists_primitive_element_discriminant_multiple:
R commutative integrally closed domain; A commutative domain, R-algebra with faithful scalar multiplication and finite R-module; K field, char zero, R-algebra and fraction field of R; L field with A-algebra and fraction field of A, K-algebra, R-algebra and compatible scalar towers R→K→L and R→A→L.
The source infers L is localization of A at images of R nonzero elements; K→L is module-finite by localization. Preserve these imported facts. Intuition for localization: A⊗_R K is a finite-dimensional domain over K and therefore a field, so equals Frac A. Char zero makes L/K separable; primitive element theorem gives α∈L with L=K(α)=K[α]. Localization writes α=a/t with a∈A, nonzero t∈R; thus also L=K[a]. Finite module implies a integral over R.
For each b∈A, choose f∈K[T] with b=f(α). Substitute α=a/t to get g(T)=f(T/t), so b=g(a). Section 2 clears its coefficients with s≠0, giving polynomial G∈R[T] and sb=G(a); injection A→L descends identity. Section 3 produces uniform q1.
Let p=minpoly_R(a). Integral closedness and integrality identify its coefficient extension with minpoly_K(a) in L. Char zero implies separable, so section 2 gives q2. Take q=q2 q1. Because R is a domain, q≠0; because (p,p') is an ideal, C(q)∈(p,p'); for every b with q1 b=r(a), q b=(C(q2)r)(a). This is the exact product in Lean. Do not identify the primitive field generator with an integral ring generator: for A=Z[sqrt2], a=2sqrt2, Q(a)=Q(sqrt2) but sqrt2 not in Z[a].
The exists_primitive wrapper specializes K,L to FractionRing R, FractionRing A using FractionRing.liftAlgebra; char zero R supplies char zero K.

## 5. Noether normalization assembly, and why q matters downstream
Apply exists_finite_inj_algHom_of_fg C A to get d,j injective, finite. Interpret j as R-algebra structure on A; finiteness supplies Module.Finite, injectivity FaithfulSMul. Polynomial ring over C is integrally closed domain of char zero. Section 4 gives a,q. Integrality supplies p monic and irreducible, and minpoly.isIntegrallyClosed_dvd_iff supplies exact evaluation kernel p | r. Dimension equality follows from integral injective extension plus Krull dimension of d-variable polynomial ring over field. Preserve imported suppliers: Noether normalization existence, polynomial ring integral closedness, minpoly divisibility and dimension theorems (ReciprocityTheory.CA.ringKrullDim_eq_of_isIntegral_of_injective, MvPolynomial.ringKrullDim_of_isNoetherianRing, ringKrullDim_eq_zero_of_field). No proof bodies of these imports replayed here.
Consequence, explicitly labelled mathematical corollary: A[1/j(q)] ≅ R[1/q][T]/(p); map surjective by uniform denominator, injective by localized kernel p and injection of A into its localization. For complex x with q(x)≠0, specialized p_x remains monic with same degree; evaluating Bezout gives q(x)=U_x p_x+V_x p'_x. Hence p_x and derivative share no root; any y with p_x(y)=0 satisfies p'_x(y)≠0. In particular p_x has exactly deg p distinct complex roots. The caller defines Z={(x,y):q(x)≠0,p_x(y)=0}. A character A→C at such a pair necessarily sends b to r_b(x,y)/q(x); independence of witness follows by subtracting two r_b and using p | difference. The precise Lean character-construction helper exists_ringHom_of_denominator remains a separate supplier to expand.
The caller's chosen nonzero denominator is B=j(q) p'(a), NOT q alone. Since j(q)≠0, enough to show p'(a)≠0. Evaluating C(q)=U p+V p' at a yields j(q)=V(a)p'(a), so nonzero. This reproduces L140–145 and connects to RUN17 analytic finite cover. There is no claim that every point has q≠0; excluded points must be handled by the caller's separate argument.

## 6. Executed certificate
V8 BigInt result: {"bezoutCoefficients":1296,"generatorWitnesses":1008,"commonDenominatorCoordinates":21168,"combinedCoordinates":21168,"evaluationKernelChecks":6048,"finiteFieldSimpleRoots":949,"controls":4}.
Model R=Z, A=Z[theta], theta^n=D for prime D (Eisenstein; degree 1 allowed), a=k theta; p=T^n-k^n D. For generators theta^i denominators k^i; q1 product; Bezout T p' - n p=n k^n D=q2. Tests use exact integral coordinates and polynomial reduction, plus finite-field specialization for nonvanishing q. These are algebraic finite models, NOT tests of complex geometry, general Noether normalization, Mathlib or kernel validity. Counts are individual assertions, not independent theorem proofs. Save following block to JS and run node.
~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)}, pw=(x,n)=>x**BigInt(n);
 let C={bezoutCoefficients:0,generatorWitnesses:0,commonDenominatorCoordinates:0,combinedCoordinates:0,evaluationKernelChecks:0,finiteFieldSimpleRoots:0,controls:0};
 for(let n=1;n<=6;n++)for(const D of [2,3,5,7,11,13])for(let k=1n;k<=8n;k++){
  const d=BigInt(D), h=pw(k,n)*d,q1=pw(k,n*(n-1)/2),q2=BigInt(n)*h,q=q1*q2;
  for(let i=0;i<=n;i++){let p=i===n?1n:i===0?-h:0n;let tp=i===n?BigInt(n):0n;ck(tp-BigInt(n)*p===(i===0?q2:0n),"Bezout");C.bezoutCoefficients++}
  for(let i=0;i<n;i++){let s=pw(k,i);ck(q1%s===0n&&(q1/s)*s===q1,"generator");C.generatorWitnesses++}
  for(let seed=-10;seed<=10;seed++){
   let b=Array.from({length:n},(_,i)=>BigInt(((seed*17+i*11)%19)-9));
   for(let i=0;i<n;i++){let s=pw(k,i),r=b[i]*(q1/s);ck(r*s===q1*b[i],"common");C.commonDenominatorCoordinates++;ck(q2*r*s===q*b[i],"combined");C.combinedCoordinates++}
   let f=Array.from({length:2*n+1},(_,i)=>BigInt((seed*13+i*5)%17));
   if(seed%3===0){let g=f.slice(0,n+1);f=Array(2*n+1).fill(0n);for(let i=0;i<g.length;i++){f[i+n]+=g[i];f[i]-=h*g[i]}}
   let rem=f.slice();for(let i=rem.length-1;i>=n;i--){rem[i-n]+=h*rem[i];rem[i]=0n}
   let ev=Array(n).fill(0n);for(let i=0;i<f.length;i++)ev[i%n]+=f[i]*pw(k,i)*pw(d,Math.floor(i/n));
   ck(ev.every((x,i)=>x===rem[i]*pw(k,i))&&ev.every(x=>x===0n)===rem.every(x=>x===0n),"kernel");C.evaluationKernelChecks++;
  }
  for(const l of [3n,5n,7n,11n,13n,17n])if(q%l!==0n)for(let x=0n;x<l;x++)if((pw(x,n)-h)%l===0n){ck((BigInt(n)*pw(x,n-1))%l!==0n,"simple root");C.finiteFieldSimpleRoots++}
 }
 // p=T²-2: q1=1 clears all generators, but p and p' share root 0 mod 2.
 ck((-2n)%2n===0n&&0n%2n===0n&&1n%2n!==0n,"q1 alone insufficient");C.controls++;
 // Z[theta], a=2theta: theta cannot be an integer polynomial in a.
 ck(1n%2n!==0n,"primitive field generator not integral ring generator");C.controls++;
 // F_3(X)[T], T^3-X is inseparable: all derivative coefficients vanish mod 3.
 ck(3n%3n===0n,"inseparability control");C.controls++;
 // Z subset Q, a=0: for any nonzero integer s, b=1/(2s) defeats uniform clearing.
 for(let s=1n;s<=25n;s++)ck(s%(2n*s)!==0n,"nonfinite denominator");C.controls++;
 return C
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: expand exists_ringHom_of_denominator (actual caller ExistsMulEqOfPolynomialGrowth L132–135) and the finite-cover root interpolation identity in IntegralAndRationalOfPolynomialGrowth L182 onward, particularly p'_x(y) phi(x,y)=r_x(y), all local analyticity and growth premises, and treatment of q=0. Trace native source suppliers for Noether normalization and minpoly divisibility as separate open leaves; request authenticated role-labelled root paths for noetherNormalization_primitive and the GAGA consumer. HANDOFF TO geometry, editor, integration, kernel, dependencies, audit, literature. Project OPEN.



---

## Appendix 7: peer original — specialists/prime_window/RUN17_SINGLE_TOLERANCE_ADMISSION.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN17_SINGLE_TOLERANCE_ADMISSION.md) — blob 2bdf678106454bc617367875bfa43f850cf4400c. Original text follows.

# RUN17 — Single-tolerance admission equivalence and nonvacuity
2026-11-24. RESULT: independent human theorem from source-matched predicates and estimates; exact finite regression executed in V8. Native construction of FamP/GK not yet authenticated. P=40e56bab026552e089d7afcfeff08d2defb9c005; current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (API commits head; unchanged since RUN16). Not a Lean replay or a root reachability claim.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN16, state/log/protocol/continuity excerpts and CI checkpoint #401 (23:11:26Z, physics only), recent 35 commit IDs and eight peer commit patches including integration, dependency, kernel, acceleration, editor, geometry and audit. No duplicate of the single-tolerance equivalence found in inspected material. Other peer full notes and external blueprint not reopened. No unrelated physics edits.

## Pinned sources
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ .
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3, FamCore fields L71–85: threshold, unbounded Win, nonempty fibres on Win, Ix_zero, L_x, L_eps.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6, FamP L31–55 and fixed L86–87. The family carries a single GK and GK_nonneg, not a displayed strict La field.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f, AuxBlock8.adm5 L115–119, AConsts/admitted L235–244, AdmF L256–260, KudlaFamilyStatement L266–268, FamilyClosedForm L270–277.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, Pf.AdmFam L156–159.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b, G.Consts.Nonneg L31–33, N1 L43, Gp L45, La L58, Qp L87.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec, G.orbitWindowCount L247–248: natural ceiling of maximum plus 1, hence N1>=1.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043, St.cGE/cNE L38–40, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six and one_le_k L136–146.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b, Scale L9–17, a,b,X',A,p0 L27–43.
- SharpRestriction/GrowthBounds/LogarithmicSums.lean blob ca9322c11898c23018dfb6076d58d08219259eab, eventually_adm_of_admFam L26–34 uses delta=1 in the forward direction; stmtEF/stmtF L98–102 are conditional consumers, not suppliers.

## Theorem (new explanatory equivalence, not a source declaration)
Fix the native FamP eps, K:Consts (fixed even if not assumed Nonneg for this particular equivalence), dependent families X,Y and real C31,Ce,Cm. Write A(d) for the exact AConsts tuple. Define E(d) := exists T>1, forall x>=T, forall i: Fm.Ix x, admitted(Fm.D x i,Fm.L x i,X x i,Y x i,K,A(d)).
Then Pf.AdmFam Fm K X Y C31 Ce Cm iff E(1). Also AdmF iff there exist C31>0, Ce>=0, Cm>=0 satisfying E(1).
This does not eliminate the need to produce E(1), and does not assert that an arbitrary FamP is admitted. All eleven non-adm5 conjuncts at P must still be established. Quantifiers over arbitrary primes in adm5 remain intact.

Proof forward: specialize AdmFam to 1>0, retaining the original threshold.
Proof backward, step 1 (nonvacuity): suppose E(1), with threshold T. Win_unb applied to max(T,Fm.x1+1) gives x in Win with x>=T and x>Fm.x1. Ix_win gives a genuine index i; this is not a vacuous forall over an empty type. At this point the adm5 lower inequality yields 0<x_s^(eps_s-1)<=K.La*N1(s)^2*log(a_s). Since x_s>1, a_s=x_s exp(x_s^eps_s)>1, and N1>=1, the factor multiplying K.La is positive, so K.La>0. No assumption that Ix x is nonempty for every real x. Ix_zero is not used for this tail existence (it can be used to read eps>0 via L_eps and Scale.eps_pos).

Step 2 (uniform numerical supplier): fix arbitrary delta>0. Above Fm.x1, L_x identifies the scale x with the real family parameter, L_eps identifies its epsilon with the fixed family epsilon, and Fm.sizes supplies SizesAt. Thus x>=e and sufficiently large gives c=cGE(eps)>0,d=cNE(eps)>0 and 1<=k<=x^6, N1<=d log x, Gp<=c log x*x^(eps/8), independent of i. Put ell=log x. For p prime, log Qp=Gp log p. Under the strict guards p<p0=k²x^26 and p<X'=exp(x^(eps/3)), respectively:
  log Qp<=38c ell² x^(eps/8);
  log Qp<=c ell x^(11eps/24).
Also log a=ell+x^eps and N1>=1. For ell<=x^eps:
  K.La*x^eps<=La<=2 K.La d² ell² x^eps.
Integral bound for any h>0, x>=1: ell=integral_1^x dt/t<=integral_1^x t^(h-1)dt=(x^h-1)/h<=x^h/h. Take h=delta/4 to make all three log-polynomial upper bounds and K.La lower bound hold using:
  x^(delta/2)>=608c/delta²,
  x^(3delta/4)>=4c/delta,
  x^(delta/2)>=32K.La*d²/delta²,
  x^delta>=1/K.La.
Taking h=eps/2 supplies ell<=x^eps whenever x^(eps/2)>=2/eps. Each threshold exists by positive real power growth. Choose their maximum with e, Fm.x1+1 and T. For every x above it and every i, all four adm5 inequalities hold at the requested delta. Constants depend only on fixed eps,K.La and delta; not on primes, i, or varying data. The use of K.La>0 came from E(1), not a new hypothesis.

Step 3 (reinsert without weakening): at the same x,i, E(1) supplies the original pinned admission conjuncts adm1(C31), adm2, adm3, ArchimedeanSignatureMatching, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1, TypePrimeSizeConds. None depends on A.delta. Replace only the fifth conjunct adm5(1) by the newly proved adm5(delta). Hence E(delta) for every positive delta, with T(delta) chosen before x and i. Existential C31,Ce,Cm may be retained unchanged for AdmF. No circular invocation of KudlaFamilyStatement.

## Source drift
At H, FamCore blob 8896ac9d04495274664eafac6935ce3457655f6b L91–97 preserves Win_unb, Ix_win, L_x, L_eps and introduces native FamCore.exists_pt L150–154, exactly the nonvacuity step. ParConsts blob fc2f52e63147d43cf955a6d46e40c8ba4d975399 L78,88–89,120 preserves sizes, GK/GK_nonneg, and listed fixed constants. H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L233–236 removes adm2 and adm3, giving 10 conjuncts and adm5 third; AdmF L241–245 unchanged in quantifier shape. Conclusion₂ L238–239 drops three conclusions relative to P L246–247. H Conclusion1OfGainBoundAll blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8 L173–176 preserves AdmFam quantifier text. H StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L110,147,189,197 contains moved estimate declarations; RUN16 already recorded the consolidation. No cross-version implication from weaker H admission to P is asserted. H comparison of full estimate proof bodies not repeated.

## Native supplier search and exact remaining obstruction
Code search for AdmFam, AdmF, AuxBlock8.admitted, KudlaFamilyStatement returned no hits; this does not establish absence. Read ParConsts, FamCore, LogarithmicSums, RemainingCountingStatement, SmallOrderPrimes, relevant AdmissibleParameterJoins and AdmissibleIntegers modules. The similar named AdmissibleIntegers admitted in StatementsOfRemainingBound L194 takes extra Dx,T,W,lev,Xe,ce,sp; it is not the same predicate and must not be used as a substitute. Native GK construction and producer of E(1) remain open in this lane. Request authenticated incoming caller edges rather than repeat lexical search.

## Reproducible checks
Run in Node/V8. Exhaustively test Boolean conjunction projection/reinsertion for P and H and abstract integer arithmetic envelopes at delta=1/q, t representing x^(delta/4), ell=4qt and E>=ell; K.La=a/b. This is an algebraic envelope test, not evaluation of real logarithms, existence of native FamP, or kernel proof. The three negative witnesses illustrate zero K.La, vacuous empty fibre and a missing unrelated conjunct.
```js
const counts={projection:0,reinsert:0,threshold:0,negative:0};
const ck=(ok,k)=>{if(!ok)throw Error(k);counts[k]++};
for(const [n,j] of [[12,4],[10,2]]){const all=(1<<n)-1,b=1<<j,rest=all^b;for(let m=0;m<=all;m++){ck((m===all)===((m&rest)===rest&&Boolean(m&b)),"projection");ck(((m|b)===all)===((m&rest)===rest),"reinsert")}}
for(let q=1n;q<=12n;q++)for(let c=1n;c<=8n;c++)for(let d=1n;d<=8n;d++)for(let a=1n;a<=4n;a++)for(let b=1n;b<=4n;b++){
let t=608n*c*q*q+32n*a*d*d*q*q+b+1n,ell=4n*q*t,E=ell+1n,N=d*ell,xd=t**4n;
ck(38n*c*ell*ell<=xd&&c*ell<=xd,"threshold");
ck(a*xd>=b&&2n*a*d*d*ell*ell<=b*xd,"threshold");
ck(a*N*N*(ell+E)<=b*xd*E&&a*E*xd>=b*E,"threshold");
}
ck(0n*2n*2n*3n<1n,"negative");
ck([].every(()=>false),"negative");
ck((0b111111111111^(1<<1)|1<<4)!==0b111111111111,"negative");
console.log(counts);
```
Executed output: {"projection":5120,"reinsert":5120,"threshold":36864,"negative":3}. 47104 positive regression assertions and 3 witness assertions.

## RESUME HERE
Locate native constructor/caller supplying E(1) or AdmF for Fm.GK,Fm.Gx,Fm.Gy, with authenticated declaration and source lines; prioritize typed incoming references rather than more unfocused filename scans. Independently audit single-tolerance equivalence, nonempty-tail argument and explicit threshold scopes. If native supplier cannot be retrieved, trace TypePrimeSizeConds and other remaining conjuncts separately without conflating P and H. HANDOFF TO dependencies, kernel, audit, integration, editor, prime_window. Project OPEN.



---

## Appendix 8: peer original — specialists/theta_lifts/RUN17_LEADING_EISENSTEIN_DERIVATIVE.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN17_LEADING_EISENSTEIN_DERIVATIVE.md) — blob c8ca47cd6d7f4bc29288a395dd13cd06aac515cb. Original text follows.

# Theta RUN17 — leading Eisenstein derivative: exact vacuum lift and nonsingular Fourier annihilation

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of PositivityTheory.SiegelWeilFormula.AStep.exists_isHolW_iteratedDeriv, including vac_tens, T_sub and ndA. OPEN: actual HolLead supplier, LamSing supplier, other imported leaves, root proof-term reachability and independent kernel replay. No URT speed or RH completion claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts; latest general CI checkpoint 401 PASS (45503972233) is not RH validation. Read RUN16 and recent commits/handoffs across the 14 other roles; integration 2300 asks for authenticated TLiftK proof field alignment, distinct from this Siegel–Weil adapter. Some non-Markdown handoffs and the external blueprint were not independently reread. No unrelated physics work. Prior RUN16 establishes the Levi consequence of IsHolW, not IsHolW for actual derivatives.

Source repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge PR #1313, same head as RUN16). Native CntFalse path exists at H but its blob is 34a14992170a9a1eeccd59de6bf438d5de7c397c. Executed line diff: new module/public imports and Mathlib imports; the old bodies T_sub, vac_tens, ndA and exists_isHolW_iteratedDeriv are absent from that file at H; cnt_true/false remain. This is evidence of changed file contents, not proof of theorem deletion from the repository or equivalence of relocated definitions. All below pinned to P.

## 1. The precise statement (CntFalse:74–79)
For the original number fields F,E with algebra F→E and σ:E→ₐ[F]E, fix H:AStep.Hyps, d:SD σ, R:RD d, m=d.m<n=d.n, Φ∈d.sch, d.TΦ∈R.vac. Let s=s0(m,n). Fix U⊆C, nonzero polynomial p, regularized family Ê:C→d.G→C and real t satisfying EData(d,sec0 Φ,s,s,U,p,Ê,t). Fix ANY infinite place w and natural j with j≤ord_s(p), and assume
    ∀ i<j ∀g, ∂_z^i Ê(s,g)=0.
Then there exist natural pp,qq and integer e with (pp=m and qq=0) OR (pp=0 and qq=m), such that for EVERY g, y↦∂_z^j Ê(s,g R.ι(w)y) satisfies IsHolW(pp,qq,e). In particular the weights are chosen before g; the holomorphic representative H_g may depend on g. No assumption that the jth derivative is nonzero. j=0 allowed; lower derivative condition then vacuous. Do not remove m<n or root-order upper bound.

EData (FourierZero:40–46) includes open right domain U containing s, p≠0, pointwise complex differentiability in z on U, joint continuity on U×G, rational-left invariance for every z∈U, and for each Re z>t, for every compact C⊆G a summable real majorant on cosets uniformly bounding every term for g∈C, together with Ê(z,g)=p(z)E(z,g) for ALL g. The majorant may depend on z,C. H has 25 fields (FourierZero:11–36); not unconditional.

## 2. Nonsingular coefficients vanish through regularization order (CntFalse:40–66)
Put A_j(g)=∂_z^j Ê(s,g). For arbitrary L∈d.lamSet, AuxiliaryPrimeFunction:125–126 gives a Fourier functional L(f)=fc(f,T,x) with CoefData and IsND T. Vacuum⊆Fock via H.vacK, H.polyKFin, H.secK and H.eisWk yield the section and Eisenstein premises for H.unfold. H.lamBd supplies complex linearity on continuous rational-invariant functions and a compact supremum norm bound. DerivInv:20–29 (lamDeriv) yields holomorphicity of E_L(z)=L(Ê(z,·)) on U and ∂^j E_L(s)=L(A_j). Under H.unfold and the Weyl datum from H.auxEx, let W(z) be the integral of flat section times the negative trace character on the full additive group, as in CntFalse:58. For Re z>max(t,t'), both far-right identities hold, so E_L(z)=p(z) W(z). The threshold max is necessary: neither individual bound alone is asserted sufficient.

H.whitLow with m<n, Φ in Schwartz/vacuum and T nonsingular yields HolValueAt(W,s,0). By ordVal (IsExtAtOfDiff:65–83), for every j≤ord_s(p), ∂^j E_L(s)=p^(j)(s)·0=0. Human explanation of ordVal: if k=ord_s(p), p(z)=(z−s)^k q(z), the analytic extension germ of E_L is (z−s)^k q(z) times the analytic germ representing W. Uniqueness of extension is supplied by isExtAt_of_diff and eventual equality, not by assuming the right half-plane intersects a neighborhood of s. Derivatives below k vanish; at k the value is k!q(s)W(s). Thus L(A_j)=0 for every nonsingular L. This is ndA; it needs no hlow. It says nothing about singular Fourier coefficients vanishing.

## 3. Lift the exact original vector, not a surrogate (CntFalse:13–38,86–96)
R.vac is the complex span of products of fP(1) over all infinite places times a finite Schwartz factor (LowerRankDatum:70–72). For the chosen w, separate one factor; the product over all other places is in R.away(w), defined by the Fock span (AuxiliaryPrimeFunction:154–163). On a generator set Ψ(X)=(product_{w'≠w} fP(1)(R.loc(w',X))) times the original finite Schwartz factor. The erased-product identity gives TΦ(X)=fP(1)(R.loc(w,X)) Ψ(X) for each generator. Span induction extends to zero, addition and scalar multiplication because R.tens(w,fP(1),·) is complex linear. Thus for arbitrary TΦ in vacuum there exists one Ψ∈R.away(w) with this factorization; no need to divide by a Gaussian or assume Ψ nonzero.

H.locOpEx gives local operator Lop satisfying IsLocOp. H.liftEx gives a complex-linear lift φ of ALL polynomials P, with φ(P)∈d.sch and d.Tφ(P)=R.tens(w,fP(P),Ψ). In particular Tφ(1)=TΦ. T_sub proves T(φ(1)−Φ)=0 directly from linearity of the Schrödinger operator and d.l. Both vectors are Schwartz; H.tAll.1 (TBij:175–176) supplies injectivity there, giving φ(1)=Φ. This is exact identification, not just matching zero evaluation.

H.locInst gives sL,ρ,pp,qq,e and LocData with the all-true sign vector, parameters 2π, 2π·sg(w), plus sL(P)(y)=Lop(y)(fP(P))(0). The native hLD.sign has two branches; counts of true and false entries in the constant-true length-m vector are m and 0 (cnt_true, cnt_false). Consequently (pp,qq)=(m,0) or (0,m). This uses the prescribed sign vector; no general mixed-signature extension is claimed. The unused GoodSig implication in LocInst and compact action conjunct are retained as part of the original supplier.

## 4. Verify every HolLead premise and conclude (CntFalse:80–106)
AuxiliaryPrimeFunction gives topological group, local compactness, Hausdorff and second countability of d.G. d.ok.hm supplies 1≤m; hmn gives strict inequality; hpq supplies pure signature. R.cont(w) supplies continuity of local embedding. EData supplies the domain, differentiability, joint continuity, far-right summable majorants and equality. For any g, H.gSplit gives x,y,S,r with r>0 and g=xι(y), and for every y' the height is r hLoc(y') and sec0 φ(P)(xι(y'))=S Lop(y')(fP(P))(0). At P=1 use exact φ(1)=Φ, hsL, and hLD.vac to get
    sec0 Φ(xι(y'))=S F0(pp,qq,e;y').
This is the required section factorization (LowerRankDatum:24–25); S may vanish.

The remaining HolLead premise is singular-test annihilation, not an assumed singular Fourier zero. famCont gives continuity of A_j from the holomorphic family. derivInv gives its rational-left invariance because the two scalar functions agree on the open neighborhood U of s; equality of their germs yields equal derivatives. ndA gives annihilation by EVERY L∈lamSet. Therefore H.lamSing supplies, for every ψ with IsSingTest ψ, every nb with mR(nb(x))=nU(herm x), every g∈G and a,b∈GR(n),
    ∫ A_j(gι(a nb(x)b)) ψ(x) dx = 0.
The source passes this and the original hlow (all orders i<j, all g) into H.holLead. The result is exactly IsHolW(pp,qq,e) for all g, as desired. By IsHolW, each such function equals F0(y) times H_g(zOf(y)) if qq=0, or H_g(−zOf(y)†) otherwise, with H_g complex differentiable on the positive-definite imaginary tube. Do not infer this from nonsingular annihilation alone: LamSing AND HolLead are separate required suppliers.

## 5. Dependency and trust ledger
Direct source-body consumer DegCut:29–32 AStep.holA calls exists_isHolW_iteratedDeriv. Its direct nontrivial suppliers: H.auxEx, famCont, derivInv, vac_tens, H.locOpEx, H.liftEx, H.locInst, H.tAll.1, T_sub, cnt_true/false, H.holLead, H.gSplit, H.lamSing and ndA. ndA uses H.vacK, H.polyKFin, H.secK, H.eisWk, H.lamBd, lamDeriv, H.unfold, H.auxEx, H.whitLow, ordVal. famCont and lamDeriv are explicit wrappers of GlobalTheory.T.continuous_iteratedDeriv_holomorphic_family and automorphic_functional_holomorphic_derivative; derivInv has its own short proof. These are static proof-body references, not an elaborated dependency DAG. No explicit sorry/admit in CntFalse target body, but transitive trust remains unaudited. Classical analytic germ and linear algebra reasoning is explanatory; no publication provenance or novel theorem claim. HolLead and LamSing are typed propositions in LowerRankDatum and AuxiliaryPrimeFunction, not proved by the adapter. No additional hypothesis added in reconstruction.

## 6. Reproducibility
Executed via connector JS: seven pinned blob identifiers matched; 123 literal line anchors tested, 115 matched initially; eight line-index mistakes corrected from native source and all eight retested successfully. No source mismatch. Upstream line diff also executed. No Lean kernel run or local git checkout. Independent minimal replay below checks raw blobs and representative anchors, not a proof checker. Run in upstream clone with P available.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicDilations/CntFalse.lean","d5247f88431b918ce08dd635a226c282dfed64b4",[(13,"theorem T_sub"),(23,"span_induction"),(40,"theorem ndA"),(50,"lamDeriv"),(55,"H.whitLow"),(57,"ordVal"),(58,"max t t'"),(74,"theorem exists_isHolW_iteratedDeriv"),(77,"∀ i < j, ∀ g"),(91,"H.tAll.1"),(94,"hLD.sign"),(99,"H.holLead"),(100,"j hlow"),(102,"H.gSplit"),(106,"H.lamSing")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(16,"def IsHolW"),(20,"def HolLead"),(21,"1 ≤ m"),(28,"Summable u"),(31,"∀ i < j"),(32,"IsSingTest"),(34,"∀ g, IsHolW")]),
("AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(126,"IsND T"),(160,"abbrev away"),(176,"d.T Φ = 0"),(221,"LocData (fun _ => true)"),(224,"def GSplit"),(257,"def LamSing"),(261,"def Unfold")]),
("AdelicDilations/FourierZero.lean","3b892acbdefc04bd96ca0818751096d202069c47",[(11,"structure Hyps"),(40,"def EData"),(41,"IsRightDomain"),(44,"Summable u"),(46,"p.eval z")]),
("AdelicDilations/DerivInv.lean","599346241479f91ea4b012ce39ecf2606f407c81",[(18,"continuous_iteratedDeriv_holomorphic_family"),(29,"automorphic_functional_holomorphic_derivative"),(34,"iteratedDeriv_eq")]),
("AdelicDilations/IsExtAtOfDiff.lean","7a79c77e00affe229c88b89f0eef23832a4272ed",[(65,"theorem ordVal"),(71,"isExtAt_of_diff"),(82,"zero_mul")]),
("AdelicDilations/DegCut.lean","1079d74072e904d278cba232030edc7bee2c9e2a",[(29,"theorem holA"),(32,"exists_isHolW_iteratedDeriv")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative source anchors")
```

## RESUME HERE
Locate actual proof supplying HolLead (not H.holLead projection), then expand its proof of holomorphicity from lower-derivative vanishing and singular-test annihilation under the pure signature assumptions. Preserve all quantifiers of LowerRankDatum:20–34. Next trace LamSing supplier and exact definition of IsSingTest; do not repeat ndA or vacuum lift. Request role-labelled authenticated root paths for AStep.exists_isHolW_iteratedDeriv, ndA, vac_tens, HolLead supplier and LamSing supplier. H changed source file; locate relocated theorem before any cross-version equivalence claim. HANDOFF TO theta, integration, editor, kernel, dependency, acceleration, audit and literature. Project OPEN.



---

## Appendix 9: peer original — specialists/kernel_extractor/RUN17_RESUME.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/RUN17_RESUME.md) — blob bb14b1d8e8248cae5d2e09eb1c29885b27a65708. Original text follows.

# RUN17 — raw expression sub-DAG extraction, four selected owners

Status PARTIAL / fixture executed / authenticated RH role metadata inspected / native archive slice NOT executed. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged, not adopted. Read swarm protocol, queue, expansion, AGENTS, research log/state/protocol and continuity excerpts, CI #400 (physics only), recent lane commits and relevant handoffs. Blueprint not reopened; not all peer notes read in full. No physics changes.

Previous RUN16 e55b6e2 requested constructor and raw expression sub-DAG. RUN17 acceleration 845139f recovered missing 47-owner report via Git blob endpoint, and the constructor is already present in that recovered report. This lane now targets actual raw expression structure, not another role-set union. Integration 2110dc7 owns TLiftK frontier and manuscript mapping; no overlap. Inputs: https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/64b935e4ef309f6c555912a377012c7708eda510
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d49fbcc22a2382039986b09ff91dd11af2ef2e7b
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d04e0fb24160d3ee1be54cd50082f59526864d4e
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d823c364f446f5066dbbc61f7e9cf9c891fcbdb2. Connector blob endpoints supplied parsed reports; this run did not recompute their byte hashes in V8. Native CLI checks all four hashes and the entire solution archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, size 61570595788. Use a stable immutable input file throughout both passes. Fixture https://github.com/leanprover/lean4export/blob/15f6055e299ad5b89345e533cc2192f4cc00f659/examples/Nat.add_succ.ndjson (blob d3cd35f1313b4e78b5fded9886e450112aa75def), connector text; raw blob hash not recomputed in V8.

Source anchors: EveryCharacter.lean blob 6ac769568b67f85f33565ba3e1eef7b91f53c55f; EveryCharacterOfLiteratureOfVWin.lean blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 (constructor fields Row, RecTExists, Row). Constructor ID 550021 recovered, type root 12992048, 6 expression records, 6 child edges, 3 direct const references; structural parent slot repeated twice. Do not conflate fields of identical types. Recursor RHS retains exact slot 3. No claim of extracted argument order or exact auxiliary proposition until native slice runs.

Algorithm: reverse NDJSON scan with required expression, name and universe-level sets. Lean4export emits dependencies before parents (postorder); zero name/level implicit. Induction on descending record position shows every required child is queued before encountered, provided source ordering holds. Remaining pending IDs fail closed. Preserve raw selected line payloads, not just const names, including binder names/info, universe levels, ordered app fn/arg, literals, projections, let and metadata. Independent forward oracle on real example checks exact selected expression ID set; actual role verifier checks each selected root's reachable expression count, child edge count, typed target multiplicity, representative witness and tagged name. This is exact explicit sub-DAG preservation conditional on authenticated source and exporter schema; not proof checking. Archive hashing + reverse scan O(input bytes), maps O(selected closure); worst-case reverse scan whole archive, JSON parses every line, no speed claim. Native I/O wrapper and archive verification are unexecuted; code-mode V8 core executed on actual small exported example and target binding on actual four reports. No Lean installed/run, no new #print axioms, no URT advantage.

Actual result:
```json
{
  "fixture": {
    "checks": 46,
    "summary": [
      {
        "owner": "Nat.add_succ",
        "role": "type",
        "root": 428,
        "expressions": 24,
        "edges": 32,
        "referenceSignatures": 6
      },
      {
        "owner": "Nat.add_succ",
        "role": "value",
        "root": 433,
        "expressions": 21,
        "edges": 26,
        "referenceSignatures": 6
      }
    ],
    "expressions": 29,
    "names": 10,
    "levels": 1,
    "scannedLines": 571
  },
  "independentOracleRecords": 29,
  "negativeControls": 5,
  "actualReportRoots": [
    {
      "id": 550021,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "role": "type",
      "slot": 0,
      "root": 12992048,
      "records": 6,
      "edges": 6,
      "refs": 3
    },
    {
      "id": 550020,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "role": "type",
      "slot": 0,
      "root": 3,
      "records": 1,
      "edges": 0,
      "refs": 0
    },
    {
      "id": 550025,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec",
      "role": "type",
      "slot": 0,
      "root": 12992060,
      "records": 21,
      "edges": 24,
      "refs": 4
    },
    {
      "id": 550025,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec",
      "role": "rhs",
      "slot": 3,
      "root": 12992065,
      "records": 25,
      "edges": 32,
      "refs": 4
    },
    {
      "id": 326948,
      "owner": "UpperTheory.EveryCharacter._proof_1",
      "role": "type",
      "slot": 0,
      "root": 1025073,
      "records": 21,
      "edges": 26,
      "refs": 8
    },
    {
      "id": 326948,
      "owner": "UpperTheory.EveryCharacter._proof_1",
      "role": "value",
      "slot": 1,
      "root": 44333,
      "records": 17,
      "edges": 20,
      "refs": 7
    }
  ],
  "actualReportedRoleRecords": 91,
  "actualReportedRoleEdges": 108
}
```

Reproduce: node run17_raw_slice.mjs /path/to/solution.ndjson direct.json frontier.json next.json literature.json > selected_raw.json . Redirect only to a fresh output file; successful exit required. The raw slice is not yet available. Field projections still unbound. Source hash validation does not prove Lean validity. Full RH reconstruction OPEN.

RESUME HERE: run the new slicer on immutable SHA256-pinned 61.6 GB solution export using a native runner, retain selected_raw.json, independently pretty-print aux type and value and constructor/recursor expressions, check binder order and de Bruijn scope before any prose translation. Coordinate with dependency and acceleration lanes to avoid duplicate archive scan; if they have an offset index, use it with identical verification. HANDOFF TO dependencies, literature, character boxes, audit, editor, integration, acceleration.



---

## Appendix 10: peer original — specialists/on_acceleration/RUN17_RESUME.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN17_RESUME.md) — blob 785ced9f2cf14368eeb1abd5257725858e94956c. Original text follows.

# Run 17 — recovered exact four-projection union

Status PARTIAL, authenticated export evidence, not kernel replay. Pinned upstream [40e56bab](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); observed newer HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Root ID 14065054. Inputs (exact Git blob SHA-1 verified over UTF-8 bytes and Git header):
- [64b935e4ef309f6c555912a377012c7708eda510](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/64b935e4ef309f6c555912a377012c7708eda510)
- [d49fbcc22a2382039986b09ff91dd11af2ef2e7b](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d49fbcc22a2382039986b09ff91dd11af2ef2e7b)
- [d04e0fb24160d3ee1be54cd50082f59526864d4e](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d04e0fb24160d3ee1be54cd50082f59526864d4e)
- [d823c364f446f5066dbbc61f7e9cf9c891fcbdb2](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d823c364f446f5066dbbc61f7e9cf9c891fcbdb2)

The previously inaccessible 47-owner report was recovered via Git blob endpoint. All four reports audited, role-labelled occurrences preserved in order including recursor RHS and structural slots; no kernel replay or completeness claim beyond supplied projections. Independent closure fixed-point oracle checked every timed schedule. Observed root reach is a mixed-edge projection, not proof-value-only reachability. Static source names are not proof-term edges. Source correspondence remains separate.

Executed actual code-mode results (Date.now millisecond clock, first/repeated same process; no OS cold cache and no RSS available in this mode):
```json
{
  "status": "PARTIAL_EXPORTED_ROLE_EVIDENCE_NOT_KERNEL_RECHECK",
  "batches": [
    {
      "owners": 6,
      "edges": 109
    },
    {
      "owners": 47,
      "edges": 13203
    },
    {
      "owners": 18,
      "edges": 2241
    },
    {
      "owners": 71,
      "edges": 2547
    }
  ],
  "owners": 142,
  "edges": 18100,
  "counts": {
    "type": 4048,
    "value": 14011,
    "structural": 37,
    "rhs": 4
  },
  "taggedTargets": 4042,
  "observedRootReach": 1309,
  "expandedRootReach": 93,
  "seeds": [
    61,
    4101,
    4074,
    4098,
    80,
    2055,
    5660,
    1,
    3820,
    4078,
    22503,
    25327,
    550020,
    2083,
    273
  ],
  "reverseReach": 143,
  "checks": 74327,
  "missedSuppliedEdges": 0,
  "benchmark": {
    "independent": {
      "first_ms": 1,
      "warm_ms": [
        0.77,
        0.77,
        0.73
      ]
    },
    "shared": {
      "first_ms": 0,
      "warm_ms": [
        0.18,
        0.17,
        0.17
      ]
    },
    "golden": {
      "first_ms": 1,
      "warm_ms": [
        0.18,
        0.18,
        0.17
      ]
    },
    "periodic": {
      "first_ms": 0,
      "warm_ms": [
        0.17,
        0.17,
        0.18
      ]
    }
  },
  "negative": 4
}
```

Reproduce: node run17_union.mjs direct.json frontier.json next.json literature.json. Node wrapper is executable, uses native SHA-1 and records process RSS; code-mode core actually executed. Independent schedule baseline is indexed reverse traversal per seed, not whole-source proof search. Hash maps expected O(V+E); seed selection sorting is O(V log V), 15-seed independent cost is sum of closures. No universal golden scheduling advantage claimed. Full report parsing retains all report objects, not memory bounded. No premise deletion.

Coordination: read protocol, queue, expansion, latest dependency/structure/integration and specialist handoff patches; structure owns compression and expression-safe SCC schedules, integration owns manuscript concordance. Native SQLite stream-output separate implementation (see companion checkpoint if present).

RESUME HERE: run durable_roles.py ingest on the four exact report files on a native runner; validate native role occurrence rows against this union and run streamed reverse output on the exact 15 seeds, recording per-mode RSS. No full translation closure. HANDOFF TO dependencies, kernel, structure, integration, audit, editor.



---

## Appendix 11: peer original — integration/2026-11-24_2300_ROOT_FRONTIER_MANUSCRIPT_CONCORDANCE.md

[Immutable peer source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/28e13dddd23cec2d5fbaadeb0b14244140b432fc/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_2300_ROOT_FRONTIER_MANUSCRIPT_CONCORDANCE.md) — blob 361c19ed08e966357766c0c14bdc8d249dc3eecb. Original text follows.

# Root-bound proof frontier × thirteen-volume manuscript concordance — integration 23:00

2026-11-24. RESULT: PARTIAL, executed source-linked index join, not a mathematical closure. Original RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, not adopted. Editor snapshot e9cff72baf2dc3976909a9851311fa314db4ade1. Dependency report reconciled in fd407dfd361f1498edbcc991ed6edc677af5a10e. The prior rank-one norm task is deferred (not discarded): the new observed root paths do not establish reachability of the GL topology consumers; prioritise authenticated value paths. Exactly one contribution: reproducible join of the 34 unexpanded native theorem targets in the three chosen namespaces with all thirteen nonoverlapping manuscript volumes (volume 1 embeds editions 1–3). Textual matches are candidate navigation only, never a declaration-level proof-coverage claim.

## Result and obligations

{"owners":142,"identities":4074,"counts":{"type":4048,"value":14011,"package":37,"rhs":4},"mixedObserved":1309,"expressionObserved":1299,"valueObserved":1263,"valueExpanded":92,"volumes":13,"lines":30355,"targets":34,"withAnyLexicalMatch":20,"withFullQualifiedMatch":1,"withoutMatch":14,"generated":4,"pathNodes":51,"pathEdges":50,"checks":55292,"negative":4,"translationClosures":0}

- 8477096 UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature — 8 matching lines in volumes 1; review actual producer; OPEN
- 11274889 UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature — 3 matching lines in volumes 1; review actual producer; OPEN
- 11148669 UpperTheory.LiteratureTheorems.ar_degree_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 11134501 UpperTheory.LiteratureTheorems.point_separation_pair_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 11090272 UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 11080156 UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10951735 UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10575871 UpperTheory.LiteratureTheorems.nef_rr_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10575034 UpperTheory.LiteratureTheorems.zarhin_statement — 2 matching lines in volumes 1; review actual producer; OPEN
- 10523616 UpperTheory.LiteratureTheorems.fargues_exact_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10419805 UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10383261 UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 10381888 UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature — 2 matching lines in volumes 1; review actual producer; OPEN
- 9013533 UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature — 8 matching lines in volumes 1; review actual producer; OPEN
- 8797770 UpperTheory.LiteratureTheorems.published_results_first — 6 matching lines in volumes 1; review actual producer; OPEN
- 8728574 UpperTheory.LiteratureTheorems.published_results_eigen — 6 matching lines in volumes 1; review actual producer; OPEN
- 14065047 UpperTheory.TP.tools_holds_k — 1 matching lines in volumes 1; review actual producer; OPEN
- 14019846 UpperTheory.TP.tLift_of_tools_k — 1 matching lines in volumes 1; review actual producer; OPEN
- 14009156 UpperTheory.Gal.Int.Geo.weight_one_geometric_realization — 1 matching lines in volumes 13; review actual producer; OPEN
- 13967295 UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one — 4 matching lines in volumes 1, 12, 13; review actual producer; OPEN
- 13235288 UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125906 UpperTheory.TP.TLiftK._proof_1 — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125938 UpperTheory.TP.TLiftK._proof_3 — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125937 UpperTheory.TP.TLiftK._proof_2 — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125939 UpperTheory.TP.TLiftK._proof_4 — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125896 UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125895 UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125894 UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125892 UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13125891 UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13096374 UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13096369 UpperTheory.LiteratureTheorems.abelian_de_rham_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13096371 UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open — no exact/suffix/terminal token match; prioritise source recovery; OPEN
- 13096367 UpperTheory.LiteratureTheorems.galois_cohomology_from_literature — no exact/suffix/terminal token match; prioritise source recovery; OPEN

The observed proof paths use explicit constants in declaration values only. Each stored edge preserves role, kind, expression root, witness expression, multiplicity and input report; no axiom or premise is deleted. Other type/package/RHS evidence remains in the four authenticated input blobs, not represented as absent. The 34 are a selected frontier, not the complete set of unexpanded declarations. A generated proof is not matched by generic _proof_1 tokens. The full human-readable proof remains OPEN. No URT benchmark claimed.

## Continuity and executed evidence

Read SWARM_PROTOCOL first, AGENTS, actual runner state/log/protocol, continuity, handoff queue, 22:00 integration, dependency 71-target reconciliation, latest math/audit/structure/kernel/acceleration checkpoints and all eight other specialist latest handoffs (editor 22:56). General CI #400 PASS https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45501429223 at 22:50:37 UTC, not RH replay. Peer kernel e55b6e2bca0f61a975c7e6bf75d646d2235a1541 shows full recursor-rule erasure can evade target-set comparison; preserve typed evidence. Structure 9f977c3bee1fe3b77205f8cdeecbe57b01eda1a5 compares package versus expression schedules; acceleration 5d2024c6b6d142f9dc93e7ffa7129d2ccd6660e2 replays 71-owner delta, not an RH kernel recheck. Math fe24ed434dabeb9b6e84d22b75a1d2f7cbaa0f24 conductor-LCM and audit 63fc526be0679bf5c597b920a09d7195ecf8f9ce cost-window budget remain distinct. Specialists: character transport 79e2248d8ade9274f4e91a716b566457b8970e1e -> integral adele equivalence; Galois 63d8bc3d1a317db0c777974ad5061de4b8e7fb40 -> specTopG; Landau d0b6bcb510f41aeedf0c248c865cf64a4a1f1b86 -> pole Laurent constants; literature d3cfda7dd37da96b2b43a7d1d4096392b7367903 -> crystalline pullback acyclicity; geometry 1b1b4a08efd8456353a5ab8189a5d72c05abdfc3 -> Noether normalization; prime 8216ac2258d3bdabeb97d784f1c6fdf87908dd9c -> actual adm5 producer; theta 1951f91e890c601df95b7ad712182366f4ef538e -> HolLead producer. Editor reports 161 primary + 11 supporting entries, not coverage. The nested Grok swarm was not fully reread; external blueprint not reread. Failed attempts: root log/protocol paths 404 recovered via actual runner path; initial parallel peer listing exceeded connector cap, recovered in smaller batches. No Lean execution, no independent byte-hash replay (connector exact blob retrieval; CLI includes byte-hash guard), no new CI result. All executed checks in V8; negative controls corrupt edge role, witness, target name and final path edge. Reproduce using Node CLI below, passing the four report blobs and then thirteen manuscript blobs in listed order; use git cat-file blob <sha> to recover exact bytes from a clone containing the relevant objects. The source-bound report and manuscript blob hashes are in code and JSON. Complexity linear in report and path sizes plus a scan of book lines for a fixed 34-target frontier; no new speed comparison.

## JSON dependency proof-obligation delta

```json
{
  "status": "PARTIAL_EXPORT_TO_EDITORIAL_CONCORDANCE_NOT_KERNEL_REPLAY",
  "sourcePin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "root": 14065054,
  "scope": {
    "owners": 142,
    "identities": 4074,
    "counts": {
      "type": 4048,
      "value": 14011,
      "package": 37,
      "rhs": 4
    },
    "mixedObserved": 1309,
    "expressionObserved": 1299,
    "valueObserved": 1263,
    "valueExpanded": 92,
    "volumes": 13,
    "lines": 30355,
    "targets": 34,
    "withAnyLexicalMatch": 20,
    "withFullQualifiedMatch": 1,
    "withoutMatch": 14,
    "generated": 4,
    "pathNodes": 51,
    "pathEdges": 50,
    "checks": 55292,
    "negative": 4,
    "translationClosures": 0
  },
  "volumes": [
    {
      "volume": 1,
      "blob": "5bca2a3b9f982c303f61c38157b96330071d2a8b",
      "path": "specialists/proof_editor/2026-11-24_1056_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 2,
      "blob": "29a80c6fb574a123bfc288fd997b37cd9859c8a6",
      "path": "specialists/proof_editor/2026-11-24_1156_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 3,
      "blob": "131dfec03f3fd88213600f2e932b2d0d8178e9b1",
      "path": "specialists/proof_editor/2026-11-24_1256_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 4,
      "blob": "fac633d5b28c7caa916771051da8f3f879a52729",
      "path": "specialists/proof_editor/2026-11-24_1356_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 5,
      "blob": "0bdf9b3518f0a78fc94fdbe2bb2ee441c5e48b7a",
      "path": "specialists/proof_editor/2026-11-24_1456_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 6,
      "blob": "9896b2bbbea5d93160b2b9cae48f763c737adefb",
      "path": "specialists/proof_editor/2026-11-24_1556_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 7,
      "blob": "62853b5345f4b611e7e9908a7d97fb9f48d408e2",
      "path": "specialists/proof_editor/2026-11-24_1656_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 8,
      "blob": "5aec8844f71787813ae7c8f2f7be7d2ae188a94a",
      "path": "specialists/proof_editor/2026-11-24_1756_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 9,
      "blob": "feef1081f604923ee04ee270602bbc48bc0265f7",
      "path": "specialists/proof_editor/2026-11-24_1856_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 10,
      "blob": "04a0eece64a09e1c47dcb55acafbbf307fb97143",
      "path": "specialists/proof_editor/2026-11-24_1956_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 11,
      "blob": "de3cf3e2d7d7bd8fa9de3ddfd6a19b4599df522c",
      "path": "specialists/proof_editor/2026-11-24_2056_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 12,
      "blob": "45209db1006d6b0594760a50ba939a31a0098434",
      "path": "specialists/proof_editor/2026-11-24_2156_INTEGRATED_MANUSCRIPT.md"
    },
    {
      "volume": 13,
      "blob": "d571a86fc0322d642e33e6194ca421e694be79d9",
      "path": "specialists/proof_editor/2026-11-24_2256_INTEGRATED_MANUSCRIPT.md"
    }
  ],
  "nodes": [
    {
      "id": 8477096,
      "name": "UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature",
      "kind": "thm"
    },
    {
      "id": 11298208,
      "name": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "kind": "thm"
    },
    {
      "id": 13125901,
      "name": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "kind": "thm"
    },
    {
      "id": 14065051,
      "name": "UpperTheory.FinalTheorems.everyCharacter",
      "kind": "thm"
    },
    {
      "id": 14065052,
      "name": "allChi",
      "kind": "thm"
    },
    {
      "id": 14065053,
      "name": "rhOfAll",
      "kind": "thm"
    },
    {
      "id": 14065054,
      "name": "riemannHypothesis",
      "kind": "thm"
    },
    {
      "id": 11274889,
      "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature",
      "kind": "thm"
    },
    {
      "id": 11148669,
      "name": "UpperTheory.LiteratureTheorems.ar_degree_of_literature",
      "kind": "thm"
    },
    {
      "id": 11134501,
      "name": "UpperTheory.LiteratureTheorems.point_separation_pair_of_literature",
      "kind": "thm"
    },
    {
      "id": 11090272,
      "name": "UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature",
      "kind": "thm"
    },
    {
      "id": 11080156,
      "name": "UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature",
      "kind": "thm"
    },
    {
      "id": 10951735,
      "name": "UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature",
      "kind": "thm"
    },
    {
      "id": 10575871,
      "name": "UpperTheory.LiteratureTheorems.nef_rr_of_literature",
      "kind": "thm"
    },
    {
      "id": 10575034,
      "name": "UpperTheory.LiteratureTheorems.zarhin_statement",
      "kind": "thm"
    },
    {
      "id": 10523616,
      "name": "UpperTheory.LiteratureTheorems.fargues_exact_of_literature",
      "kind": "thm"
    },
    {
      "id": 10419805,
      "name": "UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature",
      "kind": "thm"
    },
    {
      "id": 10383261,
      "name": "UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature",
      "kind": "thm"
    },
    {
      "id": 10381888,
      "name": "UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature",
      "kind": "thm"
    },
    {
      "id": 9013533,
      "name": "UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",
      "kind": "thm"
    },
    {
      "id": 8797770,
      "name": "UpperTheory.LiteratureTheorems.published_results_first",
      "kind": "thm"
    },
    {
      "id": 8728574,
      "name": "UpperTheory.LiteratureTheorems.published_results_eigen",
      "kind": "thm"
    },
    {
      "id": 14065047,
      "name": "UpperTheory.TP.tools_holds_k",
      "kind": "thm"
    },
    {
      "id": 14065048,
      "name": "UpperTheory.TP.tLift_holds_k",
      "kind": "thm"
    },
    {
      "id": 14065049,
      "name": "UpperTheory.TP.K.tLiftK",
      "kind": "thm"
    },
    {
      "id": 14065050,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "kind": "thm"
    },
    {
      "id": 14019846,
      "name": "UpperTheory.TP.tLift_of_tools_k",
      "kind": "thm"
    },
    {
      "id": 14009156,
      "name": "UpperTheory.Gal.Int.Geo.weight_one_geometric_realization",
      "kind": "thm"
    },
    {
      "id": 14009157,
      "name": "UpperTheory.Gal.Int.Geo.geoOne_holds",
      "kind": "thm"
    },
    {
      "id": 14009158,
      "name": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "kind": "thm"
    },
    {
      "id": 13967295,
      "name": "UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one",
      "kind": "thm"
    },
    {
      "id": 13235288,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
      "kind": "thm"
    },
    {
      "id": 13235289,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
      "kind": "thm"
    },
    {
      "id": 13125906,
      "name": "UpperTheory.TP.TLiftK._proof_1",
      "kind": "thm"
    },
    {
      "id": 13125905,
      "name": "UpperTheory.TP.TLiftK",
      "kind": "def"
    },
    {
      "id": 13125938,
      "name": "UpperTheory.TP.TLiftK._proof_3",
      "kind": "thm"
    },
    {
      "id": 13125937,
      "name": "UpperTheory.TP.TLiftK._proof_2",
      "kind": "thm"
    },
    {
      "id": 13125939,
      "name": "UpperTheory.TP.TLiftK._proof_4",
      "kind": "thm"
    },
    {
      "id": 13125896,
      "name": "UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open",
      "kind": "thm"
    },
    {
      "id": 13125897,
      "name": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "kind": "thm"
    },
    {
      "id": 13125898,
      "name": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "kind": "thm"
    },
    {
      "id": 13125899,
      "name": "UpperTheory.One.vwin_of_row",
      "kind": "thm"
    },
    {
      "id": 13125895,
      "name": "UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open",
      "kind": "thm"
    },
    {
      "id": 13125894,
      "name": "UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open",
      "kind": "thm"
    },
    {
      "id": 13125892,
      "name": "UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open",
      "kind": "thm"
    },
    {
      "id": 13125891,
      "name": "UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open",
      "kind": "thm"
    },
    {
      "id": 13096374,
      "name": "UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open",
      "kind": "thm"
    },
    {
      "id": 13096369,
      "name": "UpperTheory.LiteratureTheorems.abelian_de_rham_of_open",
      "kind": "thm"
    },
    {
      "id": 13096371,
      "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open",
      "kind": "thm"
    },
    {
      "id": 13096367,
      "name": "UpperTheory.LiteratureTheorems.galois_cohomology_from_literature",
      "kind": "thm"
    },
    {
      "id": 13096368,
      "name": "UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm",
      "kind": "thm"
    }
  ],
  "edges": [
    {
      "owner": 11298208,
      "target": 8477096,
      "role": "value",
      "kind": "explicit_const",
      "witness": 685292527,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 13125901,
      "target": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980691,
      "expressionRoot": 997980699,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 14065051,
      "target": 13125901,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212055,
      "expressionRoot": 1065212057,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 14065052,
      "target": 14065051,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212058,
      "expressionRoot": 1065212058,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 14065053,
      "target": 14065052,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212060,
      "expressionRoot": 1065212061,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 14065054,
      "target": 14065053,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212062,
      "expressionRoot": 1065212062,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 11298208,
      "target": 11274889,
      "role": "value",
      "kind": "explicit_const",
      "witness": 891403535,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 11148669,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073876,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 11134501,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073873,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 11090272,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073870,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 11080156,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073867,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10951735,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073864,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10575871,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073861,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10575034,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073858,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10523616,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073855,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10419805,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073848,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10383261,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073845,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 10381888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073842,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 9013533,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073833,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 8797770,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073828,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 11298208,
      "target": 8728574,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073825,
      "expressionRoot": 893073889,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 14065048,
      "target": 14065047,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212048,
      "expressionRoot": 1065212050,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 14065049,
      "target": 14065048,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212051,
      "expressionRoot": 1065212051,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    },
    {
      "owner": 14065050,
      "target": 14065049,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212053,
      "expressionRoot": 1065212054,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 14065051,
      "target": 14065050,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212056,
      "expressionRoot": 1065212057,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 14065048,
      "target": 14019846,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212047,
      "expressionRoot": 1065212050,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 14009157,
      "target": 14009156,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644798,
      "expressionRoot": 1062644799,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 14009158,
      "target": 14009157,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644801,
      "expressionRoot": 1062644804,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    },
    {
      "owner": 14065050,
      "target": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212052,
      "expressionRoot": 1065212054,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 14009157,
      "target": 13967295,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644797,
      "expressionRoot": 1062644799,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13235289,
      "target": 13235288,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1004086667,
      "expressionRoot": 1004086672,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 14009158,
      "target": 13235289,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644800,
      "expressionRoot": 1062644804,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    },
    {
      "owner": 13125905,
      "target": 13125906,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980830,
      "expressionRoot": 997984088,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 14009158,
      "target": 13125905,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1000528341,
      "expressionRoot": 1062644804,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    },
    {
      "owner": 13125905,
      "target": 13125938,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980846,
      "expressionRoot": 997984088,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125905,
      "target": 13125937,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980839,
      "expressionRoot": 997984088,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125905,
      "target": 13125939,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997983762,
      "expressionRoot": 997984088,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13125896,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980667,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125898,
      "target": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980678,
      "expressionRoot": 997980683,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    },
    {
      "owner": 13125899,
      "target": 13125898,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980685,
      "expressionRoot": 997980689,
      "multiplicity": 1,
      "slot": null,
      "report": 1
    },
    {
      "owner": 13125901,
      "target": 13125899,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980696,
      "expressionRoot": 997980699,
      "multiplicity": 1,
      "slot": null,
      "report": 0
    },
    {
      "owner": 13125897,
      "target": 13125895,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980664,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13125894,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980661,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13125892,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980658,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13125891,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980655,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13096374,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980644,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13096369,
      "role": "value",
      "kind": "explicit_const",
      "witness": 995913394,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125897,
      "target": 13096371,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980639,
      "expressionRoot": 997980670,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13096368,
      "target": 13096367,
      "role": "value",
      "kind": "explicit_const",
      "witness": 995913380,
      "expressionRoot": 995913388,
      "multiplicity": 1,
      "slot": null,
      "report": 3
    },
    {
      "owner": 13125898,
      "target": 13096368,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980674,
      "expressionRoot": 997980683,
      "multiplicity": 1,
      "slot": null,
      "report": 2
    }
  ],
  "obligations": [
    {
      "id": 8477096,
      "name": "UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        0
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 5,
          "full": 0,
          "suffix": 0,
          "terminal": 5,
          "examples": [
            {
              "line": 440,
              "kind": "terminal",
              "heading": "## 1. Distinguish named literature from axioms",
              "text": "All four occur in the explicit qualified-name closure of the local final adapter. Original L313–314 `local_langlands_gl_recT_exists_of_literature` calls `llOf_alt` with 12 explicit inputs (including the local Langlands existence projection); those ot"
            },
            {
              "line": 572,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 313–314 | local_langlands_gl_recT_exists_of_literature | yes | — | local_langlands_recT_exists_of_literature, local_converse_gl_of_literature, depth_zero_induction_of_literature, brauer_degree_zero_of_literature, chevalley_units_of_literature, glob"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 928,
          "chapter": "## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 1137,
              "kind": "terminal",
              "heading": "## How the literature wrapper supplies the seven inputs",
              "text": "| `hL` | `local_langlands_gl_recT_exists_of_literature O` | constructed from twelve named local/global representation-theoretic inputs |"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 1213,
          "chapter": "## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 1250,
              "kind": "terminal",
              "heading": "## 1. The exact seven-input bridge (A:810–814; B:69–73)",
              "text": "6. hL : UpperTheory.Zero.LLC.RecTExists, supplied by local_langlands_gl_recT_exists_of_literature O."
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 2078,
          "chapter": "## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 2094,
              "kind": "terminal",
              "heading": "## Upstream junction",
              "text": "EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: publis"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature",
        "LiteratureTheorems.local_langlands_gl_recT_exists_of_literature",
        "local_langlands_gl_recT_exists_of_literature"
      ]
    },
    {
      "id": 11274889,
      "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        6
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 3,
          "full": 0,
          "suffix": 0,
          "terminal": 3,
          "examples": [
            {
              "line": 664,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 405–406 | grothendieck_deformation_of_literature | yes | — | abelian_de_rham_of_literature, abelian_lifting_of_literature |"
            },
            {
              "line": 666,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 407–408 | grothendieck_messing_of_literature | yes | — | grothendieck_deformation_of_literature |"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature",
        "LiteratureTheorems.grothendieck_deformation_of_literature",
        "grothendieck_deformation_of_literature"
      ]
    },
    {
      "id": 11148669,
      "name": "UpperTheory.LiteratureTheorems.ar_degree_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        7
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 510,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 251–252 | ar_degree_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.ar_degree_of_literature",
        "LiteratureTheorems.ar_degree_of_literature",
        "ar_degree_of_literature"
      ]
    },
    {
      "id": 11134501,
      "name": "UpperTheory.LiteratureTheorems.point_separation_pair_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        8
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 730,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 471–472 | point_separation_pair_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.point_separation_pair_of_literature",
        "LiteratureTheorems.point_separation_pair_of_literature",
        "point_separation_pair_of_literature"
      ]
    },
    {
      "id": 11090272,
      "name": "UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        9
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 758,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 499–500 | semi_abelian_lie_seminegative_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature",
        "LiteratureTheorems.semi_abelian_lie_seminegative_of_literature",
        "semi_abelian_lie_seminegative_of_literature"
      ]
    },
    {
      "id": 11080156,
      "name": "UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        10
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 782,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 523–524 | toroidal_for_fan_ks_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature",
        "LiteratureTheorems.toroidal_for_fan_ks_of_literature",
        "toroidal_for_fan_ks_of_literature"
      ]
    },
    {
      "id": 10951735,
      "name": "UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        11
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 768,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 509–510 | siegel_toroidal_integral_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature",
        "LiteratureTheorems.siegel_toroidal_integral_of_literature",
        "siegel_toroidal_integral_of_literature"
      ]
    },
    {
      "id": 10575871,
      "name": "UpperTheory.LiteratureTheorems.nef_rr_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        12
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 810,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 551–552 | nef_rr_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.nef_rr_of_literature",
        "LiteratureTheorems.nef_rr_of_literature",
        "nef_rr_of_literature"
      ]
    },
    {
      "id": 10575034,
      "name": "UpperTheory.LiteratureTheorems.zarhin_statement",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        13
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 806,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 547–548 | zarhin_statement | yes | — | dual_abelian_scheme_of_literature |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.zarhin_statement",
        "LiteratureTheorems.zarhin_statement",
        "zarhin_statement"
      ]
    },
    {
      "id": 10523616,
      "name": "UpperTheory.LiteratureTheorems.fargues_exact_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        14
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 808,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 549–550 | fargues_exact_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.fargues_exact_of_literature",
        "LiteratureTheorems.fargues_exact_of_literature",
        "fargues_exact_of_literature"
      ]
    },
    {
      "id": 10419805,
      "name": "UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        15
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 812,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 553–554 | poincare_lelong_inv_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature",
        "LiteratureTheorems.poincare_lelong_inv_of_literature",
        "poincare_lelong_inv_of_literature"
      ]
    },
    {
      "id": 10383261,
      "name": "UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        16
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 814,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 555–556 | principalisation_char_zero_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature",
        "LiteratureTheorems.principalisation_char_zero_of_literature",
        "principalisation_char_zero_of_literature"
      ]
    },
    {
      "id": 10381888,
      "name": "UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        17
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 816,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 557–558 | resolution_char_zero_of_literature | no | — | — |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature",
        "LiteratureTheorems.resolution_char_zero_of_literature",
        "resolution_char_zero_of_literature"
      ]
    },
    {
      "id": 9013533,
      "name": "UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        18
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 824,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 565–566 | theta_integrals_agree_and_local_matching_of_literature | yes | — | eis_bl_of_literature, siegel_weil_std_of_literature |"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 928,
          "chapter": "## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 1134,
              "kind": "terminal",
              "heading": "## How the literature wrapper supplies the seven inputs",
              "text": "| `hA` | `(theta_integrals_agree_and_local_matching_of_literature O).1` | first projection of one shared conjunction |"
            },
            {
              "line": 1135,
              "kind": "terminal",
              "heading": "## How the literature wrapper supplies the seven inputs",
              "text": "| `hM` | `(theta_integrals_agree_and_local_matching_of_literature O).2` | second projection of the same conjunction |"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 1213,
          "chapter": "## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md",
          "lines": 3,
          "full": 1,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 1253,
              "kind": "terminal",
              "heading": "## 1. The exact seven-input bridge (A:810–814; B:69–73)",
              "text": "Both hA and hM are projections of **the same conjunction**, theta_integrals_agree_and_local_matching_of_literature O. Bind it once in the human reading view; retain both edges. No additional axiom or premise removed. A:215 defines O with three fields"
            },
            {
              "line": 1313,
              "kind": "full",
              "heading": "## 5. Reproducible static checks",
              "text": "pair=a.split(\"theorem UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature\",1)[1].split(\"theorem \",1)[0]"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 2078,
          "chapter": "## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 2094,
              "kind": "terminal",
              "heading": "## Upstream junction",
              "text": "EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: publis"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",
        "LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",
        "theta_integrals_agree_and_local_matching_of_literature"
      ]
    },
    {
      "id": 8797770,
      "name": "UpperTheory.LiteratureTheorems.published_results_first",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        19
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 862,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 727–780 | published_results_first | yes | — | green_series_st_of_literature, linnik_of_literature, complex_multiplication_j_st_of_literature, cuspidal_mirabolic_of_literature, weyl_branching_of_literature, bernstein_unitary_product_irreducible_of_l"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 928,
          "chapter": "## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 950,
              "kind": "terminal",
              "heading": "## Source ledger",
              "text": "| `EC-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` | `a13ba1f8c38d4dbf2ddd809fbf9610a007936c24` | lines 565, 666, 727, 810: theta pair, `published_results_eige"
            },
            {
              "line": 1133,
              "kind": "terminal",
              "heading": "## How the literature wrapper supplies the seven inputs",
              "text": "| `F` | `published_results_first O` | the full `ThetaLocalInputs` record |"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 1213,
          "chapter": "## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 1246,
              "kind": "terminal",
              "heading": "## 1. The exact seven-input bridge (A:810–814; B:69–73)",
              "text": "2. F = published_results_first O : GlobalTheory.FunPr.ThetaLocalInputs."
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 2078,
          "chapter": "## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 2094,
              "kind": "terminal",
              "heading": "## Upstream junction",
              "text": "EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: publis"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.published_results_first",
        "LiteratureTheorems.published_results_first",
        "published_results_first"
      ]
    },
    {
      "id": 8728574,
      "name": "UpperTheory.LiteratureTheorems.published_results_eigen",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        1,
        20
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 409,
          "chapter": "## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 860,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 666–726 | published_results_eigen | yes | — | clozel_cohomological_of_literature, green_cuspidal_of_literature, hecke_l_adic_character_of_literature, chebotarev_degree_one_of_literature, cusp_u_of_literature, base_change_definite_unitary_group_of_l"
            },
            {
              "line": 866,
              "kind": "terminal",
              "heading": "## 3. Complete lexical adapter ledger",
              "text": "| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poin"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 928,
          "chapter": "## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 950,
              "kind": "terminal",
              "heading": "## Source ledger",
              "text": "| `EC-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` | `a13ba1f8c38d4dbf2ddd809fbf9610a007936c24` | lines 565, 666, 727, 810: theta pair, `published_results_eige"
            },
            {
              "line": 1132,
              "kind": "terminal",
              "heading": "## How the literature wrapper supplies the seven inputs",
              "text": "| `P` | `published_results_eigen O` | the full `UnitaryGroupThirdPlaceHypotheses` record; in particular `greenRegularCharacters` and `nLink` |"
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 1213,
          "chapter": "## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 1245,
              "kind": "terminal",
              "heading": "## 1. The exact seven-input bridge (A:810–814; B:69–73)",
              "text": "1. P = published_results_eigen O : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses."
            }
          ]
        },
        {
          "volume": 1,
          "chapterLine": 2078,
          "chapter": "## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 2094,
              "kind": "terminal",
              "heading": "## Upstream junction",
              "text": "EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: publis"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.published_results_eigen",
        "LiteratureTheorems.published_results_eigen",
        "published_results_eigen"
      ]
    },
    {
      "id": 14065047,
      "name": "UpperTheory.TP.tools_holds_k",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        23,
        22,
        21
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 368,
          "chapter": "## Appendix 1: specialists/galois_representations/RUN1_ROW_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 389,
              "kind": "terminal",
              "heading": "## Human-readable proof of the composition (not proofs of all producers)",
              "text": "F:TLiftK quantifiers: for every CM number field E with base B satisfying W.GoodK, every n>=1 and Hermitian space X of rank n with J=1 and X.IsHerm(cj E,B,n,0), there exists a natural threshold d0. For every d>=d0, every skew-Hermitian W with J=delta "
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.TP.tools_holds_k",
        "TP.tools_holds_k",
        "tools_holds_k"
      ]
    },
    {
      "id": 14019846,
      "name": "UpperTheory.TP.tLift_of_tools_k",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        23,
        22,
        25
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 368,
          "chapter": "## Appendix 1: specialists/galois_representations/RUN1_ROW_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 389,
              "kind": "terminal",
              "heading": "## Human-readable proof of the composition (not proofs of all producers)",
              "text": "F:TLiftK quantifiers: for every CM number field E with base B satisfying W.GoodK, every n>=1 and Hermitian space X of rank n with J=1 and X.IsHerm(cj E,B,n,0), there exists a natural threshold d0. For every d>=d0, every skew-Hermitian W with J=delta "
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.TP.tLift_of_tools_k",
        "TP.tLift_of_tools_k",
        "tLift_of_tools_k"
      ]
    },
    {
      "id": 14009156,
      "name": "UpperTheory.Gal.Int.Geo.weight_one_geometric_realization",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        27,
        26
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 13,
          "chapterLine": 492,
          "chapter": "### Peer original: [specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md) — blob 6e0d4",
          "lines": 1,
          "full": 0,
          "suffix": 1,
          "terminal": 0,
          "examples": [
            {
              "line": 538,
              "kind": "suffix",
              "heading": "## 4. Newly read exported reference evidence",
              "text": "Retrieved compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json, branch cathedral-research-state, blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2, archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.Gal.Int.Geo.weight_one_geometric_realization",
        "Geo.weight_one_geometric_realization",
        "weight_one_geometric_realization"
      ]
    },
    {
      "id": 13967295,
      "name": "UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        27,
        29
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [
        {
          "volume": 1,
          "chapterLine": 368,
          "chapter": "## Appendix 1: specialists/galois_representations/RUN1_ROW_BRIDGE.md",
          "lines": 1,
          "full": 0,
          "suffix": 0,
          "terminal": 1,
          "examples": [
            {
              "line": 387,
              "kind": "terminal",
              "heading": "## Human-readable proof of the composition (not proofs of all producers)",
              "text": "A:galoisLocalGlobalStrong_recParameter is C:galoisRepresentations_of_thetaLift applied to B:tLiftK. B uses G:tLift_holds_k. C combines E:geoOne_holds and the lift via D:galoisLocalGlobalStrong_of_geometry_lift. E unfolds HolomorphicLefschetzFormula a"
            }
          ]
        },
        {
          "volume": 12,
          "chapterLine": 812,
          "chapter": "### Peer original: [specialists/galois_representations/RUN15_GEOMETRIC_SEED_PACK_AND_TWIST.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN15_GEOMETRIC_SEED_PACK_AND_TWIST.md) — blob 48c945837bf90abcafd74c362",
          "lines": 2,
          "full": 0,
          "suffix": 0,
          "terminal": 2,
          "examples": [
            {
              "line": 864,
              "kind": "terminal",
              "heading": "## 4. Close the source-level join, retain open inputs",
              "text": "GeoOneOfParts:7 is geoOne_of hSteps (packEx_of hKS hPlan). GeometricRealizationOfWeightOne:18–25 supplies jumpStep_holds from htSpecGood, crysStep_holds and repEx_holds; steps_holds from crysStep_holds, jumpStep_holds and crystallineComparison.phiSte"
            },
            {
              "line": 901,
              "kind": "terminal",
              "heading": "## RESUME HERE",
              "text": "Expand the actual PlanEx producer Pl.planEx_holds by tracing imports of GeometricRealizationOfWeightOne and H clump; preserve the separate P/P' witnesses and all local quantifiers, then recover the changed standard_datum_exists supplier. Request role"
            }
          ]
        },
        {
          "volume": 13,
          "chapterLine": 492,
          "chapter": "### Peer original: [specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md) — blob 6e0d4",
          "lines": 1,
          "full": 0,
          "suffix": 1,
          "terminal": 0,
          "examples": [
            {
              "line": 538,
              "kind": "suffix",
              "heading": "## 4. Newly read exported reference evidence",
              "text": "Retrieved compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json, branch cathedral-research-state, blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2, archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480"
            }
          ]
        }
      ],
      "matchTokens": [
        "UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one",
        "Geo.geometric_realization_of_weight_one",
        "geometric_realization_of_weight_one"
      ]
    },
    {
      "id": 13235288,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        31,
        30
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
        "Int.galoisLocalGlobal_of_geometry_lift",
        "galoisLocalGlobal_of_geometry_lift"
      ]
    },
    {
      "id": 13125906,
      "name": "UpperTheory.TP.TLiftK._proof_1",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        33,
        32
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.TP.TLiftK._proof_1",
        "TLiftK._proof_1"
      ]
    },
    {
      "id": 13125938,
      "name": "UpperTheory.TP.TLiftK._proof_3",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        33,
        34
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.TP.TLiftK._proof_3",
        "TLiftK._proof_3"
      ]
    },
    {
      "id": 13125937,
      "name": "UpperTheory.TP.TLiftK._proof_2",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        33,
        35
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.TP.TLiftK._proof_2",
        "TLiftK._proof_2"
      ]
    },
    {
      "id": 13125939,
      "name": "UpperTheory.TP.TLiftK._proof_4",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        24,
        28,
        33,
        36
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.TP.TLiftK._proof_4",
        "TLiftK._proof_4"
      ]
    },
    {
      "id": 13125896,
      "name": "UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        37
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open",
        "LiteratureTheorems.hecke_tate_functional_equation_of_open",
        "hecke_tate_functional_equation_of_open"
      ]
    },
    {
      "id": 13125895,
      "name": "UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        41
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open",
        "LiteratureTheorems.partial_zeta_functional_equation_of_open",
        "partial_zeta_functional_equation_of_open"
      ]
    },
    {
      "id": 13125894,
      "name": "UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        42
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open",
        "LiteratureTheorems.siegel_klingen_deligne_ribet_of_open",
        "siegel_klingen_deligne_ribet_of_open"
      ]
    },
    {
      "id": 13125892,
      "name": "UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        43
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open",
        "LiteratureTheorems.hilbert_class_field_j_of_open",
        "hilbert_class_field_j_of_open"
      ]
    },
    {
      "id": 13125891,
      "name": "UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        44
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open",
        "LiteratureTheorems.elliptic_main_theorem_cm_of_open",
        "elliptic_main_theorem_cm_of_open"
      ]
    },
    {
      "id": 13096374,
      "name": "UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        45
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open",
        "LiteratureTheorems.dual_abelian_scheme_of_open",
        "dual_abelian_scheme_of_open"
      ]
    },
    {
      "id": 13096369,
      "name": "UpperTheory.LiteratureTheorems.abelian_de_rham_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        46
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.abelian_de_rham_of_open",
        "LiteratureTheorems.abelian_de_rham_of_open",
        "abelian_de_rham_of_open"
      ]
    },
    {
      "id": 13096371,
      "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        38,
        47
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open",
        "LiteratureTheorems.grothendieck_deformation_of_open",
        "grothendieck_deformation_of_open"
      ]
    },
    {
      "id": 13096367,
      "name": "UpperTheory.LiteratureTheorems.galois_cohomology_from_literature",
      "kind": "thm",
      "path": [
        5,
        4,
        3,
        2,
        40,
        39,
        49,
        48
      ],
      "obligation": "OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",
      "matches": [],
      "matchTokens": [
        "UpperTheory.LiteratureTheorems.galois_cohomology_from_literature",
        "LiteratureTheorems.galois_cohomology_from_literature",
        "galois_cohomology_from_literature"
      ]
    }
  ],
  "trustBoundary": "Observed paths only; full typed reports retained by blob. A lexical hit is navigation, not source-to-export equivalence, proof reconstruction, or axiom audit. Zero translation closures credited by this join."
}
```

## Reproducible certificate (save as .mjs)

```js
import fs from "node:fs";
import crypto from "node:crypto";
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
const volumes=[["1056","5bca2a3b9f982c303f61c38157b96330071d2a8b"],["1156","29a80c6fb574a123bfc288fd997b37cd9859c8a6"],["1256","131dfec03f3fd88213600f2e932b2d0d8178e9b1"],["1356","fac633d5b28c7caa916771051da8f3f879a52729"],["1456","0bdf9b3518f0a78fc94fdbe2bb2ee441c5e48b7a"],["1556","9896b2bbbea5d93160b2b9cae48f763c737adefb"],["1656","62853b5345f4b611e7e9908a7d97fb9f48d408e2"],["1756","5aec8844f71787813ae7c8f2f7be7d2ae188a94a"],["1856","feef1081f604923ee04ee270602bbc48bc0265f7"],["1956","04a0eece64a09e1c47dcb55acafbbf307fb97143"],["2056","de3cf3e2d7d7bd8fa9de3ddfd6a19b4599df522c"],["2156","45209db1006d6b0594760a50ba939a31a0098434"],["2256","d571a86fc0322d642e33e6194ca421e694be79d9"]];
const paths=["specialists/proof_editor/2026-11-24_1056_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1156_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1256_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1356_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1456_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1556_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1656_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1756_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1856_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_1956_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_2056_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_2156_INTEGRATED_MANUSCRIPT.md","specialists/proof_editor/2026-11-24_2256_INTEGRATED_MANUSCRIPT.md"];
function concordance(docs,books,volumes,paths){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054;
 let checks=0;const ck=(p,m)=>{if(!p)throw Error(m);checks++};
 const ids=new Map(),names=new Map(),owners=new Map(),adj=new Map();const counts={type:0,value:0,package:0,rhs:0};
 function ident(id,parts,kind){const key=JSON.stringify(parts);ck(!ids.has(id)||ids.get(id).key===key&&ids.get(id).kind===kind,"identity collision");ck(!names.has(key)||names.get(key)===id,"name collision");ids.set(id,{name:parts.join("."),parts,key,kind});names.set(key,id)}
 for(let i=0;i<docs.length;i++){const d=docs[i];ck(d.root===root&&d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.reports.length===[6,47,18,71][i]&&(!i||d.pin===pin),"archive");for(const r of d.reports){const s=r.request??r.source;ck(!owners.has(r.id)&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&(s.id===undefined||s.id===r.id),"owner");ident(r.id,s.name.split("."),r.kind);owners.set(r.id,i);adj.set(r.id,[]);function add(z,role,slot){let n=0;for(const e of z.references){ident(e.target,e.nameParts,e.targetKind);ck(e.witnessExpression>=0&&e.witnessExpression<=z.expressionRoot&&e.distinctExpressionRecords>0,"witness");n+=e.distinctExpressionRecords;adj.get(r.id).push({owner:r.id,target:e.target,role,kind:e.kind,witness:e.witnessExpression,expressionRoot:z.expressionRoot,multiplicity:e.distinctExpressionRecords,slot:slot??null,report:i});counts[role]++}ck(n===z.referenceOccurrences,"multiplicity")}
 add(r.type,"type");if(r.value)add(r.value,"value");for(const e of r.structural??[]){ck(r.encodedRootsAndStructuralEdges[e.edgeIndex]===e.encoded,"slot");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"package");adj.get(r.id).push({owner:r.id,target:e.target,role:"package",kind:"package_member",slot:e.edgeIndex,encoded:e.encoded,report:i});counts.package++}else{ck(e.expression.expressionRoot+1===e.encoded&&r.kind==="rec","rhs");add(e.expression,"rhs",e.edgeIndex)}}}}
 function walk(allow){const prev=new Map([[root,null]]),q=[root];for(let i=0;i<q.length;i++)for(const e of adj.get(q[i])??[])if(allow(e)&&!prev.has(e.target)){prev.set(e.target,e);q.push(e.target)}return prev}
 const all=walk(()=>true),value=walk(e=>e.role==="value"&&e.kind==="explicit_const"),expr=walk(e=>e.role!=="package");
 const targets=[...value.keys()].filter(id=>!owners.has(id)&&ids.get(id).kind==="thm"&&/^UpperTheory\.(LiteratureTheorems|TP|Gal)\./.test(ids.get(id).name));ck(targets.length===34,"target count");
 const edges=[],edgeKeys=new Map(),nodes=new Map();function edgeId(e){const k=JSON.stringify(e);if(!edgeKeys.has(k)){edgeKeys.set(k,edges.length);edges.push(e)}return edgeKeys.get(k)}
 function path(id){const p=[];let n=id;while(n!==root){const e=value.get(n);ck(e&&e.target===n&&e.role==="value"&&e.kind==="explicit_const","path witness");nodes.set(n,ids.get(n));p.unshift(edgeId(e));n=e.owner}nodes.set(root,ids.get(root));return p}
 const rows=targets.map(id=>{const v=ids.get(id),parts=v.parts;return {id,name:v.name,kind:v.kind,path:path(id),obligation:"OPEN: producer expression not expanded in this projection; manuscript lexical matches do not prove translation",matches:[],matchTokens: [v.name,parts.slice(-2).join("."),...(!String(parts.at(-1)).startsWith("_proof_")?[String(parts.at(-1))]:[])]}});
 const escape=s=>s.replace(/[.*+?^${}()|[\]\\]/g,"\\$&");
 function regex(s){return new RegExp("(^|[^A-Za-z0-9_'])"+escape(s)+"(?![A-Za-z0-9_'])","u")}
 const compiled=rows.map(r=>r.matchTokens.map(regex));
 let lines=0;
 for(let i=0;i<books.length;i++){const b=books[i];ck(b.includes(pin)&&b.includes("INCOMPLETE"),"book pin/status");const ls=b.split("\n");lines+=ls.length;let chapter="opening",chLine=1,heading=chapter;const hits=rows.map(()=>new Map());for(let j=0;j<ls.length;j++){const l=ls[j];if(/^## Appendix \d+:|^### Peer original:|^## New (?:editor chapter|mathematical|derivation)|^## Additional source-linked/.test(l)){chapter=l.trim();chLine=j+1}if(/^#{1,3} /.test(l))heading=l.trim();for(let k=0;k<rows.length;k++){const p=compiled[k].findIndex(re=>re.test(l));if(p<0)continue;const m=hits[k],key=chLine;if(!m.has(key))m.set(key,{volume:i+1,chapterLine:chLine,chapter:chapter.slice(0,350),lines:0,full:0,suffix:0,terminal:0,examples:[]});const h=m.get(key);h.lines++;const kind=["full","suffix","terminal"][p];h[kind]++;if(h.examples.length<2)h.examples.push({line:j+1,kind,heading:heading.slice(0,150),text:l.trim().slice(0,250)})}}for(let k=0;k<rows.length;k++)rows[k].matches.push(...hits[k].values())}
 function validate(rows,edges){for(const r of rows){let u=root;for(const ix of r.path){const e=edges[ix];if(!e||e.owner!==u||e.role!=="value"||e.kind!=="explicit_const")throw Error("path direction/role");const source=adj.get(u)?.find(z=>JSON.stringify(z)===JSON.stringify(e));if(!source)throw Error("path evidence");u=e.target}if(u!==r.id||ids.get(u).name!==r.name)throw Error("target identity");for(const m of r.matches){if(m.full+m.suffix+m.terminal!==m.lines||m.lines<1)throw Error("match census");for(const ex of m.examples){const line=books[m.volume-1].split("\n")[ex.line-1];if(!regex(r.matchTokens[["full","suffix","terminal"].indexOf(ex.kind)]).test(line))throw Error("match witness")}}}}
 validate(rows,edges);
 let negative=0;function reject(f){try{f()}catch(e){negative++;return}throw Error("negative accepted")}
 const e0=edges[rows[0].path[0]];reject(()=>validate(rows,edges.map(e=>e===e0?{...e,role:"type"}:e)));reject(()=>validate(rows,edges.map(e=>e===e0?{...e,witness:e.witness+1}:e)));reject(()=>validate(rows.map((r,i)=>i===0?{...r,name:r.name+"x"}:r),edges));reject(()=>validate(rows.map((r,i)=>i===0?{...r,path:r.path.slice(0,-1)}:r),edges));ck(!regex("foo").test("foobar")&&!regex("foo").test("foo_bar")&&regex("foo").test("`foo`"),"token controls");ck(!regex("TLiftK._proof_1").test("Other._proof_1"),"generated name ambiguity guard");
 const scope={owners:owners.size,identities:ids.size,counts,mixedObserved:all.size,expressionObserved:expr.size,valueObserved:value.size,valueExpanded:[...value.keys()].filter(id=>owners.has(id)).length,volumes:books.length,lines,targets:rows.length,withAnyLexicalMatch:rows.filter(r=>r.matches.length).length,withFullQualifiedMatch:rows.filter(r=>r.matches.some(m=>m.full)).length,withoutMatch:rows.filter(r=>!r.matches.length).length,generated:rows.filter(r=>r.name.includes("._proof_")).length,pathNodes:nodes.size,pathEdges:edges.length,checks,negative,translationClosures:0};
 return {status:"PARTIAL_EXPORT_TO_EDITORIAL_CONCORDANCE_NOT_KERNEL_REPLAY",sourcePin:pin,root,scope,volumes:volumes.map(([time,blob],i)=>({volume:i+1,blob,path:paths[i]})),nodes:[...nodes].map(([id,v])=>({id,name:v.name,kind:v.kind})),edges,obligations:rows,trustBoundary:"Observed paths only; full typed reports retained by blob. A lexical hit is navigation, not source-to-export equivalence, proof reconstruction, or axiom audit. Zero translation closures credited by this join."};
}
const args=process.argv.slice(2);if(args.length!==17)throw Error("provide four report files then 13 volumes in listed order");const shas=[...hashes,...volumes.map(v=>v[1])];const texts=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==shas[i])throw Error("blob mismatch "+p);return b.toString("utf8")});console.log(JSON.stringify(concordance(texts.slice(0,4).map(JSON.parse),texts.slice(4),volumes,paths),null,2));
```

**RESUME HERE:** For the generated TLiftK._proof_1..4 frontier, retrieve their actual exported types and source TLiftK declaration; align each anonymous proof with the exact field, preserving all premises. Coordinate with theta and Galois lanes before expanding. For other targets, use the indexed lexical hits only as navigation and demand the native proof body, source pin and authenticated role references before marking any obligation covered. HANDOFF TO all RH lanes. No unrelated Cathedral records changed.
