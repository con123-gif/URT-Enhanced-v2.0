import New.Filling.FillingTheorem
import Lean

/-!
# RUN101 acceleration — isolate the actual selected-record energy supplier
28 November 2026. HUMAN SOURCE-MATCHED / PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM/HANDOFF/EXPANSION, recent math weighted-dyadic
b8d892fa, positivity exact calibration bd496d07, integration averaged
bottom 6cb0935a, audit weighted block 17fd8c26, character boxes 7abda480,
RUN100 0404c5d2. None supplies this isolated native energy caller.
Sources: Moments ec2cb964ede0d5eeae41a077dc6dbfface9c0444 lines 226–249,
301–339; OneDeterminant 329f004f845b9e2becc896419c8594e82dfef0a6
(dyadSum, inner_dyadSum); SchurTest bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea
(energy); Setup 622e7ebe5c04b7ae87652e460762da7fb2e40727 (mainEnergy);
FillingTheorem 801448ae9b895babd0d69dc4f7967d86eb006e76 lines 22–31.
No New.Main import.

This is NOT a new estimate for B3. It extracts the actual positive-type
supplier hidden inside the native B4 proof and supplies RUN100.EnergyAt
under the original B1–B3 machinery, independently of pending C2, B4
adjustable spread or selected-count modules. No projector, row-rank upper
bound or final star is required by this local energy proof.

Let nu=unipCovolume>0, c>0 and P=(c nu)^(-1/2) Q as in Moments.
For every a,b, the Gram entry <rho(b)P_y,rho(a)P_x> is A(a^-1 b)/nu.
Let u(a)=sum_x conjugate-coordinates(rho(a)P_x) tensor rho(a)P_x.
The native inner_dyadSum gives EXACTLY
    <u(a),u(b)> = sum_(x,y) |<rho(b)P_y,rho(a)P_x>|^2
                = energy(amplitudeSum univ,{a^-1 b}).
There is no missing power of nu. For every subset Omega, sum over
s in Omega of singleton energies equals the energy on Omega, simply
by finite distributivity (including the empty set). Apply the native
sum_le_of_positive_type with A=empty and the exact native trivial
fixer data. This yields sum_s energy_s <= (1+9/b^4) mainEnergy.
This uses the full source moment theorem (including its Fourier,
sieve, local-energy and crude estimates); no claim of having proved
those primitives independently. The direct caller has no need to
derive rank or invoke Fits.exists_translate_finrank_comap_le.

RUN100 reserve transport: put eta=(4*b*x^200)^(-1),
a=5*b^-4+f/(N-1), zeta=2(eta-a). Native scale comparison a<=eta/2,
f/(N-1)>=0 implies 9*b^-4<=eta<=zeta. Therefore the original
quantitative B3 theorem supplies the entire RUN100 energy premise
on EVERY admissible record. The relaxed B3 alternatives remain
valuable, but not required for this fallback. Keep other native
trace/complement, A/C, count-escape and admissible-record suppliers.
This local closure only uses the existing moment theorem, not an
independent simplified B3 reconstruction. No dependency deletion
claimed before graph replay.

Executed: exact BigInt Gaussian-integer dyad/Gram test on two
non-real columns and S3 unitary permutation action (36 ordered
pairs); all 64 subsets tested for energy additivity; 30150 exact
integer reserve implications; one omitted-normalizer negative
control. These test identities only, not the arithmetic B3 theorem.
Local lean/lake absent. Fresh shared queue 46137707614 pending;
46128377765 and 46129085575 have success labels but preceding
internal receipts record failures, no new PASS inferred.
No native rh_scan/prune/reduce/auto/frontier execution this run.
All prior graphs and source/axiom evidence retained.

RESUME HERE: compile Run101NativeEnergy alone against the shared
authenticated FillingTheorem/Moments cache. Inspect first actual
diagnostic in the dyad-to-singleton identity and subset-sum exchange;
require exact statement and direct-supplier guards plus strict
constructor-inclusive graph/axiom audit before using the new
Data.run101_energy_with_reserve as RUN100.EnergyAt. This is one small
native supplier job, not a duplicate C2 cold build. Next missing
mathematics is replacement of the retained B3 primitive estimates
and A/C suppliers; count/record existence separately. RH OPEN.
HANDOFF integration / positivity / Landau / kernel / audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰}
  [ok : S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma run101_energy_singleton_sum (Ω : Set S.GRes) :
    ∑ s with s ∈ Ω, energy (S.amplitudeSum .univ) ({s} : Set S.GRes) =
      energy (S.amplitudeSum .univ) Ω := by
  classical
  have hsingle (s : S.GRes) :
      energy (S.amplitudeSum .univ) ({s} : Set S.GRes) =
        ∑ c : S.Classes, ∑ c' : S.Classes,
          ‖S.amplitudeSum .univ c s c'‖ ^ 2 / S.unipCovolume ^ 2 := by
    simp [energy, sum_filter]
  simp only [hsingle, energy]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro c hc
  rw [Finset.sum_comm]

lemma Fits.run101_global_energy_of_realization [WeilData E] {c}
    [Module.Finite ℂ V] {ρ : Representation ℂ S.GRes V}
    (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ)
    {Q : EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V}
    (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
      ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2))
    (hc : 0 < c) :
    ∑ s : S.GRes, energy (S.amplitudeSum .univ) ({s} : Set S.GRes) ≤
      (1 + 9 / S.b ^ 4) * S.mainEnergy := by
  classical
  obtain ⟨t, ht⟩ := (isSquare_iff.2 (mul_pos hc S.unipCovolume_pos).le).inv
  let P := t • Q
  have hu a b x y : ⟪ρ b (P (.single y 1)), ρ a (P (.single x 1))⟫_ℂ =
      S.amplitudeSum .univ x.1 (a⁻¹ * b) y.1 (x.2, y.2) /
        S.unipCovolume := hρ a⁻¹ .. ▸ by
    simp [← End.mul_apply, ← map_mul, P, ← mul_assoc, ← ofReal_mul, ← ht, hQ, field, hc.ne']
  let u (s : S.GRes) := dyadSum (stdOrthonormalBasis ℂ V)
    (fun x ↦ ρ s (P (.single x 1)))
  have htype : ∀ a b, ⟪u a, u b⟫_ℂ =
      (energy (S.amplitudeSum .univ) ({a⁻¹ * b} : Set S.GRes) : ℂ) := by
    intro a b
    simp only [u, inner_dyadSum, hu]
    simp [energy, sum_filter, norm_div, abs_of_pos S.unipCovolume_pos,
      norm_sq_eq, sum_prod_type, sum_div, div_pow,
      @sum_comm S.Classes _ S.BesselCoord]
  have h := sum_le_of_positive_type (S := S)
    (Θ := fun s ↦ energy (S.amplitudeSum .univ) ({s} : Set S.GRes))
    (fun _ ↦ by unfold energy; positivity) u htype ∅
    (fun _ ↦ ⟨⊤, 1, by simp⟩)
    (fun Ω ↦ (run101_energy_singleton_sum (S := S) Ω).le) nofun
  simpa using h

end Filling

open Filling Module Submodule

lemma Data.run101_global_energy {P} (D : Data P) :
    ∑ s : D.filling.GRes, energy (D.filling.amplitudeSum .univ)
      ({s} : Set D.filling.GRes) ≤
        (1 + 9 / D.filling.b ^ 4) * D.filling.mainEnergy := by
  exact Fits.run101_global_energy_of_realization
    (ρ := .comp (D.principalRep _) (.mk' _ (by tauto)))
    (fun _ _ _ ↦ Space.inner_formRep ..)
    (fun _ ↦ (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..)))
    (measureReal_pos_of_isLevel (K := D.chosenLevel))

lemma Data.run101_energy_with_reserve {P} (D : Data P) :
    ∑ s : D.filling.GRes, energy (D.filling.amplitudeSum .univ)
      ({s} : Set D.filling.GRes) ≤
        (1 + 2 * ((4 * (D.b * D.x ^ 200))⁻¹ -
          (5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹))) *
            D.filling.mainEnergy := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  have hsmall : 5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹ ≤
      (4 * (D.b * D.x ^ 200))⁻¹ / 2 := D.le_of_hasLogBound
  have hN : (1 : ℝ) ≤ D.N := D.le_of_hasLogBound
  have ha : 0 ≤ D.f * (D.N - 1 : ℝ)⁻¹ :=
    mul_nonneg (by positivity) (inv_nonneg.mpr (sub_nonneg.mpr hN))
  have hb : 0 ≤ (D.b ^ 4 : ℝ)⁻¹ := by positivity
  have hfactor : 9 * (D.b ^ 4)⁻¹ ≤
      2 * ((4 * (D.b * D.x ^ 200))⁻¹ -
        (5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹)) := by
    linarith only [hsmall, ha, hb]
  have hmain : 0 ≤ D.filling.mainEnergy := by
    unfold mainEnergy
    exact div_nonneg (sq_nonneg _) (mul_nonneg D.filling.besselDegree_pos.le (mass_pos ..).le)
  refine D.run101_global_energy.trans ?_
  apply mul_le_mul_of_nonneg_right _ hmain
  rw [filling.eq_1 D, div_eq_mul_inv]
  linarith only [hfactor]

#print axioms Filling.run101_energy_singleton_sum
#print axioms Filling.Fits.run101_global_energy_of_realization
#print axioms Data.run101_global_energy
#print axioms Data.run101_energy_with_reserve

open Lean in
run_cmd do
  for (root, req, forbidden) in #[
    (``Filling.run101_energy_singleton_sum, #[], #[]),
    (``Filling.Fits.run101_global_energy_of_realization,
      #[``Filling.sum_le_of_positive_type, ``inner_dyadSum],
      #[``Filling.Fits.exists_translate_finrank_comap_le, ``Data.ramifiedColumns_fill_rows]),
    (``Data.run101_global_energy,
      #[``Filling.Fits.run101_global_energy_of_realization],
      #[``Data.ramifiedColumns_fill_rows]),
    (``Data.run101_energy_with_reserve, #[``Data.run101_global_energy],
      #[``Data.ramifiedColumns_fill_rows])] do
    let i ← getConstInfo root
    let some v := i.value? (allowOpaque := true) | throwError "RUN101 missing proof {root}"
    let deps := v.getUsedConstants
    unless req.all (fun x => deps.contains x) && forbidden.all (fun x => !deps.contains x) do
      throwError "RUN101 unexpected direct suppliers {root}"
    let axs ← collectAxioms root
    unless axs.all (fun x => #[``propext,``Classical.choice,``Quot.sound].contains x) do
      throwError "RUN101 unexpected axioms {root}: {axs}"
  logInfo "RUN101_NATIVE_ENERGY_GUARDS_OK"
