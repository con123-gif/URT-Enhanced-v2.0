import Development.AutomorphicArithmetic.AutomorphicVarieties.IdeleGenerators.TorsionOrderFrobenius.QuadMu
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared caller-level certificate for the remaining `KillsMu` leaf in the
quadratic-sign branch of `countQ_alt`.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH.  It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField ReciprocityTheory.Gal
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Af.Bc UpperTheory.V.Base

namespace RHMathCountQSignKillsMu

variable {Omega K C : Type} [Field Omega] [Algebra ℚ Omega]
variable [IsAlgClosure ℚ Omega] [Field K] [NumberField K]
variable [Algebra K Omega] [IsScalarTower ℚ K Omega]
variable [Monoid C]

/-- A quadratic sign character is killed by the absolute discriminant.

The substantive input is the pinned public theorem `quadMu`: an absolute
Galois element fixing all `|disc K|`-th roots of unity fixes `K`.  The
`IsSign` kernel description then forces the character value to be one. -/
theorem sign_killsMu_absDiscr
    (hK : Module.finrank ℚ K = 2)
    (delta : G ℚ Omega →* C)
    (hsign : (∀ s, delta s = 1 ↔
      s ∈ (UpperTheory.V.Af.Bc.res ℚ Omega K).range)) :
    KillsMu (NumberField.discr K).natAbs delta := by
  intro s hs
  apply (hsign s).2
  have hgal : s ∈ galOf ℚ K Omega :=
    UpperTheory.V.Sd.Tw.quadMu K Omega hK s hs
  change s ∈ (galEmb ℚ K Omega).range
  rw [range_galEmb]
  exact hgal

/-- Exact modulus enlargement: fixing all `M`-th roots implies fixing all
`D`-th roots whenever `D | M`. -/
theorem killsMu_of_dvd {D M : Nat} {delta : G ℚ Omega →* C}
    (hDM : D ∣ M) (hD : KillsMu D delta) : KillsMu M delta := by
  intro s hs
  apply hD s
  intro z hz
  apply hs z
  obtain ⟨k, rfl⟩ := hDM
  rw [pow_mul, hz, one_pow]

/-- Caller-ready form: discriminant support in `M` closes the exact
same-modulus `KillsMu M delta` premise left by the Level transport. -/
theorem sign_killsMu_of_absDiscr_dvd
    (hK : Module.finrank ℚ K = 2)
    (delta : G ℚ Omega →* C)
    (hsign : (∀ s, delta s = 1 ↔
      s ∈ (UpperTheory.V.Af.Bc.res ℚ Omega K).range))
    {M : Nat} (hdiv : (NumberField.discr K).natAbs ∣ M) :
    KillsMu M delta := by
  exact killsMu_of_dvd hdiv (sign_killsMu_absDiscr hK delta hsign)

/-- Mandatory recursive-reduction replay. -/
theorem sign_killsMu_replay
    (hK : Module.finrank ℚ K = 2)
    (delta : G ℚ Omega →* C)
    (hsign : (∀ s, delta s = 1 ↔
      s ∈ (UpperTheory.V.Af.Bc.res ℚ Omega K).range))
    {M : Nat} (hdiv : (NumberField.discr K).natAbs ∣ M) :
    KillsMu M delta := by
  first
  | (rh_reduce 4 using [sign_killsMu_of_absDiscr_dvd hK delta hsign hdiv]; done)
  | (rh_auto_frontier 4; done)
  | (rh_auto 4; done)
  | exact sign_killsMu_of_absDiscr_dvd hK delta hsign hdiv

end RHMathCountQSignKillsMu

rh_prune RHMathCountQSignKillsMu.sign_killsMu_replay as RHMathCountQSignKillsMu.SignKillsMuPruned
rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.V.Sd.Tw.quadMu limit 2000
rh_scan RHMathCountQSignKillsMu.sign_killsMu_of_absDiscr_dvd limit 2000
#print axioms UpperTheory.V.Sd.Tw.quadMu
#print axioms RHMathCountQSignKillsMu.sign_killsMu_absDiscr
#print axioms RHMathCountQSignKillsMu.sign_killsMu_of_absDiscr_dvd
#print axioms RHMathCountQSignKillsMu.SignKillsMuPruned
