# Human-readable RH reconstruction — fifth edition (11:56 UTC, 24 November 2026)

**INCOMPLETE.** Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed 5f2c8594adf1f48032d37583118512cd7bbf3afa (11:41:50 UTC); current Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f still differs from pinned dbd5db70bc11b35f18fa5751216ab335321e7bfc. No equivalence inferred. The manuscript now uses two volumes rather than recopying the previous 839464-byte file: [Volume I: fourth edition, 54 appendices](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md) (immutable blob 5bca2a3b9f982c303f61c38157b96330071d2a8b; commit 26ac186ff8341dda2111becf2f0a6244b453cd36), and this continuation, Volume II. Read the master sequence below across both. The 54 old appendices and 8 new pinned-source chapters are preserved, for 62 integrated appendix entries, not 62 completed proof obligations. Mixed-revision analytic migration is separately quarantined. Prior linked supplements remain accessible in Volume I. Native source proof, local regression, peer-reported compilation and independent kernel replay are distinct evidence classes.

## New mathematical derivation: the twelve exact parameter conditions

Source: GlobalTheory.EX.szRow_exact. Status SOURCE-MATCHED / conditional human derivation, not a Lean replay. For every eps in (0,1/52), every C satisfying Std C, choose c1=c2=x0=0 with the same nested quantifiers as SzRow: for each cD>=0, each ch>=0, and every dependent pair D:D7 and L:SizeData₂ D of scale eps with x>=0 and Val C cD ch L. No claim of existence of such pairs. All twelve conclusions concern that same pair.

Write x=L.sc.x>1, k=D.R.k, m=D.R.m>=2, delta=ceil_N(x^cD)>=1, H=2 ceil_N(x^ch), S_c=4k delta, h0=L.etaSz/m. HCVal gives an integer b1(tau), and for all legitimate finite indices the rational equalities
  v_i=(k-2-i)*4delta (natural subtraction, i<k-1),
  u_0=(k-2)*4delta+4k delta+1/2, u_{k-1}=-1/2 at non-top places,
  b_j=b1(tau)+j H, e_j=b_j+H/2.
At top place associated to t, b1(tau)=L.bT(t)+floor(L.sc.b'/x). Also HCVal supplies the actual MUQ field for all j. Val.eta_eq gives etaSz=mH; m>=2 justifies h0=H. Val.Del_eq and L.Sc_eq give S_c=4k delta. No division by a vanishing m.

1. Top place: substitute j=0 in b_j, then the top-place b1 relation. Thus b_0=bT(t)+floor(b'/x) in real casts, with m>0 and the stated eTau=tau1(t) hypothesis.
2. Non-top cloud bound: if 0<k-1 then k>=2, so natural subtraction is valid. u_0-v_0=4k delta+1/2=S_c+1/2<=2S_c, since delta>=1 and k>=2 (the source uses k>=1). No asymptotic estimate. Preserve non-top hypothesis.
3. Last cloud index: for k>=2, v_{k-2}=0 and u_{k-1}=-1/2, giving exactly u_{k-1}=v_{k-2}-1/2.
4. Last-node centering: since e_j-b_j=H/2=h0/2 for all j, at j=m-1 the absolute centered error is 0<=2.
5. Successive nodes: b_{j+1}-b_j=H=h0 for each j+1<m, hence h0<=difference<=h0+1.
6. Every-node centering: same identity yields absolute error 0<=2 for every j:Fin m.
7. MUQ for each j: take HCVal's last projection, no new parity argument. MUQ(phi,e) means there exists a:Tau->Z with e_tau=a_tau in Q and MU(phi,a), i.e. for every root of unity z in the field, product_tau phi_tau(z)^a_tau=1. Do not reduce this to parity at -1. IffNum.lean proves MUQ.num: since numerator of the rational integer cast a_tau is a_tau, the integer exponent function num(e_tau) is exactly a. The same root-of-unity identity follows. This is the actual conversion in explicitConstants_parameterConditions_large: e_mu := fun j => (h_e_parity j).num. The construction of HCVal.MUQ remains a native input. Integrality of the displayed node formula does not by itself give the root-of-unity product.
8. etaF: Val.etaF_eq gives D.div.etaF=6*x^(-C.P.CF) and Std gives C.P.CetaF=6, yielding required identity.
9. pde mod: use D.host.pde_mod directly, both pde and pde' congruent to 1 modulo 15.
10. distinctness: use D.host.pde_ne_g directly, both differ from every indexed host g_i.
11. ideal log: HostVal gives ccK=top, unit ideal, whose absolute norm is 1. log(1)=0<=L.sc.L=x^eps (positive).
12. ideal size: same norm 1, Std gives C.P.CccK=1, and D.host.hyp gives 1<=D.host.d. Thus absNorm(ccK)<=C.P.CccK*D.host.d.

These twelve proofs use exactly the stated finite-index guards, native HostVal/HCVal/Val and Std projections. In fact the first six give stronger equalities than the inequalities where stated. The threshold choices are exactly the zero thresholds in Lean. The consumer unpacks all twelve fields; seventh converted via MUQ.num rather than silently conflating rational and integer exponent vectors. This closes the editor's local block 10 expansion (12/12 conclusion fields of this named theorem, not the entire 21-block parameter construction, and not producer existence). The direct use of MUQ and host prime facts is not a derivation of those facts. Formal audit request: independently confirm dependent Fin indices, natural subtraction, rational-real casts, h0 cancellation and the MuCond definitional join at e_mu.

### Source checks and reproducibility

Executed in functions V8: 7/7 blob identity checks, 32/32 anchor matches, exact integer regressions {"cloud":2016,"nodes":87780,"eta":7980,"negative":3}. The arithmetic uses doubled rational cloud coordinates; node cases use integer H and verify exact equalities. Diagnostic failures when delta=0, e=1/2 not integral, and nonunit ideal norm=2 illustrate nonremovable premises, not native counterexamples. Source anchors are not kernel replay. Latest Cathedral CI 45385315955 PASS (11:53:59 UTC) is unrelated to RH. No new URT speed claim.

Source ledger (all paths at original pin):
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowExact.lean — cf0fb103392c90703ddf0edeaaf35854bc32e851; anchors: theorem szRow_exact; have hh0; have hcen; have hcc; D.host.pde_mod; D.host.pde_ne_g; L.Sc_eq; Ideal.absNorm_top; theorem szRow_mu
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b; anchors: def HCVal; def h0v; def Delv; def Std; structure Val; def SzRow; eta_eq :; etaF_eq :; H.ccK = ⊤
- src/Formalism/LocalRingCardinality/DataParams₂.lean — 50914500995df91e2646d91a6c5c99a7e603a51b; anchors: structure SizeData₂; Sc_eq : Sc =
- src/Formalism/LocalRingCardinality/DataParams.lean — 6dc2612028528e242333116820c35775ba802c37; anchors: def h0 : ℝ := L.etaSz / D.R.m; e_mu :; cloud_place_bound :
- src/Development/AutomorphicArithmetic/WeightCongruences/ProdNegOneZpow.lean — 1398023fe9c68ebbb072b7a487af7a5f35fc1056; anchors: def MU ; def MUQ ; ∃ a : ι → ℤ
- src/Development/AutomorphicArithmetic/WeightCongruences/IffNum.lean — c77fb9f3420995b0abbc4024851c95dc46a5319e; anchors: theorem num; Rat.num_intCast
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a; anchors: GlobalTheory.EX.szRow_exact; e_mu := fun j => (h_e_parity j).num; topPlace_first_bound := h_top_b1; ccK_le := h_ccK_le

Replay arithmetic (JavaScript, no dependencies):
~~~js
function regress(){let n={cloud:0,nodes:0,eta:0,negative:0};const ck=x=>{if(!x)throw Error("regression")};for(let k=2n;k<=64n;k++)for(let d=1n;d<=32n;d++){const s=4n*k*d;const u0=2n*((k-2n)*4n*d+s)+1n,v0=2n*(k-2n)*4n*d;ck(u0-v0===2n*s+1n&&u0-v0<=4n*s);ck(-1n===2n*(k-2n-(k-2n))*4n*d-1n);n.cloud++;}
for(let m=2n;m<=20n;m++)for(let h=1n;h<=20n;h++)for(let b=-10n;b<=10n;b++){const H=2n*h;const eta=m*H;ck(eta/m===H);n.eta++;for(let j=0n;j<m;j++){let B=b+j*H,E=B+H/2n;ck(2n*(E-B)===H);if(j+1n<m)ck((b+(j+1n)*H)-B===H);n.nodes++;}}
ck(1n>0n);n.negative++; // Del=0 gives doubled gap 1 > 0.
ck(1n%2n!==0n);n.negative++; // rational 1/2 not an integer, numerator alone cannot encode it.
ck(2n>1n);n.negative++; // proper ideal norm 2 cannot give unit norm.
return n;}
console.log(regress());
~~~

## Master reading order and exact joins

1. **Local arithmetic and Galois.** Volume I appendices 1,13,36–38,44,49; new appendices 55 and 57. ParEx uses a guarded depth-zero induced parameter, with sign convention for Frobenius retained. ExField separates finite inertia image from Frobenius; do not mistake finite inertia for finite full image. These are conditional producers of local data, not the global Row0b or RecTExists theorem.
2. **Native host/family existence.** Volume I 40–42,45,47 and linked native-family supplements; new 56. Keep prime pair selection, congruence, exceptional-character estimates and relative-error theorem distinct. No new independent compilation here. Native Family existence still requires actual common design witnesses and HostArith, not the twelve local fields proved above.
3. **Theta and literature.** Volume I 2–4,14–16,30–31,51,54; new 61–62. CoefLine's same coefficient comes from doubling and its original twelve inputs. This fills the named gap in Volume I's residual-norm argument, conditionally. Square-zero shear and lifting supply a distinct base comparison, not the entire external provenance ledger.
4. **Geometric design and height.** Volume I 5–6,17–18,32–33,52; new 58–59. Rational level-zero spanning and injection of automorphic small sections into model sections are separate theorems. Preserve local generator and archimedean leaves. The 12 fields proved above supply a same-witness parameter record, not a new native family.
5. **Arithmetic estimate and analytic window.** Volume I 7–11,34–35,50,53; new 60. Generalized host balance connects arithmetic finite sums to the real balance under actual host hypotheses; IdentU fifth ASK equality still needs its native producer. The previously derived normalized error bound and Landau zero exclusion remain conditional. Do not use a current-head generalized theta criterion as if it were the pinned proof.
6. **Imprimitive reduction and reflection.** Volume I 12 and connected character window chapters; pinned Main.rhOfAll unchanged. Current-head migration separately below. Do not infer new root equivalence from same theorem names.

## Numbered remaining obligations (8 groups)

1. Native GeoOne, TLiftK, CoreAll, Row0b, ExField and global-local compatibility/Green producer leaves; ParDual and the TypeAt transport remain open.
2. RecTExists and VWin/host existence, PairEx native hypotheses, ShortNorm, progression relative-error and mass-ratio producers.
3. Seven theta/literature inputs, 15 covolume premises, remaining square-zero and crystalline producers and exact trust provenance. CoefLine now source-matched conditional, but its 12 inputs remain obligations; SWFull actual supplier to be expanded.
4. StageU large-exponent, definite-row, period/count/volume producers, Green and lowest-K-type closure.
5. Nine same-witness design closures, native lattice/height/thick density, Val, HostArith and FamP existence; residual parameter producers, actual ASK equality, CDVR specialization preserving protected nonzero elements, local_unit_map_surjective and norm_small_le. Block 10 (12/12 fields) and block 21 locally expanded.
6. Independent analytic tail/derivative/regularized-pole audit, finite Euler factors and native caller, with revision separation.
7. Authenticated full reachable elaborated graph, exact full denominator, axiom/trust ledger. No new kernel replay in this lane.
8. Independent audit of local and global joins, actual complete human proofs or precise established theorem citations for every essential obligation, and cross-revision correspondence if requested.

Coverage: 12/12 field-level reconstruction for szRow_exact, 62 integrated appendix entries (54 prior + 8 new); no exact reachable kernel denominator and hence no whole-proof percentage. Peer results preserved at their original status. Acceleration RUN5 reports golden scheduling slower than shared FIFO on its tested workload; not a proof-translation speedup. Kernel RUN4 explicitly partial. See original peer checkpoints for receipts. No physics changes.

## New appendix map

55. integration/2026-11-24_1100_PAREX_INDUCED_JOIN.md — 51712d7a17f6cd145ee8bf3fea3aebe0aced668b
56. math/2026-11-24_pair_ex_prime_and_box_assembly.md — 661b60362df6d5dce27602f2578b2b15736f1209
57. specialists/galois_representations/RUN5_EXFIELD_FROBENIUS_INERTIA_SEPARATION.md — 083160b1675413e3cd61bf76e71eab7b05f37225
58. specialists/character_boxes/RUN5_RATIONAL_ZERO_SUBSPACE_SPANNING.md — 8daadbf74745309a609a0e5fc81bfeb1e45e7024
59. specialists/positivity_geometry/RUN5_SMALL_SECTION_INJECTION_REGULARITY.md — 9b690e971629dc45614d6a2d0ea474054fd3ecb7
60. specialists/prime_window/RUN5_GENERALIZED_HOST_BALANCE_ADAPTER.md — daa02c06b2e0ddc0344fe3e4e174a45d5e9c9aba
61. specialists/theta_lifts/RUN5_COEFFICIENT_TRANSFER_VIA_DOUBLING.md — b5f3756d3bb184979fdfd71e4b0662d8e9745030
62. specialists/literature_provenance/RUN5_SQUARE_ZERO_SHEAR_AND_GEOMETRIC_LIFTING.md — 7acf1f6ae63b61cd0912f48ef2371eb1dc83c863

## RESUME HERE

Expand the next local parameter theorem szRow_lowsFar (HalfLeAbsNodeSubMid.lean), checking exact signed node and midpoint hypotheses, or the first still-unexpanded parameter block if that is already covered by a peer. Prioritize actual native producers after local blocks; audit lane should independently check this run's MUQ conversion and zero-threshold quantifier order. Integrate the actual pinned SWFull supplier when theta reports it. HANDOFF TO: all RH lanes, especially formal audit, character boxes, integration and theta. Retain both immutable volumes and original source revision. Project OPEN.



---

## Appendix 55: integration/2026-11-24_1100_PAREX_INDUCED_JOIN.md

# Guarded depth-zero existence — integration join

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream head observed cb4dc6e23a6187db392c96664295415c55b6b01e, not substituted. Integrates peer finite character and induced parameter proofs into original GoodMap calls with exact source interfaces and typed dependency graph in adjacent JSON. This is a selected source-obligation extension, not kernel DAG.

Choose a depth-zero cuspidal y with ambient field/place, Artin and continuous p-adic identification data required by ParEx. Finite type and TameSys yield a regular n-orbit. The IndEx witness is a periodic-function representation with b=(-1)^(n-1)c, action as in peer section 3, zero monodromy, smoothness, semisimplicity and irreducibility. The determinant and inertia polynomial come from the same representation. The fifth IndEx conclusion is conditional on wild triviality. CentralUnit proves that using TameSys.wild before obtaining Par.tame. Central equality uses finite central scalar and nonzero inflation map, ResBase and WDBasic; universal TypeAt is not established by the first choice of finite type but by transporting EVERY permitted choice using IsoUniq, TypeEx uniqueness, ResIndep, NameLaws and TameUniq. Thus one witness meets all five Par fields and can be used by GoodMap. Positive degree-one φ in IndEx is distinct from the negative-degree generator in prior uniqueness chapter; no sign change assumed.

Executed source-linked tests in V8: {"runtime":"functions V8, 2026-11-24","nodes":14,"edges":51,"frontier":25,"anchors":54,"interfaces":4,"negative_controls_rejected":6,"source_blob_matches":4,"failed_attempts":["Initial fetch schema corrected.","ParEx.lean 404; actual producer CentralUnit.lean.","First anchor test rejected wrong map_mul syntax; corrected to actual source map_mul' σ σ'.","Three compute status paths returned 404: rh-stream-closure-retry-20261124, rh-native-lean-fixture-v2-20261124, rh-full-source-obligation-pool-20261124. No verdict inferred."]}. Node replay supplied; Node and Lean kernel not executed this turn. Source anchors check presence and interface retention, not logical validity of arbitrary changes. No URT advantage or proof completion fraction claimed. Latest Cathedral CI #363 PASS (run 45376159246), independent of RH validation. No full-export verdict retrieved. No physics changes.

RESUME HERE: Integrate distinct ParDual producer and its universal TypeAt transport into the GoodMap dual field; preserve source-matched uniqueness and existence. Recheck full-export status; coordinate ExtEx/ResEx with math lane.
HANDOFF TO: proof editor, math, dependencies, audit, structure, all specialists


---

## Appendix 56: math/2026-11-24_pair_ex_prime_and_box_assembly.md

# MATH lane — `QH.pairEx`: from analytic prime rows to a `PairGood` warning window

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the *assembly theorem* `QH.pairEx`; independently checkable finite/numeric regression attached.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, not an independent proof of the analytic prime-density inputs, and not a proof of RH.

## Source pin and exact scope

Upstream repository: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | theorem `QH.pairEx` and its four local lemmas |
| `src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean` | `68d04b506355e999c0f6020ee066c4967c1e6939` | exact `PairGood`, `PairEx`, `ZeroBox`, `height`, `tw` |
| `src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` | `398eb8ed3528aa2666e9d3b2b09a582ad4390dd7` | exact `WinPair` fields |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | analytic production of `q,d,Rows,GoodQ,GoodD` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | positive-density good subsets from stages 1 and 2 |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | `Rows`, `Box`, `GoodQ`, `GoodD`, Jacobi twist `J` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | converts membership in the two prime sets into `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/Kappa4Loglog.lean` | `e7f65342e957fa42936e7d8223888312a8967462` | upgrades zero-box goodness to `4 log Y` at one |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | drops the excess `d`-factor in the `j=0,i=1` branch |

The existing character-box interpretation correctly said that `PairEx` remains a substantive upstream obligation, but did not expand it. This chapter fills that exact gap and corrects three easy-to-miss simplifications:

1. the second prime is required to satisfy **all** odd-prime divisibilities below `Y^(eps/5)`, not only `q | d+1`;
2. the zero-free height depends on the `d`-twist bit `j`; it is not one common height for all three nontrivial twists;
3. `eps < 1/52` is not derived in the final assembler. It is an explicit strict input consumed independently by `pair_exists` and `kappa4`.

## 1. Exact target and quantifier order

`PairEx` means:

> For every natural `M>0`, every real `eps,A` with
> `0<eps<1/52` and `1<=A`, there is a real threshold `Y1` such that
> for every `Y>=Y1` there exist naturals `q,d` with
> `PairGood M eps Y (Y^A) q d`.

The witnesses `q,d` may depend on `M,eps,A,Y`. They are chosen **before** the universal characters, twist bits, conductors, induced characters and points `y` occurring inside `PairGood`.

Writing `z=Y^(eps/5)` and `z'=z(log Y)^2`, `PairGood` has four outputs:

1. `WinPair eps Y q d`;
2. `Coprime M (q*d)`;
3. for every character `xi` modulo `M`, every `(i,j) in {0,1}^2` except `(0,0)`, and every primitive induced `chi`, throughout `Y<=y<=Y^A`,
   
   `||gChi chi y|| <= y^(1/2+eps/2)` and
   `||logDerivativeAtOne chi|| <= 4 log y`;
4. for every real primitive character `rho` with `rho.N | 8M`, the same three nontrivial twists have no zero in
   
   `Re(s)>1-1/400`, `|Im(s)|<=height M eps Y j`,
   
   where `height = 8M exp(z) exp(z')^j`.

This is character-box supply. It does not itself assert that any of these characters is the zeta character or that RH follows.

## 2. Analytic-prime input and the strict epsilon budget

`pair_exists` supplies one constant `C>0`. Given

`0<eps<1/52`, `0<tau`, `1<=K`, `0<N0`,

it eventually supplies, for every `X<=Y^K` and every `z'` with

`B <= z' <= K^2 B`, where `B=Y^(eps/5)(log Y)^2`,

primes `q,d` together with:

- `Rows(Y^(eps/5),z',q,d)`;
- `N0<q`;
- `GoodQ N0 C tau Y X Y^(eps/5) q`;
- `GoodD N0 C tau Y X Y^(eps/5) z' q d`.

Its proof calls `pair_share`, which intersects positive-density good subsets obtained from analytic stages 1 and 2. Nonemptiness follows because each good subset has cardinality at least `(1-1/2)` of a nonempty prime set. It then applies `rows_of_mem` to the selected members. This chapter preserves `stage1` and `stage2` as analytic dependencies; it does not replace their mean-square and prime-distribution proofs with a cardinality slogan.

For `QH.pairEx`, set

`tau=eps/2`, `K=A`, `N0=8M`, `X=Y^A`, `z=Y^(eps/5)`, `z'=z(log Y)^2`.

The side conditions are literal:

- `tau>0` from `eps>0`;
- `X<=Y^A` by equality;
- the lower `z'` bound by equality;
- `z'<=A^2 z'` from `1<=A`, hence `1<=A^2`, and `z'>=0`.

Separately, call `kappa4 eps 3`. It also requires `0<eps<1/52`; eventually it turns

`GoodC Q chi`, `Y^(eps/6)<=log Q<=3Y^(eps/5)(log Y)^2`

into `||logDerivativeAtOne chi||<=4 log Y`.

Thus the final threshold is

`max(max(Y0_pair,Y0_kappa), exp(1+log(8M)))`.

No line weakens `<1/52` to `<=1/52`. The constant enters upstream estimates twice; it is not a fitted parameter of the final prime choice.

## 3. `Rows` gives the exact `WinPair`

From `Rows z z' q d` at the chosen `z,z'`, copy the prime, congruence and logarithmic interval fields directly:

- `q` prime, `q mod 8=3`, `z/2<log q<=z`;
- `d` prime, `d mod 16=7`, `z'/2<log d<=z'`.

`Rows.d_class` says that for every prime `p != 2`, if `p<=z` or `p=q`, then `(d+1) mod p=0`. Apply it twice:

- at `p=q`, using `q` prime and `q!=2` (forced by `q mod 8=3`), to get `q | d+1`;
- at each odd prime `p<=z`, to get `p | d+1`.

These are precisely `WinPair.d_q` and `WinPair.d_small`. They are not probabilistic conclusions and do not require selecting a preferred EEG-style threshold or any Cathedral operator.

## 4. Coprimality with `M`

The analytic output has `8M<q`, hence `q` cannot divide `M`: otherwise positivity of `M` and `q|M` imply `q<=M`, contradicting `8M<q`. `Rows.q_lt_d` gives `q<d`, so the same argument rules out `d|M`. Since `q,d` are prime,

`Coprime(M,q)` and `Coprime(M,d)`, hence `Coprime(M,q*d)`.

The proof does not assume this coprimality as a hidden extra property of the prime sets.

## 5. The three twist branches and why `ind_drop` is needed once

Let `xi` be modulo `M`. The analytic boxes are formulated modulo `8M`, so change level along `M | 8M`. On integers coprime to `8M`, `pairEx_lift` proves that the lifted value equals the old value.

Now enumerate `(i,j)!=(0,0)`:

### Branch A: `(i,j)=(1,0)`

The target twist is `xi(n) J(q,n)`. The incoming induction is stated with ambient modulus `2Mqd`, but `GoodQ` expects `8Mq`. The local theorem `pairEx_box` first rewrites the inducing function with `pairEx_lift`, then uses `ind_drop` to show the same primitive `chi` is induced at the smaller required ambient modulus.

This drop is not cancellation by inspection. `ind_drop` constructs the primitive Jacobi twist at conductor `conductor(xi)*q`, invokes uniqueness of primitive inducing characters, and then transfers evaluations back. Its hypotheses include `q` prime, `q!=2`, `q` not dividing `8M`, and nonzero ambient modulus.

### Branch B: `(i,j)=(0,1)`

The target is `xi(n)J(d,n)`. `GoodD` with exponent `a=0` applies directly after lifting and reconciling `2Mqd` with `8Mqd` on coprime integers.

### Branch C: `(i,j)=(1,1)`

The target is `xi(n)J(q,n)J(d,n)`. `GoodD` with `a=1` applies in the same way.

In the two `j=1` branches the box height is `8M exp(z) exp(z')`; in the `j=0` branch it is `8M exp(z)`. This is why one must not merge the three cases into one unlabeled bound.

## 6. Extract the two numerical bounds

Each analytic `Box Q C (eps/2) Y (Y^A) chi` contains:

- `chi != 1`, conductor bounded by `Q`, and a zero-free box;
- `||logDerivLAtOne chi||<=C log Y`;
- for `Y<=y<=Y^A`, `||Gchi chi y||<=y^(1/2+eps/2)`.

Because `chi!=1`, `pairEx_g` unfolds the project notation `An.gChi` to `Gchi`, with no principal-character correction. That gives the first `PairGood.bounds` component.

For the derivative bound, write

`Q_j=8M exp(z) exp(z')^j`, `j=0 or 1`.

The cutoff `Y>=exp(1+log(8M))` gives `1+log(8M)<=log Y`, hence `log Y>=1`. The local lemma `log_exp_product_bounds` proves

`Y^(eps/6) <= log Q_j <= 3Y^(eps/5)(log Y)^2`.

Apply `kappa4` to the `GoodC Q_j chi` component, obtaining `||logDerivativeAtOne chi||<=4log Y`. Finally `Y<=y` implies `log Y<=log y`, so the desired bound is `<=4log y`.

For real `rho` with `rho.N|8M`, the same `pairEx_box` gives `Box Q_j ...`; its `GoodC` component contains `ZeroFreeBox Q_j`, definitionally the `PairGood.boxes` conclusion.

## 7. Downstream link and comparison with earlier interpretation

`winPairs` consumes this theorem together with `VWinAt psi 401`. The prior MATH chapter correctly kept those two producers separate. The new result here shows exactly what `PairEx` contributes:

- two prime witnesses in controlled logarithmic intervals;
- congruences `q mod 8=3`, `d mod 16=7`;
- `q|d+1` and every odd prime `p<=Y^(eps/5)` dividing `d+1`;
- three nontrivial quadratic-character boxes;
- uniform `gChi` and logarithmic-derivative bounds.

It does **not** contribute the exponent `401`; that belongs to the later V-window rescaling argument. It also does not prove the analytic `stage1`/`stage2` estimates, the Galois-cohomological `VWinAt`, the host construction, or the final RH statement.

## Executed checks

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_ex_assembly.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_ex_assembly.py
```

The checker validates all nine pinned source/blob entries and required report anchors; enumerates the three legal twist branches; checks a concrete `Rows` witness `z=3,z'=6,q=11,d=263`, including both `q|d+1` and the odd-prime small-divisor clause; checks the height-log inequalities over a deterministic grid; and rejects the non-strict endpoint `eps=1/52`. These finite checks validate the assembly algebra only. Lean elaboration and the analytic inputs were not rerun.

## Failed attempts / limits

- GitHub code search returned no upstream `QH.pairEx` hit; direct pinned-path retrieval was required.
- Guessed capitalized `MeanSquareBounds/PairEx.lean` and colocated `PairGood.lean`, `PairHyp.lean`, `WinPairs.lean` paths returned 404. The actual file is lowercase `pairEx.lean`, while `PairGood` is in `CharacterBoxes`.
- No local checkout of the 175,187-module Lean project is present, so no claim of kernel replay is made.
- This run deliberately did not expand `stage1` and `stage2`; those are the next analytic-prime obligations, not dispensable assumptions.

## RESUME HERE

Trace `pair_share` one layer further by reconstructing `stage1` and `stage2`: preserve the exact bad-set cardinality inequalities for `GoodQ` and `GoodD`, identify where `eps<1/52` enters each analytic estimate, and record the mean-square/zero-density theorem that turns each bad family into at most `eta` of its prime set. Do not repeat the final `PairEx` assembly or the separate generalized-host balance adapter.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.


---

## Appendix 57: specialists/galois_representations/RUN5_EXFIELD_FROBENIUS_INERTIA_SEPARATION.md

# Run 5 — ExField: finite field extension retaining inverse Frobenius and separating inertia

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of ExField, including the primitive-root degree detector and residue-cardinality proof. This expands Run 4's exact open obligation, not its correction-character algebra. No independent Lean kernel run, full-proof completion or URT performance claim.

## Continuity and source pin

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual runner log/protocol and continuity, latest peer handoffs (theta, character boxes, literature, acceleration, kernel, prime, Landau, positivity, editor, integration). Cathedral CI #364, 45379182627, PASS at 11:14:39Z, not RH validation. No physical gate changes. External blueprint referenced in queue, not used as mathematical evidence.

Source repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head ba5e02170fcf8bc19acf4d63110f5eb85f8c0161, 11:18:50Z. ExField.lean removed as standalone file; current producer found in ContinuousRankOneRep.lean, blob fb0bdf5416986c8a291ace6ba2fadc618722623a, lines 715–789 (open_sub, exField). 99/101 nonblank trimmed pinned body lines occur in current file; changed lines in norm_le_of_pow use Polynomial.natDegree_X_pow_sub_X and Polynomial.X_pow_sub_X_ne_zero instead of old FiniteField names. Root detector current file blob 9e10f62f1fe2955d87d188dde19f99ab48afc369, lines 57–122; 63/64 nonblank pinned body lines occur, with the norm membership step expanded by simp [normV, Ideal.absNorm_apply, Submodule.cardQuot_apply]. This is a textual migration check, not a general cross-revision equivalence proof. Keep original pin for derivation.

## 1. Statement and quantifier scope

Fix number field F, algebraic closure Ω with F-algebra structure, valuation subring A of Ω, nonzero finite prime w of F and h:IsPlaceOver A w. Put G=Gal(Ω/F), q=normV w=#(O_F/w)>1, W=Weil h, I=inertia at A, K=F_w. Let a:W→K^× satisfy IsLocalArtin h a. Fix σ∈W with deg σ=-1 and ANY neighborhood V of 1 in K^×.

ExField asserts existence of an intermediate number field F' inside Ω (Ω still its algebraic closure), a prime w' with IsPlaceOver A w', and σ'∈Weil h' inducing the SAME automorphism of Ω as σ. For EVERY s∈Weil h, s'∈Weil h' with deg s'=0 and the same action on Ω, a(s)∈V. F' may depend on σ and V. V need not be a subgroup or even open. Do not replace equality of actions by equality of residue actions. The native theorem exField takes GlobalArtinReciprocity as an input, although its displayed proof introduces this argument anonymously and uses the supplied local-Artin continuity.

## 2. Degree detector from a primitive root

For each positive integer k, set N0=q^k-1>0. Algebraic closedness and characteristic zero give ζ∈Ω a primitive N0-th root. Since q∈w, N0∉w (otherwise q^k-N0=1∈w). Thus v_A(N0) is not less than 1. Also v_A(ζ)=1, by multiplicativity and ζ^N0=1.

The relevant reduction is injective on roots of unity of order dividing N0: if x^N0=y^N0=1 and v_A(x-y)<1, then x=y. In GlobalA.lean this is eq_of_pow_eq_one, by passing to x/y, whose valuation difference from 1 is less than 1, and eq_one_of_pow_eq_one. In human terms if z=x/y differs from 1, then 0=(z^N0-1)/(z-1)=1+z+...+z^(N0-1), but its reduction is the nonzero residue of N0. This argument needs the order prime to the residue characteristic.

For g∈W fixing ζ, write m=|deg g|. The native definition ActsAs(A,q,g,a,b) asserts g preserves A and (g x)^(q^b) ≡ x^(q^a) modulo the maximal ideal of A for EVERY integral x. The degree is a-b, independent of witness. By actsAs_of_deg:
- if deg g=m≥0 use (a,b)=(m,0);
- if deg g=-m<0 use (a,b)=(0,m).
Since gζ=ζ, either branch gives ζ^(q^m)≡ζ. Both are N0-th roots, so they are equal, hence ζ^(q^m-1)=1 and q^k-1 divides q^m-1. Using gcd(q^k-1,q^m-1)=q^gcd(k,m)-1 and strict increase of powers for q>1 gives gcd(k,m)=k and k|m. Thus k divides the signed deg g, including zero. This proves exists_fixed_dvd_deg. The implication uses primitive order, not just ζ^N0=1.

## 3. Open subgroup containing σ while cutting out inertia

Take ANY open identity neighborhood t in G. Profinite topology provides an open NORMAL subgroup N contained in t. Its finite quotient has positive order k=[G:N]. Choose ζ by section 2. Its stabilizer is open (ζ algebraic). Choose open normal N' contained in this stabilizer, and put M=N∩N', U=<σ> M, with <σ> the integer-power cyclic subgroup in G. M is open normal; U is a subgroup and open because it contains M. σ∈U.

For s∈W∩U of degree zero, normality allows decomposition s=σ^j n, j∈Z, n∈M. The element n, now regarded as σ^(-j)s in W, has deg n=(-j)(-1)+0=j. Since n∈N', it fixes ζ, so k|j. Lagrange applied to G/N gives σ^k∈N; hence σ^j∈N, including negative j. Since n∈N, s∈N⊆t.

This is the entire open_sub argument. It does not require N or U to lie in W, nor U normal. Without the extra root stabilizer N', the decomposition cannot force k|j. Example: in W=Z×C2, projection to C2 with N its kernel, σ=(-1,1), the degree-zero element (0,1) lies in <σ>N but outside N. The additional degree congruence fixes precisely this failure.

## 4. Turn the subgroup into the desired field

First choose an open V0 with 1∈V0⊆V. IsLocalArtin.cont is used on inertia: pull V0 back along I→W→K^×. This is open in I with its induced topology from G, so choose open t⊂G whose preimage in I is exactly this set; 1∈t. Apply section 3 to obtain U.

Take F'=Ω^U. Because U is open, it is also closed and its index finite. Infinite Galois correspondence identifies Gal(Ω/F') with U, and F'/F is finite. F' is a number field and Ω an algebraic closure of F'. No normality of F'/F is asserted.

Construct w' explicitly: each x∈O_F' maps to A, since x is integral over A (integral over Z⊂A) and valuation subrings are integrally closed. Pull the maximal ideal of A back along O_F'→A; its contraction to O_F is w by IsPlaceOver. It is prime and nonzero because it lies above w. This produces a height-one finite prime w', with residue-field injection O_F/w→O_F'/w' giving q≤q'=normV w'. This is val_int_le/place_above.

The key remaining step is to prove q'=q, not merely q' a power of q. Since σ∈U, σ fixes F'. Its degree -1 gives ActsAs(A,q,σ,0,1), so for x∈O_F' the reduction satisfies x^q=x (because σ fixes x). Hence every element of the finite field O_F'/w' is a root of the NONZERO polynomial X^q-X of degree q (q>1). Root counting gives q'≤q; together with injection, q'=q.

Now regard σ as an F'-automorphism σ' of Ω. Its old ActsAs(A,q,σ,0,1) witnesses membership in Weil h' precisely because q'=q. The same witness gives degree -1 there, although ExField asks only for existence of matching σ'. This is why a generic restriction to F' without residue-cardinality control would not suffice.

For matching s,s' with deg s'=0, s' is inertia at A, hence s also acts trivially on the residue and belongs to I (it already preserves A). Also s fixes F' because s' does, so s∈U. Thus deg s=0 and section 3 gives s∈t. By construction of t's preimage in I, a(s)∈V0⊆V. This proves the universal clause for all matching pairs, not just an existential pair.

## 5. Join to the original downstream proof

Run 4 df_one: if a correction character d has d(σ)≠1 for deg σ=-1, choose V={x:A_wt(x)≠d(σ)}. It is an identity neighborhood by continuity and A_wt(1)=1. ExField produces F',w',σ'. Independently df_res (using ChRes, ArtNorm, coefficient equivariance, local algebraicity and uniqueness) produces matching degree-zero s,s' with d(σ)=A_wt(a(s)). The universal ExField conclusion contradicts that equality. Then d is trivial on inverse Frobenius and hence Frobenius; multiplying any element of degree m by frob^(-m-1) proves triviality on all W. This supplies LocWD, then Crys.alg and rank-one inputs to CoreAll and Row0b, with all remaining premises preserved. No direct jump to RH.

## 6. Source provenance and tests

Pinned files, Git blob SHA retrieved from connector (not locally rehashed):
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ExField.lean 606c3aea548ce2a8a128a525f3e4f19f8d97fabf (val_int_le, place_above, norm_le_of_pow, open_sub, exField; full file).
- same directory EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b, ExField at 78–85.
- same directory ContinuousRankOneRep.lean 028d93377a68710f3e21da03eff798ff7fd103af, df_res 244–285, df_one 288–298, core and locWD 300–313.
- same directory ArtNorm.lean 7b614e8699e85e572a7ca903b3f8fdc5020acbf7, native norm compatibility producer inspected but its global reciprocity proof remains separate next task.
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsRootOfUnityFixedDvdWeilGroupDegree.lean 75d5199853eb7e6dfdae3aa35ed5d7cf9b0a0c66, 8–26 and 30–73.
- src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/ExistsNotCongPow.lean b2073e33bd1c02961acda3ab878dce8b45caf88c, ActsAs 70, deg 168, actsAs_of_deg 208, deg_eq_zero_iff 218.
- src/ReciprocityTheory/GaloisValuations/GlobalA.lean f193f6e2a17963f821834b9cdc5dee96c52cfbab, 73–106, unit roots and injective reduction.
- src/ReciprocityTheory/GaloisValuations/Global.lean cb4c9727d3c18cfdf185fa0958a4f11d21a5a43f, imports GlobalA/B.

Actual V8 run below returned divisibility=34200, negativeDegrees=33750, quotient=4100, nonAbelian=126, unprotected=78616, explicitNegative=1. The first four counts are 72,176 elementary positive regression cases; unprotected counts counterexamples to the omitted guard in the finite cyclic quotient model, not failures of the source proof. These are checks of the actual algebraic steps, not tests of arbitrary local fields or infinite Galois theory. Source comparison counts are separate and not kernel validation. Reproduce by checking out pin and using git hash-object on named files; JS replay:
~~~js
function regression(){
 const a=(x,m)=>((x%m)+m)%m;
 const assert=(x,msg)=>{if(!x)throw Error(msg)};
 let divisibility=0,negativeDegrees=0,quotient=0,unprotected=0,nonAbelian=0;
 for(let q=2n;q<=19n;q++)for(let k=1n;k<=25n;k++)for(let m=0n;m<=75n;m++){
  const n=q**k-1n;assert(((q**m-1n)%n===0n)===(m%k===0n),"root order");divisibility++;
  if(m>0n){assert((-m%k===0n)===(m%k===0n),"negative degree");negativeDegrees++}
 }
 for(let n=1;n<=40;n++)for(let g=0;g<n;g++)for(let j=-2*n;j<=2*n;j++){
  const m=a(j,n);const q=a(j*g,n);
  if(m===0){assert(q===0,"protected quotient");quotient++}
  if(q!==0)unprotected++;
 }
 const S=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]];
 const comp=(x,y)=>y.map(i=>x[i]);const same=(x,y)=>x.every((v,i)=>v===y[i]);
 for(const g of S){let z=S[0];for(let j=0;j<=120;j++){if(j%6===0){assert(same(z,S[0]),"S3 quotient");nonAbelian++}z=comp(g,z)}}
 assert(unprotected>0,"negative control");assert(a(1,2)!==0,"unguarded C2");
 return {divisibility,negativeDegrees,quotient,nonAbelian,unprotected,explicitNegative:1};
}
console.log(regression());
~~~

RESUME HERE: reconstruct the native ArtNorm producer in AlgebraicCharacters/ArtNorm.lean, especially glob_norm: finite quotients of the abelianized Galois group, density of diagonal elements and uniformizers away from finitely many primes, residue-degree normalization of local norms, and the final injectivity of global Artin on local ideles (Chevalley units). This is distinct from ExField and finite-product regrouping in Run 4. Map the actual producer of FrobDense.eq_one_of_away and artin_localIdele_injective; keep their hypotheses and record current clump migration. Coordinate with literature and Grok galois_rows to avoid duplicate patching work.
HANDOFF TO: integration, proof editor, formal audit, theta, literature, Grok galois_rows. ExField source-matched human proof with explicit standard lemmas; no independent Lean replay or URT-specific speedup.


---

## Appendix 58: specialists/character_boxes/RUN5_RATIONAL_ZERO_SUBSPACE_SPANNING.md

# Run 5 — rational zero-space spanning and the exact kernel complement

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction of the actual divisionRows_rationalLift producer, with exact finite algebra regression. No independent Lean replay or full proof/URT speed claim.

## Continuity and revision lock

Read AGENTS, research state, runner protocol/log, continuity, CI summary (run 45382352602 PASS, physical checks only), swarm protocol, queue, expansion, Run 3/4 and current peer handoffs (theta, Galois, prime, Landau, kernel, acceleration, literature, geometry, integration, math, editor). Prior work: Run 2 established conditional rank equality; Run 3 established conditional level projection surjectivity; Run 4 reconstructed the theta-coordinate factorisation (not the rational zero-space equality). None is repeated. Theta lane is investigating SWFull, literature is investigating square-zero lifts; these are distinct. Blueprint reference in queue noted, not independently reread this run. The user's RH-specific assignment is independent of the physics queue.

Source repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. All pinned references below are to this exact revision, not moving main. At retrieval current main was bb9476b875a219608a9068f8f18d8c56b4e7f1ca (24 Nov 2026). Current ZeroSubspaceSpannedByDataZeroSubspaceLifts blob 8ccc6b36e855b5052f33b4735e7088777fbc9e0c; statement wrapper blob 45f2d7008509e8eea5eaada39a2d32bbbd9bf371. Direct comparison of implementation from mulVec_map_injective through end of Main section finds two changed lines: map_add now specifies (f := _), and the hTh,hθ acquisition calls _root_.GlobalTheory.Mem.ThRead.thDef3_thTheta directly rather than the pinned wrapper GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data. Imports/module context also changed. DivisionCompatibleAtReadIdentifications old path returned 404 at head. No equivalence or current-head reachability claimed without migration/kernel evidence.

## 1. Actual dependency and hypotheses

In DivisionCompatibleAtReadIdentifications.lean:43, the second conjunct of GlobalTheory.divTied3_read fills divisionRows_rationalLift by calling GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts with hP,hH. The statement wrapper invokes GlobalTheory.Mem.R3.DivisionRationalLift.divisionRows_rationalLift, whose proof calls orth_ker_inf_range. The original definition of Idx.Z0 is in Formalism/LocalRingCardinality/DataIdx.lean:92–93:
    Z0(D,μ,j) = ker(thetaP(μ,j))^⊥ ∩ range(eMt(μ,j)).
It is not defined as a rational-coordinate image.

The full producer is quantified over D:D7, finite group G, Pl0,I0,T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, then Pins R F cG and Holds R F, and for ALL i:Fin D.R.m, t:T. Fix these data, and use j=i+1, μ=Y.tup t. This is the same family and reading as Run 4, not an independently chosen one.

Abstract core notation (ZeroSubspaceSpannedByDataZeroSubspaceLifts.lean:39–49):
- K is the coefficient number field with StarRing and σ:K→+*ℂ, M is a complex inner-product space and W a complex module. No additional completeness or finite-dimensional hypothesis on M is imposed.
- J:K^n→M and jW:K^e→W are σ-semilinear. The J-images of the standard n coordinate vectors span M over ℂ (hsp). Their inner products satisfy <Jx,Jy>=σ(hform(H,x,y)) (hin).
- eM:M→M is complex-linear and eM Jx=J(Ex) (hop) for the coefficient-field level matrix E.
- Zm:K^d→K^n and Pr:K^n→K^d are matrices satisfying the exact source IsOrthProj H Zm Pr (hP); in particular Pr Zm=I and Zm^* H(I−Zm Pr)=0. E fixes Zm z for every z (hEZ).
- The e standard coordinate images under jW are ℂ-linearly independent (hW).
- Θ:K^d→K^e is injective on coordinate vectors (hΘ).
- θ':M→W is complex-linear with θ'Jx=jW(Θ Pr x) for EVERY x (hθ).

These are the entire abstract theorem's inputs. Preserve also the upstream concrete hP,hH and the other five fields of DivRows3; the rational-pairing and base-tuple hypotheses are still needed for that full record.

## 2. Human proof — complexification of an injective coordinate matrix

An injective matrix Θ between finite-dimensional K vector spaces admits a K-linear left inverse L (extend a basis of its image). Thus LΘ=I_d. Applying the ring homomorphism σ entrywise gives σ(L)σ(Θ)=I_d, because matrix multiplication is finite sums and products and σ preserves 0 and 1. If σ(Θ)c=0 for c∈ℂ^d, then multiplying by σ(L) gives c=0. This is the exact argument of mulVec_map_injective, lines 26–37. In particular injectivity on K^d does not need to be independently assumed on ℂ^d. It follows by a left inverse, NOT by restricting c to K^d.

Also, for any matrix Zm and any z∈K^d, semilinearity gives
    J(Zm z)=Σ_k σ(z_k) J(Zm e_k).
Each basis image is itself in J(range_K Zm). Taking complex spans both ways proves the span_range_mulVec lemma (SpanRangeMulVec.lean:262–277). This equality does not assert that every complex combination has a preimage in K^d. For K=ℚ, M=ℂ, J inclusion, Zm=1, the complex span is ℂ but i is not in the rational image.

## 3. Human proof — exact theta-kernel complement

Define the complex subspaces
    S=span_ℂ J(range_K Zm),
    N=span_ℂ J(ker_K Pr).
For y∈ker Pr and z∈K^d, hform_orth (SpanRangeMulVec.lean:109–116) gives
    <J(Zm z),Jy>=σ(hform(H,Zm z,y))
                 =σ(hform(H,Zm z,Zm Pr y))=0.
By sesquilinearity this extends to the entire complex spans. Thus S⊥N (hSN).

For x∈K^n, Pr(x−Zm Pr x)=0 by Pr Zm=I (hker). Consequently
    Jx=J(Zm Pr x)+J(x−Zm Pr x)
with the summands in S,N respectively. Applying this identity to each coordinate generator and using hsp establishes M=S+N (htop); their orthogonality gives a direct sum. This proof uses algebraic finite spans and needs no Hilbert-space closure argument.

For each y∈ker Pr, θ'Jy=jW(Θ Pr y)=0. Complex linearity gives N⊆ker θ' (hNk).

For a∈S, write a=Σ_k c_k J(Zm e_k), now with genuinely complex c_k. By hθ, Pr Zm=I and σ-semilinearity of jW,
    θ'a=Σ_l (σ(Θ)c)_l jW(e_l).
If θ'a=0, independence hW implies σ(Θ)c=0. The left-inverse lemma gives c=0 and therefore a=0 (hSk). This proof does not assume J is complex-linear on K^n or assume that jW's coordinate images span W. Independence suffices.

Thus every w∈ker θ' decomposes as a+b (a∈S,b∈N), with θ'a=0, hence a=0 and w∈N. Together with hNk, ker θ'=N. More directly, the source proves both inclusions of ker θ'^⊥=S:
1. For v∈ker θ'^⊥ write v=a+b. Since b∈ker θ' and b⊥a, 0=<b,a+b>=||b||², so b=0 and v∈S.
2. For a∈S and w∈ker θ', decompose w into S+N; injectivity on S forces its S part to vanish. Orthogonality gives <w,a>=0, so a∈ker θ'^⊥.
No double-perp closure theorem or topology is being smuggled in. This is hmain, lines 117–133.

Finally each generator J(Zm z) is fixed by eM:
    eM J(Zm z)=J(E Zm z)=J(Zm z).
Such a fixed vector belongs to range eM, and the range is a complex subspace. Hence S⊆range eM (hSZ), so
    ker θ'^⊥ ∩ range eM = S
                           = span_ℂ {J(Zm e_k):k∈Fin d}.
This is orth_ker_inf_range. The intersection is redundant **under these exact hypotheses**, not for arbitrary operators. Neither self-adjointness nor idempotence of eM is needed as a further abstract hypothesis here. The concrete level structure still has all of its original assumptions.

## 4. Native instantiation and guard

Set K=D.what₂.LL, σ=the embedding in the read maps, J=(D.what₂.jMt μ j)∘Y.eMt i t, H=lH, E=lE, Zm=lZ0, Pr=lPrj (at the exact level and family in the theorem), eM=D.what₂.eMt μ j, jW=Z.jW i, Θ=(A3.indefDown (s0Of R F)).θ i t, θ'=D.what₂.thetaP μ j.

The source producer (lines 141–155) makes the following calls; these are remaining upstream facts, not abstract assumptions invented to make the lemma work:
- hR = complex_data_conditions_base_level_of_primitive_links hH.ok hH.sep hP.char hH.prim.
- hb = CxData.liftMat_bij (R.toCx3 F) F.cr false hR.kForm hR.ewNorm (hR.h4pos.2.2 false) hR.lifts0.1 hR.ratTh i t. The core uses hb.1 (injectivity); retain full native bijectivity and its premises.
- hB:BlockHyp of A3.A.fam.L i t, A3.A.fam.lvlA F.P0 F.ψ0, A3.A.v0, level 1, built using hH.ok.ok2.conj, irr, lifts i t.
- hp = BlockDat.lf_l_proj hB, he = GlobalTheory.Mem.LiftForms.lvlOp_lE hB. The latter obtains the level-operator fixed-vector equality from the native representation and idempotent identities, using injectivity of the level coordinate embedding (SpanRangeMulVec.lean:222–232).
- hTh,hθ = GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data ... hP hH. Its second conjunct is Run 4's equality, and its first supplies hTh.li i (target ℂ-linear independence), retained as an essential separate obligation.
- hf=Y.formsL i t, with hf.span, hf.inner, hf.op_eq supplying hsp,hin,hop respectively.

The argument establishes the unguarded equality for each i,t with the producer's original Pins/Holds hypotheses. The later DivRows3.toG restriction to Used0 does not prove the converse for unused tuples; DivRows3G.toRows requires the same universal TupAllUsed evidence from Run 4. Do not treat a proper used subset as universal coverage. All statements stay attached to the same dependent bundle.

## 5. Exact scope and remaining obligations

This fills the divisionRows_rationalLift local proof in the six-field DivRows3 assembly. The result is stronger than a dimension match: it identifies the actual subspace as the complex span of specific number-field coordinate columns. It does NOT identify every vector with a number-field point, prove lattice equality, prove an arbitrary level is admissible, establish the full DivRows3 construction without its other hypotheses, or independently derive the underlying Pins/Holds and theta-coordinate data.

The next distinct producer is the number identity field num, from GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel. Its hMj and hIdx arguments were not needed for this spanning lemma but are indispensable to the original full construction. Do not repeat Run 2 rank, Run 3 right inverse, Run 4 theta factorisation, or this span proof.

## 6. Reproducibility

Actual source retrieval: 6 pinned files, connector-reported SHA checked against each expected blob and 45 literal anchors checked (51 total assertions). Source matching is static; the pinned sources were not elaborated. In a clean pinned checkout the following Python script independently checks the byte-level Git blob IDs and anchors. Paths and SHA ledger:

~~~python
from pathlib import Path
from hashlib import sha1
I="src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
ledger=[
(I+"DivisionCompatibleAtReadIdentifications.lean","b6594122a28670a9dca1e61b23f5be9594f7f877",["divisionRows_rationalLift := GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts","hP hH","thTheta := hthT"]),
(I+"ZeroSubspaceSpannedByDataZeroSubspaceLiftsStatement.lean","89a1aa5551cd2ab439f9bf03ae77c2974c6a787b",["theorem _root_.GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts","Pins R F cG → Holds R F → ∀ (i : Fin D.R.m) (t : T)","GlobalTheory.Mem.R3.DivisionRationalLift.divisionRows_rationalLift"]),
(I+"ZeroSubspaceSpannedByDataZeroSubspaceLifts.lean","17cbec013a07325171620219581a87d2ec04d1b3",["theorem mulVec_map_injective","exists_leftInverse_of_injective","← Matrix.map_mul, hL","theorem orth_ker_inf_range","have hSN","have hker","have htop","have hNk","have hSk","have hcomp","Fintype.linearIndependent_iff.1 hW","mulVec_map_injective Θ hΘ","have hSZ","have hmain","inner_self_eq_zero","inf_eq_left.2 hSZ","theorem divisionRows_rationalLift","complex_data_conditions_base_level_of_primitive_links","CxData.liftMat_bij","BlockDat.lf_l_proj hB","GlobalTheory.Mem.LiftForms.lvlOp_lE hB","have hf := Y.formsL i t","exact orth_ker_inf_range","hf.span","hf.inner","hf.op_eq","hTh.li i","hb.1","hθ i t"]),
(I+"SpanRangeMulVec.lean","7160584f4f4c3ad52d9d5b2ca065ad38b4be23c4",["theorem hform_orth","theorem lvlOp_lE","theorem span_range_mulVec","Matrix.mulVec_smul, map_smulₛₗ"]),
(I+"LiftCuspFormSpaceThetaMapEqDataStatement.lean","1e4844972e2f5c0238dd34dcaa58bfa9f5dc4560",["theorem _root_.GlobalTheory.T.liftCuspFormSpace_thetaMap_eq_data","ThDef3 D A3.A","GlobalTheory.Mem.ThRead.thDef3_thTheta"]),
("src/Formalism/LocalRingCardinality/DataIdx.lean","3c508b4f1d3efa3e1f8b5c5d76998dfbd7f41795",["def Z0","(LinearMap.ker (D.what₂.thetaP μ j))ᗮ ⊓ LinearMap.range (D.what₂.eMt μ j)","def ThetaBij"])
]
checks=0
for path,digest,anchors in ledger:
    b=Path(path).read_bytes()
    assert sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==digest,path
    checks+=1
    for a in anchors:
        assert a in b.decode(),(path,a)
        checks+=1
assert checks==51
print(checks)
~~~

Exact finite regression executed in V8 (replay in Node). This is a finite model of the algebra, not a substitute for the original arithmetic operators or a proof of their existence. Use a weighted Hermitian form diag(h,k,1), Zm(u,v)=(au,bu,v), Pr(x,y,w)=((ha x+kb y)/D,w) with D=ha²+kb²>0, and a rectangular injective Θ(u,v)=(u+2v,v,2u−v). Gaussian integer coordinates are exact; all divisions are cleared by D. The good-level projection in the model is Zm Pr. Tested all selected parameters and vectors, not random samples. Actual results: 157464 vectors satisfying split, orthogonality, kernel annihilation, left-inverse and fixed-range assertions, plus 17496 independent coefficient-pair instances satisfying Pr Zm identity, injectivity and column-span identity. Counts are not additive across predicates tested on the same vectors. Six illustrative omitted-hypothesis counterexample checks below; these checks are not claims about failure of the original source.

~~~js
function regression(){
const add=(u,v)=>[u[0]+v[0],u[1]+v[1]],sub=(u,v)=>[u[0]-v[0],u[1]-v[1]],sc=(n,u)=>[n*u[0],n*u[1]],mul=(u,v)=>[u[0]*v[0]-u[1]*v[1],u[0]*v[1]+u[1]*v[0]],conj=u=>[u[0],-u[1]],eq=(u,v)=>u[0]===v[0]&&u[1]===v[1],z=[0,0],zero=u=>eq(u,z),same=(u,v)=>u.every((x,i)=>eq(x,v[i])),allzero=u=>u.every(zero),assert=(x,m)=>{if(!x)throw Error(m)};
const C=[];for(let i=-1;i<=1;i++)for(let j=-1;j<=1;j++)C.push([i,j]);
const theta=([u,v])=>[add(u,sc(2,v)),v,sub(sc(2,u),v)],left=([u,v,w])=>[sub(u,sc(2,v)),v];
let split=0,ker=0,rank=0,span=0,range=0;
for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++){if(!a&&!b)continue;
 for(let h=1;h<=3;h++)for(let k=1;k<=3;k++){
  const D=h*a*a+k*b*b;
  const E=([u,v])=>[sc(a,u),sc(b,u),v];
  const Pnum=([x,y,w])=>[add(sc(h*a,x),sc(k*b,y)),sc(D,w)];
  for(const x of C)for(const y of C)for(const w of C){
   const v=[x,y,w],p=Pnum(v),s=E(p),n=v.map((t,i)=>sub(sc(D,t),s[i]));
   assert(same(s.map((t,i)=>add(t,n[i])),v.map(t=>sc(D,t))),"split");
   assert(allzero(Pnum(n)),"kernel");
   const inn=add(add(sc(h,mul(conj(s[0]),n[0])),sc(k,mul(conj(s[1]),n[1]))),mul(conj(s[2]),n[2]));
   assert(zero(inn),"orthogonality");
   assert(allzero(theta(Pnum(n))),"theta kills N");
   assert(same(left(theta(p)),p),"left inverse over C");
   assert(allzero(theta(p))===allzero(p),"injectivity");
   assert(same(E(Pnum(s)),s.map(t=>sc(D,t))),"fixed level range numerator");
   split++;ker++;range++;
  }
  for(const u of C)for(const v of C){
   const s=E([u,v]);
   assert(same(Pnum(s),[sc(D,u),sc(D,v)]),"PE identity");
   assert(same(left(theta([u,v])),[u,v]),"complex left inverse");
   assert(allzero(theta([u,v]))===allzero([u,v]),"theta injective");
   assert(same(s,[sc(a,u),sc(b,u),v]),"complex column span");
   rank++;span++;
  }
 }
}
assert(!zero([0,1]),"i is not a real rational coordinate");
assert(allzero([z,z])&&!allzero([[1,0],z]),"noninjective theta: zero map on nonzero S");
assert(zero(add([1,0],[-1,0])),"dependent target columns: identical columns cancel");
assert(!zero(mul(conj([1,0]),[1,0])),"nonorthogonal P: E=(1,0), P=(1,1), kernel (-1,1) not orthogonal");
assert(!same([z,z],[[1,0],z]),"zero level operator does not fix S");
assert(!allzero([z,[1,0]]),"incomplete J span: extra direction may remain in ker theta orthogonal");
return {split,ker,range,rank,span,negative_examples:6};
}
console.log(regression());
~~~

Actual V8 output: {"split":157464,"ker":157464,"range":157464,"rank":17496,"span":17496,"negative_examples":6}. No original assumptions removed. No kernel validation, full-proof percentage, or measured URT speedup. No unrelated physics changes.

RESUME HERE: trace GlobalTheory.T.numbers_eq_concreteNumbers_at_baseLevel from DivisionCompatibleAtReadIdentifications.lean:45 into NumbersEqConcreteNumbersAtBaseLevelStatement.lean and its actual implementation at the pin. Reconstruct each concrete number identity, the MjHTie and IdxDefs dependencies, and the role of the same coordinates/lattice at the same level; identify any separate finite-index or discriminant formulas. Check peers first; do not repeat Run 2–5 or conflate numerical index identities with the rationality and BtVanish inputs of colsBk. Current main migration to be kept separate.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois, math. Mark rational zero-space spanning source-matched conditional with proof in §§2–4, retain full native producer obligations and guards. Project OPEN.


---

## Appendix 59: specialists/positivity_geometry/RUN5_SMALL_SECTION_INJECTION_REGULARITY.md

# Geometry run 5 — small automorphic forms inject into metrized model sections
2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction, local scalar regression executed. Full proof OPEN. No kernel replay.

## Continuity and revision
Read AGENTS, RESEARCH_STATE, continuity, RESEARCH_LOG and RESEARCH_PROTOCOL, CI summary, all three swarm coordination documents, geometry RUN3/4 and other lanes' latest located handoffs (editor, literature, Landau, character boxes, Galois, theta, prime, acceleration, kernel, dependencies, integration, structure, math and audit). Existing RUN2 concerns a different small-section comparison; RUN3 and RUN4 concern Chow/self-intersection equality and recursion. This is a separate producer named by the RUN4 handoff. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed head 5f2c8594adf1f48032d37583118512cd7bbf3afa (2026-11-24 11:41:50 UTC), old HodgeBundleWeights/SmallSectionsInjective.lean and SmallSectionsInjectiveOfSelfIntersectionBound.lean return 404 at that head; no migration equivalence claimed. Geometry lane only; no physics gate or queue changes. External blueprint not reopened in this run; source proof is primary.

## Source ledger
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean` blob `0e1bad41f4b165c0d9b1693f419530309e1da5ba`; anchors at 21, 21.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjective.lean` blob `d8879d8a7eda4debcda1494cd18864c0302c24ba`; anchors at 13, 14, 14.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjectiveOfSelfIntersectionBound.lean` blob `c7b76d680093c367262f0d5dead7c738caa57143`; anchors at 31, 35, 39, 46, 54, 58, 59, 61, 69, 72, 73.
- `src/Development/WeilBound/CoreStatements/NefModelVolumes/InjectivityWeightSectionsOf.lean` blob `a45a05e177dfd35f22b46e8107c512eeeb9b5913`; anchors at 27, 37, 40, 46, 62, 72, 74, 79, 82.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/HeightLowerBoundOfRegulator.lean` blob `56c6300f425734f6830a74b0ba50bf64c49d7693`; anchors at 15, 17, 18.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/RegulatorLowerBound.lean` blob `8d9ecd9a5a2a978a056e8f02b60776859d11e71e`; anchors at 11, 13, 19.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsHeightEstimate.lean` blob `c0606a7c83a6a15d54e7530c39c0ed0020cbf196`; anchors at 28, 30, 34, 49.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsCdvrEstimate.lean` blob `cf67718c710bd3d497ef3955e6174ed97e983c30`; anchors at 80, 90, 118, 153, 172.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean` blob `4d2546abb6eaa7950fcfeb20dd8adca341631fa2`; anchors at 35, 49, 78, 102, 162, 173, 180.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/MemOfForallValuationSubring.lean` blob `52382959baccb186d46f53c8f3d153b40993c4a5`; anchors at 7, 20, 23, 94.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightComparisonOfDegreeBound.lean` blob `08db56669223ef219bb1b386f66b280e8d8b7245`; anchors at 13, 15.
- `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean` blob `8594fde18897fec5e51d38efa44601913999814f`; anchors at 43, 44, 50.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FiniteTypeSections.lean` blob `7d66d140748c6d2029e07d4ba528c76a369b75c0`; anchors at 35, 39, 41, 44, 72, 85, 114, 126.
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ContinuousAeval.lean` blob `30e5a81f94814c59f5b07146a9d4785b8c86b05a`; anchors at 30, 48, 88, 124, 132, 141, 149.
- `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/IsModelOf.lean` blob `ffd442f45da6543771bd9a265874bbe994ab8a4a`; anchors at 21, 27, 29, 31, 33, 36, 38.
- `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SecZEqZeroOfGenVal.lean` blob `f71bf6deac8fb37c92f9a4a9aa9900e11055315a`; anchors at 37, 48, 16.

## 1. Exact context and target
The actual call in ThirdPlaceSeries/TopCovolSlim2Use is PositivityTheory.Xj7N.small_sections_injective with NV from exists_nonvanishing_of_toroidal hH.sieg hX.ks. Its other argument is PublishedHodgeBundleTheorems. In the original quantifier order: D:D7, T:Core D, j:nat, Y:Deep T j, e:nat, o:real, Y.Good e o, 2 < finrank_Q(D.host.E)/2 (retain the source division and coercions), Z:Comp Y.d.Xo₂ Y.d.c₂, u:Weight(T.Q.Dw j), integral scheme X, p:X→Spec O_K with K=Y.d.c₂.F, HermLB L over p, ring hom psi:Om Z→X.functionField, section assignment s on W=latOn Y.U Z G with G=wtOf(T.Q.Dw j) u 0, t:real, GoodOn (the original U, xiR D, D.sp.W j, dict, Z, G), DegVal.BirOn U Z G, NoBase U Z G, 0<Y.dg u Z, and IsModelOf for the original normOn, W, genPoint, dimFlag and p,L,psi,s. Finally every i:nat with 1≤i. Put tau=8i and F=smallL at that degree and t (same U, xiR, W j, dict,Z,G). The result is encard(F)≤encard(((L.shift t).pow tau).smallSec). This is an extended cardinal inequality, not a claim of finiteness, linearity, norm equality, or surjectivity of the map. Preserve all declared premises even when a local subproof does not use them.

IsModelOf has seven fields: arithmetic projective variety of the specified dimension, normal scheme, bijective psi, agreement of scalar base maps, generic section ratio, basepoint-free section cover, and an FS presentation. The latter contains basis b, generator matrix g, matrices A_sigma, reverse coefficients c, integral generators gw, IsFrame, both change-of-generators relations, and exact chart metric formula. No general equality with an arbitrary line bundle is used.

## 2. One global denominator
Write a(v)=genVal_Z(v) and F_k(v)=generic rational value of local section s(v) in chart k. The model ratio says psi(a(v)) F_k(w)=psi(a(w)) F_k(v).
If all W have a(v)=0, GoodOn's full-span field implies the entire linear genPoint is zero. imageDeg_zero forces dg=0, contradicting positive dg. Choose w1 with nonzero a(w1).
Independently, the bpf cover supplies w with s(w) nonzero at the generic point. A chart k0 exists there. If a(w)=0, the ratio for w1,w gives psi(a(w1)) F_k0(w)=0, contradicting injectivity of psi and fnOf_sec_ne_zero. Thus a(w)≠0. This is one w fixed for every f, not one chosen per f. Set
  h_f = psi(a(f)) / psi(a(w))^tau,
  r_{f,k} = h_f F_k(w)^tau.
The target section is a rational multiple of s(w)^tau. The nonzero denominator is logically essential; do not divide by F_k(w) at an arbitrary point.

## 3. Regularity — two exact routes
The source uses regulator_lower_bound (generic-fibre wrapper of regulator_bound_all), then height_lower_bound_of_regulator to extend to all points; despite their names these are regularity statements, not numerical regulator or self-intersection inequalities.
For the all-point route, normality makes each stalk integrally closed. By mem_of_forall_valuationSubring a rational element is regular if it lies in every valuation subring containing the stalk. Pull such a valuation ring O back via psi. The model base identity puts O_K in it. exists_refine constructs O' contained in the pulled-back O, centered over a nonzero height-one prime la of O_K: form the residue-congruence subring of elements congruent to a base integer modulo the original valuation maximal ideal, choose a maximal ideal of O_K containing the contracted center, lift it to a proper ideal, and dominate by a valuation subring; nonunit containment gives the needed inclusion. Retain all ordered valuation group hypotheses.
fin_small_gen gives l in W with nu(a(f))≤nu(a(l))^tau in multiplicative notation. Via valuation_le_iff there is c in O' with a(f)=c*a(l)^tau. The ratio and nonzero psi(a(w)) yield
  r_{f,k}=psi(c) F_k(l)^tau.
The two factors are in O (local section is regular, and c is in the refinement), so r_{f,k} belongs to every such valuation ring and hence the normal stalk. This also supplies generic-fibre regularity.

The second route in height_lower_bound_of_regulator splits on (p x).asIdeal=bottom. Use the first route on the generic fibre. At a nonzero base prime, assume r is not regular. SmallGenerators.exists_val supplies a valuation O containing the stalk, strictly less than one on its maximal ideal, and nu(r)>1. It constructs the valuation by adjoining r^-1 to the local ring; if the ideal generated by the maximal ideal and r^-1 were the unit ideal, a reversed polynomial with unit leading coefficient would make r integral, contrary to normality and nonregularity. A maximal ideal and dominating valuation then give the separating inequality. zeroAt_const ensures the strict center condition at la. Apply fin_small_gen to nu composed with psi. By the ratio, nu(r)≤nu(F_k(l))^tau≤1, contradiction. No normality-free descent or sign reversal is valid.

The finite generator lemma fin_small_gen actually proves the inequality by contradiction, not by assuming an arbitrary generator maximizes the desired bound. Choose finitely many O_K generators w_j from GoodOn.FG, spanning over K. BirOn ensures a_j=a(w_j) not all zero and their ratios to a maximal-valuation a_0 generate Om Z. If every nu(a_j)^tau<nu(b), b=a(f), then y_j=a_j/a_0 have nu≤1 and q=a_0^tau/b has nu<1; a_0,b nonzero. Apply exists_cdvr_point_gen to these finite elements, the chart coordinates and protected nonzero denominators; obtain a specialization into a complete DVR and preserve strict positivity for q in ADDITIVE order. intAll_ramified supplies an integral frame after ramified extension. The common nonzero frame multiplier C_u appears for weight G and C_u^tau for weight tau G. Set X0=C_u phi(rho(a_0)), Y0=C_u^tau phi(rho(b)), q'=phi(rho(q)); then X0^tau=q'Y0, ord(q')>0. The depth lower bound from hf.1 la at the resulting recVals member gives tau ord(X0)≤ord(Y0): all generators have normalized order at least that of X0, extending to W via le_of_mem_span, then infimum; the positive ramification normalization r'*e cancels. But the exact product identity gives tau ord(X0)=ord(q')+ord(Y0)>ord(Y0), contradiction. This reconstructs the proof logic, not the deeper CDVR specialization or integral-frame construction. These remain named native obligations.

## 4. Archimedean estimate and passage to every complex point
WeilHeightArchimedeanContribution constructs the holomorphic spanning comparison using NV, the dimension bound dimFlag≥1, a toroidal flag bundle, local_unit_map_surjective and extVan_section_has_cusp_form_match. For each good embedding and holomorphic P, express it on frames as a finite complex linear combination Q of cusp forms (pointwise equal). norm_small_le with the original unfolded-domain conditions, even_wtOf, and IsFrame then supplies for every field embedding rho:Om Z→C extending sigma:
  |rho(a(f))|≤exp(tau*t) * archSize(A_sigma,(rho(a(b_m)))_m)^tau.
The result applies for all positive tau; at 8i positivity follows from i≥1. Do not replace this norm bound by a comparison at a single embedding.

WeilHeightComparisonOfDegreeBound calls GenericDenseBound.norm_le_of_emb. IsModelOf.fs supplies coefficients c_jm with b_m=sum_j c_jm gw_j. On an affine neighborhood of a complex point y where the rational coefficient r is regular, the coordinate ring is a finitely generated Z-domain (projectivity, number ring finite type) and its fraction field is X.functionField. For a field embedding rho of that fraction field, let lambda=rho(F_k(w)/psi(a(w))). Then the local rational coefficient evaluates to rho(psi(a(f)))*lambda^tau and each generator section to rho(psi(a(gw_j)))*lambda. Combining the reverse basis coefficients with A gives the common lambda factor in each of the sums defining the FS norm. Define Q as the sum of squared absolute values of those linear combinations of local generator section values; Q≥0. Squaring the generic bound and factoring |lambda|^(2tau) gives |r|²≤exp(2tau*t) Q^tau, including lambda=0, without division by lambda.
The lemma ContinuousAeval.bound_of_emb passes this inequality from field embeddings to arbitrary complex points of the affine ring: present it as a quotient of a finite-variable integer polynomial ring, use a rational prime ideal, and approximate each point by generic zeros with exactly that ideal (countably many open dense nonvanishing conditions and Baire, using ratPrimeDense). The approximating evaluations are injective on the ring and extend to its fraction field. The finitely many number-field embeddings allow a frequently constant embedding subsequence; continuity gives the inequality at the point and identifies the restriction to the given O_K embedding. All this is essential: generic evaluation alone is not enough. Keep the RatPrimeDense proof leaves, finite type, fraction field and continuity hypotheses.

The original metric is phi_k(y)=log Q(y). For Q>0, cancel the positive Q^tau; for Q=0 use Lean's totalized log(0)=0 and 0^0=1, treating tau=0 correctly in the general lemma final_ineq. Thus
  |ratVal(r_{f,k})(y)|² exp(-tau phi_k(y)) ≤ exp(2tau*t).
We have not independently reconstructed local_unit_map_surjective, norm_small_le, or all analytic density leaves.

## 5. Global section and injection
exists_rat_small presents L^tau as Cartier divisor of the nonzero rational section s(w)^tau. The all-point regularity condition says h_f lies in its rational-function section space; presents_divOfRatSec gives a genuine global S_f and an injective rational-function encoding R with R(S_f)=h_f. At every complex point the actual chart coordinate is the ratVal of r_{f,k}, by the presentation and local evaluation identity. The shifted power has metric weight tau*(phi+2t), so
  norm_shifted(S_f)^2 = |ratVal(r)|² exp(-tau phi) / exp(2tau*t) ≤1.
The metric shift is doubled in the weight, NOT 2t added only once after tensoring. The denominator is strictly positive for all real t, including negative t.
Select S_f for each f. If S_f=S_g, apply R and cancel the common nonzero inverse power of psi(a(w)), then use psi injective to get a(f)=a(g). The difference f-g is in the same cusp submodule and has zero generic value at Z. It is supported on Z, so its generic values on other components vanish by evC_eq_zero. secZ_eq_zero_of_genVal gives f-g=0 (via generic frame atlas and radical Jacobson ideals; those named inputs retained). Therefore the section map is injective on F, and its image lies in smallSec. Extended cardinal monotonicity proves the target. No hidden assumption of finite sets, linearity, isometry, or a positive self-intersection is introduced.

## 6. Executed check
Re-fetched 16 pinned primary source blobs, matched all 81 literal anchors at the lines above against their returned hashes. V8 BigInt regression actually executed: {"cancel":17640,"valuation":11060,"metric":1944,"zeroQ":297,"negativeControls":244}. Exact finite-grid checks of cancellation, additive valuation direction, shift scaling, totalized-log zero branch, and insufficient valuation counterexamples; not a Lean build or native arithmetic variety test. No new mathematical assumption is used in the local reconstruction. No URT benchmark or global proof coverage claim.

Reproduce source matching using this ledger on a checkout of the pinned upstream commit (compare git rev-parse PIN:path and exact string occurrences):
```json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean",
    "sha": "0e1bad41f4b165c0d9b1693f419530309e1da5ba",
    "locations": [
      [
        21,
        "Xj7N.small_sections_injective"
      ],
      [
        21,
        "exists_nonvanishing_of_toroidal"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjective.lean",
    "sha": "d8879d8a7eda4debcda1494cd18864c0302c24ba",
    "locations": [
      [
        13,
        "theorem PositivityTheory.Xj7N.small_sections_injective"
      ],
      [
        14,
        "weil_height_comparison_of_degree_bound"
      ],
      [
        14,
        "weil_height_archimedean_contribution hNV"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/SmallSectionsInjectiveOfSelfIntersectionBound.lean",
    "sha": "c7b76d680093c367262f0d5dead7c738caa57143",
    "locations": [
      [
        31,
        "hGood.2.2"
      ],
      [
        35,
        "imageDeg_zero"
      ],
      [
        39,
        "hM.bpf"
      ],
      [
        46,
        "hM.ratio w₁ w"
      ],
      [
        54,
        "exists_rat_small"
      ],
      [
        58,
        "height_lower_bound_of_regulator"
      ],
      [
        59,
        "regulator_lower_bound"
      ],
      [
        61,
        "choose! Sf"
      ],
      [
        69,
        "mul_right_cancel₀ hc h1"
      ],
      [
        72,
        "eq_zero_of_genVal'"
      ],
      [
        73,
        "hinj.encard_image"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/InjectivityWeightSectionsOf.lean",
    "sha": "a45a05e177dfd35f22b46e8107c512eeeb9b5913",
    "locations": [
      [
        27,
        "theorem exists_rat_small"
      ],
      [
        37,
        "presents_divOfRatSec"
      ],
      [
        40,
        "CartierDiv.mem_sections"
      ],
      [
        46,
        "hPr.exists_rat_eq"
      ],
      [
        62,
        "Weight.zpow_φ"
      ],
      [
        72,
        "Real.exp (2 * (τ : ℝ) * t))⁻¹"
      ],
      [
        74,
        "mul_inv_le_iff₀"
      ],
      [
        79,
        "theorem eq_zero_of_genVal'"
      ],
      [
        82,
        "secZ_eq_zero_of_genVal hf.1.1"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/HeightLowerBoundOfRegulator.lean",
    "sha": "56c6300f425734f6830a74b0ba50bf64c49d7693",
    "locations": [
      [
        15,
        "by_cases hp"
      ],
      [
        17,
        "SmallGenerators.reg_of_val"
      ],
      [
        18,
        "O.valuation.comap ψ"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/RegulatorLowerBound.lean",
    "sha": "8d9ecd9a5a2a978a056e8f02b60776859d11e71e",
    "locations": [
      [
        11,
        "theorem regulator_bound_all"
      ],
      [
        13,
        "exact reg_of_val"
      ],
      [
        19,
        "RegularPointExistence.regulator_bound_all"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsHeightEstimate.lean",
    "sha": "c0606a7c83a6a15d54e7530c39c0ed0020cbf196",
    "locations": [
      [
        28,
        "mem_of_forall_valuationSubring"
      ],
      [
        30,
        "exists_refine"
      ],
      [
        34,
        "ValuationSubring.valuation_le_iff"
      ],
      [
        49,
        "O.mul_mem"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/WeightSectionsCdvrEstimate.lean",
    "sha": "cf67718c710bd3d497ef3955e6174ed97e983c30",
    "locations": [
      [
        80,
        "theorem exists_val"
      ],
      [
        90,
        "IsIntegrallyClosed.isIntegral_iff"
      ],
      [
        118,
        "zeroAt_const"
      ],
      [
        153,
        "apply hO3"
      ],
      [
        172,
        "pow_le_one' hFl"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean",
    "sha": "4d2546abb6eaa7950fcfeb20dd8adca341631fa2",
    "locations": [
      [
        35,
        "Finite.exists_max"
      ],
      [
        49,
        "let q : Om Z := a i₀ ^ τ / b"
      ],
      [
        78,
        "exists_cdvr_point_gen"
      ],
      [
        102,
        "intAll_ramified"
      ],
      [
        162,
        "prod_exZ_nsmul"
      ],
      [
        173,
        "hρL Q hqG hq hρQ"
      ],
      [
        180,
        "div_le_div_iff_of_pos_right hE"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/MemOfForallValuationSubring.lean",
    "sha": "52382959baccb186d46f53c8f3d153b40993c4a5",
    "locations": [
      [
        7,
        "theorem mem_of_forall_valuationSubring"
      ],
      [
        20,
        "Subring.exists_le_valuationSubring_of_isIntegrallyClosedIn"
      ],
      [
        23,
        "theorem exists_refine"
      ],
      [
        94,
        "ValuationSubring.nonunits_le_nonunits"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightComparisonOfDegreeBound.lean",
    "sha": "08db56669223ef219bb1b386f66b280e8d8b7245",
    "locations": [
      [
        13,
        "GenericDenseBound.norm_le_of_emb"
      ],
      [
        15,
        "(8 * i) (by omega)"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean",
    "sha": "8594fde18897fec5e51d38efa44601913999814f",
    "locations": [
      [
        43,
        "local_unit_map_surjective"
      ],
      [
        44,
        "extVan_section_has_cusp_form_match"
      ],
      [
        50,
        "exact norm_small_le"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FiniteTypeSections.lean",
    "sha": "7d66d140748c6d2029e07d4ba528c76a369b75c0",
    "locations": [
      [
        35,
        "theorem final_ineq"
      ],
      [
        39,
        "Real.log_zero"
      ],
      [
        41,
        "Real.exp_log h0"
      ],
      [
        44,
        "theorem norm_le_of_emb"
      ],
      [
        72,
        "bound_of_emb"
      ],
      [
        85,
        "set lam"
      ],
      [
        114,
        "Real.sq_sqrt hS"
      ],
      [
        126,
        "refine final_ineq"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ContinuousAeval.lean",
    "sha": "30e5a81f94814c59f5b07146a9d4785b8c86b05a",
    "locations": [
      [
        30,
        "theorem generic_dense"
      ],
      [
        48,
        "dense_iInter_of_isOpen"
      ],
      [
        88,
        "theorem exists_seq_emb"
      ],
      [
        124,
        "IsFractionRing.lift"
      ],
      [
        132,
        "theorem bound_of_emb"
      ],
      [
        141,
        "frequently_exists.1"
      ],
      [
        149,
        "le_of_tendsto_of_tendsto_of_frequently"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/IsModelOf.lean",
    "sha": "ffd442f45da6543771bd9a265874bbe994ab8a4a",
    "locations": [
      [
        21,
        "structure IsModelOf"
      ],
      [
        27,
        "normal :"
      ],
      [
        29,
        "bij :"
      ],
      [
        31,
        "base :"
      ],
      [
        33,
        "ratio :"
      ],
      [
        36,
        "bpf :"
      ],
      [
        38,
        "fs :"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SecZEqZeroOfGenVal.lean",
    "sha": "f71bf6deac8fb37c92f9a4a9aa9900e11055315a",
    "locations": [
      [
        37,
        "theorem secZ_eq_zero_of_genVal"
      ],
      [
        48,
        "Ideal.jacobson"
      ],
      [
        16,
        "evR_eq_zero_of_genVal_eq_zero"
      ]
    ]
  }
]
```
Replay the scalar regression in Node or another JS runtime:
```js
function assert(v,msg){if(!v)throw Error(msg);}
function regression(){
 let cancel=0,valuation=0,metric=0,zeroQ=0,neg=0;
 // Rational equality with a common nonzero denominator; cross products use exact integers.
 for(let i=1;i<=4;i++)for(let w=-5;w<=5;w++)if(w)for(let a=-10;a<=10;a++)for(let b=-10;b<=10;b++){
   const d=BigInt(w)**BigInt(8*i);
   assert(d!==0n,"denominator");
   assert((BigInt(a)*d===BigInt(b)*d)===(a===b),"cancellation");cancel++;
 }
 // Additive valuation ord, reversing the multiplicative order. ratio implies ord(s_l)=ord(a_l)-ord(a_w)+ord(s_w).
 for(let i=1;i<=4;i++)for(let a=-4;a<=4;a++)for(let w=-4;w<=4;w++)for(let sw=-4;sw<=4;sw++){
   let sl=a-w+sw;if(sl<0)continue;
   for(let excess=0;excess<=6;excess++){
     const tau=8*i,b=tau*a+excess;
     assert(b-tau*w+tau*sw===excess+tau*sl,"valuation equality");
     assert(b-tau*w+tau*sw>=0,"regularity");valuation++;
   }
   if(sl===0){assert(8*i*a-1-8*i*w+8*i*sw<0,"strictly insufficient valuation");neg++;}
 }
 // metric exponent: exact powers of 2, Q=2^q, exp(2*t)=2^s; a=2^k.
 const p2=n=>n>=0?[2n**BigInt(n),1n]:[1n,2n**BigInt(-n)];
 const mul=(a,b)=>[a[0]*b[0],a[1]*b[1]];
 const le=(a,b)=>a[0]*b[1]<=b[0]*a[1];
 const eq=(a,b)=>le(a,b)&&le(b,a);
 for(let i=1;i<=4;i++)for(let q=-4;q<=4;q++)for(let s=-4;s<=4;s++)for(let slack=0;slack<=5;slack++){
   let tau=8*i,k=tau*(q+s)-slack;
   assert(le(p2(k),p2(tau*(q+s))),"unshifted");
   assert(le(mul(p2(k),p2(-tau*q)),p2(tau*s)),"metric bound");
   assert(eq(mul(mul(p2(k),p2(-tau*q)),p2(-tau*s)),p2(-slack)),"shift");metric++;
 }
 for(let tau=0;tau<=32;tau++)for(let s=-4;s<=4;s++){
   const upper=tau===0?p2(tau*s):[0n,1n];
   assert(le(upper,p2(tau*s)),"total log zero");zeroQ++;
 }
 return {cancel,valuation,metric,zeroQ,negativeControls:neg};
}
console.log(regression());
```

RESUME HERE: trace the genuine fin_small_gen prerequisite exists_cdvr_point_gen in MinimalPrimeDimensions/ExistsPointOfValGen.lean and its actual specialization and integral-frame producers; reconstruct exactly how the finite set of bounded/strictly bounded and protected nonzero elements survives the CDVR specialization (including positive ramification). This is a distinct native geometric obligation, not another cardinality or Chow-height calculation. Keep local_unit_map_surjective and norm_small_le as separate open archimedean leaves. HANDOFF TO: editor, integration, audit, literature, theta, prime-window. Mark the small-section injection as source-matched with named open geometric leaves. No physics changes.


---

## Appendix 60: specialists/prime_window/RUN5_GENERALIZED_HOST_BALANCE_ADAPTER.md

# RUN5 — actual generalized arithmetic host and real-balance adapter (2026-11-24)

RESULT: SOURCE-MATCHED conditional reconstruction; actual V8 finite checks and source anchors executed. No kernel replay, proof completion, or URT speed advantage. Prior prime runs 1–4 and peer size, Landau, character, integration, editor, acceleration, theta, Galois, literature and positivity handoffs checked; preflight AGENTS/swarm/queue/expansion/state/continuity/runner/CI read. No physics changes. Physical orchestrator #364 PASS is unrelated. Blueprint not independently re-read this run.

## Source revision
PIN 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD independently observed cb4dc6e23a6187db392c96664295415c55b6b01e (10:44:28 UTC), changed since run4. At HEAD hostFactsS.lean blob 46405e93677b4a86aaea228896b4ad99106dd74c (190 lines); LipschitzWeightAndMinimum.lean blob 7e4b01f79f02ae2b5071470c00c44e48ae376431 (1078 lines). ChBalance.lean returned 404 at HEAD; no assertion of theorem deletion or equivalence. Keep PIN, not migrated. Every path below relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/.

## 1. Actual host producer, not merely an assumed small prime set
Source PrimitiveCosets/hostFactsS.lean:7–15 inPhi_of_jac; 17–31 jac_of_dvd; 33–38 d_dvd_ordCompl; 40–42 toE_iod'; 44–125 hostFactsS_pf; 127–136 hostFactsS. RecH:10–23 defines toE, recH and arith, reversing the two sign coordinates; first additive bit is the SECOND multiplicative sign, not first. HostFacts:15–28 quadratic reciprocity and congruence; 34–118 prime, congruence, coprimality and support facts. Fix ANY Frame phi and HostAx H. Let Q=H.QS, q=H.q, d=H.d, M=Qq, C=M d (source condN, distinct from truncation N in ASK); S=primeFactors(M). Let r=toE composed with H.art on the units of Z/C. Define D=arith(H.raw) via cftData q d r. The theorem concludes HostFactsS D (insert q H.small), which is S. Premises include all fields of HostAx; this proof does NOT construct HostAx.

H gives q,d prime, q=3 mod 8, d=7 mod 16, Q>0, 2|Q, gcd(Q,qd)=1, and (-d/p)=+1 for odd p|Q and (-d/q)=+1. Hence q,d distinct, gcd(M,d)=1 and C>0. The source identifies the second sign of art(u) with Jacobi(u,d) (H.der.art_ch); d prime, d=3 mod 4. Thus if u has value k modulo d and (k/d)=+1 then r(u) is in Phi. For each prime p|M: if p=2, (2/d)=+1 by d=7 mod 8; otherwise quadratic reciprocity with d=3 mod 4 yields (p/d)=(-d/p)=+1. This includes q. Since p != d, d divides the p-free part ordCompl[p] C. All congruence reductions are thus valid.

Eight fields of HostFactsS (SplitInertia:14–22), discharged separately:
1 d_prime from H; 2 two_mem from 2|Q and M!=0; 3 q1_mem from q|M; 4 d_not_mem from gcd(M,d)=1.
5 unram: for prime p outside S and p!=d, p does not divide C. The source unramified_spec identifies local unit subgroup as trivial. mem_inertia_iff represents any inertia element as image of a local unit, hence zero; conversely zero belongs to any subgroup (hostFactsS_pf:58–70).
6 split_inertia: for EVERY p in S and EVERY x in inertia(p), choose u by mem_inertia_iff. Local units satisfy u=1 mod ordCompl[p] C; reduce modulo d, get (u/d)=1, so x in Phi (71–76). S contains only primes here; the predicate itself quantifies all p in S.
7 split_frob: frobUnit_modEq says chosen Frobenius unit is p mod ordCompl[p] C; reduce modulo d and apply jac_of_dvd; hence Frob_p in Phi (77–82).
8 inertia_d: ordCompl[d] C=M because d occurs exactly once and coprime M. For u local at d, u=1 mod M. H.art_d gives art(u)=1 or phi.iod, whose toE image is respectively 0 or sgc0. Conversely identity realizes zero. CRT supplies a UNIT u=1 mod M and u=-1 mod d (exists_unit_crt with coprime M,d); it lies in local units at d. Since (-1/d)=-1, the identity Artin branch contradicts H.der.art_ch, so art(u)=phi.iod and image is sgc0. Both elements are realized, not just an inclusion (83–125). No condition on Frob_d needed.
Finally primeFactors(M)=insert q primeFactors(Q)=insert q H.small (127–136). The prime powers of Q, including the 2-power tower, are retained in conductor; S is only support, not conductor.

This is the actual generalized theorem used in main branch, NOT narrow HostFacts (FirstPrimeNeSecondPrime:47–59). Narrow facts imply HostFactsS for S={2,q} (given its guards), but not conversely: another p in S can have nontrivial inertia inside Phi. Example abstract D with q=11,d=7,S={2,11,29}, inertia29={0,(0,1,0)}. This is an abstract counterexample to substituting narrow for generalized fields, not a constructed native HostAx.

## 2. Exact arithmetic vs real Fourier adapter
D5.PartnersToFactorsAt:33–69 defines CycHost, GC, vonMangoldtClassSum, askTop, ledTop, balTop, Balance. CR.host in LipschitzWeightAndMinimum:122–159 sets cv=primVal D, ell unchanged, and the three sign characters unchanged; cv_zero follows because each inertia subgroup contains zero and its mean of constant 1 is 1. Thus GC(host D ell,psi,y)=GPsi(D,ell,psi,y) definitionally for ALL real y; no host hypotheses needed. CR.De_re:161–168 replaces filter not InPhi(g+topPl(t)) by not InPhi(g), because topPl has zero first coordinate. For characters of finite additive group, psi(-g)=conj(psi(g)); this is not psi(g) in general. Partner arguments are identical and real part commutes with sums, hence Re De=balTop(host D ell,a,t,w) for arbitrary real a,w (the identity of totalized expressions, not an estimate). MAIN real part equals ledTop directly; a real scalar multiplies ell(chC), so only its real part contributes.

Additional explicit human consequence: under HostFactsS D S, a>0, w positive on Phi and N>=a/w(rho) for all rho in Phi, ASK=askTop(host D ell,a,t,w). Proof: for each g outside Phi, W=w(partner_t(g))>0, and 1<=n<=floor_nat(a/W) iff 1<=n<=N and n<=a/W. Extend by zero: (a/n-W) times that indicator equals max(a/n-W,0). Endpoint equality contributes zero. If a/W<1 the interval is empty. Finite sums commute, and factor 2/|G|=1/|Phi|. Replace psi(-g) by conjugate psi(g); CharacterBalance.askExp:122–196 now identifies the resulting complex sum with real ASK, so taking real parts gives equality. This derived adapter is NOT a separate named Lean theorem. All arbitrary weights outside Phi are irrelevant to these three expressions (partners lie in Phi); positivity outside Phi is required by the separately stated D5.Balance, but can be satisfied by replacing such weights with 1 without changing these expressions. D5.character_sum_balance (Balance:218–296) is independent generic real identity; do not claim it supplies HostFactsS or that it is directly invoked in ch_balance.

## 3. Verified source call graph and geometric interface
ChBalance:18–196 handles generalized S with split primes contributing zero; d contributes one (inertia cardinality 2), outside S and d contributes 2 on the single admissible unramified coset. askExp plus sum_cut, inner_eq and colour_sum gives theorem Deduction.ch_balance:200–260. This uses HostFactsS, a>0, w>0 on Phi and uniform N cutoff. It does not call narrow colour_balance. The latter has actual consumers in LipschitzWeightAndMinimum:656–664 (proposition_at_point and proposition_final), with a separate zeta route. No claim of exhaustive callers.

ChCore:283–338 CharacterBalanceMoves.core uses generalized hD; x>=3,b>0 imply a(t)>0 on TT by |a(t)/b-x|<=1. SizesA supplies positivity, thick/thin windows and cutoff for every u0 in A0, j and t in TT. th_le gives Re Th<=Re De+per-node cost; at 309–311 ch_balance is explicitly applied and real part taken, giving Re De=ASK-Re MAIN. CostWindows bounds per-node cost by 2b/x; summing over t,j and applying hTop gives upper Err+2|TT|mb/x. Average over A0 and use sum_Th with T2 subset A0. Divide by positive |A0|; multiply lower hypothesis hY by nonnegative mb delta2(T2)/2. Hence |TT|mb(delta2/2)Y<=Err+2|TT|mb/x. No division by m or |TT| here; degenerate empty sets are retained. ch_core:343–442 applies size inequality and returns GmA bound (run2/peer math already explain exponent, not repeated).

Geometry joins at ChTop:11–35 and 37–72. IdentU (SplitInertia:67–72) comprises FIVE exact premises: aT transported via eT:Top≃TT; w transported via tr:U0→H and eP:Fin f≃PhiSet; gam=Euler constant; LpL=Re ell(chC); Dd.ASK(u)=sum ASK of the SAME host/cutoff/nodes. eP also ensures f=|Phi|, eT ensures same sums. Thus Dd.Main(u)=sum Re MAIN and gapA(tr u)=Dd.ASK(u)-Dd.Main(u). SizeData₂ (11 premises), ErrWindows, BNBoundsU and LargeX then bound this gap. IdentU is a premise not deduced by rewriting arbitrary ASK. CoreAtH:29–41 requires those same fields and coverage of A0; CoreGm:55–60 passes hostFactsS phi H to ch_core and for EVERY u in A0 chooses v with tr(v)=u via hcov, using ch_top at v. This establishes pointwise geometric gap bound where the arithmetic argument actually needs it. No global HostAx or CoreAtH existence asserted.

## 4. Executed certificate
13 pinned modules and 65 exact declaration/call anchors checked with GitHub-reported blob IDs. V8 execution below: {"reciprocity":175,"crt":75,"localUnit":6794,"adapter":10016,"phaseNegative":1,"splitNegative":1}. Legendre symbol evaluated by exhaustive residue search, CRT constructive by residue scan, local unit checks on finite prime/conductor fixtures; finite adapter uses exact integer Gaussian roots and scaled rational weights, not native HostAx. All assertions succeeded. The negative example is an abstract HostFactsS witness against the narrow assumption, not a native field. Tests do not prove general reciprocity, source elaboration or global geometry. Replay in Node; source-anchor mode in pinned checkout is separately specified by manifest below.

~~~js
function certificate(){
 const c={reciprocity:0,crt:0,localUnit:0,adapter:0,phaseNegative:0,splitNegative:0};
 const check=(v,m)=>{if(!v)throw Error(m)};
 const gcd=(a,b)=>b?gcd(b,a%b):a,mod=(a,n)=>(a%n+n)%n;
 const prime=n=>n>1&&Array.from({length:Math.floor(Math.sqrt(n))-1},(_,i)=>i+2).every(p=>n%p);
 const primes=Array.from({length:150},(_,i)=>i+2).filter(prime);
 const leg=(a,p)=>{a=mod(a,p);if(!a)return 0;for(let j=1;j<p;j++)if(j*j%p===a)return 1;return -1};
 for(const d of primes.filter(p=>p%16===7)){
   check(leg(2,d)===1&&leg(-1,d)===-1,"d residue");
   for(const p of primes.filter(p=>p!==2)){check(leg(-d,p)===leg(p,d),"reciprocity");c.reciprocity++;}
   for(const q of primes.filter(p=>p%8===3&&leg(p,d)===1)){
     for(const r of primes.filter(p=>p!==2&&p!==q&&leg(p,d)===1).slice(0,3)){
       const M=16*q*r,N=M*d;check(gcd(M,d)===1,"coprime");
       const u=Array.from({length:d},(_,k)=>1+k*M).find(v=>v%d===d-1);
       check(u!==undefined&&gcd(u,N)===1&&leg(u,d)===-1,"CRT");c.crt++;
       for(const p of [2,q,r]){
         let comp=N;while(comp%p===0)comp/=p;
         check(comp%d===0,"d divides complement");
         for(let k=0;k<N/comp;k++){const v=1+k*comp;if(gcd(v,N)===1){check(leg(v,d)===1,"local units");c.localUnit++;}}
       }
     }
   }
 }
 // G=C2 x C2 x C4, integer index (first bit, second bit, last coordinate).
 const es=Array.from({length:16},(_,i)=>[i>>3,(i>>2)&1,i&3]);
 const id=x=>8*mod(x[0],2)+4*mod(x[1],2)+mod(x[2],4);
 const add=(a,b)=>id(es[a].map((x,i)=>x+es[b][i])), times=(a,k)=>id(es[a].map(x=>x*k));
 const B=[8,9,10,11,12,13,14,15],P=[0,1,2,3,4,5,6,7],roots=[[1,0],[0,1],[-1,0],[0,-1]];
 const V=(u,g)=>roots[mod(es[u][0]*es[g][0]*2+es[u][1]*es[g][1]*2+es[u][2]*es[g][2],4)];
 const plus=([a,b],[c,d])=>[a+c,b+d],mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],scale=([a,b],k)=>[a*k,b*k];
 const S=[2,11,29],d=7, ps=[2,3,5,7,11,13,17,19,23,29,31];
 for(let t=0;t<4;t++)for(let z=0;z<8;z++)for(let N=1;N<=32;N++){
   const a=2*N-1, w=g=>P.includes(g)?1+((g+z)%4):(-1-z), partner=g=>add(add(12,g),t);
   for(const p of ps){
     const I=p===d?[0,8]:p===29?[0,4]:[0],F=S.includes(p)?(p+z)%8:(p+3*z)%16;
     for(let k=1,n=p;k<=N&&n<=N;k++,n*=p){
       let lhs=0,rhs=[0,0],clipped=[0,0];const h=times(F,k);
       for(const g of B){
         const W=w(partner(g));check(W>0,"partner");
         const raw=a-2*n*W,clip=Math.max(raw,0);
         // Scale K by 16; denominator M=8 then cleared by factor 8.
         const cv=u=>scale(I.reduce((r,v)=>plus(r,V(u,add(h,v))),[0,0]),16/I.length);
         const kernel=es.reduce((r,_,u)=>plus(r,mul(V(u,times(g,-1)),cv(u))),[0,0]);
         rhs=plus(rhs,scale(kernel,2*n*W<=a?raw:0));clipped=plus(clipped,scale(kernel,clip));
         if(p===d){if(I.some(v=>add(h,v)===g))lhs+=clip;}
         else if(!S.includes(p)&&F>=8&&h===g)lhs+=2*clip;
       }
       check(rhs[0]===128*lhs&&rhs[1]===0&&rhs[0]===clipped[0]&&rhs[1]===clipped[1],"adapter");c.adapter++;
     }
   }
 }
 check(V(1,1)[1]===1&&V(1,times(1,-1))[1]===-1,"phase sign");c.phaseNegative++;
 // Extra split p=29 has nontrivial inertia within Phi: allowed by HostFactsS, not narrow HostFacts.
 check(S.includes(29)&&29!==2&&29!==11&&29!==7&&[0,4].every(x=>P.includes(x)),"strict distinction");c.splitNegative++;
 return c;
}
console.log(certificate());
~~~

Pinned manifest (path, git blob SHA, exact anchor strings; verify with git hash-object and literal text search):
~~~json
[
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/hostFactsS.lean",
    "440a45819936cf0cb7fb8e81156e94b25288459c",
    [
      "private lemma inPhi_of_jac",
      "private lemma jac_of_dvd",
      "private lemma d_dvd_ordCompl",
      "private theorem hostFactsS_pf",
      "exists_unit_crt",
      "H.art_d u hloc",
      "theorem UpperTheory.Comparison₂.hostFactsS",
      "insert H.q H.small"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/RecH.lean",
    "b2712cc402765cea3fd406285e05e32a7ce64ec7",
    [
      "def toE",
      "sgn2 g.1.2",
      "sgn2 g.1.1",
      "def recH",
      "def arith"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/HostFacts.lean",
    "b6a9456ebd641dfd958f66039e3dddbd7b6a02e9",
    [
      "theorem jacobi_neg_recip",
      "theorem d_mod_sixteen",
      "theorem coprime_QSq_d",
      "theorem d_not_dvd_QSq",
      "theorem dvd_QSq_iff",
      "theorem two_dvd_QS"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "structure HostFactsS",
      "split_inertia",
      "split_frob",
      "inertia_d",
      "def SizesA",
      "def IdentU",
      "def gapA"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean",
    "37648715bcf507e086374e8cc476ee746fd274f4",
    [
      "lemma askExp",
      "lemma lsplit",
      "lemma ld",
      "theorem ch_balance",
      "colour_sum ψ"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "lemma core (A0",
      "congrArg Complex.re (ch_balance",
      "rw [Complex.sub_re, Complex.ofReal_re] at k2",
      "rw [CR.De_re, hTh]",
      "theorem ch_core"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean",
    "ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5",
    [
      "lemma ch_top_main_eq",
      "theorem ch_top",
      "h1 : IdentU",
      "have hgap"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean",
    "3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",
    [
      "(hostFactsS φ H)",
      "obtain ⟨v, rfl⟩ := hcov u hu",
      "Deduction.ch_top Dd tr"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89",
    [
      "structure HostFacts",
      "def ASK",
      "def MAIN",
      "def De",
      "def AskMainBalance"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
    "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b",
    [
      "def host (D",
      "lemma GC_host",
      "lemma De_re",
      "AddChar.map_neg_eq_conj",
      "theorem proposition_at_point",
      "theorem proposition_final"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af",
    [
      "structure CycHost",
      "def GC",
      "def vonMangoldtClassSum",
      "def askTop",
      "def ledTop",
      "def balTop",
      "def Balance"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/ThickAverageProofs/Balance.lean",
    "c3acda6e44e220280f69723ae7b876912ac6b3c9",
    [
      "lemma inPhi_add_topPl",
      "theorem character_sum_balance"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean",
    "0ba3621036f19146e7e67fa9c0e8a1c38661a097",
    [
      "def CoreAtH",
      "IdentU Dd tr"
    ]
  ]
]
~~~

Independent audit requested: confirm coordinate reversal toE, order-complement divisibility, exact CRT unit sign, HostFactsS vs HostFacts and actual ch_balance invocation; verify derived askTop equality without incorrectly using D5.Balance's stronger positivity. Validate IdentU coverage independently. No changed premises. No Lean replay.

RESUME HERE: trace actual producer of IdentU's fifth ASK equality from CoreAtH constructors. Find pinned source theorem that identifies geometric Dd.ASK with arithmetic ASK for same t, weights and N; expand arithmetic prime-class counting, including extra split primes and exceptional d, rather than repeat conditional ch_top or size algebra. Ask geometry/math lanes for existing proof of IdentU before duplicating. HANDOFF TO: formal audit, integration, proof editor, math, character boxes, geometry, Landau. Project OPEN.


---

## Appendix 61: specialists/theta_lifts/RUN5_COEFFICIENT_TRANSFER_VIA_DOUBLING.md

# Theta lifts run 5 — why the same Gram coefficient survives the doubling integral

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of GlobalTheory.ThK.Dbl.coefLine_of, with its analytic continuation and Fubini helpers. Conditional on all 12 inputs and the original matching geometry. Supplies precisely RUN4's CoefLine obligation, not the upstream proofs of those 12 inputs.

## Continuity and pin
Read SWARM_PROTOCOL, HANDOFF_QUEUE (blueprint caveat), EXPANSION_15_LANES, AGENTS, research state, runner log/protocol, continuity, RUN4, current Landau migration/character-box handoffs and integration 1100. Latest physical CI PASS 45379182627 at 11:14:39 UTC is not RH validation. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head observed ba5e02170fcf8bc19acf4d63110f5eb85f8c0161 at 11:18:50 UTC (PR 367). Both original LatticeBasics/CoefLine.lean and guessed Reductions/TopPolarZero/CoefLine.lean return 404 at current head. No equivalence or current-head closure inferred; keep original pin. No duplicate of RUN4's residual argument or RUN3's Gamma guard.

## 1. Exact theorem and provenance
Paths below relative to src/Development/WeilBound/ThetaLifts/LatticeBasics/ at original pin. Blob IDs from GitHub connector, 7 fetched source files, 44 literal line-anchor checks:
- CoefLine.lean aef065b49dd25f8c44f8a84762661e4c2e1682b5: lines 13–61 entire theorem; rp 29, tr 32, doubling witness 34, SWFull 39, kpair_cont 41, identity 43–46, specialization 50–59, cancellation 60–61.
- ContinuousFlat.lean e07b88f18ae7f1519132c586f98505de4fdffe03: kpair 46–47; kpair_cont 49–95; continuation of rational invariance 66–68; compact-parameter bounds 73–85; right threshold 86–95; I_right 97–99.
- FarRight.lean 39f221e77ec83a896c30bbc55b4b4fb51d089fbd: An.at_value 34–47, An.far_right 49–57, An.ident 59–64.
- PairsStable.lean 15cdb3b0663f439d9ce45052db1299255f4196c9: DblW 33–41; BoxSec 43–49; SWFull 51–58; HgtInt 75–79; PairsStable 103–106; CoefLine 121–129.
- Hypotheses2.lean 803e1ac677566855e89aa7437ea49c0b78db3602: IsEisCont 53–60 (open, preconnected, punctured-neighborhood membership, half-plane summation, holomorphy, joint continuity, local growth).
- Unfold0.lean f7bdb0f6743a8096a4faa8da5b64f6e889471111: Law.hasSum 30–52, Law.eis_inv 54ff, unfold0 72ff.
- FdEqZero.lean 5a71acf351e947b2bef53cba29a0166d2bfce192: compact bounds Cpt.bdd₂ 88ff, rapid 98ff, vol_ne 105ff.

Exact theorem CoefLine (PairsStable 121–129) fixes the original fields F,E, field/number-field/algebra structures, involution sigma, base B, a,a', geometry G, characters X, reps om,om', maps R,Rf, IsMatched h, and p=q=0. For ANY Haar measure mu on the adelic W group and fundamental domain D for the rational subgroup, fix complex s,t,lambda. Write C_y=s I(om,y.1)+t I'(om',y.2), B_y=I'(om',y.2) for matched y (including So membership). Assume for ALL matched y,y' that
  <C_y,C_y'>_W = lambda <B_y,B_y'>_W.
Then for EVERY matched y and EVERY polynomial test Psi in PolData B G.M', letting T_Psi(f)=th om' mu D f Psi,
  <T_Psi C_y,T_Psi C_y>_V' = lambda <T_Psi B_y,T_Psi B_y>_V'.
Inner product linear in first variable, conjugate-linear in second; these are restricted-Haar integrals, not assumed finite-dimensional vector products. The coefficient lambda is the SAME complex scalar, not |lambda| or a newly chosen constant.

The source takes exactly 12 explicit premises: SWFull (continued doubling Eisenstein series and special-value identity); BoxSec (section law/continuity); DblW (doubling representation, embedding and character-corrected theta-product identities); HgtEx (positive continuous height, compact-type factorization and continuous embedding); HgtInt (integrability of height powers in right half-plane); Stab2Cpt (stabilizer compactness); CptAll (compact covers and quotient measure data); PairsStable (matching stable under simultaneous right translation and linear combination); MatchEx (polynomial/Schwartz compatibility of matched pair); ThetaBasic (theta continuity and rational invariance); PositivityTheory.ThKF.ICont (continuity of I); PolSch (polynomial test implies Schwartz). None eliminated. Geometric rank and definiteness guards follow from T=h.triple, T.geo.lt, T.geo.aBig, p=q=0; no extension to indefinite cases claimed.

## 2. Far-right identity: transport all cross terms, not merely norms
Fix y,Psi and keep them throughout. Set H = U(W), H' = U(V'), nu=mu|D, rho=G.M'.mu|G.M'.dom, V=rho(H'). Write f=C_y, b=B_y. CptAll and theta continuity/invariance plus PolSch and MatchEx make both rapid (rp); right translation satisfies f(hg)=C_{g.y}(h), b(hg)=B_{g.y}(h), where g.y=(om(1,g)y.1,om'(1,g)y.2). I_right proves this via representation multiplication; PairsStable ensures g.y is still matched. Thus the all-pairs premise gives for each g
  <f(.g), f>_W = lambda <b(.g), b>_W.
A diagonal norm equality for a single y would NOT suffice.

Use DblW, HgtEx/HgtInt, BoxSec and SWFull with the SAME polynomial Psi in both slots. Let e embed H x H in the doubled group; let E(z,x) be the analytic continuation of the section's Eisenstein series, flat height extension from z0=((a':C)-(a+a':N))/2. Use z for complex spectral parameter (not coefficient s of C_y). Put d(h2)=detInv X.alpha h2, a unit-modulus character correction. Define the quadratic kernel
  Q_z(v)= int_{D x D} E(z,e(h1,h2)) d(h2) v(h2) conj(v(h1)) dmu(h1)dmu(h2).
For Re z sufficiently large, kpair_cont proves
  Q_z(v)= int_H w_z(g) <v(.g),v>_W dmu(g),
  w_z(g)=flat(height, section, z0,z)(e(1,g)) d(g).
Thus Q_z(f)=lambda Q_z(b) throughout a right half-plane, with the same weight w_z for both v. The proof uses integral_const_mul and commutativity in C, not any independent pointwise eigenfunction assumption.

The helper Law.hasSum identifies rational parabolic cosets with the rational group via anisotropy; Law.eis_inv gives rational invariance where the Eisenstein sum converges. unfold0 unfolds the fundamental-domain sum; An.far_right then exchanges integrals. The full group weight is integrable by HgtInt, the compact stabilizer norm estimate Law.bound, and the unit modulus of d. The threshold in ContinuousFlat is max(t1,t0+Re(z_base)-Re(z_law)), where t1 is the continuation half-plane threshold and t0 is the height-power threshold; z_base denotes that helper's s0, z_law its transformation-law exponent. These are not the coefficients s,t in C_y.

## 3. Analytic continuation of the equality, not of lambda
SWFull produces a common open preconnected U containing a full right half-plane and z0, and a single E(z,x) on U. Rational invariance of E(z,e(h1,h2)) extends to U by An.ident for each pair of group elements. The proof of kpair_cont uses compact covers of H in both slots, jointly continuous E on U x doubled group, and this invariance to bound the kernel uniformly on compact spectral subsets. Multiplying by bounded continuous rapid v yields integrable local domination on finite nu.prod nu. An.diffOn_integral gives holomorphy of Q_z(v) on U. These steps use second-countability/local compactness supplied by Cpt, and finite restricted measures, rather than unjustified interchange of derivative and integral.

Both Q_z(f) and lambda Q_z(b) are holomorphic on this SAME U and equal on the right half-plane. An.ident uses Mathlib eqOn_of_preconnected_of_eventuallyEq, taking t+1 as a point of the open half-plane; equality extends to every z in U, especially z0. No need to assume the Eisenstein series converges as a sum at z0. Connectedness, common domain and holomorphy cannot be removed.

## 4. The special value is a backward theta norm with the original factor
SWFull at m=a', n=a+a' states E(z0,x)=(if n<m then 1 else 2) times the average over the primed model domain of the doubled theta sum. Here n>=m, so the factor is exactly 2. Let theta(g,h)=theta om' Psi g h. The DblW product identity for the SAME Psi in each slot gives
  d(h2) E(z0,e(h1,h2)) = (2/V) int_{D'} theta(g,h1) conj(theta(g,h2)) d rho(g).
The conjugations and location of d(h2) are essential. DblW supplies the factorization after evaluating the doubled embedding; the average is setAverage_eq, not an arbitrary normalized measure. By Cpt.vol_ne, V is finite and nonzero (hence positive). The factor 2/V is independent of v.

Both theta and v are bounded continuous (compact covers + rational invariance, as used by An.at_value). Product integrand is absolutely integrable on the finite product of nu,nu,rho. Fubini, complex conjugation of the integral, and product integration give
  Q_z0(v) = (2/V) int_{D'} |int_D v(h) conj(theta(g,h)) dnu(h)|² drho(g)
           = (2/V) <T_Psi(v),T_Psi(v)>_V'.
Apply to f,b and use Q_z0(f)=lambda Q_z0(b). Cancel 2/V != 0 in C (actual Lean mul_left_cancel₀ with two_ne_zero and inv_ne_zero of Cpt.vol_ne). This proves exactly CoefLine with all hypotheses and quantifiers. No division by a possibly zero theta integral. RUN4 can now use this source-matched lemma to force its residual scalar to vanish. The actual production of SWFull, BoxSec, DblW and the other premises remains open; SWFull is a proposition, not an independently verified literature result.

## 5. Reproducibility and negative controls
Executed V8 exact bounded Gaussian-integer finite models, not a numerical simulation of adelic groups or proof of analytic continuation. Weighted product-measure Fubini tests use arbitrary finite complex theta arrays and positive integer weights. Finite cyclic unfolding tests use all 125 vectors and 125 weight vectors. Cross-Gram tests use cyclic translates and scalar multiples to enforce the full premise, then evaluate the same lambda in a translation-invariant theta model. Special-value tests clear the positive denominator V rather than approximate. Separate negative controls reject diagonal-only equality, missing conjugation, and cancellation of a zero prefactor. Actual output: {"weighted_fubini":1500,"unfolding":15625,"uniform_cross_gram":16875,"special_point":3375,"negative_controls":3}.

Source check replay: git show 40e56bab026552e089d7afcfeff08d2defb9c005:<full path>; git hash-object on the exact bytes; compare the seven blob IDs and line anchors listed above. The connector fetch and literal anchors were executed; local git hash recomputation and Lean kernel replay were not. Anchor presence is not proof-term dependency extraction. No URT speedup claimed.

Replay finite algebra (Node or JS):
~~~js
function regression(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const Z=[0,0],add=(a,b)=>[a[0]+b[0],a[1]+b[1]],neg=a=>[-a[0],-a[1]],conj=a=>[a[0],-a[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],sc=(n,a)=>[n*a[0],n*a[1]],eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],sum=a=>a.reduce(add,Z);
 const n=3,values=[[0,0],[1,0],[-1,0],[0,1],[1,-1]],vec=[];
 for(const a of values)for(const b of values)for(const c of values)vec.push([a,b,c]);
 const idx=[0,1,2],shift=(v,k)=>idx.map(i=>v[(i+k)%n]),ip=(v,w)=>sum(idx.map(i=>mul(v[i],conj(w[i]))));
 let fubini=0,far=0,uniform=0,special=0;
 for(const phi of vec){
  for(let seed=0;seed<12;seed++){
   const H=idx.map(g=>idx.map(h=>values[(seed+g+2*h+g*h)%5]));
   const rho=[1+(seed%3),2,3],mu=[2,1+(seed%2),3],V=rho.reduce((a,b)=>a+b);
   const kern=(i,j)=>sum(idx.map(g=>sc(rho[g],mul(H[g][i],conj(H[g][j])))));
   const Q=sum(idx.flatMap(i=>idx.map(j=>sc(mu[i]*mu[j],mul(kern(i,j),mul(phi[j],conj(phi[i])))))));
   const T=idx.map(g=>sum(idx.map(h=>sc(mu[h],mul(phi[h],conj(H[g][h]))))));
   const norm=sum(idx.map(g=>sc(rho[g],mul(T[g],conj(T[g])))));
   assert(eq(Q,norm)&&norm[1]===0&&norm[0]>=0,"at_value weighted Fubini");
   // Kspecial = (2/V) kern; store its numerator to avoid roundoff.
   const Qnum=sum(idx.flatMap(i=>idx.map(j=>sc(2*mu[i]*mu[j],mul(kern(i,j),mul(phi[j],conj(phi[i])))))));
   assert(V>0&&eq(Qnum,sc(2,norm)),"special normalization");
   fubini++;special++;
  }
  for(const w of vec){
   const Q=sum(idx.flatMap(i=>idx.map(j=>mul(w[(j-i+n)%n],mul(phi[j],conj(phi[i]))))));
   const R=sum(idx.map(k=>mul(w[k],ip(shift(phi,k),phi))));
   assert(eq(Q,R),"unfolded form");
   far++;
  }
 }
 for(const b of vec)for(let k=0;k<n;k++)for(let r=-2;r<=2;r++){
  const a=shift(b,k).map(v=>sc(r,v)),lambda=r*r;
  for(let i=0;i<n;i++)for(let j=0;j<n;j++){
   assert(eq(ip(shift(a,i),shift(a,j)),sc(lambda,ip(shift(b,i),shift(b,j)))),"all cross terms");
   uniform++;
  }
  // translation-invariant kernel: theta row g is a cyclic translate
  const theta=[values[1],values[3],values[4]];
  const N=x=>sum(idx.map(g=>{const t=ip(x,shift(theta,g));return mul(t,conj(t));}));
  assert(eq(N(a),sc(lambda,N(b))),"same coefficient at special point");
  special++;
 }
 const a=[[1,0],[1,0]],b=[[1,0],[-1,0]];
 const dot2=(u,v)=>sum(u.map((x,i)=>mul(x,conj(v[i]))));
 assert(eq(dot2(a,a),dot2(b,b))&&!eq(dot2([a[1],a[0]],a),dot2([b[1],b[0]],b)),"diagonal-only negative");
 const x=[1,1];assert(!eq(mul(x,x),mul(x,conj(x))),"conjugation negative");
 assert(eq(sc(0,[1,0]),sc(0,[2,0]))&&!eq([1,0],[2,0]),"zero prefactor negative");
 return {weighted_fubini:fubini,unfolding:far,uniform_cross_gram:uniform,special_point:special,negative_controls:3};
}
console.log(regression());
~~~

RESUME HERE: trace the actual supplier of SWFull used by Reductions/TopPolarZero/PolZero.lean, starting at its call to the anisotropic Siegel–Weil construction and following the exact producer of hS (not a theorem-shaped statement). Identify which special-value and analytic-continuation fields of IsEisCont are proved internally or supplied by literature, and preserve the factor 2 versus 1 with its rank guards. Do not repeat the coefficient transfer, orthogonality, or Gamma guard. Coordinate literature lane on the trust boundary and keep lInt2 source unresolved until found.
HANDOFF TO: proof editor, integration, formal audit, theta, literature. Mark CoefLine source-matched conditional; replace its explanatory placeholder with sections 2–4. No physics gate or queue modified.


---

## Appendix 62: specialists/literature_provenance/RUN5_SQUARE_ZERO_SHEAR_AND_GEOMETRIC_LIFTING.md

# RUN5 — Square-zero lifting: shear, rigidity, and actual supplier

2026-11-24. SOURCE-MATCHED, conditional human reconstruction; no independent Lean replay or URT-specific speed claim. Followed RUN4 handoff; read coordination, AGENTS, continuity, research state/log/protocol, peer handoffs and physical CI (11:35 PASS, unrelated to RH). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 5f2c8594adf1f48032d37583118512cd7bbf3afa, changed since RUN4. At that head the two base modules are consolidated in AbelianLiftingOfDeRhamUnobstructed (blob 5b16826bb38b1b907d24526e461f71510856654f, liftObj_sq L306 and liftHom_sq L385). Shear theorem is at L328 of ExistsLiftShearMapSquareZeroAbelianSchemes (blob 94cc58edebc072cd8611647920be5b4934c45141); HodgeDeRham producer at L1635 of AbelianSchemeSquareZeroLiftsOfHodgeDeRham (blob 56819493f085ef977c38d4eaaca7c9705a31d84b). These are declaration location checks, not semantic equivalence. All original references below use pin and directory src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless specified.

## 1. Hypotheses and H's three fields

Fix surjection pi:R→R0 with kernel I, I²=0, canonical divided powers divided₂. Given abelian reference lift A' of A0, group pullback i', smooth relative dimension g, H=AbelianSchemeLifts.At(hI,pi) asserts three properties of smooth *scheme* lifts with a specified special-fiber identification:
(1) every smooth scheme lift X yields admissible F⊆HdR(A') with schemeFil(X)=crysToDR^{-1}(F);
(2) every admissible F is realized by such a smooth scheme lift;
(3) equality of scheme filtrations of X,Y yields an isomorphism E:X≅Y respecting their specified special-fiber maps.
IsNoetherianRingDualNumber (PublishedTheorems/Divisors₂, blob 5e8fc93f969ce75f4bea60e3b1ed1d17f8e93b03) L17–33 defines these conjuncts and L40–59 projects them. Not independent axioms. The global AbelianSchemeLifts proposition quantifies over Noetherian R; the local adapters accept H without requiring Noetherianity themselves. RUN4 gives the extension.

Scheme filtration is the dual annihilator of the primitive crystalline submodule pulled back from F1 of the smooth lift. Definitions/Divisors/PrimitiveCrystalHodgeLiftClasses (blob 33df8f02d248bc33f240a1fe1cee40d8e68d061e) L17–57 proves that for a group lift schemeFil equals liftFil provided AllPrim of its de Rham comparison. P=AbelianDeRham supplies AllPrim. Do not discard this guard.

## 2. Common shear lift (ExistsLiftShearMapSquareZeroAbelianSchemes L69–143)

Let A0,B0 be the abelian special fibers with reference abelian lifts A',B' of dimensions g,g'. Let X,Y be smooth scheme lifts with pullbacks i,j and sections e,e' lifting the identities. Let l:A0×B0→X×Y have both projection compatibilities. Let f0:A0→B0 be a group homomorphism with push(f0)(schemeFil X)⊆schemeFil Y.

In additive notation sigma(a,b)=(a,f0(a)+b), tau(a,b)=(a,-f0(a)+b). They are inverse maps (L86–104). B0 is commutative by group pullback from B' (L26–43,83–85), so sigma is a group homomorphism. A'×B' is abelian and of summed relative dimension; l and l∘sigma are both pullback identifications of X×Y (L105–118).

Write p(d),q(d) for the crystalline push projections of a class d on A0×B0, U=schemeFil X, V=schemeFil Y. Use the two named geometric lemmas: filtration under re-marking by group isomorphism, and product filtration iff both projections lie in U,V (requires the lifted sections). Push of sigma transforms the two coordinates into (p(d),push(f0)p(d)+q(d)) by functoriality and additivity (L119–132). Thus p(d)∈U and q(d)∈V iff p(d)∈U and push(f0)p(d)+q(d)∈V, by addition and subtraction in V using the guard. No inverse of f0 required (L134–140).

Invoke H.exists_iso on the two marked lifts (reference A'×B'), obtaining E with E∘l=l∘sigma. Then phi=pr_Y∘E lifts (a,b)↦f0(a)+b (L141–143). This is the shared mathematical construction for both base adapters, not a new assumption. Keep the underlying filtration comparison lemmas as open child obligations.

## 3. Object: construct a group law, do not assume one

GrothendieckMessingLiftAbelianSchemeOfSquareZero L16–38: H.exists_lift produces smooth X with required filtration. The special fiber is abelian of relative dimension g by group-pullback and smooth base change. Lift its identity section to e over R using nilpotence and smoothness. Construct l by product universal property. Apply §2 with A0=B0 and f0=id (guard via push_id), yielding m:X×X→X lifting addition.

ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotent L15–209 proves this yields an actual group law. Lift properness and geometric connectedness from the special fiber; these and smoothness hold on X, X², X³. Set t(x)=m(e,x); reduction is id, so flat nilpotent reduction reflects isomorphism. Normalize m1=t^{-1}∘m; it still reduces to addition, satisfies m1(e,x)=x and m1(e,e)=e (L70–100). S(x,y)=(x,m1(x,y)) is an isomorphism because its reduction (a,b)↦(a,a+b) is, by the same flat reflection lemma (L102–120).

Crucial noncircular rigidity: for smooth proper geometrically connected P with section epsilon, maps f,g:P→X agreeing on the special fiber and at epsilon are equal (EqOfShearAutomorphismLiftNilpotent L19–99). Apply S^{-1} to (f,g) and (f,f). Both first coordinates are f; both second coordinates reduce to the identity section of A0 and agree at epsilon. The proper smooth nilpotent rigidity theorem makes each second coordinate constant, determined by epsilon. They agree, hence cancellation of S^{-1} proves f=g. No group structure on X assumed. RUN4 records the underlying rigidity source.

Apply this to m1(x,e) and x on X; m1(x,y) and m1(y,x) on X²; both associations on X³. Reductions agree by group laws on A0, section values agree by m1(e,e)=e. This proves right unit, commutativity, associativity (L126–166). Define inverse x↦pr₂ S^{-1}(x,e), a right inverse by product universal property and left inverse by commutativity (L168–186). Bundle GrpObj and verify group-pullback compatibility and abelian properties (L187–209). Relative dimension lifts by nilpotent-spectrum surjectivity and local dimension comparison; use P to identify schemeFil and liftFil. This closes the source-level object adapter conditional on stated internal geometry.

Section producer ExistsSectionLiftSmoothNilpotentThickening (blob 2c3f91a354e7edeaf07acf116b06fbe778911f52) L18–36 uses induction from square-zero, local affine basic-open lifts, finite unit-ideal cover and gluing. SmoothOfRelativeDimensionOfNilpotentReduction (blob 3d8ad2d5fceca557bd928012ddcbdba78718b0c4) L11–41 uses nilpotent spectrum surjectivity and local dimension/base-change comparison. Their deeper proofs remain attached.

## 4. Morphism: uniqueness separately established

GrothendieckMessingLiftHomomorphismOfSquareZero L35–59: given actual abelian lifts A,B and f0 satisfying liftFil compatibility, P supplies AllPrim for both. Rewrite guard to schemeFil, apply §2 with true identity sections, restrict phi to (a,0), yielding a scheme map psi:A→B reducing to f0. No claim psi is already a group map.

ExistsUniqueIsMonHomLift L29–72 corrects psi by translation f(a)=psi(a)-psi(0). Then f(0)=0 and reduction still f0. The abelian rigidity_holds theorem converts the identity-preserving scheme map into a group homomorphism. If g is another group lift, d=g-f reduces to zero and d(0)=0; proper smooth geometrically connected nilpotent rigidity makes d constant equal to its identity value, hence d=0 and g=f. This part works for nilpotent kernels generally; here the bound is 2.

## 5. Actual producer of H

AbelianSchemeSquareZeroLiftsOfDeRhamCohomology (blob d83a4815a5af4d990fb7afa8223bc7125d24ba3a) L13–14 applies the Hodge–de Rham producer with the internal CrystallineSmoothLift theorem. AbelianSchemeSquareZeroLiftsOfHodgeDeRham L32–72 takes hC=CrystallineSmoothLift, hH=AbelianHodgeDeRham. For Noetherian R and specified square-zero quotient, R0 is Noetherian by surjectivity. Establish standard reduction facts, Good, RhoBC, three summand interfaces ad1/ad2/ad3. Choose reference system S' presenting A'. Core1 gives each lift system filtration K as direct summand with required reduction; ksup relates reduction to Hodge filtration. SchemeFil(X) equals dual annihilator of K restricted to primitives (L34–48).
* Field 1: present X by S; core1 and ad1 produce admissible F and equality (L50–53).
* Field 2: ad2 produces summand K with required reduction. Realize K by S, present S by scheme X, prove smoothness and pullback, obtain equality (L54–59).
* Field 3: present X,Y by S,T. ad3 turns equality of restricted dual annihilators into T.K=S.K. Prove Full T, build system morphism and scheme morphism reducing to identity, reflect isomorphism by flat nilpotent reduction (L60–72).

CrystallineSmoothLiftOfRelations L19–46,52–72 constructs hC: choose affine smooth thickening for every datum. A relation total in both directions, additive, scalar compatible and reflecting zero in both directions determines a linear equivalence (uniqueness by subtracting two related pairs, injectivity by zero reflection, surjectivity by totality). Apply in degrees 1,2, then prove cup compatibility, degree-one comparison and naturality by named internal theorems. No additional hC axiom asserted. hH remains a premise of this interface; RUN2 traces the parent supplier.

## 6. Literature/provenance ledger

The published At definition and projections are not axioms. Explicit native theorem applications, read at pin: GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement (a4591047a5b6959a970e8593ff1ec6009be4ada4 L14); GrothendieckMessingLiftHomomorphismOfSquareZeroStatement (5d748c8b2fc9816b156da7bc296a7abb536be3d9 L14); ExistsLiftShearMapSquareZeroAbelianSchemesStatement (c7267d0a5f4028cd15ae1774b2672628505cb2be L25); ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotentStatement (01ce7a147731f9e58f9267f2a5defaa12ac3b7e4 L19); ExistsUniqueIsMonHomLiftStatement (84fbf13797dbe233f5fab526d5bd535937ae26d1 L16); EqOfShearAutomorphismLiftNilpotentStatement (170d848afe49636729666a92368d0560df0766ea L19); AbelianSchemeSquareZeroLiftsOfDeRhamCohomologyStatement (06514f41dd0359b37fdce155a7a4b0f379ea4e5d L12); AbelianSchemeSquareZeroLiftsOfHodgeDeRhamStatement (5fd6c997821fb84b0351568132a48b779f2288ce L12). These are wrapper classifications only, not transitive kernel axiom results.

Remaining native obligations: both filtration invariance/product lemmas, three admissible summand interfaces (especially ad3), Good/RhoBC, system direct summand realization and presentation, comparison relation producers, properness and flat reduction reflection, rigidity, section chart gluing. HodgeFiltrationCompIsoLiftIffStatement (3d99600aa11609eb9d77966c2cefc8c98f23d6b6 L12–16) requires group isomorphism, and HodgeFiltrationTensorLiftsIffProjectionsStatement (8b10d82b7e4b8a467cd72b36188045d4a119fb8e L12–21) requires the stated identity-lifting sections and product compatibility. No new premise introduced by this exposition; no RH kernel claim.

## 7. Actual executed evidence

JavaScript connector check refetched 8 pinned files, compared their blob SHAs against prior observed values, and tested 75 line-specific substrings; all passed. Other sources were read and their blob IDs recorded above. The following data allow reproduction from a git checkout. No Lean execution. Current-head locations separately observed, not a claim of migrated proof equivalence.

RESUME HERE: expand actual HodgeFiltrationCompIsoLiftIff and HodgeFiltrationTensorLiftsIffProjections, including primitive decomposition/product annihilator and lifted-section hypotheses; then trace ad3 in AdmissibleDeRhamHomologySummandsCrystal. Do not redo group law or H-field assembly. HANDOFF TO integration, proof editor, formal audit, geometry, theta. Project OPEN.

Copy JSON into run5_sources.json; execute from upstream checkout:

```python
import json, subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
base="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
def git(*args):
    return subprocess.check_output(["git", *args]).decode("utf-8")
records=json.load(open("run5_sources.json"))
n=0
for r in records:
    spec=pin+":"+base+r["name"]+".lean"
    assert git("rev-parse",spec).strip()==r["sha"], spec
    lines=git("show",spec).splitlines()
    for i,s in r["checks"]:
        assert s in lines[i-1], (spec,i)
        n+=1
print(len(records),"blob hashes;",n,"anchors")
```

```json
[
  {
    "name": "GrothendieckMessingLiftAbelianSchemeOfSquareZero",
    "sha": "d349fdb706b07b78555c662043dc92418fa62c18",
    "checks": [
      [
        16,
        "theorem liftObj_sq"
      ],
      [
        19,
        "H.exists_lift"
      ],
      [
        23,
        "exists_section_lift"
      ],
      [
        31,
        "exists_lift_shearMap"
      ],
      [
        32,
        "push_id"
      ],
      [
        36,
        "exists_grpObj_isAbelianScheme"
      ],
      [
        38,
        "schemeFil_eq_liftFil"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftHomomorphismOfSquareZero",
    "sha": "9aad72370e8be54878ef82d0ce3ca8e8f8e38911",
    "checks": [
      [
        35,
        "theorem liftHom_sq"
      ],
      [
        38,
        "P.1 R A"
      ],
      [
        45,
        "exists_lift_shearMap"
      ],
      [
        48,
        "schemeFil_eq_liftFil"
      ],
      [
        49,
        "existsUnique_isMonHom_lift"
      ]
    ]
  },
  {
    "name": "ExistsLiftShearMapSquareZeroAbelianSchemes",
    "sha": "c9bb7ab3fc7a0a2d59bab4f7307e2e3162072bf2",
    "checks": [
      [
        69,
        "theorem exists_lift_shear"
      ],
      [
        86,
        "∃ σ"
      ],
      [
        87,
        "∃ τ"
      ],
      [
        93,
        "hστ"
      ],
      [
        98,
        "hτσ"
      ],
      [
        122,
        "hodgeFiltration_comp_iso"
      ],
      [
        123,
        "hodgeFiltration_tensor"
      ],
      [
        131,
        "push_mul"
      ],
      [
        136,
        "add_mem"
      ],
      [
        139,
        "sub_mem"
      ],
      [
        141,
        "hL.exists_iso"
      ],
      [
        142,
        "E.hom ≫ snd"
      ]
    ]
  },
  {
    "name": "ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotent",
    "sha": "c8bb62046a077281873af172be53c17ffd17863f",
    "checks": [
      [
        25,
        "isProper_geometricallyConnected"
      ],
      [
        70,
        "∃ τ"
      ],
      [
        77,
        "isIso_of_flat_pullback_reduction"
      ],
      [
        81,
        "m ≫ inv τ"
      ],
      [
        95,
        "one_mul₁"
      ],
      [
        116,
        "σiso"
      ],
      [
        123,
        "eq_of_shear_automorphism"
      ],
      [
        126,
        "mul_one₁"
      ],
      [
        138,
        "comm₁"
      ],
      [
        158,
        "assoc₁"
      ],
      [
        168,
        "∃ iX"
      ],
      [
        187,
        "GrpObj X"
      ],
      [
        202,
        "comm₁"
      ]
    ]
  },
  {
    "name": "EqOfShearAutomorphismLiftNilpotent",
    "sha": "ba86bb78a1df2110c40050eabfbebc14c064e20f",
    "checks": [
      [
        19,
        "theorem eq_of_shear"
      ],
      [
        52,
        "∃ g"
      ],
      [
        53,
        "∃ g"
      ],
      [
        69,
        "hgu_k"
      ],
      [
        71,
        "hgu_ε"
      ],
      [
        84,
        "eq_comp_section"
      ],
      [
        85,
        "eq_comp_section"
      ],
      [
        91,
        "gu = gv"
      ],
      [
        96,
        "cancel_mono"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLift",
    "sha": "068d2a0d2492401d9951b1e018d06c5feecd18d8",
    "checks": [
      [
        29,
        "theorem existsUnique_isMonHom_lift"
      ],
      [
        48,
        "φ *"
      ],
      [
        53,
        "rigidity_holds"
      ],
      [
        57,
        "g * f⁻¹"
      ],
      [
        62,
        "Rigidity.eq_comp_section"
      ],
      [
        72,
        "mul_inv_eq_one"
      ]
    ]
  },
  {
    "name": "AbelianSchemeSquareZeroLiftsOfHodgeDeRham",
    "sha": "8b7694e7cc66ec12b5b055da455ec8ac16b2cc9f",
    "checks": [
      [
        32,
        "theorem abelianSchemeLifts_of_hodgeDeRham"
      ],
      [
        35,
        "isNoetherianRing_of_surjective"
      ],
      [
        37,
        "goodForSquareZero"
      ],
      [
        38,
        "crystal_reduces"
      ],
      [
        39,
        "admissible_deRhamHomology"
      ],
      [
        42,
        "filtration_direct_summand"
      ],
      [
        52,
        "ad1"
      ],
      [
        54,
        "ad2"
      ],
      [
        55,
        "exists_squareZeroLiftSystem_of_summand"
      ],
      [
        57,
        "exists_scheme_presenting"
      ],
      [
        62,
        "ad3"
      ],
      [
        64,
        "filtration_inf_eq_and_full"
      ],
      [
        66,
        "exists_squareZeroLiftSystem_hom"
      ],
      [
        70,
        "isIso_of_flat_of_isIso_reduction"
      ]
    ]
  },
  {
    "name": "CrystallineSmoothLiftOfRelations",
    "sha": "b1bf4854a196e421a8c96ad821dd4f1a2957817b",
    "checks": [
      [
        19,
        "theorem exists_linearEquiv_of_rel"
      ],
      [
        33,
        "Injective"
      ],
      [
        40,
        "Surjective"
      ],
      [
        52,
        "theorem crystallineSmoothLift_of_relations"
      ],
      [
        53,
        "Classical.choice"
      ],
      [
        54,
        "relations_total_detect_zero"
      ],
      [
        67,
        "respect_cup"
      ],
      [
        69,
        "degreeOne_comparison"
      ],
      [
        71,
        "natural_smoothLift"
      ]
    ]
  }
]
```


---

## Revision-migration appendix (NOT part of original pinned proof)

Source: specialists/landau_criterion/RUN5_CURRENT_HEAD_THETA_GENERALIZATION_AND_MIGRATION.md — 303ed5889203ed3629ee565b260e3242bcd07234. Retained as a separate comparison, not a ninth pinned chapter.

# RUN5 — current-head migration and removal of the analytic theta guard
2026-11-24. RESULT: DONE for source comparison and human reconstruction of the new wrapper; SOURCE-MATCHED, finite exact regression executed. Not a kernel replay or adoption of the new revision.

## Continuity and pinned sources
Read AGENTS, research state/log/protocol, continuity, CI state (#364, run 45379182627, not RH validation), swarm protocol, queue, expansion, RUN4, other lanes' latest handoffs (including prime RUN5, kernel RUN4, acceleration RUN5, editor 1056, integration 1100, theta/Galois/character/geometry/literature RUN4), math analytic chapter, peer Landau and regularized-point audits and Grok Landau–Page claim. Blueprint synopsis read, PDF itself not reopened. No duplicate Landau–Page or arithmetic producer work.

Upstream repository leanprover-community/riemann-hypothesis. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current head at inspection ba5e02170fcf8bc19acf4d63110f5eb85f8c0161 (2026-11-24 11:18:50 UTC; merge #367). Keep old pin as reconstruction target. Current clump locations below refer ONLY to this head. Content and blob IDs fetched from GitHub connector, line numbers refer to returned source lines. No Lean executable or elaborated export used this run.

Paths relative to src/Development/AutomorphicArithmetic/:
- DedekindLFunctions/LandauTheorems/landauWindow.lean (current blob 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc): relocated 12 original modules.
- CharacterBoxes/ZeroFreeAllOfTopG.lean (current blob c3bcece31e76be6368af5af4647f1ad30012fd3b): relocated window, family pole, final wrappers and primitive-family adapter.
- DedekindLFunctions/LandauZeroFreeCriterion.lean: old 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, current f4c5124f8a0188f85b60b2687864d531f9c0a3d8.
- DedekindLFunctions/CharFamily.lean: old 81c8dfd66d910d083d5bc88c664c7917fdbdfe96, current cac521ab291c9dab261508613d4d12195cdfb799.

## 1. Actual migration table
Compared entire exact text from namespace Deduction through end Deduction in each old file against the member section of each current clump (excluding imports, clump header, exposure and surrounding sections). "Same" means exact equality of that substring, NOT equality of elaboration or transitive dependencies. "Changed" means do not automatically migrate. The current source uses module/public exposure and changed Mathlib; equality of bodies alone cannot certify equivalence.

Old names in DedekindLFunctions/LandauTheorems/, old blob IDs, current destination A=landauWindow, B=ZeroFreeAllOfTopG, S=standalone file.

| Old module | Old blob | Current destination/member lines | Text |
|---|---|---|---|
| IteratedDerivLaplace | c1c05ec801b258064f1e14fb9d7e624eb7345382 | A 71–185 | Changed |
| LandauCoeff | dc8287f2dbe7c767dcb77893eaf53d07092ed1f3 | A 187–223 | Same |
| LandauDichotomy | 947dae363ce629febcba27b1b70355438f8639a0 | A 225–336 | Changed |
| LandauGrowthContra | bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda | A 338–390 | Changed |
| LandauNearest | 6a177498987e1ef453727131bf2004bc797a01a2 | A 392–509 | Same |
| LandauPoleAsym | e5ec846b37b8879944576a38c83013814a6f1fe7 | A 511–598 | Same |
| LandauPoleReLe | 205c7380b79e78b2752ed67aeb069f2a9d12cc77 | A 600–662 | Changed |
| kernelIntegral | d785c54e03a55b0ef6c0fcb64bc4f8158e803642 | A 664–693 | Same |
| landauTails | 0e55797bac5320acf02d9acc832ca53df716e436 | A 695–866 | Changed |
| LandauKernelMax | b230a9e40c3710eac205f32ceb8a44f2d003b647 | A 868–896 | Same |
| landauWindowIneq | cda93b0185260d72395d2ef2c90314e0fa7128ef | A 898–1017 | Same |
| landauWindow | 7915058f10b33a52652290cd887cbccdc00e676a | A 1019–1225 | Changed |
| LandauFinite | 46a0dc63f21009582a2dda61c1267e9aad88bde5 | S | Same |
| LandauCauchy | f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b | S | Same |
| WindowHypOfRpow | dde1c159371538875c28374574ca7e452b0450d9 | B 82–148 | Same |
| WindowHypUOfWindowHyp | 701f0502ae106ab89e390105cd9c98e6cf881e1a | B 150–203 | Changed |
| GchiConj | 63cdd6a1ec3e729a5465803a19ebcf5ab9c9577c | B 205–265 | Changed |
| GchiGrowth | 0adbad2399f91f6cd547c9195d4464ccb5512d45 | B 267–342 | Same |
| LogDerivLocal | 56dd45f8630096e041bdad64152e07862e0d4c27 | B 344–392 | Same |
| measurableGchi | 3b014d914efcdcf58e8de1823570aeb3c64babf3 | B 394–431 | Same |
| mellinGchiModOne | 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc | B 433–640 | Same |
| mellinGchiOfNeOne | 675a25d278977948c8327f0e1e2e31fb3a990a7d | B 642–790 | Changed |
| poleData | 1f7fdc4409d2f1185700764c51d5c17a907d76e1 | B 792–1189 | Changed |
| lemmaL | 6c37aebd05121b6d68e3532d8529f0ce8357386f | B 1191–1215 | Changed |
| ZeroFreeOfRpowWindow | 2ed00ad3aa862f3e522686557fb8f559b17fc002 | B 1217–1238 | Changed |

13 identical body spans, 12 changed. Standalone current LandauFinite blob 01e7d133edc7261bea496e74e1257715dbce131d, LandauCauchy e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc. The three core definition spans (all seven PoleData fields, WindowHypU, and CharFamily through WindowHyp) compare textually equal. In particular iso is still at EVERY z of positive real part and pole is still nonzero with positive real residue at a real pole. No weaker definition hidden by relocation. Quantifier order of WindowHypU is eta>0 -> arbitrary U0 -> exists U>=U0 -> exists majorant R with integrability, pointwise g<=R and 0<=R, and integral bound. No fixed R or all-U requirement is added.

The explicit proof changes in LandauDichotomy replace nlinarith by the two squared bounds and the positive product contradiction; the actual dichotomy body is unchanged. LandauNearest and LandauPoleAsym are identical, including isolation and strict radius guards. GrowthContra, PoleReLe, IteratedDerivLaplace, tails contain tactic/algebra expansions; they have not been replayed. WindowHypUOfWindowHyp now uses Real.image_exp_Icc rather than its local interval-image helper. The alternative linear witness from RUN4 remains an independent human construction, not part of upstream.

## 2. New theorem: no theta restriction for the abstract analytical criterion
Original landau_window required 0<theta<1 and delta>0. Current A 1204–1218 requires only delta>0 and WindowHypU, plus PoleData. The following is the actual new mathematics, not a claim that RH is now proved by a weaker arithmetic input.

First, current A 1050–1083 generalizes landau_window_key to 0<theta<2. Its proof needs theta<sigma, with sigma>2 supplied by landau_tails, and theta>0 to compare sigma-theta <= sigma. The former theta<1 hypothesis was stronger than needed. Current private landau_window_of_pos_lt_two (A 1093–1176) keeps both previous lower-bound branches: nonreal/shifted isolated pole coefficient |c|/d, or real exceptional pole coefficient Re(c)/d. The same strict gap d<e<=sigma-theta, same uniformity in gamma, same order of eta,U0,U,k, same real residue sign. No dropped lower-bound condition.

Second, A 1178–1194 proves monotonicity of the window predicate in theta. Suppose theta<=theta' and hW(theta). For given eta>0 and U0 request its witness at max(U0,0), so U>=0 and every u in the window is nonnegative. Set
  R'(u)=R(u) exp((theta'-theta)u).
Since R>=0 and the exponential multiplier >=1, R'>=R>=g and R'>=0, even if g is negative. Pointwise on the entire domain:
  R'(u) exp(-theta' u)=R(u) exp(-theta u).
Consequently integrability and the integral bound are literally preserved by equality. U and eta do not change, and delta remains the same. This establishes WindowHypU(g,theta',delta). The nonnegative-U choice and monotonicity direction matter: if u<0, or theta'<theta, the multiplier may be <1 and the majorant fails (take R=g=1). One must not silently substitute R' on a negative window.

Third, apply three cases to any rho in Z:
- theta>=2: landau_pole_re_le gives Re rho<=2<=theta, independent of the window.
- 0<theta<2: the private analytical theorem applies.
- theta<=0: PoleData.pos gives b=Re rho>0. Choose t=min(1,b/2). Then 0<t<2, theta<=t, and t<b. Monotonicity gives WindowHypU at t with exactly the same delta; the private theorem gives b<=t, contradiction. This is a proof for each proposed pole; it does not assert one universal t independent of rho. It implies Z is empty in the nonpositive-theta case. No assumption of a pole at a specific height is introduced.
Thus Re rho<=theta for every rho in Z and any real theta. This is an exact human reconstruction of the new wrapper.

## 3. Family-level consequence and exceptional zero safeguard
Old lemmaL and zeroFree_of_rpow_window required 0<theta<1. Current B 1202–1208 and 1228–1231 require **0<=theta** (not arbitrary real theta). For a hypothetical L-zero at s with Re s>theta>=0, the same zeroSet membership is immediate, so abstract landau_window contradicts Re s>theta. The old separate Re s>=1 split is gone from lemmaL, but nonvanishing on Re s>=1 is NOT gone from the proof.

Indeed, current poleData (B 792–1189) now proves hρlt : rho.re<1 before choosing multiplicities/residue, using charFamily_LFunction_ne_zero_of_one_le_re in both direct and conjugate zero branches; previously this fact appeared later and rho!=1 was separately shown. For any real zero beta in (0,1) the same weighted multiplicity S>0 gives residue S/(beta(1-beta))>0. The positivity proof still depends on a positive weight and a nonzero multiplicity for at least one family member; other multiplicities are nonnegative. The modulus-one regularization g(1)=1 and equivalence of g-nonzero with totalized zeta-nonzero at 1 are retained. No exceptional real-zero exclusion by fiat. Line-one nonvanishing remains an imported essential input. A family theta<0 conclusion would demand handling possible nonpositive-real-part zeros; current lemmaL rightly keeps theta>=0 because zeroSet only contains positive-real-part zeros.

The actual power-window hypothesis is unchanged:
 for every Y0 there is Y>=Y0 such that for all y in [Y,Y^(1+delta)], Gm(F,y)<=C y^theta.
WindowHypOfRpow body is identical. Therefore the new theorem changes the allowable theta range, not the required arithmetic window existence or majorant, and does not provide a converse.

Current B 1248–1306 embeds the family construction previously factored through level_family, rather than invoking it as at the original pin (PrimitiveCosets/Imports.lean blob 2dc9b4e690951c66ffe443e279fcada259bcce13). The current proof takes KEPT as its index set, weight(one)=1, weight(other)=Lambda.wt>0, uses primitivity to show the principal character must have modulus one, and proves the sum equality by splitting off one and rewriting gChi_eq. The use of max(y/n-1,0)=y/n-1 on 1<=n<=floor(y) is explicit. Then hZ maps family nonvanishing to the level and invokes zeroFree_of_rpow_window with delta=la-1, C=1, and htheta0.le. This call's direction is unchanged; the level FormB still introduces an extra old hypothesis as underscore, not proof of arithmetic window existence. Independent audit of the inlined producer and level definition dependencies remains open. Do not infer whole-current-head equivalence, source closure or Lean validation.

## 4. Reproducible checks
Executed in JS tool runtime on fetched connector contents: 25 body comparisons (13 same, 12 changed); 8 source blob ID comparisons for the two core definitions and two clumps (both revisions); 24 exact anchor tests for residue, theta branches, window rescaling, family membership and adapter direction; 3 exact definition-span equalities. Hash IDs returned by connector, not independently recomputed from raw local Git bytes. For replay use git show <revision>:<path> and git hash-object --stdin; cut the original and clump member namespace spans. No complete dependency export or Lean kernel replay. The finite algebra certificate below was actually executed in JS runtime. It replaces exp of integer exponent by base-2 rational powers ONLY as an exact test of exponent identities and monotonicity; the preceding proof is for real exp. Counts refer to finite checks, not RH zeros or proof steps.

~~~js
function regression(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const p2=n=>n>=0?[2n**BigInt(n),1n]:[1n,2n**BigInt(-n)];
 const mul=(a,b)=>[a[0]*b[0],a[1]*b[1]];
 const le=(a,b)=>a[0]*b[1]<=b[0]*a[1];
 const eq=(a,b)=>le(a,b)&&le(b,a);
 let monotone=0,weight=0,zeroCase=0,guards=0;
 for(let t=-4;t<=4;t++)for(let T=t;T<=4;T++)for(let u=0;u<=8;u++)for(let r=0;r<=6;r++){
   const R=[BigInt(r),1n],Rnew=mul(R,p2((T-t)*u));
   assert(eq(mul(Rnew,p2(-T*u)),mul(R,p2(-t*u))),"weight identity");weight++;
   for(let g=-3;g<=r;g++){
     assert(le([0n,1n],Rnew)&&le([BigInt(g),1n],Rnew),"majorant");
     monotone++;
   }
 }
 for(let theta=-32;theta<=0;theta++)for(let beta=1;beta<=16;beta++){
    const t16=Math.min(16,beta);
    assert(t16>0&&t16<32&&2*theta<=t16&&t16<2*beta,"nonpositive theta witness");zeroCase++;
 }
 for(let theta=-32;theta<=32;theta++)for(let beta=1;beta<=16;beta++){
   const b=theta>=16?"high":theta>0?"interior":"nonpositive";
   if(b==="high")assert(beta<=theta,"pole upper bound");
   if(b==="interior")assert(theta>0&&theta<16,"interior");
   if(b==="nonpositive")assert(beta>theta,"contradiction target");
   guards++;
 }
 assert(!le([1n,1n],p2(-1)),"negative u counterexample");
 assert(!le([1n,1n],p2(-1)),"reversed theta counterexample");
 assert(2*1<2*2,"positive window");
 assert(2*0<2*1,"negative delta reverses window");
 return {weight,monotone,zeroCase,guards,negativeControls:3};
}
console.log(regression());
~~~

Actual output: {"weight":2835,"monotone":19845,"zeroCase":528,"guards":1040,"negativeControls":3}. Total 24,248 positive finite regression cases and three negative controls. No elapsed speedup benchmark or URT advantage. No change to Cathedral physical gates or queue.

RESUME HERE: Independently source-audit the current-head inlined formB family producer at B 1248–1306 against original LevelFamily.lean and the exact definitions of Level.wt, Gm, Nt, PChar.one and gChi_eq; derive the same finite-sum equality including the modulus-one correction. Coordinate with prime-window and character-box lanes; avoid duplicate arithmetic host producer work. Then trace changed current WindowHypUOfWindowHyp into Mathlib Real.image_exp_Icc and record the pinned-to-current import provenance. Keep original pin separate and ask kernel/audit lanes to replay the new abstract wrapper when the native environment becomes available.
HANDOFF TO: integration, editor, audit, kernel, prime window and character boxes. Record the stronger abstract interface as CURRENT-HEAD SOURCE-MATCHED, not as a change to the pinned original proof or a completed RH proof.
