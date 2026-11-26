import New.Selmer.CrystallineBound

/-!
# RUN56 — actual sparse-thick / two-size cut profiles and long-gap transport
26 Nov 2026. Human source-matched derivation, not native verification.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (binding 26 Nov
compact primitive focus supersedes old window route), manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96. Read protocol, AGENTS,
handoff, expansion, continuity, current peer 1a7f9457f10c20e3c3308c7ce5027405ddf76cf2
(few low jumps), c423f7ffc801dd991c5a0c01e60be57401b04b4e
(tame caller), lead WIP a2eff659f493fee4a703d454d9a2450befde6fb4
(the cut-walk/cup-cochain already reconstructed). Do not repeat them.
Sources: New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395;
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141;
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79,
actual crystalline_defect_le invokes both scaledCupBounds_sparse_thick
and scaledCupBounds_two_sizes in its first two branches.

## 1. Sparse-thick nearest cuts: finite combinatorial proof
Use the actual letter permutation F and thick predicate T. A cut C(j)
means T(F^s j) is false for 1<=s<=J. The hypothesis excludes
T(j),T(F^s j),T(F^(s+t)j) simultaneously for 1<=s,t<=J.
All statements below hold on cycles including repeated letters.
If T(F^-a i) and not C(F^-a i), then C(F^-(a+J+1)i):
otherwise a thick point occurs at F^-(a+J+1-n)i, 1<=n<=J.
It is followed after J+1-n steps by the thick point F^-a i,
which itself has another thick successor at distance <=J, contradiction.

There is a positive cut within 2J+1 steps: either F^-(J+1)i
is a cut, or it has a thick successor F^-a i with 1<=a<=J.
If that successor is a cut we are done, otherwise the preceding
argument yields a cut at a+J+1<=2J+1. For J=0 all letters are cuts.
Let l be the least positive backward cut distance. Any thick point
F^-a i with 0<a<l is not a cut, so l<=a+J+1. Also l-a>J
because otherwise this thick point contradicts the cut at F^-l i.
Thus a+J+1=l. There is AT MOST ONE positive thick position
in the block 0<=a<l, plus a possible thick position at 0.
This is the exact combinatorial premise in the native caller H.
If thick signs agree, or only one thick point exists, select its
position t (arbitrary 0 if none); all thin positions obey G+V<=eta.
If two thick signs differ, take t=l-J-1>0. Every other thick position
is the opposite-sign point at zero, and all positions a>t are thin.
By hε the chart is then unramified with p>=7. The native s=0 gives
both s(F^-l i)=0 and s(i)=0. Rename the auxiliary G in the generic
cut lemma to G0=2W (not the original thin centre G). Since
G<=eta<=W, all thin β+W<=G0. With s0=floor(3b/5),
  s0+2W sum_{a=0}^J p^a < 3b/5+4Wp^J < b
by b>=11(p^J+1)W, W>=4eta>=4 and geometric sum <2p^J.
This proves the strict long-gap guard at the actual t, not at an
arbitrary thick letter. The original hW,hU,hG,hδ,h8 remain.
At cuts s=0 and the next J weights have centres <=G, hence the
short-window alternative of hK holds. For n=2W the generic
budget (J+1+d+log_p(2b))*2W+d*2W<=X follows from he.
The remaining scalar bounds hs,hy,hd follow from W<=b/22,
G<=W, p>=2. For hz when p>=5, b+W<=2floor(3b/5)
using b>=22W and W>=4. All original native size hypotheses retained.

## 2. Two-size nearest cuts and strict long-gap guard
Use original G>=5W, b>=G, p>=7, b<Kp², 2G<Kp, W<=K.
The native choices are J=1, n=K, q=floor(b/p),
s(i)=1_{T(Fi)} max(q-7K,0), cut(i) iff s(i)<β(i),
s0=q+12K, auxiliary G0=G+W, d=0 and chart e_ram=1.
A noncut must be thin followed by thick (s<b because q<=b/p).
It follows consecutive noncuts are impossible, and nearest
positive backward cut distance l<=2. If l=1 choose t=0
for the common-sign alternative. If l=2, F^-1 i is thin,
i is thick, and s(F^-2 i)=0. Select t=0. If the sign
condition fails at a=1, the sole intervening thin position
has the opposite sign, and β(F^-1 i)+W<=G0.
Since noncut implies q>=G+7K, b>=p(G+7K); q<Kp,
G<Kp/2. Consequently
 b - [q+12K+(G+W)(1+p)]
 > (9p/2-13)K > 0.
This is the exact strict guard s0+G0 sum_{a<=1}p^a<b.
The other generic hK alternative: if next letter thin then
s=0 and next β+W=G0. Otherwise at a cut s<β; if q<=7K
then s0<=19K, else s0-s=19K. With X=(log_p(2b)+2)K,
κ=24X+1, s0<=κ+s. These choices meet hX,hκ,hδ,h8:
2b<p²(2K)<=p²X, 8<=p². Also s+W<=pK,
G+W<=(p-1)K, β+s+W<=2b (q<=b/p,W<=b/5).
The hz guard follows from b<p(q+1),
 (p-3)(q+12K)-(b+W)>12K(p-3)-3q-p-W>0
using q<Kp,W<=K,p>=7,K>=1.
Finally 51κ<=10000K(log_p(2b)+1), and in sparse case
κ=12(J+1)X+1 gives 51κ<=10000X(J+1), X>=1.
These pay the actual native exponent without a ramification
factor in the unramified branch.

## 3. Long-gap coefficient transport: source-matched algebra
LongGap.pointsOver_nonempty_of_long_gap is called by
scaledCupBounds_of_cut_windows when the second alternative above
is selected. Keep chart unramified, l>0, hK at F^-l i, hz at i,
hg bounding intervening jumps by g, N=s+g sum_{a<l}p^a,
N<A, 3e_ram<=p^l, e_ram*A<=p^l δ.
Take y over c given by hz. With the source's unramified
E-coordinate, E_a=(E-p)^(p^a)+p (Frobenius fixes p).
Multiply y by the monic polynomial
 f(E)=E^s prod_{a<l} ((E-p)^(p^a)+p)^g.
It has degree N exactly and attains the standard level-l bounds
after weakening by the intervening jump upper bounds.
The native frame theorem at (l,A,δ) supplies a finite expression
 p^(4δ) f(E)y = sum_j r_j v_j
where the letter-projected v_j lie in constantsModE(l,A,i).
This is a retained integral frame premise; it is NOT ordinary
rational vector-space spanning.

Use the actual coordinate splitting r=w(r)+E t(r).
The coefficient extraction of order N is w(t^N(r)).
For a relation sum r_j v_j - F(E)c in shiftedStd(l,o), o<=A,
the coefficient relation is in constantsModE and in shiftedStd
with profile A when o(u)>N, 0 otherwise. At order zero subtract
the E-divisible terms; use the native filtration improvement for
points invariant modulo shiftedStd(l,A) to strengthen a positive
one-step bound to A. Subtract the constant coefficient relation
and divide the remaining relation by E (localized normalized
E-unit). This reduces the profile o to o-1, so iteration proves
the threshold o(u)>N. This is the actual structure of
JumpLattice.coeff_mem_constantsModE; the filtration improvement,
E-division and stability of w(r) are retained native suppliers.

Apply coefficient extraction both to the frame relation with
zero comparison constant and to its projection using the monic
polynomial p^(4δ)f. Let B=sum w(t^N(r_j))v_j. The difference
πB-p^(4δ)c_i has depth A because N<A. Use the Frobenius-translated
lift ideal hK, after division of that difference by E^A, to lift
p^κ times the difference, then restore E^A. Subtract that
correction from p^κ B. Projection is exactly p^(κ+4δ)c_i.
The profile of B is at least min(A,-u-N) at E, since
-u-N>0 implies g-u>N, and the correction has depth A.
Other indices retain stdExponent(l). The native Galois differences
have profile A at E; thus the constructed point has the precise
shiftedStd(l,min(A,-u-N)) and shiftedStd(l,A) contracts.
No inference of an integral lift from a rational lift.

## 4. Aggregate payment and remaining obligations
The common cut construction uses the same two sides and third
side as LongGap.scaledCupBounds_of_points_at_cuts. Its actual
depth-cost set is indexed by a<4J+2, with twoWindows at each a.
Retain native sum_twoWindows_le <=72X per index and the window
coverage proof. The long gap pays κ+4X, ordinary branch κ.
Aggregate before allocating:
 κ+4X+72X(4J+2)=κ+(288J+148)X<25κ
because 12(J+1)X<κ. Thus the two sides cost 25κ each,
third side κ, giving 51κ<=e, with no rank or letter-count factor.
This matches actual generic cut caller. It does not prove the
remaining profile inequalities in HasDeepPoint or the ramified
lift-ideal recursion in killsCokernel_at_cut; retain both.
Original graph: crystalline_defect_le -> sparse_thick/two_sizes
-> cut_windows -> killsCokernel_at_cut, long_gap, points_at_cuts.
Reduced human graph: explicit cut and guard proofs above plus
retained frame/ideal/filtration/profile suppliers -> same consumer.
No native nodes retired, no RH import, no invented axioms.
Context cache key includes chart,p,J,T,ε,W,G,b,K,i,side,depth
and actual opposite-side pairing, not lemma name alone.

## 5. External provenance
Iovita–Marmora 2015, doi:10.4171/RSMUP/134-6, publisher abstract
https://ems.press/journals/rsmup/articles/13465: small crystalline
weights 0..r<=p-2 and e(r-1)<=p-1; not the large two-window claim.
Gao–Liu https://arxiv.org/abs/2411.11084 (2024 and revised title):
graded integral Hodge filtration vanishing/torsion, not an
automatic supplier of the native cut-window cup statement.
Čoupek–Gazaki–Marmora https://arxiv.org/abs/2603.26035 (2026):
exactness of Breuil–Kisin extension sequences, not the explicit
rank-free two-size exponent. Abstract-level audit only; no
assertion that full articles cannot imply further results.
All three are related literature, not native axioms or replacements.
REFERENCES.md bc5207de20acf124d1f70c078a5157be639089b1
explicitly distinguishes confirmed, second-hand and unconfirmed
citations. The native cut and long-gap declarations have actual
proof bodies; our human reduction retains foundational premises.

## 6. Executed regression (JS, exact small safe integers)
let patterns=0,blocks=0,long=0,twoblocks=0,twolong=0,scalar=0;
for(let n=1;n<=11;n++)for(let J=0;J<=5;J++)for(let mask=0;mask<2**n;mask++){
 const T=i=>!!(mask&(1<<((i%n+n)%n)));
 let ok=true;for(let i=0;i<n;i++)for(let s=1;s<=J;s++)for(let t=1;t<=J;t++)
 if(T(i)&&T(i+s)&&T(i+s+t))ok=false;
 if(!ok)continue;patterns++;
 const C=i=>Array.from({length:J},(_,t)=>!T(i+t+1)).every(Boolean);
 for(let i=0;i<n;i++){let l=1;while(l<=2*J+1&&!C(i-l))l++;
 if(l>2*J+1)throw Error("cut");
 const a=Array.from({length:l},(_,a)=>a).filter(a=>T(i-a));
 for(let t of a)if(t>0&&t+J+1!==l)throw Error("positive thick");
 blocks++;if(a.length===2)long++;}}
for(let n=1;n<=10;n++)for(let mask=0;mask<2**n;mask++){
 const T=i=>!!(mask&(1<<((i%n+n)%n))),C=j=>T(j)||!T(j+1);
 for(let i=0;i<n;i++){let l=1;while(l<=3&&!C(i-l))l++;
 if(l>2)throw Error("two-size cut");
 if(l===2){if(!T(i)||T(i-1)||!C(i-2))throw Error("two-size profile");twolong++;}
 twoblocks++;}}
for(let p of [7,11,13,17,19,23])for(let K=1;K<=10;K++)
for(let W=1;W<=K;W++)for(let G=5*W;2*G<K*p;G++)
for(let b=G;b<K*p*p;b+=Math.max(1,Math.floor(K*p*p/50))){
 let q=Math.floor(b/p),s=Math.max(q-7*K,0),s0=q+12*K;
 if(s+W>p*K||G+W>(p-1)*K||b+s+W>2*b||b+W>(p-3)*s0)
 throw Error("scalar");
 if(s>=G&&s0+(G+W)*(1+p)>=b)throw Error("long gap");scalar++;}
console.log({patterns,blocks,long,twoblocks,twolong,scalar});
Actual: 7508 valid sparse cyclic patterns, 73898 blocks, 3065
two-thick blocks; 18434 worst-case two-size blocks, 4608 length-two;
550039 sampled scalar cases; zero failures. These are combinatorial
and arithmetic checks, not Kisin simulations or proof of all profiles.

Actual native CI output re-read: run 45803534769, state branch
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804,
status a56e2d3afb99ed8275e81fd63c8494306e57c43f:
six named B/C checks only standard axioms; module_1 build
returncode 124, 2700.11 s, all_requested_checks_ok=false.
No new native replay of this candidate. Prepared scalar proof
and actual theorem probes below; no shortcut to Main, no
cross-pin old rh_auto/prune invocation or competing workflow.
RESUME HERE: integrate explicit cut combinatorics and strict
guards into C, then verify HasDeepPoint inequalities with the
actual two profiles R and o, plus killsCokernel_at_cut recursion.
Audit the exact frame and coefficient threshold at LongGap,
and use shared compact runner for named checks. Preserve all
original dependencies and axiom evidence. No full C/RH claim.
HANDOFF TO integration/editor, C mathematics, formal audit,
kernel extractor.
-/

namespace LiteratureSparseCutRun56

theorem aggregate_payment (J X k : ℕ) (h : 12*(J+1)*X < k) :
    k+4*X+72*X*(4*J+2) ≤ 25*k := by
  nlinarith [Nat.zero_le X]

theorem two_size_gap (p K G W q b : ℕ)
    (hp : 7 ≤ p) (hk : 0 < K) (hw : W ≤ K)
    (hg : 2*G < K*p) (hq : q < K*p)
    (hb : p*(G+7*K) ≤ b) :
    q+12*K+(G+W)*(1+p) < b := by
  nlinarith [Nat.mul_le_mul_left p hw, Nat.mul_le_mul_right K hp]

end LiteratureSparseCutRun56

#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_sparse_thick
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_two_sizes
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_of_cut_windows
#check Lift.KummerChart.PairingSide.killsCokernel_at_cut
#check Lift.KummerChart.PairingSide.pointsOver_nonempty_of_long_gap
#check Lift.KummerChart.JumpLattice.coeff_mem_constantsModE
#check crystalline_defect_le
#print axioms Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_sparse_thick
#print axioms Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_two_sizes
#print axioms Lift.KummerChart.PairingSide.pointsOver_nonempty_of_long_gap
#print axioms LiteratureSparseCutRun56.aggregate_payment
#print axioms LiteratureSparseCutRun56.two_size_gap
