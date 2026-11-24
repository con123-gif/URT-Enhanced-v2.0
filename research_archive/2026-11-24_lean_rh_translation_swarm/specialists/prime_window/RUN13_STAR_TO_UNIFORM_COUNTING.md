# RUN13 — Native StarAll to uniform counting and family closure

2026-11-24. STATUS: SOURCE-MATCHED conditional human derivation, exact finite arithmetic regression executed in V8. This is not a kernel replay or a proof of RH. Pinned upstream leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005 (P). Latest observed upstream 9282d3a102c4aff0e6026746db2a8990f5d9cddd (H), merge PR #1313. Source URLs use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by the path below.

## Continuity and boundary
Read AGENTS, research state/log/protocol and continuity excerpts, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN12, and current 14 other lane commit summaries/handoffs (including audit, dependency, kernel, integration and speed). Physics CI checkpoint #388 at 19:00:14 is not RH validation. External blueprint not reread this run. No duplicate of this specific StarAll aggregation found in those recent notes; no claim exhaustive repository-wide search. RUN12 left RemainingCountingStatement as a premise. This run finds its actual native producer and all four branch obligations, not just a conditional allowance comparison. Retain the explicit admission and size premises. Residue-characteristic primality supplier from RUN12 remains open, not silently resolved here.

## 1. Pinned source ledger
All following files are under src/Formalism/SharpRestriction/GrowthBounds/.
- LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, L99–134: InWin, GainBoundAtPairUniform, GainBoundAllUniform, GainBoundAt, GainBoundAll, RequiresAll, StarAt, StarAll. L156–159 AdmFam.
- IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b: L89 gam; L166–169 reps and topsOn; L230–258 al, capU, Excl, dl, g0, gU; L279–294 Cand, goodReps, Sig, VV; L341–364 tauP, gainP, TTP; L378–393 lo and fl.
- LogarithmicSums/TsumTruncatedShiftLe.lean blob 50b57259d62479c45f43be44634b355db323c9ed, L9–62 summable_geo/tsum_odd, L64–101 positive part identities and tsum_pos_le, L103–164 tsum_truncated_shift_le.
- LogarithmicSums/NotSingularOfCentral.lean blob c57da93c44237c19538bd07949a705adb0e8171f: L13–27 GainBoundConstants/basics; L81–208 capU_bounds, a_bounds, two_le_a, logb_facts, dl_nonneg, gam_facts, gU_le, g_zero_le_gamma_sum, Pr_nonneg; L209–315 sum_reps, VV_subset_reps, orbit cardinality and dl sum; L317–350 fl_nonneg, sum_dl_add_ep_le; L358–431 lo_ge_cp, lo_nonneg, g_zero_ge_ask_sum; L433–467 card_lifts, noop; L469–519 orbit_max_le, gain_bounds; L521–599 top_small, excl_small_of_ge, not_excl_of_sg, not_singular_of_central, hypothesis₂; L601–617 sum_TTP_served, hP_ne_zero_of_cand; L619–728 gain_bound_at_of_star; L730–737 gain_bound_all_of_star. All names in namespace Formalism.MainNotions.AuxBlock8.Pf.
- LogarithmicSums.lean blob ca9322c11898c23018dfb6076d58d08219259eab L18–34 RestStar, bo_nonneg, eventually_adm_of_admFam; L36–64 rest0 and remainingCountingStatement_of_restStar; L66–102 rest2, restW, rest3, restT, restStar, stmtEF, stmtF.
- LogarithmicSums/RemainingCountingStatement.lean blob b9435d525f79b2af1a971259b99c155f7b90ce63 L10–40 six family predicates; L47–80 stmtEF_of and stmtF_of_stmtEF.
- LogarithmicSums/StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a L11–36 star_fam; imports StarNum and StarNumB (blobs 47c8e4430e4150f61202b8afa77ca2b6369c8043 and 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47), which supply numerical facts. PartnerCountOfCentral.lean blob f677b9041604e334f1115ae16b96cd61b1c7ee55 L597–689 starAt_D, L696–841 starAt_E, L842–end starAll_of. Their internal bounds remain to expand.

## 2. Exact scope and elementary estimates

Fix native D,L, parameter choice P, instance X, K.Nonneg, Ce>=0, constants C,bo, and a,b:HH(D)->Z satisfying InWin: for every top s, a_scale<=a_s<=a_scale+a_scale/(k x^(A/2)), b_s>=b'. Here A=26. For the pointwise theorem the constant guard is C>=3, C>=2 K.dl1+Ce, C>=4 K.dl2, bo>=0 and the independent hypothesis h9 says for EVERY prime p<=X'' that ep(p)<=Ce*f*k² log_p(a_scale). The outer uniform theorem instead uses adm9 at Ce and GainBoundConstants with Ce+1. Do not omit the +1.

Fix p prime with (inertClass or signal), p<=X''. J=lifts, m=|J|>=2; T=tops; R=reps, T_r=topsOn, a disjoint partition of T. V=VV equals goodReps when Cand and Sig<=x^-eps, empty otherwise; V subset R. Cand includes p<X', inertClass, x^(eps/4)<=ord(hP), and (p0<=p implies not InBand). Thus V nonempty forces not signal, p<X' and hP nonzero. TTP is T if signal or p>=X', otherwise tops with representative in V. Note that V empty does NOT by itself imply TTP empty.

Let l=log_p(a_scale), L2=log_p(2a_scale). Since a_scale>=2,p>=2: 0<=l<=L2<=2l. al_s=a_s-2cG is nonnegative and <=6a_scale/5 (basics, a_bounds); capU>=0 and capU<=fill+cG. The odd-power series is sum_{e odd>=1} p^-e=p/(p²-1)=gam. Geometric domination makes the selected nonnegative series summable. For p>=2, gam<=4/(3p), equivalent to p²>=4. The definitions of gU and g0 subtract nonnegative corrections (min terms, dl), and the penalty Pr>=0. Therefore each maximum in gainP is between 0 and gam*sum_{s in T_r} al_s. The partition R gives
  0 <= gainP_j <= (4/(3p))*(6/5)*|T|*a_scale = 8|T|a_scale/(5p) <= 4|T|a_scale/p.
The intermediate 8/5 constant is already present in the native calculation L515–518; not a new URT improvement. The exceptional zero-gain branch is also covered.

dl_r=K.dl1*nP*Nm²*L2+K.dl2*Nv_r*L2². The representative fiber contains all distinct translates by stepP up to its additive order (bs_nsmul, bs_bs, and order injectivity). Hence |R|ord(stepP)<=n. For signal nP=2ord(stepP), otherwise nP=ord(stepP), and f=2n. Thus |R|nP<=f; sum Nv_r=|T|<=f. It follows
  sum_R dl <= 2 K.dl1*f*Nm²*l+4 K.dl2*f*l².
Since k<=Nm and ep>=0, h9 yields sum_R dl+ep<=C*f*(Nm²*l+l²)=fl. Each dl>=0, so the same holds for sum_V dl. Also lo>=3cG L2>=0 because its common term C(cG+eta)L2 dominates and every branch addition is nonnegative under the guard, including bo.

## 3. Local shift and inactive orbits
For the actual native truncated shift lemma take p>=2, c>=0, 2c<=y<=A0, A0>=1, w_e>=1, 0<=w'_e<=w_e+c, Q(e) implies odd e. Define F_e=(y/p^e-w_e)_+ and G_e=((y-2c)/p^e-w'_e)_+ on Q, zero elsewhere. If F_e>0 then p^e<y<=A0 and e>=1. The positive-part difference satisfies F_e-G_e<=2c/p^e+c<=3c. All positive F indices lie in [1,floor(log_p A0)]. Both series are dominated by summable geometric series, so
  sum F - 3c log_p A0 <= sum G.
This derives the native bound without replacing the strict cutoff by an unrestricted sum. Here c=cG, y=a_s, A0=2a_scale, w=fill, w'=capU. If all Excl indices have y/p^e<=fill, their terms are zero, hence the excluded-index restriction in g0 does not change askP. It follows for each orbit
  sum_{s in T_r}(askP_js-lo) <= max(g0_jr,0)+dl_r.
Using the partition and sum_R dl<=fl proves noop after summing over m lifts. Its Excl premise is essential.

For p>=X', e>=1: a_s/p^e <= (a_scale+a_scale/Q)/X'=b'+b'/Q <= b'+b'/x, Q=kx^(A/2)>=x. Native top fill >=b'+b'/x. Excl entails partner=(false,s') for another top s' and odd e, so it gives a vanishing term. For a signal prime, partner's first component at odd e precludes Excl altogether. For inert hP=0 and p>=X', the odd partner is (false,s) itself; all askP terms vanish. These are exactly the native helpers top_small, excl_small_of_ge, not_excl_of_sg, hypothesis₂.

## 4. Four branches of gain_bound_at_of_star

Desired inequality is sum_{j,TTP}(askP-lo)-m fl <= sum_j gainP_j - tauP, alongside the individual gain bounds already derived. Assume StarAt for every candidate p, good representative r and lift j, with a,b fixed.
(i) V empty, TTP empty: tau=0, LHS=-m fl<=0<=sum gain.
(ii) V empty, full TTP, inert and hP=0: not signal implies p>=X'; hypothesis₂ makes askP=0, lo>=0, fl>=0, so LHS<=0=gain-tau.
(iii) V empty, full TTP, not inert-zero: gainP=sum_R max(g0,0) because p<=X''; tau=0. Signal or p>=X' ensures the Excl vanishing premise, so noop is exactly the result.
(iv) V nonempty: put u_jr=gU_jr-Pr_jr and q_r=ceil_N(tv_r)+Dp+1. StarAt gives
  sum_{s in T_r}(askP_js-lo) <= u_jr+dl_r-q_r  (r in V).
The served tops partition into these fibers by sum_TTP_served; no double counting. For each j, sum_V u_jr<=gainP_j by the max and nonnegative omitted-rep terms. Therefore sum_{j,TTP}(askP-lo)<=sum_j gainP_j +m sum_V dl_r -m sum_V q_r. Since ep+sum_V dl<=fl and m>=1, ep+m sum_V dl<=m fl. Subtracting m fl yields <=sum_j gainP_j-ep-m sum_V q_r = sum_j gainP_j-tauP. No assumption of positivity of u_jr or signed ask-minus-lo is needed.

## 5. Uniform family producer, not just its statement

gain_bound_all_of_star L730–737: basics gives w''>=500, hence X''=a_scale/w''<=a_scale. Use adm9.1 at all p<=X'' and weaken its Ce coefficient to Ce+1 (nonnegative f,k²,log_p a). The constant guard is at Ce+1. Universal a,b in InWin and StarAll give the exact local hypothesis. This yields GainBoundAllUniform (askP). RUN12 supplies the separate +1 shift to GainBoundAll (askG).

The actual theorem remainingCountingStatement_of_restStar (LogarithmicSums L43–64) fixes Fm,K,hK,C31>0,Ce>=0,Cm>=0. From RestStar choose C0>=0 BEFORE any X,Y; take
  C1=max(C0,3,2K.dl1+Ce+1,4K.dl2),  C=C1+1.
For arbitrary X,Y satisfying AdmFam, choose x1 from RestStar at C1 and x2 from AdmFam at delta=1, enlarged to exceed Fm.x1. At every x>=max(x1,x2) and every i, admission supplies a9 and aSz; native b_o=b^(x^(-eps/2))>=0. Apply the uniform theorem at C1, then As.asksAll_of from aSz.2.2 and Nm<=Sc<=cG from basics and St.base, then As.gainBoundAll_add_one_of_gainBoundAllRequired (RUN12). This is GainBoundAll at C1+1. C depends on the fixed family/constants but NOT on X,Y,x,i,a,b,p. Only the threshold may depend on X,Y. Cm>=0 is retained even though this particular proof does not use it.

Crucial closure: the source actually proves RestStar by St.star_fam (LogarithmicSums L94–96), not an axiom. StarFam L11–36 chooses max(CStar,0), then at delta=eps/48 combines the admission threshold with eventual numStar_ev and B.facts_ev, and Fm.x1+1; calls starAll_of. eps>0 follows from Fm.Ix_zero and native eps_pos. It uses A1 and A5 and all native parameters and sizes. Deep numerical and orbit-case lemmas remain open to human reconstruction. This is a source-level chain, not independent kernel verification or established Main root reachability. At L98–102 stmtEF and stmtF are constructed from rest0, remainingCountingStatement_of_restStar(restStar), rest2, restW, rest3, restT; those other obligations are distinct.

## 6. Executed check
Run the following JS under Node (or other BigInt ECMAScript runtime). Exact integer fixtures for aggregate inequalities, not native D7 geometric instances. The odd-power shift uses A0=p^M so log_p A0=M exactly; denominators are cleared. The floor and constant tests use nonnegative integer fixtures including zero. Finite checks do not prove the universally quantified source claims.

~~~js
function certificate(){
 const counts={candidate:0,empty:0,full:0,zero:0,shift:0,gain:0,floor:0,constant:0,negative:0};
 const check=(x,k)=>{if(!x)throw Error(k);counts[k]++};
 const max=(a,b)=>a>b?a:b;
 for(let m=1n;m<=6n;m++)for(let r=1;r<=5;r++)for(let mask=0;mask<(1<<r);mask++)for(let seed=0n;seed<20n;seed++){
  const V=Array.from({length:r},(_,i)=>i).filter(i=>(mask>>i)&1);
  const d=Array.from({length:r},(_,i)=>(seed+BigInt(i)*3n)%9n), q=d.map((v,i)=>1n+(seed+BigInt(i))%7n);
  const ep=seed%7n,F=d.reduce((a,b)=>a+b,ep)+(seed%3n);
  let ask=0n,g=0n,om=0n;
  for(let j=0n;j<m;j++)for(let i=0;i<r;i++){
   const v=BigInt(i),g0=(seed+2n*v+j)%13n-6n,u=(3n*seed+v+2n*j)%17n-8n;
   if(V.includes(i)){ask+=u+d[i]-q[i]-(seed+j)%4n;g+=max(u,max(g0,0n))}
   else g+=max(g0,0n);
   om+=max(g0,0n)+d[i]-(seed+j)%4n;
  }
  if(V.length){const tau=ep+m*V.reduce((s,i)=>s+q[i],0n);check(ask-m*F<=g-tau,"candidate")}
  else {
    check(-m*F<=g,"empty");
    check(om-m*F<=g,"full");
    check(-m*F<=0n,"zero");
  }
 }
 // Exact odd-power shifts; A = p^M and log_p A=M exactly.
 for(let p=2n;p<=13n;p++)for(let M=1n;M<=5n;M++)for(let y=1n;y<=45n;y++)for(let c=0n;c<=5n;c++){
   if(y>p**M||2n*c>y)continue;
   const den=p**(M+2n);let a=0n,b=0n;
   for(let e=1n;e<=M+2n;e+=2n){
    if((y+e)%4n===0n)continue;
    const w=1n+(y+e)%5n,wp=w+c-(e%2n&&c>0n?1n:0n),pe=p**e;
    a+=max(0n,y*(den/pe)-w*den); b+=max(0n,(y-2n*c)*(den/pe)-wp*den);
   }
   check(a-3n*c*M*den<=b,"shift");
 }
 for(let p=2n;p<=97n;p++)for(let a=5n;a<=100n;a+=5n)for(let t=0n;t<=8n;t++){
   // gamma * (6/5)*a*t <= (8/5)*a*t/p <= 4*a*t/p.
   check(6n*p*p*a*t<=8n*(p*p-1n)*a*t&&8n*a*t<=20n*a*t,"gain");
 }
 for(let f=1n;f<=8n;f++)for(let n=5n;n<=14n;n++)for(let l=1n;l<=5n;l++)for(let dl1=0n;dl1<=4n;dl1++)for(let dl2=0n;dl2<=4n;dl2++)for(let ce=0n;ce<=3n;ce++){
   const C=max(3n,max(2n*dl1+ce,4n*dl2)), ep=ce*f*(n-1n)**2n*l;
   const d=2n*dl1*f*n*n*l+4n*dl2*f*l*l;
   check(d+ep<=C*f*(n*n*l+l*l),"floor");
 }
 for(let c0=0n;c0<=10n;c0++)for(let a=0n;a<=9n;a++)for(let b=0n;b<=9n;b++)for(let ce=0n;ce<=5n;ce++){
   const C1=max(c0,max(3n,max(2n*a+ce+1n,4n*b)));
   check(C1>=c0&&C1>=3n&&C1>=2n*a+ce+1n&&C1>=4n*b&&C1+1n>=0n,"constant");
 }
 // Removing hypotheses: floor domination, nonnegative omitted dl, odd-support exclusion, m>=1.
 check(2n*1n>1n,"negative"); // d+ep>F
 check(4n+(-3n)<4n,"negative"); // negative omitted dl invalidates subset inequality
 check(3n>0n,"negative"); // y/p^e - w positive at omitted exponent y=8,p=2,e=1,w=1
 check(0n*7n<7n,"negative"); // m=0 cannot absorb ep=7
 return counts;
}
console.log(JSON.stringify(certificate()));
~~~

Actual V8 output: {"candidate":6840,"empty":600,"full":600,"zero":600,"shift":10668,"gain":17280,"floor":40000,"constant":6600,"negative":4}. Positive assertions 83188; four negative witness assertions. Not a Lean run.

## 7. Upstream and audit
At H, NotSingularOfCentral blob b69b961ff9d364f0dfee1ded1c13450b1a7a7eae: the L730–737 block matches after whitespace and whole-line comments are stripped; L619–728 does not match under that comparison. LogarithmicSums blob 567c67a62257c7a671d673fe52bd7f0d50b0315f, its L43–64,94–96,98–102 blocks do not match under same normalization; StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L11–36 does not match. IsResidueClassZero at H blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 combined blocks not exact text matches. No inference of logical difference or equivalence from mismatches; keep P authoritative and compare declarations individually later.

Independent audit requested: verify h9 weakening, cardinality of representative fibers, four-way TTP split, ep single vs m-scaled absorption, strict thresholds, all family quantifiers, and role-labelled root paths for Formalism.MainNotions.AuxBlock8.Pf.gain_bound_at_of_star, gain_bound_all_of_star, remainingCountingStatement_of_restStar, restStar, stmtEF, stmtF, St.star_fam and St.starAll_of. No original hypotheses removed. No URT benchmark claimed.

## RESUME HERE
Reconstruct St.starAll_of and the exact two branch inequalities starAt_D and starAt_E in PartnerCountOfCentral.lean (L597–841), starting with caseD_arith L497–544 and caseE_arith L545–561, then trace NumStar, numStar_ev and B.facts_ev. Resolve native residue-characteristic primality supplier separately. Request authenticated role-labelled edges for the names above. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.
