import New.Selmer.TwistForRows

/-!
# Formal audit: correct the balanced-row primitive at its actual consumer
2026-11-26. PARTIAL: human source-matched repair; no new kernel closure.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Attribution: Alpöge, Sernau, Claude and collaborators as upstream.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; AGENTS 8db0201d;
SWARM_PROTOCOL 4b77b161; HANDOFF_QUEUE bbc46df7. Latest peers inspected:
04c297818a661bb27b79f8695cef6028eead26c9 and its corrected note
math/2026-11-26_COMPACT_BALANCED_ROW_BUDGET.md (blob edcace11a3f3722e396cab1092951b5a48c6a5f9);
dc4a4eec (cocycle count); c0a35b56 (Kummer); 15b7768e, 6d738bf3, 40e57948
(other current suppliers). This audit replaces imprecise parts of the peer
balanced-row exposition, not the native theorem. Original graphs untouched.

## 1. Exact statements and two distinct inertial elements
Source anchors (blob, declaration):
- New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c:
  IsRow.inertia_above_g, IsRow.span_and_scalar, IsRow.exists_scalar_inertia.
- New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444:
  IsRow.eventually_isBalanced, especially local proof after choose! and final grw.
- New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c:
  IsBalanced.local_length_le.
- Lib/ClassField/GaloisCohomology/TameCocycles.lean 0c8ac30cf6a6b0307f199f1a1594245729ff49bf:
  localCocycles, tame_affineAction, length_localCocycles_le.
- Lib/General/Algebra/FittingDuality.lean 50c522f409cc0214163df1d26b77aade4aa8100a:
  length_obeying_relationsOn_le AND length_ker_le_addVal_det (the latter is
  misattributed to DeterminantBound in the peer table).
- New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650:
  finrank_crysCocycles_eq_add_neg_jumps.
- New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df:
  IsRowType.card_neg_le, sum_complexEmbOf_le.
- New/Selmer/AptTuples.lean 49699d4679d83a7bc7714afc53b7e2757ae4adf3:
  ellVal_le_crudeUnit, card_le_of_subset_placesAboveG.
- New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d:
  exists_mFoldTwist_selmerLengthLe.

Write u for the SAME lattice over O, n for rank, f=numInfPlaces(E)=D.f,
C=crudeUnit. Fix the chosen place w off ell and M before the eventual O
quantifier. Distinguish:
  gamma_0 = scalar inertia witnessing IsBalanced.scalar_inertia (s±1 units);
  gamma_v = inertial element chosen by IsRow.inertia_above_g at each v;
  gamma_w = actual tameGenerator at the CHOSEN w (by that field's first clause);
  g = the separate scalar witness from span_and_scalar, cycChar(g)=D.g(i)^n.
The native external budget in eventually_isBalanced is
 normLength(beta + sum_b addVal(det(u(idOrConjInv b gamma_w)-1))) <= 10 f n C.
It is NOT a sum at gamma_0, as equation (1.1) in the peer note writes.
No theorem equates gamma_0 and gamma_w. At arbitrary v, gamma_v need not
be the tame generator: its equality is only required at D.IsChosen v.
The finite place local condition includes the independent premise that m_v
is a local unit (A.valuation m_v.cast = 1), as well as ell being a unit.
The latter alone cannot prove m_v*ell^M is a unit.

## 2. Prove the local length at the native Z1 level, not H1
Let B=O/(a), a divides ell^M, and V=B^n. Let Z be localCocycles u L A B,
the image of the global continuous cocycles obeying L under restriction to
the decomposition group. It is an O-module of actual functions, NOT the
quotient by coboundaries. Thus replace every H^1_loc in peer (3.2),(3.4),(3.6)
by this actual module. Using cohomology length instead is an invalid
upper-bound substitution: for C2 acting by -1 on Z/4, |Z1|=4,
|B1|=2, |H1|=2. Even when H1 is small the missing coboundaries can be large.

At v off ell let tau be the actual tame generator, gamma_v the possibly
different inertial element from the row, and phi arithmetic Frobenius.
The hypotheses of tame_affineAction are satisfied: locally constant reduced
u (from continuity), ell^M kills B, u kills m_v-th inertia powers, and
m_v*ell^M is a local unit. Consider eval_tau: Z -> V. Its image has length
<= length V. Any z in its kernel kills all inertia by tame_affineAction.
For gamma_v in inertia, gamma_v*phi and phi*gamma_v differ by an inertia
element on the RIGHT; z vanishes on that element, so their z-values agree.
The cocycle identity then gives
  u(gamma_v) z(phi) = z(gamma_v phi) = z(phi gamma_v) = z(phi).
Evaluation at phi on ker(eval_tau) is injective: if it also vanishes,
the cocycle vanishes on the decomposition group generated topologically by
inertia and Frobenius (continuity, closed cocycle kernel).
Consequently
  length Z <= length V + length ker(u(gamma_v)-1 on V)
           <= n length B + addVal(det(u(gamma_v)-1)).
The last step is Smith normal form: each diagonal d contributes
min(v(a),v(d)), including the extended-value convention v(0)=infinity.
This proves the precise local estimate at the caller without requiring
gamma_v=tau, or counting coboundaries twice.

At v|ell the relation-module estimate is also about actual cocycles,
not H1. For a finitely generated O-module W=Z_f of vector-valued functions,
pick a coordinate i (n>0). The O-span of coordinate evaluations at all
points and components is a submodule of W* and has rank <= rank W.
Relations among these evaluations are included in relationsOn W by
putting all formal matrix coefficients in row i. Hence every function
obeying relationsOn W induces a unique O-linear map from that evaluation
span to B. Injectivity holds since these generators record every coordinate
of the function. The span is finite free over the DVR, so length of the
obeying module <= rank W * length B. This is the precise rank estimate
used by length_obeying_relationsOn_le; finitely generated does not mean finite.
Restriction of global cocycles to the canonical closure place obeys these
relations by crysRels; the infimum over closure places is bounded above by
this canonical-place length, not replaced by equality.

## 3. Exact CM cancellation and beta
Let T=S_ell, P_g=placesAboveG minus T, S0=T disjoint union P_g.
For each embedding sigma put a_sigma=#negative jumps. Row type says
a_sigma+a_star(sigma)<=n (NOT an equality). Sum over 2f embeddings;
star permutes them, so 2 sum a_sigma <= 2fn, i.e. sum <= fn.
sum_complexEmbOf_le bounds the sum over local embedding sets by this
global sum. The crystalline rank formula then contributes
  sum_{v in T} length Z_v <= (|T|+f)n length B.
The n per place is NOT absorbed into the f term. The remaining places
contribute |P_g|n length B plus one determinant loss per place.

Write u(g)=alpha I and u(cg)^(-1)=alpha' I for the separate scalar witness.
The trace identity (local C in RowBalanced, spanning property) gives
alpha'=cycInv(g^-1)^(t-1)*alpha, with alpha a unit. Cyclotomic invariance
under conjugation gives
 alpha - cycChar(cg)*alpha' = alpha*(1-D.g(i)^(n*t)).
Here t is positive (odd in the native row data); 1<=n*t<=D.r*D.t.
Thus the mirror loss is n*v_O(1-D.g(i)^(n*t)).
The exact beta sufficient for IsBalanced.local_length_le is
 beta = sum_{v in P_g} v_O(det(u(gamma_v)-1))
        + n*v_O(1-D.g(i)^(n*t)).
No extra crystalline determinant loss: the negative jumps are paid by the
f*n*length B term. The native proof uses H v c true, one determinant per
place, and H w h_ell for both external signs at w. Keeping the native
constant rather than optimizing it:
 normLength(beta+both_w) <= (|P_g|+1+2)*n*C <= 10 f n C
by |P_g|<=4f and f>=1. The scalar bound is ellVal_le_crudeUnit at n*t;
the determinant bounds are the actual row hypotheses. Norm-length
normalization converts v_O to ellVal at the last step, not before adding.

## 4. Actual consumer and outstanding inputs
The same u,gamma_0,beta satisfy IsBalanced and the separately chosen w budget.
TwistForRows chooses the common eventual O across the finite row family
BEFORE calling exists_anticyclotomic_twist, using both conditions from
eventually_isBalanced and the same witnesses, not a per-twist choice.
The exact outer statement returns, for each permitted power, SelmerLengthLe
with its gamma/y witness and larger-O transport; the bound is
(10 f n+1)C inside that record. It is not a claim about an independently
chosen lattice or all unconstrained powers. Retain the local crystalline
rank and dual defect, full row existence, twisting theorem, and all
arithmetic premises. No new native dependency removed. Source graph:
IsRow fields -> RowBalanced + TameCocycles + FittingDuality + CrystallineRank
 -> IsBalanced + external w budget -> TwistForRows -> fit family -> C
 -> star inequality. Reduced HUMAN graph replaces the vague H1/one-gamma/
two-per-place argument by sections 1-3; all type/value/package/axiom edges
remain unmodified and unresolved ones remain unresolved. No claim of a
kernel DAG extraction.

## 5. Independent executed checks and negative controls
Executed Python 3 in local container (not Lean), using exact integer and
Fraction arithmetic. Finite commuting tame/Frobenius presentation controls
test the cocycle length argument only, not the native number-field theorem.
Reproducible script:

```python
from math import gcd
from fractions import Fraction
from itertools import product
cases = pairs = kernels = arbitrary = 0
for q in (2,3,4,5,8,9,16,27):
    U=[x for x in range(q) if gcd(x,q)==1]
    for m,t in product(range(1,7), repeat=2):
        for r,s in product(U,repeat=2):
            if pow(r,m,q)!=1 or pow(s,t,q)!=1: continue
            cases+=1
            nr=sum(pow(r,i,q) for i in range(m))%q
            ns=sum(pow(s,i,q) for i in range(t))%q
            Z=[(a,b) for a,b in product(range(q),repeat=2) if nr*a%q==0 and ns*b%q==0 and ((r-1)*b-(s-1)*a)%q==0]
            pairs+=len(Z)
            K=[b for a,b in Z if a==0]
            A={a for a,b in Z}
            assert len(Z)==len(A)*len(K)
            assert len(A)<=q
            kernels+=1
            for k in range(m):
                H=[b for b in range(q) if (pow(r,k,q)-1)*b%q==0]
                assert set(K)<=set(H)
                assert len(Z)<=q*len(H)
                arbitrary+=1
Z=[a for a in range(4) if (1+3)*a%4==0]
B={((3-1)*x)%4 for x in range(4)}
assert (len(Z),len(B),len(Z)//len(B))==(4,2,2)
budget=0
for f,n,crn,crd in product(range(1,13),range(1,13),range(0,8),range(1,5)):
    c=Fraction(crn,crd)
    for p in range(4*f+1):
        assert (p+3)*n*c<=10*f*n*c
        budget+=1
print(dict(configurations=cases,cocycle_pairs=pairs,kernel_identities=kernels,
           arbitrary_inertial_tests=arbitrary,aggregate_budget_tests=budget,
           negative_control_Z1_B1_H1=(len(Z),len(B),len(Z)//len(B))))
```

Observed output: configurations=1355, cocycle_pairs=13712,
kernel_identities=1355, arbitrary_inertial_tests=5303,
aggregate_budget_tests=124416, negative_control_Z1_B1_H1=(4,2,2).
Rejected attempted substitutions: H1 for Z1; scalar inertia for chosen
tame generator; arbitrary gamma_v=tau; deducing local m_v unit from
v not dividing ell; equality rather than inequality for negative jumps;
two determinants per internal place rather than one.
Kummer peer c0a35b56 reviewed against Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa
and SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03:
the finite character-dual counting and common cyclotomic cancellation
are consistent with the native interfaces, retaining artinMap_surjective,
local-global cyclic reciprocity, total-complex guard for converse, and
the SAME principal decomposition. No circular use of the later existence
theorem; no new closure or duplicate derivation claimed.

Native lean/lake/elan absent locally (command -v all returned no path).
RUN28 actual CI job 139837856843 in run 45799225653 returned success;
downloaded log says PASS (912.12s). State output
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e confirms 10 native checks
and 4 scalar certificates, only propext/Classical.choice/Quot.sound,
full_RH_replay=false. None cover this new audit. Native probes below
PREPARED for the shared compact runner; no protected changes, no parallel
full-build attempt, no URT comparison required in audit lane.

RESUME HERE: integrate corrections 1-3 directly at the existing C
balanced-row section (not another determinant assembly); check the actual
crystalline defect relLength_obeyingCocycles_le and OnePlaceDefect
supplier with exact jump/dual-lattice context, and replay these probes
with RUN29 shared targeted runner. Preserve all prior work and axioms.
HANDOFF TO: editor, integration, math, Galois, kernel.
Verdict: AGREE with native route and Kummer interface; DISAGREE with
the specified imprecise human substitutions; PARTIAL reconstruction.
-/

namespace CompactBalancedAudit

theorem budget_scalar (p f n c : ℕ) (hf : 1 ≤ f) (hp : p ≤ 4 * f) :
    (p + 3) * n * c ≤ (10 * f) * n * c :=
  Nat.mul_le_mul_right c (Nat.mul_le_mul_right n (by omega))

#check IsRow.eventually_isBalanced
#check IsBalanced.local_length_le
#check localCocycles
#check length_localCocycles_le
#check length_obeying_relationsOn_le
#check length_ker_le_addVal_det
#check finrank_crysCocycles_eq_add_neg_jumps
#check exists_mFoldTwist_selmerLengthLe
#print axioms budget_scalar
#print axioms IsRow.eventually_isBalanced
#print axioms exists_mFoldTwist_selmerLengthLe

end CompactBalancedAudit
