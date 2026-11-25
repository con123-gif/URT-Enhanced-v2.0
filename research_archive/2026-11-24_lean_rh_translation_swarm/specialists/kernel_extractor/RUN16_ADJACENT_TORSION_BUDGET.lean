import RHSharedShaBothCore41
import RHDirectPatternDetector15
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.ExponentLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11 RUN16, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED Lean;
NOT COMPILED. RH OPEN. Weaken the actual SNum consumer to one adjacent
torsion budget; integrate prior direct odd detector at shared VWin.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, SWARM, HANDOFF, EXPANSION, AGENTS, state, continuity, protocol
and log openings and CI summary read. Latest 20 commits surveyed;
peer integration a5f9e057 and 2785c414, own abca5bf7, acceleration
33888226, literature 94eea89e, structure 30a2c2d9, dependency 46e9230b,
math 51bb79cc inspected. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream latest observed 756a70250dcba9162b99d4ea35c186558434c17e;
no source migration.

The actual sNum assembler is in NumThree.lean and actual sTors
supplier in ExponentLe.lean (torsAll uses KT.tors_le, KT.orbnum, proof
chooses C0=24). Do not treat these as absent declarations or
kernel-verified proofs. At E=k+1 and SAME layer L', the native
sCount and sFew share the positive factor l^(nu*r); cancel before
taking logs, as the native source does:
  l^s <= T1*T2*l^X,
  T1=tc(L',4E+6,2E+1), T2=tc(L',4E+6,2E).
Hence s log l <= log T1+log T2+X log l. Positivity from l^s>=1
retained; Nat.card infinite=0 is NOT a positive finite cardinal.
STorsPair16 needs only log T1+log T2 <= 2*kBound(C,E,n',D')
on the same L', E, one uniform C. No separate bounds or other
degrees needed in this consumer. Original STors implies it with
same C; no converse claimed. Abstract budgets (2B,0), B>0,
satisfy joint but not both coordinate B bounds; no field example claimed.

Exact scalar improvement at num_three: M=max(C0,9), A=u^M Y.
u>=2,Y>=1/2 imply A>=256, exp A>=A+1>=3, P<=A. Thus
  2 exp(u^C0 Y)+P <= 2 exp A+A <= 3 exp A
  <= exp(2A) <= exp(u^(M+1)Y).
Retain native num_down, giving exponent 5*(max C0 9+1)+11
instead of 5*(max C0 9+2)+11. At native chosen C0=24 this is
136 instead of 141, not a new arithmetic theorem or change to 401.

Original selected graph: VWin -> LemmaK -> SFinal(SNum(... BOdd ...
STors)); SNum -> SFew,SCount,SSha,SLayer, two uses of STors.
Candidate: window_pair16 -> window_sha41 + sha_of_bOdd16 ->
sNum_pair16 -> same SFew(sUpperOf sChain bOdd15), SCount, SSha,
SLayer, STorsPair16; original STors supplies joint bound as fallback.
SFinal remains at sibling count suppliers; both core consumers
share same hSha. Original SNum statement bridge sNum_original16.
No global dependency retirement; all original and reduced graphs,
roles/type/value/constructor/axiom ledgers and open nodes retained.
Cache by exact source/toolchain, L',E,c,d,prime,degree,disc,coefficients,
layer, same C and proof role; never identify distinct fields or
choose separate constants per prime. Backtrack to native sNum/bOdd
or RUN41 if replay fails. CountI/II/III/V, TopG/ASK, weighted prime
bound and other unresolved obligations remain.

Executed 25 connector JS exact source/anchor/guard and abstract
negative-control checks; 527 exact integer controls
q^2>=3q>=2q+A for A>=2,q>=A+1. Not Lean or field arithmetic.
First transformation halted on wrong expected occurrence count
(4, actual 5); corrected guard and reran. Local lean/lake absent.
Read actual status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0 baseline
45577239749/45576756833 only. No fresh CI dispatch or axiom results.
Source hashes (relative to AutomorphicVarieties/ClassCounting,
with actual prefix ModularityArgument/):
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
ExponentLe.lean 2b3e4233ad68b7007573c70feaf4703d85452b47
RUN15 blob 03f06ac0173cfbbe6c6af6c2adfec628e1c71b4e
RUN40 blob 2e073cfcd45bb9b21162782749515f842434d479
RUN41 blob 795abc50dfccd355cc25dec43758b3abb0c26ca3.
Private num_poly, num_down, gens_le copied under unique names.

RESUME HERE: compile peer overlays in RUN41 order, RUN15 as
RHDirectPatternDetector15 and RUN41 as RHSharedShaBothCore41,
then this file in the same pinned runner. Compare actual role and
axiom evidence; seek direct adjacent-degree aggregate from actual
KT.tors_le, not another exponent tweak. Keep all earlier fallbacks.
HANDOFF TO integration, audit, dependency, literature, editor.
-/

noncomputable section
open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK

namespace UpperTheory.V.ZK

def STorsPair16 : Prop :=
  ∃ C : ℝ, ∀ (L : Type) [Field L] [NumberField L], IsTotallyComplex L →
    ∀ E : ℕ, 1 ≤ E →
      Real.log (tc L (4 * E + 6) (2 * E + 1)) +
        Real.log (tc L (4 * E + 6) (2 * E)) ≤
          2 * kBound C E (Module.finrank ℚ L) (discr L).natAbs

def SNumPair16 : Prop := SFew → SCount → SSha → SLayer → STorsPair16 → ∃ C, ShaK C

theorem torsPair_of_STors16 (h : STors) : STorsPair16 := by
  obtain ⟨C, hC⟩ := h
  refine ⟨C, ?_⟩
  intro L _ _ hTC E hE
  have h1 := hC L hTC E hE (2 * E + 1) le_rfl
  have h2 := hC L hTC E hE (2 * E) (by omega)
  linarith

end UpperTheory.V.ZK

private theorem num_three16 (C u Y t : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y)
    (P : ℝ) (hP : P ≤ u ^ 9 * Y)
    (ht : t ≤ 2 * Real.exp (u ^ C * Y) + P) :
    t ≤ Real.exp (u ^ (max C 9 + 1) * Y) := by
  have hu0 : 0 < u := by linarith
  have hu1 : 1 ≤ u := by linarith
  have hY0 : 0 ≤ Y := by linarith
  set A := u ^ (max C 9) * Y with hA
  have hAC : u ^ C * Y ≤ A :=
    mul_le_mul_of_nonneg_right (Real.rpow_le_rpow_of_exponent_le hu1 (le_max_left C 9)) hY0
  have h9 : u ^ (9 : ℕ) ≤ u ^ (max C 9) := by
    rw [← Real.rpow_natCast]
    exact Real.rpow_le_rpow_of_exponent_le hu1 (by push_cast; exact le_max_right C 9)
  have h9A : u ^ (9 : ℕ) * Y ≤ A := mul_le_mul_of_nonneg_right h9 hY0
  have hPA : P ≤ A := hP.trans h9A
  have h512 : (512 : ℝ) ≤ u ^ (9 : ℕ) := by
    calc (512 : ℝ) = 2 ^ (9 : ℕ) := by norm_num
      _ ≤ u ^ (9 : ℕ) := pow_le_pow_left₀ (by norm_num) hu 9
  have h256 : (256 : ℝ) ≤ u ^ (9 : ℕ) * Y := by
    have h := mul_le_mul h512 hY (by norm_num : (0 : ℝ) ≤ 1 / 2)
      (by positivity : (0 : ℝ) ≤ u ^ (9 : ℕ))
    norm_num at h
    exact h
  have hA2 : 2 ≤ A := by linarith
  have hE := Real.add_one_le_exp A
  have hE3 : 3 ≤ Real.exp A := by linarith
  have hStep : 2 * A ≤ u ^ (max C 9 + 1) * Y := by
    calc 2 * A ≤ u * A := mul_le_mul_of_nonneg_right hu (by linarith)
      _ = _ := by rw [hA, Real.rpow_add hu0, Real.rpow_one]; ring
  calc t ≤ 2 * Real.exp A + A := by linarith [Real.exp_le_exp.mpr hAC]
    _ ≤ 3 * Real.exp A := by linarith
    _ ≤ Real.exp A * Real.exp A := mul_le_mul_of_nonneg_right hE3 (Real.exp_pos A).le
    _ = Real.exp (2 * A) := by rw [← Real.exp_add]; congr 1 <;> ring
    _ ≤ _ := Real.exp_le_exp.mpr hStep

private theorem num_poly16 (u Y t b g c v : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y) (ht : t ≤ u)
    (hb0 : 0 ≤ b) (hb : b ≤ u + 2 * u ^ 2) (hg0 : 0 ≤ g) (hg : g ≤ u + 2 * u * Y + 2) (hc0 : 0 ≤ c) (hc : c ≤ u)
    (hv0 : 0 ≤ v) (hv : v ≤ u) : ((b + v) * g + c + v) * t ≤ u ^ 9 * Y := by
  have hu0 : (0:ℝ) ≤ u := by linarith
  have hY0 : (0:ℝ) < Y := by linarith
  have huY : 1 ≤ u * Y := by nlinarith
  have hu2 : 2 * u ≤ u ^ 2 := by nlinarith
  have hbv : b + v ≤ 3 * u ^ 2 := by nlinarith
  have hg' : g ≤ 6 * (u * Y) := by nlinarith
  have h1 : (b + v) * g ≤ 3 * u ^ 2 * (6 * (u * Y)) :=
    mul_le_mul hbv hg' hg0 (by positivity)
  have h4 : (4:ℝ) ≤ u ^ 2 := by nlinarith
  have h4' : 4 * (u * Y) ≤ u ^ 2 * (u * Y) := mul_le_mul_of_nonneg_right h4 (by positivity)
  have hcv : c + v ≤ 4 * (u * Y) := by nlinarith
  have hS0 : 0 ≤ (b + v) * g + c + v := by positivity
  have hsum : (b + v) * g + c + v ≤ 19 * (u ^ 3 * Y) := by nlinarith
  have hst : ((b + v) * g + c + v) * t ≤ ((b + v) * g + c + v) * u :=
    mul_le_mul_of_nonneg_left ht hS0
  have hsu : ((b + v) * g + c + v) * u ≤ 19 * (u ^ 3 * Y) * u :=
    mul_le_mul_of_nonneg_right hsum hu0
  have h5 : (32:ℝ) ≤ u ^ 5 := by
    calc (32:ℝ) = 2 ^ 5 := by norm_num
      _ ≤ u ^ 5 := pow_le_pow_left₀ (by norm_num) hu 5
  have h4Y : 0 ≤ u ^ 4 * Y := by positivity
  have hfin : 19 * (u ^ 3 * Y) * u ≤ u ^ 9 * Y := by
    have e : 19 * (u ^ 3 * Y) * u = 19 * (u ^ 4 * Y) := by ring
    have e' : u ^ 9 * Y = u ^ 5 * (u ^ 4 * Y) := by ring
    rw [e, e']
    exact mul_le_mul_of_nonneg_right (by linarith) h4Y
  linarith

set_option maxHeartbeats 800000 in
private theorem num_down16 (C : ℝ) (hC : 0 ≤ C) (E n D n' D' d w : ℕ) (hE : 1 ≤ E) (hn : 1 ≤ n) (hD : 1 ≤ D)
    (hD' : 1 ≤ D') (h1 : n' = d * n) (hn' : 1 ≤ n') (h2 : d ≤ (n + 1) * (4 * E + 4)) (hw : w ≤ 2 * n')
    (h3 : D' ≤ D ^ d * w ^ n') : kBound C E n' D' ≤ kBound (5 * C + 11) E n D := by
  have hw1 : 1 ≤ w := by
    rcases Nat.eq_zero_or_pos w with h | h
    · subst h
      rw [zero_pow (by omega), mul_zero] at h3
      omega
    · exact h
  unfold kBound
  apply Real.exp_le_exp.mpr
  have hE' : (1:ℝ) ≤ E := by exact_mod_cast hE
  have hn1 : (1:ℝ) ≤ n := by exact_mod_cast hn
  have hD1 : (1:ℝ) ≤ D := by exact_mod_cast hD
  have hD'1 : (1:ℝ) ≤ D' := by exact_mod_cast hD'
  have hn'1 : (1:ℝ) ≤ n' := by exact_mod_cast hn'
  have hw1R : (1:ℝ) ≤ w := by exact_mod_cast hw1
  have h1R : (n':ℝ) = d * n := by exact_mod_cast h1
  have h2R : (d:ℝ) ≤ (n + 1) * (4 * E + 4) := by exact_mod_cast h2
  have hwR : (w:ℝ) ≤ 2 * n' := by exact_mod_cast hw
  have h3R : (D':ℝ) ≤ D ^ d * w ^ n' := by exact_mod_cast h3
  have hd0 : (0:ℝ) ≤ d := Nat.cast_nonneg d
  have hd16 : (d:ℝ) ≤ 16 * E * n := by
    have : ((n:ℝ) + 1) * (4 * E + 4) ≤ (2 * n) * (8 * E) :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by positivity)
    nlinarith
  have hn'16 : (n':ℝ) ≤ 16 * E * n ^ 2 := by
    rw [h1R]
    have := mul_le_mul_of_nonneg_right hd16 (by linarith : (0:ℝ) ≤ n)
    nlinarith
  set x : ℝ := 2 * E * n with hx
  have hx2 : 2 ≤ x := by nlinarith
  have hx0 : 0 < x := by linarith
  have hEn : (E:ℝ) * n ^ 2 ≤ E ^ 2 * n ^ 2 := by
    have : (E:ℝ) ≤ E ^ 2 := by nlinarith
    exact mul_le_mul_of_nonneg_right this (by positivity)
  have hn'x : (n':ℝ) ≤ 4 * x ^ 2 := by
    have : x ^ 2 = 4 * E ^ 2 * n ^ 2 := by rw [hx]; ring
    nlinarith
  have hd8 : (d:ℝ) ≤ 8 * x := by rw [hx]; linarith
  have hx3 : 8 ≤ x ^ 3 := by nlinarith
  have hbase : 2 * (E:ℝ) * n' ≤ x ^ 5 := by
    have a1 : 2 * (E:ℝ) * n' ≤ 2 * E * (16 * E * n ^ 2) :=
      mul_le_mul_of_nonneg_left hn'16 (by positivity)
    have a2 : 2 * (E:ℝ) * (16 * E * n ^ 2) = 8 * x ^ 2 := by rw [hx]; ring
    have a3 : 8 * x ^ 2 ≤ x ^ 3 * x ^ 2 := mul_le_mul_of_nonneg_right hx3 (by positivity)
    have a4 : x ^ 3 * x ^ 2 = x ^ 5 := by ring
    linarith
  have hbase0 : (0:ℝ) ≤ 2 * E * n' := by positivity
  have hpowC : (2 * (E:ℝ) * n') ^ C ≤ (x ^ 5) ^ C := Real.rpow_le_rpow hbase0 hbase hC
  have hx5C : (x ^ 5) ^ C = x ^ (5 * C) := by
    rw [← Real.rpow_natCast, ← Real.rpow_mul hx0.le]
    norm_num
  have hxadd : x ^ (5 * C + 11) = x ^ (5 * C) * x ^ (11:ℕ) := by
    rw [Real.rpow_add hx0, ← Real.rpow_natCast]
    norm_num
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hLD : Real.log 2 ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by norm_num) (by linarith)
  have hlogD : Real.log D ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by linarith) (by linarith)
  have hlogD0 : 0 ≤ Real.log (D:ℝ) := Real.log_nonneg hD1
  have hlogw0 : 0 ≤ Real.log (w:ℝ) := Real.log_nonneg hw1R
  have hlogw : Real.log (w:ℝ) ≤ 8 * x ^ 2 := by
    have := Real.log_le_sub_one_of_pos (by linarith : (0:ℝ) < w)
    linarith
  have hlogD' : Real.log (2 * (D':ℝ)) ≤ Real.log 2 + d * Real.log D + n' * Real.log w := by
    have hDd : (0:ℝ) < (D:ℝ) ^ d := pow_pos (by linarith) _
    have hwn : (0:ℝ) < (w:ℝ) ^ n' := pow_pos (by linarith) _
    calc Real.log (2 * (D':ℝ)) ≤ Real.log (2 * ((D:ℝ) ^ d * (w:ℝ) ^ n')) :=
          Real.log_le_log (by linarith) (by linarith)
      _ = Real.log 2 + d * Real.log D + n' * Real.log w := by
          rw [Real.log_mul (by norm_num) (by positivity), Real.log_mul hDd.ne' hwn.ne',
            Real.log_pow, Real.log_pow]
          ring
  have hlogD'0 : 0 ≤ Real.log (2 * (D':ℝ)) := Real.log_nonneg (by linarith)
  set LD := Real.log (2 * (D:ℝ)) with hLDdef
  have t1 : (d:ℝ) * Real.log D ≤ 8 * x * LD :=
    mul_le_mul hd8 hlogD hlogD0 (by positivity)
  have t2 : (n':ℝ) * Real.log w ≤ 4 * x ^ 2 * (8 * x ^ 2) :=
    mul_le_mul hn'x hlogw hlogw0 (by positivity)
  have t2' : 4 * x ^ 2 * (8 * x ^ 2) = 32 * x ^ 4 := by ring
  have hLD1 : 1 ≤ 2 * LD := by linarith
  have hx40 : 0 ≤ 32 * x ^ 4 := by positivity
  have t3 : 32 * x ^ 4 * 1 ≤ 32 * x ^ 4 * (2 * LD) := mul_le_mul_of_nonneg_left hLD1 hx40
  have hx4 : 1 ≤ x ^ 4 := by nlinarith
  have hxx4 : x ≤ x ^ 4 := by nlinarith
  have hx7 : 128 ≤ x ^ 7 := by
    calc (128:ℝ) = 2 ^ 7 := by norm_num
      _ ≤ x ^ 7 := pow_le_pow_left₀ (by norm_num) hx2 7
  have hLD0 : 0 ≤ LD := by linarith
  have s1 : 1 * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hx4 hLD0
  have s2 : x * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hxx4 hLD0
  have tsum : Real.log (2 * (D':ℝ)) ≤ 73 * (x ^ 4 * LD) := by
    have e1 : 8 * x * LD = 8 * (x * LD) := by ring
    have e2 : 32 * x ^ 4 * (2 * LD) = 64 * (x ^ 4 * LD) := by ring
    linarith
  have tfin : Real.log (2 * (D':ℝ)) ≤ x ^ (11:ℕ) * LD := by
    have e : x ^ (11:ℕ) * LD = x ^ 7 * (x ^ 4 * LD) := by ring
    have h0 : 0 ≤ x ^ 4 * LD := by positivity
    have : 73 * (x ^ 4 * LD) ≤ x ^ 7 * (x ^ 4 * LD) :=
      mul_le_mul_of_nonneg_right (by linarith) h0
    rw [e]
    linarith
  rw [hxadd, ← hx5C]
  calc (2 * (E:ℝ) * n') ^ C * Real.log (2 * (D':ℝ)) ≤ (x ^ 5) ^ C * (x ^ (11:ℕ) * LD) :=
        mul_le_mul hpowC tfin hlogD'0 (by positivity)
    _ = (x ^ 5) ^ C * x ^ (11:ℕ) * LD := by ring

private theorem gens_le16 (L : Type) [Field L] [NumberField L] :
    (gens L : ℝ) ≤ 2 * (Module.finrank ℚ L : ℝ) +
      2 * (2 * (Module.finrank ℚ L : ℝ)) * Real.log (2 * ((discr L).natAbs : ℝ)) + 2 := by
  have key := K.numGens 2 L (classNumber L) (by apply Nat.le_mul_of_pos_right; positivity)
  have key0 := K.numGens 2 L 0 (Nat.zero_le _)
  simp only [Nat.cast_zero, Real.log_zero, Nat.cast_ofNat] at key key0
  have hl2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  have hnD : 0 ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    nlinarith
  have hk : (Nat.log 2 (classNumber L) : ℝ) ≤
      4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    rcases Nat.eq_zero_or_pos (classNumber L) with h0 | hpos
    · rw [h0, Nat.log_zero_right, Nat.cast_zero]
      exact hnD
    · have hp : 2 ^ Nat.log 2 (classNumber L) ≤ classNumber L := Nat.pow_log_le_self 2 hpos.ne'
      have hpR : (2:ℝ) ^ Nat.log 2 (classNumber L) ≤ (classNumber L : ℝ) := by exact_mod_cast hp
      have hlog : (Nat.log 2 (classNumber L) : ℝ) * Real.log 2 ≤ Real.log (classNumber L) := by
        rw [← Real.log_pow]
        exact Real.log_le_log (by positivity) hpR
      nlinarith
  show ((2 * Module.finrank ℚ L + Nat.log 2 (classNumber L) + 2 : ℕ) : ℝ) ≤ _
  push_cast
  linarith

set_option maxHeartbeats 800000 in
theorem UpperTheory.V.ZK.sNum_pair16 :
    UpperTheory.V.ZK.SNumPair16 := by
  unfold UpperTheory.V.ZK.SNumPair16
  intro hFew hCount hSha hLayer hTors
  obtain ⟨C0, hC0⟩ := hTors
  refine ⟨5 * (max C0 9 + 1) + 11, ?_⟩
  unfold UpperTheory.V.ZK.ShaK
  intro l hl L i1 i2 hTC hMu E hE
  obtain ⟨k, rfl⟩ : ∃ k, E = k + 1 := ⟨E - 1, by omega⟩
  obtain ⟨L', i3, i4, c, d, hTC', hTop, hlc, hcp, hdeg, hd, hlc2, hdisc, hsha⟩ :=
    hLayer L l (k + 1) hMu hE
  have hl1 : 1 < l := hl.out.one_lt
  have hB : ∀ (F : Type) [Field F] [NumberField F] [Algebra L' F] (ν : ℕ) (ζ : (𝓞 F)ˣ)
      (γ : Gal(F/L')), Lay l c ν ζ γ →
      Finite ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ∧
        Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ≤
          tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
            l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
              c + (k + 1).factorization l) := by
    intro F i5 i6 i7 ν ζ γ hLay
    have hfew := hFew L' F hTC' l c ν k ζ γ hLay (by omega) (by omega)
    have hcnt := hCount L' F hTC' l c ν (k + 1) _ _ ζ γ hLay (by omega) hfew
    refine ⟨hcnt.1, ?_⟩
    have hP : 0 < (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := pow_pos (pow_pos (by omega) _) _
    have h2 := hcnt.2
    apply le_of_mul_le_mul_left _ hP
    calc _ = Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) *
          (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := mul_comm _ _
      _ ≤ _ := h2
      _ = _ := by ring
  obtain ⟨s, hs, hlsB⟩ := hSha L' hTC' l c (k + 1) _ hTop hE hB
  have hne : LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ) ≠ ⊤ := by
    intro htop
    rw [htop, hs] at hsha
    exact ENat.coe_ne_top s (top_le_iff.mp hsha)
  refine ⟨(LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat, (ENat.coe_toNat hne).symm, ?_⟩
  have hs0 : (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat ≤ s := by
    have h := hsha
    rw [← ENat.coe_toNat hne, hs] at h
    exact_mod_cast h
  set s0 := (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat with hs0def
  set T1 := tc L' (4 * k + 10) (2 * k + 3) with hT1
  set T2 := tc L' (4 * k + 10) (2 * k + 2) with hT2
  set bN := 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) with hbN
  set fN := (k + 1).factorization l with hfN
  set g := gens L' with hg
  set X := (bN + fN) * g + c + fN with hX
  have hlsB' : l ^ s ≤ T1 * T2 * l ^ X := hlsB
  have hBpos : 1 ≤ T1 * T2 * l ^ X := le_trans (Nat.one_le_pow _ _ (by omega)) hlsB'
  have hT1ne : T1 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hT2ne : T2 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hlR : (1:ℝ) < l := by exact_mod_cast hl1
  have hl0R : (0:ℝ) < l := by linarith
  have hlog0 : 0 < Real.log (l:ℝ) := Real.log_pos hlR
  have hlogs : (s:ℝ) * Real.log l ≤ Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
    have hT1R : (0:ℝ) < T1 := by exact_mod_cast Nat.pos_of_ne_zero hT1ne
    have hT2R : (0:ℝ) < T2 := by exact_mod_cast Nat.pos_of_ne_zero hT2ne
    calc (s:ℝ) * Real.log l = Real.log ((l:ℝ) ^ s) := by rw [Real.log_pow]
      _ ≤ Real.log ((T1:ℝ) * T2 * (l:ℝ) ^ X) := by
          apply Real.log_le_log (pow_pos hl0R _)
          exact_mod_cast hlsB'
      _ = Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
          rw [Real.log_mul (by positivity) (pow_pos hl0R _).ne', Real.log_mul hT1R.ne' hT2R.ne',
            Real.log_pow]
  have hTpair := hC0 L' hTC' (k + 1) hE
  rw [show 4 * (k + 1) + 6 = 4 * k + 10 by ring,
    show 2 * (k + 1) + 1 = 2 * k + 3 by ring,
    show 2 * (k + 1) = 2 * k + 2 by ring] at hTpair
  unfold kBound at hTpair
  have hcard := InfinitePlace.card_add_two_mul_card_eq_rank L'
  have hn'big : 2 * k + 4 ≤ Module.finrank ℚ L' := by omega
  have hc0 : c ≠ 0 := by
    intro h
    rw [h, pow_zero] at hlc
    omega
  have hcl : c < l ^ c := Nat.lt_pow_self hl1
  have hll : l ≤ l ^ c := Nat.le_self_pow hc0 l
  have hf : fN < k + 1 := Nat.factorization_lt l (by omega)
  have hDne := NumberField.discr_ne_zero L'
  have hD'1 : 1 ≤ (discr L').natAbs := Int.natAbs_pos.mpr hDne
  have hD'1R : (1:ℝ) ≤ ((discr L').natAbs : ℝ) := by exact_mod_cast hD'1
  have hgl := gens_le16 L'
  set n' : ℝ := (Module.finrank ℚ L' : ℝ) with hn'
  set Y := Real.log (2 * ((discr L').natAbs : ℝ)) with hY
  set u : ℝ := 2 * ((k + 1 : ℕ) : ℝ) * n' with hu
  have hkR : (0:ℝ) ≤ k := Nat.cast_nonneg k
  have hn'bigR : 2 * (k:ℝ) + 4 ≤ n' := by rw [hn']; exact_mod_cast hn'big
  have hk1 : ((k + 1 : ℕ) : ℝ) = k + 1 := by push_cast; ring
  have hu' : u = 2 * ((k:ℝ) + 1) * n' := by rw [hu, hk1]
  have hn'0 : (0:ℝ) ≤ n' := by linarith
  have hn'u : 2 * n' ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_right (show (2:ℝ) ≤ 2 * ((k:ℝ) + 1) by linarith) hn'0
    linarith
  have hku : 2 * ((k:ℝ) + 1) ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_left (show (1:ℝ) ≤ n' by linarith)
      (show (0:ℝ) ≤ 2 * ((k:ℝ) + 1) by positivity)
    linarith
  have hu2 : 2 ≤ u := by linarith
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hY2 : Real.log 2 ≤ Y := Real.log_le_log (by norm_num) (by linarith)
  have hYh : 1 / 2 ≤ Y := by linarith
  have hcR : (c:ℝ) ≤ 2 * n' := by
    have : c ≤ 2 * Module.finrank ℚ L' := by omega
    rw [hn']; exact_mod_cast this
  have hlR2 : (l:ℝ) ≤ 2 * n' := by
    have : l ≤ 2 * Module.finrank ℚ L' := le_trans hll hlc2
    rw [hn']; exact_mod_cast this
  have hfR : (fN:ℝ) ≤ k + 1 := by
    have : fN ≤ k + 1 := hf.le
    exact_mod_cast this
  have htl : Real.log l ≤ u := by
    have := Real.log_le_sub_one_of_pos hl0R
    linarith
  have hbR : (bN:ℝ) = 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) := by rw [hbN]; push_cast; ring
  have hb0 : (0:ℝ) ≤ bN := Nat.cast_nonneg _
  have hbb : (bN:ℝ) ≤ u + 2 * u ^ 2 := by
    rw [hbR]
    have a1 : (2 * (k:ℝ) + 3) * (c + (2 * k + 3)) ≤ n' * (3 * n') :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by linarith)
    have a2 : 2 * (k:ℝ) + 2 ≤ u := by linarith
    have a3 : n' * (3 * n') ≤ 2 * u ^ 2 := by
      have h4 : (2 * n') ^ 2 ≤ u ^ 2 := pow_le_pow_left₀ (by positivity) hn'u 2
      have e1 : (2 * n') ^ 2 = 4 * n' ^ 2 := by ring
      have e2 : n' * (3 * n') = 3 * n' ^ 2 := by ring
      have h5 : 0 ≤ n' ^ 2 := by positivity
      linarith
    linarith
  have hg0 : (0:ℝ) ≤ g := Nat.cast_nonneg _
  have hgg : (g:ℝ) ≤ u + 2 * u * Y + 2 := by
    have hY0 : 0 ≤ Y := by linarith
    have : 2 * (2 * n') * Y ≤ 2 * u * Y := by
      have := mul_le_mul_of_nonneg_right hn'u hY0
      linarith
    have hgl' : (g:ℝ) ≤ 2 * n' + 2 * (2 * n') * Y + 2 := hgl
    linarith
  have hc0R : (0:ℝ) ≤ c := Nat.cast_nonneg _
  have hcu : (c:ℝ) ≤ u := by linarith
  have hf0 : (0:ℝ) ≤ fN := Nat.cast_nonneg _
  have hfu : (fN:ℝ) ≤ u := by linarith
  have hP := num_poly16 u Y (Real.log l) bN g c fN hu2 hYh htl hb0 hbb hg0 hgg hc0R hcu hf0 hfu
  have hXR : (X:ℝ) = ((bN:ℝ) + fN) * g + c + fN := by rw [hX]; push_cast; ring
  have hP' : (X:ℝ) * Real.log l ≤ u ^ 9 * Y := by rw [hXR]; exact hP
  have ht : (s:ℝ) * Real.log l ≤ 2 * Real.exp (u ^ C0 * Y) + (X:ℝ) * Real.log l := by
    have e1 : Real.log (T1:ℝ) + Real.log (T2:ℝ) ≤ 2 * Real.exp (u ^ C0 * Y) := hTpair
    linarith
  have h3 := num_three16 C0 u Y ((s:ℝ) * Real.log l) hu2 hYh _ hP' ht
  have hs0R : (s0:ℝ) * Real.log l ≤ (s:ℝ) * Real.log l :=
    mul_le_mul_of_nonneg_right (by exact_mod_cast hs0) hlog0.le
  have hC : 0 ≤ max C0 9 + 1 := by
    have := le_max_right C0 9
    linarith
  have hn1 : 1 ≤ Module.finrank ℚ L := Module.finrank_pos
  have hD1 : 1 ≤ (discr L).natAbs := Int.natAbs_pos.mpr (NumberField.discr_ne_zero L)
  have hdown := num_down16 (max C0 9 + 1) hC (k + 1) (Module.finrank ℚ L) (discr L).natAbs
    (Module.finrank ℚ L') (discr L').natAbs d (l ^ c) hE hn1 hD1 hD'1 hdeg (by omega) hd hlc2 hdisc
  have hmid : Real.exp (u ^ (max C0 9 + 1) * Y) =
      kBound (max C0 9 + 1) (k + 1) (Module.finrank ℚ L') (discr L').natAbs := by
    unfold kBound
    rfl
  linarith

namespace UpperTheory.V.ZK
theorem sNum_original16 : SNum := by
  intro hFew hCount hSha hLayer hTors
  exact sNum_pair16 hFew hCount hSha hLayer (torsPair_of_STors16 hTors)

theorem sha_of_bOdd16 (hB : BOdd) : ∃ C : ℝ, ShaK C :=
  sNum_pair16
    (LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
      (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc)
      sPhi
      (sClassOf sChain sPrism sPrismMul sZc
        LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
        LateralTheory.Fin.SStein.intersectionNumber_baseChange)
      (sUpperOf sChain hB)
      LateralTheory.Fin.SDetect.intersectionNumber_baseChange)
    sCount PositivityTheory.QuaternionShaBounds.sSha
    LateralTheory.Fin.SLayer.intersectionNumber_baseChange (torsPair_of_STors16 sTors)

end UpperTheory.V.ZK

namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_pair16 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_sha41 hH
  first
  | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd16, _root_.PositivityTheory.KB.bOdd15]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact _root_.UpperTheory.V.ZK.sha_of_bOdd16 _root_.PositivityTheory.KB.bOdd15
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.ZK.sNum limit 2000
rh_scan UpperTheory.V.ZK.sTors limit 2000
rh_scan UpperTheory.V.ZK.sNum_pair16 limit 2000
rh_scan UpperTheory.V.ZK.sha_of_bOdd16 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_pair16 limit 2000
rh_prune UpperTheory.V.ZK.sNum_pair16 as UpperTheory.V.ZK.SNumPairPruned16
#print axioms UpperTheory.V.ZK.sNum
#print axioms UpperTheory.V.ZK.sTors
#print axioms UpperTheory.V.ZK.torsPair_of_STors16
#print axioms UpperTheory.V.ZK.sNum_pair16
#print axioms UpperTheory.V.ZK.sNum_original16
#print axioms UpperTheory.V.ZK.sha_of_bOdd16
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_pair16

end
