import New.Filling.GlobalSieve
import New.Heights.OneDeterminant
import New.Filling.Moments

/-!
# RUN51 — compact Theorem B: finite Fourier determinant and global Poisson sieve

26 November 2026. HUMAN SOURCE-MATCHED / native replay outstanding. Primary pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude. No import of New.Main or Main
and no use of the RH theorem. Latest mission blob 23f64d503b7d64bb13b9667156b499021038d742.
Retain the original constants (expanded workload/proof-only amendment).
The source formal proof and our incomplete human reconstruction are distinct.

This batch proves the human arguments for three connected suppliers: the
finite-field determinant bound, product positivity/lower semicontinuity, and
the normalized recurrence of the actual global sieve. It also proves the
Fourier-support assertion in the latter and maps its consumer. The quantitative
local frequency/head bounds are retained, not assumed to follow from positivity.

## 1. Finite-field determinant lemma (the other input of the positive-type sieve)

Source New/Heights/OneDeterminant.lean, card_mul_sum_det_le, blob
329f004f845b9e2becc896419c8594e82dfef0a6. Read full proof body.
G finite, pi:G -> GL_r(F_q) a representation, A_0,A_1 r by m matrices,
Theta(s)>=0 with <u_a,u_b>=Theta(a^-1 b), M=sum Theta. Inner products
are linear in their second variable. For each nonzero v in F_q^m and
either ordinary or dual action assume the mass of the fixer of A_b v
is <=Y, Y>=0. These are exactly the source h0, hu, hY, h;
no injectivity of A_b required in this abstract statement.

For x in F_q^r let e_x be the standard orthonormal basis of C^(q^r).
For z in F_q^r define f_z(w)=q^(-r/2) psi(-z^T w) for a nontrivial
additive character psi of F_q. Orthogonality of additive characters
makes (f_z)_z another orthonormal basis, including in prime-power fields.
Let pi^vee(a)=pi(a)^(-T). For nonzero y,v in F_q^m form
 U_y=sum_a f_(pi^vee(a) A_1 y) tensor u_a,
 V_v=sum_b e_(pi(b) A_0 v) tensor u_b.
The group-difference identity sum_(a,b) h(a^-1 b)=|G| sum_s h(s)
gives ||U_y||^2=|G| mass(fixer_dual(A_1 y))<=|G|Y
and ||V_v||^2<=|G|Y. Crucially, the cross-inner-product is exactly
 <U_y,V_v> = |G| q^(-r/2) sum_s psi(y^T A_1^T pi(s) A_0 v) Theta(s).
The sign follows from conjugating f_z in the first slot. The dual action
is needed because (pi(a)^(-T)z)^T pi(b)x=z^T pi(a^-1 b)x.
Hence Cauchy-Schwarz bounds the absolute value of that character sum
by q^(r/2)Y for y,v nonzero. If either y or v is zero, it equals M.

Average over v and sum over y. Character orthogonality gives the exact
identity
 sum_y q^(-m) sum_v sum_s psi(y^T A_1^T pi(s) A_0 v) Theta(s)
 = sum_s Theta(s) |ker((A_1^T pi(s) A_0)^T)|.
Indeed the average over v is 1 precisely when y is in the left kernel.
The left kernel has at least q elements if the determinant is zero,
so q*mass(singular) is bounded by the right side, using Theta>=0.
On the left, terms with y=0 contribute M; terms with v=0 contribute
at most another M (overlap may be counted twice); the remaining terms
contribute at most q^m q^(r/2)Y by the previous bound. Thus exactly
 q*mass(singular) <= 2 M + q^(m+r/2)Y.
This proves the native finite determinant estimate. If m=0 the
determinant is 1 and the inequality is trivial.

Consumer: New/Filling/Moments.lean sum_le_of_positive_type uses this
on a single selected place and leading-minor frame pair; the two
frame actions are the ones specified by vectorFixer. Integrate with
peer 10d0bbef7bac3b250634671f62a5840de91fc097 (finite normalized-mass
maximum), which already proves the rest of that step using the native
energy_fixingSet_le. We have supplied its previously cited finite
determinant argument, not the hard energy bound.

## 2. Product positivity and lower semicontinuity of the actual sieve

Source New/Filling/EichlerFlag.lean, blob
3da2606a049a092719b779802cb8ead3af7141ce: SieveSystem, SieveSystem.pi,
step_sum, nonneg_and_lowerSemicontinuous. Actual structure read.
Use local measured rings, characters psi with psi(0)=1, entry maps u,
frequency maps iota, forms J_j, nonnegative head bounds Lambda_j and
decay beta. For each j<=n the common-entry insertion integral at frequency
zero is J_j; at unit frequency xi its norm is <=beta(xi)Lambda_j(p)Lambda_j(q).
Top kernel J_(n+1) is continuous and PSD on heads sharing entry n.
Bottom modulus <=En. Unequal entries at j<n with unit iota-difference
have the off_diagonal bound for J_(j+1) specified by the structure.
All integrability hypotheses in step are kept.

The product system over the finite places T and every infinite place
has product J, Lambda, beta, En, and psi. Fubini proves step, because the
functions depend separately on coordinates and are integrable; the
norm of a product is the product of norms. The top matrix is the
entrywise product of PSD matrices: choose Gram vectors in each factor,
their tensor products realize the entrywise product. Continuity and the
bottom/off-diagonal estimates are inherited factor by factor, since
a unit in the product ring is a unit in every factor. This proves
SieveSystem.pi, not a claim that arbitrary pointwise-positive forms are PSD.

For fixed finite heads a_p, insert a common entry c at j and sum over
p,q to obtain F_j(c). The sum is integrable, and
 integral F_j = sum_(p,q) J_j(a_p,a_q),
 |integral psi(xi c)F_j(c)| <= beta(xi)(sum_p Lambda_j(a_p))^2.
These follow by finite linearity and triangle inequality; the head
square is taken only after summing the two independent head indices.
For any family of heads sharing their j-th entry, the corresponding
sum of J_(j+1) is real nonnegative: at j=n it is the top Gram
quadratic form on the all-ones vector. For j<n integrate a common next
entry, using the already proved statement at j+1. The zero-frequency
identity is essential here. At top, continuity follows from J_(n+1).
For earlier j, apply Fatou to the nonnegative integrand obtained by
inserting a common next entry; continuity of the original heads at the
point is inherited by the updated heads for each fixed next entry.
This gives lower semicontinuity (the native first-countability and
measurability hypotheses are retained). This is the entire backward
positivity argument, and explains why no absolute values are needed on
the common-entry sums before Poisson.

## 3. Global Poisson recurrence, including the exact frequency support

Source New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372,
one_sided_poisson; Lib/Adelic/Adeles/OneSidedPoisson.lean
a25be173895ff618778b3be176cb191f489f5ad2,
IsDualFamily.sum_le_of_fourier (classical one-sided adelic Poisson).
Use the actual finite sets V subset A subset E^times, each element and
its inverse integral off T, and g^-1 integral off T. Let
 l_va=S.frameScaleSq v a, c_a=vol(O_hat)/prod_v l_va^2>0,
 C_i=prod_(a<i)c_a, C_0=1.
The heads H_i(p,t) are the source hd: prefix p in A^i, then the
common t at coordinate i, padded by ones, with real entries scaled
by l_va and finite entries embedded into LocProd T.
Write L_i(p)=Lambda_i(H_i(p,1)). The actual head hypothesis is
 (sum_p L_i(p))^2<=Gamma C_i for i<=n; Gamma>=0 in the nondegenerate
case follows already at i=0. Keep hP, the bound by epsilon>=0 on EVERY
finite sum of beta(ratPoint T (c_v/l_va) y) for nonzero T-integral y,
whenever |c_v|^-1<=|kappa_v|/g. No extra restriction on the finite set
of frequencies is introduced.

Define X_i(V)=Re sum_(t in V,p,q in A^i) J_(i+1)(H_i(p,t),H_i(q,t)).
To apply Poisson at entry i, use F_i(c) from section 2 and pull back to
the full adeles, setting it zero off U=E_infty x integralOff(T).
The map m(z)=((l_vi z_v)_v,evalPlaces(T) z_f) sends the restricted
volume to c_i times the product volume: each complex scaling has real
Jacobian l_vi^2, and the finite restriction pushforward contributes
vol(O_hat) (native map_evalPlaces_restrict_volume). Thus the same
constant c_i multiplies the zero and all nonzero Fourier coefficients.
The pulled-back function is nonnegative, integrable and lower
semicontinuous at the finitely many rational points used: U is open,
and the entry t is a unit at all coordinates, giving continuity of
unitOrOne there. At these points it has exactly the values in X_i(V).

Here is the support cancellation from the actual proof. Reindex the
dual rational variable by the nonzero different generator varpi as in
the native Equiv.divRight step. For an off-T integral finite adele r,
the vector r-adeleOfLocal(T,evalPlaces(T,r)) lies in the omitted-place
integral subgroup, and translation by this vector preserves the
pullback, including its U indicator. Its Fourier coefficient is
multiplied by the corresponding additive character; consequently a
nonzero coefficient forces that character to equal 1 for EVERY such r.
Native forall_selfDualChar_mul_eq_one_iff, with the normalized self-dual
character, identifies the annihilator of O_hat with O_hat. Therefore
the reindexed rational frequency y must be integral off T.
This argument is not an assumption that all rational Fourier modes
are T-units: it establishes integrality off T and only needs y != 0
to be a unit in each of the local fields. The finite character on T
matches the global selfDualChar for such products by
charOnPlaces_evalPlaces; at infinity the native wave gives c_v =
2 pi I / Phi_v(varpi). The exact source guards abs_kappa_eq and
frameScaleSq guarantee |c_v|^-1<=|kappa_v|/g.
The zero frequency integral is c_i times the common-entry integral
in step_sum; all other frequencies together are at most
 c_i epsilon (sum_p L_i(p))^2
by the support argument, the step_sum bound and hP. The real integral
at zero is nonnegative, so the norm does not introduce a loss.
One-sided Poisson now gives
 X_i(V) <= c_i [Re sum_(p,q in A^i) J_i(H_i(p,1),H_i(q,1))
                        + epsilon Gamma C_i].       (P)

For i=0 the head is empty and |J_0|<=En, so X_0(V)/C_1<=En+Gamma epsilon.
For i>=1 write each prefix uniquely as a prefix of length i-1 followed
by t in A. Split the double sum in (P) according to t=v or t!=v.
The diagonal is EXACTLY X_(i-1)(A), by the padding identity
H_i(snoc(p,t),1)=H_(i-1)(p,t); no new witness or inequality here.
For t!=v, y=g^-1(t^-1-v^-1) is nonzero and integral off T. The native
iota difference is ratPoint(T,(g/l_v,i-1)_v,y).
The hypothesis hP for the singleton {y} applies, since
g^-1<=|kappa_v|/g (native one_le_abs_kappa). Hence beta at each such
difference <=epsilon. The off_diagonal axiom at i-1 then bounds the
aggregate by epsilon (sum_p L_i(p))^2 <=epsilon Gamma C_i.
Using all p,q for this bound is legitimate because the head weights
are nonnegative. No false bound on a sum of arbitrary unrelated
frequency terms is used. Substitution in (P) yields
 X_i(V)/C_(i+1) <= X_(i-1)(A)/C_i + 2 Gamma epsilon.
Induction, using A itself at all earlier stages, gives the native
 X_i(V)<=C_(i+1)[En+(2i+1)Gamma epsilon].
This is the exact one_sided_poisson conclusion, with the original
constant and quantifiers. It is not a heuristic repeated Fourier
approximation. No sum over infinitely many heads has been interchanged.

## 4. Actual consumers and open suppliers

GlobalSieve.sieve forms the product system using the real band limits
and finite sieve from FiniteSystem.exists_finite_sieveSystem, then uses
sum_frequencies_le twice: for beta decay and for the head-weight budget.
Its resulting bound is exactly
 C_(rho+1)[e prod_v((1+b^-10)/deg_v)
                  + b^(-6 k f-10)/besselDegree].
We have not yet reconstructed sum_frequencies_le's primitive
rank-one sublattice discriminant proof and all scale substitutions
in sieve; keep those as real open human obligations. Likewise the
sharp bottom/local band limits and the local top kernel remain
required. Moments.energy_fixingSet_le consumes sieve with the same
finite-system witness Z and correlation Gram matrices, and combines
it with energy_le_of_linkEnergy_le. In particular no alternative
independent normalization of Z is permitted. Peer 51e3e7cf and
67acc5c6 already reconstructed the relative bottom-energy normalization
and first-hit capped-floor estimate; do not duplicate them.
Actual root route: energy_fixingSet_le -> sum_le_of_positive_type ->
Fits.exists_translate_finrank_comap_le -> Data.ramifiedColumns_fill_rows ->
Data.enough_forms -> exists_family_covolumeSq_le -> star_inequality.
The finite determinant branch enters sum_le_of_positive_type directly.
Source graph before and after: identical mathematical dependencies;
three source nodes now have explicit human proofs from the retained
standard Fourier/Gram/Fatou and source-local premises. No deletion of
axioms or dependencies on the basis of source text.

Source ledger in addition to above:
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
- New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea
- New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216

Execution status: source bodies and hashes retrieved from the actual
compact pin, latest peer commit list and three peer diffs read. Local
command -v lean and command -v lake found neither executable. No new
native replay/CI, no reported PASS. Old 4.33 engines and CI on the
original mirror are not compact 4.35 certificates and cannot be mixed
into this file. The prepared commands below audit the actual native
declarations and the scalar recurrence; they are not evidence of a
kernel execution and do not prove equivalence of the prose automatically.

RESUME HERE: prove the actual GlobalSieve.sum_frequencies_le rank-one
sublattice bound from its lattice discriminant/index lemmas, then
derive the head-product and frequency-size substitutions in sieve
and substitute that bound into energy_fixingSet_le, keeping the same
Z/Gram family. Alternatively close the crude-energy pair-weight
assembly once its native count supplier is human reconstructed.
HANDOFF TO: integration, human editor, audit, kernel extractor (compact pin).
-/

namespace RHPositivityCompact

/-- Scalar recurrence in the actual normalized one-sided Poisson assembly.
    The preceding proof establishes the two inequalities at the native caller;
    this small lemma checks only their finite scalar iteration. -/
theorem poisson_recurrence (F : ℕ → ℝ) (En Γ ε : ℝ)
    (h0 : F 0 ≤ En + Γ * ε)
    (hs : ∀ i : ℕ, F (i+1) ≤ F i + 2 * Γ * ε) :
    ∀ i : ℕ, F i ≤ En + (2 * (i : ℝ) + 1) * Γ * ε := by
  intro i
  induction i with
  | zero => simpa using h0
  | succ i ih =>
    have h := hs i
    push_cast
    linarith only [h, ih]

#print axioms poisson_recurrence
#check card_mul_sum_det_le
#check SieveSystem.pi
#check SieveSystem.step_sum
#check SieveSystem.nonneg_and_lowerSemicontinuous
#check Filling.one_sided_poisson
#check Filling.sieve
#check Filling.sum_le_of_positive_type
#print axioms card_mul_sum_det_le
#print axioms SieveSystem.nonneg_and_lowerSemicontinuous
#print axioms Filling.one_sided_poisson
#print axioms Filling.sieve

end RHPositivityCompact
