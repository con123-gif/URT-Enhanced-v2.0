import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
RUN59 — positivity geometry, 26 November 2026. Human source-matched
derivations of the one-vector Fourier projection, rational Lagrangian
unfolding, and off-place density supplier at the actual B consumer.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb;
manuscript 2eea9dc47d0e037627e4f4c1894f0bc86426454e; unified
witness 7ad9c7c64f53c621ad20422226ad9d0b756ee28e. RUN58
bee7866c41a40d587ad488b8fdad8ca6519b505c. Read recent peer
headings and audit 57db85ecddf672c7e2056fa08c03f6d33d1c9880.
Source modules read at compact pin:
Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff
Lib/SiegelWeil/Formula/SiegelWeilFormula.lean 4277ff0a84d10e7e1f73516d9ff76505072899ea
Lib/SiegelWeil/Mass/MassRatio.lean b1ed2f6ce2492042ffecbd0ba80df1614d79be04
Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7

1. Fourier projection in classSum_norm_eq, with exact volume.
Retain [CMType E], [WeilData E], n=card κ>=3, the open level K,
nonnegative locally constant compactly supported Φ₀ invariant
under K, and totally positive self-adjoint α in E. Put F=E^+,
A_F the self-adjoint adeles in the source coordinates p and r.
The rational diagonal F is a cocompact discrete additive subgroup.
The native exists_fundDomain_prod gives D=Ω × C, C=codifferent E 1,
with Ω a bounded real fundamental domain and vol C=1.
Its real lattice is the inverse different of F in the real
embeddings, of covolume sqrt(|disc F|)/|disc F|. Thus
vol D=1/sqrt(|disc F|)=|disc E|^(-1/4) using the source
unramified relative discriminant identity abs_discr_eq_discr_sq.
The latter is not true for an arbitrary CM field: keep WeilData
and the exact source discriminant hypothesis.

For any rational ξ in E^n, write q(ξ)=ξ*ξ. Unitarity gives
q(h^-1 ξ)=q(ξ). The phase in N in OneVector is
χ_z(q(ξ)-α)=stdAddChar E((p z)(q(ξ)-α)/2).
The rational character is trivial on F embedded diagonally in
A_F, so this descends to A_F/F. The native duality
isDualFamily_ratAdeles together with stdAddChar_half implies
it is nontrivial if q(ξ)-α≠0: testing against self-adjoint
t+star(t) recovers the full additive character pairing on E.
For any nontrivial character, translating D on the quotient
multiplies the integral by a scalar different from 1 while
preserving its value. Hence its integral is zero; for the trivial
character it is vol D. This proves the exact projector, rather
than a pointwise approximation:
  |disc E|^(1/4) ∫_D χ_z(q(ξ)-α) dz = 1_{q(ξ)=α}.       (P)
The Gaussian exp(-sum_v q(ξ)_v) on the surviving locus is exactly
exp(-sum_v α_v). Cancel against the native prefactor in g before
taking any norm. Therefore the mixed value of the integrated
vector g at ξ after h-action is precisely
  1_{q(ξ)=α} Φ₀(h^-1 ξ).
The adapted mixed vector f, its equivariance and the existence of
D with this normalization are retained native inputs. For the
integration of continuous linear evaluations use boundedness on
closure(Ω)×C. The proof of summability of the projected theta
values then uses hasSum_theta_sourceTerm, not a claim that an
unrestricted infinite point count converges.

2. Rational lines and the actual unfolding in the Siegel–Weil mean.
Let D be the hyperbolic splitting in rank 2 with one-dimensional
isotropic summands l,k, and j the source nonzero skew element.
An isotropic E-line with nonzero l-coordinate has generator
l+c k. Isotropy gives j c in F (equivalently c=j^-1 a for
a in F, in the source convention). The other line is k.
Uniqueness follows by comparing the l-coefficient normalized to 1.
Thus the nonvertical isotropic lines are parametrized exactly
by the injective map a -> lagrangian(D'(a)); the excluded line
is lagrangian D in the source convention. The native zero term
of that excluded line is zero on g: it is the mixed value
at ξ=0 and (P) kills it because total positivity implies α≠0.
This is a geometric cancellation, not discarding a possibly
nonzero summand.

For z=(t,z_f) in the real/self-adjoint finite coordinates define
  P(z)=prod_v [exp(2πi α_v t_v)
          (∫_C exp(-(1+2πi t_v)|w|²)dw)^n] · F(z_f),
where in the inner complex Gaussian C denotes the complex plane,
and F(z_f)=∫ ψ_f(z_f(q(x)-α)/2) Φ₀(x) dx.
The actual W identity identifies P(z+a) with the zero term
of lagrangian D'(a) evaluated on o(z). Its two inputs are
the homSource integral for that splitting and the radical
action N; the change in k-coordinate adds the source phase
corresponding to translation by a. Do not replace W with an
unproved independence assertion. Given these native mixed-model
transport identities, the product Gaussian integral is separated
by Fubini, and the remaining phase is exactly that of P.
The norm-summability of Lagrangian.zeroTerm in siegel_weil
and integrability of o(z) on D give
  ∫_D ∑_a |P(z+a)| dz
  ≤ (∑_L ||zeroTerm_L||) ∫_D ||o(z)|| dz < ∞.
Thus all translations unfold with absolute convergence:
  ∑_a ∫_D P(z+a) dz = ∫_(A_F) P(z) dz.                (U)
The source Siegel–Weil theorem applies with p=1 and n>2,
using precisely its convergent-range inequality. Its normalized
theta mean is the sum of these zero terms. Applying (P), (U),
classSum/quotient integration Q, and the RUN58 Fourier inversion
at each archimedean place, yields
  classSum_K(∑_{q(ξ)=α} Φ₀(h^-1 ξ))
   = classSum_K(1) |disc E|^(1/4)
     · ∏_v [π^n α_v^(n-1)/(n-1)!] · ∫ F(z_f) dz_f.
Here the exp(-α_v) from Fourier inversion cancels the
exp(sum α_v) in g; all Haar normalizations match OneVector.
This reconstructs the projection, line classification and
unfolding; the construction of the adapted vacuum, W's exact
mixed-model coordinate law and the convergent-range
Siegel–Weil formula itself remain cited native premises,
not independently reconstructed in this run. No use of RH.
At MassRatio α=1 and Φ₀=1_R^n, this is exactly the
classSum_norm_eq input for RUN58 M, with the original Kf.

3. Off-place density: exact product decomposition.
Use the actual setting of IntegralPlace.mass_near_quadric_off_places_le:
T star-stable; s a natural number with s*m=1 in finite adeles;
β self-adjoint; C_s=codifferent E s of finite volume;
ζ_Ô(μ)≤2, 2(μ+1)≤n. Write R_T for the product integers at T,
δ=P.skewUnit, q(x)=x*x. Split the finite adeles into T and its
complement, and define G by off-T integrality of x and
m(q(x)-β). Both conditions depend only on the off-T coordinates.
Let v=vol(G ∩ {x_T∈R_T^n}), with the native global Haar
normalization; v finite since this set is contained in Ô^n.
The T Haar measure has vol R_T^n=1. Product Haar uniqueness,
or exactly the native map_restrict_addHaar_eq, gives
  (eval_T)_*(1_G dx)=v dy.
For any a in the local ring of completions and nonnegative
measurable f, the T condition alone is
m_T(q(y)-β_T-a)∈R_T; integration thus gives the exact
disintegration stated by the native theorem, with factor v
independent of both a and f. No independent choice of v
per local shift is permitted.

4. Bound that same v by the Gauss integral from RUN58.
For self-adjoint y, the character z -> ψ_f(zy/2) on C_s
is trivial iff m*y belongs to Ô. In one direction use the
trace-one integral adele and ψf_half; in the other test
z=t+star(t) in C_s with the native dual pairing.
Averaging as in (P), now on the compact open C_s, gives
  ∫_(C_s) ψ_f(zy/2) dz=vol(C_s) 1_{my∈Ô}.
Since finite measures and bounded characters allow Fubini,
this proves enorm_integral_codifferent for the actual
finite measure (including restriction to Ô^n).

Let D_T={Γ skew-adjoint: m_T δ^-1 Γ∈R_T}.
Since m is the inverse of the rational integer s and δ is
integral with integral inverse, D_T lies in the integral
skew lattice of measure 1. For each integral x∈G the
condition m(q(x)-α(Γ))∈Ô, where
  α(Γ)=β-adeleOfLocal T(δ^-1 Γ+β_T),
reduces at T to m_T(q(x_T)+δ^-1 Γ)∈R_T. Its solutions
are the translate D_T-δ q(x_T) contained in that same
integral skew lattice; outside T the condition is exactly
G. Thus translation and Tonelli identify its joint measure
over x∈Ô^n and integral Γ as v·ν(D_T). Multiply by vol C_s,
then use the Fourier projector above for each Γ:
  vol(C_s) v ν(D_T)
    = ∫_(Γ integral) |∫_(C_s) ∫_(Ô^n)
           ψ_f(z(q(x)-α(Γ))/2) dx dz| dν(Γ)
    ≤ ζ_Ô(μ) vol(Ô)^n.                               (D)
The inequality uses the full Gauss majorant of RUN58 for
each α(Γ), after bounding by the integral of the modulus
and enlarging C_s to all self-adjoint finite adeles; ν of
the integration set is exactly 1. Crucially, α(Γ) is
self-adjoint by the star-stability of T and the skew unit;
no complex phase positivity is assumed before projection.
This establishes the quantitative supplier and its exact
v in the actual FinitePlaceDensity consumer. The rank and
ζ guards match RUN58; no separate off-T zeta estimate.
The source uses a measure inequality where the above
product splitting gives equality, so only the stated
native inequality is required downstream.

5. Actual finite-level consumer and remaining dependency.
In Filling.exists_step_function, for the finitely many p_z
select one small open compact scalar lattice uR_T^n whose
translate at each p_z lies in the corresponding neighborhood
from hf. The native subgroup H lies in intGL, so stabilizes
uR_T^n. Define Φ(x) as the maximum of the weights c_z for
which Hx meets p_z+uR_T^n (empty maximum 0). If such z exists
the hypothesis gives c_z≤f(x); hence Φ≤f. Taking the identity
shows Φ(p_z)≥c_z. H-invariance follows by reindexing H, and
translation by uR_T^n preserves every membership condition.
The support is contained in the finite union of the
intGL-orbits of compact translated lattices, compact by
compactness of intGL. Thus Φ is locally constant and compactly
supported, exactly the witness consumed in siegel_sum_le_lintegral_quadric.
The finite test n=Φ(tailVector π t' eval_T x)·1_integralOff
has the native compact support and column-level invariance
obligations, not automatic from (D). Given those, OneVector
and (D) apply with β=(t star t-N²)/N>0 at every infinite
place. The cancellation of the phase at τ=t' in the
dominated-convergence step is exact:
  (π star π)^-1 t' star t' - N - β_T=0
using π star π=N. Keep the native local modulus identity,
floorQuadric disintegration and small-clopen-L control;
the full quantitative siegel_sum_le_lintegral_quadric
requires these remaining inputs. In particular do not
replace small-set eventual quantification by one fixed L.

Human dependency update: classSum_norm_eq -> MassRatio ->
RUN57 -> FillingAdmissible; separately (D) + step witness +
classSum_norm_eq -> FiniteSystem.siegel_sum_le_lintegral_quadric
-> sum_blocks_le_topKernel -> Moments -> FillingTheorem ->
B -> star. No original/reduced native graph mutation; no
new axiom evidence; no root-level closure claimed. Deep
SW, adapted-vacuum and mixed-model identities, local quadric
control, Bessel band/energy, and the remaining A/C suppliers
remain visible. Existing native engines run only on their
pinned original environment; no cross-version claims.

Execution: local command -v lean/lake returned no paths.
Python checked 820 exact cyclic-residue orbit identities
and 256 exact rational product-normalization identities;
these are regression checks only, not tests of adelic
geometry. GitHub Actions jobs retrieved in this run:
45799225653 jobs 139837755331,139837856843,139846428086
all success; 45577239749 jobs 139078087302,139078198272,
139079336302 all success; 45576756833 jobs 139076509988,
139076580079,139077518647 all success. None compile RUN59.
The following Lean certificate is prepared, not compiled.
No protected workflow or prior artifacts changed.

RESUME HERE: derive the exact local floorQuadric near-level
disintegration and modulus in FiniteSystem's actual
siegel_sum_le_lintegral_quadric caller, then local Bessel
band/energy and sum_blocks_le_topKernel. Coordinate adapted
vacuum/W and SW provenance with theta/literature. Do not
repeat the scalar Gauss budget or rational line averaging.
HANDOFF TO integration/editor/audit/shared compact replay.
-/

namespace RHPositivityOneVectorDensity

theorem projector_cancel (c g : ℝ) (hc : c ≠ 0) :
    c⁻¹ * (c * g) = g := by
  rw [← mul_assoc, inv_mul_cancel₀ hc, one_mul]

theorem normalization_assoc (c v d : ℝ) :
    c * (v * d) = (c * d) * v := by ring

theorem finite_rank_guard (mu n : ℕ) (h : 2*(mu+1) ≤ n) :
    2*mu+2 ≤ n := by omega

theorem beta_phase_cancel (N t beta : ℝ) (hN : N ≠ 0)
    (h : t = N*(beta+N)) : N⁻¹*t-N-beta = 0 := by
  rw [h, ← mul_assoc, inv_mul_cancel₀ hN, one_mul]
  ring

#print axioms projector_cancel
#print axioms normalization_assoc
#print axioms finite_rank_guard
#print axioms beta_phase_cancel
#check classSum_norm_eq
#check siegel_weil
#check enorm_integral_codifferent
#check IntegralPlace.mass_near_quadric_off_places_le
#check Filling.exists_step_function
#print axioms classSum_norm_eq
#print axioms IntegralPlace.mass_near_quadric_off_places_le

end RHPositivityOneVectorDensity
