import New.Filling.BlockBound
import Mathlib.Tactic

/-!
# RUN75 — one integral projector and short-column annihilation align the middle rows
27 November 2026. HUMAN SOURCE-MATCHED, replacement Lean certificates PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005;
latest upstream 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc (2026-11-27 02:09:55Z)
observed but not adopted. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143, protocol and handoff read.
Continue RUN74 ff5c7bc2; peer e9d6914f unified flag/Gram classification,
not the integral alignment argument. Peer 85d03bf7 and 0e9b893e already
audit the common majorant/finite dual datum, so do not duplicate them.

Actual root-path consumer (source-traced, not fresh kernel reachability):
Data.enough_forms -> Data.ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs -> sum_pairWeight_le ->
tsum_invPowWeight_le_of_codim_le (BlockBound 130–215).
Prior RUN73/74 retain the supplier at BlockBound 164–170. Derive it here.
VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0 lines 55–68,
83–122: HasLevel.middle_shared_vector_le, col_eq_zero_of_norm_lt_one,
HasLevel.exists_frameImage_toRows₂_eq_add. BoxPartition.lean
53f11966247a892d94cf688e8b366e887a92f641 lines 224–250 (Eichler),
313–327 (paddedLeading), 407–418 (shared vector).
LatticeComplement.lean 2af8405ff10f2d3fd924d048627b67397f0c5960 lines 66–71
(primitive preimage basis); AdelicRingDefs.lean
868168201f51f7fce6ea57bf492629294dbac8f8 lines 96–100 (preimage lattice).
Cache: same source pin, fixed class c and level j, equal rational Gram Z,
fixed row injection q including all xRows indices below j, variable
pair gamma,gamma' in the SAME congruence fibre. For the BlockBound caller q=id.

1. Exact finite projection before approximation.
Let R=O_hat_E, A=A_f,E, C=classCoordX0(c), the rectangular full-column
rank positive-middle inclusion in class coordinates. Let X be the rational
difference of the X0 rows of gamma'f and gamma f. Equal Z implies equality
of the z and dual-isotropic rows, since those are the pairings with z and
the isotropic columns (the z norm -N is nonzero). Set Y=paddedLeading(j,Z),
xi=selected rows of xRows(Z), t=g^(-1)Y^(-1); Y invertible by HasLevel.
Here g is the actual positive rational integer S.g, not a variable real
scale. Keep the source class-coordinate transport at the same frame.

By the precise congruence hypothesis of VolumeKernel 92–94, taking adjoints
columnwise and using preimageLattice's definition gives an integral matrix
Lambda with
    (C X - g Lambda xi)t integral.                         (M1)
All matrices in this paragraph are in A, and rational matrices are embedded.
Do not replace preimageLattice(t*) by the column span of t*: that would
reverse the needed condition. No integrality of C itself is assumed.

The native primitive preimage basis provides an invertible a with C a
primitive over R. Choose its integral left inverse Q: Q C a=I. Define
    P=C a Q,     mu_A=a Q Lambda.
Then P is integral, P C=C, C mu_A=P Lambda integral, and the exact identity
    C(X-g mu_A xi)t=P(CX-g Lambda xi)t                      (M2)
proves the other required integrality. This isolates a single integral
projection in the native finite-lattice proof; it is not an assumption
that C is square or that the orthogonal projector is integral.

The constraints C mu integral and C(X-g mu xi)t integral describe one
open set of adelic matrices (R is open, maps continuous), containing mu_A.
Entrywise rational density provides a rational mu in that SAME open set.
This is one simultaneous approximation, not independent approximations
of two incompatible witnesses. Retain the primitive preimage basis,
integral left inverse, rational density, coordinate transport and openness.
Define rational L=(X-g mu xi)t. Both C mu and C L are integral.

2. Support cancellation removes the residual exactly.
Write F=frameImage(1), G=frameImage(gamma), G'=frameImage(gamma').
For b>=j, G Y^(-1)e_b lies in span(F) by the native shared-frame lemma.
Since every isotropic frame vector is orthogonal to F,
    xi Y^(-1)e_b=0.
If b=top<j, j=rho+1 and Y=Z, giving the same identity because xi is
selected only from the isotropic rows, never the top row. Hence at EVERY
b>=j or b=top,
    L_b=g^(-1) X Y^(-1)e_b.                                (M3)
The source short-vector bound middle_shared_vector_le is 5 times the
squared X0 norm <=1, at each infinite place, for BOTH gamma and gamma'
in exactly these columns. Consequently by the elementary squared triangle
bound, at every embedding v,
    ||Phi_v(L_b)||^2 <= (2/g^2)(1/5+1/5) <= 4/5 < 1.       (M4)
For b>=j the middle components in fact vanish separately. The strict
bound also handles b=top<j. The source col_eq_zero_of_norm_lt_one applies
to the SAME C-integral L: its positive Gram norm is an algebraic integer
(by class Gram transport and integrality of latMiddle); all its conjugate
absolute values are <1, so it is zero by the product norm, and positive
definiteness forces L_b=0. No separate field-discriminant estimate.
This only needs the aggregate squared norm budget in (M4), not separate
1/5 bounds; the original source supplies the stronger premises.
This is a local mathematical premise weakening, not a native edge deletion.

Thus L is supported on rows a<j, a!=top, all selected by q. Restrict
the columns of L to q (including any additional selected rows, which
have zero columns if a>=j), denoted L_q. Since Y and Z have identical
rows below j, we have exact equality L Y=L_q xi. Set l=mu+L_q; C l
is integral. Cancelling g and Y before any estimates gives
    X=g mu xi + g L Y = g l xi.                             (M5)
This proves the middle-row alignment in VolumeKernel 94–96 including the
zero z and dual-row differences. It works for the general q in that lemma,
including empty selection j=0; the caller uses full xRows.

3. Actual BlockBound caller: same class-unipotent stabilizer.
For q=id let E0 be the standard isotropic column matrix, U the negative
embedding of l into X0 (zero e,z,e* components), skew parameter s=0.
Use the native exists_mem_classUnip formula with p=id:
    u=I+g(E0 U*J-(U+E0 tau U*JU)E0*J).
The integrality condition is exactly C l integral in the same class basis.
U has no dual coordinates and U*JF=0, so every source premise is met and
u lies in classUnip0(c). The only change to the positive middle rows of
uG is -g U E0*JG = +g l xi. The z and dual rows are unchanged.
Thus uG and G' have identical lower rows. Its upper rows need not yet
agree: RUN73's separate integral skew correction is still required.
This consumes M5 at BlockBound 164–170 rather than inventing a new frame.
The class-level Eichler construction (including its trace-one parameter)
is retained, as is the later exact skew lift and representative uniqueness.

4. Verification and frontier.
Read actual historical compute receipts:
45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
conditional strip adapter, and 45576756833 blob
7da354941e402b6f8b364ed03d8c5c82d27b7717 bounded prune scan, both pass.
These are historical results only; neither verifies this replacement.
Local shell command -v lean/lake/elan returned no paths.
No native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier execution.
The following generic algebraic certificates are PREPARED only, not compiled.
No imported RH root theorem, no URT, no synthetic numerical evidence.
No global dependency change: original and reduced graphs and axiom evidence
unchanged; retain all original dependencies until a caller replay/audit.
Remaining separate suppliers include GramLiouville.sublatticeDisc_mul_index_sq_le
(lines 64–79, blob e0e55155b72a00bb6c11d618bf1961e52a4e696c),
NearTerms.tsum_sublatticeDisc_inv_le (65–83, blob
bd8a969f8d1bda48ca0468c28a8a62bc78e280ce) and classIntegral_sum as used
in BlockBound 18–76. No new native PASS or completed RH.

RESUME HERE: derive the lattice-discriminant sum at BlockBound 18–76,
starting with the exact determinant/index factorization in GramLiouville
64–79 and the class-weight averaging. Do not duplicate RUN74 inner/outer
index divisibility or peer flag/Gram classification.
HANDOFF TO integration/editor/audit/native runner: M2, M3, M5 remove
the previously retained middle-alignment algebra at the precise BlockBound
consumer, conditional on the listed primitives. Keep original graph until
replacement proof is independently checked.
-/

namespace RHPositivityRun75

-- M2, the single exact integral projector identity, at arbitrary matrix shapes.
theorem project_residual {R : Type*} [CommRing R]
    {m n i j : Type*} [Fintype m] [Fintype n] [Fintype i]
    (P : Matrix m m R) (C : Matrix m n R) (X : Matrix n j R)
    (B : Matrix m i R) (Z : Matrix i j R) (h : P * C = C) :
    P * (C * X - B * Z) = C * X - (P * B) * Z := by
  rw [Matrix.mul_sub, ← Matrix.mul_assoc, h, ← Matrix.mul_assoc]

-- M4, aggregate squared-norm budget. No individual vector coordinates needed.
theorem short_residual (a b d g r : ℝ)
    (ha : 5 * a ≤ 1) (hb : 5 * b ≤ 1) (hd : d ≤ 2 * (a + b))
    (hg : 1 ≤ g) (hr : 0 ≤ r) (hs : g ^ 2 * r ≤ d) : r < 1 := by
  have hg2 : 1 ≤ g ^ 2 := by nlinarith [sq_nonneg (g - 1)]
  have hrg : r ≤ g ^ 2 * r := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hg2) hr]
  linarith

-- Row support makes padding invisible before multiplication.
theorem supported_rows {R : Type*} [CommRing R]
    {m n j : Type*} [Fintype n]
    (L : Matrix m n R) (Y Z : Matrix n j R)
    (h : ∀ k, (∀ b, Y k b = Z k b) ∨ (∀ a, L a k = 0)) :
    L * Y = L * Z := by
  ext a b
  simp only [Matrix.mul_apply]
  apply Finset.sum_congr rfl
  intro k _
  rcases h k with hrow | hzero
  · rw [hrow b]
  · simp [hzero a]

-- M5 in padded coordinates: reconstruct without another inverse or norm.
theorem reconstruct {R : Type*} [CommRing R]
    {m n j : Type*} [Fintype n]
    (g : R) (L mu : Matrix m n R) (Y Z : Matrix n j R)
    (X : Matrix m j R)
    (h : L * Y = L * Z)
    (he : X - g • (mu * Z) = g • (L * Y)) :
    X = g • ((mu + L) * Z) := by
  rw [Matrix.add_mul, smul_add, ← h, ← he]
  abel

end RHPositivityRun75

#check Filling.HasLevel.exists_frameImage_toRows₂_eq_add
#check Filling.tsum_invPowWeight_le_of_codim_le
#print axioms RHPositivityRun75.project_residual
#print axioms RHPositivityRun75.short_residual
#print axioms RHPositivityRun75.supported_rows
#print axioms RHPositivityRun75.reconstruct
#print axioms Filling.HasLevel.exists_frameImage_toRows₂_eq_add
