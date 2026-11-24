# RUN17 — Single-tolerance admission equivalence and nonvacuity
2026-11-24. RESULT: independent human theorem from source-matched predicates and estimates; exact finite regression executed in V8. Native construction of FamP/GK not yet authenticated. P=40e56bab026552e089d7afcfeff08d2defb9c005; current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (API commits head; unchanged since RUN16). Not a Lean replay or a root reachability claim.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN16, state/log/protocol/continuity excerpts and CI checkpoint #401 (23:11:26Z, physics only), recent 35 commit IDs and eight peer commit patches including integration, dependency, kernel, acceleration, editor, geometry and audit. No duplicate of the single-tolerance equivalence found in inspected material. Other peer full notes and external blueprint not reopened. No unrelated physics edits.

## Pinned sources
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ .
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3, FamCore fields L71–85: threshold, unbounded Win, nonempty fibres on Win, Ix_zero, L_x, L_eps.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6, FamP L31–55 and fixed L86–87. The family carries a single GK and GK_nonneg, not a displayed strict La field.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f, AuxBlock8.adm5 L115–119, AConsts/admitted L235–244, AdmF L256–260, KudlaFamilyStatement L266–268, FamilyClosedForm L270–277.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, Pf.AdmFam L156–159.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b, G.Consts.Nonneg L31–33, N1 L43, Gp L45, La L58, Qp L87.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec, G.orbitWindowCount L247–248: natural ceiling of maximum plus 1, hence N1>=1.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043, St.cGE/cNE L38–40, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six and one_le_k L136–146.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b, Scale L9–17, a,b,X',A,p0 L27–43.
- SharpRestriction/GrowthBounds/LogarithmicSums.lean blob ca9322c11898c23018dfb6076d58d08219259eab, eventually_adm_of_admFam L26–34 uses delta=1 in the forward direction; stmtEF/stmtF L98–102 are conditional consumers, not suppliers.

## Theorem (new explanatory equivalence, not a source declaration)
Fix the native FamP eps, K:Consts (fixed even if not assumed Nonneg for this particular equivalence), dependent families X,Y and real C31,Ce,Cm. Write A(d) for the exact AConsts tuple. Define E(d) := exists T>1, forall x>=T, forall i: Fm.Ix x, admitted(Fm.D x i,Fm.L x i,X x i,Y x i,K,A(d)).
Then Pf.AdmFam Fm K X Y C31 Ce Cm iff E(1). Also AdmF iff there exist C31>0, Ce>=0, Cm>=0 satisfying E(1).
This does not eliminate the need to produce E(1), and does not assert that an arbitrary FamP is admitted. All eleven non-adm5 conjuncts at P must still be established. Quantifiers over arbitrary primes in adm5 remain intact.

Proof forward: specialize AdmFam to 1>0, retaining the original threshold.
Proof backward, step 1 (nonvacuity): suppose E(1), with threshold T. Win_unb applied to max(T,Fm.x1+1) gives x in Win with x>=T and x>Fm.x1. Ix_win gives a genuine index i; this is not a vacuous forall over an empty type. At this point the adm5 lower inequality yields 0<x_s^(eps_s-1)<=K.La*N1(s)^2*log(a_s). Since x_s>1, a_s=x_s exp(x_s^eps_s)>1, and N1>=1, the factor multiplying K.La is positive, so K.La>0. No assumption that Ix x is nonempty for every real x. Ix_zero is not used for this tail existence (it can be used to read eps>0 via L_eps and Scale.eps_pos).

Step 2 (uniform numerical supplier): fix arbitrary delta>0. Above Fm.x1, L_x identifies the scale x with the real family parameter, L_eps identifies its epsilon with the fixed family epsilon, and Fm.sizes supplies SizesAt. Thus x>=e and sufficiently large gives c=cGE(eps)>0,d=cNE(eps)>0 and 1<=k<=x^6, N1<=d log x, Gp<=c log x*x^(eps/8), independent of i. Put ell=log x. For p prime, log Qp=Gp log p. Under the strict guards p<p0=k²x^26 and p<X'=exp(x^(eps/3)), respectively:
  log Qp<=38c ell² x^(eps/8);
  log Qp<=c ell x^(11eps/24).
Also log a=ell+x^eps and N1>=1. For ell<=x^eps:
  K.La*x^eps<=La<=2 K.La d² ell² x^eps.
Integral bound for any h>0, x>=1: ell=integral_1^x dt/t<=integral_1^x t^(h-1)dt=(x^h-1)/h<=x^h/h. Take h=delta/4 to make all three log-polynomial upper bounds and K.La lower bound hold using:
  x^(delta/2)>=608c/delta²,
  x^(3delta/4)>=4c/delta,
  x^(delta/2)>=32K.La*d²/delta²,
  x^delta>=1/K.La.
Taking h=eps/2 supplies ell<=x^eps whenever x^(eps/2)>=2/eps. Each threshold exists by positive real power growth. Choose their maximum with e, Fm.x1+1 and T. For every x above it and every i, all four adm5 inequalities hold at the requested delta. Constants depend only on fixed eps,K.La and delta; not on primes, i, or varying data. The use of K.La>0 came from E(1), not a new hypothesis.

Step 3 (reinsert without weakening): at the same x,i, E(1) supplies the original pinned admission conjuncts adm1(C31), adm2, adm3, ArchimedeanSignatureMatching, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1, TypePrimeSizeConds. None depends on A.delta. Replace only the fifth conjunct adm5(1) by the newly proved adm5(delta). Hence E(delta) for every positive delta, with T(delta) chosen before x and i. Existential C31,Ce,Cm may be retained unchanged for AdmF. No circular invocation of KudlaFamilyStatement.

## Source drift
At H, FamCore blob 8896ac9d04495274664eafac6935ce3457655f6b L91–97 preserves Win_unb, Ix_win, L_x, L_eps and introduces native FamCore.exists_pt L150–154, exactly the nonvacuity step. ParConsts blob fc2f52e63147d43cf955a6d46e40c8ba4d975399 L78,88–89,120 preserves sizes, GK/GK_nonneg, and listed fixed constants. H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L233–236 removes adm2 and adm3, giving 10 conjuncts and adm5 third; AdmF L241–245 unchanged in quantifier shape. Conclusion₂ L238–239 drops three conclusions relative to P L246–247. H Conclusion1OfGainBoundAll blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8 L173–176 preserves AdmFam quantifier text. H StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L110,147,189,197 contains moved estimate declarations; RUN16 already recorded the consolidation. No cross-version implication from weaker H admission to P is asserted. H comparison of full estimate proof bodies not repeated.

## Native supplier search and exact remaining obstruction
Code search for AdmFam, AdmF, AuxBlock8.admitted, KudlaFamilyStatement returned no hits; this does not establish absence. Read ParConsts, FamCore, LogarithmicSums, RemainingCountingStatement, SmallOrderPrimes, relevant AdmissibleParameterJoins and AdmissibleIntegers modules. The similar named AdmissibleIntegers admitted in StatementsOfRemainingBound L194 takes extra Dx,T,W,lev,Xe,ce,sp; it is not the same predicate and must not be used as a substitute. Native GK construction and producer of E(1) remain open in this lane. Request authenticated incoming caller edges rather than repeat lexical search.

## Reproducible checks
Run in Node/V8. Exhaustively test Boolean conjunction projection/reinsertion for P and H and abstract integer arithmetic envelopes at delta=1/q, t representing x^(delta/4), ell=4qt and E>=ell; K.La=a/b. This is an algebraic envelope test, not evaluation of real logarithms, existence of native FamP, or kernel proof. The three negative witnesses illustrate zero K.La, vacuous empty fibre and a missing unrelated conjunct.
```js
const counts={projection:0,reinsert:0,threshold:0,negative:0};
const ck=(ok,k)=>{if(!ok)throw Error(k);counts[k]++};
for(const [n,j] of [[12,4],[10,2]]){const all=(1<<n)-1,b=1<<j,rest=all^b;for(let m=0;m<=all;m++){ck((m===all)===((m&rest)===rest&&Boolean(m&b)),"projection");ck(((m|b)===all)===((m&rest)===rest),"reinsert")}}
for(let q=1n;q<=12n;q++)for(let c=1n;c<=8n;c++)for(let d=1n;d<=8n;d++)for(let a=1n;a<=4n;a++)for(let b=1n;b<=4n;b++){
let t=608n*c*q*q+32n*a*d*d*q*q+b+1n,ell=4n*q*t,E=ell+1n,N=d*ell,xd=t**4n;
ck(38n*c*ell*ell<=xd&&c*ell<=xd,"threshold");
ck(a*xd>=b&&2n*a*d*d*ell*ell<=b*xd,"threshold");
ck(a*N*N*(ell+E)<=b*xd*E&&a*E*xd>=b*E,"threshold");
}
ck(0n*2n*2n*3n<1n,"negative");
ck([].every(()=>false),"negative");
ck((0b111111111111^(1<<1)|1<<4)!==0b111111111111,"negative");
console.log(counts);
```
Executed output: {"projection":5120,"reinsert":5120,"threshold":36864,"negative":3}. 47104 positive regression assertions and 3 witness assertions.

## RESUME HERE
Locate native constructor/caller supplying E(1) or AdmF for Fm.GK,Fm.Gx,Fm.Gy, with authenticated declaration and source lines; prioritize typed incoming references rather than more unfocused filename scans. Independently audit single-tolerance equivalence, nonempty-tail argument and explicit threshold scopes. If native supplier cannot be retrieved, trace TypePrimeSizeConds and other remaining conjuncts separately without conflating P and H. HANDOFF TO dependencies, kernel, audit, integration, editor, prime_window. Project OPEN.
