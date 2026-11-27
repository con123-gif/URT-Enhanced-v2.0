import New.Data.Weights
import New.Endgame.PrimeError
import Lean

/-!
# RUN90 — separate the actual arithmetic-to-endpoint adapter from the A/B/C imports
27 November 2026. SOURCE-MATCHED / PREPARED; NOT native replayed.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484,
and AGENTS/SWARM/HANDOFF/EXPANSION. No edit to live ledger or workflows.

Actual caller: New/Main.lean lines 149–167 (blob
198ed5bf26aa294898931e0649bc2b88f1389f65). RUN89 isolates the analytic
endpoint but RUN85's pointwise supplier still imported ShortAndEnough,
whose three direct imports are LocalStatement, RowVolume, SeesawTheorem.
They bring in the very arithmetic estimates for which star is still a
premise; neither those estimates nor DataExist.exists_data are needed
to transport a supplied star witness. D1 existence is not star.

Extract the two exact definitions at ShortAndEnough lines 36–42 and
the actual remainder_eq proof at lines 86–112 (blob
b99eea0689be372d84362c58272b705e104b6a3a). Rename only mainAsk,
remainder, remainder_eq to avoid collisions. The needed data definitions
are in AdmissibleData (04208a5044bb7cf6464ef142a14d939148bed834,
lines 127–151), scale calculus in Magnitudes
(306fe7e22378322422d11b1f8415fcdac75ffd6e), nominalWeight bounds in
Weights (8749d68da003347685ca36817b32cafda51a3a6a), and prime identities
in PrimeError (63eb3d79d95ad815878e623b96f237240058c8e2).
Direct imports above are the proposed sufficient source environment;
typeclass/simp availability is a native replay question, not a claim
that the transitive graph has been pruned. No changes to arithmetic
weights, signs, constants, quantifier scope, or original declarations.

Copy RUN85 (205db835d09d9fc0e4d9bb55fd49ee5bf37295dc) pointwise proof,
GoodGrid and TailGrid with exactly the same three symbol substitutions.
Copy RUN88 (4de55aa0356e64cb780fda3f80dc67d4a9cf362f) EndpointGrid
statement unchanged, under a new namespace. Then the only new
mathematical adapter is K=max(Kg,Kt); for each k>=K choose the D from
GoodGrid at that k, and instantiate TailGrid at the SAME k. This gives
EndpointGrid P.d P.N₀ eta, with no inter-scale sharing of D and no
uniformity over P or d. No RH assumption or claimed RH theorem import.

Old source graph: ShortAndEnough -> remainder_eq, plus RUN85 -> DataExist
and heavy modules -> pointwise -> grid. Candidate source graph:
Weights + PrimeError -> renamed definitions and exact remainder_eq body
-> pointwise -> GoodGrid + TailGrid adapter -> EndpointGrid -> RUN88.
Native statement bridge, full graph, star, tail replay, and good-data
existence remain outstanding; no original evidence deleted.
Exact hypotheses: 0<eta/6, eta<1/100; fixed P; all k above each of two
thresholds; same D and original thick constraint, exact log scales,
star bound with identical remainder expression. Ordinary PNT tail
retained explicitly. This does not prove the decisive inequality.

Actual checks this session: retrieved the three pinned source blobs
and data imports; each of the three extracted blocks (definitions,
remainder proof, RUN85 pointwise/grid premises) was reversibly renamed
and round-trip compared byte-for-byte in JS; all three matched.
EndpointGrid text copied unchanged. These are source checks, not Lean.
Local lean/lake unavailable; git ls-remote failed DNS. Shared C1
run 46055305146 job 140698522135 was still in progress on API read.
No new native execution, axiom report, rh_scan/prune/auto result, or
CI PASS. Old-pin native tools are not imported into this compact file.
No duplicate cold build or protected workflow edit.

After the standalone replay, the original-definition/endpoint bridge
must be checked in a SEPARATE module importing this candidate, the
original ShortAndEnough, and RUN88. Do not import RUN85 with RUN88:
their duplicate RHPrimeWindow84 declarations collide. Proposed exact
bridge (with the imports and open declarations in scope):
  example {P} (D : Data P) : D.run90MainAsk = D.mainAsk := rfl
  example {P} (D : Data P) : D.run90Remainder = D.remainder := rfl
  example (P : Parameters) (eta : ℝ)
      (he : 0 < eta / 6 ∧ eta < 1 / 100)
      (hg : RHPrimeWindow90.GoodGrid P eta)
      (ht : RHPrimeWindow90.TailGrid P eta) :
      RHPrimeWindow88.EndpointGrid P.d P.N₀ eta :=
    RHPrimeWindow90.endpoint_from_good_grid P eta he hg ht
The first two rfl comparisons authenticate the changed spelling only;
the third authenticates the literal analytic interface, not the
missing GoodGrid or TailGrid suppliers. Verify axiom and constructor
inclusive dependency reports for both modules independently.

RESUME HERE: in the existing authenticated compact workspace, replay
this independent adapter with lake env lean after building
+New.Data.Weights:olean and +New.Endgame.PrimeError:olean if needed;
retain first actual compiler error or all three axiom probes and
RUN90_ADAPTER_GUARDS_OK. Coordinate with RUN89 rather than restarting
A/B/C. HANDOFF TO kernel/integration. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

section
variable {P} (D : Data P)

noncomputable def Data.run90MainAsk :=
  D.a * (log D.a - 1 - chowlaSelbergConst P.d - (∑ τ, (D.nominalWeight τ).log) / D.f)

/-- The run90Remainder rem: the sum over the tops τ of the differences Ask(a, τ) − `Data.run90MainAsk`, with
Ask =
`Data.primeSum`. -/
noncomputable def Data.run90Remainder := ∑ τ ∈ D.tops, (D.primeSum D.a τ - D.run90MainAsk)

lemma Data.run90Remainder_eq : D.run90Remainder = D.a * (#D.thick *
  (primeError P.d P.N₀ D.x - primeError P.d P.N₀ D.x₁) + #D.tops * primeError P.d 1 D.x₁) := by
  -- as `τ` runs over the tops, `-ν τ` meets every thick place if `ν ≡ 1 mod N₀`, and none otherwise
  have A (ν : ℕ) b : #{τ ∈ D.tops | D.placeOfInt (-ν) * τ ∈ D.thick} * (lambdaClass P.d 1 ν * b) =
      #D.thick * (lambdaClass P.d P.N₀ ν * b) := by
    rw [card_filter, tops, sum_filter, ← (Equiv.divRight (D.placeOfInt (-ν))).sum_comp]
    simp +contextual [← sum_filter, lambdaClass, filter_inter, Unique.eq_default,
      placeClass_of_thick, @eq_comm _ˣ (-1), apply_ite card, div_eq_one, Set.indicator]
  -- the prime sums are remainders plus main terms (`primeError_eq_sum`; the constant for modulus
  -- `1` is `-1 - chowlaSelbergConst` by `re_logDerivMean_one`, the one for `N₀` drops out of the
  -- difference)
  have asks : ∑ τ ∈ D.tops, D.primeSum D.a τ = D.a * (#D.thick * (primeError P.d P.N₀ D.x -
    primeError P.d P.N₀ D.x₁) + #D.tops * primeError P.d 1 D.x₁ + (#D.thick *
    ((D.logX - D.logX₁) / P.N₀.totient) + #D.tops * (D.logX₁ - 1 - chowlaSelbergConst P.d))) := by
    simp [A, @sum_ite D.Φ, filter_not, cast_card_sdiff, sub_mul, re_logDerivMean_one, ← mul_sum,
      primeSum, nominalWeight, D.tops.sum_comm, primeError_eq_sum D.a D.logX₁.exp_pos
      D.le_of_hasLogBound, primeError_eq_sum D.a D.logX.exp_pos D.le_of_hasLogBound, div_ite,
      sub_ite, apply_ite posPart, ← sum_div]
    field [(HasLogBound.pos D).ne']
  -- `run90MainAsk` is the mean of the same main terms, as `f = #tops φ(N₀)`
  have main : #D.tops * D.run90MainAsk = D.a * (#D.thick * ((D.logX - D.logX₁) / P.N₀.totient) +
      #D.tops * (D.logX₁ - 1 - chowlaSelbergConst P.d)) := by
    simp [run90MainAsk, nominalWeight, apply_ite, log_div, (HasLogBound.pos D).ne', sum_ite, filter_not,
      cast_card_sdiff, card_infinitePlace_E, show #D.tops = _ by apply card_placeClass_eq]
    field [(HasLogBound.pos D).ne']
  simp [*, run90Remainder]
  ring

end

namespace RHPrimeWindow90

theorem pointwise_good_data (P : Parameters) {η x : ℝ}
    (h : 0 < η / 6 ∧ η < 1 / 100)
    (D : Data P) (hx : D.x = x) (l : D.logX₁ = x ^ (η / 6))
    (e : log D.logB = η * log x) (H' : towerDeg D.s / D.logB ≤ #D.thick)
    (hs : D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget)
    (W : ∀ c ∈ Set.Icc (0 : ℝ) (exp (η * log x)),
      primeError P.d P.N₀ (exp (x ^ (η / 6))) -
      c * primeError P.d 1 (exp (x ^ (η / 6))) ≤ exp (-(1e6 * log x))) :
    primeError P.d P.N₀ x ≤ x ^ (8 * η + 2⁻¹ - 1) := by
  subst x
  simp only [log_exp] at e W
  have := D.hasLogLower_of_le H'
  have hb : D.logB = exp (η * D.logX) := by
    rw [← e, exp_log (HasLogBound.pos D)]
  have hc : towerDeg D.s / #D.thick ∈ Set.Icc (0 : ℝ) (exp (η * D.logX)) :=
    ⟨by bound, by rw [← hb]; exact D.le_of_hasLogBound⟩
  have w := W _ hc
  rw [← l] at w
  calc primeError P.d P.N₀ D.x = D.m * D.run90Remainder / D.m / D.a / #D.thick +
      (primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁) := by
      simp [run90Remainder_eq, tops, card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]
    _ ≤ D.logB ^ 2 * D.budget / D.m / D.a / #D.thick + exp (-(1e6 * D.logX)) := by
      grw [hs, w]
    _ ≤ _ := D.le_of_hasLogBound (by grind)

/-- Explicit grid good-data input, NOT a consequence of admissible-data existence. -/
def GoodGrid (P : Parameters) (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k → ∃ D : Data P,
    D.x = (k : ℝ)^4 ∧ D.logX₁ = ((k : ℝ)^4) ^ (η / 6) ∧
    log D.logB = η * log ((k : ℝ)^4) ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
    D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget

/-- Tail on the very same fixed-parameter grid; ordinary PNT supplier retained. -/
def TailGrid (P : Parameters) (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
    ∀ c ∈ Set.Icc (0 : ℝ) (exp (η * log ((k : ℝ)^4))),
      primeError P.d P.N₀ (exp (((k : ℝ)^4) ^ (η / 6))) -
      c * primeError P.d 1 (exp (((k : ℝ)^4) ^ (η / 6))) ≤
        exp (-(1e6 * log ((k : ℝ)^4)))

def EndpointGrid (d M : ℕ) [Fact d.Prime] [NeZero M] (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
    primeError d M ((k : ℝ)^4) ≤ ((k : ℝ)^4)^(8*η+2⁻¹-1)


theorem endpoint_from_good_grid (P : Parameters) (η : ℝ)
    (he : 0 < η / 6 ∧ η < 1 / 100)
    (hg : GoodGrid P η) (ht : TailGrid P η) :
    EndpointGrid P.d P.N₀ η := by
  obtain ⟨Kg,hg⟩ := hg
  obtain ⟨Kt,ht⟩ := ht
  refine ⟨max Kg Kt, ?_⟩
  intro k hk
  obtain ⟨D,hx,l,e,H',hs⟩ := hg k ((le_max_left Kg Kt).trans hk)
  exact pointwise_good_data P he D hx l e H' hs
    (ht k ((le_max_right Kg Kt).trans hk))

end RHPrimeWindow90

#print axioms Data.run90Remainder_eq
#print axioms RHPrimeWindow90.pointwise_good_data
#print axioms RHPrimeWindow90.endpoint_from_good_grid

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[``Data.run90Remainder_eq, ``RHPrimeWindow90.pointwise_good_data,
      ``RHPrimeWindow90.endpoint_from_good_grid] do
    let axioms ← Lean.collectAxioms n
    unless axioms.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN90 unexpected axiom {n}: {axioms}"
  for (n, required) in #[
      (``Data.run90Remainder_eq, #[``primeError_eq_sum]),
      (``RHPrimeWindow90.pointwise_good_data, #[``Data.run90Remainder_eq]),
      (``RHPrimeWindow90.endpoint_from_good_grid, #[``RHPrimeWindow90.pointwise_good_data])] do
    let info ← Lean.getConstInfo n
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError m!"RUN90 no theorem value {n}"
    let deps := value.getUsedConstants
    for supplier in required do
      unless deps.contains supplier do
        Lean.throwError m!"RUN90 missing direct edge {n} -> {supplier}"
    Lean.logInfo m!"RUN90_DIRECT|{n}|{deps.map Lean.Name.toString}"
  Lean.logInfo "RUN90_ADAPTER_GUARDS_OK"
