import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import Formalism.LocalToGlobal.GlobalTheory.GL5.FamilyMassVolumeIdentityOfClassDecomp
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 — direct descending signature endpoint; human SOURCE-MATCHED, native
certificate PREPARED (not compiled), RH OPEN. 25 Nov 2026.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read first,
including mandatory unified engine and shared ten-page pyramid.
Read AGENTS, continuity/state/log/protocol excerpts, SWARM, HANDOFF, EXPANSION,
shared manuscript 75026c85481848e3c615fcec6e25bec2cfae1dbb, RUN30 9e7a5f49.
Recent peers a543f365 (far-range averaging), e669681c (homology torsion),
18759700 (orbital mass), 59e81b98, b99ef9ad, e70e93e7, bb29422d and 90ea4293:
distinct consumers. No independent RH detour.

Compact human proof for editor:
Write m=2h, r=k+m-1. Actual Y(0) has signature (k+h-1,h) at EVERY
embedding, by Ranks.sigY0 and Spaces.baseSpace_signature_eq. Keep D fixed.
Starting at Y(0), delete h negative norm-one lines (norm -1 in the native
form), then h-1 positive norm-one lines (norm +1). Conclusion2 supplies
a same-host successor with SigOK, the stated signature, and
        vol(W)/vol(W') = ratioH(D,rank W).
The native theorem mass_ratio_eq identifies the factor exactly. The
signature is the dimension by sig_sum, and every deletion occurs above
rank k>=5; the appropriate sign is available. Thus the native premises
supply the full chain by finite induction, not an assumed chain existence.
At the sole terminal positive definite rank-k space use the native
definite mass identity vol(W_k)=massI(D,k). Multiply the ratios; all
intermediate volumes cancel, since D.vol_pos applies to every W.
                  volY0(D) = massI(D,k) * prod_{k<M<=r} ratioH(D,M).
This proves RUN30's aggregate directly from the original inputs without
constructing MassRatio₂ or VolumeEqMass₂. In fact only the selected sign
on signatures P>=k, k<P+Q<=r and definite mass at rank k are needed for
this count consumer. No claim that these weaker premises hold without
the original producers. The terminal may NOT be identified with X(0)
without a separate proof of the required measure/lattice identification.
The original count branch used massRatio_of_definiteVolume at every M,
then volume_eq_mass_of_definite (which also uses the mass ratio), then
volume_eq_mass_at_rank and mass_telescope. Direct descent bypasses those
intermediate all-rank calculations. Native ratio and terminal suppliers
are retained as substantive arithmetic geometry. Other mass consumers
are not pruned.

Pinned source evidence (21 exact source-string assertions executed via
connector JS, all present; NOT proof compilation):
 StandardLattice cb758a6c5f78e610b8f946d4b733d07902b15f5d
 ThickPlacesCorollaryOfAnyTranslate a91264c8b21d7263cd4bddaee24ef428b141d869
 Params 09d1aeec3049821ed6d190c7970cdca9ec5b34cf
 DataSpaces f1d2da346f8996c2527724b50fd6409dc8ab937b
 FamilyMassVolumeIdentityOfClassDecomp 06beeaaf2b3663f3bb3066fd4b40514d61b54a47
 LinkMin b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f.
 TheoremTwoFamilyOfVolume b4bd602288d8844a1c0975463b0e1871e8f62f75
 MassRatioUnfoldedOfTheoremTwo 1c676e46fcda50cdbc82597cacbf8ea526c6871a
 SatakeDualWeyl/Statement e5f0d2a668f9bb75c740202d478d28f505fff540.
Latest upstream 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a (11:57:33Z),
LinkMin 31ddf3666b5c0336cbbb6f9afdc5785210d4efec,
ThickPlaces e1ffc051840f5b7a5a569228c6de11cc7554938e,
Params ec2b1612fddceb354d7fc9bea531a4b47c40b7f5,
DataSpaces 5385a1b1b3a1d04c9fa7659245bbc4a992b2b924,
FamilyMassVolume 4d883e9d204b739df382944ea64ef458048fdf29.
Named anchors still present, blobs changed; no proof equivalence asserted.

Original source-visible graph:
family_of_global_sources -> volumeMass_of_unfolding -> Conclusion2;
DefiniteVolumeEqMass -> massRatio_of_definiteVolume -> MassRatio₂;
Conclusion2 + DefiniteVolumeEqMass -> volume_eq_mass_of_definite ->
volumeY0EqualsMass_of_aux2v -> BaseVolumeEqualsMass;
MassRatio₂ + BaseVolumeEqualsMass -> family_of_global_statements ->
division_level_prime_family (lower and upper consumers) -> LinkGLOBAL7.
Candidate graph: Conclusion2 -> RH31Step; DefiniteVolumeEqMass ->
RH31Terminal; RH31Step + RH31Terminal -> RH31Endpoint -> RUN30
aggregate identity -> same lower/upper count. Preserve all native typed
and value edges in original graph; candidate source-level overlay only.
VolRatioTrue + VolTie supply Conclusion2 via theorem_two_of_volume_ratio;
DefClassDecomp + GenusMassStd + VolTie supply terminal via
mass_volume_identity_of_class_decomp. The latter's double-coset decomposition
assumptions are retained; its proof has been inspected, not independently
reproved. No claim of global dependency deletion. Cache by pin,D,host,k,r,
W,P,Q,chosen sign,rank and consumer. Backtrack to original if native replay
fails or shared consumers require all-rank identities.

Local lean/lake unavailable (command -v both empty). Prior engine status
files retrieved, return 0 for 45577239749 (98.87s, blob b1c96f58...) and
45576756833 (77.94s, blob 7da35494...). These only validate previous tools
and conditional strip root; no new axiom evidence, no new native PASS.
No synthetic host checks or URT comparison.

RESUME HERE: replay this same-host endpoint bridge with RUN30 family
consumer. Then derive terminal mass for the actual descending rank-k
space from DefClassDecomp and GenusMassStd, not an unproved X(0)
identification; trace actual upstream suppliers and any shared consumers.
HANDOFF TO integration/editor, kernel and audit: insert the short direct
descent in the existing §4, retain the original if replay fails. PARTIAL.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open Formalism.BasicNotions NumberField Finset

def RH31Step (D : D7) : Prop :=
  letI := D.host.cmStar
  ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
    (∀ τ, W.sig τ = (P,Q)) → D.R.k ≤ P →
    D.R.k < P + Q → P + Q ≤ D.R.r →
    ∃ W' : HSpace D.host.E, W'.SigOK ∧
      (∀ τ, W'.sig τ = (if Q = 0 then P - 1 else P, Q - 1)) ∧
      D.vol W / D.vol W' = ratioH D W.rank

def RH31Terminal (D : D7) : Prop :=
  letI := D.host.cmStar
  ∀ W : HSpace D.host.E, W.SigOK → W.IsPosDef →
    W.rank = D.R.k → D.vol W = massI D D.R.k

def RH31Endpoint (D : D7) : Prop :=
  letI := D.host.cmStar
  volY0 D = massI D D.R.k *
    ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M

theorem rh31_step_of_conclusion (D : D7) (h2 : Conclusion2 D) :
    RH31Step D := by
  letI := D.host.cmStar
  intro W P Q hW hs hP hlow hhigh
  have hrank : W.rank = P + Q := by
    have h := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
    rw [hs D.host.φ₀] at h
    exact h.symm
  have h3 : 3 ≤ W.rank := by have := D.R.k_ge; omega
  by_cases hQ : Q = 0
  · obtain ⟨x, hx, W', i, hi, hir, hW', hs', hv⟩ :=
      h2 W P Q hW hs h3 true (by simp; omega)
    rw [mass_ratio_eq] at hv
    refine ⟨W', hW', ?_, hv⟩
    intro τ
    simpa [hQ] using hs' τ
  · obtain ⟨x, hx, W', i, hi, hir, hW', hs', hv⟩ :=
      h2 W P Q hW hs h3 false (by simp; omega)
    rw [mass_ratio_eq] at hv
    refine ⟨W', hW', ?_, hv⟩
    intro τ
    simpa [hQ] using hs' τ

theorem rh31_terminal_of_definite (D : D7) (hv : DefiniteVolumeEqMass D) :
    RH31Terminal D := by
  letI := D.host.cmStar
  intro W hW hs hr
  simpa only [hr] using hv W hW hs

theorem rh31_descend (D : D7) (hstep : RH31Step D) (hterm : RH31Terminal D) :
    letI := D.host.cmStar
    ∀ (n : ℕ) (W : HSpace D.host.E) (P Q : ℕ),
      W.SigOK → (∀ τ, W.sig τ = (P,Q)) → D.R.k ≤ P →
      P + Q = D.R.k + n → D.R.k + n ≤ D.R.r →
      D.vol W = massI D D.R.k *
        ∏ M ∈ Ico (D.R.k + 1) (D.R.k + n + 1), ratioH D M := by
  letI := D.host.cmStar
  intro n
  induction n with
  | zero =>
    intro W P Q hW hs hP hsum hhigh
    have hQ : Q = 0 := by omega
    have hPk : P = D.R.k := by omega
    have hr : W.rank = D.R.k := by
      have h := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
      rw [hs D.host.φ₀] at h
      simp at h
      omega
    have hd : W.IsPosDef := fun τ => by rw [hs τ, hQ, hPk, hr]
    simpa using hterm W hW hd hr
  | succ n ih =>
    intro W P Q hW hs hP hsum hhigh
    obtain ⟨W', hW', hs', hratio⟩ :=
      hstep W P Q hW hs hP (by omega) (by omega)
    have hp' : D.R.k ≤ (if Q = 0 then P - 1 else P) := by
      by_cases hQ : Q = 0 <;> simp [hQ] <;> omega
    have hsum' : (if Q = 0 then P - 1 else P) + (Q - 1) = D.R.k + n := by
      by_cases hQ : Q = 0 <;> simp [hQ] <;> omega
    have hv := ih W' (if Q = 0 then P - 1 else P) (Q - 1)
      hW' hs' hp' hsum' (by omega)
    have hr : W.rank = D.R.k + n + 1 := by
      have h := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
      rw [hs D.host.φ₀] at h
      simp at h
      omega
    rw [hr] at hratio
    have hmul : D.vol W = D.vol W' * ratioH D (D.R.k + n + 1) := by
      have h := (div_eq_iff (D.vol_pos W').ne').mp hratio
      simpa only [mul_comm] using h
    rw [hmul, hv, show D.R.k + (n + 1) = D.R.k + n + 1 by omega,
      Finset.prod_Ico_succ_top (show D.R.k + 1 ≤ D.R.k + n + 1 by omega)]
    <;> ring

theorem rh31_endpoint (D : D7) (hstep : RH31Step D) (hterm : RH31Terminal D) :
    RH31Endpoint D := by
  letI := D.host.cmStar
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have := D.R.r_eq
    have := D.R.two_le_m
    omega
  have hsum : D.R.sigY0.1 + D.R.sigY0.2 = D.R.r := by
    have := D.R.rS_two
    have := D.R.r_eq
    simp only [Ranks.sigY0]
    omega
  have hp : D.R.k ≤ D.R.sigY0.1 := by
    simp [Ranks.sigY0]
  exact rh31_descend D hstep hterm (D.R.m - 1) (D.sp.Y 0)
    D.R.sigY0.1 D.R.sigY0.2 (D.sp.Y_sig 0)
    (fun τ => D.sp.baseSpace_signature_eq τ) hp (hsum.trans hr) (by omega)

theorem rh31_endpoint_of_original (D : D7) (h2 : Conclusion2 D)
    (hv : DefiniteVolumeEqMass D) : RH31Endpoint D := by
  exact rh31_endpoint D (rh31_step_of_conclusion D h2) (rh31_terminal_of_definite D hv)

theorem rh31_replay (D : D7) (h2 : Conclusion2 D) (hv : DefiniteVolumeEqMass D) :
    RH31Endpoint D := by
  first
  | (rh_reduce 3 using [rh31_endpoint, rh31_step_of_conclusion, rh31_terminal_of_definite]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh31_endpoint_of_original D h2 hv

rh_scan massRatio_of_definiteVolume limit 2000
rh_scan volume_eq_mass_of_definite limit 2000
rh_scan rh31_endpoint_of_original limit 2000
rh_prune rh31_descend as RH31DescendPruned
rh_prune rh31_endpoint_of_original as RH31OriginalPruned
#print axioms massRatio_of_definiteVolume
#print axioms volume_eq_mass_of_definite
#print axioms rh31_endpoint_of_original
#print axioms rh31_replay
end Formalism.MainNotions.StandardLattice
