import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsContinuousMulEquivCongruenceTopologyAdelic
import Development.AbelianVarietyTheory.Definitions.Foundations.HermitianSpaceBaseLatticeEqFrameLattice
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsFiniteAdeleBaseChangeEquiv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN49, 26 November 2026. SOURCE-MATCHED human argument /
Lean PREPARED, NOT COMPILED. RH OPEN.
Latest ONE_EQUATION_MISSION including mandatory engine read first;
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/runner openings and
living proof consulted. Peer results: theta f95e652848330bf82468eafa7e08769ed3788c64
(finite_only48), geometry 2ecd1489c31ea06e01a5e48fe1ce1a0616a8512c
(selected Euler rank ratio), integration fccd0f04452988a6fc523b48611e317295decc98
(shared row witness), audit 4072e556, literature 4d38e39e, and other
recent commit summaries. Own RUN48 b86025dc5cd80bec76190870e0253e74b410e28f.
Pinned leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005; newer observed upstream
4fef2fddbf3cedd14f55a7fd552765d29e6bb936 not adopted.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

NEW: resolve the local-to-global lattice dictionary requested by
theta RUN48, at the actual lamAf / AutInst.Lf input. It is a
composition of two native proved theorems, not a new arithmetic
approximation result:

  y in lamAf L iff for every v, vecLoc v (tensorComm y) in latLoc L v.

Native mem_lamAf_iff swaps the tensor factors; mem_latHat_iff
then gives the equivalence. The required finite generation is
already AutInst.L_fg. RUN40 gave the finite generator idea;
RUN41 used it for HSpace and latHat; the new adapter composes
the actual AutInst-side dictionary for the finite_only48 caller.

For a fixed common F,E and rank, take the finite-place integral
isometries A_v between the actual completed lattices L'_v and L_v,
as in editor RUN48 (unramified self-dual models). There is no
need for a rational global isometry. Both A_v and B_v=A_v^-1
assemble into finite-adelic matrices. Proof: a full finitely
generated O_E-lattice L satisfies
    d O_E^n subset L subset d^-1 O_E^n
for some positive rational integer d: clear the denominators
of a finite generating family, and of expressions for the
coordinate basis in a rational spanning subfamily. Use one d
for both L and L'. At every place not dividing d, both
completions are exactly the standard integral lattices. Since
A_v maps one onto the other, the columns of A_v and B_v are
integral there. Thus the matrix entries are integral almost
everywhere. In E-adeles this constructs A and B componentwise.
The native exists_finiteAdele_baseChange_equiv identifies
E tensor_F Af(F) with Af(E), including the integral subrings.
Equivalently fix an F-basis b of E, and expand each local
tensor entry in b. Coordinates of integral elements have one
common denominator outside a finite set: choose a finite
Z-generating family of O_E, clear denominators of all its
F-basis coordinates, and use the local intLoc generation by
integral tensors. The finitely many exceptions can be enlarged
to include the primes dividing this denominator and d. Each
coordinate is then an actual finite adele of F. The lemma
glue_tensor49 implements this last coefficient assembly.
The native ext_components proves all matrix identities
componentwise: AB=BA=1 and A* J A=J' (star is CM involution).
This preserves the same field, rank and lattice witnesses.
The assembly argument is human mathematics; no new native
isometry-existence or component-extensionality certificate
has been executed. In particular the finite-coordinate
integrality guard in glue_tensor49 is explicit.

Now local membership transport and the native dictionary give
    y in lamAf L' iff A y in lamAf L.
This is exactly hL of theta finite_only48, after instantiating
the common coordinate ring and ring equivalence. The certificate
local_to_lamAf49 isolates this supplier with the explicit
projection intertwining premise; for matrix multiplication that
premise is the ordinary identity map(A*y)=map(A)*map(y).
Theta's existing stab_and_cong and closed-embedding lemma then
give transport of every congruence level and normalized Haar.
No global approximation theorem, rational-point transport, or
new continuity argument is needed for this particular step.
This is NOT a comparison of rational quotient spaces.

Remaining genuinely analytic step: authenticate trace-density
and contracted determinant differential -> native Haar at the
two endpoints, then separately compare SU and torus Tamagawa
quotients. Equality of normalized finite Haar alone does not
give equality of Tamagawa volume. Distinct rank-change geometry
Euler supplier and same-host CountI/II/V/Vs, TopG/Green/J/VWin
remain. No use of claimed RH theorem.

Source checks executed: 13 fail-on-error declaration/token checks
against pinned raw files:
  Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
    lamAf, Lf, L_fg, L_span
  Development/AbelianVarietyTheory/Definitions/Foundations/
    HermitianSpaceBaseLatticeEqFrameLattice.lean
    mem_latHat_iff, ext_components use, mem_levelOpen_iff_latHat
  Development/AbelianVarietyTheory/Proofs/FlagMeasures/
    ExistsContinuousMulEquivCongruenceTopologyAdelic.lean
    mem_lamAf_iff, tensorComm_mulVec_map_eq, exists_continuousMulEquiv_adelic
  Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
    ExistsFiniteAdeleBaseChangeEquiv.lean
    exists_finiteAdele_baseChange_equiv, prV_eq_zero_iff, map_surjective.
Contents metadata parsing attempt returned raw source, not JSON;
no new blob hash verification claimed. Exact immutable source pin
and full paths above. Earlier source-hash evidence retained.
Local command -v lean/lake/elan returned no paths.
Reread actual historical status.json for CI runs 45577239749
and 45576756833: status pass, returncode 0. Existing conditional
root axioms propext, Classical.choice, Quot.sound; bounded scan
pending 324. No new native execution, axiom audit, CI dispatch,
root retirement, or URT performance claim.

Original graph retained: theta finite_only48 requires A,B,rho,
hJ,Phi,hL; editor one_pair_eq48 requires selected normalized native
FD measures. Overlay: local integral isometries -> common denominator
restricted product assembly -> A,B -> local membership equivalences
+ native mem_lamAf_iff + mem_latHat_iff -> local_to_lamAf49 -> hL
-> theta finite_only48 -> normalized Haar transport. Other
original and reduced graphs, type/value/constructor roles and
pending nodes untouched. Cache by pin, toolchain, F,E,rank,
L,L',A_v,B_v,common finite basis, chosen coordinates, ring maps,
Gram, actual consumer and measure context; do not merge unequal
hosts. Backtrack to explicit hL if native replay fails.

RESUME HERE: stage this file with theta RUN48 in the existing
pinned native runner; replay local_to_lamAf49, then construct
the exact A,B from the selected local self-dual isometries,
checking coordinate-integrality and CM involution compatibility.
Next prove the actual common unnormalized density comparison
and substitute into editor base_pair48, not another downstream
reformulation. HANDOFF TO theta, geometry, integration, kernel,
audit. RH remains open.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.MainNotions.S
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open GlobalTheory.AdelicU
open scoped TensorProduct

namespace RHEditorFinite49

variable {F E : Type} [Field F] [NumberField F] [Field E]
  [NumberField E] [Algebra F E] {n m : ℕ}

def localSwap49 (v : HeightOneSpectrum (𝓞 F))
    (y : Fin n → E ⊗[F] Af F) : Fin n → Fv F v ⊗[F] E :=
  vecLoc v (fun i => Algebra.TensorProduct.comm F E (Af F) (y i))

theorem lamAf_local49 (L : Submodule (𝓞 E) (Fin n → E))
    (hL : L.FG) (y : Fin n → E ⊗[F] Af F) :
    y ∈ lamAf (F := F) L ↔ ∀ v, localSwap49 v y ∈ latLoc F L v := by
  unfold localSwap49
  rw [GlobalTheory.CongTop.Swap.mem_lamAf_iff,
    GlobalTheory.AdelicU.mem_latHat_iff hL]

/-- The native Lf membership premise of theta finite_only48
    reduces to the local lattice isometry conditions. -/
theorem local_to_lamAf49
    (L : Submodule (𝓞 E) (Fin n → E))
    (L' : Submodule (𝓞 E) (Fin m → E))
    (hL : L.FG) (hL' : L'.FG)
    (Phi : (Fin m → E ⊗[F] Af F) → (Fin n → E ⊗[F] Af F))
    (T : ∀ v : HeightOneSpectrum (𝓞 F),
      (Fin m → Fv F v ⊗[F] E) → (Fin n → Fv F v ⊗[F] E))
    (hComm : ∀ v y, localSwap49 v (Phi y) = T v (localSwap49 v y))
    (hLocal : ∀ v z, z ∈ latLoc F L' v ↔ T v z ∈ latLoc F L v) :
    ∀ y, y ∈ lamAf (F := F) L' ↔ Phi y ∈ lamAf (F := F) L := by
  intro y
  rw [lamAf_local49 L' hL', lamAf_local49 L hL]
  exact forall_congr' fun v => by
    rw [hComm]
    exact hLocal v _

/-- Assemble a single tensor entry with a fixed finite family
    of coefficients satisfying restricted-product integrality. -/
theorem glue_tensor49 {k : ℕ} (b : Fin k → E)
    (a : ∀ v : HeightOneSpectrum (𝓞 F), Fin k → Fv F v)
    (ha : ∀ j, ∀ᶠ v in Filter.cofinite,
      a v j ∈ v.adicCompletionIntegers F) :
    ∃ z : Af F ⊗[F] E, ∀ v : HeightOneSpectrum (𝓞 F),
      Algebra.TensorProduct.map (evalV F v) (AlgHom.id F E) z =
        ∑ j, a v j ⊗ₜ[F] b j := by
  let A : Fin k → Af F := fun j => ⟨fun v => a v j, ha j⟩
  refine ⟨∑ j, A j ⊗ₜ[F] b j, fun v => ?_⟩
  rw [map_sum]
  exact Finset.sum_congr rfl fun j _ => rfl

/-- Actual AutInst.Lf dictionary, no extra finite-generation
    or full-rank premise introduced. -/
theorem native_Lf49 (I : AutInst) (y : Fin I.n → I.E ⊗[I.F] Af I.F) :
    y ∈ I.Lf ↔ ∀ v, localSwap49 v y ∈ latLoc I.F I.L v := by
  first
  | (rh_reduce 2 using [lamAf_local49]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact lamAf_local49 I.L I.L_fg y

end RHEditorFinite49

rh_scan GlobalTheory.CongTop.Swap.mem_lamAf_iff limit 2000
rh_scan GlobalTheory.AdelicU.mem_latHat_iff limit 2000
rh_scan RHEditorFinite49.native_Lf49 limit 2000
rh_prune RHEditorFinite49.native_Lf49 as RHNativeLf49Pruned
#print axioms RHEditorFinite49.lamAf_local49
#print axioms RHEditorFinite49.local_to_lamAf49
#print axioms RHEditorFinite49.glue_tensor49
#print axioms RHEditorFinite49.native_Lf49
end
