# Human-readable RH reconstruction — eighteenth edition, 25 November 2026

**INCOMPLETE.** Pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Prior end-of-day manuscript [volume 14](2026-11-24_2356_INTEGRATED_MANUSCRIPT.md), blob e479bb14dbf87c90312ee7974d08fef2f55a22ac, links all earlier volumes. This is volume 15; editorial inventory 177 primary + 16 supporting = 193, excluding editor's derivations as before, not unique translated declarations. Working snapshot 1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2. Observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10, two commits ahead of previous edition's 82c577caf1b8a66c76212d78a399234f55813d28; comparison file list shows no filenames matching PsiThin/NoZeroComplex/ExplicitFormulaCounts/ZerosWindow in that delta. No source migration or semantic equivalence claim.

## Reading order and joins
Read volume 1 root and reflection; this analytic chapter with volume 14 ThinChoice (uniform constants, not fixed-character bounds); then conductor change and prime admission. Follow Galois/TLiftK, finite projector and adelic chapters before theta HolLead and divided-power geometry. Return through same-witness windows and Landau contradiction to root. Integration's four generated TLiftK owners now have source field candidates and direct role evidence, NOT exact raw binder proof replay. All peer originals below retained unedited; prior volumes immutable.

## New editor chapter — uniform primitive-character thin bound: native zero-free and reciprocal-zero assembly

SOURCE-MATCHED human derivation, conditional on exact analytic suppliers. Fills the missing QH.psi_thin assembly from volume 14, not its entire analytic input tree.

### 1. Native zero-free supplier and quantifier order
Fix c0>0. Let c1>0 be the universal constant of Formalism.ZeroFreeDirichlet.zFRDirichlet. At each positive integer modulus N, InRegion(c1,N,rho) means 1-c1/log(N*(|Im rho|+2)) <= Re rho. IsLZero includes (chi!=1 OR rho!=1) as well as L(chi,rho)=0. Every zero in this region has chi^2=1, chi!=1, Im rho=0, nonzero derivative, and is unique across all characters of that same modulus. No uniqueness across different moduli is asserted.

The six antecedents of zeroFreeRegionExceptionalZeroOfBounds are zeta zero-free region, principal-to-zeta zero transfer, nonquadratic exclusion, quadratic large-height exclusion, quadratic small-height real/simple/unique property, and exclusion of simultaneous real zeros of two distinct nonprincipal quadratic characters. Choose delta from the small-height bound BEFORE the large-height bound at delta. Take the minimum of cz,cN,cL,cS,c2,1/2, all positive. The last guard ensures positive real part, since log(N*(|t|+2))>=log 2>1/2. Principal zeros transfer to zeta and contradict its region; nonquadratic zeros contradict NoZeroComplex; a remaining quadratic nonprincipal zero has height <delta/log(N*(|t|+2)). Apply RealSmallT to the same zero twice to get real and simple, then apply TwoReal to any different quadratic character and RealSmallT to two zeros of the same character. This is the actual assembly, not proof of the six imported analytic theorems.

Take c=min(c1,c0)>0 BEFORE N, chi and lam. Suppose lam>=1, log N<=lam, and chi^2=1 and chi!=1 imply NoExc(c0,chi), where NoExc excludes real zeros beta in (1-c0,1). For rho with Re rho<1 and L=0, put A=log N+log(|Im rho|+2)>0 and B=lam+log(|Im rho|+3)>=1. A<=B; hence c/B<=c1/A and c/B<=c0. If Re rho>1-c/B, then InRegion(c1,N,rho), with IsLZero because rho!=1. The supplier forces a real nonprincipal quadratic zero with Re rho>1-c0 and Re rho<1, contradicting NoExc. Thus Re rho<=1-c/B. This is pt_zero_free, even without primitivity. Strict inequalities and the exclusion of rho=1 are essential.

### 2. Left separation by the functional equation
For primitive chi and 0<Re rho<1, inversion preserves conductor: FactorsThrough(d) is preserved by inverse via map_inv; applying it again proves equality of conductor sets and hence conductors. The gamma factor at rho is nonzero (positive real part of its argument, even or odd parity), and rho,1-rho are nonzero. The functional equation of the completed L-function gives L(chi^-1,1-rho)=0. The NoExc hypothesis transfers to chi^-1: if (chi^-1)^2=1 then chi^2=1 and chi^-1=chi. Thus no separate exceptional-zero hypothesis is introduced. For |Im rho|<=2, log(|Im rho|+3)<=log 5<2; B<=lam+2<=3lam. Apply part 1 to 1-rho to obtain Re rho>= (c/3)/lam. Write ka=c/3.

### 3. Reciprocal-zero sum (pt_zero_sum)
Let C>0 be the uniform constant of ZerosWindowWith: the multiplicity mass of zeros with 0<Re rho<1 and |Im rho-t|<=1 is at most C log(N*(|t|+2)), including endpoints. ExplicitFormulaWith(C7) supplies finiteness of ZerosBelow(chi,T) for every T>=1 by applying it at u=T'=max(T,2) and taking the subset. ZerosBelow uses |Im rho|<T, not <=T.

Set M=floor T, Y=lam+log T>=1, La=lam+log(M+2)<=3Y. For i=0,...,M put a_i=(lam/ka if i<=2 else 0)+2/(i+1). In fibre floor |Im rho|=i, every zero has positive norm. When |Im rho|<=2 left separation implies 1/|rho|<=lam/ka<=a_i. Otherwise |Im rho|>=2 and |Im rho|>=i, so |rho| >=(i+1)/2 and again 1/|rho|<=a_i. Split into Im rho>=0 and Im rho<0; these lie within the windows centred at i and -i respectively. Each mass <= C La, so the fibre's reciprocal-weighted mass <=2 C La a_i. Nonnegative multiplicity allows enlarging finite subsets; at i=0 the windows may overlap but the two disjoint sign fibres are still each bounded. Summing, the exceptional coefficient contributes at most 3lam/ka. Harmonic sum H_(M+1)<=1+log(M+1)<=2+log T. Therefore sum a_i <= (3/ka+4)Y, since lam>=1. Hence

    sum_{rho in ZerosBelow(chi,T)} m(rho)/|rho|
     <= 6 C (3/ka+4) (lam+log T)^2.

This is the precise bound used in psi_thin; no assumption of GRH or ignoring multiplicities.

### 4. Cutoff and explicit formula (pt_core)
Let u>=e, v=log u>=1, s=sqrt(v)>=1, T=exp(s), W=v+lam>=2, cp=min(c/3,1)>0, E=exp(-cp*v/(lam+s)), P=u E. Then 2<=T<=u, P>=1 and 1/T<=E because cp*v/(lam+s)<=s<=v. For every zero below T, log(|Im rho|+3)<=log(4T)<=s+2, hence lam+log(|Im rho|+3)<=3(lam+s). It follows cp/(lam+s)<=c/(lam+log(|Im rho|+3)); the zero-free bound implies u^Re rho<=P. As u>0, the complex power has norm u^Re rho. Use the triangle inequality and reciprocal sum with C2=6 C(3/(c/3)+4) to bound the truncated complex zero sum by C2 W^2 P.

The three residual terms of ExplicitFormulaWith(C7) obey:
- u log(NuT)^2/T <=4W^2 P because log(NuT)<=lam+v+s<=2W;
- log(Nu)<=W<=W^2 P;
- sum_{ZerosBelow(chi,1)} m(rho)/|rho|<=C2 lam^2<=C2 W^2 P.
All logarithms squared here are nonnegative since N>=1 and u,T>=1. With psi0 the weighted Mangoldt sum minus u for chi=1 and minus 0 otherwise, the explicit formula controls |psi0 + truncated zero sum| by C7 times the three errors. The triangle inequality yields

    |psi0(chi,u)| <= [C7(5+C2)+C2] u (log u+lam)^2 exp(-cp*log u/(lam+sqrt(log u))).

Both constants C7(5+C2)+C2 and cp strictly positive, fixed after c0, before N,chi,lam,u. This reproduces the source constant and displayed native psi_thin conclusion, conditional on named suppliers. Joins volume 14 QH.thin without replacing its uniform estimate by fixed-character decay.

### 5. Actual suppliers and unresolved leaves
explicitFormula_closed = explicitFormula_of zerosWindow_closed chk_discFactor chk_discLog chk_lBoundRight chk_zetaBoundRight chk_lInvRight.
zerosWindow_closed = zerosWindow_of chk_lBoundRight chk_zetaBoundRight chk_lInvRight.
The former calls PI.EF.explicitFormula_main; the latter calls PI.ZW.zerosWindow_of_transfer PI.ZW.transfer. chk_discFactor is Formalism.ZF.zeroFactorization; chk_discLog invokes zflb_exists_log under original analytic/nonzero guards; chk_zetaBoundRight is growthBound; chk_lInvRight is inverseBound. chk_lBoundRight calls l_function_partial_sum at M=1 with the nonprincipal character partial-sum bound q+1, giving norm <=1+2(q+1)(1+|s|/Re s) in its original right-half-plane domain by adding the n=1 term. These are actual source-body suppliers, not assumptions invented here. Full analytic proofs (especially contour truncation, zero counting and local factorization) remain OPEN. No authenticated root path for private declarations claimed.

## Source ledger — twelve retrieved pinned source files
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/PsiThin.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/PsiThin.lean) — 9e669a084dd244d41a04f1b9f46ad13cd0b3426c; pt_factorsThrough_inv 9; pt_isPrimitive_inv 14; pt_zero_symm 27; pt_rpow_le 50; pt_core 60–182; pt_zero_sum 184–351; pt_zero_free 353–383; psi_thin 385–end
- [src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean) — 45616f33334b6ef360b18a8e64c0eb325f9463b8; NoExc 71–72
- [src/Formalism/LandauZeroFreeBounds/Statement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LandauZeroFreeBounds/Statement.lean) — a090de92b0ef66f98ad1ef8fb3a65e3c8aa4cc25; InRegion, IsLZero, ZFRDirichlet
- [src/Formalism/LandauZeroFreeBounds/NoZeroComplex.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LandauZeroFreeBounds/NoZeroComplex.lean) — b8c132fbe9a43bd99443274dc757e14b3debdbde; localZeros, noZeroComplex, realLargeT, realSmallT, twoReal, zFRDirichlet
- [src/Formalism/LandauZeroFreeBounds/ExceptionalZeroBounds/ZFRDirichletOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LandauZeroFreeBounds/ExceptionalZeroBounds/ZFRDirichletOf.lean) — 013d1bfadfd8fab50d27e35434f8f54348401138; zeroFreeRegionExceptionalZeroOfBounds
- [src/Formalism/LandauZeroFreeBounds/NoZeroComplexOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LandauZeroFreeBounds/NoZeroComplexOf.lean) — fe15c4fd77fdf6aae9463410d336d7474df5b2b3; LocalZeros, RealSmallT, TwoReal, ZFRDirichletOf
- [src/Formalism/PeriodIntegrals/ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ExplicitFormula.lean) — 64cc5260677d2744ed2513e36c2df408e01aedab; psi0, ZerosBelow, ExplicitFormulaWith
- [src/Formalism/PeriodIntegrals/ZerosWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ZerosWindow.lean) — 4d3f895cac89f0b512bdd8f85f53989a8ef13486; ZerosNear, ZerosWindowWith
- [src/Formalism/PeriodIntegrals/ExplicitFormulaCounts/ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ExplicitFormulaCounts/ExplicitFormula.lean) — 55f12221eaf1c43eefe54428dec85a153cd041f7; zerosWindow_closed, explicitFormula_closed
- [src/Formalism/PeriodIntegrals/ExplicitFormulaCounts/AnalyticInputs.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ExplicitFormulaCounts/AnalyticInputs.lean) — a7b13b52562f8e6cf70226933ac58bc2563940c8; chk_discFactor, chk_discLog, chk_lBoundRight, chk_zetaBoundRight, chk_lInvRight
- [src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ExplicitFormula.lean) — c07ea850798d6b5248a6c4f8b2c2872a59029a8e; explicitFormula_of
- [src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ZerosWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ZerosWindow.lean) — d882db51d488c4f92320e0012e65e26c926f2b92; zerosWindow_of

## Execution and reproducibility
Actual V8 BigInt regression (abstract rational denominator, cutoff and reciprocal inequalities, not actual L-function zeros): {"denominator":141120,"core":13824,"reciprocal":14400,"constant":4624,"negative":3}. Finite tests do not prove universal inequalities or validate Lean. The three negative checks are illustrative scalar violations of omitted guards, not native analytic counterexamples. Reproduce by running this function in Node or V8:
```js
const test = function(){
let counts={denominator:0,core:0,reciprocal:0,constant:0,negative:0}; const ck=(p,k)=>{if(!p)throw Error(k);counts[k]++};
for(let l=1n;l<=12n;l++)for(let n=0n;n<=l;n++)for(let a=1n;a<=8n;a++)for(let b=a;b<=a+3n;b++)for(let c=1n;c<=7n;c++)for(let c0=1n;c0<=7n;c0++){let m=c<c0?c:c0;ck(m*(n+a)<=c*(l+b)&&m<=c0*(l+b),"denominator")}
for(let l=1n;l<=24n;l++)for(let s=1n;s<=24n;s++)for(let c=1n;c<=24n;c++){
let v=s*s, cp=c<3n?c:3n, d=l+s,W=l+v; // cp/3 = min(c/3,1)
ck(cp*v<=3n*d*v&&cp*v<=3n*d*s&&cp*(l+s+2n)<=3n*c*d&&v+l+s<=2n*W&&W>=2n,"core");
}
for(let l=1n;l<=12n;l++)for(let k=1n;k<=12n;k++)for(let i=0n;i<=24n;i++)for(let j=0n;j<4n;j++){
let t4=4n*i+j, an=(i<=2n?l*(i+1n):0n)+2n*k,ad=k*(i+1n);
if(t4<=8n)ck(an*k>=ad*l,"reciprocal");else ck(an*t4>=4n*ad,"reciprocal");
}
for(let a=1n;a<=16n;a++)for(let b=0n;b<=16n;b++)for(let W=2n;W<=18n;W++)ck(a*(4n+1n+b)+b===a*(5n+b)+b&&W<=W*W,"constant");
ck(3n*1n>1n*2n,"negative"); // c/B > c1/A with c=3, B=2, c1=1, A=1
ck(2n>1n,"negative"); // c/B > c0 for c=c0=1, B=1/2
ck(2n>1n,"negative"); // reciprocal norm of rho=1/2 exceeds 1 without left separation
return counts;
};
console.log(test());
```

## Numbered remaining obligations
1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. Four generated TLiftK fields source-mapped with direct export roles, raw binder/type binding and independent replay open.
2. RecTExists/VWin and native host design: QDChoice, ThinChoice conditional (uniform prime bound reconstructed); NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor remain. Preserve common witnesses.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau and CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. Crystalline totality, forget-forms acyclicity, restriction, linearity/cup, full Hodge comparison and naturality remain. Divided-power derivation conditional.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. Adelic splitting not the whole topology compatibility.
6. Actual analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet (six-supplier assembly above, imported bounds open), PI.EF.explicitFormula_main and PI.ZW transfer, zero-density, Mertens, prime mean-square/count and window producers. Uniform ThinChoice bound reconstructed conditional on exact named suppliers; not proof of all analytic hypotheses.
7. Source/build/export correspondence, typed projection and independent kernel replay/axioms. Full exported mixed closure denominator 1,484,705 declarations; independently translated reachable numerator unknown. Prior 34 frontier report supplies all 34 owners with 146 type and 324 value records (peer integration). Do not identify type, value, package and recursor RHS roles. Raw scope run pending at peer snapshot.
8. Independent proof and citation audit, exact joins, root reachability, external trust boundaries. No defensible mathematical coverage percentage. Deadline missed; project OPEN.

Continuity: swarm protocol, queue, expansion, end-of-day spine, AGENTS, state/log/protocol/continuity excerpts, CI #406 (physics-only), prior volume and ten recent Markdown handoffs, plus audit script. External blueprint not reopened. No physics modifications. All eight primary peer chapters checked one representative pinned source blob independently against their ledgers, not full independent peer proof validation or regression replay; two support documents checked for snapshot blob and pin.

**RESUME HERE:** expand PI.EF.explicitFormula_main (native LocalLemmaOfHelpers import) or PI.ZW.zerosWindow_of_transfer/transfer; inspect exact definitions and recent handoffs first. Audit bot: check pt_zero_free endpoint/inverse transfer, reciprocal window signs and finite set conversion, exponent comparison and uniform quantifier order. Dependency bot: request authenticated role-labelled root paths for QH.psi_thin, pt_zero_free, pt_zero_sum, pt_core and native PI suppliers. Integration owns galoisLocalGlobal_of_geometry_lift; kernel owns raw TLiftK binders. HANDOFF TO all RH lanes.

## Peer inventory and verbatim appendices
1. [math/2026-11-25_conductor_change_level.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-25_conductor_change_level.md) — e1c4893cba193c31ff18608d9b58f44f3ba91113; representative source blob 4569ebb8e61f683a9c89877f0cda4d3add4d766d matched
2. [specialists/landau_criterion/RUN18_GAMMA_DERIVATIVES_AND_MELLIN_RESIDUES.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN18_GAMMA_DERIVATIVES_AND_MELLIN_RESIDUES.md) — c5de1a6eb6dff327e1989b3caf67a8e9f269c434; representative source blob 7e0a7df535eb6acffadb8c4d1e127aff39d36168 matched
3. [specialists/prime_window/RUN18_TYPE_PRIME_SIZE_REDUCTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN18_TYPE_PRIME_SIZE_REDUCTION.md) — 27a7b27c90164935eb97ef250e065be318349e10; representative source blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f matched
4. [integration/2026-11-25_0000_TLIFTK_GENERATED_TYPECLASS_BINDING.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-25_0000_TLIFTK_GENERATED_TYPECLASS_BINDING.md) — 86a75bea3f56612d2c5ffb4e290622690b23588e; representative source blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275 matched
5. [specialists/galois_representations/RUN18_FINITE_PROJECTOR_AND_TRACE_RECURRENCE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN18_FINITE_PROJECTOR_AND_TRACE_RECURRENCE.md) — ce0c5c734fd987907b443b2482488337026fa5e1; representative source blob 16b20806f1ac8d8097e95c843617b53ffec40953 matched
6. [specialists/character_boxes/RUN18_ADELIC_TENSOR_PRODUCT_SPLITTING.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN18_ADELIC_TENSOR_PRODUCT_SPLITTING.md) — 7a397f19b6eb351f20741dc2d7feaa7f9c41c452; representative source blob 6efcfa7fffd73e9509215b0a1f6b74eda90860b5 matched
7. [specialists/theta_lifts/RUN18_2026-11-25_holLeadB_assembly.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN18_2026-11-25_holLeadB_assembly.md) — 58195abf2fef508f310917552124eb279e4a00f6; representative source blob 485b1709704b6c3e5dfac0fd29aeb2f0de86f5ec matched
8. [specialists/literature_provenance/RUN18_DIAGONAL_RETRACTION_AND_PD_DERIVATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN18_DIAGONAL_RETRACTION_AND_PD_DERIVATION.md) — a33af1c71ad547b9b33a580133637ee52e305b6b; representative source blob 5f80de635aa0cf3a9c265f114a81124330e6948a matched
9. [specialists/kernel_extractor/RUN18_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/RUN18_RESUME.md) — ab59308284db0df4adb4358a60194a81c4217a49; supporting report
10. [specialists/on_acceleration/RUN18_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN18_RESUME.md) — f3a1f3f68cccc239a0e410b9fa9b23c4211eed16; supporting report

Additional audit and dependency scripts (linked, not counted): [askExp parity audit](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0048_askExp_prime_power_audit.mjs), [34-role reconciliation](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_34_role_path_reconciliation.mjs), [post34 frontier](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_post34_frontier.mjs), [dynamic signature](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1fedf6d844adfbc5f94ee62deea28ea9a1d28eb2/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0024_dynamic_signature_release.mjs). Navigation, not independently executed this run.

## Appendix 1: math/2026-11-25_conductor_change_level.md

# MATH lane — changing to a nonzero multiple preserves conductor

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of Mathlib `conductor_changeLevel` and its two exact uses
in RH `prim_mul`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source ledger

The RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem and its conductor-set, transitivity and injectivity suppliers |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | immediate consumer `prim_mul` |

At current RH head `9282d3a102c4aff0e6026746db2a8990f5d9cddd`, Mathlib is pinned instead to
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; the corresponding Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct comparison found the
`conductor_changeLevel` body unchanged. The current RH consumer blob
`4564722f96a5e2ca86092fb039e127a77a950c34` retains the same two calls. This is source-text
comparison, not elaborated-term equivalence.

## 1. Exact theorem and hypotheses

Let `R` be any type with `[CommMonoidWithZero R]`, let `n,m : Nat`, let
`chi : DirichletCharacter R n`, assume `[NeZero m]`, and let `hm : n|m`. Then

    conductor_changeLevel (hm) :
      conductor(changeLevel(hm,chi)) = conductor(chi).

There is no `Nontrivial R`, ring, field, primality or coprimality premise. The nonzero hypothesis is
on the **target level** `m`. Since `n|m` and `m!=0`, it follows that `n!=0`; the proof installs
`[NeZero n]` internally.

Write

    psi = changeLevel(hm,chi),
    c   = conductor(chi),
    C   = conductor(psi).

The proof establishes `C|c` and `c|C`, then applies divisibility antisymmetry.

## 2. Why conductor-set membership yields divisibility

The supplier `conductor_dvd_of_mem_conductorSet` says that at nonzero level, if a character factors
through `d`, then its conductor divides `d`. This is stronger than the bare fact that the conductor
is the numerical infimum of the conductor set: a numerical inequality alone would not imply
divisibility.

The source proves the stronger statement by showing the character also factors through
`gcd(d,c)`, where `c` is its conductor. The lower-level character at `d` and the primitive character
at `c` become equal after lifting to a common multiple; injectivity at a further nonzero level
justifies that equality. `factorsThrough_gcd` then supplies a character at `gcd(d,c)`. Minimality of
`c` gives `c<=gcd(d,c)`, while always `gcd(d,c)<=c`; hence `gcd(d,c)=c`, which is equivalent to
`c|d`. Membership also forces `d!=0`, so the injectivity invocation is legitimate.

This imported supplier is used twice below, once for each direction. No equality of formal levels is
substituted for its argument.

## 3. First direction: the lifted conductor divides the old conductor

The original character factors through its conductor:

    changeLevel(c|n, chi.primitiveCharacter) = chi.       (1)

Because `c|n|m`, the lifted character `psi` also factors through `c`, with the same lower-level
witness `chi.primitiveCharacter`. Indeed, `changeLevel_trans` and (1) give

    changeLevel(c|m, chi.primitiveCharacter)
      = changeLevel(n|m, changeLevel(c|n,chi.primitiveCharacter))
      = changeLevel(n|m,chi)
      = psi.

Thus `c` belongs to `psi.conductorSet`. Applying
`conductor_dvd_of_mem_conductorSet` to `psi` gives

    C | c.                                                (2)

This is the easy direction: a character already descending to level `c` continues to descend after
its formal level is enlarged.

## 4. Reverse direction: injectivity recovers the original character

From (2), `C|c`, and from `c|n`, so `C|n`. The candidate lower-level character is now

    psi.primitiveCharacter : DirichletCharacter R C.

To show that `chi` factors through `C`, the required equality at level `n` is

    chi = changeLevel(C|n, psi.primitiveCharacter).       (3)

The source does not assume (3). It applies `changeLevel_injective hm`, reducing (3) to equality
after lifting both sides from `n` to the nonzero level `m`.

The left lift is `psi` by definition. On the right, `changeLevel_trans` identifies the two-stage
lift `C -> n -> m` with the direct lift `C -> m`; by
`changeLevel_primitiveCharacter`, that direct lift is also `psi`. Therefore the two lifted
characters agree, and injectivity proves (3).

Consequently `C` belongs to `chi.conductorSet`, and the same conductor-set divisibility theorem
gives

    c | C.                                                (4)

Combining (2) and (4) proves `C=c`.

## 5. Why `changeLevel` is injective here

For `n|m` with `m!=0`, the unit map

    ZMod(m)^* -> ZMod(n)^*

is surjective (`ZMod.unitsMap_surjective`). If two lifted characters at level `m` agree, take any
unit `y` modulo `n`, choose a unit `z` modulo `m` mapping to it, and evaluate the lifted equality at
`z`. The definition of `changeLevel` then returns equality of the original characters at `y`.
`MulChar.ext_iff` says equality on all units is equality of multiplicative characters, including
their forced zeros on nonunits.

The target nonzero premise is essential. For the formal map from level `5` to level `0`, the target
unit group has only `+1` and `-1`; the order-four characters with exponents `1` and `3` agree on
both target units but are distinct modulo `5`. Thus the corresponding level-zero change map cannot
be injective.

## 6. Exact downstream link in `prim_mul`

The RH lemma has `[NeZero N]`, divisibilities `hm:m|N` and `hn:n|N`, and primitive characters
`chi1` at level `m` and `chi2` at level `n`. It defines their lifts

    A = changeLevel(hm,chi1),  B = changeLevel(hn,chi2).

The two calls

    rw [conductor_changeLevel]; exact h1
    rw [conductor_changeLevel]; exact h2

use the theorem above and the primitive hypotheses `h1:conductor(chi1)=m` and
`h2:conductor(chi2)=n` to obtain exactly

    conductor(A)=m,  conductor(B)=n.

These equalities feed the later inverse/LCM conductor argument. Merely knowing that `A` and `B`
have formal level `N` would not suffice and would generally be false as a conductor statement.

## 7. Comparison with the existing interpretation

Earlier MATH reports used `conductor_changeLevel` correctly but treated it as a one-line invariant.
The missing logical step was the reverse descent (3): it depends on injectivity after lifting to the
nonzero common level. The report now records the exact target-level hypothesis and explains why it
cannot be removed. It also distinguishes formal level from conductor; for example, a conductor-5
character lifted to level 55 still has conductor 5, not 55.

This contribution does not repeat the completed product-LCM, inverse-power, Jacobi evaluation or
Euclid arguments.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_change_level.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_change_level.py

Observed output:

    conductor changeLevel regression: OK; report_checks=9, character_checks=115, conductor_checks=230, fibre_checks=230, transitivity_checks=115, injectivity_checks=124, negative_controls=2

The exact finite model enumerates characters of small squarefree levels, represents values by exact
root-of-unity exponents, and recovers conductors solely from unit-fibre constancy. It checks
conductor equality before and after lifts, both factor-through memberships, transitivity and
injectivity. The level-zero collision and formal-level/conductor confusion are negative controls.

This is an independently checkable finite regression, not a proof over arbitrary targets, a Lean
kernel replay, or an axiom audit.

## Failed attempts / limitations

- The inequality `C|c` alone does not prove equality; the reverse factor-through construction and
  injectivity are indispensable.
- Treating the conductor as merely the least natural in the set gives `c<=d`, not automatically
  `c|d`; the gcd closure argument in `conductor_dvd_of_mem_conductorSet` supplies divisibility.
- Dropping `[NeZero m]` invalidates injectivity, as the level-5 to level-0 collision demonstrates.
- Confusing the lifted formal level with its conductor produces false equalities such as `55=5`.
- The finite checker uses squarefree products of small odd primes. It does not establish the
  universal theorem or replace the pinned Lean proof term.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `mem_conductorSet_iff_conductor_dvd` from
`conductor_dvd_of_mem_conductorSet` and `FactorsThrough.mono`, including the exact nonzero-level
hypothesis and the upward-closure argument used by the power and product conductor theorems.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.



## Appendix 2: specialists/landau_criterion/RUN18_GAMMA_DERIVATIVES_AND_MELLIN_RESIDUES.md

# RUN18 — Gamma derivatives and the Mellin residue normalization
2026-11-25. SOURCE-MATCHED human reconstruction of imported analytical leaves; local exact rational regression executed. Project OPEN; no independent Lean replay or URT performance claim.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity/state/log/protocol excerpts, physics-only CI #404 (00:09:32Z), previous RUN17 and recent peer commit titles and available RESUME HERE notes (prime, dependency, kernel, acceleration, integration, editor, geometry, audit, literature, character boxes, math, Galois, theta, structure). No duplicate of this leaf found in inspected records. Not all peer full files or the linked external blueprint were reopened. No changes to physics queue or gates.
RH repository leanprover-community/riemann-hypothesis: P=40e56bab026552e089d7afcfeff08d2defb9c005; H=b2f365a68500e2bde98cd60a2324263fc62fba10 (fresh listing, advanced from RUN17 H=9282d3a102c4aff0e6026746db2a8990f5d9cddd). Both lake-manifest.json retrieved (blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f / 8a747b58a34565cc6cb5341b86544aa5d3a20a2d), Mathlib pins unchanged from RUN17: Pm=0df444a360eaa60ab8c11dca51a86af692955474; Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. All five files fetched at both pins. GitHub-reported blob hashes, not independently rehashed:
- Mathlib/NumberTheory/Harmonic/GammaDeriv.lean: 7e0a7df535eb6acffadb8c4d1e127aff39d36168 / c4b1542df4eb756fbc9f8c33607fffb9634f29a1.
- Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean: cdfc0cd73853362d49bdced80cff5b522f4566cd / 477da91b5d33fd1b59f6ab3d6dbdae55b356ed9d.
- Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean: 612bc27a5af0f7c696a7ed1a4a84f67b3d91979e / a28d2f37bd009275432130b5be2df6e68435760e.
- Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean: ada6574d2ed7e3d0b1122376c3bb8581f6385a1d / 26754c1f2894ba79f8fa729dc18e1f0fc0189997.
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean: e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f.
15 selected source blocks compared by exact string equality, all identical: GammaDeriv Pm 32–84,87–90,92–94,96–98,100–146,154–159,168–172,184–191 (Hm 31–83,86–89,91–93,105–107,109–155,163–168,177–181,193–200); AbstractFuncEq Pm431–444,447–458 (Hm+2); HurwitzZetaEven Pm454–460,621–628 (Hm+2); BohrMollerup111–120,447–452 (same lines); Beta597–601 (Hm615–619). This is textual equality, not kernel equality. Hm GammaDeriv adds two integral representations of Euler's constant (95–103), not used by these existing proofs. No global upstream equivalence claimed.

## 1. Gamma derivative at positive integers
Source Real.deriv_Gamma_nat, hasDerivAt_Gamma_nat, hasDerivAt_Gamma_one (GammaDeriv Pm32–98). Set f(x)=log Gamma(x) for x>0. Gamma is positive and differentiable there because x is not a nonpositive integer. Gamma(x+1)=x Gamma(x) implies f(x+1)=f(x)+log x; differentiate on the open positive domain (so local equality, not merely equality at one point):
 f'(x+1)=f'(x)+1/x.
Induct from n=0, H_0=0: f'(n+1)=f'(1)+H_n, H_n=sum_{j=1}^n 1/j.
Convexity supplier BohrMollerup111–120: for x,y>0 and 0<a,b<1, a+b=1, the integral Gamma(ax+by) is integral of [e^-t t^(x-1)]^a [e^-t t^(y-1)]^b on t>0. Holder with p=1/a,q=1/b (finite, >1) gives <=Gamma(x)^a Gamma(y)^b; integrability follows from positive x,y. Take increasing log of positive quantities; endpoints a=0 or b=0 are equality. Native Holder construction Pm70–110. No assertion of log convexity on negative reals.
Convexity secant inequalities at n+1 give log n <= f'(n+1) <= log(n+1), n>=1 (the upper inequality also valid n=0). Substitute recurrence:
 H_n-log(n+1) <= -f'(1) <= H_n-log n.
Both endpoints converge to gamma by the defining harmonic limit and log(1+1/n)->0. Hence f'(1)=-gamma. Chain rule f'=Gamma'/Gamma and Gamma(n+1)=n! give Gamma'(n+1)=n!(H_n-gamma), in particular Gamma'(1)=-gamma. This is a squeeze proof, no zeta nonvanishing or RH invoked. Quantitative width log(1+1/n)<1/n follows by integrating 1/x on [n,n+1]. The finite bracket is an additional explicit error control, not a new theorem in number theory.

## 2. Gamma derivative at one half and complex upgrade
GammaDeriv Pm100–146 uses product rule on Legendre duplication (Real.Gamma_mul_Gamma_add_half, Beta597–601, obtained by complexification). Its positive-real supplier BohrMollerup447–452 is sufficient locally. For x>0 write psi=Gamma'/Gamma, take logs of the positive factors of
 Gamma(x) Gamma(x+1/2)=sqrt(pi) 2^(1-2x) Gamma(2x).
Differentiation gives psi(x)+psi(x+1/2)=2psi(2x)-2log2. At x=1/2 this reduces to psi(1/2)=psi(1)-2log2=-gamma-2log2. Since Gamma(1/2)=sqrt(pi)>0, Gamma'(1/2)=-sqrt(pi)(gamma+2log2).
This logarithmic argument compresses the native product-rule algebra, introduces no new premises, and is valid locally because all arguments stay positive. The positive-real duplication proof uses Bohr-Mollerup uniqueness (the normalized positive log-convex doubling function obeys the same recurrence); the full complex extension uses entire inverse Gamma and identity theorem, not division at poles. Those supplier proofs are not fully expanded here.
GammaDeriv Pm154–159,168–172,184–191: the complex Gamma is holomorphic at each indicated positive real argument, coincides with real Gamma on the real axis (Gamma_ofReal); its derivative equals the real derivative by restriction along the real direction, since the complex derivative is unique and already exists. A real derivative alone would not prove complex differentiability.
Then G(s)=Gamma_R(s)=pi^(-s/2)Gamma(s/2), G(1)=1. The product and chain rules give G'(1)=-(gamma+log(4*pi))/2, as RUN17. Dependency direction: positive-real gamma recurrence+convexity -> Gamma'(1) -> duplication -> Gamma'(1/2) -> complex derivative -> G'(1) -> zeta totalized value. No circular use of that value.

## 3. WeakFEPair residue, including the two distinct poles
Source AbstractFuncEq Pm f_modif 242–246, f_modif_aux2 337ff, Lambda0/Lambda 376–379, differentiable_Lambda0 388–389, Lambda_residue_k 431–444, Lambda_residue_zero 447ff. Let E be the complete complex normed space of the native Mellin context, k>0 real, eps nonzero complex, f0,g0 in E. Weak FE pair requires local integrability on (0,infty), rapid power decay of f-f0 and g-g0 at infinity (all real powers), and f(1/x)=eps*x^k*g(x) for x>0. Define modified f as f-f0 for x>1, f-eps*x^-k*g0 for 0<x<1, zero at x=1 (and outside the positive domain). Functional equation supplies rapid decay at zero after subtraction: f(x)-eps*x^-k*g0=eps*x^-k*(g(1/x)-g0). The two endpoint bounds and local integrability make Mellin transform Lambda0(s)=integral_0^infty x^(s-1) f_modif(x) dx entire (native strong FE Mellin theorem, itself still an imported analytic supplier). On Re(s)>k>0, subtraction term integrated on (0,1) is f0/s-eps*g0/(s-k); singleton x=1 has measure zero. Therefore the meromorphic continuation is
 Lambda(s)=Lambda0(s)-f0/s-eps*g0/(k-s).
For s!=k near k, also s!=0 since k>0, so
 (s-k)Lambda(s)=(s-k)(Lambda0(s)-f0/s)+eps*g0 -> eps*g0.
At s!=0 near 0, k-s stays nonzero and s Lambda(s)=s(Lambda0(s)-eps*g0/(k-s))-f0 -> -f0.
Scalar multiplication intended for vector E. The punctured limits, not assigned values, define residues. k>0 separates poles; if k=0, f0=g0=eps=1, Lambda0=0, terms cancel identically and the claimed independent residues fail. If g0=0 then the k residue is zero, and there need not be a pole at k.

## 4. Exact Hurwitz scaling
HurwitzZetaEven Pm254–276 constructs P_a from evenKernel and cosKernel on the positive domain, a in UnitAddCircle. Native fields: k=1/2, eps=1, f0=c_a=1 if a=0 else 0, g0=1; local integrability from continuity, rapid decay from exponential kernel bounds, functional equation from evenKernel_functional_equation. These theta kernel suppliers remain to be expanded, not assumed consequences of RH. Pm297–313 defines completed L_a(s)=Lambda(s/2)/2, E_a(s)=Lambda0(s/2)/2; hence
 L_a(s)=E_a(s)-c_a/s-1/(1-s).
At s=1, (s-1)L_a(s)=(s/2-1/2)Lambda(s/2)->1, since s->s/2 maps punctured neighborhoods bijectively. At 0, s L_a(s)=(s/2)Lambda(s/2)->-c_a. This exactly matches Pm454–468. Omitting the external factor 1/2 would double both residues. Dividing by G(s) near 1, where inverse G is holomorphic and G(1)=1, yields residue 1 for uncompleted Hurwitz zeta (Pm621–628). The special definition/update at s=0 is avoided by restricting to a neighborhood of 1 disjoint from 0. a=0 gives Riemann zeta. This justifies RUN17's residue premise independently of the harmonic asymptotic limit; no assumption about zeros, real exceptional zeros, or arithmetic window. Retain 0<theta<1, delta>0 and positive real-pole residues in the separate conditional Landau theorem; this imported lemma neither uses nor relaxes those requirements.

## 5. Reproducible finite regression
Exact BigInt fractions; atanh expansion log((n+1)/n)=2 sum_{j>=0} t^(2j+1)/(2j+1), t=1/(2n+1). Truncating after m terms has positive tail bounded by 2 t^(2m+1)/((2m+1)(1-t^2)). The interval arithmetic encloses H_n-log(n+1) and H_n-log n, hence gamma given the analytical squeeze above. Other tests check duplication coefficients and residue/scaling algebra in rational scalar specializations, not the analytic premises or actual zeros. Run the following with Node; it was actually executed in JS in this session:
```js
function certificate(){
 const abs=x=>x<0n?-x:x;
 const gcd=(a,b)=>{a=abs(a);b=abs(b);while(b){[a,b]=[b,a%b]}return a};
 const q=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);if(!b)throw Error("zero denominator");if(b<0n){a=-a;b=-b}const g=gcd(a,b);return [a/g,b/g]};
 const add=(a,b)=>q(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),neg=a=>q(-a[0],a[1]),sub=(a,b)=>add(a,neg(b)),mul=(a,b)=>q(a[0]*b[0],a[1]*b[1]),div=(a,b)=>q(a[0]*b[1],a[1]*b[0]),cmp=(a,b)=>{let v=a[0]*b[1]-b[0]*a[1];return v<0n?-1:v>0n?1:0};
 const must=x=>{if(!x)throw Error("certificate failed")};
 const logRatio=(n,m)=>{let t=q(1,2*n+1),t2=mul(t,t),p=t,L=q(0);for(let j=0;j<m;j++){L=add(L,div(mul(q(2),p),q(2*j+1)));p=mul(p,t2)}return [L,add(L,div(mul(q(2),p),mul(q(2*m+1),sub(q(1),t2))))]};
 let H=q(0),logL=q(0),logU=q(0),count=0,prevL=q(-1),prevU=q(2),last;
 for(let n=1;n<=64;n++){H=add(H,q(1,n));const [l,u]=logRatio(n,8);
  must(cmp(q(1,n+1),l)<0&&cmp(u,q(1,n))<0);count++;
  const lo=sub(H,add(logU,u)),hi=sub(H,logL);
  must(cmp(lo,hi)<0&&cmp(lo,prevL)>0&&cmp(hi,prevU)<0);count++;
  must(cmp(sub(hi,lo),q(2,n))<0);count++;
  last=[lo,hi];prevL=lo;prevU=hi;logL=add(logL,l);logU=add(logU,u);
 }
 must(cmp(last[0],q(56,100))>0&&cmp(last[1],q(59,100))<0);count++;
 // Log derivative duplication coefficients in basis (gamma, log 2).
 let dup=0;
 for(let g=-5;g<=5;g++)for(let l=-5;l<=5;l++){let a=-g,b=-g-2*l;must(b+a===2*a-2*l);dup++}
 // Abstract residue identity with rational scalar examples.
 let res=0,scale=0;
 for(let k=1;k<=8;k++)for(let j=-8;j<=8;j++)for(let e=-3;e<=3;e++)for(let f=-2;f<=2;f++)for(let g=-2;g<=2;g++){
   const K=q(k,2),s=q(j,3);if(cmp(s,K)===0||s[0]===0n||e===0)continue;
   const h=q(j*j+1,5),F=q(f),G=q(g),E=q(e),d=sub(s,K);
   const lambda=sub(sub(h,div(F,s)),div(mul(E,G),sub(K,s)));
   must(cmp(mul(d,lambda),add(mul(d,sub(h,div(F,s))),mul(E,G)))===0);res++;
 }
 for(let j=-10;j<=10;j++)for(let c=0;c<=1;c++){const s=q(j,3);if(s[0]===0n||cmp(s,q(1))===0)continue;const t=div(s,q(2)),h=q(j+7,3);const L=sub(sub(h,div(q(c),t)),div(q(1),sub(q(1,2),t)));must(cmp(div(L,q(2)),sub(sub(div(h,q(2)),div(q(c),s)),div(q(1),sub(q(1),s))))===0);scale++}
 // Negative controls: swapped residue sign, missing external 1/2, coincident poles k=0.
 must(cmp(q(1),q(-1))!==0);
 must(cmp(q(1),q(2))!==0);
 // At k=0, f0=g0=epsilon=1, h=0; -1/s -1/(0-s)=0.
 must(cmp(sub(neg(div(q(1),q(2))),div(q(1),q(-2))),q(0))===0);
 return {harmonic_interval_checks:count,duplication_coefficient_checks:dup,residue_identity_checks:res,hurwitz_scaling_checks:scale,negative_controls:3,total:count+dup+res+scale,certified_gamma_interval:"0.56 < gamma < 0.59"};
}
console.log(JSON.stringify(certificate()));
```
Actual output: `{"harmonic_interval_checks":193,"duplication_coefficient_checks":121,"residue_identity_checks":18900,"hurwitz_scaling_checks":38,"negative_controls":3,"total":19252,"certified_gamma_interval":"0.56 < gamma < 0.59"}`. Negative controls are explicit algebraic mutations/counterexample; not an independent Lean checker.

## RESUME HERE
Expand the native WeakFEPair strong-pair construction (hf_modif_FE and endpoint power decay) and the Jacobi evenKernel/cosKernel bounds and functional equation used by hurwitzEvenFEPair. Preserve the local-integrability and all-real-power quantifiers and distinguish the a=0 constant from a!=0. Request authenticated role-labelled root paths for GammaDeriv, WeakFEPair.Lambda_residue_k, completedHurwitzZetaEven_residue_one and all earlier Landau window/pole declarations; source references alone do not establish actual root reachability. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime.



## Appendix 3: specialists/prime_window/RUN18_TYPE_PRIME_SIZE_REDUCTION.md

# RUN18 — TypePrimeSizeConds and reduced admission equivalence
2026-11-25. RESULT: SOURCE-MATCHED / independent human proof; exact finite V8 regression executed. The actual native constructor of AdmF and root reachability remain PARTIAL. No Lean replay or URT improvement.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = b2f365a68500e2bde98cd60a2324263fc62fba10 (upstream commits head at inspection; compare API says 204 commits ahead of RUN17 head 9282d3a102c4aff0e6026746db2a8990f5d9cddd). No cross-version implication between the two differently defined admission predicates.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN16/17, research-state/log/protocol/continuity excerpts and CI summary #404 (00:09:32Z, 45512681764; physical checks, not RH). Inspected latest 25 working-branch commit subjects and six peer commit diffs, including dependency/kernel/integration/editor/audit/Landau. Read prime lane and dependency directory indices. None of the inspected checkpoints duplicates this TypePrimeSizeConds derivation. Other peer full notes and blueprint PDF not reopened. No physics changes. Direct GitHub code-search API returned zero for TypePrimeSizeConds, AdmFam, AuxBlock8.AdmF; absence of hits is not proof of absence of a caller. Fall back to the explicit next conjunct in RUN17's handoff rather than claiming a native constructor.

## Pinned sources
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ .
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L232–244: AuxBlock8.TypePrimeSizeConds and admitted. AdmF L256–260.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52: szTh L11; SizeM L27–29; SizeLa L68; SizeDel L105–113 (specifically conjuncts 1,4,7); SizeW L115; SizesAt L134–138 (24 conjuncts, no weakening).
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b: Scale L9–17, L/b/a/X'/b'/w'' L27–39; SizeData₂.Sc_pos and Sc_eq L144–148.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b: hG L37, N1 L43, Nm L49, La L58. In particular G.La(K,s) is NOT SizeData₂.LaG or SizeData₂.La.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec: orbitWindowCount L247–248.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043: St.cGE/cNE L38–40, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six L136–142, one_le_k L144–146.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6: FamP.sizes L44, GK_nonneg L55; no displayed strict GK.La field.
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3: Win_unb/Ix_win/L_x/L_eps L79–85; **FamCore.exists_pt already exists at P L138–142**, correcting RUN17's claim that this was introduced at H. This is a provenance correction, not a change to its proof.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0: Pf.AdmFam L156–159.

## Theorem 1: the entire native type-prime size predicate is eventually equivalent to strict positivity of the fixed coefficient
Fix epsilon, Fm:FamP epsilon, and K:G.Consts, fixed before the family variable x. No assumption on K besides the positivity on the right is needed for this equivalence:
  (exists T>1, forall x>=T, forall i:Fm.Ix x, TypePrimeSizeConds (Fm.D x i) (Fm.L x i) K) iff K.La>0.
The native predicate at one instance is SizesAt L AND 4*Sc <= La(K,s)*b'/k AND Nm+1 <= w''(n). Keep every native field in SizesAt. The proof below supplies the latter two bounds rather than deleting them.

Write x=s.x>1, e=s.eps>0, E=x^e, q=x^(e/100)>0, k=D.R.k, m=D.R.m, N=Nm(D)=D.R.N(m) (natural cast), d=D.s.Del (cast), B=s.b'>0, W=s.w''(D.R.n), G=L.LaG, c=K.La. Scale gives b=exp(E)>1, a=x*b>1, log a=log x+E, X'=exp(x^(e/3))>0 and B=a/X'>0. St.one_le_k gives k>=1. SizeM implies m>0 because x^(-e/100)*sqrt(x*delta1)>0, hence natural m>=1. SizeLa gives E<=G<=Eq. Sc=4kd>0. SizeDel includes:
  N*m^10<=d,
  k*Sc<=W,
  4*q*k^2*d<=G*B.
SizeW gives sqrt(b)<=W. These are the only extra inequalities needed from SizesAt for the two numeric conjuncts.

### Lower bound on the native logarithmic count
Unfold N1=orbitWindowCount(rG,delta1,hG,x). Since the ceiling of a nonnegative maximum dominates that maximum, and the maximum dominates its second argument,
  N1 >= (hG+3)*log_2 x >= log_2 x
because hG=2+8e and x>1. Thus N1>=1 also follows directly from the natural-ceiling-plus-one formula.
If c>0, choose a natural M>=1 with c*M^2>=4 (e.g. max(1,ceil(2/sqrt c))). Whenever x>=2^M,
  La=c*N1^2*log a >= c*M^2*E >=4E.
The choice M depends only on the fixed c, not i or epsilon or primes. This is a sufficient threshold, not an optimized one.

### Cloud-size conjunct
Use the stronger SizeDel conjunct 7, not the weaker conjunct 6:
  4*q*k^2*d <= G*B <= E*q*B.
Cancel q>0, then multiply by 4:
  4*Sc*k = 16*k^2*d <= 4E*B <= La*B.
Divide by k>0 to get exactly 4*Sc<=La*B/k. This avoids the incorrect substitution G=La and does not require comparing their full asymptotic expansions.

### Thin-window conjunct
From m>=1 and N>=0, N<=N*m^10<=d. Hence
  W>=k*Sc=4*k^2*d>=4N.
When N>=1 (a natural cast), 4N>=N+1. If N=0, SizeW gives W>=sqrt(exp(E))>1, so again W>=N+1. This argument uses no unverified integrality of d.

### Family uniformity and converse
Choose T=max(2^M,Fm.x1+1,2). Fm.sizes and Fm.L_x apply at every x>=T and every i. The foregoing pointwise proof gives the exact predicate uniformly. Conversely, if eventual TypePrimeSizeConds holds, FamCore.exists_pt at the claimed T gives a genuine i with x>=T and x>Fm.x1. Its Sc>0, B>0 and k>0 force La>0 from the cloud inequality. Since N1>=1 and log a>0, c>0. No vacuous tail, no requirement that every fibre be nonempty.

## Theorem 2: reduce the full admission obligation, preserving equivalence
Fix Fm,K,X,Y,C31,Ce,Cm before quantifying over delta. Let R_P be the conjunction of the following ten pinned predicates:
  adm1(C31), adm2, adm3, ArchimedeanSignatureMatching, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1.
All are independent of A.delta by their displayed arguments in admitted. Write Eventual(R) := exists T>1, forall x>=T, forall i, R at the native instance.
Then at P:
  Pf.AdmFam(Fm,K,X,Y,C31,Ce,Cm) iff (K.La>0 AND Eventual(R_P)).
Forward: specialize delta=1, project the ten predicates and TypePrimeSizeConds, and apply Theorem 1's nonvacuous converse. Reverse: fix arbitrary delta>0. From RUN16/17's direct adm5 estimates, fixed c>0 and native SizesAt supply a uniform T5(delta). The estimates are log Qp<=38*cGE*ell^2*x^(e/8) for p<p0 and <=cGE*ell*x^(11e/24) for p<X'; La is between c*x^e and 2*c*cNE^2*ell^2*x^e for large x. With h=delta/4, log x=integral_1^x dt/t <= (x^h-1)/h <= x^h/h, sufficient thresholds are x^(delta/2)>=608*cGE/delta^2, x^(3delta/4)>=4*cGE/delta, x^(delta/2)>=32*c*cNE^2/delta^2, x^delta>=1/c, and x^(e/2)>=2/e. Choose the maximum with e-base exp(1), Fm.x1+1, the threshold of R_P and the TypePrimeSizeConds threshold from Theorem 1. Every native admission conjunct then holds at every x>=that maximum, every i, and the two strict prime ranges remain unchanged. This is a human derivation using source theorem statements, not an elaborated Lean proof.
For AdmF the existential C31>0, Ce>=0, Cm>=0 stays outside all thresholds. No claim that the ten residual predicates or positivity are already supplied by an actual native family. This is a reduction of proof obligations via explicit implication, not erasure of any source hypothesis.

## Upstream drift check
At H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L224–236 and L241–245: TypePrimeSizeConds identical, but admitted drops adm2 and adm3. Theorem 2 holds separately at H with its eight residual conjuncts (not a proof of P from H).
H ElevenLe blob d50ba186f15218ca02e6325933f7a35280ec9ea8 L51,67–69,108,145–153,155,174–178: six corresponding definitions textually identical. H DataParams₂ blob 3d693d76e763b7b9d7c5679c223ac91cc92692 L69–81,188–190: six scale definitions identical and Sc fields unchanged. H IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 L75,81,87,96: four definitions identical. H UnramifiedQuadraticSetting blob 26de9f0d204e2e8f94a78c9154dea3a6b63e4936 L296–297: orbitWindowCount identical. H StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L91–94,110–146,147–188,189–196,197–200: six migrated blocks cGE,cNE,Gp_le,first_count_le_log,k_le_x_pow_six,one_le_k textually identical to P StarNum (trimmed outer whitespace). H ParConsts blob fc2f52e63147d43cf955a6d46e40c8ba4d975399 L78,89; FamCore blob 8896ac9d04495274664eafac6935ce3457655f6b L91–97,150–154; AdmFam blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8 L173–176: required fields and quantifier scopes preserved. No full upstream diff/kernel dependency replay.

## Exact executable finite regression (Node/V8)
The integer envelopes represent inequalities, not native D7 objects or a proof of asymptotics. The thin test includes zero N and a lower W>=2 proxy for W>1. The propositional test models already-established eventual suppliers, not pointwise truth tables of actual Lean predicates. Four negative witnesses address weakened cloud bound, c=0, empty fibre, and missing zero-N lower W.
```js
const counts={threshold:0,cloud:0,thin:0,logic:0,negative:0};
const ck=(ok,k)=>{if(!ok)throw Error(k);counts[k]++};
for(let a=1n;a<=12n;a++)for(let b=1n;b<=12n;b++){
  let M=1n;while(a*M*M<4n*b)M++;
  for(let N=M;N<=M+5n;N++)for(let E=1n;E<=6n;E++){
    const ell=1n+N, laNum=a*N*N*(E+ell);
    ck(a*N*N>=4n*b&&laNum>=4n*b*E,"threshold");
    for(let S=1n;S<=4n;S++)for(let k=1n;k<=4n;k++)for(let D=1n;D<=4n;D++){
      const sc=4n*k*D, G=E*S, B=(4n*S*k*k*D+G-1n)/G;
      ck(G<=E*S&&4n*S*k*k*D<=G*B&&4n*sc*k<=4n*E*B&&4n*sc*k*b<=laNum*B,"cloud");
    }
  }
}
for(let m=1n;m<=8n;m++)for(let k=1n;k<=8n;k++)for(let n=0n;n<=12n;n++)for(let u=0n;u<=5n;u++){
  const D=n*m**10n+u, w=4n*k*k*D>2n?4n*k*k*D:2n;
  ck(n<=D&&4n*n<=w&&n+1n<=w,"thin");
}
for(const n of [10,8])for(let mask=0;mask<(1<<n);mask++)for(const pos of [false,true]){
  const rest=mask===(1<<n)-1;
  const adm5=pos, type=pos;
  ck((rest&&adm5&&type)===(pos&&rest),"logic");
}
ck(4n*20n<=10n*8n&&4n*10n*5n>10n*8n&&4n*20n>4n*8n,"negative");
ck(0n*1n<4n*1n,"negative");
ck([].every(()=>false),"negative");
ck(1n>0n&&4n*0n<0n+1n,"negative");
console.log(counts);
```
Actual execution: {"threshold":5184,"cloud":331776,"thin":4992,"logic":2560,"negative":4}. 344512 positive assertions + 4 negative witness assertions. No CI or Lean kernel validation of this note.

## RESUME HERE
Authenticate the actual typed incoming caller of Pf.AdmFam/AdmF and the fixed GK.La supplier (root path or explicit nonreachability, not import-based inference). If unavailable, independently derive ArchimedeanSignatureMatching's rho/rhoB and two band sums using FamP.rho_le, exact CbLarge and integer-power counting; do not assume K.CN is large enough or replace strict guards. Audit Theorems 1–2 independently, including the c>0 necessity, strengthened SizeDel use, zero-N case and threshold quantifiers, and update integrated chapter if accepted.
HANDOFF TO audit, dependencies, kernel, integration, editor, prime_window. Project OPEN.



## Appendix 4: integration/2026-11-25_0000_TLIFTK_GENERATED_TYPECLASS_BINDING.md

# TLiftK generated obligations: source and export-role binding — integration 00:00
2026-11-25. RESULT: PARTIAL / SOURCE-MATCHED mathematical reconstruction with authenticated direct reference evidence. One contribution: join the four formerly unexpanded generated proof owners to their pinned mathematical suppliers, retaining exact role slots and original statement. Not an exact raw type pretty-print, kernel replay or full RH proof.

## Evidence and reading order
RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream observed 82c577caf1b8a66c76212d78a399234f55813d28 (2026-11-24 23:53:24 UTC), not adopted. Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474 from pinned lake-manifest.json. Working head observed 8e5ce707b458e819577700acc4e332732f21dedd. Prior integration 2110dc7ad48a142ebd843262588b9627b8e0fcb2, selected frontier 34. New dependency job 45508109328 PASS: 34/34 owners, 146 type and 324 value reference records, no unresolved requests, 1412 expression reads. This is projection, not kernel replay. Report blob deabbd86afc8f21d9897ba3bb74349178517fde3 (peer SHA256 3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd); earlier owner report d823c364f446f5066dbbc61f7e9cf9c891fcbdb2. Both from authenticated solution digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e. [Job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45508109328).
Latest editor volume 14: [2026-11-24_2356_INTEGRATED_MANUSCRIPT.md](../specialists/proof_editor/2026-11-24_2356_INTEGRATED_MANUSCRIPT.md) blob e479bb14dbf87c90312ee7974d08fef2f55a22ac, links all preceding volumes. 169 primary + 14 supporting entries, not unique theorem coverage. Attach this chapter to its TLiftK/GeoOne root join (volume 1). Prior 34-target concordance remains evidence, not replaced. Four selected owners now have both role projections and source-supported supplier meanings; zero counted as independently replayed. All other 30 have newly projected roles but not translated by this contribution.

## Human mathematical argument
Let E be a field with NumberField E and IsCMField E, and F=maximalRealSubfield E. This is a subfield, not an arbitrary subring. The four generated theorems are not four additional substantive theta-lift assertions. The source and role evidence identifies the following typeclass infrastructure:
1. NumberField F: characteristic zero descends under the injective subfield inclusion; F is a Q-vector subspace of the finite-dimensional Q-space E and is therefore finite dimensional. Basic.lean:43–46,78–79 supplies NumberField.of_subfield by FiniteDimensional.left. The type references NumberField and maximalRealSubfield; value references of_subfield. The finite-dimensionality step does not need CM, though the original TLiftK still requires it.
2. IsDedekindDomain O_F: O_F is the integral closure of Z in F. Since F/Q is finite and characteristic zero (hence separable), the integral-closure theorem over the Dedekind domain Z gives the Dedekind-domain instance. Basic.lean:297–317 calls IsIntegralClosure.isDedekindDomain Z Q F. This is an application, not a reconstruction of that imported theorem. The generated body references the actual instance and NumberField.of_subfield.
3. IsFractionRing O_F F: every x in F is algebraic over Q. Write its monic polynomial x^m+sum a_i x^i=0, a_i rational. Choose a positive integer D clearing denominators of all a_i. Then y=Dx satisfies y^m+sum (D^(m-i) a_i)y^i=0 with integer coefficients, since m-i>=1. Thus y in O_F and x=y/D, D nonzero in characteristic zero. The inclusion O_F -> F is injective and all nonzero elements become units, so F is the fraction field. Native Basic.lean:277–278 invokes integralClosure.isFractionRing_of_finite_extension Q. This is a human derivation of the mathematical statement, not expansion of the imported Lean implementation.
4. The commuting scalar action: for a commutative semiring R and a semiring A equipped with Algebra R A, r acting on a*b equals (algebraMap r)*(a*b) = (a*algebraMap r)*b = a*(r acting on b). This proves SMulCommClass R A A with the native scalar actions; centrality, not commutativity of all A, is essential. Algebra/Basic.lean:420–434 gives the native producer. The export type mentions AF, NumberField.AdeleRing, instAlgebraAdeleRing and all three preceding generated proofs. The value mentions Algebra.to_smulCommClass and the native adele algebra. The likely exact specialization is R=F, A=AF F; Mathlib AdeleRing.lean:46–48 constructs the adele ring with Dedekind-domain, fraction-field and algebra assumptions and derives Algebra F. Exact AF alias definition and ordered raw binder/application tree have not been retrieved; do not present this specialization as a verbatim elaborated type. Source TLiftK:18–19 contains both identical Units.map ranges with AF F; precise generated occurrence binding requires raw expressions, not guessing from source order.

The original definition (HalfIndexLattices/TLiftK.lean:12–23) quantifies over every E, its field/number-field/CM instances, B:Base F E, and W.GoodK(cj E) B. For every natural n>=1 and X:Spc F E n satisfying X.J=1 and X.IsHerm(cj E) B n 0, there is a natural d0 such that for every d>=d0, W:Spc F E d and delta:E satisfying W.J=delta times I and W.IsSkew(cj E) B d 0, for every pair chiX,chiW:Chr F E and integer-valued infinite-place exponent functions mX,mW, assume both IsHecke, both ResEtaPow on the exact Units.map(algebraMap F (AF F)).toMonoidHom range (powers n,d respectively), and HasExp B.emb for each. For every complex submodule U of functions on UA E n and family lam of dominant weights at infinite places of F, assume IsAutRepU U, HasWeightAt U (B.emb w).1 (lam w) for every w, and d+mW(w)<=2*(lam w).w(k) for every w,k. Then there exists a complex submodule U' of functions on UA E d with IsLift B chiX chiW mX mW lam U U'. The four infrastructure proofs do not discharge this existential lift. The separate ThetaKernels/TLiftK.lean:4–5 theorem uses tLift_holds_k. All previous substantive theta and Galois obligations, imported axiom dependencies and full raw source-to-export equivalence remain open.

## Source ledger
- 40e56bab026552e089d7afcfeff08d2defb9c005 src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean — blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275
- 40e56bab026552e089d7afcfeff08d2defb9c005 src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/ThetaKernels/TLiftK.lean — blob e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/NumberTheory/NumberField/Basic.lean — blob 241f20aa14f5f0bc718a147831e2d71bb520eea0
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/NumberTheory/NumberField/AdeleRing.lean — blob c88b4583107e9e07477a23531bb717a45c27b11d
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/Algebra/Algebra/Basic.lean — blob 81ec13d6fbf7c0290de4312d704db572f52c7171
The original source and Mathlib files were retrieved from exact revisions; connector blob IDs matched 5/5. No independent raw-byte hashing in V8. Failed attempts: root-level runner log/protocol 404 (corrected actual paths), GitHub current code search TLiftK returned incomplete zero hits (not evidence of absence), two guessed AF namespace-as-path files/directories 404, guessed Mathlib RingOfIntegers.lean 404 (actual instances in Basic.lean). Raw expression payload for four new owners not retrieved; no Lean execution, no source-to-export equivalence or exact elaborated statement claim. Native CLI below checks exact byte hashes before running the executed pure verifier. General Cathedral CI #403 PASS 23:49:53 UTC, run 45510487903, unrelated to RH proof. New commit CI not yet checked.

## Typed proof-obligation delta
Preserve complete selected records (including type/body root, all reference witnesses, role multiplicities, metadata and incoming root paths). All 4 records remain OPEN for raw type and independent replay. No transitive premises removed. Full 34-owner report remains upstream, no omission inferred.
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "mathlibPin": "0df444a360eaa60ab8c11dca51a86af692955474",
  "reportHashes": [
    "d823c364f446f5066dbbc61f7e9cf9c891fcbdb2",
    "deabbd86afc8f21d9897ba3bb74349178517fde3"
  ],
  "reportPaths": [
    "compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json",
    "compute/rh-34-producer-frontier-20261124/outputs/solution_34_producer_frontier.json"
  ],
  "root": 14065054,
  "owner": 13125905,
  "status": "PARTIAL_SOURCE_ROLE_BINDING",
  "checks": 385,
  "negativeControls": 7,
  "roleCounts": {
    "type": 69,
    "value": 53
  },
  "selected": [
    {
      "id": 13125906,
      "n": 1,
      "meaning": "NumberField F",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.of_subfield",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_1",
          "id": 13125906,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980830
          },
          "path": [
            {
              "owner": 14065054,
              "target": 14065053,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212062,
              "expressionRoot": 1065212062,
              "ownerName": "riemannHypothesis",
              "targetName": "rhOfAll"
            },
            {
              "owner": 14065053,
              "target": 14065052,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212060,
              "expressionRoot": 1065212061,
              "ownerName": "rhOfAll",
              "targetName": "allChi"
            },
            {
              "owner": 14065052,
              "target": 14065051,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212058,
              "expressionRoot": 1065212058,
              "ownerName": "allChi",
              "targetName": "UpperTheory.FinalTheorems.everyCharacter"
            },
            {
              "owner": 14065051,
              "target": 14065050,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212056,
              "expressionRoot": 1065212057,
              "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
              "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
            },
            {
              "owner": 14065050,
              "target": 14009158,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212052,
              "expressionRoot": 1065212054,
              "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
              "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
            },
            {
              "owner": 14009158,
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125906,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980830,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_1"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125906,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9078397,
          9078405
        ],
        "type": {
          "expressionRoot": 9078396,
          "expressionsRead": 47,
          "childEdges": 64,
          "referenceOccurrences": 10,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9078404,
          "expressionsRead": 20,
          "childEdges": 24,
          "referenceOccurrences": 4,
          "peakPending": 6,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125906,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_1"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125937,
      "n": 2,
      "meaning": "IsDedekindDomain (O_F)",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.RingOfIntegers.instIsDedekindDomain",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_2",
          "id": 13125937,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980839
          },
          "path": [
            {
              "owner": 14065054,
              "target": 14065053,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212062,
              "expressionRoot": 1065212062,
              "ownerName": "riemannHypothesis",
              "targetName": "rhOfAll"
            },
            {
              "owner": 14065053,
              "target": 14065052,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212060,
              "expressionRoot": 1065212061,
              "ownerName": "rhOfAll",
              "targetName": "allChi"
            },
            {
              "owner": 14065052,
              "target": 14065051,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212058,
              "expressionRoot": 1065212058,
              "ownerName": "allChi",
              "targetName": "UpperTheory.FinalTheorems.everyCharacter"
            },
            {
              "owner": 14065051,
              "target": 14065050,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212056,
              "expressionRoot": 1065212057,
              "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
              "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
            },
            {
              "owner": 14065050,
              "target": 14009158,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212052,
              "expressionRoot": 1065212054,
              "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
              "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
            },
            {
              "owner": 14009158,
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125937,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980839,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_2"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125937,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9838916,
          9838922
        ],
        "type": {
          "expressionRoot": 9838915,
          "expressionsRead": 54,
          "childEdges": 72,
          "referenceOccurrences": 13,
          "peakPending": 10,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385914,
              "nameParts": [
                "NumberField",
                "instCommRingRingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609075,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385909,
              "nameParts": [
                "NumberField",
                "RingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609071,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 348070,
              "nameParts": [
                "IsDedekindDomain"
              ],
              "targetKind": "inductive",
              "witnessExpression": 9740115,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9838921,
          "expressionsRead": 54,
          "childEdges": 74,
          "referenceOccurrences": 12,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417457,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsDedekindDomain"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609095,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125937,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_2"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125938,
      "n": 3,
      "meaning": "IsFractionRing (O_F) F",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.RingOfIntegers.instIsFractionRing",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_3",
          "id": 13125938,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980846
          },
          "path": [
            {
              "owner": 14065054,
              "target": 14065053,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212062,
              "expressionRoot": 1065212062,
              "ownerName": "riemannHypothesis",
              "targetName": "rhOfAll"
            },
            {
              "owner": 14065053,
              "target": 14065052,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212060,
              "expressionRoot": 1065212061,
              "ownerName": "rhOfAll",
              "targetName": "allChi"
            },
            {
              "owner": 14065052,
              "target": 14065051,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212058,
              "expressionRoot": 1065212058,
              "ownerName": "allChi",
              "targetName": "UpperTheory.FinalTheorems.everyCharacter"
            },
            {
              "owner": 14065051,
              "target": 14065050,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212056,
              "expressionRoot": 1065212057,
              "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
              "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
            },
            {
              "owner": 14065050,
              "target": 14009158,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212052,
              "expressionRoot": 1065212054,
              "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
              "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
            },
            {
              "owner": 14009158,
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125938,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980846,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_3"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125938,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9838938,
          9838944
        ],
        "type": {
          "expressionRoot": 9838937,
          "expressionsRead": 69,
          "childEdges": 94,
          "referenceOccurrences": 17,
          "peakPending": 10,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4101,
              "nameParts": [
                "Field",
                "toSemifield"
              ],
              "targetKind": "def",
              "witnessExpression": 315578,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4083,
              "nameParts": [
                "Semifield",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 1246540,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385914,
              "nameParts": [
                "NumberField",
                "instCommRingRingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609075,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385909,
              "nameParts": [
                "NumberField",
                "RingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609071,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 360211,
              "nameParts": [
                "IsFractionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8452731,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9838943,
          "expressionsRead": 54,
          "childEdges": 74,
          "referenceOccurrences": 12,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417477,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsFractionRing"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609106,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125938,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_3"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125939,
      "n": 4,
      "meaning": "SMulCommClass F A A (A=AF F; exact raw arguments pending)",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "Algebra.to_smulCommClass",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_4",
          "id": 13125939,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997983762
          },
          "path": [
            {
              "owner": 14065054,
              "target": 14065053,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212062,
              "expressionRoot": 1065212062,
              "ownerName": "riemannHypothesis",
              "targetName": "rhOfAll"
            },
            {
              "owner": 14065053,
              "target": 14065052,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212060,
              "expressionRoot": 1065212061,
              "ownerName": "rhOfAll",
              "targetName": "allChi"
            },
            {
              "owner": 14065052,
              "target": 14065051,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212058,
              "expressionRoot": 1065212058,
              "ownerName": "allChi",
              "targetName": "UpperTheory.FinalTheorems.everyCharacter"
            },
            {
              "owner": 14065051,
              "target": 14065050,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212056,
              "expressionRoot": 1065212057,
              "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
              "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
            },
            {
              "owner": 14065050,
              "target": 14009158,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1065212052,
              "expressionRoot": 1065212054,
              "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
              "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
            },
            {
              "owner": 14009158,
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125939,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997983762,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_4"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125939,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          997980876,
          997980884
        ],
        "type": {
          "expressionRoot": 997980875,
          "expressionsRead": 127,
          "childEdges": 186,
          "referenceOccurrences": 29,
          "peakPending": 16,
          "references": [
            {
              "kind": "explicit_const",
              "target": 13125938,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_3"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980846,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 13125937,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_2"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980839,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385914,
              "nameParts": [
                "NumberField",
                "instCommRingRingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609075,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385909,
              "nameParts": [
                "NumberField",
                "RingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609071,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 425483,
              "nameParts": [
                "NumberField",
                "instCommRingAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8733954,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 424954,
              "nameParts": [
                "NumberField",
                "AdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8711357,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4078,
              "nameParts": [
                "CommSemiring",
                "toSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209807,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 13125906,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_1"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980830,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 560935,
              "nameParts": [
                "Formalism",
                "MainNotions",
                "GlobalTheoryTheory",
                "GenusMassVolumes",
                "AF"
              ],
              "targetKind": "def",
              "witnessExpression": 13430270,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4037,
              "nameParts": [
                "instDistribOfSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 90669,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4033,
              "nameParts": [
                "Distrib",
                "toMul"
              ],
              "targetKind": "def",
              "witnessExpression": 89792,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 10473,
              "nameParts": [
                "instSMulOfMul"
              ],
              "targetKind": "def",
              "witnessExpression": 330978,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 432711,
              "nameParts": [
                "NumberField",
                "instAlgebraAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8972371,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4101,
              "nameParts": [
                "Field",
                "toSemifield"
              ],
              "targetKind": "def",
              "witnessExpression": 315578,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4083,
              "nameParts": [
                "Semifield",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 1246540,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 85948,
              "nameParts": [
                "Algebra",
                "toSMul"
              ],
              "targetKind": "def",
              "witnessExpression": 1197970,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 110448,
              "nameParts": [
                "SMulCommClass"
              ],
              "targetKind": "inductive",
              "witnessExpression": 3028215,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 997980883,
          "expressionsRead": 113,
          "childEdges": 166,
          "referenceOccurrences": 25,
          "peakPending": 11,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417477,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsFractionRing"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609106,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417457,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsDedekindDomain"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609095,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385914,
              "nameParts": [
                "NumberField",
                "instCommRingRingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609075,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 385909,
              "nameParts": [
                "NumberField",
                "RingOfIntegers"
              ],
              "targetKind": "def",
              "witnessExpression": 8609071,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 432711,
              "nameParts": [
                "NumberField",
                "instAlgebraAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8972371,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 425483,
              "nameParts": [
                "NumberField",
                "instCommRingAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8733954,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 424954,
              "nameParts": [
                "NumberField",
                "AdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8711357,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4078,
              "nameParts": [
                "CommSemiring",
                "toSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209807,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4101,
              "nameParts": [
                "Field",
                "toSemifield"
              ],
              "targetKind": "def",
              "witnessExpression": 315578,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4083,
              "nameParts": [
                "Semifield",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 1246540,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 560935,
              "nameParts": [
                "Formalism",
                "MainNotions",
                "GlobalTheoryTheory",
                "GenusMassVolumes",
                "AF"
              ],
              "targetKind": "def",
              "witnessExpression": 13430270,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 164561,
              "nameParts": [
                "Algebra",
                "to_smulCommClass"
              ],
              "targetKind": "thm",
              "witnessExpression": 3028221,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 341190,
              "nameParts": [
                "NumberField"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8609044,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125939,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_4"
            ],
            "exported": true
          }
        ]
      }
    }
  ]
}
```

## Executed regression and reproducibility
V8 execution on actual connector-returned pinned sources and reports: 385 assertions passed, 32 literal source anchors, 7/7 negative controls rejected (root ID, wrong supplier, missing preceding instance dependency, wrong parent witness, wrong path role, changed threshold scope, multiplicity). These are evidence-binding checks, not finite tests of RH or proof equivalence. The 69 type + 53 value distinct-reference occurrences are selected only, not whole proof coverage. Preserve exact JSON and raw reports.
Extract following JS block to a .mjs file; invoke Node with arguments report1 report2 and the five source files in ledger order. CLI hash wrapper not run here; pure verify function executed in V8 as stated.
```js
function verify(docs,sources){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,owner=13125905, digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";let checks=0;
 const ck=(x,m)=>{if(!x)throw Error(m);checks++};
 const [old,now]=docs;
 for(const d of docs){ck(d.pin===pin,"pin");ck(d.root===root,"root");ck(d.digest===digest,"archive digest");ck(d.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK","status")}
 ck(now.summary.requests===34&&now.summary.found===34&&now.reports.length===34,"34 census");ck(new Set(now.reports.map(r=>r.id)).size===34,"unique owners");
 const p=old.reports.find(r=>r.id===owner);ck(p&&p.value.expressionRoot===997984088,"owner root");
 const targets=[
 [13125906,1,9078396,9078404,997980830,435583,"NumberField.of_subfield",341190,"NumberField F"],
 [13125937,2,9838915,9838921,997980839,417457,"NumberField.RingOfIntegers.instIsDedekindDomain",348070,"IsDedekindDomain (O_F)"],
 [13125938,3,9838937,9838943,997980846,417477,"NumberField.RingOfIntegers.instIsFractionRing",360211,"IsFractionRing (O_F) F"],
 [13125939,4,997980875,997980883,997983762,164561,"Algebra.to_smulCommClass",110448,"SMulCommClass F A A (A=AF F; exact raw arguments pending)"]];
 const anchors=[
 [0,"def TLiftK : Prop :="],[0,"[Field E] [NumberField E] [IsCMField E]"],[0,"W.GoodK (cj E) B"],[0,"1 ≤ n"],[0,"X.J = 1"],[0,"X.IsHerm (cj E) B n 0"],[0,"∃ d₀ : ℕ, ∀ d, d₀ ≤ d"],[0,"W.J = δ •"],[0,"W.IsSkew (cj E) B d 0"],[0,"IsHecke (maximalRealSubfield E) E χX"],[0,"IsHecke (maximalRealSubfield E) E χW"],[0,"ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χX n"],[0,"ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χW d"],[0,"HasExp B.emb χX mX"],[0,"HasExp B.emb χW mW"],[0,"GlobalTheory.UnitaryBC.IsAutRepU U"],[0,"GlobalTheory.UnitaryBC.HasWeightAt U (B.emb w).1 (lam w)"],[0,"(d : ℤ) + mW w ≤ 2 * (lam w).w k"],[0,"IsLift B χX χW mX mW lam U U'"],[1,"theorem UpperTheory.TP.K.tLiftK : UpperTheory.TP.TLiftK :="],[1,"UpperTheory.TP.tLift_holds_k"],[2,"instance of_subfield [NumberField K] (E : Subfield K) : NumberField E where"],[2,"to_finiteDimensional := FiniteDimensional.left ℚ E K"],[2,"instance [NumberField K] : IsFractionRing (𝓞 K) K :="],[2,"integralClosure.isFractionRing_of_finite_extension ℚ _"],[2,"instance : IsDedekindDomain (𝓞 K) :="],[2,"IsIntegralClosure.isDedekindDomain ℤ ℚ K _"],[3,"[Algebra R K] [IsFractionRing R K] := InfiniteAdeleRing K × FiniteAdeleRing R K"],[3,"deriving CommRing, TopologicalSpace, IsTopologicalRing, Algebra K"],[4,"[Algebra R A] : SMulCommClass R A A :="],[4,"IsScalarTower.to_smulCommClass"],[4,"rw [algebra_compatible_smul A r (a • m), smul_smul, Algebra.commutes"]];
 for(const [i,s] of anchors)ck(sources[i].includes(s),"anchor "+s);
 let total={type:0,value:0},selected=[];
 for(const [id,n,tr,vr,w,supplier,sname,cls,meaning] of targets){
  const r=now.reports.find(z=>z.id===id);ck(r&&r.request.id===id&&r.kind==="thm","proof id/kind");ck(r.request.name===`UpperTheory.TP.TLiftK._proof_${n}`,"generated name");
  ck(r.type.expressionRoot===tr&&r.value.expressionRoot===vr,"role roots");
  ck(r.request.incoming.ownerId===owner&&r.request.incoming.witness===w&&r.request.incoming.role==="value","incoming");
  const parent=p.value.references.filter(a=>a.target===id);ck(parent.length===1&&parent[0].witnessExpression===w&&parent[0].distinctExpressionRecords===1&&parent[0].kind==="explicit_const","previous parent witness");
  let at=root;for(const e of r.request.path){ck(e.owner===at&&e.role==="value"&&e.kind==="explicit_const"&&Number.isSafeInteger(e.witness)&&Number.isSafeInteger(e.expressionRoot),"path edge");at=e.target}ck(at===id,"path endpoint");
  const e=r.request.path.at(-1);ck(e.owner===owner&&e.witness===w&&e.expressionRoot===p.value.expressionRoot,"path parent");
  ck(r.mutualBlock.length===1&&r.mutualBlock[0].id===id&&r.mutualBlock[0].exported===true,"mutual metadata");ck(r.structural.length===0,"no structural entries in selected owner");
  for(const role of ["type","value"]){let rr=r[role];let ids=new Set();let count=0;
   for(const a of rr.references){ck(a.kind==="explicit_const"&&Number.isSafeInteger(a.target)&&a.nameParts.length>0&&Number.isSafeInteger(a.witnessExpression)&&Number.isSafeInteger(a.distinctExpressionRecords)&&a.distinctExpressionRecords>0,"typed record");ck(!ids.has(a.target),"unique role target");ids.add(a.target);count+=a.distinctExpressionRecords}
   ck(count===rr.referenceOccurrences,"role multiplicity");ck(ids.has(421661),"maximalRealSubfield");total[role]+=count;
  }
  ck(r.type.references.some(a=>a.target===cls),"class in type");ck(r.value.references.some(a=>a.target===supplier&&a.nameParts.join(".")===sname&&a.targetKind==="thm"),"native supplier in body");
  ck(r.value.references.some(a=>a.target===435583),"number field inheritance in body");
  if(n===4){for(const q of [13125906,13125937,13125938])ck(r.type.references.some(a=>a.target===q),"proof4 type dependency "+q);ck(r.type.references.some(a=>a.target===560935),"AF type");ck(r.value.references.some(a=>a.target===432711),"adele algebra body")}
  selected.push({id,n,meaning,status:"SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",supplier:sname,record:r});
 }
 ck(total.type===69&&total.value===53,"selected census");
 return {checks,total,selected,anchors:anchors.length,root,owner};
}
import fs from "node:fs";
import crypto from "node:crypto";
const expected=["d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3","4b36fc43e988270944cef2fc1b5e9ee1493fc275","e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713","241f20aa14f5f0bc718a147831e2d71bb520eea0","c88b4583107e9e07477a23531bb717a45c27b11d","81ec13d6fbf7c0290de4312d704db572f52c7171"];
const args=process.argv.slice(2);
if(args.length!==expected.length)throw Error("need two reports and five source files");
const data=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==expected[i])throw Error("blob mismatch "+p);return b.toString("utf8")});
console.log(JSON.stringify(verify(data.slice(0,2).map(JSON.parse),data.slice(2)),null,2));
```

## Continuity and reviewer notes
Read SWARM_PROTOCOL first, AGENTS, state, actual runner log/protocol, continuity, handoff queue, prior 23:00 integration, editor 23:56, dependency 23:12, structure 23:24, audit 23:48 and all specialist recent checkpoints from commit patches. Latest: geometry 28e13dd, audit dbb81da, literature b753f44, boxes 3b2dbb9, math ac54d32, Galois eb1e710, theta c0904ac, structure ca5a04d, Landau f800e76, prime 91ec9fc, dependencies 9a967ec, kernel 561baec, acceleration 845139f and 250d79b. Read older RUN9 directory notes before discovering current RUN17/RUN18 commits. Nested Grok swarm and external blueprint not reread; no reliance on their claims. Kernel RUN17 raw slicer separate task; send exact type/value roots 13125906:9078396/9078404, 13125937:9838915/9838921, 13125938:9838937/9838943, 13125939:997980875/997980883. No new independent reviewer sign-off; request review of exact proof4 argument order and alias. Preserve prior finding that target-set comparison cannot detect missing role edges. No URT performance claim or physics changes.

RESUME HERE: kernel lane should feed the eight exact roots above into the existing raw slicer, using already authenticated archive/offset index, then verify ordered binders and AF alias against TLiftK lines 18–19; integration next expands the newly projected galoisLocalGlobal_of_geometry_lift producer (ID 13235288) with exact source and its typed references, coordinating with Galois lane. HANDOFF TO kernel, Galois, theta, dependency, editor, audit, structure. Project OPEN.



## Appendix 5: specialists/galois_representations/RUN18_FINITE_PROJECTOR_AND_TRACE_RECURRENCE.md

# RUN18 — finite projector and nonvanishing trace recurrence

2026-11-25. SOURCE-MATCHED / PARTIAL (pinned native bodies reconstructed; latest relocated trace body not recovered). Project OPEN. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, AGENTS, continuity/state/log/protocol excerpts, RUN17, 25 recent commits and 16 peer commit patches with available RESUME HERE notes. No duplicate of this leaf found in those records. In particular integration is taking galoisLocalGlobal_of_geometry_lift; this run takes the distinct spectral algebra leaves from RUN17. CI #405 (00:28:28 UTC) PASS for physical checks only. Some full peer notes and linked blueprint not reopened. No physical changes.

## Provenance and precise inputs

Source leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005; observed latest H=b2f365a68500e2bde98cd60a2324263fc62fba10. Compare API reports H ahead of prior observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd by 204 commits (300 returned file records, not exhaustive). All paths below relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/. PA=ProjectiveAutomorphicHecke/.
- P PA/MapWopWmap.lean blob 1fe2c40629839c6824f70c04f14a3ccb866af5b4, L17 wop, L59–60 Cert, L69–70 ProjOne, L87–93 ProjTrace and TracePow (definitions, not proofs). H same file blob 10a3698dfce45340ea6e08d45e3b84631e9a8e5d, L102–117 Cert/ProjOne/ProjTrace/TracePow. The three-line TracePow and Cert and ProjOne statements remain textually unchanged in the inspected excerpts.
- P PA/PProjOne.lean blob 16b20806f1ac8d8097e95c843617b53ffec40953, L9–17,19–24,26–50 and 52–132 four declarations. H same path blob f1a4094eb427bf1bbc93ca6dfb7fb9b33cd6db7a, L59–64,66–72,74–98,100–183. H blob same as observed 9282d3a revision. Source comparisons executed via connector + V8: after trimming boundaries, 1/4 exact, 3/4 differ. The Bezout lemma is unchanged; algebra-hom helper whitespace only; free monoid conversion now explicitly uses equivMapDomain FreeMonoid.toListEquiv, and main proof changes commutative ring instance construction and coefficient conversion. Preserve new explicit finite-support transport.
- P PA/PTracePow.lean blob 5da100b5d45935bb0d0b6b8d85f2fb2aab7f0e3c, full 81 lines (theorem starts L8). P PA/PProjTrace.lean blob 1ba7c98ca14be25a548b7ca6b96f9890d6832be7, theorem starts L7. Both old paths return 404 at H; no claim that proofs disappeared or are unchanged. H old ScalarCommutation/SpecAlg.lean also 404. Need locate relocated bodies before equivalence claims.
- P ScalarCommutation/SpecAlg.lean blob ad2649702d29a9a02b67d2312919100da95f81e6, L166–255 specAlg; direct calls L190 (pProjOne_holds), L226–227 (pTracePow_holds), L253 (trace word evaluation). This is a source-level dependency, not authenticated full root reachability.

## 1. The scalar-pair trick: arbitrary indexing, no assumed eigencharacter

Let F be ANY field; A a unital F-algebra, finite as F-module, not assumed commutative. J is ANY index type. T_j commute pairwise, and theta:J→F is arbitrary. Define wop(T,t)=sum over finitely many words w of t_w product(T_j for j in w) in word order; empty product 1. ProjOne asserts existence of one finite word polynomial t such that wop(theta,t)=1, P=wop(T,t) is idempotent, and for every j there exists N_j with (T_j-theta_j)^N_j P=0. No finiteness of J, algebraic closure or characteristic zero needed here; P can be zero. Nonzero P is a downstream separate proof. Do not assume theta extends to a character of the algebra generated by T alone.

Take D inside F×A to be the F-subalgebra generated by all pairs (theta_j,T_j). These pairs commute; hence D is commutative. D finite-dimensional because it is a subspace of F×A. Projection chi:D→F on first coordinate is always an F-algebra map, even if theta violates a relation among T alone. This is why the scalar coordinate cannot be dropped.

For x in D and c in F, integrality gives nonzero monic minpoly m. Factor m=(X-c)^k r with k=rootMultiplicity and X-c not dividing r (k may be zero). Bezout gives a(X-c)^(k+1)+b r=1. Let q=b r. Then q(c)=1; q²-q=-ab(X-c)m; (X-c)^(k+1)q=b(X-c)m. Evaluating at x using m(x)=0 yields idempotence and the required nilpotence. Note use k+1, so the zero multiplicity case is valid. Source L26–50 implements exactly these identities.

Choose a finite F-basis b_i of D. For each i apply this lemma with x=b_i,c=chi(b_i); obtain q_i and exponent N_i. Let z=product q_i(b_i). Commutativity implies z²=z; applying chi gives chi(z)=1. For each i the element (b_i-chi(b_i))z is nilpotent, since (b_i-chi(b_i)) q_i(b_i) is nilpotent (source uses N_i+1 and idempotence), and multiplying by remaining factors preserves membership in the nilradical. The nilradical is an ideal in this commutative ring, hence its preimage under the F-linear map d↦(d-chi(d))z is an F-subspace. It contains the whole basis, hence all D. This proves nilpotence for EVERY d, including all indexed generators, without choosing a basis of J or uniform nilpotence exponent.

The free monoid algebra F[J*] maps into F×A by word evaluation on pairs. Its image contains all generators, hence D. Lift z to an element t of that algebra; it has finite word support. First projection gives wop(theta,t)=1, second gives P idempotent. For generator d, ((d-chi(d))z)^M=0 implies ((d-chi(d))z)^(M+1)=0; commute and z²=z give (d-chi(d))^(M+1)z=0. Apply second projection to get the asserted power. The latest proof explicitly reindexes finitely supported coefficients along the free-monoid/list equivalence; no unproved loss of words. This completes the pinned pProjOne argument and explains the finite reduction: finite basis of D, not an assumed finite indexed family.

## 2. Trace restriction and the backward recurrence

TracePow requires field F of characteristic zero, finite-dimensional F-space W, q,s in End(W), q²=q, q≠0, qs=sq, and s(qx)=0 ⇒ qx=0 for every x. For EACH natural j0 there exists j≥j0 with Tr_W(q s^j)≠0. No positivity, self-adjointness, diagonalizability or fixed sign of trace.

Let U=im(q). The commutation ensures s(U)⊆U and all powers preserve U. q acts as identity on U, so q is a projection. The restricted operator t=s|U is injective by the last hypothesis, and U≠0. The native trace lemma pProjTrace_holds factors s^j q through U: with inclusion i and corestriction p of q, p i=id_U, s^j q=i t^j p. Rectangular trace cyclicity gives Tr_W(s^j q)=Tr_U(t^j). Also Tr_W(q s^j)=Tr_W(s^j q). Thus a_j=Tr_U(t^j) equals the target trace.

Let m(X)=sum_{k=0}^d c_k X^k be minpoly(t). Injectivity in finite dimension implies c_0≠0; if c_0=0, m=Xr and t r(t)=0 imply r(t)=0, contradicting minimality. Multiply m(t)=0 by t^j and take trace to get sum c_k a_{j+k}=0 for all j≥0. If every j≥j0 has a_j=0, backward induction in the source proves a_j=0 whenever j+n≥j0. At induction step all k≥1 terms vanish by the previous step at j+k; c_0≠0 gives a_j=0. Taking n=j0,j=0 yields a_0=0. But a_0=dim_F U as a scalar, nonzero by q≠0 and characteristic zero. Contradiction. This is the entire native PTracePow proof, not a claim of positivity.

Additional human consequence (not separately stated in native theorem): d≥1 and the recurrence is monic with nonzero constant term, so any d consecutive zero traces force all later terms zero (solve forward for a_{j+d}) and earlier terms zero (solve backward). Hence some j in [j0,j0+d-1] has nonzero trace, with d≤dim U by Cayley–Hamilton. This sharpened interval follows from the same recurrence, not from a numerical search. It is not needed by specAlg; do not replace its source statement with the sharpened claim silently.

## 3. Exact consumer and why assumptions cannot disappear

At SpecAlg L190, T_j is the diagonal compressed Hecke action on the finite product W, E0 is the diagonal idempotent, V the diagonal auxiliary action. The actual common eigenvector x0 supplied by HasEig, fixed by E0, gives Px0=x0 via scalar word evaluation; hence q=P E0 is nonzero. Pairwise commuting identities give q²=q and qV=Vq. The diagonal left inverse satisfies U'V=E0, so V(qx)=0 implies qx=E0 qx=U'V(qx)=0. Use TracePow at j0=1, yielding one m≥1 independent of the later test word polynomial s. SpecAlg L253 gives scalar trace factorization; RUN17 supplies its consumer chain through SpecOfF, SpecData, SpecTopG, PlanEx and local–global compatibility. This run closes the human linear-algebra leaf derivation only; full imported geometry, source relocation, authenticated root edges and independent kernel replay remain open.

Negative controls: a zero idempotent satisfies the certificate when theta does not occur (e.g. A with sole eigenvalue 2, theta=4); scalar evaluation may still equal 1. For invertible diag(1,-1), first trace zero but second nonzero; no prescribed exponent 1. In F_2 with q=s=I on dimension 2 all traces vanish, so characteristic zero is essential for the general statement. Without injectivity s=0 gives all positive powers zero.

## 4. Executed exact finite regression and replay

Executed in local Python/SymPy (not Lean): 375 rational Bezout cases (including k=0), 2 matrix projection examples including nonsemisimple and absent target, 3060 finite trace windows, 3 negative controls. All assertions passed. The finite test is illustrative, not a substitute for general proofs above. Reproduce:
```python
from itertools import product
from sympy import Matrix, eye, zeros, Poly, QQ, symbols, gcdex, diag
x=symbols('x')
def evaluate(p,A):
    v=zeros(A.rows)
    for c in p.all_coeffs(): v=v*A+c*eye(A.rows)
    return v
n=0
for a,b,c in product(range(-2,3),repeat=3):
    for k in (1,2,3):
        m=Poly((x-a)**k*(x-b),x,domain=QQ)
        r=m; j=0; f=Poly(x-c,x,domain=QQ)
        while r.rem(f).is_zero:
            r=r.exquo(f); j+=1
        u,v,g=gcdex(f**(j+1),r)
        assert g==Poly(1,x,domain=QQ)
        p=v*r
        assert p.eval(c)==1 and (p*p-p).rem(m).is_zero and (f**(j+1)*p).rem(m).is_zero
        n+=1
A=Matrix([[2,1,0,0],[0,2,0,0],[0,0,2,0],[0,0,0,3]])
B=diag(4,4,5,4)
P=evaluate(Poly(1-(x-2)**2,x),A)*evaluate(Poly(5-x,x),B)
assert P==diag(1,1,0,0) and P*P==P and (A-2*eye(4))**2*P==zeros(4) and (B-4*eye(4))*P==zeros(4)
assert evaluate(Poly((x-2)**2*(x-3)/4,x),A)==zeros(4)
r=0
for d in range(1,5):
    for eig in product((-2,-1,1,2),repeat=d):
        for j0 in range(9):
            assert any(sum(z**j for z in eig)!=0 for j in range(j0,j0+d))
            r+=1
assert Matrix.diag(1,-1).trace()==0 and (Matrix.diag(1,-1)**2).trace()==2
assert all(2%2==0 for j in range(8))
assert all((zeros(2)**j).trace()==0 for j in range(1,8))
print(f'CRT cases {n}; joint projection and absent target: 2; trace windows {r}; negative controls 3')
```
Source provenance replay: in a full checkout, git rev-parse P:path and H:path for the blobs above; git show at those refs. Compare the four PProjOne declaration slices at listed ranges (trim outer whitespace; no internal normalization). Connector comparison actually executed; local git replay not executed. No independent Lean validation, no URT timing or superiority claim.

RESULT: pinned pProjOne_holds, pProjTrace_holds and pTracePow_holds translated, with hypotheses and finite tests. Upstream H changes explicitly recorded, trace producer relocation unresolved. All prior open suppliers retained.

RESUME HERE: locate H relocated PTracePow/PProjTrace and SpecAlg via authenticated declaration manifest/offset index (coordinate dependency/kernel workers); then reconstruct actual trace_list_prod_mul_eq_prod_mul_trace_of_pow_sub_mul_zero and its word-polynomial lift in pinned SpecAlg L49–97, with nilpotent trace and commutation obligations. Request authenticated role-labelled root edges to pProjOne_holds, pTracePow_holds, specAlg, specOfF and specTopG. Integration owns galoisLocalGlobal_of_geometry_lift; no duplicate. HANDOFF TO dependencies, kernel, integration, editor, audit, Galois. Project OPEN.



## Appendix 6: specialists/character_boxes/RUN18_ADELIC_TENSOR_PRODUCT_SPLITTING.md

# RUN18 — Full adelic tensor-product splitting and its topological inverse
2026-11-25. SOURCE-MATCHED / DONE for the human reconstruction of the two native splitting declarations and their immediate consumer; NOT kernel replay or authenticated root reachability. Project OPEN.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #405 (00:28:28Z, physical checks only), RUN17 and 25 recent commit titles plus available peer RESUME HERE excerpts from 15 recent patches. No duplicate identified. Some full peer files and external blueprint were not reopened. No physics or protected-file changes.

## Provenance
Upstream leanprover-community/riemann-hypothesis; pin P=40e56bab026552e089d7afcfeff08d2defb9c005; latest returned H=b2f365a68500e2bde98cd60a2324263fc62fba10 (Merge PR #1787; changed since RUN17's 9282d3a102c4aff0e6026746db2a8990f5d9cddd).
A=src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean
P blob 6efcfa7fffd73e9509215b0a1f6b74eda90860b5; H blob 0df62830b18b609e043561bd449ce4de56f02070.
[Original](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean#L9-L114).
C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean
P blob 4125fd7aed8d975a8179e2debf22c365e01f237e.
[Consumer](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L181-L206).

## Quantifiers and human proof
A:9–18, GlobalTheory.AdSplit.exists_prod_equiv. For ALL commutative rings F,E,A,B with F-algebra structures on E,A,B, and topological-ring instances on A and B, equip the three tensor products with the specific module topologies in the source (over A×B, A, B respectively). There EXISTS a single ring equivalence e: (A×B)⊗_F E → (A⊗_F E)×(B⊗_F E) satisfying BOTH coordinate equations for EVERY z and with continuous forward and inverse maps. No flatness, field, finite-dimensionality, Hausdorffness or completeness hypothesis is added. This concerns these declared module topologies, not an arbitrary completed tensor product.

1. A:19–42. The universal tensor maps p=pr_A⊗id_E and q=pr_B⊗id_E are algebra homomorphisms; on pure tensors they map (a,b)⊗x to a⊗x and b⊗x. The imported linear equivalence l=TensorProduct.prodLeft has coordinates (p,q) by tensor induction (zero, pure tensor, sum). Because p and q preserve multiplication, l preserves multiplication coordinatewise. The source packages l.toAddEquiv plus map_mul' as the ring equivalence e. The imported prodLeft equivalence is an actual obligation, not a bijectivity assertion from the displayed pure-tensor formula alone.
2. A:43–64. Define i=rTensor_E(inl), j=rTensor_E(inr) as F-linear maps. For r∈A×B, z arbitrary, p(rz)=pr_A(r)p(z), q(rz)=pr_B(r)q(z), by induction on z, including both additive branches. Thus p and q are semilinear over the two continuous projection ring homomorphisms. The source invokes IsModuleTopology.continuous_of_linearMapₛₗ with continuous_fst/snd. Module-topology instances and ContinuousAdd are set up at A:19–27; these are indispensable for the subsequent continuity arguments. The identities concern module scalar actions.
3. A:65–88. i(a⊗x)=(a,0)⊗x, j(b⊗x)=(0,b)⊗x. Their scalar compatibilities follow again by tensor induction, now over the multiplicative monoid maps r↦(r,0) and s↦(0,s). These maps are continuous and additive coordinate inclusions, but NOT in general unit-preserving ring maps. The source uses distributive multiplicative action homomorphisms (→ₑ+) and IsModuleTopology.continuous_of_distribMulActionHomₑ, not a unital ring-hom continuity lemma. This distinction prevents incorrectly adding an assumption that one component is trivial.
4. A:89–100. Induct on arbitrary x∈A⊗E and y∈B⊗E, not on the number of places: p i=id, q i=0; p j=0, q j=id. Each pure tensor computation follows from its coordinate inclusion, and the sum case follows from additivity.
5. A:101–110. e=(p,q) is continuous by pairing the two continuous maps. Its inverse is EXACTLY (x,y)↦i(x)+j(y): apply e and use the four identities in step 4 to get (x,y); injectivity of e identifies this candidate with e.symm. Both inclusions are continuous, both product projections continuous and addition continuous in the declared module topology, so the inverse is continuous. The inverse formula is one reusable lemma, not a separate construction for every place.
6. A:112–114, GlobalTheory.AdSplit.exists_adele_equiv. For ALL number fields F,E with Algebra F E, substitute A=InfiniteAdeleRing F and B=FiniteAdeleRing (𝓞 F) F into step 1–5; the source uses the adele ring as their product. The same witness e satisfies all four obligations: first projection, second projection, continuity, inverse continuity. No use of RUN17's finite base-change bijectivity is needed for this general product splitting.

## Exact consumer (C:181–206)
For each D:D7, C.exists_comp chooses the finite base-change hom ι from RUN17, and the product equivalence e above. It uses its projections he1,he2 but discards the continuity pair at this call site (not removed from the upstream theorem). Let s=swapAE, the bijective tensor-factor commutation map, and Φ=ι∘s∘finPart. C.Comp (153–158) includes ext, surj, inc, int, base.
- ext: if infPart z=0 and Φz=0, injectivity of ι and s gives finPart z=0. Then e(z)=(0,0), hence z=0 by injectivity of e.
- surj: for any finite adele t, choose w with ι(w)=t by RUN17, then y with s(y)=w; choose z=e⁻¹(0,y). Both infPart z=0 and Φz=t hold simultaneously.
- inc/int/base: the original source invokes RUN17 map_tmul_one, mem_intAE_iff and map_mem_int/mem_int_of_map, and the original hι pure tensor formula. These are retained dependencies, not re-proved here. In particular, splitting alone does not imply finite integral compatibility.
The first two fields use both halves of e's bijectivity; neither a single projection nor mere continuity suffices.

## Static dependency check, actual execution and upstream diff
Executed in connector V8 on fetched source. 27/27 source anchors found. 16 anchors in exists_prod_equiv: TensorProduct.prodLeft; TensorProduct.induction_on; l.toAddEquiv; map_mul'; LinearMap.rTensor E (LinearMap.inl; LinearMap.rTensor E (LinearMap.inr; IsModuleTopology.continuous_of_linearMapₛₗ continuous_fst; same continuous_snd; IsModuleTopology.continuous_of_distribMulActionHomₑ; continuous_id.prodMk continuous_const; continuous_const.prodMk continuous_id; hpi; hpj; hp.prodMk hq; RingEquiv.symm_apply_eq; (hi.comp continuous_fst).add (hj.comp continuous_snd).
4 anchors in exists_adele_equiv: exists_prod_equiv F E; Continuous e ∧ Continuous e.symm; AlgHom.fst; AlgHom.snd.
7 anchors in exists_comp: GlobalTheory.AdSplit.exists_adele_equiv; (he z).1; (he z).2; e.injective; e.surjective (0, y); GlobalTheory.AdeleBaseChange.map_injective; GlobalTheory.AdeleBaseChange.map_surjective.
Reproduce by git show P:path and search each named declaration slice (A:9–110,112–114; C:181–206) for the listed literal substrings, fail if absent. These are lexical anchors, not 27 authenticated kernel edges. Exact slice comparison: wrapper A:112–114 identical at H:160–162. Generic theorem A:9–110 vs H:57–158 differs at exactly four lines (P 53,63,74,86): map_add changed to map_add (f := _) in simp only. H file has a longer import/module preamble. No semantic equivalence or successful elaboration inferred.

## Reproducible finite algebra regression
Executed JavaScript in connector V8. Specialization F=Z, A=Z/m, B=Z/n, E=Z/k. The standard cyclic tensor identity Z/m⊗_Z Z/k ≅ Z/gcd(m,k) is used as a model; the test checks the explicit coordinate formulas, congruence representatives, and inclusions, NOT the general prodLeft theorem, topology, local fields or Lean. The pair encoding is by enumeration, not CRT and not independent evidence of general multiplicativity; counts are regression checks only. Nonflat cases and zero component cases included.
```js
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
let pure=0,round=0,add=0,mul=0,sel=0,neg=0,collapse=0;
const eq=(x,y)=>x.every((v,i)=>v===y[i]);
const assert=x=>{if(!x)throw Error("regression")};
for(let m=2;m<=9;m++)for(let n=2;n<=9;n++)for(let k=2;k<=9;k++){
 const d=gcd(m,k),e=gcd(n,k),D=d*e;
 const p=z=>z%d,q=z=>Math.floor(z/d),I=x=>x,J=y=>d*y;
 const f=z=>[p(z),q(z)],g=([x,y])=>I(x)+J(y);
 const plus=(x,y)=>((p(x)+p(y))%d)+d*((q(x)+q(y))%e);
 const times=(x,y)=>((p(x)*p(y))%d)+d*((q(x)*q(y))%e);
 for(let a=0;a<m;a++)for(let b=0;b<n;b++)for(let c=0;c<k;c++){
  const t=g([(a*c)%d,(b*c)%e]);
  assert(eq(f(t),[(a*c)%d,(b*c)%e]));
  assert(t===g([((a+m)*c)%d,((b+n)*c)%e])&&t===g([(a*(c+k))%d,(b*(c+k))%e]));
  pure++;
 }
 for(let z=0;z<D;z++){
  assert(g(f(z))===z);round++;
  assert(p(I(p(z)))===p(z)&&q(I(p(z)))===0&&p(J(q(z)))===0&&q(J(q(z)))===q(z));
  assert(plus(I(p(z)),J(q(z)))===z&&times(I(p(z)),J(q(z)))===0);sel++;
  for(let w=0;w<D;w++){
   assert(eq(f(plus(z,w)),[(p(z)+p(w))%d,(q(z)+q(w))%e]));add++;
   assert(eq(f(times(z,w)),[(p(z)*p(w))%d,(q(z)*q(w))%e]));mul++;
  }
 }
 if(d===1||e===1)collapse++;
}
assert(!eq([1,0],[1,1]));neg++; // nonunital inclusion
assert([0,0][0]===[0,1][0]&&!eq([0,0],[0,1]));neg++; // projection loses information
assert(gcd(2,3)===1);neg++; // tensor factor can collapse
console.log({pure,round,add,mul,sel,collapse,neg});
```
Actual output {"pure":85184,"round":2136,"add":31424,"mul":31424,"sel":2136,"collapse":408,"neg":3}. 512 triples of moduli; 408 with at least one zero tensor component. Original hypotheses removed: 0. No URT speedup or kernel check claimed. Two distinct source files examined; three named declarations traced.

## RESUME HERE
Reconcile RUN16 existing coverage of IdemSupport with C:327–363; then trace the native supplier of inv_mem_iff and Comparison₂.conj (in C itself or immediate imports), preserving nonzero x, idempotence, zero infinite part and height-one-prime hypotheses. If already covered, follow the first unexpanded actual supplier, not the repeated finite base change. Request authenticated role-labelled root edges to exists_adele_equiv, exists_prod_equiv, exists_comp and earlier RUN15–17 frontier; retain initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins as outstanding. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.



## Appendix 7: specialists/theta_lifts/RUN18_2026-11-25_holLeadB_assembly.md

# Theta RUN18 — actual HolLead supplier and cancellation of the lowering derivative

2026-11-25. RESULT: SOURCE-MATCHED conditional human reconstruction of PositivityTheory.Rg.Sw.HSt.holLeadB and asmH_of, including both signatures. Not an independent Lean replay or authenticated root dependency path.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, physics-only CI #404, RUN17 and recent commit patches/handoffs across other lanes (integration, kernel, dependency, acceleration, structure, prime, Landau, Galois, character boxes, audit, math, literature, geometry, editor). Some peer patches lacked handoffs; external blueprint not reopened. No duplicate found in inspected material. No physics changes.

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream H=b2f365a68500e2bde98cd60a2324263fc62fba10 (merge PR #1787). Earlier source CntFalse blob remains changed from P. At H the HolLeadB file is a clump of nine modules including CrLem and SphericalSectionConjugationSwap. AsmCore.lean at H returns 404, but AsmH.lean contains asmH_of and the clump member marker. This is positive relocation evidence, not full proof-term equivalence across versions. Exact H anchors below.

## 1. Actual supplier, not a projection
Pinned SiegelWeilStdMid:20 passes HSt.holLeadB into siegelWeilStd_of, whose argument hH : HolLead (SiegelWeilStdOf:53) packages the HolLead field alongside KSing.lamSing_of (64). HolLeadB:9 has exact proof term:
    conj (asmH locTau secFz crLem).
AsmH:9 expands asmH_of farId Conv.smoothX topHol rcCongr (fun _ x Z t hx => expLie x Z t hx). LocTau:9 is asmLT lt1 lt2 lt3 crux. CrLem:8 is CR.crLem_of locSec fib CR.cra2. SecFz is actually produced in InverseFirstBlockEqAdjoint:28. These are source-body edges, not kernel references. The local analytic supplier is no longer an unidentified premise at this level; its deeper proofs remain open.

## 2. Exact theorem hypotheses (LowerRankDatum:20–34; HolLeadHol:17–31)
For all natural m,n,p,q and integer e, assume 1≤m<n, and either (p,q)=(m,0) or (0,m). Let G be a group with topological group structure, locally compact Hausdorff and second countable, Pp,Γ subgroups, continuous group homomorphism ι:GR n→G, s₀ complex, Ht:G→NNReal and f:G→C. For every g there exist x,y,S,r with r>0, g=xι(y) and for every y' both Ht(xι(y'))=r hLoc(y') and f(xι(y'))=S F0(p,q,e;y'). Let U open right domain containing s₀, d any complex polynomial, Ê a complex family on G, t real. For every g, Ê(·,g) differentiable on U and jointly continuous on U×G. For every Re z>t and compact C⊆G there exists a summable real coset majorant bounding each term uniformly on C, and for all g, Ê(z,g)=d(z) times the Eisenstein coset sum with section Ht^(z−s₀) f. For any natural j assume all derivatives of order i<j vanish at s₀ for all g. For every singular test ψ, every nb with mR(nb(x))=nU(herm x), every g,a,b, the integral of ∂^j Ê(s₀,gι(a nb(x)b)) ψ(x) vanishes. Conclusion: for every g, φ_g(y)=∂^j Ê(s₀,gι(y)) satisfies IsHolW(p,q,e). No extra nonzero polynomial hypothesis, nonzero leading derivative, j>0, or rational invariance needed in this standalone statement. Original rank and signature restrictions retained.

## 3. Positive signature proof (AsmCore:93–232)
Fix g and use p=m,q=0. Write φ=φ_g. Obtain from SmoothX a family Φ_s(z,x) on ambient complex matrices, open Ω containing GSet, and holomorphic multiplier c on U with c(s₀)≠0. Its restriction to group matrices is c(z)Ê(z,gι(y)), and it supplies smooth derivatives and interchange with the lowering operator rC (104). Put Ψ_i(x)=∂^i_z Φ_s(s₀,x). By the Leibniz identity iter_mul_low (75–91), Ψ_j(mR y)=c(s₀)φ(y), and Ψ_i vanishes on every group matrix for i<j (108–123). This uses equality of analytic germs, not division by the potentially zero φ. Thus the smooth ambient representative is Ψ_j/c(s₀).

Use normalized Haar probability μ on the compact group KR n (97–102), the continuous inclusion ιK and its exact characterization of InK (125–134). LocTau at Q=0 and FarId supply the right K-law Ê(z,gι(yk))=Ê(z,gι(y))F0(m,0,e;k) on U; the jth derivative inherits this law (136–147). CRLem requires that K-law, the smooth ambient representative, and vanishing of rC(lowQ Q) on that representative for every y,Q.

Fix arbitrary y,Q. LocTau (LocTauAlt:33–41) gives finite N, continuous weights ρ_l, singular tests ψ_l, a_l,b_l∈InG, entire D,M_l with D(0)≠0, and an identity expressing the lowering derivative of the local section fz through tOp integrals. Each tOp is a compact Haar average of an inner integral against ψ_l, with translated group argument x ιK(k) a_l nU(herm t) b_l (29–31). There is no assertion that D has no other zeros. FarId transfers the local identity to the far-right Eisenstein family; TopHol supplies holomorphicity and exact spectral differentiation of each integral. Define
    L(z)=rC(lowQ Q)(Φ_s(z,·))(mR y),
    T_l(z)=tOp_l(resG ι (Ê(z,·)) g)(mR y),
    R(z)=c(z) Σ_l M_l(z−s₀) T_l(z).
Then D(z−s₀)L(z)=R(z) on U (166–189): the equality initially holds in a far-right half-plane by FarId and RcCongr (which compares derivatives on the two real exponential curves known by ExpLie to stay in the group). The right-domain property supplies a common right half-plane and preconnectedness via rightConn. The complex identity theorem extends the equality; no division by D at a distant point.

For i<j the group restriction of Ψ_i is zero, so the same curve congruence plus interchange gives L^(i)(s₀)=0 (190–194). For each l and k≤j, the differentiation supplied by TopHol reduces T_l^(k)(s₀) to the tOp of the kth derivative. If k<j, global lower-derivative vanishing makes the lifted function identically zero (including off-group zero branch of lift). If k=j, for every compact k' the inner integral is exactly the hypothesis hsing applied with left factor y k' toGR(a_l) and right factor toGR(b_l), and nb(t)=toGR(nU(herm t)); all are valid group elements (195–224). Consequently T_l^(k)(s₀)=0 for all k≤j. By Leibniz and finite summation, R^(k)(s₀)=0 for all k≤j. Differentiating the identity at order j, every term other than the order-j derivative of L vanishes:
    D(0)L^(j)(s₀)=R^(j)(s₀)=0.
The specific nonzero scalar D(0) forces L^(j)=0 (225–232). Interchange gives rC(lowQ Q) Ψ_j(mR y)=0; multiplying by c(s₀)^(-1) preserves zero. CRLem now produces IsHolW(m,0,e) for φ, not merely formal smoothness. This argument works for j=0 (lower derivative conditions vacuous) and finite N=0. The strict rank is used by LocTau; it cannot be erased. The novel local identity is not established solely by this assembly.

## 4. Negative signature (SphericalSectionConjugationSwap:271–309)
Let E=diag(I,−I). Conjugation C(y)=E y E is a continuous involutive group automorphism: E* J E=−J, so it preserves InG. It swaps Cayley blocks, preserves height and determinant, and satisfies F0(p,q,e;C(y))=F0(q,p,e;y), zOf(C(y))=−zOf(y)*. Use ι'=ι∘C; same G, section, analytic family and far-right assumptions. The new split is x,C(y),S,r. Under C the unipotent nU(herm t) goes to nU(−herm t). The test ψ(−t) is singular by reflection: continuity and integrability are preserved and the Fourier value at singular Hermitian β is that of ψ at −β (also singular). Change variables t→−t in volume, and use original hsing with C(a),C(b), nb'(t)=C(nb(−t)). This establishes all positive-signature assumptions for ι'. Apply the previous result, then evaluate at C(y); involutivity, section swap and coordinate relation yield φ_g(y)=F0(0,m,e;y) H_g(−zOf(y)*). Since m≥1, the q≠0 branch in IsHolW is exactly the indicated one. No mixed signature or extra analytic continuation assumption.

## 5. Provenance and remaining boundaries
Source-matched mathematical explanation: elementary Leibniz, analytic identity theorem, Haar averaging and conjugation are conventional mathematics. No claim that LocTau/crux or the entire local argument is a published theorem, newly discovered here, or free of transitive placeholders. Native proof bodies inspected for asmH_of and conj; exact supplier terms recorded for asmH, locTau, crLem and secFz. Expand their deeper premises next. LamSing source producer separately identified as KSing.lamSing_of (SingularHermitian/LamSingOf.lean), not translated here. Root linkage from the actual RH declaration remains unverified for this branch, as do axiom/sorry audit and independent kernel replay. No URT improvement claimed.

## Reproducibility
Executed connector JS against pinned source: 12 blob identifiers and 79 literal line anchors matched; two H blobs and 5 H line anchors matched. These are source-reference checks, not a proof checker. The following standalone script reproduces the same checks with a local upstream clone (not run here). It exits nonzero on mismatch.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="b2f365a68500e2bde98cd60a2324263fc62fba10"
rows=[["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolLeadB.lean","485b1709704b6c3e5dfac0fd29aeb2f0de86f5ec",[[9,"conj (asmH locTau secFz crLem)"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/AsmCore.lean","7f2c8d086a5fc584be52acca22c963c58fcadb12",[[51,"def Van"],[53,"theorem van_mul"],[61,"theorem van_sum"],[75,"theorem iter_mul_low"],[93,"theorem asmH_of"],[102,"IsProbabilityMeasure"],[104,"hc0"],[108,"hΨG"],[114,"iter_mul_low"],[120,"hΨ0"],[136,"hLT"],[137,"hF"],[138,"hCR"],[141,"field_simp"],[145,"hK"],[151,"hD0"],[152,"hfarId"],[155,"set R"],[156,"hTH"],[166,"hEq"],[171,"rightConn"],[177,"hR"],[186,"hfarId"],[190,"hLlow"],[194,"iter_mul_low"],[196,"hRv"],[204,"lt_or_eq_of_le"],[208,"hlow"],[216,"hsing"],[224,"integral_zero"],[226,"D 0"],[230,"resolve_left hD0"],[231,"hΦrC"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolLeadHol.lean","140d48cbe17fd9a49700ceea1d8ea48e93c2915c",[[17,"def HolLeadHol"],[18,"1 ≤ m"],[28,"∀ i < j"],[29,"IsSingTest"],[31,"IsHolW m 0 e"],[33,"def Conj"],[42,"def CRLem"],[45,"rC (lowQ Q)"],[47,"LocTau → SecFz → CRLem"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/LocTauAlt.lean","c68017f4832d14fb672e9e27fdd3a9eab3e7436a",[[18,"def fz"],[23,"def rC"],[27,"def lowQ"],[29,"def tOp"],[33,"def LocTau"],[34,"m < n"],[38,"IsSingTest"],[39,"D 0 ≠ 0"],[41,"rC (lowQ Q)"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/SphericalSectionConjugationSwap.lean","643023673522acbc316ab6475768718d10147340",[[16,"def epsM"],[31,"theorem eps_JJ"],[45,"def cHom"],[63,"cHom_cHom"],[92,"spherical_section_conjugation_swap"],[128,"hLoc_c"],[223,"zOf_c"],[262,"singTest_neg"],[271,"theorem conj"],[279,"m ≠ 0"],[298,"hsing"],[300,"integral_neg_eq_self"],[306,"zOf_c"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/AsmH.lean","2a29d8a1ac7612c33a189dda788cc838391dd289",[[9,"asmH_of farId Conv.smoothX topHol rcCongr"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/LocTau.lean","bd198ef5120fc6f5b2381c5b18b9cf62c7bed54f",[[9,"asmLT lt1 lt2 lt3 crux"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/CrLem.lean","ea0a298a4c32d11795b544443feb447251fe29a6",[[8,"CR.crLem_of locSec fib CR.cra2"]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/InverseFirstBlockEqAdjoint.lean","856076f8de2f4104abc74c526f4f3d730a36d24f",[[28,"theorem secFz"]]],["src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[[20,"def HolLead"],[21,"1 ≤ m"],[26,"IsRightDomain"],[31,"∀ i < j"],[32,"IsSingTest"],[34,"IsHolW"]]],["src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdMid.lean","1e8d46ad8e347e6ae7878469a529ae6b3f475f46",[[6,"HolLeadB"],[20,"HSt.holLeadB"]]],["src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[[53,"hH : HolLead"],[64,"KSing.lamSing_of"]]]]
heads=[["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolLeadB.lean","f472dec2868c3e96240239c20467fd72f79d2b15",[[1126,"theorem holLeadB : PositivityTheory.SiegelWeilFormula.HolLead := conj (asmH locTau secFz crLem)"],[1073,"theorem conj : Conj := by"],[796,"theorem crLem : CRLem :="]]],["src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/AsmH.lean","9a52c494c0cf36f37b97dd749c27e25cbb02354c",[[227,"theorem asmH_of (hF : FarId)"],[1317,"theorem asmH : AsmH :="]]]]
for rev, group in [(P,rows),(H,heads)]:
    n=0
    for path,sha,anchors in group:
        raw=subprocess.check_output(["git","show",rev+":"+path])
        actual=subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()
        assert actual==sha,(path,actual,sha)
        lines=raw.decode().splitlines()
        for i,s in anchors:
            assert s in lines[i-1],(path,i,s)
            n+=1
    print(rev,len(group),"blobs",n,"anchors")
```

## RESUME HERE
Expand actual LocTau supplier asmLT lt1 lt2 lt3 crux, prioritizing the determinant nonzero certificate D(0) and the finite singular-test decomposition, then CR.crLem_of (locSec, fib, CR.cra2). Preserve all LocTau:33–41 hypotheses and prove why strict m<n enters. Also trace KSing.lamSing_of separately; request role-labelled authenticated root paths to holLeadB, asmH_of, locTau, crLem and previously requested theta suppliers. H relocation in AsmH confirmed; CntFalse old body relocation still outstanding. HANDOFF TO theta, dependencies, kernel, integration, audit, editor and literature. Project OPEN.



## Appendix 8: specialists/literature_provenance/RUN18_DIAGONAL_RETRACTION_AND_PD_DERIVATION.md

# RUN18 — diagonal first-neighbourhood retraction and divided-power derivation

2026-11-25. Status: SOURCE-MATCHED local human reconstruction and executed finite algebra regression; project OPEN. Pinned upstream leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed head b2f365a68500e2bde98cd60a2324263fc62fba10 (2026-11-25 00:06:45 UTC). No independent Lean kernel replay or URT speed claim.

## Continuity and scope
Read AGENTS, RESEARCH_STATE opening, CONTINUITY_PROTOCOL and research log/protocol opening, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN17 handoff. Checked 14 other lanes' latest commits, including the 11 available Markdown RESUME HERE notes (Galois, math, theta, character boxes, Landau, prime, acceleration, integration, geometry, kernel, editor); structure, audit and dependencies latest commits were scripts, not Markdown handoffs. The present task is the direct next RUN17 supplier, not the other lanes' TLiftK raw binder, trace recurrence, adelic splitting, analytic or GAGA work. Blueprint referenced by queue not reread this run; latest physics CI summary not checked, no physics records modified. Earlier RUN15/16/17 obligations remain as recorded.

## 1. Exact objects and all quantifiers
All rings R,B,C commutative with R-algebra structures. For divided powers δ on J⊂B, define E_B=DR_R(B)=exterior algebra of Ω_{B/R}; i denotes inclusion of one-forms. L_B=rel R δ is the ideal spanned by i(dδ_{n+1}(a)−δ_n(a) da), for every n≥0 and a∈J. N1 is the preimage of L_B under i; N_j is its preimage under inclusion of the degree-j submodule Om_j. K1=Ω/N1 and K_j=Om_j/N_j. Do not replace K1 by K_j in the actual native signature (the implementation distinguishes them). Definitions source L23–24,56–68,75–100. Two-sidedness is required because the exterior algebra need not be commutative. The source uses the first conjunct of the theorem rel_two_sided_and_bot, NOT the conditional base-ideal vanishing conclusion.

For arbitrary R,I, divided powers κ on I, scheme X and t:X→Spec R, take any T in Thick κ t with ring B=T.B, ideal J=T.J, powers δ=T.δ, quotient map to B₀ and point map. Define S(T)=nb T, ring ER T=B⊕K1 with multiplication (b,m)(b',m')=(bb',bm'+b'm), ideal preimage J under first projection, powers extDP, same B₀ and point, quotient through first projection. The native fields nil, dp, surj, ker, x, w are supplied by isDPNilpotent_extend, isDPMorphism_inl composed with T.dp, a preimage (b,0) for any original quotient preimage b, T.ker on first projection and the original point fields. This is a valid thickening only subject to these original structure proofs (OneForm... L46–59).

For every arrow φ:T→T', nbAlg=(φ,km1_φ) componentwise, km1 semilinear by quotient representative calculation. The reduced map is φ₀, compatibility follows from first projection, DP compatibility from isDPMorphism_extMap and point from φ.pt. Identity and composition use km1_id/comp, hence nbF is a functor (L61–103). Let d̄ be d modulo N1. It is a DP derivation because its DP defect is an actual generator of L_B (L29–36). Two sections u(b)=(b,0), v(b)=(b,d̄b), both DP morphisms, same reduced identity and point. Naturality of u uses zero preservation; of v uses km1(d̄b)=d̄φ(b) (L105–136).

## 2. Universal construction of the forms map
ExistsFormsMapOfDividedPowerDerivation.lean L32–115: For every R,B,C,J,JC,δ,δC, R-algebra map π:C→B and additive w:C→K1_B, assume all three:
(1) w(xy)=π(x)w(y)+π(y)w(x) for every x,y;
(2) w(algebraMap_R^C(r))=0 for every r;
(3) w(δC_{n+1}(a))=π(δC_n(a)) w(a) for every n≥0 and a∈JC.
Write Q_B=E_B/L_B, q_B quotient. Define kq:[ω]↦q_B(iω), well-defined by definition of N1 (L17–28). Regard Q_B as C-algebra through π. Then v=kq∘w is an R-derivation (additivity, scalar-linearity by (1),(2), Leibniz by (1)). The universal Kähler lift l:Ω_C→Q_B sends dc to kq(w(c)).
Every l(ω) is q_B(iη) for some η: prove on generators b dc, using a representative of w(c), then zero/addition. Thus l(ω)^2=0 by the exterior relation (iη)^2=0, without division by 2 or freeness assumptions. Exterior universality supplies C-algebra map Φ:E_C→Q_B (L60–78).
Choose any set-theoretic representative ρ(x) of Φ(x) via quotient surjectivity. In particular ρ is NOT asserted to be a linear or multiplicative map before quotienting. Its seven exact outputs, in source order, are:
1. ρ(x+y)−ρ(x)−ρ(y)∈L_B for all x,y.
2. ρ(xy)−ρ(x)ρ(y)∈L_B for all x,y.
3. ρ(c)−π(c)∈L_B for every scalar c embedded in E_C.
4. ρ(i dc)−iω∈L_B for every c,ω with [ω]=w(c).
5. ρ(L_C)⊂L_B.
6. For every ω∈Ω_C some η∈Ω_B satisfies ρ(iω)−iη∈L_B.
7. For every j≥0 and every x∈Om_j(C) some y∈Om_j(B) satisfies ρ(x)−y∈L_B.
Proof: (1–4) by equality of quotient images and algebra-map laws; (5) Φ kills every relation generator by (3), extends by ideal-span induction (zero, sum, left multiplication); (6) by the Kähler lift's representative property; (7) by homogeneous submodule-power induction: scalar maps to scalar (j=0), addition adds representatives, multiplication by a degree-one element uses (6) and adds degrees. This preserves all quantifiers. In particular (5) needs DP compatibility and cannot be inferred merely from Leibniz.
Apply this to C=ER T, π=first projection, w=second projection. Leibniz is square-zero multiplication, base scalars have zero second component, DP identity follows exactly from snd_extDP and fst_extDP at L285–289, with the given a∈nb.J even though that proof does not use membership explicitly. All seven witnesses are now supplied by a theorem body.

## 3. Descent, uniqueness, and naturality
OneForm... L149–222: if ρ(x)−y and ρ(x)−y' belong to L_B then y−y' belongs to L_B by subtraction. Hence both give the same quotient class. The same argument with iω handles K1. Additivity follows by summing the representative congruences and the additive defect; zero by (5) on zero. Source relation elements map to zero by (5), so QuotientAddGroup.lift defines r1 and rK_j on their own respective quotients. The exact specifications are r1([ω])=[η] if ρ(iω)−iη∈L_B and rK_j([x])=[y] if ρ(x)−y∈L_B with both homogeneous of degree j. This establishes independence of the chosen target representatives. Independence of ρ itself follows from agreement on generators below; no canonical raw lift is claimed.

L231–246: two set maps f,g that are additive and multiplicative modulo L_B and agree modulo L_B on scalars and i dc agree everywhere by exterior generator induction. In the product step use
f(xy)−g(xy)=(f(xy)−f(x)f(y))−(g(xy)−g(x)g(y))+(f(x)−g(x))f(y)+g(x)(f(y)−g(y)).
Both ideal sides are needed. For addition expand similarly. This exact identity justifies comparing different chosen lifts, including compositions.

For every φ:T→T' the two compositions ρ_{T'} E(nbAlg φ) and E(φ)ρ_T agree modulo L_{B'}: on scalars they both have first component φπ; on differentials choose ω representing snd(c), then φ's induced one-form map represents snd(nbAlg φ(c)), by nbAlg_snd and km1_mk. DP morphisms preserve relation ideals (mDR_mem_rel). Therefore agreement propagates to all forms (natAgree L297–335). If ρ_T(x)≡y, the difference ρ_{T'}(E(nbAlg φ)x)−E(φ)y is sum of that agreement and E(φ)(ρ_T(x)−y), hence in L_{B'}. Quotient specs give r_{T'}M_j(Sφ)=M_j(φ)r_T. In degree 1 use iω and km1; in degrees 2,3 use mOm and km. This matches ExistsDiagonal... L39–54 and 75–85.

## 4. Section identities and exact conclusion
For u the induced composition ρ_T E(u) agrees modulo L_B with scalar inclusion after exterior augmentation: on b it is b, on db it is zero because snd(u(b))=0. For v it agrees with identity on b and db because snd(v(b))=d̄b. By agreement lemma these congruences hold on all forms (OneForm... L339–376). Augmentation annihilates every positive homogeneous degree (L248–257): a product containing a one-form has augmentation zero, sums preserve this; scalar base case impossible if j≠0. Thus on K_j, r_j M_j(u)=0 for j≠0, r_j M_j(v)=id for all j. Degree one separately uses augmentation(iω)=0 and r1 spec, not a substitution of K_j for K1.

ExistsDiagonal... L23–100 constructs S=nbF,u=uN,v=vN,r1 and rK at j=2,3. For all T,T',φ,x, naturality, zero after u and identity after v hold in each of the THREE coefficient systems M1,M2,M3: nine output predicates, all retained. No degree-zero zero-section identity and no claim r commutes with vertical differentials. This supplies precisely RUN17's input for the two-section horizontal acyclicity proof.

## 5. External assumption ledger delta
- T.exists_diagonal_firstNeighbourhood_retraction_forms, Statement L7–8: explicit wrapper of PDForm.Nbhd.exists_retraction, not a new axiom. Body reconstructed in sections 1,3,4.
- T.exists_formsMap_of_dividedPowerDerivation, Statement L7–8: explicit wrapper of PDForm.exists_lift_of_pdDerivation. Seven outputs and three premises reconstructed in section 2.
- T.divPowerCompatRel_filtration_twoSided_rel_eq_bot_of_base, Statement L7–8: explicit wrapper of PDForm.rel_two_sided_and_bot, native L152–161 assembling rel_filDR_properties and rel_eq_bot_of_map. Actual used conjunct is two-sidedness rel_mul_mem (L78), not conditional vanishing. Body located; full ideal/filtration argument not yet translated.
- nb, nbF, uN,vN, r1,rK, kq are explicit definitions; DP nilpotence/extDP and functor witnesses are actual inputs to these constructions, not discharged by definition names. OneForm... imports PublishedTheorems.Divisors₂.ExistsUniqueIsConnOfLift; import alone proves neither its use nor its axiom status. Its extDP/isDPDer/isDPMorphism supplier chain is next.
- Mathlib ExteriorAlgebra.lift, Derivation.liftKaehlerDifferential, QuotientAddGroup.lift, ideal-span and degree-power induction, classical representative choice: imported theorem/definition uses, not independent manuscript axioms on this source evidence. Transitive trust boundary and role-labelled root reachability OPEN. No published citation independently authenticated or new mathematical premise introduced. Do not infer kernel proof from statement wrapper names.

## 6. Pinned source ledger
Paths under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless indicated; GitHub-returned blob hashes, not independently recomputed:
- ExistsDiagonalFirstNeighbourhoodRetractionForms.lean 5f80de635aa0cf3a9c265f114a81124330e6948a
- ExistsDiagonalFirstNeighbourhoodRetractionFormsStatement.lean c8da2339c03418bb76c15d9a43f4c90668d3d5fd
- ExistsFormsMapOfDividedPowerDerivation.lean b20c125cf9ad1bd4040decb8447b91daa5f2ae69
- ExistsFormsMapOfDividedPowerDerivationStatement.lean e72403c3c733bf49a69690447e5211be182ae687
- OneFormQuotientClassEqOfRelDifferences.lean 216f0c1e8355a54428ace91f8351678a0fdba9bc
- DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBasStatement.lean 3211d9056706251ae770dad89d1fd23f093f81c9
- DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean e104c21949356bc49bd0bacd7bb2cc8a4b2950ef (anchors and final assembly inspected)
- Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean relative to AbelianVarietyTheory root, 25fb1d4b42084f570129c678837d37f622ad253a (selected definitions and declaration anchors inspected).
Reproduce blob identity with git show PIN:PATH | git hash-object --stdin. Head consolidates OneForm... (old path 404) and diagonal body in CrystallineForgetFormsBijectiveSiteAndPairs.lean blob 255566b8b8544c9e9b326fa6945a4f46273196a2; head ExistsFormsMap... blob 0dde2d439692ee72b7e1a0b4fc810f943a546042; head DivPowerCompatRel... blob 188ed8d99cc5b77de5e655b09101352f3d0013e7. Executed exact-line LCS, not semantic comparison: pinned diagonal L23–100 vs head L535–612 76/78; pinned forms lift L32–116 vs head L69–154 79/85; pinned OneForm L33–376 vs head L163–506 336/344. Total 491/507 old lines aligned; windows include trailing boundaries. No independent kernel equivalence claim.

## 7. Executed regression: exterior quotient model
Deliberately finite model only, NOT actual DP geometry or Lean. F2 exterior algebra on seven source generators (three u, three v, one relation) and four target generators (three retained, one relation). The map sends u generators to zero, v generators to corresponding retained generators, source relation to target relation. Quotient by ideal generated by the relation. Test monomial basis, arbitrary single ideal-term perturbations of chosen lifts, cyclic permutation naturality and section identities in degrees 1–3. The additive and multiplicative checks are on pairs of basis monomials, not exhaustive arbitrary source vectors. Negative controls: degree zero not killed, violating relation preservation fails descent, arbitrary perturbation outside the relation changes class. Executed in JS V8, counts:
representatives 1024; mul 16384; nat 128; sections 14; neg 3; add 16384. Total positive checks counted 33934; three negative controls. The extra source-relation assertion for 64 monomials is not included in the positive count. Replay:
```js
const assert=(x,m)=>{if(!x)throw Error(m)};
const bit=m=>1<<m, project=x=>x&255;
function wedge(x,y){let z=0;for(let a=0;a<16;a++)if(x&bit(a))for(let b=0;b<16;b++)if((y&bit(b))&&!(a&b))z^=bit(a|b);return z}
function phi(m,bad=false){if(m&7)return 0;let n=(m>>3)&7;if(m&64){let b=bad?1:8;if(n&b)return 0;n|=b}return bit(n)}
function rot(m){return ((m&1)<<1)|((m&2)<<1)|((m&4)>>2)}
function rotS(m){return rot(m&7)|(rot((m>>3)&7)<<3)|(m&64)}
function rotT(x){let y=0;for(let m=0;m<16;m++)if(x&bit(m))y^=bit(rot(m&7)|(m&8));return y}
let representatives=0,mul=0,nat=0,sections=0,neg=0,add=0;
for(let m=0;m<128;m++){
 const q=project(phi(m));for(let j=8;j<16;j++){assert(project(phi(m)^bit(j))===q,"choice");representatives++}
 assert(project(phi(rotS(m)))===project(rotT(phi(m))),"naturality");nat++;
 if(m&64)assert(q===0,"source relation");
 for(let n=0;n<128;n++){assert(project(wedge(phi(m),phi(n)))===project((m&n)?0:phi(m|n)),"multiply");mul++;
 const a=phi(m)^bit(8+(m%8)),b=phi(n)^bit(8+(n%8)),c=phi(m)^phi(n)^bit(8+((m+n)%8));assert(project(a^b)===project(c),"add");add++}
}
for(let m=1;m<8;m++){assert(project(phi(m))===0&&project(phi(m<<3))===bit(m),"sections");sections+=2}
assert(project(phi(0))!==0,"degree zero negative");neg++;
assert(project(phi(64,true))!==0,"source relation negative");neg++;
assert(project(phi(8)^bit(2))!==project(phi(8)),"arbitrary nonrelation perturbation");neg++;
console.log({representatives,mul,nat,sections,neg,add});
```

RESULT: local diagonal retraction and universal forms-map reconstruction DONE at source level, two wrapper bodies expanded, third located. External provenance transitive audit PARTIAL. RESUME HERE: reconstruct native rel_mul_mem and rel_filDR_properties in DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean pinned L78–142, then actual extDP/isDPNilpotent_extend/isDPMorphism_extMap suppliers (navigate through OneForm... imports, don't treat PublishedTheorems name as proof). Preserve conditional rel_eq_bot_of_map separately; request authenticated role-labelled paths to Nbhd.exists_retraction and exists_lift_of_pdDerivation as well as RUN15–17 frontier. HANDOFF TO dependency, kernel, audit, integration, editor, geometry. Project OPEN.



## Appendix 9: specialists/kernel_extractor/RUN18_RESUME.md

# RUN18 — disk-bounded raw proof slice and de Bruijn scope certificate
2026-11-25. PARTIAL / genuine exported fixture executed in V8 / native full archive run registered but NOT executed here. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10 (00:06:45Z), compare 204 commits ahead of last inspected 9282d3a102c4aff0e6026746db2a8990f5d9cddd; not adopted. Toolchain still leanprover/lean4:v4.37.0-rc1. Read AGENTS, protocol, handoff, expansion, state/log/continuity/CI excerpts and recent integration/editor/geometry/literature/character boxes/math/audit/acceleration notes; not all 14 peer notes in full, blueprint not reopened. CI #403 is physics-only, not RH validation. No physics edits.
Prior RUN17 561baec2302910ec9344fd77bab33f51ca8960fc assumed a stable 61.57GB raw file. Local disk is 30GB available, no Lean, MIT DNS unavailable (curl exit 6). Acceleration RUN18 reports projection index but no expression-offset index; integration e169d46057980178889959d246d8c0690ce75b94 requests all four TLiftK generated proof roots. Dependency native report 45508109328 has exact owner identities. This contribution binds all 14 roots (6 previous + 8 new) and adds a compressed forward spool plus independent scope verification, rather than repeat role-name extraction.
Inputs: peer RUN17 script Git blob 45fc2bc30521a1607a7a763b114bba189c87e114; genuine Nat.add_succ fixture leanprover/lean4export commit 15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def; role reports d49fbcc22a2382039986b09ff91dd11af2ef2e7b, d04e0fb24160d3ee1be54cd50082f59526864d4e, d823c364f446f5066dbbc61f7e9cf9c891fcbdb2, deabbd86afc8f21d9897ba3bb74349178517fde3; archive SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, length 61570595788. Connector report/fixture identities retrieved; raw byte hashes not recomputed in V8; native CLI checks full report/fixture/script blob hashes and entire archive SHA. Source anchors EveryCharacter.lean 6ac769568b67f85f33565ba3e1eef7b91f53c55f; EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; HalfIndexLattices/TLiftK.lean 4b36fc43e988270944cef2fc1b5e9ee1493fc275 (integration matched). Fourth generated proof root is much later than the other three; do not infer binder scope or exact AF alias from role lists.
Theorem: given an acyclic ordered expression DAG, define m(bvar i)=i+1, m(app f a)=max(m(f),m(a)), m(binder A b)=max(m(A),m(b)-1), m(let A v b)=max(m(A),m(v),m(b)-1), m(leaf)=0; projections/metadata propagate the child. Then m(t) is the least number of outer binders needed for all de Bruijn occurrences to be in range, by structural induction. A binder domain and let value are outside the new binder; only body gains one. Independent context-depth traversal checks each (record ID, depth) instead. This establishes syntactic scope, not typechecking or definitional equality. Preserve ordered children, tagged names, levels, binder info, raw expression records, original role/structural metadata and witnesses. The raw archive is hashed even if spool ends early. Compress complete-line 8MiB blocks into bounded temporary storage, store SHA per frame, reverse scan only after full archive authentication. If the disk cap is reached and high root missing, explicitly report both TLiftK._proof_4 roots unresolved and retain the twelve other roots only after full authentication and successful verification. No silent fallback on parser errors. Worst-case O(total archive bytes plus reverse scans) time, O(compressed prefix up to cap) disk, bounded block memory plus selected records; no speed benchmark or URT-specific claim. Native I/O wrapper not executed here. No new #print axioms or kernel replay.
Actual V8 result:
```json
{
  "checks": 13,
  "negative": 5,
  "fixtureRoleChecks": 46,
  "fixtureNodes": 29,
  "independentScopedStates": 31,
  "fixtureSpines": [
    {
      "role": "type",
      "binders": [
        {
          "kind": "forallE",
          "name": [
            "n"
          ]
        },
        {
          "kind": "forallE",
          "name": [
            "m"
          ]
        }
      ]
    },
    {
      "role": "value",
      "binders": [
        {
          "kind": "lam",
          "name": [
            "n"
          ]
        },
        {
          "kind": "lam",
          "name": [
            "m"
          ]
        }
      ]
    }
  ],
  "targetRoots": [
    {
      "id": 550021,
      "role": "type",
      "root": 12992048,
      "records": 6,
      "edges": 6
    },
    {
      "id": 550020,
      "role": "type",
      "root": 3,
      "records": 1,
      "edges": 0
    },
    {
      "id": 550025,
      "role": "type",
      "root": 12992060,
      "records": 21,
      "edges": 24
    },
    {
      "id": 550025,
      "role": "rhs",
      "root": 12992065,
      "records": 25,
      "edges": 32
    },
    {
      "id": 326948,
      "role": "type",
      "root": 1025073,
      "records": 21,
      "edges": 26
    },
    {
      "id": 326948,
      "role": "value",
      "root": 44333,
      "records": 17,
      "edges": 20
    },
    {
      "id": 13125906,
      "role": "type",
      "root": 9078396,
      "records": 47,
      "edges": 64
    },
    {
      "id": 13125906,
      "role": "value",
      "root": 9078404,
      "records": 20,
      "edges": 24
    },
    {
      "id": 13125937,
      "role": "type",
      "root": 9838915,
      "records": 54,
      "edges": 72
    },
    {
      "id": 13125937,
      "role": "value",
      "root": 9838921,
      "records": 54,
      "edges": 74
    },
    {
      "id": 13125938,
      "role": "type",
      "root": 9838937,
      "records": 69,
      "edges": 94
    },
    {
      "id": 13125938,
      "role": "value",
      "root": 9838943,
      "records": 54,
      "edges": 74
    },
    {
      "id": 13125939,
      "role": "type",
      "root": 997980875,
      "records": 127,
      "edges": 186
    },
    {
      "id": 13125939,
      "role": "value",
      "root": 997980883,
      "records": 113,
      "edges": 166
    }
  ],
  "totalRoleRecords": 629,
  "totalRoleEdges": 862
}
```
Reproduce native fixture: node run18_bounded_raw_scope.mjs test /path/to/Nat.add_succ.ndjson (also retrieves four pinned reports). Full job: node run18_bounded_raw_scope.mjs --out /tmp/rh-raw-scope. No full archive raw expression claims until successful job output.
RESUME HERE: retrieve compute/rh-bounded-raw-scope-20261125/status.json and outputs/selected_raw_scope.json on cathedral-research-state; check complete versus explicit partial, exact raw binder spines for TLiftK._proof_1..4, EveryCharacter auxiliary, OpenLiterature constructor/recursor; if disk cap prevents proof_4 use a peer offset index or a targeted second pass, not a guessed statement. Map exact AF alias and both Units.map occurrences to pinned TLiftK L18–19. HANDOFF TO integration, editor, theta, Galois, literature, character boxes, dependencies, acceleration, audit. Full RH reconstruction OPEN.



## Appendix 10: specialists/on_acceleration/RUN18_RESUME.md

# Run 18 — native four-projection crash and streaming certificate (2026-11-25)

RESULT: PASS for native partial export indexing and replay; RH human proof remains OPEN. Starting source pin [40e56bab](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005), observed upstream HEAD 82c577caf1b8a66c76212d78a399234f55813d28 (not adopted). Root declaration ID 14065054. Evidence is elaborated-export direct role references, not a static name match, not independent Lean kernel verification and not full source-to-export binding.

Resolved previous native input transfer blocker: downloaded Actions ZIP artifacts through the authenticated connector and recovered the exact files in the native Linux execution environment, no synthetic substitutions. All four Git blob SHA-1 checks passed independently. In order for the certificate:

| Local file | Action run | Artifact ID | ZIP member (under job/outputs/) | Git blob SHA |
|---|---|---:|---|---|
| direct.json | [45423163512](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45423163512) | 14937732176 | solution_direct_roles.json | 64b935e4ef309f6c555912a377012c7708eda510 |
| frontier.json | [45457486389](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45457486389) | 14952948474 | solution_frontier_roles.json | d49fbcc22a2382039986b09ff91dd11af2ef2e7b |
| next.json | [45478579968](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45478579968) | 14962058506 | solution_next_root_roles.json | d04e0fb24160d3ee1be54cd50082f59526864d4e |
| literature.json | [45489010764](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45489010764) | 14966122558 | solution_literature_theta_frontier.json | d823c364f446f5066dbbc61f7e9cf9c891fcbdb2 |

First job had a source-anchor mismatch error after emitting its report; not a successful whole job. It is retained as partial typed evidence with the same immutable blob as Run17. Source SHA and archived export digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e are not interchangeable.

Native Python 3.13.5, SQLite 3.46.1, Linux x86_64. Reproduce: python run18_native_certificate.py direct.json frontier.json next.json literature.json. Executed with the existing durable_roles.py and stream_reverse.py functional prefixes, retrieved from repository; exact prefix lengths and cross-environment FNV-1a64 checks: 6729 / 6b24d3a2d52d2c9c and 3840 / e6f18932f5be0f1b. Remaining code in those files is CLI/synthetic tests, not invoked by this certificate. Script native Git blob expected 6f5030bf96991a65b9f033d826d06bd41d156ad0.

Native results: 142 owners, 142 exact raw receipts, 18,100 ordered role occurrence rows (4048 type, 14011 value, 37 structural, 4 recursor RHS), all match independent enumerator after reopening and after actual process exits before/after last batch transaction. Four idempotent replays, invalid root, wrong blob, role deletion, two process-exit controls passed. No supplied edge missing. Database 10,571,776 bytes. Input 5,900,691 bytes. Sequential merge times excluding JSON parse/hash: 3.276, 295.780, 43.035, 64.397 ms. Audit peak VmHWM 149808 KiB, includes all input and independent oracle. 143 reverse-reachable IDs; identical SHA256 dec4a9bbe1e75cc6ce5a0594f04d5b5db5c5165ea2e64ebe5fe676d474415820, same 15 seeds as RUN17.

| Mode | Reopened median ms | Warm median ms | Isolated worker VmHWM KiB | rchar | wchar | physical read/write bytes |
|---|---:|---:|---:|---:|---:|---|
| independent | 11.774096 | 11.319963 | 98104 | 935061 | 15638 | 0 / 262144 |
| shared | 4.188689 | 3.888796 | 98024 | 935061 | 15638 | 0 / 258048 |
| golden | 4.397479 | 3.869687 | 98040 | 935062 | 15638 | 0 / 258048 |
| periodic | 4.050595 | 3.654117 | 98044 | 935061 | 15638 | 0 / 258048 |

7 reopened + 7 warm trials per mode, 56 outputs, 112 count/hash checks plus four exact byte comparisons against independent fixed-point oracle. Reopened includes DB connection setup; warm retains connection. OS cache was NOT flushed, so true storage-cold timings unavailable; physical read counters zero. Same durability (fsync and atomic rename) for every mode. Warm shared speedup 2.91x; periodic faster than golden in this small workload; no statistically established golden advantage. Separate workers measure VmHWM instead of inherited parent getrusage maximum. Native SQLite B-tree operations logarithmic, not strict linear CPU; traversed edge visits linear in reachable occurrences for shared mode, plus index operations and seed order costs. Audit materializes bounded partial reports, not a full archive memory guarantee. No proof premise deleted. No arbitrary proof-search O(N) or complete proof-translation speed claim.

Raw timing arrays, reopened then warm:
- independent [13.154983,12.015394,11.441924,11.708529,11.458157,11.774096,11.838552]; [11.290349,11.319963,11.470175,11.01432,11.301175,11.834576,11.393692]
- shared [5.548997,4.37089,3.988674,4.188689,4.337611,4.111676,3.788807]; [3.969415,3.765483,4.197363,3.759073,4.042783,3.888796,3.636852]
- golden [6.362053,5.207751,4.479472,4.1346,4.069263,4.028412,4.397479]; [4.441244,3.869687,3.753515,4.293446,3.625755,3.711363,3.973251]
- periodic [5.236293,3.861435,4.149532,3.976896,4.248239,4.028993,4.050595]; [3.610022,3.936916,3.644814,3.567459,3.809878,3.685855,3.654117]

Read protocol, queue, expansion, latest 14 peer handoffs/excerpts, repository continuity and research runner state; CI branch runs mostly cancelled by concurrent pushes, latest integration pending on inspection. Blueprint not independently audited in this engineering run. Structure lane owns compression/scheduling; kernel lane owns native term decoding. Full archive offset reuse remains highest priority (61.57 GB repeated extraction), not solved by this projection index.

RESUME HERE: recover the existing authenticated full-solution declaration manifest artifact 14931267327 (run 45412286798) through the now-working ZIP transfer, then build a disk-backed name-to-ID/roots lookup plus exact incoming witness join for the 34 producer frontier without rescanning the archive. Coordinate with kernel lane's raw expression slicer; no invented expression-offset availability. HANDOFF TO dependencies, kernel, integration, structure, audit, editor. Project OPEN.


