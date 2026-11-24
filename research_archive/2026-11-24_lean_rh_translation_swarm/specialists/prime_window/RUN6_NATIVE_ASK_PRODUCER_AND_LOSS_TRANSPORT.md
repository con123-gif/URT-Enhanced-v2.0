# RUN6 — Native ASK producer and loss transport (2026-11-24)

Status: source-matched human reconstruction; exact finite arithmetic certificate executed in V8. Not Lean kernel validation, global RH proof, or URT acceleration. No original hypothesis removed. Preflight: AGENTS, research state/continuity, swarm protocol, handoff/expansion and recent prime, integration, editor, Landau, geometry, character and math handoffs consulted. No change to physics or another lane. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD observed 13b3a924e6439935cf5c7c6abb778f0dc7944956 (2026-11-24 12:14:27 UTC), not treated as equivalent. All citations below refer exclusively to the original pin. Prior blueprint not re-read. General Cathedral CI is not RH validation.

## 1. Exact producer: a definitional equality, not an independent positivity theorem

Set M = Mod Fm x, a chosen base index i0, common a/b weight tables av,bv, and pt mapping every group element u to a family member with the prescribed base value and carrying both top weight tables (QuadraticLogDerivCongr 367–375). The frame and rank identities come from Fm.R_eq; AD is the base arithmetic data and is heterogeneously equal to each selected member's arithmetic data using q,d,QS,art identities (381–396). Merely identifying q,d is insufficient.

M.w is the weight of the unique native tau whose code equals the specified additive place code; uniqueness uses injectivity of eTau and gcode, fallback is 1 (400–425). M.TT is the filter of the additive frame by the common TTn values, M.a(t)=av(hval t). M.eT is a genuine equivalence using hOfNat and TTn_lt; M.eP is a cardinality equivalence to PhiSet (427–444). Therefore no duplicate top index or missing lift appears.

M.data explicitly sets ASK(u) = sum_{t in M.TT} sum_{j:Fin M.m} ASK(M.AD,N,M.a(t),t,M.w(u,j)) (464–504, particularly 496). Its Ga(u) is instead the native family member's Ga. In Mod.ident 792–797, Ident's five conditions are discharged by the hval/hOfNat identity, definitional weight and gamma equalities, the supplied log derivative equality hl, and **fun _ => rfl** for ASK. This is the exact producer requested in Run5. It is not a proof that ASK-Ga is small. TieGlobal.ChainTied includes Ident (97–114). tiedCore_of_chainTied (LevelGmLeOnFamilyScales 13–26) supplies tr=id, preserves h7, hence the IdentU fifth condition follows without a separate geometry identity; CoreAtH retains IdentU and CoreGm supplies it to ch_top. No assumption of arbitrary tr=id in the generalized theorem.

## 2. The substantive bridge: native ASK versus arithmetic ASK

For a native D7 host D and L:SizeData₂ D, the native multiplicative sign pair and additive coordinates are related via tE. Psi is the second native sign +1 (first additive coordinate zero, after reversal). Let p be prime in the signal or inertClass classes; those are the two unramified off-Phi types. The native Frobenius signs respectively (1,-1) and (-1,-1). For i>=1, Frob^i is outside Psi iff i is odd (FrameCodeOfAdditive 343–397). The partner is c0 Frob^i tau1(t), signs (-1,1) for signal and (1,1) for inertClass, last additive coordinate t+i*hP. Thus this weight is read from the same native place, not an arbitrary sampled weight.

For every p prime there is a native place over p (290–319). Its residue characteristic equals p: a different prime would be coprime, contradicting properness of the prime ideal via Bezout. Unramified Frobenius is unique by fieldFacts and inertia triviality (321–341). Given hF : forall w, G.ParametersFill X K w, wPart_eq (464–477) evaluates the exact designated wPart at the partner. This requires hF, the lift-membership guard, the InertK predicate and odd i.

Put r(a,W,M)=max(a/M-W,0) for M>0. Two distinct tail bounds must not be conflated:
* Arithmetic cutoff: W>0, a/W<=N and M>N imply a<=NW<MW, hence r=0. No W>=1 assumption here.
* Native finite prime/lift cutoff: W>=1 and M>a.toNat imply r=0 (if a<0 already trivial; otherwise integer a equals a.toNat). one_le_wj uses NumN_at, the three thick/top/thin weight windows and j in [1,m]; one_le_wAt transports this via eTau (411–460). aT_toNat follows from positive scale a and aT_win.

For each inert p, right₃ identifies the infinite native askP with L.vonMangoldtClassSum. The latter is a finite range of exponents with odd guard, ending before Nat.log p a.toNat+2. At an odd i, equality is exactly wPart_eq and max commutativity. At an even i including zero both sides vanish. Outside the finite range i>=log_p(a.toNat)+2, p^i>a.toNat (Nat.lt_pow_succ_log_self and monotonicity); use the second tail bound. p>a.toNat implies every positive exponent term vanishes, hence inert_sum makes the prime sum finite over primes <=a.toNat. These steps preserve coefficients 2 log p. askRec_at then identifies the sum over j,t with LocalQuadraticParts.ASK; the exceptional d summand is identical on both sides, not discarded (479–544, LocalQuadraticParts 466–474).

For the arithmetic truncation, RamificationTwoAndConjugationAtQAndD 346–385 transports wM via tE inverse and the partner into Psi. isInert_iff uses the actual host theorem UpperTheory.GL.isInert_iff and native sign classifications: primes split even if additional ramified split primes are present. Do not substitute narrow HostFacts. primePowerSum_eq_local (418–445) cuts exponents to Icc 1 N using i>N implies p^i>N; primePowerSum_eq_zero_of_cutoff_lt (447–457) removes p>N. For d, gD_spec (398–416) puts gD into the inertia coset of Frob^i, outside Phi, by multiplying the native inertia generator when necessary. The inertia coset has exactly one off-Phi element by UpperTheory.GL.inertia_d; askD_eq (459–483) replaces the sum over coset with the one selected element, with the same positive-exponent truncation. Both odd and even i can contribute at d. ASK_eq (485–499) uses the identical inert-prime predicate, outer range N+1 and the separate coefficient log d (not 2 log d).

Native ASKjt (ZetaZeroFreeRegion 51–63) is therefore equal to the finite arithmetic ASK, provided all weights on Psi are positive and satisfy the uniform cutoff. Neither equality involves cancellation between distinct primes; no log approximation is needed.

AskIs (TopDensityNGeSixteen 1681–1685) quantifies over EVERY frame e, lift count m, AD, N, TT, a, w satisfying Reads L e m TT a w, HEq AD (arithOf D.host.toHostRaw), and forall j,t,rho, t∈TT and InPhi rho imply a(t)/w(j,rho)<=N. Its conclusion is the whole finite double sum equals the prescribed A. Reads (QuadraticLogDerivCongr 195–201) requires exact frame and lift count, TT val image, a at corresponding top index, and weights transported by code equality.

askIs_of (FrameCodeOfAdditive 236–275) uses positivity on native Psi and AskRec_at. Substitutes frame, lift count and AD; proves TT equals TTm via hval injectivity, swaps sums and matches Fin m to j+1 lifts. Reads supplies a and weights; transport cutoff via tE and reads_w. ASK_eq applies to each summand; ASK_congr (198–210) requires weights agree only on Phi because partners always lie there. This proves AskIs L (LocalQuadraticParts.ASK L). askIsF (546–556) makes it eventual, with x0=max(Fm.x1+1,3); for ALL x>=x0 and ALL i use Fm.params, Fm.sizes to get NumN_at, Fm.fills to get hF, and one_le_wAt for positivity. No restriction to selected windows in this eventual identity; the geometric loss theorem below does have a window guard.

## 3. Loss inequality, actual consumption and quantifiers

losses_family_of_division_side (FrameCodeOfAdditive 16–40) assumes SlopeLossFamily Fm eL, plus AskIsF Fm. Take witnesses C,x0 for the former and x2 for the latter. Choose C'=max(C,0) and X=max(x0,x2). For every x>=X with x∈Fm.Win, keep the SAME i0,av,bv,admissibility witnesses from the loss hypothesis. For every carrying i, both its native ASK-Ga bound and IOsum bound have multiplier Q=|TT_native| m b x^(eL eps)>=0. This uses b=exp(L)>0, x>1 and nonnegative cardinalities, so C Q<=C'Q even if C<0. Tie eps using Fm.L_eps. For every alternative representation satisfying Reads, HEq and cutoff, AskIs rewrites its arithmetic sum to native ASK. Thus LossF returns the same i0,av,bv and uniform bounds over all carrying i and all admissible representations, not separate existence choices per summand.

LinkPk.linkGLOBAL_pk calls linkGLOBAL with the producer losses_family_of_division_side Fm eL provedFiveF (askIsF Fm) at line 283. The SlopeLossFamily premise provedFiveF is retained. linkGLOBAL forwards to linkGLOBAL_of (QuadraticLogDerivCongr 1879–1888), which takes CountF, SlopesMF, conditional SlopesNF, LatF, NodesF, FrameF, LossF, CharF, WinF, CoverAll and chosen/coupling inputs (853–882). It selects common eventual thresholds via a sum of absolute values plus Fm.x1+1. For every x beyond threshold in Win, loss selection yields i0,av,bv,hadm,hloss; CoverAll gives pt for every u with carrying values (907–913). CharF supplies ell and log-derivative equality (922). At this x, choose N=ceil_nat(2*scale.a). For all u,j,t,rho with t∈TT and rho∈Phi, hnod supplies w>=1 and av_facts gives 0<=a(t)<=2*scale.a; divide to obtain a(t)/w<=a(t)<=2*scale.a<=N (949–959).

At 1022–1027 L8: LossBounds for M.data uses hloss at pt(u) with M.pt_w, and instantiates the universal arithmetic bound with M.reads, M.hAD and hcut. Rewrite native cardinality, m, scale, x, eps to model values; the two conjuncts are ASK-Ga and IO bounds. This is genuine transport of the independent loss inequality to the definition of ASK. At 1111–1117 the exact same M.data, cutoff, ell, TT,T2,a,w,eT,eP enter the ChainTied tuple with M.ident, all eleven geometric/analytic conditions including L8, and E1,B1,R1,W1,S1. Hence no circular proof of LossBounds from Ident. All other predicates and producer obligations remain intact.

## 4. Source ledger (pin above; repository leanprover-community/riemann-hypothesis)

Base URL https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ . Exact relative paths, blob SHA, lines:

| Path | Git blob SHA | Lines |
|---|---|---|
| src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean | 7828c8b1060818fe158e23f87f1ad9e2efcf79eb | 195–209,367–504,775–808,853–922,949–959,1022–1027,1111–1117,1879–1888 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/FrameCodeOfAdditive.lean | a26c19cd46d322546d8a1784c3c3e9aac3acef85 | 13–40,198–275,290–397,411–556 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/RamificationTwoAndConjugationAtQAndD.lean | 1c1495ef81c77fa96f3c1a70106c1da9e24c0c5d | 346–499 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/ZetaZeroFreeRegion.lean | 7746e5a5affe67117d4ba907dbcd2788f539db6e | 23–26,51–63 |
| src/Formalism/SharpRestriction/Divisibility/LocalQuadraticParts.lean | c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265 | 452–453,466–474 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/TopDensityNGeSixteen.lean | cbccb968fd96afe14797b8890f4e5dc63bd11d26 | 1681–1685 |
| src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean | 18deb7cb85d6f650a69f01fda6e0c789b9f04d89 | 72–87 |
| src/Formalism/SizeWindowBrackets/SChain.lean | a4bc8cecac40a1f5fd307661e151639aaf6a6efa | 26–31 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean | 00acf811793877fe42d18c0d69f2d5833f75bf94 | 97–114 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/LinkPk.lean | 08b8ac2f5a183e2547b8c4adf5865a82f026f5ca | 278–283 |
| src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean | de994949e6fd2d7238cfcb1c19d361ccdfe904fc | 13–26 |
| src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean | 0ba3621036f19146e7e67fa9c0e8a1c38661a097 | 29–41 |
| src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean | b5662cda1f3523fc53b547ee582a46bd3cd826d4 | 67–72 |
| src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean | 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d | 55–62 |

## 5. Reproducible independent arithmetic check

Run the following block in Node or V8. Exact BigInt coefficients in the basis log p, scaled by p^8 per prime; no equality of floating logarithms claimed. Test group C2×C2×C5 is an abstract fixture, not a native number-field host. Weights >=1, a<=96; p^8>=256 proves all later positive terms impossible. Exceptional prime d=7, extra split prime 29. The arithmetic exponent loop is genuinely over 1..N; geometric side independent odd guard and prime-power bound. Coefficient, reindex and loss sign checks do not verify the geometry, actual existence, analytic continuation, or Lean proofs.

```js
const regression = function(){
 const count={cutoff:0,partner:0,oddGuard:0,exceptionCoset:0,coefficients:0,reindex:0,lossTransport:0,negative:0};
 function check(ok,k){if(!ok)throw Error(k);count[k]++}
 for(let a=-3;a<=36;a++)for(let w=1;w<=7;w++)for(let den=1;den<=5;den++){
   let N=Math.max(0,Math.ceil(a*den/w));
   for(let M=N+1;M<=N+8;M++)check(a*den-w*M<=0,"cutoff");
 }
 const primes=[2,3,5,7,11,13,17,19,23,29,31], d=7, K=8;
 const groupN=5, add=(g,h)=>[(g[0]+h[0])%2,(g[1]+h[1])%2,(g[2]+h[2])%groupN];
 const mul=(i,g)=>[i*g[0]%2,i*g[1]%2,i*g[2]%groupN];
 const eq=(g,h)=>g.every((x,i)=>x===h[i]);
 const off=g=>g[0]===1;
 const rho=(t,g)=>add(add([1,1,0],g),[0,0,t]);
 const inertia=[1,0,0];
 const frob=(p,s)=>p===d?[s%2,(s>>1)%2,s%groupN]:[([2,11,29].includes(p)?0:1),p%4===1?1:0,(p+s)%groupN];
 const weight=(u,j,g)=>1+(u+2*j+3*g[1]+g[2])%5;
 const pp=(p,i)=>BigInt(p)**BigInt(i);
 const term=(a,w,p,i)=>{let q=pp(p,i),n=BigInt(a)-BigInt(w)*q; if(n<=0n)return 0n;if(i>K)throw Error("unexpected positive tail");return n*pp(p,K-i)};
 function coeff(a,u,j,t,p,s){
   let F=frob(p,s),N=Math.max(0,a),native=0n,geo=0n,arith=0n;
   if(p===d){
     for(let i=1;i<=K;i++){
       let h=mul(i,F),g=off(h)?h:add(h,inertia);
       let coset=[h,add(h,inertia)].filter(off);
       check(coset.length===1&&eq(coset[0],g),"exceptionCoset");
       native+=term(a,weight(u,j,rho(t,g)),p,i);
     }
     geo=native; // source's d summand is identical, not a separate finite-prime claim
     for(let i=1;i<=N;i++)for(let g of [mul(i,F),add(mul(i,F),inertia)].filter(off))arith+=term(a,weight(u,j,rho(t,g)),p,i);
   }else if(off(F)){
     for(let i=1;i<=K;i++){
       let g=mul(i,F);check(off(g)===(i%2===1),"oddGuard");
       if(off(g)){
         let partner=rho(t,g),independent=[0,1-F[1],(t+i*F[2])%groupN];
         check(eq(partner,independent),"partner");
         native+=2n*term(a,weight(u,j,partner),p,i);
         if(p<=Math.max(0,a)&&pp(p,i)<=BigInt(Math.max(0,a)))geo+=2n*term(a,weight(u,j,independent),p,i);
       }
     }
     if(p<=N)for(let i=1;i<=N;i++){let g=mul(i,F);if(off(g))arith+=2n*term(a,weight(u,j,rho(t,g)),p,i)}
   }
   check(native===geo&&geo===arith,"coefficients");return arith;
 }
 for(let s=0;s<4;s++)for(let a of [-1,0,1,2,3,7,8,9,16,24,31,45,64,96])for(let u=0;u<3;u++)for(let j=0;j<2;j++)for(let t=0;t<groupN;t++)for(let p of primes)coeff(a,u,j,t,p,s);
 for(let u=0;u<3;u++)for(let p of primes){
   let left=0n,right=0n;
   for(let t of [0,2,4])for(let j=0;j<2;j++)left+=coeff(8+3*t,u,j,t,p,2);
   for(let lift of [2,1])for(let t of [4,0,2])right+=coeff(8+3*t,u,lift-1,t,p,2);
   check(left===right,"reindex");
 }
 for(let C=-4;C<=4;C++)for(let Q=0;Q<=7;Q++)for(let gap=-36;gap<=36;gap++)if(gap<=C*Q)check(gap<=Math.max(C,0)*Q,"lossTransport");
 check(20-1*3>0&&3>2,"negative"); // violated uniform cutoff
 check(2*2-1*3>0&&3>2,"negative"); // W=1/2: geometric a cutoff fails
 check(100-9>0,"negative"); // including even powers incorrectly adds a positive term
 check(100-49>0,"negative"); // dropping the even exceptional d contribution is wrong
 return count;
};
console.log(JSON.stringify(regression()));
```

Actual executed output: {"cutoff":11200,"partner":48048,"oddGuard":96096,"exceptionCoset":13728,"coefficients":18876,"reindex":33,"lossTransport":2664,"negative":4}. All assertions succeeded. Negative controls are expected counterexamples to dropping the cutoff, W>=1, odd guard, or even exceptional contributions. Complexity of this test is finite enumeration; no URT speedup claimed.

## RESUME HERE

Audit request: independent formal audit should inspect Mod.data/Mod.ident and tiedCore_of_chainTied, then confirm all Reads/HEq/cutoff scopes and separate L8 from definitional ASK. Geometry lane: trace SlopeLossFamily/provedFiveF producer (LinkPk and LocalQuadraticParts) without confusing it with the arithmetic identity. Prime-window next: derive the exact upstream native slope-loss statement and its dependence on the common carrying tables, then reconcile with L8 and later ch_top; check with geometry lane before duplicating. Open obligations: native host family existence, SlopeLossFamily and all other geometric bounds, kernel graph/validation and upstream revision equivalence. No global closure.
