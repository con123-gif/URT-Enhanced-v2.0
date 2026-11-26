import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.CountTypedOfVolumeStep
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48 — same-rank finite-only isometry and normalized Haar transport.
26 November 2026. Lane 8. SOURCE-MATCHED human argument; Lean PREPARED,
NOT COMPILED. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine,
AGENTS, SWARM, HANDOFF, EXPANSION, state/runner/continuity and recent
commit summaries consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005;
latest upstream observed a7c4d6a94945f49da752e237a6b1e944ab62677e
(26 Nov 06:20 UTC), not adopted. Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Prior own RUN47 8ebb60f6; editor RUN48 b86025dc (same-rank comparison);
geometry RUN48 a66af433 (selected Euler box); integration 890cfaaa
(principal identity joint mean). No duplicate local point counts.

NEW: the existing native GaugeTransport.exists_fin_equiv asks for
a *rational* semilinear isometry because it additionally preserves
rational points, for gaugeVol_transport. That interface cannot be
used to compare distinct signatures. Its actual finite transport
sublemmas do not require a rational matrix. Replace it, ONLY at
the finite calibration step of the editor's same-rank comparison,
by a finite-adelic matrix isometry A and an additive lattice
bijection Phi = A composed with the coordinate ring isomorphism.
The exact identities (with the ring equivalence suppressed) are

  T(g)=A g A^-1,
  (T(g)-1) A y = A (g-1)y,
  T^-1(Kg(N)) = Kg'(N) for every N.

They are valid even when A is not rational or integral in the
chosen rational coordinates; A must transport the actual completed
lattices. Additivity of Phi commutes with integer N, so there is
no extra local congruence-level hypothesis. The native stab_and_cong
gives stabilizer and every congruence condition simultaneously.
The native isClosedEmbedding_of_preimage_Kg then makes T a
topological group isomorphism: no separate proof of continuity
of the adelic coordinate identification is needed at this step.
By Haar uniqueness, normalization mu(K)=mu'(K')=1 forces
map T mu' = mu. This is a finite measure transport, NOT a map
of rational quotients or a comparison of the archimedean groups.

For the editor's relative trace density, on a same-rank local
isometry the derivative C(X)=AXA^-1 satisfies
tr(C(X)C(Y))=tr(AXYA^-1)=tr(XY).
Also det(AgA^-1)=det(g), so contraction along a fixed determinant
torus differential is compatible. Hence equal stabilizer mass
in the unnormalized trace-form convention follows once local
Lie differential -> native measure identification is established.
Alternatively normalize both finite Haar measures directly to 1,
and compare their calibration factors by that differential. Do
not infer equality of unnormalized Tamagawa masses just from
normalized Haar transport. Preserve the rational product formula
and separate SU/T quotient argument of editor RUN48.

Guard: an adelic A may not be rational. No assertion that T maps
rational points to rational points; indeed distinct real signatures
need not even have isomorphic real groups. No global covol_map
with a false rational-subgroup premise. Same rank, same field,
unramified self-dual models and the actual lattice identification
remain required for constructing A in the intended application.

Source blobs directly inspected:
  GaugeVolumeEqOfSemilinearIsometryGenus.lean
    d8e911ba588e91954a6b50bf044fd455e8715376
    (exists_unitary_equiv, stab_and_cong, exists_fin_equiv,
     gaugeVol_transport and its Haar scalar computation).
  IsClosedEmbeddingOfCongruenceSubgroupsConj.lean
    aa26856526a20099bdf53ce29137963b0d2637da
    (isClosedEmbedding_of_preimage_Kg).
  FiniteAdelicUnitaryCongruenceTopology.lean
    3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba (adelic_topology).
  src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
    2103e49fe83fce42d4962f85acd9d4f6a589d645 (AutInst, Lf, Kset, Kg).
  src/Formalism/SatakeDualWeyl/Statement.lean
    e5f0d2a668f9bb75c740202d478d28f505fff540 (UPts, UJ, sigR, inclE, stabGL).
  src/Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean
    fcfd96e6e8385ec5e1de13f41d5706803d565c5d (vol_eq_of_indep).
First three paths under src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/.

Original graph retained: CountBridge.count_typed_of_volumeStep ->
VolumeStep / rankFac / calibrated covolume; PNamed.vol_eq_of_indep ->
VolSigIndep and VolTie. Original gaugeVol_transport/exists_fin_equiv
retain rational-point and all archimedean conditions.
Candidate overlay at editor same-rank route:
actual local integral isometries -> restricted-product A,A^-1,Phi ->
finite_only48 -> normalized_haar48 -> common differential calibration
-> separate SU/T Tamagawa quotients -> one_pair_eq48.
No original or pending graph node deleted. Cache keyed by source,
toolchain, I,I', rho, J,J', lattice maps, A, rank, Haar normalization,
actual caller; backtrack to original route if any dictionary fails.
No new kernel or axiom evidence. Local command -v lean/lake/elan empty.
Actual historical CI status files reread (not new certificate evidence):
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717;
both status pass, returncode 0. Conditional root still has
propext, Classical.choice, Quot.sound; bounded scan has 324 pending.
No synthetic tests or URT gain claim. Native runner integration not done.

RESUME HERE: kernel/audit stage this file in the existing pinned
runner. Geometry/theta prove the remaining actual local-completion
dictionary for AutInst.Lf (span of rational lattice), construct
restricted-product A from local integral isometries using that
dictionary, and authenticate equality of the unnormalized trace
and contracted torus densities at the same-rank endpoints. Then
apply editor one_pair_eq48, retaining the separate rank-change
and all TopG/Green/VWin obligations. HANDOFF TO editor, geometry,
kernel, integration and audit. No RH proof or prime-window bound.
-/

noncomputable section
open MeasureTheory NumberField Matrix Formalism.MainNotions.S Formalism.UG
open scoped TensorProduct NNReal ENNReal
namespace RHTheta48

open GlobalTheory.GaugeTransport

theorem finite_only48 (I I' : AutInst)
    (ρ : I'.E ⊗[I'.F] Af I'.F ≃+* I.E ⊗[I.F] Af I.F)
    (hρ : ∀ x, ρ (sigR I'.cm.sig (Af I'.F) x) =
      sigR I.cm.sig (Af I.F) (ρ x))
    (A : Matrix (Fin I.n) (Fin I'.n) (I.E ⊗[I.F] Af I.F))
    (B : Matrix (Fin I'.n) (Fin I.n) (I.E ⊗[I.F] Af I.F))
    (h1 : A * B = 1) (h2 : B * A = 1)
    (hJ : cT (sigR I.cm.sig (Af I.F)) A *
      I.J.map (inclE (F := I.F) (Af I.F)) * A =
      (I'.J.map (inclE (F := I'.F) (Af I'.F))).map ρ)
    (Φ : (Fin I'.n → I'.E ⊗[I'.F] Af I'.F) →+
      (Fin I.n → I.E ⊗[I.F] Af I.F))
    (hΦ : ∀ w, Φ w = A *ᵥ fun i => ρ (w i))
    (hb : Function.Bijective Φ)
    (hL : ∀ w, w ∈ I'.Lf ↔ Φ w ∈ I.Lf) :
    ∃ T : I'.Gf ≃ₜ* I.Gf,
      (∀ g, I.fmat (T g) = A * (I'.fmat g).map ρ * B) ∧
      (∀ g, g ∈ I'.Kset ↔ T g ∈ I.Kset) ∧
      (∀ N g, g ∈ I'.Kg N ↔ T g ∈ I.Kg N) := by
  obtain ⟨T₀, hT₀⟩ := exists_unitary_equiv ρ _ _ hρ
    (I'.J.map (inclE (F := I'.F) (Af I'.F)))
    (I.J.map (inclE (F := I.F) (Af I.F))) A B h1 h2 hJ
  let T₁ : I'.Gf ≃* I.Gf := T₀
  have hT : ∀ g, I.fmat (T₁ g) = A * (I'.fmat g).map ρ * B := hT₀
  have hInter : ∀ (g : I'.Gf) w,
      I.fmat (T₁ g) *ᵥ Φ w = Φ (I'.fmat g *ᵥ w) := by
    intro g w
    rw [hΦ, hΦ, Matrix.mulVec_mulVec, hT]
    rw [Matrix.mul_assoc, Matrix.mul_assoc, h2, Matrix.mul_one,
      ← Matrix.mulVec_mulVec]
    congr 1
    funext i
    exact (RingHom.map_mulVec ρ.toRingHom _ _ i).symm
  have key := fun g : I'.Gf =>
    stab_and_cong I.Lf I'.Lf Φ hb hL (I'.fmat g)
      (I.fmat (T₁ g)) (hInter g)
  have hK : ∀ g, g ∈ I'.Kset ↔ T₁ g ∈ I.Kset := fun g => (key g).1
  have hKg : ∀ N g, g ∈ I'.Kg N ↔ T₁ g ∈ I.Kg N :=
    fun N g => and_congr (hK g) ((key g).2 N)
  have hE : Topology.IsClosedEmbedding T₁.toMonoidHom := by
    first
    | (rh_reduce 2 using [GlobalTheory.StabUnfold.isClosedEmbedding_of_preimage_Kg]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact GlobalTheory.StabUnfold.isClosedEmbedding_of_preimage_Kg I I' T₁.toMonoidHom hKg
  have c2 : Continuous T₁.symm := hE.isInducing.continuous_iff.2 (by
    have e : (T₁.toMonoidHom : I'.Gf → I.Gf) ∘ T₁.symm = id :=
      funext T₁.apply_symm_apply
    rw [e]
    exact continuous_id)
  refine ⟨{ T₁ with continuous_toFun := hE.continuous,
    continuous_invFun := c2 }, hT, hK, hKg⟩

theorem normalized_haar48 (I I' : AutInst) (T : I'.Gf ≃ₜ* I.Gf)
    (hK : ∀ g, g ∈ I'.Kset ↔ T g ∈ I.Kset)
    (μ : Measure I.Gf) [SigmaFinite μ] [μ.IsHaarMeasure]
    (μ' : Measure I'.Gf) [SigmaFinite μ'] [μ'.IsHaarMeasure]
    (hμ : μ I.Kset = 1) (hμ' : μ' I'.Kset = 1) :
    μ'.map T = μ := by
  obtain ⟨-, hlc, hsc, hcK, hoK, -⟩ := GlobalTheory.CongTop.adelic_topology I
  let Ψ : I'.Gf ≃ᵐ I.Gf := T.toHomeomorph.toMeasurableEquiv
  haveI : (μ'.map Ψ).IsHaarMeasure := T.isHaarMeasure_map μ'
  have ha := Measure.isMulLeftInvariant_eq_smul (μ'.map Ψ) μ
  generalize Measure.haarScalarFactor (μ'.map Ψ) μ = a at ha
  have hKm : μ' I'.Kset = a * μ I.Kset := by
    have e : I'.Kset = Ψ ⁻¹' I.Kset := Set.ext hK
    rw [e, ← Ψ.map_apply, ha, Measure.coe_nnreal_smul_apply]
  have ha1 : (a : ENNReal) = 1 := by
    simpa [hμ, hμ'] using hKm.symm
  have ha' : a = 1 := by exact_mod_cast ha1
  change μ'.map Ψ = μ
  rw [ha, ha', one_smul]

end RHTheta48

rh_scan GlobalTheory.GaugeTransport.exists_fin_equiv limit 2000
rh_scan GlobalTheory.CountBridge.count_typed_of_volumeStep limit 2000
rh_scan RHTheta48.finite_only48 limit 2000
rh_prune RHTheta48.finite_only48 as RHTheta48FinitePruned
rh_prune RHTheta48.normalized_haar48 as RHTheta48HaarPruned
#print axioms RHTheta48.finite_only48
#print axioms RHTheta48.normalized_haar48
end
