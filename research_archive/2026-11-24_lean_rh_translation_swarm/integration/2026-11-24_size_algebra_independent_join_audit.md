# Independent size-closure join audit
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. The parallel chapter math/2026-11-24_complete_conditional_size_algebra.md already exists (blob 506ef3fc1a88276a6dcdbf965ea84c72eac3b9a0); preserve it. Independently inspected actual source SzRowElevenLeSplitBound.lean (6d646554a3c43556eb9853f3d2363e37510c2181), under src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation. Its theorem szRow_sizesAt joins precisely 11 blocks:
1. N,M,K,T,TT,De2,Lw
2. KRel
3. Cond,QD,Pde
4. La,Rho,Bot
5. Eta
6. Nodes
7. Lstar
8. Del
9. W,Bm,Xpp
10. G,Words
11. splitBound >= 11
These are 24 distinct fields. The source then permutes them into the order of ElevenLe.SizesAt using SzRow.imp. SzRow.and (ca633b5e23f18e773bffbad6293cda846711bea7) takes max first thresholds before selecting cD, max second thresholds at the SAME cD before selecting ch, and max x thresholds at the SAME cD,ch. All apply to the same D,L satisfying Val. This gives a reusable linear finite conjunction procedure; individual thresholds and witnesses are still mathematical work.

Independent final-five derivations agree with the existing chapter: uniform prime lower margin ez/100 absorbs 2; 19/100>1/6; upper logarithmic powers absorbed by eps/100; dlog from Val; factRd from hostBounds retained. N1=O(log x) from the marked Bernoulli tile scale and delta*ceil(1/delta)<=2; LaG from Val.La_eq and fixed K.La>=1. Three native place windows and eta+1<=w''<=b'<=b give weights in [w'',2b] and X''w''=xb. Native b_j=b1+j*h0v with b1>=w'' gives SizeBm. Word bound follows by logarithms: y=x^(9/2+9eps), m^5 f x^eps<=128y, log(3 GamL^2 x^CF)<=(256 CG+CF+2)y. At x^eps>=2(256 CG+CF+2)+3 the latter <=(k-3)log2; ceiling preserves integer upper bound. All these are conditional implications.
Executed independently in this session: 1536 positive rational prime exponent gap checks, 2184 abstract integer weight-window fixtures, 3600 exact integer word-log budget checks, 100 nested threshold joins; no failures. These are regression checks of algebra, not source kernel or native witness verification.

Separate exact next junction: ExplicitConstantsParameterConditionsLarge.lean (8bb3bd4a9a5343eaeaef138a1dccf57016010f0a), explicitConstants_parameterConditions_large: SzRow (fun C D L => HostArith D.host -> exists P:ParameterChoice' D L, parConsts P=C.PK and P.CnW=C.P.CnW). This joins 21 blocks including signature/gap/prime conditions. It is NOT the same as SizesAt. Prioritize producer of Val, HostArith and actual FamP construction. Full proof export retry, full lexical pool and typed challenge had no completed status records at this turn's check. Do not claim completed. All source-level size algebra covered conditionally; entire proof still open.
