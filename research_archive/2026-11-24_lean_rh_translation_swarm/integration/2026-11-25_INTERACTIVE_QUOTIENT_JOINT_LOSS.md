# RH: quotient-invariant joint geometry/entropy budget at the actual Fourier consumer
25 November 2026. SOURCE-MATCHED HUMAN DERIVATION; replacement not Lean-compiled. RH OPEN.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; mission cd0a176134d46b5b624896e56843a24915c14477; living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc. Read prior interactive arithmetic reductions and recent geometry/fibre commits c01e58f3, dcf3192e. This is NOT the earlier maximum-translation selection in manuscript §2: it identifies a weaker quotient-averaged LOSS supplier with native Ga_bound5 and exact arithmetic identification, not an arbitrary existential translation.

## Native geometry to a single signed joint loss
Fix the same CoreAtH host, including Dd, C, Xpp, tr:U0→H, all arithmetic data and all native geometric parameters. Write
  X=x^cHH, q=4 log(1+X)/(1-delBar),
  R=(etaBar+4 sqrt(eBar))*X*b/(1-delBar),
  c=(1+q)*cSl1,
  K=K0v5+(1+q)*K7v5+q*(K3+b)+R.
All constants are common to the fixed host; q,c>=0 by HidaSetting.
Define F(v)=log |W(v)| + [ASK(v)-Ga(v)] + c*IO(v).
Here K7v5 uses the original upper log-T bound, not a changed normalization.

Native Ga_bound5 requires HidaSetting,DIV,EComp5,HComp,Count5,Slopes,QuotientSlopeBoundsWith,SlopeIneq,HHBound,FParams; it does NOT require LossBounds. Native weighted_mean_lower_bound_le gives wmean(Lo5)<=cSl1*IO(v)+K7v5. Substitution into Ga_bound5 with q>=0 and addition of ASK-Ga gives exactly
  ASK(v)-Main(v) <= K+F(v).
No pointwise bound on either signed loss is used. The source weighted_mean_bound_statement already exploits a uniform mean of IO and ASK-Ga on U0, but the actual CoreAtH map has only coverage hcov, not a measure-preserving uniform bijection. The refinement below respects the target translation measure.

## Quotient by the actual arithmetic translation
For u∈A0, let V_u={v∈U0:tr(v)=u}, nonempty by hcov. IdentU and ch_top_main_eq identify ASK(v)-Main(v)=gapA(u) for EVERY v∈V_u. It is thus constant on the entire fibre. Define the scalar
  J = (1/|A0|) sum_{u∈A0} min_{v∈V_u} F(v).
Then mean_{u∈A0} gapA(u) <= K+J.
All minima choose the SAME v for the entire joint expression, with its W, IO and ASK-Ga. Never take separately minimizing representatives for distinct terms. One may instead choose any section or the balanced weights omega(v)=1/(|A0| |V_tr(v)|) for tr(v)∈A0, zero otherwise. These weights push forward to uniform measure on A0 and give a possibly larger sufficient budget. A uniform average over all U0 is unjustified absent an equal-fibre proof. Elementary counterexample to that measure substitution: two translations with costs 0 and 2 and multiplicities 2 and 1 have uniform representative mean 2/3 and uniform translation mean 1. This is a finite algebraic counterexample, not a Cathedral/native geometry simulation.

## Actual Fourier consumer
ChCore.CharacterBalanceMoves.core uses pointwise hTop only to add the upper bound to the pointwise th_le/ch_balance inequality, then immediately sums over A0. Before using hTop the proof already establishes
  m sum_{t∈TT} Re Th(u,t) <= gapA(u)+2Q/x, Q=|TT|*m*b.
Sum it directly over u∈A0, divide by |A0|>0, and apply sum_Th:
  (m*b*d/2) sum_{t∈TT} Re(sum_{psi∈PsiA} psi(e1(t))*GPsi(psi,a(t)/b))
     <= K+J+2Q/x, d=|T2|/|H|.
Thus it suffices to supply K+J <= the SAME Err used by native core/ch_core (or the manuscript's improved error bound). This replaces pointwise LossBounds at this consumer by a single quotient-averaged joint-loss constraint; all other pointwise hypotheses, uniform parameter controls, size/ThinScales/CostWindows, same-host hcov, IdentU and Fourier hypotheses remain. The original pointwise LossBounds implies F(v)<=log |W(v)|+(1+c)*LoP; where the original cardinality upper bound is available, this is exactly the old worst-case budget. This shows the candidate interface is no stronger than the original bound at the consumer. No assertion that the actual geometric construction already provides the weaker scalar, or that strict non-equivalence holds among full native hosts. Other consumers of LossBounds are unchanged.

For the principal level, existing exact four-mode cancellation and one-sided height shift pass the averaged bound to
  G(x) <= 2(K+J)/(Q*d)+4/(x*d)+1+3*x^(1/2+eps).
No new quantitative RH bound is claimed: establishing K+J at square-root error scale and all retained hypotheses on the actual complete windows is still required. The newly isolated supplier is quotient-invariant; it exposes precisely where a signed cancellation between geometry and loss can be used without independent witness selection. A common arithmetic-geometric-entropy invariant in a stronger foundational sense is not established.

## Pinned source evidence
src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef: Ga_bound5, weighted_mean_lower_bound_le, weighted_mean_bound_statement.
src/Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean f9f34a9147750e215a6b2f206eb6f9889aa726b6: K7 via LevelOfCongruence, LossBounds, MLo5, ErrX5at, PointwiseBoundVariant.
src/Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean 9172d2d30c5cec478b08c10a4b34e39fa16ab981: K3, positive weighted means and phi_bound.
src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5: ch_top_main_eq, IdentU to arithmetic gap.
src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de: core, sum_Th, actual hTop consumer.
src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d: actual CoreAtH hcov and ch_top use.

Status: exact human algebra from native source bodies, not native compilation, no root closure, no measured URT advantage. No new simulation run; counterexample computed by explicit arithmetic. Native Lean unavailable in prior session, no fresh compiler replay here. Source mission and latest manuscript/peer checkpoints checked; full prior code search not exhaustive. Preserve original proof as fallback.
RESUME HERE: reconstruct actual producer of D.Losses or the joint loss on the tr fibres of ChainTied. Check whether existing shared-host row/count construction can estimate J directly without uniform LossBounds. Then replay the average-only replacement of CharacterBalanceMoves.core and actual core_gm consumer, retaining full axiom scan. 
HANDOFF TO: geometry, entropy/local-gain, dependency, integration, human editor.