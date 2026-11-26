import New.Selmer.RibetElement

/-!
# RUN55 — classical local duality replaces the Sylow/twist descent in the human proof
26 November 2026. Human source-matched derivation; finite scalar regressions executed;
native certificate PREPARED, not run. No additional conjecture; not an RH proof.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb and mandatory pipeline,
HUMAN_PROOF_COMPACT.md 957e9d109bd96476c701a00e872e7a0e0f853aa1, AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES and latest peer audit
6880d1d11d4e9cdd3dc408b021eb092a1c98da9c; peer diagonal integrality
7cc78b2f, triangle guard fce4be62, Schur jets 36a56d6c are separate work.
Resume RUN54; no URT or physics.

## 1. Direct classical replacement at actual caller
Lib/ClassField/LocalDuality/CrystallineDuality.lean
85cabaf4fb3b68704ccdc040c34a6b4339ca9cc1:
IsPotCrys.relIndex_dvd_of_orthogonal, IsPotCrys.index_mul_index_dual,
exists_perfect_pairing (all actual proved bodies, not axioms).
Lib/PadicHodge/BlochKato/BlochKato.lean
473db3c6fdc1933e64363113b083af69340b648b: crysCocycles.finrank_eq.
Lib/ClassField/GaloisCohomology/ContinuousCocycles.lean
33dba453396486fbf1735d7962ff62afd0660e8f: Z1 continuous, B2 has a
continuous primitive. Lib/ClassField/Places/GaloisDefs.lean
77fa4e8f3a4003d0312fa38c73a56197367a2153: unitsRep uses DISCRETE
algebraic units. Thus the native cup-coboundary assumption really is
zero in continuous H²(G,Kbar^×), not merely in abstract or analytic
cohomology. No Hilbert 90 comparison is needed.

Retain the native open embedding, so Γ is isomorphic to G_K of a finite
extension K/Q_l, n=[K:Q_l]=index. Fix both potentially crystalline lattices
L,L' with the SAME perfect Z_l-linear equivariant pairing into Z_l(1),
m>=0, and q:L->V surjective with kernel l^m L. By the pairing and
reduction, V'=L'/l^mL' is the Cartier dual Hom(V,mu_(l^m)), equivariantly;
both have order N=l^(m*d), d=rank_Z_l L. This follows by identifying
b modulo l^m with the perfect pairing to Z/l^m(1), using the actual
root identification. The native r:L'->V.cartierDual has exactly this kernel.

Set C=Z1(Γ,V), C'=Z1(Γ,V'), D=B1(Γ,V), D'=B1(Γ,V').
Let A and A' be the reductions of Z_f(L) and Z_f(L') in C and C'.
All finite coboundaries lift to integral coboundaries: D⊆A, D'⊆A'
because L->V and L'->V' are onto and a coboundary in the lattice
is crystalline. Continuity follows from the actual native hZ and
crystalline reduction lemma, not from arbitrary set membership.
The native rank formula and saturation give
    |A||A'| = N^(n+2).                                          (1)
Indeed Z_f(L) is finite free of rank d+n*j, Z_f(L') rank d+n*(d-j),
using the exact dual jump u -> -u-1 (each integral jump is negative
on exactly one side). The reduction kernels are l^m Z_f, by saturation:
a Bcris coboundary for l^m c divides by l^m in Bcris; the integral
function c is retained. This is the native index_mul_index_dual,
not an assumption of mod-l Bloch–Kato perfectness.

External supplier Milne, Arithmetic Duality Theorems, 2nd ed. 2006,
I Cor 2.3 (p28) and Thm 2.8 (p31), verified against page images:
https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf
(PDF pp36,39 in 1-based numbering). Finite V is admissible since K has
characteristic zero, including l=2. Perfect H¹ pairing and H²/H⁰
duality give |H²(V)|=|H⁰(V')|. Euler characteristic gives
|H¹(V)|=N^n |H⁰(V)| |H⁰(V')|. Since
|D|=N/|H⁰(V)| and |D'|=N/|H⁰(V')|, exact cancellation BEFORE estimates:
    |C| |D'| = N^(n+2) = |A||A'|.                              (2)
No assumption about a crystalline annihilator being exact is made.

Let H be the native subgroup of functions and T the image of
H∩Z_f(L') under reduction. T⊆A', although H need not consist of cocycles.
The given hH says A+S⊆Ann(T) in C. Tate's perfect H¹ pairing yields
    |Ann(T)| = |C| |D'| / |T+D'|.
Use (2) and D'⊆A':
    [Ann(T):A] = [A':T+D'].                                    (3)
Consequently [S:S∩A]=[S+A:A] divides the left side of (3), which
divides [A':T], which divides [Z_f(L'):H∩Z_f(L')].
The last assertion follows from surjective reduction and the
preimage of T containing H∩Z_f(L'); the quotient map proves
divisibility when index finite. If index infinite native Nat index
is zero and divisibility is automatic. This proves exactly
IsPotCrys.relIndex_dvd_of_orthogonal, same hZ,hH, no extra twist,
no Sylow descent or finite representation ramification estimate.
A⊆Ann(T) comes from hH, not an asserted perfect local condition.
m=0 works with N=1. Keep actual orientation A.relIndex S.

For the rank input see Bellaiche, An Introduction to the Conjecture
of Bloch and Kato, Prop 2.8, pp24–25 (page images verified):
https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKintro.pdf
Potentially crystalline implies de Rham; dim H_f¹ equals dim t_V+dim H⁰.
Adding rank B¹=d-dim H⁰ gives the cocycle rank. The exact integral
finite-generation and saturation used above also have native bodies;
do not infer them from the literature dimension theorem alone.
No conjectural statement from those notes is invoked.

Caller: New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444
relLength_obeyingCocycles_le uses exactly this index inequality, with
perfect scalar form from exists_perfect_pairing, and graph-lift/continuity
from peer 6880d1d1. New/Selmer/RibetElement.lean
188eeb68d437bfa58bcc30042d4eee66c2111e18 sum_blockLoss_le then uses
OnePlaceDefect. This replaces only the human local-duality proof.
Old native graph remains intact; no global edge-retirement claim.
Reduced human graph: exact cocycle rank + finite Tate duality/Euler +
native hH -> (3) -> local index -> RowBalanced -> sum_blockLoss_le.
No RH import.

## 2. Few-low-jumps branch at the actual crystalline defect caller
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79,
New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650,
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc,
New/Lift/FewLowJumps.lean a86b9c32285a38ddc23f0debec7484c93e21e229.
Let v=lambdaLoss(h,b,l), K=floor(2v/Q), a=2(v+1), and assume the
native third branch l>Q, v<h³, unramified chart, l>=7. All hQ,hG,hb,hη,
hδ hypotheses as in crystalline_defect_le; h>=99, eta+W<=h³/99,
G>=99h³, b>=99(Gh³+G), δ<η. From lambdaLoss's factorial
factor, floor(2b/l)<=v and so 2b<l(v+1). In particular l>2b/h³>=198G.
The gap radius R=6(a+η+W) is <13h³, and δ+R<14h³. Thus both
centres b+δ and G+δ exceed R. For each centre c,
c+W+η<=b+δ+W+η<b+2h³<4b-6h³<(l-3)a
(the last follows from 2b<l(v+1), v+1<=h³).
For the thin centre all nonzero integers in the three windows at
0 and ±(G+δ) have absolute value < l, so l cannot divide them.
For the thick centre any nonzero multiple of l in either distant
window has absolute value in (b-30h³,b+30h³]. But lambdaLoss includes
the h³-th power of that positive interval product, so v>=h³,
a contradiction. The near-zero window has radius <l too.
These are exactly the size/gap inputs of KummerChart.few_low_jumps
(NoMultipleNear includes both signs); no heuristic prime spacing.
The lemma still requires native hV, hL, chart and sign assumptions.
If v<floor(h/5), then 2a=4(v+1)<h, hence negatives satisfying
2u<=-h cannot lie in [-a,0). If the alternative U'⊆[-η,0] holds,
the same zero-defect conclusion is available directly. This proves
the caller's zero branch conditional on the actual few_low_jumps
lemma, not on an invented vanishing theorem.

For the other low-jump case v>=floor(h/5), h>=99 implies v>=1;
2v>=2floor(h/5)>=h/99 >=(W+1)Q, so W+1<=K.
Also a+1=2v+3<=6v. Since m>=1 and chart e=1, f=index, the native
11 f (μ(a+1)+rank L*(W+1)) norm-length allowance is bounded by
index*10^5(rank L*K*m+μ*v), with length(O/l) normalization cancelling.
The exponent branches use 2*10^4 rank L*K*x <=10^5(rank L*K*m+μ*v)
for x<=m, retaining rank and field-index factors. These scalar
arguments are rigorous but do not establish sparse-thick, two-size
or few-low-jumps Kisin cokernel theorems.

## 3. Provenance ledger and remaining frontier
Classical finite Tate duality and Euler characteristic are exact
external suppliers for (3). Bellaiche Prop 2.8 supplies rational
dimension, not uniform integral cokernel estimates. ExponentTheorems
explicitly describes Iovita–Marmora, Gao–Liu, etc. as RELATED work;
no identification of their conclusions with the native rank-free
sparse-thick or tame exponent or the few-low-jumps colength bound is
made. Those are native proved bodies, requiring human reconstruction,
not a literature axiom or accepted substitution. Remaining:
SparseThickLetters.scaledCupBounds_sparse_thick / two_sizes;
FewLowJumps.exists_scaledCupBounds_few_low_jumps and its
relLength_deepConstants_le, TameChart.killsCokernel_of_isKilledBy,
all their actual cut/cokernel/pairing dependencies. Preserve exact
chart hypotheses and local-to-global same-row relation. The
reciprocity-to-isotropy, balanced row/comparison construction and
A/B remain independent. No native engine reuse across old pin.
Original graph and all axiom evidence retained.

Executed exact JS scalar regressions: 9900 finite order cases
(perfect quotient of dimension H=0..8, A dimension 0..H,
T dimension t<=H-A, S excess s<=H-A-t, D' dimension 0..4,
p=2,3,5,7); verified Ann/A = A'/(T+D') and divisibility.
24850 zero-defect gap scalar cases h=1..500, 0<=v<floor(h/5).
57600 low-jump budget checks for v=1..100,r=1..8,μ=0..8,
K=1..8,W=K-1,m=1. These are only scalar regressions, not local
Galois representation instances or proof of the Kisin premise.
Reproduce by nested loops with the ranges above; powers are BigInt.
Lean/lake absent locally (command -v). Actual CI 45803534769
jobs wrapper success but pinned state c7c80a98dabf1f67e715df1ff9db2bf72fad09fc
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804 and status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f re-read: six checks
standard axioms, module_1_build timeout, all_requested_checks_ok=false.
No new native PASS, no parallel CI job or workflow edit.
Probes below audit actual callers and prepare two independent scalar
certificates; not a mechanization of the external replacement.

RESUME HERE: integrate (3) as the direct cited local-duality proof
in C, and the exact low-jump gap/budget paragraph at crystalline_defect_le.
Continue the actual sparse-thick / two-size cut/cokernel suppliers
with C mathematics, not the scalar endgame. Request named probes
in the existing bounded compact runner; no standalone full replay.
HANDOFF TO: integration/editor, C mathematics, formal audit, kernel extractor.
-/

namespace CompactTateDefectTransfer

theorem divisor_of_cancelled_index (a j q d t : ℕ)
    (ha : 0 < a) (h : a*j = a*(q*d)) (ht : j ∣ t) : q ∣ t := by
  have hj : j = q*d := Nat.mul_left_cancel ha h
  exact dvd_trans ⟨d, hj⟩ ht

theorem no_small_negative_gap (h v : ℕ) (hh : 0 < h)
    (hv : v < h/5) : 2*(2*(v+1)) < h := by omega

end CompactTateDefectTransfer

#check crysCocycles.finrank_eq
#check IsPotCrys.index_mul_index_dual
#check IsPotCrys.relIndex_dvd_of_orthogonal
#check Lift.KummerChart.few_low_jumps
#check crystalline_defect_le
#check block_defect_le_at_place
#check relLength_obeyingCocycles_le
#print axioms IsPotCrys.relIndex_dvd_of_orthogonal
#print axioms Lift.KummerChart.few_low_jumps
#print axioms crystalline_defect_le
#print axioms CompactTateDefectTransfer.divisor_of_cancelled_index
#print axioms CompactTateDefectTransfer.no_small_negative_gap
