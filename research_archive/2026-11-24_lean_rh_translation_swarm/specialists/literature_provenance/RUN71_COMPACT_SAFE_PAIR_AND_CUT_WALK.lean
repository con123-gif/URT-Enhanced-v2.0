import New.Lift.LongGap

/-!
RUN71 — compact human source-matched derivation, 27 November 2026.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10
(completion-first compact target), manuscript ea51739eda55a41749858377bc5635f7e9c49d41.
Latest peer commits 09c0f4ff, 15bf637f, 4b2ec292, 7cdfbc59,
6526a8e7, 22990488, b66c0b19, 43ff3e37, cbfdcc8a, 327ee638,
55d81106, 21ccc35d, 9ce5a9fb. Galois RUN71 actual diff checked;
it owns the derivative/common coordinate correction; do not duplicate.
Read prior RUN69/70 and RUN68. No RH or URT premise.

Native sources (relative to grh-compact/src):
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141
  207–221 divided differences and Frobenius point transport;
  223–263 third pairing, isSafe_of_exponents;
  265–312 isSafe_smul_sub, scaledCupBounds_of_points_at_cuts.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046
  134–146 Frobenius exponent transport; 185–207 exponents add.
New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c
  44–62 tensorLattice, thirdSide, IsSafe; 81–116 actual four
  conditions and scaled cup consumer.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487
  46–51 tau_pow_smul_mem_ainfLattice_of_chi.
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd
  166–172 Galois differences preserve exponents; 256–259 divided difference.

1. The common positive-filtration certificate at the actual safety consumer.
Write W,W' for the exponent profiles o,o' of the kernel vectors w,y.
Use RUN70 strictness to identify them with vectors in Y,Y', not their
extension lattices. At letter i, the third side has a point N over
p^kappa at the previous letter i.stepBack(l). Transport by phi^l;
its absolute profile is Z=frobExponent l 0 o2 (zero for a<l, else
o2(a-l,-)). This is antitone in the weight, including the zero branch.
The third side is (Y tensor Y')^vee(1) with an extra trivial quotient.
The allowed tensor weights are v=u+u', and the third weights include
0 and -v-1. Keep all of these, including the zero.

At every a and pair of allowed weights assume the actual H:
  Z(a,-u-u'-1)+W(a,u)+W'(a,u') > 0.
Define R(a,v)=1-Z(a,-v-1). For any allowed output weight v
with u+u'<=v, we have -v-1<=-u-u'-1, so antitonicity gives
  Z(a,-v-1)>=Z(a,-u-u'-1).
Integers are essential: the strict inequality yields
  R(a,v)<=W(a,u)+W'(a,u').
This supplies HodgeExpansion.wittPairing_mem_withExponents for
the equivariant tensor map. Its integral saturation and all-form
basis hypotheses are retained in that established native supplier,
not replaced with a calculation on one decomposable tensor.

Now pair the result with N via the equivariant thirdPairing, with
target the Tate lattice whose only weight is -1. For every allowed
third weight t and tensor weight v with t+v<=-1, antitonicity gives
  Z(a,t)+R(a,v)>=Z(a,-v-1)+R(a,v)=1.
Thus the Tate output T lies in withExponents(i,stdExponent 0):
the standard profile at weight -1 is 1 for ALL a. This is the
exact intermediate target; one cannot infer membership in a
Witt ideal just from positivity at a single embedding.

Apply the actual tau_pow_smul_mem_ainfLattice_of_chi with c=1
to T: tau*T is in the A_inf lattice of the Tate module. Multiply
by z, whose Teichmuller coordinate has positive tilt valuation,
and map by the reduction to Z/p^m(1). Every A_inf lattice generator
goes to smallPart after multiplying by z (Witt maximal-ideal image).
There is no claim that smallPart is an ideal of the whole W(C^flat).
Since the projection of N is p^kappa constantAt(i,1), the actual
wittPairing_constantAt_and_thirdPairing identifies the reduced
third pairing exactly with p^kappa times P.wittPairing(w,y).
Here constantAt acts as letterProj_i, the identity on w.
Moving the scalar z*tau to either input by bilinearity proves
  IsSafe P kappa (zTauUnit*w) y,
  IsSafe P kappa w (zTauUnit*y).
No extra power of p and no rank factor. Native Tate integral-frame
supplier, thirdPairing equivariance and strictness are retained.
No new published theorem substitution: the generic cup-product
vanishing literature does not itself supply these integral profiles.

2. Difference and transport bridge.
A point X over p^e*c has Galois-invariant projection. Therefore
zTauUnit^-1*(gX-X) lies in the zero-projection kernel with its
depth profile d, by the exact divided-difference lemma (not by
assuming that division by an arbitrary scalar preserves filtration).
If Y is already in the kernel with absolute profile B, gY is
also there: gY=Y+(gY-Y), both terms of that profile and zero
projection. Apply section 1 to divided X difference and gY;
this gives the actual isSafe_smul_sub, retaining g unrestricted.
If two points over the SAME p^e*c are subtracted, their difference
has zero projection and the minimum of their absolute profiles.
Transport a point by phi^l: its absolute profile becomes F_l^0
and its depth F_l^1, where F_l^b(c)(a,u)=b if a<l and
c(a-l,u) otherwise. The latter extra 1 comes from phi^l(zTau)
divisibility at every frobE(a), a<l, as in LongGap 216–221.
This is NOT a claim that absolute exponents increase by 1.
Both facts hold before taking any norm.

3. Exact cut-walk reindexing, retaining the four distinct consumers.
Let sigma be letterFrob, and l(i)>0 the least strictly positive
distance to a cut. For an arbitrary choice predicate P let
d_P(i)=0 if P(i) and cut(i), else l(i). All origins i.stepBack(d_P(i))
are cuts. If sigma^-1 i is a cut then l(i)=1 and d_top(sigma^-1 i)=0.
Otherwise the least positive distance from sigma^-1 i is l(i)-1
(the two minimality inequalities follow by adding/subtracting 1).
Thus d_bottom(i)=d_top(sigma^-1 i)+1.
Define U_P(X)=sum_i phi^d_P(i) X_(i.stepBack(d_P(i))).
Finite reindexing via sigma gives phi U_top(X)=U_bottom(X).
All projections sum to the same p^e*(1 tensor c), by sum_letterProj.
The sums have their prescribed letter parts. For distinct letters i,j,
the balanced Witt pairing satisfies
  ([i]-[j])*pair(w_i,y_j)=0,
and [i]-[j] is a unit because the residue letters differ. Hence
cross terms vanish EXACTLY. For a common kappa the sum of safe
diagonal terms is safe by additivity of smallPart.

4. The complete local case table for the four IsSafe hypotheses.
At a cut i write X=X_i,Y=Y_i and X-=phi^l X_j,Y-=phi^l Y_j
where j=i.stepBack(l). For a noncut, use X=X-,Y=Y- (all selections
have identical origin), with that same strict previous cut j.
Define V=U_Q(X) locally: V=X if Q and i is a cut, otherwise X-.
The global three points are U_top(X), U_Q(X), U_top(Y);
their Frobenius translates have local entries X-,Y-.
Write oX,oY for absolute profiles at a cut, dX,dY for depths,
z for the third profile. Every cut supplies both sides' basic
inequality, e.g.
 z(a,-u-v-1)+dX(a,u)+min(-v,oY(a,v))>0,
and the analogous one with X,Y interchanged.
At a leading side (X when Q, Y otherwise), also retain its
absolute profile >= stdExponent(l), and the stronger inequality
with third profile transported from the supplied cut r and
the minimum of the other side's current and transported absolute
profiles. These are exactly HasDeepPoint, not new premises.

The four local safety inputs from CupProductBound are:
 I   (gX-X, g(hY-Y)) for all g,h;
 II  (V-X, gY-Y);
 III (gV-V, g(Y--Y));
 IV  (X--V, gY--Y-).
I: apply section 2 to X and the undivided hY-Y in the kernel
with absolute oY, using the current cut basic X inequality.
At a noncut use the previous cut transported by l: for a>=l
the same basic inequality applies; for a<l the three profiles
are depth 1, absolute 0, third 0, so the sum is 1. No issue with
h arbitrary, since undivided differences preserve absolute profile.
II–IV at a noncut are zero by identical selections.
At a cut with Q true, II is zero. III uses X's leading inequality:
depth dX and the minimum of the two Y absolute profiles, third
point transported from the cut r supplied by X. Use isSafe_smul_sub.
IV uses the previous cut's basic Y inequality: the difference
X--X has absolute profile min(F_l^0 oX_j,oX_i). For a>=l this
is >= min(oX_j,-u), since the leading X_i has stdExponent(l);
Y- depth is dY_j and the third profile is z_j, with shifted index.
For a<l, the minimum is 0 or larger, Y- depth is 1, third 0.
Apply section 1 with the divided Y- difference, moving zTau to
that input. This is the second conclusion of isSafe_of_exponents.
At a cut with Q false, IV is zero. II uses Y's leading inequality
with min(oX_i,F_l^0 oX_j), third point from Y's cut r; again the
second conclusion of section 1 for the divided Y difference.
III uses previous cut basic X inequality with X- depth and
min(oY_i,F_l^0 oY_j), since Y_i has stdExponent(l). For a<l the
sum is at least 1, as above. Apply isSafe_smul_sub to X- and
Y--Y. All transported inequalities use
(i.stepBack(l)).stepBack(a-l)=i.stepBack(a) for a>=l, so the
allowed weight sets are the SAME, not independently chosen.
Signs of the difference are irrelevant only because these
are submodule membership tests; no absolute-value relaxation.

This explicitly supplies the four actual IsSafe inputs to
ScaledCupBounds.of_isSafe on the SAME three global points.
Together with RUN69's common cohomological endpoint it yields
ScaledCupBounds E for E>=e+e'+kappa, with precisely that cost.
The cut/profile existence and the single-step/frame suppliers
needed to produce these points in the three numerical branches
are not assumed proved by this argument. Do not count this
local bridge as closure of all of Theorem C.

Original static graph: OnePlaceDefect -> crystalline_defect_le ->
three cup suppliers -> scaledCupBounds_of_points_at_cuts ->
isSafe_sum, isSafe_smul_sub, isSafe_of_exponents ->
strictness, wittPairing_mem_withExponents (twice),
tau_pow_smul_mem_ainfLattice_of_chi, thirdPairing identity.
Human reduced graph uses one integer residual profile R and one
cut case table, then RUN69 cohomology. No native nodes retired.
Cache key: compact pin, same chart/letter, cut,Q,l, allowed jump
sets, actual point projections, absolute/depth profiles, and
third antitone profile. Keep original graphs and axiom ledger.
The four conditions have distinct consumers and cannot be merged
merely by name. No fresh external literature claim or axiom.

Execution: command -v lean/lake/elan returned no paths.
Actual CI state file compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
reread: six previous native checks use only propext, Classical.choice,
Quot.sound; module_1_build timeout 124 at 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS; no compact native reduction engine invocation.
Prepared scalar proof and actual source probes below, not executed.
Old-pin engine results do not verify compact declarations.

RESUME HERE: independently audit the four-case table and integrate
with RUN69 and RUN70. Next source-match LongGap.coeff_mem_constantsModE
and pointsOver_nonempty_of_long_gap, especially the coefficient
extraction and exact projection of the correction term, against
the prior RUN56 cut/profile result. Keep frame_theorem.1.2.1 and
Galois RUN71's pending E-power and chart valuation suppliers explicit.
HANDOFF TO integration/editor, Galois, audit, compact native runner.
Human RH reconstruction remains incomplete.
-/

namespace RHLiteratureRun71

theorem tensor_residual_profile (Z : ℤ → ℤ) (hZ : Antitone Z)
    (u u' v A B : ℤ) (hv : u + u' ≤ v)
    (h : 0 < Z (-u-u'-1) + A + B) :
    1 - Z (-v-1) ≤ A + B := by
  have hz : Z (-u-u'-1) ≤ Z (-v-1) :=
    hZ (by omega)
  omega

theorem tate_residual_profile (Z : ℤ → ℤ) (hZ : Antitone Z)
    (t v : ℤ) (h : t + v ≤ -1) :
    1 ≤ Z t + (1 - Z (-v-1)) := by
  have hz : Z (-v-1) ≤ Z t := hZ (by omega)
  omega

#print axioms tensor_residual_profile
#print axioms tate_residual_profile
#check Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents
#check Lift.KummerChart.PairingSide.SidePairing.isSafe_smul_sub
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_points_at_cuts
#check Lift.KummerChart.JumpLattice.wittPairing_mem_withExponents
#check Lift.KummerChart.JumpLattice.tau_pow_smul_mem_ainfLattice_of_chi
#print axioms Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents
#print axioms Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_points_at_cuts

end RHLiteratureRun71
