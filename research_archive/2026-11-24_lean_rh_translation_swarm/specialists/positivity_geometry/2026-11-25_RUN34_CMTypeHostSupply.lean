import Formalism.LocalToGlobal.GlobalTheory.GL5.PNamed
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN34: actual host supplies FactEmb and the CM-place bijection.
25 Nov 2026. HUMAN SOURCE-MATCHED; native PREPARED, NOT compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed
d91ae2678eea19a0c3045ffca37f1da757c2e719. Mission cd0a176134d46b5b624896e56843a24915c14477
read first; AGENTS, SWARM, HANDOFF, EXPANSION, continuity, state/log/protocol,
summary and live proof 464e82f81f646d4af85e1f5f70d379026df46261 inspected
(long files in part). RUN33 0e1b92ab, integration 95545ee1/38b6cc25,
editor 3e1000ef; peers ab51a90e, 9e2b2625, b6601b9c, f6d47bbb checked.

Human proof insertion: let H be the SAME native Host(R), E=H.E, F=H.F,
s=H.sqd. HostRaw provides E/Q Galois, s²=-d with d a positive prime,
F the maximal real subfield, and H.phi0 belongs to C={tau: E->C |
tau(s)=i sqrt(d)}. HostAx.der.cmType is an existing host field.
Every embedding tau of E into C has the same image as phi0 by normality
(the same splitting field), hence uniquely tau=phi0∘sigma for sigma
in Gal(E/Q). Compose with H.gal: H.emb is bijective. The existing
HostDer.cmType.2.2 applied to phi0 and H.gal.symm(g) gives exactly
H.emb(g) in C iff g in R.Psi. This supplies FactEmb, without a new
cardinality premise. It does not prove the native Host exists.

CMData.deg2 and totReal give [E:F]=2 and F totally real. The nonzero
imaginary square root s cannot lie in F, so E=F(s). Above each real
embedding v:F->R the only two embeddings are
    tau_±(a+b s)=v(a) ± i sqrt(d) v(b).
These preserve multiplication by s²=-d; precisely tau_+ is in C.
Thus restriction C -> Hom(F,R) is bijective, not merely equal in
cardinality. Combining D.eTau and embOf yields the actual indexing
    embOf(D,rho)|F : D.what₂.Tau ≃ {real embeddings of F}.
There is no duplicate factor or square in the archimedean Haar product.
HostDer.cmType.1 directly supplies conjugation complementarity. The
restriction equivalence is proved here in ordinary mathematics; native
formalization and topology/Haar transport are still pending.

Original local source-visible graph: FactEmb -> RUN33 embedding enumeration
-> IsVolMeas comparison -> VolSigIndep -> vol_eq_of_indep.
Candidate: Host.galois + Host.gal + phi0_mem + Host.der.cmType.2.2
+ Mathlib normal embedding equivalence -> FactEmb; CMData.deg2/totReal
+ sqd_sq and d>0 -> one-per-place. Original graph and all unresolved
typed/value/constructor/axiom edges preserved. Context key (pin, toolchain,
D,R,H,E,F,phi0,s,cmType,eTau). No cross-host cache. Backtrack if replay fails.
No root-reachable obligation retired, no new axiom evidence, no URT claim.
Retain the actual host producer, VolTie, Tamagawa measure comparison, signed
mass interval [-2L,m] and other VWinAt(1,401) suppliers.

Executed 33 exact source/hash assertions against:
src/Formalism/LocalRingCardinality/DataHost.lean
  7e9af8ab364965c62be250ae93974098141598c0
src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ConjEMemHostFIff.lean
  0ab34ba6d386bb84908efe66de6ce50108eacddc
src/Formalism/LocalRingCardinality/DataSpaces.lean
  f1d2da346f8996c2527724b50fd6409dc8ab937b
src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean
  cb758a6c5f78e610b8f946d4b733d07902b15f5d
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474:
Mathlib/FieldTheory/Normal/Defs.lean 93e37bfca2d814ed08ad101ebc953be1c246dc07
Mathlib/Algebra/Algebra/Tower.lean ae551c438c7583a07c1925cf32708be2bf985854.
All four upstream source blobs differ from pin (head blobs respectively
39feca3757a3775143177790c2858ce27975e492,
a6fa138d33c044ca69cef4ffd330ea89a31a9713,
5385a1b1b3a1d04c9fa7659245bbc4a992b2b924,
8ddc702987a34949a4c215212d734b618ab8de3d); no inference of mathematical change.
Prior CI statuses retrieved: 45577239749 and 45576756833 status pass,
returncode 0; NOT new certificate validation. No local lean/lake on PATH.
Native search/prune/scan commands prepared. Check local algebra instance,
tower and Normal.algHomEquivAut elaboration first.

RESUME HERE: compile RUN34 with RUN33 and editor 3e1000ef on exact pin,
audit FactEmb and actual embOf caller; use the restriction bijection in
IsVolMeas. Verify exact Tamagawa reference and native topological/Haar
transport. Continue signed mass interval branch if it avoids global
normalization. HANDOFF TO integration/editor, literature, kernel, audit.
RH OPEN.
-/

noncomputable section
namespace RHPositivity34
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem emb_injective (R : Ranks) (H : Host R) :
    Function.Injective H.emb := by
  intro g g' h
  apply H.gal.symm.injective
  apply AlgEquiv.ext
  intro x
  apply H.φ₀.injective
  exact DFunLike.congr_fun h x

theorem emb_surjective (R : Ranks) (H : Host R) :
    Function.Surjective H.emb := by
  letI : Algebra H.E ℂ := H.φ₀.toAlgebra
  letI : IsScalarTower ℚ H.E ℂ :=
    IsScalarTower.of_algebraMap_eq' (by ext q; simp)
  letI : IsGalois ℚ H.E := H.galois
  intro τ
  let f : H.E →ₐ[ℚ] ℂ := { τ with commutes' := by intro q; simp }
  let e := Normal.algHomEquivAut (E := H.E) ℚ ℂ
  let σ := e f
  refine ⟨H.gal σ, ?_⟩
  apply RingHom.ext
  intro x
  change H.φ₀ (H.gal.symm (H.gal σ) x) = τ x
  rw [MulEquiv.symm_apply_apply]
  have he := DFunLike.congr_fun (e.symm_apply_apply f) x
  change H.φ₀ (σ x) = τ x at he
  exact he

theorem emb_membership (R : Ranks) (H : Host R) (g : R.GG) :
    H.emb g ∈ H.cmType ↔ g ∈ R.Psi := by
  simpa only [Host.emb, Host.sigmaOf, MulEquiv.apply_symm_apply] using
    H.der.cmType.2.2 H.φ₀ H.φ₀_mem (H.sigmaOf g)

theorem factEmb_from_host : FactEmb := by
  intro R H
  constructor
  · exact ⟨emb_injective R H, emb_surjective R H⟩
  · intro g
    first
    | (rh_reduce 3 using [emb_membership]; done)
    | (rh_auto_frontier 3; done)
    | (rh_auto 3; done)
    | exact emb_membership R H g

theorem cmType_conjugate_choice (R : Ranks) (H : Host R)
    (τ : H.E →+* ℂ) :
    τ ∈ H.cmType ↔ (starRingEnd ℂ).comp τ ∉ H.cmType :=
  H.der.cmType.1 τ

theorem embOf_enumerates (D : D7) :
    Function.Injective (embOf D) ∧
      ∀ τ : D.host.E →+* ℂ,
        (∃ ρ : D.what₂.Tau, embOf D ρ = τ) ↔ τ ∈ D.host.cmType := by
  obtain ⟨hB, hP⟩ := factEmb_from_host D.R D.host
  constructor
  · intro a b hab
    apply D.eTau.injective
    apply Subtype.ext
    exact hB.1 hab
  · intro τ
    constructor
    · rintro ⟨ρ, rfl⟩
      exact (hP (D.eTau ρ).1).2 (D.eTau ρ).2
    · intro ht
      obtain ⟨g, hg⟩ := hB.2 τ
      have hp : g ∈ D.R.Psi := (hP g).1 (hg.symm ▸ ht)
      refine ⟨D.eTau.symm ⟨g, hp⟩, ?_⟩
      simpa only [embOf, Equiv.apply_symm_apply] using hg

rh_scan factEmb_from_host limit 2000
rh_scan embOf_enumerates limit 2000
rh_prune emb_membership as RH34MembershipPruned
rh_prune embOf_enumerates as RH34EmbOfPruned
#print axioms emb_injective
#print axioms emb_surjective
#print axioms factEmb_from_host
#print axioms cmType_conjugate_choice
#print axioms embOf_enumerates

end RHPositivity34
