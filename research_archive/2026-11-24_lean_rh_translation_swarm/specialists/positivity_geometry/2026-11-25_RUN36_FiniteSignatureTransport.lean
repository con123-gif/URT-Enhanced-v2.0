import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.SelfDualLatticesUnramifiedPlaceNoHypothesis
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatioOfUnfolding
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.IsFundamentalDomainIffImageHA
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN36 — finite-place comparison without computing local group orders.
25 Nov 2026. HUMAN SOURCE-MATCHED; native certificate PREPARED, NOT compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream
91b273530883b723ef4422436e0dc3557749325a. Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Mission cd0a176134d46b5b624896e56843a24915c14477 read first; SWARM, HANDOFF, EXPANSION, AGENTS,
continuity, state and living proof inspected (long documents in part).
RUN35 04a29a86; integration 95545ee1; peer 904a3009, 97a3d534, 1d03f804,
3f25eb66, 14e7d708 and 746b39e7 inspected. No repetition of the separate
fibre-count, exceptional-character, Galois or Landau branches.

## Direct human proof for the finite component of the native normalization

For equal positive rank M on the SAME host E/F, take W,W0 and completed
self-dual lattices L_v,L0_v at a finite unramified place v. No assumption
that their GLOBAL rational forms are isometric. The actual native theorem
GlobalTheory.UnramSelfDualClosed.selfDualLatticeLemmas supplies an integral
orthonormal basis for EACH completed lattice, including split and dyadic
unramified places. This is not an invocation of a same-form unitary
transitivity statement for different forms. Its first projection is
exactly HasOrthonormalBasis. Its underlying proof exists_frame builds
unit vectors successively; exists_basis upgrades the orthonormal frame
to a lattice basis. The source's ratio_of_setting obtains the completed
self-dual lattice via exists_selfDualLattice_completion_maxOrder and
unramifiedness via unram_of_cm; use those exact hypotheses at both W,W0.

Write P,P0 for the columns of these two bases in the native frames,
J,J0 for the localized Gram matrices, and * for conjugate transpose.
Then P*JP=P0*J0P0=I. Put Q=P*J and Q0=P0*J0.
Both QP=I and PQ=I (square matrices over a commutative ring); likewise
Q0P0=P0Q0=I. Consequently

    T=P0 Q,  T^{-1}=P Q0,  T* J0 T=J.

The third identity follows by exact cancellation:
T* J0 T=Q* (P0*J0P0) Q=Q*Q=(Q*P*)J=(PQ)*J=J.
Since P and P0 are lattice bases, T carries L_v bijectively to L0_v.
The group isomorphism g -> T g T^{-1} carries K_v onto K0_v; it preserves
the invariant trace-pairing density because its derivative satisfies

    tr((T X T^{-1})(T Y T^{-1})) = tr(XY).

This proves equality of finite-place trace-density stabilizer masses
without a residue-field unitary order formula, a smooth-model count,
or evaluating any Euler product. This argument works in residue
characteristic 2 using the actual unramified ONB theorem, not an illegal
division by 2 in the residue field. Rank zero is trivial. Both groups
have the same determinant torus, hence the same Tamagawa regularization
factors. Combined with RUN33/34 archimedean indexing/density and RUN35
inner-twist invariance, finite normalization no longer needs independent
finite local cardinality computations. Do NOT transport the global
rational subgroup by T: these isomorphisms are only local. Kottwitz is
still needed for equality of global quotient volumes.

Exact native quotient transport supplier also located:
GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image proves the
fundamental-domain property under a bi-measurable group equivalence
respecting the rational subgroup. Use for the ordinary adelic model of
EACH W separately, not between W and W0; the latter could have distinct
real signatures. IsVolMeas_map proves rational-isometry transport for
the same signature and is not the desired global inner-twist theorem.

## Evidence and remaining frontier

26 exact source/blob checks executed (7 pinned blobs, 19 anchors):
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/
 ExistsOfFixedInt.lean be9e360c0dada6d8000581dd56a3f7f9eb665471
 SelfDualLatticesUnramifiedPlaceNoHypothesis.lean 31be5f192e1cb2596fe53a2bfedad4beeebef357
 VolumeRatioOfUnfolding.lean bf534d0467940a3315375b49ab216a548170c422
 IsFundamentalDomainIffImageHA.lean a031016b09028273b7075a882ac12b820af0615c
 IsFundamentalDomainMap.lean a026b012cffb3f99b54fb3979717f8f8594a792f
src/Development/AbelianVarietyTheory/BlockTheory/GlobalSignature/
 SelfDualLatticeActions.lean 99cf1aae5b98ad6f13578c81ff2d2d056b8dfde5
src/Formalism/SharpRestriction/GlobalSchurBounds/
 StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d

Original source-visible graph retained:
volume_signature_independent -> mass_ratio_under_volume ->
volumeRatio_of_unfolding -> ratio_of_setting -> local_value ->
selfDualLatticeDensity -> selfDualLatticeLemmas -> selfDualLattices.
The alternative branch now uses only first projection of the actual
selfDualLatticeLemmas at two equal-rank forms, matrix cancellation,
trace invariance, plus RUN33/34/35 global transport and Tamagawa theorem.
No assertion of a globally deleted node or a checked root-reachable
caller substitution. Cache key (pin, toolchain, same F,E,v,M,J,J0,L,L0,
CM/unramified/self-dual data, measures); distinct forms and places remain
distinct. Backtrack to native rank-one unfolding if global bridge fails.
Retain all original type/value/constructor edges and unresolved axioms.
No new kernel scan output. Baseline status blobs retrieved from
cathedral-research-state: b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode 0 (runs
45577239749,45576756833); these do not compile this file.
Lean/Lake absent locally. Native commands below are fully qualified
in response to the latest peer scan-name failures. This is not queued
or native verified. No synthetic data or URT performance claim.
Remaining: exact native topological identification and global Haar
measure transport, actual caller and transitive axiom audit. Signed
interval [-2L,m] not proved independently; all exact-mass consumers and
VWinAt(1,401), arithmetic, entropy, local gain remain open.

RESUME HERE: replay this file plus RUN33–35 in pinned existing runner;
check actual first-projection theorem and original matrix identity,
then authenticate global HA -> ordinary adelic group topological
equivalence and subgroup mapping; use the existing
isFundamentalDomain_iff_image rather than reprove quotient transport.
Do not claim root retirement without actual consumer. HANDOFF TO
integration, kernel, audit, editor. RH OPEN.
-/

noncomputable section
open NumberField IsDedekindDomain Matrix Formalism.UG
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open GlobalTheory.IndefiniteRowSideFullHecke.SelfDualLatticeActions
open scoped TensorProduct

namespace RHPositivity36

theorem cross_frame {A : Type} [CommRing A] (c : A →+* A)
    {M : ℕ} {J J0 : Matrix (Fin M) (Fin M) A}
    {e e0 : Fin M → Fin M → A}
    (he : ∀ i j, hform c J (e i) (e j) = if i = j then 1 else 0)
    (he0 : ∀ i j, hform c J0 (e0 i) (e0 j) = if i = j then 1 else 0) :
    ∃ T S : Matrix (Fin M) (Fin M) A,
      T * S = 1 ∧ S * T = 1 ∧ cT c T * J0 * T = J := by
  have h1 := GlobalTheory.UnramSelfDual.gram_one he
  have h2 := mul_eq_one_comm.1 h1
  have h10 := GlobalTheory.UnramSelfDual.gram_one he0
  have h20 := mul_eq_one_comm.1 h10
  set P := (Matrix.of e)ᵀ with hP
  set P0 := (Matrix.of e0)ᵀ with hP0
  set Q := cT c P * J with hQ
  set Q0 := cT c P0 * J0 with hQ0
  refine ⟨P0 * Q, P * Q0, ?_, ?_, ?_⟩
  · rw [Matrix.mul_assoc, ← Matrix.mul_assoc Q, h1, Matrix.one_mul, h20]
  · rw [Matrix.mul_assoc, ← Matrix.mul_assoc Q0, h10, Matrix.one_mul, h2]
  · have h3 : cT c Q * cT c P = 1 := by rw [← cT_mul, h2, cT_one]
    calc
      cT c (P0 * Q) * J0 * (P0 * Q) =
          cT c Q * (Q0 * P0) * Q := by
            rw [cT_mul, hQ0]; simp only [Matrix.mul_assoc]
      _ = (cT c Q * cT c P) * J := by rw [h10, Matrix.mul_one, Matrix.mul_assoc]
      _ = J := by rw [h3, Matrix.one_mul]

theorem local_pair_frames {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E]
    (σ : E →ₐ[F] E) (hσ : IsCMExt F E σ)
    {M : ℕ} (hM : 1 ≤ M) (J J0 : Matrix (Fin M) (Fin M) E)
    (hJ : IsHermND σ J) (hJ0 : IsHermND σ J0)
    (v : HeightOneSpectrum (𝓞 F)) (hv : UnramifiedOrSplit E v)
    (L L0 : Submodule (OEv E v) (Wv E v M))
    (hL : IsSelfDualLat v σ J L) (hL0 : IsSelfDualLat v σ J0 L0) :
    HasOrthonormalBasis v σ J L ∧ HasOrthonormalBasis v σ J0 L0 := by
  exact ⟨(GlobalTheory.UnramSelfDualClosed.selfDualLatticeLemmas
    F E σ hσ M J hM hJ v hv L hL).1,
    (GlobalTheory.UnramSelfDualClosed.selfDualLatticeLemmas
    F E σ hσ M J0 hM hJ0 v hv L0 hL0).1⟩

theorem local_cross_gram {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E]
    (σ : E →ₐ[F] E) (hσ : IsCMExt F E σ)
    {M : ℕ} (hM : 1 ≤ M) (J J0 : Matrix (Fin M) (Fin M) E)
    (hJ : IsHermND σ J) (hJ0 : IsHermND σ J0)
    (v : HeightOneSpectrum (𝓞 F)) (hv : UnramifiedOrSplit E v)
    (L L0 : Submodule (OEv E v) (Wv E v M))
    (hL : IsSelfDualLat v σ J L) (hL0 : IsSelfDualLat v σ J0 L0) :
    ∃ T S : Matrix (Fin M) (Fin M) (Ev E v),
      T * S = 1 ∧ S * T = 1 ∧
      cT (sigR (Fv F v) σ) T * JR (Fv F v) J0 * T = JR (Fv F v) J := by
  obtain ⟨⟨e, he⟩, ⟨e0, he0⟩⟩ :=
    local_pair_frames σ hσ hM J J0 hJ hJ0 v hv L L0 hL hL0
  have hh : ∀ i j, hform (sigR (Fv F v) σ) (JR (Fv F v) J)
      (e i : Wv E v M) (e j : Wv E v M) = if i = j then 1 else 0 := by
    intro i j
    have h := congrArg (fun K : Matrix (Fin M) (Fin M) (Ev E v) => K i j) he
    simpa only [gramR, hR, Matrix.one_apply] using h
  have hh0 : ∀ i j, hform (sigR (Fv F v) σ) (JR (Fv F v) J0)
      (e0 i : Wv E v M) (e0 j : Wv E v M) = if i = j then 1 else 0 := by
    intro i j
    have h := congrArg (fun K : Matrix (Fin M) (Fin M) (Ev E v) => K i j) he0
    simpa only [gramR, hR, Matrix.one_apply] using h
  first
  | (rh_reduce 3 using [cross_frame]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact cross_frame _ hh hh0

end RHPositivity36

rh_scan GlobalTheory.UnramSelfDualClosed.selfDualLatticeLemmas limit 2000
rh_scan GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image limit 2000
rh_scan RHPositivity36.local_cross_gram limit 2000
rh_prune RHPositivity36.local_cross_gram as RH36CrossGramPruned
#print axioms GlobalTheory.UnramSelfDualClosed.selfDualLatticeLemmas
#print axioms GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image
#print axioms RHPositivity36.cross_frame
#print axioms RHPositivity36.local_pair_frames
#print axioms RHPositivity36.local_cross_gram
