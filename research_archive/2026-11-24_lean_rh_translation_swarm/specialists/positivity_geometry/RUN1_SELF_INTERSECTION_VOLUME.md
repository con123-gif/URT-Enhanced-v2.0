# Positivity geometry run 1 — from self-intersection to arithmetic volume
2026-11-24. RESULT: PARTIAL full project; SOURCE-MATCHED human reconstruction of VolGe and its self-intersection limit and limsup argument. Exact finite regression checks executed. Not an independent Lean kernel check or proof of all geometric producer theorems.

## Continuity and source anchor
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol, continuity, latest state branch CI summary (PASS 45347447866 at 1dec3c8; physical CI is not RH validation). Read peer theta, Galois, character-box, literature, Landau, prime-window, integration, math, kernel and acceleration handoffs. This is the first geometry lane file. Distinct from literature's interface ledger, theta's seven-input bridge, and Galois's row adapter. No Cathedral physics files changed.

All statements below refer to leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 at 07:32:48 UTC; the corresponding A and D blobs are now f4f6eb32f04c91b5cde32f11631828eb4016fa7f and 0d30ec46d5560d675a435b49f911903d3d5357c0. No equivalence claimed across revisions.

Paths relative to src/Development/; T=AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/; P=AbelianVarietyTheory/Proofs/DivisorProofs/.
- A T/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24
- B T/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba
- C AbelianVarietyTheory/PublishedTheorems/Divisors₂/VolGe.lean 3838e9a22a7fa93d98a7406239103be54c7414cc
- D P/VolGeOfHilbertSamuel.lean fd45423c859443963c1afdea940b351115c8c13d
- E P/TendstoSelfIntersectionPowTensorDivPow.lean 9842d7f2fc3da0d7f27c87825d305a54923b9e04
- F P/SmallSectionCountContinuousFromAboveStatement.lean 576ce7a9e4043f9dd3ac9b952163fc1e8c85a065
- G P/LogCardSmallSectionsGeOfShiftNefStatement.lean cdc8a3a38fc1606b45c761fece070970642afcdb
- H P/ExistsMetricShiftIsNefPowTensAmpleStatement.lean 1bdfc7617f52ef8967c54904fa2dd2b113ae9e5d
- I P/LeArithVolumeOfFrequentlySmallSectionsLower.lean 9d7885dc87a2f80aa5b90a45e5c35bb8096edded
- J P/TendstoSelfIntersectionPowTensorDivPowStatement.lean 71c212cf16d692d3835c7c08aabfbf0be9419267
- K P/LeArithVolumeOfFrequentlySmallSectionsLowerStatement.lean e13abab6f3c1a7ebe0111cdb32beccd78e229365
- L T/TopCovolG.lean 62742fab059140fb67f88b2c1e18abd6078992b3
- M T/HeightLowerBoundGeneral.lean b6012f8c9b260e1596140ce99671df2b7692f72c

## 1. Why this is on the actual source path
A:531–532 calls D:volGe_of_hilbertSamuel with arith_hilbert_samuel_of_literature O, ar_calc_of_literature O and nef_numerics_of_literature O. A:783 supplies this as p2 of published_results_arithmetic. A:812 passes the record into B:topCovolSlim2_use_alt_alt, which passes it to L:topCovolG_alt_alt. L uses that record in height, gram, degree, and covering producers; M:height_lower_bound_general_alt uses height_of_meanAll_bound with short-section, geometric, integral-frame and weight-budget producers. This is a source-level record-flow path, not a proof that projection p2 survives kernel proof irrelevance or is indispensable. The exact consuming projection is a further task. No inferred direct link from this isolated inequality to RH.

## 2. Exact theorem and retained assumptions
C:13 defines VolGe: for every commutative ring k, integral scheme X of universe 0, map p:X→Spec k and D∈N satisfying IsArithVar p D, every Hermitian line bundle L over p and every real a, assume NefFib L, L.SemiPos D and L.IsSelfInter a. Then (a:EReal) ≤ arVol L D.
D proves this conditional on three proposition-valued inputs: ArithHilbertSamuel, ArCalc, NefNumerics. Keep the distinction between fibre-nef and globally nef, and between the real a and extended-real volume. Neither a>0 nor D>0 is assumed. Positivity of a is needed only if one wants to conclude positive volume.

## 3. Human reconstruction of the intersection polynomial (E, J)
Let r=D+1, and use the real-linear functional Phi on polynomials in two variables supplied by ArCalc.arExists for the pair L,A. The ArCalc isometry and uniqueness rules imply
  Phi(X0^r)=a.
For every n∈N the bundle combination with integer coefficients (n,1) is isometric to L^n tensor A, using the isometry class laws. Thus
  alpha(n)=Phi((n X0+X1)^r)
is a self-intersection of that bundle. In particular, for n≥1,
  alpha(n)/n^r = Phi((X0+X1/n)^r)
    = sum_{j=0}^r binomial(r,j) Phi(X0^(r-j) X1^j) n^(-j).
Each term is a fixed coefficient times a power of 1/n. Hence the right-hand side tends to Phi(X0^r)=a. The source proves continuity of a polynomial in t, evaluates at t=1/n, and uses eventual n≥1; no division by n=0 in the human proof. All coefficients can have either sign. This proof is not asserting positivity of mixed intersections or invoking an unproved Hodge index inequality.

## 4. Human reconstruction of D's three-error budget
Fix any epsilon>0, let e=epsilon/3 and F=r!≥1. The good-pair theorem constructs P with P.L=L, P.A ample and nef, b and rational-function witnesses s,t with P.Good D b s t. D obtains the self-intersection alpha from E and the representation facts for P.L and P.A. These inputs remain obligations, not consequences of the numerical budget.

First choose n≥1, sufficiently large that
  alpha(n)/n^r > a-e,
and such that for all sufficiently large m the following F (continuity-from-above) estimate holds:
  P.lc(nm,m,1) ≤ P.lc(nm,0,1)+e(nm)^r.                   (1)
F supplies the nested eventual quantifiers: eventually n, eventually m. Choose n only once, after intersecting the two eventual n conditions. D derives P.Rep n 1 (L^n tensor A) via the power/tensor representations. H yields a real t0 such that the constant metric shift of L^n tensor A is nef, using ArCalc, NefNumerics, semipositivity and fibre-nef of L, and ample plus nef of A. This is not the assertion that the unshifted L is nef.

Now G, using ArithHilbertSamuel, ArCalc, P.Good, the representation, self-intersection alpha(n), and nef shift t0, gives for all sufficiently large m
  (alpha(n)/F-e)m^r ≤ P.lc(nm,m,1).                       (2)
For arbitrary N0 choose one m≥max(N0,1) satisfying (1) and (2). Set x=n^r≥1, y=m^r>0, N=nm≥N0. Then
  P.lc(nm,0,1) ≥ alpha(n)y/F-ey-exy
                 ≥ (a-e)xy/F-ey-exy
                 = a xy/F - e xy/F - ey - exy
                 ≥ (a/F-3e)xy.
The final step uses F≥1 and x≥1: e xy/F≤e xy and e y≤e xy. It does not require a or alpha(n) nonnegative. D:70–85 proves exactly these inequalities (e1–e4) and combines them with the two eventual estimates.

D then identifies P.lc(nm,0,1) with log of the finite small-section count for L^N: its twisted-power encard equality and ball finiteness ensure the natural cardinalities agree. Thus for every epsilon>0 and arbitrarily large N,
  smallSec(L^N) is finite, and
  log #smallSec(L^N) ≥ (a/F-epsilon) N^r.
No uniform threshold in epsilon is needed and not all large N are claimed to work. The n,m selection order is essential. The geometric count lemma and ball finiteness are still separate leaves.

## 5. Limsup closure (I, K)
Use arbitrary delta>0 and the preceding result with epsilon=delta/F. Discard finitely many N=0 terms. The small-section set contains the zero section, so each finite count at a selected N is positive. Multiplying the bound by F/N^r gives a-delta ≤ F log(#smallSec(L^N))/N^r on arbitrarily large N. The exact extended-real limsup inequality follows from Filter.le_limsup_of_frequently_le, including the possibility of infinite arVol. I handles finite ncard to extended-real log with the finite/positive conditions, then uses order density on EReal to let delta→0. Result: a≤arVol L D. This is the desired VolGe inequality, conditional on all of section 2's inputs and the cited geometric leaves.

In short: self-intersection is the highest-degree coefficient of a geometric polynomial; the counting estimates transfer that leading coefficient to a lower bound for arithmetic volume. The factorial F is a normalization from the source, not a fitted constant. The result supplies a mathematical route from intersection data to section growth rather than directly claiming nonvanishing of an L-function.

## 6. Executed checks and reproduction
Actual connector V8 run re-fetched A–I at the original pin, checked all nine returned blob IDs against inventory, and passed 31 literal source assertions (not kernel edges): A lines 532,783,812; B 16,21; C 13; D 40,49,70,74,77,79,82,85; E 18,29,38,40,47,56; F/G/H line 12; I 21,22,25,37. J–M inspected; no assertion count assigned to them. Replay checkout pin and git hash-object each path; inspect listed lines and full theorem bodies.

Exact integer arithmetic tests executed in the same runtime: 11,340 budget cases (D=0..5, n=1..6, m=1..7, a=-4..4, epsilon=1..5). Use 3alpha=(3a-epsilon)x+1 so strict premise holds even for negative a. Multiply all inequalities by 3F. Independent integer polynomial multiplication vs binomial formula: 900 cases (r=1..9, n=1..20, coefficient families c_j=s(j+1)-2, s=-2..2). No failures. Minimum scaled budget slack=1. Reproduce with this standalone Python standard-library script (equivalent arithmetic to executed BigInt loops):
```python
from math import factorial, comb
from itertools import product
budget = poly = 0
min_slack = None
for D,n,m,a,eps in product(range(6),range(1,7),range(1,8),range(-4,5),range(1,6)):
    r=D+1; F=factorial(r); x=n**r; y=m**r
    alpha3=(3*a-eps)*x+1
    lb=alpha3*y-eps*F*y-eps*F*x*y
    target=(3*a-3*F*eps)*x*y
    slack=lb-target
    assert slack==y+eps*((2*F-1)*x*y-F*y) and slack>=0
    min_slack=slack if min_slack is None else min(min_slack,slack)
    budget+=1
for r,n,s in product(range(1,10),range(1,21),range(-2,3)):
    c=lambda j:s*(j+1)-2
    p=[1]
    for _ in range(r):
        z=[0]*(len(p)+1)
        for j,v in enumerate(p):
            z[j]+=n*v
            z[j+1]+=v
        p=z
    assert sum(v*c(j) for j,v in enumerate(p))==sum(comb(r,j)*n**(r-j)*c(j) for j in range(r+1))
    poly+=1
assert (budget,poly,min_slack)==(11340,900,1)
print(budget,poly,min_slack)
```
These synthetic arithmetic regression cases check the generic algebra, not the geometry or native Lean environment. Mathematical proof for arbitrary parameters is the exact inequality and polynomial argument above. No Lean compilation or local kernel extraction, no changes to assumptions, no URT acceleration tested, no full-proof completion percentage. CI for this note not executed. Source hypotheses of all imported geometric producer lemmas remain open for translation.

RESUME HERE: follow M:height_of_meanAll_bound via HodgeBundleWeights/HeightLowerBoundGeneral and ThirdPlaceSeries/HeightOfSteps. Locate an actual consuming use of PublishedHodgeBundleTheorems.p2 in this chain (if absent, record the exact alternative consumer or unused field). In parallel with that source inspection, the next geometric leaf for VolGe is F's lc_add_A_le in SmallSectionCountContinuousFromAbove.lean: reconstruct its two-level eventual quantifiers and prove its small-section comparison with the exact b,s,t and metric assumptions. Do not redo the polynomial or three-error budget.
HANDOFF TO: proof editor, integration, audit, character boxes and literature lanes. The VolGe chapter is ready for independent source audit; record flow is not yet kernel reachability.
