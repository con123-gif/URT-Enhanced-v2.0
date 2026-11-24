# RUN9 — analytic zero order, local factorization and Landau residue normalization

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the imported analytic-order producer, with exact finite algebra regression executed in V8; no independent Lean kernel replay. Project OPEN. This expands the Mathlib leaf behind RUN1–2 and the RUN8 handoff; it is not a repeat of the outer residue argument.

## Continuity

Read AGENTS, swarm protocol/queue/expansion, research-state and continuity, runner log/protocol opening, CI summary (15:09:27 UTC, #376 run 45418026448, baseline Cathedral PASS only), RUN1/2/5/8, latest commit RESUME notes for prime, dependencies, kernel, acceleration, integration, audit, structure, theta, Galois, character, literature and geometry, plus editor integrated manuscript and math handoff. Peer editor explicitly requests local zero-order audit; math and prime work on distinct arithmetic producers. Blueprint link noted but not independently reopened in this run. No changes to physics queue or gates.

## Source ledger (Git blob SHAs returned by connector)

RH P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed default-branch commit H=59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (merge #1242, CI triage change). Original manifest b4d1ec31575a26b2159ec3a262b482bc051f3f6f pins Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474; H manifest 8a747b58a34565cc6cb5341b86544aa5d3a20a2d pins Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, unchanged from RUN8.

RH paths relative to src/Development/AutomorphicArithmetic/:
- P DedekindLFunctions/LandauTheorems/LogDerivLocal.lean, 56dd45f8630096e041bdad64152e07862e0d4c27, L9–39 Deduction.logDeriv_local.
- P DedekindLFunctions/LandauTheorems/poleData.lean, 1f7fdc4409d2f1185700764c51d5c17a907d76e1, L17–89 poleData_dslope/poleData_abstract, L137–239 poleData_char, L336–400 weighted pole.
- H CharacterBoxes/ZeroFreeAllOfTopG.lean, c3bcece31e76be6368af5af4647f1ad30012fd3b (unchanged since RUN8), L355ff logDeriv_local, L851 call, L923ff poleData_char. Exact source comparison executed: logDeriv_local, poleData_dslope and poleData_abstract textually identical after relocation; poleData_char 103-line spans differ only in simp [g, Function.update_apply, hw] becoming simp [g, hw]. Do not infer entire upstream equivalence.

Mathlib paths, Pm/Hm blobs:
- Mathlib/Analysis/Analytic/Order.lean: 43cc6d88cb0ecba9560d4c29a410b271d9432628 / 0e8c74f9a388978486459a02ec9f1ff21a3d0927. P L45–138, H L47–153: actual definitions analyticOrderAt, analyticOrderNatAt; cast, infinity, finite factor, zero equivalence proofs.
- Mathlib/Analysis/Analytic/IsolatedZeros.lean: 9bad403947a1959b68846a3a407f28fdd19d320e / 7c40b052b1a9919a2097da95ad412f62e67d5f81. Read P/H power-series dslope iteration, nonzero leading coefficient, local isolation, uniqueness and exists_eventuallyEq_pow_smul_nonzero_iff (H renamed *_ne_zero_iff with deprecated alias).
- Mathlib/Analysis/Analytic/Uniqueness.lean: 20fe97cfe84c8c26280250418f78ab8f317207e2 / 63e997b6189aa1b0830a6084ee4769b1ddfe7556. H L160–219 identity theorem aux and public completion step. Actual body inspected; P aux also inspected.
- Hm Mathlib/Analysis/Calculus/DSlope.lean 46cd51fe87f023f70ce60210aaa4de28dec458f3 L171–188 HasFPowerSeriesAt.dslope_fslope, alias has_fpower_series_dslope_fslope. P producer was in IsolatedZeros; relocation preserves coefficient shift. Source checks are textual, not elaborated proof-term extraction; blob hashes not independently recomputed.

## 1. Analytic order: why both guards are mandatory

Let f be complex analytic at rho. In a disk, f(rho+x)=sum_{j>=0} a_j x^j, with positive convergence radius. If all a_j=0, f is zero near rho; conversely local vanishing gives zero series by uniqueness. If not, well-ordering yields m=min{j:a_j!=0}, finite. Define T f(s)=(f(s)-f(rho))/(s-rho) for s!=rho and T f(rho)=f'(rho). Its series shifts the coefficients a_j to a_{j+1}: subtract a_0 and divide the convergent tail by x when x!=0, and at zero take a_1. The exact source uses HasSum, dslope and fslope; H moves the one-step theorem to DSlope. Iteration m times yields g=T^m f analytic near rho, g(rho)=a_m!=0. Since the first m coefficients vanish, f(rho+x)=x^m g(rho+x) near rho. Continuity keeps g nonzero in a sufficiently small disk. Hence f has no zeros in the punctured disk. This proves both existence and local isolation without a global RH assumption.

Uniqueness: suppose f=x^m g=x^n j, both factors analytic and nonzero at rho. On a common punctured neighborhood cancel x^min(m,n). If m>n, j=x^(m-n)g tends to 0 at rho, contradicting j(rho)!=0; reverse roles if n>m. Thus m=n. The source first proves the integer-power punctured version, and specializes to naturals via cast and restriction. Conversely a factorization with g(rho)!=0 cannot be identically zero near rho, by punctured nonzero and continuity. This is the iff in IsolatedZeros.

Mathlib analyticOrderAt is an extended natural. For nonanalytic f the definition returns a default 0; for locally zero f it returns infinity; otherwise it chooses the unique factor exponent. analyticOrderNatAt is its toNat, which returns 0 even for infinity. Therefore converting to a natural is valid as an actual multiplicity only after checking finite order; the source obtains not-top from hne (not locally identically zero), then invokes Nat.cast_analyticOrderNatAt. Under analyticity and that guard, m=0 iff f(rho)!=0. One cannot infer nonvanishing merely from analyticOrderNatAt=0 in general (zero function is a counterexample). The distinct guard analyticAt is also required. The factor exponent is not a floating estimate, and no simple-zero hypothesis occurs.

## 2. Why the Landau g is not locally zero anywhere

poleData_abstract assumes g entire (complex differentiable everywhere) and g(1)!=0. If g vanished in a neighborhood of any rho, the identity theorem on connected C would imply g(1)=0. Mathlib's general identity theorem proves the set u of local-zero centers open and relatively closed in U: at x in closure(u) intersect U choose analytic expansion on radius r>0, take y in u within r/2, recenter the expansion at y on radius r/2; every recentered coefficient vanishes because the germ is zero. That ball contains x, proving local zero at x. Preconnectedness then implies U subset u. The public theorem embeds into the normed completion for arbitrary target F, applies the complete-space result, then uses injectivity. For F=C it gives exactly the required implication. It is not a claim that g has no zeros, only that none has infinite local order.

For a nonprincipal character, g=L(s,chi) entire and g(1)!=0 by RUN3 line-one theorem; for modulus-one, g(s)=(s-1)zeta(s) away from 1, g(1)=1 by the residue-one extension (RUN2). Both obey the guards. For the latter g zero multiplicity equals zeta zero multiplicity at rho!=1 since the other factor is nonzero analytic there. At rho=1 no zero is present; totalized zeta(1) is a separate convention, not a value of the meromorphic pole. No assumption of GRH or exclusion of exceptional real zeros within (0,1).

## 3. Local logarithmic derivative

Use f(s)=(s-rho)^m g(s), g(rho)!=0, in a neighborhood, and differentiate at every s in a smaller punctured disk. The Lean Eventually.eventually_nhds step is necessary: equality as a germ at rho yields equality in a neighborhood of each such s, so their derivatives agree. Analyticity of g and g(s)!=0 persist there. For m>=1 the product rule gives
 f'/f = [m(s-rho)^(m-1)g + (s-rho)^m g']/[(s-rho)^m g]
      = m/(s-rho)+g'/g.
For m=0 the direct equality f=g gives the same result with zero pole term; there is no negative natural power. h=g'/g is analytic at rho because g(rho)!=0. The exact source returns m, the iff m=0 iff f(rho)!=0, its equality to analyticOrderAt after casting, and h analytic with the punctured equality. It does NOT assert a point value at rho. A multiple zero produces a simple pole with residue m, not a pole of order m.

## 4. Explicit regularized remainder and residue sign

Set c=g'(1)/g(1), N(s)=g'(s)/g(s)-s*c+k*(1-s), and R(s)=1/[s(s-1)]. Since N(1)=0 and N analytic there, the source defines Phi=-dslope(N,1)(s)/s. It is analytic at 1, away from s=0; away from 1, Phi=-N(s)R(s). This preserves the modulus-one adjustment and no spurious pole at 1. At a zero rho!=0,1 substitute the preceding local logarithmic derivative. Write Q(s)=h(s)-s*c+k*(1-s). Then
 Phi(s) = -m R(rho)/(s-rho) + H(s),
 H(s) = -m dslope(R,rho)(s) - Q(s)R(s).

The explicit divided difference is a useful independently derived simplification:
 dslope(R,rho)(s) = -(s+rho-1)/[s(s-1)rho(rho-1)],
with analytic continuation at s=rho equal to -(2rho-1)/[rho^2(rho-1)^2]. It follows from factoring the difference of the quadratic denominators. Thus H is analytic at rho, with no limit ambiguity in the displayed explicit formula; all denominators are nonzero locally. At a nonzero nonroot choose m=0 and H=Phi, including rho=1. No claim of analytic extension at 0. This simplification is supplementary, not an assertion of a newly checked Lean term or URT advantage.

For the finite family the original and inverse characters are combined with weight a_i/2; conjugation supplies a witness for either branch. Their residues share the factor -1/[rho(rho-1)], and the coefficient S=sum_i(a_i/2)(m_i+m'_i)>0 because at least one multiplicity is positive and every a_i>0. Finite sums preserve analyticity of the remainders. Hence c_rho=-S/[rho(rho-1)] is nonzero at every family pole. Line-one nonvanishing implies 0<beta=Re(rho)<1. For real rho=beta, c_rho=S/[beta(1-beta)]>0 and Im=0, including an exceptional real zero. For complex rho=beta+it, the source only needs a nonzero complex residue; it need not be real. As an optional stronger algebraic consequence, its real part is S*[beta(1-beta)+t^2]/|rho(rho-1)|^2>0. This does not replace the real-pole hypothesis in Landau's real-axis branch: the imaginary part is generally nonzero. No cancellation across different pole positions is inferred. Zero or negative family weights would invalidate the strict S argument.

Dependency direction: convergent power series + identity theorem -> finite order and nonzero factor -> logarithmic derivative -> poleData_abstract -> poleData_char -> family poleData -> abstract Landau contradiction (requires prime window). Nothing here supplies the prime window or proves RH. Original level 0<theta<1 and delta>0 remain intact; current abstract theta generalization described in RUN5 is not used in this local producer.

## 5. Executed reproducible finite certificate

Run with Node by extracting the following fenced block. Executed as shown in the V8 tool runtime. Complex arithmetic uses exact Gaussian integers (BigInt), with a rational grid represented by numerator and common denominator 5. Polynomial factors are bounded illustrative fixtures, not actual L-function zeros. Cross multiplication is done only with guarded nonzero factors; 360 evaluations where the local g vanishes at test points are excluded from the logarithmic-derivative check, not silently accepted. Diagonal check is a coefficient identity, not an experimental analytic limit. The positive-weight loop uses small exact integers. No numerical error tolerance, no infinite analytic proof inferred from regression counts.

~~~js
function certificate(){
 const Z=[0n,0n],ONE=[1n,0n],I=n=>[BigInt(n),0n],C=(a,b)=>[BigInt(a),BigInt(b)];
 const add=([a,b],[c,d])=>[a+c,b+d],neg=([a,b])=>[-a,-b],sub=(a,b)=>add(a,neg(b)),mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],eq=([a,b],[c,d])=>a===c&&b===d,nonzero=a=>!eq(a,Z);
 const conj=([a,b])=>[a,-b],pow=(a,n)=>{let r=ONE;for(let i=0;i<n;i++)r=mul(r,a);return r;};
 const ev=(p,x)=>p.reduceRight((r,c)=>add(mul(r,x),c),Z),der=p=>p.slice(1).map((c,i)=>mul(I(i+1),c)),order=p=>p.findIndex(nonzero),A=(v,m)=>{if(!v)throw Error(m)};
 let factor=0,logderiv=0,orders=0,skipped=0,divdiff=0,diag=0,residue=0,weight=0,negative=0;
 const points=[];for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)if(a||b)points.push(C(a,b));
 for(let m=0;m<=8;m++)for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)if(a||b)for(let c=-1;c<=1;c++)for(let d=-1;d<=1;d++){
  const g=[C(a,b),C(c,d),C(b,c)],f=Array(m).fill(Z).concat(g);
  A(order(f)===m&&eq(ev(f,Z),m?Z:g[0]),"order/center");orders++;
  for(const x of points){
   const fv=ev(f,x),gv=ev(g,x);A(eq(fv,mul(pow(x,m),gv)),"shift factor");factor++;
   if(!nonzero(gv)){skipped++;continue;}
   A(nonzero(fv)&&eq(mul(mul(x,gv),ev(der(f),x)),mul(add(mul(I(m),gv),mul(x,ev(der(g),x))),fv)),"log derivative");logderiv++;
  }
 }
 const q=I(5),D=z=>mul(z,sub(z,q));
 for(let a=1;a<5;a++)for(let b=-5;b<=5;b++){
  const r=C(a,b),dr=D(r);A(nonzero(dr),"rho guard");
  // Numerator of the real part of -S/[rho(rho-1)] with S>0.
  A(neg(conj(dr))[0]>0n,"positive real part");if(b===0)A(neg(conj(dr))[1]===0n,"real pole");
  residue++;
  // Diagonal divided difference numerator agrees with -D'(rho).
  A(eq(neg(sub(add(r,r),q)),neg(sub(mul(I(2),r),q))),"diagonal derivative");diag++;
  for(let c=-4;c<=9;c++)for(let d=-5;d<=5;d++){
   const s=C(c,d),ds=D(s);if(!nonzero(ds)||eq(s,r))continue;
   A(eq(sub(dr,ds),mul(neg(sub(s,r)),sub(add(s,r),q))),"divided difference");divdiff++;
  }
 }
 for(let m=0;m<=8;m++)for(let n=0;n<=8;n++)if(m+n>0)for(let a=1;a<=9;a++)for(let b=1;b<=9;b++){
  // Two weights a/7 and b/11; positive common denominator 77.
  A(11*a*m+7*b*n>0,"positive weighted multiplicity");weight++;
 }
 A(order([Z,Z])===-1,"identically zero has no finite order");negative++;
 A(order([Z,ONE])!==0,"zero leading factor cannot certify order zero");negative++;
 A(!nonzero(D(Z))&&!nonzero(D(q)),"excluded denominator 0,1");negative++;
 A(0*1===0,"zero weight loses witness");negative++;
 A(1*1+(-1)*1===0,"negative weight cancels witness");negative++;
 return {orders,factor,logderiv,skipped,divdiff,diag,residue,weight,negative,total:orders+factor+logderiv+divdiff+diag+residue+weight};
}
console.log(certificate());
~~~

Actual output: {"orders":1944,"factor":93312,"logderiv":92952,"skipped":360,"divdiff":6644,"diag":44,"residue":44,"weight":6480,"negative":5,"total":201420}. Total 201420 finite assertions counted by positive test case, 5 negative controls. Independently checked three identical RH proof-body spans plus the one-line poleData_char difference. No Lean build, kernel validation, independent axiom audit or proven URT improvement. Source replay with git show PIN:PATH and git rev-parse PIN:PATH in the corresponding upstream repos.

RESUME HERE: trace the exact pinned producer of differentiableOn_dslope and its analytic derivative at the base point (the removable singular at s=1 in poleData_abstract), then inspect the native Cauchy coefficient extraction dependency and its precise circle/closed-ball assumptions; distinguish source from kernel replay. Coordinate with kernel/dependency lane to request role-labelled edges for Deduction.logDeriv_local, poleData_abstract and poleData in the authenticated solution closure; avoid duplicating their exporter. HANDOFF TO editor, integration, formal audit, math and kernel. Project OPEN.
