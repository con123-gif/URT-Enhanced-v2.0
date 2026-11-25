import Formalism.LocalToGlobal.GlobalTheory.GL5.FamilyMassVolumeIdentityOfClassDecomp
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — terminal definite mass, one compatible frame and direct positivity.
2026-11-25. SOURCE-MATCHED human argument / Lean certificate PREPARED.
RH OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
read first, including unified reduction engine and shared pyramid.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol
excerpts and current manuscript 7beedb2752d934a81d4c92b5a19c1c48362e0dc9.
RUN31 188850b14 remains the original same-host descent.
Peer handoffs d0ca7069 (zero-density telescope), ec9819bb (primary torsion),
0e5b40dc (row density Euler factors), bc38f13b (Gram rank), a987e3f9
(level-M cohomology) checked: no duplicate terminal mass calculation.

Compact proof block for §4 of shared manuscript:
For the actual terminal definite W of rank k, write G=adelic unitary group,
Gamma=GamA D W, K=KSub D W k 0 theta A. Choose ONE compatible theta,A.
VolTie supplies a Haar measure mu and fundamental domain F with
mu(F)=ofReal(vol W); measure_KSub gives mu(K)=1. The chosen finite
double-coset representatives g_i cover G, are pairwise distinct modulo
Gamma and K, and have finite stabilizers S_i=Gamma intersect g_i K g_i^-1.
The normalized indicator sum f=sum_i |S_i|^-1 1_(g_i K) satisfies
sum_(gamma in Gamma) f(gamma x)=1: on Gamma g_i K exactly |S_i|
translates hit g_i K and no other term contributes. Integrate over F
and unfold by left invariance to obtain
        vol(W) = sum_i 1/|S_i| = mass(W.hT,W.L0) = massI(D,k).
The first equality uses the already native positive D.vol_pos W to
convert ENNReal.ofReal directly; there is no need for the original
separate positive stabilizer-sum proof or max(0,vol W) case split.
The second equality is the precise class-decomposition mass
identification, the third is GenusMassStd specialized to this W.
All three are SAME W and SAME host. No identification with X(0).

This weakens DefClassDecomp's universal theta,A premise to existence
of one compatible pair at the terminal W. In the original proof VolTie
already provides compatible witnesses, so the original implies the
replacement without any new assumption. One must still produce a
finite complete class system, finite stabilizers, the class-mass
identification, and the rank-k genus mass formula for the actual W.
The latter are NOT proved just by naming mass or by the orbit
calculation. VolTie and the ratio suppliers remain in RUN31. No claim
this removes all-rank inputs for other consumers (notably level/lift
bounds). The actual root reachability of this particular Link2 supplier
among alternative native constructors is not authenticated by this
source-visible graph alone. No claimed RH proof or global pruning.

Source pin evidence:
FamilyMassVolumeIdentityOfClassDecomp 06beeaaf2b3663f3bb3066fd4b40514d61b54a47
Statement 0c920a7767d85d1fd82dc30d6f7d01bc2e8382c7 (GenusMassStd exact orientation and HostInputsF)
StandardLattice cb758a6c5f78e610b8f946d4b733d07902b15f5d (IsVolMeas, VolTie, positive volume)
TheoremTwoFamilyOfVolume b4bd602288d8844a1c0975463b0e1871e8f62f75 (same positivity conversion)
ThickPlacesCorollaryOfAnyTranslate a91264c8b21d7263cd4bddaee24ef428b141d869.
Latest upstream d91ae2678eea19a0c3045ffca37f1da757c2e719, FamilyMassVolume blob 4d883e9d204b739df382944ea64ef458048fdf29.
25 exact source-anchor assertions executed via connector JS; all present.
Whitespace-normalized declaration block comparisons (true=identical):
def DefClassDecomp: true
theorem mass_volume_identity_of_class_decomp: false
theorem measure_fd_toReal: true
No assumption of upstream equivalence.

Original source-visible graph:
VolTie -> compatible theta,A and (mu,F); DefClassDecomp -> all
frame class system -> measure_fd_toReal -> positive-sum/max split;
GenusMassStd -> mass_volume_identity_of_class_decomp -> DefiniteVolumeEqMass
-> family_mass_volume_identity_of_class_decomp -> Link2_of_decomp.
RUN31 then uses the definite mass at rank k in direct descent.
Candidate overlay: one RH32ClassAt(D,W) + VolTie + fixed-W GenusMassStd
-> rh32_mass_at -> rh32_terminal_one_frame -> RUN31 terminal endpoint.
The original theorem bridge below preserves DefiniteVolumeEqMass;
all original typed, value, structural, unresolved and axiom edges remain
in the authenticated ledger. Cache by pin,D,W,host,rank,theta,A,consumer;
do not substitute another W or assume a common frame across W.
Backtrack to native theorem if replacement fails or another consumer
requires stronger all-rank statements. No synthetic tests or URT claim.

Native Lean/Lake unavailable locally (command -v both empty).
Retrieved prior engine status files: b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0; these
validate earlier engine/conditional strip root only. This file has NOT
been compiled and no new axiom evidence is asserted.

RESUME HERE: native-check the replacement and RUN31 endpoint; follow the
actual root constructor to the producers of HostInputsF's GenusMassStd
and the class system (DefClassDecomp or actual alternative Link2).
Prove the fixed-W genus mass identification via the actual lattice/genus
equivalence, not an assumed same-rank isometry. If this Link2 is not
root-reachable, backtrack to the authenticated alternative immediately.
HANDOFF TO integration/editor, dependency, kernel and audit. PARTIAL.
-/

noncomputable section
open MeasureTheory

namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes

open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open scoped TensorProduct

attribute [local instance] Formalism.BasicNotions.Host.cmStar

def RH32ClassAt (D : D7) (W : HSpace D.host.E) : Prop :=
  ∃ θ : D.what₂.Tau → (Ainf D.host.F ⊗[D.host.F] D.host.E →+* ℂ),
    (∀ ρ, IsInfEmb (embOf D ρ) (θ ρ)) ∧
  ∃ A : D.what₂.Tau → Matrix (Fin W.rank ⊕ Fin 0) (Fin W.rank) ℂ,
    (∀ ρ, (A ρ).conjTranspose * Formalism.UG.Jpq W.rank 0 * A ρ = W.gram.map (embOf D ρ)) ∧
    MeasurableSet (KSub D W W.rank 0 θ A : Set (HA (AF D.host.F) D.sp.cm.sig W.gram)) ∧
    ∃ (n : ℕ) (g : Fin n → HA (AF D.host.F) D.sp.cm.sig W.gram),
      (∀ x, ∃ i, ∃ γ : GamA D W, ∃ k : KSub D W W.rank 0 θ A, x = (γ : HA (AF D.host.F) D.sp.cm.sig W.gram) * g i * k) ∧
      (∀ i j (γ γ' : GamA D W) (k k' : KSub D W W.rank 0 θ A),
        (γ : HA (AF D.host.F) D.sp.cm.sig W.gram) * g i * k = (γ' : HA (AF D.host.F) D.sp.cm.sig W.gram) * g j * k' →
          i = j) ∧
      (∀ i, (Unfold.stab (GamA D W) (KSub D W W.rank 0 θ A) (g i)).Finite) ∧
      ∑ i, ((Nat.card (Unfold.stab (GamA D W) (KSub D W W.rank 0 θ A) (g i)) : ℝ))⁻¹ = Formalism.HermitianLatticesTheory.mass W.hT W.L0

theorem rh32_frame_at_of_original (D : D7) (W : HSpace D.host.E)
    (hW : W.SigOK) (hdef : ∀ τ, W.sig τ = (W.rank, 0))
    (hT : VolTie D) (hC : DefClassDecomp D) : RH32ClassAt D W := by
  unfold VolTie at hT
  unfold AllSome at hT
  obtain ⟨⟨μ, hμ⟩, hall⟩ := hT W W.rank 0 hW hdef
  have hμ' := hμ
  unfold IsVolMeas AllSome at hμ'
  obtain ⟨hHaar, ⟨θ, hθ⟩, hθall⟩ := hμ'
  obtain ⟨⟨A, hA⟩, -⟩ := hθall θ hθ
  exact ⟨θ, hθ, A, hA, hC W hW hdef θ hθ A hA⟩

theorem rh32_mass_at (D : D7) (W : HSpace D.host.E)
    (hW : W.SigOK) (hdef : ∀ τ, W.sig τ = (W.rank, 0))
    (hT : VolTie D)
    (hG : Formalism.HermitianLatticesTheory.mass W.hT W.L0 = massI D W.rank)
    (hC : RH32ClassAt D W) : D.vol W = massI D W.rank := by
  unfold VolTie at hT
  unfold AllSome at hT
  obtain ⟨⟨μ, hμ⟩, hall⟩ := hT W W.rank 0 hW hdef
  obtain ⟨⟨𝓕, h𝓕⟩, hvol⟩ := hall μ hμ
  have hμ𝓕 := hvol 𝓕 h𝓕
  obtain ⟨θ, hθ, A, hA, hKm, n, g, hcov, hdisj, hfin, hsum⟩ := hC
  have hK1 := measure_KSub D W W.rank μ hμ θ hθ A hA
  haveI := hμ.1
  haveI := Unfold.measurableMulHA D.sp.cm.sig W.gram
  haveI hcnt : Countable ↥(GamA D W) := Unfold.countableGamma D.sp.cm.sig W.gram
  have key := Unfold.measure_fd_toReal μ hKm hK1 g hcov hdisj hfin h𝓕
  rw [hμ𝓕, ENNReal.toReal_ofReal (D.vol_pos W).le] at key
  exact key.trans (hsum.trans hG)

theorem rh32_terminal_one_frame (D : D7) (hT : VolTie D)
    (hG : ∀ W : HSpace D.host.E, W.SigOK →
      (∀ τ, W.sig τ = (W.rank, 0)) → W.rank = D.R.k →
      Formalism.HermitianLatticesTheory.mass W.hT W.L0 = massI D W.rank)
    (hC : ∀ W : HSpace D.host.E, W.SigOK →
      (∀ τ, W.sig τ = (W.rank, 0)) → W.rank = D.R.k → RH32ClassAt D W) :
    ∀ W : HSpace D.host.E, W.SigOK →
      (∀ τ, W.sig τ = (W.rank, 0)) → W.rank = D.R.k →
      D.vol W = massI D D.R.k := by
  intro W hW hdef hr
  have hv := rh32_mass_at D W hW hdef hT (hG W hW hdef hr) (hC W hW hdef hr)
  simpa only [hr] using hv

theorem rh32_original_bridge (D : D7) (hT : VolTie D)
    (hG : GenusMassStd D) (hC : DefClassDecomp D) : DefiniteVolumeEqMass D := by
  intro W hW hdef
  exact rh32_mass_at D W hW hdef hT (hG W hW hdef)
    (rh32_frame_at_of_original D W hW hdef hT hC)

theorem rh32_replay (D : D7) (hT : VolTie D)
    (hG : GenusMassStd D) (hC : DefClassDecomp D) : DefiniteVolumeEqMass D := by
  first
  | (rh_reduce 3 using [rh32_original_bridge]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh32_original_bridge D hT hG hC

rh_scan mass_volume_identity_of_class_decomp limit 2000
rh_scan rh32_original_bridge limit 2000
rh_prune rh32_mass_at as RH32MassAtPruned
rh_prune rh32_original_bridge as RH32BridgePruned
#print axioms mass_volume_identity_of_class_decomp
#print axioms rh32_mass_at
#print axioms rh32_original_bridge
#print axioms rh32_replay

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
