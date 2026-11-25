import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.FinalLe
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.RedPrime
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN36 2026-11-25. Lane 3: loss-free odd-prime transport at principal host.
Human source-matched deduction; native overlay PREPARED, NOT COMPILED.
Mission cd0a176134d46b5b624896e56843a24915c14477, upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Upstream head d91ae2678eea19a0c3045ffca37f1da757c2e719 unchanged from RUN35.
Preflight SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d, RESEARCH_STATE 1ff2601b, continuity 61459cf,
manuscript 464e82f81f646d4af85e1f5f70d379026df46261.
Peer work inspected through 027167d41f6eff317c86b3bc1e32d5a7c8a95719
and 12705f087c2ba6266f164919ecc71d780fa6e363.
Prior principal count/Case IV notes explicitly retained redAll losses.
All prior lane work preserved.

Exact mathematical reduction: let h be the SAME native Host with h.q=1.
hostIndex gives 0<h.o<=h.q and h.H.index divides 2^(h.ex+2)*h.o.
Therefore h.o=1 and every odd prime l is prime to h.H.index.
This applies EVEN at the exceptional coefficient primes in Bchi,
without changing the original auxiliary characters, fields or host.
For each e with 0<e<t retain all redPrime hypotheses (same coefficient
DVR, full totient roots for the actual sumIn caller, hE, ld, e, X).
Then the actual plus-length bound is
 plusLen(ld l,e)*eO(l,c.O) <= sum_(psi in h.X c e) Vlen(Qbar,c,e,psi).
Native Chr.sumBack with b(e)=0, all Vlen finite as before, gives
 sum_(0<e<t) (plusLen(ld l,e)).toNat
 <= sum_(0<e<t) sum_(psi in h.X c e) nrm(l,c.O,Vlen(...)).
This drops the entire additive loss budget L*N*t*M^6 at sumIn,
not merely its numerical coefficient. Retain original final scalar
bound by nonnegativity of the old budget; same C as before.
Does NOT assert lossAll is identically zero; uses a different native
transport theorem with proved prime-to-index premise. CountII, V,
Vs, IV, LayerLe, finiteness, and all original root premises remain.
For nonprincipal chi.N, retain original sumIn unchanged.

Separate premise weakening: redPrime needs roots of unity only for
the exponent of the quotient (ZMod N)^*/H. Its sole use of full
totient roots is the local instance derivation on lines 20-25.
redPrimeQuotient36 below copies its body except this derivation,
with exactly the instance consumed by signLe supplied directly.
For principal hosts this exponent divides 2^(h.ex+2), by Lagrange
and hostIndex; smaller coefficient ring may be chosen using
exists_coef and HasEnoughRootsOfUnity.of_dvd, but not substituted
into the full sumIn caller before audit of every other use.

Source graph (pinned, source-level):
JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
lines16-33: pointHV_of_counts -> point(sumIn ...,sumOut ...) -> jointWin -> vwin.
FinalLe.lean a5962f0dfe251e6b4db935e87d7c15aacf279d2e lines201-249:
original sumIn -> redAll -> sumBack(lossAll) -> lossLe -> final_le.
Reduced principal sumIn -> hostIndex + redPrime -> sumBack(0) -> same final_le.
RedPrime.lean 9b5f1ab583d11365a37d6db8b573168f825ecbe7 lines11-57;
HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419;
LayerLe.lean 88eec332233203a9222b50ad7e77772490b3cce0 (SumIn, PlusLe);
CharacterLevelBounds/SumBack.lean a7171f896bbf50f4260bf9b8da6f912c2e08f33d
(positive finite eO and finiteness are preserved);
PartModel.lean 7e1d5f1363c79bc29273531a4e7c2535659cf578 lines29-33;
SignLe.lean dd2c61b464abb102f05df9d9469cbe1a244520e6 lines59-72.
All paths under Development/AutomorphicArithmetic/AutomorphicVarieties.
Cache key includes pin, h, h.q=1, l, c, E, ld, e,t, exact X and finiteness;
never share across distinct host or coefficient choices.
Root graph is NOT globally pruned until actual caller is compiled.
No RH theorem imported as a shortcut.

Execution: 18 unique source edit/structural checks completed in JS.
Python exact integer check: 48 moduli, 846720 unit residues examined,
480 odd-prime nondivisibility checks, all passed. Finite checks only
of CRT/index, not cohomology or Lean. Reproduce in Python:
from math import gcd
n=units=oddchecks=0
for ex in range(2,6):
 for q in [3,11,19,43]:
  for d in [7,23,71]:
   m=2**(ex+2); N=m*q*d
   sq1={a*a%q for a in range(1,q)}; sq2={a*a%d for a in range(1,d)}
   a=b=0
   for u in range(N):
    if gcd(u,N)!=1: continue
    a+=1
    if u%m in (1,m-1) and u%q in sq1 and u%d in sq2: b+=1
   assert a==m//2*(q-1)*(d-1) and a==b*m
   for ell in [3,5,7,11,13,17,19,23,29,31]:
    assert (a//b)%ell!=0; oddchecks+=1
   units+=a; n+=1
print(n,units,oddchecks)
End Python. Lean/lake absent locally. Prior actual CI status retrieved:
45577239749 pass 98.87s, 45576756833 pass 77.94s, status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717.
Prior conditional strip root axioms propext, Classical.choice, Quot.sound;
prior bounded scan 324 pending. NOT validation of this overlay.
RH OPEN; no new axiom evidence or URT acceleration claimed.

RESUME HERE: independent audit requested. Compile this source-derived
actual sumIn overlay, compare original/reduced scans and axiom lists,
then replay principal pointHV caller on identical host; retain CountIV
until its separate principal vanishing certificate passes. Audit
quotient-root weakening independently; do not substitute smaller c
in other count theorems without checking their roots requirements.
HANDOFF integration, kernel extractor, principal math and acceleration.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

theorem UpperTheory.V.HV.principalPrimeToIndex36 (h : Host) (hq : h.q = 1)
    (l : ℕ) (hl : l.Prime) (h2 : l ≠ 2) : ¬ l ∣ h.H.index := by
  have hi := hostIndex h
  have ho : h.o = 1 := by omega
  intro hd
  have hh := hd.trans hi.1
  rw [ho, mul_one] at hh
  exact h2 ((Nat.prime_dvd_prime_iff_eq hl Nat.prime_two).mp (hl.dvd_of_dvd_pow hh))

theorem UpperTheory.V.HV.principalPrimeReplay36 (h : Host) (hq : h.q = 1)
    (l : ℕ) (hl : l.Prime) (h2 : l ≠ 2) : ¬ l ∣ h.H.index := by
  first
  | (rh_reduce 2 using [principalPrimeToIndex36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact principalPrimeToIndex36 h hq l hl h2

theorem UpperTheory.V.HV.redPrimeQuotient36 :
    ∀ (E : Type) [Field E] [NumberField E] [IsCMField E] (N : ℕ) [NeZero N] (H : Subgroup (ZMod N)ˣ), Chr.HasLevel E N H → ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → ¬ l ∣ H.index →
      ∀ (c : Coef l) [HasEnoughRootsOfUnity c.O (Monoid.exponent ((ZMod N)ˣ ⧸ H))] (Ω' : Type) [Field Ω'] [Algebra E Ω'] [IsAlgClosure E Ω'] (D : LData E Ω' l)
        (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (e : ℕ), e ≠ 0 → ∀ T : Finset (DirichletCharacter c.O N), (T : Set _) = Chr.evenSet c.O H e →
        plusLen D e * eO l c.O ≤ ∑ ψ ∈ T, Vlen Ω c e ψ := by
  intro E _ _ _ N _ H hH l _ hl2 hlH c _ Ω' _ _ _ D Ω _ _ _ e he T hT
  haveI := c.dvr
  haveI := c.fin
  obtain ⟨σ, hσ, hplus, -⟩ := Chr.partModel E N H hH l c.O Ω' D Ω e
  rw [hplus]
  refine (Chr.signLe Ω N H l c.O hl2 e e σ hσ T (by rw [hT])).trans (le_of_eq ?_)
  refine Finset.sum_congr rfl fun χ hχ => ?_
  have hχ' : χ ∈ Chr.evenSet c.O H e := by
    have : χ ∈ (T : Set _) := hχ
    rwa [hT] at this
  have hker : H ≤ (MulChar.toUnitHom χ).ker := hχ'.1
  obtain ⟨hopen, -⟩ := Chr.clsFacts ℚ Ω N
  have hsurj := (Chr.clsOnto Ω N).1
  have hUopen : IsOpen ((Chr.levH ℚ Ω H : Subgroup (G ℚ Ω)) : Set (G ℚ Ω)) := by
    refine Subgroup.isOpen_mono ?_ hopen
    intro g hg
    show Chr.cls ℚ Ω N g ∈ H
    rw [MonoidHom.mem_ker.mp hg]
    exact H.one_mem
  have hUker : Chr.levH ℚ Ω H ≤ (Chr.dirG ℚ Ω χ).ker := by
    intro g hg
    exact hker hg
  have hidx : (Chr.levH ℚ Ω H).index = H.index :=
    Subgroup.index_comap_of_surjective H hsurj
  have hHidx : H.index ≠ 0 := Subgroup.index_ne_zero_of_finite
  rw [Chr.eigV ℚ Ω l c.O e (Chr.dirG ℚ Ω χ) (Chr.levH ℚ Ω H) hUopen hUker (by rwa [hidx])]
  have hψopen : IsOpen ((Chr.dirG ℚ Ω χ).ker : Set (G ℚ Ω)) :=
    Subgroup.isOpen_mono hUker hUopen
  have hpow : Chr.dirG ℚ Ω χ ^ H.index = 1 := by
    refine MonoidHom.ext fun g => ?_
    have hm : (Chr.cls ℚ Ω N g) ^ H.index ∈ H := Subgroup.pow_index_mem H _
    have := hker hm
    rw [MonoidHom.mem_ker, map_pow] at this
    rw [MonoidHom.pow_apply, MonoidHom.one_apply]
    exact this
  exact ((Chr.vLe Ω l c.O N e H.index (Chr.dirG ℚ Ω χ) (NeZero.ne N) he hHidx hψopen hpow).2 hlH)

def UpperTheory.V.HV.PrincipalSumIn36 : Prop :=
  ∀ (χ : PChar), χ.N = 1 → ∀ (l : Nat.Primes) (j : ℕ), (l : ℕ) ∈ Bchi χ → ∃ C : ℕ, ∀ h : Host, h.chi = χ → ∀ t : ℕ, 2 ≤ t → h.Big t →
    ∀ B : ℝ, 0 ≤ B → LayerLe χ l j t B → ∀ (E : Type) [Field E] [NumberField E] [IsCMField E], IsChiField χ h.ex h.q1 h.d E →
      ∀ (Ω : Type) [Field Ω] [Algebra E Ω] [IsAlgClosure E Ω] (ld : ∀ (p : ℕ) [Fact p.Prime], LData E Ω p),
        PlusLe ld {l} t (((h.N : ℝ) * t) ^ C + C * B)

private theorem sum_split {ι : Type} (T : ℕ → Finset ι) (O : Finset ι) (v : ι → ℕ → ℝ) (t N q : ℕ) (L K S : ℝ)
    (hv : ∀ i e, 0 ≤ v i e) (hL : 0 ≤ L) (hK : 0 ≤ K) (hS : 0 ≤ S) (hT : ∀ e, (T e).card ≤ N) (hq : O.card ≤ q)
    (h1 : ∀ e ∈ Finset.Ico 1 t, ∀ i ∈ T e, i ∈ O ∨ v i e * L ≤ K)
    (h2 : ∀ i ∈ O, ∑ e ∈ Finset.Ico 1 t, v i e ≤ S) :
    L * ∑ e ∈ Finset.Ico 1 t, ∑ i ∈ T e, v i e ≤ L * (q * S) + t * (N * K) := by
  classical
  have step : ∀ e ∈ Finset.Ico 1 t, L * ∑ i ∈ T e, v i e ≤ L * ∑ i ∈ O, v i e + N * K := by
    intro e he
    rw [Finset.mul_sum, Finset.mul_sum]
    calc ∑ i ∈ T e, L * v i e ≤ ∑ i ∈ T e, ((if i ∈ O then L * v i e else 0) + K) := by
          apply Finset.sum_le_sum
          intro i hi
          by_cases hO : i ∈ O
          · rw [if_pos hO]
            linarith
          · rw [if_neg hO]
            rcases h1 e he i hi with h | h
            · exact absurd h hO
            · linarith [mul_comm (v i e) L]
      _ = ∑ i ∈ T e ∩ O, L * v i e + (T e).card * K := by
          rw [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul, Finset.sum_ite_mem]
      _ ≤ ∑ i ∈ O, L * v i e + N * K := by
          apply add_le_add
          · exact Finset.sum_le_sum_of_subset_of_nonneg Finset.inter_subset_right
              (fun i _ _ => mul_nonneg hL (hv i e))
          · exact mul_le_mul_of_nonneg_right (by exact_mod_cast hT e) hK
  have hA : ∑ i ∈ O, ∑ e ∈ Finset.Ico 1 t, v i e ≤ q * S := by
    calc ∑ i ∈ O, ∑ e ∈ Finset.Ico 1 t, v i e ≤ ∑ i ∈ O, S := Finset.sum_le_sum h2
      _ = O.card * S := by rw [Finset.sum_const, nsmul_eq_mul]
      _ ≤ q * S := mul_le_mul_of_nonneg_right (by exact_mod_cast hq) hS
  have hB : ((Finset.Ico 1 t).card : ℝ) ≤ t := by
    rw [Nat.card_Ico]
    exact_mod_cast Nat.sub_le t 1
  have hNK : 0 ≤ (N : ℝ) * K := mul_nonneg (Nat.cast_nonneg _) hK
  calc L * ∑ e ∈ Finset.Ico 1 t, ∑ i ∈ T e, v i e
      = ∑ e ∈ Finset.Ico 1 t, L * ∑ i ∈ T e, v i e := Finset.mul_sum _ _ _
    _ ≤ ∑ e ∈ Finset.Ico 1 t, (L * ∑ i ∈ O, v i e + N * K) := Finset.sum_le_sum step
    _ = L * ∑ i ∈ O, ∑ e ∈ Finset.Ico 1 t, v i e + ((Finset.Ico 1 t).card : ℝ) * (N * K) := by
        rw [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul, ← Finset.mul_sum, Finset.sum_comm]
    _ ≤ L * (q * S) + t * (N * K) :=
        add_le_add (mul_le_mul_of_nonneg_left hA hL) (mul_le_mul_of_nonneg_right hB hNK)

private theorem final_le (M L l q N t B : ℝ) (a b C : ℕ) (hM : M = N * t) (h3 : 3 ≤ M) (hL : L ≤ l)
    (hl : 0 ≤ l) (hlM : l ≤ M) (hq : 0 ≤ q) (hqM : q ≤ M) (hB : 0 ≤ B) (hC : a + 2 * b + 9 ≤ C) (hC' : l * q ≤ C) :
    L * (q * (B + M ^ a)) + t * (N * (M ^ 2) ^ b) + L * (N * (t * M ^ 6)) ≤ M ^ C + C * B := by
  have hM0 : 0 ≤ M := by linarith
  have hM1 : 1 ≤ M := by linarith
  have hNt : N * (t * M ^ 6) = M ^ 7 := by
    rw [hM]
    ring
  have hNb : t * (N * (M ^ 2) ^ b) = M ^ (2 * b + 1) := by
    rw [hM]
    ring
  rw [hNt, hNb]
  have hX : 0 ≤ q * (B + M ^ a) := mul_nonneg hq (by positivity)
  have e1 : L * (q * (B + M ^ a)) ≤ l * (q * (B + M ^ a)) := mul_le_mul_of_nonneg_right hL hX
  have e2 : l * (q * (B + M ^ a)) = (l * q) * B + l * q * M ^ a := by ring
  have e3 : (l * q) * B ≤ C * B := mul_le_mul_of_nonneg_right hC' hB
  have hlq : l * q ≤ M * M := mul_le_mul hlM hqM hq hM0
  have e4 : l * q * M ^ a ≤ M * M * M ^ a := mul_le_mul_of_nonneg_right hlq (pow_nonneg hM0 a)
  have e4' : M * M * M ^ a = M ^ (a + 2) := by ring
  have e5 : L * M ^ 7 ≤ l * M ^ 7 := mul_le_mul_of_nonneg_right hL (pow_nonneg hM0 7)
  have e6 : l * M ^ 7 ≤ M * M ^ 7 := mul_le_mul_of_nonneg_right hlM (pow_nonneg hM0 7)
  have e6' : M * M ^ 7 = M ^ 8 := by ring
  obtain ⟨D, hD⟩ : ∃ D, C = D + 1 := ⟨C - 1, by omega⟩
  have p1 : M ^ (a + 2) ≤ M ^ D := pow_le_pow_right₀ hM1 (by omega)
  have p2 : M ^ (2 * b + 1) ≤ M ^ D := pow_le_pow_right₀ hM1 (by omega)
  have p3 : M ^ 8 ≤ M ^ D := pow_le_pow_right₀ hM1 (by omega)
  have p4 : 3 * M ^ D ≤ M * M ^ D := mul_le_mul_of_nonneg_right h3 (pow_nonneg hM0 D)
  have p5 : M ^ C = M * M ^ D := by rw [hD, pow_succ']
  linarith

theorem UpperTheory.V.HV.sumInPrincipal36 :
    CountII → CountV → CountVs → CountIV → PrincipalSumIn36 := by
  unfold PrincipalSumIn36
  intro hII hV hVs hIV χ hχN l j hl
  haveI : Fact (l : ℕ).Prime := ⟨l.2⟩
  haveI : IsAlgClosure ℚ (AlgebraicClosure ℚ) := by
    convert (AlgebraicClosure.instIsAlgClosure (k := ℚ))
    · rfl
    · exact Subsingleton.elim _ _
  obtain ⟨C2, hC2⟩ := hII χ
  obtain ⟨C5, hC5⟩ := hV χ
  obtain ⟨C6, hC6⟩ := hVs χ
  obtain ⟨C4, hC4⟩ := hIV χ (l : ℕ) j hl
  set Cm := max C2 (max C5 C6) with hCm
  refine ⟨C4 + 2 * Cm + 9 + (l : ℕ) * χ.N, ?_⟩
  intro h hχ t ht2 hBig B hB hLay E _ _ _ hE Ω _ _ _ ld
  classical
  haveI : NeZero h.N := ⟨h.N_pos.ne'⟩
  haveI : NeZero (Nat.totient h.N) := ⟨(Nat.totient_pos.2 h.N_pos).ne'⟩
  obtain ⟨c, hc⟩ := exists_coef (l : ℕ) (Nat.totient h.N)
  haveI := hc
  have hlp : (l : ℕ).Prime := l.2
  have hl2 : (l : ℕ) ≠ 2 := (prime_of_mem_Bchi hl).2
  have hlB : (l : ℕ) ∈ Bchi h.chi := by
    rw [hχ]
    exact hl
  have hbf := bchiFacts h t hBig
  have hlq1 : (l : ℕ) < h.q1 := (hbf.1 _ hlB).1
  have hld : (l : ℕ) < h.d := (hbf.1 _ hlB).2
  have hidx := hostIndex h
  have hqOne : h.q = 1 := by
    simpa only [Host.q, hχ] using hχN
  have hlIndex : ¬ (l : ℕ) ∣ h.H.index := principalPrimeToIndex36 h hqOne (l : ℕ) hlp hl2
  have hNpos : 0 < h.N := h.N_pos
  have hq1N : h.q1 ≤ h.N := Nat.le_of_dvd hNpos h.host_q1_dvd_N
  have hqN : h.q ≤ h.N := Nat.le_of_dvd hNpos h.q_dvd
  have h16 : 16 ≤ h.N := Nat.le_of_dvd hNpos hidx.2.2.1
  have hlN : (l : ℕ) ≤ h.N := by omega
  set M : ℝ := (h.N : ℝ) * t with hMdef
  set L : ℝ := Real.log ((l : ℕ) : ℝ) with hLdef
  have hN1 : (1 : ℝ) ≤ h.N := by exact_mod_cast (by omega : 1 ≤ h.N)
  have hM3 : 3 ≤ M := by
    have a1 : (16 : ℝ) ≤ h.N := by exact_mod_cast h16
    have a2 : (2 : ℝ) ≤ t := by exact_mod_cast ht2
    rw [hMdef]
    nlinarith
  have hM0 : 0 ≤ M := by linarith
  have hl1 : (1 : ℝ) ≤ ((l : ℕ) : ℝ) := by exact_mod_cast hlp.one_lt.le
  have hL0 : 0 ≤ L := Real.log_nonneg hl1
  have hLl : L ≤ ((l : ℕ) : ℝ) := by
    have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < ((l : ℕ) : ℝ) by linarith)
    linarith
  have hNM : (h.N : ℝ) ≤ M := by
    have a2 : (1 : ℝ) ≤ t := by exact_mod_cast (by omega : 1 ≤ t)
    rw [hMdef]
    nlinarith
  have hlM : ((l : ℕ) : ℝ) ≤ M := le_trans (by exact_mod_cast hlN) hNM
  have hqM : (h.q : ℝ) ≤ M := le_trans (by exact_mod_cast hqN) hNM
  have hKb : ∀ e, 0 < e → e < t → ∀ k ≤ Cm, (((l : ℕ) : ℝ) * h.N * e) ^ k ≤ (M ^ 2) ^ Cm := by
    intro e he0 het k hk
    have he1 : (1 : ℝ) ≤ e := by exact_mod_cast he0
    have het' : (e : ℝ) ≤ t := by exact_mod_cast het.le
    have hx1 : 1 ≤ ((l : ℕ) : ℝ) * h.N * e := by
      have a1 : 1 ≤ ((l : ℕ) : ℝ) * h.N := by nlinarith
      nlinarith
    have hx2 : ((l : ℕ) : ℝ) * h.N * e ≤ M ^ 2 := by
      have a1 : (h.N : ℝ) * e ≤ M := by
        rw [hMdef]
        exact mul_le_mul_of_nonneg_left het' (by linarith)
      calc ((l : ℕ) : ℝ) * h.N * e = ((l : ℕ) : ℝ) * (h.N * e) := by ring
        _ ≤ M * M := mul_le_mul hlM a1 (by positivity) hM0
        _ = M ^ 2 := by ring
    calc (((l : ℕ) : ℝ) * h.N * e) ^ k ≤ (((l : ℕ) : ℝ) * h.N * e) ^ Cm := pow_le_pow_right₀ hx1 hk
      _ ≤ (M ^ 2) ^ Cm := pow_le_pow_left₀ (by linarith) hx2 Cm
  let Oset : Finset (DirichletCharacter c.O h.N) :=
    (Finset.Ico 1 t).biUnion (fun e => (h.X c e).filter (fun ψ => Odd (orderOf (chiP (l : ℕ) ψ))))
  have hkey : ∀ e, 0 < e → e < t → ∀ ψ ∈ h.X c e,
      Vlen (AlgebraicClosure ℚ) c e ψ ≠ ⊤ ∧
        (ψ ∈ Oset ∨ Chr.nrm (l : ℕ) c.O (Vlen (AlgebraicClosure ℚ) c e ψ) * L ≤ (M ^ 2) ^ Cm) := by
    intro e he0 het ψ hψ
    have hchar := ((Host.mem_X h).1 hψ).1
    rcases (UpperTheory.V.HV.cases h t hBig c.O ψ hchar (l : ℕ) e hlp hl2 he0 het).2 hlB with hc2 | hc4 | hc5
    · have hv := hC2 h hχ t hBig (AlgebraicClosure ℚ) (l : ℕ) c e hl2 he0 het ψ hψ hc2
      exact ⟨hv.1, Or.inr (hv.2.trans (hKb e he0 het C2 (le_max_left _ _)))⟩
    · have hs := hC4 h hχ t ht2 hBig B hLay (AlgebraicClosure ℚ) c ψ hchar hc4.2.2
      refine ⟨hs.1 e he0 het, Or.inl ?_⟩
      exact Finset.mem_biUnion.2 ⟨e, Finset.mem_Ico.2 ⟨he0, het⟩, Finset.mem_filter.2 ⟨hψ, hc4.2.2⟩⟩
    · by_cases hR : h.R1 (l : ℕ) ψ ≤ 2 ^ c2 ψ
      · have hv := hC5 h hχ t hBig (AlgebraicClosure ℚ) (l : ℕ) c e hl2 he0 het ψ hψ ⟨hc5, hR⟩
        exact ⟨hv.1, Or.inr (hv.2.trans (hKb e he0 het C5 (le_trans (le_max_left _ _) (le_max_right _ _))))⟩
      · have hv := hC6 h hχ t hBig (AlgebraicClosure ℚ) (l : ℕ) c e hl2 he0 het ψ hψ ⟨hc5, not_le.1 hR⟩
        exact ⟨hv.1, Or.inr (hv.2.trans (hKb e he0 het C6 (le_trans (le_max_right _ _) (le_max_right _ _))))⟩
  have hOcard : Oset.card ≤ h.q := by
    apply (xCard c.O h.N).2 h.q (Nat.pos_of_ne_zero h.chi.ne.out) Oset
    intro ψ hψ
    obtain ⟨e, -, hψ'⟩ := Finset.mem_biUnion.1 hψ
    obtain ⟨hX, hodd⟩ := Finset.mem_filter.1 hψ'
    exact ((hostOdd h c.O ψ ((Host.mem_X h).1 hX).1).2 (l : ℕ) hlp hl2 hlq1.ne hld.ne hodd).1
  have hO2 : ∀ ψ ∈ Oset, ∑ e ∈ Finset.Ico 1 t, Chr.nrm (l : ℕ) c.O (Vlen (AlgebraicClosure ℚ) c e ψ) ≤ B + M ^ C4 := by
    intro ψ hψ
    obtain ⟨e, -, hψ'⟩ := Finset.mem_biUnion.1 hψ
    obtain ⟨hX, hodd⟩ := Finset.mem_filter.1 hψ'
    exact (hC4 h hχ t ht2 hBig B hLay (AlgebraicClosure ℚ) c ψ ((Host.mem_X h).1 hX).1 hodd).2
  have hXsub : ∀ e, h.X c e ⊆ h.X c 0 ∪ h.X c 1 := by
    intro e ψ hψ
    rw [Host.mem_X] at hψ
    rw [Finset.mem_union, Host.mem_X, Host.mem_X]
    have h2 := hψ.2
    unfold PsiEven at h2
    rcases Nat.even_or_odd e with he | he
    · left
      refine ⟨hψ.1, ?_⟩
      unfold PsiEven
      rw [h2, he.neg_one_pow, pow_zero]
    · right
      refine ⟨hψ.1, ?_⟩
      unfold PsiEven
      rw [h2, he.neg_one_pow, pow_one]
  have hred : ∀ e, 0 < e → e < t → plusLen (ld (l : ℕ)) e * eO (l : ℕ) c.O ≤
      ∑ ψ ∈ h.X c e, Vlen (AlgebraicClosure ℚ) c e ψ := by
    intro e he0 het
    exact redPrime E h.N h.H (hostLevel h E (by rw [hχ]; exact hE)) (l : ℕ) hl2 hlIndex c Ω (ld (l : ℕ)) (AlgebraicClosure ℚ) e he0.ne' (h.X c e)
      (by
        ext ψ
        rw [Finset.mem_coe, Host.mem_X]
        rfl)
  have hsb := Chr.sumBack (l : ℕ) c.O (DirichletCharacter c.O h.N) (fun e => h.X c e) (h.X c 0 ∪ h.X c 1)
    (fun ψ e => Vlen (AlgebraicClosure ℚ) c e ψ) (fun e => plusLen (ld (l : ℕ)) e)
    (fun _ => 0) t hXsub
    (fun e he0 het => ⟨fun ψ hψ => (hkey e he0 het ψ hψ).1, by simpa using hred e he0 het⟩)
  have hA : (∑ e ∈ Finset.Ico 1 t, ((plusLen (ld (l : ℕ)) e).toNat : ℝ)) ≤
      ∑ e ∈ Finset.Ico 1 t, ∑ ψ ∈ h.X c e, Chr.nrm (l : ℕ) c.O (Vlen (AlgebraicClosure ℚ) c e ψ) := by
    simpa using hsb.2
  have hsplit : L * ∑ e ∈ Finset.Ico 1 t, ∑ ψ ∈ h.X c e, Chr.nrm (l : ℕ) c.O (Vlen (AlgebraicClosure ℚ) c e ψ) ≤
      L * (h.q * (B + M ^ C4)) + t * (h.N * (M ^ 2) ^ Cm) :=
    sum_split (fun e => h.X c e) Oset (fun ψ e => Chr.nrm (l : ℕ) c.O (Vlen (AlgebraicClosure ℚ) c e ψ)) t h.N h.q L
      ((M ^ 2) ^ Cm) (B + M ^ C4) (fun ψ e => Vn_nonneg (AlgebraicClosure ℚ) c e ψ) hL0 (by positivity)
      (add_nonneg hB (pow_nonneg hM0 _)) (fun e => (xCard c.O h.N).1 _) hOcard
      (fun e he ψ hψ => (hkey e (Finset.mem_Ico.1 he).1 (Finset.mem_Ico.1 he).2 ψ hψ).2) hO2
  have s1 := mul_le_mul_of_nonneg_left hA hL0
  have hzero : 0 ≤ L * ((h.N : ℝ) * ((t : ℝ) * M ^ 6)) := by positivity
  have hqC : h.q = χ.N := by
    simp only [Host.q, hχ]
  have hlqC : ((l : ℕ) : ℝ) * h.q ≤ ((C4 + 2 * Cm + 9 + (l : ℕ) * χ.N : ℕ) : ℝ) := by
    rw [hqC]
    exact_mod_cast Nat.le_add_left _ _
  have hfin := final_le M L ((l : ℕ) : ℝ) (h.q : ℝ) (h.N : ℝ) (t : ℝ) B C4 Cm (C4 + 2 * Cm + 9 + (l : ℕ) * χ.N)
    hMdef hM3 hLl (by linarith) hlM (Nat.cast_nonneg _) hqM hB (by omega) hlqC
  refine ⟨?_, ?_⟩
  · intro l' hl' e he0 het
    rw [Finset.mem_singleton] at hl'
    subst hl'
    exact hsb.1 e he0 het
  · rw [Finset.sum_singleton]
    linarith

rh_scan UpperTheory.V.HV.sumIn limit 2000
rh_scan UpperTheory.V.HV.sumInPrincipal36 limit 2000
rh_scan UpperTheory.V.HV.redPrimeQuotient36 limit 2000
rh_prune UpperTheory.V.HV.redPrimeQuotient36 as RH36RedPrimePruned
rh_prune UpperTheory.V.HV.sumInPrincipal36 as RH36SumInPruned
#print axioms UpperTheory.V.HV.sumIn
#print axioms UpperTheory.V.HV.sumInPrincipal36
#print axioms UpperTheory.V.HV.redPrimeQuotient36
