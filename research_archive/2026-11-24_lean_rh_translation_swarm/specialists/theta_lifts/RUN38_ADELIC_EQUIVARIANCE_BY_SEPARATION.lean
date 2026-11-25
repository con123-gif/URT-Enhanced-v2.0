import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsFiniteAdeleBaseChangeEquiv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 8 RUN38 | 25 Nov 2026 | HUMAN SOURCE-MATCHED / LEAN PREPARED NOT COMPILED.
RH OPEN. Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (including
mandatory engine), AGENTS, SWARM, HANDOFF, EXPANSION, continuity, state/log/
protocol openings and living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc
consulted. Prior theta 4445c6bd; actual peers d5bb73cf (determinant torus
cancellation), 2d9cc303 (restricted product calibration), f26f77b4
(VWin four-count core), 0ca8c0c7 (signed core_gm), c28ee336 (tower).
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. No upstream mixing.

NEW: RUN37's requirement to recover the SPECIFIC pure-tensor base-change
map for CM equivariance can be removed. The pinned source already uses
integrality and congruence separation, rather than topological continuity,
for its internal tensor-to-tensor equivariance. Adapt that exact argument
to the standard finite adele codomain, using the stronger direct
separation lemma there.

Let A=E tensor_F Af(F), S=IntAf(F,E), B=Af(E), O=intAd(E).
For ring maps f,g:A->B, suppose f(S),g(S) subset O and f=g on E.
For arbitrary y in A and every positive integer N, apply the native
exists_approx to y/N (division on the E-factor). Then
  y=N*(x tensor 1+r), x in E, r in S.
Exact cancellation before valuations:
  f(y)-g(y)=N*(f(r)-g(r)) in N O.
The native integral_finiteAdele_complete_separated gives
  intersection_{N>=1} N O = {0}.
Thus f=g. This proves uniqueness with only rational compatibility and
integrality; no continuity or local-density hypothesis. This is a
human proof for arbitrary y,N, not a finite test.

Apply to f=rho o sigR and g=tau o rho, where rho is ANY native
base-change equivalence satisfying the first two conjuncts of
exists_finiteAdele_baseChange_equiv and tau is the natural CM action
on Af(E). The action permutes places and applies the induced local
field isomorphisms, hence preserves O and restricts to star on E.
The native csScale_sigR_mem supplies integrality for sigR.
Both maps agree on E by the same star compatibility, so
                rho(sigR(y))=tau(rho(y)).
Consequently the specific pure-tensor formula and a separate density
argument from RUN37 are unnecessary. This also proves uniqueness of
the base-change ring equivalence itself among maps with the same
two conditions. The existence/identification of the standard tau
as a Lean ring hom, preserving O and acting as star, is still needed.
It is not being asserted as a checked Lean declaration here.

The map can now be passed to native exists_unitary_equiv with both
conjugating matrices identity and with the canonical diagonal J on
both sides (mapped to their respective rings). Retain coordinate
lattice, congruence basis, rational subgroup and quotient transport
checks. The result is specifically useful to RUN37 and editor's
determinant torus rank factor: no independent CM signature comparison
or chosen pure-tensor construction is needed for this equivariance.
It does NOT prove Haar normalization, Tamagawa, rankFac, or the
same-host VWinAt supplier. The standard determinant-section and
finite mass calculations in editor d5bb73cf remain conditional on
the native dictionary; do not duplicate them here.

Original graph (source-visible): RUN36 CanonicalRank36 -> gaugeVol;
RUN37 restricted product -> explicit rho construction -> pure tensor
formula + continuity of local completion maps -> equivariance.
Reduced candidate: same gaugeVol and same host -> rho rational +
integral compatibility, tau rational + integral compatibility,
csScale_sigR_mem -> exists_approx + direct adele separation ->
equivariance -> native exists_unitary_equiv. This replaces a local
supplier only; original graph and all unresolved leaves kept.
Native exists_fin_equiv already proves the tensor-to-tensor version
via adele_hom_ext, lines 391-417. No elaborated dependency removed.
Cache with source/toolchain, exact F,E, ring maps, integral subrings,
sigma/tau, n, J and actual consumer; not just declaration names.
Backtrack to RUN37 explicit construction if a native compatibility
premise fails. No URT experiment, because exact cancellation suffices.

Source ledger, pinned src/:
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsFiniteAdeleBaseChangeEquiv.lean
  7452a948191f52df06f6501ac70ae5e69935bc72 (exists_approx 134,
  eq_zero_of_divisible 184, exists_finiteAdele_baseChange_equiv 331).
Development/AbelianVarietyTheory/Proofs/UnitaryExistence/IntegralFiniteAdeleCompleteSeparated.lean
  1017e864a696bc30726d16d7a25f7bc63255c8f2
  (integral_finiteAdele_complete_separated, first conjunct).
Development/AbelianVarietyTheory/Proofs/FlagMeasures/GaugeVolumeEqOfSemilinearIsometryGenus.lean
  d8e911ba588e91954a6b50bf044fd455e8715376
  (adele_hom_ext 348-361, exists_fin_equiv 391-417, exists_unitary_equiv).
Formalism/SatakeDualWeyl/AdelicIwasawaHecke/CsScale.lean
  7817cc10169765f308f250dc1a030b6ff4df15be (csScale_sigR_mem).
All four blobs directly retrieved and named proof bodies inspected;
additional native mass and gauge sources and both peer patches read.
Lean and Lake absent from local PATH. Actual baseline CI status
records read: 45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode
0. Neither tests this certificate. No new CI job submitted or
new axiom report; zero root obligations formally retired.
No synthetic regressions claimed. Prepared source below uses native
reduction tactics with explicit fallback and includes scan/prune/axiom
commands. Run with the existing pinned environment and preserve failures.

RESUME HERE: replay this file (independent of RUN35-37 imports) and
formalize the standard CM action tau by local completion transport;
prove rational and integral compatibility, then apply native
exists_unitary_equiv. Integrate with RUN37 coordinate lattice and
editor d5bb73cf, preserving finite topology and Haar/Tamagawa leaves.
HANDOFF TO geometry, kernel extractor, editor, integration and audit.
-/

open NumberField IsDedekindDomain Formalism.BasicNotions Formalism.FrobeniusOrbits
open Formalism.L2.DIV Formalism.UG Formalism.UG.P
open Formalism.MainNotions.S GlobalTheory.AdeleBaseChange
open scoped TensorProduct

noncomputable section
namespace RHTheta38

variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]

theorem adele_target_ext
    (f g : AfE F E →+* FiniteAdeleRing (𝓞 E) E)
    (hf : ∀ y ∈ RInt F E, f y ∈ intAd E)
    (hg : ∀ y ∈ RInt F E, g y ∈ intAd E)
    (h : ∀ x : E, f (x ⊗ₜ[F] 1) = g (x ⊗ₜ[F] 1))
    (y : AfE F E) : f y = g y := by
  rw [← sub_eq_zero]
  refine (GlobalTheory.AdLat.integral_finiteAdele_complete_separated E).1 _ ?_
  intro N hN
  obtain ⟨x, r, hr, e⟩ := exists_approx (F := F) (E := E) ((N : E)⁻¹ ⊗ₜ[F] 1 * y)
  have e2 : y = N • (x ⊗ₜ[F] 1 + r) := by
    rw [← e, ← smul_mul_assoc, TensorProduct.smul_tmul', nsmul_eq_mul,
      mul_inv_cancel₀ (Nat.cast_ne_zero.2 hN.ne'), ← Algebra.TensorProduct.one_def, one_mul]
  have hw : f r - g r ∈ intAd E := sub_mem (hf r hr) (hg r hr)
  refine ⟨f r - g r, ?_, ?_⟩
  · intro v
    exact hw v
  · rw [e2, map_nsmul, map_nsmul, map_add, map_add, h, ← smul_sub, add_sub_add_left_eq_sub]

theorem base_change_unique
    (a b : AfE F E ≃+* FiniteAdeleRing (𝓞 E) E)
    (ha : ∀ x : E, a (x ⊗ₜ[F] 1) = algebraMap E _ x)
    (hb : ∀ x : E, b (x ⊗ₜ[F] 1) = algebraMap E _ x)
    (haI : ∀ y ∈ RInt F E, a y ∈ intAd E)
    (hbI : ∀ y ∈ RInt F E, b y ∈ intAd E)
    (y : AfE F E) : a y = b y :=
  adele_target_ext a.toRingHom b.toRingHom haI hbI
    (fun x => (ha x).trans (hb x).symm) y

theorem native_cm_equivariance (I : AutInst)
    (rho : AfE I.F I.E ≃+* FiniteAdeleRing (𝓞 I.E) I.E)
    (tau : FiniteAdeleRing (𝓞 I.E) I.E →+* FiniteAdeleRing (𝓞 I.E) I.E)
    (hR : ∀ x : I.E, rho (x ⊗ₜ[I.F] 1) = algebraMap I.E _ x)
    (hI : ∀ y ∈ RInt I.F I.E, rho y ∈ intAd I.E)
    (hT : ∀ x : I.E, tau (algebraMap I.E _ x) = algebraMap I.E _ (star x))
    (hTI : ∀ y ∈ intAd I.E, tau y ∈ intAd I.E)
    (y : AfE I.F I.E) :
    rho (sigR I.cm.sig (Af I.F) y) = tau (rho y) := by
  let f := rho.toRingHom.comp (sigR I.cm.sig (Af I.F))
  let g := tau.comp rho.toRingHom
  have hf : ∀ z ∈ RInt I.F I.E, f z ∈ intAd I.E :=
    fun z hz => hI _ (Formalism.UG.P.csScale_sigR_mem _ hz)
  have hg : ∀ z ∈ RInt I.F I.E, g z ∈ intAd I.E :=
    fun z hz => hTI _ (hI z hz)
  have he : ∀ x : I.E, f (x ⊗ₜ[I.F] 1) = g (x ⊗ₜ[I.F] 1) := by
    intro x
    change rho ((star x) ⊗ₜ[I.F] 1) = tau (rho (x ⊗ₜ[I.F] 1))
    rw [hR, hR, hT]
  change f y = g y
  first
  | (rh_reduce 2 using [adele_target_ext]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact adele_target_ext f g hf hg he y

end RHTheta38

rh_scan GlobalTheory.GaugeTransport.adele_hom_ext limit 2000
rh_scan GlobalTheory.AdLat.integral_finiteAdele_complete_separated limit 2000
rh_scan RHTheta38.native_cm_equivariance limit 2000
rh_prune RHTheta38.native_cm_equivariance as RHTheta38CMPruned
#print axioms RHTheta38.adele_target_ext
#print axioms RHTheta38.base_change_unique
#print axioms RHTheta38.native_cm_equivariance
#print axioms GlobalTheory.AdLat.integral_finiteAdele_complete_separated
