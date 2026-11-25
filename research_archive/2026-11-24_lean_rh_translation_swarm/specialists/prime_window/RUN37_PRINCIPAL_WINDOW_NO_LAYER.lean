import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.JointWinOfCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37: PRINCIPAL HEIGHT WINDOW WITHOUT SIMULTANEOUS ODD-PRIME IWASAWA LAYER.
Prepared, NOT compiled. No RH proof. 2026-11-25. Lane 3.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD observed 91b273530883b723ef4422436e0dc3557749325a; do not silently rebase.
Mission blob cd0a176134d46b5b624896e56843a24915c14477. Peers inspected: 1d03f804, bb971bc3, 904a3009, 3f25eb66,
fedd3a7e, f5cc7b7b, 04a29a86, 620547cb, d88dd2af, da4b14d1,
dc06e2cf, 5c0c691c, 22dbf375, 2d051914, 90346486. Prior RUN36 retained.
Prior math commit 9ad1dec5e648ace90c14ae413b802e8f084cb6e2 handled even twists only;
we extend to ALL positive twists, including odd e in the original Oset sum.

Human derivation: for base conductor 1, pK=7, pOne=3, and hStar=1
(Minkowski for Q(sqrt(-7)) gives bound <2); hence Bchi={3,7}.
For l=3 or 7 let F=Q(zeta_l). Its class number is 1:
for 3 Minkowski bound is 2 sqrt(3)/pi<2.
For 7 degree 6, r2=3, |disc|=7^5, Minkowski bound
(4/pi)^3*(6!)/(6^6)*49 sqrt(7) < 125440/26244 <5,
using pi>3 and sqrt(7)<8/3. No integral ideals of norms 2,3,4:
ord_7(2)=3, ord_7(3)=6, and 7 is ramified. Thus every ideal class is principal.

Fix any e>=1. If l-1 divides e, native zOne gives Chr.V=0.
Otherwise write M=QO l O, alpha=cyclotomic^(-e).
Use native local conditions: all inertia and full decomposition over l.
An l-torsion Selmer class has a cocycle valued in M[l]: divide the
coboundary for l times the class by l, possible since M is l-divisible.
On G_F the action on M[l] is trivial. Away from l inertia acts
trivially on full M, so the restricted homomorphism kills inertia.
At a place over l the original cocycle is a local coboundary delta m.
Inertia surjectivity onto (Z/l)^* and l-1 not dividing e supply g
with alpha(g)-1 a unit, forcing l*m=0. Thus the restriction to
G_F intersect D_l vanishes. It is unramified everywhere, and F
is totally imaginary. Global unramified class field theory factors
this homomorphism through the class group, which is trivial.
Inflation-restriction then gives zero since Gal(F/Q) has order l-1,
invertible on M[l]. Compactness and discrete l-primary torsion
imply each class is killed by a power of l; hence the whole Selmer
group is zero. This uses classical class field theory and cyclotomic
inertia surjectivity, not RH. Native Chr.V'_le_V gives Vlen=0.
Source-matched human reasoning, NOT a Lean proof of this new lemma.

For every exceptional l in Bchi at the SAME principal host h,
HostOdd and BchiFacts imply every psi of odd order chiP has conductor
dividing 1, hence is trivial. Therefore Vlen=0 for every positive e,
even the full Oset sum without parity restriction.
Direct sumIn reduction: set M=h.N*t, b=max(C2,C5,C6).
Retain CountII,V,Vs. Each nonzero term has
log(l)*nrm(Vlen)<= (l*h.N*e)^b <= M^(2b),
since l<h.q1<=h.N and 0<e<t; all terms finite.
RUN36 redPrime and sumBack with zero loss imply
log(l)*sum_{0<e<t} plusLen.toNat <= t*h.N*M^(2b)=M^(2b+1).
No CountIV, LayerLe, B or j required. Same coefficient choice,
same host, no altered quantifiers. This is the outstanding formal
supplier PrincipalSumNoLayer37 below (bound weakened by C*B for B>=0
to preserve the existing native scalar assembly without edits).
SumOut remains an explicit input; no claim that CountI/II/III/Z,
CountV/Vs or ThmBa/ThmBc are proved. No 2-primary claim.

Actual source caller chain: pointNoLayer37 (source-derived from point)
-> jointWinPrincipal37 (uses ThmBa with B'=empty)
-> vwinAtPrincipal37 (source-derived from vwinAt_of_joint).
At B'=empty, J=2^(R0+2)*(2*CK*Ct/eps)^R0, with R0=K.R0(AbF.ofChar psi).
This removes need for simultaneous BbAt, NOT actual arithmetic Bchi,
and keeps the full interval [Y,Y^2] on identical host.
No independent Bb witness is used or assumed.
Original source graph: point -> SumIn+SumOut; sumIn -> CountIV+LayerLe+
CountII+CountV+CountVs+redAll; jointWin_of -> ThmBab+ThmHV;
vwinAt_of_joint -> JointWin+ThmBc.
Reduced proposed graph: pointNoLayer37 -> PrincipalSumNoLayer37+SumOut;
human supplier -> exceptional zero+CountII+CountV+CountVs+redPrime;
jointWinPrincipal37 -> ThmBa(empty)+PrincipalPointNoLayer37;
vwinAtPrincipal37 -> PrincipalJointWin37+ThmBc. Original graph retained.
Cache key: pin, base conductor=1, exact h, l, c, e, t, field,
local conditions and finiteness. Not applicable to general characters.
Source paths relative to Development/AutomorphicArithmetic/AutomorphicVarieties:
HeightAndVanishing/LayerLe.lean 88eec332233203a9222b50ad7e77772490b3cce0;
HeightAndVanishing/PointArith.lean 494089e0cce2cf2e342ae05b6e2a69d52413f7aa;
PrimeSetBoundDataOfPrimitiveChar.lean 52224122dd8f9deefef473151d716984f3e1f1ff;
CMFieldExponentialBounds/AdmissibleOfPageN.lean 5afd609c06ffbef90f5df59e9915343c913c6257;
HeightAndVanishing/ThmHV.lean e5d8b97420078b2d97086d847f6db8e2c8953e63;
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1.
Native zOne, TorsClass.tors_class, Kum.pullOnto, Chr.V'_le_V,
HostOdd, BchiFacts, cases, redPrime, Chr.sumBack remain source anchors.
Executed 768 modular action checks for l=3,7, a=1..l-1, e=1..96;
exact rational Minkowski inequality and residue orders above checked.
20 unique/count-checked source transformations executed.
These are arithmetic/source checks only; not cohomology or Lean verification.
Lean/lake unavailable. Prior CI runs 45577239749 and 45576756833
are baseline only; new peer replay failures retained in 3f25eb66.
No new axiom evidence. Prior standard axiom list remains unmodified.
RESUME HERE: independent audit requested of full cyclotomic class-number
argument and local decomposition restriction; implement formal exceptional
zero and actual sumInNoLayer37 supplier using RUN36 redPrime, then compile
these source-derived consumer adapters at pin. Run bounded original and
reduced scans and print axioms; retain all pending branches. No RH closure
or URT acceleration claim. Handoff integration/kernel/audit/math.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

def UpperTheory.V.HV.PrincipalSumNoLayer37 : Prop :=
  ∀ (χ : PChar), χ.N = 1 → ∀ (l : Nat.Primes), (l : ℕ) ∈ Bchi χ → ∃ C : ℕ, ∀ h : Host, h.chi = χ → ∀ t : ℕ, 2 ≤ t → h.Big t →
    ∀ B : ℝ, 0 ≤ B → ∀ (E : Type) [Field E] [NumberField E] [IsCMField E], IsChiField χ h.ex h.q1 h.d E →
      ∀ (Ω : Type) [Field Ω] [Algebra E Ω] [IsAlgClosure E Ω] (ld : ∀ (p : ℕ) [Fact p.Prime], LData E Ω p),
        PlusLe ld {l} t (((h.N : ℝ) * t) ^ C + C * B)

def UpperTheory.V.HV.PrincipalPointNoLayer37 : Prop :=
  ∀ (χ : PChar) , χ.N = 1 → ∃ (C r₁ r₂ : ℕ), r₁.Prime ∧ r₂.Prime ∧ ∀ h : Host, h.chi = χ →
    r₁ < h.q1 → r₁ < h.d → r₂ < h.q1 → r₂ < h.d → ∀ t : ℕ, 2 ≤ t → h.Big t → ∀ B : ℝ, 0 ≤ B →
      ∀ (E : Type) [Field E] [NumberField E] [IsCMField E], IsChiField χ h.ex h.q1 h.d E →
        VVplusLe E t (((h.N : ℝ) * t) ^ C + C * B)

private theorem point_arith (x B : ℝ) (hx : 2 ≤ x) (hB : 0 ≤ B) (k K D C0 : ℕ) (hk : k ≤ K) :
    (k : ℝ) * (x ^ D + D * B) + x ^ C0 ≤ x ^ (C0 + D + K + K * D) + ((C0 + D + K + K * D : ℕ) : ℝ) * B := by
  have hx1 : (1:ℝ) ≤ x := by linarith
  have h1 := one_add_mul_le_pow (show (-2:ℝ) ≤ x - 1 by linarith) K
  rw [show (1:ℝ) + (x - 1) = x by ring] at h1
  have hKr : (k:ℝ) ≤ K := by exact_mod_cast hk
  have hK0 : (0:ℝ) ≤ K := by positivity
  have hD0 : (0:ℝ) ≤ D := by positivity
  have hC0 : (0:ℝ) ≤ C0 := by positivity
  have hc : (K:ℝ) + 1 ≤ x ^ K := by nlinarith
  have ha : 1 ≤ x ^ C0 := one_le_pow₀ hx1
  have hb : 1 ≤ x ^ D := one_le_pow₀ hx1
  have he : 1 ≤ x ^ (K * D) := one_le_pow₀ hx1
  have hpow : x ^ (C0 + D + K + K * D) = x ^ C0 * x ^ D * x ^ K * x ^ (K * D) := by
    rw [pow_add, pow_add, pow_add]
  have hM : (k:ℝ) * D ≤ ((C0 + D + K + K * D : ℕ) : ℝ) := by
    push_cast
    nlinarith
  have hMB : (k:ℝ) * D * B ≤ ((C0 + D + K + K * D : ℕ) : ℝ) * B :=
    mul_le_mul_of_nonneg_right hM hB
  have hab : x ^ C0 ≤ x ^ C0 * x ^ D := le_mul_of_one_le_right (by positivity) hb
  have habc : x ^ C0 * x ^ D * ((K:ℝ) + 1) ≤ x ^ C0 * x ^ D * x ^ K :=
    mul_le_mul_of_nonneg_left hc (by positivity)
  have hq : x ^ C0 * x ^ D * x ^ K ≤ x ^ C0 * x ^ D * x ^ K * x ^ (K * D) :=
    le_mul_of_one_le_right (by positivity) he
  have hkb : (k:ℝ) * x ^ D ≤ K * x ^ D := mul_le_mul_of_nonneg_right hKr (by positivity)
  have hKb : (K:ℝ) * x ^ D ≤ K * (x ^ C0 * x ^ D) :=
    mul_le_mul_of_nonneg_left (le_mul_of_one_le_left (by positivity) ha) hK0
  rw [hpow]
  nlinarith

theorem UpperTheory.V.HV.pointNoLayer37 :
    PrincipalSumNoLayer37 → SumOut → PrincipalPointNoLayer37 := by
  intro hin hout χ hprincipal
  classical
  obtain ⟨C0, r₁, r₂, hr₁, hr₂, hO⟩ := hout χ
  obtain ⟨Cl, hCl⟩ : ∃ Cl : ℕ → ℕ, ∀ (l : Nat.Primes) (hl : (l:ℕ) ∈ Bchi χ),
      Cl l = Classical.choose (hin χ hprincipal l hl) :=
    ⟨fun n => if hn : n.Prime ∧ n ∈ Bchi χ then Classical.choose (hin χ hprincipal ⟨n, hn.1⟩ hn.2) else 0,
      fun l hl => dif_pos (show (l:ℕ).Prime ∧ (l:ℕ) ∈ Bchi χ from ⟨l.2, hl⟩)⟩
  obtain ⟨D, hD⟩ : ∃ D : ℕ, ∀ l ∈ Bchi χ, Cl l ≤ D :=
    ⟨∑ l ∈ Bchi χ, Cl l, fun l hl => Finset.single_le_sum (fun _ _ => Nat.zero_le _) hl⟩
  refine ⟨C0 + D + (Bchi χ).card + (Bchi χ).card * D, r₁, r₂, hr₁, hr₂, ?_⟩
  intro h hχ h1 h2 h3 h4 t ht hbig B hB E _ _ _ hE Ω _ _ _ ld
  have hIn : ∀ l : Nat.Primes, (l:ℕ) ∈ Bchi χ →
      PlusLe ld {l} t (((h.N:ℝ) * t) ^ (Cl l) + (Cl l : ℝ) * B) := by
    intro l hl
    rw [hCl l hl]
    exact Classical.choose_spec (hin χ hprincipal l hl) h hχ t ht hbig B hB E hE Ω ld
  have hOut : ∀ S : Finset Nat.Primes, (∀ l ∈ S, (l:ℕ) ≠ 2 ∧ (l:ℕ) ∉ Bchi χ) →
      PlusLe ld S t (((h.N:ℝ) * t) ^ C0) :=
    fun S hS => hO h hχ h1 h2 h3 h4 t ht hbig E hE Ω ld S hS
  have hx2 : (2:ℝ) ≤ (h.N:ℝ) * t := by
    have hN : (1:ℝ) ≤ h.N := by exact_mod_cast h.N_pos
    have ht' : (2:ℝ) ≤ t := by exact_mod_cast ht
    nlinarith
  refine ⟨?_, ?_⟩
  · intro p hpf e hp2 he1 he2
    by_cases hb : p ∈ Bchi χ
    · exact (hIn ⟨p, hpf.out⟩ hb).1 ⟨p, hpf.out⟩ (Finset.mem_singleton_self _) e he1 he2
    · refine (hOut {⟨p, hpf.out⟩} ?_).1 ⟨p, hpf.out⟩ (Finset.mem_singleton_self _) e he1 he2
      intro l hl
      obtain rfl := Finset.mem_singleton.mp hl
      exact ⟨hp2, hb⟩
  · intro S hS2
    rw [← Finset.sum_filter_add_sum_filter_not S (fun l : Nat.Primes => (l:ℕ) ∈ Bchi χ)]
    have hout2 := (hOut (S.filter (fun l : Nat.Primes => (l:ℕ) ∉ Bchi χ)) (by
      intro l hl
      rw [Finset.mem_filter] at hl
      exact ⟨hS2 l hl.1, hl.2⟩)).2
    have hin2 : ∑ l ∈ S.filter (fun l : Nat.Primes => (l:ℕ) ∈ Bchi χ),
        Real.log ((l:ℕ):ℝ) * ∑ e ∈ Finset.Ico 1 t, ((plusLen (ld l) e).toNat : ℝ)
        ≤ ∑ l ∈ S.filter (fun l : Nat.Primes => (l:ℕ) ∈ Bchi χ), (((h.N:ℝ) * t) ^ D + (D:ℝ) * B) := by
      apply Finset.sum_le_sum
      intro l hl
      rw [Finset.mem_filter] at hl
      have h0 := (hIn l hl.2).2
      rw [Finset.sum_singleton] at h0
      have hle := hD l hl.2
      have hp1 : ((h.N:ℝ) * t) ^ (Cl l) ≤ ((h.N:ℝ) * t) ^ D := pow_le_pow_right₀ (by linarith) hle
      have hp2 : (Cl l : ℝ) * B ≤ (D:ℝ) * B := mul_le_mul_of_nonneg_right (by exact_mod_cast hle) hB
      linarith
    rw [Finset.sum_const, nsmul_eq_mul] at hin2
    have hcard : (S.filter (fun l : Nat.Primes => (l:ℕ) ∈ Bchi χ)).card ≤ (Bchi χ).card :=
      Finset.card_le_card_of_injOn (fun l : Nat.Primes => (l:ℕ))
        (fun l hl => (Finset.mem_filter.mp hl).2) Subtype.coe_injective.injOn
    have key := point_arith ((h.N:ℝ) * t) B hx2 hB _ (Bchi χ).card D C0 hcard
    linarith

def UpperTheory.V.HV.PrincipalJointWin37 (Ct : ℝ) : Prop :=
  ∀ (ψ : PChar), ψ.N = 1 → ∀ (eps A1 : ℝ), 0 < eps → eps < 1 / 52 → ∀ e t : ℝ → ℕ, admitted A1 Ct e t →
    ∃ (J C P X0 : ℝ), 0 < J ∧ ∀ X ≥ X0, ∀ q d : ℕ, PrimePair ψ.N q d →
      2 * X ^ Ct + 1 < (q : ℝ) → 2 * X ^ Ct + 1 < (d : ℝ) → P < (q : ℝ) → P < (d : ℝ) →
      Real.log ((q : ℝ) * d) ≤ X ^ (eps / (4 * J)) →
      ∃ Y : ℝ, InRange J X Y ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ (2 : ℝ) →
        BaAt (AbF.ofChar ψ) eps e t q d x ∧ HVAt ψ C eps e t q d x

theorem UpperTheory.V.HV.jointWinPrincipal37 (K : BConst) {Ct : ℝ} (hC : 0 < Ct)
    (hBa : ThmBa K Ct) (hP : PrincipalPointNoLayer37) : PrincipalJointWin37 Ct := by
  intro ψ hprincipal eps A1 heps heps52 e t hadm
  obtain ⟨C, r₁, r₂, hr₁, hr₂, hmain⟩ := hP ψ hprincipal
  let J := K.J Ct eps (AbF.ofChar ψ) ∅ (Lchi ψ)
  have hJ : 0 < J := K.J_pos hC heps _ _ _
  have hEmpty : OddPrimesWithRootsOfUnity (∅ : Finset ℕ) (Lchi ψ) := by
    simp [OddPrimesWithRootsOfUnity]
  obtain ⟨X0, H⟩ := hBa (AbF.ofChar ψ) ∅ (Lchi ψ) hEmpty eps A1 heps heps52
  refine ⟨J, (C : ℝ), (([ψ.N, ordC ψ, pK ψ, hStar ψ, pOne ψ, r₁, r₂].sum : ℕ) : ℝ),
    max X0 ((2 : ℝ) ^ J), hJ, ?_⟩
  intro X hX q d hp hq hd hpq hpd hl
  obtain ⟨Y, hY⟩ := H e t hadm X ((le_max_left _ _).trans hX) q d hp hl
  have hXY : X ^ (1 / J) ≤ Y := hY.1.1
  have hYX : Y ^ (2 : ℝ) ≤ X := hY.1.2
  have hX2 : ((2 : ℝ) ^ J) ≤ X := (le_max_right _ _).trans hX
  have h2Y : 2 ≤ Y := by
    have h1 : ((2 : ℝ) ^ J) ^ (1 / J) ≤ X ^ (1 / J) :=
      Real.rpow_le_rpow (by positivity) hX2 (by positivity)
    rw [one_div, Real.rpow_rpow_inv (by norm_num) hJ.ne'] at h1
    rw [one_div] at hXY
    exact h1.trans hXY
  have hlist : ∀ y ∈ [ψ.N, ordC ψ, pK ψ, hStar ψ, pOne ψ, r₁, r₂], y < q ∧ y < d := by
    intro y hy
    have hh := List.le_sum_of_mem hy
    exact ⟨hh.trans_lt (by exact_mod_cast hpq), hh.trans_lt (by exact_mod_cast hpd)⟩
  refine ⟨Y, hY.1, fun x hYx hxY => ⟨hY.2 x hYx hxY, ?_⟩⟩
  have hx2 : (2 : ℝ) ≤ x := h2Y.trans hYx
  obtain ⟨he2, -, ht2, htx⟩ := hadm x hx2
  have hxX : x ≤ X := hxY.trans hYX
  have htX : (t x : ℝ) ≤ X ^ Ct := htx.trans (Real.rpow_le_rpow (by linarith) hxX hC.le)
  intro E _ _ _ hE
  have hq' : 2 * t x + 1 < q := by exact_mod_cast (show (2 * (t x : ℝ) + 1) < q by linarith)
  have hd' : 2 * t x + 1 < d := by exact_mod_cast (show (2 * (t x : ℝ) + 1) < d by linarith)
  have hbig : Host.Big ⟨ψ, e x, q, d, he2, hp⟩ (t x) := by
    refine ⟨hq', hd', ?_⟩
    intro y hy
    apply hlist y
    simp only [Host.q, Host.o, List.mem_cons, List.not_mem_nil] at hy ⊢
    tauto
  have key := hmain ⟨ψ, e x, q, d, he2, hp⟩ rfl
    (hlist r₁ (by simp)).1 (hlist r₁ (by simp)).2 (hlist r₂ (by simp)).1 (hlist r₂ (by simp)).2
    (t x) ht2 hbig (Real.exp (x ^ (4 * eps / 5))) (Real.exp_pos _).le E hE
  rw [hostCond ⟨ψ, e x, q, d, he2, hp⟩ E hE]
  simpa [Real.rpow_natCast] using key

theorem UpperTheory.V.HV.vwinAtPrincipal37 {Ct : ℝ} (hC : 1 ≤ Ct) (hJ : PrincipalJointWin37 Ct) (hc : ThmBc Ct) (ψ : PChar) (hprincipal : ψ.N = 1) : VWinAt ψ Ct := by
  intro eps h0 h1 e he
  set t : ℝ → ℕ := fun x => ⌊x ^ Ct⌋₊ with ht
  have hadm : admitted 4 Ct e t := admissible_of_pageN h0 h1 hC he
  obtain ⟨J, C, P, XJ, hJ0, hmain⟩ := hJ ψ hprincipal eps 4 h0 h1 e t hadm
  obtain ⟨Cb, hCb⟩ := hc
  obtain ⟨K, hK0, hK⟩ := minusBound_le_exp_of_log_le Cb (AbF.ofChar ψ).deg
  obtain ⟨xT, hxT⟩ := error_terms_le_sqrt_exp_rpow eps K C h0
  obtain ⟨xN, hxN⟩ := log_conductor_mul_height_le_of_pageN eps Ct ψ.N h0 h1
  obtain ⟨Y0, hY0⟩ := log_mul_le_rpow_of_winPair eps h0
  obtain ⟨J', hJ'1, hJJ'⟩ : ∃ J' : ℝ, 1 ≤ J' ∧ J ≤ J' := ⟨max J 1, le_max_right _ _, le_max_left _ _⟩
  have hJ'0 : 0 < J' := by linarith
  obtain ⟨P', hPP', hNP'⟩ : ∃ P' : ℝ, P ≤ P' ∧ (ψ.N : ℝ) ≤ P' := ⟨max P (ψ.N : ℝ), le_max_left _ _, le_max_right _ _⟩
  obtain ⟨XB, hXB⟩ := eventually_winPair_gt_power eps J' Ct P' h0 hJ'0
  obtain ⟨L, hxTL, hxNL, hY0L, h2L⟩ : ∃ L : ℝ, xT ≤ L ∧ xN ≤ L ∧ Y0 ≤ L ∧ 2 ≤ L :=
    ⟨max (max xT xN) (max Y0 2), le_max_of_le_left (le_max_left _ _), le_max_of_le_left (le_max_right _ _),
      le_max_of_le_right (le_max_left _ _), le_max_of_le_right (le_max_right _ _)⟩
  have hL1 : (1 : ℝ) ≤ L := by linarith
  have hL0 : (0 : ℝ) ≤ L := by linarith
  refine ⟨J', hJ'1, max (max XJ XB) (L ^ J'), ?_⟩
  intro X hX q d hw
  have hXJ : XJ ≤ X := le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) hX
  have hXB' : XB ≤ X := le_trans (le_trans (le_max_right _ _) (le_max_left _ _)) hX
  have hXL : L ^ J' ≤ X := le_trans (le_max_right _ _) hX
  have hLX : L ≤ X ^ (1 / J') := by
    have := Real.rpow_le_rpow (Real.rpow_nonneg hL0 _) hXL (le_of_lt (one_div_pos.mpr hJ'0))
    rwa [← Real.rpow_mul hL0, mul_one_div_cancel hJ'0.ne', Real.rpow_one] at this
  have hX1 : 1 ≤ X := by
    have : 1 ≤ L ^ J' := Real.one_le_rpow hL1 hJ'0.le
    linarith
  have hX0 : (0 : ℝ) ≤ X := by linarith
  obtain ⟨hq3, hd3, hPq, hPd⟩ := hXB X hXB' q d hw
  have hlog := hY0 _ (hY0L.trans hLX) q d hw
  have hpow : (X ^ (1 / J')) ^ (eps / 4) = X ^ (eps / (4 * J')) := by
    rw [← Real.rpow_mul hX0]
    congr 1
    field_simp
  have hmono : X ^ (eps / (4 * J')) ≤ X ^ (eps / (4 * J)) :=
    Real.rpow_le_rpow_of_exponent_le hX1 (div_le_div_of_nonneg_left h0.le (by positivity) (by linarith))
  have hlogJ : Real.log (↑q * ↑d) ≤ X ^ (eps / (4 * J)) := by
    rw [hpow] at hlog
    exact hlog.trans hmono
  have hN0 : 0 < ψ.N := (AbF.ofChar ψ).pos
  have hcop : ∀ r : ℕ, Nat.Prime r → (ψ.N : ℝ) < r → Nat.Coprime r ψ.N := by
    intro r hr hlt
    have hlt' : ψ.N < r := by exact_mod_cast hlt
    exact (Nat.Prime.coprime_iff_not_dvd hr).2 (fun hdvd => absurd (Nat.le_of_dvd hN0 hdvd) (not_le.2 hlt'))
  have hpp : PrimePair ψ.N q d :=
    ⟨hw.q_prime, hw.q_mod, hw.d_prime, hw.d_mod,
      Nat.Coprime.mul (hcop q hw.q_prime (lt_of_le_of_lt hNP' hPq)) (hcop d hw.d_prime (lt_of_le_of_lt hNP' hPd))⟩
  obtain ⟨Y, ⟨hYlo, hYhi⟩, hY⟩ :=
    hmain X hXJ q d hpp hq3 hd3 (lt_of_le_of_lt hPP' hPq) (lt_of_le_of_lt hPP' hPd) hlogJ
  have hWY : X ^ (1 / J') ≤ Y :=
    le_trans (Real.rpow_le_rpow_of_exponent_le hX1 (one_div_le_one_div_of_le (by linarith) hJJ')) hYlo
  refine ⟨Y, hWY, hYhi, ?_⟩
  intro x hxY hxY2
  have hWx : X ^ (1 / J') ≤ x := hWY.trans hxY
  have hLx : L ≤ x := hLX.trans hWx
  have hx2 : 2 ≤ x := h2L.trans hLx
  have hx1 : 1 ≤ x := by linarith
  obtain ⟨hBa, hHV⟩ := hY x hxY hxY2
  intro E _ _ hE
  have hq0 : 0 < q := hw.q_prime.pos
  have hd0 : 0 < d := hw.d_prime.pos
  have hq4 : q % 4 = 3 := by
    have := hw.q_mod
    omega
  haveI : IsCMField E := isCMField_of_isChiField ψ (e x) q d hw.q_prime hq4 E hE
  have hE' : IsCompField (AbF.ofChar ψ) (e x) q d E := (isCompField_ofChar ψ (e x) q d E).2 hE
  have h2 := hBa E hE'
  have hp := hHV E hE
  have hm := hCb (AbF.ofChar ψ) 4 e t hadm x hx2 q d hpp E hE'
  obtain ⟨hc1, hc2, hc3⟩ := conductor_bounds_of_isChiField ψ (e x) q d hq0 hd0 E hE
  obtain ⟨-, -, ht2, htle⟩ := hadm x hx2
  have ht1 : 1 ≤ t x := by omega
  have hWpos : (0 : ℝ) ≤ X ^ (1 / J') := Real.rpow_nonneg hX0 _
  have hqd : Real.log (↑q * ↑d) ≤ x ^ (eps / 4) := by
    have hlog0 := hY0 _ (hY0L.trans hLX) q d hw
    exact hlog0.trans (Real.rpow_le_rpow hWpos hWx (by linarith))
  have hNt := hxN x (hxNL.trans hLx) (condF E) (t x) (e x) q d hc1 hc2 (he x hx1) ht1 htle hqd
  have hmb := hK (Module.finrank ℚ E) (condF E) (t x) (x ^ (eps / 4)) hc1 ht1 hc3 hNt
  have hm' := VVminusLe.mono hm hmb
  have hv := vvle_of_parts h2 hm' hp
  have hu1 : (1 : ℝ) ≤ ↑(condF E) * ↑(t x) := by
    have a : (1 : ℝ) ≤ condF E := by exact_mod_cast hc1
    have b : (1 : ℝ) ≤ t x := by exact_mod_cast ht1
    nlinarith
  have htot := hxT x (hxTL.trans hLx) _ hu1 hNt
  exact VVle.mono hv le_rfl htot


theorem UpperTheory.V.HV.principalVWinNoLayer37 (K : BConst)
    (hBa : ThmBa K 401) (hin : PrincipalSumNoLayer37) (hout : SumOut)
    (hc : ThmBc 401) (ψ : PChar) (hp : ψ.N = 1) : VWinAt ψ 401 := by
  have hJ := jointWinPrincipal37 K (by norm_num : (0 : ℝ) < 401) hBa (pointNoLayer37 hin hout)
  first
  | (rh_reduce 2 using [vwinAtPrincipal37]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact vwinAtPrincipal37 (by norm_num) hJ hc ψ hp

rh_scan UpperTheory.V.HV.point limit 2000
rh_scan UpperTheory.V.HV.pointNoLayer37 limit 2000
rh_scan UpperTheory.V.HV.principalVWinNoLayer37 limit 2000
rh_prune UpperTheory.V.HV.principalVWinNoLayer37 as RH37PrincipalVWinPruned
#print axioms UpperTheory.V.HV.point
#print axioms UpperTheory.V.vwinAt_of_joint
#print axioms UpperTheory.V.HV.principalVWinNoLayer37
