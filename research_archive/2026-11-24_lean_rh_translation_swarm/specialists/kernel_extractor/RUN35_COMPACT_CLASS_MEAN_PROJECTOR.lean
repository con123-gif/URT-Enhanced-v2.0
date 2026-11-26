import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN35 kernel lane — 26 November 2026. HUMAN SOURCE-MATCHED candidate;
independent audit and native replay outstanding. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude. Compact source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
a1cd58ab264179f0e35001a50da0853ef4b9d858 (editor 3c29c488).
Own RUN34 3e2e639b38f30e6b707aa22a8deaa8e6099ddaca is pairing,
peer 2da8ca9258d5c3c73909186be3fa1c256900deca is Frobenius
coefficient transport, not the class mean. New work below uses both.
No change of source pin or addition of URT premises.

Source ledger (relative to grh-compact/src/New/TwistedHecke):
ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf:
eq_top_of_eval_monomial, exists_invariant_diagonal_form, exists_mean.
ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307:
exists_tensor_dual, exists_projector, hasType_twisted_hecke.
FrobeniusFactors.lean c6cb25c36279a298cf4de03a6b788786354e00f3:
frobOperator_map, pow_dvd_coeff_conj_frobOperator,
degree_le_of_coeff_frobOperator.
TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144:
letterRep, letterMatrix, excessCond, card_residueField.

1. Integral transpose form (native exists_invariant_diagonal_form).
Let O be the native characteristic-zero valuation domain, p a prime
nonunit, sigma a finite index set of size m. For degree d<p^f put
q_alpha=p^(m f)/multinomial(alpha) in Frac(O); for d>=p^f set
q_alpha=0. This quotient is integral: the multinomial is a product
of at most m binomial coefficients with top <=d. Legendre's formula
for each binomial valuation is a sum of floor differences, each
0 or 1, and zero for p^j>d. Thus its p-valuation <= f (indeed
<=f-1 for f>0). Any integer prime to p is a unit in O by Bezout
with p in the maximal ideal. This gives the desired divisibility
even if p is not a uniformizer. Empty index/degree zero uses 0!=1.
For any square A, set c_{alpha,beta}(A)=coeff_alpha(linSubst A X^beta).
If degrees differ both coefficients are zero. At equal degree,
the expansion indexes nonnegative integer contingency tables with
marginals alpha,beta. A table contributes beta!/prod t_ij! times
the corresponding product of entries, and its transposed table
contributes alpha!/prod t_ij! for A^T. Multiplying the first by
q_alpha and second by q_beta makes them identical since
q_alpha=p^(mf) alpha!/d!. In high degree both q vanish. Hence
c_{alpha,beta}(A) q_alpha = q_beta c_{beta,alpha}(A^T)
for ALL A (no invertibility or division in O). This proves the
exact form needed for sigma=Fin k AND sigma=Fin k x Fin k.

2. Evaluation spans at the exact projector cutoff.
Write q_res=#ResidueField W, d<=D, Y the masked generic Levi
matrix of ClassMeans (Y_ij=1_{tau i=tau j} X_(j,i)).
Let h=det Y, homogeneous degree k, h(vec I)=1.
In W's residue field, evaluation vectors of degree-d monomials at
points with h nonzero span: a linear functional annihilating them
gives a homogeneous polynomial F with F*h vanishing at every
point. In this caller d+k<q_res, so the degree in every variable
is <q_res. Repeated one-variable root counting proves F*h=0
as a polynomial. Since h is nonzero and the residue ring is a
field, F=0. (The source allows <=q_res; the equality case also
follows for homogeneous polynomials of degree q_res by replacing
X_i^q_res by X_i. Mixed terms do not reduce, and the pure powers
reduce to distinct linear terms; no cancellation with degree
q_res mixed terms, as q_res>=2.)
Every such point lifts to W with determinant a unit; Nakayama
on the quotient of the finite free degree-d monomial module by
the span gives the result over W. Apply the ring map iota to a
spanning expression and extend scalars to O. This does not
require iota to be injective or the residue fields to agree.
This is the density step in ClassMean.eq_top_of_eval_monomial.

3. Invariant class mean by a single restricted trace (exists_mean).
Fix a degree d<=D, let E=O^((Fin k)^d), let g=Y^(tensor d)
using the source's transpose indexing, and S(c)=sum_alpha
c_alpha coeff_alpha(g), a linear map from degree-d coefficient
functionals to End(E). Write A(a)=iota(a)^(tensor d) for a in
the Levi. Evaluation of g at vec a gives A(a) exactly, since
a is block diagonal. By section 2, S(c) is an O-linear
combination of these A(a): the masked Y at every unit-det
point is itself a Levi element. Let x be the native indexWeight
(or any real x in ClassMeans), and w(t)=sum_j x(t_j) on tensor
basis words. Set N=span{A(a)e_t : P(w(t)), a in Levi}.
This is precisely the source's sum of selected-column ranges.
It equals the span of S(c)e_t for those t, hence is finitely
generated, stable under the group and every S(c). It is
finite free: a finitely generated submodule of a finite free
module over a valuation domain admits a free basis by choosing
a nonzero matrix entry dividing all the others and eliminating
its row/column inductively (as in RUN34).

For a degree-d polynomial F set
 K(F)(X^alpha)=q_alpha coeff_alpha(F),
 T_F=S(K(F)).
The diagonal transpose identity in section 1 moves the
conjugation substitution from F to the transpose substitution
on g. In the source vec convention (X_(j,i) is Y_ij), transpose
of the linear substitution defining conjSubst(a) sends Y to
iota(a) Y iota(a)^(-1). Block masking commutes with this action
because a and a^-1 have the same Levi support. Tensoring gives
the exact source adj identity
 T_(conjSubst(a) F)=A(a) T_F A(a)^(-1).
In particular the same identity holds after restriction to N.
Define kappa_d(F)=Tr_N(T_F|N). Cyclicity gives invariance.

For a monomial X^alpha, T_F=q_alpha coeff_alpha(g) has only
matrix entries whose input word t has weight
w_row=sum x(i) alpha_(i,j), and output word m has weight
w_col=sum x(j) alpha_(i,j), by g's tensor entries with Y_ij
indexed (j,i). If w_row != w_col, its square is zero; the trace
on N is zero after passing to Frac(O), hence zero in O.
If P(w_row), the entire image of T_F lies in N (all its
nonzero input columns are among the selected ones).
Write T_F=i_N U with U:E->N; then T_F|N=U i_N and rectangular
trace cyclicity gives Tr_N(U i_N)=Tr_E(i_N U). The latter is
q_alpha coeff_alpha(Tr g). Since Tr(Y^(tensor d))=(Tr Y)^d,
this is q_alpha multinomial(alpha) eval_I(X^alpha)
=p^(k^2 f) eval_I(X^alpha), including off-diagonal monomials
whose evaluation is zero. No index or dimension penalty.

The span/support assertion is essential, not implied by
invariance. Take a finite free basis b_j of N and expand
each b_j as a finite O-linear combination of generators
A(a)e_t with P(w(t)). Then
 kappa_d(F)=sum_{j,a,t} c_{jat} b_j^*( A(a)
                     T_(conjSubst(a^-1) F) e_t ).
For each fixed j,a,t the functional L(F)=b_j^*(A(a)T_F e_t)
kills every monomial with row weight outside P, by the
column support property, and is O-linear. Its value is
defined in N for all F because T_F e_t is a selected-column
generator. Thus each summand is L composed with an allowed
Levi conjugation; exactly the source's span condition.
Sum kappa_d for d=0..D, taking homogeneous projections.
Conjugation preserves degree. Higher-degree monomials vanish;
the three class-mean fields and its span assertion follow
on the full polynomial ring. Zero module uses trace zero.
This reconstructs exists_mean without a Haar average or
division by the order of the Levi.

4. Exact tensor dual and common normalization at exists_projector.
For arbitrary linear forms l_j on each letter's polynomial
ring, define S_tensor(l)(X^nu)=prod_j l_j(X^(nu_j)) and extend
O-linearly over finite monomial support. This is multilinear
and on product of disjoint-letter polynomials it factors
as the product of the l_j values, by distributivity. This
is precisely exists_tensor_dual and hnu in the native caller.
Let A=N*n*k*(ell+2), D=A*P^ell, f=o0*N, N=2ell.
The actual h gives A+n+k<P^ell. Hence D+k<=
(A+k)*P^ell<P^(2ell)=p^f=q_res, also n<p^f.
These are the same cutoffs used for both class means and
the diagonal form on the degree-n symmetric powers.
Define B=diag(b_beta) with b_beta=prod_s q_(beta_s) from
section 1 (sigma=Fin k). Let B'=diag(b'_beta) with entries
b'_beta=prod_s multinomial(beta_s), so BB'=p^(k f N) I
exactly. The transpose identity tensorized over even and
odd letters yields B rho(g^T)=rho(g)^T B:
letterMatrix(s,g^T)=letterMatrix(s,g)^T also on odd letters
since transpose commutes with inversion in the prescribed
way. No inversion of B is required. This proves the third
projector field, retaining the exact common normalization.

5. Actual approximate projector, both congruences on same witness.
Use the source's H=theta-(2c+1). For each j let kappa_0,j
be section 3 with P(t): H<t, and kappa_1,j with P always true.
They are conjugation invariant, kill unequal row/column
weights, and coincide on row weight>H (including degree>D).
For Q the source Frobenius polynomial matrix put Z(l)=
S_tensor(l)(Q) entrywise, and Z*=Z(kappa_1-kappa_0) B'.
For arbitrary Levi g, covariance from frobOperator_map
gives rho(g)Z(l)F equal to averaging the conjugated
Frobenius factors against the same forms (when all forms
are invariant), applied to rho(g)F. More explicitly,
 Z(l_j o conjSubst_j(g)) =
 rho(g)^(-1) Z_g(l) rho(g),
where Z_g uses the actual factors iota_s(g) times the
entrywise Frobenius powers of iota_j(g)^(-1) X_j iota_j(g)
times iota_s(g)^(-1). This is the source's key matrix
identity, not a change of letter convention.

For a bad output beta with excess at i+ell >theta, a
surviving coefficient in the tensor evaluation of
kappa_1-kappa_0 has row weight at i <=H and equal row/column
weights at all j!=i. Thus excess-row>2c+1. The actual
pow_dvd_coeff_conj_frobOperator gives w^c divisibility.
Take the finite coefficient sum first, then all g: this
proves Z*F belongs to excessCond (w^c) theta.

For the pairing use y in the source lower excess condition
theta-(4c+2). The telescoping difference of two tensor
products of linear forms replaces one slot at a time:
 tensor(kappa_1)-tensor(kappa_1-kappa_0) =
 sum_i tensor(other slots) with kappa_0,i in slot i.
Other slots are kappa_1 or kappa_1-kappa_0, hence invariant
and kill unequal weights. This linear-in-N expansion
is enough; no exponential subset expansion is required.
Expand kappa_0,i by the proven span assertion into finitely
many l_i o conjSubst_i(g) supported on row>H. Since all
other slots are invariant we may use the same conjugation
g there too, and apply the exact matrix identity above.
Move rho(g)^(-1) across B to y using transpose compatibility:
 y^T B rho(g)^(-1)=(rho((g^-1)^T)y)^T B.
The transpose inverse is still Levi, so for each output
beta with excess>theta-(4c+2) at i+ell the transformed
y coefficient is in (w^c). For the remaining outputs,
rowweight>H and excess<=theta-(4c+2) imply
rowweight-excess>2c+1, and all other letter weights match.
The same native coefficient lemma supplies w^c instead.
Every summand in the pairing difference is thus in (w^c).
Finally kappa_1 evaluates every relevant monomial at identity
times p^(k^2 f), by the native degree bound. Q(I)=I (products,
adjugates, symmetric and tensor powers of I). Therefore
 Z(kappa_1)=p^(k^2 f N) I, and
 B Z(kappa_1) B'=p^((k+k^2) f N) I.
Combine the divisibility with this identity to get EXACTLY
 w^c | y^T B Z* F - p^((k+k^2)*(o0*N)*N) y^T F.
This completes a human derivation of the three projector
fields conditional on the cited native Frobenius suppliers,
with the same b,Z used by hasType_twisted_hecke and RUN34
of_pairing. Both thresholds are strict exactly where the
source requires them; no assumption that y is orthogonal,
nor that g is integral-unitary over O.

Graph / verification boundary:
original: ClassMeans density + transpose form -> exists_mean;
exists_mean + exists_tensor_dual + Frobenius factors -> exists_projector
-> hasType_twisted_hecke -> Columns.hasType_markOperator -> A.
Candidate: residue polynomial + multinomial tables -> restricted
trace and generator support -> tensor dual / normalization ->
two congruences -> same actual caller. Keep all original type,
value, constructor, and axiom edges; replacement not elaborated,
no global dependency retired. Native Frobenius supplier chain,
remaining Hecke/Schur jet and stage-support dependencies,
B/C branches remain explicit. Context key: compact pin, O,W,
iota_s, tau, p,f,d, x,P, T,r,a,ell,c,theta and actual caller;
do not reuse means across differing support or valuations.

Execution: re-read current mission, manuscript, protocols and
latest peers; 22/22 exact source anchors found across four
pinned source blobs. This is static source matching, not
kernel proof verification. Local command -v lean/lake/elan
returned no executable. No rh_scan/prune/reduce/auto/frontier
run; old-pin tools not assumed compatible. Prior actual
CI run 45803534769 status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named B/C checks and three standard axioms each;
module_1_build timed out 124; all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS. Source probes and
scalar threshold lemmas below are prepared, not compiled.
Use shared bounded runner and preserve protected workflows.

RESUME HERE: independently audit the restricted-trace support
argument and the transpose substitution orientation against
ClassMeans.exists_mean; then replay this file from pinned
grh-compact with lake env lean, collect actual axiom output
and compare original graph to any elaborated replacement.
Use the projector at the existing pairing caller, not a
separate surrogate. Continue with single-stage Hecke/jet
primitive if not covered by theta peers. No full RH import.
HANDOFF TO theta, formal audit, integration/editor and shared
native runner. Human reconstruction incomplete.
-/

namespace CompactKernelRun35

theorem upper_margin (theta c e r : ℝ)
    (he : theta < e) (hr : r ≤ theta-(2*c+1)) :
    2*c+1 < |e-r| := by
  linarith [le_abs_self (e-r)]

theorem lower_margin (theta c e r : ℝ)
    (he : e ≤ theta-(4*c+2)) (hr : theta-(2*c+1) < r) :
    2*c+1 < |e-r| := by
  linarith [neg_le_abs (e-r)]

theorem cutoff (A n k P : ℕ) (h : A+n+k < P) :
    A*P+k < P*P := by
  have hp : 0 < P := by omega
  have h1 : A+k < P := by omega
  have h2 : k ≤ k*P := by
    simpa using Nat.mul_le_mul_left k (show 1 ≤ P by omega)
  calc
    A*P+k ≤ (A+k)*P := by rw [Nat.add_mul]; omega
    _ < P*P := Nat.mul_lt_mul_of_pos_right h1 hp

theorem tensor_step {R : Type*} [CommRing R] (a b x y : R) :
    a*x-(a-b)*y = a*(x-y)+b*y := by ring

end CompactKernelRun35

#check ClassMean.eq_top_of_eval_monomial
#check ClassMean.exists_invariant_diagonal_form
#check ClassMean.exists_mean
#check exists_tensor_dual
#check TwistingData.frobOperator_map
#check TwistingData.pow_dvd_coeff_conj_frobOperator
#check TwistingData.degree_le_of_coeff_frobOperator
#check TwistingData.exists_projector
#check TwistingData.of_pairing
#check TwistingData.hasType_twisted_hecke
#print axioms ClassMean.exists_invariant_diagonal_form
#print axioms ClassMean.exists_mean
#print axioms exists_tensor_dual
#print axioms TwistingData.exists_projector
#print axioms TwistingData.hasType_twisted_hecke
#print axioms CompactKernelRun35.upper_margin
#print axioms CompactKernelRun35.lower_margin
#print axioms CompactKernelRun35.cutoff
#print axioms CompactKernelRun35.tensor_step
