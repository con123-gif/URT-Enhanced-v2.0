import New.Filling.BlockBound

/-!
# RUN73 — integral skew correction and geometric colour fibre in Theorem B
27 Nov 2026. Human source-matched argument; Lean certificates prepared, not
compiled. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; prior lane
2057d58e5431e6a466fa1379d8d1719311444ca3. Read latest manuscript and
integration/2026-11-26_COMPACT_WEIGHTED_PAIR_COUNT.md (6bdfdba6).
That note leaves the geometric fibre-one proof OPEN; its abstract colouring
and scalar sum are not repeated here. Actual root consumer:
Data.enough_forms -> Data.ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs -> sum_pairWeight_le
-> tsum_invPowWeight_le_of_codim_le. All retained suppliers remain visible.

1. Shared-vector smallness, BlockBound.lean
6c68e80e3b1ea2b7983696716305493a37f2b1fd lines 90–125;
BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641 310–323,
401–418; NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce
295–305; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727 32–52.
Set n=rho+1, q0=levelPrime 0, M=q0^(n^4), B=b^(5n²). Fix actual
near gamma of level j, u in besselU0, index l>=j, Z=frameProducts gamma,
Y=paddedLeading_j Z, d=det Y !=0. By the normal-form shared-vector
supplier there exists w with f w=gamma f Y^-1 e_l. At place v choose
the native common gauge A and the two boxed points p,q from IsNear.
Let G_p,G_q be the n-by-n frame-coordinate matrices in source lines
100–107, not arbitrary near matrices. G_p is unitriangular by the
native gauge condition, and G_p w=G_q Y^-1 e_l after applying the
same scaled linear forms to the shared vector equation. The entries
of both G's and Y have norm <=B (native frame norm, basis-scale and
NearTerms bounds; retain these estimates and the gauge supplier).
Consequently the block matrix
           H = [ G_p   -G_q ; 0   Y ]
has determinant d and H(w,Y^-1 e_l)=(0,e_l). Cramer's rule yields
d*w_a as the determinant with column a of H replaced by (0,e_l).
Every entry of the replaced matrix is <=B since b>=2. The elementary
determinant bound (2n B)^(2n), n<=b, gives
  2|Phi_v(d*w_a)| <= b^(10n^3+4n+1) < b^(10n^4) <= M.
Indeed n>=2 makes 10n^3(n-1)>4n+1; the actual n>=100001.
Since u fixes f, the shared vector is unaffected by u. This proves
the native norm_shared_vector_lt using the same w and Y, conditional
on the precise gauge and normal-form suppliers, with no division by
a potentially small complex determinant in the final inequality.

2. Late-column vanishing, BlockBound 141–196.
Work in the rational integral star-stable ring O={z:E | z in O_hat}.
Within a fixed Z colour and fixed first middle-residue colour choose
the native class-unipotent corrections u_p (lines 164–170); these align
all middle rows to those of p_1 using the actual congruence of columns.
This first correction and its integral lattice hypotheses are retained.
For two terms p,q also in the SAME upper colour let
 xi=(frameImage(u_q q)-frameImage(u_p p)).toRows1,
 n0=M*g*d*star(d), X=xi/n0.
The upper congruence means X is integral in O; d!=0 and g,M>0.
The difference of the two frame Gram identities after the middle rows
have been aligned gives xi^* P=-P^*xi, P=xRows Z. Since n0 is nonzero
and self-adjoint, cancel n0 to get X^*P=-P^*X. No norm is applied here.
For l>=j, the two shared-vector bounds in step 1 give
 |Phi_v((xi adj(Y))_{a,l})| < M at EVERY infinite place v.
Hence the algebraic integer (g*d*star(d)*X adj(Y))_{a,l} has absolute
value <1 at every infinite place. If nonzero, its absolute field
norm is a positive integer, contradiction. Cancel g*d*star(d)!=0:
                  (X adj(Y))_{a,l}=0 for l>=j.
This uses the CM field product of squared complex moduli, not a
single-place smallness inference. All denominators are cleared first.

3. Integral skew correction, BlockBound 181–210.
Write alpha=(xRows(adj(Y)^transpose))^transpose (first rho columns of
adj(Y)), T=X alpha, V=(P alpha)^*, and
     sigma=M[star(d) T - d T^* - V T].
The relation X^* P=-P^*X gives T^* P=-V X, and
 (VT)^* = alpha^* X^* P alpha = -alpha^*P^*X alpha = -VT.
Thus sigma^*=-sigma exactly. Every factor is integral, including
adj(Y), so sigma is integral without dividing by 2 (important at 2).
There are two native branches:
 * j>rho, so j=n and Y=Z. Then P alpha=d I by the first rho rows
   and columns of Y adj(Y)=dI. Thus V=star(d)I. In sigma P the
   first and third terms cancel exactly, leaving M*d*star(d)X.
 * j<=rho. Put C=X adj(Y), so T is its first rho columns.
   Late-column vanishing means C is zero in all columns i>=j.
   The first j rows of P and Y coincide. Consequently
          TP=C Y=d X
   (the omitted rows i>=rho and the changed rows j<=i<rho are
   multiplied by zero). Substitute T^* P=-VX. In sigma P the second
   and third terms cancel exactly, leaving M*star(d)*d X.
In either branch the one decisive identity is
                     g sigma P = xi.
Apply BoxPartition.exists_mem_classUnip 227–250 with the native
p=id, u=0, s=sigma: it gives a classUnip0 element r with matrix
I+g*x*sigma*x^*ratGram, where x includes the first rho isotropic
basis vectors. Its effect is exactly to add g sigma P to the upper
frame rows and leave the already equal middle rows unchanged.
Therefore r u_p p and u_q q have identical frame images. The actual
IsNearRep.eq_of_frameImage_eq supplier (BlockBound 208–210) gives p=q.
Thus each final congruence-colour fibre has at most ONE kept term,
not just at most one rational frame. This is precisely the geometric
fibre condition for the second colouring in the weighted inverse-index
estimate. Keep the first correction (normal-form middle-row alignment),
the chosen-representative uniqueness, integral class lattice identities,
norm/scale and native index-size bounds as premises. No new claim that
all of tsum_invPowWeight_le_of_codim_le has been independently proved.

4. Consumer and remaining count inputs.
The second colouring is by the upper rows modulo n0*O_hat; its
index is genIndex(n0) raised to the actual number of entries.
The fibre-one result supplies the missing injectivity branch of
BlockBound 171–210. Combine with the first weighted index colouring
and the bound on the number of integral Z values, all as in source
137–162, 211–215. The source additionally requires integral primitive
completion, the preimage lattice inclusion and its quantitative
genIndex bound; do not omit them. The sum_pairWeight_le consumer
uses two codimension counts and the independent lattice discriminant
sum, with final tau² 2^-i summation in integration 6bdfdba6.
The geometric saturation divisibility at BlockBound 245–end and
sum_latticeDisc_inv_le 18–76 are still essential. The former is
distinct from the now reconstructed skew correction. No claim of
an independent proof of B or the weighted prime window.

Graph local context (pin, S.IsAdmissible, level j, c,t,Z colour,
same Y, first residue colour, upper residue colour) kept; original
and reduced global graphs, pending nodes and axiom evidence untouched.
Native Lean/lake/elan absent on local PATH; rh_prune/rh_scan and
rh_reduce/rh_auto/rh_auto_frontier not executed on compact pin.
CI run 45803534769 actual jobs successful at workflow level but
compute status a56e2d3afb99ed8275e81fd63c8494306e57c43f ERROR;
targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804:
six native named checks, standard axioms propext/Classical.choice/
Quot.sound, one module build timeout 124, full_RH_replay=false.
New certificate below uncompiled. No PASS, no root theorem imported.

RESUME HERE: reconstruct first correction in BlockBound 164–170
and geometric saturation divisibility in sum_pairWeight_le 245–end
using BoxPartition.xRows_conjTranspose_mul_eq and actual commonLink
orthogonality; then latticeDisc sum and distinct Rallis normalization.
Coordinate with integration/literature; do not repeat abstract
weighted counting or scalar recurrence. HANDOFF TO integration,
editor, independent audit and native runner.
-/

namespace RHPositivityRun73

-- Rectangular matrix cancellation in the two native branches.
-- No star-specific simplification is needed once T^*P=-VX is supplied.
theorem skew_correction_mul {a b : Type*} [Fintype a]
    [DecidableEq a] [Fintype b] [DecidableEq b]
    {R : Type*} [CommRing R]
    (T U V : Matrix a a R) (P X : Matrix a b R) (d e : R)
    (h : U * P = -(V * X))
    (hc : T * P = d • X ∨ V = e • (1 : Matrix a a R)) :
    (e • T - d • U - V*T) * P = (e*d) • X := by
  rcases hc with ht | hv
  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, ht, h,
      Matrix.mul_smul, smul_smul]
    module
  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, h, hv,
      Matrix.one_mul, smul_smul]
    module

-- Scalar exponent comparison at n>=2; all bounds below are nonnegative.
theorem shared_vector_exponent (n : ℕ) (hn : 2 ≤ n)
    (h3 : n^3 ≥ n) (h4 : n^4 ≥ 2*n^3) :
    10*n^3+4*n+1 < 10*n^4 := by omega

end RHPositivityRun73

#check Filling.HasLevel.norm_shared_vector_lt
#check Filling.tsum_invPowWeight_le_of_codim_le
#check Filling.exists_mem_classUnip
#check Filling.sum_pairWeight_le
#print axioms RHPositivityRun73.skew_correction_mul
#print axioms RHPositivityRun73.shared_vector_exponent
#print axioms Filling.tsum_invPowWeight_le_of_codim_le
