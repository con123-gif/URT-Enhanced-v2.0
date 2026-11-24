# Geometry run 2 — small-section comparison by quotient injection and radius control
2026-11-24. RESULT: SOURCE-MATCHED local reconstruction; full project PARTIAL. Completes the small-section continuity-from-above comparison used in run 1's VolGe argument. Also narrows the downstream height/volume dependency; no assertion of root kernel reachability.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol and CI summary (PASS run 45355061872, 3149343, 08:41:49 UTC; physical CI is not RH validation). Read prior geometry RUN1 and latest peer handoffs (kernel, acceleration, integration, math, theta, Galois, character boxes, Landau, literature, prime, editor, structure, dependencies). No physics files or shared queue edited. Upstream main head observed ed2fb2c8dbc2380ce1f46627b8f777634b041244 (08:52:02 UTC); fetching the corresponding original comparison path at that revision returned 404, so no assertion of cross-revision equivalence. All below uses the original pin 40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis.

## Source ledger
Paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless specified. Blob identities:
- A SmallSectionCountContinuousFromAbove.lean 1f906375336006e801ad61f14a09679c6dd380cb
- A' SmallSectionCountContinuousFromAboveStatement.lean 576ce7a9e4043f9dd3ac9b952163fc1e8c85a065
- B EncardMulLeOfQuotEmbed.lean d472deebf3195b1c42285d319e8c582efd2767cc
- C ArithSmallSectionsEncardMulLeFiniteLevel.lean 0b78e4fe16679b2bbffdcdc039b3d78445b82844
- D MemSmallSectionBallOfMulPowSection.lean 894c41e69deeac4905e35c5c6ec0f04b567e778a
- E ExistsLogNcardSeminormBallExpSmallLe.lean 78652f5802201a83030be5b2af64ae38db0371e6
- F SmallSectionCountNearPowersLe.lean 604268f009f2cb5a645eaa358705063ea2fdd503
- G SmallSectionCountLePowGoodPairStatement.lean fbf8546710cb9636902a475af1925e978dd3373e
- H HermLineBundlePairBallsFiniteStatement.lean 99cbe9bfa3c6a18db148efecb67343d68c45d25a
- I IsSeminormBallFamilySectionBallsStatement.lean 4e0068b55f6b6f756bcbea11711f40338b6de486
- J ArithGlobalMaximumPrincipleOffDivisorStatement.lean 362713b605e32e8e0adb262390cb3fde23c4cbff
- K ArithSmallSectionsEncardMulLeFiniteLevelStatement.lean 6f3988962f2f49c69c0e2b8dae30b873b83287f5
- L MemSmallSectionBallOfMulPowSectionStatement.lean 37c57acda6dfa8e0ee8c760c0f582ce3eef6d069
- M ExistsLogNcardSeminormBallExpSmallLeStatement.lean 1d21b35f15a1cefdea0b62bef3b0519ecafae718
- N SmallSectionCountNearPowersLeStatement.lean 77f9b93a8e1aa6495e6ae469b4a221a48d895e7c
- O src/Development/AbelianVarietyTheory/Definitions/Divisors/CharZeroFunctionField.lean f0bb42594c83ce7baca8da440bbbd36f2c9d730a

## Exact target and assumptions (A:36–39, A':12, O:37–109)
Let k be any commutative ring, X an integral scheme of universe 0, p:X→Spec k, D a natural number, and IsArithVar p D. Assume ArithHilbertSamuel and ArCalc, and a pair P of Hermitian line bundles L,A with rational trivializations r,r'. The subgroup H(a,c) consists of rational functions f for which all local expressions loc(a,c,f,i,j)=f r_i^a (r'_j)^c are regular at every point of the relevant charts. The norm nu(a,c,σ,y,f) is the absolute value of the corresponding rational evaluation times exp(-(a φ_L+c φ_A)/2). Bl(a,c,R) consists of members of H(a,c) with that norm ≤R for every embedding σ:k→C and complex point y. lc(a,c,R)=log(ncard Bl(a,c,R)).
Keep all eight Good fields: A underlying ample, A nef in dimension D, b>0, s in Bl(0,1,1), s≠0, t in Bl(-1,b,1), t≠0, and the local regularity implication for each x,i,j,g regular at x: if g loc(-1,b,t,i,j)/loc(0,1,s,i,j) is regular then g/loc(0,1,s,i,j) is regular. This last condition is crucial to quotient pullback. No assumption of nefness of L in this lemma.
For every epsilon>0 there is n0 such that for every n≥n0 there is m0(n) such that for every m≥m0(n), with N=nm and d=D+1:
  lc(N,m,1) ≤ lc(N,0,1)+epsilon N^d.
The inner m threshold may depend on n. This is not a uniform-in-n bound for all large pairs with one common m0.

## 1. The combinatorial heart (B:9–58)
In additive group G take subgroups Λ,Λ',Λ0,Λ0', ball families B,E and additive T. IsBallFam supplies containment in the subgroup, zero for nonnegative radii, subtraction B(r)-B(r')⊆B(r+r'), and positive integer scaling equivalence. Assume T(B(1))⊆E(1), and for u in Λ, T(u) in Λ0' implies u in Λ0, and B(1) finite.
Let R be the image of B(1) under G→G/Λ0. Choose s_c∈B(1) representing each c∈R. Every x∈B(1) is s_[x]+(x-s_[x]), where the difference belongs to B(2)∩Λ0. Therefore |B(1)|≤|R| |B(2)∩Λ0|.
The map (c,v)↦T(s_c)-v from R × (E(1)∩Λ0') lands in E(2) by subtraction. If two outputs coincide then T(s_c-s_c')=v-v'∈Λ0'. Since s_c-s_c'∈Λ, pullback gives s_c-s_c'∈Λ0, hence c=c', then v=v'. It is injective. Multiplying and associating the two cardinal inequalities gives
  |B(1)| |E(1)∩Λ0'| ≤ |B(2)∩Λ0| |E(2)|.
The Lean theorem uses extended cardinalities (encard); no cancellation by |R| or division by potentially infinite cardinals. Finiteness and positivity are established before taking real logarithms later.

## 2. Specialize to the rational sections (C:21–97)
For fixed N,m set B(R)=P.Bl(N,m,R), E(R)=P.Bl(0,bN+m,R), Λ=P.H(N,m), Λ'=P.H(0,bN+m), T(u)=u t^N. Define Λ0={u:u/(s^m)∈P.H(N,0)}, Λ0'={u:u/(s^m)∈P.H(0,bN)} as additive comaps. Powers of s,t have the expected bidegrees and nonnegative norms ≤1 (C:27–42); T maps B(1) into E(1) via multiplication and the bidegree sum (N,m)+(-N,bN)=(0,bN+m). The imported div_pow_mem_sections_of_mul_pow_mem supplies the required pullback condition via Good's local regularity hypothesis; keep it as a separate obligation. Multiplication by s^m is injective (s≠0, function field). It embeds Bl(0,bN,1) into E(1)∩Λ0', and gives a bijection between S={f∈H(N,0):f s^m∈Bl(N,m,2)} and B(2)∩Λ0. The inverse is division by s^m. Substituting in B yields exactly
  #Bl(N,m,1) · #Bl(0,bN,1) ≤ #S · #Bl(0,bN+m,2).
Initially in encard, with finiteness of Bl(N,m,1). This argument does not assume a direct map of all small sections from L^N A^m into L^N at radius 1.

## 3. Radius control and the three estimates (A:40–88, D:16–45, E:11–78, F:17–54)
H and I give finite balls and ball-family laws; all nonnegative-radius balls contain zero, so counts≥1. G gives C0 and eventual crude log count at exp(3N) ≤C0 N^d. Apply E with tolerance eta=epsilon/3. Its choice e=max(1,ceil_nat(C0/eta)), delta=1/e>0, gives eventual
  lc(N,0,exp(delta N))≤lc(N,0,1)+eta N^d.                 (R)
Here E invokes the still-open radius-change cardinal inequality with Q=ceil_nat(2R+1), R=exp(N/e)≥1. Q≤4R; R^(e+1)≤exp(2N). For N≥3e, R Q^e≤exp(3e+2N)≤exp(3N); monotonicity of balls follows by subtracting zero. The cardinal inequality #B(R)^e≤#B(1)^e #B(R Q^e), combined with finiteness, zero membership, the crude bound, log laws and C0≤eta e, proves (R). No assumption that C0>0 is required for this choice of e.
For D apply off-divisor maximum principle J with delta/2. It gives rho>0 with the implication: if f∈H(N,0) and all complex points where nu(s)≥rho have nu(f)≤R0, then f lies in Bl(N,0,exp((delta/2)N) R0). Choose C=max(0,-log rho), so exp(C)nu(s)≥1 at such points. For f∈S, nu(f)nu(s)^m≤2, hence nu(f)≤2 exp(Cm) there. J gives
  S ⊆ Bl(N,0,2 exp(delta N/2+Cm)).
For n≥max(1,(2C+2)/delta) and m≥1 we have delta n/2≥C+1, thus
  1+delta N/2+Cm≤delta N
using m≥1. Since 2≤exp(1), S⊆Bl(N,0,exp(delta N)); S is finite. This is the exact reason the factor 2 is harmless; do not drop it.
F invokes the polynomial-asymptotics comparison with d, b>0, leading coefficient selfInter(A)/d!, slope d·gdeg(A,D)/d!, and the Hilbert–Samuel log-ball limit for A shifted by zero (A nef). The fixed-radius 2 count is eventually dominated by exp(η'j) for every η'>0. It gives
  lc(0,bN+m,2)≤lc(0,bN,1)+eta N^d                      (P)
eventually n, eventually m. Preserve these imported asymptotics and nef shift theorem as obligations; the source proves the conversion (bn+1)m=bN+m.
Choose n large enough for F and the radius threshold. For this n≥1, N=nm→∞ as m→∞, so choose m sufficiently large for (R), (P), m≥1. From section 2 take natural counts using all finite balls and S finite; log product lemma A:20–34 derives
  lc(N,m,1)+lc(0,bN,1)≤lc(N,0,exp(delta N))+lc(0,bN+m,2).
Combining (R) and (P) gives lc(N,m,1)≤lc(N,0,1)+2eta N^d≤lc(N,0,1)+epsilon N^d since N^d≥0. The original uses linarith; no limit interchange. This proves the exact small-section comparison conditional on listed leaves and completes the comparison used in RUN1, not the entire geometry chain.

## 4. Downstream height dependency correction (source record, not exact kernel)
Additional pinned sources relative to src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/:
- ThirdPlaceSeries/HeightLowerBoundGeneral.lean b6012f8c9b260e1596140ce99671df2b7692f72c :22→ ThirdPlaceSeries/HeightOfSteps.lean 57977b43b6f96237cfe73383319866bceebbbad3 :36.
- HodgeBundleWeights/HeightAddLogNonneg.lean d764bb7e9b2524f39456e99a8d98de3b3ccdbf47 :98→slope_le_height :48–65.
- HodgeBundleWeights/VolumeLineBundleLe.lean 084f70a82c1d7335082f3284bf0620bcef38be05 :13–22 uses existence of nef model plus countingVolume_le_selfIntersection_nefHermitianBundle with hP.q9 (ArithHilbertSamuel), not direct hP.p2 (VolGe).
- HodgeBundleWeights/ExistsNefModelOfImage.lean 3c6930f48506b89563f7736aa44378fea26588cb :26–41 uses image model, hP.q11 (CycleHeights), nef shift and hPX.1/.2 (self-intersection upper bound and small-section injection). HodgeBundleWeights/VolumeEstimateHypotheses.lean e93eb83a9cef1478cbec92f522522b2fa3a33a55 :9–11 defines exactly these two hypotheses.
- HodgeBundleWeights/ExistsModelOfImage.lean b305815d2811ba8f4a542fb07d467b556e4b665a :15–16 accepts PublishedHodgeBundleTheorems but ignores that argument in its local body.
- HodgeBundleWeights/ImageHeightNonnegOfDivisor.lean 8321ba34e7d2620188f8a47cd946873a93d546d7 :11–12 and HodgeBundleWeights/CoverHeightComparison.lean 342c70053c61ddf2483dbc46adeed88b79ab1b40 :33–35 likewise ignore the record in their immediate bodies.
- HodgeBundleWeights/ToKnownTheoremsOf.lean 95aeefe8ba6bb9f38a0d32b3147d331792ef74d8 :7–35 identifies p2 as VolGe, q9 as ArithHilbertSamuel, q11 as CycleHeights. :39–45 explicitly projects p2 into Hypotheses'' via toClassicalTheoremsOf. This is a genuine source projection but not evidence that the downstream height proof uses it.
- ThirdPlaceSeries/CoveringGramMatrixOfLocalTraces.lean 89eef28a309cf74b302c60ded73f0f7abfcb9c6c :17–20 ignores hP, calling local row producers instead.
- ThirdPlaceSeries/TopCovolG.lean 62742fab059140fb67f88b2c1e18abd6078992b3 :54–58 connects height to uniform lower bound and covolume.
Important distinction: the prior VolGe is a LOWER bound on arithmetic volume, whereas volume_line_bundle_le uses a counting-volume UPPER bound via self-intersection. No direct implication from VolGe to the upper bound is claimed. hP.p2 is record-flow only on the inspected direct height path. It may be used in other producers; no global dead-code conclusion. Next inspect actual hPX.1 and .2 producers and consumers of toClassicalTheoremsOf.

## 5. Execution
Actual connector V8 run re-fetched and checked all six main body blob hashes A–F and 21 source substrings. Executed 4,212 finite integer quotient injection/cardinality examples; minimum cardinal slack zero; 19,800 exact rational radius-exponent cases; zero failures. These are generic regression tests, not source-native arithmetic schemes or Lean kernel proof checks. No URT speed claim. No source hypotheses discarded. Reproduce the executed integer checks with:
```python
from math import gcd
from itertools import product
qcount=rcount=0
minslack=None
for a,q,u in product(range(1,7),range(1,14),range(9)):
    for v in range(a*u,a*u+6):
        h=q//gcd(a,q)
        slack=(2*(2*u//h)+1)*(4*v+1)-(2*u+1)*(2*(v//q)+1)
        assert slack>=0
        minslack=slack if minslack is None else min(minslack,slack)
        reps={}
        for x in range(-u,u+1): reps.setdefault(x%h,x)
        z=[a*x-y for x in reps.values() for y in range(-(v//q)*q,v+1,q)]
        assert len(z)==len(set(z)) and all(abs(i)<=2*v for i in z)
        qcount+=1
for d,j,C,k,m in product(range(1,6),range(1,10),range(11),range(5),range(1,9)):
    n=((2*C+2)*j+d-1)//d+k
    assert d*n*m-2*j*C*m-2*j>=0
    rcount+=1
assert (qcount,rcount,minslack)==(4212,19800,0)
print(qcount,rcount,minslack)
```
Source assertions: A (2 * C + 2) / δ, htend.eventually hrad, hSfin.cast_ncard_eq, log_add_le_of_mul_le, simp only [Pair.lc]; B x - s (q x), T (s p.1) - p.2, hpull _ hΛ hd; C pow_ne_zero _ hg.s_ne, div_pow_mem_sections_of_mul_pow_mem, mul_left_injective₀ hs0; D max 0 (-Real.log ρ), arith_global_maximum_principle_off_divisor, one_le_pow₀ h1; E max 1 ⌈C / ε⌉₊, eventually_ge_atTop (3 * e), encard_seminormBall_pow_le_radius_change, le_of_mul_le_mul_left this heR; F eventually_le_of_poly_asymptotics, hG.pos, arith_hilbertSamuel_log_ball_count_tendsto. Re-fetch pinned bodies and compare git hash-object. No CI for this specific note yet.

RESUME HERE: Follow the actual VolumeEstimateHypotheses producer in ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean, locate the exact theorem implementing SelfIntersectionBound, translate its inequality (especially normalization [K:Q](D+1) times image degree and shifted height). Trace whether it calls PublishedHodgeBundleTheorems.p2 or uses different fields. Preserve SmallSectionsInject as distinct. Separately the next leaf of the comparison is EncardSeminormBallPowLeRadiusChange.lean; do not redo the quotient injection or radius comparison above.
HANDOFF TO: integration, editor, audit, literature, theta. The small-section comparison is now human-readable; correct any manuscript claim that VolGe alone proves the downstream height/covolume inequality.
