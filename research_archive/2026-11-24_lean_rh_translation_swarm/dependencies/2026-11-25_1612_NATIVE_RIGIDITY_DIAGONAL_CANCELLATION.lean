import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.NormCob
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# CountI / CorG native rigidity frontier (2026-11-25)
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission blob cd0a176134d46b5b624896e56843a24915c14477.
Parent lane 3044c307f08a82f485b6434c5289cfb62b04d617.
Status: SOURCE-MATCHED; Lean certificate PREPARED, not compiled.
No new RH premise proved. No new axiom audit or claimed engine speedup.

Original source chain:
TheoremsMuLinked/GaloisRepresentationTypes/OneChar.lean
500557b0d4b61403ac9d7cd94c67efaa8900fb74, lines 175–176:
model_upper receives (Th.ptHyp_of hI D hM S ι hB hW M.x₀ M.base).
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
calls gradedModel_derivationCondition_of_ptHyp S M hl hmk hM2 hpt.
UnitaryThreeGroups/GradedModelDerivationConditionOfPtHyp.lean
da8ae7b1802fc9ee5873d56ab91f3afc23d613dd uses hpt.rigid f htwo,
M.pts, M.der, tanCoc_determines and normCoc_cob_iff.
Rigid0.lean 54c6fe0054d9af0ee88834cbf84919dc40892329 defines PtHyp.rigid:
∀ f : R →ₐ[c.O] PadicAlgCl l, TwoPt η r f → Rigid r f.
TanDet.lean f1132996a3fd9c2caac5fa6ffc94ae687f4faaa2.
NormCob.lean 9a9966d2872c9504cfa4208c2ee45948a0043f6f.

Exact algebra (zero-based indices): write M=(r g₁).mat, J=reversal,
δ=M00−M22. Normalised implies M01=M12 and M10=M21.
Hence W=M−JMᵀJ=δ diag(1,0,−1).
At c the normalization imposes X=−JXᵀJ; IsUnit 2 implies
X=[[a,b,0],[d,0,−b],[0,−d,−a]]. At g₁ the two remaining
commutator constraints are −δb=0 and δd=0. Since δ is a unit
(because it is the native zeta), b=d=0.
Converse immediate. Negative control: M=I, X=E01−E12 satisfies
the normalization and both commutator constraints when δ=0,
but is not diagonal. Do not drop IsUnit 2 or IsUnit zeta.
All coefficient ring, group and actual representation hypotheses retained.

Reduced source graph adds exact diagonal cancellation within NormCob;
does not remove PtHyp.rigid, M.pts, M.der, tanCoc_determines,
other consumers of PtHyp, or any original kernel edges.
Cache key requires source/toolchain, R,r,c,g₁,X and both sign guards,
Normalised, IsUnit 2 and IsUnit zeta. No unconditional retirement.

27 actual source/hash/unique replacement and reverse reconstruction
checks ran in connector JS on six pinned sources (five edits to native
NormCob forward body, inverse reconstruction exact). These are static,
not Lean proof checks. This compact certificate retains the elementary
diagonal identity and scalar reduction separately. The native theorem
is referenced only as a diagnostic baseline, not as a new proof.
Old engine CI runs 45577239749 and 45576756833 passed; neither tested
this certificate. No local Lean executable; native replay pending.

RESUME HERE: recover actual declaration and body of Th.ptHyp_of,
then its two-signed rigid supplier, on the exact same-host context.
Run prior up_holds certificate in existing RUN34 native batch before
retiring its premises; verify actual output and compare axiom ledgers.
HANDOFF: integration, Galois, kernel audit, acceleration.
-/

open Matrix UpperTheory.V.U3

namespace RHDependencyNormCob

theorem diagonal_gap {R : Type} [CommRing R] (M : Matrix (Fin 3) (Fin 3) R)
    (h12 : M 0 1 = M 1 2) (h21 : M 1 0 = M 2 1) :
    M - Jmat R 3 * Mᵀ * Jmat R 3 =
      Matrix.diagonal ![M 0 0 - M 2 2, 0, -(M 0 0 - M 2 2)] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Jmat, Matrix.mul_apply, Fin.sum_univ_three, Fin.rev, Matrix.diagonal, h12, h21] <;> ring

theorem scalar_cancel {R : Type} [CommRing R] (δ b d : R)
    (hu : IsUnit δ) (hb : δ * b = 0) (hd : δ * d = 0) : b = 0 ∧ d = 0 := by
  constructor
  · exact hu.mul_left_cancel (by simpa using hb)
  · exact hu.mul_left_cancel (by simpa using hd)

end RHDependencyNormCob

#print axioms UpperTheory.V.U3.normCoc_cob_iff
#print axioms RHDependencyNormCob.diagonal_gap
#print axioms RHDependencyNormCob.scalar_cancel
rh_scan UpperTheory.V.U3.normCoc_cob_iff limit 2000
rh_scan RHDependencyNormCob.diagonal_gap limit 2000
rh_prune RHDependencyNormCob.diagonal_gap as RHDependencyNormCobPruned
