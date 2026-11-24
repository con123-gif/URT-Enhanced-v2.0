# RUN14 — Native two-branch StarAt estimate and orbit kink

2026-11-24. RESULT: SOURCE-MATCHED conditional human derivation; exact finite arithmetic and cyclic-orbit regression executed in V8. Not a Lean replay, not a full RH proof. Source P=40e56bab026552e089d7afcfeff08d2defb9c005, repository leanprover-community/riemann-hypothesis. Upstream observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same as RUN13, merge PR #1313); no newer head observed on this run.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity and research log/state/protocol excerpts, physics CI checkpoint #391 at 19:59:15 (not RH evidence), RUN13, recent commit summaries for all lanes and latest integration/Landau RESUME HERE notes. Other lane full notes retrieval was incomplete (connector tool-call cap); external blueprint not reread. No duplicate identified in inspected summaries. RUN13 left St.starAt_D/E and orbit kink as frontier. This checkpoint does not claim exhaustive repository-wide deduplication.

## Source ledger (pinned)
All paths relative to src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/.
- PartnerCountOfCentral.lean blob f677b9041604e334f1115ae16b96cd61b1c7ee55; namespace Formalism.MainNotions.AuxBlock8.Pf.St. L15–106 orbit parametrization, L107–135 dMinus_spec/posAdd_back/dMinus_odd, L136–197 kink, L198–245 base and a_bounds, L246–307 Mn and nonnegative/odd-top/gam facts, L308–344 gU_lower, L345–368 central partner and parity sums, L369–439 kinkHH, L440–470 NumStar, L471–496 orbit_facts, L497–544 caseD_arith, L545–561 caseE_arith, L562–596 lg_ge_one/lo_D/lo_E/La_nonneg/rG_ge_one, L597–689 starAt_D, L690–695 order_le_n, L696–841 starAt_E, L842–848 starAll_of.
- Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0 L99–102 InWin, L129–135 StarAt and StarAll.
- Next numerical suppliers, not reconstructed here: StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043 L10–33 ev_log/ev_pow, L201–223 CStar/SmallB, L224–end numStar_ev; StarNumB.lean blob 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47 L98–145 hboB_arith/hDII_arith, L146–158 Facts, L159–end facts_ev. Source URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/

## 1. Exact scope and common budget
Fix D,L,X:Inst D L,K:Consts with hK:K.Nonneg, P:ParameterChoice' D L, C31,C,bo real with A1:adm1 D L X C31, C31>0, Nn:NumStar D L K C31 C bo. Then for ALL integer-valued functions a,b with InWin, ALL p with Cand, ALL t0 in goodReps X p, ALL j in lifts, the claim StarAt is
  S-N*lo <= gU+dl-Pr-ceil_N(tv)-Dp-1,
where T=topsOn X p t0, N=|T|=Nv, S=sum_T askP. Cand supplies p prime, p<X', inertClass, x^(eps/4)<=ord(hP), and the band condition; do not discard the last even if not used locally. Split p<p0 versus p>=p0 (including equality). Let n=ord(hP), nd=n*delta1, lx=log x, G=C31*lx/delta1, c=cG, eta=etaSz, w=w'', b0=b', r=rG, Nm=Nm D. Write u=w+eta+c+Nm. NumStar fields:
  hL2: L2<goodU(delta1); h3G:3*Gp<=x^(eps/4); hlx:lx>=1;
  hGu:G*u<=b0; hc0:c0num<=3b0;
  hkQ: forall prime p<p0, kQp<=b0;
  hDII: forall prime p, Dw=K.DII*(N1^3+r^5+k^2)*log_p(a_scale)<=b0;
  hC3:C>=3; hCt:K.tII*r<=C; hCD:6+4*K.tII+160*C31+7<=C;
  hCP:K.Pr1*C31<=C; hN1:K.kappaThresholdOne*N1<=C*lx;
  hbo: forall prime p with p0<=p<X', forall natural n'<=D.R.n, the exact E envelope below (B1,E depend on p,n') is <=bo.
No uniform choice of bo is asserted here. The family theorem producing these fields is next.
A1 applied with hL2 and 3Gp<=n gives nd<=N*C31*lx. Since n>=1 and delta1>0 and C31*lx>0, N cannot vanish, hence N>=1 as an integer; division yields n<=NG. This is orbit_facts. base gives b0>=w>=500, c>=0 and c<=w. p<X'<=a_scale yields log_p(2a_scale)>=1. Let ell=3c log_p(2a_scale), H=C(c+eta) log_p(2a_scale). Then H>=ell.
Let M=sum over type-V tops of Mn (odd-power sums of min(a/p^e,fill)); M>=0. gU_lower gives S+M-N*ell<=gU+dl. For completeness its source splits tops by IsV: on V, askP+Mn=gam*a_s, and gam*2c<=ell since 0<=gam<=1; off V, odd_top provides askP-ell<=gam*al_s minus its nonnegative odd-power min series. Sum both disjoint sets; the definitions of gU and dl cancel dl exactly. This leaves the task Pr+ceil(tv)+Dp+1 <= M+N*(lo-H).

## 2. D branch, p<p0
Define S1=La*a_scale/(pk)+a_scale*p^(-L1), Dw as above, t=K.tII, c0=c0num. These are nonnegative except the abstract lemma does not require kQ>=0. Source Pr<=3r(Nb0+nu) by c<=b0 and n,u>=0. tv=t*r*N*(S1+c0+kQ)+2rnc; Dp is the natural ceiling of 40nd*Dw+2rnc+40r nd*c0. Both real ceiling inputs nonnegative by native hK and size facts. Each natural ceiling costs at most +1; retain final +1 from StarAt.
The exact caseD_arith hypotheses (real abstract variables) are N>=1,n>=0,nd>=0 (unused explicitly), r>=1,lx>=1,b0>=1,n<=NG,nd<=N*C31*lx,Gu<=b0,0<=c<=u,0<=c0<=3b0,kQ<=b0,S1>=0,0<=Dw<=b0,Pr2>=0,t>=0,C31>=0,tr<=C,2Pr2+4t+160C31+7<=C. It does not assume G>=0 separately. n u<=Nb0 and nc<=Nb0. Put Z=Nb0*r*lx>=1. Then
  Pr2*r*(Nb0+nu) <= 2Pr2*Z;
  t*r*N*(c0+kQ) <= 4t*Z; t*r*N*S1 <= C*N*lx*S1;
  4rnc <=4Z;
  40nd*Dw <=40 C31*Z;
  40r nd*c0 <=120 C31*Z;
  1+1+1<=3Z.
Sum: <=(2Pr2+4t+160C31+7)Z+C*N*lx*S1<=N(C*r*b0*lx+C*lx*S1). The 160 is 40+120 and 7 is 4+3. Set Pr2=3. lo_D=H+C*r*b0*lx+C*lx*S1. Thus actual cost<=N(lo-H)<=M+N(lo-H). Subtract from common budget. All signed terms in original inequality preserved.

## 3. E branch, p0<=p<X'
Let S2=a_scale/p^2+La*a_scale/(pk), B1=Qp*c6f(p,n)+k*Qp+k*log_p(a_scale)+c, E=K.DI*(x^(A/2))^2*(N1^5+k^3)*log_p(a_scale), tN1=K.kappaThresholdOne*N1, P1=K.Pr1, K2=K.kappaThresholdTwo. Set Cw=C*w*lx/delta1. Native hCP implies P1*G*w<=Cw. n<=D.R.n by additive order divisibility; N<=n by injection of tops into Fin n. hbo applies to this n with
  P1*G*(eta+c+Nm)+K2*B1+2G*c+40*C31*lx*E+3<=bo.
Abstract caseE_arith assumes exactly N>=1,n<=NG,nd<=N*C31*lx,w,eta,c,Nm,S2,E,P1>=0,P1*G*w<=Cw,tN1<=C*lx and the preceding bo inequality. It does NOT impose extra signs on B1,K2,tN1 or bo in the abstract lemma. Multiply n<=NG by P1*(w+eta+c+Nm) and by c, and nd<=N*C31*lx by E; multiply bo and Cw guards by N>=1 and tN1 guard by N*S2>=0. Three unit terms are <=3N. Hence
  P1*n*(w+eta+c+Nm)+[tN1*N*S2+K2*N*B1+2nc+1]+[40nd*E+1]+1
  <= N(Cw+bo+C*lx*S2).
Here actual Pr additionally includes F=sum over non-V tops (fillG-b_s); tv includes J, the backward-distance min sum on non-V positions. The native identity tv=J+tN1*N*S2+K2*N*B1+2nc and Dp=ceil_N(40nd*E) are valid on this branch, and inputs nonnegative (J>=0, native constants and positive a,b). Thus total cost<=F+J+N(Cw+bo+C*lx*S2). kinkHH gives F+J<=M+N(b0/x+eta). Since lo_E=H+(b0/x+eta+Cw+bo)+C*lx*S2, desired cost<=M+N(lo-H). This cancels M from common budget exactly. No additional epsilon restriction introduced.

## 4. Kink is an injection, not an unexplained bound
For even finite orbit order n, represent positions by Fin n. V=even positions, other positions odd; Tpos subset of Fin n. For y odd in Tpos let d=dMinus(Tpos,y); if d=0 contribution is zero, otherwise 1<=d<=n and x=(y+n-d) mod n is even and in Tpos. Since n even, parity is preserved under reduction mod n, so d odd. Also (x+d) mod n=y, hence map y -> (x,d) injective (even when several y share x). For q>=2, a(x)>=0 on Tpos and W(y)>=0 globally, define f(x,e)=min(a(x)/q^e,W((x+e) mod n)). All nonnegative; odd subseries dominated by a(x)*q^-e, so summable. Reindex finite nonzero contributions by x,d; they form a subset of the odd series for each x. This proves kink exactly. No need to assume surjectivity or equality of the two sides. Empty V gives zero nonzero contributions.
For kinkHH native central class implies stepP=hP and partner=(false,s+e*hP). phi(i)=t0+i*hP injects Fin n into HH; goodReps implies representative fixed by bs. The topsOn fiber equals image of topsPos, so N=|topsPos| and V parity sums transport. n even supplied by UpperTheory.even_addOrderOf_hP_of_pow_le.2 D L p hord (not independently derived here). Substitute q=p, a(x)=a(phi(x)), W(y)=fill X b j(false,phi(y)). fill_ge_one and a_bounds establish signs. On a top, fill=b_s+off with off>=0 and off<=b0/x+eta (X.off_top). Thus min(b_s,z)<=min(fill,z), and fillG-b_s<=b0/x+eta by native definitions and off bound. For d=0 retain the same bound without a min. Each non-V contribution is bounded by corresponding kink term plus b0/x+eta; sum at most N such allowances. Therefore F+J<=M+N(b0/x+eta). See source L369–439 for exact native fillG definition use and both zero/nonzero branches. This is the substantive E-branch cancellation.

## 5. Finish and limitations
From S+M-N*ell<=gU+dl and cost<=M+N(lo-H), H>=ell, conclude S-N*lo<=gU+dl-cost by addition. Both branch theorems have identical outer hypotheses except p<p0 vs p>=p0. starAll_of fixes those data before universally introducing a,b,p,t0,j. Split using real lt_or_ge, exhaustive including equality. This is exactly the StarAll producer consumed in RUN13. No claim native NumStar holds without its fields, or that the branch is on an authenticated Main root path. No Lean kernel run or URT comparison.

## 6. Reproducible finite regression
Exact BigInt fixtures (not native D7 instances). D/E tests use integer-valued real parameters and include signed kQ/B1. Kink tests enumerate all subsets of even cycles of orders 2..12 and q=2,3,4; finite odd series through n already contains all injected indices, so its comparison is exact after clearing q^n. Transport tests check signed S. Negative witnesses: N=0 invalidates absorption of 3 units; odd cycle n=3 with V={2}, y=1, a=4,W(y)=1,W(other)=0 yields d=2, lhs=1, RHS=4*2^-5/(1-2^-6)=8/63<1; dropping common allowance dominance can fail (N=1,ell=2,H=1,S=2,M=cost=allow=0,gU+dl=0). Code's negative assertions are arithmetic witnesses, not a replay of Lean.
```js
const certificate = ()=>{
const n={D:0,E:0,kink:0,parity:0,injective:0,transport:0,negative:0};
const check=(v,k)=>{if(!v)throw Error(k);n[k]++};
const min=(a,b)=>a<b?a:b;const max=(a,b)=>a>b?a:b;
for(let N=1n;N<=5n;N++)for(let r=1n;r<=5n;r++)for(let l=1n;l<=5n;l++)for(let b=1n;b<=7n;b++)for(let s=0n;s<12n;s++){
 const G=1n+s%3n,u=b/G,c=min(u,s%4n),nn=N*G-s%N,C31=1n+s%4n,nd=N*C31*l-s%N;
 const c0=s%(3n*b+1n),kQ=s%(2n*b+1n)-b,S=s%8n,Dw=s%(b+1n),P=s%5n,t=s%7n;
 const C=max(t*r,2n*P+4n*t+160n*C31+7n);
 const lhs=P*r*(N*b+nn*u)+(t*r*N*(S+c0+kQ)+2n*r*nn*c+1n)+(40n*nd*Dw+2n*r*nn*c+r*40n*nd*c0+1n)+1n;
 check(lhs<=N*(C*r*b*l+C*l*S),"D");
}
for(let N=1n;N<=6n;N++)for(let G=1n;G<=5n;G++)for(let l=1n;l<=4n;l++)for(let s=0n;s<60n;s++){
 const nn=N*G-s%N,C31=1n+s%5n,nd=N*C31*l-s%N,w=s%7n,eta=s%4n,c=s%6n,Nm=s%8n,S=s%9n,E=s%5n,P=s%7n,k=s%4n,B=s%11n-5n,C=1n+s%9n,t=C*l-s%5n;
 const Cw=P*G*w+s%3n,bo=P*G*(eta+c+Nm)+k*B+2n*G*c+40n*C31*l*E+3n+s%2n;
 const lhs=P*nn*(w+eta+c+Nm)+(t*N*S+k*N*B+2n*nn*c+1n)+(40n*nd*E+1n)+1n;
 check(lhs<=N*(Cw+bo+C*l*S),"E");
}
// exact dyadic/q-adic finite lower bound of the infinite nonnegative series, using e<=order
for(let m=2;m<=12;m+=2)for(let mask=0;mask<(1<<m);mask++)for(let q=2n;q<=4n;q++){
 const T=Array.from({length:m},(_,i)=>i).filter(i=>mask&(1<<i));
 const den=q**BigInt(m);const a=x=>BigInt(1+(x*7+mask)%31),W=x=>BigInt((x*3+mask)%11);
 const f=(x,e)=>min(a(x)*(den/q**BigInt(e)),W((x+e)%m)*den);
 let lhs=0n,rhs=0n;const used=new Set();
 for(const y of T.filter(x=>x%2===1)){
  let d=0;for(let i=1;i<=m;i++)if(T.includes((y+m-i)%m)&&((y+m-i)%m)%2===0){d=i;break}
  if(!d)continue;
  const x=(y+m-d)%m;check(d%2===1&&(x+d)%m===y,"parity");const key=`${x},${d}`;check(!used.has(key),"injective");used.add(key);lhs+=f(x,d);
 }
 for(const x of T.filter(x=>x%2===0))for(let e=1;e<=m;e+=2)rhs+=f(x,e);
 check(lhs<=rhs,"kink");
}
for(let N=1n;N<=7n;N++)for(let s=0n;s<100n;s++){
 const L=3n+s%7n,M=s%11n,A=s-40n,H=s%17n,common=L+s%3n,allow=s%13n,R=N*allow+M-s%4n;
 const g=A+M-N*L+s%5n;
 check(A-N*(common+allow)<=g-R,"transport");
}
check(1n>0n,"negative"); // removing N>=1 permits 3<=0 at all other zero terms
check(4n*64n>8n*4n,"negative"); // odd 3-cycle: lhs=1, odd return tail=8/63 <1
check(2n*3n>1n*3n,"negative"); // if common<L then transport can fail
return n;
};
console.log(JSON.stringify(certificate()));
```
Actual V8 output: {"D":10500,"E":7200,"kink":16380,"parity":45459,"injective":45459,"transport":700,"negative":3}. Positive assertions 125698; 3 negative witnesses. No finite test proves universal real inequalities; proofs above do.

## 7. Upstream comparison and audit
At H PartnerCountOfCentral blob 5c44bfc2bbedb6887a0b4aad096ce53808dc4d46 differs from P as a full file, but the exact source text blocks P L497–544,545–561,597–689,696–841,842–848 occur verbatim at H. No full equivalence or reachability conclusion.
Independent audit requested: review source names St.kink, kinkHH, orbit_facts, caseD_arith, caseE_arith, starAt_D, starAt_E, starAll_of, especially parity, injection, ceil nonnegativity, hbo scope, and the signed transport. Request authenticated role-labelled dependency edges for all of them; no source reference promoted to kernel reference.

## RESUME HERE
Reconstruct actual NumStar producer: StarNum.numStar_ev L224 onward and StarNumB.B.facts_ev L159 onward; start by expanding CStar, SmallB, Facts and hboB_arith with exact eventually-atTop quantifier order and compare StarFam.star_fam. Retain native size and admission premises. Separately audit even_addOrderOf_hP_of_pow_le and residue-characteristic primality producer. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.
