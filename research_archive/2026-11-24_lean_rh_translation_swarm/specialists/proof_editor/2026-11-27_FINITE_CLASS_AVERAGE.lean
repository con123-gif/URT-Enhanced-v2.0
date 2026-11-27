import Mathlib

/-!
# Editor: finite class refinement replaces the Haar/defect averaging branch
27 November 2026. HUMAN SOURCE-MATCHED alternative at actual Theorem B caller,
independent review of integration's existing lattice discriminant estimate.
Generic finite-sum Lean certificate PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005,
Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc reread, not imported.
Current upstream main 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc verified;
no migration. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory
unified engine read, AGENTS, protocol, handoff, expansion, continuity,
research state/log/protocol and CI summary consulted. Latest 446c68f9
geometric level sum/single energy payment and c8d08359 finite datum audit,
b892a87c CM period, 788d56c5 exchange, f1abc81e Hecke, 2f004f32 frame read
by commit diff. Do not repeat those. Previous editor 38cee09b orbit
cancellation retained. Integration 2026-11-26_COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md
section 3 already proves the local discriminant estimate via averaging;
this is a strictly finite alternative to its Haar step, not a new bound.

Actual compact source anchors (relative to grh-compact/src):
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
sum_latticeDisc_inv_le lines 18–76 and consumer sum_pairWeight_le.
New/Filling/LatticeChart.lean 5c87f908fd39bf1c6b11ffe37af9dd5f764c782c,
classSum_eq_sum uses aut_columnLevel, i.e. every rational stabilizer is trivial.
Lib/Adelic/Hecke/ClassMean.lean b9d642228711dcfb20687f0b2579fa8ff99838f3,
HasFiniteType, classIntegral_sum, classIntegral_eq_classSum.
Source-visible root path Data.enough_forms -> ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs -> sum_pairWeight_le
-> sum_latticeDisc_inv_le. Not a new kernel reachability scan.

## 1. Exact local input, do not redo geometric counting

Let Gamma=stdRatPoints, K=S.columnLevel, C=Gamma\\G/K=S.Classes,
A=the finite Kf/(latStabilizer.comap inclHFin) cosets used in BlockBound.
Use the SAME representatives a_phi=phi.out embedded in G, and h=|A|>0.
For fixed codimension s define
   F(c)=sum_(dim T+s=k) (latticeDisc(c,T)^(k+1))^(-1).
Retain the native inverse-zero convention. The actual hB in BlockBound
and integration section 3 prove, with their exact marked-row/lattice
congruence and admissibility inputs,
   sum_(phi in A) F([u a_phi]) <= h B for EVERY u in G,
   B=N^(-kf) tau^(s+1).
The local proof supplies positivity, finiteness, C_s N^[f(s+1)] and the
exact numerical comparison with h B; no new assumptions on its witnesses.
Each F(c) is finite before taking real values: use a_phi representing
the identity coset (a_phi need not be identity), set u=c.out*a_phi^-1,
and use nonnegativity and the finite bound for that u.

## 2. A finite refinement; no analytic class integral or signed defect

For each a=a_phi put K_a=a K a^-1, and choose the single common refinement
   L=K intersect (intersection_(phi in A) K_a).
It is open by finite intersection, compact as a closed subgroup of K,
and has finite index in K and each K_a (compactness of each K_a).
Let D=Gamma\\G/L. This set is finite and nonempty: the map D -> C is
surjective and each fibre is finite. The original source gives ALL
stabilizers Gamma intersect g K g^-1 trivial (aut_columnLevel), not
merely at the identity. It follows that Gamma acts freely in every
right K_a cell and every right L cell too.

For each a define p_a:D -> C, [g]_L -> [g a]_K. This is well-defined
since a^-1 L a <= K, and surjective. Fix c=[u]_K. Its fibre has the
explicit bijection
    K/(a^-1 L a) -> p_a^-1(c),   k -> [u k a^-1]_L.
Surjectivity: if [g a]_K=[u]_K then g a=gamma u k.
Injectivity: equality of two L classes gives
u k2 = gamma u k1 (a^-1 ell a), hence gamma is in Gamma intersect
u K u^-1, so gamma=1; exactly equality of the indicated right cosets.
No normality of L, K or Gamma is needed.

Every fibre of p_a therefore has m_a=[K:a^-1 L a] elements.
Since both D and C are the SAME finite nonempty sets for every a,
    m_a |C|=|D|,   hence all m_a=m.
This even proves equality of the needed indices without appealing to
unimodularity, a general transporter integral or an assumed right action
on C. Crucially [u]_K -> [u a]_K itself need not be well-defined.

Now sum the original hB inequality over D, with any representative g.
The left side is independent of that choice by well-definedness of p_a.
Use finite reindexing BEFORE inequalities:
    h m sum_(c in C) F(c)
      = sum_(d in D) sum_(a in A) F(p_a(d))
      <= |D| h B = h m |C| B.
Since h,m>0, cancel both:
    sum_(c in C) F(c) <= |C| N^(-kf) tau^(s+1).          (FC)

This is EXACTLY the source class discriminant bound. It replaces the
last signed-defect, classIntegral_sum/classIntegral_eq_classSum calculation
at THIS caller with a finite double count. No Haar integration, infinite
sum interchange, group unimodularity, smooth-invariant function class
or general weighted transporter theorem is needed for this replacement.
The local marked-row and subspace estimates, finite-type data, compact
open level and trivial rational stabilizers remain necessary.
The general classIntegral_sum has other consumers; no global deletion.

## 3. Executed exact finite control (not a test of adelic geometry)

Python stdlib, S4. H=< (01) >, K=< (012) >, a=(23).
Use permutation tuples and compose m(a,b)=tuple(a[b[i]] for i in range(4)).
Compute double cosets by iterating remaining permutations g and deleting
{h*g*k: h in H,k in K}; use lexicographically minimal representatives.
L=K intersect aKa^-1. Define ix[g]=original double coset of g.
For each representative r of H\\S4/L compute ix[r*a] and ix[r].
For each f in product(range(3),repeat=4) verify
  sum_r (f[ix[r]]+f[ix[r*a]]) == 2*3*sum(f).
Actual local output:
S4 free stabilizers: 4 classes; 12 refined classes; fiber sizes
[[3, 3, 3, 3], [3, 3, 3, 3]]; exact sum checks 81.
Negative control H=K=< (01) >, a=(12), same construction:
S4 nonfree stabilizers: fibers [[1, 1, 2, 2, 2, 2, 2],
[1, 1, 2, 2, 2, 2, 2]]; unweighted constant-fiber argument fails.
Thus cannot drop aut_columnLevel or use the unweighted formula at a
different level. The proof above is general, not inferred from the test.

## 4. Status and handoff

Original source-visible subgraph:
sum_pairWeight_le -> sum_latticeDisc_inv_le ->
{hB from sublatticeDisc/marked-row estimates, classIntegral_sum,
 classIntegral_eq_classSum, classSum_eq_sum}.
Human candidate:
same hB + {finite common level refinement, aut_columnLevel,
 finite double-count (FC)} -> sum_latticeDisc_inv_le.
No new kernel edges or axioms removed. Context cache includes same S,
level K, finite representative family, s, local weighted bounds, all
class stabilizers and exact normalization. Previous proofs preserved.
Latest actual CI receipt reread: state branch
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769.
Six native named checks with propext, Classical.choice, Quot.sound;
module_1_build timeout124 after 2700.11s; all_requested_checks_ok=false,
full_RH_replay=false. Neither this nor old-pin reduction engine CI
verifies (FC). Local command -v lean/lake returned no paths; no native
rh_scan/prune/reduce/auto/frontier execution. The scalar certificate below
is prepared only and assumes the uniform-fibre sum identity just proved.
No URT use, no full proof completion percentage, zero native retirement.

RESUME HERE: splice the short finite-refinement proof at the existing
lattice discriminant class-average paragraph, without duplicating
integration section 3 or changing its numerical exponent. Independently
audit the coset orientation and aut_columnLevel, then replay at actual
sum_latticeDisc_inv_le if runner resources allow. Next B obstacle is
pointwise pairInvariant_mul_le / exists_link_split_le_classGauge at
CrudeEnergy, not another energy level recursion or class average.
HANDOFF TO integration, formal audit, positivity, native runner.
Human RH reconstruction and the decisive prime inequality remain OPEN.
-/

open scoped BigOperators
namespace RHFiniteClassEditor

/-- Once finite refinement gives uniform multiplicity, the exact scalar
    class-average bound follows by exchanging the two finite sums. -/
theorem class_average {A D C : Type*} [Fintype A] [Fintype D] [Fintype C]
    (p : A → D → C) (F : C → ℝ) (m B : ℝ)
    (ha : 0 < (Fintype.card A : ℝ)) (hm : 0 < m)
    (hcard : (Fintype.card D : ℝ) = m * Fintype.card C)
    (hfiber : ∀ a, (∑ d, F (p a d)) = m * ∑ c, F c)
    (hrow : ∀ d, (∑ a, F (p a d)) ≤ Fintype.card A * B) :
    (∑ c, F c) ≤ Fintype.card C * B := by
  classical
  have h : (∑ a : A, ∑ d : D, F (p a d)) ≤
      ∑ _d : D, (Fintype.card A : ℝ) * B := by
    rw [Finset.sum_comm]
    exact Finset.sum_le_sum fun d _ => hrow d
  simp only [hfiber, Finset.sum_const, Finset.card_univ, nsmul_eq_mul] at h
  rw [hcard] at h
  have hh : (Fintype.card A : ℝ) * m * (∑ c, F c) ≤
      ((Fintype.card A : ℝ) * m) * (Fintype.card C * B) := by
    convert h using 1 <;> ring
  exact le_of_mul_le_mul_left hh (mul_pos ha hm)

#print axioms class_average
end RHFiniteClassEditor
