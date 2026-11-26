import New.Selmer.RibetElement
import New.Selmer.RowsExist
import New.Selmer.TwistForRows

/-!
# RUN51 — compact C: common row, local duality and all-block loss
26 Nov 2026. SOURCE-MATCHED human derivation; native audit/certificate
PREPARED, NOT compiled. Attribution: Levent Alpöge, Luke Sernau, Claude and
collaborators per compact upstream. Pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207; grh-compact/src; Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742; compact human
manuscript blob e0cf5402bda7772a8ab2556b61d9d67859b36630.
Peer checkpoints: d18891b2 odd-Sha, fcd5da81 character selection,
c7cde9ac comparison/trace support, c78302e2 determinant bounds,
15c60307 kernel resource audit. RUN50 prefix identity preserved.
No old-pin CountI/CountP or URT assumption used.

Actual connected source-role paths (not new kernel graph):
C integral_forms_long -> exists_isFitFamily -> exists_hasRow_auxPair ->
exists_row_for_all_twists -> IsLabelledColumn.isRow -> tame-pair span.
Fit family -> exists_mFoldTwist_selmerLengthLe -> IsRow.eventually_isBalanced
-> inClass_of_isLatticeIn and local crystalline rank formula.
denominatorLe_rowBudget -> ribet_columns -> sum_blockLoss_le ->
relLength_obeyingCocycles_le -> relIndex_dvd_of_orthogonal;
also block_defect_le_at_place -> crystalline_defect_le / tame_types_exponent.
These are complementary suppliers of the SAME denominator theorem.
The actual compact scalar A+B+C proof remains unchanged.

## 1. One row for every twist, not a different row for every form
New/Selmer/RowsExist.lean 3faeb868305f3619007179e2447907dc6109b852.
The native exists_hasRow_auxPair begins with a nonzero good form in the
given eigensystem at W_m, chooses its HC parameter and injects it into
algebraic forms. The nonzero central projection supplies a good tuple
and hence apt labels, independently of the later twist. The unramified
Hecke polynomials give the attached labelled column R; the row-type
condition on shifted jumps is checked from the actual HC parameter.
Keep these inputs, including both chosen-place primitive labels.
The native exists_row_for_all_twists then takes this ONE labelled
column and b with b(Fr) tending to tr R(g) on mostFrobeniiAt(g).
It twists R by the prescribed inverse algebraic avatar to produce T,
with the shift of jumps and tame labels checked by twist_avatar.
The parity conditions in IsApt give 2 | card n and 2 | (card r-rankDiff),
so the half-rank normalization is an integer.

For each later twist and each lift of b, compare the two normalized
Hecke polynomials at a split unramified Frobenius. The top-minus-one
coefficient of a product of monic polynomials is the SUM of the
top-minus-one coefficients (the leading coefficients multiply to 1).
Equivalently, in the reversed polynomial it is minus the derivative
at zero; (AB)'(0)=A'(0)+B'(0) when A(0)=B(0)=1.
After the native rank/character normalization, the extra factor is
the product for the one-dimensional inverse-cyclotomic powers
e=0,...,t-1, t=rankDiff. Thus the trace identity read by
DenominatorBound.hL and RibetElement.hl' is
  tr u(g) = psi(g) tr T(g) + sum_(0<=e<t) cycInv(g)^e.
For each fixed g the two sides have the same limit along mostFrobeniiAt(g);
uniqueness of limits gives the equality at g. This is not equality at
a hand-picked finite collection of primes. T is chosen BEFORE the
quantifier over twists, lift forms, and attached representations.
Actual unramified theta Hecke relation, local-global attachment,
label compatibility and Frobenius convergence are retained suppliers.

## 2. Why the primitive row block supplies integral full matrix span
New/Selmer/LabelledColumns.lean 3f0ed49bf089805f3269d5161130526dfcf1a038.
For the actual IsLabelledColumn.isRow choose a primitive chosen prime
different from ell (two distinct primes available). Its tame label
roots form the Frobenius orbit of a root xi of unity, and the native
primitive-label condition ensures the ell^u powers of any two
different conjugates remain distinct for every u>=0.
Let ord(xi)=ell^u k with (ell,k)=1. If two powers have the same
reduction, the ratio of their ell^u powers is a k-th root reducing to
1. The polynomial X^k-1 has simple roots in the residue field;
the only such lift is 1 (or factor z^k-1=(z-1)(1+...+z^(k-1)),
second factor a unit at z=1). This contradicts the primitive
separation. Consequently the difference of every two orbit
eigenvalues is a unit. Over a sufficiently large coefficient DVR
containing the roots, the spectral idempotents of the tame generator
are integral polynomials:
  E_i = product_(j != i) (A-lambda_j I)/(lambda_i-lambda_j).
Distinct eigenvalues and the rank-degree equality give rank-one
summands. Frobenius permutes the summands transitively by the tame
relation; powers of its invertible matrix identify their integral
rank-one lattices. In bases transported along this orbit,
E_i F^k E_j is a matrix unit times a unit whenever F^k takes j to i.
Hence the O-span of group matrices is the entire matrix algebra,
not merely irreducibility after extending scalars. This is the
mathematical content of span_eq_top_of_tame_pair used in IsRow.
The separate primitive scalar-inertia estimate and the bound on
det(u(sigma)-1) use the same labels; retain their native order and
degree guards. Do not infer that a generic labelled column has full span.

For local tame defect, RowBalanced.isTameType_of_roots applies when
at most N inertia roots each satisfy y^(ell^a-1)=1 for some 1<=a<=r.
Take L=lcm(1,...,r); then each root satisfies y^(ell^L-1)=1.
Each lies in an unramified extension of degree <=r (Teichmuller
lifting of the corresponding finite field), so the product of
their monic minimal polynomials over Z_ell has degree <=Nr and
annihilates every root. This supplies BOTH required polynomial
conditions, not just an upper bound for the number of roots.
The input multiset comes from LabelledColumns.exists_inertia_eigenvalues
and the relevant local case in sum_blockLoss_le.

## 3. Local duality bounds torsion loss; why no lifting assumption is needed
New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444.
Lib/ClassField/LocalDuality/CrystallineDuality.lean
85cabaf4fb3b68704ccdc040c34a6b4339ca9cc1.
Let L be the local block lattice, q:L -> L/ell^m L, H the
native cupOrthogonal of the class of lattices with the specified
jump windows and inertia polynomials, and A the reduction of
Z_f(L) (crystalline integral cocycles). The native torsion
obeyingCocycles restrict to a subgroup S in Z^1(L/ell^m L).
They need not themselves lift to Z_f(L). Instead the graph
subrepresentation theorem gives a lattice Y inside a finite
direct sum of the given columns and a map t:Y -> L/ell^m L
equivariant mod ell^m, so a restricted torsion cocycle is t(z)
for z in Z_f(Y). Joint injectivity and the column local conditions
put Y in the same InClass. Lift t O-linearly to p:Y -> L by
projectivity, not necessarily equivariantly. Equivariance of t
makes the map
  (g.p-p)/ell^m
integral for every g. Under the perfect Tate pairing it is the
divided coboundary of the form (y,l') -> <p(y),l'>.
This is precisely the witness used in the definition of
cupOrthogonal in the native local duality proof. It makes the
cup product of the reduction with every element of H a boundary.
A itself has the same orthogonality by the crystalline condition.
The local index divisibility theorem for the open completion
embedding into the local absolute Galois group gives
  [S:S intersect A] divides [Z_f(L^vee(1)):Z_f(L^vee(1)) intersect H].
Apply the ell-primary length bound, and pull back through local
restriction; the image of the original crystalline relations
contains the reduction of the actual crystalline cocycles as in
relLength_obeyingCocycles_le. This proves the needed *inequality*
at the native interface, not equality or unconditional perfectness
of the local quotient. The graph-subrepresentation theorem,
cupOrthogonal definition, perfect pairing over Z_ell and local
Tate duality are retained dependencies. For the pairing, the
Z_ell-dual of the coefficient DVR is a torsion-free rank-one
module over that DVR, so a generator identifies the O-dual with
the Z_ell-dual via composition. No integral equivariant lift
is assumed.

## 4. From local exponents to the actual all-block bound
New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650:
rank_O Z_f(L)=rank_O L + sum over the relevant embeddings of
the number of negative jumps. At a local place of degree d,
this is <= (1+d) rank L <= 2d rank L. This follows by counting
negative jumps among all jumps with multiplicity. If
ell^k Z_f(L) is in H, the quotient is a quotient of
Z_f(L)/ell^k Z_f(L), whose normalized length is k rank Z_f(L).
Thus the local defect is <=2dk rank L; the proof uses length
monotonicity, not any assumed control on torsion Selmer classes.

New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a;
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79.
The native block_defect_le_at_place supplies the stronger
d_v * rank(L_i) * (loss_ell/x_i) with x_none=1,
x_some=D.t, i indexed by Option(Fin t), t<=D.t. The tame branch
uses the just-described two-polynomial type and tame_types_exponent;
the crystalline branch uses the signed jump windows, Kummer chart
and crystalline_defect_le. Its three subcases (ell<=Q; lambdaLoss
>=h^3; else few_low_jumps) retain all numerical and embedding
spacing guards. Do NOT treat the generic rank estimate as a proof
of these exponents. Their actual exponent suppliers remain to
be reconstructed.

New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18,
sum_blockLoss_le: the common block diagonalization of u_pi induces
the local class of each block as a subrepresentation of the same
column. Apply relLength_iInf_le to combine the local relations
and the just-derived local duality inequality to each block.
For rank r>=1 and each place v above ell, summing the one row
and t rank-one cyclotomic blocks (all with divisor D.t>=t) gives
  sum_i loss(v,i) <= d_v*(r+1)*loss_ell.
If the native division is natural/floored, replacing it by
real division only weakens the upper bound. In particular it
does not require D.t=t. The native completion embedding count
gives sum_v d_v <= 2f. Therefore
  sum_i normLength(blockLoss_i)
    <= 2f(r+1)loss_ell <= 4rf loss_ell.
This is the exact original coefficient in rowBudget, not a
new asymptotic estimate. It holds for EVERY block modulus M_i
and all sufficiently large coefficient rings in the native
eventual statement. The common lattice and local class must
precede this summation.

## 5. Actual consumers and remaining balanced-row supplier
RowBalanced.IsRow.eventually_isBalanced chooses the lattice
using the row span and scalar inertia above. Its local-condition
length estimate uses the crystalline rank formula above ell,
the tame local cocycle estimate elsewhere, and the determinant
kernel bound: for a square matrix with nonzero determinant over
a DVR, Smith normal form gives a kernel on O/ell^m of length
sum_j min(v(a_j),v(ell^m)) <= sum_j v(a_j)=v(det A).
Conjugate-self-duality plus the full matrix span identifies the
mirror scalar from the trace against every group matrix. On
inertia the cyclotomic character is trivial, so the reflected
scalar is the same; retain the general cyclotomic factor
outside inertia. The scalar order and jump-count bounds are
required for all IsBalanced clauses. Its native conclusion is
normLength(beta + sum_(b:Bool) addVal det(u(sigma_b)-1))
 <= 10 f r crudeUnit_ell.
This paragraph reconstructs the local length/determinant
mechanism, NOT all mirror and scalar-order clauses of IsBalanced.

TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d:
for the finite indexed rows choose ONE sufficiently large O by
eventual_all and a single common chosen place w off ell.
exists_anticyclotomic_twist takes the balanced row budgets and
the finitely many integral Hecke-value families, returns one
character for ALL rows and every power 1<=n<=m. It adds
eta=crudeUnit to the row bound, yielding (10 f r+1)crudeUnit,
and 8c+eta<=9crudeUnit for the Hecke value losses. The same
twist is used in denominatorLe_rowBudget, with
M=floor(D.r*rowBudget)+1; Ribet uses the independent
4rf loss term proved above, plus the actual triangle and
odd-Sha estimates. The sum over primes in FitTwistsExist remains
the original one. No assumption that separate optimal twists
can be combined. The exact IsBalanced mirror detection clauses,
tied-prime shortening and exponent suppliers are still essential.

## Verification / graph ledger
Actual connector checks: 36 assertions (8 pinned source blobs and
28 named anchors). V8 exact BigInt arithmetic: 22,464 cases for
r,t,f in [1,12], loss in [0,12], d=2f; tested floored all-block
budget <=d(r+1)loss<=4rf loss. This is ONLY a regression for the
scalar assembly, not a local Galois calculation or proof by tests.
Original old-pin CI jobs 45577239749 and 45576756833 both retrieved,
all jobs success. Compact run 45781154005 actual status.json blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563 is error RESOURCE_BLOCKED
before compilation. Local command -v lean/lake/elan returned none.
Do not infer compact native PASS from outer workflow success.
No new native engine execution, axiom evidence, or graph-edge
deletion. Original and compact graphs unchanged, shared runner
only, no protected workflow edits. The certificate below checks
the local scalar mathematics with actual native modules imported,
and prints actual supplier axiom commands for future replay; it
is not a substitute for the native caller proof.

RESUME HERE: reconstruct the remaining IsBalanced mirror and
scalar-order clauses at RowBalanced, then the actual
TiltingLemma.length_le_of_unseen_class and TwistTheorem.exists_isPencil
induction together with the local exponent supplier proofs
(tame_types_exponent, scaledCupBounds_sparse_thick,
scaledCupBounds_two_sizes, few_low_jumps). Integrate Sections
1-4 into C with the existing odd-Sha and prefix-cancellation
results. On capable compact runner elaborate the certificate,
audit actual supplier axioms/roles and compare the same-context
caller, never import Main or the RH theorem. HANDOFF TO:
mathematics C, character boxes, audit, integration, human editor,
compact kernel. Human reconstruction remains incomplete;
external formal certification is separate.
-/

namespace CompactGaloisRun51

theorem row_string_budget {t : ℕ} (ht : 0 < t)
    (r a L row : ℝ) (d : Fin t → ℝ)
    (hrow : row ≤ r * a * L)
    (hstring : ∀ i, d i ≤ a * L / (t : ℝ)) :
    row + ∑ i, d i ≤ (r + 1) * a * L := by
  have ht' : (t : ℝ) ≠ 0 := by exact_mod_cast ht.ne'
  have hs : (∑ i, d i) ≤ a * L := by
    calc
      (∑ i, d i) ≤ ∑ _ : Fin t, a * L / (t : ℝ) :=
        Finset.sum_le_sum fun i _ => hstring i
      _ = a * L := by
        simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin,
          nsmul_eq_mul]
        field_simp
  calc
    row + ∑ i, d i ≤ r * a * L + a * L := add_le_add hrow hs
    _ = (r + 1) * a * L := by ring

theorem all_places_budget {V : Type*} [Fintype V]
    (r f L : ℝ) (a d : V → ℝ)
    (hr : 1 ≤ r) (hf : 0 ≤ f) (hL : 0 ≤ L)
    (ha : (∑ v, a v) ≤ 2 * f)
    (hd : ∀ v, d v ≤ (r + 1) * a v * L) :
    (∑ v, d v) ≤ 4 * r * f * L := by
  have hpos : 0 ≤ r + 1 := by linarith
  calc
    (∑ v, d v) ≤ ∑ v, (r + 1) * a v * L :=
      Finset.sum_le_sum fun v _ => hd v
    _ = (r + 1) * (∑ v, a v) * L := by
      rw [Finset.sum_mul, ← Finset.mul_sum]
    _ ≤ (r + 1) * (2 * f) * L :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left ha hpos) hL
    _ ≤ 4 * r * f * L := by
      apply mul_le_mul_of_nonneg_right _ hL
      nlinarith [mul_nonneg (sub_nonneg.mpr hr) hf]

#print axioms row_string_budget
#print axioms all_places_budget

end CompactGaloisRun51

#print axioms exists_row_for_all_twists
#print axioms IsLabelledColumn.isRow
#print axioms isTameType_of_roots
#print axioms relLength_obeyingCocycles_le
#print axioms normLength_defect_le
#print axioms block_defect_le_at_place
#print axioms sum_blockLoss_le
#print axioms IsRow.eventually_isBalanced
#print axioms exists_mFoldTwist_selmerLengthLe
