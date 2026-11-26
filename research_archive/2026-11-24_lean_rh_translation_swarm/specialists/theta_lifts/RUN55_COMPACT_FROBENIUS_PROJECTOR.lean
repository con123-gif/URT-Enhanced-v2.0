import New.TwistedHecke.ElementaryDivisors

/-!
# RUN55 — approximate Frobenius projector, from integral trace to marked caller
26 November 2026. Human source-matched reconstruction, independent audit pending.
Native probes below PREPARED, NOT compiled. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
d34007f4e5dc2b621a35c849630e8299bc1a6c54. Read AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION_15_LANES and current peer commit messages.
Previous own c22bb6a0 gives determinant repair and depth factorization.
Prime peer 60c7643e supplies cyclic flag volume and conditional dimension
bounds. Kernel peer 575d0d31 supplies marked transfer; acceleration
1a365375 gives partial receipt and planned A-only retry. Other current
peers 98cc1e90,20cc89bf,e7c5557f,15ea3969,a3276066,a6e9cc7f,b5cd3751,
837dd3d8. Do not duplicate those suppliers.

Source ledger (all relative to grh-compact/src, full bodies retrieved):
New/TwistedHecke/ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf
  eq_top_of_eval_monomial, exists_invariant_diagonal_form, exists_mean.
New/TwistedHecke/FrobeniusFactors.lean c6cb25c36279a298cf4de03a6b788786354e00f3
  frobOperator_map, frobOperator_mem, p_dvd_cj_frobenius_sub,
  pow_dvd_coeff_conj_frobOperator, degree_le_of_coeff_frobOperator.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  letterRep, deepIndicator, rootVar, excessWeight, excessCond.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  exists_tensor_dual, exists_projector, hasType_twisted_hecke.
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  root_lemma (still separate, not solved by the projector).
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
  exists_le_weight_of_mem_deepForms (still separate).
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  HeckeSizes and both dimension suppliers (see prime peer RUN57).

## 1. Integral diagonal pairing, no inverse of a nonunit in O
Retain native characteristic-zero valuation domain O, p prime nonunit,
W local, residue cardinal q, and ring maps iota_s. For s variables
and homogeneous degree d < p^f, let multinomial M_alpha=d!/prod alpha!.
Factor M_alpha as a product of at most s binomials. By Legendre's
formula v_p(binomial(d,j)) <= floor(log_p d) < f for d>0 (each term
of the factorial floor difference is 0 or 1). The d=0 case is 1.
Integers prime to p are units in O by Bezout and localness. Hence
  q_alpha = p^(s f)/M_alpha belongs to O.
Use q_alpha=0 in degrees above the chosen cutoff D<p^f, if desired.
For a matrix A and degree d coefficient C_{alpha,beta}(A) of the
linear substitution, expand over nonnegative integer tables m_ij
having row sums alpha and column sums beta:
  C_{alpha,beta}(A) = sum_m (prod_j beta_j! / prod_ij m_ij!) prod A_ij^m_ij.
Transposing tables gives
  q_alpha C_{alpha,beta}(A) = q_beta C_{beta,alpha}(A^T).
This is first a characteristic-zero fraction-field calculation, then an
equality in O by injection; no division operation on a nonunit in O.
Different total degrees have zero cross coefficients. This is the
actual ClassMean.exists_invariant_diagonal_form input.

## 2. Conjugation-invariant means by trace on a generated module
Work one homogeneous degree d<=D at a time, where D+k<q and D<p^f.
Let V=(O^k)^(tensor d), with tensor basis e_t, t a d-tuple of indices.
Let Y be the generic block-diagonal matrix with entries X_(t,m)
in row m, column t (the native transposed variable convention).
For a linear functional l on degree-d polynomials set S(l)=
entrywise l applied to Y^(tensor d). Its image algebra A is precisely
the O-span of rho(u)=iota(u)^(tensor d), u in the native block Levi.
Indeed over W the homogeneous evaluation vectors on invertible
block-diagonal matrices span the degree-d coefficient module: any
residue-field linear form annihilating them gives a homogeneous
polynomial whose product with the generic block determinant vanishes
on all residue points. Its degree is at most d+k<q. The finite-field
polynomial vanishing lemma (each variable degree<q) makes the product
zero as a polynomial, and determinant is nonzero (evaluate at I).
Thus the residue span is full; Nakayama on the finite quotient gives
the W-span. Apply iota and then S. The span is a subalgebra since
products of Levi elements are Levi elements, and contains I.
This argument is on the actual block variables, so off-block
monomials mapped to zero cause no difficulty.

Fix a predicate H on the tuple weight sum_t x(t). Let V_H be spanned
by the selected basis vectors and M=A V_H. It is invariant and
finitely generated (A is image of a finite coefficient module).
As a submodule of finite free V over a valuation domain, M is finite
free (standard finitely generated torsion-free valuation-module theorem).
Write K(f) for the functional sending monomial X^alpha to its
coefficient in f times q_alpha. Define
  kappa_H(f)=Tr(S(K(f))|_M).
Then all four native exists_mean properties hold:
(i) Tensor covariance from the diagonal pairing yields
  S K(conjSubst(u) f)=rho(u) S K(f) rho(u)^(-1).
Trace on the SAME M is invariant.
(ii) For f=X^alpha, nonzero entries have fixed source tuple weight
rowWeight(alpha) and fixed target tuple weight colWeight(alpha).
If unequal, the operator squares to zero, including on M, and trace
vanishes (extend to fraction field, nilpotent trace zero).
(iii) If H(rowWeight(alpha)), S K(X^alpha) kills unselected source
basis vectors and sends selected ones into M. Its image is contained
in M. Its trace on M equals trace on V (over the fraction field use
a basis of M extended to V; induced quotient map is zero). The trace
on V is zero unless alpha consists entirely of diagonal variables;
then it is q_alpha M_alpha = p^(k^2 f), since there are M_alpha
diagonal tensor entries. Thus kappa_H(X^alpha)=p^(k^2 f) X^alpha(I)
on the selected weights, including the off-block case.
(iv) For an O-basis v_j of M, expand each v_j as a finite sum of
scalar multiples of rho(u)e_t for selected t. Trace is sum of coordinate
functionals on S K(f)v_j. Move rho(u) to the left using (i):
  S K(f) rho(u)e_t = rho(u) S K(conjSubst(u^-1)f)e_t.
The functional before conjugation, applying the j-th coordinate
to rho(u) S K(g)e_t, vanishes on monomials of unselected row weight.
All intermediate images are in M. This gives the precise span
condition by Levi conjugates of H-supported linear forms, not merely
a statement about averages with possibly nonintegral denominators.
Add over d=0,...,D and set the other degrees to zero. This is the
native ClassMean.exists_mean including its degree cutoff and four
properties. The standard valuation-module fact, polynomial density
and trace facts are explicit external foundations, not additional
quantitative hypotheses.

## 3. Frobenius coefficient bound by telescoping weights
Keep all native guards: N=2 ell, P=p^o0, q=P^N, a'=a+1=r,
N n k (ell+2)<=P^ell, ell<=N, c natural, w^2=p. E_i(beta) is
native excess of the monomial beta at i. Let Q=generic frobOperator
and psi(s,d) the conjugate of the entrywise P^d-power of the
(s-d)-generic matrix, conjugation at s by iota_s(g) and at s-d
before the power by iota_(s-d)(g^-1). This is exactly the psi in
pow_dvd_coeff_conj_frobOperator, not an independent generic matrix.
Its (b,c) entry differs from X_(s-d,b,c)^P^d by a multiple of p
by the Frobenius congruence. It is homogeneous of degree P^d in
that letter. The following proves the required coefficient estimate.

For target letter i+ell, take sign e=+1 or -1, chosen to make
e*(E_(i+ell)(beta)-rowWeight(nu_i)) the absolute difference.
Set x_b=(1_(b=a')-1_(b=a))/P^ell,
  A_m(b)=e x_b P^m/(2q), u=1/(2 P^ell).
Put alpha_(s,d)(b)=A_(d+(s-d-i mod N))(b).
For j=s-d, assign polynomial variable weights
  omega_(j,b,c)= A_N(b) if j=i,
                 A_(j-i mod N)(b)-A_(j-i mod N)(c) otherwise.
Here residues are always the representative in [0,N-1].
Each alpha row sums to zero, and |alpha_(s,0)(b)|<=u.
Exact step cancellation:
  alpha_(s,d+1)(b)-alpha_(s,d)(c)
    = P^d omega_(j,b,c) - 1_(j=i) A_d(c).
Since d<=ell<=N, |A_d(c)|<=u. Also |P^d omega|<=1:
for j=i it is <=P^d/(2P^ell), otherwise <=P^d/P^ell.
In the decreasing Gauss filtration G_t (coefficients of monomial
mu divisible by w^max(ceil(t-omega·mu),0)), the generic power is
in G_(P^d omega). The p-divisible correction is in G_1, because
every monomial has degree P^d in letter j and total variable
weight >=-1. Therefore
  psi(s,d)_(b,c) in G_(alpha_(s,d+1)(b)-alpha_(s,d)(c)-u).
All conclusions hold over the native valuation ring, not only DVRs.
Filtration multiplication adds lower bounds and sums preserve them.

Multiply m factors in time order. Intermediate alpha weights cancel
exactly along each matrix path; induction gives the row-b bound
alpha_(s,m)(b)-(m+1)u, including the initial |alpha_0| cost.
For an odd letter use the transpose-adjugate: its (b,c) cofactor
omits row b, and the zero sum of alpha gives
-alpha_(s,m)(b)-(k-1)(m+1)u. For even letters use the direct row
bound. Both are bounded below by
  sign_s alpha_(s,ell+deep(b,s))(b)-k(ell+2)u.
Taking the degree-n symmetric power sums the selected row weights
with multiplicities beta and costs at most nk(ell+2)u, and the
tensor over N letters costs Nnk(ell+2)u. These are exactly the
native frobOperator_mem operations (using coefficient/row
convention of symPowMatrix).

The parity/deep choice gives the exact weight
  sign_s alpha_(s,ell+deep(b,s))(b)=e excessWeight_(i+ell)(b,s)/2.
Indeed for even s the a' row has one extra step and a has none;
for odd s it is a that has the extra step and the signs reverse.
The two exponents are 1+(s-1-i-ell mod N) and (s-i-ell mod N).
If nu_j has equal row and column x-weight for all j!=i, then
  omega·nu = e rowWeight(nu_i)/2.
Thus for the coefficient of nu in Q(psi)_(beta,gamma) the required
w-order is at least
  |E_(i+ell)(beta)-rowWeight(nu_i)|/2 - Nnk(ell+2)/(2P^ell)
  >= (|E_(i+ell)(beta)-rowWeight(nu_i)|-1)/2.
If the absolute difference exceeds 2c+1, this is strictly >c,
so w^c divides the coefficient. This proves the actual coefficient
cutoff, without root_lemma or the cone/deep dimension estimates.
No assertion about arbitrary coefficient valuations without the
balanced-other-letters premise.

For the ordinary generic Q, each factor has degree <=P^ell in
each letter. A product of <=ell+1 factors costs <=(ell+1)P^ell,
a cofactor <=(k-1) times this, symmetric degree n multiplies by n,
and tensor N multiplies by N. This gives the native (slightly
larger) degree cutoff D=N n k(ell+2)P^ell by elementary counting.

## 4. Actual projector and its two distinct thresholds
Put f=o0 N, q=p^f. The stronger HeckeSizes guard
  N n k(ell+2)+n+k<P^ell
implies D+k<q and D<q, n<q. Apply section 2 letterwise using
iota_j and x_b. Let H mean weight>theta-(2c+1), kappa_1 be the
all-weight mean, kappa_H the H-supported mean, and kappa_L=
kappa_1-kappa_H. Both are balanced and conjugation invariant;
kappa_L vanishes on H by property (iii). Define Z_raw from Q
by applying tensor products of means coefficientwise. The
tensor functional is simply sum_nu coeff_nu prod_j kappa_j(X^nu_j),
finite on every polynomial; it is multilinear.

Apply section 1 with s=k to degree n at each letter and put
b_beta=prod_j q_(beta_j), b'_beta=prod_j multinomial(beta_j).
B=diag(b), B'=diag(b'). Then BB'=p^(k f N)I and
  rho(g)^T B=B rho(g^T)
by the actual transposition rule for letterMatrix and tensor product.
Choose Z=Z_raw(kappa_L,...,kappa_L) B'.

IMAGE: take any Levi g, any F, and beta having excess>theta
at letter i+ell. Conjugate the generic matrices by g^-1 in each
letter and apply Frobenius covariance
  rho(g) Z_raw(m)=Z_conjugated(l) rho(g)
where m_j=l_j composed with conjSubst_j(g).
The equality is native frobOperator_map; it follows by cancelling
adjacent conjugations in each product, using block diagonality for
row-dependent product length and cofactor covariance for odd letters.
Here m=l=kappa_L by invariance. Every surviving monomial has
rowWeight(nu_i)<=theta-(2c+1), and is balanced elsewhere.
Section 3 makes the beta row divisible by w^c. As g,F were
arbitrary, Z maps into excessCond(theta) in all Levi frames.

PAIRING: let y belong to excessCond(theta-(4c+2)), with same ideal
(w^c). Expand the tensor of kappa_1=(kappa_L+kappa_H). Every term
other than the all-low term has some high letter i. By (iv)
expand the mean at i as a sum of conjugates of H-supported forms.
At all other letters move that SAME conjugation into the generic
matrix using invariance of their means. By Frobenius covariance,
in the scalar y^T B Z_raw B'F the conjugation becomes
  y^T B rho(g^-1) = (rho((g^-1)^T)y)^T B
and rho(g)B'F on the other side. The transformed y still has
all rows of excess>theta-(4c+2) divisible by w^c because the
transpose inverse lies in the Levi. For all other rows, the
high letter has rowWeight(nu_i)>theta-(2c+1), so its weight
differs from E_(i+ell)(beta) by >2c+1; other letters are balanced.
Section 3 kills each summand modulo w^c. This proves that EVERY
term containing a high letter vanishes in the pairing, not
that the high operators vanish individually.

All-weight evaluation equals p^(k^2 f N) times Q(I)=p^(k^2 f N)I
by degree cutoff and property (iii). Hence, on the native y,F,
  y^T B Z F = p^((k+k^2) f N) y^T F mod w^c.
The exponent is exactly (k+k^2)*o0*N^2 and the b transposition
identity above is the third projector property. This reconstructs
exists_projector with the original thresholds, same witnesses and
no replacement of its nontrivial estimate by numerical evidence.

## 5. Consumer, dependency status and actual verification
Original source branch:
  invariant diagonal + class mean + frobOperator_mem/covariance
  + coefficient/degree bounds -> exists_projector
  -> hasType_twisted_hecke (also needs TWO independent dimension bounds,
      two depth factorizations and of_pairing)
  -> Columns.hasType_markOperator -> Data.IsMarked.hasType_markOperator
  -> hasType_prod_markOperator_pow -> exists_indexDvd_Bmu_divisible -> A.
Reduction: sections 1–4 give the same projector hypothesis with
no root_lemma, cone-volume or deep-form-cost premise in its own proof.
Those last premises remain on separate dimension edges, not globally
deleted; preserve original graph, RUN54 proposed graph, native axioms,
all typed unresolved nodes and actual support/Schur-jet suppliers.
This is a human proof of the projector construction subject to
independent audit, not a compiled replacement term or full A.
No theorem imported from Main; no new source pin or physics gates.

Executed exact integer regressions in V8: 49,280 cyclic output
identities, 1,093,120 step identities, 1,093,120 filtration bounds,
7,371 transpose diagonal pairing identities. These are tests only of
symbolic equalities derived above, not synthetic RH inputs nor native
proofs. Reproduction: P in {5,7,11,25}, N in {2,4,6,8,10}, k in
{2,3,5}, r=1..k-1, sign +/-1, all i,s,b,c and d=0..ell; scale A
and omega by 2qP^ell, so A_m(b)=sign*P^m*(indicator(b=r)-
indicator(b=r-1)) and scaled u=q. Output and step equations checked
exactly, as were |P^d omega|<=1 and diff-u<=P^d omega.
For diagonal pairing use d=0..12, a,b=0..d, p in {2,3,5}
(repeated independent of p), matrices [[1,2],[3,4]], [[0,-1],[1,0]],
[[2,0],[0,3]], compare C_ab(A)*a!*(d-a)! with
C_ba(A^T)*b!*(d-b)! using exact binomial expansion.

Actual shared CI re-read: run 45803534769, state branch
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f = error;
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bc6f671cc804
all_requested_checks_ok=false, full_RH_replay=false.
New.Selmer.TiltingLemma and New.Filling.Moments: three declarations
each, returncode 0 and only propext, Classical.choice, Quot.sound.
New.Columns.JetExponentBound build returncode 124; no A named checks.
GitHub job success means receipt written, not successful A build.
No native execution of this file or rh_scan/prune/reduce/auto/frontier
in this session. Shared bounded retry owned by kernel/acceleration;
do not compete or edit protected runner. Old engine passes are on the
old pin only; preserve rather than transplant them. Axiom evidence
for this new replacement remains unknown until checked.

RESUME HERE: integrate the actual projector supplier with RUN54
pairing and prime RUN57 conditional dimension budgets. Audit
root_lemma and exists_le_weight_of_mem_deepForms / finite-field
weight-detection injections, then verify exact dimension callers
and actual A native probe in the compact shared environment.
HANDOFF TO: prime, kernel, audit, integration, editor.
-/

namespace RHThetaRun55

-- Scalar certificates prepared for the two exact threshold uses.
theorem low_cut (theta c E W : ℝ) (hE : theta < E)
    (hW : W ≤ theta - (2*c+1)) : 2*c+1 < E-W := by linarith

theorem high_cut (theta c E W : ℝ) (hE : E ≤ theta-(4*c+2))
    (hW : theta-(2*c+1) < W) : 2*c+1 < W-E := by linarith

theorem coefficient_cut (c gap loss : ℝ) (hg : 2*c+1 < gap)
    (hl : loss ≤ 1/2) : c < gap/2-loss := by linarith

theorem projector_exponent (p : ℕ) (k f N : ℕ) :
    p^(k*f*N) * p^(k^2*f*N) = p^((k+k^2)*f*N) := by
  rw [← pow_add]
  congr 1
  ring

end RHThetaRun55

-- Actual native supplier probes, not the claimed RH theorem.
#check ClassMean.exists_mean
#check TwistingData.pow_dvd_coeff_conj_frobOperator
#check TwistingData.exists_projector
#check TwistingData.hasType_twisted_hecke
#print axioms TwistingData.exists_projector
#print axioms TwistingData.hasType_twisted_hecke
