# RUN15 — Uniform numerical suppliers for StarAll
2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction and executed exact BigInt regression. P=40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same head as RUN14). No Lean kernel replay; no URT advantage asserted.

## Preflight
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state excerpts, research log/protocol and continuity, CI summary #395 21:14:40Z (physics only, not RH evidence), RUN14, recent 30 commit titles and integration/editor/Landau RESUME HERE notes. Other lane full notes and external blueprint not reread; no duplicate identified in inspected records. RUN14 assigned this specific numerical producer. No protected files or other lanes changed.

## Source ledger
All upstream paths relative to src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/, repository leanprover-community/riemann-hypothesis. P links: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/
- StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043: St.ev_log/ev_pow L10–32, rE,cGE,cNE L34–48, inv_delta1 L50–55, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six/one_le_k L136–146, second_level_lt_good_of_log L152–199, CStar L201–210, SmallB L212–222, numStar_ev L224–323.
- StarNumB.lean blob 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47: St.B.cGE,cNE,Gp_le,first_count_le_log L11–96; hboB_arith L98–129; hDII_arith L131–144; Facts L146–156; facts_ev L159–355.
- StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a: St.star_fam L11–36.
- NumData.lean blob 16d92dcc7a0cc5044b661107e2e6c1ff6d099e86: Pf.G5.Nu.ev_log,ev_pow,k_le_x_pow_six,one_le_k,xpow_le_exp,ev_const,rE L10–55.
- RUN14 source PartnerCountOfCentral.lean NumStar L440–470 and starAll_of L842–848, blob f677b9041604e334f1115ae16b96cd61b1c7ee55.

## 1. Quantifiers and asymptotic lemmas
Fix real eps, K:Consts with K.Nonneg, C31>0. numStar_ev states: there exists a real x0 such that for every x>=x0, every D:D7 and L:SizeData₂ D, if L.sc.x=x, L.sc.eps=eps, SizesAt L and ParameterChoice' D L, then for every real bo with SmallB D L K C31 bo, and every real C>=CStar eps K C31, NumStar D L K C31 C bo. Threshold is independent of D,L,bo,C. facts_ev has same outer fixed data and eventual scope; after D,L, equalities, SizesAt and ParameterChoice', requires adm5 D L K (eps/48), and returns Facts with bo=b^(x^(-eps/2)). Neither statement adds eps>0 as a premise: if eps is not in (0,1/52), matching native L is impossible (Scale.eps_pos/eps_lt). Otherwise fix this valid range.

Elementary human alternative for ev_log: for x>=1 and a>0, log x = integral from 1 to x of dt/t <= integral from 1 to x of t^(a/2-1)dt = (2/a)(x^(a/2)-1). Thus c log x <= x^a once x^(a/2)>=2|c|/a. Handles signed c. ev_pow: x^beta=x^alpha x^(beta-alpha) for x>0, with beta>alpha, so eventual x^(beta-alpha)>=c suffices. ev_const: exp(x^a)>=1+x^a eventually dominates any fixed c. A finite intersection of eventual atTop statements takes the maximum of their thresholds. Source uses little-o and tendsto, not this explicit integral; no new assumption.

## 2. Native counting bounds
Let ell=log x, y=x^(eps/8)=1/delta1, r=rE(eps)=ceil_N(8(4+8eps)/eps)+1, A0=(5+8eps)10^(6r+1), cGE=2(A0+6)(6r+1), cNE=18cGE+2(5+8eps)+2. For x>=e, ell>=1,y>=1. Natural ceiling satisfies u<=ceil_N u<u+1 for u>=0. orbitSmallMultiplicity<=A0 ell+1, goodEll=(6r+1)ceil_N y<=2(6r+1)y. Thus Gp=(orbitSmallMultiplicity+5)goodEll<=cGE ell y. N1=ceil_N max(6e Gp delta1,(5+8eps)log_2 x)+1. Since e<3 and log2>1/2, its max <=[18cGE+2(5+8eps)]ell, and the ceiling plus one costs at most 2ell. Hence N1<=cNE ell.

SizesAt gives k<=x^6 and native k>=1. The L1 in this pinned namespace, unfolded at StarNum L164–183, has ceiling argument log_p((k*x^26)^4). This must not be silently identified with a different cutoff such as ceil(log_p(k^2*x^78))+1. Its numerator is 4(log k+26ell)<=128ell. For p prime, log p>=log 2>128/186 (e.g. integrate 1/t or use log 2=2 sum_{j>=0}(1/3)^(2j+1)/(2j+1); first 3 terms give 842/1215>128/186). Hence L1<=ceil_N(186ell); the supremum over inert primes obeys same bound, and L2=2sup L1<=372ell+2<514ell. If 514ell<=y then L2<goodU=ceil_N y. Source uses log_two_gt_d9. Empty supremum is handled by the source csSup_le' bound in Nat. Audit cutoff name across earlier notes.

## 3. CStar and numStar_ev
CStar=3+K.tII*r+(13+4K.tII+160C31)+K.Pr1*C31+K.kappaThresholdOne*|cNE|. All summands nonnegative (K.Nonneg,C31>0). C>=CStar gives hC3,hCt,hCD,hCP and hN1 by multiplication with ell>=1. Note C chosen independently of each x,D,L.
Choose x large for x>=e, x>=2, 514ell<=y, 3cGE ell<=y, 4C31 ell<=x^(1-eps/8). The first cutoff gives hL2; second gives 3Gp<=y^2=x^(eps/4). Native base P, Nm_le_Sc P, w''_le and SizeEta yield w,eta,c,Nm each <=b'/x (w=w'', c=cG; source L254–276 supplies eta<=w and Nm<=w). They imply w+eta+c+Nm<=4b'/x. Thus G=C31 ell/delta1>=0 and G(w+eta+c+Nm)<=4C31 ell y*b'/x<=b'. Source L307–309 unfolds c0num and uses same b'/x<=b'/2, yielding c0num<=3b'; exact c0num definition not separately expanded in this note. hLx follows x>=e. Remaining hkQ,hDII,hbo are precisely the three conjuncts of SmallB, not generated by numerical growth alone; facts_ev supplies them next.

## 4. Three uniform Facts from a common envelope
Set t=x^(eps/48), Y=exp(t^23)=exp(x^(23eps/48)), b=exp(x^eps), a=xb, b'=x exp(x^eps-x^(eps/3)), bo=b^(x^(-eps/2))=exp(t^24). Source facts_ev fixes all constants before the eventual x threshold. It chooses 14ell<=t^23, 130<=Y, each K.Pr1,K.kappaThresholdTwo,K.DI,K.DII,C31,r<=Y, ell<=x^eps, 3x^eps<=x, 14t^23<=x^eps, 4x^(eps/3)<=x^eps, 13t^23<=x^(eps/2), C31ell<=x, cNE ell<=x, x>=40,e. Strict positive exponent gaps ensure all are eventual. In particular pY: q<=x^M and M<=14 for natural M imply q<=Y by M ell<=14ell<=t^23.

SizesAt and ParameterChoice' give n<=x^3,k<=x^6, v=x^13, eta<=exp(x^(eps/4)), Del<=exp(x^(eps/4)/2), c=16k Del>=0 and Nm<=c. Since x>=40 and x^7<=exp(t^23/2), c<=Y. Thus eta,c,Nm,n,k,v,ell all <=Y. For every prime p, lb=log_p(a)>=0 and lb<=2log a=2(ell+x^eps)<=x^2<=Y, using p>=2, log2>=1/2, ell<=x^eps,3x^eps<=x,x>=40. G=C31ell y<=x^2<=Y. N1<=cNE ell<=x<=Y. For every n'<=n, NplusF=40n'delta1<=x^4<=Y, nonnegative. The adm5 hypothesis supplies log Qp<=x^(11eps/24+eps/48)=t^23 for p<X', and <=x^(eps/8+eps/48)=t^7<=t^23 for p<p0. Qp>=0 by definition. These are distinct quantifier domains; no extension to all p is claimed.

From 14t^23<=t^48 and 4t^16<=t^48, obtain 8t^23+t^16<=t^48 (8/14+1/4<1). Hence Y^8<=exp(t^48-t^16)<=b'. For prime p<p0, kQp<=Y²<=Y^8<=b'. For every prime p, K.DII*(N1³+r⁵+k²)*lb<=Y⁵+Y⁷+Y⁴<=3Y⁷<=Y^8<=b' (source uses 130). This proves the first two Facts without requiring p<X' for the second.

## 5. Third Facts: explicit polynomial budget
For each prime p with p0<=p<X' and each natural n'<=n, abbreviate P=K.Pr1,T=K.kappaThresholdTwo,Q=Qp,I=K.DI,N=NplusF, z=N1, l=lb, L=ell, C=C31. All 17 input variables of hboB_arith except DIf lie in [0,Y], including Np=NplusF separately. DIf>=0 and DIf<=I*Np*v²*(z⁵+k³)*l+1 by its natural ceiling definition. Native c6f=8(DIf+1)+T*N*k*l+4*N*c+2*n'*c. The third Facts LHS is exactly
P G(eta+c+Nm)+T[Q*c6f+kQ+kl+c]+2Gc+40 C L I v²(z⁵+k³)l+3.
All factors nonnegative. Monotone substitution by Y (and DIf by Y^10+Y^8+1) yields
8Y^12+40Y^11+8Y^10+40Y^9+Y^6+6Y^4+5Y^3+19Y²+3.
Coefficient sum 130; each degree<=12 and Y>=130, so this is <=130Y^12<=Y^13. Finally 13t^23<=t^24 yields Y^13<=exp(t^24)=bo. Retain actual p and n' restrictions even though p0 lower bound unused locally after e_Q. All three Facts are now assembled; adm5 is still a substantive premise and is not proved by this calculation.

## 6. Family assembly
St.star_fam fixes Fm:FamP eps,K,hK,C31,Ce,Cm,hC31. Chooses C0=max(CStar,0) before universally introducing C>=C0 and families X(x,i):Inst,Ylat(x,i):LatInst. Under AdmFam, choose x2 from its specialization at eps/48>0; eps>0 follows Fm.Ix_zero and Fm.L_eps. Let x3 be common atTop threshold from numStar_ev and facts_ev. Take x0=max(x2,x3,Fm.x1+1). For every x>=x0 and every i:Fm.Ix x, Fm.params/sizes/L_x/L_eps supply matching D,L; AdmFam supplies A1 and A5. facts_ev with A5 yields exactly three Facts, passed as SmallB to numStar_ev. starAll_of with A1 and hK,ParameterChoice',C31>0,NumStar yields StarAll for bo=b^(x^(-eps/2)). Neither family admission nor native size conditions deleted. Note H source tuple extraction changed from six fields to four; no equivalence of entire AdmFam inferred.

## 7. Executed finite regression
Code uses abstract exact integer fixtures, not native D7 instances or real-asymptotic evaluation. The polynomial identity and majorant are tested independently; exponent tests use integer t=x^(eps/48). The logarithm rational lower bound is analytic; integer comparisons test its coefficient and ceiling absorption. Negative controls fail when Y>=130 is discarded entirely and when 13t^23<=t^24 is taken at t=12. Universal real statements rely on derivations above, not samples.

```js
const certificate = ()=>{
const n={majorant:0,polynomial:0,DII:0,cutoff:0,exponent:0,constant:0,negative:0};
const check=(x,k)=>{if(!x)throw Error(k);n[k]++};
const poly=y=>8n*y**12n+40n*y**11n+8n*y**10n+40n*y**9n+y**6n+6n*y**4n+5n*y**3n+19n*y**2n+3n;
const budget=(P,G,e,c,m,T,Q,D,N,k,l,j,C,L,I,v,z)=>P*G*(e+c+m)+T*(Q*(8n*(D+1n)+T*N*k*l+4n*N*c+2n*j*c)+k*Q+k*l+c)+2n*G*c+40n*C*L*(I*v**2n*(z**5n+k**3n)*l)+3n;
for(let y=130n;y<=170n;y++){
const d=y**2n*y**2n*(y**5n+y**3n)*y+1n;
check(budget(y,y,y,y,y,y,y,d,y,y,y,y,y,y,y,y,y)===poly(y),"polynomial");
check(poly(y)<=130n*y**12n&&130n*y**12n<=y**13n,"polynomial");
for(let s=0n;s<160n;s++){
const a=Array.from({length:17},(_,i)=>(s*BigInt(17+i*2)+BigInt(i*i+3))%(y+1n));
const [P,G,e,c,m,T,Q,I,N,k,l,j,C,L,v,z,Np]=a;
const D=I*Np*v**2n*(z**5n+k**3n)*l+1n;
check(budget(P,G,e,c,m,T,Q,D,N,k,l,j,C,L,I,v,z)<=poly(y),"majorant");
check(I*(z**3n+v**5n+k**2n)*l<=y**8n,"DII");
}
}
// log2 > 2(1/3 + 1/81 + 1/1215) = 842/1215 > 128/186
check(842n*186n>128n*1215n,"cutoff");
for(let l=1n;l<=120n;l++)for(let d=1n;d<=19n;d++){
const logNumer=l*d+1n, logDen=d;
const ceil=(186n*logNumer+logDen-1n)/logDen;
check(2n*ceil*logDen<514n*logNumer,"cutoff");
}
for(let t=13n;t<=150n;t++){
check(13n*t**23n<=t**24n,"exponent");
check(8n*t**23n+t**16n<=t**48n,"exponent");
check(14n*t**23n<=t**48n&&4n*t**16n<=t**48n,"exponent");
}
for(let r=1n;r<=15n;r++)for(let t=0n;t<=8n;t++)for(let c=1n;c<=9n;c++)for(let p=0n;p<=4n;p++){
const z=3n+t*r+(13n+4n*t+160n*c)+p*c+2n*(r+1n);
check(z>=3n&&z>=t*r&&z>=13n+4n*t+160n*c&&z>=p*c&&z>=2n*(r+1n),"constant");
}
check(poly(1n)>1n,"negative");check(13n*12n**23n>12n**24n,"negative");
return n;
};
console.log(JSON.stringify(certificate()));
```
Actual V8 output: {"majorant":6560,"polynomial":82,"DII":6560,"cutoff":2281,"exponent":414,"constant":6075,"negative":2}.

## 8. Upstream and independent review
H clumped StarNum and StarNumB into StarFam.lean blob 7878557c8ff202e27b0351868ce2c71e0; their old paths return 404. Exact text comparison confirmed P StarNum L10–32,57–92,94–134,201–203,212–222,224–323 at H StarFam L63,110,147,209,212,224 respectively; P StarNumB L98–129,131–144,146–156,159–355 at H L432,465,480,493. H star_fam L710–735 differs in AdmFam tuple extraction; H second_level_lt_good_of_log delegates to Pf.second_level_lt_good_of_log rather than P's explicit proof. No full equivalence claim. NumData H blob 193ad2351e539696e202159b12a708c9948b1d9b differs; source L10–55 not verbatim as block. Request independent audit of ceiling/cutoff scope, polynomial coefficient sum, exponent gaps, family uniformity, and changed AdmFam shape; dependency/kernel lanes should authenticate actual edges before asserting reachability to Main. No kernel replay, no verified URT acceleration.

## RESUME HERE
Trace the pinned definition and producer of adm5 D L K (eps/48), especially the two distinct log Qp bounds, and compare the changed AdmFam tuple at H. Also authenticate c0num and exact L1 namespace against RUN10; correct any conflation explicitly rather than altering prior records. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.
