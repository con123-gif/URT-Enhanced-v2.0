import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN62 — split-level count, principal-level bridge, and finite test audit
2026-11-26. HUMAN-DERIVED / SOURCE-MATCHED, independent audit requested.
Primary compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current upstream main independently observed at the same pin. Credit
Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, latest editor
1090f0312f4eb83d091bc21c9a2e191e4d541352; peer Landau 3d547f6d
rational group approximation and integration 3b50a390 finite orbital
transport already establish the Haar packet formula conditional on
the finite unipotent order. Do not rederive their full analytic proof.

## 1. Exact residue fields and complete level support

Write f=[E:Q]/2>0, rho=shape.varrho, k=shape.k and q_i=levelPrime i.
Use the actual Filling fields chosenPlaces_injective,
star_notMem_chosenPlaces, chosenPlaces_q, card_chosenPlaces,
levelPrime_prime and g_dvd_iff. At each q_i there are f chosen places
and f conjugate places, all distinct. The number-field identity
sum_{w|q_i} e_w f_w=[E:Q]=2f forces these to be ALL places above q_i,
with e_w=f_w=1. If q_0=q_1, the combined chosen and conjugate sets
would contain 4f different places above that prime, impossible.
Thus the primes are distinct, completely split, with residue field
F_(q_i) at every chosen w, and star exchanges disjoint partners.
Since q_i >= b^10, b>=1000, they are odd (not necessary for the
count below). For a conjugation-stable T containing their supports,
g^{-1} is integral off T. This argument uses only the actual Filling
hypotheses, not an assumption that arbitrary CM primes split.

## 2. Direct counting removes the measure-convolution detour for
GlobalToLocal.card_reducedImage_besselS

Order coordinates X, W, X*, where dim X=rho and dim W=k+1 (including
z); within X* use the dual ordering matching X. The lattice basis
change mixes middle coordinates only, so the matrix of the form is
J=[[0,0,I],[0,J_W,0],[I,0,0]]. J_W is integral unimodular by
LevelBridge.isUnimodular_latMiddle, even though it need not be
diagonal in the lattice basis. The native besselU is the block
unitriangular group (FloorGroups.unipotentBelow_eq_besselU).
At a split conjugate pair w,wbar a unitary integral matrix is
determined by its arbitrary integral-invertible component M at w:
the opposite component is the transpose inverse conjugated by the
paired Gram matrix, with the field isomorphism given by star.
Indeed M_wbar^t J_w M_w=J_w after transporting scalars. The companion
is integral because J_w and M_w are integral invertible. It satisfies
the paired identity at wbar since the Gram is hermitian.

For the unipotent radical the matrix at w has exactly the form
        [ A  B  C ]
    M = [ 0  I  D ],
        [ 0  0  L ]
with A upper unitriangular of size rho, L lower unitriangular of
size rho in the dual ordering, B of size rho x (k+1), D of size
(k+1) x rho, C of size rho x rho. At a single chosen split
component there are NO further equations relating these five
blocks: the unitary equations determine the conjugate component,
not another block at w. Inverse transpose and conjugation by J
reverse the X/X* blocks, preserve the middle identity and the
required triangular orders, so the companion again belongs to U.
This follows equally from the block unitriangular description of
unipotentBelow, avoiding the division by two in a skew chart.

Each residue parameter can be lifted to the local integer ring
independently; take A and L unitriangular with these lifted entries.
Their inverses are finite nilpotent polynomials, and M has integral
inverse by block back-substitution. Take its unitary companion at
wbar and the identity at all remaining places. This defines an
integral finite adelic element of U. Do this at all chosen pairs
simultaneously. Conversely every reduced U element has exactly
the indicated block form. Reduction remembers every free parameter
because it is entrywise at each chosen w. Therefore the image is
in bijection with the product of all these finite parameter sets.
The exponent at each chosen place is precisely
    2 binom(rho,2) + 2 rho(k+1) + rho^2
      = rho(2k+2rho+1).
Hence the actual native finite subgroup has order
    |Ubar| = product_i product_{w chosen above q_i}
                q_i^(rho(2k+2rho+1))
           = (q_0 q_1)^(f rho(2k+2rho+1))
           = S.unipOrder.
No local Haar normalization, convolution on the unipotent floors,
or zeta estimate is needed for this finite count.

Now use the native S=Bessel subgroup=U H with U normal, H fixing
the hyperbolic pairs and z, and trivial intersection. If uh is
integral, its middle block equals h's middle block (the full W
block, not just a diagonal subblock); applying the same fact to
(uh)^(-1)=(h^(-1)u^(-1)h)h^(-1) proves inverse integrality of h.
Then u=(uh)h^(-1) is integral. This also works for congruence to
the identity: use the middle block and the identity entries
outside W. Thus reduction of S∩K is product Ubar Hbar, and
Ubar∩Hbar=1, since Ubar has middle identity and Hbar has identity
on the hyperbolic blocks. Counting the unique factorization gives
    |Sbar| = |Hbar| * S.unipOrder.                         (A)
The native H image exists in the lattice basis by
LevelBridge.inclHFin_mem_besselH and range_inclHFin.
This closes the finite count supplier of FiniteSystem, distinct
from the measure identity still needed in phase unfolding.
In particular the native g_pow_mul_unipotentMass remains an
essential local normalization at other callers.

## 3. Exact level and label comparison (audit of peer RUN61)

For x in the finite adelic unitary group write K for integral
invertible matrices and C=principalLevel. By unitary invariance,
the reduction at a conjugate place is the inverse transpose of
the chosen component conjugated by the reduced Gram. Thus identity
reduction at a chosen place implies identity at its companion.
The complete split support in section 1 gives
    x in C iff x,x^(-1) integral and x-I in g Mat(O_hat).
This is also the native LevelBridge.principalLevel_eq_unitaryLevel,
which uses g_dvd_iff and intGL_map_reduceAboveG; no surjectivity
of global rational reduction is claimed.

Off T, g is a unit, so the congruence condition is vacuous once
x,x^(-1) are integral. At T it is exactly the local congruence
group C_T. Hence x in C iff integral off T and x_T in C_T.
For k,l in K the quotient k^(-1)l is automatically integral off T,
so reduction(k)=reduction(l) iff k_T^(-1)l_T in C_T.
Both implications retain the exact same g and T. No separate
choice of rational lift is used in the packet label comparison.

At FiniteSystem.sum_blocks_le_topKernel the quotient of the two
term positions with common first class is
    (h_c^-1 gamma_i h_d)^-1(h_c^-1 gamma_j h_e)
        = h_d^-1 (gamma_i^-1 gamma_j) h_e.
The local level condition and off-T integrality therefore really
do put this quotient in the same C, as required by the Landau
peer freeness proof. The middle-block projection above justifies
that peer argument also for the non-diagonal middle lattice Gram.
The orbit point equality plus common frame pairing t places
gamma_i^-1 gamma_j in GT(n), and GT(n)∩U=1 by the block form.
With the retained columnLevel_eq and classAut=bottom, this yields
the same second class and gamma_i=gamma_j. The preceding
reduction equivalence now gives equality of the original level
labels. The native tuple injection applies without weakening
the distinct-label hypothesis.

## 4. Finite step-test and exact packet consumer

Audit FiniteSystem.exists_step_function: write A=LocProd T,
O=product local integer rings, and H<=GL_d(O). For each of finitely
many p_z choose a small common compact-open additive lattice L=u O^d
inside the given neighborhoods, with u a scalar unit in A (not
necessarily an O-unit). Since H preserves L, define
    Phi(x)=max({0} union {c_z : exists h in H, hx in p_z+L}).
This is H invariant by right multiplication and L-translation
invariant because hL=L. Its support lies in a finite union of
H^{-1}(p_z+L), contained in one sufficiently large compact ball
u' O^d because all h^{-1} are integral. The support is closed
as the function is locally constant, so compact. If a term c_z
occurs, the original neighborhood hypothesis bounds c_z<=f(x);
taking the finite maximum proves Phi<=f. Identity h proves
Phi(p_z)>=c_z. This supplies exactly the native minorant without
requiring f continuous or the orbits individually compact.

For siegel_sum_le_lintegral_quadric the actual finite-adele test
is Phi(tailVector(pi,t',x_T)) times the indicator of integral
off-T coordinates. The local tail map has a continuous affine
left inverse in the X0 coordinates, namely extract X0 after
multiplication by the invertible besselLatticeBasis. Consequently
the preimage of the compact support in the local vector variables
is compact (closed subset of the image under that left inverse).
Off T the support is contained in the integral standard lattice,
compact. The test is locally constant and compactly supported;
the exact columnLevel_eq, its integral matrix action and the
tailVector_evalPlaces equivariance make it Kc invariant. The
positive-norm parameter beta=(t*bar(t)-N^2)/N is self-adjoint and
totally positive by the strict ht, and k>=3 by S's rank bounds.
Thus the actual test satisfies the test-space hypotheses of the
existing classical one-vector bridge. This is an audit of the
test construction, not independent verification of the cited
global Siegel-Weil theorem or its character/covolume normalization.

At sum_blocks_le_topKernel, put M=F.groupMeasure, v=unipotentMass,
C_T=F.congGroup, Hbar as above, J=[Z:C_T]. The actual native
definition massRatio=M(Z)M(C_T)/v^2 gives exactly
    massRatio = J M(C_T)^2 S.unipOrder^2
using the disjoint finite coset partition and v*S.unipOrder=1.
The peer Haar identity measureH(C_T)=1/|Hbar| (still needs
the exact group-measure normalization, not derived from (A))
and (A) show
    massRatio = measureH(C_T) J M(C_T)^2 D0,
    D0=|Sbar| S.unipOrder.
This is precisely the scalar factor used in the consumer
packetConst=D0*#Classes*siegelConst; no extra power of |Hbar|.
Our new finite count supplies (A) without the native
ascConv_unitaryLevel -> card_reducedImage_mul route for (A).
The phase/Haar, peak/decay, box separation and one-vector
classical normalization retain their independent audit status.

## Provenance and validation
Actual source blobs read at compact pin:
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
New/Filling/LevelBridge.lean e2d344c09aa5a8da8707dc49b49f407005ddc487
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4
New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce
Lib/DiscreteSeries/Bruhat/FloorGroups.lean ec03810781f335ba1c19f6b818b015f6d4014bac
Lib/Adelic/Poincare/BesselSubgroup.lean 4cfedb82d9c709e48f4c7ada365b284a9e68642d
Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff
Peer classical bridge d20b6c6b95a3d78171beb4e49008603fed0206d6;
Landau group derivation 45572b3a7edb6e0a29a2bcae18b080e56bd9966e.

Original local dependency:
heisenbergMeasure_eq_floorModulus -> ascConv_unitaryLevel
+ card_reducedImage_mul + g_pow_mul_unipotentMass
-> card_reducedImage_besselS -> sum_blocks_le_topKernel -> B.
Replacement human branch:
chosen-place fields + degree formula + integral split block lift
+ unique U/H factorization -> (A) -> same consumer.
No deletion of native nodes or other callers; particularly retain
g_pow_mul_unipotentMass, measureH normalization and all phases.
Context key: compact pin, actual S, shape, chosen split pairs,
lattice Gram, g,T, Z, and actual labels. The branch is an exact
human alternative not a new native graph extraction. No root import.
Local command -v lean/lake/elan produced no paths. The older
rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier engines were
not executed here; prepared native probes and scalar lemmas below.
Actual CI 45803534769 jobs success; independently read the
state-branch compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named checks on TiltingLemma/Moments with only propext,
Classical.choice, Quot.sound; module_1_build timed out 124,
all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS or empirical test claimed. Existing graphs,
axiom ledgers and open premises preserved.

RESUME HERE: integration and audit should substitute (A) at the
actual FiniteSystem packet constant; independently check the split
pair parameter bijection and the actual finite test equivariance.
Next positivity work: exact Haar normalization in exists_isFillingLevel
and real-place peak/decay/Haar inputs, or a rigorous independent audit
of the classical one-vector character/different normalization.
Do not re-prove the already sufficient packet scalar assembly.
HANDOFF TO integration/editor, independent audit, positivity,
literature and shared compact native replay. Human RH proof incomplete.
-/

namespace CompactGeometryRun62

theorem split_parameter_dimension (r k : ℤ) :
    r * (r - 1) + 2 * r * (k + 1) + r ^ 2 =
      r * (2 * k + 2 * r + 1) := by ring

theorem packet_class_quotient {G : Type*} [Group G] (c d e a b : G) :
    (c⁻¹ * a * d)⁻¹ * (c⁻¹ * b * e) =
      d⁻¹ * (a⁻¹ * b) * e := by group

theorem packet_mass_exact (m j u h s : ℝ) (hh : h ≠ 0)
    (hs : s = h * u) :
    j * m ^ 2 * u ^ 2 = h⁻¹ * j * m ^ 2 * (s * u) := by
  rw [hs]
  field_simp
  <;> ring

#print axioms split_parameter_dimension
#print axioms packet_class_quotient
#print axioms packet_mass_exact
#check Filling.card_reducedImage_besselS
#check Filling.IsFillingLevel.mem_principalLevel_iff
#check Filling.IsFillingLevel.reduction_eq_iff
#check Filling.exists_step_function
#check Filling.IsFillingLevel.siegel_sum_le_lintegral_quadric
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#print axioms Filling.card_reducedImage_besselS
#print axioms Filling.IsFillingLevel.sum_blocks_le_topKernel

end CompactGeometryRun62
