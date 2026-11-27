import New.Selmer.OnePlaceDefect

/-!
# RUN67 — 27 November 2026: local safety, exact window and few-low-jump caller
Status: human source-matched derivation of the indicated caller bridges; no new
native replay. Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(main rechecked unchanged), Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion-first.
Latest manuscript blob 944957c6f43b63df7a845472b31492dc0ca1cb8f; peer head
2422c248b80164502f9e86f0966e1552adc9900c. Prior integration few-low-jump
length appendix blob edfab553210747d7d7099b39a986197c8e9795cf proves the
inner colength argument; this run addresses its actual OUTER hypotheses
and local budget, not a duplicate of that construction.

Actual bodies retrieved, relative to grh-compact/src:
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a
  block_defect_le_at_place;
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79
  crystalline_defect_le;
New/Selmer/ThickSpacing.lean 66fcffeac3f881a562db9163cd66a207e15bdf19
  placeClass_ratio, not_thick_of_short_arc, cmSign_eq_of_thick;
New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df
  IsRowType, lambdaLoss, loss;
New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650
  normLength_defect_le;
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc
  tame_types_exponent, KummerChart.few_low_jumps;
New/Lift/FewLowJumps.lean a86b9c32285a38ddc23f0debec7484c93e21e229;
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41;
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e.

## 1. Exact opposite windows and actual row dual multiplicities
Write H=D.h₂, T=D.t, k0=D.k, b=D.b₁, G=D.b₂, Q=k0*T,
eta=H²+1, W=4T. For the index i<=D.m provided by IsRowType put
delta=i*D.h+H-2T (a natural number; H>=3T). At embedding sigma
let B=b or G according to thick membership, and let e=cmSign sigma.
Then the native row center is B+i*D.h+H = B+delta+2T.
The jump condition for a high row jump u reads |e*u+w_i|<=T.
Equivalently -e*u lies in [B+delta+T,B+delta+3T].
The dual jump is exactly -u-1, not -u. Thus e*(-u-1) differs
from -e*u by -e, of absolute value 1. Since T>=1 it lies in
[B+delta,B+delta+4T]. Low original jumps have |u|<=H², hence
|-u-1|<=eta. Original string jumps c∈[0,t) also lie in the small
window; their duals -c-1 lie in [-eta,0]. The support hypothesis
on U makes every member an actual jump of at least one block,
and the native HasJumps equalities transfer this calculation to U.
For U' use actual dual support, not arbitrary enlarged windows.
This proves W(g) at block_defect_le_at_place, retaining the actual
coefficient embedding representative and jump-support premises.

For the row block every negative jump in U or its actual dual
support has 2u<=-H: for a negative original low jump this is
IsRowType.low_or_high; for a negative dual low jump use the positive
original u and the extra -1. High jumps have size at least H/2 by
the weight formula and H>=3T. Strings in U are nonnegative.
If a dual row jump lies in [-eta,eta], the original jump has
|u|<=H²+2<=2H² (H>=2). The multiplicity of these jumps is therefore
at most the native countP bound r*D.m/k0, rounded DOWN as in
mu=floor(rank(L_c)*D.m/(k0*x)), with x=1 for the row.
For a string dual the second disjunct U'⊆[-eta,0] holds, regardless
of mu. This proves the exact disjunction c at crystalline_defect_le.
No artificial low jumps from the auxiliary trivial quotient are counted.

## 2. Tame branch: split prime and exact exponent payment
If ell=D.g(n), its congruence 1 modulo N₁*d makes its action on
all conductor roots trivial: ell is prime to the conductor, and
the action is a power of ell on those roots. The native
fixes_emb_of_fixes_rootsOfUnity gives that every local Galois element
fixes the chosen embedding of E. IsCompletionGroup then gives
surjectivity of j and a single complex embedding for all coefficients.
Consequently the same B and sign e work for both windows above,
as required by tame_types_exponent (not a varying sign).
The actual premise IsTameType for all inertia elements is retained.

Put R=D.r, N=(R+T)*R, kap=R²(N+1)² and
s0=3*kap+150*(eta+W+1).
The native scale bounds give both
  b+delta+6(eta+W)+kap+2 < ell,
  2*s0*T*k0 <= b.
For clarity these follow without a new asymptotic assumption:
R<=3 exp(5 logX), H=R^8, T=5R, k0<=R, i<=D.m,
D.m<=2 exp(logX/2), delta<=2iH+H,
b<=exp(logB+2), b>=exp(logB-2),
ell>=exp(10 logB), logB>=10^12 logX, logX>=100.
The polynomial 2*s0*T*k0 is bounded by 10^5 R^18 for R>=2:
N=6R², kap<=49R^6, eta=R^16+1, W=20R,
s0<=1000 R^16, so 2*s0*T*k0<=10000 R^18.
The additive polynomial delta+6(eta+W)+kap+2 is also bounded
by exp(100 logX) using the displayed data bounds.
The actual native HasLogBound hypotheses imply b dominates these
polynomials and ell dominates their sum with b; G<=b follows
from the native log bounds. No dependence on the coefficient-ring
ramification index is introduced.

The exponent theorem gives ell^s0 Z_f inside cupOrthogonal.
Use normLength_defect_le with the rank of the SAME dual lattice.
As ell divides gProd, v_ell(gProd)>=1 and 1<=x<=T. Thus
  2*s0*x <= b/k0 <= 10^6*(D.m/k0)*b*v_ell(gProd).
After dividing by x and multiplying by the rank, this is at
most rank*loss(D,ell)/x, including the nonnegative lambdaLoss
term. The original local index multiplier is unchanged.
This proves the tame caller's payment, conditional only on
the actual tame exponent supplier and its retained type hypotheses.

## 3. Short-arc exclusion (ell<=Q): exact elementary argument
Use placeClass_ratio with the actual exponent a removing the
ell-primary part of the conductor. At every modulus dividing
N₁ and coprime to ell^a, the ratio of two thick places linked
by an ell^j-power Frobenius action is ±ell^j. This follows
from the native cmSign_spec and phi_mul identity: apply the
embedding and Galois action to the identity for the quotient
place, take the ell^a-th powers, then cancel the primitive
root using its exact order. Coprimality cancels ell^a in the
resulting congruence. The sign disappears on SQUARING; do not
assume equal signs for this step.

Suppose there are three thick embeddings, with final one g',
intermediate g1 and initial g, and relative powers ell^i,
ell^n, 0<i<n<=27s. For odd ell, work modulo 2^s (divides N₁).
The two squared ratios are ell^(2i), ell^(2n).
Their respective n-th and i-th powers agree exactly. Apply
Data.three_term at exponents 2i,2n<=54s<=324s to these
squared ratios, i.e. use the original ratios raised to 2n,2i.
It implies the intermediate ratio itself is 1 modulo 2^s,
hence ell^(2i)=1 there. Even if one only concludes its square
is 1, the same contradiction follows.
For odd ell, v₂(ell^(2i)-1)=v₂(ell²-1)+v₂(i):
odd-power geometric sums are odd, and each squaring of a
number ≡1 mod 8 increases the valuation of its difference
from 1 by one. One of ell-1,ell+1 has valuation exactly one.
Therefore
  2^s <= 2^(v₂(ell²-1)+v₂(i)) <= 2*(ell+1)*i.
But ell<=Q<=5R², i<=27s, so RHS<=54s*(5R²+1)<2^s.
The final strict bound follows from R<=3 exp(5 logX),
2^s=D.m^22>=exp(11 logX), and
s=22 log₂(D.m)<=22*(1+logX), using log 2>1/2.
For L=logX>=100, 54648*(1+L)<exp L (e.g. the fifth
Taylor term at 100 and monotonicity of exp L/(1+L)).
This supplies the native size comparison without estimating
ell^(2i) directly.

For ell=2 instead work modulo M3=3^(floor(log_3 s)+5),
which divides N₁ and is prime to 2. All thick classes are -1
mod M3 by Data.thick_eq_neg_one_mod, so their ratio is 1.
The squared relative power yields 4^i=1 mod M3.
By the elementary identity v₃(4^i-1)=1+v₃(i)
(cubing adds one valuation by binomial expansion; prime-to-3
powers preserve it), i>=3^(floor(log_3 s)+4)>27s,
contradiction. This treats the exceptional prime separately.

For the actual hT caller at OnePlaceDefect, let the three
coefficient-root letters be z,z^(ell^a),z^(ell^(a+b)),
where a,b∈[1,log_ell(H³)]. Choose thick representatives via
the existential definition of T. The native C relates powers
of their primitive letter root to the mod-(ell^f-1) cyclotomic
character. The Kummer chart Frobenius A then transports the
same relative exponents to the conductor root with the
ell-primary part removed: retain hy, hj.2 and the exact
ordProj/pow_sub_one_mul identity used in the source.
This is a statement about the SAME chosen chart, not a claim
that any two equal residue values determine a global
embedding. In the native call the relative exponents are
i=b,n=a+b; n<=2 log_ell(H³)<=24s<27s because
H³=R^24<=3^24 exp(120 logX)<=2^(12s).
The preceding contradiction gives hT. The separate
cmSign_eq_of_thick and chart-lift/same-letter sign
identifications are retained suppliers, not inferred from
the short-arc exclusion. The small-prime sparse-thick cup
bound itself remains a distinct quantitative theorem.

## 4. Large-prime, small-valuation branch: exact no-multiple guard
Work now in the general hypotheses of crystalline_defect_le.
Use h for its H, v=lambdaLoss(h,b,ell),
K=floor(2v/Q), and A=2(v+1) (the parameter a in few_low_jumps).
The valuation contains v_ell((2b)!), so v>=floor(2b/ell)
and consequently ell(v+1)>2b. In the branch v<h³,
v+1<=h³, whence ell>2b/h³>=198G by the native hb.
We only need ell>=9G. The branch ell>Q supplies the
unramified chart with ell>=7; its few_low_jumps lower
prime bound 5 is automatic.
The hypotheses hQ,hG,hb,hη,hδ imply h>=99,
G>=99h³, b>=G, eta+W<=h³/99, delta<eta.
Put R0=6(A+eta+W). Then
  R0+delta < 30h³,   R0 < G,
  b_i+eta+W <= (ell-3)A,  b_i>R0,
where b_i is b+delta or G+delta.
Indeed ell*A>4b, 3A<=6h³, and the slack from G>=99h³
and b>=G absorbs eta+W+delta and 6h³.
Also eta>=1 since delta<eta in naturals.

No NONZERO multiple y of ell can lie within R0 of 0
or ±(G+delta): its absolute value is less than 9G<=ell.
If it is within R0 of ±(b+delta), its absolute value lies
strictly between b-30h³ and b+30h³; it is positive and
belongs to the precise Ioc product in lambdaLoss.
Then ell divides that product, so v>=h³ because it is
raised to the h³ power. This contradicts v<h³.
Thus NoMultipleNear holds at every letter with the actual
radius, including the thin case and truncated left endpoint.
No inference that ell is prime to b itself is needed.
This is the exact guard at the native few_low_jumps call.

## 5. Few-low-jump zero branch, colength, and global loss payment
If the actual dual is a negative string, the second zero
condition of few_low_jumps holds. Otherwise use the row
negative-jump gap from section 1. If v<floor(h/5), then
  2A=4(v+1)<=4 floor(h/5)<h.
Every negative u in the row's two supports with 2u<=-h
satisfies u<-A, so it is outside Ico(-A,0).
The strict inequality is essential: u=-A would not be excluded.
Thus in this subcase the local defect is exactly zero.
In the remaining row subcase v>=floor(h/5) and its actual
low count is at most mu. Here v>=1 and A+1=2v+3<=5v.
Moreover hQ implies 99*(W+1)*Q<=h<=5v+4, hence
(W+1)*Q<=2v and W+1<=K (integer floor). Since m>=1,
the inner few_low_jumps theorem and normalization by
length_O(O/ell) give
  normLength <= 11*f0*[mu*(A+1)+rank*(W+1)]
             <= 10^5*f0*[rank*K*m+mu*v].
The unramified chart has e=1, so f0 equals the actual local
index e*f0; no extra coefficient ramification index appears.
The same constant pays the other two branches once their
scaled cup exponents are supplied: if H0<=4b then
log_ell H0 < m (use log ell>=log 2>1/2 and hm);
normLength_defect_le with exponent 10^4*K*x0, x0<=m,
costs at most 2*10^4*rank*K*m times the local index.
Keep the sparse-thick and two-size exponent constructions
and their numerical hypotheses as separate obligations.

At block_defect_le_at_place, Q=k0*T,
mu=floor(rank*D.m/(k0*x)), 1<=x<=T. Natural divisions
only decrease the nonnegative quantities, so for v>=0
  rank*K*D.m + mu*v
    <= 2*rank*D.m*v/(k0*T)+rank*D.m*v/(k0*x)
    <= 3*rank*D.m*v/(k0*x).
Thus 10^5 times this is <= rank*loss(D,ell)/x,
since loss=10^6*(D.m/k0)*(b*v_ell(gProd)+v).
This is the actual normalized loss (NNReal division here,
natural division in mu and K). Combined with the tame
payment and RUN66 aggregate, no extra factor of r, e,
or the number of letters is needed.

## Audit and remaining obligations
Original source-visible chain:
ribet_columns -> sum_blockLoss_le -> block_defect_le_at_place ->
  tame_types_exponent OR crystalline_defect_le ->
  scaledCupBounds_sparse_thick / scaledCupBounds_two_sizes /
  few_low_jumps.
The new human bridges supply W, row gap/multiplicity disjunction,
tame exponent payment, thick-spacing hT, no-multiple guard,
few-low zero and length payment. Keep the actual Kummer chart,
sign identifications, source Frobenius transport, class transfer,
and both general sparse/two-size quantitative cut arguments.
The original/reduced native graph, root and axiom evidence
are unchanged; no global dependency deletion claimed. Context
key includes compact pin, Data, place, ell, chart, same family,
sign, rank and actual modulus; no cross-context substitution.
External provenance: the published background listed in
ExponentTheorems is explicitly RELATED work, not an exact
uniform quantitative theorem. Do not treat Iovita–Marmora,
Nekovar or generic Breuil–Kisin continuity as supplying
the tame or sparse constants. The elementary valuation
identities above are proved by geometric sums/binomial
expansion; no new external conjectural assumption. The
three-term property is an actual Data hypothesis with its
own DataExist construction, not an asserted axiom.

Execution: command -v lean/lake and elan toolchain check empty.
No local native engine, no rh_scan/prune/reduce/auto/frontier
run; old-pin engines do not certify compact work.
Independent existing native output reread:
cathedral-research-state/compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769: six named B/C checks with standard three
axioms, A module timeout 124, all_requested_checks_ok=false,
full_RH_replay=false. No fresh PASS, no synthetic tests.
Below prepared actual source probes and independent scalar
certificates; not a native proof of the whole caller.

RESUME HERE: audit scaledCupBounds_sparse_thick and
scaledCupBounds_two_sizes at the actual CrystallineBound
calls, especially D=2(b+delta)<h²K for ell<=Q, the
different-exponent bound and the exact cut budgets.
In parallel audit cmSign_eq_of_thick and the Kummer
Frobenius transport hT, rather than restating the above
elementary short-arc argument. Integrate the actual
few-low-jump zero/length branch with the existing inner
colength appendix and RUN66 local index. HANDOFF TO
integration, editor, formal audit, Galois and native runner.
Human RH reconstruction remains incomplete.
-/

#check block_defect_le_at_place
#check crystalline_defect_le
#check not_thick_of_short_arc
#check cmSign_eq_of_thick
#check Lift.KummerChart.few_low_jumps
#check Lift.tame_types_exponent
#print axioms block_defect_le_at_place
#print axioms crystalline_defect_le
#print axioms not_thick_of_short_arc

namespace RHRun67
theorem no_negative_boundary (h v : ℕ) (hv : v < h / 5) :
    2 * (2 * (v+1)) < h := by omega

theorem no_multiple_radius (H v η W δ : ℕ) (hv : v < H)
    (hη : 99 * (η+W) ≤ H) (hδ : δ < η) :
    6 * (2*(v+1)+η+W)+δ < 30*H := by omega

theorem floor_width (h v q W : ℕ) (hq : 0 < q)
    (hW : 99*((W+1)*q) ≤ h) (hv : h/5 ≤ v) :
    (W+1)*q ≤ 2*v := by omega

theorem few_low_payment (v μ R K W m : ℕ) (hv : 1 ≤ v)
    (hW : W+1 ≤ K) (hm : 1 ≤ m) :
    11*(μ*(2*(v+1)+1)+R*(W+1)) ≤
      100000*(R*(K*m)+μ*v) := by
  have h1 : 11*(μ*(2*(v+1)+1)) ≤ 55*(μ*v) := calc
    _ ≤ 11*(μ*(5*v)) := Nat.mul_le_mul_left _ (Nat.mul_le_mul_left _ (by omega))
    _ = _ := by ring
  have hk : W+1 ≤ K*m := hW.trans (by simpa using Nat.mul_le_mul_left K hm)
  have h2 : 11*(R*(W+1)) ≤ 11*(R*(K*m)) :=
    Nat.mul_le_mul_left _ (Nat.mul_le_mul_left _ hk)
  rw [Nat.mul_add, Nat.mul_add]
  omega
end RHRun67
#print axioms RHRun67.no_negative_boundary
#print axioms RHRun67.no_multiple_radius
#print axioms RHRun67.floor_width
#print axioms RHRun67.few_low_payment
