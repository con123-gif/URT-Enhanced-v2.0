# RUN25 — remove the unused upper Green weight estimate from the TopG irreducibility branch
25 Nov 2026. Mission lane 8. RESULT: SOURCE-MATCHED human conditional simplification, not RH closure. This run follows the one-equation mission, not the older vacuum Step F task. Mission pin e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1, mission blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, excerpts of state/runner/continuity and CI summary #426 (07:12 UTC; predates this work). Read peer RUN24 actual third-place route, current dependency frontier, prime RUN25 square mesh, Landau RUN25 quantitative pole obstruction, acceleration handoff, single discrepancy and outer-shell transfer. Not an exhaustive archive/blueprint audit. No Cathedral physics or URT experiment.

## 1. Actual source route and removable proof obligation

At upstream P=40e56bab026552e089d7afcfeff08d2defb9c005, TopShape.shape_closed_link_n_of_green feeds the closed LinkIRR argument to topDesWin via GlobalTheory.Top.Irr.closed_linkIRR_of_join_count. This is the Green-dependent input at the actual third-place TopG assembly, not the alternative Fock model. The latter theorem retains: Green, family A, TwistSelection sel, cIc>0, and closed eventual existence of AllRows with LabelCountGoodInjective, AllJoinA and CountAllRows at epsC cIc r f. At each eligible Fm,x,i, it obtains admLq from normalized type compatibility of the chosen row, and SizesRec with Cs=6. The common threshold is max(max(x0,sel_threshold),max(Fm.x1+1,4)); next linkIRR_of_join_ex adds x >= (3/2)^(1/Fm.ez), using Fm.ez>0. Epsilon is positive and <=1. All these conditions are retained.

The source chain is:
closed_linkIRR_of_join_count -> admissibleLabelWeights_of_greenCuspidalParametrisation, linkIRR_of_join_ex -> weight_of_join -> weightAllRows_of -> locShare_le_Wg.
This is a source-body call chain, not newly authenticated kernel edges.

At a type prime g, let U(f) and J(f) be normalized Whittaker and Jacquet label weights wtOf, with the original nontrivial additive character psi. admLq contains FOUR clauses:
1. U(f),J(f)>=0 for every polynomial f.
2. For a valid squarefree label of rank r, U(f)=1/prod_{P|f}(g^deg(P)-1).
3. For every valid label, J(f)>=(1-1/g)U(f).
4. For every valid squarefree label, J(f)<=(1+1/g)^r U(f).

The critical source fact: ConcNWeight.locShare_le_Wg destructures these as <hnn,hsq,hcmp,->, explicitly ignoring clause 4. weightAllRows_of uses only nonnegativity and locShare_le_Wg. Consequently the weaker three-clause premise suffices for this entire LinkIRR branch, keeping all counting, selection, sizes, Green compatibility, and family hypotheses. The source producer can be shortened by omitting its final call to harishChandraSeriesWeight_le_squarefree. This removes a genuine representation-theoretic proof obligation from the HUMAN reconstructed irreducibility route, not from every consumer of admLq in the library. The original Lean producer still constructs all four clauses; no code modification or kernel-level proof pruning is claimed.

In particular, the original upper bound is not the source of this branch's concentration. The remaining squarefree weight formula, local lower comparison, positivity and actual global counting are essential to the proof as written.

## 2. One-line transfer with exact contamination budget

ConcNWeight.sum_wtOf, wtOf_eq_zero_of_not_label, and positivity of coefficients at identity establish that U,J are probability distributions on monic coefficient vectors; nonlabels have zero mass. The third clause extends to all those vectors. Hence
    J = (1-1/g) U + (1/g) R,   R := g J - (g-1) U >= 0, sum R = 1.
No upper comparison is needed, even for nonsquarefree polynomials.

For a cylinder at one type prime g, let j be the number of Jacquet slots among its places (the others are exactly U). With P=product of U and Q=product of the actual weights, expansion gives Q=a P+(1-a)S for another probability distribution S, a=(1-1/g)^j (for j=0, Q=P).
Thus for ANY event B in the product of coefficient-vector spaces,
    |Q(B)-P(B)| <= 1-(1-1/g)^j <= j/g <= f/g.
The last inequality uses the native cardinality of places f. This is an exact sharpening of the source comparison_transfer_holds union budget for this fixed product; it does not improve the asymptotic order. Source Wg=f/g + the independent property_W estimate; replacing f/g by the exact budget leaves all subsequent upper bounds valid. It is optimal from these premises alone: take U a point mass and R a disjoint point mass, then the event that some Jacquet coordinate leaves U support attains equality. This extremizer is only a mathematical sharpness control, NOT a claim about actual Green weights. No improvement to prime windows follows from this probability transfer alone.

## 3. Exact underlying lower-weight mechanism

MirabolicComparison.mirabolic_comparison uses pattern-idempotent exchange and trace_unitriangularColumnVanishingIdempotent_eq_sum_derivatives. For g prime, psi nontrivial, N=k+2s+1, k>=1, and any genuine character chi of GL_N(F_g), let t_i=Re wh(psi,der(psi,i,chi)). The source wh_der_nat proves t_i are nonnegative integers for 0<=i<=N via Harish-Chandra restriction and idempotent traces; wh_der_zero gives t_0=Re wh(psi,chi).
    Re tr(eJ,chi) = sum_{i=0}^{k-1}(g^(k-i)-g^(k-i-1))*t_i + t_k.
With M=N(N-1)/2, the identity coefficients are g^(-M),g^(k-M) for eU,eJ. LowerWt.coeff_mul_eSerC writes the label coefficient as a sum over irreducibles with nonnegative coefficients chi(1)/|GL_N(F_g)|. After division by g^k the derivative coefficients are
    a_i=(1-1/g)g^(-i), i<k; a_k=g^(-k); sum a_i=1.
They give the lower comparison by retaining i=0 alone. The actual lowerWtComparison theorem has NO Green hypothesis (the label-convention transport eSer_eq in the enclosing producer does use Green). The omitted derivative coefficients sum exactly to 1/g. This is the real positivity mechanism, not cancellation of prime deficits. Do not conflate the trivial global Dirichlet character with the local nontrivial additive character psi, or reduce rank r to 1 in the principal-host construction.

## 4. What still has to be proved
The genuine remaining input to this branch is the exact squarefree Gelfand–Graev mass formula (with Green and label compatibility), property_W estimates, and actual global row-count certificate CountAllRows. The latter is a uniform eventual relative error over ALL cylinders:
    |dimT(cyl(k,S))-DstarE(eT(cyl(k,S)))| <= epsC(cIc,r,f)*DstarE(eT(cyl(k,S))).
None of these is supplied by the contamination identity; no inference from finite-dimensional positivity to the prime window lower bound. The all-character TopG arithmetic and other links, including uniform CountI/II/V/Vs, remain open. Current peer quantitative pole and square-mesh results do not supply the missing prime cancellation.

## 5. Provenance and reproducibility
Source P above. Nine exact blob hashes and 21 anchors checked via GitHub connector/V8 (all matched):
- ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd: closed_linkIRR_of_join_count hGreen.
- same directory LinkIrr.lean 278e3fba595f2f3643c163ed6297b12330ef7d51: admissibleLabelWeights_of_greenCuspidalParametrisation; linkIRR_of_join_ex _ 6.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LinkIRROfJoinEx.lean 729b4c2ffec74b50b97d31067c9575a1c1e50767: weight_of_join hL; linkIRR_of_allRows.
- src/Formalism/LocalToGlobal/HilbertRowConditions/AllJoinP.lean b16f840493df138a7de9eb764b7dae874bef0ef8: weightAllRows_of A hL hA hR.
- src/Formalism/LocalToGlobal/GlobalTheory/ConcNWeight.lean 614c24bf786e29690c2202de789bbf35c2224196: destructuring hnn,hsq,hcmp,-; comparison_transfer_holds; property_W_of_estimates; nonnegativity projection; sum_wtOf.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdmissibleLabelWeightsOfGreenCuspidalParametrisa.lean d240897ba7b7ac9327ad66e045a24522d8ab2ed0: upper, lower, exact squarefree supplier calls.
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/MirabolicTraceGeWhittakerDimensionGLn.lean 5546896b7b3d979637cb2e7b80e2edafd0f97fa3: wh_der_nat; wh_der_zero; derivative trace sum call.
- same directory TraceUnitriangularColumnVanishingIdempotentEqSumStatement.lean 821c66bc859fc1cc13242a48c0b0125ca4a0e0b0: range k and final derivative.
- same directory HarishChandraSeriesWeightLowerComparison.lean cc3c4217b7657cce90c2b6c6a4246b2275a5d8aa: mirabolic_trace_ge_whittakerDimension_GLn; hpow.
Additional inspected source: ArithmeticCylinders.lean 34d5b6f5ffafa0e56248c9e2eefb5ae0483edd81, IrreducibleOfCountSizes.lean 2efa6ef6c2656baf12829c32a79a363cbee84f22, ConcNP.lean 46c3d780cdf9e5173a57f8c0c82f674ccd64eed2, LocalEstimateIVOfTypeSetWeight.lean 3fe623b4437dbc893fb200b5d31dc54f5e73b947. No source premise is asserted to be independently established by published literature merely from a Statement suffix; the selected lower comparison has an actual body, itself calling deeper suppliers. Standard mixture proof supplied in this note, no novelty claim.

Current observed upstream main 75e2012dcc6f3093e223ef8d327b88395ff7d27c (merge PR #1508). ConcNWeight blob a6ff217deb746b1e552ca72f004a3813e02c60e2 still contains the unused fourth projection; TopShape blob 27fd5c429c00d2e762fea01a9704a1b353003ceb contains the closed_linkIRR supplier and merged admissibleLabelWeights call; producer blob 7bea210c288d328cafaa076e056750618dbc9dd2. Latest revision inspected selectively; no mixing of proofs with pin or global equivalence claim.

Actual local CPython exact rational regression, exit 0: derivative coefficient cases 384; sharp product cases 42. Checks abstract finite algebra, not native representation character values and not evidence for RH. Reproduce:
```python
from fractions import Fraction as Q
from itertools import product
n=m=0
for g in [2,3,5,7,11,101]:
 for k in range(1,65):
  w=[Q(g**(k-i)-g**(k-i-1),g**k) for i in range(k)]+[Q(1,g**k)]
  assert sum(w)==1 and w[0]==1-Q(1,g) and sum(w[1:])==Q(1,g) and min(w)>0
  n+=1
 for j in range(0,11):
  a=(1-Q(1,g))**j
  assert 1-a<=Q(j,g)
  if j<=6:
   P={x:Q(int(not any(x))) for x in product([0,1],repeat=j)}
   W={x:Q(1,g)**sum(x)*(1-Q(1,g))**(j-sum(x)) for x in P}
   assert sum(W.values())==1 and sum(abs(P[x]-W[x]) for x in P)/2==1-a
   m+=1
print('derivative coefficient cases',n,'sharp product cases',m)
```

RESUME HERE: Trace actual supplier of irrC/CountAllRows in the principal-host HypsAlt bundle (relative cylinder count, not local mass). Test whether only the two bad-label cylinders are needed by linkIRR_of_allRows and can be supplied without the universal cylinder count. Prove exact weakened implication before attempting a quantitative bound. Do not repeat local mixture or return to vacuum translation unless it directly supplies this inequality. HANDOFF TO geometry, Galois, integration, audit, dependencies. RH remains OPEN; no kernel replay, no URT advantage.
