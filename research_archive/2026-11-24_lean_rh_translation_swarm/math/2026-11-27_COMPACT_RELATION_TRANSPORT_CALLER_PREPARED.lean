import Mathlib.LinearAlgebra.FreeModule.PID

/-!
# Compact Selmer relation transport — actual caller patch prepared

**Status:** the caller-specific projectivity premise is `REPLAYED`; the exact
`New.Selmer.TwistForRows` substitution is `PREPARED`, not yet `REPLAYED` or `INTEGRATED`.
RH and root obligation C1 remain open.

## Authenticated source

* compact source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`;
* Lean `v4.35.0`; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`;
* actual consumer: `grh-compact/src/New/Selmer/TwistForRows.lean`, public theorem
  `exists_mFoldTwist_selmerLengthLe`, original blob
  `802242498ad4530e7f52cc4f14e0a03be2c59f4d`;
* prepared source blob after the lane patch:
  `086804e709b8064f341b0e2824879c5af55e50ec`;
* exact patch is beside this file as
  `2026-11-27_COMPACT_RELATION_TRANSPORT_CALLER_PREPARED.patch`.

The actual caller first installs

`Algebra O O'`, `IsTorsionFree O O'`, and `Module.Finite O O'`

at source lines 54--61.  `O : CoeffRing ℓ` is a DVR by
`Lib/General/NumberTheory/StableLattice.lean`, hence a principal ideal domain.
The theorem below checks the only caller-specific class implication needed by the extracted
transport lemma: finite torsion-free over a PID is free, and free is projective.

## Exact reduction

Original local graph:

`finite/torsion-free CoeffRing extension -> inline forall-dual separation -> mapRel relation`
` -> relationsOn membership -> obeying inclusion`.

Reduced local graph:

`finite/torsion-free over PID -> Projective O O'`
` -> relEval_mapRel_eq_zero_of_forall_dual (already natively replayed in the preceding lane run)`
` -> unchanged crystalline dual-test premise -> unchanged relationsOn/obeying consumer`.

The patch adds one private generic helper and replaces only the duplicated inline
dual-separation block.  It does not weaken or remove the crystalline cocycle premise, the local
twist-triviality calculation, `mapDomain_mapRange`, or any Selmer hypothesis.

## Verification performed on 27 November 2026

From the pinned compact checkout:

* `lake env lean CompactProjectiveInstance.lean`: exit `0` in `7.03 s`; the theorem below reports
  exactly `propext`, `Classical.choice`, and `Quot.sound`.  The sole diagnostic is a style linter
  preferring `let` to `letI`; there is no error or `sorryAx`.
* `git diff --check -- src/New/Selmer/TwistForRows.lean`: exit `0`.
* `git diff --reverse --check -- src/New/Selmer/TwistForRows.lean`: exit `0`.
* `lake build New.Selmer.TwistForRows`: the first uncached run reached
  `[9150/9481]` after successfully building the defining algebra module, `StableLattice`,
  `Ainf`, `PrimeError`, and other prerequisites.  It was deliberately interrupted with exit
  `130` at the run boundary.  No patched-source error had appeared, but this is **not PASS**.

Failed/abandoned attempts are evidence, not hidden: the first exact CoeffRing probe failed because
`StableLattice.olean` had not yet been built; two later exact-import probes were cancelled while
the saturated root build was loading the environment.  Reducing the import to the precise PID
class theorem below produced the native result.  The caller build remains pending audit/replay,
not missing mathematics at this substep.

Surviving C1 mathematics is unchanged: actual Hodge-frame fixedness/jumps, integral-basis
contraction, chart/adic approximation, odd-Sha input, and the fit witness.  This certificate does
not prove `FitTwistsExist`, the central star inequality, or RH.

**RESUME HERE:** in the cached pinned compact checkout with prepared blob
`086804e709b8064f341b0e2824879c5af55e50ec`, rerun exactly
`lake build New.Selmer.TwistForRows` to termination, then import that module and execute
`#print axioms exists_mFoldTwist_selmerLengthLe`; accept the caller substitution only if both
commands finish without `sorryAx` or a new axiom.
-/

open Module

variable {O O' : Type*} [CommRing O] [CommRing O'] [IsDomain O]
  [IsPrincipalIdealRing O]

/-- The class implication used at the actual CoeffRing caller. -/
theorem projective_of_finite_torsionFree_over_pid
    [Algebra O O'] [Module.Finite O O'] [IsTorsionFree O O'] :
    Projective O O' := by
  letI : Module.Free O O' := Module.free_of_finite_type_torsion_free'
  exact Module.Projective.of_free

#print axioms projective_of_finite_torsionFree_over_pid

