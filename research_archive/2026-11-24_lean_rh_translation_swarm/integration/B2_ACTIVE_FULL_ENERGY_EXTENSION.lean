/-!
Prepared full CrudeEnergy consumer extension. Append after the authenticated
pair and level-energy fragments, retaining their exact variable context.
Original source and all level, positivity, cutoff and scale premises retained.
Only the pair/level energy suppliers are replaced. Native replay pending.
-/

omit hw in
/-- Letters as in `Filling.energy_le_of_level_pairs`.
T stable, all s ∈ Ω fixing X ≥ 1; C ≥ 𝖽₁, and ≥ τ²⁰𝖽₁ if a term has `IsNormalForm` 0. If each γ
∈ T with `Filling.CharsAgree` has a level below n ≤ ϱ+1, the cut energy is ≤ C/(b³⁰4^(ϱ+1−n)). -/
lemma Filling.b2_active_energy_le_of_level_lt n (h : ∀ γ ∈ T, S.CharsAgree γ → ∃ j < n, S.HasLevel j γ) :
    energy (S.amplitudeSum T) Ω ≤ C / S.b ^ 30 / 4 ^ n.rev.1 := by
  induction' n using induction with j ih generalizing T
  · simp [energy, amplitudeSum_eq_zero_of_not_charsAgree hT (by grind)]; positivity
  grw [amplitudeSum_split _ {γ | S.HasLevel j.castSucc γ}, energy_add_le one_pos, ih,
    b2_active_energy_le_of_level_pairs hC _ _ hx _ le_rfl _ j.castSucc ∅ (h := by simp [linkEnergy])]
  simp [rev_castSucc, pow_succ, field]; all_goals grind [IsStable, S.isStable_hasLevel j.castSucc]

/-- Crude estimate (letters as in `Filling.energy_le_of_level_pairs`):
T stable, all s ∈ Ω fixing X ≥ 1; C ≥ 𝖽₁, ≥ τ²⁰𝖽₁ if a term has `IsNormalForm`
0, ≥ τ¹²𝖽/X^|κ| if R omits a link. If cut `Filling.linkEnergy` (𝗀 ≠ 0) ≤ wν², the full energy
is ≤ (1+b⁻⁴)²w + b⁻¹²C.

Incoherent and degenerate pairs are negligible. -/
lemma Filling.b2_active_energy_le_of_linkEnergy_le R (h₂ : (∃ Λ, Λ ∉ R) →
  S.tailScale ^ 12 / X ^ 𝔰.k * S.mainEnergy ≤ C)
  (h : linkEnergy (T ∩ {γ | S.termDisc γ ≠ 0}) Ω R ≤ .ofReal (w * S.unipCovolume ^ 2)) :
  energy (S.amplitudeSum (σ := .full) T) Ω ≤ (1 + (S.b ^ 4)⁻¹) ^ 2 * w + (S.b ^ 12)⁻¹ * C := by
  obtain ⟨⟨y, _, e⟩, p⟩ := exists_nonneg_add_of_le S.thousand_le_b,
    (by bound [S.thousand_le_b] : 0 < S.b ^ 4)
  grw [← sub_add_cancel (S.amplitudeSum (σ := _) T) (S.amplitudeSum T), energy_add_le p,
    energy_sub_cut_le, amplitudeSum_split, energy_add_le p, b2_active_energy_le_of_level_pairs hC _ _ hx _ _ _
    (last _) R _ _ h, b2_active_energy_le_of_level_lt hC _ _ hx _ _ (last _), hz, ← e, ← sub_nonneg]
  simp [field, -sub_nonneg]; ring_nf; positivity
  all_goals grind [CharsAgree.exists_hasLevel, HasLevel, IsStable, frameDisc_frameGram_besselU_mul,
    hasLevel_last]

#print axioms Filling.b2_active_energy_le_of_level_lt
#print axioms Filling.b2_active_energy_le_of_linkEnergy_le

run_cmd do
  let pairs := #[(``Filling.energy_le_of_level_lt, ``Filling.b2_active_energy_le_of_level_lt),
                 (``Filling.energy_le_of_linkEnergy_le, ``Filling.b2_active_energy_le_of_linkEnergy_le)]
  for (old, replacement) in pairs do
    let original ← Lean.getConstInfo old
    let info ← Lean.getConstInfo replacement
    let sameType ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq original.type info.type
    unless sameType do
      Lean.throwError "Full energy replacement has a different original declaration type"
    let some value := info.value? |
      Lean.throwError "Full energy replacement has no inspectable proof"
    let deps := value.getUsedConstants
    for forbidden in #[``Filling.energy_le_of_level_pairs, ``Filling.energy_le_of_level_lt,
                        ``Filling.energy_le_of_linkEnergy_le, ``Filling.sum_pairWeight_le] do
      if deps.contains forbidden then
        Lean.throwError "Full energy replacement calls an original energy/pair target"
    unless deps.contains ``Filling.b2_active_energy_le_of_level_pairs do
      Lean.throwError "Full energy replacement did not consume the new level-pair bound"
    if replacement == ``Filling.b2_active_energy_le_of_linkEnergy_le then
      unless deps.contains ``Filling.b2_active_energy_le_of_level_lt do
        Lean.throwError "Full link-energy replacement did not consume the new lower-level bound"
  Lean.logInfo "B2_ACTIVE_FULL_ENERGY: original declaration types match; all three energy callers consume replacements; original targets absent from direct proof dependencies"
