import New.Selmer.RibetElement

/-!
# RUN66 (2026-11-27): direct finite local Tate-duality bridge, and block loss assembly
Status: human source-matched external-theorem substitution; native probes prepared, NOT run.
Credit: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first).
Peer manuscript HUMAN_PROOF_COMPACT read through latest editor/integration handoffs,
including RUN66 radius and RUN65 normalized RowBalanced. This task is the distinct
local duality index consumer, not another radius proof or a new analytic endgame.

Actual source bodies:
* Lib/ClassField/LocalDuality/CrystallineDuality.lean
  85cabaf4fb3b68704ccdc040c34a6b4339ca9cc1:
  exists_perfect_pairing, IsPotCrys.index_mul_index_dual,
  IsPotCrys.relIndex_dvd_of_orthogonal.
* New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444:
  relLength_obeyingCocycles_le.
* New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a:
  block_defect_le_at_place.
* New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79:
  crystalline_defect_le.
* New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc:
  mem_cupOrthogonal_of_scaledCupBounds, few_low_jumps, tame_types_exponent.
* New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650:
  normLength_defect_le.
* New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df:
  loss, obeying_crysRels, index_eq_card_range, sum_complexEmbOf_le.
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18:
  sum_blockLoss_le and its actual ribet_columns consumer.

## 1. External theorem audit: exact hypotheses, not an analogous result
J. S. Milne, Arithmetic Duality Theorems, second ed., Chapter I Corollary 2.3
(printed p.28; PDF page index 35) and Theorem 2.8 (printed p.31; index 38),
https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf .
Both page images and corresponding text retrieved and inspected in this run.
Cor 2.3: finite continuous G_K-module M of order prime to char(K) has
perfect cup duality with M^D=Hom(M,Kbar^x), in complementary degrees.
Thm 2.8: #H0(M)#H2(M)/#H1(M)=[O_K:#M O_K]^{-1}.
K here is finite over Q_l, so char(K)=0; no prime-to-residue-characteristic
assumption. For #M=l^a the reciprocal is l^(-a [K:Q_l]).
This includes l=2 and arbitrary ramification. No restriction to tame or
unramified modules. No rational-to-torsion H_f self-duality assumption.

## 2. Short proof of the exact index consumer (retains native rank identity)
Use all hypotheses of IsPotCrys.relIndex_dvd_of_orthogonal. The open embedding
j identifies Gamma with G_K for K finite over Q_l of degree n=index(j Gamma).
Put M=L/l^m L (via the actual equivariant quotient q), M'=L'/l^m L'.
The perfect Z_l pairing b with cyclotomic covariance identifies M' with
M^D: pair modulo l^m and use the chosen primitive root embedding
Z/l^m(1) -> Kbar^x. Surjectivity q and its kernel justify the factorization.
If m=0 all reduced groups are trivial; conclusion holds. Otherwise same proof.
The coefficient ring R can be ramified; the pairing is over Z_l, not a
naive field trace on R. For R finite DVR over Z_l its integral dual is a
free rank-one R-module: finite torsion-free over DVR, compare Z_l ranks.
A generator f gives the exact perfect pairing via evaluation on R.
This supplies exists_perfect_pairing without assuming different is a unit.

Let C=Z_f(L), C'=Z_f(L'), A=red C, A'=red C', in the finite continuous
cocycle groups Z=Z^1(G_K,M), Z'=Z^1(G_K,M').
The actual source uses Bcris coboundaries, hence C and C' are saturated:
if l^m times a lattice-valued function is a Bcris coboundary, divide
its period witness by l^m in Bcris. Thus ker(red|C)=l^m C (and dual).
Use native finite free/rank result and complementary jumps u -> -u-1:
  #A #A' = #M^(n+2).                 (rank identity retained)
Both A and A' contain ALL finite coboundaries B=B^1(M), B'=B^1(M'):
lift the element defining the coboundary using q or its dual; the integral
coboundary already belongs to Z_f. No assumption that finite cocycles lift.

Let H0=H intersect C', D=red H0, and E=(D+B')/B' in H^1(G_K,M').
The native hZ and hH assert that A and S are continuous cocycles and that
their cup with every element of H bounds in Kbar^x. Crucial topology checked:
GaloisDefs.unitsRep uses DiscreteUnits, ContinuousCocycles.B2 explicitly
has continuous witness into that discrete module; zmodPowToUnits uses
rootPowHom with image the l^m-th roots. Hence the source hH really means
zero in the continuous discrete-coefficient H^2 of Kbar^x, the Milne
pairing target. This is not an assumption about p-adic-continuous cochains
with possibly infinite images. Cup products depend only on cohomology;
the native swapped order changes the sign, irrelevant to zero, including 2.

Let P be the inverse image of E^perp under Z -> H^1(G_K,M).
Then A+S <= P. By finite perfect duality and the exact Euler formula,
writing q0=#M=#M', h0=#H0(G_K,M), h0'=#H0(G_K,M'):
  #P = #B * #H^1(G_K,M)/#E
     = (q0/h0) * (q0^n h0 h0')/#E
     = q0^(n+2)/(#B' #E)
     = #A * #A' / #(D+B').
Consequently the single decisive index identity is
  [P:A] = [A':D+B'].
Since A <= A+S <= P, [S:S intersect A] divides [P:A].
Reduction C' -> A' induces a surjection C'/H0 -> A'/(D+B').
Thus [A':D+B'] divides [C':H0], and transitivity gives exactly the
native conclusion A.relIndex S | H.relIndex C'. If [C':H0] is infinite
the natural index convention is zero and divisibility is automatic;
finite case uses the displayed quotient. No assumed A'=A^perp,
no weight twist, Sylow subgroup, corestriction transfer or division by l.
This replaces the long internal proof at this one human consumer, using
two established named results. Does not globally remove their other uses.

## 3. Connect to the actual RowBalanced local relation consumer
The proof of relLength_obeyingCocycles_le constructs the graph lattice Y
from each restricted obeying cocycle, with an equivariant map t to M.
Class membership is by the actual jointly injective projections to the
whole family, not one selected member. Retain graph subrepresentation,
its torsion-free finite lattice, and the crystalline cocycle a mapping to
the restricted cocycle. Choose an integral linear lift p of t (Y free
and q surjective); the equivariance defect gp-p lands in l^m L. Dividing
it gives an integral coboundary after extension to the fraction field,
hence a crystalline cocycle in the Hom lattice. With the perfect b above,
p defines the native pairing of Y and L', whose modulus is m; this is
exactly the Pairing witness in the final line of the native proof.
The universal cupOrthogonal property supplies hH for these restricted
cocycles, and for reductions of C using Y=L and the quotient map.
Continuity follows from the source continuous_comp lemma; retain it.
Our index divisibility gives the source relative-length inequality:
finite O-module quotient orders are residue cardinality raised to length,
so divisibility implies the inequality. No assertion of a lift of an
arbitrary mod-l^m cocycle, and no use of a rational H_f group instead of
the saturated integral cocycles. The same ring and same class retained.

## 4. Connect local safety to the aggregate Ribet caller (conditional)
In normLength_defect_le, l^k C <= S gives a surjection C/l^k C -> C/(C intersect S).
Normalize length by length(O/l). The resulting bound is k rank_O C.
Use rank_O C <= (1+n) rank_O L <= 2n rank_O L (n>=1).
This recovers the exact native exponent-to-length supplier, no new
factor for the ramification degree of O.

For each place v and block i use the SAME InClass F K U from the actual
labelled column family. The direct sum decomposition at pi is the source
reindexing equivalence, with equivariant single-block inclusions.
The class-transfer lemma makes each block a member. Row block has rank r;
each of the t string blocks has rank one. The one-place defect bound is
n_v rank(L_i) loss(D,l)/x_i where x_none=1 and x_some=D.t.
Since obeying_crysRels is the intersection of pulled-back local relations,
the quotient by the intersection embeds in the direct sum of the local
quotients; relative length is therefore subadditive.
Sum first over blocks, then over v:
  sum_i normLength(blockLoss_i)
    <= sum_v n_v (r+t/D.t) loss(D,l)
    <= 2 r [E:Q] loss(D,l) = 4 r f loss(D,l).
Here t<=D.t, r>=1, D.t>0; n_v is the local embedding index. The disjoint
complex embedding sets in sum_complexEmbOf_le give sum_v n_v<=2 f.
The formula uses all finite moduli M_i, independently of M_i; only the
coefficient-ring threshold is simultaneous for finitely many v.
This is exactly sum_blockLoss_le's required output; it remains conditional
on block_defect_le_at_place, graph-class and other original premises.
It is not a replacement for the near-invariant estimates.

## 5. Remaining genuine quantitative safety
The actual OnePlaceDefect case split is tame (l divides gProd) or
crystalline (F=top,K=bottom). The tame path uses IsTameType, opposite jump
windows and the tame_types_exponent with k=3 r0^2(N+1)^2+150(eta+W+1)
and the strict prime bound; the row family uses r0=D.r and
N=(D.r+D.t)*D.r. The crystalline path uses sparse-thick / two-sizes /
few-low-jumps in CrystallineBound. In particular the case l<=Q requires
the native short-arc exclusion of three thick Frobenius letters, not
merely a prime-size bound. The few-low-jumps branch needs exact
NoMultipleNear and the low-jump count for the dual row, or the
negative-only dual singleton. Retain these hypotheses, the near-invariant
frame and safe-pair bounds; no general continuity theorem supplies the
numerical constants. Next prove the actual window and local case bridges,
not the above aggregate again.

## Audit / graph
Original local source-visible edges:
  ribet_columns -> sum_blockLoss_le -> block_defect_le_at_place
       -> crystalline_defect_le OR tame_types_exponent;
  sum_blockLoss_le -> relLength_obeyingCocycles_le ->
       IsPotCrys.relIndex_dvd_of_orthogonal -> native Sylow/twist/duality chain.
Reduced human edges at latter consumer only:
  relLength_obeyingCocycles_le -> finite duality + Euler characteristic
       + rank identity + reduction saturation + finite subgroup indices.
Keep all existing native original/reduced graph and axiom ledgers unchanged.
This is a local proposed human substitution with exact source-visible
context key (compact pin, Gamma, j, L,L',b,q,m,H,S); no global deletion.
External assumption ledger: Milne Cor 2.3 and Thm 2.8 are proved
published results; native rank, class, graph, crystalline safety and
continuity are retained theorem obligations, not assumed new axioms.
No claim that the claimed RH theorem was imported or proved here.
Prior old-pin CI 45577239749 and 45576756833 status JSON both retrieved
with returncode 0; those runs do NOT verify this compact substitution.
Local command -v lean / lake and elan toolchain check returned no paths.
No rh_scan/prune/reduce/auto available in this container, no native tests
run. Below are actual source audit probes (not a new Lean proof of the
external bridge). Do not report PASS without published CI for this file.

RESUME HERE: at OnePlaceDefect.block_defect_le_at_place establish tame
exponent budget and crystalline opposite-window/short-arc case hypotheses
from the actual Data and Kummer chart; at CrystallineBound audit the
few-low-jumps branch including integer floors and valuation normalization.
Do not repeat the finite Tate counting or the aggregate. Review the
continuity and graph bridge in parallel.
HANDOFF TO integration, editor, Galois, formal audit and compact runner.
Human RH reconstruction remains incomplete.
-/

#check exists_perfect_pairing
#check IsPotCrys.index_mul_index_dual
#check IsPotCrys.relIndex_dvd_of_orthogonal
#check relLength_obeyingCocycles_le
#check normLength_defect_le
#check block_defect_le_at_place
#check sum_blockLoss_le
#print axioms IsPotCrys.relIndex_dvd_of_orthogonal
#print axioms relLength_obeyingCocycles_le
#print axioms sum_blockLoss_le

namespace RHRun66
-- Exact cross-multiplication at the finite index cancellation.
theorem index_cancel (p a ap d : ℕ) (ha : 0 < a)
    (h : p * d = a * ap) (hdiv : p = a * (p / a)) :
    (p / a) * d = ap := by
  have hh : a * ((p / a) * d) = a * ap := by
    rw [← Nat.mul_assoc, ← hdiv, h]
  exact Nat.eq_of_mul_eq_mul_left ha hh
-- Aggregate constant once place indices have been summed, in real normalization.
theorem aggregate_budget (r t T f L : ℝ)
    (hr : 1 ≤ r) (hT : 0 < T) (ht : t ≤ T)
    (hf : 0 ≤ f) (hL : 0 ≤ L) :
    (2 * f) * (r + t / T) * L ≤ 4 * r * f * L := by
  have h : t / T ≤ 1 := (div_le_iff₀ hT).2 (by simpa using ht)
  have h' : r + t / T ≤ 2 * r := by linarith
  calc
    (2 * f) * (r + t / T) * L ≤ (2 * f) * (2 * r) * L :=
      mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left h' (by positivity)) hL
    _ = 4 * r * f * L := by ring
end RHRun66
#print axioms RHRun66.index_cancel
#print axioms RHRun66.aggregate_budget
