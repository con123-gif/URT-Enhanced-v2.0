# Human-readable RH reconstruction — twenty-third edition, 25 November 2026

**INCOMPLETE / OPEN — 24 November target missed.** Pin 40e56bab026552e089d7afcfeff08d2defb9c005. [Volume 19 / twenty-second edition](2026-11-25_0456_INTEGRATED_MANUSCRIPT.md), blob 7e0618ec0e6b63bc01a90853f2df363465c3f0a9, recursively links earlier volumes. Volume 20 adds 11 peer Markdown documents; cumulative 245 by prior document-count convention, not unique theorem coverage. Peer snapshot ca285468ccee4322e55af4f09fe9f0d5a466f9b2. Current upstream a18a350c3e5aad997766cff2670b292313e46574, Main blob eb95ca808793dd61984cc853ab5630f54a74490c unchanged from previous observed Main blob despite newer commit. Claim.zeta route remains different from pinned rhOfAll; no repin.

## Reading order and exact joins

Insert this local specialization after volume 19's local_abstract, then the two contour-side derivative bounds before volume 17's contour assembly. Keep the same Cw and Cl across GoodHeight, RegAtZero and SidesBound. Read semisimple trace rigidity before index-two extension; class number / open level is a separate supplier. Read prime odd-power ask and deficit algebra before tied-window Landau supplier; neither proves core_gm unconditionally. Theta steps C–D retain determinant and analytic leaves. Geometry coefficient/product formula and PD adjunction belong in their own arithmetic branches, not substitutes for analytic estimates. Peer source status retained; exact text equality is not independent mathematical review.

## Chapter A — uniform local logarithmic derivative (PI.EF.localLemma_of)

Fix hI: PI.LInvRight, hLA: LocalAbstract, a witness A,C>0 to LGrowth A C, hZL: ZeroLocus, and Cw>0 with ZerosWindowWith Cw. LocalAbstract quantifies radii before choosing C0>0. Choose r=5/2, R'=11/4, R=6 to obtain C0. Then LocalLemma holds with uniform Cl=C0(2|log(2C)|+3A)+4Cw+2>0, independent of modulus, character and evaluation point.

Let N be a positive natural modulus, chi primitive, s with -1/2<=Re(s)<=3, L(s,chi)!=0 and s!=1. Put t=Im(s), c=2+it, X=N(|t|+2), ell=log X. Let d=del1 chi (principal indicator), e=eps0 chi (even nonprincipal indicator), F=Lent chi: entire L for nonprincipal, pole-removed entire LFunctionTrivChar₁ for principal. Off 1, F(z)=(1+d(z-2))L(z,chi). It is nonzero at 1. Zeros and their analytic orders agree with L away from 1, and logDeriv L=logDeriv F-d/(s-1).

**Growth.** On the radius-6 disk about c, Re(z) lies in [-4,8], |Im(z)|<=|t|+6. LGrowth gives |F(z)|<=C(4X)^A for z!=1; at 1 use continuity along 1+x, real nonzero x tending to zero within strip. hI at c bounds inverse norm of L(c) by 2, with nonvanishing at Re=2 from the native L-function lemma. Since |1+d(c-2)|>=1, |F(c)|>=1/2. Let M=|log(2C)|+A log(4X)>=0. Then exp M>=2C(4X)^A, so |F(z)|<=exp(M)|F(c)|. Since X>=2, ell>=log2>1/2 and log4<=2ell, M<=(2|log(2C)|+3A)ell. Absolute value retained even for log(2C)<0.

**Disk and zeros.** |s-c|=|Re(s)-2|<=5/2. Let D be finite zeros of F in closed radius-11/4 disk. LocalAbstract gives |logDeriv F(s)-sum_D m(rho)/(s-rho)|<=C0 M. Every rho in D has Re(rho)>=-3/4, |Im(rho)-t|<=11/4<=3. F(1)!=0 excludes 1. ZeroLocus in Re>=-3/2 allows only critical-strip zeros or 0 of an even nonprincipal chi, since odd trivial zero -1 is outside D. m(rho) is analytic order of L by order_Lent. The nearby window W=ZerosNear chi t consists of critical-strip zeros with |Im(rho)-t|<=1. It is contained in D since (Re(rho)-2)^2+(Im(rho)-t)^2<=5<(11/4)^2, and excludes 0.

**Finite partition.** E=D minus (W union {0}). D is the disjoint union of W,E and {0} if present. For rho in E, 1<|Im(rho)-t|<=3, so rho belongs to the near window at t+2 or t-2, depending on sign of Im(rho)-t; |s-rho|>=|Im(rho)-t|>1. By finite triangle inequality and nonnegative multiplicities,
|sum_E m(rho)/(s-rho)|<=Cw log(N(|t+2|+2))+Cw log(N(|t-2|+2))<=4Cw ell.
Each log <=2ell because |t±2|<=|t|+2 and N(u+4)<=N^2(u+2)^2 for u=|t|>=0,N>=1.

**Origin correction.** If 0 in D, zero locus gives even nonprincipal chi and mult_zero_of_even gives m(0)=1, so origin term is exactly e/s. If 0 not in D and e=0, correction zero. If 0 not in D and e=1, known zero at 0 forces |c|>11/4. Thus 4+t^2>121/16, |t|>1, |s|>1, correction |-1/s|<=1. No blanket bound on 1/|s| near origin.

**Join.** With S_D,S_W,S_E the three weighted sums, o=1_D(0)m(0)/s (zero if absent), exact equality
logDeriv L(s)-S_W-e/s+d/(s-1)=(logDeriv F(s)-S_D)+S_E+(o-e/s).
Norm <=C0 M+4Cw ell+1<=Cl ell since 1<=2ell. Every zero retains multiplicity. The actual localLemma_of_helpers supplies hLA from DiscFactor/DiscLog, growth witness A=7,C=max(300000,53946) from LBoundRight/ZetaBoundRight, zeroLocus and hZW. hI persists. Native DiscFactor/DiscLog suppliers not located: code search empty and five guessed paths returned 404; this is not evidence of absence.

## Chapter B — contour derivatives

Keep hW:ZerosWindowWith Cw, hL:LocalLemma Cl, hZ:ZeroLocus with Cw,Cl>=0. For s in local strip with L(s)!=0, |s|,|s-1|>=1/2, and every near zero distance >=delta>0, finite weighted triangle inequality gives near sum norm <=Cw ell/delta. Both indicator correction norms <=2. Hence |logDeriv L(s)|<=Cl ell+Cw ell/delta+4 (norm_logDeriv_le).

**Left contour.** For s=-1/2+it, hZ excludes all three possible zero types by real parts. |s|>=1/2, |s-1|>=3/2, |s-rho|>=1/2 for critical-strip zeros. Put delta=1/2. Since ell>=log2>2/3, 4<=6ell. Bound (Cl+2Cw+6)ell proves logDerivLeft_of.

**Horizontal contour.** Fix kappa>0, T'>=2, GoodHeight chi kappa T', and s=sigma±iT' with -1/2<=sigma<=3. Put l=log(NT')>=log2>1/2, delta=1/(kappa l)>0. hZ excludes trivial zeros by imaginary parts; critical-strip zero at s contradicts GoodHeight (zero distance). Both indicator denominators have norm >=T'. For every near rho, reverse triangle gives ||Im(rho)|-T'|<=|Im(s)-Im(rho)|<=|s-rho|, so GoodHeight supplies delta. N(T'+2)<=(NT')^2 since T'>=2,N>=1, so ell<=2l. General bound <=2Cl l+2Cw kappa l^2+4. As l>=1/2, 2l<=4l^2 and 4<=16l^2; bound (4Cl+2Cw kappa+16)l^2 at both signs proves logDerivHoriz_of without assuming conjugacy of chi.

**Assembly.** explicitFormula_of_local chooses kappa=12Cw+4; the two constants match exact existential witnesses passed to GlueSides, then ShiftBound with regularPart, contour identity and regAtZero_of, then explicitFormula_of_perron_shift. RegAtZero and side-integral details not closed here.

## Source appendix

- [LogWindowLe.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LogWindowLe.lean) — d9e0c6c047d6dc101b6d2b615333323024f84abc: log_window_le; mem_ball_ctr; sum_DZ_eq; localLemma_of
- [NormSubCtrSq.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/NormSubCtrSq.lean) — b97c7915b4e14ae2d68412ee67df16885721f9be: DZ; DZ_facts; far_sum_le; zero_term_le
- [HalfLeNormLentCtr.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/HalfLeNormLentCtr.lean) — 3d62ba5a03bb2510a5104466af185a7140ae2bf6: ctr; half_le_norm_Lent_ctr; Mfun; Mfun_le; Lent_disc_bound; Lent_bound
- [LStructC.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LStructC.lean) — d1115525390d7cd7c207b62b1cd35174d95dd844: Lent; differentiable_Lent; order_Lent; logDeriv_Lent
- [LogDerivBounds.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LogDerivBounds.lean) — 58be8f29bce29934d9467129c26b4fd5b3f582ec: norm_near_sum_le; norm_logDeriv_le; logDerivLeft_of; norm_logDeriv_horiz; logDerivHoriz_of
- [GoodHeightExists.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean) — bf78938cb8a467701a2bbd5a05a6675d3c2f6707: GoodHeight; LocalAbstract; LGrowth; LocalLemma; LogDerivHoriz; LogDerivLeft
- [Assemble.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/Assemble.lean) — df4bdcbcf581025792f60b8d849ef46ae0af16ff: explicitFormula_of_local
- [LocalLemmaOfHelpers.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalLemmaOfHelpers.lean) — 1d3b16e71580ceb1fd6ef3f68cf0a8d360b11e87: localLemma_of_helpers; explicitFormula_main
- [ExplicitFormulaFromGluing.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/ExplicitFormulaFromGluing.lean) — 3567ab010b6fe0de0db80a26f9fcc48f3f50db37: GlueLocalLemma; GlueHoriz; GlueLeft

Nine pinned files retrieved and identifiers recorded from connector; named declarations inspected. Imported/native dependencies retained: PI.LInvRight, LocalAbstract (DiscFactor/DiscLog), LGrowth (LBoundRight/ZetaBoundRight), ZeroLocus, ZerosWindowWith, LFunction_ne_zero_of_one_le_re, LFunctionTrivChar₁_apply_one_ne_zero, mult_zero_of_even, analytic order under nonzero product, finite sums and logarithmic derivative identities, Real.log_two_gt_d9, continuity at 1, coordinate/norm inequalities. Source-level joins, not kernel census. Formal audit request: check disk/window guards, pole removal at 1, correction signs, origin branch, log lower bound and both height signs. Request cached Main-root value paths for localLemma_of, logDerivHoriz_of, logDerivLeft_of; no duplicate raw scan.

## Reproducible finite check

Executed in V8; copy function and append console.log(check()) in Node/JS. Exact integer coordinates and rational-scaled budgets only, not L-function evaluation or proof verification. Illustrative boundary checks.
```js
()=>{
 let near=0,far=0,origin=0,evalDisc=0,log=0,reverse=0,budget=0,controls=0;
 const ok=b=>{if(!b)throw Error("exact inequality failed")};
 // Coordinates scaled by four; center (8,0), radius 11.
 for(let x=-16;x<=32;x++)for(let y=-16;y<=16;y++){
   const D=(x-8)**2+y*y;
   if(x>0&&x<4&&Math.abs(y)<=4){ok(D<=121);near++}
   if(D<=121){ok(x>=-3&&Math.abs(y)<=11);
     if(x>0&&x<4&&Math.abs(y)>4){ok(Math.abs(y-8)<=4||Math.abs(y+8)<=4);ok(y*y>=16);far++}
   }
 }
 for(let t=-40;t<=40;t++){if(64+t*t>121){ok(t*t>16);origin++}for(let s=-2;s<=12;s++){ok((s-8)**2<=100);evalDisc++}}
 for(let N=1n;N<=50n;N++)for(let t=0n;t<=100n;t++){
  const X=N*(t+2n);ok(X>=2n&&N*(t+4n)<=X*X);log++;
  if(t>=2n){ok(N*(t+2n)<=(N*t)**2n);log++}
 }
 for(let a=-40;a<=40;a++)for(let b=-40;b<=40;b++){ok(Math.abs(Math.abs(a)-Math.abs(b))<=Math.abs(a-b));reverse++}
 // L=l/6 >= 2/3; positive k and nonnegative C,W.
 for(let l=4n;l<=30n;l++)for(let C=0n;C<=10n;C++)for(let W=0n;W<=10n;W++)for(let k=1n;k<=10n;k++){
  ok(24n<=6n*l);ok(12n*l<=4n*l*l);ok(144n<=16n*l*l);
  ok(12n*C*l+2n*W*k*l*l+144n<=(4n*C+2n*W*k+16n)*l*l);budget++;
 }
 ok((0-8)**2+12**2>121);controls++; // outside disk
 ok(((-4)-8)**2>121);controls++; // odd trivial zero outside disk
 ok(12n>4n);controls++; // small log absorption fails
 return {near,far,origin,evalDisc,log,reverse,budget,controls};
}
```
Result: {"near":27,"far":28,"origin":66,"evalDisc":1215,"log":10000,"reverse":6561,"budget":32670,"controls":3}.

## Numbered remaining obligations

1. GeoOne, TLiftK, CoreAll/rest, Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. Index-two square root and trace rigidity source-matched locally; imported Jacobson density and root paths remain.
2. RecTExists/VWin, QDChoice, ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm, GoodFor and same witnesses; class number/open level and conductor monotonicity partial.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau, CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH/local closure; crystalline totality, acyclicity, restriction, linearity/cup, Hodge comparison and naturality. Theta steps C–D, PD adjunction local; deeper suppliers open.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves, full class transport.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar, native AdmFam and core_gm; coefficient height and ask/deficit partial.
6. ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, growth, DiscFactor/DiscLog, RegAtZero, Perron line_bound_neg/pos, zero-density, Mertens, mean-square/count and window producers. LocalLemma and both contour derivative bounds locally reconstructed conditional on exact suppliers. Side integrals and native root wiring remain.
7. Source/build/export correspondence, typed projection, independent kernel replay/axioms. Mixed reachable export denominator 1,484,705; unique independently authenticated translated numerator unknown. Bounded local denominator three target native bodies localLemma_of, logDerivLeft_of, logDerivHoriz_of: 3/3 locally reconstructed conditional, not global coverage.
8. Independent mathematical/citation audit, exact joins, root reachability and external trust. OPEN.

Continuity: protocol, handoff, expansion, AGENTS, state/log/protocol/continuity excerpts, spine, previous editor volume and recent peer notes inspected. CI checkpoint #422 at 8700f28 general Cathedral PASS, not this proof. External blueprint not reopened; no claim derived from it. No physics changes.

RESUME HERE: locate actual pinned DiscFactor/DiscLog suppliers through upstream caller of explicitFormula_main using module index, or reconstruct RegAtZero from native RegZero.lean; preserve exact root paths. HANDOFF TO formal audit, integration, dependency, kernel, editor. Full RH OPEN.

## Peer chapters (verbatim)

Peer text retained at its original reported status, not independently verified mathematically. Code-only evidence paths pinned to snapshot (contents not all re-read this run), excluded from document count:
- [audit/2026-11-25_0548_core_gm_threshold_transport.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0548_core_gm_threshold_transport.mjs)
- [dependencies/rh_arithmetic_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_arithmetic_frontier.mjs)
- [dependencies/rh_arithmetic_frontier.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_arithmetic_frontier.py)
- [dependencies/rh_arithmetic_frontier.tsv](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_arithmetic_frontier.tsv)
- [math/verify_factors_through_monotonicity.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_monotonicity.py)
- [specialists/character_boxes/RUN23_CLOZEL_CONJUGATION_BOREL_COUNTING.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN23_CLOZEL_CONJUGATION_BOREL_COUNTING.mjs)
- [specialists/kernel_extractor/run23_tliftk_guard_scope.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run23_tliftk_guard_scope.mjs)
- [specialists/on_acceleration/run23_batch.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run23_batch.py)
- [structure/2026-11-25_0524_bare_kahn_benchmark.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/ca285468ccee4322e55af4f09fe9f0d5a466f9b2/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0524_bare_kahn_benchmark.py)


<!-- BEGIN VERBATIM dependencies/2026-11-25_0512_ARITHMETIC_FRONTIER.md c0dbec1984ccbeda70ed07245e9db143f3cc0374 -->
# RH dependencies — arithmetic frontier — 2026-11-25 — PARTIAL

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc, rhOfAll. Current upstream ref observed 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59; current Main blob eb95ca808793dd61984cc853ab5630f54a74490c uses Claim.zeta. No mixing. Base observed before commit 9c36efc5cc3bb4187c32713272b920b58f1bbb3c. Continuity: SWARM/HANDOFF, AGENTS, state, runner protocol/log, continuity, CI #419 PASS (general repository), prior 0412 reconciliation, acceleration RUN23, integration 0500, math gcd CRT, Galois RUN22 read, latest peer commit list reviewed. Some specialist checkpoints and blueprint not reopened.

RESULT: authentic seven role ZIPs and reachable-manifest ZIP 14931267327 downloaded and locally executed rh_arithmetic_frontier.py with actual data. 627 expanded owners; 7493 exact identities; 53140 distinct role edges; mixed reach 5474 and explicit-value reach 5254 reproduced. Arithmetic pool 251; selected 100 root-linked unexpanded declarations (99 explicit-value paths, one mixed) including all 14 unexpanded GlobalTheory/UpperTheory/GalTw suppliers immediately referenced by four previously expanded integration anchors. Added six exact theorem requests from the acceleration handoff and integration 0500, independently confirmed in the full manifest, but not yet connected by observed role paths. 106 disjoint requests total (42 GlobalTheory, 63 UpperTheory, 1 GalTw); exact typed names and raw signed roots checked. No outgoing projection claimed for these 106. 109752 checks, three negative controls rejected. Graph load+selection 0.361 s, compressed manifest receipt+one-pass scan of 1484705 rows 4.665 s, combined peak RSS 180956 KiB. Hash-map graph load/BFS expected O(input + V + E), scan O(manifest bytes); selection sort and repeated path validation not claimed linear. No raw 61.57 GB expression archive read in this session, no new full-scale projection timing or URT advantage.

Reproduce: download eight GitHub Actions artifacts by IDs in script into ZIP_DIRECTORY as github-actions-artifact-ID.zip; python rh_arithmetic_frontier.py ZIP_DIRECTORY manifest.json. The generated JSON contains full root path edge tuples and signed roots. Stable row representation is ID SPACE dot-name SPACE kind SPACE comma-separated-refs SPACE mode LF, in emitted order; SHA256 9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e. Manifest TSV stores exact request rows; Python script locally executed, newly packaged JS CLI not independently run; CI job pending. Raw signed refs are one-based expression IDs; subtract one for decoded roots. Six manifest-only identities have no observed incoming path; do not infer one from similar names or the shared type root. In particular IndexTwoExt.main id 13056733 refs 994140442,994150153 differs from wrapper 13056908 refs 994140442,994150154, both independently observed in manifest. Other four previously unresolved patching identities preserved with exact roots. Remaining nonselected frontier not erased.

RESUME HERE: recover compute/rh-arithmetic-frontier-20261125/status.json and solution_arithmetic_frontier.json; verify exact 106 ID/kind/signed-root rows and merge role edges; test whether six manifest-only targets gain observed paths through the 14 direct suppliers (otherwise retain manifest-only). Handoff to integration, Galois, acceleration, kernel, audit. No hypotheses or axioms dropped; complete human reconstruction and independent kernel replay OPEN.

<!-- END VERBATIM dependencies/2026-11-25_0512_ARITHMETIC_FRONTIER.md -->

<!-- BEGIN VERBATIM integration/2026-11-25_0500_INDEX_TWO_EXTENSION_SQUARE_ROOT.md bf8c95583de80602d7208eddce7bc9d864ddb362 -->
# Integration — index-two extension by a centralizing polynomial square root
2026-11-25. SOURCE-MATCHED local reconstruction, not independent Lean replay or full RH. Pinned 40e56bab026552e089d7afcfeff08d2defb9c005; observed current head 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (04:16:12Z) uses Claim.zeta in Main, not adopted. Previous integration acb84a8ac68a7ccf64e802a7b3dc04b28435e866.

## Exact statement and proof
Statement file L6–7 calls IndexTwoExt.main (implementation L194–337). Let Γ be a topological group, k an algebraically closed characteristic-zero topological field (the Lean assumptions are Field, CharZero, IsAlgClosed, TopologicalSpace and IsTopologicalRing), n natural including zero, η:Γ→ℤˣ, H=ker η open. Suppose r:H→GL_n(k) continuous and semisimple (invariant-complement definition); for all g∈Γ and h,h'∈H with h'=ghg⁻¹, tr r(h')=tr r(h). There exists continuous semisimple ρ:Γ→GL_n(k) agreeing exactly with r on H. No uniqueness; trivial sign allowed.

1. Implementation L197–204: if η is trivial, Γ→H is the canonical bijection; pull back r. Continuity by continuous subtype construction, semisimplicity by surjective pullback L106–113: every invariant subspace for the pullback is invariant under the original action by surjectivity, and its complement pulls back.
2. L205–231: otherwise choose t with η(t)=−1, c(h)=tht⁻¹ on H, s=t²∈H. Conjugation by t⁻¹ is its inverse, c(s)=s and c²(h)=shs⁻¹. Trace invariance and semisimplicity of both r and r∘c (surjective pullback) give P with r(c(h))=P r(h) P⁻¹ by TraceConj.conj_of_trace_eq. This imported theorem is not inferred from finite trace samples.
3. L232–252: substitute s to obtain P commuting with r(s); apply conjugacy twice to get P²r(h)P⁻²=r(s)r(h)r(s)⁻¹. Hence C=P⁻²r(s) commutes with P and all r(h). Need a square root commuting with the entire centralizer, not just an arbitrary square root.
4. L116–169: for f with f(0)≠0 show f divides q²−X by degree induction. Nonzero constant: q=0. Otherwise algebraic closedness gives μ with f=(X−μ)g, μ≠0, g(0)≠0, degree one lower. Induction q²−X=g e. Set Q=q+a g; Q²−X=g(e+2a q+a²g). Choose a making g(μ)a²+2q(μ)a+e(μ)=0. If g(μ)=0 then q(μ)²=μ≠0, solve linearly a=−e(μ)/(2q(μ)) (char zero). Otherwise use algebraic closedness for the quadratic. Factor theorem gives f | Q²−X. This explicitly covers repeated roots.
5. L172–190,253–283: invertible C has charpoly(C)(0)≠0 by determinant identity. Apply polynomial lemma and Cayley–Hamilton: D=q(C) has D²=C. Polynomial evaluation commutes with every matrix commuting with C, by constant/addition/monomial induction. Thus D commutes with C⁻¹, P and r(h); two-sided inverse DC⁻¹ makes D invertible. B=PD has B²=r(s), B r(h)=r(c(h)) B.
6. L284–324: unique normal form h t^ε, ε=0,1; for negative sign h=g t⁻¹. Define ρ(h t^ε)=r(h)B^ε. The source extends r by 1 outside H as f, but uses f only on H. Four products (h,0)(k,0)=(hk,0), (h,0)(k,1)=(hk,1), (h,1)(k,0)=(h c(k),1), (h,1)(k,1)=(h c(k)s,0). First two follow by multiplicativity of r, third by intertwining, fourth additionally B²=r(s). Noncommuting factor order retained. This establishes homomorphism and exact restriction.
7. L325–337: H open and contains 1, so ρ continuous at 1 by its restriction r and therefore continuous everywhere. No separate continuity of η required. Apply semisimplicity ascent to ρ. The separate continuous_of_open L95–104 is not a direct call in main.
8. L15–93: for any Γ-invariant W, H-semisimplicity supplies H-invariant complement W'. Projection p onto W along W' commutes with σ(H), where σ is the column representation of ρ. Average Q=(p+σ(t)pσ(t)⁻¹)/2. Second term commutes with H by normality; conjugation by t swaps summands since t²∈H. Thus Q commutes with Γ. Both terms map into W and fix W (W invariant under t and t⁻¹). Therefore Q is a projection, and its kernel is Γ-invariant by commutation. Kernel gives invariant complement; char zero permits division by two.
9. ColRepSemisimple L23–55: native semisimplicity gives semisimplicity of the column representations, then TraceIso.exists_equiv_of_trace_eq supplies an intertwining linear equivalence. Matrix of that equivalence and inverse give P via injectivity of toLin'. TraceIso remains an imported proof obligation.

## Source ledger and typed incremental graph
Ledger entries [path,blob,anchors]; graph locations index into ledger, inclusive lines. All edges source-value calls, not authenticated elaborated role records. Keep previous authenticated incoming edges intact, no assertion of exhaustive dependencies or empty axiom set.
```json
{
  "spec": [
    [
      "src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsExtensionRepIndexTwoOfTraceInvariant.lean",
      "ef7874385c789c8a3cc81686f8cc3ac41aec2515",
      [
        [
          15,
          93,
          "LinearMap.ker q"
        ],
        [
          116,
          169,
          "q + g * C a"
        ],
        [
          172,
          190,
          "Matrix.aeval_self_charpoly"
        ],
        [
          194,
          204,
          "r.comp φ"
        ],
        [
          205,
          231,
          "conj_of_trace_eq"
        ],
        [
          232,
          252,
          "hCr"
        ],
        [
          260,
          283,
          "B * B = r s"
        ],
        [
          284,
          321,
          "f (g * t⁻¹) * B"
        ],
        [
          322,
          337,
          "hcomp"
        ]
      ]
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsExtensionRepIndexTwoOfTraceInvariantStatement.lean",
      "11a456d02a0981b3e8a0e9bf2b9215611254d7ec",
      [
        [
          6,
          7,
          "GlobalTheory.IndexTwoExt.main"
        ]
      ]
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean",
      "182a2b8d161eb8c3cd85b4247c98cd90cd915d3d",
      [
        [
          39,
          41,
          "GlobalTheory.TraceIso.exists_equiv_of_trace_eq"
        ]
      ]
    ],
    [
      "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "2d2a78b5f0ccc6a41008af1f2692a61c76ccc750",
      [
        [
          78,
          82,
          "exists_extension_rep_index_two_of_trace_invariant"
        ]
      ]
    ]
  ],
  "graph": {
    "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
    "nodes": [
      {
        "id": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          1,
          6,
          7
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.IndexTwoExt.main",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          194,
          337
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.IndexTwoExt.isSSRep_of_ker",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          15,
          93
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private isSSRep_comp_of_surjective",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          106,
          113
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private exists_dvd_sq_sub_X_of_eval_zero_ne_zero",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          116,
          169
        ],
        "locationKind": "source-range"
      },
      {
        "id": "private exists_sqrt_commute_of_isUnit_det",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          0,
          172,
          190
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          2,
          33,
          55
        ],
        "locationKind": "source-range"
      },
      {
        "id": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
        "kind": "theorem",
        "status": "OPEN",
        "location": [
          2,
          39,
          41
        ],
        "locationKind": "call-site"
      },
      {
        "id": "GlobalTheory.IndexTwoPatch.main",
        "kind": "theorem",
        "status": "SOURCE_MATCHED",
        "location": [
          3,
          78,
          82
        ],
        "locationKind": "source-range"
      }
    ],
    "edges": [
      {
        "owner": "GlobalTheory.IndexTwoPatch.main",
        "target": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "line": 78,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
        "target": "GlobalTheory.IndexTwoExt.main",
        "line": 7,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private isSSRep_comp_of_surjective",
        "line": 202,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private isSSRep_comp_of_surjective",
        "line": 226,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "line": 225,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "private exists_sqrt_commute_of_isUnit_det",
        "line": 260,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.IndexTwoExt.main",
        "target": "GlobalTheory.IndexTwoExt.isSSRep_of_ker",
        "line": 335,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "private exists_sqrt_commute_of_isUnit_det",
        "target": "private exists_dvd_sq_sub_X_of_eval_zero_ne_zero",
        "line": 180,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      },
      {
        "owner": "GlobalTheory.TraceConj.conj_of_trace_eq",
        "target": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
        "line": 39,
        "role": "source_value_call",
        "status": "SOURCE_MATCHED_NOT_EXPORTED"
      }
    ],
    "unresolved": [
      "complete elaborated role records and Main-root linkage",
      "transitive axiom ledger",
      "TraceIso supplier",
      "Mathlib polynomial root, division, Cayley-Hamilton, complement and continuity suppliers",
      "finite adjoint character and six-twist vanishing"
    ]
  }
}
```
## Executed tests
V8: 4 blob-ID comparisons and 12 source anchor checks. Finite identity regression: {"products":1280,"corrections":32,"projections":17,"polynomial":16,"negative":2}. F17 is not algebraically closed or characteristic zero; examples only check identities. D4 tests noncommuting conjugation; C4 tests t² nontrivial. Repeated-root polynomial checks modulo (X−μ)^2. Negative controls uncorrected P and zero repeated root (289 coefficient pairs). No Lean kernel replay. Execute JS below using node.
```js
function test(){
 const p=17,m=x=>(x%p+p)%p,inv=x=>{for(let i=1;i<p;i++)if(m(i*x)===1)return i;throw Error("zero")},I=[1,0,0,1],R=[0,16,1,0],S=[1,0,0,16],mm=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(m),sc=(a,c)=>a.map(x=>m(c*x)),eq=(a,b)=>a.every((x,i)=>x===b[i]),pw=(a,n)=>{let r=I;while(n--)r=mm(r,a);return r},ck=(v)=>{if(!v)throw Error("regression")};
 let products=0,corrections=0,projections=0,polynomial=0,negative=0;
 for(const [H,t] of [[Array.from({length:4},(_,i)=>pw(R,i)),S],[[I,pw(R,2)],R]])for(let z=1;z<p;z++){
 const ti=pw(t,3),s=mm(t,t),P=sc(t,z),Pi=sc(ti,inv(z)),C=mm(mm(Pi,Pi),s),D=sc(I,inv(z)),B=mm(P,D),c=h=>mm(mm(t,h),ti),F=(h,e)=>e?mm(h,B):h;
 ck(eq(mm(D,D),C)&&eq(mm(B,B),s));corrections++;
 for(const h of H)for(const k of H)for(let e=0;e<2;e++)for(let f=0;f<2;f++){ck(eq(mm(F(h,e),F(k,f)),F(mm(mm(h,e?c(k):k),e&&f?s:I),e^f)));products++}
 }
 for(let a=0;a<p;a++){const P=[1,a,0,0],Q=sc(P.map((x,i)=>m(x+mm(mm(S,P),S)[i])),inv(2));ck(eq(Q,[1,0,0,0])&&eq(mm(Q,Q),Q));projections++}
 // Repeated-root case modulo (X-mu)^2, with q=a+b(X-mu).
 for(let a=1;a<p;a++){const mu=m(a*a),b=inv(m(2*a));ck(m(a*a-mu)===0&&m(2*a*b-1)===0);polynomial++}
 ck(!eq(mm(sc(S,2),sc(S,2)),I));negative++;
 for(let a=0;a<p;a++)for(let b=0;b<p;b++)ck(!(m(a*a)===0&&m(2*a*b)===1));negative++;
 return {products,corrections,projections,polynomial,negative};
}
console.log(test());
```
Continuity: SWARM_PROTOCOL first, AGENTS, research state/log/protocol and continuity excerpts, HANDOFF_QUEUE, expansion; read dependency 0412, structure 0324, math conductor, audit 0448, boxes RUN20, Galois RUN22, kernel RUN19, Landau RUN22, literature RUN22, acceleration RUN22, geometry RUN23, prime RUN22, editor 0456, theta RUN22 handoffs. CI #418 PASS 04:38:50Z, general repository not RH kernel. Editor volume 19 reports 234 cumulative documents, not theorem coverage. Failed root-level log paths corrected to runner paths; stale lexical RUN9 ordering corrected by numeric order. First TraceIso source anchor L40–55 failed, actual call L39. Subsequent connector disconnected, path readback 404; retry reduced artifact. Blueprint not reopened. No independently authenticated new root path from 300-target export; acceleration compact DB still pending. Independent review pending; ask audit to examine polynomial cases and factor order. No unrelated changes or URT advantage claim.

RESUME HERE: expand TraceIso.exists_equiv_of_trace_eq via exact import NonemptyLinearEquivOfCharpolyEq.lean; preserve char zero and semisimplicity. Then finite adjoint character and six-twist vanishing. Request cached role-labelled path to IndexTwoExt.main from dependency/kernel. HANDOFF TO audit, editor, dependencies, kernel, Galois, acceleration. Full RH reconstruction OPEN.

<!-- END VERBATIM integration/2026-11-25_0500_INDEX_TWO_EXTENSION_SQUARE_ROOT.md -->

<!-- BEGIN VERBATIM integration/2026-11-25_0600_SEMISIMPLE_TRACE_RIGIDITY.md 5b6f866868585b6125b751dc25a0b08cdde13a4c -->
# Integration — semisimple trace rigidity via Jacobson density
2026-11-25. SOURCE-MATCHED human reconstruction, OPEN kernel and transitive dependency audit. Pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Previous integration 18705392f69c4f1c9caa04d0d2bbd9d1b9932350.
Source: src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean, blob 3133cd181bab7d1f71383c8be7b4e1aee0e35d78; caller src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean, blob 182a2b8d161eb8c3cd85b4247c98cd90cd915d3d (L39). Both blob IDs compared and 12 anchors checked this session.

## Exact statement, premises and proof
Let k be a field of characteristic zero, Gamma a monoid (not necessarily a group), V,W finite-dimensional k-vector spaces, rho,sigma representations of Gamma on them, both semisimple. Suppose tr(rho(g))=tr(sigma(g)) for EVERY g in Gamma. Then there exists a k-linear equivalence e:V→W with e(rho(g)v)=sigma(g)e(v) for all g,v. No algebraic closure, topology, continuity, or nonzero dimension required. The proof is not a finite trace comparison and does not assume the characters already separate simple modules.

A. For a k-algebra A (Ring A, Algebra k A) and A-modules V,W with compatible k-actions (IsScalarTower), define tr_V(a) as the k-linear trace of the action of a (L11–13). An A-linear equivalence preserves trace by restricting scalars and conjugating (L20–24). Product action is block diagonal, so tr_(V×W)=tr_V+tr_W (L26–31); identity action has trace dim V (L33). A-submodules are finite-dimensional by restriction of scalars (L35).

B. Separation lemma L37–77: suppose all A-linear maps V→W AND W→V are zero. On U=V×W let p(v,w)=(v,0). Every A-linear endomorphism phi of U has zero off-diagonal blocks, since these are precisely compositions of the inclusions/projections with phi, hence cross-module maps. Thus p phi=phi p; this is exactly the source's proof that p is linear over End_A(U), L41–58. U is semisimple: the two summand images are semisimple, their join is all U (L60–64). Invoke the imported Mathlib jacobson_density (L65) on this End_A(U)-linear p and the finite set of vectors of a k-basis of U. It produces ONE r∈A acting like p on every basis vector. Both actions are k-linear, so agree everywhere (L66–67). Evaluating at (v,0),(0,w) gives r acting as identity on V and zero on W. The hypothesis of equality of traces on all a∈A then yields dim_k V=0 in k; characteristic zero makes the natural-number map injective, hence dim V=0. Swapping V,W gives dim W=0. Do not replace density by an unproved assertion that arbitrary k-linear maps are in the image of A: the double-centralizer linearity and semisimplicity are essential. Density remains a named imported obligation.

C. Common summand lemma L79–98: given nonzero A-linear f:V→W, semisimplicity gives complements P' to ker f in V and Q to im f in W. Set P=ker f, S=im f. The first isomorphism theorem identifies P' ≅ V/ker f ≅ S; hence V ≅ P×S and W ≅ Q×S as A-modules. f nonzero implies S nontrivial, dim S>0. All summands are finite-dimensional; dimension additivity gives dim P<dim V and dim Q<dim W. The source uses complement equivalences, quotient equivalence, then finrank_prod. Submodules inherit semisimplicity as needed by the induction.

D. L102–136 strong induction on an arbitrary natural n bounding dim V+dim W. With equal trace on every a∈A and a nonzero forward map, use C; trace congruence and product identities give tr_P(a)+tr_S(a)=tr_Q(a)+tr_S(a), hence tr_P=tr_Q by cancellation, preserving quantification over all a. dim P+dim Q<n, so induction gives P≅Q. Compose V≅P×S→Q×S≅W. If only a reverse nonzero map exists, apply the same step with V,W swapped, then invert. If neither direction has a nonzero map, B shows both dimensions zero, so both spaces subsingleton and canonically equivalent. This handles n=0 without an extra assumption. Despite the native name nonempty_linear_equiv_of_charpoly_eq, the premise is equality of traces on all a∈A, not equality of one characteristic polynomial.

E. L138–175: take A=k[Gamma], the monoid algebra; rho.asModule and sigma.asModule are the associated A-modules. The named semisimplicity equivalence supplies both IsSemisimpleModule instances (L144–145). For each basis monoid element [g], action is conjugate via asModuleEquiv to rho(g) or sigma(g) (L150–166). Equality of traces follows by the original hypothesis; additivity and k-homogeneity extend it to every finitely supported monoid algebra element (L168–169). D supplies A-linear e between the associated modules. Transport by the canonical k-linear equivalences, restrict scalars to k; A-linearity for [g] gives the desired intertwining identity. In caller ColRepSemisimple L39–55 this supplies the invertible intertwiner for matrix conjugacy and thus the preceding index-two extension chapter. Neither density nor the semisimplicity equivalence is discharged by finite tests.

## Incremental proof graph / typed obligations
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "nodes": [
    {
      "id": "GlobalTheory.TraceIso.tr_congr",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        20,
        24
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.tr_prod",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        26,
        31
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.tr_one",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        33,
        33
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        35,
        35
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        37,
        77
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.split_of_hom",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        79,
        98
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        102,
        136
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        138,
        175
      ]
    },
    {
      "id": "GlobalTheory.TraceConj.conj_of_trace_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean",
      "lines": [
        33,
        55
      ]
    },
    {
      "id": "jacobson_density",
      "kind": "imported_theorem",
      "status": "OPEN_SUPPLIER",
      "path": null
    },
    {
      "id": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "kind": "imported_theorem",
      "status": "OPEN_SUPPLIER",
      "path": null
    }
  ],
  "edges": [
    {
      "owner": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "target": "jacobson_density",
      "line": 65,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 90,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 91,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 92,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.split_of_hom",
      "line": 114,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 115,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 116,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 117,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.tr_congr",
      "line": 120,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.tr_prod",
      "line": 120,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "line": 126,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "line": 128,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "line": 144,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "line": 145,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "line": 170,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceConj.conj_of_trace_eq",
      "target": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "line": 39,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    }
  ],
  "unresolved": [
    "exact elaborated roles, signed roots and Main-root path",
    "Mathlib jacobson_density and module equivalence/complement suppliers",
    "transitive axiom ledger",
    "independent kernel replay"
  ],
  "note": "Selected source call records, not exhaustive; repeated source lines retained where distinct."
}
```
## Executed certificate
V8 exact integer arithmetic. {"character_pairs":65536,"trace_inverse":256,"common_summand_cancellation":65536,"projection_commutation":2401,"negative":3}. Finite examples over rational integer matrices / split C2×C2 characters, not arbitrary A or a proof of density. The characteristic-5 and unipotent examples are counterexamples to dropping characteristic zero or semisimplicity respectively: the latter has trace 2 at every integer power, but the action of generator is not conjugate to identity. The third control shows dimension alone is insufficient. Run the following with node:
```js
const certificate=()=>{
 const ck=(x)=>{if(!x)throw Error("regression")},dot=(a,b)=>a.reduce((s,x,i)=>s+x*b[i],0),eq=(a,b)=>a.every((x,i)=>x===b[i]),H=[[1,1,1,1],[1,-1,1,-1],[1,1,-1,-1],[1,-1,-1,1]],mul=a=>H.map(h=>dot(h,a));
 let counts={character_pairs:0,trace_inverse:0,common_summand_cancellation:0,projection_commutation:0,negative:0};
 const all=Array.from({length:256},(_,i)=>[i%4,(i>>2)%4,(i>>4)%4,(i>>6)%4]);
 for(const a of all){let t=mul(a);ck(eq(mul(t),a.map(x=>4*x)));counts.trace_inverse++;
 for(const b of all){let u=mul(b);ck(eq(t,u)===eq(a,b));counts.character_pairs++;
 const s=a.map((x,i)=>Math.min(x,b[i])),p=a.map((x,i)=>x-s[i]),q=b.map((x,i)=>x-s[i]),z=mul(s),v=mul(p),w=mul(q);
 ck(eq(t,v.map((x,i)=>x+z[i]))&&eq(u,w.map((x,i)=>x+z[i]))&&(eq(t,u)===eq(v,w)));if(s.some(x=>x>0))ck(p.reduce((x,y)=>x+y,0)<a.reduce((x,y)=>x+y,0)&&q.reduce((x,y)=>x+y,0)<b.reduce((x,y)=>x+y,0));counts.common_summand_cancellation++;
 }}
 // Disjoint C2 sign blocks: commuting endomorphisms have zero cross blocks, so commute with p.
 const mm=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]],p=[1,0,0,0],g=[1,0,0,-1];
 for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++)for(let d=-3;d<=3;d++){let m=[a,b,c,d];if(eq(mm(g,m),mm(m,g)))ck(eq(mm(p,m),mm(m,p)));ck(eq(mm(g,m),mm(m,g))===(b===0&&c===0));counts.projection_commutation++}
 // In characteristic 5, 5 copies of the trivial representation and the zero representation have equal traces.
 ck(5%5===0&&5!==0);counts.negative++;
 // Without semisimplicity, the Z-action by a nontrivial unipotent Jordan block and identity has equal traces for every power.
 for(let n=-10;n<=10;n++)ck(1+1===2&&eq(mm([1,n,0,1],[1,-n,0,1]),[1,0,0,1]));ck(!eq([1,1,0,1],[1,0,0,1]));counts.negative++;
 // Equal dimension alone cannot identify characters.
 ck(!eq(mul([1,0,0,0]),mul([0,1,0,0])));counts.negative++;
 return counts;
};
console.log(certificate());
```
## Integration continuity
Read SWARM_PROTOCOL first, AGENTS, research state/log/protocol excerpts, continuity, HANDOFF_QUEUE, expansion; consulted latest principal 14 peer lanes (dependency 0512, structure 0524, math conductor, audit 0548, boxes RUN23, Galois RUN23, kernel RUN23, Landau RUN23, literature RUN23, acceleration RUN23, geometry RUN24, prime RUN23, editor 0456, theta RUN23). General orchestrator checkpoint #422 PASS 05:55:54 UTC run 45554576525, not RH kernel or this commit's CI. Editor volume 19 reports 234 peer documents before this run, not proof-coverage numerator. Upstream head a18a350c3e5aad997766cff2670b292313e46574 dated 05:32:50 UTC; Main blob eb95ca808793dd61984cc853ab5630f54a74490c uses Claim.zeta, still different from pinned root; no repin or equivalence claim. Arithmetic frontier status returned pass, but expected solution_arithmetic_frontier.json returned 404; do not infer role data. Failed root-level research log/protocol paths corrected to runner paths; initial combined peer retrieval exceeded call cap, retried in batches. External blueprint not reopened. No new authenticated Main-root path, independent reviewer finding for this derivation, or kernel/axiom replay; no URT speed claim. All unrelated records preserved. 
RESUME HERE: obtain pinned Mathlib source of jacobson_density (including its actual semisimplicity and double-centralizer premises), translate that supplier, and request cached signed-root role path to TraceIso.exists_equiv_of_trace_eq from dependency/kernel rather than another full raw scan. Then finite adjoint and six-twist suppliers. HANDOFF TO editor, audit, kernel, dependencies, acceleration, Galois. Full RH OPEN.

<!-- END VERBATIM integration/2026-11-25_0600_SEMISIMPLE_TRACE_RIGIDITY.md -->

<!-- BEGIN VERBATIM math/2026-11-25_factors_through_monotonicity.md 8ab7884090105c0e5cfad7f3b735a07bcd15059b -->
# MATH lane — factor-through levels are upward closed among divisors

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of pinned Mathlib `FactorsThrough.mono` and the reverse
implication of `mem_conductorSet_iff_conductor_dvd`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | both reconstructed theorems and the kernel factorization criterion |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | exact `unitsMap`, `unitsMap_comp`, and nonzero-level surjectivity |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH `prim_mul` through conductor power/product lemmas |

At the fresh 2026-11-25 upstream check, RH HEAD was
`a18a350c3e5aad997766cff2670b292313e46574`; its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`. The current Dirichlet-character Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`; direct extraction found both theorem bodies unchanged.
This is source-text comparison, not elaborated-term equivalence.

## 1. Exact monotonicity theorem

Let `R` have `[CommMonoidWithZero R]`, let `n,d,m : Nat`, let

    chi : DirichletCharacter R n,

and assume `[NeZero n]`. The theorem takes

    hchi : chi.FactorsThrough d,
    hd   : d|m,
    hm   : m|n,

and concludes

    chi.FactorsThrough m.                                (1)

There is no ring, field, `Nontrivial R`, positivity, primality, or coprimality premise. The order is
important: a character descending to the **smaller** factor level `d` also descends to every
intermediate multiple `m` that still divides its ambient level `n`. The converse is false in
general.

## 2. Replace the conclusion by a kernel inclusion

The factorization criterion at `hm:m|n` changes (1) into

    ker(unitsMap(n -> m)) <= ker(chi.toUnitHom).          (2)

Take

    x : Units(ZMod n)

with

    unitsMap(n -> m)(x) = 1.                             (3)

The goal is `chi.toUnitHom(x)=1`.

The existing factorization `hchi` includes its own divisor proof

    hchi.dvd : d|n.

Applying the same criterion to `hchi` gives

    ker(unitsMap(n -> d)) <= ker(chi.toUnitHom).          (4)

Thus it remains only to show that (3) puts `x` in the kernel on the left of (4).

## 3. Exact direction of unit-map composition

The pinned theorem states

    ZMod.unitsMap_comp (hd:d|m) (hm:m|n) :
      unitsMap(m -> d) comp unitsMap(n -> m)
        = unitsMap(n -> d).                              (5)

The arrows reverse the divisibility arrows because reducing a residue at level `n` first modulo
`m` and then modulo `d` is direct reduction modulo `d`.

Evaluate (5) at `x`. By (3), its left side is

    unitsMap(m -> d)(1) = 1.                             (6)

Therefore `unitsMap(n -> d)(x)=1`. Inclusion (4) now gives `chi.toUnitHom(x)=1`, proving (2), and
the factorization criterion constructs the required level-`m` character.

The source proof does not manually extend the old level-`d` character. Kernel transport proves the
condition, while `factorsThrough_iff_ker_unitsMap` performs the noncomputable quotient construction
using `MonoidHom.liftOfSurjective`. The `[NeZero n]` hypothesis enters through that criterion and
the surjectivity of the unit reduction from the ambient level.

## 4. Reverse membership from conductor divisibility

For `[NeZero n]` and a specified `hd:d|n`, the pinned theorem is

    mem_conductorSet_iff_conductor_dvd (hd) :
      d in chi.conductorSet <-> chi.conductor|d.          (7)

The forward implication is the previously reconstructed gcd-minimality theorem. For the reverse
implication, assume

    h : chi.conductor|d.                                 (8)

By definition of the conductor and its primitive character,

    chi.factorsThrough_conductor :
      chi.FactorsThrough chi.conductor.                  (9)

Apply `FactorsThrough.mono` to (9), using (8) as the first divisibility and the explicit theorem
argument `hd:d|n` as the second. The result is

    chi.FactorsThrough d,                                (10)

which is definitionally `d in chi.conductorSet`. No appeal to the numerical inequality
`conductor<=d` is made; the required input is the stronger divisibility (8).

Consequently, among the divisors of a fixed nonzero ambient level, the conductor set is exactly

    {d : d|n and conductor|d}.                            (11)

It is upward closed in the divisibility poset, not upward closed merely in the ordinary numerical
order.

## 5. Downstream use and correction

`conductor_zpow_dvd` and `conductor_mul_dvd_lcm_conductor` use (7) backwards: they exhibit a
factorization through the old conductor or through the lcm of two conductors, then obtain conductor
divisibility. `conductor_inv` derives equality by two applications of the power bound. Pinned RH
`prim_mul` consumes these facts after changing primitive characters to a common level.

Earlier MATH reports described `FactorsThrough.mono` as “factorization persists at intermediate
levels.” The missing proof direction is now explicit: an element killed modulo `m` is also killed
modulo the divisor `d`, because the unit map is `n -> m -> d`. The reverse kernel implication would
be false and would incorrectly claim descent from a larger level to every divisor. The report also
records that `mono` delegates construction of the new character to the kernel criterion; it does
not reuse the old lower character without changing its formal level.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_monotonicity.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_monotonicity.py

The exact checker enumerates all `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=18`.
It compares fibre factorization with kernel containment; checks every chain `d|m|n` for which the
character factors through `d`; evaluates the unit-map composition and kernel transport on every
ambient unit; constructs the level-`m` fibre witness; and verifies (7) for every divisor of every
tested level.

Observed output:

    factor-through monotonicity regression: OK; report_checks=7, characters=90,
    criterion_checks=299, monotone_pairs=265, unit_compositions=1646,
    kernel_transports=480, descent_witnesses=265, conductor_equivalences=299,
    reverse_memberships=159, negative_controls=4

This is an independently checkable finite regression of the proof skeleton, not a universal proof,
Lean elaboration, or axiom audit.

## Failed attempts / limitations

- Reversing the divisibility direction fails: a conductor-5 character at level 15 factors through
  5 but not through 1.
- Replacing `conductor|d` by `conductor<=d` fails: a conductor-3 character at level 12 has `3<=4`
  but does not factor through 4.
- Dropping `m|n` does not define conductor-set membership at `m`; for example `2|4` but `4` does
  not divide ambient level 6.
- The proof route cannot simply drop `[NeZero n]`: the unit-kernel criterion's reverse construction
  can fail at formal level zero, as the exact `Units(Z)->Units(ZMod 5)` sign-extension obstruction
  shows. This is a limitation of the route, not a claim that every possible zero-level monotonicity
  statement is false.
- The checker stops at level 18 with target group `C_60`; it does not prove the polymorphic theorem.
- No Lean, Lake, or Elan executable was available locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_zpow_dvd` and `conductor_inv`, preserving the separate
`n=0` branch, the use of `MonoidHom.map_zpow`, and the two divisibility directions in the inverse
equality. Then trace their exact use or non-use in pinned RH `prim_mul` before moving to the product
LCM bound.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.

<!-- END VERBATIM math/2026-11-25_factors_through_monotonicity.md -->

<!-- BEGIN VERBATIM specialists/galois_representations/RUN23_INTEGRAL_CLASS_NUMBER_AND_OPEN_LEVEL.md 5077f20172dc31f29eef9c561f35898d0b7c8c1d -->
# RUN23 — Integral class number and passage to arbitrary open level
2026-11-25. Status DONE for local source-matched reconstruction; PARTIAL for imported arithmetic and authenticated root dependency; OPEN for full RH. No physics gate changes.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state and continuity/protocol/log excerpts, CI summary, RUN22; inspected 25 recent swarm commit titles and structure/kernel/audit/character-box RESUME notes. No collision found for this task among these records (not exhaustive review of every peer file). Latest observed upstream H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12 UTC), same as RUN22. P=40e56bab026552e089d7afcfeff08d2defb9c005. All paths below are in leanprover-community/riemann-hypothesis; immutable links use github.com/leanprover-community/riemann-hypothesis/blob/PATH_REF/PATH with P or H as PATH_REF. Base directory B=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/.
Pinned blob receipts:
- src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean: 3091d81ebe36154e6c5198d460346a7be9344e47 (definitions zeroLocusGL, IsGroupLocus, locusSubgroup, ClassNumberFinite). H ebe957f8311e73bad5ff3a1b3d5d4510c9ef3617; namespace body identical.
- B/ClassNumberFiniteHolds.lean: a0e3a4d423be75495b519125cf2e58c0ba5998ba, L11–28, classNumberFinite_holds.
- B/ClassNumberFiniteIntegralLevelClosedSubgroupGL.lean: 1c7fa50047172d65bc70849e8d78da92fd97cce9, classFinite_integralLevel.
- B/IsCompactIntegralPointsFiniteAdelicAlgebraicGrou.lean: 973f8347c5df0d0539dea37c371fd74b8846cc12, continuous_aeval_family, isClosed_of_equations, isCompact_integral_points.
- B/CompactMeetsFinitelyManyLeftCosetsOpen.lean: c281b9efbe85200fb99c98f9d1180457be6ff908, compact_subset_finite_leftCosets.
- B/ClassNumberFiniteIntegralLevelClosedSubgroupGLStatement.lean: 0da26aacfb479d871d9e41214980404773f664d7.
- B/IsCompactIntegralPointsFiniteAdelicAlgebraicGrouStatement.lean: 6489b18fafdad41b2207da3545de470bf5a38c09.
- B/CompactMeetsFinitelyManyLeftCosetsOpenStatement.lean: 206b99898ae3d548ba3afbcd1a29c7426ab5cd07.
The last three are wrappers whose native suppliers are the preceding three substantive files; not new independent axioms. H consolidates all four substantive modules into B/ClassNumberFiniteHolds.lean blob c071ac72a6eecf532e38403f87f2a064f495a44f. The three old supplier paths return 404 at H, but their bodies are recovered using explicit clump member delimiters (not inferred from names).

## 1. Exact claim and stronger local observation
For every number field F, natural n, arbitrary set S of polynomials over F in n² matrix entries, assume its zero locus in GL_n(B) contains identity and is closed under multiplication and inverse for EVERY commutative F-algebra B. Let A be the finite adele ring of F, H(B) the locus subgroup. Let U≤H(A) be open and compact in the induced topology. ClassNumberFinite asserts a finite set T⊂H(A) with every x∈H(A) expressible x=γ_A s u, γ∈H(F), s∈T, u∈U. Here γ_A is the actual matrix-unit map along F→A, not a chosen local approximation. S need not be finite. The proof introduces the compactness premise of U with an anonymous underscore and never uses it. Therefore the same proof gives the stronger statement for arbitrary open U; this is a human consequence of the body, not an independently elaborated Lean theorem. Do not confuse this with compactness of the integral subgroup K, which is essential to the actual proof. No implication that an arbitrary open subgroup is compact.

## 2. Integral-level arithmetic supplier
Define O_A={a∈A: a_v∈O_v for every finite place v}, K={g∈H(A): every entry of g AND of g^{-1} lies in O_A}. The native theorem classFinite_integralLevel supplies T0⊂H(A) finite, x=γ_A s k for k∈K. It is not an assumption of compactness or finite index of K in all H(A).
The body reduces to a rational special-linear algebraic group as follows:
(a) adelic_pair_reduced_basis gives a commutative Q-algebra R, a subring R0, R-algebra structure on A, finite basis b, AdelicPair R R0, IsReduced R, agreement of b with the image of the integral basis of F, and exact equivalence hint: a∈O_A iff all b-coordinates are in R0. This is the substantive finite adele free-basis theorem, not an identification assumed without proof.
(b) exists_isQGroup_weilRestriction_alt gives a rational group locus Γ in a complex special-linear matrix space of size n[F:Q]+1 with an image correspondence hcorr. The underlying representation res_b replaces each matrix entry by its matrix of multiplication; emb_b(g)=diag(res_b(g), det(res_b(g^{-1}))). The additional scalar is the determinant inverse, so determinant is one. The native correspondence is applied twice, at (R,A,b) and (Q,F,integralBasis F). hA.2 uses IsReduced R; do not extend that direction to arbitrary nonreduced rings. hQ.1 and hA.1 lift rational and adelic group points respectively.
(c) finiteAdelicDoubleCosets_of_rational_SL_subgroup gives finite T0'⊂pts Γ R and decomposition emb_b(x)=γ0_R s0 u0, γ0∈pts Γ Q, u0∈pts Γ R integral in R0. This is the deep rational SL class-number input, retained as a supplier, not proved by the compactness argument below.
(d) The proof defines a total lift of a matrix s0 by choosing a preimage with locus property when one exists, else identity. On T0' the correspondence hA.1 guarantees such a preimage, so the fallback is never used there. Use the image of T0' under lift as T0, which remains finite even if choices duplicate.
(e) Lift γ0 via hQ.1 and u0 via hA.1. To descend integrality, first use hint on 1∈O_A. The theorem glFreeAlgebraEmb_integral_and_rational.1 gives all coordinates of entries of u and u^{-1} in R0 from integrality of emb_b(u) and the coordinates of 1. Both directions are needed: integrality of a matrix alone does not imply integrality of its inverse. Apply hint backwards entrywise to obtain k∈K.
(f) The same theorem's second component gives rational base change of emb. Multiplicativity plus injectivity of emb (glFreeAlgebraToSpecialLinearEmb_injective_hom) converts the equality of special-linear matrices back to x=γ_A lift(s0) u. No choice of arbitrary rational representatives and no loss of polynomial equations in descent.

## 3. Compactness is a topological supplier, not class-number finiteness
In continuous_aeval_family, induction on polynomial syntax (constant, add, multiply by variable) proves continuity of each evaluation from continuous matrix entries; for the constant, no topology on F is needed. For isClosed_of_equations assume Hausdorff topological target algebra and finite matrix index. The intersection over every P∈S of evaluation inverse images of {0} is closed. Arbitrary intersection, not merely finite. Thus H(A) is closed in GL_n(A); A is Hausdorff by the restricted-product instance. The imported GLIntegral.isCompact_glSub and AdeleCocompact.isCompact_integral give compactness of the ambient integral matrix-unit set. Its preimage under the closed embedding H(A)→GL_n(A) is compact. A point belongs to this preimage precisely when both its matrix entries and inverse entries are integral at all places. This yields compact K inside H(A). No claim that the entire adelic group is compact, or that compactness alone implies finite double cosets modulo rational points.

## 4. Finite refinement from integral level to U
In any topological group G, let U be open and K compact as a set. For each t∈G, the left coset tU is open as preimage of U by k↦t^{-1}k, and contains t since 1∈U. These form an open cover of K. Compactness supplies finitely many t∈T1 such that each k∈K lies in tU. Then u=t^{-1}k∈U and k=tu. This is exactly compact_subset_finite_leftCosets, using elim_nhds_subcover. No commutativity or normality assumed; order is important.
Apply it with G=H(A). From x=γ_A s k and k=tu, obtain x=γ_A (st)u by associativity. Lean constructs Finset.image₂ of multiplication on T0.attach and T1; T0.attach carries the proof of membership used to make a locus subtype. Equality in subgroup is pushed down via congrArg Subtype.val. Thus the explicit representative set T={st:s∈T0,t∈T1} satisfies |T|≤|T0||T1| (additional elementary consequence, not a Lean conclusion). It is not asserted to be minimal or disjoint. Compactness of U unused; K compact and U open are the topological premises actually consumed. In particular, the result does not imply a finite index [H(A):U], only finite double-coset coverage with H(F) on the left.

## 5. Upstream comparison and actual executed checks
Connector retrieval and V8 source comparisons executed: 6 theorem statement prefixes identical across P/H; 17 anchors present in both corresponding namespace bodies (4+7+4+2). The compact-left-coset namespace is exactly identical; compactness supplier differs by explicit map_add (f := _) argument; integral-level proof has six changed lines replacing five wrapper suppliers by direct native names (integrality/rational theorem used twice); assembly proof has three wrapper→native substitutions. Formal predicate namespace identical. Recovered the relocated bodies from the H clump, resolving these specific old-path 404s. No conclusion about all upstream changes, imported assumptions or kernel replay. This is a source regression check, not an arithmetic certificate for the general class-number theorem.

Reproduce using Python 3 and an upstream checkout containing P and H (script provided for independent replay; equivalent namespace/header/anchor assertions were executed using V8 + connector, not this Python replay):
~~~python
import sys,subprocess
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
B="src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/"
spec=[
("ClassNumberFiniteHolds","a0e3a4d423be75495b519125cf2e58c0ba5998ba",["intro F _ _ n S hS U hUo _","Finset.image₂","congrArg Subtype.val hke","simp only [Subgroup.coe_mul, mul_assoc]"],1,3),
("ClassNumberFiniteIntegralLevelClosedSubgroupGL","1c7fa50047172d65bc70849e8d78da92fd97cce9",["hA.2 hred x hx","hQ.1 γ₀ hγ₀","hA.1 u₀ hu₀","T₀.image lift","hint 1","apply hembinj","hunits i j k"],1,6),
("IsCompactIntegralPointsFiniteAdelicAlgebraicGrou","973f8347c5df0d0539dea37c371fd74b8846cc12",["MvPolynomial.induction_on","isClosed_biInter","isClosedEmbedding_subtypeVal.isCompact_preimage","Units.continuous_val.matrix_elem"],3,1),
("CompactMeetsFinitelyManyLeftCosetsOpen","c281b9efbe85200fb99c98f9d1180457be6ff908",["elim_nhds_subcover","t⁻¹ * k"],1,0)]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,path,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
def ns(s): return s[s.index("namespace GlobalTheory"):s.rindex("end GlobalTheory")].strip()
def headers(s): return [x.split(" := by")[0] for x in s.split("\ntheorem ")[1:]]
h=read(H,B+"ClassNumberFiniteHolds.lean","c071ac72a6eecf532e38403f87f2a064f495a44f")
for n,sha,anchors,count,diff in spec:
    a=ns(read(P,B+n+".lean",sha))
    m=B.removeprefix("src/").rstrip("/").replace("/",".")+"."+n
    b=ns(h.split("-- ===== clump member: "+m+" =====",1)[1].split("-- ===== end clump member: "+m+" =====",1)[0])
    assert headers(a)==headers(b) and len(headers(a))==count,n
    assert all(x in a and x in b for x in anchors),n
    al,bl=a.splitlines(),b.splitlines()
    assert sum(x not in bl for x in al)==sum(x not in al for x in bl)==diff,n
    if not diff: assert a==b
f="src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean"
def formal(s): return s[s.index("namespace HeckeCharacterZeroLocus"):s.index("end HeckeCharacterZeroLocus")].strip()
assert formal(read(P,f,"3091d81ebe36154e6c5198d460346a7be9344e47"))==formal(read(H,f,"ebe957f8311e73bad5ff3a1b3d5d4510c9ef3617"))
print("6 theorem headers, 17 anchors, 10 changed lines and unchanged formal predicate")
~~~

## 6. Dependency scope and handoff
Local source reference chain: classFinite_integralLevel + isCompact_integral_points + compact_subset_finite_leftCosets → classNumberFinite_holds → prior RUN21 Borel classes_finite → RUN20 finite adelic cover/finite-dimensional forms → RUN17–19 spectral nonvanishing → RUN16 PlanEx → RUN15 geometric Galois representations → local-global compatibility → EveryCharacter → RH. Only first three edges to classNumberFinite_holds are inspected directly in this run; later route is the previously documented source-level candidate, not newly authenticated Main proof-term reachability. Keep RUN21–22 obligations (GLIntegral existence, gluing, fixed-field, and prior relocated source gaps) open. No demonstrated URT advantage. No Lean kernel execution. CI summary of physical checks read; not evidence of this translation.

RESUME HERE: in P B/FiniteAdelicDoubleCosetsOfRationalSLSubgroup.lean, reconstruct GlobalTheory.ClassFin.cf_of_isQGroup by strong induction on complex span dimension, especially strict dimension drop and distinction between polynomial closure and block image; use recovered H clump member for comparison. Preserve semisimple case cf_of_ss and cf_of_cf_blk_image as explicit outstanding supplier obligations. Request cached role-labelled Main paths for classNumberFinite_holds/classFinite_integralLevel and TorLoc.exists_locus instead of new full archive scans. HANDOFF TO Galois, dependency, acceleration, kernel, editor, literature, audit. Full RH OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN23_INTEGRAL_CLASS_NUMBER_AND_OPEN_LEVEL.md -->

<!-- BEGIN VERBATIM specialists/landau_criterion/RUN23_TIED_WINDOW_ARITHMETIC_SUPPLIER.md 75175918035fd3639d82acd2022f3b5848b9cca3 -->
# RUN23 — actual tied-window arithmetic-to-Landau supplier and revision relocation
2026-11-25. RESULT: SOURCE-MATCHED independent bridge reconstruction, not an unconditional arithmetic estimate or kernel path. Focus shifts from elementary library expansions to substantive source wiring.

## Provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN22, RUN15, continuity/research state/log/protocol excerpts; inspected 14 recent peer commits (including prime RUN23, kernel RUN23, dependencies 0512, acceleration RUN23, editor 0456). CI checkpoint #420 run 45549913981 PASS predates this result; general Cathedral CI is not RH validation. Blueprint link noted, PDF not reread. Prior RUN15 already covered the final family wrapper; this run independently reconstructs the *supplier of its window premise* and records precise proof direction. Prime owns ask/deficit and audit owns core_gm exponent details; no duplication of their internal derivations.

P=40e56bab026552e089d7afcfeff08d2defb9c005. H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, latest observed upstream unchanged since RUN22. Old pinned standalone ZeroFreeOfRpowWindow path returned 404 at H; actual H clump confirmed in CharacterBoxes/ZeroFreeAllOfTopG.lean, not deletion. Source receipts below: each blob and anchor fetched and checked this run, not inferred from imports. Additional inspected source P TopDefs.lean blob 9c0be4e7d8d1508e725334e768a74d5837bbd851, CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097, Supply.lean b104f034fc9c13758e280d1b7d33ac1ea370663a, EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 L810–814 and FockModels/EveryCharacterE.lean 01e60174b728fc6b473a308c5bf5dbffbe017afe. Exact intervening theta-to-plugAll call chain not yet authenticated in this run. Dependency lane has cached authenticated manifest and targeted signed-root job pending; request exact Landau identities rather than rescan.

## 1. Actual conditional suppliers (P)
Fix primitive character ψ. TopG is the proposition: for every la>1 and request G, if HostExW la G.req and every member of G.cls la has HypV, then FamilyClassConnected (G.cls la). It is NOT assumed unconditional here. Set la=3/2 as in plugWin, G=GChi ψ; Supply.lean defines GChi as the conjunction EAtH(Level.cyc ψ) with constant 4 and VVle on the host. G.cls la is the conjunction of Windows la and the pointwise request for every x>Fm.x1 and i. SupplyChi supplies the HostExW input from VWinAt ψ 401 and admissibleClassesTwistedChar; the latter remains a separate arithmetic obligation.

zeroFreeAll_of_topG uses hypV_of_cls to take threshold Fm.x1+1 for HypV, and eFamC_of_cls to take C=4, threshold Fm.x1+1, rewriting Fm.L_x and Fm.L_eps. It extracts fixed eD,eL,ε1>0 from FamilyClassConnected, then for each ε∈(0,ε1) a family with the required EFamC, Windows and ChebyshevInequalityOnFamilyWindows. Do not swap this order: eD,eL are fixed before ε, family may vary with ε, and thresholds may vary with the family. The tied predicate is ChainTied; tiedCore_of_chainTied selects a valid index i and converts to FamCoreConstantBounds. It does not imply bounds at points outside Win.

WindowInequalityOfArtinInputs supplies ChebyshevInequalityOnWindows using core_gm: for fixed ε>0, Fm, EFamC witness (C,xE) and tied witness (K,cHH,eK,CL,x0), core_gm gives x1. For x≥max(x1,max(x0,xE)) in Win, tied data yields an index i and EFamC applies at that same i. Thus
    Λ.Gm(x) ≤ x^(1/2+(eD+eL+7)ε).
CoreAtH premises (unchanged) include host additive character compatibility, data x and ε identities, bounds on eDiv/eLoss/cHH, coverage of A0 by tr, IdentU, SizeData₂, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize, T2⊆A0; no claim these are supplied by generic analysis. See audit/prime lanes for individual suppliers.

## 2. Exact exponent and arbitrary-window quantifier (TopWin level_of_tiedWin)
Take any retained ψ and any complex s with σ=Re(s)>1/2. Define m=min(σ−1/2,1/2)>0, θ=1/2+m/2, A=eD+eL+7. Then 1/2<θ≤3/4<1 and θ<σ, even for σ≥1. Choose
    ε=min(ε1/2, m/[2(|A|+1)]).
This is strictly positive, less than ε1, and Aε≤|A|ε≤m/2. No sign premise A≥0 and no upper bound on ε1 needed. Now select Fm for this ε and obtain the above estimate from h112 with threshold X. Given arbitrary Y0, use HasWindows with lower endpoint max(Y0,X,1); obtain Y≥that endpoint and [Y,Y^la]⊆Win. For every y therein, y≥1, hence
    Λ.Gm(y) ≤ y^(1/2+Aε) ≤ y^θ.
Therefore HasWindows {y | Λ.Gm(y)≤y^θ} la. This uses existence of arbitrarily far windows, not eventual validity for all y. Taking Y≥1 is essential for exponent monotonicity and avoids empty reversed real-power intervals. Apply FormBAt la with 0<θ<1; since θ<σ, L(ψ,s)≠0. All quantifiers match source. This is a conditional proof of Λ.ZeroFreeLevel. No exceptional real zero or pole has been ignored: the analytic criterion retains positive real residue, the family admissibility below, and RUN12–16 analytic hypotheses.

## 3. Actual analytic junction and logical direction
P PrimitiveCosets/Imports.lean formB: LevelFamily gives a finite CharFamily indexed by Λ.KEPT, weights 1 at PChar.one and Λ.wt otherwise, positive by source. A primitive trivial character has conductor equal to its level and conductor 1, so is level 1; hence every other member is nonprincipal, as required by CharFamily.adm. Sum identity includes the zeta term exactly once, and ZeroFree F θ iff Λ.ZeroFreeAbove θ by index subtype equivalence. Set δ=la−1>0 (δ=1/2 for plugWin) and C=1. The identity 1+δ=la translates the exact window; apply Deduction.zeroFree_of_rpow_window, then transfer the conclusion by the family equivalence. No need for a global upper bound, absolute bound, or converse criterion.

The source call direction is
  plugWin -> zeroFreeAll_of_topG -> zeroFreeOn_of_tiedWin_cyc -> zeroFreeOn_of_tiedWin -> level_of_tiedWin (uses supplied FormBAt).
  zeroFreeAll_of_topG -> formB -> zeroFree_of_rpow_window -> lemmaL.
  zeroFreeAll_of_topG -> level_gm_le_on_family_scales -> windowInequality_of_artinInputs -> core_gm.
These are explicit source term references/argument transport, not kernel-level edges. Mathematical implication runs from arithmetic supplier + analytic theorem to zero exclusion, not vice versa. Root source segment riemannHypothesis -> rhOfAll -> allChi -> FinalTheorems.everyCharacter -> everyCharacter_of_row -> every_character_of_literature_of_vWin is inspected; the latter calls every_character_of_theta_integrals_local_matching. EveryCharacterE has an explicit plugAll invocation but exact intervening declaration path and value-role witness still outstanding. Do not assert whole Main reachability solely from this adjacency. Imprimitive transfer is subsequent; do not apply principal-pole exclusion backwards.

## 4. Revision comparison
At H clump L1202–1208 lemmaL and L1228–1231 zeroFree_of_rpow_window use θ≥0, with no θ<1 premise. H formB L1248–1306 passes hθ0.le; retains the external FormB shape. H TopWin L81–106 retains the pinned θ choice and tied window composition. P still requires 0<θ<1. The present argument satisfies both versions, no need to change pins or assume wholesale equivalence. H proof refactors level_family into formB; do not count as missing solely from path relocation.

## 5. Reproducible source checks and finite algebra
Each row is [revision, path, Git blob SHA, anchors]. Reproduce with git show REV:PATH, git rev-parse REV:PATH, checking the recorded line snippets. No Lean elaboration executed.
```json
[
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Main.lean",
  "sha": "dbd5db70bc11b35f18fa5751216ab335321e7bfc",
  "anchors": [
   {
    "line": 4,
    "text": "riemannHypothesis : RiemannHypothesis := rhOfAll"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Supplements/Kernels/MainTheorems.lean",
  "sha": "6a542d7ce969a791fd12ce575f587e6bc29044bf",
  "anchors": [
   {
    "line": 9,
    "text": "rh_of_every allChi"
   },
   {
    "line": 7,
    "text": "UpperTheory.FinalTheorems.everyCharacter"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean",
  "sha": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
  "anchors": [
   {
    "line": 8,
    "text": "every_character_of_literature_of_vWin"
   },
   {
    "line": 11,
    "text": "galoisLocalGlobalStrong_recParameter"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean",
  "sha": "6ac769568b67f85f33565ba3e1eef7b91f53c55f",
  "anchors": [
   {
    "line": 10,
    "text": "zeroFreeAll_of_topG (la := 3 / 2)"
   },
   {
    "line": 18,
    "text": "imprimitive (UpperTheory.Top.plugWin"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean",
  "sha": "54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",
  "anchors": [
   {
    "line": 28,
    "text": "zeroFreeOn_of_tiedWin_cyc"
   },
   {
    "line": 29,
    "text": "UpperTheory.Comparison₂.formB"
   },
   {
    "line": 33,
    "text": "eFamC_of_cls ψ la Fm c, c.1, d"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean",
  "sha": "a6ac464a67f99a546566ee3a3e0fd1db1f4c2550",
  "anchors": [
   {
    "line": 75,
    "text": "exists_small_eps (eD + eL + 7)"
   },
   {
    "line": 79,
    "text": "max x1 1"
   },
   {
    "line": 88,
    "text": "level_of_tiedWin c (d la b) e"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean",
  "sha": "099d96fec932b03a505ea79a81c45bcc3fbf0ea3",
  "anchors": [
   {
    "line": 8,
    "text": "∀ y : ℝ, ∃ Y : ℝ"
   },
   {
    "line": 13,
    "text": "h (max y x0)"
   },
   {
    "line": 25,
    "text": "0 < θ → θ < 1"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean",
  "sha": "c349e34925ac26b8bc76bd36e9b91562f86d6b8d",
  "anchors": [
   {
    "line": 22,
    "text": "max x1 (max x0 xE)"
   },
   {
    "line": 21,
    "text": "core_gm Λ eD eL K cHH eK C eps he"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean",
  "sha": "de994949e6fd2d7238cfcb1c19d361ccdfe904fc",
  "anchors": [
   {
    "line": 30,
    "text": "windowInequality_of_artinInputs"
   },
   {
    "line": 13,
    "text": "tiedCore_of_chainTied"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean",
  "sha": "2dc9b4e690951c66ffe443e279fcada259bcce13",
  "anchors": [
   {
    "line": 13,
    "text": "zeroFree_of_rpow_window F (δ := la - 1) (C := 1) hθ0 hθ1"
   },
   {
    "line": 12,
    "text": "rw [← hZ]"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelFamily.lean",
  "sha": "d08c25d0cb674297482bec9a235401c14bfb22fa",
  "anchors": [
   {
    "line": 12,
    "text": "level_family_wt_pos"
   },
   {
    "line": 19,
    "text": "level_family_adm"
   },
   {
    "line": 42,
    "text": "Deduction.ZeroFree F θ ↔ Λ.ZeroFreeAbove θ"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean",
  "sha": "2ed00ad3aa862f3e522686557fb8f559b17fc002",
  "anchors": [
   {
    "line": 11,
    "text": "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)"
   },
   {
    "line": 14,
    "text": "lemmaL F hθ hθ1 hδ"
   }
  ]
 },
 {
  "ref": "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean",
  "sha": "c3bcece31e76be6368af5af4647f1ad30012fd3b",
  "anchors": [
   {
    "line": 1228,
    "text": "theorem zeroFree_of_rpow_window (F : CharFamily) {θ δ C : ℝ} (hθ : 0 ≤ θ)"
   },
   {
    "line": 1231,
    "text": "lemmaL F hθ hδ"
   },
   {
    "line": 1300,
    "text": "hθ0.le (by linarith)"
   }
  ]
 },
 {
  "ref": "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean",
  "sha": "9cda00fdcd8975f638995190ed0182cd97cced33",
  "anchors": [
   {
    "line": 88,
    "text": "exists_small_eps (eD + eL + 7)"
   },
   {
    "line": 101,
    "text": "level_of_tiedWin c (d la b) e"
   }
  ]
 }
]
```
Finite BigInt arithmetic with exact rational comparisons and integer threshold cases, executed in V8 (replace final console.log with standard Node invocation). This checks only the parameter/threshold algebra; it is NOT numerical evidence about L-function zeros or native arithmetic family existence.
```js
function certificate(){let n=0,w=0,controls=0;const ck=(b,m)=>{if(!b)throw Error(m)}; // use common denominator 2D for sigma and theta, eps as positive rational eN/eD
for(let D=2n;D<=40n;D++)for(let S=D+1n;S<=4n*D;S++)for(let C=-20n;C<=20n;C++)for(let E of [1n,2n,7n]){ // sigma=S/(2D), eps1=E/10; gap=min(S-D,D)/(2D)
const M=S-D<D?S-D:D,T=2n*D+M; // theta=T/(4D)
const a=C<0n?-C:C;let en=E,ed=20n;const bn=M,bd=4n*D*(a+1n);if(bn*ed<en*bd){en=bn;ed=bd}
ck(en>0n&&en*10n<E*ed,"epsilon");ck(T>0n&&T<4n*D&&T<2n*S,"theta");ck(C*en*4n*D<=M*ed,"exponent");n++}
for(let y=-12;y<=12;y++)for(let x1=-12;x1<=12;x1++)for(let extra=0;extra<=12;extra++){let Y=Math.max(y,x1,1)+extra;ck(Y>=y&&Y>=x1&&Y>=1,"window threshold");w++}
ck(2n*3n>4n,"unrestricted eps can exceed gap");controls++;ck(1n<2n,"zero gap excluded by strict sigma premise");controls++;ck(1/2**0.5<1&&Math.pow(.5,1)<Math.pow(.5,.5),"base below one reverses exponent order");controls++;return{rational_parameter_cases:n,window_threshold_cases:w,controls}}
console.log(JSON.stringify(certificate()));
```
Actual output {"rational_parameter_cases":302211,"window_threshold_cases":8125,"controls":3}; 14 source blobs / 32 literal anchors matched. No added assumptions. Third control demonstrates base restriction; first control is example of exponent overshoot. No independent kernel validation or URT advantage shown. No physical gate changes.

## RESUME HERE
Request cached signed-root manifest identities and explicit value-role paths for UpperTheory.Top.zeroFreeAll_of_topG, UpperTheory.Comparison₂.formB, Deduction.zeroFree_of_rpow_window, Formalism.HC.level_of_tiedWin and core_gm. Next reconstruct *exact* remaining intervening call declarations from every_character_of_theta_integrals_local_matching to EveryCharacterE's plugAll (coordinate with theta/editor, no duplicate derivation), then authenticate the path from root using dependency lane's targeted export. Keep core_gm arithmetic inequalities and family construction as independently outstanding premises until supplied. HANDOFF TO dependencies, kernel, acceleration, theta, editor, integration, prime, audit. Full RH OPEN.

<!-- END VERBATIM specialists/landau_criterion/RUN23_TIED_WINDOW_ARITHMETIC_SUPPLIER.md -->

<!-- BEGIN VERBATIM specialists/literature_provenance/RUN23_LEVEL_PD_ADJUNCTION_UNIVERSAL_PROPERTY.md aeec35d0ff5036061084d064979974759a16a741 -->
# RUN23 — Level-n divided-power adjunction and universal property
2026-11-25. Status: SOURCE-MATCHED / local human reconstruction; not Lean replay or authenticated Main reachability. Dedicated literature lane, continuing RUN22 (467e2615b54dc25f32ed2257bd9473314066a180). No Cathedral physics change.

Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts, CI summary (05:37 UTC, checkpoint 421 PASS for Cathedral, not RH kernel). Read RUN22 and recent peer commit handoffs/diffs: math fe3c2ec, windows b85e218, theta 8700f28, Galois eadfe09, structure 93f6005, Landau db8c71c, prime 7d17c3c, dependencies bd222c6, kernel 9c36efc, acceleration 7df9865, integration 1870539, editor 729cf4e (diff excerpt only; full handoff not recovered), audit 1aa4d3f, geometry 7eeea33. No duplicate adjunction task identified. Blueprint not reread; no citation claim used as premise. No new full raw archive scan.

## 1. Source ledger and exact theorem
Upstream leanprover-community/riemann-hypothesis pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed a18a350c3e5aad997766cff2670b292313e46574 (batch 14 merge). B = src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/.
- A: B/ExistsAdj.lean, 97b8f3addc548f00db0b37250fb0c4495ba56880.
- O: B/ExistsAdjOne.lean, 0abc32272596576a7279b4f2dd1a03d5e0d3558f.
- R: B/RingTrunc.lean, 6063de9dbd5c69c47f81c4fea0e452910d4a8e67.
- F: B/FilIsSubDPIdeal.lean, 89cae6c6efa3ca52be376d213c62c857cd31c776.
- C: B/CompF.lean, 5ca821664575e0d175f7de49095efbb7ec7bc571.
- E: B/ExistsDividedPowersAug.lean, 948cc401ffbac3e205d500bc6f5a4ee03d985638.
- L: B/IsNilpotentOfIsNilDP.lean, 09934d09743cb9868157e06156c78e7e6fbf5fc8.
- P: src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean, 53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f.

A18–22: let R be a commutative ring, I an ideal, κ divided powers on I, X a scheme, s:X→Spec R, S a thick object for dp0 R over s. InN κ S (C16–18) asserts existence of PD on J_S + I B_S extending both S.δ and κ. For d,n natural, 1≤n, there exist a thick object P, i:S→P and y:Fin d→B_P such that InN κ P, IsLev P.δ n, and every y_k∈J_P. For EVERY thick object V at level n, EVERY φ:S→V and EVERY tuple z in J_V there exists a UNIQUE ψ:P→V satisfying i≫ψ=φ and ψ(y_k)=z_k. The target need NOT satisfy InN κ V; the maps preserve the native PD on J, not a chosen extension of κ. Source InN is existential compatibility, not an extra map parameter. No flatness, characteristic zero, or factorial invertibility in this statement. A is a theorem wrapper with body exists_adj' S hS d n hn, not an axiom. Its producer O117–158 is explicit.

## 2. Filtration and quotient (F38–139, R44–81)
Write F_n(δ)=fil δ n, generated by products of δ_{r_i}(x_i), x_i∈J and total weight Σr_i≥n. IsLev δ n means F_n=0. For n≥1, F_n⊆J and δ_m(F_n)⊆F_{mn}⊆F_n for m>0 (F38–42 imports ExpBij.dpFil_le, dpow_mem_dpFil_mul, dpFil_anti). Thus F_n is a sub-PD ideal. The degree-zero case of δ is not required to preserve the ideal. F44–47 gives IsNilDP from level n directly by generator membership. F53–65 constructs quotient PD using imported Quotient.dividedPowers and proves the descent criterion: a map out of the quotient is PD if its composite with the quotient map is PD. Every element of the quotient PD ideal lifts from J by surjectivity, so the criterion follows by evaluating on such lifts.

For a PD morphism g, each weighted generator maps to a weighted generator (same weights), hence g(F_n(δ))⊆F_n(η) (F69–83). Conversely if the target ideal equals the image ideal, the inclusion reverses after taking the ideal generated by the images. Indeed define G_m=(F_m(δ)).map g. These ideals obey G_m G_l⊆G_(m+l), G_0=whole ring. On generators of the target ideal, δ'_m(gx)∈G_m by compatibility. Closure under addition is PD convolution, scalar multiplication uses δ'_m(cy)=c^m δ'_m(y), zero separates m=0 and m>0. Induct on ideal span, then on lists of factors, then use decreasing filtration to conclude F_n(δ')⊆G_n (F87–139). No reverse inclusion asserted without the image-ideal hypothesis.

Given ExtDP κ f δ (R15–16), choose δ' on J+I B. Since F_n(δ)⊆J and is stable under δ, it is stable under δ' by equality of the two PD on J. Quotient B by F_n(δ), not by the enlarged ideal's filtration. Both PD structures descend; the enlarged quotient ideal is the sum of the images, so base compatibility persists. The target native filtration is zero by the reverse inclusion and image of the quotient ideal being zero. This proves ring_trunc (R44–81), including surjectivity of a:B→A. Any PD map g:B→C into level n kills F_n by forward inclusion, and therefore factors uniquely through a as a ring map; the quotient descent criterion makes the factor PD. The native theorem states existence plus surjectivity, from which uniqueness follows. Crucially, this does NOT establish that the extended PD on J+I B has level n. The level condition concerns the native J only.

## 3. One divided-power variable and its truncation (R24–42,83–160; E34–51,180–187; F15–36)
The standard PD polynomial ring Q.P has B-module basis e_m (m≥0), e_0=1, product e_m e_l=binom(m+l,m)e_(m+l). For y=e_1, standard PD η on JQ+aug satisfies η_m(y)=e_m and extends δ. E180–187 constructs it via augmentation PD, a splitting and dp_split; these suppliers have actual proof bodies but deeper pre_of_gens/dp_of_pre/dp_split obligations are not discharged by this run. Applying exists_std a second time to the enlarged base PD gives compatible PD on (J+I B)Q+aug. R24–42 proves dp_of_std: check that a map preserves PD on the spanning generators from J and positive e_m. For e_m use the PD composition law on y (m>0); for base generators use the original PD morphism. The imported on_span lemma extends this to the entire ideal.

Given g:B→C PD and z∈L (target PD ideal), prescribe e_m↦η_C,m(z) and extend B-linearly using g. This map preserves one and multiplication because η_0(z)=1 and the PD product identity reproduces the binomial coefficient. F15–36 proves existence by checking the basis and bilinear multiplication. R105–111 uses dp_of_std to show the extension is PD; e_1 maps to z. Any PD ring map with the prescribed restriction and y-value agrees on all e_m by PD compatibility, and thus on the entire B-linear span (R112–127). This yields ring_poly; no division by m! in B.

Compose ring_poly with ring_trunc at n. For level-n C, the first map G1 exists by the polynomial property and factors through the quotient as G. For any competing G', both G'∘a2 and G∘a2 agree on the original B and every θ1,m(y1), because their values on the image of y1 are z and both are PD. Basis uniqueness yields equality after precomposition; a2 is surjective, so G'=G. Thus R129–160 proves ring_adj, with InN preserved by the quotient argument. No arbitrary-target assertion: the existence proof uses F_n=0 in C.

## 4. Lift ring constructions into the category of thick objects (O18–115)
S has surjection π_S:B_S→B_S0, kernel J_S, and point x_S:Spec B_S0→X over Spec R. Given a PD ring morphism a:B_S→A with native PD θ on J_A and θ nilpotent, the composite B_S→A→A/J_A kills J_S; thus it factors uniquely as q:B_S0→A/J_A (O22–28). Set the new reduced ring A/J_A and point x_P=x_S∘Spec(q); the R-algebra is via a∘algebraMap. The quotient supplies surjectivity/kernel data, nilpotence is assumed here and later obtained from level n; PD compatibility with dp0 R is automatic for the zero ideal. Equality qπ_S=quotient∘a gives the structural map over R. This defines push and pushHom (O32–54).

For φ:S→V and PD ring map G:A→B_V satisfying G a=φ_B, the map on reduced rings is forced by quotient universality, as π_V G kills J_A. Its point condition follows after precomposing the reduced-ring equality with π_S, which is surjective; the two maps agree there by G a=φ_B and the morphism equations. Hence pushDesc is a genuine thick morphism (O56–69), not just a ring hom. Thick.hom_ext gives uniqueness of thick morphisms from equality on native rings. For truncation, surjectivity of a establishes that equality. For one-variable adjunction, ring_adj uniqueness establishes it. O73–91 and O93–115 therefore prove exists_trunc and exists_adj_one, with native nilpotence by F.nil_of_lev.

## 5. The induction on d (O117–158)
Base d=0: take exists_trunc, empty tuple Fin.elim0; uniqueness is exactly that of truncation. Inductive d+1: start with (P,i,y_1,…,y_d) at d, then adjoin one variable w to P via j:P→Q at same level n. Set the tuple in Q to (w,j(y_1),…,j(y_d)); PD morphisms carry J to J. Given z=(z_0,…,z_d) in J_V, first choose the unique ψ1:P→V extending φ and sending y_k to z_(k+1), then the unique ψ:Q→V extending ψ1 and sending w to z_0. The composition with i≫j is φ, and all coordinate equations follow. Conversely a competitor ψ' must have j≫ψ'=ψ1 by the d-variable uniqueness (tail coordinates); its head coordinate then forces ψ'=ψ by the one-variable uniqueness. This proves existence and uniqueness simultaneously without assumptions on the target's extended PD. The source prepends the new coordinate, not appends it; retain exact Fin.cons ordering.

L313–355 applies this to an affine chart with formally étale coordinate presentation t. Choose a lift j_S using surjectivity and formal étaleness. Lift into P with coordinates j_S(x_k) transported by i plus y_k. Given φ:S→V and b:bas→V, set z_k=b(x_k)−φ(j_S(x_k)); they are in J_V since reductions agree (π_eq). Universal property gives ψ; coordinate equality plus formal unramifiedness gives ψ∘j=b. Conversely any map realizing both legs must send y_k to those differences, so uniqueness applies. This supplies RUN22's restricted coproduct, NOT a coproduct into arbitrary thickenings.

## 6. External assumption ledger delta
| Item | Classification and exact remaining obligations |
|---|---|
| P31–39 | Published.CrystallineDeRham and AbelianDualCrystal are proposition definitions, not axiom declarations or proofs. Preserve smooth, separated, quasi-compact, nilpotent PD, surjection/kernel and pullback plus arbitrary m premises. RUN22 mapped local proof producer. |
| C16–18, R15–16 | InN and ExtDP are predicates with existential base compatibility, not unconditional facts. |
| A18–22 | Explicit wrapper of O117–158 (actual proof body). No external literature axiom accepted. |
| O22–69,73–158 | Local explicit theorem/definition bodies; uses Thick.hom_ext, quotient universality, PD morphism composition and imported ring suppliers. |
| R24–42,44–81,83–127,129–160 | Local explicit proof bodies. Conditional on ExtDP, n≥1 for truncation, target level and coordinate ideal membership. |
| F15–36,38–139 | Explicit proof bodies; imported ExpBij filtration results, PD quotient operations and Mathlib algebra/basis machinery remain trust/dependency obligations. |
| E34–51,180–187 | Explicit augmentation and standard PD theorem producers, with imported pre_aug, dp_of_pre, exists_lift_and_aug, dp_split. Need transitive audit, not an independent proof of these suppliers. |
| L313–355 | Explicit chart application; formally étale lifting and reduction equality retained. |
| OpenLiteratureStatements | No new direct declaration inspected; no global negative claim concerning axioms or sorry. |
No external literature citation used as proof, no added premises. No authenticated root-value path to crystallineDeRham or rigid_of_free_of_crystallineDeRham recovered; do not count as confirmed Main coverage.

## 7. Upstream migration and executed checks
Observed at head a18a350c3e5aad997766cff2670b292313e46574:
- Both A and O at original paths return 404. O's main declarations now in B/CrystallineDeRham.lean blob 16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c, pushRed H466, push H473, pushDesc H497, exists_trunc H514, exists_adj_one H534, exists_adj' H558. H865 calls fully qualified exists_adj' directly (pinned L321 called wrapper exists_adj). Of O16–158, 127/131 nonblank lines occur verbatim somewhere in H; four unmatched lines use Thick.hom_ext. This is line membership, not ordered or kernel equivalence.
- R persists at blob 86283a8d20f867901c1b77a45aac5d731e93b8a3. R15–160 has 125/141 exact nonblank line memberships in current R. In particular H66–70 replaces dp_of_std's span proof by GlobalTheory.PDA.PDPoly.isDPMorphism_of_isStd. This is a new dependency boundary; do not assume its proof or equivalence solely from name. Pinned proof remains auditable.
Actual JS tool execution: 62 literal source anchors across six pinned files plus 19 anchors across two additional pinned files and two head files = 81; all 10 GitHub blob SHA receipts matched. Both line membership checks executed (127/131 and 125/141). No synthetic operator or kernel execution. The below replay recipe independently checks the same hashes and a focused subset of structural anchors plus both line comparisons in a local git checkout. It was not executed as Python in this session; equivalent source retrieval and matching were executed in JS.

```python
import subprocess as sp, sys
repo=sys.argv[1]
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="a18a350c3e5aad997766cff2670b292313e46574"
base="src/Development/"
b=base+"WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/"
spec=[
(pin,b+"ExistsAdj.lean","97b8f3addc548f00db0b37250fb0c4495ba56880",["exists_adj' S hS d n hn","IsLev V.δ n"]),
(pin,b+"ExistsAdjOne.lean","0abc32272596576a7279b4f2dd1a03d5e0d3558f",["theorem push_ker","RingHom.liftOfSurjective S.π S.surj","def pushDesc","theorem exists_trunc","theorem exists_adj_one","theorem exists_adj'","Fin.elim0","Fin.cons w","fun k ↦ z k.succ","hunivQ V hV ψ₁ (z 0) (hz 0)","have h1 : j ≫ ψ' = ψ₁"]),
(pin,b+"RingTrunc.lean","6063de9dbd5c69c47f81c4fea0e452910d4a8e67",["def ExtDP","theorem dp_of_std","Fil.fil_isSubDPIdeal δ n hn","have hsub' : δ'.IsSubDPIdeal","Fil.exists_quot δ'","Ideal.map_quotient_self","Fil.map_fil_le δ η g hg n","theorem ring_poly","Fil.exists_lift","theorem ring_adj","have key : G'.comp a2 = G.comp a2","obtain ⟨w, rfl⟩ := hsurj x"]),
(pin,b+"CompF.lean","5ca821664575e0d175f7de49095efbb7ec7bc571",["def InN","IsDPMorphism T.δ δ' (RingHom.id T.B)"]),
(pin,b+"ExistsDividedPowersAug.lean","948cc401ffbac3e205d500bc6f5a4ee03d985638",["theorem exists_dividedPowers_aug","theorem exists_std","dp_split B J δ Q.P ε Q.aug η hε"]),
(pin,b+"IsNilpotentOfIsNilDP.lean","09934d09743cb9868157e06156c78e7e6fbf5fc8",["theorem exists_coprod","exists_adj S hS d n hn","let zV","π_eq U.1 b (jS ≫ φ)"]),
(pin,b+"FilIsSubDPIdeal.lean","89cae6c6efa3ca52be376d213c62c857cd31c776",["theorem fil_isSubDPIdeal","theorem nil_of_lev","theorem exists_quot","theorem map_fil_le","theorem fil_le_map_fil","J' = J.map f"]),
(pin,base+"AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean","53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f",["def CrystallineDeRham : Prop","QuasiCompact s","def AbelianDualCrystal : Prop"]),
(head,b+"CrystallineDeRham.lean","16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c",["theorem exists_adj'","_root_.FubiniStudyChowHeightFormula₂.Adr.exists_adj' S hS d n hn"]),
(head,b+"RingTrunc.lean","86283a8d20f867901c1b77a45aac5d731e93b8a3",["theorem dp_of_std","GlobalTheory.PDA.PDPoly.isDPMorphism_of_isStd"])]
def git(*a):return sp.check_output(["git","-C",repo,*a]).decode("utf-8")
for ref,p,h,anchors in spec:
    assert git("rev-parse",ref+":"+p).strip()==h
    s=git("show",ref+":"+p)
    for a in anchors: assert a in s,(p,a)
for p,q,lo,hi,expected in [
("ExistsAdjOne.lean","CrystallineDeRham.lean",16,158,(127,131)),
("RingTrunc.lean","RingTrunc.lean",15,160,(125,141))]:
    selected=[s for s in git("show",pin+":"+b+p).split("\n")[lo-1:hi] if s.strip()]
    current=set(git("show",head+":"+b+q).split("\n"))
    assert (sum(s in current for s in selected),len(selected))==expected
print("source receipts",len(spec),"replay anchors",sum(len(x[3]) for x in spec),"line memberships",[(127,131),(125,141)])
```

RESULT: DONE local source-matched level-n PD adjunction, quotient/lift/induction and restricted coproduct link; PARTIAL imported PD construction, upstream replacement producer, transitive external assumptions, Main-root reachability. No kernel or URT speed claim.
RESUME HERE: trace actual pre_aug, dp_of_pre and dp_split proof bodies through E imports DpOfPre/ChooseFac and the exact standard PD polynomial basis construction; retain the generator-relation and composition law conditions. Ask dependency/acceleration/kernel for authenticated cached role paths to crystallineDeRham and rigid_of_free_of_crystallineDeRham rather than scanning the full raw archive; keep coverage unassigned until receipts. HANDOFF TO literature, dependencies, acceleration, kernel, geometry, editor, integration, audit. Full RH reconstruction OPEN.

<!-- END VERBATIM specialists/literature_provenance/RUN23_LEVEL_PD_ADJUNCTION_UNIVERSAL_PROPERTY.md -->

<!-- BEGIN VERBATIM specialists/on_acceleration/RUN23_RESUME.md 6c4c9dbb9ed9d7548cc1c627d0d6bd0a35ddce31 -->
# RUN23 — real cross-lane declaration batch; five arithmetic frontier identities resolved

2026-11-25. RESULT: DONE for exact Run22 request replay against authenticated full declaration manifest; PARTIAL for persistent shared deployment and outgoing edges. Pinned upstream [Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean) blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll). Current upstream observed 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 at 04:16:12Z; not mixed. Read protocol, handoff, expansion, AGENTS and state excerpts and 13 peer note files (some latest by visible path, audit not retrieved); current combined status empty. Prior Run22 c807cca47b00995fba63a10e8f319e9c82158db4. No physics modifications.

## Native full-manifest result
Recovered Actions artifact 14931267327 via download connector; archive member job/outputs/reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native request list reconstructed and its pretty-printed Git blob 73bb542c570ca7b11911c61ba83b5bd898eac382 matched the committed Run22 input exactly. Rebuilt compact SQLite DB in initial timed-out execution; subsequently native integrity_check returned ok, count 1484705. Native second execution checked every manifest row against SQLite projection, then every candidate against full-stream oracle for every trial. 1,484,705 rows, 3,035,045 signed roots/structural refs, 331 requests, 330 distinct keys, 323 unique, 4 ambiguous, 4 missing; 336 candidate occurrences, all first 300 ID queries uniquely found. 24 full comparisons, zero dropped candidate rows relative to this manifest; not a claim of full outgoing edges. DB 390791168 bytes SHA256 807f379428a32f265264ee4e55ad2549cc8d6a4447c58e6611c8d5980aef77f8 differs from Run21 layout digest; new native full projection comparison is evidence, not a reason to bypass Run22 receipt check. Benchmark script checks DB whole hash before and after, not per session; local exclusive cooperative file only. No hostile-writer security or new cross-worker cache publication claimed. Initial build wall time not measured due timeout. Native second-run peak RSS 100188 KiB (97.84 MiB; excludes initial build peak). Full scan + projection compare 18.05295 s; one DB SHA 262.36982 ms. Three trials per mode, median milliseconds, excludes shared session hash from lookup times, reopened connections not storage-cold:

| mode | reopened | warm |
|---|---:|---:|
| independent indexed |2.038842|1.274655|
| shared indexed |1.746093|1.390830|
| golden |1.899744|1.344831|
| periodic |1.804702|1.338151|

Only one duplicated key in this batch; conventional independent warm actually faster, no URT speedup. One-pass scan O(input bytes + request keys + candidate occurrences), B-tree construction/queries and schedule sorting not strictly linear. Output materialized only for 336 candidate occurrences; no full proof search claim. Native output SHA256 335f5e0c80f371d88caca02acea6c7d33583a1b7c3c55944261c4309fb6e8d6b includes variable timing fields. Reproduce with python run23_batch.py PATH/reachable_declarations.jsonl.zst run22_requests.json append.sqlite run23_result.json. Use a private DB path, discard any interrupted build or full-verify before reuse. Code fails on mismatch; no new fault-injection tests this run. No change to prior durable index or import/static graph implementation.

## Immediate dependency/integration handoff
Dependency [04:12 report](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/2026-11-25_0412_300_RECONCILIATION.md) had five identities not observed in its partial role graph. All five are in the authenticated reachable manifest. All rows below are theorem kind and have two **raw signed export refs**. Positive refs use the export's signed encoding; do not confuse these raw integers with decoded zero-based expression IDs (e.g. TLiftK raw 4,997984089 corresponds to prior decoded 3,997984088). No exact incoming role path proved by this lookup.

| exact name | declaration ID | raw refs |
|---|---:|---|
| UpperTheory.Gal.Int.Inp.ex_all_of_good |13173967|1000151086,1000159074|
| GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant |13056908|994140442,994150154|
| GlobalTheory.CMBasePatch.main |13173638|1000142518,1000143233|
| GlobalTheory.SatSysPatch.patch |13173398|1000135764,1000140322|
| GlobalTheory.IndexTwoPatch.main |13056965|994183607,994188890|

Exact source module locations to be confirmed by respective mathematical lanes; source anchor is pinned export and Main. This corrects absence only from partial observed graph, not global reachability independently checked. Additional exact candidates below (id: raw refs); ambiguous terminal names retain all matches:

- AdmFam: GlobalTheory.TwSys.AdmFam 6879178:557869451,557869508; Formalism.MainNotions.AuxBlock8.Pf.AdmFam 1289266:58647757,58647765.
- AdmF: Formalism.MainNotions.TwistedPlaces.AdmF 7197371:17831024,588379700; Formalism.MainNotions.AuxBlock8.AdmF 1285612:58195776,58195809.
- Formalism.MainNotions.AuxBlock8.FamilyClosedForm 1289250:17831024,58647285.
- classes_finite: GlobalTheory.CentCls.Fin 13902952:1054986662,1055025663; GlobalTheory.TorCls.Borel 13893255:1054452995,1054481552; GlobalTheory.LKCx.ClsReg 13889343:1054101861,1054108332; GlobalTheory.BCT.ClsFin 8155094:664871799,664873376; Formalism.FourierDecayAlt.P.HenselRootsBounded 7665820:625545773,625545823; GlobalTheory.CompanionTheory.CFin 6137449:462479468,462499953; GlobalTheory.Unfold.ClFin 5808202:439303057,439303978.
- GlobalTheory.DefClassFin.ccf_holds 13909149:1055607224,1055627302; UpperTheory.Gal.Spc.specAlg 13962369:1059634996,1059646508; UpperTheory.Gal.Spc.specOfF 13965895:1059827819,1059842590.
- finite_doubleCoset: GlobalTheory.DefClassFin 13909184:1055628767,1055629363; GlobalTheory.CompanionTheory.CountClosedComm 8165347:665609921,665610657.
- PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z 8994891:721955581,721956566; PositivityTheory.Rg.Sw.LVs.singToDiff 2400392:149788567,149918251; PositivityTheory.Rg.Sw.HSt.locTau 8996093:721752894,722068161.
- GlobalTheory.IdemSupport.supported_group_and_prime_idempotents 1779874:99932650,99934573; UpperTheory.V.HV.DescentVanishingReductions.published_hypotheses_from_patching_alt 13096244:995912227,995912262.
- GlobalTheory.CrysConn.isBC_of_lift 13782930:1045961851,1045968733.
- ReciprocityTheory.MultiplicativeHeights.sjCore_holds 4395036:318242625,318292260; sj_holds 4394857:318242626,318252671; heightLowerBound_of_sj_of_sphereLogIntegrable 4403544:319020186,319021811.
- UpperTheory.Comparison₂.core_gm 864997:26895173,26923857; sigA_le 864855:26884678,26885250.
- UpperTheory.TP.TLiftK 13125905:4,997984089; UpperTheory.V.v_window_of_literal_automorphy_n 13096310:995913051,995913061; PositivityTheory.Rg.Sw.HSt.holLeadB 8996470:720757040,722118274.
- Missing terminal keys: existsUnique_isConn_of_lift, existsUnique_gaussManin, ChainCoreH, ReadsKept. Missing in this manifest under exact typed terminal equality, not absence from all upstream source. Three explicit exact names reproduced their terminal matches.

All 300 prior IDs in manifest; dependency lane already has their role reconciliation. This run is lookup, not new kernel extraction. No premises removed.

RESUME HERE: use the five exact arithmetic frontier IDs in the dependency/kernel next targeted role-path request (do not rescan raw archive independently); acceleration lane to provide a single authenticated query-only manifest cache, assess actual repeated multi-lane workload including SHA overhead, and add request receipt/negative tests for the new layout before shared publication. HANDOFF TO dependencies, kernel, integration, all specialist lanes. Full RH reconstruction OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN23_RESUME.md -->

<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN24_COEFFICIENT_PRODUCT_FORMULA_HEIGHT.md 09dd0915ad325aa9ccf5aa390b4ef3b8438add7f -->
# Geometry RUN24 — coefficient-to-sphere normalization and arithmetic height lower bound
2026-11-25. RESULT: DONE for the local source-matched coefficient, finite-place and height lower-bound chain. PARTIAL for authenticated Main-root reachability and full RH reconstruction. Not independent Lean replay.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, physics CI checkpoint #422 (05:55:54Z), preceding geometry RUN23 (commit 7eeea33eccdc3fb6d86e639da05acef6b54d98f3), and 15 recent peer commit file/RESUME HERE listings. No duplicate coefficient-to-height task identified in those listings. The full historical archive and external blueprint were not reopened this run. No physics queue changes.

## Source provenance
Repo leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005; H=a18a350c3e5aad997766cff2670b292313e46574, latest returned by recent-commit query (merge PR #2164, batch 14). All paths below relative to src/ReciprocityTheory/SemistableReduction/. Blob IDs from GitHub, not independently rehashed.
- AevalIsWeightedHomogeneous.lean P 5f215af64f8393f056bec769b9eeb05d53c811a3, H dc0425e4c5e898ff8c46c11f576a8b2a1d8e6f5a. eval_mul_of_isMultiHomogeneous P29–40/H36–47 equal; sum_primitiveRoot_pow_mul_inv_pow_eq_ite P41–62/H48–69 equal; exists_torus_coeff_le P63–126/H70–133 differs (including AddMonoidAlgebra.coeff notation).
- LogNormCoeffSubLeBlockSphereLogMean.lean P 805547a6ed14ff4a5cff3cbddbc6cc98153f529f, H 2cece49866d0d0c069a23f86960ed17908179185. harmonic_pred_le_one_add_log P9–19/H20–30 equal; log_norm_coeff_sub_le_blockSphereLogMean P20–72/H31–83 differs; neg_log_norm_coeff_le_finitePlaces P73–118/H84–129 differs; sum_log_norm_embedding_eq P119–130/H130–141 equal.
- SphereLogIntegrableStatement.lean P 887def7b427e78c9afb4dea4f6b074721bed1fd1, H eb75df21cf29d2aeeae172a559b76b8566cf02f7. gaussAbs P35–38/H45–48, h0 P39–42/H49–52, HeightLowerBoundStatement P73–78/H79–84 equal.
- HeightLowerBound.lean P d1cf6b9555a57f2d6318a1e68117e1203980e15e, heightLowerBound_of_sj_of_sphereLogIntegrable P7–31; old path absent at H, declaration relocated to TorusL2CauchyInequality.lean H255–279, equal.
- TorusL2CauchyInequality.lean P b2bc60453af78f33f80a1372a91cd356a830b794, H affdbf1acabdd7d7e65e3b20716c49cc4a5cebc6. sphere_height_lower_bound P23–24/H1726–1727 equal.
Comparison by whitespace-normalized declaration blocks, 9 equal/3 changed, not elaborated equality. Source links: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/ and https://github.com/leanprover-community/riemann-hypothesis/tree/a18a350c3e5aad997766cff2670b292313e46574/src/ReciprocityTheory/SemistableReduction/ .

## 1. Finite torus witness, no analytic integral needed
For any finite index set I, complex multivariate polynomial g and exponent s, there is z with |z_i|=1 for every i and |c_s|≤|g(z)|. If s is outside the support, c_s=0 and z_i=1 works. Otherwise N=totalDegree(g)+1≥1, and every exponent coordinate d_i of every support monomial (including s) is less than N. Pick a primitive Nth root ζ. For 0≤a,b<N,
  Σ_{k=0}^{N−1}(ζ^a ζ^(−b))^k = N if a=b, and 0 otherwise.
Equal exponents give a constant sum; distinct exponents give a nontrivial Nth root of unity and the geometric-series identity. This includes N=1. Define z(k)_i=ζ^(k_i) and C(k)=Π_i ζ^(−k_i s_i) for k∈{0,…,N−1}^I. Expand the finite sum, reorder, and factor over coordinates:
  Σ_k g(z(k)) C(k)
    = Σ_{d∈supp(g)} c_d Π_i Σ_{j=0}^{N−1} ζ^{j(d_i−s_i)}
    = N^{|I|} c_s.
Since |C(k)|=1, the triangle inequality gives |c_s|≤N^{−|I|}Σ_k|g(z(k))|≤max_k|g(z(k))|. Nonempty finite grid (including empty I) and positive N justify all divisions. This is the same contradiction argument as the source, expressed via the maximum. Degree bound prevents aliasing. The proof does not require finding the maximizing point efficiently or asserting that torus evaluation has O(N) cost.

## 2. Exact sphere correction
Let B,n∈N, n>0, a:Fin B→N, g multihomogeneous of block degrees a_b and c_s≠0. Retain hSJ and hInt as parameters of log_norm_coeff_sub_le_blockSphereLogMean, supplied locally in RUN22–23. Define A=Σ_b a_b. From §1 select z with |g(z)|≥|c_s|>0. Set r=√n>0 and u_(b,j)=z_(b,j)/r. Then Σ_j |u_(b,j)|²=n/r²=1, so u is in the product of unit spheres. Every monomial has total degree A; hence g(z)=r^A g(u), and g(u)≠0. Taking logs is legitimate at both points:
  log|g(u)|=log|g(z)|−(A/2)log n ≥ log|c_s|−(A/2)log n.
RUN23 multiblock Jensen yields
  blockSphereMean(g) ≥ log|g(u)|−(A/2)H_(n−1)
                      ≥ log|c_s|−(A/2)(log n+H_(n−1)).
This intermediate sharper inequality follows directly from the cited premises; it is a human inference, not a separately verified Lean declaration. P harmonic_pred_le_one_add_log uses monotonicity H_(n−1)≤H_n≤1+log n. The latter also follows from comparing each 1/k (k≥2) with integral of 1/x from k−1 to k. As A≥0, this gives the exact source bound
  log|c_s|−Σ_b a_b(log n+1/2) ≤ blockSphereMean(g).
All zero, degree and dimensional conditions retained; B=0 allowed. The n=1 sharper correction is exactly zero.

## 3. Finite places: support and normalization matter
K is a number field, d=[K:Q]>0, f≠0, s∈supp(f), c=f.coeff(s)≠0. For each normalized finite place w, G_w=gaussAbs w f=max_{t∈supp(f)}w(f.coeff t)≥w(c)>0. Use precisely Mathlib's normalization, not unweighted p-adic absolute values on arbitrary K. The finite set T=union over t∈supp(f) of {w:w(f.coeff t)≠1} exists because each nonzero coefficient has finite multiplicative support. Outside T all support coefficient values are 1, so G_w=1 (support nonempty). Thus both log sums are ordinary finite sums over T. NumberField.FinitePlace.prod_eq_inv_abs_norm gives Π_{w∈T}w(c)=|Norm_{K/Q}(c)|^(−1). Taking log and summing monotonicity gives
  −log|Norm(c)| = Σ_{w∈T} log w(c) ≤ Σ_{w∈T} log G_w.
No assumption that each log G_w≥0: G_w may be below 1. No omission of negative finite-place terms. All factors positive; no log-zero issue.

## 4. Archimedean cancellation and complete local lower bound
For every ring embedding σ:K→C, injectivity preserves polynomial support, each block degree, and c≠0. Thus §2 applies to map σ f. The product over ALL complex embeddings, including both conjugate embeddings at a complex place, equals the rational algebraic norm (Algebra.norm_eq_prod_embeddings, RingHom.equivRatAlgHom). Taking complex norms and logs yields Σ_σ log|σ(c)|=log|Norm(c)|. There are d embeddings (NumberField.Embeddings.card). Sum §2 over them:
  Σ_σ blockSphereMean(map σ f) ≥ log|Norm(c)|−d Σ_b a_b(log n+1/2).
Adding §3 cancels log|Norm(c)| exactly. Divide by d>0, using the actual definition
  h0(f)=(Σ^finite_w log G_w+Σ_σ blockSphereMean(map σ f))/d.
Therefore
  h0(f) ≥ −Σ_b a_b(log n+1/2).
The stronger intermediate human bound h0(f)≥−A(log n+H_(n−1))/2 follows by using the sharper §2 bound in the same argument, without changing the source theorem or any downstream premise. Example n=1: f is a single monomial times c; its archimedean mean is log|σ(c)|, its finite contributions sum to the opposite norm log, so h0(f)=0. The source's looser bound still holds.
The actual closed namespace supplier is sphere_height_lower_bound := heightLowerBound_of_sj_of_sphereLogIntegrable sj sphereLogIntegrable, with sj and sphereLogIntegrable supplied by the preceding reconstructed local chain. This completes a local theorem translation under the original NumberField, n>0, f≠0, multihomogeneity hypotheses, not the global arithmetic-intersection argument. Imported primitive-root existence, polynomial support, finite-place product formula, norm/embedding cardinality, and SJ analytic facts remain explicitly cited dependencies, not independently kernel replayed.

## 5. Executed exact regression certificate
Executed in V8 during this run: counts {"rootOrthogonality":208,"coefficientExtraction":118,"normalization":2430,"finitePlaceProducts":83448,"finitePlaceComparison":83448,"harmonicComparison":100,"negativeControls":3}; total 169755 counted cases. The prime-order cyclotomic tests use integer coefficient reduction, not floating roots; finite-place tests are over Q only, not general number fields. Finite tests do not prove complex analytic integrability or a universal theorem; the source-matched human argument above supplies the logical reasoning. Extract the JS below and run in Node. Counts are regression cases, not proof obligations or coverage.
~~~js
const certificate=function () {
 const counts={rootOrthogonality:0,coefficientExtraction:0,normalization:0,finitePlaceProducts:0,finitePlaceComparison:0,harmonicComparison:0,negativeControls:0};
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b)[a,b]=[b,a%b];return a};
 const rat=(a,b=1n)=>{if(b<0n){a=-a;b=-b}const g=gcd(a,b);return [a/g,b/g]};
 const mul=(x,y)=>rat(x[0]*y[0],x[1]*y[1]);const eq=(x,y)=>x[0]*y[1]===y[0]*x[1];const le=(x,y)=>x[0]*y[1]<=y[0]*x[1];const add=(x,y)=>rat(x[0]*y[1]+y[0]*x[1],x[1]*y[1]);
 const mod=(x,n)=>((x%n)+n)%n;
 function orth(N,a,b){const t=Array(N).fill(0);for(let k=0;k<N;k++)t[mod(k*(a-b),N)]++;return t.slice(0,-1).map(x=>x-t[N-1])}
 for(const N of [2,3,5,7,11]){
   for(let a=0;a<N;a++)for(let b=0;b<N;b++){const t=orth(N,a,b);ck(t.every((v,i)=>v===(a===b&&i===0?N:0)),"orthogonality");counts.rootOrthogonality++}
   const terms=[];for(let a=0;a<N;a++)for(let b=0;b<N-a;b++)terms.push([a,b,((a*7+b*11)%9)-4]);
   for(let s=0;s<N;s++)for(let t=0;t<N-s;t++){
     const bins=Array(N).fill(0);
     for(let k=0;k<N;k++)for(let l=0;l<N;l++)for(const [a,b,c] of terms)bins[mod(k*(a-s)+l*(b-t),N)]+=c;
     const c=terms.find(([a,b])=>a===s&&b===t)[2];
     ck(bins.slice(0,-1).every((v,i)=>v-bins[N-1]===(i===0?N*N*c:0)),"Fourier coefficient");counts.coefficientExtraction++;
   }
 }
 for(let n=1;n<=30;n++)for(let a=0;a<=8;a++)for(let b=0;b<=8;b++){
   let sum=rat(0n);for(let i=0;i<n;i++)sum=add(sum,rat(1n,BigInt(n)));
   ck(eq(sum,rat(1n)),"unit norm");
   const nn=BigInt(n),p=BigInt(a+b);ck(eq(mul(rat(nn**p),rat(1n,nn**p)),rat(1n)),"homogeneous scaling");counts.normalization++;
 }
 const abs=a=>a<0n?-a:a;
 function val(a,p){a=abs(a);if(a===0n)throw Error("zero valuation");let k=0;while(a%p===0n){a/=p;k++}return k}
 function pp(p,k){return k>=0?rat(p**BigInt(k)):rat(1n,p**BigInt(-k))}
 for(let d=1n;d<=12n;d++)for(let a=-9n;a<=9n;a++)for(let b=-9n;b<=9n;b++)for(let c=-3n;c<=3n;c++){
   const cs=[a,b,c].filter(x=>x!==0n);if(!cs.length)continue;
   const g=cs.reduce((u,v)=>gcd(u,v),0n);let G=rat(1n),C=cs.map(()=>rat(1n));
   for(const p of [2n,3n,5n,7n,11n]){
     const v=cs.map(x=>val(x,p)-val(d,p));G=mul(G,pp(p,-Math.min(...v)));
     C=C.map((x,i)=>mul(x,pp(p,-v[i])));
   }
   ck(eq(G,rat(d,g)),"Gauss product");
   for(let i=0;i<cs.length;i++){ck(eq(C[i],rat(d,abs(cs[i]))),"product formula");counts.finitePlaceProducts++;ck(le(C[i],G),"Gauss dominates coefficient");ck(le(rat(1n),mul(G,rat(abs(cs[i]),d))),"combined norm lower bound");counts.finitePlaceComparison++}
 }
 let H=rat(0n),L=rat(0n);for(let n=1;n<=100;n++){if(n>1){H=add(H,rat(1n,BigInt(n-1)));L=add(L,rat(1n,BigInt(n)))}ck(le(H,add(rat(1n),L)),"harmonic lower integral comparison");counts.harmonicComparison++}
 ck(orth(3,0,3)[0]===3,"aliasing without degree bound");counts.negativeControls++;
 ck(!eq(rat(2n),rat(1n)),"unnormalized torus squared norm n=2");counts.negativeControls++;
 ck(le(rat(1n),rat(1n,2n))===false,"omitting finite contribution for c=1/2");counts.negativeControls++;
 return counts;
};
const counts=certificate();console.log(JSON.stringify({counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}));
~~~

RESUME HERE: read pinned LagrangeIdealLiftsFact.lean (actual imported path from TorusL2CauchyInequality.lean) and reconstruct gauss_height_add_of_sphere including exact Gauss norm multiplicativity, almost-everywhere log products and scalar invariance; then heightQuotient independence and its downstream use in intersection comparisons. Ask dependencies/kernel/acceleration for cached role-labelled Main paths to sphere_height_lower_bound, heightLowerBound_of_sj_of_sphereLogIntegrable and gauss_height_additivity, not a duplicate raw archive scan. Do not mark root coverage without receipt. Audit the sharper harmonic correction as an optional human strengthening, not a Lean claim. HANDOFF TO geometry, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.

<!-- END VERBATIM specialists/positivity_geometry/RUN24_COEFFICIENT_PRODUCT_FORMULA_HEIGHT.md -->

<!-- BEGIN VERBATIM specialists/prime_window/RUN23_ASK_ODD_SERIES_AND_DFC.md d9b6e7d18295021d68dc421f694f5ae737de4787 -->
# RUN23 — odd-power ask cap, exact deficit decomposition and improved conditional PointsLemma

2026-11-25. RESULT: SOURCE-MATCHED human derivation of ask_bounds, ask_high, dfc_le, dfc_high, lo_bounds, fl_bounds; new conditional constant 491/150 instead of 5 in the first PointsLemma conjunct. Exact finite BigInt regressions executed. Not Lean replay or an unconditional arithmetic estimate.

## Provenance and preflight
P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. All following paths relative to src/Formalism/SharpRestriction/GrowthBounds/ at P, unless stated. Source URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/
- IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L154–159 fill, kaJ, fillG; L341–369 tauP, ioP, gainP, TTP, askG; L378–393 lo/fl.
- LogarithmicSums/Conclusion1OfGainBoundAll.lean a37d19e7affc2c873c5a325fb25af7bf7834d9a0 L99–122 InWin/GainBoundAt (askG, not askP).
- LogarithmicSums/SummableAndTsumLeTwoMulDivOfLeDivPow.lean 5a9eb8949b592ca65eceece0dbe3fe1b4b8a38fb L12–141 fill and Sc suppliers; L142–175 general geometric domination; L177–238 thW/InWin/ask_bounds; L240–269 thS; L277–357 ask_high.
- LogarithmicSums/DfcHigh.lean 3ae0d61345dc80d56ce8093ed9e3fb9637f6ae91 L36–46, L99–104, L175–230 Dfc, io_le, subset, dfc_le/high.
- LogarithmicSums/PrimeRpowNegLevelLe.lean 2534d4828612d86863a3b3eca1525827d625cbed L163–215 constants and ceiling bound, L216–330 lo_bounds, L332–356 fl_bounds.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc L73–142 Sets/E1/low_le.
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641 L29–116 sum_low, L118–173 sum_high, L189–258 final assembly.

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN22 (398a176a699312a300e7c845104c2cdba5ae76e2), RUN13 excerpts; research state/log/protocol and continuity excerpts; latest 35 commit subjects and RESUME excerpts for other lanes, including acceleration RUN23, kernel RUN23, dependencies 0512, audit 0448 and editor 0456. General CI #419 (45547271883) PASS prior to this artifact, not RH validation. External blueprint not reread this run; no claim exhaustive cross-lane search. No physics changes.

Upstream H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, merge PR 2057 at 04:16:12 UTC, unchanged from RUN22. At H all three pinned paths DfcHigh, PrimeRpowNegLevelLe and SummableAndTsumLeTwoMulDivOfLeDivPow return 404; do not infer elimination of every related obligation. Acceleration RUN23 (7df9865e8a95f1ca06b38fd0c0ddc29272079566) reports exact manifest rows Formalism.MainNotions.AuxBlock8.Pf.AdmFam 1289266 raw refs 58647757,58647765; Formalism.MainNotions.AuxBlock8.AdmF 1285612 refs 58195776,58195809; Formalism.MainNotions.AuxBlock8.FamilyClosedForm 1289250 refs 17831024,58647285. These are peer-reported identities in the authenticated reachable manifest, not an incoming role path for dfc_le, and not independent re-extraction in this run. Preserve P hypotheses.

## 1. Native positive-fill supplier and odd-power majorant
Fix D,L,P:ParameterChoice' D L, X:Inst D L, integer-valued a,b on HH(D), h:InWin L a b, j in lifts, s in T=host.TT. Write A=L.sc.a>0, w=L.sc.w'' n, S=L.Sc, theta=thW=1/(k x^(Scale.A/2)). Native Sc_facts gives S>=100, w>=5S. It uses m>=2, k>=m+3>=5, Del>=N(m)*m^10>=5120 and L.Sc_eq, P.kS_le. The same bound on Del implies N(m)<=Del and kaJ<=S for 1<=j<=m by the explicit linear expression kaJ=(k+(2j-1)(t+1))/2. Native fill_ge: w=b'/(xn)<=b'/x=b_scale/X'<=b_scale; the top/thick/thin offset lower bounds dominate w, and the added b on tops is nonnegative by InWin. Hence fillG=fill-kaJ>=w-S>=4w/5>0 (fillG_ge). Also 0<theta<=1/5 from k>=5 and x>1, Scale.A=26. The exact window gives A<=y=a(s)<=A(1+theta)<=6A/5.
For every natural exponent e, set f_e=1_{e odd} max(0,y/p^e-fillG(partner_e)), exactly askG's summand. For every prime p>=2, 0<=f_e<=1_{e odd} y/p^e. Comparison with the summable geometric series proves summability, including the zero term e=0. The odd series is y/p times sum_{r>=0}p^(-2r)=yp/(p^2-1). This is at most 4y/(3p) since p^2>=4. Thus the stronger native-hypothesis consequence
    0<=askG<=8A/(5p)<=3A/p.
The source uses the general, non-parity-specific bound y/(p-1)<=2y/p (L142–175) and then 2y<=3A. The improvement uses odd support explicitly; no new premise, and no claim that 8/5 is sharp under the full native positive-fill hypothesis. Unlike gainP in RUN13, this is a bound on askG, not on gain.

## 2. Exact high-prime support (no primality premise in ask_high)
Set V=X''=A/w>=1 (native w<=b_scale<=A), sigma=thS=theta+3S/w. Then 0<theta<=sigma<=4/5, and
 (w-S)(1+sigma)-w(1+theta)=S(2-theta-3S/w)>=0.
For natural p>V, p>=2 automatically. Then y<=w(1+theta)p. For odd e>=3, p^e>=4p and fillG>=4w/5, so y<=fillG*p^e. Every e except 1 has f_e=0, without an interchange issue since all terms are pointwise zero. Thus askG=max(0,y/p-fillG(partner_1)). For V<p<V(1+sigma), it is <=theta*w+S by y/p<=w(1+theta). For p>=V(1+sigma), y<=V*w*(1+theta)<=V*(w-S)*(1+sigma)<=(w-S)*p, so it is zero, including equality at the upper cutoff. The theorem ask_high quantifies over every natural p>V, not just primes.
Dfc high: VV empty because a nonempty VV implies Cand and p<X'<=V. gainP=0 by its p>V guard, tauP=0 by VV empty, ioP=0 by VV nonempty guard. Therefore Dfc is the sum of asks only. Summing the preceding bound over m lifts and N tops gives precisely dfc_high. Retain high-prime sum supplier N.n9 and all source high interval bounds from RUN22.

## 3. Low deficit: exact algebra before bounding
Fix K,C,bo, hG:GainBoundAt X K C bo a b; p prime, IsResidueClassZero D p, p<=V and lo>=0 (all native dfc_le premises). Let T'=TTP subset T, z=|T minus T'|, u=|T'|, N=z+u, m=|lifts|. Write g=sum_j gainP_j-tauP, l=lo, F=fl, i=ioP. Specialize hG (second conjunct, inert disjunct) to get sum_{j,s in T'}askG - m*u*l - m*F <= g. Exact decomposition:
 Dfc=sum_{j,s in T minus T'}askG + sum_{j,s in T'}askG - g + i
     <= sum_{j,s in T minus T'}askG + m*u*l + m*F+i
     <= (8/5)*m*z*A/p + m*u*l + m*F+i.
This is stronger than the native dfc_le, since u<=N and l>=0. The first inequality does not itself require l>=0; it is needed for the replacement u by N. No sign needed on g or i for that algebra; positivity of the final majorant comes later from lo/fl and the bound io_le, not from assuming i>=0. No assumption of existence of weights: the statement is for each pair satisfying InWin and GainBoundAt.

## 4. Low/high error suppliers: logarithmic factors and strict branches
Let B=C(cG+eta), U=C log x, Y=(k x^Scale.A)^4, R=C rG b' log x, Lc=La K L.sc, c3=b'/x+eta+C*w*log x/delta1+bo. Use C,bo>=0, K.La>=0, native positive scales, p prime inert, p0>0. Native L1=ceil(log_p Y), so p^L1>=Y>0 and p^(-L1)<=1/Y. For inert p the exact lo consists of B log_p(2A) plus:
- p<p0, p<X': R+U*(Lc*A/(pk)+A*p^(-L1)).
- p<p0, p>=X': R.
- p>=p0, p<X': c3+U*(Lc*A/(pk)+A/p^2).
- p>=p0, p>=X': 0.
No p0<X' premise is necessary for these four exhaustive branches. Each term nonnegative under the indicated hypotheses. Multiplication by log p>0 converts the common term to c1=B log(2A); use the ceiling bound for the lower-prime tail and A/p^2<=A/(p*p0) for p>=p0. Thus log(p)*lo<=c1+1_{p<p0}log(p)c2+1_{p<X'}log(p)c3+1_{p<X'}(log(p)/p)c4 with c2=R+U*A/Y and c4=U*(Lc*A/k+A/p0). Extra nonnegative terms in the low branch are harmless. These are exactly the native constants L163–172. For fl=C*f*(Nm^2 log_p A+(log_p A)^2), multiplication by log p gives C*f*(Nm^2 log A+(log A)^2/log p)<=cfl=C*f*(Nm^2 log A+(log A)^2/log 2), with nonnegativity since A>1 and C>=0. Log change of base is justified by p>=2 and the increasing natural log (log p-log 2=integral_2^p dt/t>=0). No prime density theorem introduced here.

## 5. Revised conditional budget for PointsLemma
Retain every premise of latticeChain_succ_of_partial (RUN22), including all PrimeSumNumericFacts, Sets, WReq, adm2, adm3, ArchimedeanSignatureMatching, hSig, nonnegative constants and GainBoundAll. Retain native E1 terms 1–4; replace omission coefficients 3 by c=8/5 in terms 5–7, and 4 by c+1=13/5 in term 8, because the additional io_le coefficient remains 1. This follows by multiplying the improved dfc bound by nonnegative log p, using sdiff_le and io_le, and taking max with zero against the nonnegative resulting majorant. No change to WReq or its threshold.
RUN22 and native sum_low L48–116 bound each of the first four contributions by M*(1/20,1/40,3/2,1/40), M=m*N*A/x>=0. The remaining four are now M*(c/120,c,c/120,(c+1)/120). Justification: b5<=1/(120x), b6<=1/x, b7<=N/(120x), b8<=1/(120x), exactly the native log-sum/exceptional-prime numerical hypotheses and estimates. (The log-div sum uses sum_{k<=floor X'}1/k<=1+integral_1^{floor X'}dt/t<=1+log X', RUN22.)
High contribution remains M/40 under N.n9. Summing all nine coefficients in denominator 600 gives (30+15+900+15+8+960+8+13+15)/600=1964/600=491/150.
    sum_{p in finite inert S} log(p)*max(0,Dfc(p)) <= (491/150)*M <= 5*M.
This is a conditional strengthening of the first PointsLemma conjunct, not a new proof of any weighted sparsity/admission hypothesis. The second io sum is unchanged. No independent Lean replay, no proof-root edge authentication for these local theorems, no demonstrated URT acceleration. The original constant 5 remains valid.

## 6. Reproduce finite regression (executed in V8; replace text(c) by console.log(c) in Node)
The test uses exact BigInts, finite odd-power sums and simplified real-parameter instances, not native number-field operators. It exercises composite p as permitted in the high lemma; the full low argument only needs p>=2 but its native hypothesis remains prime. All general claims rely on the analytic derivations, not finite testing.
```js
const c={ask:0,high:0,cutoff:0,deficit:0,budget:0,negative:0};const ck=(b,k)=>{if(!b)throw Error(k);c[k]++};
for(const p of [2n,3n,4n,5n,7n,11n])for(const w of [500n,1000n,2500n])for(const S of [100n,200n,500n])if(5n*S<=w)for(const X of [2n,5n,12n])for(const t of [0n,1n,2n])for(const y10 of [10n*w*X,(10n+t)*w*X])for(const F of [w-S,w,2n*w]){
 const A=w*X;let num=0n;const den=10n*p**7n;
 for(const e of [1n,3n,5n,7n]){let n=y10-10n*F*p**e;if(n>0n)num+=n*p**(7n-e)}
 ck(0n<=num&&5n*p*num<=8n*A*den,"ask");
 ck(w*w*(10n+t)<=(w-S)*(w*(10n+t)+30n*S),"cutoff");
 if(p>X){
  ck(num===(y10>10n*F*p?(y10-10n*F*p)*p**6n:0n),"high");
  const inBand=10n*w*p<X*(w*(10n+t)+30n*S);
  ck(inBand?num<= (t*w+10n*S)*p**7n:num===0n,"high");
 }
}
for(const m of [1n,2n,3n])for(const N of [0n,1n,2n,3n])for(let served=0n;served<=N;served++)for(const lo of [0n,2n,5n])for(const fl of [0n,4n])for(const io of [-3n,0n,4n])for(const q of [0n,3n,8n])for(const r of [0n,3n,8n])for(const slack of [0n,5n]){
 const full=m*(served*q+(N-served)*r), net=m*served*(q-lo)-m*fl+slack, dfc=full-net+io;
 ck(dfc<=m*(N-served)*8n+m*served*lo+m*fl+io,"deficit");
 ck(dfc<=m*(N-served)*8n+m*N*lo+m*fl+io,"deficit");
}
const old=[30n,15n,900n,15n,15n,1800n,15n,20n,15n],newB=[30n,15n,900n,15n,8n,960n,8n,13n,15n];
const sum=a=>a.reduce((s,v)=>s+v,0n);
ck(sum(old)===2825n&&sum(newB)===1964n,"budget");ck(sum(newB)*150n===491n*600n,"budget");
ck(5n*2n*12n*2n===8n*10n*(4n-1n),"negative");
ck(6n*7n>8n*4n,"negative");
ck(2n*5n>8n,"negative");
// without served gain lower bound, one served ask=8, net=0, lo=fl=io=0, omitted=0.
ck(8n>0n,"negative");
console.log(c);
```
Actual corrected execution: {"ask":1944,"high":1512,"cutoff":1944,"deficit":19440,"budget":2,"negative":4}. 24842 positive assertions plus four controls (first control equality of geometric majorant with zero fill, second dropping parity, third dropping window, fourth dropping gain premise). Initial run failed due to a factor-two typo in the first control, fixed by using p rather than p^2 in the numerator; all prior assertions and all corrected controls then executed. These regressions include nonnative theta=0 and m=1, harmless for testing the weaker algebra; do not claim that these represent valid native D7. No CI replay of this embedded script.

## RESUME HERE
Request independent audit of the 8/5 askG bound, exact served-cardinality algebra, strict high cutoff and 491/150 budget. Ask dependencies/kernel/acceleration for exact role-labelled path from Main to manifest rows 1289266,1285612,1289250 and then to latticeChain_succ_of_partial/dfc_le; no duplicate scans. Next translate actual source of PrimeSumNumericFacts eventual family supplier (all n1–n9 fields) only if relevant; otherwise prioritize authenticated root-reachable UpperTheory.Comparison₂.core_gm (manifest 864997) in coordination with audit and math lanes, avoiding their existing work. Keep weighted sparsity inputs as obligations and distinguish H removal from P reachability. HANDOFF TO audit, dependencies, kernel, acceleration, integration, editor, prime_window. Full RH reconstruction OPEN.

<!-- END VERBATIM specialists/prime_window/RUN23_ASK_ODD_SERIES_AND_DFC.md -->

<!-- BEGIN VERBATIM specialists/theta_lifts/RUN23_SPECTRAL_COMPACT_HOLOMORPHIC_SPAN.md f3e40d6fb931da907bd14d330c908f15b1095caa -->
# RUN23 — Spectral differentiation, compact averaging, and complex tangent spanning (Steps C–D)
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction of Cx3.stepC, Cx3.stepD, djFd, sphU, holZero; deeper analytic and determinant suppliers and root role linkage remain OPEN. Upstream leanprover-community/riemann-hypothesis P=40e56bab026552e089d7afcfeff08d2defb9c005; observed main H=a18a350c3e5aad997766cff2670b292313e46574 (PR #2164, batch 14). No repin.
Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #420 (05:18:22 UTC, run 45549913981, general checks only), prior theta RUN22 da1c24bf, latest branch 93f6005c and 30 recent RH commits, 13 peer patches/handoffs including kernel 9c36efc5, dependencies bd222c67, acceleration 7df9865e, Landau db8c71c8. No competing Step C/D task observed. Blueprint not reopened, some peer notes inspected via commit patches only. No physics queue changes. Kernel RUN23 addresses different TLiftK guard scope; neither that nor this local work authenticates a Main-root edge to these theorems. All edges below are named source-level references.

Paths relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/. C=CayleyCosetSums/, A=AnalyticDeterminants/. Unless H explicitly specified, use P.

## 1. Step C exact statement and assembly
C/StepD:46–80, PositivityTheory.Rg.Sw.HSt.Cx3.stepC. Fix n,m,j natural, 1<=j<=n, and define
    a(z)=prod_{i=0}^{j-1}(i-z) prod_{i=0}^{n-j-1}(i-m-z).
Assume a'(0)!=0, hFd:FdProps, hDj:DjFd, hSph:SphU, hFz:FzHol. Kg is a compact topological space with measurable and Borel structures, mu a finite measure finite on compact sets; iota:Kg->M2(n) continuous with every iota(k) in G; rho:Kg->C continuous. No group structure, Haar property or normalization on Kg is required for this theorem. Let A_j={indices<j}, B_j=complement, and D_Q,D_R denote the nested determinant derivatives on matrices supported in these blocks. Order: outer T in A (upper Cayley block Q), inner S in B (lower block R), not the reversed order of Step G. Assume for EVERY g in G:
    D_T D_S int_K Fd(m,iota(k) g mX(I,emb_A(T),emb_B(S),I)) rho(k) dmu = 0.
Then for every g in G, int_K hF(j,m,0,iota(k)g) rho(k) dmu=0.
Proof: FzHol gives an open DomZ containing G; every iota(k)g belongs to it. FdProps field 1 gives complex smoothness (its field 2 is unused here but retained). The identity mul_mX with LQ/LR gives an affine perturbation in T,S. Both LQ and LR commute with left multiplication in the exact sense LA(Mx)T=M LA(x)T, etc. SphU therefore moves the nested differential into the integral; DjFd evaluates the result at iota(k)g as a'(0) hF(j,m,0,iota(k)g). Extract the constant a'(0), divide only by its assumed nonzero value. C/VacuumNonvanishingOfFacts:47–64 supplies the Step B premise by topComp (not reconstructed here) and chooses j=n-m, m<n; obtains a'(0)!=0 from deriv_prod_range_sub_mul_prod_ne_zero, then calls stepC and stepD with rho=rhoP(iota,m,0,Y) for all Y.

Useful exact compression of the coefficient for arbitrary natural m and 1<=j<=n: a(0)=0. If m<n-j the second product has an additional root at zero (index m), so a'(0)=0. Otherwise
    a'(0)=(-1)^(n-j+1) (j-1)! prod_{i=0}^{n-j-1}(m-i) !=0.
This is a direct product-rule derivation, and empty products are 1. In the consumer j=n-m this is (-1)^(m+1)(n-m-1)!m!, agreeing with RUN19. The nonzero hypothesis of stepC cannot be removed for arbitrary j (e.g. n=2,m=0,j=1 yields z^2). This is elementary algebra, not a new RH result.

## 2. Native djFd supplier: why the spectral derivative survives
C/FdProps:16,34–39; C/FzSliceContDiffOn:17–129. Fd(m,x)=partial_z fz(m,0,z,x)|z=0; DjFd quantifies all n,m,j natural, 1<=j<=n and x in DomZ, with NO m<n requirement. Let U(z,x)=fz(m,0,z,x), complex smooth on C x DomZ via the actual fzHol theorem, and let mathcal D be the nested determinant derivative with Q on A and R on B. Expand mathcal D as finite signed sums of mixed spatial derivatives (detD_detD_comp, lines 46–62). The actual iFD_deriv_comm (C/DerivEqFderivPair:78–107) states for complete complex normed V, open D, jointly complex smooth U on C x D, w0 in D, every k and every tuple v in V:
    D_w^k(partial_z U(0,w))(w0)[v] = partial_z (D_w^k U(z,w0)[v])|0.
Proof uses the product-space embedding directions (1,0), (0,v_i), restriction to open sets, and induction moving the fixed direction through the derivatives via symmetry of second Frechet derivatives (private theorem :45–76); all finite orders available. Thus mathcal D Fd = partial_z mathcal D fz|0; finite sums pass through the derivative by differentiability proved at :66–98. Actual djZ (C/AbsArgLtPi:143–191) gives
    mathcal D fz = a(z) fz(m,0,z,x) minor_A(W(x)) minor_B(W(x)^(-1)).
Here W=wM(x); the latter minor is of the INVERSE MATRIX, not inverse of a scalar minor. DomZ (C/CruxSt:16) requires x in Dom and det(u1 x)det(ub1 x) in the principal slit plane. In djZ the local branch guard is essential: positive delta=(pi-|arg(det(u1)det(ub1))|)/2, restrict T,S to neighborhoods where each determinant is nonzero and each argument absolute value <delta; eventual equality suffices for detD_congr. It then uses fz_mX and detD_det_one_add_mul_rpow_eq. Their full suppliers are not discharged in this run. With j>=1, a(0)=0; the second term of the product rule disappears; fz(0) gives f0. Therefore mathcal D Fd=a'(0) hF. No division by a'(0) in DjFd itself. The proof uses actual fzHol, iFD_deriv_comm, djZ; no added regularity or global complex-power multiplicativity.

## 3. Native sphU supplier: compact differentiation under the integral
C/FdProps:49–60 gives exact SphU quantifiers: any n, open U in M2(n), F complex smooth on U, compact topological Kg with measurable/Borel structure, finite measure finite on compacts, continuous iota and scalar weight c, finite decidable index types for LA and LB, complex continuous linear maps in the T/S arguments, left covariance for ALL M,x,T,S, and g with iota(k)g in U for all k. The desired equality is the two determinant derivatives of the averaged F equal to the average of the derivatives with LA,LB evaluated at iota(k)g.
C/SphU:189–224 proves this. Its actual helper :140–181 uses continuous L_k=left multiplication by iota(k). Domain Omega={y: for all k, L_k y in U} is open by compactness of Kg and joint continuity; importantly it is not assumed that arbitrary infinite intersections of open sets are open. For each order N the translated derivative is c(k) D^N F(L_k y) composed with L_k in each slot (:121–138). This gives joint continuity in k,y. The helper :34–119, despite its opaque name matrix_mul_comm_of_mul_eq_smul_one_of_ne_zero, proves differentiation of an integral to every order: choose closed ball contained in Omega, compact in the finite-dimensional complex matrix space; joint continuity of D^{N+1} gives a uniform norm bound on Kg x ball, integrable since mu finite. The theorem hasFDerivAt_integral_of_dominated_of_fderiv_le supplies each induction step (:63–90). Currying isometric linear equivalences commute with integration, base case N=0 and induction (:91–119). Integrability of derivative maps follows from compactness and continuity with finite-dimensional codomain. Expand nested determinant operators as signed finite sums; evaluate continuous multilinear maps inside the integral and pass each finite sum and constant through (:197–224). This proves SphU, rather than merely assuming it. The Mathlib dominated differentiation theorem, detD_detD_comp and affine derivative lemmas remain imported obligations, not independently replayed.

## 4. Step D and actual holZero supplier: complex tangent span, not real-open identity theorem
C/StepD:16–44, Cx3.stepD: for j natural (no rank condition), p,q integers, compact topological Kg with measurable/Borel structure, finite measure finite on compacts, continuous iota with image in G and continuous rho, assume H(g)=int hF(j,p,q,iota(k)g)rho(k)dmu=0 for every g in G. For every N natural, every W:Fin N->M2(n), and every g in G,
    int_K D^N hF(j,p,q,iota(k)g)[iota(k)g W_i] rho(k)dmu=0.
Define Omega={x: every iota(k)x in Dom}. It is open by isOpen_domK; G subset Omega, since G closed under multiplication and contained in Dom. holInt and complex smoothness of hF imply H smooth and identify its derivatives with averaged derivatives; holZero gives D^N H(g)=0. Evaluate on g W_i and apply left-multiplication chain rule, with rho constant in x. N=0 retained.

Actual holZero in A/FderivEqZeroOfVanish:32–133, uses complete complex normed target V and H complex smooth on open Omega containing G, H|G=0. It does NOT treat the real group as an open complex domain. Write U_b=[0,b;0,0], L_c=[0,0;c,0] with b,c Hermitian. Real lines g(I+tU_b),g(I+tL_c) stay in G. Thus dH_g(gU_b)=dH_g(gL_c)=0. The curve exp(it)g stays in G, giving dH_g(ig)=0, hence dH_g(g)=0 by complex linearity. Differentiating the two first-derivative identities along the other real line gives
    d²H_g(gU_b,gL_c)+dH_g(gU_b L_c)=0,
    d²H_g(gL_c,gU_b)+dH_g(gL_c U_b)=0.
Symmetry of the second derivative cancels it, leaving dH_g(g[L_c,U_b])=0; bracket=[-bc,0;0,cb]. This is the source :61–90 argument, not an assumed Lie algebra theorem.

Actual span_top (A/Imports:17 onward) proves these directions span all M_(2n)(C). First B=(B+B*)/2 + i(B-B*)/(2i) decomposes arbitrary B into two Hermitian pieces. Complex linearity in upper/lower blocks and bilinearity of the bracket extend annihilation to arbitrary B,C. In matrix units E_ab, take B=E_ab,C=E_bb for a!=b to get (-E_ab,0) in the diagonal blocks; reverse order to get (0,E_ab). B=E_ak,C=E_ka yields (-E_aa,E_kk). These differences span the trace-zero diagonal subspace (2n-1 independent differences suffice for n>0); adding identity, trace 2n!=0, spans the remaining direction. All four blocks now span M2(n). For n=0 there is only the zero matrix, so no division by n is needed. Since g invertible, left multiplication is surjective and dH_g=0. Induct with H replaced by dH (complete continuous-linear-map target, smooth on Omega) and curry the derivative, yielding D^N H(g)=0 for every N, including N=0. No global connectedness claim. Actual holInt in the same file :135–190 invokes HolA.hasFDerivAt_int to differentiate successive averaged derivatives; currying and bounded linear evaluation commute with Bochner integration. This is a second native compact-differentiation supplier, not a new axiom and not identical to sphU's private helper. Its imported HolA details remain open.

## 5. Provenance and execution
Pinned connector blob receipts (all fetched and inspected, not a kernel replay; reproduce by git rev-parse P:FULL_PATH):
```
C/StepD d0afbe992416d266e0053e69dc5911e4092bebd7
C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
C/FdProps 1bbff855867c08b480b03ff6e62cfcaac88f0479
C/FzSliceContDiffOn 552d7ad02dc2c1c7871f48d881c40822ae2c49d0
C/SphU ac8846f2047da4fd46635a2ebfbf3951473ac5ea
C/CruxSt 73b4302b0eb23bd4e524572c8b09adfcc6903279
C/DerivEqFderivPair afe4779fafbcf06894e2b3dd38d33a702bcaa9ac
C/AbsArgLtPi 9918621d5c88cbc9aac7b194b416d074128701c3
A/FderivEqZeroOfVanish 77f653d6f3f4dc06b019d978eb88f4f5630bb09d
A/Imports ad29a4bd5705613a88dadaf4f02244b8546647c8
A/TwoSided eb9419ee5c118769aad7b050ca180f9ca69dd47a
```
Latest H source check: C/StepD and C/SphU old paths 404; C/Crux blob 7ee5755446d0b5dc5e24987162d591acdc8415f0 contains sphU:597, stepD:850, stepC:880, consumer:940 and crux:1211; C/FzSliceContDiffOn blob 25fb44f1f45cbdfb8119c33bc4613b54b3bfe066 contains djFd:728; A/FderivEqZeroOfVanish blob 57ea7b794912b45901fb735759d2d61b52fcb697 contains fderiv_eq_zero_of_vanish:344, holZero:443, holInt:500. Compared declaration presence/relocation only, no assertion of semantic equivalence. Standard ingredients here are complex differentiation, Haar/Bochner integration machinery, and matrix commutators. No specific external publication attribution established. FdInv in FdProps:41–42 is a trivial True predicate, not used as a proof of an invariance fact by stepC/D. No transitive placeholder/axiom audit.

Executed local CPython below, exit 0, twice (second run cleaned an unused initialization). Tests are bounded exact integer polynomial recurrence and modular rank certificate for the integer subfamily of matrix-unit generators obtained AFTER Hermitian decomposition. Modular full rank gives rational/complex full rank because the corresponding integer minor is nonzero modulo 1009; trace gives matching upper bound for the traceless family. Not a regression of arbitrary complex analytic functions or a Lean replay.
```python
from math import prod, factorial
P=1009
def rank(rows,d):
    piv={}
    for row in rows:
        v=list(row)
        for i in range(d):
            a=v[i]%P
            if not a: continue
            if i in piv:
                w=piv[i]
                for j in range(i,d): v[j]=(v[j]-a*w[j])%P
            else:
                a=pow(a,-1,P)
                piv[i]=[(a*t)%P for t in v]
                break
    return len(piv)
def unit(n,a,b):
    d=2*n
    v=[0]*(d*d); v[a*d+b]=1
    return v
def br(n,a,b,c,d):
    N=2*n
    v=[0]*(N*N)
    if b==c: v[a*N+d]-=1
    if d==a: v[(n+c)*N+n+b]+=1
    return v
span=[]; generators=0
for n in range(1,9):
    N=2*n; d=N*N
    rows=[unit(n,a,n+b) for a in range(n) for b in range(n)]
    rows += [unit(n,n+a,b) for a in range(n) for b in range(n)]
    rows += [br(n,a,b,b,b) for a in range(n) for b in range(n) if a!=b]
    rows += [br(n,b,b,a,b) for a in range(n) for b in range(n) if a!=b]
    rows += [br(n,a,0,0,a) for a in range(n)]
    rows += [br(n,0,b,b,0) for b in range(1,n)]
    I=[int(a==b) for a in range(N) for b in range(N)]
    assert len(rows)==d-1 and all(sum(v[i*N+i] for i in range(N))==0 for v in rows)
    assert rank(rows,d)==d-1 and rank(rows+[I],d)==d
    generators+=len(rows)+1;span.append((n,d-1,d))
count=zero=nonzero=0
for n in range(1,65):
    for m in range(n+3):
        for j in range(1,n+1):
            a,b=1,0
            for t in list(range(j))+[i-m for i in range(n-j)]:
                a,b=a*t,b*t-a
            assert a==0
            if m>=n-j:
                expected=(-1)**(n-j+1)*factorial(j-1)*prod(m-i for i in range(n-j))
                assert b==expected!=0; nonzero+=1
            else:
                assert b==0; zero+=1
            count+=1
print('span ranks (n, trace-zero, full):',span)
print('matrix generators:',generators)
print('spectral product cases:',count,'nonzero:',nonzero,'zero:',zero)
```
Actual stdout:
```
span ranks (n, trace-zero, full): [(1, 3, 4), (2, 15, 16), (3, 35, 36), (4, 63, 64), (5, 99, 100), (6, 143, 144), (7, 195, 196), (8, 255, 256)]
matrix generators: 816
spectral product cases: 95680 nonzero: 52000 zero: 43680
```
No new assumptions added; explicit zero branch guards retained. CI for this new artifact not run; no Lean kernel validation, proof completion or URT speedup claimed. Full RH OPEN.

## RESUME HERE
Reconstruct actual Step E and its KSplit supplier (C/Crux import KsTraceSingle, C/VacuumNonvanishingOfFacts:66–130): exact finite compact right-translate decomposition of fV times the inverse Cayley matrix entry, then rit_transpose and its invariant measure supplier. Retain topComp Step B, Step F, FdProps, FzHol, Cayley/UAct, djZ's fz_mX and complex Capelli identity, Gaussian base/GI.integP, CR.crLem_of and KSing.lamSing_of. Ask dependency/kernel/acceleration for authenticated cached role-labelled Main path to crux, holLeadB 8996470, and stepC/D, not a duplicate raw archive scan. Coordinate with Landau RUN23 on its higher-level root path; do not double-count unrelated local results. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.

<!-- END VERBATIM specialists/theta_lifts/RUN23_SPECTRAL_COMPACT_HOLOMORPHIC_SPAN.md -->
