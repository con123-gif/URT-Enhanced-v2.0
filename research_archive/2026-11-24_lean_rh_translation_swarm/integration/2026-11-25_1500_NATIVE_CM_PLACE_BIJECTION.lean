import Formalism.SharpRestriction.GlobalSchurBounds.StandardLattice
import Mathlib.NumberTheory.NumberField.CMField
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration — derive the actual CM-place indexing from the native host

25 Nov 2026. Human source-matched derivation; Lean certificate PREPARED,
NOT compiled. RH OPEN. One proof contribution: discharge the separate
embedding enumeration/CM-type indexing obligation in geometry RUN33
(0e1b92ab) using the existing host record, rather than assume FactEmb.

Pinned RH: 40e56bab026552e089d7afcfeff08d2defb9c005.
Mathlib: 0df444a360eaa60ab8c11dca51a86af692955474; Lean 4.33.1.
Read latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc first,
SWARM/HANDOFF/AGENTS, research state/log/protocol, continuity and
living proof 464e82f81f646d4af85e1f5f70d379026df46261 (long files in part).
Peer handoffs checked: geometry 0e1b92ab, editor 3e1000ef, audit a910af41,
literature d91e1e45, math 1b03d6e3, character 6ea6da30, Galois 46c378ee,
theta 3c6f175e, structure c8e071b1, Landau 141537e1, prime b158e108,
kernel 46b28d29, dependencies 3003c0aa, acceleration d41c32766;
previous integration 38b6cc25. No duplication of their conditional bounds.

## Single human proof block for the live proof

For the actual native CM host E/Q let phi0 be its distinguished embedding,
and gal: Aut_Q(E) ~= GG its supplied Galois-group isomorphism. Define
emb(g)=phi0 composed with gal^{-1}(g), exactly as Host.emb. This map is
injective because phi0 and gal^{-1} are injective. Every embedding psi
agrees with phi0 on Q; Galois normality gives psi=phi0 composed with
sigma^{-1} for some sigma in Aut_Q(E). Thus emb is surjective, with
preimage gal(sigma^{-1}). The precise theorem is Mathlib
NumberField.ComplexEmbedding.exists_comp_symm_eq_of_comp_eq.
The native HostDer.cmType third conjunct, applied to phi0 (Host.phi0_mem),
now says emb(g) belongs to CM type iff g belongs to R.Psi. This proves
the entire FactEmb interface directly from the actual Host record.
It does not prove the existence of that record.

The first conjunct of the SAME HostDer.cmType says exactly one of
psi and its complex conjugate belongs to CM type. Two embeddings define
the same infinite place iff they agree or are conjugates (Mathlib
InfinitePlace.mk_eq_iff). Thus the place map on the CM type is injective:
the conjugate alternative contradicts the first conjunct. It is
surjective: for each infinite place choose its representative embedding,
then choose that embedding or its conjugate according to membership.
Both define the same place. Finally E is CM by HostAx.isCMField_hostE,
so restriction of infinite places from E to its maximal real subfield F
is a bijection (Mathlib IsCMField.equivInfinitePlace). Compose these
bijections with D.eTau : Tau ~= R.Psi. Consequently

      Tau  --embOf--> CMType(E) --place/restriction--> InfinitePlace(F)

is bijective, on the SAME D and host, with no extra enumeration premise.
This supplies the actual one-per-real-place indexing used for the
archimedean product in geometry RUN33. It does not prove equality of
Haar densities, Tamagawa volume, VolSigIndep, or the decisive RH bound.

## Source anchors (exact blobs)
RH, relative to src/:
Formalism/LocalRingCardinality/DataHost.lean
  7e9af8ab364965c62be250ae93974098141598c0, lines 39-62,120-122,186-187
Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ConjEMemHostFIff.lean
  0ab34ba6d386bb84908efe66de6ce50108eacddc, HostRaw, HostDer.cmType,
  HostAx.der, HostAx.isCMField_hostE
Formalism/LocalRingCardinality/RhoDetPrimeEqMuTildeMulChiPow.lean
  6ab57a7f313a9f8c351005051933a60a22a0da08, line 89 (eTau)
Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean
  cb758a6c5f78e610b8f946d4b733d07902b15f5d, lines 228-249 (embOf,IsVolMeas).
Mathlib, relative to Mathlib/NumberTheory/NumberField/:
InfinitePlace/Embeddings.lean a9a4da6b0bf5a285488251f9fca0598720fff081
  exists_comp_symm_eq_of_comp_eq, involutive_conjugate
InfinitePlace/Basic.lean 86c0ea3a187be9771efbe57b97bf265a3dc84cb6
  mk_embedding, mk_conjugate_eq, mk_eq_iff
CMField.lean 8272694d46d53949a09eb90c87663cd7c47a9b9b
  IsCMField.equivInfinitePlace, equivInfinitePlace_apply.

## Local obligation graph overlay (source-visible; not full kernel graph)
Original:
{"geometry_RUN33_transport":["FactEmb","CMType_one_per_real_place","finite_lattice_transport","CDHaar_normalization","Tamagawa_comparison"],"rh33_embOf_of_fact":["FactEmb","D.eTau"],"VolSigIndep":["geometry_RUN33_transport","VolTie"]}
Reduced candidate:
{"geometry_RUN33_transport":["rh_tau_real_places","finite_lattice_transport","CDHaar_normalization","Tamagawa_comparison"],"rh_tau_real_places":["rh_tau_cm_bijective","rh_cmtype_places","IsCMField.equivInfinitePlace"],"rh_tau_cm_bijective":["rh_factEmb","D.eTau"],"rh_factEmb":["Host.galois","Host.gal","Host.phi0_mem","HostDer.cmType","exists_comp_symm_eq_of_comp_eq"],"rh_cmtype_places":["HostDer.cmType","InfinitePlace.mk_eq_iff","InfinitePlace.mk_embedding","InfinitePlace.mk_conjugate_eq"]}
Typed context key: (RH pin, Mathlib pin, D, R, H, E, F, phi0, eTau).
Keep original graph, all other root suppliers and existing axiom evidence.
Do not delete global FactEmb consumers or HostDer premises; this is a
local proof of the interface with retained host existence.
The connection to root is the source-visible PNamed VolSigIndep/VolTie
branch and actual packet/covolume consumers tracked in editor 3e1000ef
and integration 38b6cc25. Full elaborated reachability not asserted.

## Tests and failures
Executed 28 exact source/blob checks across seven pinned files via
connector JS; all matched. Source lookup by FactEmb code search returned
no hits; followed native imports and HostDer instead. Initial guessed
Mathlib embeddings path returned 404; actual InfinitePlace/Embeddings
located and inspected. No local lean or lake found on PATH.
Actual baseline status JSON retrieved for CI runs 45577239749 and
45576756833: both pass, returncode 0, not verification of this file.
General orchestrator run 45635368969 passed 14:53:07 UTC, prior commit
46c378e, not this file. New native commands below not executed; new
axiom/constructor-inclusive scan and independent audit pending.
No URT advantage or synthetic numerical test claimed.

RESUME HERE: replay this actual same-host place bijection with geometry
RUN33 and editor 3e1000ef on pinned runner, audit native module
topology/Haar normalizations and the exact Tamagawa comparison. Merge
the single human block into the live geometric section only after
independent audit; keep original graph until replacement at caller.
HANDOFF TO geometry, editor, kernel, literature, audit. RH OPEN.
-/

noncomputable section

open NumberField Formalism.BasicNotions Formalism.MainNotions.StandardLattice

namespace RHIntegrationCMPlaces

theorem rh_host_emb_bijective (R : Ranks) (H : Host R) :
    Function.Bijective H.emb := by
  letI : IsGalois ℚ H.E := H.galois
  constructor
  · intro g h he
    apply H.gal.symm.injective
    apply AlgEquiv.ext
    intro x
    apply H.φ₀.injective
    exact RingHom.congr_fun he x
  · intro ψ
    have hr : H.φ₀.comp (algebraMap ℚ H.E) = ψ.comp (algebraMap ℚ H.E) := by
      apply RingHom.ext
      intro q
      simp
    obtain ⟨σ, hσ⟩ := NumberField.ComplexEmbedding.exists_comp_symm_eq_of_comp_eq H.E H.φ₀ ψ hr
    refine ⟨H.gal σ.symm, ?_⟩
    simpa only [Host.emb, Host.sigmaOf, MulEquiv.symm_apply_apply] using hσ

theorem rh_host_emb_mem (R : Ranks) (H : Host R) (g : R.GG) :
    H.emb g ∈ H.cmType ↔ g ∈ R.Psi := by
  simpa only [Host.emb, Host.sigmaOf, MulEquiv.apply_symm_apply] using
    H.der.cmType.2.2 H.φ₀ H.φ₀_mem (H.gal.symm g)

theorem rh_factEmb : FactEmb := by
  intro R H
  exact ⟨rh_host_emb_bijective R H, rh_host_emb_mem R H⟩

theorem rh_cmtype_places (R : Ranks) (H : Host R) :
    Function.Bijective (fun ψ : H.cmType => InfinitePlace.mk ψ.1) := by
  classical
  have hsep (ψ : H.E →+* ℂ) :
      ψ ∈ H.cmType ↔ ComplexEmbedding.conjugate ψ ∉ H.cmType := by
    change ψ ∈ H.cmType ↔ (starRingEnd ℂ).comp ψ ∉ H.cmType
    exact H.der.cmType.1 ψ
  constructor
  · intro a b hab
    rcases InfinitePlace.mk_eq_iff.mp hab with he | he
    · exact Subtype.ext he
    · have hn := (hsep a.1).1 a.2
      rw [he] at hn
      exact (hn b.2).elim
  · intro w
    by_cases hp : w.embedding ∈ H.cmType
    · exact ⟨⟨w.embedding, hp⟩, InfinitePlace.mk_embedding w⟩
    · have hc : ComplexEmbedding.conjugate w.embedding ∈ H.cmType := by
        apply (hsep _).2
        rw [ComplexEmbedding.involutive_conjugate H.E w.embedding]
        exact hp
      exact ⟨⟨ComplexEmbedding.conjugate w.embedding, hc⟩,
        (InfinitePlace.mk_conjugate_eq _).trans (InfinitePlace.mk_embedding w)⟩

def rh_tau_cm (D : D7) (ρ : D.what₂.Tau) : D.host.cmType :=
  ⟨embOf D ρ, (rh_host_emb_mem D.R D.host (D.eTau ρ).1).2 (D.eTau ρ).2⟩

theorem rh_tau_cm_bijective (D : D7) : Function.Bijective (rh_tau_cm D) := by
  have hb := rh_host_emb_bijective D.R D.host
  constructor
  · intro a b h
    apply D.eTau.injective
    apply Subtype.ext
    apply hb.1
    exact congrArg Subtype.val h
  · intro ψ
    obtain ⟨g, hg⟩ := hb.2 ψ.1
    have hp : g ∈ D.R.Psi := (rh_host_emb_mem D.R D.host g).1 (hg.symm ▸ ψ.2)
    refine ⟨D.eTau.symm ⟨g, hp⟩, ?_⟩
    apply Subtype.ext
    simpa only [rh_tau_cm, embOf, Equiv.apply_symm_apply] using hg

theorem rh_tau_real_places (D : D7) :
    Function.Bijective (fun ρ : D.what₂.Tau =>
      (InfinitePlace.mk (embOf D ρ)).comap (algebraMap D.host.F D.host.E)) := by
  letI : IsCMField D.host.E := D.host.isCMField_hostE
  exact (IsCMField.equivInfinitePlace D.host.E).bijective.comp
    ((rh_cmtype_places D.R D.host).comp (rh_tau_cm_bijective D))

theorem rh_factEmb_replay : FactEmb := by
  first
  | (rh_reduce 2 using [rh_factEmb]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh_factEmb

rh_scan rh_factEmb limit 2000
rh_scan rh_tau_real_places limit 2000
rh_prune rh_host_emb_mem as RHIntegrationCMHostMemPruned
rh_prune rh_tau_real_places as RHIntegrationCMPlacesPruned
#print axioms rh_factEmb
#print axioms rh_host_emb_bijective
#print axioms rh_cmtype_places
#print axioms rh_tau_real_places

end RHIntegrationCMPlaces
