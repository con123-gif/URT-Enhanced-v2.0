# RUN16 — Direct derivation of adm5, cutoff disambiguation
2026-11-24. RESULT: SOURCE-MATCHED predicate; independent conditional human derivation, finite exact regression executed in V8. PARTIAL for locating the actual native supplier. P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from RUN15. No kernel replay or URT advantage.

## Preflight
Read AGENTS, research state/log/protocol/continuity excerpts, swarm protocol, handoff queue, 15-lane expansion, RUN10, RUN15, recent 35 commit titles and recent integration/editor/geometry/literature/character/math RESUME HERE sections; dependency/kernel/acceleration/audit latest commit paths inspected. Remaining peer full notes and external blueprint not reread (connector call limit). No duplicate of this target found in inspected records. Physics CI summary checkpoint #398 at 22:12:10Z is not RH validation. No changes outside this lane.

## Pinned source anchors
All paths below relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ . 
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f, AuxBlock8.adm5 L115–119, admitted L235–244.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b, G.Consts.Nonneg L31–33, hG/rG/N1/Gp L37–45, cG L47, L1/L2 L51–54, La L58, Qp L87, c0num L91.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b, BasicNotions.Scale L9–17, a,b,X',b',A,p0,delta1 L27–45.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043, St.ev_log L10–22 onward, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six/one_le_k L136–146, numStar_ev L224–323.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, Pf.AdmFam L156–159.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a, St.star_fam L11–36.
- SharpRestriction/Divisibility/LocalQuadraticParts.lean blob c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265, leastPowerExponent L485.

## Exact predicate and quantifiers
Fix D:D7,L:SizeData₂ D,K:Consts, real δ. Write x=L.sc.x, ε=L.sc.eps, k=D.R.k. Native Scale requires x>1, 0<ε<1/52, J>=1. adm5 consists of ALL FOUR inequalities:
  x^(ε-δ) <= La(K,s) <= x^(ε+δ),
  for EVERY natural prime p, (p<p0 => log Qp <= x^(ε/8+δ)) AND (p<X' => log Qp <= x^(11ε/24+δ)).
Here p0=k²x^26, X'=exp(x^(ε/3)), Qp=p^Gp, La=K.La*N1²*log a, a=x exp(x^ε). Both prime guards are strict; both can apply. No inert-class filter. AdmFam fixes family, constants and X,Y before ∀δ>0 ∃x0>1 ∀x>=x0 ∀i admitted(...). No per-prime or per-instance threshold allowed.

## Independent direct proof of the two prime bounds
Fix ε in (0,1/52), δ>0, and native SizesAt. For x>=e, let ell=log x>=1 and c=cGE(ε)>0. St.Gp_le gives Gp<=c ell x^(ε/8); St.k_le_x_pow_six and one_le_k give 1<=k<=x^6. Since p>=2, log Qp=Gp log p (integer power; real base positive).
- If p<p0, log p<log p0=2log k+26ell<=38ell, so log Qp<=38c ell² x^(ε/8).
- If p<X', log p<x^(ε/3), so log Qp<=c ell x^(11ε/24), since 1/8+1/3=11/24.
Choose x large enough that 38c ell²<=x^δ and c ell<=x^δ. Explicit integral: for any h>0 and x>=1, log x=∫_1^x dt/t <= ∫_1^x t^(h-1)dt=(x^h-1)/h<=x^h/h. Taking h=δ/4, sufficient thresholds are x^(δ/2)>=608c/δ² and x^(3δ/4)>=4c/δ. Both depend on ε,δ only, not p,k,D,L,i. At δ=ε/48 the two exponents are 7ε/48 and 23ε/48 exactly, giving RUN15's Qp bounds after exponentiation. The direct proof uses authenticated upstream estimates, but is not claimed to be the native Lean producer.

## Independent La envelope and necessary premise
St.first_count_le_log gives N1<=d ell, d=cNE(ε)>0. Native N1 is a natural ceiling of a maximum plus one (StarNum L123–134, also see RUN15), so N1>=1. log a=ell+x^ε. For x sufficiently large ell<=x^ε by the same integral. If K.La>0 is FIXED before x, then
  K.La*x^ε <= La <= 2 K.La d² ell² x^ε.
Choose x large enough that x^δ>=1/K.La and 2 K.La d² ell²<=x^δ, e.g. the latter follows from x^(δ/2)>=32 K.La d²/δ². Then x^(ε-δ)<=La<=x^(ε+δ). Taking the maximum of the thresholds establishes the whole adm5 predicate for each matching native size instance. K.Nonneg alone is NOT sufficient for this supplier: K.La=0 makes La=0 whereas x^(ε-δ)>0 even when ε-δ is negative. Conversely the admitted predicate itself forces K.La>0 (N1² log a positive). The native construction of the constant K.La and theorem supplying the full admitted family remain to be located. This is an additional sufficient condition for the independent derivation, not an alteration of the original admitted predicate or a claim that the root already supplies it.

## Distinct cutoff correction and c0num
G.L1 = ceil_N(log_p((k x^26)^4)); leastPowerExponent = ceil_N(log_p(k² x^78))+1. They are NOT definitionally equal. Ratio of logarithm arguments is p0=k²x^26. For 1<p<=p0, log_p(p0)>=1, hence ceil_N(log_p((k x^26)^4))>=ceil_N(log_p(k²x^78))+1 (arguments positive and log of smaller argument nonnegative for k>=1,x>1). No all-prime ordering follows from this argument; p>p0 requires separate reasoning. At x=2,k=1,p=2, the two integers are 104 and 79; this is an arithmetic witness, not a constructed D7. RUN10 order guard applies to leastPowerExponent, RUN15 second-level bound to G.L1. No replacement of one by the other. c0num=2b'+2cG; given cG<=b'/x, x>=2, b'>=0, c0num<=3b'. This authenticates the previously unexpanded definition; retains the native source premises supplying cG<=b'/x.

## Upstream drift
H IsResidueClassZero.lean blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6, Gp L83,L1 L89,La L96,Qp L125,c0num L129: displayed definitions unchanged. H SmallOrderPrimes.lean blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7, adm5 L110–114 unchanged; admitted L233–236 drops adm2 and adm3 from P conjunction. H Conclusion1OfGainBoundAll.lean blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8, AdmFam L173–176 unchanged text but meaning depends on changed admitted. H StarFam.lean blob 7878557c8ff202e27b0351868ce2c98dee2c71e0, L719–735 extracts ⟨A1,-,A5,-⟩ rather than P's six-way destructuring. No equivalence asserted, no P hypothesis dropped.

## Reproducible finite checks
Run the following in Node/V8. Abstract integer envelopes check algebra and cutoff comparisons, not transcendental asymptotics or native D7 existence. The analytic proof above is what supplies universal real inequalities.
```js
const counts={low:0,high:0,la:0,cutoff:0,c0:0,negative:0};
const ck=(x,k)=>{if(!x)throw Error(k);counts[k]++};
const ceilLog=(p,x)=>{let n=0,v=1n;while(v<x){v*=p;n++}return n};
for(let ell=1n;ell<=40n;ell++)for(let G=1n;G<=10n;G++)for(let y=1n;y<=5n;y++){
const gp=G*ell*y;
const d=38n*G*ell*ell;
ck(gp*(38n*ell)<=y*d,"low");
let z=2n*y+1n;ck(gp*z<=y*z*d,"high");
const N=G*ell,E=ell+1n,K=3n;
ck(K*N*N*(ell+E)<=2n*K*G*G*ell*ell*E,"la");
}
for(let p=2n;p<=17n;p++)for(let x=2n;x<=8n;x++)for(let k=1n;k<=4n;k++){let small=k*k*x**78n,ratio=k*k*x**26n,large=small*ratio;let a=ceilLog(p,small)+1,b=ceilLog(p,large);if(p<=ratio)ck(b>=a,"cutoff");}
for(let x=2n;x<=20n;x++)for(let b=0n;b<=30n;b++)for(let c=0n;c<=b;c++)if(c*x<=b)ck(2n*b+2n*c<=3n*b,"c0");
ck(ceilLog(2n,2n**104n)!==ceilLog(2n,2n**78n)+1,"negative");ck(0n<1n,"negative");ck(ceilLog(2n,4n)<ceilLog(2n,4n)+1,"negative");console.log(counts);
```
Executed output: {"low":2000,"high":2000,"la":2000,"cutoff":448,"c0":1561,"negative":3}. 8009 positive regression assertions and 3 elementary witness assertions. Last two witnesses are elementary illustrative algebra, not a full mutation test. No Lean kernel execution.

## RESUME HERE
Find the actual pinned theorem producing admitted/AdmFam from the native size family, in particular the fixed positive K.La supplier and exact adm5 proof. Connector code search returned no results for adm5/admitted_of, so do not claim native supplier identified. Request dependency/kernel lanes to locate authenticated incoming/outgoing references to AuxBlock8.adm5, G.La, Pf.AdmFam and St.star_fam; audit direct integral thresholds, cutoff comparison, strict guards and H admission deletion. Then compare independent derivation against native producer without deleting any original hypothesis. HANDOFF TO audit, dependencies, kernel, prime_window, integration, editor. Project OPEN.
