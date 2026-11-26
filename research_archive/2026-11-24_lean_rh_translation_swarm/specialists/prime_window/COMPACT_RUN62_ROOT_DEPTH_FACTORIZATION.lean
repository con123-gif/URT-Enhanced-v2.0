import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN62 — 26 Nov 2026. Human source-matched derivation of the full root
lemma and primitive depth factorization, at BOTH actual Hecke callers.
Independent mathematical audit and native replacement replay outstanding.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10. Read mission
first, protocols, AGENTS, continuity, current manuscript, prior RUN61
76a10b406 and peer head c3b2fad4. Coordinate with acceleration RUN60
3392d9c7 (cone and amplification conditional on root) and kernel RUN36
46483cc0 (actual Hecke caller assembly conditional on depth). No
repetition of either peer's argument. Completion before compression.

Source ledger relative to grh-compact/src:
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  TwistingData 25-34, letterMatrix/polyAction 55-66, depth 70-74,
  rootVar/excessWeight 77-82, translatesIn/excessCond/deepForms 86-96,
  frobenius_pow_congr 108-109, p_dvd_letterMatrix_of_mem_parahoric
  119-124, polyAction_polyOfCoeffs 137-140, five_mul_P_pow_le_q 147-148.
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  stepanov_count 27-35, adic/gauss filtrations, aeval_sub_mem_of_gaussFiltration
  70-82, TwistingData.root_lemma 88-end.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  card_le_finrank_translatesIn 29-35, exists_depth_factorization 77-137,
  hasType_twisted_hecke 217-end.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  finrank_excessCond_le_volume uses root_lemma at l=0.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Columns.hasType_markOperator is the ultimate marked caller.

1. Root lemma: exact two-weight substitutions, valid over the native
commutative ring R (do not assume a DVR or characteristic zero).

Fix i, distinct a,a', the same Levi block, and all the actual root
lemma premises. Put y_s=rootVar(a,a',s), x_s=rootVar(a',a,s), and
j_s=(s-i) mod N, P=p^o0, q=P^N>=5. Denote variables by their indices
when unambiguous. Set
    m(x_s)=q P^j_s,  e(y_s)=P^j_s for s!=i, e(y_i)=q;
all other values of m,e are zero. These are the actual source weights.
Write c_z for the given real weight, d_s=c_y_s-c_x_s in [0.4,1.6],
and omega=d_i/q>0. Let pi merge y_i into x_i and fix other indices.
Write epsilon_s=-1 if parity(s)=parity(i), +1 otherwise.
Use an auxiliary polynomial variable t. Define chi on variables by
    chi(z)=X_pi(z) t^m(z).
For s!=i define eta(x_s)=epsilon_s y_s t^e(y_s),
eta(y_s)=epsilon_s x_s, and zero on all remaining variables
(in particular both at i). Set psi=chi-eta on variables, extending
as an algebra substitution, not as subtraction of algebra maps.

For any real u and weight v let G(u,v) be the adic/Gauss filtration
on R[X_z,t], with t-weight u, X_z-weight c_z-u v(z).
A monomial with coefficient divisible by w^h has total filtration
at least h plus its variable weights. Coefficients at different
powers/monomials may cancel but cannot lower that bound. The adic
filtration uses max(ceil(h),0); multiplicativity is ceil(h)+ceil(k)
>=ceil(h+k), and finite sums preserve the minimum. Substitutions
whose variable images have weight >=c_z preserve the original Gauss
bound, and if two substitutions differ in weight >=c_z+delta then
their polynomial images differ by at least delta: telescope each
product, keeping one differing factor. This is the source
aeval_sub_mem_of_gaussFiltration, including delta=1/20.

For G(-omega,m), every chi(z) has weight exactly c_z, INCLUDING
y_i since c_x_i+omega*q=c_y_i. At s!=i, the weight increases for
eta(x_s), eta(y_s), respectively, are
    d_s-omega P^j_s >= 0.4-1.6/5=0.08,
    omega q P^j_s-d_s >= 0.4*5-1.6=0.4.
Here 5 P^j_s<=q and P^j_s>=5 for j_s>0. Both >=1/20.
Thus at the original lower weight H=l+c.alpha,
chi(f) is in G(-omega,m)_H and psi(f)-chi(f) is in
G(-omega,m)_(H+1/20), as is psi(f) in G(-omega,m)_H.
No restriction on the sign of arbitrary c_z is used.

2. The other filtration after the native swap/transvection.

For r0 in W let g(r0) be the actual swap(a,a') times transvection
with parameter -r0 at an even i and r0 at an odd i. It is in the
same Levi by the equal-block premise. Direct substitution of the
two matrices (inverse transpose at odd letters) gives:
  g(r0) x_s = y_s;
  g(r0) y_s = x_s + epsilon_s iota_s(r0) y_s;
all other variables fixed. Let u=iota_i(r0).
Apply psi after this action, and then taylor t -> t+u.
In G(+omega,e), for s!=i the resulting images are
    x_s -> y_s-epsilon_s x_s,
    y_s -> x_s[(t+u)^(q P^j_s)-iota_s(r0)]
            +epsilon_s y_s[iota_s(r0)-(t+u)^P^j_s].
At s=i the images are
    x_i -> x_i,
    y_i -> x_i[(t+u)^q-u].
These are polynomial identities BEFORE any congruence.
The source iterated Frobenius relation gives u^P^j_s congruent
iota_s(r0) mod p, and u^(q P^j_s) has the SAME residue because
the letters are cyclic. Since P,q are powers of p, the binomial
identity mod p turns the two brackets at s!=i into
t^(q P^j_s) and -t^P^j_s respectively, and the bracket at i into
t^q, with errors having ALL coefficients divisible by p=w^2.
This is a congruence in R[t], not an assumption that R has
characteristic p. The weight of the first x_s image is >=c_x_s
because d_s-omega P^j_s>=0.08. For the y_s image the principal
weights are c_x_s+omega q P^j_s>=c_y_s and c_y_s, respectively.
At i the principal y_i image has weight c_x_i+omega q=c_y_i.
Every error term is of weight >=c_x_s+2 or
c_y_s-omega P^j_s+2 (for s!=i); these are >=c_y_s since
d_s<=1.6 and omega P^j_s<=0.32. At i only x_i errors occur,
with c_x_i+2>=c_y_i. The powers of t in errors are nonnegative,
and omega>0. Non-root variables keep their original weight.
Therefore this entire substitution preserves the Gauss bound H
for every r0. Apply to the original f using the bound for its
g(r0)-translate (the inverse of a Levi element is in the Levi).
We obtain the native second filtration assertion without
assuming exact Frobenius over R or discarding errors.

3. Extract one polynomial and apply exact Stepanov counting.

Reduce coefficients modulo the ideal (w^(l+1)) in R. Let Phi(t)
be the coefficient of X^(pi alpha) in psi(f) after reduction.
Because the G(-omega,m) X-weight of pi alpha is
c.alpha+omega m.alpha, the coefficient of t^j for j>m.alpha
is divisible by w^(ceil(l+omega(j-m.alpha))) and hence zero
in the quotient. Thus deg Phi<=m.alpha. At j=m.alpha the
difference psi(f)-chi(f) is divisible by w^(l+1) owing to
the 1/20 gain. In chi(f) the pair (pi beta,m.beta) determines
beta uniquely: all exponents except x_i,y_i are unchanged,
their sum is recorded by pi and their split is recovered by
the contribution q beta(x_i) to m.beta after subtracting
known other contributions. Therefore the t^m.alpha coefficient
equals f_alpha mod w^(l+1), which is NONZERO by hypothesis.
In particular Phi is nonzero; the quotient need not be a field.

For each r0 the G(+omega,e) X-weight of pi alpha equals
c.alpha-omega e.alpha. Indeed merging y_i into x_i changes
weight by -q omega and all other coordinates are unchanged.
Apply the bound of section 2, with the input translated f as
in that section: the coefficient of t^j in the extracted
polynomial for j<e.alpha is divisible by
w^(ceil(l+omega(e.alpha-j))). This polynomial is exactly
the coefficient of the translated f under the second
substitution; it is NOT automatically Phi(t+u) unless the
translate is accounted for. The source uses g(r0) in the
composition on variables and h(g(r0)) on g(r0)^-1 f.
Apply that composition to g(r0)^-1 f (not to f itself):
the inner actions cancel, leaving taylor_u(psi(f)).
The filtration argument of section 2 is valid for this
input by the original all-Levi premise. Hence t^E divides
Phi(t+u) for E=e.alpha, for EVERY r0 in W.

Choose q representatives of the residue field of W. Their
pairwise differences are units in W, and remain units under
iota_i and reduction. The monic polynomials (t-iota_i(r0))^E
are pairwise comaximal: differences of the underlying linear
factors are units and powers of comaximal ideals are comaximal.
Their product divides Phi (iterate comaximal divisibility).
Its degree is qE; monicity means multiplication by this
product adds its degree to that of any nonzero polynomial,
even over the quotient with zero divisors. Thus
    q * (e.alpha) <= deg Phi <= m.alpha.
Divide by q>0 and use the EXACT native excess weight:
    excess_i(alpha)=(e.alpha - (m.alpha)/q)/q.
The source e is the numerator of the positive part and m
contains q times the opposite numerator.
Consequently excess_i(alpha)<=0. This proves the entire root
lemma under its exact premises, including characteristic p
specialization w=0 and l=0 used by the flag amplification.
No interpolation density or external unproved theorem is needed.

4. Primitive depth factorization: Smith split and counting.

Now specialize to the valuation domain O of characteristic zero
in exists_depth_factorization, so w!=0. Keep all native data:
a<r, all monomial depths d_beta<=x, and e -> (s(e),[g_e^-1])
onto X times the parahoric quotient. Let D_w=diag(w^d_beta).
The actual rectangular J maps F to blocks D_w rho(g_e) F(s(e)).
For a parahoric h, D_w rho(h) D_w^-1 is integral (interpret in
the fraction field): each letter's conjugation by diag(w^deep)
has only possible denominators w when the source is deep and
the target shallow; the exact p-divisibility of those entries
gives integrality since p=w^2. Symmetric powers and tensor
products preserve integrality, and diagonal_pow_depth identifies
the conjugation. For any x0 and gamma choose the native e with
s(e)=x0 and matching inverse coset. Then gamma g_e^-1 belongs
to the parahoric. Consequently if z divides all entries JF,
it divides all w^d_beta (rho(gamma) F(x0))_beta. This is hf
of the source, including gamma=1. Hence J is injective.

Over a valuation domain finite matrices admit diagonalization
by invertible row and column operations: among finitely many
nonzero entries choose one dividing every entry, move it to
the first position, clear its row and column, and recurse.
Injectivity ensures all column pivots t_i are nonzero. Thus
J=U [diag(t_i);0] V with invertible U,V, Q=U first columns,
d=diag(t_i)V, R=first rows of U^-1; Qd=J and RQ=I.
The original proof uses Hermite followed by Smith, yielding
the same split structure. Let v_i=V^-1 e_i. Then t_i divides
Jv_i, hence divides w^d_beta rho(gamma)v_i in all blocks.
At gamma=1 this implies t_i divides w^x times every coordinate
of v_i, and applying row i of V gives t_i | w^x.

Define mu_i=min{tau>=0:t_i divides w^tau}, <=x.
Exactly mu_i values tau in {0,...,x-1} fail divisibility.
For any such tau and any gamma, the coefficients of
rho(gamma)v_i at depth <tau (indeed <=tau) are nonunits:
a unit coefficient would give t_i|w^d_beta|w^tau, contradiction.
Reducing v_i modulo the maximal ideal therefore gives a vector
in the native deepForms(tau) in every x0 block. The reductions
are independent because V remains invertible. Consequently
    # {i : t_i does not divide w^tau} <=
       dim_kres (X -> deepForms(tau)).
Summing before any bounds proves
    det d divides w^(sum_(tau<x) dim_kres(X -> deepForms(tau))).
The determinant of V is a unit. This is the exact native
determinant assertion, including x=0 and trivial rank.

5. Primitive excess assertion — full cutoff, no discrete valuation.

Given arbitrary input j to Q, choose F=V^-1 diag(w^x/t_i) j,
with each ratio integral by section 4. Then JF=w^x Qj, so
w^x divides all entries of JF. For each x0 and every g this
implies w^x|w^d_beta (rho(g)F(x0))_beta. Fix i and let
omega_z=deepIndicator(r,z)-excessWeight(i,a,r,z)/2.
For the root pair a<r, y_s is deep, x_s shallow. Thus
omega_y_s-omega_x_s is (1-1/q)/2 at s=i, and
1-P^j_s/q at other letters. All lie in [0.4,1.6] using
q>=5 and P^j_s/q<=1/5 away from i.

For a fixed block x0 and each monomial beta put
C_beta=max(ceil(x-weight_omega(beta)),0).
Let ell_beta be the largest integer <=C_beta such that every
GL translate coefficient at beta is divisible by w^ell_beta.
This exists because the property holds at zero. Set
mu=min_beta (ell_beta+weight_omega(beta)).
If mu<x, a minimizing beta cannot be capped: C_beta+
weight_omega(beta)>=x. There is then a g whose coefficient
at beta is not divisible by w^(ell_beta+1). Every coefficient
in every frame has weight at least mu, including all further
translates of this chosen frame. Apply sections 1-3 with
the full GL as the one-block Levi and the weight omega.
It gives excess_i(beta)<=0. Hence weight_omega(beta)>=d_beta
and ell_beta+d_beta<=mu<x. But w^x divides w^d_beta times
the chosen coefficient, so cancel w^d_beta (domain, w!=0)
to obtain divisibility by w^(x-d_beta), at least w^(ell_beta+1).
Contradiction. Therefore mu>=x. This handles possibly
unbounded/non-discrete orders without a valuation normalization.

For any beta with excess_i(beta)>h>=2c, we now have
    ell_beta+d_beta >= x+excess_i(beta)/2 > x+c.
So w^(x+c) divides w^d_beta times every translated coefficient.
For any e, the local Levi for twoBlock commutes with D_w
(the deep weights are constant in each block and letter).
Since JF=w^x Qj, cancellation of w^x yields w^c divisibility
of every excessive coefficient of every such Levi translate
of (Qj)_e. This is precisely excessCond(n,a,r,(w^c),h) for
all j,e and every h>=2c. No change of modulus or excess
threshold. This supplies the final field of exists_depth_factorization.

6. Actual consumer and frontier.

The two depth matrices in hasType_twisted_hecke have exactly
these hypotheses: first e -> (src(e), [transpose(g_e)^-1])
is onto by finite equal-cardinality injectivity; second is the
quotient representative map. Extra H-coordinate is a carried
finite factor. Apply sections 4-5 to each separately, with
the same c=2(k+k^2)(o0*N)N+2 and x bounding depths.
Kernel RUN36 already derives the matrix pairing and exponent
assembly on those same Q,Q',d,d',R,R',B,Z; acceleration RUN60
already supplies the flag-volume/count branch conditional on
root_lemma. Sections 1-3 supply that precise root theorem
also at residue characteristic p. These are human derivations
to be merged; not newly native checked. Retain exact projector,
of_pairing, count and hY supplier hypotheses; no theorem imported
from Main, no assumption of RH, no claim of global pruning.

Local dependency ledger: adic/Gauss multiplication and substitution,
Frobenius congruence, Stepanov -> root_lemma -> depth/excess and
flag amplification; parahoric transport + finite Smith ->
depth determinant -> both depth factorizations -> Hecke pairing
and count assembly -> Columns.hasType_markOperator -> uniform
local index RUN61 -> short_forms -> star_inequality. Context key
includes pin,T,a,r,i,weights,R/O,c,x,actual frames,src,g.
Original/reduced native graph and axiom evidence untouched.
Remaining at this interface: actual class-representative hY
operator identity and injectivity, marked TwistingData/HeckeSizes
supplier and independent audit of this derivation plus prior
projector/pairing. Other A level Fourier and B/C primitives remain.

Execution: lean/lake/elan not present on local PATH. Old-pin
rh_scan/prune/reduce/auto/frontier not executed on compact.
Actual CI 45803534769 state blob a56e2d3afb99ed8275e81fd63c8494306e57c43f
and outputs/targeted_results.json re-read: all_requested_checks_ok
=false; six B/C named probes have three standard axioms;
A module build timed out (124, 2700.11 s); wrapper success is not
a primitive verification. No new native PASS or finite diagnostics.
The probes below and scalar inequalities are PREPARED for shared
approved compact runner, not a substitute for native root proof
or full verification. Independent audit requested.

RESUME HERE: audit sections 1-3, especially the substitution
composition g(r0)^-1 f and exact signs, and merge with RUN60;
audit sections 4-5 against both actual factorization callers in
kernel RUN36. Next prime task derive class-representative hY and
parahoric coset injectivity in Columns.hasType_markOperator
146-239, then finish MarkedPrimeType.HeckeSizes. Keep every
unverified dependency; do not redo already sufficient estimates.
HANDOFF TO integration/editor, theta, acceleration, kernel, audit.
-/

namespace CompactPrimeRun62

theorem substitution_margins (d u v : ℝ)
    (hd : (2:ℝ)/5 ≤ d) (hd' : d ≤ (8:ℝ)/5)
    (hu : u ≤ (8:ℝ)/25) (hv : 2 ≤ v) :
    (1:ℝ)/20 ≤ d-u ∧ (1:ℝ)/20 ≤ v-d ∧
    d ≤ 2 ∧ u ≤ 2 := by
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

theorem depth_weight_margin (v : ℝ) (hv : 0 ≤ v) (hv' : v ≤ (1:ℝ)/5) :
    (2:ℝ)/5 ≤ (1-v)/2 ∧ (1-v)/2 ≤ (8:ℝ)/5 ∧
    (2:ℝ)/5 ≤ 1-v ∧ 1-v ≤ (8:ℝ)/5 := by
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

theorem cutoff_margin (ell depth x E c h : ℝ)
    (hmin : x ≤ ell+depth-E/2) (hc : 2*c ≤ h) (hE : h < E) :
    x+c < ell+depth := by linarith

end CompactPrimeRun62

#check stepanov_count
#check aeval_sub_mem_of_gaussFiltration
#check TwistingData.root_lemma
#check TwistingData.exists_depth_factorization
#check TwistingData.finrank_excessCond_le_volume
#check TwistingData.hasType_twisted_hecke
#print axioms TwistingData.root_lemma
#print axioms TwistingData.exists_depth_factorization
#print axioms CompactPrimeRun62.substitution_margins
#print axioms CompactPrimeRun62.depth_weight_margin
#print axioms CompactPrimeRun62.cutoff_margin
