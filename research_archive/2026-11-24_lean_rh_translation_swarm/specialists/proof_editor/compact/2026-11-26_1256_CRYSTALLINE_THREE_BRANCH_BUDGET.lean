import New.Selmer.CrystallineBound
import New.Selmer.OnePlaceDefect
import Mathlib.Tactic

/-!
# RUN55 editor — actual crystalline case budgets, 26 November 2026
Human source-matched derivation of the numerical callers; Lean probes/scalar
certificate prepared, not run. Compact source lsernau/grh-lean at
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive focus).
Credit the compact proof authors; no independent RH proof claim.
Read latest manuscript, AGENTS, protocol, handoff, expansion, recent peers.
Resume 0807db85 and audit 6880d1d1. Not a replacement of the determinant.
Actual source ledger:
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a
New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650
New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395
New/Lift/FewLowJumps.lean a86b9c32285a38ddc23f0debec7484c93e21e229
New/Selmer/ThickSpacing.lean 66fcffeac3f881a562db9163cd66a207e15bdf19
Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791

Retain ALL the hypotheses of crystalline_defect_le, notably the two opposite
jump windows, signs, same chart, k.e*k.f=index, e<=h, unramified or constant
sign alternative and no-three-thick arc. Write p=ell, v=lambdaLoss(h,b,p),
K=floor(2v/Q), r=rank L. By the exact definition of lambdaLoss:
v=v_p((2b)!)+h^3 v_p(prod_{b-30h^3<j<=b+30h^3}j), positive j only.
Consequently 2b<p(v+1); if v<h^3 no multiple of p is in that interval.
Also log_p(4b)<m since 2 ln(4b)<m and ln 2>1/2.
The rank lemma implies a p^E annihilator pays index*2rE, by the free
crystalline-cocycle rank formula and normalized DVR length. Do not replace
cocycles by H^1. The same rank and chart are used throughout.

1. Small prime p<=Q (sparse thick).
Q K <=2v<Q(K+1), hence K>=1 (otherwise 2b<p(v+1)
<=Q(Q/2+1), contradicting the native b,h bounds).
Since delta<eta<b, 2(b+delta)<4b<2p(v+1)
<=Q^2(K+1)+2Q<= (2Q^2+2Q)K<=h^2 K.
It follows K>2b/h^2 >=198Gh. Take J=floor(log_p(h^3)),
X=K, new eta=2G, width W*=9G, thick centre b+delta, thin G+delta.
W+8G<=9G; G+delta+W<=2G. Then
e*2(b+delta)<h^3 K<p^(J+1)K; 8e<=p^(J+1).
11(p^J+1)W*<=99G(h^3+1)<=b<=b+delta.
The different exponent d is zero at e=1 and otherwise 1+v_p(e),
so d<=m, J+1<=m, log_p(2(b+delta))<m. Since 99m<=h,
4(J+1+d+log_p(2(b+delta)))W*<=108mG<K.
The native sparse-thick exponent is thus E=10^4 K(J+1)<=10^4 Km.
The exponent theorem requires actual hT spacing and sign/chart conditions,
not just these scalar guards. They remain as in OnePlaceDefect.
The rank cost 2rE<=10^5(rKm+mu v).

2. p>Q and v>=h^3 (two sizes).
Native chart is unramified and p>=7. W*=W+4eta<=K,
since Q(W+eta)<=h^3/99 and QK>=2v-Q+1; also
5W*<=G+delta. v>=Q gives K>=v/Q.
Since p>=Q+1, Kp^2>=pv(p/Q)>=p(v+1)>2b>b+delta.
And Kp>2bv/(Q(v+1))>=b/Q>2(G+delta).
These supply the three size inequalities of scaledCupBounds_two_sizes
with centres G+delta,b+delta. The native exponent is
E=10^4 K(log_p(2(b+delta))+1)<=10^4 Km, so the same rank payment works.
No loss from the number of crystalline lattice choices.

3. p>Q and v<h^3 (few low jumps).
Here p>2b/h^3>=198G. Put a=2(v+1), R=6(a+eta+W).
a<=2h^3 and eta+W<=h^3/99, so R+delta<30h^3.
Both centres B in {G+delta,b+delta} satisfy R<B. For the thin centre
B+R<p, so the closed interval [B-R,B+R] contains no multiple of p.
For thick B, this interval lies within (b-30h^3,b+30h^3];
a multiple of p would cost h^3 in v, contradiction. This gives the
actual NoMultipleNear conditions, not just nondivisibility at b.
Since p>=7, (p-3)a>=p(v+1)>2b>=B+W+eta.
Thus few_low_jumps applies (retaining opposite windows and unramified
chart). If U' lies in [-eta,0], its zero-defect alternative applies.
Otherwise all negative jumps in U or U' obey 2u<=-h, and low multiplicity
per embedding is <=mu. If v<floor(h/5), then 2a<=4 floor(h/5)<h:
no negative jump in [-a,0), so again defect is zero. Else
v>=floor(h/5)>=1, a+1=2v+3<=6v and W+1<=K
(using h>=99(W+1)Q and 2v>=2 floor(h/5)).
The few-low-jump bound, normalized by length(O/p), is
11 f (mu(a+1)+r(W+1)) <= f*10^5(rKm+mu v).
Here f=index because e=1, and m>=1. This supplies EXACTLY the y
of crystalline_defect_le in the final branch. The stronger no-multiple
closed-interval argument is valid even when v=0; no division by v.
Retain actual local duality and the Kisin cut/cokernel bounds. This
completes the arithmetic CASE GUARDS, not an independent proof of the
deep pairing and Kisin suppliers.

Actual consumer: ribet_columns -> sum_blockLoss_le ->
block_defect_le_at_place -> crystalline_defect_le -> sparse_thick /
two_sizes / few_low_jumps, then normLength_defect_le. The previous
graph/dual audit 6880d1d1 supplies the other branch; the tame-type case
still needs its exact chart/type annihilation and source size check.
No global kernel node deleted; retain original and reduced graph, actual
root and standard axioms. Context (D,p,O,L,U,U',chart,rank,place).
No URT. lean/lake not present in local container. Native engines for old
pin not reused as compact evidence. Read actual state output
23de197bd48f404ca2074c69676de289c4f7934e: all_requested_checks_ok=true
for targeted run 45799225653 only. Primitive output
088cd2ec0e935ee1a282f10096949bcf671cc804: false (A timeout, B/C partial);
neither validates this file.

Executed exact Python/Sympy guard regression (actual lambdaLoss via Legendre
factorial valuations, not substitute values): 144 configurations, 26 sparse,
79 two_sizes, 10 few_zero, 29 few_positive; no assertion failed.
Reproduce with companion 2026-11-26_1256_crystalline_guards.py. This is a
scalar regression only, not a computation of Kisin modules or proof of RH.

RESUME HERE: expand the actual cut/cokernel construction
scaledCupBounds_of_cut_windows and few_low_jumps at their callers, and the
tame branch of OnePlaceDefect. In particular prove the native deep-point
lifting and local duality inputs, not more endgame algebra. Request shared
native targeted verification of the compact source/adapter, no protected
workflow edits. HANDOFF TO math, Galois, audit, integration, shared kernel.
-/

namespace EditorCrystallineRun55

theorem rank_payment (r K m j mu v : ℕ) (hj : j ≤ m) :
    2 * r * (10000 * K * j) ≤ 100000 * (r * (K * m) + mu * v) := by
  calc
    2 * r * (10000 * K * j) ≤ 2 * r * (10000 * K * m) := by gcongr
    _ ≤ 100000 * (r * (K * m) + mu * v) := by omega

theorem few_payment (r K m mu v a W : ℕ)
    (ha : a + 1 ≤ 6 * v) (hW : W + 1 ≤ K) (hm : 1 ≤ m) :
    11 * (mu * (a + 1) + r * (W + 1)) ≤
      100000 * (r * (K * m) + mu * v) := by
  have hKm : K ≤ K * m := by simpa using Nat.mul_le_mul_left K hm
  calc
    _ ≤ 11 * (mu * (6 * v) + r * (K * m)) := by gcongr; omega
    _ ≤ _ := by omega

end EditorCrystallineRun55

#check crystalline_defect_le
#check block_defect_le_at_place
#print axioms crystalline_defect_le
#print axioms block_defect_le_at_place
