import New.Selmer.DenominatorBound
import Mathlib.Tactic

/-!
RUN58 — simultaneous generic normaliser and integral string transfer.
26 November 2026. Human source-matched derivation; prepared Lean probes
NOT executed. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
2eea9dc47d0e037627e4f4c1894f0bc86426454e. Predecessor RUN57
463c593d96246a873d49c149b8f23243946354a1. Current peer theta RUN58
5d295d098738d0cb1d2ca54bca302880b2ed6715 is a different A supplier.
Read mission, protocol, handoff, expansion, AGENTS/state, common
determinant contract. No URT; no change to prior source or archives.

SOURCE LEDGER (paths relative to compact src):
 New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534:
  denominatorLe_rowBudget, local cp, W, theta,z',hC,hP,he, actual
  exists_diagOp_mem_ellIntegralForms consumer.
 New/Selmer/RibetCramer.lean 6f5a4b0d00c600aaa0acdbf118da2f7dffee1e69:
  ribetNormaliser, exact finitely supported expression.
 New/Selmer/HeckeString.lean e687e4e029036374decd6f30a289c0f709212cc2:
  exists_integral_multiple_eval_one, exists_eventually_no_eigenvalue_one,
  isRoot_hecke_string, eventually_heckePoly_eq_string_mul.
 New/Selmer/TrianglePrimes.lean b827965b6067ce391e85efd83fcc919fcd75848c:
  exists_isPrimeTriangle, exact all-nu good-Frobenius hypothesis.
 New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18:
  ribet_columns, same normaliser and theta.
 New/Patching/OnePrimeTie.lean d161966411413f049b0ae5a6baee8fdd4bcc0a26:
  BaseLevel.exists_diagOp_mem_ellIntegralForms, actual p(0) divisibility.
 Lib/Adelic/CuspForms/BaseLevel.lean 8f40270007336cd115be6036dd944cebeb101787:
  Eigensystem and formsOfLevel; actual finite supported base level.
 New/Selmer/ReciprocityLaw.lean 7b82ced3dd3ff2be7eedbfa63f92f2f743093223:
  IsLaw, exists_isLaw (retained deep supplier).
 New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444:
  IsRow.eventually_isBalanced (retained).
 New/Selmer/LabelledColumns.lean 3f0ed49bf089805f3269d5161130526dfcf1a038:
  norm_pow_sub_pow_eq_one, finite-order scalar separation.

1. Exact integral characteristic polynomial and one normaliser.
Fix the SAME D,O,c,ell,theta_twist,Q0 and base level B from RUN57.
Let K=PadicAlgCl ell, A=intQpBar ell, N_x=normalisedRep O x.galRep,
x in the finite base-level eigensystem set E. For each x, the native co
supplies a continuous labelled column; eventual lattice existence
gives a single integral model of N_x over a coefficient ring.
Characteristic polynomial is invariant under conjugation and
compatible with coefficient extension. Consequently all coefficients
of char(N_x(g)) lie in A for EVERY g and i. This is exactly cp, not
an integrality assumption on the entries in the original basis.
Use the existing finite-dimensional level eigenspace decomposition
for finiteness of E; do not assert all automorphic eigensystems finite.

Define S={x in E: for all g, det(N_x(g)-I)=0}, and E_bad=E minus S.
Fix the genuine lift pi, native gamma0,g1^-1,y0 and j. The actual
normaliser is the matrix
 B_x(v)=N_x(gamma0*g1^-1)-I-y0(N_x(g1^-1)-I)
       +ell^j sum_g v(g)(N_x(g)-I)
for finitely supported natural v. For each x in E_bad choose g_x with
det(N_x(g_x)-I) nonzero. For any existing v, the polynomial
 det(B_x(v)+ell^j T (N_x(g_x)-I))
has degree n and leading coefficient ell^(jn)det(N_x(g_x)-I) != 0.
For a previously treated z, its corresponding polynomial along the
same direction has NONZERO CONSTANT det(B_z(v)); it need not have
degree n. Their product is therefore nonzero over the field K.
Only finitely many roots exist. Natural numbers embed injectively
in characteristic zero. Pick one natural T outside this finite set
and update v by T*[g_x]. Induct over E_bad, starting with zero.
The resulting ONE v avoids ALL unwanted eigensystems, preserving
the previous choices at each step. This proves W at the actual j;
no new rank or commutativity premise, no separate v per eigensystem.
Equivalently choose one coordinate per distinct g_x and use the
nonzero product of multivariate determinants. The iterative proof
preserves the exact native nonnegative finitely supported parameters.

2. Replace the abstract algebraicity argument for the excluding
polynomial by an explicit product. Write beta_x=det B_x(v) for
x in E_bad; all beta_x != 0. In K[X] put
 P(X)=prod_{x in E_bad}(X-beta_x).
Then P(0)=(-1)^|E_bad| prod beta_x != 0, including the empty case.
As K is the fraction field of A, choose one common nonzero
denominator d in A for all coefficients of P. Lift d*P to p in A[X].
Thus p(0) != 0 and p(beta_x)=0 for every x in E_bad.
The canonical EllAdicIntegers model is the same valuation ring with
the native algebra map. This supplies precisely z', htheta, hz' in
DenominatorBound (coefficient 0 nonzero and pointwise evaluation
zero on E_bad). No claim that p excludes exactly E_bad; only
p(beta_x) != 0 implies x in S, which is what the actual consumer uses.
No need to bound v or the coefficients uniformly in nu: the source
chooses v and p at the fixed j BEFORE the arbitrarily large tie level.
The exponent nu is subsequently chosen to dominate the finite
valuation of (2*n!)*(p(0)*c_level^2)^(|J|+1). J is the fixed finite
ordered type from exists_isPrimeTriangle, independent of nu. Keep
all quantifiers; do not let p be chosen after nu. The source uses
the same normaliser with j=m0+D.h2*h in ribet_columns. No change to
that budget or the real h bound. This explicit polynomial is a
candidate replacement for the fraction-ring algebraicity proof
only, not the diagonal-operator or Selmer-length estimate.

3. Integral string quotient via one Gauss-norm cancellation.
In HeckeString.exists_integral_multiple_eval_one put ||F||_G equal
to the maximum coefficient norm (zero for F=0). Gauss norms over
a nonarchimedean field multiply: divide each nonzero polynomial
by a maximal coefficient; both normalized reductions modulo the
maximal ideal are nonzero and so is their product in the residue
field. Rescale. For monic B, ||B||_G >= 1, even if B is not
assumed integral. From the native congruences:
 ||AB-C||_G<1, ||C-A'B||_G<1, ||C||_G<=1.
The strict bounds are legitimate because support is finite.
Hence ||AB||_G<=1 and ||(A-A')B||_G<1, so
 ||A||_G<=1 and ||A-A'||_G<1.
At 1 this gives |A(1)|<=1 and |A(1)-A'(1)|<1.
The premise |A'(1)|>=1 then implies |A(1)|=1.
Take e=A/A(1), with integral coefficients and e(1)=1.
No integrality assumption on B beyond monicity; no degree or
coefficient-by-coefficient division estimates needed. This
constructs the exact native integral multiple of A, in fact
a unit scalar multiple. The actual A is the normalized quotient
of the Hecke polynomial by the string; B=prod_{i<n-r}(X-cyc^-i).
The full string divisibility is from isRoot_hecke_string and
pairwise distinct powers of the prime norm q, not from p alone.
Use spherical local-global compatibility and the unitary local
string theorem as explicit prerequisites. No new proof of either.
At generic Frobenii the native coefficient comparison supplies C
integral and the second approximation A'B with |A'(1)|>=1.
Therefore the actual e has eval 1 = 1 and HasRootString as required
in he, retaining the native coefficient maps and inverse twist
normalization from eventually_heckePoly_eq_string_mul.

4. Supply the good-Frobenius neighbourhood used before the triangle.
For T(delta_i)=y^i M as in exists_eventually_no_eigenvalue_one,
the guard |y^j-1|=1 for 1<=j<=4n+2 implies |y|<=1. If |y|<1,
choose i sufficiently large that all factors 1-y^i lambda (lambda
running through the n eigenvalues of M) are units. If |y|=1,
the residues of y^i for 0<=i<=n are pairwise distinct. For each
unit eigenvalue lambda, at most ONE such i makes
  |1-y^i lambda|<1.
Eigenvalues of norm <1 cause no exclusion, and those of norm >1
give factors of norm >1. At most n indices excluded among n+1.
Thus choose i with |det(I-y^i M)|>=1; use the algebraically closed
field K so all eigenvalues exist, with multiplicities. This is
the native charpoly evaluation at 1, requiring neither matrix
diagonalizability nor M integral. The set |char(T(phi))(1)|>=1
is open at the chosen point by ultrametric continuity (complement
of open unit ball is itself open at every nonzero point).
In DenominatorBound use the genuine row scalar inertia witness
gamma from IsRow.exists_scalar_inertia, triviality of the auxiliary
avatar on that inertia and cyc(gamma)=1. For fixed nu and g take
delta_i=gamma^(i*ell^nu)*g, scalar y replaced by y^(ell^nu).
The native hy nu supplies exactly the distinct-residue guard
for every nu; do not infer it solely from y !=1. The other
Frobenius restrictions in hP come from intersecting the finitely
many eventual string conditions (step 3) for x in S that are
residually congruent to pi, with the off-level and bad-place
conditions. Thus hW in exists_isPrimeTriangle is obtained for
EVERY nu,g using the same row pi. The triangle itself and its
reciprocity construction remain separate obligations.

Actual consumer chain:
 denominatorLe_rowBudget -> cp, W,p -> hP (exists_isPrimeTriangle)
 -> e,he -> BaseLevel.exists_diagOp_mem_ellIntegralForms -> ribet_columns
 -> final norm_gram_det_le_of_operators.
The actual he premise that all Hecke elements vanishing at x have
value norm <1 at pi implies residual charpoly congruence: subtract
the integral scalar coeff at x from the corresponding charpoly
Hecke element. Its value at x is 0, its value at pi is the
coefficient difference. cp is needed to embed that scalar into
the integral Hecke algebra. The p-nonvanishing premise implies
x in S by step 2. Hence the finite intersection in step 4 and
the chosen triangle supply he at the actual caller, not just for
one fixed good eigensystem. Keep level membership of x and all
normalization/cyc character guards. The final diagonal operator
requires the same p and beta, same triangle, and genuine lift pi;
no independent v selection in ribet_columns.

Original source graph retained. Proposed reduced human graph:
 W -> finite polynomial avoidance; z' -> explicit product +
 common coefficient denominator; integral quotient -> Gauss norm
 multiplicativity; scalar neighbourhood -> at most n bad residues;
 all feed existing he and diagonal-operator caller. No global
 kernel graph deletions claimed. Context key (pin,D,ell,O,c,twist,
 B,pi,N_x,j,m0,h,gamma0,g1,y0,v,p,nu,triangle). Remaining exact
 primitives: IsRow.exists_scalar_inertia and its residue guard,
 local-global string theorem, triangle reciprocity and primitive
 relation existence, IsRow.eventually_isBalanced and crystalline
 defect/Selmer bound, deformed trace coefficient extraction.
No proof by importing Main, no assumption RH or prime-window bound.

Execution: source bodies and actual caller inspected, no local
Lean/Lake available. Native probes and scalar polynomial certificate
below prepared for independent replay, not asserted PASS. Current
shared receipts checked directly: run 45799225653 status pass
(blob 77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35); run 45803534769
status error (a56e2d3afb99ed8275e81fd63c8494306e57c43f), despite
successful wrapper jobs. Neither validates this file. Old engines
are not silently treated as compact kernel execution. No new
native closure or axiom ledger inferred; retain existing evidence.
No protected changes, no new competing CI job.

RESUME HERE: prove the actual deformed-trace top-coefficient
extraction in OnePrimeTie.exists_diagOp_mem_ellIntegralForms,
including the exact modulus (2*n!)*(p(0)*c_level^2)^(|J|+1) and
support/equality clauses; cross-check the reciprocity-to-triangle
supplier and balanced-row loss with current C peers, without
repeating the determinant endgame. Audit this explicit p replacement
against all consumers. Submit native probes to shared compact
verification with same pin and preserve failed checks.
HANDOFF TO: integration, audit, shared native verification.
-/

namespace GaloisRun58
open Polynomial

-- Scalar component of the explicit excluding polynomial. Prepared.
theorem linear_factor_nonzero_at_zero {K : Type*} [Field K]
    (a : K) (ha : a ≠ 0) :
    (X - C a : K[X]).eval 0 ≠ 0 := by
  simpa using ha

theorem add_factor_nonzero_at_zero {K : Type*} [Field K]
    (p : K[X]) (a : K) (hp : p.eval 0 ≠ 0) (ha : a ≠ 0) :
    (p * (X - C a)).eval 0 ≠ 0 := by
  rw [eval_mul]
  exact mul_ne_zero hp (linear_factor_nonzero_at_zero a ha)

theorem add_factor_root {K : Type*} [Field K]
    (p : K[X]) (a : K) : (p * (X - C a)).eval a = 0 := by
  simp

theorem preserve_root {K : Type*} [Field K]
    (p : K[X]) (a b : K) (h : p.eval b = 0) :
    (p * (X - C a)).eval b = 0 := by
  simp [h]

theorem scale_preserves_root_and_constant {K : Type*} [Field K]
    (p : K[X]) (d b : K) (hd : d ≠ 0) (h0 : p.eval 0 ≠ 0)
    (hb : p.eval b = 0) :
    (C d * p).eval 0 ≠ 0 ∧ (C d * p).eval b = 0 := by
  constructor
  · simpa using mul_ne_zero hd h0
  · simp [hb]

end GaloisRun58

#check ribetNormaliser
#check exists_integral_multiple_eval_one
#check exists_eventually_no_eigenvalue_one
#check eventually_heckePoly_eq_string_mul
#check exists_isPrimeTriangle
#check BaseLevel.exists_diagOp_mem_ellIntegralForms
#check denominatorLe_rowBudget
#print axioms GaloisRun58.add_factor_nonzero_at_zero
#print axioms GaloisRun58.add_factor_root
#print axioms GaloisRun58.preserve_root
#print axioms GaloisRun58.scale_preserves_root_and_constant
#print axioms exists_integral_multiple_eval_one
#print axioms exists_eventually_no_eigenvalue_one
#print axioms denominatorLe_rowBudget
