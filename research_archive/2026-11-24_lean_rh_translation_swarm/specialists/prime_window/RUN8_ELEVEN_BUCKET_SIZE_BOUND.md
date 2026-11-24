# RUN8 — Eleven-bucket discriminant size bound (2026-11-24)

Status SOURCE-MATCHED conditional human derivation; exact integer regression executed in V8. No Lean replay, no claim of Main reachability, no URT improvement. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream latest observed 5ba3d66a2a5acdcd70e2482d73e05b41d7116186 (14:06:03 UTC, CI priority-command merge). At this head AdmissibleSchurLemma, WindowSettingSatisfiable and PrimeClassLossHypothesesSatisfiable have different blobs (7a39bb9f1fb5195e32a23cd22ec2085b2db9b416, 797b675e634354236b854fb4ca27a7c4fa43edd2, 15f79da47e636ae0ed5d36c74e0021fb31fc1388); old DiscriminantSettingSatisfied and OneLeThresholdMulPowers paths give 404. No migration equivalence inferred.

Preflight: AGENTS, research state/log/protocol, continuity, CI summary (14:08:40 general Cathedral PASS, NOT RH verification), swarm protocol/queue/expansion and RUN7, recent peer RESUME HERE notes across all available specialist lanes, editor, integration, structure, dependency and Grok inspected. Blueprint linked in queue not reread. Prior RUN7 established common-weight selection and loss transport, not the eleven-bucket proof; math lane is following distinct uF/phi and key_identity5 estimates. This run expands exactly the size_core proof, not the source of geometric ParametersHyp.

## 1. Exact scope and common comparison lemma

For every P:Par, real e,K,m,T, assume Windows P e K and LargeX P.x P.ε e K, m>=0, T>=1. For WindowsD use clr P and discriminant_windows_iff (DiscriminantSettingSatisfied 9–21); this changes only β,s₀, which do not occur in tDetD. No additional constraint imposed on ε by size_core. Eventual existence of LargeX separately uses 0<ε<1/4 (OneLeThresholdMulPowers 867–927); native host route uses stricter ε<1/52 as in RUN7. Retain all Windows clauses (WindowSettingSatisfiable 95–110) and LargeX (112–115).

Notation x=P.x, z=x^ε, u=x^(ε/3), E=x^e, X=exp(u)=P.Xp, S=exp(x^(ε/4)), B=exp(z/2), b=B², v=b/X, w=x^(ε/8), a=xb, L=log x. Then Xpp=x n X, wpp=v/n, bp=xv, δ₁=1/w, f=2n, log a=L+z. U=mTb and σ=100K z^4/x. Facts (9–162) supplies x>=100, z>=1, 1<=u<=z, 1<=w<=z, E,S,X>=1, 100Kz^4<=x, 100K E^4 x^4<=X, 100K E^4 x^4 XS<=B, b>=B>=1, n>=x², n<=E, 0<=L<=z, eL<=z, log a<=x. For positive y<=E, log y<=z. Also C,Cord in [0,K], N,t,rG<=E and nonnegative, k>=x², p₀>=x⁴+1, La<=z², 0<=Sc,η<=S, 0<=bo<=B, 0<=th<=1/x, 0<=ρ<=1/x², K₀,d>=x², 1<=Y<=2X; 0<=Jo,Ib<=z. The source uses P.nA via n; do not assume n equals 2^e₂: only x²<=2^e₂<=n.

For i<=4,j<=3 and 0<=c<=100,
 c K E^i x^j XS <= b/x <= σ b,
 c K E^i x^j X <= b/x,
 c K E^i x^j v <= b/x.
First follows from monotonicity E,x>=1, the B lower bound and B<=b; second from S>=1; third from Xv=b and X lower bound. Also for i<=4, 100Kz^i/x<=σ<=1. These are Facts.polyXS', polyX', polyv', Kzr_sg, zr_sg and sg1 (240–375). Each bound on a per-mT term q<=σb implies mTq<=σU by nonnegativity; only the floor bucket has factor m rather than mT, so T>=1 is essential for it.

## 2. All eleven buckets, in the exact source order

All definitions below are WindowSettingSatisfiable 130–161 except tOutD,tSecondD from PrimeClassLossHypothesesSatisfiable 60–64. Denote q=t/(mT) informally as its explicit factor, NEVER divide by m; m=0 permitted.

1. Floors: tFloors=m q, q=2 C f Xpp (N² log a + 2(log a)²). Since f=2n, q<=4K E(x E X)(E² x+2x²)=4K E⁴ x² X+8K E² x³ X<=12K E⁴ x³ X<=σb. Thus m q<=σU. Source size_floors_bound 379–397.
2. Cp: q=2 C Sk log(2a) Xpp. Sk=Sc+k+η<=3ES and nonnegative; 0<=log(2a)<=1+2z<=x. Then q<=6K E² x² XS<=σb. size_cp_bucket_bound 399–423.
3. Prime low: q=2 log4 p₀ Q₁, Q₁=C rG bp L. Since 0<=2log4<=3, p₀,rG<=E, L<=x and bp=xv, q<=3K E² x² v<=σb. size_prime_low_bound 425–442.
4. Prime high: q=2 log4 X Q₂. Exact identity (444–452):
 XQ₂=Cb + A₂+A₃+A₄+A₅,
 A₂=C X(η+Sc), A₃=C(b/n)Lw, A₄=C X t Lw, A₅=Xbo.
 All four are nonnegative and each 4A_j<=σb: (i) 4A₂<=8K XS by polynomial comparison; (ii) 4A₃<=4K b z²/x²<=b/x since 100Kz²/x<=1; (iii) 4A₄<=4K X E z²<=4K X E x<=σb; (iv) 4A₅<=4XB<=b/x because 4xXB<=100K E⁴x⁴ XSB<=B². Hence XQ₂<=Cb+σb; q<= (2log4 C+3σ)b. This is the ONLY bucket retaining a leading constant rather than a pure σ contribution. size_prime_high_bound 454–524. Do not substitute 4σ for the sum of four quarter-σ estimates.
5. Order remainder: q=2 C L a [(La/k+1/K₀)(log X+log4)+2(log(p₀−1)+1)/(p₀−1)]. The bracket is <=3z(z²+1)/x²+4z/x²=(3z³+7z)/x²<=10z³/x²: k,K₀,p₀−1>=x², p₀−1<=E, log X=u<=z. q<=20K b z⁴/x<=σb. size_or_bucket_bound 526–577.
6. Outside/omitted tops: q=4a x^(-2+ε)=4b z/x<=σb. sizeOut_core (DiscriminantSettingSatisfied 114–129). This is tOutD, not tBad.
7. First-class small orders: q=4a Cord Jo [log(2^e₂ max(Y,Xpp))]²/2^e₂. With M=max(Y,Xpp)>=1, log M<=3z (Y<=2X, Xpp=x n X). log(2^e₂)<=z as 2^e₂<=n<=E; thus total log<=4z, nonnegative. Jo<=z and 2^e₂>=x² imply q<=64K b z³/x<=σb. size_orders_bucket_bound 601–643.
8. First-class narrow band: q=4a Ib(4ρ+1/p₀)log(2X). Use Ib<=z, ρ,1/p₀<=1/x² and log(2X)<=2z to get q<=40b z²/x<=σb. size_band_bound 645–671.
9. High-prime tail: q=2log(2Xpp)(a th²+wpp th). Since log(2Xpp)<=4z, a th²<=b/x and wpp th<=b/x (v/n<=b), q<=16b z/x<=σb. size_high_bucket_bound 673–709.
10. Exceptional d: q=2a log(d)/d. Derivative of log(t)/t is (1-log t)/t²<=0 for t>=exp(1). Since d>=x²>=10000, log d/d<=2L/x². Then q<=4b z/x<=σb. size_discriminant_bound 711–740. This is a monotone real function bound, not an assumed prime density result.
11. Second-class small share: q=2a/x⁹=2b/x⁸<=σb, since x>=1 and 2/x<=100K z⁴/x. size_ninth_power_bound and sizeSecond_core (DiscriminantSettingSatisfied 131–149). Separately tIoD=mT a/x⁹<=σU (151–160); it is not a twelfth summand of tDetD.

Summing the eleven bounds yields exactly tDetD<=(2log4 C+13σ)U: ten ordinary σ terms plus three from prime high. As 2log4<=3, C>=0 and σ<=1 this gives (3C+13)U. Source size_core 162–176. No new asymptotic constants, no hypotheses removed.

## 3. What is still required for the geometric loss inequality

AdmissibleSchurLemma.loss_bound (762–918) is not the same theorem as size_core. Its split_classes_count decomposes ASK−Ga into first, second, high, served and d terms. hTop bounds each top's weighted prime contribution by 4a log(p)/p via top_loss_bound, then sums J and TT. hHigh uses high_bucket_bound per (j,t); hD uses d_term_bound per (j,t). For a served p, decompose missing tops TT\\TTp, cpF, prF and orF (last two only p<X), and flF. Use TTp⊆TT and nonnegative loF, then sum; interval_count bounds served cardinality by Xpp, and cp_bucket_bound, floor_bucket_bound, pr_bucket_bound, or_bucket_bound give their respective totals. first and second class sums still carry the raw log(p)/p weights. The final linarith combines these at 910–918. No new proof of hLed, hdrop, hfl, hlo, hL or other premises, and no derivation yet of those four per-bucket counting theorems. joint_core (196–213) substitutes out_discriminant_bound, first_le, second_discriminant_bound and the size_core bound above; IO separately uses io_discriminant_bound. This identifies the real remaining frontier and does not confuse an arithmetic envelope with the source of the geometry.

## 4. Source ledger

URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SizeWindowBrackets/ . Fetched source at exact pin:
- ChainSlopeWindows/OneLeThresholdMulPowers.lean, e056ba0d7b0d84078666ab3531c6ca1c6f744235; Facts 9–162, common estimates 240–375, eleven comparisons 379–740 as cited, eventual LargeX 867–927.
- WindowSettingSatisfiable.lean, 641dc12c8c7005d532889ed7a3044636ba72b3c5; Par fields/definitions 11–93, Windows and LargeX 95–118, unit and budget 130–161, bound signatures 169 onward.
- PrimeClassLossHypothesesSatisfiable.lean, 3f609406f5456e034f5dfb94e9688fca6c9f95a9; WindowsD 12–26, tOutD/tSecondD/tIoD 60–64, tDetD 78–84, hypotheses 86–94.
- ChainSlopeWindows/DiscriminantSettingSatisfied.lean, edc32424311c076565c2e13b7657f6a5f58cfd84; 9–21, 114–176, 178–241.
- ChainSlopeWindows/AdmissibleSchurLemma.lean, 91c8966257416ce67a92357ff67f1ded82bba9c9; loss_bound 762–918.

## 5. Executed exact regression

Node/V8 BigInt tests of the elementary algebraic envelopes under sampled rational scale relations, NOT actual native Par records (the independent exponential definitions are not simulated), not prime counting, not Lean. All comparisons are exact cross-multiplied positive denominators; finite regression cannot prove the universal inequalities, which are derived above.

```js
const regression=function(){
 const counts={envelopes:0,scaling:0,aggregation:0,negative:0};const chk=(v,k)=>{if(!v)throw Error(k);counts[k]++};
 // Exact rational comparison n/d <= p/q. All denominators positive.
 const le=(n,d,p,q)=>n*q<=p*d;
 for(let z=1n;z<=7n;z++)for(let K=1n;K<=5n;K++)for(let a=1n;a<=3n;a++){
 const x=100n*K*z**4n*a, E=x*x*a, X=100n*K*E**4n*x**4n*a,S=z*a, sb=100n*K*E**4n*x**4n*X*S*a,b=sb*sb;
 const sn=100n*K*z**4n; // sg=sn/x
 // floor/cp/low and four high-prime subterms, polynomial envelopes
 for(const [c,i,j,scale,den] of [[12n,4n,3n,X,1n],[6n,2n,2n,X*S,1n],[3n,2n,2n,b,X],[8n,0n,0n,X*S,1n],[4n,1n,1n,X,1n]])
 chk(le(c*K*E**i*x**j*scale,den,sn*b,x),"envelopes");
 // high-prime p3, p5; orbit, outside, orders, band, high, d, second, IO
 for(const [n,d] of [[4n*K*b*z*z,x*x],[4n*X*sb,1n],[20n*K*b*z**4n,x],[4n*b*z,x],[64n*K*b*z**3n,x],[40n*b*z*z,x],[16n*b*z,x],[4n*b*z,x],[2n*b,x**8n],[b,x**8n]])
 chk(le(n,d,sn*b,x),"envelopes");
 chk(sn<=x,"envelopes");
 for(let m=0n;m<=4n;m++)for(let T=1n;T<=5n;T++)chk(m*sn*b<=T*m*sn*b,"scaling");
 }
 for(let j=0n;j<=10n;j++)for(let C=0n;C<=10n;C++)for(let U=0n;U<=10n;U++){
 // use L=2log4 <=3, sg=j/10; multiply by 10.
 chk((10n*3n*C+13n*j)*U<=(3n*C+13n)*10n*U,"aggregation");
 }
 chk(10+3===13,"aggregation");chk(1n*1n>0n*1n,"negative"); // T=0 cannot absorb nonzero floor
 chk(100n*2n**4n>100n,"negative"); // z>=1 alone does not ensure sg<=1
 chk(4n>3n,"negative"); // replacing leading high-prime coefficient by sg alone fails when C=1 and sg small
 return counts;
};
console.log(JSON.stringify(regression()));
```
Actual output {"envelopes":1680,"scaling":2625,"aggregation":1332,"negative":3}. No failures. Negative controls: T=0 invalidates floor scaling; z>=1 alone cannot force σ<=1; dropping the leading high-prime term is unjustified (illustrative coefficient guard, not a native counterexample). No performance benchmark.

## RESUME HERE
Next task: reconstruct the four served-prime counting lemmas (floor_bucket_bound, cp_bucket_bound, pr_bucket_bound, or_bucket_bound) in AdmissibleSchurLemma, preserving their prime cutoffs, integer floors, Mertens estimates and order constraints. In particular locate exact definitions of flF, cpF, prF, orF and the SecondKindLoss quantifier signature via imports; distinguish counting arguments from the size envelopes just completed. Independent audit requested: verify all eleven factors, especially four quarter-σ terms in prime high, floor m vs mT and the use of 2^e₂<=n rather than equality. HANDOFF TO math, geometry, editor, integration, dependency and formal audit. No change to baseline physics queue. Full Main dependency and kernel status OPEN.
