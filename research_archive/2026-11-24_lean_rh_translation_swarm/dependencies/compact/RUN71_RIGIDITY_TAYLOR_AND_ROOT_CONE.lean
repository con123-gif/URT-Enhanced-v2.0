import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Lib.DiscreteSeries.Theta.JointHarmonicExists
import Mathlib.Tactic

/-!
# RUN71 — rigidity by local Taylor continuation; exact root-cone transfer
27 Nov 2026. Human source-matched derivations and local simplification,
not newly kernel-verified. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript ea51739eda55a41749858377bc5635f7e9c49d41.
Observed working head 43ff3e3778325c5eeb07d4c8758e47373459e33a.
Read AGENTS, swarm, handoff, continuity, current mission, compact
manuscript incl. peers 9ce5a9fb, 14196cf5, 784d021e, and RUN70
a5c02498d00af1a06a81c912fe3f0d9e6474ddfa. Continue C's local
theta branch, not B's distinct local Bessel energy.

## 1. Linear growth from one signed Casimir identity

Sources under grh-compact/src/Lib/DiscreteSeries/Rigidity:
CasimirBound.lean  f47bbb602c8e77086cbc4506f6580739716dd2b7;
HighestVectors.lean 05e2716ad17f0ae4dc6043a359ff16f22687e7cb;
CasimirGrowth.lean 46e437f11a82ea966051cc0edec3d6eaa2f9496b.
Actual consumer HCParam.IsKHighest.norm_apply_le_of_mem_filtration.
Keep native IsUnitaryCasimirGe, HasGap, highest vector x of weight
nu, filtration M_s, and |nu_a|<=L. Write n=rank>=1 (rank zero
is trivial), u=L+s. Finite filtration and compact stability
are retained native suppliers. On each M_s, the compact operators
have adjoints E_ab*=E_ba. Thus an invariant subspace has invariant
orthogonal complement, and the finite space decomposes into
irreducible compact modules. Each has a highest vector z (the
native exists_highest_vector). A compact highest z in M_s must
pair nontrivially with some word w of length <=s on x: otherwise
z^perp is stable under compact lowerings and contains all these
words, so the actual filtration_le_of_word_mem puts M_s in it.
Consequently z has the word's weight by selfadjoint diagonals,
and every coordinate is bounded by L+s using E_word_eq_wordWeight_smul.
This does not require the whole noncompact representation
to be irreducible, or a multiplicity-free compact decomposition.

On the compact module containing z, the central compact Casimir
Omega_K is scalar k(mu)=sum mu_a(mu_a+twoRho_c(a)); this follows
from the highest-vector formula and centrality. In particular
k(mu)<=n u(u+n) since |twoRho_c(a)|<=n. Orthogonal summation gives
Re <y,Omega_K y> <= n u(u+n)||y||^2 for y in M_s.
The invariant sign adjoint formula in CasimirBound yields EXACTLY
   sum_ab ||E_ab y||^2 = Re <y,(2 Omega_K - Omega)y>.
The full Casimir lower bound is c(l)=(||l||^2-||twoRho||^2)/4
>=-n^3, using |twoRho|<=n. Therefore
   sum_ab ||E_ab y||^2 <= [2 n u(u+n)+n^3] ||y||^2
                         <= 3 n^3 (u+1)^2 ||y||^2.
Cauchy-Schwarz over the matrix entries, ||X||_F^2<=n||X||_op^2,
gives ||rho(X)y|| <= sqrt(3)n^2(u+1)||X||_op||y||, hence the
native larger constant (n+1)^4. Indeed sqrt(3)n^2<=2n^2
<= (n+1)^4. The image belongs to M_(s+1) by definition.
This is a direct finite compact decomposition proof of the
J=identity consumer of casimirK_bound_of_highest, not a replacement
for that theorem's general J or its later spectral growth use.
Keep the finite filtration theorem and full Casimir lower bound.

## 2. Analytic continuation with uniform local step size

AnalyticVectors.lean c77b2d775e1a82a2469866d779c9438fa46198d4
HCParam.IsKHighest.coeffMap_eq_zero (actual rigidity consumer).
Assume exactly its coefficient-map differentiability and
|c_g(v)|<=D||v|| uniformly in g, and c_1 kills every M_s.
For fixed real unitary Lie direction Y and g0 define
F_v(t)=c_(g0 exp(tY))(v). The coefficient-map identity implies
F'_v(t)=F_(rho(Y)v)(t), hence by induction all derivatives exist,
are continuous, and F_v^(j)(t)=F_(rho(Y)^j v)(t).
Let C=(n+1)^4||Y||, a=L+s+1 positive integer, v in M_s.
The preceding native growth inequality, iterated along M_(s+j),
gives
    ||rho(Y)^j v|| <= C^j a(a+1)...(a+j-1)||v||.
If C=0 all first derivatives vanish, so assume C>0.
At any t0 at which all c_(g0 exp(t0 Y)) annihilate all M_s,
all derivatives of every F_v vanish there. Taylor's integral
remainder of order j (componentwise complex, or Banach-valued
fundamental theorem repeated) gives for real h
    |F_v(t0+h)| <= D||v|| binom(a+j-1,j) (C|h|)^j.
The binomial is a polynomial in j of fixed degree a-1; this
bound tends to zero for C|h|<1. No convergence of a formal power
series or analytic vector theorem is assumed. In particular
|h|<=1/(2C) works simultaneously for every filtration index s
and every v; there is no requirement of a uniform bound on the
polynomial prefactor across s. Taking a finite partition of [0,1]
with steps <=1/(2C), propagate annihilation of ALL M_s to the
end of the one-parameter subgroup. Native exists_eq_expU_mul_expU
expresses any g as two such exponentials; apply the propagation
twice. This proves exactly coeffMap_eq_zero, with ordinary Taylor
remainder replacing the source's more elaborate differential
boundary induction. It keeps the growth estimate and the group
factorization as prerequisites.

## 3. Rigidity at the very same projected vector

KernelFixes.lean b7c9218680d4848f11347c91dd6a952ee9b1a0ca:
coeff_eq_dsCoeff_of_isKHighest, integratedRep_fix_of_isKHighest,
eq_casimirValue_of_ge. SchurOrthogonality.lean
7be5411c2c4c3662db6f10be4c7fda7f63c27287: toL2_spec,
isUnitaryCasimirGe_dsAction.

Use the actual positive invariant form B and derivative iota;
write v=iota(v0), not the unprojected oscillator polynomial.
As in the source, transport to the B-inner-product space and
restrict to the Lie-generated submodule of v. Kernel invariance
of iota follows from derivative uniqueness (or the adjoint
identity); full Casimir acts on this submodule by c>=c(l).
The model D_l of the discrete coefficient psi has normalized
generator psi (norm one), Casimir c(l), same lowest compact
weight Lambda, and |z(g)|<=||z|| by the retained L2 result.
Form the orthogonal direct sum of these two modules. It
satisfies the full Casimir lower bound and sign-adjoint identity.
Put b=B(v,v), x=(v,psi), a=(v,-b psi).
Both a and x are compact highest of weight Lambda, and
<a,x>=b-b=0. Moreover a is perpendicular to M_0(x):
every nonempty compact lowering word on x pairs to zero with
a because its adjoint is a word of compact raisings, whose
rightmost action kills a. The native filtration_le_of_word_mem
at s=0 makes this precise; no cyclic irreducibility assumption.
The vector a has compact Casimir k(Lambda). Now invoke the
actual mem_orthogonal_filtration_of_casimirK at s=0, theta
=k(Lambda): a is orthogonal to EVERY M_s(x).
This spectral separation theorem is a deep RETAINED premise,
not proved by the upper bound in section 1.

The coefficient map on the sum is
    c_g(y,z)=B(v,pi(g)y)-b z(g).
It differentiates by the actual derivative on each summand.
Invariant B and the model bound give
|c_g(y,z)|<=||v||_B ||y||_B + b||z|| <= (||v||_B+b)||(y,z)||.
At identity it is exactly pairing with a, because z(1)=<psi,z>.
Section 2 therefore gives c_g(x)=0, i.e.
    B(v,pi(g)v)=B(v,v) psi_l(g).
No dividing by v. The formula includes v=0.

Now let e_l=d_l conj(psi_l), d_l>0, and f be the actual
weighted-integrable function with f*e_l=e_l. Inversion gives
e_l(y^-1 t)=d_l psi_l(t^-1 y). Thus for every t
   B(pi(t)v, integratedRep(pi,f)v)
   = b integral f(y) psi_l(t^-1 y) dy
   = b psi_l(t^-1)
   = B(pi(t)v,v).
If W=integratedRep(pi,f)v-v, then B(pi(t)v,W)=0 for all t,
including t=1. The symmetry of B and Bochner interchange
(with its original norm continuity and weighted integrability)
imply B(W,W)=integral f(y)B(W,pi(y)v)dy-B(W,v)=0.
Positive definiteness yields W=0. No completion of the B-space
is necessary, nor is f assumed positive.
This proves the actual convolution-fix implication with its
normalization. If f=e_l, the idempotent and row Casimir formula
then give (c-c(l))v=0; for v!=0 this also gives the native
eq_casimirValue_of_ge. RUN69 can instead use exact matched
Casimir equality to avoid that latter comparison at its one
partner consumer, but the source and other consumers are kept.

## 4. Root-cone annihilation, with the correct convolution order

The actual consumer is integratedRep_eq_zero_of_notMem_rootCone,
KernelFixes.lean, used to supply h_c of HoweArgument.lean.
Let v be the embedded K-highest vector of weight nu and
nu-Lambda outside rootCone. If v=0 the result is immediate.
The invariant compact sign adjoint plus the raising commutator
gives K-dominance: for a,b of equal signs, l_b<l_a,
E_ab v=0 implies
  ||E_ba v||^2=<v,E_ab E_ba v>=(nu_a-nu_b)||v||^2 >=0.
Thus nu is dominant for -l as required.
Write m_nu(k)=weightMinors nu k, c_nu=int_K |m_nu(k)|^2>0.
Keep native compact highest-vector average
  int_K conj(m_nu(k)) pi(k)v dk = c_nu v
(the source states it after applying each continuous functional).
Fix arbitrary w and y. Under inversion and right translation
h=(g y)^-1 in the projector coefficient one obtains
  B(w,integratedRep(pi,e_l)pi(y)v)
    = d_l int_G psi_l(y h) B(w,pi(h^-1)v) dh.
Put F(h)=B(w,pi(h^-1)v); it is bounded by B-unitarity.
The compact average says
  c_nu F(h)=int_K conj(m_nu(k)) F(k^-1 h) dk.
Insert this identity BEFORE any absolute-value bound. Fubini
and h=k h' then give
  c_nu int_G psi_l(y h) F(h) dh
   =int_G F(h') [int_K conj(m_nu(k)) psi_l(y k h') dk] dh'.
The inner bracket is exactly zero by
integral_conj_weightMinors_mul_dsCoeff (KTypeProjection.lean
f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a).
The hypothesis nu != Lambda follows since 0 belongs to rootCone.
Absolute exchange is justified by integrability of psi_l,
bounded F and compact K with bounded weightMinors; Haar
translations preserve the required integrals. The native
unimodular Haar and inversion convention are retained.
Since c_nu>0 and w arbitrary, the operator vector is zero.
Differentiate this vector equality along exp(tY) at y=1
in the original Banach topology, then complexify: the actual
row differential image of each off-cone highest polynomial
is in ker(projector). This is the h_c needed by RUN69's
Howe degree induction, not merely the y=1 special case.

KTypeProjection's underlying torus circle-mean/analytic
factorization is a retained supplier. The derivation above
establishes the exact kernel consumer with that hypothesis;
it does not independently establish the Flensted-Jensen
coefficient's spectral support or the compact average.

## 5. Exact existence of the joint harmonic (remaining input)

JointHarmonicExists.lean b2c40a5cb8abaaa561b5c0cbaeb42e155f94e8ff
IsMatch.exists_isJointHarmonic. Reuse RUN70 matched-weight
cancellation and signs: if relWeight(r) !=0 then r has a
matched c with variable sign sign(relWeight(r)); this follows
by applying RUN70 section 2 to the two signs on central rows,
or to the opposite sign of x_r on matched rows. The matched
column relWeight' is its negative. For each sign pair and
each integer j>=0 take the paired rows/columns with
j<|relWeight(r)|. Both projections of a layer are injective.
The row outward-closure follows from lowest-weight compact
dominance: if r' has the same row sign and
s(l_r'-l_r)>0, then s relWeight(r')>=s relWeight(r)>j
(vacuum weight is constant on that row sign). Hence r' is
matched with the same column sign and lies in that layer.
The swapped argument supplies column outward-closure, since
the swapped variable sign is -s. Across layers sharing a row
the column sign is fixed by its unique matched partner.

Let Phi be the product of the layer minors of the variable
matrix X_{r,c}. Each determinant is nonzero: injective rows
and columns give distinct independent variables and the
diagonal monomial coefficient is one. The product is nonzero
in the polynomial domain; an empty layer product is one.
The polarised row derivation D_ab^s acts on each layer by
replacing row b by row a if b occurs and variable sign is s.
For compact raising order s(l_a-l_b)>0, outward closure
ensures a already occurs in that layer, so the replacement
determinant is zero. On the diagonal the derivation counts
exactly the number of layers containing that row of sign s.
Subtracting the negative polarisation and adding the vacuum
weight gives the actual Lambda_a. For the column action
repeat with transpose and swapped sign; the weights are
Lambda'_c. This is precisely the trace-of-row-derivation
identity derivation_prod_det (transposing rows/columns as in
native IsLayering). No cancellation between different
minors is assumed. For either family's opposite-variable
Laplacians, each row (respectively column) occurring anywhere
in Phi uses a single variable sign: its paired sign is fixed
across layers. Thus each summand differentiates at least one
absent variable and vanishes. This proves both harmonic
conditions and joint highestness with the native layer
witness. Combined with RUN70 this is existence and uniqueness
of the actual matched joint harmonic, conditional on the
same native lowest-weight dominance and oscillator formulas.
No extra positivity premise or dimension bound introduced.

## Frontier, audit, handoff
Root-visible source chain preserved (not elaborated DAG):
star_inequality -> C integral_forms_long -> comparison/Hecke
forms -> MemberOrthogonality -> half edge -> local theta
generation -> partner rigidity, h_c, joint harmonics.
RUN71 supplies local human derivations for norm growth (at
J=1), coefficient continuation, convolution-fix transfer,
off-cone projector transfer and joint harmonic existence.
Original graph remains; candidate shorter local path replaces
only analytic boundary induction and compact norm upper
bound at their stated consumers. Deep remaining prerequisites:
mem_orthogonal_filtration_of_casimirK (compact spectral gap),
finite_filtration, compact average, Flensted-Jensen circle
mean, normalized L2 realization, actual oscillator model
and global period/Fubini callers. No global deletion.
Native lean/lake not on PATH; no native rh_scan/prune/reduce/
auto/frontier on this pin. Original pin evidence preserved.
Actual compact CI state targeted_results.json read again,
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named
checks (TiltingLemma/Moments) standard axioms; module_1 build
exit 124, all_requested_checks_ok=false, full_RH_replay=false.
Below prepared scalar certs and source probes, uncompiled;
no new PASS or claimed kernel closure. No URT or claimed RH
theorem imported. All old axiom and dependency files unchanged.

RESUME HERE: derive the actual spectral separation theorem
mem_orthogonal_filtration_of_casimirK (CasimirGrowth), focusing
on its P E-word energy commutator recurrence, and audit the
compact average plus KTypeProjection circle-mean at their
precise callers. Submit the scalar checks and native probes
below with RUN69/70 to shared compact runner when resources
permit. HANDOFF TO integration/editor, independent audit and
kernel runner. Human proof not complete.
-/

namespace RHDependencyRun71

theorem energy_majorant (n u : ℝ) (hn : 1 ≤ n) (hu : 0 ≤ u) :
    2*n*u*(u+n)+n^3 ≤ 3*n^3*(u+1)^2 := by
  have hn0 : 0 ≤ n := by linarith
  have h1 : u+n ≤ n*(u+1) := by nlinarith [mul_nonneg (sub_nonneg.mpr hn) hu]
  have h2 : u*(u+n) ≤ n*(u+1)^2 := by
    calc
      u*(u+n) ≤ u*(n*(u+1)) := mul_le_mul_of_nonneg_left h1 hu
      _ ≤ (u+1)*(n*(u+1)) :=
        mul_le_mul_of_nonneg_right (by linarith) (by positivity)
      _ = _ := by ring
  have h3 := mul_le_mul_of_nonneg_left h2 (show 0 ≤ 2*n by positivity)
  have h4 : n^2 ≤ n^3 := by nlinarith [mul_nonneg (sq_nonneg n) (sub_nonneg.mpr hn)]
  have h5 := mul_le_mul_of_nonneg_right h4 (sq_nonneg (u+1))
  have h6 : 1 ≤ (u+1)^2 := by nlinarith [sq_nonneg u]
  have h7 := mul_le_mul_of_nonneg_left h6 (show 0 ≤ n^3 by positivity)
  nlinarith only [h3,h5,h7]

theorem compact_casimir_payment (c k a : ℝ) (hc : -a ≤ c) (hk : k ≤ a) :
    2*k-c ≤ 3*a := by linarith

end RHDependencyRun71

#check HCParam.IsKHighest.norm_apply_le_of_mem_filtration
#check HCParam.IsKHighest.coeffMap_eq_zero
#check mem_orthogonal_filtration_of_casimirK
#check coeff_eq_dsCoeff_of_isKHighest
#check integratedRep_fix_of_isKHighest
#check integratedRep_eq_zero_of_notMem_rootCone
#check integral_conj_weightMinors_mul_dsCoeff
#check IsMatch.exists_isJointHarmonic
#check OscillatorPair.exists_bump_integratedRep_eq
#print axioms RHDependencyRun71.energy_majorant
#print axioms RHDependencyRun71.compact_casimir_payment
