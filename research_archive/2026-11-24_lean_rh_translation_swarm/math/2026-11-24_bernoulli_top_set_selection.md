# Bernoulli top-set selection and weighted coset balance
Status: source-matched human derivation of the selection and asymptotic probability budget. Some local marked-pattern and tail lemmas remain cited source obligations, not independently rederived here. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources relative to src/Development/AutomorphicArithmetic/ThickFrames/:
select.lean 32751767563d67d48acb0d4ff4e2e256d03b42e3; SharesOfCounts.lean 113e4cdc1f57fb1a746d8c0a0c12471ad9864dc2; topsGroup.lean 84d05b484bb41e3c6549da74fb667d83414e2ebd; topsFrame.lean 43fb28cdfebc62dbe0904c834116c39bd43961b3; orbitSum.lean e63add475a7d69b5a9380a730e7a7115380d42b8; orbitTerms.lean 065bd0ae97e6d4da20d104d7cfacf4cab3b8aac7; NotGoodLe.lean e830326694c79556247a5f7414b838ea42cede53; MarkedLowBounds.lean 52328d6049bab8ecb3e348ad64bca53687be1e20; TilesLe.lean 83d94cf2d4488f8864b5a2468874254460aebe04; TailLe.lean 61233648e6fb040b670e08ce9dfb097e0b3bb8f3.

## 1. One probabilistic witness, not separate incompatible selections
Let A be a finite set, N=|A|, partitioned by cl:A->kappa. Independent Bernoulli variables X_a have probabilities p_a in [0,delta] subset [0,1]. The random subset T={a:X_a=1} has probability w(T)=prod_{a in T}p_a prod_{a not in T}(1-p_a); total probability 1. For coset c let Y_c=sum_{cl(a)=c}(X_a-p_a). Independence and E X_a=p_a give E Y_c=0 and E Y_c^2=sum_{cl(a)=c}p_a(1-p_a). Therefore
 E sum_c Y_c^2<=delta*N<=D^2/2,
assuming D>0 and D^2>=2delta*N. This is the elementary content of sel_moment and select; no powerset enumeration is needed to evaluate these moments. In particular the variance budget can be evaluated in O(N) arithmetic operations by accumulating one sum per class.

Let I be the finite prime/index set, omega_i>=0 and BAD(i,t,T) any predicate. Assume P(t in T AND BAD(i,t,T))<=beta*delta for every i,t, beta>=0. The weighted bad count B(T)=sum_i omega_i sum_t 1_{t in T AND BAD} is nonnegative, with E B<=M=beta*delta*N*sum_i omega_i by linearity; no independence of bad events assumed.
If M>0, consider F(T)=sum Y_c^2/D^2+B(T)/(4M). Its mean <=1/2+1/4=3/4 (source uses <=1). A positive-probability subset has F<=mean: otherwise every positive-weight value would exceed the average. Consequently for this SAME T, |Y_c|<=D for every c and B(T)<=4M. If M=0 then nonnegative B vanishes on every positive-weight subset; select one with sum Y_c^2<=D^2/2. This preserves the source's zero-budget branch without dividing by zero.
A useful alternative implementation is the standard conditional-expectation method: assign bits one at a time, choose a positive-probability branch whose conditional expected F does not increase. The class-variance component can be updated in constant time per assigned bit via per-class conditional mean and remaining variance. HOWEVER the arbitrary BAD conditional expectations may be computationally hard; no general O(N) deterministic witness algorithm is claimed. The source uses finite existence, not a polynomial-time construction. Do not replace the existential proof with an unverified efficient search.

## 2. Biased cosets and the exact density
For finite abelian A and subgroup A0, write o=[A:A0]>=1, n0=|A0|>=1, N=o*n0. Set p_a=delta on A0 and 3delta/4 elsewhere. Expected coset counts are mu_c=w_c*delta*n0/4, w_0=4, other w_c=3. Sum mu=(3o+1)delta*n0/4. Let C_c=|T intersect coset c|, M_T=|T|. From |C_c-mu_c|<=D, obtain |M_T-mu|<=oD. If 4oD<=eta*delta*n0 and eta<=1, positivity implies eta>=0 and oD<=delta*n0/4. Hence 3delta*N/4<=M_T<=2delta*N (in fact upper <=delta*N+delta*n0/4), giving required density.
Then
 |C_c-w_c M_T/(3o+1)| <= D+w_c oD/(3o+1) <=3D.
Also 3D<=3o^2 D <= (3o/4)*eta*delta*n0 <= eta*M_T. Thus the required Shares bound holds for every coset with normalized weights 4/(3o+1),3/(3o+1). This is exactly shares_of_counts. It is not a fitted ratio or a URT physical parameter.

## 3. Why the concentration scale suffices
Set h=2+8eps, delta=x^(-eps/8), eta=x^(-1), D=sqrt(2delta*N). Assume x>=1, eps>0, x^h/2<=N<=Co*x^h, o<=Co. For sufficiently large x, x^eps>=64Co^4. Then delta*N>=x^(2+63eps/8)/2>=x^(2+eps)/2>=32o^4 x^2. Squaring (all positive) yields 4oD<=x^(-1)*delta*N/o=eta*delta*n0. The exact tg_num inequality follows. Since x^(-1)<=x^(-1+eps), the output meets the weaker requested Shares tolerance.

## 4. Actual orbit failure probability
topsGroup obtains the pointwise BAD premise from orbit_sum, not_good_le, orbit_terms. For each orbit direction h_p with additive order n>=x^(eps/4), choose base b=bs(h_p,t) such that t=b+i0*h_p for some index i0 modulo n. The n orbit positions are distinct. Marginalizing independent Bernoulli variables outside this orbit and fixing t in T factors the probability as p_t times the expectation over independent remaining indices with the marked index i0 inserted. This is orbit_sum, exact even for nonconstant probabilities.

Write K=ceil(8(h+2)/eps), r=K+1, u=ceil(1/delta), P=10^(6r+1), M0=ceil((h+3)log(x)*P), G'=goodG'(r,delta,h,x), J=orbitWindowCount(r,delta,h,x)-1=ceil(max(6e G' delta,(h+3)log_2 x)). GoodOrbitIntervalTileCondition is conjunction of CondA, CondTiles, CondIntervals. The exact union bound from not_good_le is
 n*choose(L2,K)*delta^K + n*(1-markedLow(delta,r,u))^M0 + n*binUpper(G',delta,J).
Retain source tail_le, tiles_le and the conditions (M0+1)(6r+1)u<=n. For fixed eps, Lb, Co, u=O(x^(eps/8)), M0=O(log x), so the product is eventually <=x^(eps/4)<=n. K ensures delta^K<=x^(-(h+2)); choose(L2,K)<=max(Lb,1)^K. 
For 0<delta<=1/100, u delta in [1,1+delta], log(1-delta)>=-delta/(1-delta). Thus (1-delta)^u>=exp(-103/100)>3/10, and floor(u/2)*delta>=99/200. The marked probability expression is ((1-delta)^u)^(3r+1) * (floor(u/2)*(3delta/4)*(1-delta)^(u-1))^(3r). Both bases at least 1/10 and at most 1, hence markedLow>=1/P. Removing the one tile that contains forced i0 leaves at least M0 disjoint trials in each cyclic block of M0+1 tiles. Independence gives failure <=(1-markedLow)^M0; union over at most n tile starts gives the second term. Then (1-markedLow)^M0<=exp(-M0/P)<=x^(-(h+3)).
For the third term use source ot_binUpper_le for J>=6e G' delta, giving binUpper<=exp(-J)<=x^(-(h+3)). The exact local marked event formula (marked_ge) and binUpper tail inequality still merit independent source proof review; do not assume arbitrary tile patterns have this probability.
Since n<=Co*x^h, total failure <=Cb*x^(-2), Cb=(|Co|+1)(max(Lb,1)^K+2). This is orbit_terms. Multiplying by p_t<=delta gives pointwise joint bound beta*delta, beta=Cb*x^(-2), required by select.

## 5. Integration to native host
topsGroup now yields one TT satisfying density, Shares, weighted exceptional bound. topsFrame transports through |phi.A|=phi.ord and subgroup index phi.o. topsBase applies actual residue-prime filtering and good-orbit equivalences; topsChoiceH uses PairWin/PairRow, class-zero prime lower bound, rank/host constants, and transports result to HostGood. The separate Behrend thick set T2 from prior chapter is not TT. hostOfFieldOf constructs both and preserves both. No geometric family existence inferred solely from finite group selection.

## Executed exact regression
{
  "selectionCases": 92,
  "subsetEvaluations": 12840,
  "zeroBadBudgetCases": 25,
  "cosetCountCases": 2016
}
Constructed finite Bernoulli tests enumerate support with exact rational weights, verify mean and variance and a simultaneous positive-weight witness, including zero M. Constructed coset counts verify exact rational normalization. These check generic algebra and finite existence, not real large prime orbits or Lean kernel. 
```js
function verify(){
 let cases=0,subsets=0,zeroCases=0,shares=0;
 for(let N=1;N<=9;N++)for(let o=1;o<=N;o++)if(N%o===0)for(let mode=0;mode<4;mode++){
  const p=Array.from({length:N},(_,i)=>i%o===0?4n:3n),den=8n**BigInt(N),W=[1n,3n],sw=4n;
  const mu=Array.from({length:o},(_,c)=>p.reduce((s,v,i)=>s+(i%o===c?v:0n),0n));
  const event=Array.from({length:2},()=>Array(N).fill(0n));let mass=0n,EB=0n,EY=0n,rows=[];
  for(let mask=0;mask<2**N;mask++){
   let w=1n,B=0n;const c=Array(o).fill(0n),bad=[];
   for(let i=0;i<N;i++){const yes=Boolean(mask&(1<<i));w*=yes?p[i]:8n-p[i];if(yes)c[i%o]++;}
   for(let j=0;j<2;j++)for(let i=0;i<N;i++)if((mask&(1<<i))&&mode!==0&&(mode===1||((mask+3*i+j)% (mode+2)===0))){B+=W[j];bad.push([j,i]);}
   for(const [j,i] of bad)event[j][i]+=w;
   const Y=c.map((v,i)=>8n*v-mu[i]),Y2=Y.reduce((s,v)=>s+v*v,0n);
   mass+=w;EB+=w*B;EY+=w*Y2;rows.push({w,B,Y,Y2});subsets++;
  }
  if(mass!==den||EY>32n*BigInt(N)*den)throw Error("moment");
  const e=event.flat().reduce((a,b)=>a>b?a:b,0n),mNum=e*BigInt(N)*sw;
  if(EB>mNum)throw Error("bad expectation");
  const Dden=64n*BigInt(N);
  let found=false;
  for(const r of rows)if(r.w>0n){
    const goodEnergy=mNum===0n?r.Y2<=Dden:r.Y2*4n*mNum+r.B*den*Dden<=Dden*4n*mNum;
    if(goodEnergy){if(r.Y.some(v=>v*v>Dden)||r.B*den>4n*mNum)throw Error("selected bounds");found=true;break;}
  }
  if(!found)throw Error("selection");cases++;if(mNum===0n)zeroCases++;
 }
 for(let o=1n;o<=7n;o++)for(const n0 of [64n,128n,256n,512n])for(let D=0n;4n*o*D*8n<=n0;D++){
  // delta=1/2, eta=1/4, integer exact coset means n0/2,3n0/8.
  for(let mask=0;mask<2**Number(o);mask++){
   const counts=Array.from({length:Number(o)},(_,i)=>(i===0?n0/2n:3n*n0/8n)+((mask&(1<<i))?D:-D)),T=counts.reduce((a,b)=>a+b,0n),N=o*n0;
   if(4n*T<N||T>N)throw Error("density");
   for(let i=0;i<counts.length;i++){const w=i===0?4n:3n,z=(3n*o+1n)*counts[i]-w*T,abs=z<0n?-z:z;if(4n*abs>(3n*o+1n)*T)throw Error("shares")}
   shares++;
  }
 }
 return {selectionCases:cases,subsetEvaluations:subsets,zeroBadBudgetCases:zeroCases,cosetCountCases:shares};
}
console.log(verify());
```
RESUME HERE: prioritize actual classSel / DesignChoices / FamP formation and the 21 non-rank SizesAt conditions. For independent audit of probability leaves, follow MarkedGe and ot_binUpper_le. Integrate this chapter rather than redo finite group selection.