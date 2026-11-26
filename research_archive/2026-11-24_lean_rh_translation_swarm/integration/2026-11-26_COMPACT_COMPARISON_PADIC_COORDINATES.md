# C: the exact p-adic coordinate witness for the comparison determinant

26 November 2026. HUMAN-DERIVED / SOURCE-MATCHED, independent audit and
native caller replay pending. Compact pin
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.

Consumer: `New/Rows/LiftVolumeHeight.norm_det_compressedGramOp_padic_le`.
Keep its SAME gl, L, H=smallHookNumber and tested condition. This note
derives the Auerbach/integral-coordinate bridge from the actual local
`DenominatorLe` hypothesis; it does not assume that hypothesis has been
proved by a change of coordinates. The preceding conjugate-pairing audit
supplies the separate archimedean factor of the same determinant.

## 1. One rational adjustment works above the entire rational prime

Fix ell and its finite places in F=E^+. For each small class representative
h_b choose a rational unitary delta_b with delta_b h_b integral at all
places of E above ell. This is the precise native
`exists_mul_mem_integralAbove ell h_b 1` input. It does not choose a
different delta for each complex-to-p-adic coefficient embedding.

Here is an elementary proof of the required weak approximation. On the
unitary group of a nondegenerate hermitian form, the Cayley map

    X -> (1-X)(1+X)^(-1),  X^*=-X,

is a rational chart with inverse (1-g)(1+g)^(-1). Its local image
is dense. For example multiply a given local g by central Cayley
elements (1-jt)/(1+jt), where bar j=-j and t tends to zero in F_v.
The equation det(1+g(1-jt)/(1+jt))=0 has only finitely many bad t:
over an algebraic closure its numerator is the product of the
nonzero linear polynomials (1+lambda)+jt(1-lambda). Neither coefficient
can vanish simultaneously in characteristic zero. At a split place
apply this in the two conjugate components. Thus every prescribed
open neighborhood of h_b^(-1) meets this chart.

The skew-hermitian matrices form a finite-dimensional F-vector space.
Approximate the finitely many local chart coordinates by a single
rational point of that space, coefficient by coefficient, using
number-field weak approximation (equivalently CRT after clearing
the finite denominators). Invertibility of 1+X and the required
integrality condition are open, so a sufficiently close approximation
has both. Its Cayley image is the desired delta_b. No archimedean
approximation or integrality of 1/2 at ell=2 is asserted; rational
2 is nonzero, as required by the chart. This proves the input for
every ell, including ell=2, without an isotropy assumption on the
definite small unitary group.

## 2. The integral Fock dual supplies the actual functionals

Let G be the integer Weyl Gram matrix of each small table factor,
H>0 its hook number, and F_int the integer matrix of Fischer pairings
of its minor-product basis. The exact identity is

    G F_int=H I.                                               (1)

It follows directly by pairing the kernel expansion in the minor
basis with one basis polynomial; this is
`weylGram_mul_fockPairing`. It is H times the identity, not the
identity. The same integer is used in the comparison determinant.

Let W_b be the weight-representation matrix of delta_b, and let a=(b,t)
index a table factor and a coordinate. Define f_a to be zero in all
other factors and in factor b put

    f_a=conj(W_b^(-1) F_int e_t).                              (2)

The table norm is the sum of its Weyl norms, as in Tables j. Rational
unitarity of delta_b and contravariance of G give the EXACT identity

    <f_a,zeta> = H conj((W_b conj(zeta_b))_t).                  (3)

For example substitute (2), use W_b^(-T)G=G conj(W_b), and then
F_int^T G=H I, which is the transpose of (1). Thus no inverse Gram
denominator has been silently discarded.

The gauge of conj(f_a) at h_b under any coefficient embedding phi
composed with conjugation is at most one. Indeed transport by
delta_b, which does not change the gauge, changes its coordinate
vector to the integer vector F_int e_t. At delta_b h_b, which is
integral above ell, the gauge is exactly the coordinate sup norm.
Every integer coefficient has ell-adic norm at most one, for every
phi above ell. This proves the input to comparison-form integrality
for all the f_a simultaneously.

## 3. A maximal minor gives coordinates with all rows bounded

Fix the actual field isomorphism iota from C into the p-adic algebraic
closure, and use its induced absolute value. For z in L set

    l_a(z)=<f_a,gl^* z>.

These are complex-LINEAR functionals because the Hermitian pairing
is linear in its second argument. They separate L: if all vanish,
(3), H!=0 and invertibility of every W_b imply gl^*z=0; the caller's
sep condition then gives z=0.

Let d=dim L. Choose any initial basis and form the finite matrix of
the l_a. Some d-row minor is nonzero. Select a d-row minor of maximal
nonzero iota-absolute value; the indexing set is finite, so a maximum
exists even though the valuation ring is nondiscrete. Let c_i be its
rows, and let z_j be the dual basis to these selected functionals.
Then

    l_(c_i)(z_j)=delta_ij,
    |iota(l_a(z_j))|<=1 for EVERY a,j.                          (4)

For the second assertion, replace the j-th selected row by l_a and
apply the determinant formula for a dual coordinate. Its numerator
is another candidate minor, so its absolute value is at most that
of the chosen denominator. This is the finite version of the native
`exists_auerbach`. No compactness of C, continuity of iota, or
attainment of a maximum over infinitely many coordinates is needed.
When d=0 the empty basis and determinant already give the conclusion.

## 4. Two integral families and exactly the compressed determinant

Let zeta_j=gl^*z_j. The explicit functionals (3) turn (4) into

    gauge_(iota o conj)(conj(H zeta_(j,b)),h_b)<=1
                                               for all j,b.   (5)

The equality of these bounds is worth spelling out:
iota(l_(b,t)(z_j))=iota(conj((W_b conj(H zeta_(j,b)))_t)).
Transport to delta_b h_b then identifies (5) with precisely the
gauge used by comparison-form integrality. The integer H is retained.

Define forms

    y_i=gl(f_(c_i)),
    y'_j=gl(H zeta_j)=H gl gl^* z_j.                           (6)

The first family is integral at EVERY embedding phi above ell by
section 2 and the actual comparison integrality property. The second
family is integral at iota by (5) and that same property. It is tested:
y'_j=gl gl^*(H z_j), and H z_j is still in L. Thus the two families
meet the DIFFERENT quantifiers in `DenominatorLe` exactly. Integrality
at iota alone would not suffice for the first family.

Put M=H pr_L gl gl^*|_L, with the original complex orthogonal
projection. Its matrix in the basis z_j is

    [M]_(i,j)=l_(c_i)(M z_j)
             =<gl f_(c_i),pr_L(H gl gl^* z_j)>
             =<y_i,pr_L y'_j>.                               (7)

This is equality of matrices, not only comparison of determinant
norms. Apply the standing `DenominatorLe(beta)` to the families (6):

    |iota(det M)|<=exp(d r beta),                              (8)

where r is the original row rank. This is exactly
`norm_det_compressedGramOp_padic_le`. There is no extra H^d factor:
H is already in M, in (3), and in the column family (6), while
z_j is the dual basis to those SAME functionals. Dropping H in (3)
or inserting it a second time in (7) would change the witness.

## 5. Caller, retained obligations and actual validation

Use the comparison map and tested/separation proofs from
`exists_comparison_forms`, and the prime-specific beta from the
SAME fit-family denominator assertion in `heightLe_liftVolume_ratio`.
The determinant in (8) is the same compressed Gram determinant whose
conjugates are bounded in the corrected archimedean audit. The local
basis is auxiliary and may depend on ell; the global determinant,
the maps, the row subspace and the common twist do not change.

This supplies the coordinate/dual-lattice bridge. It does not prove
`DenominatorLe` from integrality alone, nor replace the arithmetic
reciprocity, local crystalline defects, common twist, or Hecke-value
ratio estimates entering that premise.

Native bodies actually read at the fixed pin:

* `New/Rows/LiftVolumeHeight.lean`, lines 43--73,
  blob `87938141d4103b485fd5a7125721798f65f973f1`;
* `New/Selmer/FitTwists.lean`, DenominatorLe and IsTested,
  blob `c62935a73ccbef6c7fc42f45c83f111e811a5825`;
* `Lib/Adelic/CuspForms/ClassReps.lean`, weak approximation,
  gauge transport and coordinate criterion,
  blob `ae1cca5dba16666224c91ff6a90eaaec2e1e5b33`;
* `Lib/General/LinearAlgebra/CommonEigenvectors.lean`, exists_auerbach;
* `Lib/GLn/SchurModule/Gram.lean`, weylGram_mul_fockPairing;
* `New/Rows/ComparisonForms.lean`, comparisonForm_mem_integralForms,
  blob `14ef893c54f5db837ea7e4f143b2b1a444b89b5a`.

This is source-matched mathematics pending independent audit. No
Lean/Lake, numerical script, or full human-proof verification was
executed. State-branch receipts re-read at e746daab still give the
same partial compact primitive replay: six named checks with standard
axioms, A-module timeout 124, all_requested_checks_ok=false and
full_RH_replay=false. The unrelated orchestrator pass is not evidence
for this derivation.

RESUME HERE: audit (1)--(8), then connect the remaining actual
DenominatorLe producer and HeckeValueHeight.heightLe_inv_ratio with
the same fit family. Keep the primitive chart/safety, triangle and
odd-Sha proofs and their audits visible; do not redo Auerbach or
the now corrected conjugate determinant calculation.
