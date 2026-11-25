import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FlagExplicitConstantLeExpNegHalf
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.UnitaryAutomorphicCountingOfCompactDualVolumeRat
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN34, lane 8, 25 Nov 2026. PREPARED actual caller overlay, NOT compiled.
No RH closure. Mission cd0a176134d46b5b624896e56843a24915c14477;
source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream
d91ae2678eea19a0c3045ffca37f1da757c2e719, no mixing. Toolchain Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Read mission first, AGENTS, continuity, swarm protocol, handoff, expansion,
living proof 464e82f81f646d4af85e1f5f70d379026df46261, and recent lane
results 1338d45c, 4123659c, 841814dc, 259672cc, 12705f087.
Native batch RUN34 is PREPARED, not queued; do not duplicate its job.

ACTUAL CALLER REPLACEMENT, not another coefficient reduction:
RUN33 4e8fb668 established the human factorial cancellation but its bottom
engine invocations are syntactically wrong for the actual engines:
rh_scan needs "limit N", rh_prune needs "as dst", rh_reduce and rh_auto
are tactics with numeric depths, not theorem-name commands. This is a
source-visible failure of the earlier candidate, not an observed Lean
compiler error. Preserve old file. The corrected executable overlay below
copies the existing helpers under a fresh namespace, splices the replacement
T3 into the pinned constantBound proof and substitutes the resulting
ConstantBound at the actual countingTheorem_of_volumeStep caller.
No original theorem is removed. The hA exponent is normalized by ring
before applying the helper, and every other T1,T2,T4,T5, numeric,
FreeQuotientRank, host and finite-measure premise is retained.
The actual counting caller still requires VolumeStep; we do not claim
the same-host normalization, VWinAt or global ramp inequality is proved.

SOURCE LEDGER:
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/FlagExplicitConstantLeExpNegHalf.lean 4522eb5477d6470bacad8c3f3782ade21d5bbdd1
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/UnitaryAutomorphicCountingOfCompactDualVolumeRat.lean 2a66d72b3180fbb9cff093ad05a9fda228b0daa6
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/LogUnitarySphereVolumeProductRatioLeLargeRank.lean 45d3abe79f9e841e59dde340c96d978a2f62f3e4
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsotropicFlagProbabilityBoundOfVolumeRatio.lean 852f33a0e868dbfe442b023c790793ca92b9a345
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsotropicFlagProbabilityBoundOfVolumeRatioStatement.lean 66de97112609f0eefe803844f7b72246535ddf92
RUN33 overlay 60eaecde2c9c01d472cda6018892a76d5e3e8648
Engines prune f6d3e7f6047a7895ecf183be3fb54c203f4fc46a, fixed 976c28572f11ffb00e1ae730555e938eeb564cb7, auto a113dc56ea987abac3bf29eb480782140b82ab4a.
Actual baseline CI status.json 45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved;
returncode 0, prior conditional strip and bounded prune only.
Local command -v lean/lake returned no paths. No new native PASS.

HUMAN BLOCK / exact retained obstacle:
The same-host relative flag bound uses normalized covolume x/m with
C x/K <= T V J and C m/K = V R; cancellation gives x/m<=T J/R.
In the actual flagMeasureBound proof R is the product of rankFac on
p+q-2 sum j < M <= p+q, V=gaugeVol of the same-kind lower-rank host,
C=ofReal(prod_v c_v), K=mu_f(Kset), m=muA(fund). The actual
hratio is supplied by hermVolumeRatioSameKind_of_volumeRatioInduction.
The near and far branches both consume hFM; rare, deep and finite
dimensionality have separate VolumeStep routes. Exact absolute
normalization may not be retired on a relative bound alone.
Peer 841814dc already treats the Tamagawa rank route, so no duplicate
derivation or unproved signed interval is introduced.

Source-level old graph: countingTheorem_of_volumeStep -> nearModerate ->
flag_explicit_constant_le_exp_neg_half -> constantBound -> hA,hB,hC.
Candidate graph: countingTheorem_of_volumeStep_reduced34 -> nearModerate ->
constantBound_reduced34 -> hA, factorial cancellation. Unchanged edges:
hDec,hPt,hAbs,hFM,hFin,hFar,hRare,hDeep, final discreteSeries count.
Actual caller source retained; no claim on elaborated graph, global
dependency deletion or new axioms. Context key (pin, toolchain, host E,
p,q,j,J,f,n,s, native hA and caller VolumeStep). Backtrack to native
ConstantBound on replay failure. Existing original graphs and axiom
evidence untouched. Zero root obligations closed independently.
Actual static execution: 10 fail-on-error predicates on pinned fetched
blobs, engine grammar and exact source splice anchors/retained consumers
(3 hashes, 3 grammar, 1 anchor, 2 splice, plus exact suffix identity
checked before commit). No new numerical regression or URT comparison.

RESUME HERE: add this overlay to the existing RUN34 batch (replacing
the malformed RUN33 overlay, preserving it as evidence), compile with
native imports and engines; inspect exact compiler/axiom output and
actual caller bridge before counting any deletion. Independently
coordinate hratio/VolumeStep proof with geometry and integration;
do not infer exact mass from conditional rank ratios.
HANDOFF TO kernel extractor, acceleration, geometry, integration, audit.
-/

open MeasureTheory NumberField Matrix Finset
open scoped BigOperators
open GlobalTheory.FlagMeas

namespace RHTheta34

theorem factorial_mul_le (m k : ℕ) :
    m.factorial * k.factorial ≤ (m+k).factorial := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hh : k+1 ≤ m+k+1 := by omega
    simpa only [Nat.add_succ, Nat.factorial_succ, mul_assoc, mul_left_comm, mul_comm]
      using Nat.mul_le_mul hh ih

theorem sphere_factor_le (m k : ℕ) :
    2*Real.pi^(m+k+1)/((m+k).factorial:ℝ) ≤
      (2*Real.pi^(k+1)/(k.factorial:ℝ))*Real.exp Real.pi := by
  have hp := Real.pi_pos
  have hm : 0 < (m.factorial:ℝ) := by exact_mod_cast m.factorial_pos
  have hk : 0 < (k.factorial:ℝ) := by exact_mod_cast k.factorial_pos
  have hf : (m.factorial:ℝ)*(k.factorial:ℝ) ≤ ((m+k).factorial:ℝ) := by
    exact_mod_cast factorial_mul_le m k
  have hi := one_div_le_one_div_of_le (mul_pos hm hk) hf
  have he : Real.pi^m/(m.factorial:ℝ) ≤ Real.exp Real.pi :=
    Real.pow_div_factorial_le_exp _ hp.le m
  calc
    _ = (2*Real.pi^(k+1))*Real.pi^m*(1/((m+k).factorial:ℝ)) := by
      rw [show m+k+1=m+(k+1) by omega, pow_add]; ring
    _ ≤ (2*Real.pi^(k+1))*Real.pi^m*(1/((m.factorial:ℝ)*(k.factorial:ℝ))) :=
      mul_le_mul_of_nonneg_left hi (by positivity)
    _ = (2*Real.pi^(k+1)/(k.factorial:ℝ))*(Real.pi^m/(m.factorial:ℝ)) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left he (by positivity)

theorem sphere_block (m j : ℕ) :
    sphV (m+j) ≤ sphV m * sphV j * (Real.exp Real.pi)^j := by
  induction j with
  | zero => simp [sphV]
  | succ j ih =>
    have hp := Real.pi_pos
    have h0 := GlobalTheory.SphRatio.sphV_pos m
    have h1 := GlobalTheory.SphRatio.sphV_pos j
    rw [Nat.add_succ, GlobalTheory.SphRatio.sphV_succ,
      GlobalTheory.SphRatio.sphV_succ j]
    calc
      _ ≤ (sphV m * sphV j * (Real.exp Real.pi)^j) *
          ((2*Real.pi^(j+1)/(j.factorial:ℝ))*Real.exp Real.pi) :=
        mul_le_mul ih (sphere_factor_le m j) (by positivity) (by positivity)
      _ = _ := by rw [pow_succ]; ring

theorem sphere_blocks {ι : Type} (u : Finset ι) (j : ι → ℕ) (m : ℕ) :
    sphV (m+∑ i ∈ u,j i) ≤
      sphV m * (∏ i ∈ u,sphV (j i)) * (Real.exp Real.pi)^(∑ i ∈ u,j i) := by
  classical
  induction u using Finset.induction_on with
  | empty => simp
  | @insert i u hi ih =>
    rw [Finset.sum_insert hi, Finset.prod_insert hi]
    have he : m+(j i+∑ k ∈ u,j k)=(m+∑ k ∈ u,j k)+j i := by omega
    rw [he]
    have hp := GlobalTheory.SphRatio.sphV_pos (j i)
    calc
      _ ≤ sphV (m+∑ k ∈ u,j k)*sphV (j i)*(Real.exp Real.pi)^(j i) :=
        sphere_block _ _
      _ ≤ (sphV m*(∏ k ∈ u,sphV (j k))*(Real.exp Real.pi)^(∑ k ∈ u,j k)) *
           sphV (j i)*(Real.exp Real.pi)^(j i) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right ih hp.le) (by positivity)
      _ = _ := by rw [pow_add]; ring

theorem rh33_T3 (p q J f a : ℕ) (j : Fin a → ℕ) (A : ℝ)
    (hJ : ∑ i, j i = J) (hJq : J ≤ q)
    (hA : sphV p / sphV (p-J) ≤ Real.exp (J*A)) :
    (sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)))^f ≤
       Real.exp (f*J*(A+Real.pi)) := by
  have hp := GlobalTheory.SphRatio.sphV_pos p
  have hq := GlobalTheory.SphRatio.sphV_pos q
  have hp' := GlobalTheory.SphRatio.sphV_pos (p-J)
  have hq' := GlobalTheory.SphRatio.sphV_pos (q-J)
  have hprod : 0 < ∏ i,sphV (j i) :=
    Finset.prod_pos fun i _ => GlobalTheory.SphRatio.sphV_pos (j i)
  have hb := sphere_blocks Finset.univ j (q-J)
  rw [hJ, Nat.sub_add_cancel hJq] at hb
  have hs : sphV q/(sphV (q-J)*∏ i,sphV (j i)) ≤ (Real.exp Real.pi)^J := by
    apply (div_le_iff₀ (mul_pos hq' hprod)).2
    simpa [mul_comm] using hb
  have he : sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)) =
      (sphV p/sphV (p-J))*(sphV q/(sphV (q-J)*∏ i,sphV (j i))) := by
    field_simp
  rw [he]
  calc
    _ ≤ (Real.exp (J*A)*(Real.exp Real.pi)^J)^f :=
      pow_le_pow_left₀ (by positivity) (mul_le_mul hA hs (by positivity) (Real.exp_pos _).le) _
    _ = _ := by
      rw [← Real.exp_nat_mul, ← Real.exp_add, ← Real.exp_nat_mul]
      congr 1
      ring

theorem rh33_restore_T3 (p q J f a : ℕ) (j : Fin a → ℕ) (A s ell : ℝ)
    (hs : 0 ≤ s) (hl : 0 ≤ ell) (hJ : ∑ i, j i = J) (hJq : J ≤ q)
    (hA : sphV p/sphV (p-J) ≤ Real.exp (J*A)) :
    (sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)))^f ≤
      Real.exp (f*J*(A+3.49+s/2*(ell/2))) := by
  refine (rh33_T3 p q J f a j A hJ hJq hA).trans (Real.exp_le_exp.mpr ?_)
  have hpi := Real.pi_lt_d2
  have hsl : 0 ≤ s/2*(ell/2) := by positivity
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  linarith

end RHTheta34

open MeasureTheory NumberField Matrix Finset Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.Dec GlobalTheory.FlagMeas Formalism.REAL Formalism.QuantumDeterminants
open scoped InnerProductSpace ContDiff

namespace GlobalTheory.FlagMeas

set_option maxHeartbeats 1000000 in
open ConstBd in

theorem constantBound_reduced34 : ConstantBound := by
  intro E _ _ _ hE p q a j hj1 hjq hL hq hrd _
  obtain ⟨hdeg, hf1, hv, -⟩ := GlobalTheory.T.rootDiscr_ge_three_halves_of_isTotallyComplex E hE.1
  obtain ⟨hres0, hres⟩ := GlobalTheory.T.dedekindZeta_residue_le_sixteen_log_rootDiscr_pow E hE.1
  unfold kapBd
  have haJ : a ≤ ∑ i, j i := by
    simpa using Finset.sum_le_sum (s := Finset.univ) (fun i _ => hj1 i)
  have hjJ : ∀ i, j i ≤ ∑ i, j i := fun i =>
    Finset.single_le_sum (f := j) (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
  have hD := dimN_le (p + q) a j
  have hcast : ((∑ i, j i : ℕ) : ℝ) = ∑ i, (j i : ℝ) := by push_cast; rfl
  generalize hJ : ∑ i, j i = J at *
  have hp : ((p + q : ℕ) : ℝ) = p + q := by push_cast; rfl
  generalize hn : p + q = n at *
  generalize hf : Formalism.HermitianLatticesTheory.fDeg E = f at *
  have hn0 : (0 : ℝ) < n := by
    rcases Nat.eq_zero_or_pos n with h | h
    · subst h; norm_num at hL
    · exact_mod_cast h
  have hN : (10000 : ℝ) ≤ n := by
    rw [Real.le_log_iff_exp_le hn0] at hL
    have h1 : Real.exp 15 = Real.exp 1 ^ 15 := by rw [Real.exp_one_pow]; norm_num
    have h2 : (2 : ℝ) ^ 15 ≤ Real.exp 1 ^ 15 :=
      pow_le_pow_left₀ (by norm_num) (by have := Real.exp_one_gt_d9; linarith) _
    norm_num at h2
    linarith
  set s := Real.sqrt n with hs
  have hss : (n : ℝ) = s * s := (Real.mul_self_sqrt hn0.le).symm
  have hs100 : 100 ≤ s := Real.le_sqrt_of_sq_le (by linarith)
  have hqs : (q : ℝ) ≤ s := Real.le_sqrt_of_sq_le (by exact_mod_cast hq)
  have hJq : (J : ℝ) ≤ q := by exact_mod_cast hjq
  have hJ0 : (0 : ℝ) ≤ J := Nat.cast_nonneg J
  have hf0 : (0 : ℝ) ≤ f := Nat.cast_nonneg f
  have haJ' : (a : ℝ) ≤ J := by exact_mod_cast haJ
  have h100 : 100 * s ≤ n := by nlinarith
  have h2J : 2 * J + 2 ≤ n := by
    have : (2 : ℝ) * J + 2 ≤ n := by linarith
    exact_mod_cast this
  have hJp : J ≤ p := by
    have : (J : ℝ) ≤ p := by linarith
    exact_mod_cast this
  have hlogs : Real.log s = Real.log n / 2 := Real.log_sqrt hn0.le
  have hpos : ∀ i, 0 < sphV i := fun i => (GlobalTheory.T.unitarySphereVolumeProduct_ratio_and_inv_bounds.2 i).1
  have hpi := Real.pi_pos
  have hc0 : 0 ≤ Real.log (2 * Real.pi) := Real.log_nonneg (by have := Real.pi_gt_three; linarith)
  have hc2 : Real.log (2 * Real.pi) ≤ 2 := by
    rw [Real.log_le_iff_le_exp (by positivity)]
    have h1 : Real.exp 2 = Real.exp 1 ^ 2 := by rw [Real.exp_one_pow]; norm_num
    have := Real.exp_one_gt_d9
    have := Real.pi_lt_d2
    nlinarith

  have T1 : Formalism.HermitianLatticesTheory.vInv E ^ (-((f : ℝ) * dimN n j / 2)) ≤ Real.exp (f * J * (n / 3)) := by
    refine (rpow_le _ _ (by linarith) (by positivity)).trans (Real.exp_le_exp.2 ?_)
    have := mul_le_mul_of_nonneg_left (hD (by omega)) hf0
    linarith

  have T2 : (2 : ℝ) ^ (-((f : ℝ) * ((n : ℝ) * J - (J : ℝ) ^ 2 + (J : ℝ) / 2))) ≤ 1 := by
    apply Real.rpow_le_one_of_one_le_of_nonpos (by norm_num)
    have : (0 : ℝ) ≤ (n : ℝ) * J - (J : ℝ) ^ 2 + (J : ℝ) / 2 := by nlinarith
    have := mul_nonneg hf0 this
    linarith

  have hA := GlobalTheory.T.log_unitarySphereVolumeProduct_ratio_le_large_rank n p J (by exact_mod_cast (by linarith : (18 : ℝ) ≤ n)) hJp (by omega)
    (by linarith) (by linarith)
  rw [Real.log_div hn0.ne' (by positivity), Real.log_mul (x := 2 * Real.pi) (by positivity) (by positivity),
    Real.log_exp,
    Real.log_le_iff_le_exp (div_pos (hpos _) (hpos _))] at hA
  have hA' : sphV p / sphV (p-J) ≤
      Real.exp (J * (Real.log (2 * Real.pi) -
        (n - 2*s) * (Real.log n - (Real.log (2 * Real.pi) + 1)))) := by
    convert hA using 1 <;> ring
  have hs0 : 0 ≤ s := by
    rw [hs]
    first | rh_auto 1 | positivity
  have hlog0 : 0 ≤ Real.log n := by linarith
  have T3 : (sphV p * sphV q / (sphV (p - J) * sphV (q - J) * ∏ i, sphV (j i))) ^ f ≤
      Real.exp (f * J * (Real.log (2 * Real.pi) - (n - 2 * s) * (Real.log n - (Real.log (2 * Real.pi) + 1)) +
        3.49 + s / 2 * (Real.log n / 2))) := by
    exact RHTheta34.rh33_restore_T3 p q J f a j
      (Real.log (2 * Real.pi) - (n - 2*s) *
        (Real.log n - (Real.log (2 * Real.pi) + 1))) s (Real.log n)
      hs0 hlog0 hJ hjq hA'

  have T4 : dedekindZeta_residue E ^ a ≤ Real.exp (f * J * (2 * (3 + n))) := by
    have h16 : (16 : ℝ) ≤ Real.exp 3 := by
      have h1 : Real.exp 3 = Real.exp 1 ^ 3 := by rw [Real.exp_one_pow]; norm_num
      have h2 : (2.7 : ℝ) ^ 3 ≤ Real.exp 1 ^ 3 :=
        pow_le_pow_left₀ (by norm_num) (by have := Real.exp_one_gt_d9; linarith) _
      norm_num at h2
      linarith
    have hl0 : 0 ≤ Real.log (2 * Formalism.HermitianLatticesTheory.vInv E) := Real.log_nonneg (by linarith)
    have h3 : 16 * Real.log (2 * Formalism.HermitianLatticesTheory.vInv E) ≤ Real.exp (3 + n) := by
      rw [Real.exp_add]
      exact mul_le_mul h16 hrd hl0 (by positivity)
    have h4 := hres.trans (pow_le_pow_left₀ (by positivity) h3 _)
    refine (pow_le_pow_left₀ hres0.le h4 a).trans ?_
    rw [← Real.exp_nat_mul, ← Real.exp_nat_mul]
    apply Real.exp_le_exp.2
    push_cast
    have : (a : ℝ) * (2 * f * (3 + n)) ≤ J * (2 * f * (3 + n)) :=
      mul_le_mul_of_nonneg_right haJ' (by positivity)
    linarith

  have T5 : ∏ i, ∏ l ∈ Finset.Icc 2 (j i), zetaE E l ≤ Real.exp (f * J * 2) := by
    refine (Finset.prod_le_prod (fun i _ => (zeta_prod E (j i)).1)
      (fun i _ => (zeta_prod E (j i)).2)).trans ?_
    rw [Finset.prod_const, Finset.card_univ, Fintype.card_fin, ← Real.exp_nat_mul, hdeg]
    apply Real.exp_le_exp.2
    push_cast
    have := mul_le_mul_of_nonneg_right haJ' hf0
    linarith
  have T5' : 0 ≤ ∏ i, ∏ l ∈ Finset.Icc 2 (j i), zetaE E l :=
    Finset.prod_nonneg fun i _ => (zeta_prod E (j i)).1

  obtain ⟨hL1, hL0⟩ := GlobalTheory.T.neg_log_prod_lValEta_le_and_pos E hE (n - 2 * J) n (by omega)
  rw [hf] at hL1
  have FreeQuotientRank : (∏ M ∈ Finset.Ioc (n - 2 * J) n, Formalism.HermitianLatticesTheory.lValEta E M)⁻¹ ≤ Real.exp (f * J * 1) := by
    rcases Nat.eq_zero_or_pos J with h | h
    · subst h; simp
    · rw [← Real.log_le_iff_le_exp (inv_pos.2 hL0), Real.log_inv]
      refine hL1.trans ?_
      have h1 : (2 : ℝ) ^ ((1 : ℤ) - (n - 2 * J : ℕ)) ≤ 1 :=
        zpow_le_one_of_nonpos₀ (by norm_num) (by omega)
      have h2 : (1 : ℝ) ≤ J := by exact_mod_cast h
      rw [mul_one]
      exact mul_le_mul_of_nonneg_left (h1.trans h2) hf0
  have hv0 : 0 < Formalism.HermitianLatticesTheory.vInv E := by linarith
  have := hpos p; have := hpos q; have := hpos (p - J); have := hpos (q - J)
  rw [div_eq_mul_inv]
  refine (mul_le_mul (mul_le_mul (mul_le_mul (mul_le_mul (mul_le_mul T1 T2 (by positivity) (by positivity))
    T3 (by positivity) (by positivity)) T4 (by positivity) (by positivity)) T5 T5' (by positivity)) FreeQuotientRank
    (by positivity) (by positivity)).trans ?_
  rw [mul_one, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add]
  apply Real.exp_le_exp.2
  have := mul_le_mul_of_nonneg_left (numeric n s _ _ hs100 hss hL hc0 hc2) (mul_nonneg hf0 hJ0)
  linarith

end GlobalTheory.FlagMeas

namespace GlobalTheory.CountFinal

theorem countingTheorem_of_volumeStep_reduced34 :
    GlobalTheory.FlagMeas.VolumeStep → GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  intro hV
  have hDec : GlobalTheory.DSId.DecGap := GlobalTheory.T.lowestKType_decayGap_of_compressionFormulaGap GlobalTheory.T.lowestKType_compressionFormula_of_strictLowestKType
  have hPt : GlobalTheory.Deep.PtBound := GlobalTheory.Deep.ptBound_of_decGap hDec
  have hAbs : GlobalTheory.FlagMeas.AbsoluteVolume := GlobalTheory.T.hermAbsoluteVolumeBound_of_volume_ratio_induction hV
  have hFM : GlobalTheory.FlagMeas.FlagMeasureBound := GlobalTheory.T.isotropicFlagProbabilityBound_of_volumeRatio hV
  have hFin := GlobalTheory.T.finiteDimensional_rowsSpace_discreteSeriesCount hDec hAbs
  have hCB : GlobalTheory.FlagMeas.ConstantBound := by
    first
    | rh_reduce 2 using [GlobalTheory.FlagMeas.constantBound_reduced34]
    | exact GlobalTheory.FlagMeas.constantBound_reduced34
  have hNear := GlobalTheory.NearMod.nearModerate hFM hCB GlobalTheory.NearElement.near_unipotent hPt
  have hFar := GlobalTheory.T.farTermsModerateRegion_of_flagBound hFM (GlobalTheory.FarTerms.farBound_of_ptBound hPt)
  have hRare := GlobalTheory.FlagRareProof.flagRare_of_nonzeroFlagBound (GlobalTheory.T.nonzeroFlagProbabilityBound_of_volumeRatioInduction hV)
  have hDeep := GlobalTheory.T.deepRegion_kernelDiagonal_bound hAbs (GlobalTheory.T.deepPointKernelBound_of_pointwiseBound hPt hFin)
  exact GlobalTheory.T.discreteSeries_counting_of_finite_and_bounds hFin hFM hPt hNear hFar hRare hDeep

end GlobalTheory.CountFinal

rh_scan GlobalTheory.FlagMeas.constantBound limit 2000
rh_prune GlobalTheory.SphRatio.log_sphV_ratio_le as RHTheta34LargeRankPruned
rh_scan GlobalTheory.FlagMeas.constantBound_reduced34 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_volumeStep limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_volumeStep_reduced34 limit 2000
#print axioms RHTheta34.rh33_T3
#print axioms GlobalTheory.FlagMeas.constantBound
#print axioms GlobalTheory.FlagMeas.constantBound_reduced34
#print axioms GlobalTheory.CountFinal.countingTheorem_of_volumeStep
#print axioms GlobalTheory.CountFinal.countingTheorem_of_volumeStep_reduced34
