import New.Selmer.OnePlaceDefect
import Mathlib.Tactic

/-!
# RUN56 editor — actual few-low-jump colength, 26 November 2026

Source-matched human derivation of the filtration/colength argument and its
actual consumer. Native certificate PREPARED, not run.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; current manuscript
957e9d109bd96476c701a00e872e7a0e0f853aa1. Protocol, handoff, expansion,
AGENTS and latest peer results read. Resume editor RUN55 837dd3d8.
Peers d043ac346 (unramified annihilator), 248ac90f (cut walk/cup cochain),
129d788f (tame annihilator), 77a7f2fc (direct local Tate index), 7cc78b2f
(diagonal integrality), 67ab9478 (normalized formal parameter) inspected.
No repetition of their separate constructions.

## Original source chain (static; kernel graph not available)
New/Lift/FewLowJumps.lean a86b9c32285a38ddc23f0debec7484c93e21e229:
35–94 relLength_deepConstants_le; exists_relLength_deepConstants_le;
exists_scaledCupBounds_few_low_jumps.
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141:
exists_comb_of_jumpMultiplicity_le, exists_inclKer_eq_of_projTriv_eq_zero,
exists_reaches_deep, pointsOver_nonempty_of_killsCokernel,
pointsOver_nonempty_of_noMultipleNear, scaledCupBounds_of_points_at_cuts.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046:
cost_le_of_isUnramified, mem_withExponents_of_deep.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487:
NoMultipleNear, killsCokernel_of_isUnramified.
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc:
KummerChart.few_low_jumps.
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79:
crystalline_defect_le; New/Selmer/OnePlaceDefect.lean
709e688740863f10dbbb284446ca20c0ba2a280a: block_defect_le_at_place.
Keep native chart, coefficient ring, letter i, all jump sets, opposite sign
windows, no-multiple condition, same lattice and pairing throughout.
This is a source-edge map, not an elaborated kernel graph.

## 1. One depth increment costs its multiplicity, not the entire rank
Use the actual deepElements D(c), kernel K(c)=kerWithExponents(c) in
locKisinPart, and point condition P=withExponents(raisedAtE 0).
The constants are the images of P intersect D(c) under projTrivLoc.
Fix j>=0 and the least jump u with c(j,u)<c'(j,u). Since c'_j is
antitone and all v<u already satisfy c(j,v)>=c'(j,v), we have
c(j,v)>c(j,u) for such v. This is precisely the strict leading-term
hypothesis of exists_comb_of_jumpMultiplicity_le, not a claim that
the original whole profile is strictly antitone. Write c+ for the
profile with just this entry raised by one, d=f*jumpMultiplicity(i',u),
and C=cost(j,c(j,u)). Work with the quotient of P intersect D(c) by
its intersection with (P intersect D(c+))+K(c). Its image surjects
onto the relative constants quotient (map/comap and strictness).
The singleton Reaches operator of cost C puts p^C times each class
in the denominator because its difference from p^C x belongs to K(c).
Thus the quotient is p^C-torsion.

For any d+1 representatives x_l of p-torsion classes, write
p x_l=x'_l+k_l with x'_l in P intersect D(c+) and k_l in K(c).
Strictness of the inclusion of the kernel lattice supplies actual
preimages of k_l with the c exponents. Apply the native leading-form
relation to these preimages. It returns Z_p coefficients b_l, one
equal to 1, such that their combination splits into the kernel
parts w and z with exponents c plus one at E, and c+, respectively.
The proof of that relation uses an Auerbach integral spanning family
of the leading forms followed by a Witt-coordinate relation with
unit coefficient; its dimension is f*jumpMultiplicity, not the
number of embeddings times a second f. Retain that integral leading
form lemma and exact frame.

Let t=sum b_l x_l. Mapping w,z into the actual kernel, one has
p t-w in D(c+) by the depth of x'_l and z. It is not yet legitimate
to divide this relation by p; this is the essential remaining
correction in the native proof.

## 2. Exact correction allowing division by p

Let E=phi^0 E, E_j=phi^j E. In the unramified chart all integers
strictly between c(0,v) and c(0,v)+p^j are prime to p; the native
Reaches operator A for these E-depth steps has total cost ZERO
(cost at (0,n) is v_p(n), and 0 is not in the open interval).
It preserves the constant projection and differs from identity
by K(c) on D(c). Applied to w (whose E-exponents are already one
higher), the depth upgrade and mem_withExponents_of_deep imply
w2=E^(-p^j) A(w) lies in K(c). This is exponent division in the
localized frame, not inversion of E in an integral ring.
Unramified E=z+p and E_j=z^(p^j)+p, so in the chart
E^(p^j)-E_j=p R for an integral scalar R (Frobenius mod p).
Define k=R*w2-(A(t)-t) in K(c). Then EXACTLY
  p(t-k)=A(p t-w)+E_j*w2.
The right side is in D(c+) (A preserves the deeper module,
and E_j*w2 has the one raised exponent) and its Galois differences
satisfy the same bounds. The filtration test is p-saturated:
p is nonzero of filtration degree 0 at every E_j. Consequently
t-k is in D(c+) and retains the point condition P. Therefore the
combination of the original p-torsion classes vanishes, with one
coefficient a unit. This yields dimension <=d for the p-torsion
submodule. The finite DVR structure theorem, or the finite
relation-length lemma in the source, yields colength <=C*d.
This correction is indispensable: simply canceling p in an
arbitrary quotient would be false.

Iterate the one-step inequality over the finite set of pairs
(u,n) with c(j,u)<=n<c'(j,u). Other exponents may weaken; use
relative lengths, not an unproved inclusion of the final modules.
If no step remains, monotonicity gives relative length zero.
Summing before bounding gives exactly
  sum_u f*mult(i',u) sum_{c(j,u)<=n<c'(j,u)} cost(j,n)
  <= A0*r(i')+B0*n(i')
under the native per-line cost A0+B0*1_low. This is the stated
relLength_deepConstants_le with no extra total rank factor.

## 3. Actual sign-dependent point and depth bound

Fix a>=0, eta>=1, W>=0, B=b(i), all native few-low-jump guards.
Use D=raisedAtE(2a+eta) as difference-depth profile.
For point profile raisedAtE(t) with -eta<=t<=0, the initial t=-eta
has all constants lifting: take s=0 in the unramified cokernel
p^s E^(a-s), then free E-depth steps (NoMultipleNear).
The native improvedExponent preserves positive old exponents and
gives min(new depth,0) on the others. Raising t to t+1 thus requires
new leading-form relations only at the weight u=t: at u<t the old
point exponent is positive, and at u>t the requested exponent is
nonpositive. The same p^a kills the quotient of constants, using
s=a for the point above p^a c and the free depth steps. The native
leading-coefficient relation supplies f*mult(i,t) as the dimension
bound, using mem_withExponents_of_deep for the other lines.
The length lost at this stage is at most
a*f*mult(i,t). Sum t=-eta,...,-1 for a*n(i) at t=0.
No positive low jumps are charged here.

If sign(i)=+1 this already suffices. If sign(i)=-1 set
  Q_i=p*ceil((B+W+2a)/p).
IMPORTANT: ceiling, not floor; the final point depth at E must
be allowed to weaken from Q_i to B+W+2a. First raise E-depth to
the constant Q_i, leaving other depths at -u. For low u the
interval starts at 2a+eta-u>=0, ends strictly before Q_i,
and Q_i<=B+W+2a+p-1<=(p-1)a+p-1.
The sum of valuations is at most v_p(Q_i!)<=Q_i/(p-1)<=a+1.
For far negative jumps, the interval from 2a+eta-u to Q_i
contains no multiple: its lower endpoint is >=B and the native
radius 6(a+eta+W) contains the interval from B to B+W+2a,
then the first possible multiple is Q_i, excluded. Thus this step
costs at most (a+1)n(i). Its antitone target is constant Q_i.
For the next depth step at phi E, the open interval (Q_i,Q_i+p)
has no p-multiple, exactly the hypothesis in section 1. Raise the
depth to W+1-u+2a*1_low at phi E and weaken the E-depth to
B+W+2a. The new phi E profile is antitone on the actual jump set:
low and far negative windows are separated by the full radius.
No nonzero multiple of p occurs on these phi E depth intervals
by the native gap guards at the predecessor letter. Each cost is
therefore <=3. The total cost is at most
3(W+1)r(i.stepBack 1)+6a*n(i.stepBack 1).
This supplies exactly the desired colength
  (2a+1)n(i)+3(W+1)r(i.stepBack 1)+6a*n(i.stepBack 1).

## 4. Common submodule and exact caller

Take V=intersection over all letters i of the preimage of the
sign-dependent deepConstants under constantAt(i). This is ONE
submodule chosen from the fixed second lattice, before any
opposite side T, pairing or c. The quotient embeds in the direct
sum of the quotients for individual letters, so length is bounded
by their sum. Since stepBack 1 is a permutation, sum BEFORE
bounding to obtain
  len(C/V) <= (8a+1) sum_i n(i)+3(W+1) sum_i r(i)
            <= 11 sum_i [(a+1)n(i)+(W+1)r(i)].
For each d in V the deep point exists at every letter, with
the actual point condition P. Apply the already reconstructed
cut-walk/cup-cochain lemma (peer 248ac90f) with every letter a cut,
l=1, predicate sign=+1, all scales zero. Opposite-side points use
the free no-multiple E-depth steps; the third side uses the same
unramified annihilator at s=0, t=a, its jump -u-v-1 and depth
raisedAtE(a). The source uses the explicit two sign safety
inequalities in the final proof of exists_scaledCupBounds_few_low_jumps;
retain those point/cut conditions. No loss proportional to the
number of possible opposite sides, because V precedes them.
Under the native letter partition of coefficient embeddings,
sum_i n(i)<=f*[O:Z_p]*mu and sum_i r(i)<=f*[O:Z_p]*rank_O L.
Divide the Z_p length by the residue degree of O, which is
length_Zp(O/p)/length_O(O/p), and normalize by length_O(O/p).
This yields the actual 11f(mu(a+1)+rank_O L(W+1)) normalized
defect in KummerChart.few_low_jumps. The sign zero cases use
scaledCupBounds_of_killsCokernel separately, as before.
The RUN55 scalar budget now consumes this colength, not a
hypothesized inequality about prime distributions.

The native leading-form integral spanning, strictness,
zero-cost depth operator and exact sign safety tests remain
retained suppliers and need independent audit. This note is
not a proof of those from scratch. Original graphs/axioms
unchanged; no global kernel node retired.

## Integration-ready condensed paragraph / peer handoff

For few low jumps, at a one-unit depth increase at (j,u) the
singleton operator kills the relative constants quotient by
p^cost. The leading-form relation with f*mult(i',u)+1 lifts
has a unit coefficient and splits the combined kernel error w
into the extra E-step and the raised profile. The ZERO-cost
operator A gives A(w)=E^(p^j)w2. Put
k=((E^(p^j)-E_j)/p)w2-(A(t)-t); then
p(t-k)=A(pt-w)+E_j*w2. Saturation of the actual E_j filtrations
proves a unit relation in the p-torsion quotient, so its length
is at most cost*f*mult. At the negative-sign letters use the
CEILING p*ceil((b+W+2a)/p) for the first E-depth, giving
(a+1) per low line and zero per far line, then raise phi E for
3(W+1)+6a*1_low. The initial point-threshold walk costs a per
negative low line. Intersect the resulting constants submodules
before choosing any paired lattice; permutation of letters
gives total 11 sum_i((a+1)n_i+(W+1)r_i). The same native cut
and normalized rank/length consumers give the RUN55 budget.
Merge alongside direct Tate index 77a7f2fc and tame descent
129d788f (both have their own retained foundational suppliers);
do not imply a full proof of C.

## Executed scalar checks
JS exact small-integer regression (not a representation or Kisin simulation):
function vp(n,p){n=Math.abs(n);let v=0;while(n&&n%p===0){v++;n/=p}return v}
function cost(p,j,lo,hi){let s=0;for(let n=lo;n<hi;n++)s+=vp(n,p)+3*j;return s}
let cases=0,low=0,far=0,corrections=0;
for(let p of [11,13,17,19,23,29,31,37,41,53,67,97])
for(let a=1;a<=12;a++)for(let eta=1;eta<=4;eta++)for(let W=0;W<=3;W++){
 let R=6*(a+eta+W);if(R>=p)continue;
 for(let B=R+1;B+W+eta<=(p-3)*a;B++){
 if(Math.ceil((B-R)/p)*p<=B+R)continue;
 let Q=Math.ceil((B+W+2*a)/p)*p;
 for(let u=-eta;u<=eta;u++){
 if(cost(p,0,2*a+eta-u,Q)>a+1||
 cost(p,1,-u,W+1-u+2*a)>3*(W+1)+6*a)throw Error("low");low++}
 for(let u=-B-W;u<=-B;u++){
 if(cost(p,0,2*a+eta-u,Q)!==0||
 cost(p,1,-u,W+1-u)>3*(W+1))throw Error("far");far++}
 cases++;}}
for(let p of [2n,3n,5n,7n])for(let j=0n;j<=2n;j++)
for(let z=-5n;z<=5n;z++)for(let w=-3n;w<=3n;w++)for(let t=-3n;t<=3n;t++){
 const E=z+p,Ea=z**(p**j)+p,F=E**(p**j);
 if((F-Ea)%p!==0n)throw Error("div");
 let r=(F-Ea)/p,A=t+2n,n=r*w-(A-t);
 if(p*(t-n)!==p*A-F*w+Ea*w)throw Error("cancel");corrections++}
console.log({cases,low,far,corrections})
Actual output: 3528 parameter cases, 15500 low and 5986 far
line checks, 6468 exact BigInt correction checks, zero failures
in final run. Earlier floor candidate rejected at p=41,a=2,
eta=1,W=0,B=60: floor multiple 41 < final target 64 and
the subsequent E-level change would not be a weakening.
This negative control explains the ceiling requirement.

## Verification boundary and RESUME HERE
Lean/lake absent in local container. Actual state branch retrieved:
targeted replay blob 23de197bd48f404ca2074c69676de289c4f7934e
all_requested_checks_ok=true (45799225653; old named checks only);
primitive replay blob 088cd2ec0e935ee1a282f10096949bcf671cc804
all_requested_checks_ok=false (45803534769; JetExponentBound
timeout 2700.11s, six named B/C probes passed). Neither checks
this new certificate; no new native PASS. Keep original/reduced
graphs and axiom evidence; source pin/context keys
(S,O,k,i,j,u,c,c',a,eta,W,B). No import of Main/RH.
RESUME HERE: audit exact sign safety inequalities at every-letter
cuts, then the sparse-thick and two-size cut choices and long-gap
coefficient extraction. Integrate peer tame and Tate-duality
derivations into main manuscript once, not duplicated.
HANDOFF TO integration, audit, mathematical/Galois, shared kernel
for native module checks of FewLowJumps and actual caller.
-/

namespace EditorFewLowRun56

theorem correction {R : Type*} [CommRing R]
    (p F E r A t w : R) (h : F - E = p*r) :
    p*(t-(r*w-(A-t))) = p*A-F*w+E*w := by
  linear_combination w*h

theorem aggregate_budget (a W n r : ℕ) :
    (2*a+1)*n+3*(W+1)*r+6*a*n ≤
      11*(n*(a+1)+r*(W+1)) := by
  nlinarith [Nat.zero_le (a*n), Nat.zero_le (W*r)]

end EditorFewLowRun56

#check Lift.KummerChart.PairingSide.relLength_deepConstants_le
#check Lift.KummerChart.PairingSide.exists_relLength_deepConstants_le
#check Lift.KummerChart.PairingSide.exists_scaledCupBounds_few_low_jumps
#check Lift.KummerChart.few_low_jumps
#print axioms Lift.KummerChart.PairingSide.relLength_deepConstants_le
#print axioms Lift.KummerChart.PairingSide.exists_scaledCupBounds_few_low_jumps
#print axioms Lift.KummerChart.few_low_jumps
