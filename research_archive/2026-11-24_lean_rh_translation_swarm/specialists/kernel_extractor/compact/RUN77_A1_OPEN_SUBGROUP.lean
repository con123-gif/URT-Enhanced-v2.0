import New.Columns.LocalStatement
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Normed.Ring.Units

/-!
RUN77 — A1 local approximation via an open subgroup, 28 November 2026.
HUMAN DERIVED / PREPARED, native verification outstanding.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission, live spine/ledger, AGENTS, SWARM, HANDOFF and EXPANSION
read. Recent peers 569bbe26 (positive-type energy), f678ea4a (dirCost sign),
6cb0935a (normalized bottom) are separate lanes. RUN75 state status.json,
logs/result.json and outputs/a1/targeted_results.json were 404 at inspection;
no terminal success or failure established. Do not duplicate its queue.

The exact RUN76 helper (blob 71d5ed7dba25a2e845087e28b010ec8fe96e8464)
uses two entry-integrality conditions and two determinant balls. RUN67
eliminates one determinant ball by exact determinant cancellation.
Here remove BOTH determinant-continuity conditions from the approximation
argument, via the actual existing local group openness theorem.
For K = GL_n(O_w), A in K and arbitrary d in GL_n(E_w), define
 U = K intersect {X : d^-1 (A^-1 X) d in K}
   = K intersect A d K d^-1.
This is open in GL_n(E_w) and contains A. Indeed K is open and group
translations are continuous, and the second factor contains A since
d^-1 A^-1 A d = 1. The underlying-matrix map of GL_n(E_w) is open:
over the complete local field the operator matrix norm makes the
matrix ring a complete normed ring (finite dimension, equivalent
product topology); use Units.isOpenMap_val. Thus val(U) is a nonempty
open set of matrices. Entrywise density E -> E_w gives B over E
whose image is val(V) for some V in U. Since V is invertible,
det(B) cannot be zero (ring homomorphism preserves determinants).
Lift B to g in GL_n(E), then g.map f = V by injectivity of Units.val.
Both required integrality memberships follow simultaneously. The
determinant is only used for nonvanishing when lifting B to a unit,
not for constructing the open set or checking either determinant's
valuation. No premise added; no global adelic approximation required.
The elementary proof works for an arbitrary open subgroup of local GL;
the specialization here is EXACTLY the original A1 helper statement.

Source anchors checked at the pins:
 Lib/Adelic/Adeles/LocalComponents.lean: isOpen_Kw (implicit n, explicit w)
 Lib/Adelic/Unitary/SpaceDefs.lean: Kw = intGL n (LocInt w).1
 Mathlib/Analysis/Normed/Ring/Units.lean: Units.isOpenMap_val
 Mathlib/Analysis/Matrix/Normed.lean: Matrix.Norms.Operator
 Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean: det_ne_zero.
Actual connector source check: six unique anchors plus the exact original
helper end marker. The entire theorem signature is copied mechanically
from RUN76 except the new theorem name. No Lean compilation or engine
execution in this session. Potential native compatibility issue: verify
the scoped operator norm and complete/summable-series instances infer
for this particular LocField and preserve the existing topologies.
If not, retain the human proof, establish the open-embedding lemma
via the explicit determinant/adjugate inverse formula rather than
asserting a new premise. No unverified proof obligation is retired.

Actual caller: Columns.hasType_markOperator_run55 in RUN76 uses
kernelRun54_local_double_integral l A (j l d) hA, returning g, hgK, hgC.
The exact same signature means the old private helper can be replaced
by a wrapper around kernelRun77_local_double_integral (or its checked
proof body), leaving the entire exact-kernel-type elaboration and
all three original-statement caller transports and audits intact.
Do not fuse with RUN73 or RUN67 before independent native acceptance.
The old and reduced graph and original axioms must be retained; this
local simplification does not imply deletion of a global dependency.
No Main import or full RH claim.

RESUME HERE: compile this standalone supplier in the retained compact
workspace first (no cold build), then if accepted substitute its checked
body for only the RUN76 helper and run the existing eight-root graph,
rh_scan/prune and caller/axiom guards. Reuse RUN75 receipt if it appears;
do not rerun an already accepted unrelated phase.
HANDOFF integration/theta/acceleration/audit. A1/star/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 3000000

open Matrix GeneralLinearGroup
open scoped Matrix.Norms.Operator in
lemma kernelRun77_local_double_integral {E : Type*} [Field E] [NumberField E]
    {n : Type*} [Fintype n] (w : FinPlace E) (A d : GL n (LocField w))
    (hA : A ∈ Kw n w) :
    ∃ g : GL n E,
      g.map (algebraMap E (LocField w)) ∈ Kw n w ∧
      d⁻¹ * (A⁻¹ * g.map (algebraMap E (LocField w))) * d ∈ Kw n w := by
  classical
  let f : E →+* LocField w := algebraMap E _
  let K : Set (GL n (LocField w)) := Kw n w
  let Y : GL n (LocField w) → GL n (LocField w) :=
    fun X => d⁻¹ * (A⁻¹ * X) * d
  let U : Set (GL n (LocField w)) := K ∩ Y ⁻¹' K
  have hK : IsOpen K := isOpen_Kw (n := n) w
  have hY : Continuous Y := by dsimp [Y]; fun_prop
  have hU : IsOpen U := hK.inter (hK.preimage hY)
  have hAU : A ∈ U := by
    change A ∈ Kw n w ∧ d⁻¹ * (A⁻¹ * A) * d ∈ Kw n w
    exact ⟨hA, by simp⟩
  let val : GL n (LocField w) → Matrix n n (LocField w) := Units.val
  have hOpen : IsOpenMap val := Units.isOpenMap_val
  have hImage : IsOpen (val '' U) := hOpen U hU
  have hDense : DenseRange (fun B : Matrix n n E => B.map f) :=
    DenseRange.piMap fun _ => DenseRange.piMap fun _ => w.denseRange_algebraMap E
  obtain ⟨B, V, hV, he⟩ := hDense.exists_mem_open hImage
    ⟨val A, A, hAU, rfl⟩
  have hBdet : B.det ≠ 0 := by
    intro hz
    apply V.det_ne_zero
    change V.val = B.map f at he
    rw [he, ← RingHom.map_det, hz, map_zero]
  let g : GL n E := GeneralLinearGroup.mkOfDetNeZero B hBdet
  have hEq : g.map f = V := by
    apply Units.ext
    change B.map f = V.val
    exact he.symm
  refine ⟨g, ?_⟩
  rw [hEq]
  exact hV


#print axioms kernelRun77_local_double_integral
