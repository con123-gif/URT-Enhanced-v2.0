# Harmonic scale closure of native rank inequalities and host-size consequences
Status: SOURCE-MATCHED conditional mathematical reconstruction, not full FamP existence. Pinned source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Use jointly with math/2026-11-24_harmonic_scale_size_algebra.md, native_rank_envelope, rank_and_thick_sphere_construction and bernoulli_top_set_selection. This closes the three remaining SizeKRel inequalities under the retained native hypotheses; it does not close the whole 24-field SizesAt record.

## 1. Exact native definitions and all remaining rank inequalities
Sources: src/Formalism/LocalRingCardinality/DataArith.lean (851c12aac84bff1368763793613732f94dd15ff6) rankBudget=n*x^(-eps); Params.lean (09d1aeec3049821ed6d190c7970cdca9ec5b34cf) rS=m/2-1 (natural division/subtraction), n=ord, f=2n, r=k+m-1. ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52) SizeKRel. Assume 0<eps<1/52, x>1, native SizeN/M/K. The preceding harmonic chapter handles 11 of 14 clauses (including conditional uniform bound for CGam and host QS). For the three outstanding clauses:
3. k<=x^(9/2+1001eps/100), while sqrt(x)*n*rankBudget>=x^(9/2+1498eps/100). Difference 497eps/100>0. This proves k<=sqrt(x)*n*rankBudget.
4. k/m<=x^(4+4033eps/400), rankBudget^2>=x^(4+5592eps/400). Difference 1559eps/400>0. Take square roots on both nonnegative sides to get sqrt(k/m)<=rankBudget.
9. Native m grows at least as x^(1/3), since 1/2-29eps/400>1/3 throughout the interval. Eventually m>=4. As m is even, rS=m/2-1>=m/4; sqrt(rS)>=x^(1/6)/2. From f=2n and upper n, log f<=4 log x eventually. Since log x=o(x^(1/6)), log f<=sqrt(rS) eventually. No assumption that rS positive at the original minimum m=2; the eventual threshold is essential.
Thus all 14 SizeKRel clauses are now reduced to elementary inequalities under native SizeN/M/K, the relevant SizeQD upper bounds, fixed HostConst (QS<=C*n), uniformly bounded CGam and sufficiently large scale. Keep these exact input premises in the manuscript; no independent derivation of uniform CGam yet.

## 2. A uniform polynomial envelope for t
Source RankVal and nWv, TOv: src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b).
Let L=x^eps and T=ceil(x^377). RankVal gives t=8fr+4+T*8ceil(10*r*(f+f^2*(k-1)^3*L^2/m)/8)-r. For x>=1 and sufficiently large x, r<=2k, f>=1, m<=f, k>=2, L>=1. Then f<=f^2*k^3*L^2/m and the full formula is bounded by a fixed constant times x^377*k^4*n^2*x^(2eps)/m. For instance use T<=2x^377, ceil(a)<=a+1, and absorb additive terms by the positive leading expression, which tends to infinity. Using native size windows the exponent is
 377 + 4*(9/2+1001eps/100) + 2*(2+801eps/100) + 2eps - (1/2-29eps/400)
 = 398.5 + (23253/400)eps.
For eps<1/52 this is <400, since 52*600-23253=7947>0 in units 1/400. Thus t<=x^400 eventually. This is an independent simplified polynomial envelope, not a claim that the source chooses Ct=400. SizeT is immediate from SizeData2.t_win at the actual Ct, since x^Ct<=x^(Ct+eps/100). Establish the actual t_win witness separately.

## 3. Five further native size categories and splitBound
Exact definitions: ElevenLe.lean as above; scale identities in src/Formalism/LocalRingCardinality/DataParams₂.lean (50914500995df91e2646d91a6c5c99a7e603a51b); HostVal, HostConst, PairWin and PairRow in PairRowIffQdRows.lean. Assume the same native rank and actual HostVal witness, fixed C8, t polynomial as above, 1<=J<=C8, and choose a common sufficiently large threshold. The argument is uniform over hosts satisfying those fixed bounds, not a sequence of different thresholds depending on the host.

SizeTT: HostVal supplies delta1*n/2<=|TT|<=2delta1*n. When x^(eps/100)>=2 this gives the weaker SizeTT lower bound x^(-eps/100)*delta1*n and its exact upper bound. ChosenTT remains the stronger condition; do not replace it by SizeTT.

SizeLw: HostVal sets Lw=10ceil(405 log x)+2ceil(30/eps)+22. It is O(log x) for fixed eps, hence eventually <=(log x)^2.

SizeG: HostVal gives (kb)^8<=g_i<=2(kb)^8. In particular every ratio g_i/g_j<=2. With b=exp(x^eps), log g_i<=log 2+8 log k+8x^eps. Divide by x^eps: the expression is bounded eventually and x^(eps/100) grows without bound. Thus log g_i<=x^(eps/100)*L.

SizePde: HostVal bounds pde,pde' by (QS*q*d)^C8. PairRow and PairWin give log(QS*q*d)<=2Y^(eps/5)(log Y)^2<=2x^(eps/5)(log x)^2, since 1<=Y<=x. Hence log pde and log pde' are <=2C8*x^(eps/5)(log x)^2<=x^eps eventually.

SizeCond: with szCond=QS*q*d, use previous log bound and t<=x^400. Then
 log(szCond^36*t^150)<=72*x^(eps/5)(log x)^2+60000 log x=o(x^eps).
Eventually <=x^eps/2=log sqrt(b), hence SizeCond.

SplitBound: HostVal provides floor(x^(ez/5))<=splitBound with ez=eps/J>=eps/C8>0; thus eventually splitBound>=11. This last clause is a separate 24th SizesAt field.

## 4. Further independent scale identity — SizeW
Scale.a=x*b, Scale.X'=exp(x^(eps/3)), Scale.b'=a/X', Scale.w''=b'/(x*n). Thus w''=exp(x^eps-x^(eps/3))/n. The desired sqrt(b)<=w'' is equivalent to log n+x^(eps/3)<=x^eps/2. The left is o(x^eps) under native SizeN, so SizeW holds eventually. No approximate golden-ratio equality used.

## 5. Current coverage and exact residual
At the category level, the derived or directly supplied eventual conditions are SizeN, SizeM, SizeK (from RankVal with factor-two absorption), SizeKRel (conditional additional inputs), SizeT (conditional on actual t_win), SizeCond, SizeTT, SizeRho (conditional SizeLa), SizeLw, SizeW, SizeG, SizePde, splitBound. That is 13 of 24 fields as conditional reductions, NOT 13 independently proved FamP fields or proof completion percentage.
Remaining category obligations: SizeQD (all eight clauses, not just used upper bounds), SizeLa, SizeBot, SizeDe2, SizeEta, SizeNodes, SizeLstar, SizeDel, SizeBm, SizeXpp, SizeWords. The actual host/parameter/family producers, uniformity, same-index joins and independent source audit remain critical. Concentrate on these instead of redoing elementary rank arithmetic.
Further mathematical route: use super-polynomial separation of b, b', w'' and finite-rank/node choices to reduce SizeEta/Nodes/Lstar/Del jointly; locate exact etaSz, Sc and Del witnesses first. Keep source definitions, exact direction of each bound, and constant dependencies.

## 6. Executed exact checks
Using rational exponent units 1/400: KRel3 gap (0,1988); squared KRel4 gap (0,1559); 3*m exponent minus 1 is (200,-87), giving m>=x^(1/3); t target minus computed exponent (600,-23253). All gaps strictly positive for 0<eps<1/52 by endpoint comparison; executed 11,552 exact integer grid comparisons, zero failures. These certify the arithmetic comparison, not actual host geometry.

## 7. Integration approach
Use URT harmonic coordinate x=phi^s for shared scale factoring; exponent vector arithmetic on fixed-dimensional positive terms, endpoint gap comparisons, explicit residuals and exact premises. Use memoized typed DAG, SCC condensation, linear readiness counts and incremental invalidation for dependency analysis. Preserve all proof obligations, not just significant harmonic terms. For each positive algebra island, emit one reusable mathematical lemma and reference it from all consuming branches; do not repeatedly expand Lean tactic proof. No unique URT speed advantage claimed; no extrapolation to full proof completion. Integrate with the existing 15 lanes and single manuscript spine. Continue source-level proofs while full archive processing is pending.
