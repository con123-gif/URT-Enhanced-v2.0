import Lib.GLn.Branching.Branching
import New.Seesaw.LiftCharacters
import Mathlib.Tactic

/-!
# RUN44 — integral branching coefficient construction (2026-11-27)
Status HUMAN SOURCE-MATCHED, prepared native probes, no new native PASS.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(main independently checked unchanged); Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Original pin and native
reduction engines are a separate namespace. Credit Alpöge, Sernau,
Anthropic collaborators and Claude for the original formal argument.
Mission latest read (completion-first); head 5ddf30c736, integration
RUN71 d0a3d115 and editor RUN70 5ddf30c7 reviewed; follow RUN43 83de56e3.
No URT premise, no claimed RH imported.

Source anchors relative to grh-compact/src:
- Lib/GLn/Branching/BranchingVector.lean aafa94d0795e07118c3133817e4afa4ec795c93b
  lines 67–72, 82–124, 168–202: exists_toPoly_eq_hookNumber_smul,
  comulMatrix_isometry_and_equivariant, hasLeftInv_comulMatrix,
  exists_smul_weylKernel_mul_eq_toPoly.
- Lib/GLn/SchurModule/Gram.lean 8fe5056636a40d11e2d287f94fbd8ae2cfc03c57
  lines 135–186: fockPairing_toPoly_nablaBasis, weylGram_mul_fockPairing,
  toPoly_injective, weylGram_posDef.
- Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f
  lines 31–40, 65–76, 105–120: sum_tableauWeight_le,
  map_nablaBasis_eq_mul_weylEval, hookNumber_pos, hookNumber_le.
- Lib/GLn/Branching/Branching.lean 669d2de08c3fa16386120153629ca6cde94e5dde
  lines 172–222, 230–276: exists_int_branching_of_weylKernel,
  exists_branching_matrix.
- New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65
  Data.branching -> New/Seesaw/LiftCharacters.lean
  db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45, Data.GaugeLe.restrictToY_of_diag
  and Data.weylNormSq_restrictToY_le -> actual A local callers (RUN43).

## 1. Only the high columns need a hook denominator

Use notation of BranchingVector.exists_smul_weylKernel_mul_eq_toPoly:
kappa0=gamma+kappa' in positive heights below rank, kappa'(h)=0
for h<q, and rowPos(a)<=f(a)+1. Define beta as gamma restricted to
0<h<min(q,n), alpha=kappa0-beta. Heights outside 0<h<n do not
contribute to the polynomial or diagram. Thus alpha has no positive
heights below q, and its total box count d<=L, the actual high-column
sum in the caller. Set P=K_gamma(f) K_kappa'(rowPos)=K_beta(f) F,
where F is the product of the remaining minor powers. All coefficients
are integral. Write T_delta for toPoly (coefficient map G_delta),
and e_beta for the evaluation at permArray f. T_beta e_beta=K_beta(f).

Let C be the integral Cartan matrix for beta,alpha. It has an integral
left inverse J, and C^T(G_beta tensor G_alpha) C=G_kappa0.
These are the actual source lemmas, not merely complex representation
theory. Over Q the positive definite integral Gram matrix is invertible
(det nonzero over C implies det nonzero over Q), so choose z rational
with T_kappa0 z=P. The standard basis theorem ensures P is in the
weight space. This rational route avoids first clearing the hook of the
entire kappa0, as the native proof does, then cancelling it later.

The diagonal row action on z has the weight of P, by equivariance
and injectivity of T. The action on C z has the same weight. For each
row a with lambda_beta(f(a))>0, some beta column has height h<q
and f(a)<h. Then rowPos(a)<=f(a)+1<=h<q. Every column of F has
height at least q and therefore contains a in its respective row
order (f for gamma, rowPos for kappa'). Its row degree is the number
of alpha columns at that place, the maximal possible alpha degree
in a row. Consequently every nonzero coefficient (i,j) of C z has

   wt_i(a)+wt_j(a)=lambda_beta(f(a))+max_alpha(a).

The tableau singleton bound wt_j(a)<=max_alpha(a) forces
wt_i(a)>=lambda_beta(f(a)). If lambda_beta(f(a))=0 the latter
holds automatically. This applies to every row and place separately.
For each fixed j, apply the native extremal weight lemma
map_nablaBasis_eq_mul_weylEval to the functional whose values on
the beta basis are the j-th slice of C z. Hence C z=e_beta tensor u
for a rational vector u. This uses the actual cyclic row order
condition; it is not true for a general arbitrary row permutation.

Using Gram isometry and the coefficient multiplication rule gives
T_kappa0 z=T_beta(e_beta) T_alpha(u). Cancel the nonzero K_beta(f)
(it evaluates to 1 at permArray f) in the rational polynomial domain:
T_alpha(u)=F. Let H=hookNumber(alpha). The integral Fock pairing
identity gives H u_j=<F,b_j>_Fischer in Z for each j. Therefore

     H z=J (e_beta tensor (<F,b_j>_Fischer)_j) in Z^I.

Set eta=H z, an integral vector. Then T_kappa0 eta=H P. This is
the desired EXACT native conclusion, with the same c=H as in the
source and no extra denominator, no integrality assumption on z or u,
and no inversion of the integral Cartan lattice. Rational Gram
invertibility is justified above. This argument works even at q=0
(beta trivial) or q>=rank (alpha trivial). It uses standard basis,
Fischer pairing and Cartan left inverse; those supplier nodes remain.

## 2. Hook bound, all boundary cases

The native H is the Fischer squared norm of the product Q of leading
minors of shape alpha. In the monomial expansion Q=sum a_m X^m,
H=sum a_m^2 prod m_i!. If d=0, Q=1, H=1 (including L=0, 0^0=1).
Otherwise every monomial has total degree d, so prod m_i!<=d!.
The sum of absolute coefficients is bounded by the product of
h! over all columns: expand each determinant before applying the
triangle inequality, retaining its signed terms. The product of
column factorials is at most d! by the multinomial integer.
Therefore H<=d! (sum |a_m|)^2 <= (d!)^3 <= L^(3L) when 1<=d<=L.
H>0 since Q evaluates to 1 at the identity array. This is precisely
the source sufficient bound, not an unneeded optimization of constants.

## 3. Integer matrix construction, not rational interpolation

Use exact K and L of Branching.lean:179–181:
K(x,y)=eval_y rowSubst(diag(squarePart(x)^T,1), branchVector).
L(theta)=detPow(x) T_kappa0(theta), with the determinant factor
of kappa'(n) at each place. For the source y array with all added
row entries after column 0 zero, Laplace expansion along the added
row and the hypothesis T eta=c P give

     c K(x,y)=L(theta(y))(x),

where theta(y) is the integral polynomial vector obtained by applying
the target Schur matrix to eta at the retained n-by-n block, times
the determinant twist via G (line 186) and the product of added-row
first entries to sum_h gamma(h+1). The determinant twist belongs
inside L's covariance, exactly as in the native R proof; no inverses
are introduced. This identity holds over polynomial coefficient rings.

For arbitrary indeterminate y, write t_tau=y_added,0. On each
block replace column j>0 by t_tau col_j-y_added,j col_0 and col_0
by t_tau col_0. This is the native Borel column operation (line 201);
the transformed added row has all entries j>0 zero. The diagonal
of the column operation is t_tau, so semi-invariance (Z, line 184)
multiplies K by a monomial in the t_tau (exponent equal to the sum
of the diagram weights at that place, i.e. total box count). Hence
for a monomial M(y) with coefficient 1, M(y)cK(x,y) lies coefficient
by coefficient in the image of L over Z. Shift coefficients back
by the exponent of M: for each delta,
[M y^delta](M cK)=[y^delta](cK).
Thus cK itself has every y-coefficient in im(L_Z). This requires
neither t_tau nonzero nor inversion of t_tau; the zero locus is
included by the polynomial identity.

Expand cK in the standard integral minor basis in y (native
nabla_le_span_nablaBasis_mul_detPow, det exponent zero). Apply
the native coord_mem_of_coeff_mem to the additive subgroup im L_Z
and this expansion. It gives an integral preimage B_i for each
basis coefficient (this coordinate lemma and its standard-basis
hypotheses retained; not an assertion about arbitrary linearly
independent integer polynomials). Put these columns into one
integer matrix B. Then, for every commutative ring by base change,

     L(B ev_y)(x)=c K(x,y).

Evaluating x at its identity permutation array removes detPow
and identifies the row ev_x^T G_target B with the coefficients
of c branchVector. This is exactly the source first conclusion.
The second conclusion follows by applying row substitutions on
both sides, using K's covariance and L's covariance G: for block
diag(g,s) the added-row degree gives s^sum gamma(h+1), the
target determinant degree gives det(g)^kappa'(n).
For every characteristic-zero field, cancel detPow (nonzero
polynomial) and use T injectivity to compare vectors. Evaluation
vectors span by ext_weylEval, giving the full matrix intertwiner.
The original field, rank, exponent and integral-witness conditions
are all retained. No claim that the coefficient argument is valid
with a basis lacking the source coordinate-membership lemma.

## 4. Actual consumer and multiplicity-one reduction

Apply the above to the source shifted gamma and cyclic row
permutation in exists_branching_matrix (lines 238–241).
The source proves rowPos<=f+1 for that permutation; no new
hypothesis. Adding determinant twists gives the exact RUN43
intertwining identity and c<=L^(3L), hence its Gram norm bound.

For completeness, the remaining uniqueness step of that theorem
can be read as a scalar evaluation argument. On polynomial
intertwiners T for the untwisted block action (including the target
determinant factor), let x=G_target ev_identity and v be the
native cyclic lower-triangular vector. For a lower triangular g,
x^T S_target(g) is a scalar times x^T by the highest-weight
identity. If x^T T v=0, intertwining gives x^T T S_source(block(g,1))v=0
for all lower triangular g, including singular ones because the
relation is polynomial. The source cyclic-vector lemma then
forces x^T T=0. Transpose the relation, and use the Gram adjoint
identity to propagate this vanishing to the target orbit of the
identity evaluation vector. Its orbit spans, so T=0. Thus the
linear functional T->x^T T v is injective on intertwiners.
A unitary intertwiner extends to polynomial intertwiners by the
actual native Zariski density lemma after removing the determinant
twists on invertible g. The B just constructed is nonzero because
c>0 and its branchVector polynomial is a nonzero product of
minor powers. Consequently its scalar evaluation is nonzero,
and every unitary intertwiner T equals
(x^T T v)/(x^T B v) times B. This division is now justified.
Retain the actual cyclic-vector, Gram, density and spanning
suppliers; they are not deduced merely from the branching label.
Data.branching uses this exact existence package; no substitution
of a separately chosen nonintegral witness. RUN43's local unit
cancellation and archimedean bound then apply to the same B.

## Evidence / original and reduced DAG

Original source path from star_inequality via short_forms and
LocalStatement norm/local-index branches to Data.branching:
exists_branching_matrix -> exists_int_branching_of_weylKernel ->
exists_smul_weylKernel_mul_eq_toPoly -> hookNumber_le, Gram/Fock,
Cartan, weight and coefficient lemmas. The separate uniqueness
branch retains cyclic_lower_triangular, zariski_dense_unitary,
ext_schur_weylEval and weylGram_mul_schur. Reduced human argument
uses one rational preimage, extremal weight support, exact factor
cancellation, integral left inverse and one polynomial monomial
shift. Preserve original graph and all shared consumers. No
global dependency deletion or kernel-edge coverage inferred.
Cache context: compact pin, actual rank/place families, q,
kappa0/gamma/kappa', f, Cartan maps and chosen integral eta/B;
do not reuse for different weights or determinant twists.

Local command -v lean/lake gave no executable. Re-read actual
native CI output at cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json.
Six named B/C checks succeeded with propext, Classical.choice,
Quot.sound; module_1_build (A) returned 124 after 2700.11s;
all_requested_checks_ok=false and full_RH_replay=false.
Old-pin native engines not executed on compact context. No
new axioms claimed, no new replay PASS. Probes below are prepared
for shared compact runner; no protected workflows changed.
No new unconditional RH root or A closure claim.

RESUME HERE: audit rational Cartan lift and polynomial coefficient
membership at actual native caller, in particular inspect proof of
coord_mem_of_coeff_mem, then expand the still retained
exists_cyclic_lower_triangular submersion and scalar_of_commute_schur
orbit steps, or integrate exact compatible peer proofs. Run native
checks after A module cache becomes available; record actual output.
HANDOFF TO integration/editor, independent audit, shared native runner.
-/

open PolyRep

namespace KernelRun44

/-- Exact cancellation, after establishing nonvanishing of the common
polynomial factor. No norm or triangle inequality is used. -/
theorem cancel_factor {R : Type*} [CommRing R] [IsDomain R]
    (p a b : R) (hp : p ≠ 0) (h : p * a = p * b) : a = b := by
  exact mul_left_cancel₀ hp h

/-- Applying the actual integral left inverse is enough to recover
the vector; no inverse of a rectangular Cartan map is presumed. -/
theorem left_inverse_recover {X Y : Type*} (C : X → Y) (J : Y → X)
    (hJ : Function.LeftInverse J C) (z : X) (w : Y)
    (h : C z = w) : z = J w := by
  rw [← h, hJ z]

end KernelRun44

#check exists_toPoly_eq_hookNumber_smul
#check comulMatrix_isometry_and_equivariant
#check hasLeftInv_comulMatrix
#check exists_smul_weylKernel_mul_eq_toPoly
#check exists_int_branching_of_weylKernel
#check exists_branching_matrix
#check hookNumber_le
#check Data.branching
#print axioms exists_smul_weylKernel_mul_eq_toPoly
#print axioms exists_int_branching_of_weylKernel
#print axioms exists_branching_matrix
#print axioms KernelRun44.cancel_factor
#print axioms KernelRun44.left_inverse_recover
