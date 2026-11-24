# Completion of the conditional 24-field size algebra and exact SzRow join
Status: SOURCE-MATCHED conditional mathematical reconstruction. Not full RH proof; not proof of existence of Val or FamP, not local Lean verification. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. This chapter resolves the five remaining categories of the earlier 19/24 conditional size reduction.

## 1. Remaining SizeQD
Source GlobalInterpolation/SzRowCondQdPde.lean e63a21d751f0edc2d9248375c7251641d58e822a and HostBoundsTwoMulRpowLogSqLe.lean 510fc1b8bad0ce27e6d2665c1f00e389d7d9d266 (paths under src/Development/AbelianVarietyTheory/Proofs/).
Retain native hostBounds theorem, for fixed eps,C8>=1, all sufficiently large x and RankVal/HostVal witnesses: log q in [x^(ez/5)/2,x^(eps/5)]; log d in [x^(ez/5)*(log x/J)^2/2,x^(eps/5)*(log x)^2]; ez=eps/J, 1<=J<=C8. Also 1<=rdE<=QS*sqrt(q*d)/2 and log rdE<=x^eps. The discriminant bound is the source host theorem, not a consequence of rank arithmetic alone. Val.dlog gives |L'/L(1)| in the exact source notation |L.logDerivativeAtOne|<=x^eps (do not identify with a particular character L-function without source check).
Eventually log x/J>=1 uniformly, x^(ez/100)>=2 because ez>=eps/C8. Hence both log q and log d >= x^(ez/5-ez/100). Since 1/5-1/100=19/100>1/6, the required additional lower bound log q>=x^(ez/6) follows. Both upper bounds <=x^(eps/5+eps/100) by (log x)^2=o(x^(eps/100)). Together with dlog and rdE bounds these are all eight SizeQD clauses. This establishes the implication from hostBounds and Val, not independent hostBounds proof. The source uses actual RankVal/HostVal and an eventual threshold.

## 2. SizeLa
Source GoodTopCountLeConstMulLog.lean d52188dc16121d35df22f9d3a672078e91cf9b3c, topCount_and_lambda_bounds; SzRowLaRhoBot.lean 45a03cf45fc962bac8175941f803f0ab297fabb3.
For fixed eps>0 let h=2+8eps, r=ceil(8(h+2)/eps)+1, delta=x^(-eps/8), u=ceil(1/delta), M0=ceil((h+3)log(x)*10^(6r+1)), G'=(M0+5)(6r+1)u, N1=1+ceil(max(6e G' delta,(h+3)log_2 x)). These are the source definitions. Since delta<=1, u*delta<=2; M0+5=O(log x) for fixed eps; therefore G'*delta=O(log x), N1=O(log x), N1>=1. The native formula is G.La K s=K.La*N1^2*log(a), a=x*exp(x^eps). Std gives K.La>=1 for K=C.GK. Val.La_eq supplies LaG=G.La. Since log(a)=log x+x^eps, we have
 x^eps<=LaG<=2 K.La CN^2 (log x)^2*x^eps<=x^(eps+eps/100)
eventually for fixed constants. This proves SizeLa. It also discharges the scale input to SizeRho and SizeDel from preceding chapters. No actual selection of C asserted.

## 3. SizeBm and SizeXpp
Source SzRowSizeWSizeBmSizeXpp.lean 097e0049a445a49985ce43bdfb59ddf7d373211b; native Val, HCVal, SizeData2 place windows. Use B=b, E=exp(x^(eps/3)), b'=xB/E, w''=B/(nE), X''=xB/w''. For fixed ch the prior scale-separation lemma proves eventually etaSz+1<=w''<=b'<=B, sqrt(B)<=w'', x>=2. Val.bT_le and SizeLa give bT+b'/x<=B, since bT<=b'*(1+2n delta x^eps LaG/k) and every fixed polynomial times b'/B tends to zero.
Every actual embedding tau is top, thick or thin: if in topPlaces choose its TT index; otherwise test thickPlaces; the complement is IsThin by source lemma place_top_or_thick_or_thin. HCVal gives b_j=b1+j*h0v, and b1 at top is bT+floor(b'/x), at thick at least ceil(B), at thin exactly ceil(w''). Thus b1>=w''>0 (at top use bT>=b' and nonnegative floor). Since (m-1)*h0v<=m*h0v=etaSz<=w''<=b1, b_last<=2b_first. This is SizeBm.
SizeData2.win_top/thick/thin give every wj for 1<=j<=m in [w'', B+etaSz+1], hence in [w'',2B]. For every pair wj,wj', wj<=2B<=xB=X''*w''<=X''*wj'. This is SizeXpp, with exact allowed indices and no division by a possibly vanishing weight. SizeW already proved. The place partition and native windows remain required actual data; no substitute constructed embedding.

## 4. SizeWords
Source SzRowCardWordsLe.lean c5c09ce7b2edb29899fbaf9ffac0fef6bdc326c7; SzRowSizeGSizeWords.lean 9e96e23293a7e43c2ce9e4277425ab3968848926. Val.words states word cardinality=ceil(3*GamL^2*x^CF), with GamL=exp(CG*m^5*f*x^eps), CG=C.CGam, CF=C.P.CF both>=1 by Std, f=2n. Use RankVal m<=2 sqrt(x*x^-eps/8)<=2sqrt(x), n<=2x^(2+8eps) (the source also uses a weaker bound 2 C8 x^(2+8eps), with rescaling n/C8). Let y=x^(9/2+9eps). Then m^5*(2n)*x^eps<=128 y and k>=y*x^eps. With G=CG (or conservatively CG*C8 as in source), F=CF, log of unrounded word count <= log3+256G y+F log x <=(256G+F+2)y, since y>=1 and log x<=y. For x^eps>=2(256G+F+2)+3, (k-3)/2 >= (256G+F+2)y. Since log2>=1/2 and k>=3, unrounded count<=exp((k-3)log2)=2^(k-3). RHS natural integer, so ceil preserves bound. This is SizeWords. No word enumeration. This reduction is independent of the polynomial-only size envelope and uses logarithmic comparison of exponential cardinalities.

## 5. Exact source assembly, now identified
Source SzRowElevenLeSplitBound.lean 6d646554a3c43556eb9853f3d2363e37510c2181, theorem szRow_sizesAt. It joins exactly eleven blocks via SzRow.and and reorders the conjuncts by SzRow.imp:
- rankSizes: N,M,K,T,TT,De2,Lw (7)
- KRel (1)
- Cond,QD,Pde (3)
- La,Rho,Bot (3)
- Eta (1)
- Nodes (1)
- Lstar (1)
- Del (1)
- W,Bm,Xpp (3)
- G,Words (2)
- eleven_le_splitBound (1)
Total 24, exactly the order-independent inventory in ElevenLe.lean. Prior notes gave 19 conditional categories; all five missing are now reduced, with all named input assumptions retained. This is a conditional translation of the size-bound assembly, not 24 independently proven family existence obligations.

SzRowAndImp.lean ca633b5e23f18e773bffbad6293cda846711bea7 proves the general reusable join: fix eps,C satisfying Std. For each block choose c1. Set common c1=max_i c1_i. For ANY cD>=c1, select each c2_i(cD); take common c2=max_i. For ANY ch>=c2, select thresholds x0_i(cD,ch); take x0=max_i. For ANY D,L with same eps, x>=x0 and Val C cD ch L, each block applies to precisely the same D,L witness; hence all conjuncts. Three linear passes over the blocks (not over all possible parameter values); no illegal exchange of exists and forall, no replacement of witness dependence by fixed independent constants. This is how linear reduction and harmonic-scale grouping combine. It does not reduce substantive Val construction to O(N).
Actual explicitConstants_parameterConditions_large in ExplicitConstantsParameterConditionsLarge.lean 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a separately joins 21 blocks to construct ParameterChoice' with parConsts P=C.PK and P.CnW=C.P.CnW, conditional on Std,Val and HostArith. It is NOT identical to SizesAt: its other window/gap/parity/parameter obligations must be preserved. Next frontier is the actual family constructor supplying Val, HostArith, parameter choices, and coherent family fields; do not redo size algebra.

## 6. Executed exact regression
{
  "weightRatioChecks": 7680,
  "wordLogEnvelopeChecks": 2176,
  "thresholdFixtures": 24
}
Constructed abstract integer weights, word logarithmic envelopes and finite threshold-max fixtures, not native geometric samples; symbolic inequalities above establish the general conditional reductions. No new numerical values fitted, no claim URT coordinate gives unique algorithmic speed advantage, no full proof closure.

RESUME HERE: trace actual producers of Val and FamP (not merely record definitions) and exact callers of szRow_sizesAt / explicitConstants_parameterConditions_large. Integrate this whole size chapter in specialists/proof_editor manuscript. Preserve all external theorem producers, geometric witnesses and correct nested quantifiers. Separate from physics.
