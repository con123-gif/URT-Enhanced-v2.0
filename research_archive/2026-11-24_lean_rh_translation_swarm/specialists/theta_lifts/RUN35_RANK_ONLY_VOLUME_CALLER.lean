import Development.AbelianVarietyTheory.Proofs.FlagMeasures.UnitaryAutomorphicCountingOfCompactDualVolumeRat
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.HermVolumeRatioSameKindOfVolumeRatioInduction
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.UnitaryAdelicQuotientVolumePosLtTop
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.IsotropicFlagProbabilityBoundOfVolumeRatio
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.HermAbsoluteVolumeBoundOfVolumeRatioInduction
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.NonzeroFlagProbabilityBoundOfVolumeRatioInductio
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN35 — lane 8, 25 November 2026. SOURCE-MATCHED / PREPARED, NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream HEAD observed 91b273530883b723ef4422436e0dc3557749325a; not used.
Mission cd0a176134d46b5b624896e56843a24915c14477 (latest critical-frontier update).
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research/continuity
and living manuscript (long files in part). Prior theta RUN34 a64416c7,
peer 904a3009 (different fiber mass), 04a29a86 (Companion signature supplier),
f5cc7b7b (Landherr), 490330a6 (principal window), 3f25eb66 (native evidence gate).
No duplicate of peer signature proof or manuscript signed normalization interval.

ACTUAL COUNTING CONSUMER: a rank-only volume interface suffices.
VolumeStep constructs an AutInst I', field map e, norm ±1 vector x, orthogonal
matrix A, same-signature decrement, and normalized volume equality. The native
VolRatio.step explicitly discards all three equations involving x and A.
Only existence of a same-field lower-rank host and its gauge-volume ratio
are used by volumeRatio_of_volumeStep. Therefore it suffices to construct the
lower-rank host with the appropriate signature, not a specific rational
orthogonal complement. This does not remove its self-dual lattice, CM, or
measure data. The precise remaining adjacent-rank condition is:
   g(I) = g(I') * rankFac(E,p+q)
for all native gauges and finite Haar measures, on the SAME field with star
preserved, rank >= 3 and chosen nonempty sign. It is weaker as an interface;
strict logical non-equivalence has not been established. The native
mass_ratio_rank_factor identity cancels compact volumes exactly, so one may
prove this gauge identity directly without separately normalizing x,A.
The rank-only hypothesis still requires uniformity at all hosts reached by
the finite descent. The separate VolumeInvariant is retained at the base.
Inductively the gauge ratio telescopes over ranks from p0+q0+1 to p+q.
The actual finite quotient bound, absolute volume bound and flag-probability
bound consume only this telescoped VolumeRatio. The rare-flags proof
reuses the exact same FlagMeasureBound and ConstantBound already used at the
native near/far caller. All seven final counting suppliers remain present.
This is not a proof of the adjacent-rank identity, nor a global deletion of
VolumeStep. Other consumers and upstream graph remain intact. The signature
comparison work in CompanionTheory is a potential supplier, not a checked
transport between these two native measure conventions.

Source-visible old graph:
countingTheorem_of_volumeStep -> hAbs/hFM/hRare -> VolumeStep;
hFM -> positive finite quotient -> VolumeStep; hRare -> hFM,hCB;
VolumeRatio -> step -> VolumeStep (x,A and their 3 equations unused here).
Candidate graph:
countingTheorem_of_ratio35 -> hAbs/hFM/hRare -> VolumeRatio,hCB;
hRare -> shared hFM,hCB; VolumeRatio -> RankOnlyStep35,VolumeInvariant.
Original bridges remain; no elaborated graph deletion or axiom change asserted.
Context key includes pin, toolchain, I,E,p,q,s,I', all c,mu_f,c',mu_f', signs
and actual consumer; never cache only by name. Backtrack to original
VolumeStep if replay fails. Original RUN34 constant-bound candidate
is not required by this independent overlay; use native constantBound.

Source blob ledger:
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/HermVolumeRatioSameKindOfVolumeRatioInduction.lean cac12fba955e10e2eb7ccc24b94bfe053987a9e7
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/UnitaryAdelicQuotientVolumePosLtTop.lean 0bd6bbc86f490d1d03308df4de8c9d9ac022a54c
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsotropicFlagProbabilityBoundOfVolumeRatio.lean 852f33a0e868dbfe442b023c790793ca92b9a345
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/HermAbsoluteVolumeBoundOfVolumeRatioInduction.lean 986c627f447883c350ab96a11267e9138b4cefe7
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/NonzeroFlagProbabilityBoundOfVolumeRatioInductio.lean 25625e896979c43a549228312c6e723660c70a0c
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/UnitaryAutomorphicCountingOfCompactDualVolumeRat.lean 2a66d72b3180fbb9cff093ad05a9fda228b0daa6
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
src/Development/AbelianVarietyTheory/Statements/CuspFrameWeights/SameKindIsometric.lean c7c7a598be6489574fb7e2ccaad87cb68d1f92dd
CI baseline status.json fetched 45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717; both report
returncode 0 for earlier tools/conditional strip only. Local lean/lake absent.
Static execution in connector V8: 36 fail-on-error checks of pinned blobs,
source theorem extraction, exact substitution counts and retained edges.
No synthetic mathematical tests. No new native CI result, no queue claim,
no new axiom evidence, no new root obligation closed. Source roles only.

RESUME HERE: prove rank-only gauge ratio directly on the standard diagonal
same-field AutInst pair with ranks n and n-1, using peer signature invariance
and the exact compact-dual mass ratio after transporting native Haar
normalization; do not assume that transport. Batch this overlay with RUN34
via the existing host-module runner, inspect compiler/scan/bridge evidence
per peer evidence gate before integrating. Preserve all original fallback
and the separate arithmetic, row, entropy, local gain and ramp obligations.
HANDOFF TO geometry, kernel extractor, integration, audit.
-/

open MeasureTheory NumberField Matrix Finset Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.FlagMeas Formalism.REAL Formalism.QuantumDeterminants GlobalTheory.Dec
open scoped BigOperators InnerProductSpace ContDiff

namespace GlobalTheory.FlagMeas.VolRatio

def RankOnlyStep35 : Prop :=
  ∀ (I : AutInst) (P Q : ℕ), HasSig I P Q → 3 ≤ P + Q → ∀ s : Bool,
    (if s then 1 ≤ P else 1 ≤ Q) →
    ∃ I' : AutInst, SameField I I' ∧ HasSig I' (if s then P - 1 else P) (if s then Q else Q - 1) ∧
      ∀ (c : InfinitePlace I.F → ℝ) (μf : Measure I.Gf) [SigmaFinite μf] [μf.IsHaarMeasure]
        (c' : InfinitePlace I'.F → ℝ) (μf' : Measure I'.Gf) [SigmaFinite μf'] [μf'.IsHaarMeasure],
        IsGaugeAll I c → IsGaugeAll I' c' →
        gaugeVol I c μf = gaugeVol I' c' μf' * ENNReal.ofReal (rankFac I.E (P + Q))

theorem rankOnlyStep35_of_volumeStep (h : VolumeStep) : RankOnlyStep35 := by
  intro I P Q hs hn s hsign
  exact step h I P Q hs hn s hsign

set_option maxHeartbeats 1000000 in
theorem volumeRatio_of_rankOnly35 : RankOnlyStep35 → VolumeInvariant → VolumeRatio := by
  intro hstep hInv I p q p₀ q₀ hsig hp hq h2
  induction' hd : (p - p₀) + (q - q₀) with d ih generalizing I p q
  · obtain rfl : p₀ = p := by omega
    obtain rfl : q₀ = q := by omega
    refine ⟨⟨I, ⟨RingEquiv.refl _, fun _ => rfl⟩, hsig⟩, ?_⟩
    intro I₀ hI hsig₀ c μf _ _ c₀ μ₀ _ _ hc hc₀
    rw [Finset.Ioc_self, Finset.prod_empty, ENNReal.ofReal_one, mul_one]
    exact hInv I I₀ _ _ hI hsig hsig₀ c μf c₀ μ₀ hc hc₀
  · obtain ⟨I', p', q', hI', hsig', hp', hq', hsum, hv⟩ : ∃ (I' : AutInst) (p' q' : ℕ), SameField I I' ∧
        HasSig I' p' q' ∧ p₀ ≤ p' ∧ q₀ ≤ q' ∧ p' + q' + 1 = p + q ∧
        ∀ (c : InfinitePlace I.F → ℝ) (μf : Measure I.Gf) [SigmaFinite μf] [μf.IsHaarMeasure]
          (c' : InfinitePlace I'.F → ℝ) (μf' : Measure I'.Gf) [SigmaFinite μf'] [μf'.IsHaarMeasure],
          IsGaugeAll I c → IsGaugeAll I' c' →
          gaugeVol I c μf = gaugeVol I' c' μf' * ENNReal.ofReal (rankFac I.E (p + q)) := by
      by_cases hpp : p₀ < p
      · obtain ⟨I', h1, h2, h3⟩ := hstep I p q hsig (by omega) true (by simp; omega)
        exact ⟨I', p - 1, q, h1, h2, by omega, hq, by omega, h3⟩
      · obtain ⟨I', h1, h2, h3⟩ := hstep I p q hsig (by omega) false (by simp; omega)
        exact ⟨I', p, q - 1, h1, h2, hp, by omega, by omega, h3⟩
    obtain ⟨⟨I₁, hI₁, hsig₁⟩, hrat⟩ := ih I' p' q' hsig' hp' hq' (by omega)
    refine ⟨⟨I₁, sameField_trans hI' hI₁, hsig₁⟩, ?_⟩
    intro I₀ hI hsig₀ c μf _ _ c₀ μ₀ _ _ hc hc₀
    obtain ⟨μ', hH, hS⟩ := GlobalTheory.CongTop.exists_haar_sigmaFinite I'
    choose c' _ hc' _ using fun v : InfinitePlace I'.F => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I'.n (I'.ε v)
    have hg' : IsGaugeAll I' c' := hc'
    rw [hv c μf c' μ' hc hg', hrat I₀ (sameField_trans (sameField_symm hI') hI) hsig₀ c' μ' c₀ μ₀ hg' hc₀,
      ← hsum, Finset.prod_Ioc_succ_top (by omega),
      ENNReal.ofReal_mul (Finset.prod_nonneg fun M _ => rankFac_nonneg M), mul_assoc]
    obtain ⟨e, he⟩ := hI'
    simp only [rankFac_congr e he]

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.FlagMeas
set_option maxHeartbeats 1000000 in
theorem fundDom_volume_pos_lt_top_ratio35 : VolumeRatio → ∀ (I : AutInst) (μf : Measure I.Gf) [SigmaFinite μf]
    [μf.IsHaarMeasure] (fund : Set I.GA), I.IsFundDom (I.muA μf) fund → ∀ p q : ℕ, HasSig I p q → 2 ≤ p →
    0 < I.muA μf fund ∧ I.muA μf fund < ⊤ := by
  intro hstep I μf _ _ fund hfund p q hsig hp
  obtain ⟨hcov, hpos⟩ := GlobalTheory.T.leftQuotientCovolume_eq_fundamentalDomain_inter I μf fund Set.univ hfund MeasurableSet.univ
    (fun _ _ _ _ => Set.mem_univ _)
  rw [Set.univ_inter] at hcov
  refine ⟨hpos, ?_⟩
  obtain ⟨⟨I₀, hsame, hsig₀⟩, hratio⟩ := hstep I p q 2 0 hsig hp (Nat.zero_le _) le_rfl
  choose c hc using fun v : InfinitePlace I.F => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I.n (I.ε v)
  choose c₀ hc₀ using fun v : InfinitePlace I₀.F => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I₀.n (I₀.ε v)
  obtain ⟨-, hlc, hsc, -⟩ := GlobalTheory.CongTop.adelic_topology I₀
  obtain ⟨-, -, -, hK, -⟩ := GlobalTheory.CongTop.adelic_topology I
  have hg : IsGaugeAll I c := fun v => (hc v).2.1
  have hg₀ : IsGaugeAll I₀ c₀ := fun v => (hc₀ v).2.1
  let μ₀ : Measure I₀.Gf := Measure.haar
  have heq := hratio I₀ hsame hsig₀ c μf c₀ μ₀ hg hg₀
  have hdef := GlobalTheory.T.unitaryGaugeVolume_le_classNumber_definite I₀ 2 hsig₀ c₀ μ₀ hg₀
  have hcl := GlobalTheory.T.rank_two_definite_unimodular_hermitian_class_bound I₀.E I₀.cm.cmUnram
  have h₀ : gaugeVol I₀ c₀ μ₀ < ⊤ :=
    hdef.trans_lt (ENNReal.mul_lt_top ENNReal.ofReal_lt_top (hcl.trans_lt ENNReal.ofReal_lt_top))
  have hfin : gaugeVol I c μf < ⊤ := by
    rw [heq]
    exact ENNReal.mul_lt_top h₀ ENNReal.ofReal_lt_top
  rw [gaugeVol, hcov] at hfin
  by_contra htop
  rw [not_lt, top_le_iff] at htop
  have hcpos : ENNReal.ofReal (∏ v, c v) ≠ 0 :=
    (ENNReal.ofReal_pos.2 (Finset.prod_pos fun v _ => (hc v).1)).ne'
  rw [htop, ENNReal.mul_top hcpos, ENNReal.top_div_of_ne_top hK.measure_lt_top.ne] at hfin
  exact lt_irrefl _ hfin
end GlobalTheory.FlagMeas

namespace GlobalTheory.FlagMeas.Bound
set_option maxHeartbeats 1000000 in
theorem flagMeasureBound_ratio35 : VolumeRatio → FlagMeasureBound := by
  intro hstep I μf _ _ fund hfund p q hsig hn a j ha hj hjq B hB hBs
  obtain ⟨hf, -, -, -, -, hpq⟩ := GlobalTheory.T.autInst_degree_rootDiscriminant_rank I
  have hpq := hpq p q hsig
  obtain ⟨hmeas, hinv, -⟩ := GlobalTheory.T.pointsOfFlagTypeSet_measurable_and_invariant I a j B hB
  obtain ⟨hpos, hfin⟩ := GlobalTheory.FlagMeas.fundDom_volume_pos_lt_top_ratio35 hstep I μf fund hfund p q hsig (by omega)
  refine ⟨hmeas, hpos, hfin, ?_⟩
  obtain ⟨⟨I₀, hsame, hsig₀⟩, hratio⟩ := hstep I p q (p - ∑ i, j i) (q - ∑ i, j i) hsig
    (Nat.sub_le _ _) (Nat.sub_le _ _) (by omega)
  obtain ⟨t₀, lc₀, sc₀, -⟩ := GlobalTheory.CongTop.adelic_topology I₀
  obtain ⟨-, -, -, hKc, hKo, ⟨Ks, hKs⟩, -⟩ := GlobalTheory.CongTop.adelic_topology I
  choose c hc0 hc _ using fun v => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I.n (I.ε v)
  choose c₀ _ hc₀ _ using fun v => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I₀.n (I₀.ε v)
  let μ₀ : Measure I₀.Gf := Measure.haar
  have hU := GlobalTheory.T.isotropicFlag_unfolding_bound I I₀ p q a j ha hj hjq (by omega) hsame hsig hsig₀ c μf c₀ μ₀ hc hc₀ B hB hBs
  have hR := hratio I₀ hsame hsig₀ c μf c₀ μ₀ hc hc₀
  rw [(GlobalTheory.T.leftQuotientCovolume_eq_fundamentalDomain_inter I μf fund _ hfund hmeas hinv).1] at hU
  have hR' : ENNReal.ofReal (∏ v, c v) * I.muA μf fund / μf I.Kset = gaugeVol I₀ c₀ μ₀ *
      ENNReal.ofReal (∏ M ∈ Finset.Ioc (p + q - 2 * ∑ i, j i) (p + q), rankFac I.E M) := by
    have e : p - ∑ i, j i + (q - ∑ i, j i) = p + q - 2 * ∑ i, j i := by omega
    rw [← e, ← hR, gaugeVol,
      (GlobalTheory.T.leftQuotientCovolume_eq_fundamentalDomain_inter I μf fund Set.univ hfund MeasurableSet.univ (fun _ _ _ _ => Set.mem_univ _)).1,
      Set.univ_inter]
  have hK0 : μf I.Kset ≠ 0 := (hKo.measure_pos μf ⟨1, by rw [← hKs]; exact Ks.one_mem⟩).ne'
  have hK : μf I.Kset ≠ ⊤ := hKc.measure_lt_top.ne
  have hC0 : ENNReal.ofReal (∏ v, c v) ≠ 0 := by
    simpa using Finset.prod_pos fun v _ => hc0 v
  obtain ⟨hRpos, hle⟩ := div_le_of_scaled hC0 ENNReal.ofReal_ne_top hK0 hK hpos.ne' hfin.ne hU hR'
  refine hle.trans (le_of_eq ?_)
  congr 1
  have hv := vInv_nonneg I.E
  have hres := (dedekindZeta_residue_pos I.E).le
  rw [← GlobalTheory.T.prod_five_factors_hermitian_volume I.E I.cm.cmUnram p q a j hjq (by omega), ENNReal.ofReal_div_of_pos hRpos, hf, hpq,
    ENNReal.ofReal_mul (mul_nonneg (pow_nonneg (cIw_nonneg p q j) _) (by positivity)),
    ENNReal.ofReal_prod_of_nonneg (fun i _ => mul_nonneg (by positivity)
      (mul_nonneg (by positivity) (Finset.prod_nonneg fun l _ => zetaE_nonneg I.E l)))]
  congr 2
  refine Finset.prod_congr rfl fun i _ => ?_
  rw [GlobalTheory.T.genLin_tamagawa_volume I.E I.cm.cmUnram.1 (j i) (hj i), hf]
  exact (ENNReal.ofReal_mul (by positivity)).symm
end GlobalTheory.FlagMeas.Bound

namespace GlobalTheory.FlagMeas.AbsVol
set_option maxHeartbeats 1000000 in
theorem absoluteVolume_of_ratio35 : VolumeRatio → AbsoluteVolume := by
  intro hstep I p q hsig hq hn X hX hrd hfrd c μf _ _ hc
  obtain ⟨hf, hv, -, -, -, hpq⟩ := GlobalTheory.T.autInst_degree_rootDiscriminant_rank I
  have hpq' := hpq p q hsig
  have hp : 2 ≤ p := by
    by_contra h
    have h1 : 7 ≤ q := by omega
    have h2 : 7 * q ≤ q ^ 2 := by nlinarith
    omega
  obtain ⟨⟨I₀, hsame, hsig₀⟩, hrat⟩ :=
    hstep I p q 2 0 hsig hp (Nat.zero_le _) le_rfl
  obtain ⟨μ₀, hH, hS⟩ := GlobalTheory.T.exists_sigmaFinite_haar_finiteAdelicUnitary I₀
  choose c₀ _ hc₀ _ using fun v : InfinitePlace I₀.F => GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I₀.n (I₀.ε v)
  have hg₀ : IsGaugeAll I₀ c₀ := hc₀
  have hE := hrat I₀ hsame hsig₀ c μf c₀ μ₀ hc hg₀
  have hD := GlobalTheory.T.unitaryGaugeVolume_le_classNumber_definite I₀ 2 hsig₀ c₀ μ₀ hg₀
  have hV := GlobalTheory.T.rank_two_definite_unimodular_hermitian_class_bound I₀.E I₀.cm.cmUnram
  obtain ⟨e, -⟩ := hsame
  obtain ⟨hf₀, -, -, -, -, -⟩ := GlobalTheory.T.autInst_degree_rootDiscriminant_rank I₀
  rw [← hf₀, fDeg_congr e] at hD
  rw [fDeg_congr e, vInv_congr e] at hV
  have hA := GlobalTheory.T.absolute_hermitian_volume_bound_arith I.E I.cm.cmUnram I.n X hn hX (hv ▸ hrd) (by rw [hf, hv]; exact hfrd)
  have hv0 : 0 ≤ 2 * Formalism.HermitianLatticesTheory.vInv I.E := by
    unfold Formalism.HermitianLatticesTheory.vInv
    positivity
  have hv1 : 1 ≤ 2 * Formalism.HermitianLatticesTheory.vInv I.E := hv ▸ (GlobalTheory.T.autInst_degree_rootDiscriminant_rank I).2.2.1
  have hlog : 0 ≤ Real.log (2 * Formalism.HermitianLatticesTheory.vInv I.E) := Real.log_nonneg hv1
  have hU : 0 ≤ volU 2 ^ Formalism.HermitianLatticesTheory.fDeg I.E := pow_nonneg (volU_nonneg 2) _
  rw [hE, hpq', ← hf]
  refine le_trans ?_ (ENNReal.ofReal_le_ofReal hA)
  rw [ENNReal.ofReal_mul (by positivity), ENNReal.ofReal_mul hU]
  gcongr
  exact hD.trans (by gcongr)
end GlobalTheory.FlagMeas.AbsVol

namespace GlobalTheory.NonzeroFlag
set_option maxHeartbeats 1000000 in
theorem nonzeroFlagBound_from_flag35 : FlagMeasureBound → ConstantBound → NonzeroFlagBound := by
  intro hFM hCB I μf _ _ fund hfund p q hs hn hq hrd hf
  obtain ⟨hfd, hv, -, hf1, -, hpq⟩ := GlobalTheory.T.autInst_degree_rootDiscriminant_rank I
  have hpq := hpq p q hs
  have hn16 : 16 ≤ I.n := by
    have hpos : (0 : ℝ) < I.n := by
      rcases Nat.eq_zero_or_pos I.n with h | h
      · rw [h] at hn; simp at hn; linarith
      · exact_mod_cast h
    have := Real.log_le_sub_one_of_pos hpos
    have : (16 : ℝ) ≤ I.n := by linarith
    exact_mod_cast this
  have h2q : 2 * q + 2 ≤ I.n := by nlinarith
  set X : ℝ := I.n * I.f * Real.log I.n with hX
  have hX15 : 15 ≤ X := by
    have h1 : (1 : ℝ) ≤ I.n := by exact_mod_cast (by omega : 1 ≤ I.n)
    have h2 : (1 : ℝ) ≤ I.f := by exact_mod_cast hf1
    have h3 : (1 : ℝ) ≤ I.n * I.f := one_le_mul_of_one_le_of_one_le h1 h2
    rw [hX]; nlinarith
  have hone : ∀ J ∈ Finset.Icc 1 q, ∀ c : Composition J,
      I.muA μf (typeSet I c.blocksFun (simplexH c.length) ∩ fund) / I.muA μf fund ≤
        ENNReal.ofReal (Real.exp (-(1 / 2 * J * X))) := by
    intro J hJ c
    obtain ⟨hJ1, hJq⟩ := Finset.mem_Icc.mp hJ
    have hsum := c.sum_blocksFun
    have hT := (hFM I μf fund hfund p q hs h2q c.length c.blocksFun
      (c.length_pos_of_pos hJ1) c.one_le_blocksFun (by omega) _ (measurableSet_simplexH _) subset_rfl).2.2.2
    have hD := GlobalTheory.T.lintegral_flagSizeDensity_le_one I.n I.f c.length c.blocksFun hf1 c.one_le_blocksFun (by omega)
    have hK := hCB I.E I.cm.cmUnram p q c.length c.blocksFun c.one_le_blocksFun (by omega)
      (by rw [hpq]; exact hn) (by rw [hpq]; exact hq) (by rw [hpq, hv]; exact hrd) (by rw [hpq, hfd]; exact hf)
    rw [hpq, hfd, hsum] at hK
    refine hT.trans ((mul_le_mul_right hD _).trans ?_)
    rw [mul_one]
    refine ENNReal.ofReal_le_ofReal (hK.trans (le_of_eq ?_))
    rw [hX]; congr 1; ring
  have hsub : {x | stepLt I x (1 / 2) ≠ ⊥} ∩ fund ⊆
      ⋃ J ∈ Finset.Icc 1 q, ⋃ c ∈ (Finset.univ : Finset (Composition J)),
        typeSet I c.blocksFun (simplexH c.length) ∩ fund := by
    rintro x ⟨hx, hxf⟩
    obtain ⟨J, hJ, c, hc⟩ := mem_typeSet I p q hs x hx
    simp only [Set.mem_iUnion]
    exact ⟨J, hJ, c, mem_univ _, hc, hxf⟩
  have hμ : I.muA μf ({x | stepLt I x (1 / 2) ≠ ⊥} ∩ fund) ≤
      ∑ J ∈ Finset.Icc 1 q, ∑ c : Composition J,
        I.muA μf (typeSet I c.blocksFun (simplexH c.length) ∩ fund) :=
    (measure_mono hsub).trans ((measure_biUnion_finset_le _ _).trans
      (Finset.sum_le_sum fun J _ => measure_biUnion_finset_le _ _))
  calc I.muA μf ({x | stepLt I x (1 / 2) ≠ ⊥} ∩ fund) / I.muA μf fund
      ≤ (∑ J ∈ Finset.Icc 1 q, ∑ c : Composition J,
        I.muA μf (typeSet I c.blocksFun (simplexH c.length) ∩ fund)) / I.muA μf fund :=
        ENNReal.div_le_div_right hμ _
    _ = ∑ J ∈ Finset.Icc 1 q, ∑ c : Composition J,
        I.muA μf (typeSet I c.blocksFun (simplexH c.length) ∩ fund) / I.muA μf fund := by
        simp only [div_eq_mul_inv, Finset.sum_mul]
    _ ≤ ∑ J ∈ Finset.Icc 1 q, ∑ _c : Composition J, ENNReal.ofReal (Real.exp (-(1 / 2 * J * X))) :=
        Finset.sum_le_sum fun J hJ => Finset.sum_le_sum fun c _ => hone J hJ c
    _ = ENNReal.ofReal (∑ J ∈ Finset.Icc 1 q, (2 : ℝ) ^ (J - 1) * Real.exp (-(1 / 2 * J * X))) := by
        rw [ENNReal.ofReal_sum_of_nonneg (fun J _ => by positivity)]
        refine Finset.sum_congr rfl fun J _ => ?_
        rw [Finset.sum_const, Finset.card_univ, composition_card, nsmul_eq_mul,
          ENNReal.ofReal_mul (by positivity), ENNReal.ofReal_pow (by norm_num)]
        simp
    _ ≤ _ := by
        refine ENNReal.ofReal_le_ofReal ((GlobalTheory.T.sum_two_pow_pred_mul_exp_neg_le_exp_neg_third q X hX15).trans (le_of_eq ?_))
        rw [hX]; congr 1; ring
end GlobalTheory.NonzeroFlag

namespace GlobalTheory.CountFinal
set_option maxHeartbeats 1000000 in
theorem countingTheorem_of_ratio35 :
    GlobalTheory.FlagMeas.VolumeRatio → GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  intro hV
  have hDec : GlobalTheory.DSId.DecGap := GlobalTheory.T.lowestKType_decayGap_of_compressionFormulaGap GlobalTheory.T.lowestKType_compressionFormula_of_strictLowestKType
  have hPt : GlobalTheory.Deep.PtBound := GlobalTheory.Deep.ptBound_of_decGap hDec
  have hAbs : GlobalTheory.FlagMeas.AbsoluteVolume := GlobalTheory.FlagMeas.AbsVol.absoluteVolume_of_ratio35 hV
  have hFM : GlobalTheory.FlagMeas.FlagMeasureBound := GlobalTheory.FlagMeas.Bound.flagMeasureBound_ratio35 hV
  have hFin := GlobalTheory.T.finiteDimensional_rowsSpace_discreteSeriesCount hDec hAbs
  have hNear := GlobalTheory.NearMod.nearModerate hFM GlobalTheory.T.flag_explicit_constant_le_exp_neg_half GlobalTheory.NearElement.near_unipotent hPt
  have hFar := GlobalTheory.T.farTermsModerateRegion_of_flagBound hFM (GlobalTheory.FarTerms.farBound_of_ptBound hPt)
  have hRare := GlobalTheory.FlagRareProof.flagRare_of_nonzeroFlagBound (GlobalTheory.NonzeroFlag.nonzeroFlagBound_from_flag35 hFM GlobalTheory.T.flag_explicit_constant_le_exp_neg_half)
  have hDeep := GlobalTheory.T.deepRegion_kernelDiagonal_bound hAbs (GlobalTheory.T.deepPointKernelBound_of_pointwiseBound hPt hFin)
  exact GlobalTheory.T.discreteSeries_counting_of_finite_and_bounds hFin hFM hPt hNear hFar hRare hDeep

theorem countingTheorem_of_rankOnly35
    (h : GlobalTheory.FlagMeas.VolRatio.RankOnlyStep35)
    (hInv : VolumeInvariant) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hR : VolumeRatio := by
    first | rh_auto_frontier 1 | exact GlobalTheory.FlagMeas.VolRatio.volumeRatio_of_rankOnly35 h hInv
  first | rh_reduce 2 using [countingTheorem_of_ratio35] | exact countingTheorem_of_ratio35 hR

theorem countingTheorem_original_bridge35 :
    VolumeStep → GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  intro h
  have hS : GlobalTheory.FlagMeas.VolRatio.RankOnlyStep35 := by
    first | rh_auto 1 | exact GlobalTheory.FlagMeas.VolRatio.rankOnlyStep35_of_volumeStep h
  exact countingTheorem_of_rankOnly35 hS GlobalTheory.T.hermitian_volume_depends_only_on_field_signature

end GlobalTheory.CountFinal

rh_scan GlobalTheory.FlagMeas.VolRatio.step limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.step as RHTheta35RankStepPruned
rh_scan GlobalTheory.CountFinal.countingTheorem_of_volumeStep limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_rankOnly35 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_original_bridge35 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.rankOnlyStep35_of_volumeStep
#print axioms GlobalTheory.FlagMeas.VolRatio.volumeRatio_of_rankOnly35
#print axioms GlobalTheory.FlagMeas.fundDom_volume_pos_lt_top_ratio35
#print axioms GlobalTheory.FlagMeas.Bound.flagMeasureBound_ratio35
#print axioms GlobalTheory.FlagMeas.AbsVol.absoluteVolume_of_ratio35
#print axioms GlobalTheory.NonzeroFlag.nonzeroFlagBound_from_flag35
#print axioms GlobalTheory.CountFinal.countingTheorem_of_volumeStep
#print axioms GlobalTheory.CountFinal.countingTheorem_of_rankOnly35
#print axioms GlobalTheory.CountFinal.countingTheorem_original_bridge35
