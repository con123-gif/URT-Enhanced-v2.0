import Lib.GLn.SchurModule.Hook
import New.Columns.TwistedHeckeType
import Mathlib.Tactic
import Lean

/-!
RUN73 — actual marked frame replacement and caller term transport.
28 November 2026. HUMAN SOURCE-MATCHED / PREPARED ONLY; not native verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION and relevant recent peers checked.
RUN72 d0d19e0e6fcf482ac57ad34a5226c0e3f28653c9 was a generic
coefficient certificate and human route, not an exact replacement.
Here stage the complete original theorem with only the surjection
branch changed and transport its actual caller proof term.
Pinned source blobs Hook ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
SchurMatrix 8c91b4b7888c99e604df5fa2dd38a130b4fea7bb,
ZerosCostDegree f572d0f6d5038d5e13b6de766797f44128a5990b,
TwistedHeckeType ccae44b8b21d1bface80bc3c8b10370a48c8ea48.
Actual JS source checks: four exact blob matches, 8 unique anchors,
16/16 missing or duplicate negative controls rejected, full original
lemma restored byte-for-byte (excluding trailing whitespace) by
reversing the two edits. No native tool installed locally.
Actual RUN71 state status.json, outputs/run71.json, outputs/a1/a1_transport.log
and outputs/a1_graph/a1_graph_result.json all 404 at inspection. Actions
run 46114460776 pending, conclusion null; do not duplicate the queue.
Peer theta RUN99 96f2e2a0 independently separates the A2 short-span
verification gate; leave that work untouched.

New constructive reduction: for d of degree a choose a bijection
Fin(k(1)) ≃ disjoint union over b of Fin(d_b) (same cardinal a).
At each height-one column use q(b) for its assigned slot; height zero
has empty entries, and every higher permitted height has no columns.
This gives the exact exponent d, including a=0 and arbitrary k(0).
No Borel membership needed. For a missing exponent d define L as
coefficient_d after the raw row rename q^-1. Every chosen standard
minor product lies in ker L, by the existing chosen basis identity B.
The standard-set ALL-filling span clause implies every raw minor
product lies in ker L; the constructed filling has coefficient 1,
contradiction. This replaces the Borel membership + basis expansion
path with one linear-kernel inclusion, avoiding explicit expansion
coefficients. All original ranks, k, q, c, z, basis indexing and
transpose remain; no new premise. The original chosen standard-basis
theorem and other Schur operations remain dependencies.

Native certificate below is an attempted elaboration, not a test
receipt. It retains the exact original declaration statement; copies
the original chosen-basis and Schur expansion expressions unchanged.
The term-level caller substitution uses exact type/universe guard
and checks expected value edges and axioms, keeping the SAME dependent
psi used in all branches of Columns.hasType_markOperator.
Original graph and old theorem preserved; direct absence of
sum_coords_nablaBasis does not imply transitive absence. No Main import.
RESUME HERE: execute RUN71's first available receipt; while pending,
compile this RUN73 module in the authenticated compact workspace,
repair first actual diagnostic (helpers first), then export
constructor-inclusive original/reduced four-root graphs and compare
the exact caller plus run rh_scan/prune/reduce/auto/frontier on its
actual remaining reachable premises. No duplicate cold build.
HANDOFF integration/theta/audit. A1/star/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true
set_option maxHeartbeats 3000000

open MvPolynomial Finset Matrix PolyRep Equiv Fintype
attribute [local simp] tableauWeight rowSubst permArray weylEval minor tableauPoly
  Finsupp.single_apply ite_and RingHom.map_det highestPoly
  AlgHom.map_det Matrix.map diagramWeight sum_card_fiberwise_eq_card_filter Fin.val_inj weylKernel


/-- A degree-a exponent gives an actual filling, not a Borel-membership
    statement. The index of the height-one column is matched to the
    disjoint union of the multiplicity slots. -/
private lemma run73_fill_exponent {a m σ} [Fintype m] [Fintype σ]
    {k : ℕ → ℕ} (q : σ ≃ m) (h : 1 < card m)
    (hκ : ∀ i > 0, i < card m → k i = ite (i = 1) a 0)
    (d : Monomials σ a) :
    ∃ T : Tableau m (card m) k,
      (∑ i, ∑ j, ∑ s, Finsupp.single (q.symm (T i j s)) (1 : ℕ)) = d.1 := by
  classical
  have hk : k 1 = a := by simpa using hκ 1 (by decide) h
  have hc : card (Fin (k 1)) = card (Σ b : σ, Fin (d.1 b)) := by
    simpa [hk, Fintype.card_sigma, ← Finsupp.degree_eq_sum] using d.degree_eq.symm
  let E : Fin (k 1) ≃ (Σ b : σ, Fin (d.1 b)) := Fintype.equivOfCardEq hc
  letI : Nonempty m := Fintype.card_pos_iff.mp (by omega)
  let T : Tableau m (card m) k := fun i j _ ↦
    if hi : (i : ℕ) = 1 then q (E (Fin.cast (congrArg k hi) j)).1
    else Classical.choice inferInstance
  refine ⟨T, ?_⟩
  let t : Fin (card m) := ⟨1, h⟩
  rw [Finset.sum_eq_single t]
  · calc
      (∑ j : Fin (k (t : ℕ)), ∑ s : Fin (t : ℕ),
          Finsupp.single (q.symm (T t j s)) (1 : ℕ)) =
          ∑ j : Fin (k 1), Finsupp.single (E j).1 (1 : ℕ) := by
            simp [T, t]
      _ = ∑ x : (Σ b : σ, Fin (d.1 b)), Finsupp.single x.1 (1 : ℕ) :=
        E.sum_comp _
      _ = d.1 := by
        ext b
        simp [Fintype.sum_sigma, Finsupp.single_apply, Finset.sum_ite_eq']
  · intro i _ hi
    by_cases hz : (i : ℕ) = 0
    · haveI : IsEmpty (Fin (i : ℕ)) := by rw [hz]; infer_instance
      simp
    · have hn : (i : ℕ) ≠ 1 := fun hh ↦ hi (Fin.ext hh)
      have hk0 : k i = 0 := by
        rw [hκ i (Nat.pos_of_ne_zero hz) i.isLt, if_neg hn]
      haveI : IsEmpty (Fin (k i)) := by rw [hk0]; infer_instance
      simp
  · simp

/-- Rename the raw single-place tableau to its first-column variables.
    This applies to ALL fillings, not merely the chosen standard set. -/
private lemma run73_raw_monomial {a m σ} [Fintype m] [Fintype σ]
    {k : ℕ → ℕ} (q : σ ≃ m) (h : 1 < card m)
    (hκ : ∀ i > 0, i < card m → k i = ite (i = 1) a 0)
    (T : Tableau m (card m) k) :
    rename (fun p : m × ℕ ↦ q.symm p.1) (tableauPoly ℂ id T) =
      monomial (∑ i, ∑ j, ∑ s, Finsupp.single (q.symm (T i j s)) 1) 1 := by
  classical
  simp [tableauPoly, monomial_sum_one, ← X.eq_1]
  congr! with ⟨_ | _ | _⟩ <;> simp [univ_eq_empty]
  grind [Fin]

lemma schur_one_row_eq_symPowMatrix_run73 {a m σ} [Fintype m] [Fintype σ] {k} (q : σ ≃ m) (h : 1 < card m)
  (hκ : ∀ i > 0, i < card m → k i = ite (i = 1) a 0) : ∃ φ : _ ≃ _, ∀ (c : ℂ) z i j, c ^ a * schur
  (fun () ↦ k) (fun _ ↦ z) i j = symPowMatrix a (c • zᵀ.submatrix q q) (φ j) (φ i) := by
  have s : ∑ h ∈ range (card m), h * k h = a := by grind [sum_eq_ite 1]
  choose φ B using fun i ↦ (⟨⟨∑ h, ∑ j, ∑ s, .single (q.symm ((i ()).1 h j s)) 1, by
    simp [@sum_comm _ _ σ, ← s, sum_range, mul_comm]⟩, by
    simp [nablaBasis, monomial_sum_one, ← X.eq_1]; congr! with ⟨_ | _ | _⟩ <;> simp [univ_eq_empty]
    grind [Fin]⟩ : ∃ d : Monomials σ a, nablaBasis ℂ m (fun () ↦ k) i =
    bind₁ (X ⟨⟨(), q ·⟩, 0⟩) (monomial d 1))
  have e : φ.Bijective := by
    refine ⟨fun i j c ↦ (@linearIndependent_nablaBasis _ ℂ).injective (by grind), ?_⟩
    intro d
    classical
    by_contra! hn
    let L : MvPolynomial (m × ℕ) ℂ →ₗ[ℂ] ℂ :=
      (lcoeff (R := ℂ) d.1).comp
        (rename (R := ℂ) (fun p : m × ℕ ↦ q.symm p.1)).toLinearMap
    have hs : Submodule.span ℂ
        (tableauPoly ℂ id '' (↑(epsilon (@IsStdTableauSet m (card m) k)) :
          Set (Tableau m (card m) k))) ≤ LinearMap.ker L := by
      apply Submodule.span_le.2
      rintro _ ⟨T, hT, rfl⟩
      let i : WeylIndexFam (fun _ : Unit ↦ m) (fun _ ↦ k) :=
        fun _ ↦ ⟨T, hT⟩
      have hh : (φ i).1 ≠ d.1 := fun H ↦ hn i (Subtype.ext H)
      apply LinearMap.mem_ker.mpr
      change (rename (fun p : m × ℕ ↦ q.symm p.1)
        (tableauPoly ℂ id T)).coeff d.1 = 0
      have hr : rename (fun p : m × ℕ ↦ q.symm p.1) (tableauPoly ℂ id T) =
          rename (fun p : (Σ _ : Unit, m) × ℕ ↦ q.symm p.1.2)
            (nablaBasis ℂ m (fun () ↦ k) i) := by
        simp [nablaBasis, tableauPoly, minor, i]
      rw [hr, B i]
      simp [rename_bind₁, coeff_monomial, hh, Ne.symm hh]
    obtain ⟨T, hT⟩ := run73_fill_exponent q h hκ d
    have hm := hs ((isStdTableauSet_epsilon (M := card m) (k := k)).1 ℂ |>.2 T)
    have hz := LinearMap.mem_ker.mp hm
    change (rename (fun p : m × ℕ ↦ q.symm p.1)
      (tableauPoly ℂ id T)).coeff d.1 = 0 at hz
    rw [run73_raw_monomial q h hκ T, hT] at hz
    simp at hz
  use .ofBijective φ e, fun c z ↦ congrFun₂ (.trans (funext₂ (by simp [schur_smul, s]))
    (schur_eq_of_expansion (z := fun () ↦
    c • z) (by simpa [*, monomial_eq, reindex_equiv q, ↓← e.sum_comp, symPowMatrix, linSubst]
    using congr(bind₁ _ $(sum_monomials_eq_of_isHomogeneous <| φ · |>.isHomogeneous_linSubst _)))))

-- No substitution in source text of the caller: reuse its actual
-- elaborated proof term, preserving the single dependent choice psi.
open Lean in
run_cmd do
  let oldName := ``schur_one_row_eq_symPowMatrix
  let newName := ``schur_one_row_eq_symPowMatrix_run73
  let callerName := ``Columns.hasType_markOperator
  let freshName := `Columns.hasType_markOperator_run73
  let .thmInfo old ← Lean.getConstInfo oldName | Lean.throwError "RUN73 old supplier"
  let .thmInfo new ← Lean.getConstInfo newName | Lean.throwError "RUN73 new supplier"
  let .thmInfo src ← Lean.getConstInfo callerName | Lean.throwError "RUN73 original caller"
  let same ← Lean.Elab.Command.liftTermElabM do Lean.Meta.isDefEq old.type new.type
  unless old.levelParams == new.levelParams && same do
    Lean.throwError "RUN73 supplier statement mismatch"
  let oldSupplierEdges := old.value.getUsedConstants
  let newSupplierEdges := new.value.getUsedConstants
  unless oldSupplierEdges.contains ``sum_coords_nablaBasis &&
      !newSupplierEdges.contains ``sum_coords_nablaBasis &&
      !newSupplierEdges.contains oldName &&
      newSupplierEdges.contains ``isStdTableauSet_epsilon do
    Lean.throwError "RUN73 supplier direct dependency gate"
  let oldEdges := src.value.getUsedConstants
  unless oldEdges.contains oldName && !oldEdges.contains newName do
    Lean.throwError "RUN73 unexpected original caller edge"
  let value := src.value.replace fun e =>
    match e with
    | .const n levels => if n == oldName then some (.const newName levels) else none
    | _ => none
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := freshName, levelParams := src.levelParams, type := src.type, value := value })
  let .thmInfo checked ← Lean.getConstInfo freshName | Lean.throwError "RUN73 missing new caller"
  unless checked.type == src.type && checked.levelParams == src.levelParams do
    Lean.throwError "RUN73 caller statement mismatch"
  let expected := (oldEdges.filter (· != oldName)).push newName
  let got := checked.value.getUsedConstants
  unless expected.all got.contains && got.all expected.contains && !got.contains callerName do
    Lean.throwError "RUN73 caller direct dependency mismatch"
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[oldName, newName, callerName, freshName] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun a => allowed.contains a) do Lean.throwError "RUN73 unexpected axiom"
  Lean.logInfo "RUN73_MARKED_CALLER_DIRECT_CHECKED"

#print axioms schur_one_row_eq_symPowMatrix
#print axioms schur_one_row_eq_symPowMatrix_run73
#print axioms Columns.hasType_markOperator
#print axioms Columns.hasType_markOperator_run73
