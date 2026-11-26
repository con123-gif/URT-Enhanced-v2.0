import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FiniteAdelicUnitaryCongruenceTopology
import Development.AbelianVarietyTheory.Definitions.SemilocalFrames.IsGaugeAll
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN47, 26 Nov 2026. HUMAN SOURCE-MATCHED / Lean PREPARED,
NOT COMPILED. RH OPEN.

Mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine read first. AGENTS, state opening, SWARM, HANDOFF,
EXPANSION, living proof and current 25 peer commit summaries consulted.
Prior editor 893007c3a60a0db2884e27d9d010c8659e6e758e.
Read peer theta 846e90ecc2851847edb02e362d9bbd22d1d047c6 (integral
canonical section), geometry 14448eecf49de51a786b516c6b90de502e8f56c7
(regular arch fibre), integration 65d0f958753df370c0dca6c1263beb794a0db109
(coarse rank-three exponent), prior theta d7f428d4 and 755b9251.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. No migration.

NEW: the actual row AutInst need not have the canonical coordinate
lattice. Avoid proving that a SINGLE rational determinant section
preserves the integral stabilizers at EVERY finite place. Instead
use constant Haar masses of the determinant fibres, on the actual
native Kset. This replaces the canonical integral rectangle requirement
of theta RUN46 with a weaker image equality, det Kset = T0.

Human proof. Let G=U(J), H=SU(J), T=U(1), and choose an F-rational
diagonalization of the nonsingular Hermitian form J (orthogonal
splitting in characteristic zero). In that basis a norm-one scalar
in the first coordinate gives an F-rational determinant section s.
For n>=1, e(h,t)=i(h)s(t) has inverse
g -> (i^-1(g*s(det g)^-1),det g). Rationality implies integrality
relative to the lattice at almost all places, not all places.
It yields the restricted-product homeomorphism once the existing
native adelic dictionary is authenticated. The rational quotient
transversal and right Haar arguments of theta RUN44/45 apply to this
section even if it is nonintegral at finitely many places.

For K=the actual finite stabilizer, let K_H=i^-1(K), T0=det(K).
In split coordinates the slice A_t={h:e(h,t) in K} is empty off T0.
For t in T0 choose ANY h0 with e(h0,t) in K. Then
   e(h,t)e(h0,t)^-1 = i(h*h0^-1)
and hence A_t = K_H*h0. Its right Haar mass is m_H(K_H).
The choice h0 can depend on t without measurable selection: the
measurable integrand is already determined by the indicator of T0.
Tonelli gives the exact formula
   (e_*(m_Hf x m_Tf))(K) = m_Hf(K_H)*m_Tf(T0).
No rectangle preimage, no preservation by the rational section, no
choice of a second native AutInst, no division by a fibre mass.
The proof works even for infinite Haar values (ENNReal); positivity
and finite mass are retained separately for normalization. If the
image is smaller than T0 the formula with the larger T0 is false.
E.g. a proper subgroup of a torus gives the wrong factor. Do not
replace image equality by mere inclusion.

Actual local image: for each unramified inert finite place, the
self-dual local lattice has a unit-norm vector up to an F_v unit:
reduce the perfect form, pick a vector of nonzero norm (if all
norms vanish, polarization using the surjective residue-field
trace forces the form zero, including residue characteristic 2).
Lift and split off its orthogonal line integrally; multiplication
by any norm-one local unit on that line preserves the lattice
and has determinant that unit. At split places the two lattices
are dual, the group acts by GL_n on the first and inverse dual
on the second; a diagonal unit in a local integral basis supplies
every determinant unit. Conversely integral lattice automorphisms
have integral unit determinant. Thus locally det K_v is the
entire integral norm-one torus, and taking the restricted product
gives det K=T0. Choices of local integral sections need not be
rational or globally compatible: they are used only to show the
image equality. The actual native K is a subgroup by adelic_topology;
the lattice-membership dictionary of editor RUN41 supplies its
local meaning. This local proof still needs exact native transport.

Density clarification: for a rational F-basis b of Lie(U_n), put
D=det(tr_E-matrix(b_i*b_j)) in F^*. The ordinary matrix trace here
is F-valued on skew-adjoint pairs; do NOT use Tr_{E/F} of it (which
would introduce a factor 2). The trace form is nondegenerate by
base extension to gl_n. The gauge density in b-coordinates is
|D|_v^(1/2) times coordinate Haar. At real places the involution
X -> X^* is an orthogonal map of the tangent space in the signed
orthonormal frame, so the absolute determinant of the trace form
equals that of the Frobenius form. Conjugation by the actual P_v
preserves the trace form. At finite places the trace pairing on the
integral Lie lattice is perfect by finite etale base change to
the ordinary matrix trace pairing; thus its density gives integral
Lie lattice mass 1, also at dyadic places. The basis may be rational
rather than integral everywhere: the product formula
   product_v |D|_v^(1/2) = 1
cancels all basis scalars across places. For H use the top form
obtained by contracting this full unitary form along the determinant
section against the rank-one torus form, not the restriction of the
trace form to sl_n (which may have a nonunit determinant at primes
dividing n). The density identity above, the fibre formula and the
local smooth counting from editor RUN38 therefore avoid a separate
canonical-lattice calibration. The remaining relative local factors
are product_{j=2..n}(1-eta_v^j q_v^-j); the rank-one factor cancels
before multiplication. The standard simply connected Tamagawa theorem
and additive discriminant normalization give the same rank formula
as RUN38:
   gaugeVol(I) = C_T d_F^((n*n-1)/2) product_{j=2..n} L_F(j,eta^j).
This is a human derivation conditional on the native local/global
group and density identification, not a new native-proved formula.
It applies to the actual row, with arbitrary self-dual L and J;
C_T is the common torus quotient volume over that exact CM field.
No evaluation of L(1) or torus Tamagawa number, no RH input.

EDITORIAL CONSEQUENCE (conditional): compare the actual row with
the definite standard lattice of the SAME rank and field using
the formula, not a semilinear isometry of different signatures.
At the definite endpoint the existing definite_class_decomposition
gives normalized volume massI(D,r) by the selected standard form
identity in integration/2026-11-25_INTERACTIVE_STANDARD_MASS_BY_DEFINITION.lean.
Use editor RUN46 for the arch factor volU(r)^f on the actual row;
the compact endpoint has the same factor by probability Haar.
This yields volY0=massI(D,r) and the native telescope, subject to
the remaining native measure transports and class/mass suppliers.
No new exact mass assertion is imported into the certificate below.

Executed 20 fail-on-error source blob/anchor checks on five pinned files:
src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645 (L_dual,Kset,GFset,muA,P_spec);
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 FiniteAdelicUnitaryCongruenceTopology.lean 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
 (adelic_topology, subgroup/open Kset);
 MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c;
src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810;
src/Formalism/LocalToGlobal/GlobalTheory/GL5/PacketStatementOfIndependence.lean
 1cebe7595e0dc808d6d38fb6d359edf122148c9f.
Also inspected actual Mathlib prod_apply_symm (Prod.lean
25c0a0fb7a00de99b17f38d2dc45810e40745f06), measure_preimage_mul_right
(Group/Measure.lean b1c9cd3d3004b3afed34bcf15f8605f6252435a2)
and lintegral_indicator_const (Integral/Lebesgue/Basic.lean
8611e81e90214ac3fb9ba7e683b33813ab0a5dd6). No synthetic test claims.

Original graph retained: CountTyped -> VolumeStep -> canonical gauge
and separate D.vol / definite mass -> signed family count.
Prior candidate: canonical36 -> integral rectangle46 -> native
product calibration45 -> quotient44 -> rank formula; RUN46 editor
-> arch gauge factor -> remaining finite/global mass.
New overlay: actual arbitrary I -> rational split + local self-dual
image + constant slice -> native_K_mass47 -> same gauge product
calibration and quotient -> definite endpoint comparison.
The rational split, restricted-product dictionary, local image,
top-form/Tamagawa and class mass remain proof obligations for native
replay. No graph or axiom deleted globally. Cache by source/toolchain,
actual I,D,J,L,CM,local lattice,section,K_H,T0,measure,consumer.
Backtrack to canonical rectangle and previous transport if needed.

Local command -v lean/lake/elan returned no paths. Actual baseline
status records fetched on cathedral-research-state:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717,
both returncode 0. Baseline conditional root axioms propext,
Classical.choice, Quot.sound, and bounded scan 324 pending names.
No new kernel test, axiom result, queue dispatch or root retirement.
No URT experiment warranted.

RESUME HERE: stage this certificate and verify native_K_mass47
with the existing pinned engines; use the actual row K and local
self-dual lattice determinant image, not an integral global section.
Then match the rational trace Gram density / contracted determinant
form to native gauge and quotient44 and compare to the definite
standard rank endpoint. Do not rederive the scalar recurrence.
All remaining same-host CountI/II/V/Vs, SW, TopG/Green/J/VWin and
prime-window obligations remain open.
HANDOFF TO theta, geometry, kernel, audit, integration.
-/

open MeasureTheory NumberField Formalism.MainNotions.S
open scoped ENNReal
noncomputable section
namespace RHEditorDetFib47

section General
variable {H T G : Type} [Group H] [Group G]
  [MeasurableSpace H] [MeasurableSpace T] [MeasurableSpace G]
  [MeasurableMul H] [MeasurableInv H]

theorem slice_measure47 (e : H × T ≃ᵐ G) (i : H →* G) (s : T → G)
    (he : ∀ h t, e (h,t) = i h * s t)
    (K : Subgroup G) (mH : Measure H) [mH.IsMulRightInvariant]
    (t : T) (h0 : H) (hh0 : e (h0,t) ∈ K) :
    mH ((fun h : H => (h,t)) ⁻¹' (e ⁻¹' (K : Set G))) =
      mH (i ⁻¹' (K : Set G)) := by
  have hs : (fun h : H => (h,t)) ⁻¹' (e ⁻¹' (K : Set G)) =
      (fun h : H => h * h0⁻¹) ⁻¹' (i ⁻¹' (K : Set G)) := by
    ext h
    change e (h,t) ∈ K ↔ i (h*h0⁻¹) ∈ K
    have key : i (h*h0⁻¹) * e (h0,t) = e (h,t) := by
      rw [he h0 t, he h t, ← mul_assoc, ← map_mul]
      simp
    constructor
    · intro hh
      have hh' : e (h,t) * (e (h0,t))⁻¹ ∈ K :=
        K.mul_mem hh (K.inv_mem hh0)
      rw [← key] at hh'
      simpa [mul_assoc] using hh'
    · intro hh
      rw [← key]
      exact K.mul_mem hh hh0
  rw [hs, measure_preimage_mul_right]

theorem subgroup_mass47 (e : H × T ≃ᵐ G) (i : H →* G) (s : T → G)
    (he : ∀ h t, e (h,t) = i h * s t)
    (K : Subgroup G) (hK : MeasurableSet (K : Set G))
    (T0 : Set T) (hT0 : MeasurableSet T0)
    (himage : ∀ t, t ∈ T0 ↔ ∃ h, e (h,t) ∈ K)
    (mH : Measure H) (mT : Measure T) [SigmaFinite mH] [SigmaFinite mT]
    [mH.IsMulRightInvariant] :
    ((mH.prod mT).map e) (K : Set G) =
      mH (i ⁻¹' (K : Set G)) * mT T0 := by
  classical
  rw [Measure.map_apply e.measurable hK, Measure.prod_apply_symm (e.measurable hK)]
  have hslice : ∀ t : T,
      mH ((fun h : H => (h,t)) ⁻¹' (e ⁻¹' (K : Set G))) =
        T0.indicator (fun _ => mH (i ⁻¹' (K : Set G))) t := by
    intro t
    by_cases ht : t ∈ T0
    · obtain ⟨h0, hh0⟩ := (himage t).1 ht
      rw [Set.indicator_of_mem ht]
      exact slice_measure47 e i s he K mH t h0 hh0
    · have hempty : (fun h : H => (h,t)) ⁻¹' (e ⁻¹' (K : Set G)) = ∅ := by
        apply Set.eq_empty_iff_forall_notMem.2
        intro h hh
        exact ht ((himage t).2 ⟨h, hh⟩)
      rw [hempty, measure_empty, Set.indicator_of_notMem ht]
  simp_rw [hslice]
  exact lintegral_indicator_const hT0 _
end General

/-- Actual native stabilizer, arbitrary J and L, not the canonical model.
The measurable split and the determinant image remain explicit premises. -/
theorem native_K_mass47 (I : AutInst) {H T : Type} [Group H]
    [MeasurableSpace H] [MeasurableSpace T] [MeasurableMul H] [MeasurableInv H]
    (e : H × T ≃ᵐ I.Gf) (i : H →* I.Gf) (s : T → I.Gf)
    (he : ∀ h t, e (h,t) = i h * s t)
    (T0 : Set T) (hT0 : MeasurableSet T0)
    (himage : ∀ t, t ∈ T0 ↔ ∃ h, e (h,t) ∈ I.Kset)
    (mH : Measure H) (mT : Measure T) [SigmaFinite mH] [SigmaFinite mT]
    [mH.IsMulRightInvariant] :
    ((mH.prod mT).map e) I.Kset = mH (i ⁻¹' I.Kset) * mT T0 := by
  obtain ⟨_, _, _, _, hopen, ⟨K,hK⟩, _⟩ := GlobalTheory.CongTop.adelic_topology I
  have hm : MeasurableSet I.Kset := hopen.measurableSet
  rw [← hK] at hm himage ⊢
  first
  | (rh_reduce 2 using [subgroup_mass47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact subgroup_mass47 e i s he K hm T0 hT0 himage mH mT

end RHEditorDetFib47

rh_scan GlobalTheory.CongTop.adelic_topology limit 2000
rh_scan RHEditorDetFib47.native_K_mass47 limit 2000
rh_prune RHEditorDetFib47.native_K_mass47 as RHEditorDetFib47Pruned
#print axioms RHEditorDetFib47.slice_measure47
#print axioms RHEditorDetFib47.subgroup_mass47
#print axioms RHEditorDetFib47.native_K_mass47
