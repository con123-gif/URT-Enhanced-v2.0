import New.Rows.ComparisonForms
import New.Rows.HeckeValueHeight
import Lib.Weil.Lift.Edge
import Lib.GLn.SchurModule.SchurOrthogonality

/-!
# RUN68 — actual finite-place covariance and highest-vector supplier
27 Nov 2026. SOURCE-MATCHED human derivation, certificates prepared, not compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript blob 52c0ccfd0dc525f446dd8bc935a7df71912c8709;
observed branch head 9f17e4416d923898ed5738fe13b621070abcdb8f.
RUN67 dc78b895dff1e67e6f1b76771f5c6b884c3e6cb0 retained.
Recent peer commits inspected: 9f17e441 (integral branching),
5ddf30c7 (editor), d0a3d115 (integration), 41c63681 (Fischer),
885b65aa (Kolyvagin), 8193aed7 (safety windows). Distinct supplier
from their tasks. Mission, protocol, handoff, AGENTS, continuity read.

## 1. Exact native lv: support and determinant, no norm losses

Source New/SiegelWeil/AuxPairVanishing.lean
8613d2aaed78ee56e6866907ddda2d7a8e951eee, lines 83–100,
local lv of descentsVanish_of_reflectionSum.
At each j use the source matrices A_j,B_j over the local integer
ring R_j, with s_j=I+B_j^t A_j modulo the maximal ideal, s_j
invertible. Let k_j=I+A_j B_j^t. The block matrix
 [ I  A_j ; -B_j^t  I ]
has determinant det(I+B_j^t A_j)=det(I+A_j B_j^t):
eliminate the lower-left block using the first identity pivot or
the upper-right block using the second. Both row operations have
determinant one. Thus det(k_j) is a unit in R_j, since its
reduction is nonzero, and the adjugate formula gives an integral
inverse. No restriction on the residual characteristic. The source
uses det_one_add_mul_comm and isUnit_of_mapMatrix (residue _).
The finite support construction exists_atPlace_eq (same file)
then realizes these matrices by one k in Kf E n with the
prescribed split components and identity off the chosen places
and their conjugates. Retain the conjugate-disjoint support
hypothesis and actual compatibility at conjugate places.

Let L=integralBox at these places, X the Hom-coordinate vector,
and K the linear action X -> kX. Since k and k^-1 preserve L,
K L=L. The source radius t is a scalar idele, so K(tL)=tL.
Hypothesis H is exactly t^-1(q-Kz) in L, component by component;
the source applies idem to restrict to the named places.
Consequently
    t^-1(K^-1 X-z) in L iff t^-1(X-Kz) in L
                          iff t^-1(X-q) in L.
The second equivalence uses translation by the single element
t^-1(q-Kz), not a larger support box. Hence
    1_(z+tL)(K^-1 X) = 1_(q+tL)(X).
This equality includes zero values off support. No integration
Jacobian appears here: it is equality of functions, not a
change of measure in the local Schwartz space.
Source mulVec_mem_integralBox and add_mem_cancel_right at lv.

## 2. The exact covariance of the lift, with conjugation

Lib/Weil/DualPair/PairSumNegation.lean
d2f45383d2e972574a7e749da0f2b4bb9283c6da:
pairWeil_name_of_mem, pairWeil_eq_smul_of_projOn_eq.
Lib/Weil/MixedModel/NameWeilAction.lean
a8bee0d694dc7891bb451bc6503f45aed919d2d3: Space.omega_name.
Lib/Weil/DualPair/PairReal.lean
b45749d2e304ca38912dba6379ab5284468e8f77:
pairWeil_integrated_fin and pairWeil_integrated.
Lib/Weil/DualPair/Lift.lean fccbd7536c6b333975f17078ed355e71d0b11f25:
Space.lift, ThetaKernel.lift_equivariant, lift_omega_left.

For the unswapped pair (W,V), a=upsilonU1^(negCount signs),
b=1 here (NOT the b of O.pairThetaKernel in the next section).
The finite action (1,k) has vacuum factor a(detFin k) by
pairWeil_eq_smul_of_projOn_eq with A=top. This equals 1 on Kf
by the unramified upsilon character. Source StackedDeterminants
daff82b60b82df78d82e94c9e1a4f5d0fb0673d4, abbrev a; retain
the native upsilon compact-unit law. The real polynomial P is
unchanged by the finite action. In the general name covariance
formula, the pullback is h_f^-1 X g_f, not its inverse.
Space.omega_name supplies this by equivariance on translated
box indicators and the Schwartz-Bruhat spanning theorem; for
integral g,h the integral-box pullback is the original box,
and the projection identity reduces the auxiliary vector to
the compact translate of the vacuum. Thus the actual swapped
kernel omega(k,1) sends phi_z=P tensor name(1_(z+tL),vac)
to phi_q, by section 1. Keep the name/Schrodinger covariance
and spanning input explicit; this is not a proof for arbitrary
nonintegral adelic matrices.

Write y_u(v)=conj(algFormCoeff(1,gramForm u,y)(v)).
For automorphic y_u and quotient right Haar measure, the lift
is integral theta(omega(v,g)phi) y_u(v) dv. Substitution v'=v k
in the lifted integral gives
    Lift(omega(k,1)phi, v -> y_u(v k))(g)
      = Lift(phi,y_u)(g).
Both factors are translated in the SAME direction; the
rational invariance of theta and y gives quotient functions.
No complex conjugation of the datum is introduced by this
change of variables. The rapid-function integrability used
for bilinearity is the native Lift.integrable_theta_mul.
RUN67's level-character identity identifies pi(k)y with
(prod psi_j(det s_j)^-1) formAction(s_M)y.
The coefficient translation follows directly from the
definition of algFormCoeff at the finite component. Apply
complex conjugation to the entire coefficient AFTER that
identity. This gives the exact source lv:
    C(q, (prod psi_j(det s_j)^-1) formAction(s_M)y)=C(z,y).
In particular the scalar in the form slot is inverse, but
its contribution to the scalar-valued lift is conjugated.
There is no unproved replacement of the actual form action
by a datum action or cancellation of two unrelated characters.
Both reflection and tower hypotheses of RUN65–67 remain.

## 3. Highest-vector cyclicity via a single rank-one mean

Lib/GLn/SchurModule/SchurOrthogonality.lean
38fc814129f5fb9216021443b33a42769d18374d:
exists_intertwining_mean, schur_orthogonality,
gramForm_highestVector_self, star_highestVector.
Lib/Adelic/CuspForms/WeightParameter.lean
6eb1f0d936d612a318e714817b03fceac71ea082: highestVector_cyclic.
Lib/GLn/SchurModule/WeightRepBasic.lean
7417d8c31f21090bfa515568339b768290093d02:
gramForm_conjWeylRep.
Lib/GLn/Branching/Branching.lean
669d2de08c3fa16386120153629ca6cde94e5dde:
scalar_of_commute_schur (actual body inspected; standard
irreducibility/Schur input, not an appeal to theta duality).

Let H=product of the compact U(n) at infinity, with its
normalized Haar measure, rho=conjWeylRep(kappa,e), d=dim rho>0.
Use the native Gram form, conjugate-linear in the first slot.
For a,c define the linear rank-one map T(v)=c <a,v>.
The operator B=integral rho(x)T rho(x)^-1 dx commutes with
rho(y), by left invariance of Haar and the group law.
The determinant twist of rho is a nonzero scalar on each
group element, so a commutant of rho is a commutant of the
underlying Schur representation (complex conjugation
permutes the unitary matrices). Schur irreducibility
therefore gives B=lambda I. Trace commutes with the
finite-dimensional integral, and trace(T)=<a,c>; hence
lambda=<a,c>/d. Applying an arbitrary linear f to B u gives
    integral f(rho(x)c)<a,rho(x)^-1 u> dx
       = <a,c> f(u)/d.
This is the exact native Schur orthogonality formula.
The native injectivity of every Harish-Chandra parameter
orders each coordinate set by an actual permutation;
the permutation-evaluation Gram norm theorem gives
<v+,v+>=1. Thus setting a=c=v+ proves:
if f(rho(x)v+)=0 for every x, then f(u)=0 for every u.
The other disjunct of highestVector_cyclic follows if
<v+,rho(x)u>=0 for every x, since x^-1 ranges over H.
At the actual consumer only the first stated condition
on f (native .inr) is used; the other disjunct is dispensable
in this local exposition, not globally deleted. This is a
direct rank-one averaging proof, with no individual orbit
basis construction and no independence claim for a sample.

## 4. Actual caller: transfer from the fixed highest vector

New/Rows/MemberOrthogonality.lean
aca8828d477a4510ab80964e1572f34ef220a2c1, lines 35–53,
descentsVanish_hypSum; New/Forms/AuxiliaryPair.lean
0133ff2b5d6fd5937eb267026ed1959c8788c312:
theta_eq_smul_star_lift_swap.
Here use the actual pair with characters O.a,O.b, not b=1
until the swapped action reduction in the reflection lemma.
From theta_eq_smul_star_lift_swap, h0: O.theta Xi=0 implies
F0=0, where F0 is the swapped lift using the fixed joint
harmonic datum at v+ and conjugate coefficient of Xi at v+.
The multiplier d*stdLevelIndex is nonzero: d>0, the index
of the open compact subgroup is positive. Native star_highestVector
ensures that the fixed harmonic vector is in the required
conjugate convention.

Fix an arbitrary P and g. The map f(u)=Lift(P tensor Upsilon,
conj(algFormCoeff(1,gramForm u,Xi)))(g) is COMPLEX LINEAR in
u because the Gram form is conjugate-linear in u and the
outer star conjugates again; rapid functions supply the
domain for liftBilin. Unitarity gives
   y_(rho(x)v+)(v)=y_v+(v*(x,1)).
By lift_omega_left with k=(x^-1,1), this is
   f(rho(x)v+) = Lift(omega((x^-1,1),1)(P tensor Upsilon), y_v+)(g)
in swapped-kernel notation. The archimedean action sends P
to another polynomial Fock vector Q_x (realPairWeil_polyVector);
the finite Upsilon is unchanged. By the actual swapped
IsHalfEdge.lift_isForm_and_eq_realConv on Q_x, this lift is
realConv(alpha_x,F0)(g)=0. Here the test coefficient is a
form of the conjugate source type (isForm_ofAlgForm.conj),
and the real integration law is pairWeil_integrated.
This provides precisely the native .inr premise for
highestVector_cyclic; section 3 yields f(u)=0 for all u.
The character removal from b to 1 in the source is via
the scalar in pairWeil_apply, not equality of arbitrary
Weil representations. Retain that scalar in the integrand
and the existing automorphic/character hypotheses.
Now descentsVanish_of_reflectionSum applies to the fixed
u coefficient, followed by descentsVanish_add_planes
with the actual Hecke annihilation and strict rank bound.
Both class-period consumers from RUN65 use this conclusion.

## 5. Further source expansion: what the local edge really needs

Lib/Weil/Lift/Edge.lean 5e5f40a06dd7a9a358e92987277eca74705f8f57,
isHalfEdge_of_oscillatorPair, ParamsCorrespond.isEdge_jointHarmonic.
Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean
2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8:
exists_bump_integratedRep_eq, integratedRep_fix.

The real convolution input is not simply cyclicity of a
compact type. For each archimedean w, let E_w be integrated
source discrete-series projector and Phi_w the joint harmonic.
The native local bump supplier says, for each monomial M_w,
    E_w M_w = pi'_w(alpha_w composed with inversion) E_w Phi_w
with compact smooth alpha_w on the other group.
For a global polynomial P=sum_a c_a product_w M_(a,w),
choose these bumps for each a in its FINITE support and put
    alpha=sum_a c_a product_w alpha_(a,w).
It is compactly supported and continuous (finite sum of
products on a finite product of groups). The source
integral_piTensor_eq_integratedRep applies to each term,
using integrable weighted dsKernel, integrable bumps,
unitarity and continuous multilinear tensor maps. Insert
the source projector in the lift using the source-form
convolution identity, right equivariance, inversion of Haar
and Fubini with the norm-theta-times-y majorant. The actual
source proof names this equality M v g. Move the target
bump through the theta lift by the real action law and
lift_mul_right (the inversion in the local bump definition
is essential to the resulting right convolution). Finite
linearity now gives Lift(P)=realConv(alpha,Lift(Phi)).
This is the part of isHalfEdge_of_oscillatorPair needed by
section 4. Its separate conclusion about target form type
is not needed at this caller; keep other consumers intact.
The nonzero inner-product and matching-type/large-gap
conditions remain in the original graph. The substantive
local exists_bump_integratedRep_eq still uses Howe's
polynomial generation, root cone annihilation, the derived
action and bump smearing; it is NOT discharged by this
tensor calculation. Native hO.isEdge.2 and the exact
joint harmonic match remain retained inputs.

## Evidence / reduced frontier

Original source-visible path (not a complete elaborated DAG):
C -> ComparisonForms, HeckeValueHeight -> MemberOrthogonality
 -> descentsVanish_hypSum -> reflection lv -> pairWeil_name_of_mem,
 lift_equivariant, level covariance (RUN67)
 AND highestVector_cyclic -> Schur mean, fixed theta zero,
 swapped half edge -> local bump identity, joint harmonic match
 AND add_planes -> prior rank contraction and analytic bound.
Reduced exposition uses the exact integral coset equality,
one change of variables, one normalized rank-one mean, and
finite polynomial tensor summation. All surviving nodes and
other consumers retained. No global kernel dependency deletion.
Context key (compact pin, signs, actual pair characters,
place family, t, coset, level, coefficient u, P, Xi, consumer).
No URT, speedup, or claimed-RH import. Local command -v
lean/lake/elan returned none. No native rh_scan/prune/auto
execution or new axiom audit; old-pin engines not a compact
certificate. Actual CI run 45803534769 retrieved jobs and
state-branch status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named TiltingLemma and Filling.Moments declarations checked
with propext, Classical.choice, Quot.sound; module_1 timeout
124; all_requested_checks_ok=false, full_RH_replay=false.
No fresh PASS. Below executable scalar/additive certificates
prepared for shared native replay, not themselves full bridges.

RESUME HERE: actual LocalThetaCorrespondence.exists_bump_integratedRep_eq,
trace the Howe generation submodule and its two stability conditions,
root-cone killing and bump identity; check exact native matching
hypotheses at hO.isEdge.2. Then integrate RUN65–68 into class-period
supplier without rederiving scalar, support, halving or rank contraction.
HANDOFF TO integration/editor and independent audit/kernel.
Human reconstruction incomplete; central star inequality conditional.
-/

namespace CompactPeriod68

/-- Exact coset replacement: the shift belongs to the same additive subgroup. -/
theorem same_coset {G : Type*} [AddCommGroup G] (L : AddSubgroup G)
    (x q z : G) (h : q - z ∈ L) : x - q ∈ L ↔ x - z ∈ L := by
  constructor
  · intro hx
    have hsum := L.add_mem hx h
    convert hsum using 1 <;> abel
  · intro hx
    have hsub := L.sub_mem hx h
    convert hsub using 1 <;> abel

/-- Scalar endpoint of the normalized rank-one Schur average. -/
theorem cyclic_scalar (d F I : ℂ) (hd : d ≠ 0)
    (h : I = d⁻¹ * F) (hzero : I = 0) : F = 0 := by
  have hz : d⁻¹ * F = 0 := h.symm.trans hzero
  exact (mul_eq_zero.mp hz).resolve_left (inv_ne_zero hd)

/-- The nonzero normalization of the fixed highest-vector lift. -/
theorem normalized_zero (d i f : ℂ) (hd : d ≠ 0) (hi : i ≠ 0)
    (h : d * i * f = 0) : f = 0 := by
  exact (mul_eq_zero.mp h).resolve_left (mul_ne_zero hd hi)

#check pairWeil_name_of_mem
#check pairWeil_integrated_fin
#check ThetaKernel.lift_equivariant
#check schur_orthogonality
#check highestVector_cyclic
#check AuxPair.descentsVanish_of_reflectionSum
#print axioms pairWeil_name_of_mem
#print axioms ThetaKernel.lift_equivariant
#print axioms highestVector_cyclic
#print axioms same_coset
#print axioms cyclic_scalar
#print axioms normalized_zero

end CompactPeriod68
