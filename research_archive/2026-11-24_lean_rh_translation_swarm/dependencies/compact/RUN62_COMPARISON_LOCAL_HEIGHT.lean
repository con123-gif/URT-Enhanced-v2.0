import New.Rows.LiftVolumeHeight
import Mathlib.Tactic

/-!
# RUN62 — integral dual coordinates and local determinant at the C caller
26 November 2026. HUMAN SOURCE-MATCHED; scalar certificates prepared, not
compiled. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion-first.
Predecessor 5c2a8c47 (RUN61 archimedean). Read AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE and current manuscript; peer a31e6385 global theta, 5a6ce275
marked jet, ea889f2b Schur dual (A), aa47d592 B split count. This addresses
C local comparison, not the A factorial estimate or the arithmetic proof
of DenominatorLe.

Native sources (actual bodies):
* New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1,
  norm_det_compressedGramOp_padic_le and heightLe_liftVolume_ratio.
* Lib/GLn/SchurModule/Gram.lean 8fe5056636a40d11e2d287f94fbd8ae2cfc03c57,
  fockPairing_toPoly_nablaBasis, weylGram_mul_fockPairing.
* Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
  map_nablaBasis_eq_mul_weylEval.
* Lib/General/LinearAlgebra/CommonEigenvectors.lean
  681596f77b313c9d195bc6ab4dab3c2442c23665, exists_auerbach.
* Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33,
  exists_mul_mem_integralAbove, weylGauge_embFin, weylGauge_le_one_iff.
* New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a,
  comparisonForm_mem_integralForms, exists_comparison_forms.
* New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825,
  DenominatorLe, IsFitFamily.
* New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518,
  HeightLe, mul, pow.
* New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88,
  liftVolume; New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84,
  heightLe_inv_ratio, heightLe_inv_heckeValueProd_div.
* New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d,
  eSign, heckeCount, linePair, heckeValueProd.
* New/Exchange/TriangleLevelExponent.lean e1b3a17423c1f003c1d5311ef484638973750ac4,
  IsFitFamily.heightLe_of_eq_zpow_mul.

## 1. Integral scaled dual, no inversion of the hook number in the valuation ring

Use the actual table summands and Weyl basis; b_i are integral standard
minor products, C_ij = Fischer(b_i,b_j) in Z and G is the integral
symmetric Weyl Gram matrix. Let H=smallHookNumber>0. The source has
Fischer(toPoly(v),b_i)=H v_i and toPoly(v)=sum_j (Gv)_j b_j.
Expanding gives C G=H I, and transposing gives G C=H I. Thus the C columns
are scaled dual vectors. In particular they remain integral even at
primes dividing H, unlike the genuine dual vectors C_i/H.

For the first pairing identity, the native proof evaluates the polynomial
kernel at the standard permutation array w. Under scaling a single row
by 2, the Fischer pairing with a tableau vanishes unless its row weight
equals the highest row weight (distinct powers of 2). For such a tableau,
the prefix-count inequalities force every entry in a column of height h
to belong to the first h rows: otherwise that column contributes fewer
than h to the first-h count, whereas all columns contribute at most
min(height,h). Equality in the total prefix count is forced by the highest
weight. The corresponding minors are the leading minors up to their
ordering signs, so the pairing with the highest polynomial is H times
b_i(w). Transport from w to the general array y by its square-part
matrix, using transpose adjointness of row substitution for the Fischer
product, gives Fischer(K_y,b_i)=H b_i(y). Evaluation vectors span:
a linear relation vanishing on all arrays is a polynomial relation
among the independent b_i. Hence Fischer(toPoly(v),b_i)=H v_i.
This uses the native integral standard-basis theorem, kernel identity,
and Fischer covariance; these are retained, not inferred from a norm.

## 2. Same local class representatives for every embedding at l

Fix the actual PrimePadicIso iota above l and L=range(goodLift at the
chosen twist). Write g=gl, d=dim L, with g*|L injective and g g* L tested.
For each small class c choose delta_c rational unitary with
embFin(delta_c)c.out integral above l, by weak approximation in the
open subgroup of integral invertible matrices above l. The source uses
the identity as the second conjugation datum. This choice is independent
of the p-adic embedding phi above l. The gauge obeys
gauge_c(v)=gauge_(delta_c c)(W(delta_c)v), and the latter is just the
maximum of the absolute values of the transformed coordinates, because
both an integral invertible matrix and its inverse act integrally.
Here W is the actual weight representation of determinant exponent 0.

For a table-block and coordinate label a=(b,i), define f_a supported
only at b, with value star(W(delta_c)^(-1) C_i).
Under phi composed with conjugation the gauge of star(f_a) equals the
coordinate gauge of C_i, <=1 for EVERY phi above l. This verifies the
all-embeddings hypothesis for g f_a in comparisonForm_mem_integralForms,
using the actual coprimality of the fit twist. It does not assert g f_a
integral at primes dividing the twist level.

The exact native Y follows by Gram transport:
  <f_(b,i),zeta> = H conjugate([W(delta_c) star(zeta_b)]_i).
Indeed <f,zeta>=gramForm(star f,zeta); move W(delta_c)^(-1) across
the bilinear Gram form by the unitary weight-representation identity
(gramForm_map_weightRep), and then use G C=H I and symmetry.
Conjugation is inside this expression, not moved across the p-adic
embedding. Thus the linear functionals
ell_a(z)=<f_a,g* z>, z in L, have zero common kernel: H nonzero,
each W invertible, and g* injective. The H factor must be retained.

## 3. Maximal determinant selects exactly the tested integral family

Fix any basis of L. Choose d functionals ell_(a_i) whose coordinate-row
determinant has maximal iota-adic absolute value among all d-tuples of
labels. The maximum exists (finite label set) and is positive since
the functionals separate L. Use the dual basis z_j to these selected
functionals, ell_(a_i)(z_j)=delta_ij. Replacing row j in the maximizing
matrix by any ell_a changes the determinant by the factor ell_a(z_j)
(Cramer's rule, or multilinearity in the chosen dual coordinates).
Therefore |iota ell_a(z_j)|<=1 for ALL a,j. The extension of iota to
the completed p-adic field preserves the norm. For d=0 the empty basis
and empty determinant give 1, and the same conclusion is immediate.

Apply Y, with phi the embedding induced by iota: the transformed
coordinates of star(H g* z_j) have norm <=1 at phi composed with star.
Consequently y'_j=g(H g* z_j) is integral at this phi, and is tested
by the native tst(H z_j), since g* is complex-linear. Independently
y_i=g f_(a_i) is integral at all phi above l by section 2. This is the
asymmetric pair required by DenominatorLe; neither a single-embedding
first family nor all-embeddings second family should be substituted.

Let M=H pr_L g g*|L. Then, BEFORE taking any norms,
  <y_i,pr_L y'_j> = <f_(a_i),g* M z_j>
                   = ell_(a_i)(M z_j) = [M]_z(i,j).
Thus its determinant is exactly det(M), with no extra denominator,
hook power or change of basis determinant. Apply the retained actual
DenominatorLe iota e0 L beta_l, with d=rowDim and ambient rank r:
  |iota det(M)| <= exp(d r beta_l).
This is the local output norm_det_compressedGramOp_padic_le at the
actual consumer, derived without invoking that theorem as a premise.
In particular a prime dividing H incurs NO additional hook loss.

## 4. Join the local and archimedean estimates using one witness

For every twist use the same A from exists_comparison_forms:
u_theta* g_theta=gamma_theta A with A surjective, gamma_theta nonzero,
u_theta injective. Thus g_theta* u_theta=conj(gamma_theta) A*.
The actual tested property g_theta A* y passes to g_theta g_theta* L
by scalar multiplication of y, using this identity. The same adjoint
identity gives the determinant volume identity (native det_compressedGramOp):
  lambda_theta D_theta = H^d |gamma_theta|^(2d) normDet(A*)^2,
  D_theta=det(M_theta), lambda_theta=normDet(u_theta)^2>0.
The RHS is nonzero (A* injective); this proves D_theta nonzero and
g_theta*|L injective (otherwise M_theta has a kernel).
Divide ONLY these exact nonzero identities, using
|gamma_theta/gamma_1|^2=Gamma_theta/Gamma_1, where Gamma=heckeValueProd:
  lambda_1/lambda_theta=(D_theta/D_1)(Gamma_1/Gamma_theta)^d.
No extra independently chosen comparison witness is allowed.

HeightLe of the determinant ratio has witness D_1, archimedean exponent
2drB0 from RUN61, finite exponents dr beta_l from section 3. Since for
every finite prime set sum beta_l<=B0 from IsFitFamily, its height is
<=3drB0. This step does not use the unproved uniform Selmer estimate
in disguise: that estimate is precisely the retained fit-family input.

For the remaining Hecke factor the native product uses k/2 rank-one
positions and 7m/2+m+m/2=5m ramified positions, because k,m are even.
The first positions are above 7m/2 in the none line; the other positions
are the initial none line and the two signed lines. The square of the
product doubles these counts. The native lValueProd_eq local level
factor is a power of levelNorm; its norm is 1 at iota by the actual
coprimality. Thus the height of the inverse Gamma ratio is bounded by
  k(6B0-dirCost)+10m x^999,
conditional on heightLe_inv_ratio and the ramified fit-family bounds.
These counts explain the exact native heightLe_inv_heckeValueProd_div
budget, not a proof of the rank-one analytic or arithmetic supplier.

Add the heights and use the native scale guard
3rB0+6kB0+10m x^999 <= k log(b) B0.
For instance r=k+m-1<=2k, m<=k, x^999<=B0, log b>=22 suffice,
all much weaker than the actual Data.scale and magnitude instances.
The result is the actual caller output
  HeightLe [d k(log(b) B0-dirCost)] (lambda_1/lambda_theta).
The volume identity and exact local coordinate determinant are shared
between all twists; only the permitted fit-family data vary with iota.

## Dependency ledger and verification

Original source-visible graph (not elaborated):
heightLe_liftVolume_ratio -> exists_comparison_forms,
det_compressedGramOp, adjoint_comp_eq_conj_smul,
norm_det_compressedGramOp_arch_le, norm_det_compressedGramOp_padic_le,
heightLe_inv_heckeValueProd_div, HeightLe.mul/pow, fit-family.
Local branch -> exists_auerbach, weylGram_mul_fockPairing,
gramForm_map_weightRep, exists_mul_mem_integralAbove,
weylGauge_embFin/le_one_iff, comparison integral/tested, DenominatorLe.
Reduced human graph shares H,C,delta,f,ell and selected z for each actual
(pin,D,j,theta,iota,L,g,table Gram). It replaces the local determinant
conversion by the coordinate identity above, retaining all its supplier
premises. No global edge deleted, original graphs and axiom ledger
preserved. Not a kernel term extraction; no new axioms asserted.
Lean/Lake unavailable on PATH, old-pin rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier not run on compact toolchain. Prepared
certificates below; independent replay needed.
Retrieved actual CI run 45803534769 jobs and current state artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804. Six native declarations
in TiltingLemma and Filling.Moments checked with standard axioms; module
1 build timeout 2700s, all_requested_checks_ok=false. Not verification
of these new certificates, no new root discharge.
No synthetic diagnostics or unverified claims of PASS.

RESUME HERE: New/Rows/HeckeValueHeight.lean heightLe_inv_ratio,
especially exists_test_form_inner_kernelForm and its exact rank-one
K inequality, forcedPart and integral test construction; coordinate
with C arithmetic and existing CM period work. Retain DenominatorLe,
finite-class approximation, and primitive comparison detection inputs.
HANDOFF TO integration/editor/audit/kernel; keep original and compact
graphs separate. Current predecessor SHA 5c2a8c47ca7e153f05084f45120c862898f8e351.
-/

namespace CompactDependencyRun62

theorem coordinate_det {n : Type*} [Fintype n] [DecidableEq n]
    (A B : Matrix n n ℂ) (h : ∀ i j, A i j = B i j) :
    A.det = B.det := by
  have e : A = B := Matrix.ext h
  rw [e]

theorem exact_volume_ratio (l1 lt D1 Dt G1 Gt K : ℂ)
    (hl1 : l1 ≠ 0) (hDt : Dt ≠ 0) (hG1 : G1 ≠ 0)
    (hGt : Gt ≠ 0) (hD1 : D1 ≠ 0) (hlt : lt ≠ 0)
    (h1 : l1 * D1 = K * G1) (ht : lt * Dt = K * Gt) :
    l1 / lt = (Dt / D1) * (G1 / Gt) := by
  field_simp [hlt, hD1, hGt]
  calc
    l1 * (D1 * Gt) = (l1 * D1) * Gt := by ring
    _ = (K * G1) * Gt := by rw [h1]
    _ = (K * Gt) * G1 := by ring
    _ = (lt * Dt) * G1 := by rw [ht]
    _ = Dt * G1 * lt := by ring

theorem height_budget (r k m X B b : ℝ)
    (hk : 0 ≤ k) (hB : 0 ≤ B) (hm : 0 ≤ m)
    (hr : r ≤ 2*k) (hmk : m ≤ k) (hX : X ≤ B)
    (hb : 22 ≤ b) :
    3*r*B + 6*k*B + 10*m*X ≤ k*b*B := by
  have h1 := mul_le_mul_of_nonneg_right hr hB
  have h2 := mul_le_mul_of_nonneg_left hX hm
  have h3 := mul_le_mul_of_nonneg_right hmk hB
  have h4 := mul_le_mul_of_nonneg_right hb (mul_nonneg hk hB)
  nlinarith

end CompactDependencyRun62

#check exists_auerbach
#check weylGram_mul_fockPairing
#check Data.norm_det_compressedGramOp_padic_le
#check Data.heightLe_liftVolume_ratio
#print axioms CompactDependencyRun62.coordinate_det
#print axioms CompactDependencyRun62.exact_volume_ratio
#print axioms CompactDependencyRun62.height_budget
