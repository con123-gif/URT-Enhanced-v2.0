# RUN7 — Small-share geometric loss producer (2026-11-24)

Status SOURCE-MATCHED conditional human derivation; finite arithmetic regression executed in V8, not Lean kernel validation. No hypotheses removed. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD e26756e547b281cbf137eb7e0f16cccb738f3f84 (2026-11-24 12:49:24 UTC); checked six relevant paths there: LossRequirementsOfSmallShares, PrimeClassLossHypothesesSatisfiable, LossesSmallShares, LocalQuadraticParts have changed blobs; DiscriminantSettingSatisfied and GlobalLinkOfPartStatementsWithDelta returned 404 at those paths. No migration equivalence asserted. Preflight: swarm protocol, queue, expansion, AGENTS, continuity, research log/state, general CI summary and recent peer handoffs including geometry consulted; no physics changes. General CI is not RH validation. Blueprint not reread.

## 1. Resolve the earlier frontier without conflating two branches

LocalQuadraticParts.SlopeLossFamily (784) is an existential uniform constant C and threshold x0 with Conclusion5 (712–717) on every x>=x0 in Win. Conclusion5 chooses ONE i0 and TWO common integer tables a,b at each x, admissible on TTn, and bounds ASK-Ga and IOsum for ALL i and ALL u0 realizing these tables. LinkPk.linkGLOBAL_pk takes provedFiveF as an explicit premise (240), and consumes it at 283 through losses_family_of_division_side, as RUN6 showed. It is not legitimate to infer a proof of this predicate from the adapter, nor from the unrelated same-named SlopeLossFamily in HeightShare or PrimeDegreeVariant.

There is an explicit **different** route with exponent eL=0: GlobalLinkOfPartStatementsWithDelta.global_link_of_part_statements_with_delta (10–25) calls linkGLOBAL7_pk, supplying Loss7.stLoss7. The latter is actually proved in LossRequirementsOfSmallShares (165) via losses_of_small_share_weight (86–161). This route directly produces Loss_at and LossFS, not the literal LocalQuadraticParts.SlopeLossFamily. We reconstruct this genuine producer and its common-weight quantifiers. Whether this route lies on the elaborated Main proof DAG remains for dependency lane; do not silently substitute it for provedFiveF.

## 2. Common small-share weights: explicit estimate and quantifiers

For fixed x>Fm.x1 in Win choose a base i0 using Fm.Ix_win. Let Omega be the nonempty finite type Wt Fm x i0 of admissible integer top-weight vectors. Let T=|TT|, m=number of lifts, theta=x^(-eps)>0, s0=m T x^(-12). For p in the finite candidate set P, SigO(p,o)>=0. The source mean_SigO (PowFourLtCeilThresholdPrime 1943–1964) under G.MeanKappaBound gives sum_o SigO(p,o)/|Omega| <= s0. Its proof uses wt_nonempty, actual nonempty winA/winB when TT nonempty, pf_sum_Wt, pf_sum_Sig_le, pf_card_Wt. Not an assumed independent distribution.

Define W(o)=sum_{p in P} log(p)/p [2*1_{SigO(p,o)>theta}+4 SigO(p,o)]. For s>=0 and theta>0, 2*1_{s>theta}+4s <= (2/theta+4)s: above theta, 2<=2s/theta; otherwise the extra term is nonnegative. Equality at theta uses the zero indicator. Multiply by log(p)/p>=0, sum over o, interchange the two finite sums, then apply the per-prime mean. The Mertens bound invoked at lines 280–286 gives sum_{p in P} log(p)/p <=2 log X'=2 x^(eps/3); Cand membership supplies primality and p<X'. Thus

  sum_o W(o) <= |Omega| (2/theta+4) m T x^(-12) * 2 x^(eps/3).

By finite nonempty averaging there exists a SINGLE o whose W(o) is no larger than this common bound. This is a joint prime-weight selection, not separate o_p choices.

Exact exponent calculation in size_alt_alt (173–226): under SizeN, SizeM, SizeTT, 24<=x^(1/4), x>1, 0<eps<1/52,

  2/theta+4 <= 6 x^eps,
  m <= x^(eps/100+(1-eps/8)/2),
  T <= 2 x^(2+8eps+eps/100-eps/8).

Multiply all factors, giving 24 x^E with E=-19/2+(10999/1200)eps. Absorb 24 using the threshold, giving exponent -37/4+(10999/1200)eps <= -9, since at eps=1/52 the excess over -9 is -1/4+10999/(62400)<0. No asymptotic constant omitted. Therefore W(o)<=x^-9. (The arithmetic regression explicitly checks the coefficient and rational range.)

Transport the SAME tables avOf(o), bvOf(o) to every carrying member i by exact candidate-set equality sAt_eq, scale equality sc_eq and Sig_eq. The latter uses sameServed with R, TT, prime classes, hP, scales, Sc, eta, bs, off, kapI, ep and both weight equalities (PowFour... 504–510); shared tables alone without these ties do not suffice. Thus chosenW_of (253–329) has the exact quantifier order exists X forall x>=X in Win exists i0,av,bv (admissible and forall carrying i ChW_at). chosenWS_of_cover additionally produces an actual carrying member via CoverAll, using the native valid u0, and raises threshold beyond Fm.x1. ChosenW alone is not a nonvacuous carrying guarantee. LossRequirements 331–335 combines ChosenE, LinkG and CoverAll to yield all eight Chosen7 conjuncts.

## 3. Exact loss bound under the joint discriminant estimate

At a fixed native member, loss_setting_family (41–80) produces PrimeClassLossHypotheses from PtH, LinkG_at, ParTie, bo>=0, LaG>=0, p0<=X', TT nonempty, ChBadp_at and ChW_at. Its seven clauses (PrimeClassLossHypothesesSatisfiable 86–94) are: TT nonempty; signal primes prime and not 2; Sig nonnegative on candidates; W<=x^-9; bad-prime weighted count <=T x^(-2+eps); pointwise io(u,p)<=4 Sig(p) m T a/p; and for every u the full ParametersHyp, FirstHyp, second-class candidate/strict-share guard, and served-class omitted tops in PR and BAD. Keep all four subclauses and all native inputs; no proof of ParametersHyp is supplied by the finite averaging argument.

joint_core (178–226) constructs a universal Cord=max(C1,0) from first_kind_bound. For all P,e,K with P.Cord=Cord, Windows and LargeX, and all finite sets and families satisfying the seven clauses, it uses loss_bound, out_discriminant_bound, first_le, second_discriminant_bound and size_core. The latter sums eleven explicit budget buckets (162–176); these are not individually derived in this run. It obtains, writing U=m T b=unitU,

  ASK_u-Ga_u <= (2 log(4) P.C + 13 sg(P,K)) U,
  sum_cand log(p) io(u,p) <= sg(P,K) U.

Using P.C>=0, U>=0 and sg<=1 from facts hW hL, and 2log4<=3, these imply ASK-Ga<=(3P.C+13)U, IO<=U. No absolute value placed on the signed excess. The discriminant variant clears only beta and s0 using clr P; discriminant_windows_iff supplies Windows for this cleared record. joint_discriminant_bound (228–232) takes the second conjunct. joint_discriminant_eventually (234–241) supplies a threshold after epsilon,e,K are fixed, with 0<epsilon<1/4; Cord is chosen before them. The exact WindowsD list is at PrimeClassLossHypothesesSatisfiable 12–26 (all scale, size, discriminant, constants, bo and range bounds retained); quantifier signature 118–123. Do not merge epsilon<1/4 of this general theorem with the stronger native epsilon<1/52 used in Section 2.

## 4. Transport to native ASK and common family loss

losses_of_small_share_weight (86–161) assumes ChosenTT, ChosenBadp, LinkG. Obtain uniform Cord, xT,xB, C,xG,delta(x)->0, xA from askIsF; windows_ev Fm C 0 Cord supplies e,K,x0. Native epsilon>0 and epsilon<1/4 follow from family scales. Obtain x1 from joint_discriminant_eventually. Set X=max(max(x0,xT),max(xB,max(xG,max(xA,x1)))) and C*=3|K|+13. For EVERY x>=X and EVERY i satisfying ChW_at (not just those in Win), choose bo=b^delta(x)>=0 and actual par P; obtain ParTie, PtH, LaG>=0, TT nonempty from ChosenTT and positive n and delta1. The loss_setting_family application at 129 proves all seven clauses for this record; discriminant_windows_of supplies WindowsD. Apply the general theorem with U-type Unit. Identities P.x=x, P.eps=eps, P.Cord=Cord and P.C<=K, P.C>=0 are used. U=|TT| m b by card_lifts, card_TTv and pd_b. Thus U<= (3P.C+13)U <= C* U, with x^(0*eps)=1. IO_at (253–268) identifies the weighted prime sum with native IOsum by support and place-degree sums; Ga_at (210–245) transports gain minus tau, including vanished above-cutoff terms; ASK_at (386–395) uses pb_primes and pb_atD. For every alternative arithmetic representation with Reads, HEq AD and uniform cutoff, askIsF rewrites to the native ASK as in RUN6. This proves the two Loss_at bounds, uniformly with eL=0.

lossF_of_7 (LossesSmallShares 308–313) combines this with ChosenWS, taking max of their two thresholds, preserving ONE chosen i0, common tables, an actual carrying member and the bound for ALL carrying members. linkGLOBAL7_pk (468–511) invokes linkCore with hL7 cTT cBad lG and cW and numerous additional slope/count/frame/size/character premises retained. Its output ChainTied has eD=Cabs and eL=0. This is the explicit route, not a proof that arbitrary hosts or all Main dependencies exist.

## 5. Pinned source ledger and checks

Base URL https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ . Ten files re-fetched; all blob hashes matched and 35 line anchors checked:

- src/Formalism/SharpRestriction/Divisibility/LocalQuadraticParts.lean | c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265 | 713, 784
- src/Formalism/SharpRestriction/GlobalSchurBounds/LinkPk.lean | 08b8ac2f5a183e2547b8c4adf5865a82f026f5ca | 240, 283
- src/Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean | 287dcaae544bf078e47910aa5c9986ec501bdbd2 | 41, 86, 101, 165, 173, 238, 253, 325
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/DiscriminantSettingSatisfied.lean | edc32424311c076565c2e13b7657f6a5f58cfd84 | 162, 178, 196, 214, 234
- src/Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean | 3f609406f5456e034f5dfb94e9688fca6c9f95a9 | 86, 96, 118
- src/Formalism/SharpRestriction/GlobalSchurBounds/LossesSmallShares.lean | 70624b10f53b29e43deb89bd9dae257403ecb61e | 298, 308, 468, 511
- src/Formalism/SharpRestriction/GlobalSchurBounds/GlobalLinkOfPartStatementsWithDelta.lean | e1b83136161edaf3ad5c499e1f2b706bd56c0789 | 10, 25
- src/Formalism/SharpRestriction/GlobalSchurBounds/WeightVectorSmallSharesSeven.lean | 370098c956d2156e2c95069994e4c8cfae490b03 | 30, 51, 67
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean | 8166795ec6e846795d7272781119ee7d17d426c0 | 210, 253, 386, 504, 1943
- src/Formalism/LocalToGlobal/GlobalTheory/SmallShareWeightExists.lean | 1fa3d7c7c5fcd4a31a376dd26beea1372b8d3c8e | 11

Reproducible finite arithmetic regression (Node/V8). This is a test of elementary algebra, not native number fields, geometry, analytic estimates or kernel proof. Complexity is bounded finite enumeration, no URT improvement.

```js
const regression = function(){
 const c={threshold:0,meanSelection:0,exponents:0,lossTransfer:0,negative:0};
 const chk=(b,k)=>{if(!b)throw Error(k);c[k]++};
 // theta=t/d, s=v/d; clear positive denominators d*t.
 for(let d=1;d<=15;d++)for(let t=1;t<=20;t++)for(let v=0;v<=60;v++)
 chk((v>t?2:0)*d*t+4*v*t <= 2*v*d+4*v*t,"threshold");
 // finite weighted means; integer scaled losses, common positive weights.
 for(let a=0;a<=6;a++)for(let b=0;b<=6;b++)for(let z=0;z<=6;z++)
 for(let w=0;w<=4;w++)for(let v=0;v<=4;v++){
 const fs=[w*a+v*b,w*b+v*z,w*z+v*a], B=(w+v)*(a+b+z);
 chk(fs.some(f=>3*f<=B)&&fs.reduce((x,y)=>x+y,0)===B,"meanSelection");
 }
 // exponent = -37/4 + (10999/1200? calculate directly) eps.
 // common denominator 1200: 1+1/100-1/16+8+1/100-1/8+1/3 = 10999/1200.
 const coeff=1200+12-75+9600+12-150+400;
 chk(coeff===10999,"exponents");
 for(let d=53;d<=300;d++)for(let n=1;52*n<d;n++){
 chk(-11100*d+coeff*n<=-10800*d,"exponents");
 }
 for(let K=0;K<=10;K++)for(let P=0;P<=K;P++)for(let U=0;U<=12;U++){
 chk(U<=(3*P+13)*U&&(3*P+13)*U<=(3*K+13)*U,"lossTransfer");
 }
 chk(2>0,"negative"); // at theta=0 no finite multiplier covers positive s approaching zero
 chk(2*3>1+1,"negative"); // per-prime best choices may differ: vectors (0,3),(3,0), no common point <=1
 chk(-11100*25+coeff>-10800*25,"negative"); // eps=1/25 too large for this exponent argument
 chk((3*2+13)*(-1)>(3*3+13)*(-1),"negative"); // negative U reverses comparison
 return c;
};
console.log(JSON.stringify(regression()));
```

Actual output {"threshold":18300,"meanSelection":8575,"exponents":721,"lossTransfer":858,"negative":4}; all assertions succeeded. Negative controls illustrate missing threshold/nonnegative unit and common-selection issues; the theta=0 guard check is illustrative, not an exhaustive counterexample. Exponent range checks are exact integer arithmetic. The source line anchors were checked separately by fetching the ten files and comparing the listed substrings and hashes.

## RESUME HERE

Next independent task: trace joint_core's loss_bound and the eleven named tDetD budget summands in size_core, beginning with size_floors_bound and size_cp_bucket_bound; derive all constants from actual pinned source with a ledger of any still conditional estimates. Coordinate with Grok green and geometry lanes, which are on other branches. Request independent audit of the two loss routes (do not mistake the direct eL=0 proof for provedFiveF) and the common weight quantifier, exponent coefficient, and actual Main reachability. Handoff to editor, integration, math, geometry, audit and dependency lanes. Current revision migration, actual kernel validation and full proof remain OPEN.
