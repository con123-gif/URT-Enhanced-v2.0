# RUN11 — Exact served-ledger transport and LinkG boundary (2026-11-24)

RESULT: SOURCE-MATCHED / conditional reconstruction completed for loss_bound_at and its finite deficit consequence; LinkG's underlying geometric proof remains OPEN. Actual V8 BigInt checks below. No Lean replay, no claim of Main-reachable kernel edge or URT advantage. No hypotheses deleted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.

Preflight: AGENTS, swarm protocol, queue, expansion, research state/log/protocol, continuity, CI summary (prior general orchestrator #382 PASS unrelated to RH), RUN10, recent peer commits and available lane RESUME notes inspected. Prime RUN10 asked for this adapter; math/geometry peers have distinct cancellation and complex-section tasks. Some peer note selection is incomplete (not every filename is run-numbered); no claim of exhaustive collision audit. Blueprint not reread. No physics queue or protected files modified.

## 1. Native hypotheses, not assumptions inferred from conclusion

Let D:D7, L:SizeData₂ D, X:G.Inst D L, K:G.Consts and Cr,C,bo real. Define J=SizeData₂.lifts D, m=D.R.m, TT=host.TT, v=Frame.A.val, p a natural prime. The full signature of Loss.loss_bound_at (PowFour 766–773) takes:

* H:PtH X K Cr (SuppSat 94–101: fills at EVERY place, support saturation at every place with residue characteristic <=X'', drop equivalence for every prime including exclusion of all word T primes, K.Nonneg, KapIDef, Cr>=1, NumN_at).
* hT: for EVERY u, NOT InertK D (D.mem u).A.T.
* hask: for EVERY j in J, t:D.host.TT, p prime and InertK D p, askAt(ldAt.Iex j v(t) p, ldAt.at_ v(t),p,ldAt.wz j v(t) p)=L.vonMangoldtClassSum j t p. Its native producer ask_at at PowFour 298 onwards is treated in RUN6.
* hG:LinkG_at X K C bo, and the particular p in PsAt L with clAt X K p=served.
* Keep the exact target Formalism.LFunctionChainParameters.DeficitSplitLemmas.SizeData₂, a PROP about finite sets and a ledger, not the same name as the native L record.

The predicate InertK (GlobalTheoremInputs 97–98) is host class signal OR inertClass. PsAt is the range(bndP) filtered by primality and InertK; clAt is served exactly when p is NOT in L.drop. By pc_drop_iff (634–642) and hT, for p in PsAt the drop test reduces to NoGain. If p>X'', NoGain holds by its branch used at served_le (646–651), contradicting served. Thus p<=X''. Do not replace InertK by inertClass alone or assume every prime in PsAt is served.

## 2. Exact LinkG premise and lower/floor definitions

GlobalTheoremInputs 122–136 defines LinkG_at as a five-part conjunction:
1. For every u,w with resChar(w) != (D.mem u).A.T: DV.LocLe (D.plEq w) floor_nat(DV.ur D w (L.tau w)) (L.NuLat u) (DV.MramL D u); lenMN(u,w)<=duS(u)*(tau(w)+io(w)); and if VV at resChar(w) is empty then tau(w)=io(w)=lenMN(u,w)=0.
2. For every p and t0 in VV(X,K,aL,bL,p), Sv(X,K,aL,bL,p,t0)<=2*m*Nv(X,p,t0)*a/p.
3. For every place w whose residue characteristic p is InertK and <=X'', (a) every j in J satisfies 0<=gain(j,w)<=4*|host.TT|*a/p; (b) the substantive retained-top inequality
   sum_{j in J,t in L.TTw(w)} [L.vonMangoldtClassSum(j,t,p)-loG(L,C,bo,p)] - m*flG(L,C,p) <= sum_{j in J} L.gain(j,w) - L.tau(w).
4. G.ServedOrbitsContained X K aL bL.
5. G.MeanKappaBound X K.

The actual theorem uses 3(b), not an upper bound on the absolute deficit and not a conclusion of finite reindexing. No need to assume C>=0 in this adapter. The actual allowance definitions (100–120) are:
flG = C*f*N(m)^2*log_p a + C*f*(log_p a)^2.
rG(eps)=ceil_nat(8*((2+8eps)+2)/eps)+1.
L1(p)=ceil_nat(log_p(k^2*x^(3A)))+1.
loG = C*(Sc+k+etaSz)*log_p(2a)+pr+orr.
pr=0 unless class=inertClass. In that class, p<p0 gives C*rG(eps)*b'*log x; otherwise p<X' gives C*(b'/x+etaSz+Sc+(w''(n)+t)*log x/delta1)+bo; otherwise 0.
orr=0 unless class=inertClass AND p<X'; there it is C*log x*(LaG*a/(p*k)+(if p<p0 then a*p^(-L1(p)) else a/p^2)).
Do not substitute G.lo (IsResidueClassZero 378–390), which has different coefficients, nor LocalQuadraticParts.lowerTermOfPrime. The bo term is outside the C multiplication. Floor and lower envelopes previously reconstructed in RUN10 use this exact definition.

## 3. Native parameter fill equalities and transport proof

G.ParametersFill (IsResidueClassZero 401–410) explicitly supplies: (i) weight fill equals wj for every j in J, tau-index and z with matching eTau and plGG; (ii) wPart equals fill at the designated partner for every j,t,e; (iii) map of L.TTw(w) via subtype embedding equals TTP at residue characteristic; (iv) if w in supp AND (IsResidueClassZero OR IsSg), gain(j,w)=gainP at p for all j in J; (v) tau(w)=tauP; (vi) io(w)=ioP; (vii) La K L.sc=LaG. They are record hypotheses; not automatically true for arbitrary X.

Choose w over the particular p by Lnk.place_over (PowFour 777, definition proof in FrameCodeOfAdditive 290–319). Apply hG's third conjunct using InertK and p<=X'', rewrite resChar(w)=p; obtain the signed ledger inequality. H.supp_sat puts w in supp. H.fills w supplies the three exact identities for retained top, gain and tau. Reverse the order of the disjunction InertK to use the gain clause.

Let R=TTP(X,K,aL,bL,p), T=TTv D=v(host.TT), Rv=v(R). The local target is SizeData₂(J,T,Rv,ask,gainQ,tauP,loG,flG,p), where ldAt gives Rv, ask fields, gainQ, tauP, loG, flG (SuppSat 54–71). First Rv⊆T since every retained top comes from a member of host.TT by the subtype embedding in fill (PowFour 786–791). In particular we do not count multiplicities of a noninjective image.

For each j in J, reindex the left sum by the native injective Frame.A.val and then by the fill's subtype map:
 sum_{n in Rv}(ask(j,n,p)-loG(p)) = sum_{t in L.TTw(w)}(L.vonMangoldtClassSum(j,t,p)-loG(p)).
The equality uses hask for each j,t; no analytic bound or positivity estimate is used (792–803). The image map is injective, so no factor from multiplicity appears. Next, gainQ has an if-drop guard; since p is served, p not in drop and gainQ(j,p)=gainP(j,p)=L.gain(j,w) by the support and class hypotheses (804–808). Also |J|=m by the cardinality of lifts (809–812), and tauP=L.tau(w) by fill (815). Substitution into the exact place-level inequality proves the second conjunct of SizeData₂. Thus loss_bound_at is transport of a genuine local geometric premise and not a proof of that premise.

## 4. Immediate exact deficit consequence (human algebra)

The formal generic predicates are SecondKindBucket 20–22,45–55. Write A(j,t)=ask(j,t,p), R=Rv⊆T, q=loG(p), f=flG(p), G=sum_j gainQ(j,p)-tauP(p). The proved conditional inequality is sum_{J,R}A - m|R|q - mf <= G. Splitting the whole finite top set into R and T minus R gives exactly
 deficit(p)=sum_{J,T} A-G <= sum_{J,T minus R} A + m|R|q + mf = servedLoss(p).
No sign assumptions on A,q,f,G are needed for this algebra. This is the served summand of SplitLe (57–66), and uses the actual native target. Summing with weight 2 log p preserves order for primes p>=2, NOT for arbitrary positive real p<1. The nonserved case is different: the native nonserved_zero (PowFour 687–698) makes gain and tau zero, so the deficit equals wholeAsk. Exceptional d term is separate in ASK, not silently folded into served loss. We do not claim to have checked the entire generic SplitLe proof body, and do not duplicate RUN8–10 bounds.

## 5. Family quantifiers and exact frontier

LinkG (GlobalTheoremInputs 138–140) means there exist fixed real C,x0 and a function delta:R->R with delta(x)->0 at +infinity, such that for EVERY x>=x0 and EVERY i:Fm.Ix x, LinkG_at(Fm.Gx x i,Fm.GK,C,b_i(x)^delta(x)). The C is not chosen separately per prime, place, index or x; no positivity of C is part of the definition. In loss_points_of_choices (PowFour 2039–2062) this is an INPUT, unpacked with chosen TT/bad, askIsF and windows_ev; the threshold max retains all witnesses. Choose i0 at x in Win, bo=b_i0^delta(x), and use Lnk.sc_eq to transport bo to all i. It supplies hGi and hH to lossHyp_at (1989–1998), not an independent producer of LinkG. GlobalTheoremInputs 158–164 also retains LinkG in the global premise. The actual theorem establishing LinkG's clause 3(b) from geometric conditions remains to locate; search returned no indexed matches, inspected LinkPk/LinkMin/LinkTied/PlacesMin and related branches without a verified direct producer. Do not assert the predicate is an axiom, or that it has been proved by this adapter. Dependency/kernel lane: request exact qualified reachability and reverse producer edges, distinguishing native constants, types and proof-value references.

## 6. Provenance and upstream comparison

Pinned source base: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/

| Path relative to base | Blob SHA | Lines |
|---|---|---|
| src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean | 8166795ec6e846795d7272781119ee7d17d426c0 | 298ff ask_at; 579 pc_mem_Ps; 621–651 served; 687–698 nonserved_zero; 766–816 loss_bound_at; 1989–1998 lossHyp_at; 2035–2062 family |
| src/Formalism/SharpRestriction/GlobalTheoremInputs.lean | ba31f5120ed089d48968754ae577427912d467c5 | 97–140 definitions; 158–164 global input |
| src/Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean | 9fbb7879d0519f9a136e190551422881ef5d2f0b | 362–375 TTP and askP; 378–410 lo and fill |
| src/Formalism/SizeWindowBrackets/SecondKindBucket.lean | 502d2a6bf146f38b4c51ed87db9cf1ffbc9d7db8 | 13–28; 45–66; 95–96 |
| src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean | 80c1d0526b661eae74d87ec3b569d6a459e900ce | 26–71; 94–101 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/FrameCodeOfAdditive.lean | a26c19cd46d322546d8a1784c3c3e9aac3acef85 | place_over 290–319; wPart_eq 464–477 (RUN6) |

Latest upstream main observed 307cef33f046955ee79dba47e0d828d06496d75f, 2026-11-24 17:03:26 UTC, merge PR #1266. Exact substring comparison of pinned blocks to current files succeeded for all five: loss_bound_at 766–816 now 735–785 (blob 74c8dc05d5ed540a5af4ef295afbd7d40b973082); InertK through LinkG 97–140 now 121–164 (5c32a96fe300e445ca6fe371b1b95e99632edae6); ParametersFill 401–410 now 427–436 (0622fc3b6d32afcdece44b5bac2496fd8ab099a6); SizeData₂ through wholeAsk 45–55 now 88–98 (dd75da148c717f5d531d39fb3875f719efff4cb4); ldAt 54–71 now 47–64 (d5821c10326628e5285dfbca3dcf787a1cb19aab). This is text stability, not elaborated equivalence. Retain original pin.

## 7. Executed certificate

Save following as run11.cjs, run node run11.cjs. All arithmetic is exact BigInt. Enumerate signed allowances and signed synthetic ask values (the algebra permits them; actual askAt is nonnegative), empty lift/top/retained sets and slack 0,1,2. Source premise is deliberately manufactured by tau from the desired slack; this tests transport only, not native geometry. Native equalities are premises tested under a nontrivial injective coding, not recovered operators. Negative controls show collision, wrong cardinality, dropping gain, changing tau, mismatched ask, or erasing a signed floor changes the obligation.

```js
function regression(){
 const c={subset:0,reindex:0,gain:0,tau:0,transport:0,deficit:0,negative:0};
 function ck(v,k){if(!v)throw Error(k+" "+c[k]);c[k]++}
 const sum=a=>a.reduce((x,y)=>x+y,0n);
 const range=n=>Array.from({length:n},(_,i)=>i);
 for(let m=0;m<=4;m++)for(let T=0;T<=5;T++)for(let mask=0;mask<(1<<T);mask++)for(let lo=-2;lo<=2;lo++)for(let fl=-2;fl<=2;fl++)for(let slack=0;slack<=2;slack++){
  let J=range(m), top=range(T), retained=top.filter(t=>mask>>t&1), omitted=top.filter(t=>!(mask>>t&1));
  const enc=t=>17+3*t, dec=n=>(n-17)/3, coded=retained.map(enc).reverse(), TT=top.map(enc);
  const a=(j,t)=>BigInt((j+1)*7-3*t+mask%5-4);
  const v=(j,n)=>a(j,dec(n));
  const q=BigInt(lo), f=BigInt(fl);
  let lhs=sum(J.map(j=>sum(retained.map(t=>a(j,t)-q))))-BigInt(m)*f;
  let g=j=>BigInt(j+mask+1), tau=sum(J.map(g))-lhs-BigInt(slack);
  let gQ=j=>g(j), tauQ=tau;
  ck(coded.every(n=>TT.includes(n)),"subset");
  let r=sum(J.map(j=>sum(coded.map(n=>v(j,n)-q))))-BigInt(J.length)*f;
  ck(lhs===r,"reindex");ck(sum(J.map(g))===sum(J.map(gQ)),"gain");ck(tau===tauQ,"tau");
  ck(r<=sum(J.map(gQ))-tauQ,"transport");
  let deficit=sum(J.map(j=>sum(top.map(t=>a(j,t)))))-(sum(J.map(gQ))-tauQ);
  let loss=sum(J.map(j=>sum(omitted.map(t=>a(j,t)))))+BigInt(m*retained.length)*q+BigInt(m)*f;
  ck(loss-deficit===BigInt(slack),"deficit");
 }
 const source=[0,1], collision=source.map(()=>5);
 ck(sum(source.map(()=>1n))!==sum([...new Set(collision)].map(()=>1n)),"negative");
 const floor=3n, asks=6n, right=0n;
 ck(asks-2n*floor<=right && asks-floor>right,"negative");
 const lhs=3n, g=3n, tau=0n, dropped=0n;
 ck(lhs<=g-tau && lhs>dropped-tau,"negative");
 ck(2n<=3n-0n && 2n>3n-2n,"negative");
 ck(0n<=0n && 1n>0n,"negative");
 // Fl=-1, one lift and no retained top, true LHS=1, falsely deleting signed floor produces LHS=0.
 const signedFloor=-1n;
 ck(0n-signedFloor>0n && 0n<=0n,"negative");
 return c;
}
console.log(JSON.stringify(regression()));
```

Actual V8 output: {"subset":23625,"reindex":23625,"gain":23625,"tau":23625,"transport":23625,"deficit":23625,"negative":6}. 141750 positive assertions and 6 negative controls. No failure. Complexity linear in explicitly enumerated fixture size per test, no full corpus benchmark. No Lean executable used.

## RESUME HERE

Next: locate the *actual* native producer of Formalism.MainNotions.LinkG, especially the third conjunct's retained-top estimate, following the typed GlobalTheoremInputs supplier, not loss_points_of_choices again. If the genuine producer is not on the authenticated Main dependency DAG, mark this route as a library branch, and use the actual reachable retained-top producer instead. Request independent audit of reindexing, exact distinction between the two SizeData₂ names, InertK disjunction, gain guard, signed allowances, and source-hash drift. Request kernel/dependency role-labelled edges for Formalism.MainNotions.LinkG_at, Formalism.MainNotions.LinkG, Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at and G.ParametersFill (resolve full namespace before use). HANDOFF TO math, geometry, audit, editor, integration, dependency/kernel lanes. Project OPEN.
