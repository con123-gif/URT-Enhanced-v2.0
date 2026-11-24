# Geometry run 6 — finite protected specialization and positive ramification
2026-11-24. RESULT: SOURCE-MATCHED local human reconstruction; finite scalar regression executed; no kernel replay. Project OPEN.

## Continuity
Read AGENTS, RESEARCH_STATE, RESEARCH_LOG, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary (checkpoint 369, run 45394145559 PASS for Cathedral, not RH), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, previous geometry RUN4–5, current specialist, editor, dependency, audit, integration, structure and math handoffs. No overlapping producer identified. The external blueprint linked in queue was not reopened this run. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed latest e26756e547b281cbf137eb7e0f16cccb738f3f84 (2026-11-24T12:49:24Z). The old ExistsPointOfValGen path returns 404 at latest, so no revision equivalence claimed. This is the pinned proof only. No physical queue changes.

## Source ledger (all nine returned pinned blob IDs matched; 57 literal anchors located)
Paths relative to src/:
- Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ExistsPointOfValGen.lean 431fac2f75d387f15000b692a7d3fab9bb3e75dc: exists_point_of_val_gen 9–75; exists_cdvr_point_gen 79–286. Anchors lines 9,22,38,51,53,67,79,102,136,141,144,153,163,174,181,195,198,200,212,243,245,286.
- Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/ExistsPointOfVal.lean fd82a60e19a3b136aa30dc3f0803670912ec48b3: exists_prime_eq lines 17–54; NNReal predecessor exists_point_of_val 56, exists_cdvr_point 126; anchors 17,20,35,56,126.
- Development/AbelianVarietyTheory/Proofs/UnitaryExistence/NumberFieldFinitePlaceCompletionEmbedding.lean f5cf59e19d20ad27eb191b6d78fa590cfe4cf2f4: anchors 110,113,153,156,174; AdicCompl.isAdicComplete, finite_res, kMap, exists_e.
- Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean 4d2546abb6eaa7950fcfeb20dd8adca341631fa2: anchors 57,70,71,78,102,166,170,171,179.
- Development/AbelianVarietyTheory/Counterexamples/LevelGroupExamples/VVAlgebraMapNonneg.lean c996b275ae65f0348d7879023909d92334006ed9: nval_map_of_overLa 94–113; intAll_ramified 117–131; anchors 94,106,117,130.
- Development/AbelianVarietyTheory/Proofs/TwistedOperators/ModuliPointIntegralFrameAfterFiniteExtension.lean 298cdd04964790141271458fc6ceba40d55430ad: anchors 300,305,310,334,342.
- Development/AbelianVarietyTheory/Proofs/TwistedOperators/IntegralFrameExtensionOfRankZeroSignature.lean 4f61dbd79337fcfdb4f87ef060e6a4cf16d8e470: anchors 42,52,53.
- Development/AbelianVarietyTheory/Proofs/RingsOfIntegers/ExistsCdvrFiniteExtension.lean d89c704f9abe7a68987af04aeccd884f53f9472b: two anchors at 81.
- Development/AbelianVarietyTheory/Proofs/UnitaryExistence/IntAll.lean 4ce2f8fdf261d60498aa4c67d3b17fa56cc94084: anchors 25,27.

## 1. Exact specialization theorem
K a number field, Omega a field over K, la a height-one prime of O_K, Gamma a linearly ordered commutative group with zero, nu:Valuation Omega Gamma. Require (h1) nu(a)<=1 for every a in O_K and (h2) nu(a)<1 for every a in la. Gn,W,N finite subsets of Omega, Gn bounded by 1, K(Gn)=Omega, and every element of N nonzero. The theorem produces a complete DVR T (ring T.V, fraction field T.Fr), ring embedding io:K→T.Fr, natural e with OverLa la T.V io e (positive and vV(io a)=e*vLa(a)), finite residue field, K-subalgebra S of Omega, and ring map rho:S→T.Fr. On K it is io, S contains Gn,W,N, rho is nonzero on N, vV(rho g)>=0 for every g in Gn, and vV(rho g)>0 when g in Gn, nu(g)<1 AND rho(g) is nonzero. This last nonzero premise cannot be dropped: the source uses totalized vV(0)=0. W only needs membership in S; no nonvanishing or integrality of its images is promised. Neither global injection nor preservation of all valuations is claimed.

## 2. One element protects every required fraction
Let A=O_K[Gn]. Finite generation gives finite type; valuation inequalities survive sums and products so all of A has nu<=1. The generation hypothesis K(Gn)=Omega gives Frac(A)=Omega, by closure under sum, product and inverse (inverse of zero handled separately under Lean's totalized field operations). For each x choose a_x,b_x in A, b_x nonzero, x*b_x=a_x. For x in N the numerator is nonzero too. Define exactly
  t = (product_{x in W union N} b_x) * (product_{x in N} a_x).
Since A is a domain, t is nonzero (empty products equal 1). This protects all needed denominators, but only the required numerators. It is incorrect to require merely all b_x!=0 before specialization: some can be killed by the map. The construction makes the single condition g(t)!=0 imply every required factor survives. No enumeration of all rational functions is needed.

## 3. Finite arithmetic specialization
exists_point_of_val_gen takes K,Omega,la,Gamma,nu,h2, a finite-type O_K-subalgebra A bounded by 1, and t in A nonzero. The strict-value elements P={a:nu(a)<1} form a proper ideal by the ultrametric inequality and boundedness. Choose maximal m containing P. Choose nonzero pi in la; its image lies in m, and pi*t!=0. The imported exists_mem_height_map_le_one applied to D(pi*t) and the generic point (0) below m yields prime q subset m avoiding pi*t and with the indicated height-at-most-one property of m in the quotient. In particular both pi and t avoid q. Because la is a nonzero maximal prime of O_K, contraction of m to O_K equals la. If contraction of q were nonzero, it too would be maximal, equal la, contradicting pi outside q. Thus O_K embeds in B=A/q; m/q remains maximal.
The imported exists_valuationSubring_of_height_le_one on B and m/q (with the height and pi hypotheses) supplies a finite extension field L/K, valuation subring O of L and injective ring hom B→O whose base-map agrees with K and whose maximal ideal pulls back to m/q. L is a number field by finite dimension. Compose with A→B to get phi; phi(t)!=0, and any strict-value element goes to a nonunit of O. The two imported existence lemmas are real geometric obligations, not discharged here, and not called axioms merely by name. No arbitrary choice of q or arbitrary evaluation can replace them.

## 4. Completion and sign preservation
The proof of exists_prime_eq first puts O_L in O by integrality. Contract the maximal ideal; nonzero pi in the contraction makes it a nonzero prime w. The localization (O_L)_w embeds in O because every denominator outside w maps to a unit. It is a DVR, and the valuation-ring overring comparison gives equality since O is not the entire field (pi is a nonzero nonunit). The original la lies below w: all its elements map to nonunits, and maximality of la gives equality on contraction.
Take T.V to be adic completion integers at w and k:L→T.Fr the fraction-field embedding. AdicCompl.exists_e supplies e1>0 with vV(kz)=e1*vLa_w(z). Its proof uses the equality of contractions of maximal ideals and the positive ramification index. AdicCompl.isAdicComplete and finite_res supply completeness and finite residue; finite_res uses density to approximate a residue by L, then approximation by O_L, giving a surjection from the finite quotient O_L/w. The field restriction has e2=ramificationIdx'(la,w)>0 and vLa_w(a)=e2*vLa(a) for a in K. Consequently e=e2*e1>0, not e1+e2. Set g=k∘inclusion∘phi.
Let P0=ker g, prime as target is a field, and S0=A_(P0) embedded in Omega. Every denominator outside P0 maps to a nonzero element and hence a unit of T.Fr, so localization gives rho0. All of K is in S0 because every nonzero base integer is preserved by the K embedding. Regard S0 as K-subalgebra S. The protected product g(t)!=0 puts W,N in S, with rho(x)=g(a_x)/g(b_x), and rho(N) nonzero. Gn already lies in A. A bounded element maps to O, so its additive order is nonnegative (zero branch uses totalized vV). A strict-value element maps to a nonunit; if its image is nonzero, its additive order is strictly positive, which stays positive under multiplication by e1. All theorem conclusions now follow. The map may have a kernel, namely the elements specializing to zero; it is not a field embedding of Omega.

## 5. Integral frame and return to RUN5
In fin_small_gen, Gn={a_i/a_0}_i union {q}, W contains chart generators and N={a_0,b}, where q=a_0^tau/b, b=genVal(f), a_0 has maximal multiplicative valuation among nonzero finite lattice generators. Thus all chart polynomial evaluations lie in S, yielding the chart map psi to T.Fr. exists_frMap produces a compatible framed point. The input intAll_all is passed to intAll_ramified (not a numerical assumption). That lemma consumes IntAll Xo c, la, T, io, e, OverLa, finite residue, and a FrPt. It returns T',io',r>0, integral frame y', OverLa at r*e, finite residue, algebra embedding phi:T.Fr→T'.Fr, frame z and weight-indexed units t_j with FrMap phi y z and FrBor t z y'.1.
The ramification normalization is independently derived in nval_map_of_overLa: integrality of the ring map gives vV'(phi x)=r*vV(x) by exists_vV_map; compare a base uniformizer with vLa=1 to get e'=r*e. Since e'>0, r>0. Therefore normalized nval is unchanged, including the source's zero case.
The positive-rank frame-extension route intFrExt (AnyLevelFrame, lines 300–343) raises to a good level with compatible coefficient field; obtains a finite extension and CDVR extension, good-level moduli model and extended point; uses thetaCore_of to obtain the section data, composes SAB maps and applies exists_intFr. The rank-zero route intFrExt_of_rank_zero uses the model over Spec Z and identity extension r=1. The separate good-level IntAll construction invokes intAll_of' with intFrExt_of_good_level and further frame/rebase inputs. These are located producers, not a proof that they directly discharge intAll_all at this exact call; the dispatch and deeper moduli/section existence arguments are outstanding.
At the actual caller set X=C_u*phi(rho(a_0)), Y=C_u^tau*phi(rho(b)). N protects both; C_u is a nonzero product of frame units. Multiplicativity gives X^tau=phi(rho(q))*Y. This forces rho(q)!=0 even though q was not included in N. Since nu(q)<1, the CDVR theorem and positive r give ord(phi(rho(q)))>0. Thus tau*ord(X)>ord(Y). The original depth premise gives tau*ord(X)/(r*e)<=ord(Y)/(r*e); positive r*e cancels, contradiction. This closes the local specialization-to-contradiction bridge without assuming a globally injective specialization.

## 6. Reproducible executed scalar regression (V8)
This tests finite rational evaluation identities, protected numerator/denominator products, valuation product signs and normalization, not the existence of the arithmetic specialization. Exact finite checks executed, with counts:
fraction=231110, protectedCount=228028, signs=5904, normalized=5904, negative=20. The two fraction assertions use the same denominator (limited regression; not general localization proof). Negative controls include nonzero polynomials vanishing under specialization, zero branch, and lost positivity at r=0.
~~~js
function check(){
 const ok=(b)=>{if(!b)throw Error("arithmetic regression")};
 const ord=(p,n)=>{if(n===0n)return null;let v=0;while(n%p===0n){n/=p;v++}return v};
 let fraction=0,protectedCount=0,signs=0,normalized=0,negative=0;
 for(let p of [2n,3n,5n,7n])for(let k=1;k<=4;k++){
   let x=p**BigInt(k);
   for(let a=-5;a<=5;a++)for(let b=-5;b<=5;b++)for(let c=-5;c<=5;c++)for(let d=-5;d<=5;d++){
     let A=BigInt(a)+BigInt(b)*x,B=BigInt(c)+BigInt(d)*x;
     if(B===0n)continue;
     let C=A+B,D=B*B;
     ok(C*B===(A+B)*B);
     ok((A*B+B*B)===C*B && D!==0n);
     if(A!==0n){let prod=A*B;ok(prod!==0n);ok(ord(p,prod)===ord(p,A)+ord(p,B));protectedCount++;}
     fraction++;
   }
   ok(ord(p,x)===k);
   ok(x-p**BigInt(k)===0n);negative++;
 }
 for(let e=1;e<=12;e++)for(let r=1;r<=12;r++)for(let v=-20;v<=20;v++){
   ok((r*v)*e===v*(r*e)); normalized++;
   ok((r*v>0)===(v>0)&&(r*v>=0)===(v>=0));signs++;
 }
 ok(2n-2n===0n);negative++;
 ok(!(0>0));negative++;
 ok(0*2===0);negative++;ok(3*4!==3+4);negative++;
 return {fraction,protectedCount,signs,normalized,negative};
}
console.log(check());
~~~
Source replay: git -C RH rev-parse PIN:src/PATH for each recorded blob; use git show PIN:src/PATH | nl -ba to compare listed lines. No local Lean invocation, no kernel/axiom result, no performance claim. All declared assumptions preserved; leaf obligations are explicitly named. 

RESUME HERE: locate and reconstruct exists_mem_height_map_le_one and exists_valuationSubring_of_height_le_one at the original pin, with the exact quotient-height statement, avoidance open and finite-extension theorem (do not infer from names). Trace intAll_all dispatch separately. Then address remaining archimedean local_unit_map_surjective and norm_small_le. The prime-window lane requested SlopeLossFamily/provedFiveF; coordinate that after this local branch, or assign to another geometry worker, rather than duplicate its native ASK calculation. HANDOFF TO editor, integration, audit, literature, prime-window. No global RH completion claim.
