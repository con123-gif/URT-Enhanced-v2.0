# RH human-readable reconstruction — edition 24, 25 November 2026
**INCOMPLETE.** User target 24 November missed. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream observed a18a350c3e5aad997766cff2670b292313e46574, unchanged from previous editor observation. Do not mix newer Claim.zeta/Mathlib with pinned Main. Previous full manuscript: [edition 23](2026-11-25_0556_INTEGRATED_MANUSCRIPT.md) (blob ccaa3b3776691ad524947d7d4a52324fcb3cdcf8). This is the compact core followed by a source-matched local analytic appendix and peer reference volume. Peer snapshot 49631f4b38f5681bb5e44adc9d43c64e1e7f3971; exact snapshot compare from ca285468ccee4322e55af4f09fe9f0d5a466f9b2. No physics changes.

## I. Core argument first — the shortest currently justified route

Pinned Main calls rhOfAll, allChi, everyCharacter, the seven-premise actual third-place theta/Green/TopG route, Comparison₂.formB, Deduction.zeroFree_of_rpow_window. The exact body-call trace and guards are in RUN24_ACTUAL_THIRD_PLACE_MAIN_LANDAU_ROUTE below. This is source-level, not independently established kernel reachability. Do not substitute the unrelated FockModels plugAll.

For a positive-weight character family F, if 0<theta<1, delta>0, and for every Y0 there is Y>=Y0 such that Gm(F,y)<=C*y^theta for ALL y in [Y,Y^(1+delta)], the pinned zeroFree_of_rpow_window excludes zeros in Re(s)>theta. This is precisely the quantifier order; C,delta are fixed for the chosen family and theta. Repeating for every theta>1/2 and using reflection gives RH for the trivial character. The actual source proves the stronger family statement via tied host scales; a principal-only simplification is a separate proposed route, not a deletion of the original proof.

The peer minimal cancellation certificate derives (Q*d/2)(G-4X)<=B+2Q/x, where Q=|TT| m b>0, d=|T2|/|H|>0, X=x^(1/2+eps), G=GmA-SigA and B is the exact subgroup average of ASK-MAIN (not an arbitrary mean). Consequently GmA<=SigA+4X+2B/(Q*d)+4/(x*d). The remaining inputs are the host/geometry/cohomology suppliers controlling B, the omitted-character term and the tied-window existence. The normalized envelope in that peer note retains d in its last term. The uF/log adapter is elementary; the Count5/quotient-slope comparison is not. The principal-character peer reduction removes CountIII (nontrivial odd-order character impossible in the 2-group host), not CountI/II/V, uniform Sha growth or geometry. No claim that the stronger GRH dependencies can be deleted.

### Independent simple target (not the native proof)

For x>=2 define the outer-shell discrepancy B_2(x)=sum_{x/2<n<=x}(Lambda(n)-1)(2-x/n). The peer OUTER_SHELL_TRANSFER proves the compact kernel multiplier has no zeros for Re(s)>0 and explains the human adaptation of landau_window. Thus an appropriate one-sided lower bound on arbitrarily distant power windows at every exponent theta>1/2 suffices for RH, not a proof of the bound. The exact prime-only version is
B_2=P_1+P_{>=2}-sum_{x/2<n<=x}(2-x/n),
where P_1 sums (log p)(2-x/p) over primes in the shell; P_{>=2} is nonnegative. A prime-only lower estimate for the same centered quantity suffices immediately, without any estimate of higher prime powers. Conversely the prime-power contribution is O(sqrt(x)): Chebyshev theta(t)<=c*t implies P_{>=2}<=c*(sqrt(x)+log_2(x)*x^(1/3))<=c*(1+6/(e*log 2))*sqrt(x), since max_{v>=0} v exp(-v/6)=6/e. This is a human elementary consequence of the peer shell reduction, not a new independent RH estimate. Main unsolved inequality: control the signed prime-only sum on these entire windows. Do not substitute numerical examples, random phases, or recursion for that bound. No further generic regroupings are needed.

## II. Native analytic appendix — regAtZero_of (one complete local derivation)

Fix N>=1, primitive chi, x1>1, T'>=2, H satisfying IsRegPart chi x1 T' H, hW:ZerosWindowWith Cw and hL:LocalLemma Cl. Let B=ZerosBelow chi T' (strict |Im rho|<T'), W=ZerosNear chi 0 (closed |Im rho|<=1), W0=ZerosBelow chi 1 (strict), m(rho)=analytic order of L at rho. All three have 0<Re rho<1 and L(rho)=0. W0 subset W subset B. B is finite: every rho belongs to the unit near-window at k=floor(Im rho), and floor(-T')<=k<=floor(T'); this is a finite union of the hW finite sets. None of their elements is zero, because Re rho>0. This includes real exceptional zeros with multiplicities, no zero-free conjecture used.

For sufficiently small positive real e<1/2, e belongs to the rectangle, is not 1, and is not a zero of L: the finite closed W excludes a neighborhood of zero; any zero at e would belong to W. Put S_A(e)=sum_{rho in A} m(rho)/(e-rho), Z_A=sum_{rho in A}m(rho)/rho. Both sums finite. The regular part identity and the local estimate have exactly the same pole and origin corrections eps0/e and del1/(e-1), so their subtraction yields the particularly short identity
  R(e) = logDeriv L(e)-S_W(e)-eps0/e+del1/(e-1)
       = H(e)+S_B(e)-S_W(e).
Then |R(e)|<=Cl log(2N) by hL. The source expands this equality into four triangle terms before taking a right-hand limit; the following equivalent condensed argument keeps the stronger intermediate information. H is continuous at zero relative to the rectangle (analyticOnNhd), and each term S_A(e) tends to -Z_A because rho !=0 and the set is finite. Therefore
  |H(0)-Z_B+Z_W| <= Cl log(2N).
In particular, |H(0)-Z_(B minus W)|<=Cl log(2N), using W subset B. No assumption on Re rho beyond the source critical strip. This local sharpening is a source-entailing human consequence, not a claimed new Lean theorem.

By the triangle inequality, |Z_B-H(0)|<=Cl log(2N)+|Z_W|. Split W into W0 and W minus W0; the latter consists EXACTLY of ordinates +/-1. Since |rho|>=|Im rho|=1 there and m>=0, its absolute reciprocal contribution is at most sum_W m<=Cw log(2N). The strict inner sum is S1(chi)=sum_{W0}m/|rho|. Thus
  |Z_B-H(0)| <= (Cw+Cl) log(2N)+S1(chi).
This is the original RegAtZero (Cw+Cl) with all quantifiers and source hypotheses intact. No assumption Cw,Cl>0 needed in regAtZero_of itself. The consuming Assemble theorem does choose positive witnesses.

### Exact consumer join
Assemble.lean calls shiftBound_of with hR=regAtZero_of hW hL and Cr=Cw+Cl. ShiftBoundOf.lean defines Z=Z_B, c=2*pi*i and obtains the equality
 vertInt-del1*u+zsum = (R+c*vertInt)/c+(Z-H(0))-eps0*log u-del1.
The sign of Z-H(0) is unchanged. The new origin estimate plugs into that term; shift constant remains Cs+Cw+Cl+3, with positive witness conditions as in Assemble. This joins the prior editor contour chapters without dropping S1 or the strict boundary at |Im rho|=1. Root reachability of this analytic appendix still requires exact role authentication. Audit request: verify the limit condensation, IsRegPart neighborhood continuity, strict versus closed windows and signs in the consuming identity.

### Exact source appendix
Upstream links all at 40e56bab026552e089d7afcfeff08d2defb9c005. Source blobs retrieved:
- [RegZero.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/RegZero.lean) 6521a14bf5839dbfb59a700636d0b9dbb8f459d0, regAtZero_of (full body).
- [GoodHeightExists.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean) bf78938cb8a467701a2bbd5a05a6675d3c2f6707, mult, eps0, del1, S1, rect, IsRegPart, LocalLemma, RegAtZero, ShiftBound.
- [ZerosWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ZerosWindow.lean) 4d3f895cac89f0b512bdd8f85f53989a8ef13486, ZerosNear, ZerosWindowWith.
- [ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ExplicitFormula.lean) 64cc5260677d2744ed2513e36c2df408e01aedab, ZerosBelow, ExplicitFormulaWith.
- [Assemble.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/Assemble.lean) df4bdcbcf581025792f60b8d849ef46ae0af16ff, explicitFormula_of_local.
- [ShiftBoundOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/ShiftBoundOf.lean) cb60fa7e9584e89907ea8ea5dfd0dfb89dcc2c7a, shiftBound_of, consumer identity.
- [ZeroFreeOfRpowWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean) 2ed00ad3aa862f3e522686557fb8f559b17fc002, core quantifiers.
- [landauWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean) 7915058f10b33a52652290cd887cbccdc00e676a, generic alternative route (not re-proved this run).

### Executed regression
Exact V8 BigInt Gaussian rational identities and quarter-grid window partitions; illustrative finite inputs only, not actual L-function zeros or Lean replay. Output {"cover":1581,"partition":459,"reciprocal":102,"identity":4743,"controls":3}. Reproduce by saving this code as .mjs and running node:
```js
const check=()=>{
  let cover=0,partition=0,reciprocal=0,identity=0,controls=0;
  const ok=b=>{if(!b)throw Error("regression failed")};
  // Exact complex rationals (a+ib)/d, d>0. Coordinates in quarters.
  const add=(u,v)=>[u[0]*v[2]+v[0]*u[2],u[1]*v[2]+v[1]*u[2],u[2]*v[2]];
  const neg=u=>[-u[0],-u[1],u[2]];
  const eq=(u,v)=>u[0]*v[2]===v[0]*u[2]&&u[1]*v[2]===v[1]*u[2];
  const inv=(a,b,m)=>[m*a,-m*b,a*a+b*b];
  const zero=[0n,0n,1n];
  for(let T=8;T<=24;T++)for(let x=1;x<=3;x++)for(let y=-T-2;y<=T+2;y++){
    const B=Math.abs(y)<T,W=Math.abs(y)<=4,S=Math.abs(y)<4;
    if(B){let k=Math.floor(y/4);ok(k>=Math.floor(-T/4)&&k<=Math.floor(T/4)&&Math.abs(y-4*k)<=4);cover++}
    if(W){ok(B);ok(S||Math.abs(y)===4);partition++}
    if(W&&!S){ok(x*x+y*y>=16);reciprocal++}
    if(!B)continue;
    const a=BigInt(x),b=BigInt(y),m=BigInt(1+(Math.abs(y)%3));
    const z=inv(a,b,4n*m); // m/rho
    const at0=inv(-a,-b,4n*m);
    ok(eq(add(z,at0),zero));identity++;
    // At epsilon=1/8, exact local subtraction, both possible window memberships.
    const atE=inv(1n-2n*a,-2n*b,8n*m),H=[3n,-2n,7n];
    const local=add(add(H,atE),W?neg(atE):zero);
    const combined=add(add(local,neg(H)),W?zero:neg(atE));
    ok(eq(combined,zero));identity++;
    const limit=add(add(H,at0),W?neg(at0):zero);
    ok(eq(limit,add(H,W?zero:neg(z))));identity++;
  }
  ok(Math.abs(4)<=4&&!(Math.abs(4)<4));controls++;
  ok(0*0+0*0===0);controls++; // origin division forbidden
  ok(Math.abs(4)<=4&&!(Math.abs(4)<4));controls++; // T'=1 cannot guarantee W subset B
  return {cover,partition,reciprocal,identity,controls};
};
console.log(check());
```
The algebraic proof above, not the grid, supplies the general implication. Coverage denominator one targeted native body regAtZero_of: 1/1 locally reconstructed conditional on its original inputs; no global proof percentage. Current CI checkpoint 425 general Cathedral PASS predates this note; no new CI verdict or Lean execution.

## III. Numbered remaining obligations
1. Actual Galois/RecT and principal dyadic host existence, uniform new Sha sectors (CountI/II/V and 2-primary bounds), CorG and all original host compatibility. CountIII eliminated only in principal specialization; original GRH proof retains it.
2. Seven actual third-place theta/Green/literature inputs, definite row, covolume, local closure and same witnesses, crystalline/Hodge and global-local suppliers when root-authenticated.
3. TopG/DesWin, native AdmFam, Count5, quotient-slope and HComp, weighted error budgets; the subgroup-average ASK-MAIN cancellation must still be bounded with exact uniformity. This is the central quantitative bottleneck.
4. Prime analytic inputs, explicit formula, zero density, growth, DiscFactor/DiscLog, all remaining contour/Perron suppliers and real zero exceptions. RegAtZero is now locally reconstructed, not a new upstream assumption.
5. Complete actual pinned root path, all family coverage, imprimitive transfer, Landau prerequisites and imported theorem citations. Keep alternative zeta-only shell route separate.
6. Full source/build/export correspondence and typed role reachability; independent kernel replay, axiom/sorry audit and independent mathematical review. No global coverage percentage: mixed exporter denominator 1,484,705, unique authenticated translated numerator unknown.
7. URT comparison only if testable with matched coverage and resources. No evidence that a recursion or symmetry alone proves the required prime cancellation.

## IV. Integration and handoff
Peer snapshot contains 14 newly added Markdown documents with the original pin explicitly present; reproduced verbatim in appendix, preserving their stated status and original blob IDs. This is source-pin concordance and content preservation, NOT independent theorem authentication. 1 exploratory Markdown documents lack the literal pin and are linked separately, not counted as authenticated chapters. All other newly added code evidence linked below. Current preflight read protocol, queue, expansion, AGENTS, manuscript spine, continuity, state/log/protocol excerpts, latest CI, prior editor and peer RESUME notes; external blueprint not reopened, source search for CorG returned no matches, exact CountI path not yet located. No fresh upstream build.

RESUME HERE: prioritize the current simplicity pivot. Obtain exact pinned CorG/CountI path from shared dependency or principal-host lane; then isolate the inequality that bounds new dyadic Sha sectors, or exact Count5/quotient-slope supplier if already assigned. Do not add alternative equivalent prime criteria without proving a quantitative input. Audit bot: regAtZero_of condensed limit and strict-boundary treatment, source-path reachability; core prime-only shell sign. HANDOFF TO formal audit, integration, math, Galois, geometry, dependency and editor. Full RH OPEN.

### Peer evidence links (not all code executed by editor)
- [audit/2026-11-25_0648_errX5at_coefficient_budget.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0648_errX5at_coefficient_budget.mjs)
- [dependencies/rh_arithmetic_reconcile.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_arithmetic_reconcile.py)
- [math/verify_uf_phi_envelope.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_uf_phi_envelope.py)
- [specialists/character_boxes/RUN24_PRINCIPAL_CHARACTER_SPECIALIZATION.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN24_PRINCIPAL_CHARACTER_SPECIALIZATION.mjs)
- [specialists/kernel_extractor/run24_res_eta_pow.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run24_res_eta_pow.mjs)
- [specialists/on_acceleration/run24_receipt.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run24_receipt.py)
- [structure/2026-11-25_0624_root_dominators.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0624_root_dominators.py)
- Exploratory unpinned: [math/2026-11-25_FRACTAL_DISCREPANCY_TEST.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/49631f4b38f5681bb5e44adc9d43c64e1e7f3971/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-25_FRACTAL_DISCREPANCY_TEST.md) blob 5207f16411f6686dfd5554465aa170f39dc55ef9

## V. Supporting peer chapters

<!-- BEGIN VERBATIM math/2026-11-25_DYADIC_SHA_DESCENT.md c7d1202897a59bce5152de537169c447a2316b3f -->
# Dyadic Sha descent — exact inherited/new-sector separation
25 November 2026. Human mathematical reduction, not a Lean replay or RH proof. Previous principal-host commit 26e90fe605409d7c9f966a7145db8b0c7849c980. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005: Formalism/GaloisCohomology/Statement.lean (0799e9bcd8aa191ffaa90ab005453a53381bacea), WindowBoundOfLiteratureLevel.lean (01c499108485b16d33791a9e46fbb1e2af865522), HVCore.lean (f4b900eb48df14f16eea03d08b7d9ef077f3d4a1), CohInp.lean (a5da0b85c6b7f82e88131ff19cfe732e1f912af1). Source defines Sha as kernel of localization in H1(G_{F,S},Q_l/Z_l(-j)), S precisely primes over l, for positive twist index j. Here j is distinct from tower index e. The source's actual VWin supplier uses four Count inputs plus Iwasawa/duality and lemmaK, not just descent; no assertion of source equivalence of this alternative route.

## Odd coefficient primes
Fix distinct admissible q,d and K_e=Q(zeta_{2^(e+2)})^+(sqrt(-q),sqrt(-d)). L=K_(e+1), F=K_e, [L:F]=2, M=Q_l/Z_l(-j) with cyclotomic action. Use compatible local choices; intrinsic Sha is the full absolute H1 subgroup unramified outside l and locally zero at l. This description follows from inflation-restriction for the unramified quotient (M unramified outside l), and agrees with the source kernel under the usual identification of Galois groups and localization. The source's independence of local choices has not been kernel-rechecked here.

For odd l, restriction H1(F,M)->H1(L,M)^Gal(L/F) is an isomorphism by Hochschild-Serre because all positive cohomology of a group of order 2 with l-primary coefficients vanishes (averaging). This holds at full absolute Galois level; do not assume L/F unramified outside l, since it may ramify at 2. At every finite place, restriction to a decomposition group over L, or to its inertia group, is injective on H1 from the corresponding group over F, by the same inflation-restriction argument for index at most 2. Hence the unramified and local-zero conditions descend and ascend, giving Sha(F,M) ≅ Sha(L,M)^+. Let chi be the quadratic character of L/F; twisting by chi makes the minus space the invariant space, and the same argument identifies it with Sha(F,M⊗chi) defined via absolute H1, inertia-zero outside l and local-zero at l. This is a twisted Selmer kernel, not necessarily the exact source untwisted coefficient module. P_±=(1±sigma)/2 are orthogonal complementary idempotents. Thus if lengths finite:
 length_l Sha(L,M)=length_l Sha(F,M)+length_l Sha(F,M⊗chi).
The same decomposition holds at the module level without assuming finiteness. By iterating for fixed q,d, inherited length cannot decrease, and the entire growth consists of new quadratic twist contributions. One may instead split the full abelian 2-group over a finite unramified coefficient extension containing its character values, giving a direct sum of twisted kernels over Q by the same averaging; base-change/length compatibility for the actual cohomology must be checked before using this in a numerical bound. No estimate of the new-sector lengths follows just from projectors.

## Coefficient prime 2
Now L/F ramifies only at 2, and the source unramified-outside-2 global Galois groups have index two. Hochschild-Serre gives kernel of restriction contained in H1(C2,M^{G_L}) and cokernel into invariants embedded in H2(C2,M^{G_L}). For positive j the cyclotomic image is open, so the invariants are finite cyclic 2-primary (possibly zero). For C2 on a cyclic group Z/2^k with involution a (a^2=1 mod 2^k), both H1=ker(1+a)/im(a-1) and H2=ker(a-1)/im(1+a) have size gcd(1+a,2^k)gcd(1-a,2^k)/2^k <=2: the valuations of a+1,a-1 have minimum 1 for odd a, except small k handled directly. Thus global restriction kernel/cokernel have length at most one. Local restriction at primes above 2 similarly has kernel length at most one. To restrict to Sha, a globally lifted invariant Sha class can fail the local-zero condition only inside those local restriction kernels. The obstruction map from global lifts into their direct sum bounds the additional cokernel by the number of primes over 2; quotienting by the global kernel does not enlarge it. Therefore ker(res on Sha) length <=1 and coker(res into Sha(L)^+) length <=1+#places_F(2).

For this actual principal host q=3 mod8,d=7 mod16. At 2, -q=5 mod8 gives the unramified quadratic extension Q2(sqrt(-q)), and -d=1 mod8 is a Q2 square. The real 2-power cyclotomic field has a totally ramified completion of degree 2^e at 2 (quotient of totally ramified cyclotomic extension). The local compositum has degree 2^(e+1) because the quadratic extension is unramified, whereas global degree is 2^(e+2). Hence exactly two primes over 2 at every tower level, and the restriction defects are bounded by kernel length 1, cokernel length 3. Conditional on finite lengths, -1 <= length_2 Sha(L)^+ - length_2 Sha(F) <=3. This controls only the invariant part, NOT all 2-primary growth; no division by 2 in Z_2.

## Executed finite controls
Local CPython: exhaust all 2x2 involutions over F_3,F_5,F_7 (14,32,58; total 104), check P± idempotence, orthogonality, reconstruction of every vector and product of sector sizes. Exhaust all involutive units modulo 2^k for k=1..12 (43 cases), compute cyclic H1/H2 sizes exactly using gcd, all <=2. These finite checks validate the algebraic skeleton, not the cohomology of actual number fields or the source's VVle. Analytic justification uses standard inflation-restriction and cyclic cohomology formulas; no Lean replay/CI run.
Reproduction:
```python
from itertools import product
from math import gcd
count=0
for p in [3,5,7]:
 I=(1,0,0,1); Z=(0,0,0,0)
 def mul(a,b):return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%p for i in range(2) for j in range(2))
 def mv(a,v):return tuple(sum(a[2*i+k]*v[k] for k in range(2))%p for i in range(2))
 for a in product(range(p),repeat=4):
  if mul(a,a)!=I:continue
  inv=pow(2,-1,p);P=tuple((x+y)*inv%p for x,y in zip(I,a));M=tuple((x-y)*inv%p for x,y in zip(I,a))
  assert mul(P,P)==P and mul(M,M)==M and mul(P,M)==Z
  vs=list(product(range(p),repeat=2))
  assert len({mv(P,v) for v in vs})*len({mv(M,v) for v in vs})==p*p
  assert all(tuple((u+w)%p for u,w in zip(mv(P,v),mv(M,v)))==v for v in vs)
  count+=1
assert count==104
checks=0
for k in range(1,13):
 n=2**k
 for a in range(1,n,2):
  if a*a%n!=1:continue
  assert gcd(1+a,n)*gcd(a-1,n)//n in (1,2)
  checks+=1
assert checks==43
```

## Remaining mathematical task
The source VVle needs the full sum over all coefficient primes and j<t, bounded by exp(x^eps/2) with t=floor(x^401), across chosen windows, universally in admissible local data. A per-level recursive formula with unknown new-sector lengths is not a growth bound. The q,d primes also change between windows, so no single fixed tower base suffices without uniformity. Next derive an arithmetic estimate for the twisted new sectors using the actual source CountI/II/III/V and Iwasawa input, identify whether the principal tower removes any such obligation, and retain the separate TopG arithmetic error supply. No claim of a new unconditional zero-free region or URT advantage. HANDOFF TO Galois, geometry, math, Landau, editor.

<!-- END VERBATIM math/2026-11-25_DYADIC_SHA_DESCENT.md -->


<!-- BEGIN VERBATIM math/2026-11-25_FACTORIAL_CANCELLATION_TEST.md ae22bce63e24573f863feca4a3d4e72a6c856184 -->
# RH minimal inequality — factorial cancellation and hidden-mode test
2026-11-25. User asks to prove outer-shell prime inequality, previous commit 596dc680cc04619e91a0d881f39d0cbb028e48f2. Result: exact unconditional arithmetic identity and rigorous limitation of a proposed inference, not proof of RH. Actual local CPython calculation below. Checked prior outer-shell note and pinned TopWin.lean/Supply.lean/SupplyChi.lean; full current peer ledger not audited in this turn. No physical gates changed.

## Actual prime identity
A(x)=sum_{n<=x}(Lambda(n)-1). For fixed integer q>=2 put c_q(j)=1-q*1_{q|j}, N=floor(x), D(x)=sum_{n<=x} floor(x/n). By divisor convolution sum_{d|n}Lambda(d)=log n and reordering:
E_q(x)=sum_{j<=x} c_q(j) A(x/j)
=log(N!)-q log(floor(x/q)!)-D(x)+qD(x/q).
Stirling gives first difference x log q+O_q(log(2x)); Dirichlet hyperbola gives D(x)-qD(x/q)=x log q+O_q(sqrt x). Consequently E_q(x)=O_q(sqrt x) unconditionally. At q=2 this is an exact alternating fractal cancellation, c_2(j)=(-1)^(j-1). It is a bound on the entire weighted sum, not on A or the outer-shell B_2.

## Why the direct inference fails
For z=1+2pi*i/log 2, eta(z)=(1-2^(1-z))*zeta(z)=0. Consider the explicitly nonprime control a(n)=c Re(n^z-(n-1)^z), 0^z=0, c=1/(2|z|), so 1+a(n)>=1/2 by integral bound on derivative of t^z. A_c(x)=c Re(floor(x)^z), and |A_c(x)-c Re(x^z)|<=c|z|. Split the alternating sum at M=floor(sqrt x). For j<=M replacing floor(x/j) with x/j costs O(M). Alternating summation by parts gives |sum_{j>M}(-1)^(j-1)j^(-z)|=O_z(M^(-1)), so eta(z)=0 implies the leading sum is O_z(x/M). For j>M pair consecutive terms; total variation of the floor argument is <= x/M, and a is bounded, so the tail is O_z(x/M). Thus E_2,c=O(sqrt x) although A_c(x) has order x. The exact outer-shell identity gives B_2,c(x)=A_c(x)-x integral_{x/2}^x A_c(t)/t^2 dt = c Re(x^z)+O(1), since integral_1^2 u^(-z)du=0. Along x=2^(k+1/2), B_2,c=-c x+O(1). This disproves any general implication from positivity of weights plus square-root alternating cancellation to square-root shell discrepancy. It is a control, not a counterexample to RH; PNT rules out this particular order-x mode for true primes.

More generally the same splitting works for fixed q, bounded partial sums of c_q, and hypothetical zeta zero rho with 1/2<beta=Re(rho)<1. The Dirichlet series sum c_q(j)j^(-rho) converges to (1-q^(1-rho))*zeta(rho)=0. Take A_c=c Re(floor(x)^rho), c chosen small enough for positive weights. The derivative bound for t>=1 is |rho|*t^(beta-1)<=|rho|, with separate n=1 increment; thus floor replacement costs O(sqrt x). The series tail costs O(x^beta M^(-beta)), and discrete variation on the tail is O((x/M)^beta) (use absolute derivative integral), both <= O(sqrt x). All fixed q square-root factorial-style bounds would be consistent with this hypothetical mode even though A_c=o(x). The earlier nonvanishing outer-shell Mellin multiplier gives B_2,c(x)=c Re(x^rho rho J_2(rho))+O(1) with nonzero rho J_2(rho), so it violates any global bound with exponent below beta. This conditional control identifies the exact common blind modes, not existence of off-line zeros. No conclusion about actual primes follows from it.

## Executed certificate
Local CPython NumPy sieve N=1,000,000 and independent factorial/hyperbola formula at x=1000,10000,100000,1000000: E_2 values .467261567851,10.640819060820,8.735799409401,4.047013063683; maximum absolute difference 6.997e-10. Nonprime control at x=floor(2^(k+.5)), k=8..18: minimum weights about .5 (roundoff), B/x approaches -.0548262183, E/sqrt(x) between -.0219141 and .0688176. Analytic proofs, not finite results, give the stated asymptotics. No CI or Lean execution.
```python
import numpy as np, math
N=1000000
p=np.ones(N+1,dtype=bool);p[:2]=False
for j in range(2,math.isqrt(N)+1):
 if p[j]:p[j*j::j]=False
lam=np.zeros(N+1)
for j in np.flatnonzero(p):
 k=int(j)
 while k<=N:
  lam[k]=math.log(int(j));k*=int(j)
A=np.r_[0.,np.cumsum(lam[1:]-1)]
D=lambda x:2*sum(x//k for k in range(1,math.isqrt(x)+1))-math.isqrt(x)**2
for x in [1000,10000,100000,1000000]:
 j=np.arange(1,x+1);e=np.sum(np.where(j%2,1.,-1.)*A[x//j]);f=math.lgamma(x+1)-2*math.lgamma(x//2+1)-D(x)+2*D(x//2)
 print(x,e,f,abs(e-f));assert abs(e-f)<1e-7
s=1+2j*math.pi/math.log(2);c=1/(2*abs(s))
for k in range(8,19):
 x=math.floor(2**(k+.5));n=np.arange(1,x+1,dtype=float);F=np.r_[0.,c*np.real(n**s)];a=np.diff(F);j=np.arange(1,x+1);e=np.sum(np.where(j%2,1.,-1.)*F[x//j]);lo=x//2;b=np.dot(a[lo:],2-x/n[lo:])
 print(x,np.min(1+a),e/math.sqrt(x),b/x)
```
## Source-native next route
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, TopWin.lean defines ChebyshevInequalityAtWindowScale with fixed eD,eL,epsilon1 and for every sufficiently small eps a tied family with windows. level_of_tiedWin consumes this one level, not all levels. SupplyChi.lean builds HostExW(3/2) for any psi given VWinAt psi 401. Investigate specializing to psi=PChar.one and constructing one native tied family directly; do not claim trivial host meets size constraints or assume source theorem proves the target without independent verification. No unconditional lower bound of required strength found. RESUME HERE: target actual tied-family existence for trivial character; avoid further generic fractal regrouping without arithmetic input.
<!-- END VERBATIM math/2026-11-25_FACTORIAL_CANCELLATION_TEST.md -->


<!-- BEGIN VERBATIM math/2026-11-25_MINIMAL_CANCELLATION_CERTIFICATE.md 73240028085ea95b6316d576f9387098220e0642 -->
# Minimal cancellation certificate — user-directed simplification
25 November 2026. Status: conditional human algebra, source-matched, NOT full RH proof or Lean replay.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Source route: Main -> rhOfAll -> allChi -> everyCharacter -> third-place theta/Green/TopG -> windowInequality_of_artinInputs -> core_gm / formB -> zeroFree_of_rpow_window. Source names are from actual fetched bodies, not a kernel dependency census. Keep newer Claim.zeta revision separate.

## 1. Exact mechanism: finite Fourier projection
ChBalance.lean, ch_balance: ASK - MAIN = De. For unramified p, character orthogonality selects the Frobenius power:
  (1/|Phi|) sum_chi conjugate(chi(g)) chi(i*frob(p)) = 2 1[g=i*frob(p)].
Ramified inertia averaging and exceptional primes are retained in HostFactsS; no arbitrary random-phase assumption.
ChCore.lean, CharacterBalanceMoves.sum_A, sum_Th: averaging over the subgroup A0 annihilates every character nontrivial on A0. This projects exactly onto PsiA(A0), not all characters, and explains the cancellation mechanism without invoking URT as an axiom.

## 2. Weaker sufficient hypothesis for the actual character-balance branch
Let Q=|TT| m b>0, d=|T2|/|H|>0, X=x^(1/2+eps), G=GmA-SigA, and B=(1/|A0|) sum_{u in A0} gapA(u).
Preserve all premises of ChCore.lean CharacterBalanceMoves.core except its pointwise hTop. Replace hTop: forall u, gapA(u)<=Err by B<=Err.
Proof: th_le and ch_balance imply for each u, sum_{t,j} Re Th(u,t)<=gapA(u)+2Q/x. Summing over u, dividing by |A0|, and using sum_Th gives (m b d/2) sum_t Re sum_{psi in PsiA} psi(e1 t) GPsi(psi,a(t)/b)<=B+2Q/x. The unchanged one_char estimate gives the sum over t >= |TT|(G-4X). Consequently
  (Q d/2)(G-4X) <= B + 2Q/x.
Thus:
  GmA <= SigA + 4X + 2B/(Q d) + 4/(x d).
This only requires controlling the actual subgroup average, not each translate separately. It is a direct generalization of the proof body (the earlier zeta-only branch already uses an average, so do not claim averaging itself as novel). To use a weighted mean supplied elsewhere, prove that it is the same subgroup average or a valid upper bound; no replacement by an unrelated mean. No assertion that the existing geometric construction automatically supplies this weaker bound.
gmA_eq transfers GmA to Level.Gm given native host compatibility. sigA_le bounds the discarded-character sum by 4*Level.o*X under EAtH, but an independent direct bound on the combined right side would suffice instead.

## 3. Exact normalized four-term error and balanced scale
For the SizeWindows hypotheses in GrowthBoundGivesRiemannHypothesis.lean and proposition_size_bound in LipschitzWeightAndMinimum.lean, write P=x^(C eps), n=|H|, nT=|TT|, nT2=|T2|. Divide the error bracket by Q:
  Err/Q <= P[(aE/(m b))(1+m^2/k) + 2(n/nT)m*x^eps + (nT2/nT)(k/n^2)*x^(2eps)].
Use aE<=2xb, k>=xm, n/nT<=2*x^(eps/8), k<=n^2*x^(1/2-eps). Keep d in the last term:
  Err/Q <= P[2x/m+2+4m*x^(9eps/8)+2d*x^(1/2+9eps/8)].
Combine with the average certificate:
  Level.Gm <= SigA + 4X + (2P/d)[2x/m+2+4m*x^(9eps/8)]
              + 4P*x^(1/2+9eps/8) + 4/(xd).
All denominators positive from native SizeWindows. No extra assumption eps<=1. The last term of the bracket loses no inverse-density factor after division.

If the host construction permits freely choosing m within its native size bounds, then A/m+Bm with A=2x, B=4*x^(9eps/8) is minimized at
  m_opt = (1/sqrt(2))*x^(1/2-9eps/16),
  minimum = 4*sqrt(2)*x^(1/2+9eps/16).
For fixed eps>0 the ratio m_opt/x^(1/2-eps) grows as x^(7eps/16)/sqrt(2); for sufficiently small fixed eps (e.g. 0<eps<1/2), integer rounding is asymptotically negligible and the optimum is within the native m interval at sufficiently large x. This does NOT establish freedom to choose m with valid host geometry, k, error windows or family coverage. If such freedom were proved and d>=x^(-eps), the leading normalized error exponent would be 1/2+(C+25/16)eps rather than the coarse 1/2+(C+21/8)eps. The source's actual bounds already suffice conditionally as eps tends to zero; optimization is a possible simplification, not necessary for RH.

## 4. Next mathematical task
Find a direct bound for the subgroup-averaged discrepancy B (or the combination with SigA) on arbitrarily large multiplicative windows, with fixed uniform exponent constants. Prove host/family coverage for a family containing the trivial character; RH alone does not require proving every Dirichlet L-function zero-free, though the existing source chooses that stronger goal. Check whether a single fixed native level already provides such windows without invoking TopG for all primitive characters. Do not assume it does; preserve quantifier order and uniformity in eps. A one-sided bound is sufficient by Landau; no need for an absolute prime discrepancy bound. No claim of a shorter unconditional proof, new theorem of RH, or URT speedup.

Sources fetched this turn: ChBalance.lean, ChCore.lean, ChTop.lean, CoreGm.lean, GmAEq.lean, SigALe.lean, LevelFamily.lean, WindowInequalityOfArtinInputs.lean, lemmaL.lean, landauWindow.lean, GrowthBoundGivesRiemannHypothesis.lean, LipschitzWeightAndMinimum.lean. Exact source paths in pinned upstream under DedekindLFunctions/LandauTheorems, PrimitiveCosets and Formalism/SizeWindowBrackets. Human derivation only; no Lean execution.

<!-- END VERBATIM math/2026-11-25_MINIMAL_CANCELLATION_CERTIFICATE.md -->


<!-- BEGIN VERBATIM math/2026-11-25_OUTER_SHELL_TRANSFER.md 8a3f0715f9f93cb9b3fe37867cb4724b47b0667f -->
# RH simplicity — exact outer-shell transfer and one-sided window criterion
25 November 2026. Status: human derivation, conditional RH reduction; actual finite calculation run in local CPython; no Lean replay or claim of unconditional RH or novelty. Resume prior 58e1c84e69703daf886f6b1764235c785f09d89f fractal shell and 057d61df7aaeecb3d64fec6fe11a3f94c05a8a39 centered discrepancy. Read AGENTS and current HANDOFF_QUEUE; no physics changes.

## Exact transfer
Let A(x)=sum_{n<=x}(Lambda(n)-1) (zero for 0<x<1), 1<r<=2, and B_r(x)=sum_{x/r<n<=x}(Lambda(n)-1)(2-x/n). The latter is exactly the outermost shell of the previously defined fractional-part kernel, since 1<=x/n<r<=2. Stieltjes integration by parts gives
 A(x)=B_r(x)+(2-r) A(x/r)+x int_{x/r}^x A(t)/t^2 dt.
No prime estimate is used. Divide by x^alpha, alpha>0, to get a positive transfer on A(x)/x^alpha with forcing B_r(x)/x^alpha and total mass
 q_alpha(r)=(2-r)r^(-alpha)+int_1^r u^(-alpha)du<1
 because (2-r)+(r-1)=1 and the weight u^(-alpha)<1 for u>1. For any X, negative-part weighted supremum M_X of A over 0<x<=X is finite and M_X<=N_X+q_alpha M_X, where N_X is corresponding negative-part supremum of B_r. Thus M_X<=N_X/(1-q_alpha); same with absolute values. This is a noncircular finite-interval resolvent bound, not an assumption of bounded A on the infinite interval. It does NOT bound B_r itself. q_alpha'(r)=-alpha*(2-r)r^(-alpha-1)<=0, so the best contraction in this restricted kernel class is r=2, not phi. At alpha=1/2, q_phi=0.8443224050289155, q_2=0.8284271247461903, q_(pi/e)=0.9354303377051861.

## Stronger result: the single outer shell suffices even on arbitrarily distant windows
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a, theorem Deduction.landau_window. This generic source theorem requires PoleData and WindowHypU; applying it to a different observable is a new human adaptation, not a claim that the source Main uses B_r or that it has been rechecked in Lean.

For Re(s)>1, by absolute convergence and the substitution x=nu,
 Phi_r(s)=int_1^infinity -B_r(x)x^(-s-1)dx
 = J_r(s)*(zeta(s)+zeta'(s)/zeta(s)),
 J_r(s)=int_1^r (2-u)u^(-s-1)du.
Endpoints of each n interval are immaterial to integration. J_r is entire by compact integration. Integration by parts gives
 s J_r(s)=1-(2-r)r^(-s)-int_1^r u^(-s)du.
For Re(s)>0, the modulus of the last two terms combined is strictly less than (2-r)+(r-1)=1. Therefore J_r(s) is nonzero everywhere in that half-plane. No zeta zero there can be canceled by the shell filter. At s=1 the simple poles of zeta and its log derivative cancel. At each zero rho of zeta with Re(rho)>0, Phi_r has simple pole with residue mult(rho)*J_r(rho), nonzero; zeros isolated. No positive real zeta zeros: Euler product for s>1, and zeta(s)=eta(s)/(1-2^(1-s)) for 0<s<1, eta(s)>0 by alternating terms. Thus the positive-real-pole residue condition in PoleData is vacuous. g(u)=-B_r(e^u) is measurable and |g(u)|<=e^u(u+1)<=e^(2u) for u>=0; its Laplace transform is Phi_r for Re(s)>2. These facts satisfy the human statement of PoleData.

For any fixed 0<theta<1, suppose there exist C>=0 and delta>0 such that for arbitrarily large Y,
 B_r(x)>=-C*x^theta throughout [Y,Y^(1+delta)].
Take U=log Y and R(u)=C*exp(theta*u) on [U,(1+delta)U]. The weighted integral is C*delta*U<=exp(eta*U) for every fixed eta>0 and sufficiently large U. This supplies WindowHypU with its exact quantifiers. The pinned generic landau_window implies Re(rho)<=theta for every positive-real-part zeta zero. If the premise holds for each theta=1/2+eps with 0<eps<1/2 (C,delta may depend on eps), the functional equation proves RH. Conversely RH gives the global bound |B_r(x)|=O(sqrt(x) log^2(2x)) by the classical RH Chebyshev estimate and integration by parts. This is an RH-equivalent single-shell target, NOT a solution or independent proof of the hard cancellation. No control of the smaller shells is needed. The one-sided window condition suffices directly via Landau; do not mistakenly use the finite-interval resolvent to extrapolate beyond a window.

## Local actual prime calculation
Sieve up to 5,000,000, 348,513 primes, all prime powers encoded; 1,400 integer sample points (401 log-spaced plus last 1000, with overlap). Double precision prefix sums and an independent direct sum at x=1000,100000,5000000. Observed:
r | q_(1/2) | min B/sqrt(x) | max B/sqrt(x) | max absolute transfer residual
pi/e | .9354303377051861 | -.9307234890264992 | .8469823010473181 | 3.8005652669426127e-7
phi | .8443224050289155 | -.5921375849552987 | .5816339046200288 | 4.883550968060035e-7
2 | .8284271247461903 | -.5892636921736972 | .6251048609734686 | 7.450187382573858e-7
A/sqrt(x) range [-.6035650061223717,.6082268566329456]. Direct-vs-prefix discrepancies <=2.42e-7. Floating roundoff, finite samples only, no asymptotic conclusion. CPython run exit 0; new CI not checked. Reproduce:
```python
import numpy as np, math
N=5_000_000
p=np.ones(N+1,dtype=bool);p[:2]=False
for i in range(2,math.isqrt(N)+1):
 if p[i]:p[i*i::i]=False
lam=np.zeros(N+1)
for prime in np.flatnonzero(p):
 j=int(prime);l=math.log(j)
 while j<=N:
  lam[j]=l;j*=int(prime)
d=lam[1:]-1
A=np.r_[0.,np.cumsum(d)]
W=np.r_[0.,np.cumsum(d/np.arange(1,N+1))]
n=np.arange(1,N,dtype=float)
I=np.r_[0.,np.cumsum(A[1:N]/(n*(n+1)))]
xs=np.unique(np.r_[np.geomspace(1000,N,401).astype(int),np.arange(N-999,N+1)])
print('N',N,'primes',np.count_nonzero(p),'samples',len(xs))
print('A/sqrt min max',np.min(A[xs]/np.sqrt(xs)),np.max(A[xs]/np.sqrt(xs)))
for r in [math.pi/math.e,(1+math.sqrt(5))/2,2.]:
 a=xs/r;k=np.floor(a).astype(int)
 B=2*(A[xs]-A[k])-xs*(W[xs]-W[k])
 integral=xs*(A[k]*(1/a-1/(k+1))+I[xs-1]-I[k])
 err=A[xs]-B-(2-r)*A[k]-integral
 q=(2-r)/math.sqrt(r)+2*(math.sqrt(r)-1)
 print('r',r,'gain',q,'B normalized range',np.min(B/np.sqrt(xs)),np.max(B/np.sqrt(xs)),'identity abs residual',np.max(abs(err)))
 for x in [1000,100000,N]:
  lo=math.floor(x/r); n=np.arange(lo+1,x+1)
  direct=np.sum(d[lo:x]*(2-x/n)); fast=2*(A[x]-A[lo])-x*(W[x]-W[lo]);print('direct',x,direct,fast,abs(direct-fast))
```
RESUME HERE: derive the lower bound for B_r on windows by independent arithmetic, ideally r=2 (optimal within the kernel class), compare actual prime power contribution versus primes alone and the native ASK-MAIN error supply. Do not count another equivalent restatement as completion. For this shell the contribution from higher prime powers is O(sqrt(x)) by Chebyshev's upper bound and summing over k>=2; hence only primes themselves require nontrivial one-sided cancellation. The full bound is not proven. HANDOFF TO RH math, landau, geometry, editor and audit lanes.

<!-- END VERBATIM math/2026-11-25_OUTER_SHELL_TRANSFER.md -->


<!-- BEGIN VERBATIM math/2026-11-25_PRINCIPAL_COUNT_REDUCTION.md 63525989852d5466f1818ef68c310ac17f697d06 -->
# Principal-character reduction of the native cohomology counts
25 Nov 2026. Status: source-matched human reduction, conditional, not RH proof. Continues principal host 26e90fe6 and dyadic Sha descent 9c7751fd. Source pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Examined Statement, WindowBoundOfLiteratureLevel, HVCore, JointWinOfCounts, CountI, Counts, Cases, CountZ, CountIV, CountVs, LayerLe, HostComp, HostOdd, HostIndex, BchiFacts, DirichletPrimeToLPartMulLPowerPart, SumOut, FinalLe, PointArith, PropZ, ZqField, TorsClass, LemmaK and Klen. The guessed SumIn.lean path returned 404; the actual theorem sumIn is in FinalLe.lean. Full current peer ledger and native kernel not audited.

## 1. Exact simplification
Use E for tower index, j for positive twist, l for odd coefficient prime. Set principal base chi=PChar.one, so h.q=h.o=1, N=2^(E+2) q1 d. Host.H and CRT give quotient C_(2^E) × C2 × C2, as earlier CRT certificate. Over a coefficient field containing its roots of unity, characters are (k,a,b) with k mod 2^E and a,b in {0,1}. The cyclotomic factor is real and each quadratic character is odd. Thus parity condition PsiEven j is a+b=j mod 2, and precisely 2^(E+1) characters have the required parity. Every character order is a power of two. These conclusions on orders and triviality also hold for source Coef without assuming all roots present, by hostComp.

CaseIII requires a NONTRIVIAL odd-order character. Impossible, identically, at principal base. Thus CountIII can be replaced by the empty-case proof (C=0) in the RH-only specialization of sumOut. Its entire supplier chain is not needed for this specialized mathematical estimate; no claim of deleting it from original Main kernel DAG.

For odd l, h.Big t and l in Bchi give l≠q1,d. hostOdd implies that if orderOf(chiP l psi) is odd then conductor(psi)|h.q=1, hence psi=1. Alternatively hostComp shows l-primary part is trivial, and comp l psi=1 when l not in N. Therefore CaseIV only occurs for psi=1, and only even j because of parity. The Oset in FinalLe.sumIn contains at most the single trivial character; at l=3 its CaseIV length vanishes by TorsClass.zOne (every even j divisible by 2), using Chr.V'_le_V as CountZ does. For other fixed exceptional primes, PropZ gives vanishing when l-1|2j (and j even, l>=5), but the remaining even twists are not disposed of by this argument. The original CountIV is already a transfer from LayerLe, not one of the four difficult counts. This removes a subset of that transfer in the principal case.

## 2. Exact depth threshold in CaseV
For odd l the l-primary character component is trivial. th1 is then the product of the two quadratic components, with order 1 or 2. Thus the source f0=ord_(lcm(4,orderOf(th1))) l=ord_4 l and n0=v2(l^f0-1). The exact threshold R1=16*l^2*4^n0 no longer depends on the character or tower level. Define c*(l)=ceil(log2 R1). CountV is required only for characters whose dyadic conductor exponent c2>=c*(l); CountVs handles c2<c*. For instance c*(3)=14,c*(5)=13,c*(7)=18. These are arithmetic values not fitted thresholds.

The real cyclotomic factor is generated by 5 modulo signs; for k≠0 its order is 2^(E-v2(k)) and its conductor is 2^(E-v2(k)+2). For k=0 conductor 1. Therefore at fixed l the number of low-depth characters remains bounded independently of E: if c*>=3 there are at most 2^(c*-3) cyclotomic characters with c2<c* (including trivial), times 2 parity-compatible quadratic choices. The high-depth CountV sector is not eliminated by this observation.

## 3. Residual actual quantitative target
The principal base leaves the nontrivial 2-power character sectors in CountI, CountII, CountV. CountI is not a bounded finite-prime check: for each j<t, it needs a uniform polynomial bound on sum over arbitrary finite sets of odd primes outside Bchi with l-1 not dividing 2j of log(l)*sum_{psi in X_j} normalized Vlen, plus finiteness. Source CountI proof obtains this from CorG (Galois/automorphic congruence bound). CountII is a smaller coefficient-prime range: outside Bchi its primes satisfy l-1|2j and hence l<=2j+1. The 2-primary Iwasawa/layer and separate TopG/ASK-MAIN bounds also remain. No recursion argument alone controls the new sectors. A direct proof of CountI for this explicit dyadic character family is the next priority, rather than translating CountIII or unrelated character families.

## 4. Actual finite checks
Executed V8: 8492 combined exact character-order/parity and valuation-threshold checks, plus 8188 conductor checks. E=2..10 for character enumeration, E=2..12 for conductor check, l=3,5,7,11,13,17,19,23,31,37,41,127,257 for threshold. All passed. These test finite arithmetic identities, NOT field cohomology or asymptotic estimates. Reproduce with JS:
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
function v2(n){let v=0n;while(n%2n===0n){n/=2n;v++}return Number(v)}
let checks=0;
for(let E=2;E<=10;E++){const n=2**E;let even=0,odd=0,triv=0;for(let k=0;k<n;k++)for(let a=0;a<2;a++)for(let b=0;b<2;b++){let ord=Math.max(n/gcd(k,n),a?2:1,b?2:1);if(ord%2===1){if(k||a||b)throw Error('odd');triv++}if((a+b)%2)odd++;else even++;checks++}if(even!==2*n||odd!==2*n||triv!==1)throw Error('count')}
for(const l of [3,5,7,11,13,17,19,23,31,37,41,127,257]){let f=l%4===1?1:2,n0=v2(BigInt(l)**BigInt(f)-1n),R=16n*BigInt(l)**2n*4n**BigInt(n0),c=0;while(2n**BigInt(c)<R)c++;for(let i=0;i<=c+2;i++){if((2n**BigInt(i)>=R)!==(i>=c))throw Error('threshold');checks++}}
if(checks!==8492)throw Error('checks');
let checked=0;for(let E=2;E<=12;E++){let n=2**E;for(let k=0;k<n;k++){let a=0,k1=k;while(k1&&k1%2===0){a++;k1/=2}let depth=k===0?0:E-a+2,min=0;if(k!==0){for(let c=2;c<=E+2;c++){if((k*2**(c-2))%n===0){min=c;break}}}if(depth!==min)throw Error('conductor');checked++}}if(checked!==8188)throw Error('checks');
No new Lean code, native kernel check, or CI run. No claim of new RH proof, mathematical novelty or URT speedup.
RESUME HERE: derive or source-audit the actual CorG inequality for principal 2-power character orbits, with bounded coefficient-prime sets not assumed. Check exact provenance of all remaining CountI prerequisites; no duplicate whole-library scan. HANDOFF TO math, Galois, geometry, audit and integration.

<!-- END VERBATIM math/2026-11-25_PRINCIPAL_COUNT_REDUCTION.md -->


<!-- BEGIN VERBATIM math/2026-11-25_SINGLE_DISCREPANCY_EQUATION.md baa5b5afb2dcd7d5c4523cbcb47683838ffa3c19 -->
# Single discrepancy equation: exact elementary reduction
25 Nov 2026. User direction: find the single equation. This is an unconditional elementary reduction of the zeta-only target, NOT a new proof of RH or a claim of novelty. Previous minimal cancellation certificate ae5afbdc0c31a1de4cf6f17ef2bb79f5bf13287d.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, CharFamily.lean defines G(x)=sum_{n<=x} Lambda(n)(x/n-1)-x log x+(1+gamma)x. LandauTheorems/ZeroFreeOfRpowWindow.lean applies to the singleton trivial character family (positive weight one, modulus one). No stronger GRH coverage claimed.

Define N=floor x, H_N=sum_{n<=N} 1/n, D(x)=sum_{n<=x} floor(x/n), and K_x(n)=1-{x/n}, with fractional part in [0,1). Then:
sum_{n<=x} Lambda(n) floor(x/n)=log(N!) by sum_{d|m} Lambda(d)=log m.
Hence G(x)=log(N!)-x log x+(1+gamma)x - sum Lambda(n) K_x(n).
The baseline sum K_x(n)=N-x H_N+D(x).
Exact single centered-discrepancy equation:
G(x)+sum_{n<=x}(Lambda(n)-1)K_x(n)
 = log(N!)-x log x+(1+gamma)x-N+x H_N-D(x).
This equality holds for every real x>=1. Stirling gives log(N!)=x log x-x+O(log(2x)); H_N=log x+gamma+O(1/x); the elementary Dirichlet hyperbola identity D(x)=2 sum_{n<=floor(sqrt x)} floor(x/n)-floor(sqrt x)^2 gives D(x)=x log x+(2gamma-1)x+O(sqrt x). Therefore the right side is O(sqrt x), uniformly for real x>=1. Equivalently G(x)=-sum (Lambda(n)-1)K_x(n)+O(sqrt x). This removes the entire deterministic linear main term and exhibits one centered arithmetic mismatch.

Sufficient target: for each 0<eps<1/2 there are C_eps>=0 and fixed delta_eps>0 such that arbitrarily large Y satisfy sum_{n<=x}(Lambda(n)-1)K_x(n) >= -C_eps*x^(1/2+eps) for every real x in [Y,Y^(1+delta_eps)]. Then the upstream singleton Landau criterion excludes zeros Re(s)>1/2+eps, and varying eps plus the functional equation yields RH. Constants need not be uniform in eps. Conversely a bound on G on those windows transfers to the centered sum. No estimate of the required lower bound has been proved here. Orthogonality, boundedness of K, or a uniform model alone does not establish cancellation of the centered Lambda weights. Finite numerical checks cannot establish this asymptotic inequality.

Source distinction: the source's own key_identity5 in Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean follows from Data.key_identity in Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean by log-product expansion and algebra; it cancels log normalization terms but does not by itself prove the error budget. The centered-discrepancy equation above is a separate elementary reduction for RH alone, not a claim that the actual all-character proof uses it. Standard factorial and hyperbola identities; human algebra only, no Lean replay. Next: derive a one-sided estimate of the centered sawtooth discrepancy without assuming RH, or explain exact structural obstruction.

<!-- END VERBATIM math/2026-11-25_SINGLE_DISCREPANCY_EQUATION.md -->


<!-- BEGIN VERBATIM math/2026-11-25_uf_phi_envelope.md 369781c81e8e0e8ba4a4c3fb1d96e5c68a870b0b -->
# MATH lane — the short `uF` and logarithmic envelope inside the window bound

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of pinned `u_function_le_mean` and `phi_bound`, including
their exact composition in `Ga_bound5`.  
**Status:** PARTIAL. This isolates an elementary adapter in the prime-window argument; it does not
prove the required window estimate, its eleven premises, RH, or any URT advantage.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `src/Formalism/RankGapBounds/MeanBoundSecondForm.lean` | `e4332fd8680d2b2f82e0a1e44a276453e03e2109` | definitions of `s`, `uF`, `HidaSetting`, `SlopeIneq`, `HHBound` and `Vvar` |
| `src/Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean` | `9172d2d30c5cec478b08c10a4b34e39fa16ab981` | elementary real inequality `phi_bound`, `K3`, and nonnegativity of `uF` |
| `src/Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean` | `f9f34a9147750e215a6b2f206eb6f9889aa726b6` | `Lo5`, the two quotient-slope inequalities, and the pointwise target |
| `src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean` | `e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef` | `Vvar_bound5`, `u_function_le_mean`, `Ga_bound5`, final assembly |
| `src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean` | `ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5` | local consumer of `each_unit_bound_statement` |

Fresh upstream HEAD on 25 November was `a18a350c3e5aad997766cff2670b292313e46574`.
Several corresponding files have changed or moved there. This reconstruction remains pinned to the
user-specified revision; no cross-revision equivalence or kernel claim is made.

## 1. Exact inputs and notation

Fix finite `U0`, nonempty finite fibres `W(u0)`, finite `Top`, naturals `m,f`, data `D`, constants
`C`, and real `Xpp`. Fix `u0:U0`. Define

    s = weighted_mean_d (muN(u)-h(u)),
    uF = max_u (muMaxN(u)-h(u)) - s.                    (1)

`HidaSetting` supplies strictly positive weights `d(u)`, `muN(u)<=muMaxN(u)`, positive `b`, and
the remaining sign conditions. Hence the weighted mean in (1) cannot exceed the maximum, so

    0 <= uF.                                             (2)

Write

    P+ = cSlope*nT*a*La,
    P- = cSlope*nT*a*La*(1+m/k),
    C0 = cSl1*m*B0,
    V  = Vvar,
    K3 = P+ + P- + V + C0.                              (3)

The equality in (3) is the source definition
`cSlope*nT*a*La*(2+m/k)+Vvar+cSl1*m*B0` expanded once.

## 2. Short derivation of the `uF` envelope

Set

    q(u) = -Ee(u)-h(u).                                  (4)

`Vvar_bound5`, derived from `EComp5`, `HComp` and the within-fibre `Count5` comparison, says

    q(u)-q(u') <= V                                      (5)

for every pair `u,u'` in the same fibre. The two `QuotientSlopeBoundsWith` inequalities and the
upper/lower `Slopes` bounds give

    muMaxN(u)-h(u) <= P+ + Ga+Fo+C0+q(u),                (6)
    muN(u')-h(u')   >= -P-+Ga+Fo+q(u')-Lo5(u').          (7)

Subtract (7) from (6), use (5), and cancel `Ga+Fo`. Exactly

    muMaxN(u)-h(u)-K3-Lo5(u') <= muN(u')-h(u').          (8)

No positivity of `Lo5` is used. Average (8) over `u'` with the positive weights `d(u')`:

    muMaxN(u)-h(u)-K3-weighted_mean_d(Lo5) <= s.         (9)

Now take the finite maximum over `u` and use (1). This proves the exact source conclusion

    uF <= K3 + weighted_mean_d(Lo5).                     (10)

The apparent complexity of `u_function_le_mean` is therefore one pairwise transport, one weighted
average and one finite maximum. The substantive inputs are (5)–(7); the supremum manipulation is
an adapter, not new cancellation.

## 3. The logarithmic `phi_bound`

The pinned general lemma takes real numbers `u,H,X,b,U` with

    0<=u, 0<H, H<=X*b, 0<b, 0<X, u<=U,                 (11)

and concludes

    u*log(1+H/u) <= log(1+X)*(U+b).                     (12)

Lean uses total division. If `u=0`, the left side is zero. Suppose `u>0`. Apply

    log z <= log A + z/A - 1                            (13)

to `z=1+H/u` and `A=1+X`. Multiplying by nonnegative `u` and simplifying gives

    u*log(1+H/u)
      <= u*log(1+X) - u*X/(1+X) + H/(1+X).              (14)

By (11), the first term is at most `U*log(1+X)`, the negative middle term may be discarded, and
`H/(1+X)<=b*X/(1+X)`. Finally

    X/(1+X) <= log(1+X),                                (15)

which is the source consequence of `log t <= t-1` applied at `t=(1+X)^-1`. Equations (14)–(15)
give (12). The difficult-looking logarithmic expression is controlled without a series expansion,
asymptotics or a tuned constant.

## 4. Exact application in `Ga_bound5`

The source substitutes

    u = uF,
    H = HH,
    X = x^cHH,
    b = D.b,
    U = K3 + weighted_mean_d(Lo5).                       (16)

Premise (2) supplies `u>=0`; `HHBound` supplies `0<HH<=x^cHH*b`; `HidaSetting` supplies `b>0`
and `x>0`; real powers give `x^cHH>0`; and (10) supplies `u<=U`. Hence

    uF*log(1+HH/uF)
      <= log(1+x^cHH)*(K3+weighted_mean_d(Lo5)+b).        (17)

`Ga_bound5` multiplies (17) by four, bounds the separate
`(eta+4*sqrt(e))*HH` term, and uses `del<=delBar<1` to enlarge the inverse factor. The preceding
`key_identity5` changes `K5v5` to `Main+K0v5`; it is independent of the logarithmic argument here.

## 5. What this simplifies—and what remains genuinely unresolved

This reconstruction compresses the `uF`/logarithm block to (5)–(17). It does **not** supply a new
square-root cancellation estimate. In particular, positivity alone does not prove the required
window bound. The non-adapter obligations are the actual source proofs of:

- the variation estimate behind (5), especially `HComp` and the within-fibre `Count5` bound;
- both quotient-slope comparisons (6)–(7);
- `SlopeIneq`, `HHBound`, `LossBounds`, and the arithmetic bound on the resulting error term.

Thus `phi_bound`, averaging and maximisation should not be treated as the hidden RH mechanism. The
shortest unresolved mathematical obstruction is upstream: obtain the quantitative `Count5` and
quotient-slope inputs uniformly for the character family strongly enough that the final error is
below the square-root-scale main window.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_uf_phi_envelope.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_uf_phi_envelope.py

The exact rational part enumerates deterministic three-point fibres, verifies every pairwise form
of (8), and then verifies (10) for positive weights. A 70-digit Decimal grid checks (12), including
the `u=0` branch. Negative controls remove `u<=U`, `H<=X*b`, and the variation bound separately.
These finite checks are regressions of the reconstructed skeleton, not universal proofs.

Observed output:

    uF/phi envelope regression: OK; report_checks=6, pairwise_bounds=129120,
    weighted_envelopes=15072, phi_grid=540, zero_branches=108,
    negative_controls=3

## Failed attempts / limitations

- Dropping `u<=U` makes (12) false; `u=100,H=X=b=1,U=0` is a counterexample.
- Dropping `H<=X*b` makes (12) false; `u=U=X=b=1,H=100` is a counterexample.
- Omitting the variation bound (5) breaks pairwise transport in (8).
- Positivity of the family weights does not itself supply (5)–(7) or a square-root window bound.
- Decimal checks supplement the exact human derivation; they are not exact real arithmetic or a
  Lean elaboration.
- No Lean, Lake or Elan executable was available locally. Imported premises and transitive axioms
  remain unaudited.

## RESUME HERE

Trace the pinned `PChain.lean` calls that construct `Count5` and `QuotientSlopeBoundsWith` for the
actual `ChTop` data. Classify each call as algebraic adapter or genuine cancellation/sign input, and
isolate the first single quantitative inequality that still carries the square-root window burden.
Do not expand unrelated manuscript branches.

**HANDOFF TO:** MATH, dependency, audit, integration, prime-window.

<!-- END VERBATIM math/2026-11-25_uf_phi_envelope.md -->


<!-- BEGIN VERBATIM specialists/galois_representations/RUN24_RATIONAL_SL_CLASS_FINITE_INDUCTION.md ca61ebd6d827f67b8f64aaba56def9364d3d34ac -->
# RUN24 — Rational SL class-number finiteness by strict span descent
2026-11-25. RESULT: DONE for source-matched local induction and dimension-drop reconstruction; PARTIAL for semisimple and block-image lifting suppliers and signed Main path. RH OPEN.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN23, state/log/protocol/continuity excerpts, CI summary (45559002341 at f6b396a, physical checks only). Inspected 35 recent swarm commit titles and theta, dependency, acceleration, integration, character-box and audit handoffs. No duplicate of this induction found in inspected records; not an exhaustive peer/blueprint reread. Pinned upstream P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=a18a350c3e5aad997766cff2670b292313e46574, merge dated 2026-11-25 05:32:50 UTC; compare API reports 269 ahead, 0 behind previous H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59. Do not mix revisions in a single proof. All paths below refer to leanprover-community/riemann-hypothesis, B=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/ and D=src/Development/AbelianVarietyTheory/Definitions/AdelicHermitianForms/.

Pinned source blob receipts (immutable source links are https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by the full path):
- D/AdelicPair.lean 0c2bf965c53c2f1dc4520963b11773d5ef32c9cd (definitions).
- B/FiniteAdelicDoubleCosetsOfRationalSLSubgroup.lean 2ca478eab0f6b4983edfdd9a425abdaeda94578b (cf_congr_of_vanI_eq, cf_of_isQGroup).
- B/FinrankSpanBlockDiagPartImageLt.lean a761f7aae4c20c1ec8c69cb129fa0ee5f2316068 (finrank_span_blk_image_lt).
- B/RatZariskiClosureOfAutStableSLGroup.lean e1dde3e3ec0a1e262292f36250018ead6f60818b (RatClosure.ratClosure and local lemmas).
- B/ExistsRatIdempotentBlockDiagPartKillsSpan.lean cc9d57e98214fea4e87f7a40e63e1001827075fe (exists_rat_idempotent_blk_eq_zero).
- B/IsAutStableSLMatrixGroupImageBlockDiagPart.lean 902e0ae69b89c861ac5e3945d6cee0abebeb8b42 (isPre_blk_image).
- B/InvariantSubspaceNotSemisimple.lean 60fdc9233cf5c7738c0c45a09958b17d07f01d8a (exists_socle_radical_of_not_ss).
- B/ExistsRatIdempotentOfAutStableSubspace.lean 14355e2ba315377af51fb168f674c19d26305895 (exists_rat_idempotent_of_stable).
- B/ClassFinitenessCompletelyReducibleStatement.lean 0dfd656bd8ecfac48c287d578b07c1aa0d981d18 → B/ClassFinitenessCompletelyReducible.lean 6d6bc03b5b22569786d3664c9a19d62669de4713 (cf_of_ss).
- B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImageStatement.lean 9bb6090507f88ad55a2a797bec2b1604bf6bd422 → B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImage.lean d46ebb292246f60de1dbbc423f51bbd8ae9c961e (cf_of_cf_blk_image).
H consolidates the induction, dimension, closure, idempotent modules in B/ClassNumberFiniteHolds.lean c071ac72a6eecf532e38403f87f2a064f495a44f. Direct old induction path 404. Exact clump delimiters used. IsAutStableSLMatrixGroupImageBlockDiagPart is listed in H directory but direct retrieval returned 404; H AdelicPair definition retrieval also 404. Do not infer changes to either.

## 1. Definitions and exact theorem
Fix a finite decidable index type iota and a set G of complex square matrices. vanI(G) consists of rational polynomials in matrix entries vanishing on every g in G. pts(G,S) for any commutative Q-algebra S is their common zero locus in matrices over S. IsPre(G) requires identity, multiplicative and adjugate closure, determinant one and invariance under ALL field automorphisms of C; this is not just complex conjugation. IsQGroup adds pts(G,C) subset G. SS(G) means every G-invariant complex subspace has a G-invariant complement. AdelicPair(R,R0) requires R a commutative Q-algebra, R0 a subring, rational numbers mapping into R0 to be integers, and for every positive natural M and r in R, a rational q and a in R0 with r=q_R+M a. No field, reducedness, or topology on R is assumed here.

CF(G,R,R0) means a finite set T of points of pts(G,R) such that each x in pts(G,R) equals gamma_R s u, with gamma in pts(G,Q), s in T, u in pts(G,R) and every entry of u in R0. The defining predicate does not require separately integral inverse entries; the determinant-one property supplies them via adjugates when needed. cf_of_isQGroup asserts CF for every IsQGroup G and every AdelicPair. This is not the special-linear class-number-one theorem; T may contain more than one element.

## 2. Source-matched induction
Fix the matrix index type and let n=dim_C span_C G. Strengthen the induction statement to quantify over ALL G and R,R0 with the prescribed n (necessary to apply the IH to a different group). Strong induction on n. If SS(G), invoke cf_of_ss with IsQGroup and AdelicPair unchanged. Otherwise:
1. exists_rat_idempotent_blk_eq_zero supplies rational e with e²=e, FgE=0 for every g in G where E=e_C and F=1-E, and a nonzero a in span G killed by L(x)=ExE+FxF.
2. isPre_blk_image supplies IsPre for B=L(G). It is essential that the block projection be multiplicative on the triangular subset, not on all matrices.
3. RatClosure.ratClosure supplies Q=pts(B,C) with IsQGroup(Q), vanI(Q)=vanI(B) and span Q=span B. Q is a rational polynomial closure of the block image, not assumed equal to B.
4. finrank_span_blk_image_lt proves dim span B < n. Consequently dim span Q < n. Strong IH on Q, the same R,R0 and the unchanged AdelicPair gives CF(Q,R,R0).
5. cf_congr_of_vanI_eq: equality of the defining rational polynomial sets implies pts(Q,S)=pts(B,S) for EVERY Q-algebra S by unfolding pts. Unfold CF, use S=R,Q (here Q in field notation means rationals), obtain CF(B,R,R0). No claim that all points of the abstract image are lifts.
6. cf_of_cf_blk_image lifts CF(B,R,R0) to CF(G,R,R0) using IsQGroup G, rational idempotence, upper-block condition and AdelicPair. This is a substantive arithmetic supplier, not implied by surjectivity or by strong induction alone.

## 3. Why the dimension strictly drops
Let S=span_C G. Multiplication by fixed E,F on both sides is C-linear; hence L(S)=span_C L(G). Restrict L to S: f:S→Mat_iota(C). The witness a belongs to ker f and is nonzero, so ker f has dimension at least one. The native code identifies range f=S.map L, proves ker f != bottom, obtains positive finrank and applies LinearMap.finrank_range_add_finrank_ker. Thus
    dim span L(G) = dim S - dim ker f <= dim S - 1.
The equality of complex spans under rational closure is indispensable; mere inclusion B⊆Q would not bound Q from above. In RatClosure.ratClosure, B⊆pts(B,C) and vanI_pts follow directly from definitions. The group properties of the closure are imported via pts_group, its automorphism stability uses rational coefficients, and its closedness follows from vanI_pts. For the span reverse inclusion, take any linear functional annihilating span B, write it as a degree-one complex polynomial using the matrix-unit basis, then apply evC_eq_zero_of_mem_pts_of_stable (in P through wrapper) to extend its vanishing from B to its rational closure. Finite-dimensional dual annihilator separation implies each closure point belongs to span B. Retain both imported suppliers; vanishing of a general complex polynomial on the rational closure is NOT automatic without the stated stability/descent hypothesis.

Additional elementary consequence: along the successive nonsemisimple induction calls, n drops by at least one, giving at most n initial nonsemisimple descents and n<=|iota|². This bounds the recursion depth, NOT proof search, bit complexity, computation time or the number of double cosets. The Lean argument is nonconstructive and uses deep suppliers. No URT improvement.

## 4. Origin of the killed vector and rational projector
Native exists_socle_radical_of_not_ss (inspected final declaration): the span algebra A=span_C G is finite-dimensional and hence Artinian. If its Jacobson radical J were zero, the Artinian semisimple ring theorem and ss_of_isSemisimpleRing would imply SS(G), contradiction. Nilpotence of J supplies a nonzero a in J with J a=0. Define W={v: Jv=0}. This is a subspace, G-stable because bg lies in J for b∈J,g∈G. It is stable under every complex field automorphism using the induced surjective automorphism of the span algebra and preservation of the Jacobson radical. Then aV⊆W by J a=0, and aW=0 because a∈J. The Artinian, nilpotence and semisimplicity facts are explicit dependencies, not independently reconstructed in this run.

exists_rat_idempotent_of_stable obtains W_Q={q∈Q^iota:q_C∈W}, chooses a rational complement, and projects onto W_Q. Rational span descent (galoisStable_submodule_le_span_rational) guarantees that W is spanned over C by such rational vectors. The complex extension E of the rational projector therefore has image W and fixes W pointwise. No G-invariant complement is assumed; indeed G is not SS. Hence FgE=0 by invariance, EaE=0 since aW=0, and FaF=0 since aV⊆W. Their sum L(a)=0. This proves precisely the rank-nullity witness; it does not assert L(g)=0 for any g in G (all are invertible).

For block image closure, with E²=E, F=1-E, EF=FE=0 and FgE=FhE=0, insert E+F between g,h. Then EghE=EgEhE, FghF=FgFhF and L(gh)=L(g)L(h). L(1)=1. Since g and adj(g) are in G, L(g)L(adj(g))=1. In a basis for im E⊕ker E, g is upper triangular by blocks, so det g=det L(g)=1; native proof instead uses determinant of 1+off-diagonal product and det_one_add_mul_comm, avoiding a basis choice. It follows L(adj(g))=adj(L(g)), using det one. Rationality of E ensures L commutes with all complex field automorphisms, yielding IsPre(B). This does not establish Zariski closedness of B, which is why step 3 is needed.

## 5. Actual source checks and replay
Executed connector retrieval and V8 namespace comparisons on four recovered P/H clump members: 8 matched declaration header prefixes (2+1+4+1), dimension-drop namespace exactly identical, and the entire induction namespace identical after exactly six wrapper-to-native replacements. Closure member has three changed lines (two direct suppliers and explicit map_add argument). Idempotent member has two changed lines (direct supplier names). Header-prefix check is textual, not elaborated equality. 11 changed lines across these four modules. Pinned fifth native block-image module inspected but H retrieval unavailable; not counted in comparisons. Both final arithmetic suppliers were actually fetched at P and inspected at their final declaration, not just guessed from wrappers. No Lean kernel execution; source regression only. CI status of unrelated physical checks is not evidence for this result.

Reproduce via Python 3 with local upstream checkout containing both revisions. Equivalent header and normalization comparisons executed in V8; this Python replay was not run here.
~~~python
import sys, subprocess, re
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/"
spec=[
("FiniteAdelicDoubleCosetsOfRationalSLSubgroup","2ca478eab0f6b4983edfdd9a425abdaeda94578b",2,6),
("FinrankSpanBlockDiagPartImageLt","a761f7aae4c20c1ec8c69cb129fa0ee5f2316068",1,0),
("RatZariskiClosureOfAutStableSLGroup","e1dde3e3ec0a1e262292f36250018ead6f60818b",4,3),
("ExistsRatIdempotentBlockDiagPartKillsSpan","cc9d57e98214fea4e87f7a40e63e1001827075fe",1,2)]
def git(*a): return subprocess.check_output(["git","-C",sys.argv[1],*a]).decode()
def read(ref,path,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
def ns(s): return s[s.index("namespace GlobalTheory"):s.rindex("end GlobalTheory")].strip()
def headers(s): return re.findall(r"^(?:private lemma|theorem) ([\s\S]*?) := by",s,re.M)
h=read(H,B+"ClassNumberFiniteHolds.lean","c071ac72a6eecf532e38403f87f2a064f495a44f")
repl={
"GlobalTheory.T.classFiniteness_completelyReducible":"_root_.GlobalTheory.ClassFin.cf_of_ss",
"GlobalTheory.T.exists_rat_idempotent_blockDiagPart_kills_span":"_root_.GlobalTheory.ClassFin.exists_rat_idempotent_blk_eq_zero",
"GlobalTheory.T.isAutStableSLMatrixGroup_image_blockDiagPart":"_root_.GlobalTheory.ClassFin.isPre_blk_image",
"GlobalTheory.T.ratZariskiClosure_of_autStable_SL_group":"_root_.GlobalTheory.ClassFin.RatClosure.ratClosure",
"GlobalTheory.T.finrank_span_blockDiagPart_image_lt":"_root_.GlobalTheory.ClassFin.finrank_span_blk_image_lt",
"GlobalTheory.T.hasFiniteAdelicDoubleCosets_of_blockDiagPart_image":"_root_.GlobalTheory.ClassFin.cf_of_cf_blk_image"}
for n,sha,num,diff in spec:
    a=ns(read(P,B+n+".lean",sha))
    m=B.removeprefix("src/").rstrip("/").replace("/",".")+"."+n
    b=ns(h.split("-- ===== clump member: "+m+" =====",1)[1].split("-- ===== end clump member: "+m+" =====",1)[0])
    assert headers(a)==headers(b) and len(headers(a))==num,n
    al,bl=a.splitlines(),b.splitlines()
    assert sum(x not in bl for x in al)==sum(x not in al for x in bl)==diff,n
    if not diff: assert a==b
    if n==spec[0][0]:
        for old,new in repl.items(): a=a.replace(old,new)
        assert a==b
print("8 header prefixes; 11 changed lines; induction equal after six substitutions")
~~~

## 6. Path and handoff
Direct source chain this run: cf_of_ss OR (rational idempotent → IsPre block image → rational closure + strict dimension descent → induction → vanI transfer → cf_of_cf_blk_image) → cf_of_isQGroup. Prior RUN23 connects to classFinite_integralLevel → classNumberFinite_holds; RUN21–22 to Borel classes_finite, RUN20 finite-dimensional forms, RUN17–19 spectral trace, RUN16 PlanEx, RUN15 Galois representation, local-global and EveryCharacter. This remains a candidate source-level route, not newly authenticated value-role reachability from Main. Request shared cached signed-root paths for GlobalTheory.ClassFin.cf_of_isQGroup, GlobalTheory.ClassFin.cf_of_ss, GlobalTheory.ClassFin.cf_of_cf_blk_image, classFinite_integralLevel, classNumberFinite_holds and TorLoc.exists_locus; do not duplicate full artifact scan. Current dependency RUN24 NEXT batch does not include these IDs.

RESUME HERE: reconstruct native B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImage.lean cf_of_cf_blk_image, specifically polynomial section over every Q-algebra, square-zero kernel, rational approximation with K2*Kc*K1 denominator control, and finite integral congruence refinement. Read complete proof including final factorization beyond currently inspected prefix. Preserve cf_of_ss (tensor stabilizer closed orbit, integral classes, special-linear class-number-one), rational descent, and closure group suppliers as outstanding. HANDOFF TO Galois, dependency, acceleration, kernel, editor, audit. RH OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN24_RATIONAL_SL_CLASS_FINITE_INDUCTION.md -->


<!-- BEGIN VERBATIM specialists/landau_criterion/RUN24_ACTUAL_THIRD_PLACE_MAIN_LANDAU_ROUTE.md 179e13b1efe93a798ae56ecc08ea6234158a361f -->
# RUN24 — Actual Main-to-Landau third-place route, not FockModels plugAll
2026-11-25. RESULT: SOURCE-MATCHED, exact missing source wiring recovered; kernel role-path authentication outstanding. No physics changes.

Preflight: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol excerpts; recent 35 commits and peer handoffs f6b396aa (dependency), bf2888a7 (acceleration), 1dc94581 (kernel), 8700f28d (theta), 07017df6 (editor), 88a2c851 (prime). General CI #423 PASS run 45556824120 at 06:14:38Z, predates this note, not RH validation. External blueprint not reopened; full archive not read. Prior RUN23 db8c71c8. No duplicate archive scan.

## 1. Critical correction and exact source-body call direction
P=40e56bab026552e089d7afcfeff08d2defb9c005. Main.riemannHypothesis calls rhOfAll, which applies Formalism.VW.rh_of_every to allChi. allChi is UpperTheory.FinalTheorems.everyCharacter, which calls everyCharacter_of_row with galoisLocalGlobalStrong_recParameter. That calls every_character_of_literature_of_vWin with the tuple of row/local RecT/row witnesses and vwin_of_row h. The literature wrapper supplies seven arguments: published_results_eigen O, published_results_first O, the two projections of theta_integrals_agree_and_local_matching_of_literature O, CovolumeBoundOfX from topCovolSlim2_use_alt_alt (all 15 original arguments retained at L812), local_langlands_gl_recT_exists_of_literature O, and hV.

The missing declaration is in ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean L69–73, not FockModels/EveryCharacterE.lean. The actual source-body caller-to-supplier chain is:
riemannHypothesis -> rhOfAll -> allChi -> UpperTheory.FinalTheorems.everyCharacter -> UpperTheory.FinalTheorems.everyCharacter_of_row -> UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin -> UpperTheory.Lit.every_character_of_theta_integrals_local_matching -> UpperTheory.Top.every_character_of_green_v_win -> UpperTheory.Top.zero_free_all_of_green_v_win -> UpperTheory.Top.zeroFreeAll_of_topG -> UpperTheory.Comparison₂.formB -> Deduction.zeroFree_of_rpow_window -> lemmaL.
These are named calls within actual proof bodies, not merely imports, and not independently extracted kernel edges. The branch of zeroFreeAll_of_topG calling level_gm_le_on_family_scales is RUN23's arithmetic side. Mathematical implication runs from suppliers to conclusions, opposite to the call arrows.

FockModels/EveryCharacterE.lean indeed contains everyE₂ calling plugAll, but this is a different proof body with S0.HypothesesUE, Hypotheses₂, CovolX, LocalLanglandsGL and Hyps/DRS rather than the actual third-place types. Its import does not show that its alternative proof is used by Main, nor that it is globally unreachable. Do not replace actual source types with those alternatives.

## 2. Human assembly, preserving the actual hypotheses
Let P₀=UnitaryGroupThirdPlaceHypotheses, F₀=ThetaLocalInputs, A=ThetaIntegralsAgree, M=LocalMatching, X=CovolumeBoundOfX, L=RecTExists, V=VWin. These seven premises are retained. N(C) means Closed C (fun Fm _ => LinkN Fm), D=DefiniteSideCondition. S0.NL is used as N by source typing (no independent definitional-equality replay). Green follows from P₀.greenRegularCharacters via green_of_regular. For each real cDep, boundAtTwoThree_linked_of_recT P₀.nLink (parametersOfDependence L cDep) supplies linked slot norm condition on closed BoundAtTwoThreeFamilyFonAlt. At23OfAll L19–26 uses at23_family_alt with nonnegative two/three constants and three_ne_q, then LinkedAt.of_row (Row.of_sel using closed_of_all). Do not exchange universal cDep quantification with family existence.

The actual nonempty_hyps_definite_side_of_closed_bound construction (L44–68) supplies Nonempty(HypsAlt S0.NL D):
1. C=P₀.litN. FunctionalsSeparate from F₀, howeUnram_holds and P₀.siegelWeilUnitaryConvergent. RowRat via test_vector_assembly_holds with F₀.siegelSetUnitary, F₀.howeDualityReal, P₀.greenCuspidal, F₀, C.join, C.fe, A, M, hS. ConstantFunctionFits via fourier_coefficient_fit_of_join_alt and second projection of ontoX_and_lamLow_of_unitaryGroupHypotheses'.
2. evaluation_grid_of_join supplies CF1 with eventual EvLgG, using the same join, A/M, twisted Weil convergence, local-factor matching, square-theta integral equality and hS. rowFun_at_gridA_alt supplies CF0 with eventual functional condition using discreteSeriesCover, harishChandraModules, cuspRapidDecay, casselmanWallach, rayClassFieldSt and fit. Choose c=max(CF0,CF1). It dominates both, even for negative thresholds. Apply hCF1 with le_max_right and hCF0 with le_max_left at the SAME c. This synchronizes the witnesses without identifying the two thresholds.
3. Obtain OpenParameterStatements at parametersOfDependence L c. Use open_and_linked_of_stronger_extension_alt with extensionWithList, extensionWithAtProperty of extensionWithOrigin and GridA c, SExt.none, geoCl anyGeometry and the stated projection witness. Its second projection transports openness; then hCF0 supplies linked FunctionalCondition, and linked_bundles_l3_of_open_alt supplies linked CovolumeBoundThirdPlaceSeries from X and open extension, with same extension. Preserve distinct projections x.1.1, x.1, x.1.1.1 respectively.
4. Apply hypotheses_nonempty_of_unramified_exponents_alt with P₀, RowRat, L,c,GridA c,EvLgG,hN(c),hFun,hL3. Its source L41–61 constructs large_unramified_exponent_bundles_exist_alt, third-layer series/prime data, onto/low, open0, GalC.final_alt_alt row, extends openness and linked row via hmono.1, obtains allRows_of_open0_alt, then nonempty_hyps_of_allRows_alt with literature thinness, Wu decay, row finite dimension, positive row types, Siegel-Weil row bounds, mass/volume and genus mass, KPx, membership and existence. These named suppliers remain independent proof obligations.

Unpack Nonempty once inside a Prop-valued elimination. shape_closed_link_n_of_green gives TopShapeAlt True True N TopG. forall_goal_of_shape_of_hyps applies goal_of_shape_of_hyps to this shape, two proofs of True and the HypsAlt witness. ShapeOf L24–32 transports family, raw selections, spectral/base/height/column/bundle selections, row hypotheses, division row equivalence, definite row package (w1,covol,onto,lamLow,seeIso,miStar,fun0,pass,kap) with paired d, served equivalence, point/twist and period conditions, h.nRest, positivity, rank and mass hypotheses. Do not replace HypsAlt by bare family existence or discard definite row condition.

TopShape L33–55 establishes TopG by constructing closed GL/bridge kernel, single-map, twist/admissible, Wu-decay and division links, restricting design-existence to the family A∩G.cls(la) with hsub, then calling topDesWin with 2,3,2,0 and all links. Closed LinkN premise nRest enters at L53; Green enters closed_linkIRR_of_join_count at L54. Neither follows from zero exclusion.

For each primitive ψ, V ψ supplies supplyChi ψ (V ψ) for HostExW(3/2,GChi ψ.req). Since 3/2>1, zeroFreeAll_of_topG applies to TopG and entire family of hosts. RUN23 retains positive weights and exceptional real zeros, θ in (0,1), δ=1/2>0 and C=1, no global pointwise estimate assumed. imprimitive then yields EveryCharacter with guard χ≠1 or s≠1. RH follows via rh_of_every at P. This closes source wiring only, not imported premises or RH.

## 3. Upstream changes
H=a18a350c3e5aad997766cff2670b292313e46574 (latest observed 25 Nov; compare against RUN23 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 reported 269 ahead, file list capped at 300). Main now calls Claim.zeta LFunction_ne_zero_of_half_lt_re, which calls everyCharacter; old Supplements/Kernels/MainTheorems.lean returns 404 at H. MainConclusion now supplies row and RecT separately; literature wrapper no longer takes OpenLiteratureStatements O. Same theta/Green/TopG/Landau named call chain remains visible in H clumps. H TopPlug uses goal_of_shape_of_hyps directly, not forall wrapper; extension call signatures omit geoCl anyGeometry. H analytic θ≥0, still δ>0. P Mathlib 0df444a360eaa60ab8c11dca51a86af692955474 (lake-manifest blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f); H Mathlib 31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d). H Landau clump unchanged from RUN23 H by blob. Selective comparison only, not global equivalence or kernel recheck.

## 4. Actual execution and reproducible certificate
Executed via GitHub fetches and V8 assertions: 20 exact Git blob SHA checks, 55 line anchor assertions, three route-discrimination checks (P theta body calls green route not plugAll/everyE₂; FockModels really calls plugAll; H TopPlug direct adapter not forall), 10,201 integer common-threshold cases (CF0,CF1=-50..50). All completed successfully, before a tool-call budget interrupted the first attempted write. Finite threshold checks supplement the general max argument, not mathematical evidence of RH. No native Lean executed.

Below is a compact Python replay of the same assertions; run in upstream checkout containing both revisions. P/H are the exact pins above. This replay script was not executed in Python; equivalent assertions executed in V8.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
C="src/Development/AutomorphicArithmetic/CharacterBoxes/"
F="src/Development/AutomorphicArithmetic/PrimitiveCosets/"
rows=[
(P,"src/Main.lean","dbd5db70bc11b35f18fa5751216ab335321e7bfc",[(4,":= rhOfAll")]),
(P,"src/Supplements/Kernels/MainTheorems.lean","6a542d7ce969a791fd12ce575f587e6bc29044bf",[(7,":= UpperTheory.FinalTheorems.everyCharacter"),(9,"rh_of_every allChi")]),
(P,C+"MainConclusion.lean","ee340012ab19713a8acfecf8adc6a331cbc2f1a4",[(8,"every_character_of_literature_of_vWin"),(11,"everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter")]),
(P,B+"EveryCharacterOfLiteratureOfVWin.lean","a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",[(810,"theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"),(811,"every_character_of_theta_integrals_local_matching"),(813,"local_langlands_gl_recT_exists_of_literature O) hV")]),
(P,B+"SiegelEisensteinSecondTermHypotheses.lean","42abe20ee235820aaa924dbabce5e1d2c2540380",[(44,"nonempty_hyps_definite_side_of_closed_bound"),(57,"max CF0 CF1"),(63,"le_max_left"),(68,"hypotheses_nonempty_of_unramified_exponents_alt"),(69,"every_character_of_theta_integrals_local_matching"),(72,"every_character_of_green_v_win"),(73,"boundAtTwoThree_linked_of_recT")]),
(P,B+"TopPlug.lean","c51cb6b5bd4bf2944ace89e00a2990da16bd519a",[(14,"zeroFreeAll_of_topG (la := 3 / 2)"),(15,"forall_goal_of_shape_of_hyps"),(18,"imprimitive (_root_.UpperTheory.Top.zero_free_all_of_green_v_win")]),
(P,B+"ShapeOf.lean","236d0eadd60b292bd0a832114f8c4a6253131250",[(24,"goal_of_shape_of_hyps"),(29,"a.w1, a.covol, a.onto, a.lamLow"),(30,"h.nRest"),(32,"goal_of_shape_of_hyps V NR N G")]),
(P,B+"TopShape.lean","3f791ca182db235c4a8ff582d3f038019320d5cd",[(33,"TopShapeAlt True True"),(50,"designExists_of_tuSize_aux4n_litThin"),(52,"topDesWin"),(54,"closed_linkIRR_of_join_count hGreen")]),
(P,B+"At23OfAll.lean","e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d",[(23,"LinkedAt.of_row"),(26,"at23_family_alt hP Fm")]),
(P,B+"HypothesesNonemptyOfUnramifiedExponents.lean","c0ce994aa86f737b707b5617fb10bcfb35c0117e",[(43,"large_unramified_exponent_bundles_exist_alt"),(47,"final_alt_alt"),(53,"hNrow"),(54,"allRows_of_open0_alt"),(57,"nonempty_hyps_of_allRows_alt")]),
(P,C+"ZeroFreeAllOfTopG.lean","54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",[(26,"(h : TopG)"),(29,"UpperTheory.Comparison₂.formB")]),
(P,F+"Imports.lean","2dc9b4e690951c66ffe443e279fcada259bcce13",[(13,"zeroFree_of_rpow_window F (δ := la - 1) (C := 1)")]),
(P,"src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean","2ed00ad3aa862f3e522686557fb8f559b17fc002",[(11,"(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)"),(14,"lemmaL F hθ hθ1 hδ")]),
(P,"src/Development/AutomorphicArithmetic/ThetaCorrespondence/FockModels/EveryCharacterE.lean","01e60174b728fc6b473a308c5bf5dbffbe017afe",[]),
(H,"src/Main.lean","eb95ca808793dd61984cc853ab5630f54a74490c",[(10,"UpperTheory.FinalTheorems.everyCharacter"),(13,"Claim.zeta LFunction_ne_zero_of_half_lt_re")]),
(H,C+"MainConclusion.lean","06c2154a1813ba89d1e48f940fb0a9a93dc9f681",[(959,"every_character_of_literature_of_vWin"),(964,"everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter")]),
(H,B+"EveryCharacterOfLiteratureOfVWin.lean","852713a42c96f09d7cec0365759d03ed852a36ad",[(1452,"hLiteratureRow"),(1454,"every_character_of_theta_integrals_local_matching"),(1458,"hLiteratureRecT hV")]),
(H,B+"SiegelEisensteinSecondTermHypotheses.lean","f03041ec7671e421087cc1ede2b573a9c7b694cf",[(1946,"max CF0 CF1"),(1957,"hypotheses_nonempty_of_unramified_exponents_alt"),(1961,"every_character_of_green_v_win"),(1962,"nonempty_hyps_definite_side_of_closed_bound")]),
(H,B+"TopPlug.lean","b4bdd73c31e85e428c602cef693ffc1240547186",[(1317,"zeroFreeAll_of_topG (la := 3 / 2)"),(1318,"goal_of_shape_of_hyps"),(1321,"imprimitive (_root_.UpperTheory.Top.zero_free_all_of_green_v_win")]),
(H,C+"ZeroFreeAllOfTopG.lean","c3bcece31e76be6368af5af4647f1ad30012fd3b",[(1228,"(hθ : 0 ≤ θ)"),(1300,"Deduction.zeroFree_of_rpow_window"),(1339,"UpperTheory.Comparison₂.formB")])]
def git(*args): return subprocess.check_output(["git",*args]).decode("utf-8")
n=0
for rev,path,sha,anchors in rows:
    assert git("rev-parse",rev+":"+path).strip()==sha
    lines=git("show",rev+":"+path).split("\n")
    for i,s in anchors:
        assert s in lines[i-1], (path,i,s)
        n+=1
def body(rev,suffix,a,b):
    path=next(row[1] for row in rows if row[0]==rev and row[1].endswith(suffix))
    return "\n".join(git("show",rev+":"+path).split("\n")[a-1:b])
p=body(P,"SiegelEisensteinSecondTermHypotheses.lean",69,73)
assert "every_character_of_green_v_win" in p and "plugAll" not in p and "everyE₂" not in p
assert "plugAll (GlobalTheory.GreenBridge.green_of_regular P.greenRegularCharacters)" in body(P,"FockModels/EveryCharacterE.lean",1,1000)
h=body(H,"TopPlug.lean",1315,1321)
assert "goal_of_shape_of_hyps" in h and "forall_goal_of_shape_of_hyps" not in h
count=0
for a in range(-50,51):
    for b in range(-50,51):
        assert max(a,b)>=a and max(a,b)>=b
        count+=1
print(len(rows),n,3,count)
```

## RESUME HERE
Dependency/acceleration/kernel: use one shared authenticated manifest lookup and targeted value-role extraction of UpperTheory.Lit.every_character_of_theta_integrals_local_matching, UpperTheory.Top.every_character_of_green_v_win, UpperTheory.Top.zero_free_all_of_green_v_win, UpperTheory.Top.zeroFreeAll_of_topG, UpperTheory.Comparison₂.formB, Deduction.zeroFree_of_rpow_window, UpperTheory.Top.shape_closed_link_n_of_green, GlobalTheory.Fc.goal_of_shape_of_hyps. Do not target plugAll as assumed Main edge; no duplicate full archive scan. Next reconstruct topDesWin's closed-family link transport from shape_closed_link_n_of_green, coordinating with prime/audit and shape specialists; use role paths when returned. HANDOFF TO dependencies, kernel, acceleration, theta, prime, audit, integration, editor. Full RH OPEN, no kernel validation, no URT improvement claimed.

<!-- END VERBATIM specialists/landau_criterion/RUN24_ACTUAL_THIRD_PLACE_MAIN_LANDAU_ROUTE.md -->


<!-- BEGIN VERBATIM specialists/literature_provenance/RUN24_PD_COMPOSITION_AND_AUGMENTATION.md 19fa38235fa59f4ae09a63ef1f519969794ed9e1 -->
# RUN24 — divided-power composition and augmentation: integral mechanism
2026-11-25. SOURCE-MATCHED local reconstruction, not authenticated Main coverage or Lean replay. Continues RUN23 28b8abb1a8973ff2021cc67ceae5675687827c99. No physics.
Preflight: read AGENTS, swarm protocol, handoff, expansion, research state/log/protocol/continuity excerpts and CI checkpoint 424 (06:33:58 UTC, Cathedral only); checked 25 recent swarm commit titles and peer patches/available handoffs (math, windows, Galois, theta, Landau, structure, prime, kernel, dependency, acceleration, editor, integration, geometry, audit). Some peer patches omitted handoff text; not full peer/archive read. Read simplicity pivot 9b65ce25b63bab2e8fb52b8b6657ea624cb9ecfc: prioritize core mechanism; no duplicate task found. Acceleration RUN24 has manifest IDs for crystallineDeRham 11224217 and rigid_of_free_of_crystallineDeRham 11221518, not a certified value-role path. Do not count this branch as Main coverage until received. External blueprint not reopened.

## Source ledger
P=40e56bab026552e089d7afcfeff08d2defb9c005, H=a18a350c3e5aad997766cff2670b292313e46574 (latest observed commit, PR 2164, 05:32:50 UTC; same as RUN23).
B=src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/
D=src/Development/AbelianVarietyTheory/
P blob receipts:
- C=B/ChooseFac.lean 05adcf8e8f0c484dd31fe81802f1dfe3bc81ecba
- A=B/CompAdd.lean 936b1c3eeb75a0df175bd90806ecebf070c1d7a4
- S=B/DpSplit.lean a065290b42d85e2006991a972ee4194ad8a7fc34
- W=B/DpOfPre.lean 316bb13ce30509e7dbde8613c4dd0f3c6f542143
- G=B/PreOfGens.lean 6883cbdd1c6120521402223fdcf611d9616645c8
- L=B/ExistsLiftAndAug.lean 90f0cf00d5920ea40bc1a2e215d41386ec44e2e7
- E=B/ExistsDividedPowersAug.lean 948cc401ffbac3e205d500bc6f5a4ee03d985638
- R=D/Definitions/Divisors/RatBasisLinearIndependentInt.lean 618acf903e44a0da9cab93d35660599eb41fee46

## 1. Short mechanism
All these constructions are algebraic transport, not a quantitative prime cancellation bound. The key is performing factorial cancellation ONLY over a free integral model, before mapping into an arbitrary commutative ring. In characteristic 2, 2!*0=2!*1=0 does not imply 0=1. R's stdPoly_two gives an actual source example of the related failure: e_1^2=0 but e_2 != 0. Thus interpreting divided powers as x^n/n! in the target would lose essential information.

R21–52: IsPreDP has seven fields: zero outside ideal (including degree zero outside), degree zero=1 and degree one=x inside, positive degree ideal membership, sum convolution, multiplication by arbitrary scalars, and same-argument binomial product. The missing eighth PD field is composition for inner degree n>0. PDPoly is a commutative B-algebra Q.P with B-module basis e_j, e_0=1 and e_i e_j=choose(i+j,i)e_(i+j). No rational algebra premise. R262–353 constructs stdPoly: in Q[X] take rational basis X^j/j!, integral span intForm closed under products by integral binomial coefficients, free Z-basis intBasis, then B tensor_Z intForm. Tensor-product basis yields the stated multiplication. Rational denominators occur only in the construction of the integral model, not in B.

## 2. Augmentation pre-PD and composition (C18–348; E16–51)
Write U(m,k)=(mk)!/((k!)^m m!) for k>0, an integer (unordered equal-sized blocks; m=0 gives 1). Define g_k(m)=U(m,k)e_(mk). The basis formula for x=sum_(k>0)b_k e_k is
    Gamma_m(x)=[t^m] product_(k>0) sum_(j>=0) b_k^j U(j,k)e_(jk)t^j.
Only finitely many factors are nontrivial; factors with b_k=0 are 1. Outside augmentation define Gamma=0 for every m. C87–215 uses exactly this coefficient construction, with finite support enlarged to a common finite set and proof of independence from zero factors. C18–85 derives e_l^n=M e_(nl) with M(l!)^n=(nl)!, and two coefficient identities (all cancellation over naturals):
    U(m,k)U(n,k) choose((m+n)k,mk)=choose(m+n,m)U(m+n,k).
    M U(n,k) choose(n(l+k),nl)=choose(l+k,l)^n U(n,l+k).
The first gives exponential/binomial coefficient law for each factor, and binomial expansion gives addition and B-scalar rescaling. Products of exponential sequences remain exponential by G39–73 (Vandermonde identity; see below).
The second coefficient identity gives Gamma_n(e_l e_k)=e_l^n Gamma_n(e_k), k>0, including l=0 and n=0. Extend the scalar e_l to arbitrary ring element by basis-span induction (C228–268): at addition apply convolution and same-argument product to recover binomial expansion, at B-scaling apply rescaling. Extend e_k to arbitrary augmentation element by ideal-span induction (C269–322): at addition use convolution, positive-degree membership because at least one index is positive, degree one by the two terms; at scalar multiplication use established law. Zero follows separately for positive degree from scalar zero and for degree zero from constant term. C324–348 packages all seven IsPreDP fields.
E16–32 proves U(n,k)^m U(m,nk)=U(m,n)U(mn,k), k,n>0, by multiplying both sides by the same positive natural factorial product. Consequently Gamma_m(Gamma_n(e_k))=U(m,n)Gamma_(mn)(e_k). Apply W12/ A123–154 to extend from generators. U(m,1)=1 gives Gamma_m(e_1)=e_m. This is the native augmentation PD producer.

## 3. Why checking composition on generators is sufficient (A19–154)
Hypotheses: arbitrary commutative B, ideal J, pre-PD gamma with all seven fields, J=span(s), composition for every x in s, every m and n>0. Conclusion: DividedPowers J with dpow exactly gamma. Scalar closure follows by gamma_n(cx)=c^n gamma_n(x), positive-degree membership, then gamma_m and (c^n)^m=c^(mn). Zero split m=0 vs m>0. The nontrivial addition closure is A68–119:
Let a,b in J each obey composition. In the integral model L tensor_Z L set u_i=bL_i tensor 1, v_i=1 tensor bL_i, and z_n=sum_(i+j=n)u_i v_j. Native basis gives n!u_n=u_1^n, n!v_n=v_1^n and n!z_n=(u_1+v_1)^n. A19–39 constructs the map psi to B sending u_i to gamma_i(a), v_i to gamma_i(b), using binomial product and degree zero. Integral model free on tensor basis, so multiplication by a nonzero integer injective. A60–66 yields m! U(m,n) z_(mn)=z_n^m (and analogues for u,v) by cancellation of (n!)^m there.
Define ideal W of model elements x with psi(x) in J and for EVERY k a witness w with k!w=x^k and psi(w)=gamma_k(psi(x)). This is an ideal: zero witnesses 1 for k=0 and 0 otherwise; addition witness is convolution of witnesses, using factorial binomial theorem and gamma-add; scalar witness c^k w. By the assumed composition at a,b, every u_i,v_i for i>0 belongs to W with witnesses U(k,i)u_(ki), U(k,i)v_(ki). Since n>0, every summand of z_n has a positive index, hence z_n in W. Its m-witness equals U(m,n)z_(mn) by injectivity of m! in the model. Apply psi and use psi(z_j)=gamma_j(a+b), giving desired composition on a+b. This is the precise reason no factorial cancellation in B is needed. Ideal-span induction then proves all composition and packages eight fields (A123–154). W12 is a wrapper, not an axiom.

## 4. Split augmentation and arbitrary generators
L16–77 builds epsilon by sending e_0 to 1 and e_i for i>0 to zero, preserving product. The kernel is augmentation: positive generators map to zero, and p-i(epsilon(p)) is in augmentation by basis-span induction. The same basis argument supplies a lift to any ring with prescribed compatible sequence c_i, c_0=1 and binomial law.
S67–254: Let i:B→P be the algebra map, epsilon:P→B a B-algebra retraction, a=ker epsilon, δ PD on J and η PD on a. The extended ideal K=i(J)P+a is epsilon^{-1}(J); canonical split p=i(b)+u with b=epsilon(p) in J and u in a. Define
    theta_n(p)=sum_(i+j=n) i(δ_i(b)) η_j(u)
for p in K, zero outside. Restriction to each summand uses positive-degree operations at zero vanishing; degree zero, degree one, membership and addition follow from the two PD structures. Product law is closure of exponential sequences under convolution (S16–63). Short alternate proof: coefficient of c_r d_s (r+s=m+n) in product is sum_i choose(r,i)choose(s,m-i)=choose(m+n,m), by choosing m from disjoint sets of sizes r,s. Out-of-range binomial coefficients zero. This is the direct identity already used in G39–73; unlike S's integral tensor proof it needs no auxiliary factorial cancellation. Explanatory alternative, not Lean rewrite.
For scalar c split c=i(epsilon(c))+v with v in a. On base scalar i(epsilon(c)), the homogeneity of both summands gives theta_j(i(epsilon(c))p)=i(epsilon(c))^j theta_j(p). On vp in a, theta_j(vp)=η_j(v)p^j. Use p^j=j!theta_j(p) from binomial product, v^j=j!η_j(v), and convolution/product to recover c^n theta_n(p) (S193–228). This multiplies factorials, never divides in P. Composition on i(b) and u comes from restrictions, then A's addition lemma supplies all K. This proves eight fields and both restrictions, with epsilon-kernel equivalence essential. W14 wraps S67; E180–187 applies it to the augmentation PD and lift. Thus RUN23's standard PD supplier is constructed, not a new literature axiom.
G75–151 gives a different general generator criterion, conditional on relation compatibility: for family x_i with prescribed g_i(n), g_i(0)=1, g_i(1)=x_i, positive g_i(n) in span(x), and binomial product, set l(c)=sum c_i x_i, Phi(c)=product sum c_i^n g_i(n)t^n for finite support c. Require l(c)=0 => Phi(c)=1. Then l(c)=l(c') => Phi(c-c')=1 => Phi(c)=Phi(c'), so Gamma_n(l(c))=[t^n]Phi(c) is well-defined. Zero, one, positive membership, addition, rescaling and binomial product follow coefficientwise; zero outside span. This is pre-PD only until composition checked. Relation condition cannot be dropped: in B=F2[e]/(e^2), two identical generators x_1=x_2=e with g_1(2)=0, g_2(2)=e, g_i(0)=1, g_i(1)=e, higher terms zero, satisfy the individual conditions (all positive terms multiply to zero, degree 2 product coefficient 2 vanishes, no forced g(2) from degree 1). But c=(1,1) is a relation and Phi(c)=1+e t^2 !=1. Hence no common pre-PD. This explicit algebraic counterexample is a reasoning control, not an executed finite ring test.
E128–178 uses this criterion for flat extension: flatness turns each finite linear relation into a finite sum of trivial relations (Mathlib Module.Flat.isTrivialRelation_of_sum_smul_eq_zero); power-series regrouping gives Phi=1. Composition on base generators comes from δ; A extends it. Flatness is retained for this supplier, NOT required by split augmentation.

## 5. Provenance delta and upstream
- R structures/definitions are not existence assertions; stdPoly and intBasis are explicit constructions.
- C pre_aug, A dp_of_pre', S dp_split', L exists_lift_and_aug, G pre_of_gens, E exists_std and flatExt have explicit proof bodies. W contains two theorem aliases, not external axioms. No new direct PublishedTheorems/OpenLiteratureStatements declaration in this run; no global axiom absence claim. Standard Mathlib algebra, basis/tensor, combinatorial and flatness lemmas remain transitive dependencies; source inspection is not kernel axiom audit.
- H original ChooseFac, DpOfPre, DpSplit, CompAdd, ExistsLiftAndAug paths return 404. H B/ExistsDividedPowersAug.lean blob 04db7e9fd7ce5863cb5d4d74ac9a50cc0a3b7fe9 has wrappers and unchanged-shaped final assembly H264–272; B/PreOfGens.lean blob 362c937e7f6c8d5f568a80554b869c266654ae17 H120–126 now calls exists_isPreDividedPowers_of_generators₂.
- H actual producer paths under D/Proofs/DivisorProofs/: ExistsIsPreDividedPowersAugmentationIdeal.lean 9382bbadc24bc43e9689bca5efa39d92067578c4 H363–382; ExistsDividedPowersOfCompOnGenerators.lean d7ee9d785b4ad49293a8ec19754685e9b73b5b27 H198–229; ExistsDividedPowersSplitAugmentationExtension.lean c109ec3896e6ec4fc5219d2ce7ef3f548e759601 H302–311; ExistsLiftAndAugmentationMap.lean f61790aea83d4b75bc43473027f0acd938ef19a1 H75 onwards (declaration located); ExistsIsPreDividedPowersOfGenerators.lean 7ce59081dfcd195d2deed0b07fe151c8e6e2568d H248–285; ExistsIsDPMorphismOfFlatAlgebra.lean 1b0981fcd3bf64d1cf0458008717f8973f258c0f H156 onwards (declaration located). H composition, augmentation, split and generator theorem bodies inspected, deeper helper equivalence not asserted. The split supplier now explicitly applies the generator-composition theorem. These are distinct pinned and head graphs, not merged evidence.

## 6. Executed certificate
GitHub JS tool fetched ten files with exact expected blob SHA receipts (8 P, 2 H), checked 41 literal anchors; additional H files inspected as above. No independent Git object rehash. JS BigInt checked integer identities in section 2: 648 product, 648 scalar, 576 composition; and 2197 Vandermonde checks (m,n=0..12, r=0..m+n), total 4069. All completed without error. Finite checks supplement exact identities, not proof of general statements. The replay below uses Python standard library and a local git checkout; equivalent JS checks executed, Python replay not executed here.

```python
import math as M, subprocess as sp, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/"
D="src/Development/AbelianVarietyTheory/Definitions/Divisors/"
spec=[
(P,B+"ChooseFac.lean","05adcf8e8f0c484dd31fe81802f1dfe3bc81ecba",["theorem pre_aug","theorem num1","theorem num2","have Eind","have hmulgen","have haug","if x ∈ Q.aug then D n x else 0"]),
(P,B+"CompAdd.lean","936b1c3eeb75a0df175bd90806ecebf070c1d7a4",["theorem comp_add","let W : Ideal","have zW","cancel m.factorial_ne_zero","theorem dp_of_pre'"]),
(P,B+"DpSplit.lean","a065290b42d85e2006991a972ee4194ad8a7fc34",["theorem dp_split'","have hK","have hdec","have hmd","have hmul","Pre.comp_add","dpow_comp :="]),
(P,B+"DpOfPre.lean","316bb13ce30509e7dbde8613c4dd0f3c6f542143",[":= dp_of_pre'",":= dp_split'"]),
(P,B+"PreOfGens.lean","6883cbdd1c6120521402223fdcf611d9616645c8",["theorem IsExp.mul","hrel :","have Φwd","let γ"]),
(P,B+"ExistsLiftAndAug.lean","90f0cf00d5920ea40bc1a2e215d41386ec44e2e7",["def liftAlg","theorem exists_lift_and_aug","have hmem","Q.aug ≤ RingHom.ker ε"]),
(P,B+"ExistsDividedPowersAug.lean","948cc401ffbac3e205d500bc6f5a4ee03d985638",["theorem uniformBell_comp_coeff","theorem exists_dividedPowers_aug","theorem flatExt","theorem exists_std"]),
(P,D+"RatBasisLinearIndependentInt.lean","618acf903e44a0da9cab93d35660599eb41fee46",["structure IsPreDP","structure PDPoly","def intForm","def stdPoly","theorem stdPoly_two"]),
(H,B+"ExistsDividedPowersAug.lean","04db7e9fd7ce5863cb5d4d74ac9a50cc0a3b7fe9",["apply GlobalTheory.PDA.exists_isPreDividedPowers_augmentation","theorem exists_std"]),
(H,B+"PreOfGens.lean","362c937e7f6c8d5f568a80554b869c266654ae17",["apply GlobalTheory.PDA.exists_isPreDividedPowers_of_generators₂"])]
def git(*args):return sp.check_output(["git","-C",repo,*args]).decode("utf-8")
for ref,path,sha,anchors in spec:
    assert git("rev-parse",ref+":"+path).strip()==sha
    s=git("show",ref+":"+path)
    assert all(a in s for a in anchors),path
def U(m,k):
    q,r=divmod(M.factorial(m*k),M.factorial(k)**m*M.factorial(m))
    assert r==0
    return q
def C(n,k):return M.comb(n,k) if 0<=k<=n else 0
counts=[0]*4
for m in range(9):
    for n in range(9):
        for k in range(1,9):
            assert U(m,k)*U(n,k)*C((m+n)*k,m*k)==C(m+n,m)*U(m+n,k)
            counts[0]+=1
            a=M.factorial(n*m)//M.factorial(m)**n
            assert a*U(n,k)*C(n*(m+k),n*m)==C(m+k,m)**n*U(n,m+k)
            counts[1]+=1
            if n:
                assert U(n,k)**m*U(m,n*k)==U(m,n)*U(m*n,k)
                counts[2]+=1
for m in range(13):
    for n in range(13):
        for a in range(m+n+1):
            assert sum(C(a,i)*C(m+n-a,m-i) for i in range(m+1))==C(m+n,m)
            counts[3]+=1
assert counts==[648,648,576,2197]
print(len(spec),sum(len(x[3]) for x in spec),counts)
```

RESULT: DONE local source-matched augmentation, composition, split extension and relation descent. PARTIAL transitive Mathlib obligations, authenticated Main paths, head helper equivalence. No new assumptions beyond native hypotheses; no RH or URT performance claim. These are algebraic adapters rather than direct quantitative cancellation.
RESUME HERE: obey simplicity pivot: pause further unauthenticated crystalline expansion. Obtain shared cached typed Main role path for 11224217/11221518 from dependency/kernel/acceleration; if absent, classify this branch as unassigned rather than essential. Independently audit the external assumptions on the authenticated actual third-place Green/TopG→Comparison₂.formB route, focusing on which Published/OpenLiterature supplier first introduces genuine window cancellation and whether it is a proved declaration or conditional field. Coordinate with Landau RUN24 and math uF envelope rather than rederive their work. HANDOFF TO literature, dependencies, kernel, acceleration, Landau, math, integration, audit, editor. RH OPEN.

<!-- END VERBATIM specialists/literature_provenance/RUN24_PD_COMPOSITION_AND_AUGMENTATION.md -->


<!-- BEGIN VERBATIM specialists/on_acceleration/RUN24_RESUME.md 38bcb64a388f010dcaca6acf3608309e3eb0dbd7 -->
# RUN24 — authenticated cross-lane manifest receipt

2026-11-25. RESULT: DONE for query-only batch receipt and full native independent-scan replay; PARTIAL for shared persistent DB deployment and role-labelled outgoing extraction. Pinned upstream https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean (rhOfAll); upstream main observed a18a350c3e5aad997766cff2670b292313e46574, not mixed. Read SWARM/HANDOFF/EXPANSION, AGENTS, state excerpt, Run23, latest peer commit list and dependencies, integration, structure, kernel, geometry, literature, math notes. Some other peer note fetches exceeded connector call cap; no claim of exhaustive continuity. Combined status at 07017df empty; no new CI claim.

Authentic artifact 14931267327, member job/outputs/reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native CPython + zstd on all 1,484,705 rows and 3,035,045 raw signed refs, all five independent group scans and one union scan. 106 exact arithmetic IDs reconstructed from dependency commit bd222c6780470673af6e0b65202471f6c5661a50; emitted TSV digest 9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e exactly matches peer, including original 99 value + 1 mixed + 6 manifest-only categories (classification is peer evidence, not independently proved by manifest). Six duplicated arithmetic IDs and seven current terminal requests from integration ca285468, geometry 05db6019, literature 28b8abb1. This is a replay of peer requests grouped into five batches, not actual measured concurrent worker execution.

One shared verified scan 5.71563 s vs five independent verified scans 27.43288 s (4.80x for this workload, one observation each, no OS-cache flush). Hash before/after each scan included; all candidate lists exactly equal. Targeted cache 20509 bytes; SHA256 3795bd2c1f3d629005d19a25fdf1434de85314b84da49ced5a1b64e7cf7d3844. Cache includes ID, typed name parts, kind, raw signed refs, manifest row ordinal and row SHA256, and complete candidate lists for exactly 113 keys / 119 request occurrences. Rebuild deterministically from artifact; this commit records trusted digest, not a remote full DB publication. Separate native --read process passed with pinned digest. Native peak RSS 96920 KiB (~94.65 MiB, whole process, not isolated mode memory). 120 cold/warm comparisons, 11 corrupt-input rejection tests; "cold" is reopened file read+hash+parse+validation, not storage-cold; warm uses already authenticated in-memory cache. 15 repeats per mode, medians in ms:

| mode | reopened incl authentication | warm |
|---|---:|---:|
| independent | .255325 | .016295 |
| shared | .242135 | .020561 |
| golden | .277618 | .039529 |
| periodic | .276717 | .040130 |

Plain independent fastest warm; no URT scheduling advantage. Shared scan is ordinary hash dispatch O(B+Q+C), expected with bounded record schema, where B=manifest bytes, Q=request count, C=candidate occurrences incl output. Golden/periodic sorting O(Q log Q). No arbitrary proof-search bound; no new outgoing elaborated edges, no source/static reference equated to proof dependency. Cache verification requires trusted external digest; self-hashing cannot authenticate arbitrary terminal deletion. Memory bounded in corpus size for fixed Q and C, not arbitrary result count. No hostile concurrent writer/durability guarantee; private output path required.

Exact newly requested candidates, each unique in pinned manifest under exact terminal string (not inferred source matches or root paths). Raw signed references positive, decoded expression IDs are raw minus one:
- GlobalTheory.TraceIso.exists_equiv_of_trace_eq 6674680: 514997827,515004413
- jacobson_density 1800736: 101690570,101691894
- ReciprocityTheory.MultiplicativeHeights.Closed.sphere_height_lower_bound 4403566: 319020184,319021814
- ReciprocityTheory.MultiplicativeHeights.heightLowerBound_of_sj_of_sphereLogIntegrable 4403544: 319020186,319021811
- ReciprocityTheory.MultiplicativeHeights.Closed.gauss_height_additivity 4398915: 318602766,318603125
- FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham 11224217: 883657118,887455967
- GlobalTheory.Published.AbelianDeRham.rigid_of_free_of_crystallineDeRham 11221518: 887222824,887224726

Reproduce: unzip -p github-actions-artifact-14931267327.zip job/outputs/reachable_declarations.jsonl.zst > reachable.zst; python run24_receipt.py reachable.zst run24_cache.json; python run24_receipt.py --read run24_cache.json 3795bd2c1f3d629005d19a25fdf1434de85314b84da49ced5a1b64e7cf7d3844. Native tested executable blob 5c2383dc3305a60d44b5de2094ce5fb6cdd87864. No premises removed; no independent Lean replay. 

RESUME HERE: dependency/kernel lanes add the seven exact IDs above to the next targeted role extraction without rescanning the full raw archive independently; acceleration lane ingest the resulting role projection once available and certify actual typed paths (or retain manifest-only). HANDOFF TO dependencies, kernel, integration, geometry, literature, Galois, all specialists. Full RH OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN24_RESUME.md -->


<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN25_HEIGHT_ADDITIVITY_RESIDUE_FIELD.md 4a41881e2c12b59582d5af3998ca5bf8e5c926b8 -->
# Geometry RUN25 — exact height cancellation and short residue-field proof
2026-11-25. RESULT: DONE locally for source-matched height additivity and scalar invariance; human derivation of pinned quotient predicate. PARTIAL for authenticated Main value-role reachability. No independent Lean replay.
Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE (including simplicity pivot), EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #424 (06:33:58Z, pre-existing, not RH validation), RUN24 05db6019, recent 19 peer commit/RESUME listings, Landau and acceleration RUN24. Full historical archive and external blueprint not reopened. No duplicate task found in inspected notes. No physics changes.
## Scope and source provenance
P=40e56bab026552e089d7afcfeff08d2defb9c005, H=a18a350c3e5aad997766cff2670b292313e46574 (latest recent-commit result, unchanged from RUN24). All paths relative to https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/ . Blob IDs from connector, not independently rehashed.
- GaussAbsMulOfMonomialOrder.lean P 8d363364df0cd0599930da7764d2bb841412ec1b / H fd728981b37f83236d3002dd998d7641171d9d32. P/H start lines: coeff_le_gauss_abs 12/18, gauss_abs_le_of_coeff_le 22/28, gauss_abs_attained_at_coeff 30/36, gauss_abs_pos_of_ne_zero 38/44, finite_place_sum_le 44/50 (changed tactic), finite_place_sum_lt 48/54, finite_place_add_eq_of_lt 58/64, gauss_abs_mul_of_monomial_order 69/75 (changed map_add syntax), gauss_abs_mul 143/149. Others equal under whitespace normalization.
- LagrangeIdealLiftsFact.lean P 1586f674027b1674a770363f6219443d927d073f / H b0c97dad00cf4d03e397074c533e04ae7172efc0. gauss_abs_log_support_finite 8/17, isMultiHomogeneous_map_ring 29/38 (changed alternative tactic list), sphere_mean_mul_multihomogeneous 41/45, gauss_height_mul_multihomogeneous 52/56, gauss_height_const_eq_zero 77/81, gauss_height_add_of_sphere 133/137. Others equal.
- AeBlockSphereEvalNeZero.lean P 271ad9f62932087d499dc4dec71a4b416693afe2 / H 3e03412480a8746661591855cf13797944bffcee: ae_blockSphere_eval_ne_zero 219/231 equal.
- SphereLogIntegrableStatement.lean P 887def7b427e78c9afb4dea4f6b074721bed1fd1 / H eb75df21cf29d2aeeae172a559b76b8566cf02f7: h0 39/49 and HeightAdditiveStatement 67/73 equal; heightQuotient P79, HeightQuotientStatement P83 absent in this H file, global removal not established.
- TorusL2CauchyInequality.lean P b2bc60453af78f33f80a1372a91cd356a830b794 / H affdbf1acabdd7d7e65e3b20716c49cc4a5cebc6: gauss_height_additivity 21/1724 equal.
Total 16 equal, 3 changed, 2 absent among 21 named blocks, source text not elaborated equality. H is a comparison only; do not mix hypotheses.
Acceleration RUN24 receipt authenticates manifest candidate IDs 4398915 (Closed.gauss_height_additivity), 4403566 (Closed.sphere_height_lower_bound), 4403544 (heightLowerBound_of_sj_of_sphereLogIntegrable). Typed role paths remain outstanding. Per simplicity pivot, finish this small local cancellation lemma, then pause further expansion of the branch until role evidence or direct relevance to actual third-place Green/TopG route is established. Height additivity alone gives no prime cancellation.
## 1. Finite-place multiplication: exact source argument
K number field, w normalized finite place, f,g nonzero multivariate polynomials. G(f)=max over support of w(f_s)>0. By the ultrametric triangle inequality every coefficient of fg has norm at most G(f)G(g); the finite-sum non-strict inequality is source-imported through Bl.general_b_fact_left_extra.goal1 and follows by finite induction from the ultrametric inequality (including empty sum, M>=0).
Choose the greatest exponent s0 among coefficients attaining G(f), and t0 similarly for g, in the supplied additive injective monomial order m (finite supports give maxima). Consider coefficient u=s0+t0. Every other pair s+t=u has s>s0 or t>t0: equality in one implies equality in the other by cancellation, and if s<s0 then t>t0 by order compatibility with addition. Hence every competing summand has norm strictly less than G(f)G(g); zero coefficients are included. The finite sum of these has strictly smaller norm (positive bound; empty sum also works). For w(y)<w(x), w(x+y)=w(x): apply triangle inequality to x+y and to x=(x+y)-y. Thus the distinguished summand survives without cancellation and w((fg)_u)=G(f)G(g). Together with upper bound this proves equality. For finite variable set source uses a lexicographic monomial order obtained from Fintype.equivFin, so no extra order assumption in gauss_abs_mul.
## 2. Short independent algebraic compression (not a new Lean theorem)
Choose coefficients a,b attaining the positive maxima. Normalize F=f/a, G=g/b. All coefficients lie in valuation ring O_w={x:w(x)<=1}; each polynomial has at least one coefficient 1. Its reduction modulo maximal ideal m_w={x:w(x)<1} is therefore nonzero. The residue field polynomial ring is a domain, so reduction of FG is nonzero; its coefficients all have norm <=1 and some coefficient has norm exactly 1. Consequently G(fg)=w(a)w(b). This replaces the monomial-order/strict-sum argument with residue field domain property, using standard valuation ring and reduction facts. The source proof is preserved above; the alternative imports these extra standard algebraic facts, is not Lean formalized or claimed faster. It also works without discrete valuations. This is a genuine local simplification, not an RH argument.
## 3. Height cancellation
Take B,n natural, degrees a,a' : Fin B -> N, f,g nonzero multihomogeneous on Fin B x Fin n, K number field (HeightAdditiveStatement uses K : Type), n>0 for the combined conclusion. Let d=[K:Q]>0. Define S(f)=finite sum_w log G_w(f), A(f)=sum over ALL complex embeddings of blockSphereMean(map sigma f); h0=(S+A)/d. As RUN24, only finitely many places have any nonzero support coefficient of norm !=1. Outside their union G=1; hence log support finite, including negative logs inside. Multiplicativity gives S(fg)=S(f)+S(g), since finite sums can be expanded on the union of the two finite supports.
For complex F,G nonzero multihomogeneous, source explicitly takes hInt: SphereLogIntegrableStatement. RUN21 a.e. nonvanishing supplies intersection of two full-measure sets. There norm(FG)=norm(F)norm(G)>0 and log of product is sum. Integrability of both log functions (RUN23 supplier) permits integral_add, and a.e. equality permits integral_congr_ae. Do not apply log_mul at zeros: Lean Real.log 0=0. Injectivity of each embedding preserves nonzero and support degrees; mapping commutes with multiplication. Sum over embeddings and divide by d to obtain h0(fg)=h0(f)+h0(g). The source auxiliary multiplication theorem has no n>0 premise; preserve this distinction (n=0 may have zero measure). The combined HeightAdditiveStatement includes n>0.
For c!=0, G_w(C c)=w(c) by singleton support. With n>0 the normalized sphere measure is probability (nonzero toSphere measure), and finite product including B=0 is probability. Thus blockSphereMean(map sigma C c)=log|sigma(c)|. Finite-place product formula and all-embedding norm formula cancel exactly, giving h0(C c)=0. Constant is multihomogeneous of all degrees 0; multiply by f to get h0(C c*f)=h0(f). No sign assumption on h0. Closed.gauss_height_additivity supplies the statement from sphereLogIntegrable; imported normalization, measure theory, product formula and field facts not independently kernel replayed.
## 4. Quotient independence, derived at P (not an identified source supplier)
Pinned HeightQuotientStatement requires n>0, f,g,f',g' nonzero, each multihomogeneous with separately quantified degree arrays a,b,a',b', and fg'=f'g. Then h0(f)+h0(g')=h0(f')+h0(g) by additivity, so h0(f)-h0(g)=h0(f')-h0(g'). No same-degree condition was added. The source definition and predicate were read, not a named proof supplier. This human deduction uses exactly its hypotheses. Quotient height is additive under products and invariant under simultaneous nonzero factors, but this is not positivity of an arbitrary divisor or an intersection theorem. In particular the lower bound for polynomial heights does not imply a lower bound for the difference without an upper bound on the denominator. Even on rational constants no prime cancellation follows. Do not use this as proof of TopG.
## 5. Actual executed regression
V8 exact BigInt integer polynomials (degree <=2 in one variable), p=2,3,5. Counts {"gauss":46128,"dominant":46128,"residue":46128,"quotient":372,"scalar":3720,"negative":3}, total 142479. Dominant case counts include all competing terms checked; quotient and scalar tests are finite-place components only. Negative controls: archimedean maximum coefficient not multiplicative, pointwise Lean log convention at zero, zero polynomial has no finite valuation. Finite tests neither establish general number-field analytic integrability nor prove RH. Extract JS below and run in Node with findLastIndex support.
~~~js
const run=function(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const v=(x,p)=>{if(!x)return Infinity;let k=0;while(x%p===0n){k++;x/=p}return k};
 const mod=(x,p)=>((x%p)+p)%p;
 const norm=(f,p)=>Math.min(...f.map(x=>v(x,p)));
 const mul=(f,g)=>{const r=Array(f.length+g.length-1).fill(0n);for(let i=0;i<f.length;i++)for(let j=0;j<g.length;j++)r[i+j]+=f[i]*g[j];return r};
 const trim=f=>{let r=f.slice();while(r.length&&!r[r.length-1])r.pop();return r};
 const eq=(f,g)=>JSON.stringify(trim(f).map(String))===JSON.stringify(trim(g).map(String));
 const reduce=(f,p)=>{const k=norm(f,p);return f.map(x=>mod(x/p**BigInt(k),p))};
 const counts={gauss:0,dominant:0,residue:0,quotient:0,scalar:0,negative:0};
 const polys=[];for(let a=-2n;a<=2n;a++)for(let b=-2n;b<=2n;b++)for(let c=-2n;c<=2n;c++)if(a||b||c)polys.push([a,b,c]);
 for(const p of [2n,3n,5n]){
  for(const f of polys)for(const g of polys){
   const h=mul(f,g),k=norm(f,p),l=norm(g,p);
   ck(norm(h,p)===k+l,"Gauss valuation");counts.gauss++;
   const i=f.findLastIndex(x=>v(x,p)===k),j=g.findLastIndex(x=>v(x,p)===l);
   ck(v(h[i+j],p)===k+l,"dominant coefficient");
   for(let a=0;a<f.length;a++){const b=i+j-a;if(b>=0&&b<g.length&&(a!==i||b!==j))ck(v(f[a]*g[b],p)>k+l,"strict competing term")}
   counts.dominant++;
   ck(eq(reduce(h,p),mul(reduce(f,p),reduce(g,p)).map(x=>mod(x,p))),"residue product");counts.residue++;
  }
  for(let t=0;t<polys.length;t++){const f=polys[t],g=polys[(t*7+1)%polys.length],r=polys[(t*13+3)%polys.length],F=mul(f,r),G=mul(g,r);
   ck(eq(mul(f,G),mul(F,g)),"cross product");
   ck(norm(f,p)-norm(g,p)===norm(F,p)-norm(G,p),"quotient finite component");counts.quotient++;
   for(let c=-5n;c<=5n;c++)if(c){ck(norm(f.map(x=>c*x),p)===norm(f,p)+v(c,p),"scalar finite component");counts.scalar++}
  }
 }
 ck(Math.max(...mul([1n,1n],[1n,1n]).map(Number))!==1,"archimedean max coefficient not multiplicative");counts.negative++;
 const leanLog=x=>x===0?0:Math.log(x);ck(leanLog(0*2)!==leanLog(0)+leanLog(2),"zero log convention");counts.negative++;
 ck(norm([0n],2n)===Infinity,"zero polynomial invalidates finite valuation");counts.negative++;
 return counts;
};
const counts=run();console.log(JSON.stringify({counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}));
~~~
RESUME HERE: ask shared dependency/kernel/acceleration lane for authenticated Main role path to 4398915 (also 4403566/4403544); if absent, pause this local branch rather than extend unauthenticated manuscript. Follow simplicity pivot: coordinate with Landau RUN24 and literature RUN24 to isolate actual TopG geometric sign/cancellation supplier that is not already assigned; specifically inspect source shape_closed_link_n_of_green's closed_linkIRR_of_join_count input and its geometric inequalities, without duplicating topDesWin transport. Preserve quotient predicate relocation uncertainty. HANDOFF TO geometry, dependency, acceleration, kernel, Landau, literature, editor, audit, integration. Full RH OPEN.

<!-- END VERBATIM specialists/positivity_geometry/RUN25_HEIGHT_ADDITIVITY_RESIDUE_FIELD.md -->


<!-- BEGIN VERBATIM specialists/prime_window/RUN24_PRIME_SUM_NUMERIC_FAMILY.md 8555eea96fab6b54940b285b7a6d23a8909036d8 -->
# RUN24 — all nine PrimeSumNumericFacts fields, uniform family threshold and pinned consumer

2026-11-25. RESULT: SOURCE-MATCHED human reconstruction of the complete local numerical supplier and its pinned consuming chain; stronger asymptotic n3 bound below. PARTIAL for elaborated root reachability and independent Lean replay. No change to Cathedral physics.

## Provenance
P = 40e56bab026552e089d7afcfeff08d2defb9c005, repository leanprover-community/riemann-hypothesis. All paths below relative to src/Formalism/SharpRestriction/GrowthBounds/ unless specified. Blob hashes as returned by GitHub.
- LogarithmicSums/PrimeSumNumericFacts.lean 43ebae418a3fadff3319cdd5c4ccb6d18d05abcb: NumG5' L12–22; prime_sum_facts_eventually L27–369; prime_sum_facts_of_scaled L375–406; prime_sum_facts_along_family L408–425.
- LogarithmicSums/NumData.lean 16d92dcc7a0cc5044b661107e2e6c1ff6d099e86: ev_log/ev_pow/ev_const L10–51, rE L53–55, first_bound_arith L57–73, n1'_arith L75–97, second_bound_arith_a/b L99–128, fourth_bound_arith L130–152.
- LogarithmicSums/NinthBoundArithB.lean 874b0ed6cf3eaf0f6af08db21bb83600427c3652: forty_le_exp_four L7–12, ninth_bound_arith_b L14–64.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc: lX and final PrimeSumNumericFacts L12–33.
- LogarithmicSums/PrimeRpowNegLevelLe.lean 2534d4828612d86863a3b3eca1525827d625cbed: c1–c4, cfl L163–172 (prior RUN23).
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641: consumers L33,119,191.
- LogarithmicSums.lean ca9322c11898c23018dfb6076d58d08219259eab: rest3 L76–88, stmtEF L98–99, stmtF L101–102.

Preflight: read swarm protocol, queue, 15-lane expansion, AGENTS and research state/log/protocol/continuity excerpts, RUN23, recent commit subjects and most peer RESUME excerpts. Editor diff unavailable via fetch_commit; no exhaustive full archive or external blueprint reread. Latest Cathedral CI summary #423, run 45556824120 PASS at 06:14:38 UTC, not RH validation. Peer audit 86bdbcc33c972093997ff1443f4480287ec4bd25 already covers core_gm, so this task follows RUN23's other frontier. No duplicate full manifest scan.

## 1. Quantifiers and a uniform elementary threshold
The native theorem fixes real eps, K with K.Nonneg, real C>=0; THEN there exists a real threshold R such that for every x>=R and every D:D7,L:SizeData₂ D with L.sc.x=x, L.sc.eps=eps, SizesAt L, ParameterChoice' D L and adm5 D L K (eps/48), NumG5' D L K C bo holds, where bo=b^(x^(-eps/2)). The threshold is independent of D,L. If eps is not in (0,1/52), no L with that epsilon exists by Scale's hypotheses: the implication holds vacuously, not by applying estimates at forbidden eps.

For x>=1, α>0, integrate 1/t <= t^(α/2-1) from 1 to x: log x <= (2/α)(x^(α/2)-1). Thus c log x <= x^α for all x>=max(1,(2|c|/α)^(2/α)), with c=0 trivial. For α<β, c x^α <= x^β once x>=max(1,|c|^(1/(β-α))). For α>0, c<=exp(x^α) once x>=max(1,|c|^(1/α)), since exp(u)>=1+u. These elementary proofs reproduce the eventual lemmas, including negative c; all thresholds can be joined by a finite maximum.

Let t=23 eps/48, Y=exp(x^t), X= X'=exp(x^(eps/3)), b=exp(x^eps), a=xb, b'=a/X, w=b'/(xn)=b/(Xn), V=X''=a/w=Xxn, S=Sc, z=log X, theta=1/(k x^13), delta1=x^(-eps/8), f=2n. Use distinct letters Y for the envelope (not the family's lattice witness Y) and X here for the real cutoff (not the Inst witness). Native size estimates imply x²<=n<=x³, x⁴<=k<=x⁶, k>=1, S>=100, Nm<=S, cG=4S=16k Del, log eta<=x^(eps/4), log Del<=x^(eps/4)/2, 1<=w<=a. These are from L65–149 and L316–359 with Nm_le_Sc, Sc_facts, w''_le; retain the underlying SizesAt and ParameterChoice' hypotheses. No new assumptions on family existence.

For clarity the 17 eventual conditions in source L36–52 are: 14 log x<=x^t; C<=Y; 10<=Y; log x<=x^eps; 3x^eps<=x; 14x^t<=x^eps; 4x^(eps/3)<=x^eps; 4x^(eps/4)<=x^eps; 4x^(eps/2)<=x^eps; 8<=x^eps; 40log x<=x^(eps/3); 2(log4)C rE(eps)log x<=x; 2(log4)C log x<=x; 40C log x<=x; 4C log x<=x; 120x^eps<=x; 5log x<=x. Also x>=16,120. rE=ceil(8(4+8eps)/eps)+1 fixed. Choose the maximum once before D,L. This is the quantifier order of filter_upwards.

These imply x^j<=Y for 0<=j<=14, eta<=Y, Del<=sqrt(Y), 16k<=x^7<=sqrt(Y), hence 0<=cG<=Y, Nm<=Y, xn<=Y, f<=Y. log a=log x+x^eps, log(2a)<=3x^eps<=x<=Y (log2<=1<=x^eps). Y^7 X<=b follows from 7x^t+x^(eps/3)<= (1/2+1/4)x^eps. z>=1 and z(1+z)<=2x^(2eps/3)<=2x. The latter uses eps<1/52. All these estimates are uniform. 

## 2. Nine fields, with exact error budgets
Write c1=C(cG+eta)log(2a), cfl=C f(Nm² log a+(log a)²/log2), c2=C rE b' log x+C log x a/(k x^26)^4, c3=b'/x+eta+C w log x/delta1+bo, c4=C log x(La a/k+a/p0), p0=k²x^26. These are the native constants, not fitted coefficients.

(1) one_le_card_tops: SizeTT lower bound is n x^(-eps/100)delta1. SizeN gives n>=x^(2+8eps-eps/100), so this product is at least x^(2+(8-2/100-1/8)eps)>=1 (L180–189).

(2) n1: c1(V+2)<=Y(2Y)Y(2XY)=4Y^4 X<=Y^7 X<=b. Here V+2<=2XY since X>=1,Y>=10.

(3) n1': log2=integral_1^2 dt/t>1/2. Hence Nm² log a+(log a)²/log2<=Y³+2Y²<=2Y³, and cfl(V+2)<=4Y^6 X<=Y^7 X<=b.

(4) n2: put W=x^26, g1=(log4)C rE log x, g2=(log4)C log x. Both g_i<=x/2. k² W x²<=x^40<=X, from the log cutoff. Since b'X=xb, g1 k² W b'<=b/2. Also W>=x², W>=1,k>=1 imply x² k²W<=(kW)^4; therefore g2 k²W (xb/(kW)^4)<=b/2. Adding proves log4 p0 c2<=b.

(5) n3: bo=exp(x^(eps/2)) exactly, by positive real powers. X b'/x=b. The remaining three contributions satisfy 40X eta<=b and 40X bo<=b by exp(4)>=40 and the exponent inequalities from conditions 7–10. Moreover Xw=b/n, so 40X C w log x/delta1=40 C log x x^(eps/8) b/n<=b, using 40C log x<=x, x^(eps/8)<=x, n>=x². Therefore log4 X c3 <= (log4)(43/40)b <= (59641/40000)b < (3/2)b (native log4<=1387/1000, L173–177). Note this estimate does NOT scale homogeneously with C.

Additional uniform asymptotic sharpening under the same fixed-C hypotheses: divide by b and put T=x^eps. Then Xc3/b=1+X eta/b+C log x x^(eps/8)/n+exp(T^(1/3)+T^(1/2)-T). The second and fourth terms are bounded by exp(-T/2) eventually, since T^(1/3)+T^(1/2)<=T/2 eventually (eta uses T^(1/4) instead of T^(1/2)). The third tends to zero uniformly, by n>=x² and the integral logarithm estimate above. Nonnegativity gives a lower bound of 1. Thus (log4)Xc3/b tends to log4 uniformly over valid instances (expressed as an eventual two-sided estimate, no assumption every x has an instance). For every fixed d>log4 one may replace 3/2 by d after a larger uniform threshold; d<log4 cannot work on arbitrarily large valid instances. This is a human consequence, not a claimed native theorem.

(6) n4: h5.2.1 supplies La<=x^(eps+eps/48)<=x, while K.Nonneg gives La>=0. Thus La*x³<=k and p0>=x³. We have z(1+z)<=2x and C log x<=x/4. Therefore z(1+z)c4<=2x*(x/4)*(2a/x³)=a/x=b. No lower adm5 La bound used for this step; full adm5 retained in native theorem.

(7) n5 is x>=120 by threshold. (8) n7 follows x^(-2+eps)=x^eps/x²<=1/(120x).

(9) n9: lg=log(2V)>=0, lg<=x^(eps/3)+5log x<=2x and lg<=Y since 2x<=x²<=Y. Also V<=XY, 0<=S<=Y, theta<=1, 480 x² theta<=1 (x>=120,k>=1). Let E=(V(theta+3S/w)+2)lg(theta w+S). Expand exactly, using Vw=a:
 E=lg(a theta²+2theta w)+lg((Vtheta+2)S+3SVtheta+3S² V/w).
 First part <=6x a theta=6x² b theta<=b/80.
 Second part <=lg(9Y² V)<=9Y^4 X<=b/80, since Y³>=1000>=720 and Y^7X<=b. Hence E<=b/40. This is ninth_bound_arith_b, with every positivity premise accounted for.

All nine fields of NumG5' are supplied (there are no n6 or n8 fields). For final PrimeSumNumericFacts, apply them at coefficient 40C. c1,cfl,c2,c4 are linear homogeneous in C: their four bounds divide by 40. c3 is affine with nonnegative coefficient w log x/delta1: c3(C)<=c3(40C), so n3 retains its bound, not b/40. one_le_card_tops, n5,n7,n9 are independent of C. This reconstructs prime_sum_facts_of_scaled exactly. In the asymptotic sharpening above, the coefficient 40C is still fixed.

## 3. Native family and actual local consumer
Fix Fm:FamP eps, K.Nonneg, C31,Ce,Cm,C>=0 (only C is constrained nonnegative in this particular theorem; C31,Ce,Cm are arbitrary real parameters here), dependent witnesses Inst and LatInst and hA:AdmFam Fm K X Y C31 Ce Cm. From Fm.Ix_zero choose i to obtain eps>0 via Fm.L_eps. Apply hA at eps/48>0 to get x1 and the uniform admission of all indices; apply the numerical theorem at 40C to get x2. Set R=max(Fm.x1+1,max(x1,x2)). For every x>=R and every i:Fm.Ix x, Fm.x1<x ensures Fm.L_x and Fm.params apply, Fm.L_eps gives the epsilon identity, admission supplies a5 and aSz.1=SizesAt. Apply numerical theorem then scaling. This is L408–425, with no choice of threshold after i and no unconditional construction of AdmFam.

Pinned local value-call chain (source inspection, not an elaborated root path): stmtF -> stmtEF -> rest3 -> prime_sum_facts_along_family -> prime_sum_facts_of_scaled and Nu.prime_sum_facts_eventually -> helper bounds. In parallel rest3 calls latticeChain_succ_of_partial with the numerical record and hG, WReq from second_estimate_and_mean_along_family, plus admitted a2,a3,a4. rest3 threshold max(x1,max(x2,x3)), where x1 supplies admission, x2 mean/weight condition, x3 numerical facts. At each x,i it accepts the additional gain hypothesis hG. This connects RUN22–24 in the pinned source, but does not authenticate a Main->stmtF path in the exported proof graph. Other family conclusion and arithmetic hypotheses are preserved.

## 4. Upstream change — do not conflate historical and live proof
H observed 2026-11-25: a18a350c3e5aad997766cff2670b292313e46574 (PR #2164 merge, 05:32:50 UTC). Old paths PrimeSumNumericFacts.lean, NinthBoundArithB.lean, SecondConstantNonneg.lean and GainBoundAllAddOneOfGainBoundAllRequired.lean return 404. H LogarithmicSums.lean blob 567c67a62257c7a671d673fe52bd7f0d50b0315f contains EMPTY former NinthBoundArithB, PrimeSumNumericFacts and ThirdEstimateOfNumericFacts clump sections at H L541–605. H L96–117 stmtEF_of now takes only three family inputs (FamilyAskBounds, RemainingCountingStatement, FamilyFourthBound) and H L674–675 stmtEF calls rest0, remainingCountingStatement_of_restStar, rest2 only. P L98–99 calls six, including restW, rest3 and restT. At H rest3 and restT absent in this module. H NumData blob 50b6c2b4520315145099a3b2f9fe044919025ca3 retains eventual helper names but not the first/n1'/second/fourth helper declarations in its theorem listing. This is positive source evidence of a changed assembly, not proof these statements are globally absent or unnecessary at P. Request exact root reachability classification for P; do not spend further effort on historical branches before checking priority with integration.

## 5. Reproducible finite check
Executed in V8 with text(counts) in place of console.log(counts). Node can run the following code unchanged. These are integer/rational cross-multiplication tests of the algebraic envelopes, NOT native D7 instances, numerical verification of asymptotic convergence, or a Lean kernel run. In second tests G=2g, fourth G=4C log x, ninth theta=t/d and w=a/V. n1' uses upper bound 1/log2<=2. The third negative control drops the theta cap (theta=1,S=0,lg=1, V=1). The second tests strict threshold equality.
```js
const counts={first:0,fl:0,second:0,fourth:0,ninth:0,scale:0,budget:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(const Y of [10n,11n,20n])for(const X of [1n,2n,5n])for(const C of [0n,1n,Y])for(const c of [0n,1n,Y])for(const e of [0n,1n,Y])for(const l of [0n,1n,Y])for(const xn of [0n,1n,Y]){
 const b=Y**7n*X;
 ck(C*(c+e)*l*(X*xn+2n)<=b,"first");
 ck(C*c*(e*e*l+2n*l*l)*(X*xn+2n)<=b,"fl");
}
for(const x of [2n,3n,10n])for(const k of [1n,2n,7n])for(const W of [x*x,x**3n])for(const bp of [0n,1n,5n])for(const G of [0n,1n,x]){
 const X=k*k*W*x*x,b=bp*X/x;
 ck(G*k*k*W*bp<=b,"second");
 ck(G*k*k*W*x*b<=b*(k*W)**4n,"second");
}
for(const z of [0n,1n,2n,5n])for(const x of [16n,32n,100n])for(const a of [0n,1n,20n])for(const L of [0n,1n,5n])for(const G of [0n,1n,x])if(z*(1n+z)<=2n*x){
 const k=(L+1n)*x**3n,p0=x**3n;
 ck(z*(1n+z)*G*(L*a*p0+a*k)*x<=4n*a*k*p0,"fourth");
}
for(const x of [2n,3n,5n,10n])for(const Y of [10n,11n,20n])for(const X of [1n,2n,5n])for(const V of [1n,X,X*Y])for(const lg of [0n,1n,2n*x<Y?2n*x:Y])for(const S of [0n,1n,Y])for(const t of [0n,1n]){
 const d=480n*x*x,b=Y**7n*X*V,w=x*Y**7n*X;
 const lhs=(V*(t*w+3n*S*d)+2n*d*w)*lg*(t*w+S*d);
 ck(40n*lhs<=b*d*d*w,"ninth");
}
for(const C of [0n,1n,7n])for(const u of [0n,1n,5n])for(const base of [0n,1n,9n]){
 ck(40n*C*u=== (40n*C)*u,"scale");
 ck(base+C*u<=base+40n*C*u,"scale");
}
ck(1387n*43n===59641n,"budget");ck(2n*59641n<=3n*40000n,"budget");
ck(1n+40n*2n!==40n*(1n+2n),"negative");
ck(10n>=10n&&!(10n>10n),"negative");
const x=10n,Y=10n,X=1n,V=1n,b=Y**7n*X*V,w=x*Y**7n*X;
ck(40n*(V+2n)*w>b,"negative");
console.log(counts);
```
Actual executed counts: first 2187, fl 2187, second 324, fourth 324, ninth 1944, scale 54, budget 2: total 7022 positive assertions; three negative controls. General result derives from analytic proof, not finite cases.

## RESUME HERE
Independent audit requested: verify all nine fields, especially nonhomogeneous n3 and uniform threshold/quantifier order, and the new asymptotic sharpening. Dependency/kernel/acceleration: request cached exact role paths from Main to P stmtF, stmtEF, rest3, prime_sum_facts_along_family and latticeChain_succ_of_partial; do not launch another full raw scan. Given H removal of rest3/restT, prioritize the authenticated pinned Main path to the actual Gm / WindowHypOfRpow analytic bridge next; coordinate with Landau and audit (core_gm already covered). If rest3 is unreachable at P, label this entire historical branch accordingly rather than count it as core proof coverage. HANDOFF TO audit, integration, dependencies, kernel, acceleration, Landau, editor, prime_window. Full RH reconstruction OPEN; no Lean kernel validation or URT-specific advantage.

<!-- END VERBATIM specialists/prime_window/RUN24_PRIME_SUM_NUMERIC_FAMILY.md -->


<!-- BEGIN VERBATIM specialists/theta_lifts/RUN24_TWO_TRANSLATE_COMPACT_TRANSFER.md b0fc98192f978f8c9c8bb6c0a2e6a3815bef1e38 -->
# RUN24 — Two compact translates and derivative transfer (Step E)
2026-11-25. RESULT: DONE local SOURCE-MATCHED reconstruction of HSt.kSplit, HSt.ks_rhoP, HSt.fderiv_fV_R, LVs.rit_eq/law/transpose and the consumer stepE/stepE'. InfInv assembly and left Haar derivative supplier inspected; LawDeriv/PtId/CDiff and actual right-Haar instance proof remain explicit frontier. Full RH OPEN.
Source P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis; observed main H=a18a350c3e5aad997766cff2670b292313e46574, unchanged from RUN23. No repin.
Preflight: AGENTS, swarm protocol, queue, expansion, research-state/log/protocol/continuity excerpts and CI #423 (06:14:38 UTC, run 45556824120, general Cathedral checks only); theta RUN23, peer notes in all other 14 named lanes (latest selected by filename, not exhaustive history). Editor 0556 explicitly hands off Step E. Landau RUN24 requests actual root role paths, not assumed plugAll edge; kernel, acceleration and geometry request targeted cached role extraction. No competing Step E work observed. Blueprint referenced through queue, not reopened. No physics queue changes.

Paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; C=CayleyCosetSums, A=AnalyticDeterminants, B=AbsoluteConvergence. All numbered references are P unless H marked. Names are source-level, not elaborated dependency edges.

## 1. Exactly two translates suffice
C/FdProps:44–47 defines KSplit: for all natural n,m, a,b in Fin n, any group Kg and monoid homomorphism iota:Kg -> M2(n) with image exactly InK (both directions), there exist L, complex c_l and k_l in Kg such that for every k,
    fV(m,0,iota(k)) [u1(iota(k))^(-1) u2(iota(k))]_(b,a)
       = sum_l c_l rhoP(iota,m,0,I,k k_l).
No topology, Haar, rank inequality m<n, or injectivity of iota needed in KSplit itself. If n=0 the indices do not exist. Actual proof kSplit (C/KsTraceSingle:97–end) takes L=2 and c_0=c_1=1/2.

Let P_ab be the permutation matrix of the transposition a,b, D_b diagonal with +1 at b and -1 elsewhere. Then N_0=P_ab and N_1=P_ab D_b are unitary and
    E_ab=(N_0+N_1)/2.
Indeed (I+D_b)/2 is the coordinate projection onto column b, and P_ab sends e_b to e_a. This includes a=b; no requirement that N_0,N_1 or the lifts be distinct. For any complex X, tr(X E_ab)=X_ba (not X_ab), so the same entry is half the sum of traces tr(X N_0),tr(X N_1). Native ks_perm_unitary:56, ks_diag_unitary:62, ks_single_eq:70 and ks_trace_single:19 prove precisely these identities.

B/SecondUnitaryBlockOfPair proves kM_mul, kM_conjTranspose, first_unitary_block_of_pair, second_unitary_block_of_pair, kM_of_unitary and KR_shape. The two unitary blocks of kM(A,B) are A,B. Its block form commutes with JJ, and unitarity of A,B gives kM(A,B)^*kM(A,B)=I and preservation of JJ. Consequently kM(I,N_l) is in InK. The exact image assumption on iota supplies k_l with iota(k_l)=kM(I,N_l) (choice, not an asserted algorithm for computing lifts).

C/KsTraceSingle:23–54 (ks_rhoP) proves for k,k1 in Kg, iota(k) in InK, N unitary and iota(k1)=kM(I,N):
    rhoP(iota,m,0,I,k k1) = fV(m,0,iota(k)) tr(u1(iota(k))^(-1) u2(iota(k)) N).
Write U=u1(iota(k)), V=u2(iota(k)); U,V unitary by compactness membership. Right multiplication changes U to U and V to V N. In rhoP the spectral value fz(m,0,0) is det(U)^(-m); its complex conjugate equals fV(m,0) by A/ScalarSectionCompactBlockInvariant:166–178 (f0*fV=1 and det U has modulus one). The other conjugated factor is tr((VN)^(-1)U)^* = tr(U^(-1) VN). This uses adjoints and inverse reversal, not commuting U,V,N. The trace identity and the two lifts give kSplit. A general matrix entry is thus expressed with exactly two unitary translates, not an unspecified large finite expansion. This is native Lean's own construction, not a new theorem or URT acceleration.

## 2. Right derivatives and why the transpose is not naive Haar invariance
A/IteratedFderivRightTranslation:50–86 defines R_W F(x)=DF(x)[xW], rit(F,N,W)=R_W0 ... R_W(N-1) F (N=0 gives F). For open U and complex C-infinity F on U, rit is smooth. If all W_a W_b=0 (including equal indices), then
    rit(F,N,W)(x)=D^N F(x)[xW_0,...,xW_(N-1)], x in U.
The native iterated_fderiv_right_translation:28–48 differentiates the N-linear map evaluation; all derivatives of its arguments are x W_0 W_i=0, so only the new outer derivative survives. Induction uses neighborhood equality on open U, not differentiating a merely pointwise equality. Without pairwise annihilation the identification fails; scalar F(x)=x, W0=W1=1 gives R_1 R_1 F=x but D^2 F=0. Smoothness and parabolic covariance (rit_law:88–117) do not require pairwise annihilation. If F(Px)=chi(P) F(x) on U preserved by P, differentiating this equality in direction xW gives the same law for R_W F by associativity. Hence every iterated R_W preserves the character.

A/IteratedFderivRightTranslation:152–200 (rit_transpose) requires hI:InfInv, F1,F2 complex smooth on Dom, their separate parabolic laws with characters chi1,chi2, and product chi1(P)chi2(P)=|det(P_22)|^(-2n). Kg is a compact topological group with measurable/Borel structure, mu Haar, iota continuous monoid homomorphism with image exactly InK. For N natural and W:Fin N -> M2(n), W_a W_b=0 for all a,b, it concludes
    int rit(F1,N,W)(iota(k)) F2(iota(k)) dmu
       = (-1)^N int F1(iota(k)) rit(F2,N,reverse W)(iota(k)) dmu.
Use InfInv to transfer one R_W0 at a time with a minus sign. Both remaining derivative functions retain the parabolic laws by rit_law; all integrands continuous on compact Kg, hence integrable. Induction, rit_snoc and snoc_rev reverse the order; N=0 holds identically. No complex conjugation is introduced by this bilinear transpose. It is not valid to justify arbitrary W by pretending exp(tW) stays compact.

Actual InfInv (A/SingToDiffAlt:91–98) says for any Z, the integral of the sum of first derivatives of two functions times the other function vanishes, provided the product transforms by the modulus above on G under InP, the functions are smooth on an open domain containing G, and the same compact Haar/iota hypotheses hold. A/InfInv:24–76 assembles II.infInv_of II.leftDeriv II.lawDeriv II.ptId II.cDiff. With Theta=F1 F2, LawDeriv supplies for all upper-block-triangular Y:
    DTheta(x)[Y x]=n(tr Y_11-tr Y_22) Theta(x).
PtId expresses DTheta(x)[xZ] as finite sums of left compact derivatives dK of cA*Theta and cB*Theta, where cA=(xZx*)_22 entry, cB=-(xZx*)_21 entry. eA=diag(E_ab,E_ab), eB=[0,E_ab;-E_ab,0] commute with JJ. CDiff gives real smooth coefficients. LeftDeriv integrates each term to zero; product rule gives InfInv. This is a native proof assembly, not a placeholder inference. Exact PtId/LawDeriv bodies are not translated here.

A/IILeft: core and leftDeriv (171–end) prove LeftDeriv: for real C1 F on open U containing K, compact Haar/iota hypotheses, and e commuting with JJ, the integral of dK(F,x,e) is zero and integrable. Define reK=(e-e*)/2 and imK=-i(e+e*)/2, both skew Hermitian and commuting with JJ, e=reK+i imK. For each skew E, exp(sE) is unitary and commutes with JJ, so it lies in InK for real s. Lift each exp(sE) to Kg (no continuous lift assumed); Haar left invariance makes int F(exp(sE)iota(k)) constant in s. Differentiate at zero: joint continuity on compact Kg times a small closed interval uniformly bounds the derivative; finite measure gives domination. The actual core invokes hasDerivAt_integral_of_dominated_loc_of_deriv_le, then derivative uniqueness. Real derivatives in the two skew directions sum as dK; F need not be complex differentiable for LeftDeriv. This is distinct from the right-invariance instance used below.

## 3. Step E consumer: the inverse in the right change of variable matters
C/VacuumNonvanishingOfFacts:66–115. Within Crux0 assume natural m<n, j=n-m, compact Kg, Haar mu, continuous iota onto InK; Step D from RUN23 holds for every weight rhoP(Y), derivative order, tuple and g in G. Given N>=0, tuple v of length N+1 with v0=WD(0,E_ab) and v_r v_s=0 for ALL r,s, set H=hF(j,m,0), V=fV(m,0), F1=rit(H,N,tail v). The stepE conclusion is
    int D^(N+1) H(iota(k))[iota(k)v_r] V(iota(k)) dmu=0.
By rit_eq, the first integrand is R_v0 F1 times V. F1 transforms with c1(m,0); V transforms with c2(m,0); their product is |det P_22|^(-2n) (A/ScalarSectionCompactBlockInvariant:124–158). rit_transpose with order 1 and actual infInv moves R_v0 onto V with a minus sign.

C/CanonicalPsiNeZeroOfPathBasis:145–end proves fderiv_fV_R on Dom, all natural m, a,b. For x in Dom, x+t x WD(0,E_ab)=x mX(I,0,tE_ab,I). u1 becomes u1+t u2 E_ab, ub1 is unchanged. Since q=0, V along the line is det(u1+t u2 E_ab)^(m-n) det(ub1)^(-n). Differentiation of determinant and integer power with det(u1)!=0 gives
    R_v0 V(x)=(m-n) V(x) [u1(x)^(-1)u2(x)]_ba.
This is valid even m=n, no division by m-n. The nonzero determinant guard from Dom is used for negative powers; native inverse_first_block_mul_unipotent_domain and hasDerivAt_det_add remain imported detailed proofs.

Use kSplit to write R_v0 V(iota(k))=(m-n) sum_l c_l rhoP(I,k k_l). For every l,
    int F1(iota(k)) rhoP(I,k k_l) dmu(k)
       = int F1(iota(k k_l^(-1))) rhoP(I,k) dmu(k)=0.
The exact equality uses right invariance of mu and substitution k -> k k_l, not left invariance alone or substitution without inverse. The source invokes GlobalTheory.isMulRightInvariant_of_compactSpace mu then integral_mul_right_eq_self. Human justification: on compact group a right translate of a left Haar measure is another left Haar measure, so by Haar uniqueness it is a scalar multiple; both have equal nonzero finite total mass, hence scalar one. The exact source body of GlobalTheory.isMulRightInvariant_of_compactSpace was not located this run (code search zero hits); retain imported obligation rather than label verified. The second integral is Step D with Y=I, g=iota(k_l^(-1)), W=tail v; rit_eq and map_mul identify the integrands. No need to assert F1 itself is identically zero. All finite-sum terms integrable by continuous F1, rhoP and compactness. Their integrals vanish, proving Step E. Step E' (:116–130) for a distinguished arbitrary index i0 swaps 0 and i0 using symmetry of higher Frechet derivatives TC.iterSymm, and preserves every pairwise product constraint. K=0 excluded by existence of i0. Step F (:following) uses this for all determinant permutation terms; full Step F and topComp still to reconstruct.

## 4. Provenance / upstream
Connector blob receipts for exact P; source paths above with .lean suffix. Reproduce by git rev-parse P:FULL_PATH.
```
C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
C/FdProps 1bbff855867c08b480b03ff6e62cfcaac88f0479
C/KsTraceSingle 2bbddaee4b3d2f518a63288e260b9a6877f06552
C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
C/CanonicalPsiNeZeroOfPathBasis cd472c8e068984110db30178b2dcffc7cf63b20c
C/ContinuousMatrixLowerRightBlock 3b4e8c6f013d0e6da16b1bf2438d47dfcb893d76
C/StepD d0afbe992416d266e0053e69dc5911e4092bebd7
A/IteratedFderivRightTranslation d0edb1b110eeec447e526aa46c373e66318ad723
A/ScalarSectionCompactBlockInvariant b5c95f21c339895f02322e171ee375ca2373f560
A/SingToDiffAlt ce0e07c6678297a655e2b9e03de36c3a62e69010
A/InfInv 47e82279a7a99676ae8b0b766146e6b48547ab88
A/InfInvA 0e857dca020596485911cf20b1521100d4a47b92
A/IILeft 5af31bba596a51b7b3427094041f159299e33b61
B/SecondUnitaryBlockOfPair 42ec0f7a44543cdeae0e14869155e41d2ae58eea
```
H comparison: C/KsTraceSingle and C/VacuumNonvanishingOfFacts old paths 404; C/Crux (7ee5755446d0b5dc5e24987162d591acdc8415f0) contains ks_rhoP:300, ks_single_eq:347, kSplit:374, stepE:987, stepE':1037, crux:1211. C/CanonicalPsiNeZeroOfPathBasis d1ae8f0910d2956610a185c6da68e243a311eea5 fderiv_fV_R:247. A/IteratedFderivRightTranslation 325335aca1bde8360a1636d869086ea99bdfba2e rit_transpose:201. A/InfInv 379590f168ee1d06d0c0adbcb6a572f5fe7b4c9c infInv:647. Presence and relocation observed, not semantic equivalence. The exact local P assembly is crux := eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). Root membership of this branch still needs authenticated role-labelled receipt; do not count it toward reachable Main completion until then. Haar uniqueness, Jacobi determinant differential, multilinear calculus are standard mathematical ingredients; no specific external published attribution established for this local construction. No transitive axiom/sorry audit.

## 5. Executed reproducible check
CPython stdlib, local sandbox, exit 0. These finite algebra checks test the exact two-translate identity and the right change of variables on a noncommutative group, not analytic Haar theory or Lean replay.
```python
from itertools import permutations
from fractions import Fraction as Q
def mm(A,B):
    n=len(A)
    return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def tr(A): return sum(A[i][i] for i in range(len(A)))
def tp(A): return list(map(list,zip(*A)))
def eye(n): return [[int(i==j) for j in range(n)] for i in range(n)]
count=traces=0
for n in range(1,9):
    I=eye(n)
    for a in range(n):
        for b in range(n):
            s=list(range(n));s[a],s[b]=s[b],s[a]
            P=[[int(s[i]==j) for j in range(n)] for i in range(n)]
            D=[[int(i==j)*(1 if j==b else -1) for j in range(n)] for i in range(n)]
            R=mm(P,D); E=[[int(i==a and j==b) for j in range(n)] for i in range(n)]
            assert mm(P,tp(P))==I and mm(R,tp(R))==I
            assert [[P[i][j]+R[i][j] for j in range(n)] for i in range(n)]==[[2*v for v in row] for row in E]
            count+=1
            for seed in range(4):
                X=[[(3*i-5*j+seed*(i+1)*(j+2))%17-8 for j in range(n)] for i in range(n)]
                assert tr(mm(X,E))==X[b][a]
                assert Q(tr(mm(X,P))+tr(mm(X,R)),2)==X[b][a]
                traces+=1
G=list(permutations(range(3)))
def mul(a,b): return tuple(a[b[i]] for i in range(3))
def inv(a): return tuple(a.index(i) for i in range(3))
F={g:(i+1)**2-3 for i,g in enumerate(G)}
rho={g:(i+2)**3-7 for i,g in enumerate(G)}
wrong_side=wrong_inverse=0
for h in G:
    lhs=sum(F[k]*rho[mul(k,h)] for k in G)
    rhs=sum(F[mul(k,inv(h))]*rho[k] for k in G)
    assert lhs==rhs
    wrong_side+=lhs!=sum(F[mul(inv(h),k)]*rho[k] for k in G)
    wrong_inverse+=lhs!=sum(F[mul(k,h)]*rho[k] for k in G)
assert wrong_side and wrong_inverse
print('matrix-unit decompositions:',count,'trace checks:',traces)
print('S3 change-of-variable checks:',len(G),'wrong-side failures:',wrong_side,'missing-inverse failures:',wrong_inverse)
```
Actual stdout:
```
matrix-unit decompositions: 204 trace checks: 816
S3 change-of-variable checks: 6 wrong-side failures: 5 missing-inverse failures: 2
```
No added hypotheses in reconstructed implication. No new CI run observed, no kernel validation, no URT benefit claimed.

## RESUME HERE
Reconstruct exact PtId and LawDeriv suppliers of InfInv using A/DetOneAddSmulSingleSame and A/FderivXZxSkew (read native statements and trace exact proof terms; especially divergence trace and parabolic-character derivative). Locate right-Haar instance supplier if feasible, then Step F and topComp Step B. Retain FdProps, FzHol, Cayley/UAct, djZ's fz_mX and complex Capelli identity, Gaussian base/GI.integP, CR.crLem_of and KSing.lamSing_of. Ask dependency/kernel/acceleration for cached authenticated Main role path to crux/holLeadB and local theta branch, coordinated with Landau RUN24 rather than duplicate full scan. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.

<!-- END VERBATIM specialists/theta_lifts/RUN24_TWO_TRANSLATE_COMPACT_TRANSFER.md -->
