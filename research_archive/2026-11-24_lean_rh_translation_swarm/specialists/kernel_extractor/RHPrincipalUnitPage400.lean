import Development.AutomorphicArithmetic.CharacterBoxes.SupplyChi
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11, 25 Nov 2026: principal cyclic group has exact unit page multiplier.
SOURCE-MATCHED HUMAN proof, native candidate PREPARED, NOT COMPILED.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol,
live manuscript, latest peers d41c3276 (raw count), 38b6cc25 (mass),
088245be (editor), a987e3f9 (level-one cohomology), 41d181ff/5de8466b
(direct pair selection), 6821df81 (theta), prior own 5991ed4b.
Distinct from these: specialize the ACTUAL generic field-order constant.
Source paths relative to src/Development/AutomorphicArithmetic/:
CharacterBoxes/OrdAny.lean d83838c691b46df790ddad8daf5eb3e3ef5bb35a
CharacterBoxes/FieldChi.lean f3e2032b133ff64406a87e27438cdf467aa05a1f
CharacterBoxes/WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
CharacterBoxes/TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981
CharacterBoxes/EventuallyRankLeRpowOfLtOneDivFiftytwo.lean d60585aca568591e8192b6fd1ce9a91433c4af2d
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
CharacterBoxes/SupplyChi.lean 339885b77069601fb716a60739369805241e8222.
Upstream latest observed d91ae2678eea19a0c3045ffca37f1da757c2e719,
advanced from prior 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a;
Main at new head eb95ca808793dd61984cc853ab5630f54a74490c,
different from pinned Main. No cross-version equivalence.

EDITOR BLOCK: Native ordAny gives 1<=c<=|<psi.chi>|, and
ord(frame)=c*2^e eventually. At psi=one, <psi.chi>={1}, hence
c=1 EXACTLY. Keep the fieldChi construction and its remaining
hypotheses; retain this equality instead of discarding the upper
bound on c. Thus k=c^(1/(2+8eps))=1. In the original winPairs
construction take the same X>=max(X0,M^J), q,d from PairEx at
Y0=X^(1/J), and W from VWinAt with Y0<=W and W^2<=X.
For x in [W,W^(3/2)], W>=1 gives x<=W^2<=X. The original
page at x already supplies x^(2+8eps)<=2^e<=2*x^(2+8eps).
The arithmetic bound needed by WinDatum is EXACTLY the bound
at x itself, with t=floor(x^400), not x/k. Hence
                 VWinAt(one,400) -> HostExW(3/2,GChi(one).req).
There is no k^3 or k^400 threshold, inverse scale, or need for
degree 401 to absorb rescaling. No loss of budget: keep the
original sqrt(exp(x^eps)), and all field, prime, character,
finiteness and host conditions. The native final rank supplier
already proves R.t<=x^400, so the actual caller needs no change
other than its field/window calls. Original 401 implies 400
by monotonicity on x>=1 (bridge below). A joint-window wide-budget
version can use the same simplification once earlier overlays are
checked; this file deliberately does not depend on uncompiled overlays.
No proof of VWinAt(one,400) or geometric suppliers asserted.

Old graph: fieldChi -> ordAny (c upper bound discarded);
winPairs -> scaling k, 401-to-400 transfer, PairEx, page, VWinAt;
supplyOfAdmOf -> rank bound 400 -> supplyChi -> GChi.
New overlay: fieldChi_unit400 -> same ordAny + singleton cardinality;
winPairs_unit400 -> PairEx, page, VWinAt(400), W>=1 power comparison;
supplyOfAdmOf_unit400 -> same rank bound and host construction;
supplyChi_principal400 -> actual GChi(one). No global native edges
claimed deleted; original graph and axiom evidence retained.
Context key pin, psi=one, eps,J,X,W,q,d,x,e,host H,R,t.
No URT used; no ranking advantage.

Actual execution: 10 unique guarded substitutions of exact pinned
FieldChi and supplyOfAdmOf bodies (no native proof execution). Local
command -v lean/lake yielded no paths. Prior native CI statuses
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (45577239749)
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 (45576756833) retrieved;
both pass for their previous limited tests, not this certificate.
Native scans, pruning, rule search and axiom checks below remain pending.
No claim that the full pinned root has been checked.

RESUME HERE: compile this independent file (three shared engine oleans
on LEAN_PATH, pinned RH build, lake env lean RHPrincipalUnitPage400.lean).
Check singleton Nat.card simp, output of rh_scan/rh_prune and #print axioms.
Then specialize the joint/wide window overlay to c=1 and cutoff 400,
after replaying its imported certificates. This is an actual supplier
simplification, not a new independent RH criterion.
HANDOFF TO: integration, editor, arithmetic, structure, audit. RH OPEN.
-/

noncomputable section
open Formalism.HC Formalism.FrobeniusOrbits UpperTheory.Top HostParam.Seam

private theorem conductor_divisor_bounds_unit400 {M : ℕ} [NeZero M] {Q e b : ℕ} (hQ : Q ∣ Nat.lcm (2 ^ (e + 2)) M) (hb : 4 * M ≤ b) :
    (∀ l : ℕ, l.Prime → l ≠ 2 → l ∣ Q → 4 * l ≤ b) ∧ Q ≤ 4 * M * 2 ^ e := by
  have hM : 0 < M := Nat.pos_of_ne_zero (NeZero.ne M)
  have h1 := hQ.trans (Nat.lcm_dvd_mul _ _)
  refine ⟨fun l hl h2 h => ?_, (Nat.le_of_dvd (by positivity) h1).trans (le_of_eq (by ring))⟩
  have h3 : l ∣ M := (hl.dvd_mul.1 (h.trans h1)).resolve_left fun h4 =>
    h2 ((Nat.prime_dvd_prime_iff_eq hl Nat.prime_two).1 (hl.dvd_of_dvd_pow h4))
  have := Nat.le_of_dvd hM h3
  omega

theorem UpperTheory.Top.fieldChi_unit400 :
    ∀ ψ : PChar, ψ.χ = 1 → ∃ c e0 : ℕ, c = 1 ∧ 1 ≤ c ∧ ∀ e ≥ e0, ∀ q d b : ℕ, HostHyp q d → q ≠ 3 → Nat.Coprime ψ.N (q * d) → 4 * ψ.N ≤ b →
      (∀ p : ℕ, p.Prime → p ≠ 2 → p ≤ b → jacobiSym (-(d : ℤ)) p = 1) →
      ∃ (φ : Frame) (H : HostAx φ), φ.e = e ∧ φ.ord = c * 2 ^ e ∧ H.q = q ∧ H.d = d ∧ φ.o = (Level.cyc ψ).o ∧ FieldRows H.toHostRaw b ∧
        H.QS ∣ Nat.lcm (2 ^ (e + 2)) ψ.N ∧ H.QS ≤ 4 * ψ.N * φ.ord ∧
        H.KeptInXp (Level.cyc ψ).KEPT ∧ H.ExceptionalCharacterKept (Level.cyc ψ).KEPT (Level.cyc ψ).psK ∧
        KerChi ψ H.toHostRaw ∧ TwistForm ψ H.toHostRaw := by
  intro ψ hχ
  obtain ⟨c, e1, hc1, hcle, hord⟩ := ordAny ψ.N (Subgroup.zpowers ψ.χ)
  have hcard : Nat.card (Subgroup.zpowers ψ.χ) = 1 := by
    rw [hχ]
    simp
  have hceq : c = 1 := by omega
  refine ⟨c, max e1 (max 2 (max (4 * ψ.N) (64 * Nat.card (Subgroup.zpowers ψ.χ)))), hceq, hc1,
    fun e he q d b hH hq3 hcop hb hsplit => ?_⟩
  simp only [ge_iff_le, max_le_iff] at he
  obtain ⟨he1, he2, heN, heK⟩ := he
  have hNpos : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  have hs : ∀ l : ℕ, l.Prime → l ≠ 2 → l ∣ ψ.N → jacobiSym (-(d : ℤ)) l = 1 := by
    intro l hl hl2 hlN
    have := Nat.le_of_dvd hNpos hlN
    exact hsplit l hl hl2 (by omega)
  have hQdvd : (AnyGrp.host (Subgroup.zpowers ψ.χ) e hH hcop he2 hs).QS ∣ Nat.lcm (2 ^ (e + 2)) ψ.N :=
    EvenGrp.QS_dvd _ e
  obtain ⟨hsmall, hQle⟩ := conductor_divisor_bounds_unit400 hQdvd hb
  have h2e : 2 ^ e ≤ (AnyGrp.frame (Subgroup.zpowers ψ.χ) e).ord :=
    Frame.two_pow_le_ord (AnyGrp.frame (Subgroup.zpowers ψ.χ) e)
  have h4M : 4 * ψ.N ≤ 2 ^ e := by
    have : e < 2 ^ e := Nat.lt_two_pow_self
    omega
  have hopow : (AnyGrp.frame (Subgroup.zpowers ψ.χ) e).o ^ 64 ≤ 2 ^ (AnyGrp.frame (Subgroup.zpowers ψ.χ) e).e := by
    rw [AnyGrp.o_eq]
    show Nat.card (Subgroup.zpowers ψ.χ) ^ 64 ≤ 2 ^ e
    calc Nat.card (Subgroup.zpowers ψ.χ) ^ 64 ≤ (2 ^ Nat.card (Subgroup.zpowers ψ.χ)) ^ 64 :=
          Nat.pow_le_pow_left Nat.lt_two_pow_self.le 64
      _ = 2 ^ (64 * Nat.card (Subgroup.zpowers ψ.χ)) := by ring
      _ ≤ 2 ^ e := Nat.pow_le_pow_right (by norm_num) heK
  refine ⟨AnyGrp.frame (Subgroup.zpowers ψ.χ) e,
    HostAx.ofRaw (AnyGrp.host (Subgroup.zpowers ψ.χ) e hH hcop he2 hs), rfl, hord e he1, rfl, rfl,
    AnyGrp.o_eq _ e, ?_, hQdvd, ?_, AnyGrp.keptInXp _ e hH hcop he2 hs, AnyGrp.exceptional_character_condition _ e hH hcop he2 hs,
    kerChiAny ψ e q d hH hcop he2 hs, twistAny ψ e q d hH hcop he2 hs⟩
  · exact ⟨AnyGrp.psQ _ e hH hcop he2 hs, AnyGrp.exists_sqq _ e hH hcop he2 hs, AnyGrp.exact _ e hH hcop he2 hs,
      AnyGrp.QS_le _ e h4M, hopow, hq3, hsplit, hsmall⟩
  · exact hQle.trans (Nat.mul_le_mul_left _ h2e)


open Formalism.HC UpperTheory.Top

theorem UpperTheory.Top.winPairs_unit400 :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → c = 1 → VWinAt ψ 400 → PairEx →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatum ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV hP
  subst c
  obtain ⟨e, he⟩ := exists_pageN eps heps
  obtain ⟨J, hJ, X0, hX0⟩ := hV eps heps heps52 e he
  have hN : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  obtain ⟨Y1, hY1⟩ := hP ψ.N hN eps J heps heps52 hJ
  refine ⟨J, hJ, fun y => ?_⟩
  have hJ0 : J ≠ 0 := ne_of_gt (by linarith)
  have hJi : 0 ≤ 1 / J := one_div_nonneg.2 (by linarith)
  let M : ℝ := max 1 (max y Y1)
  have hM1 : 1 ≤ M := le_max_left _ _
  have hMy : y ≤ M := (le_max_left y Y1).trans (le_max_right 1 _)
  have hMY1 : Y1 ≤ M := (le_max_right y Y1).trans (le_max_right 1 _)
  let X : ℝ := max X0 (M ^ J)
  have hXX0 : X0 ≤ X := le_max_left _ _
  have hXM : M ^ J ≤ X := le_max_right _ _
  have hM0 : 0 ≤ M := by linarith
  have hX1 : 1 ≤ X := (Real.one_le_rpow hM1 (by linarith)).trans hXM
  have hX0' : 0 ≤ X := by linarith
  have hY0M : M ≤ X ^ (1 / J) := by
    calc M = (M ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hM0 hJ0]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hM0 _) hXM hJi
  have hXJ : (X ^ (1 / J)) ^ J = X := by rw [one_div, Real.rpow_inv_rpow hX0' hJ0]
  obtain ⟨q, d, hpg⟩ := hY1 (X ^ (1 / J)) (hMY1.trans hY0M)
  obtain ⟨W, hW0, hW2, hWV⟩ := hX0 X hXX0 q d hpg.pair
  have hWM : M ≤ W := hY0M.trans hW0
  have hW1 : 1 ≤ W := hM1.trans hWM
  refine ⟨W, hMy.trans hWM, fun x hx hxu => ?_⟩
  have hxW2 : x ≤ W ^ (2 : ℝ) :=
    hxu.trans (Real.rpow_le_rpow_of_exponent_le hW1 (by norm_num))
  have hxX : x ≤ X := hxW2.trans hW2
  have hx1 : 1 ≤ x := hW1.trans hx
  have hx0 : 0 ≤ x := by linarith
  have hpage := he x hx1
  refine ⟨X ^ (1 / J), q, d, e x, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact Real.rpow_le_rpow hx0 hxX hJi
  · exact hW0.trans hx
  · exact hpg.mono (by rw [hXJ]; exact hxX)
  · simpa only [one_mul] using hpage.1
  · simpa only [one_mul] using hpage.2
  · exact hWV x hx hxW2

theorem UpperTheory.Top.vwin400_of_401 (ψ : PChar) (h : VWinAt ψ 401) :
    VWinAt ψ 400 := by
  intro eps he he52 e hpage
  obtain ⟨J, hJ, X0, hX0⟩ := h eps he he52 e hpage
  refine ⟨J, hJ, max X0 1, fun X hX q d hp => ?_⟩
  obtain ⟨W, hW, hW2, hWV⟩ := hX0 X ((le_max_left _ _).trans hX) q d hp
  have hX1 : 1 ≤ X := (le_max_right _ _).trans hX
  have hW1 : 1 ≤ W := (Real.one_le_rpow hX1 (one_div_nonneg.2 (by linarith))).trans hW
  refine ⟨W, hW, hW2, fun x hx hx2 E _ _ hE => ?_⟩
  have hx1 : 1 ≤ x := hW1.trans hx
  exact (hWV x hx hx2 E hE).mono
    (Nat.floor_mono (Real.rpow_le_rpow_of_exponent_le hx1 (by norm_num))) le_rfl

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.HC GlobalTheory.EX UpperTheory.Top HostParam.Seam

theorem UpperTheory.T3.supplyOfAdmOf_unit400 :
    (∀ eps C0 : ℝ, 0 < eps → eps < 1 / 52 → 1 ≤ C0 → ∃ CT2 C8 c6 Cb x0 : ℝ, C0 ≤ C8 ∧ 0 < c6 ∧ 0 < Cb ∧
      ∀ (s : Scale) (R : Ranks) (H0 : HostAx R.toFrame) (M : ℕ) (Y : ℝ), s.eps = eps → x0 ≤ s.x → RankVal s R →
        s.J ≤ C0 → (R.o : ℝ) ≤ C0 → (H0.QS : ℝ) ≤ C0 * R.n → 0 < M → (M : ℝ) ≤ C0 → H0.QS ∣ Nat.lcm (2 ^ (R.e + 2)) M →
        PairWin s Y → PairGood M eps Y s.x H0.q H0.d → FieldRows H0.toHostRaw ⌊Y ^ (eps / 5)⌋₊ → admitted R H0 →
        ∃ (H : Host R) (q0 : ℕ), H.toHostAx = H0 ∧ H.CT2 = CT2 ∧ HostGood s C8 4 c6 Cb H q0 ∧
          R.toFrame.Shares H.TT (s.x ^ (-1 + s.eps))) → ∀ ψ : PChar, ψ.χ = 1 → VWinAt ψ 400 →
      (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
        s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
        ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
      HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (Real.sqrt s.b)) := by
  intro hSup ψ hχ hV hAdm eps heps heps'
  haveI := ψ.ne
  have hN0 : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  have heps0 : eps ≠ 0 := heps.ne'
  obtain ⟨c, e0, hceq, hc, hF⟩ := UpperTheory.Top.fieldChi_unit400 ψ hχ
  obtain ⟨J, hJ, hwin⟩ := UpperTheory.Top.winPairs_unit400 ψ eps (c : ℝ) heps heps' (by exact_mod_cast hceq) hV QH.pairEx
  obtain ⟨C0, hC1, hCJ, hCo, hCN⟩ : ∃ C0 : ℝ, 1 ≤ C0 ∧ J ≤ C0 ∧ ((Level.cyc ψ).o : ℝ) ≤ C0 ∧
      8 * (ψ.N : ℝ) ≤ C0 :=
    by
      have h1 : (0 : ℝ) ≤ ((Level.cyc ψ).o : ℝ) := Nat.cast_nonneg _
      have h2 : (0 : ℝ) ≤ (ψ.N : ℝ) := Nat.cast_nonneg _
      exact ⟨J + ((Level.cyc ψ).o : ℝ) + 8 * (ψ.N : ℝ), by linarith, by linarith, by linarith, by linarith⟩
  obtain ⟨CT2, C8, c6, Cb, x0A, hC8, hc6, hCb, hA⟩ := hSup eps C0 heps heps' hC1
  obtain ⟨x0B, hB⟩ := hAdm eps heps heps'
  obtain ⟨x0T, hT⟩ := UpperTheory.Top.eventually_rank_le_rpow_of_lt_one_div_fiftytwo eps heps heps'
  obtain ⟨K, hK5, hK4⟩ : ∃ K : ℝ, 5 ≤ K ∧ 4 * (ψ.N : ℝ) ≤ K :=
    by
      have h2 : (0 : ℝ) ≤ (ψ.N : ℝ) := Nat.cast_nonneg _
      exact ⟨5 + 4 * (ψ.N : ℝ), by linarith, by linarith⟩
  have hK0 : 0 ≤ K := by linarith
  obtain ⟨A, hA0, hAK⟩ : ∃ A : ℝ, 0 ≤ A ∧ A ^ (eps / 5) = K := by
    refine ⟨K ^ (5 / eps), Real.rpow_nonneg hK0 _, ?_⟩
    rw [← Real.rpow_mul hK0, show 5 / eps * (eps / 5) = (1 : ℝ) by field_simp, Real.rpow_one]
  have hc0 : (0 : ℝ) ≤ c := by positivity
  have hAJ0 : 0 ≤ A ^ J := Real.rpow_nonneg hA0 _
  obtain ⟨x1, h1A, h1B, h1T, h1J, h1c⟩ : ∃ x1 : ℝ, x0A ≤ x1 ∧ x0B ≤ x1 ∧ x0T ≤ x1 ∧ A ^ J ≤ x1 ∧
      (c : ℝ) * 2 ^ e0 < x1 := by
    have h2 : (0 : ℝ) ≤ (c : ℝ) * 2 ^ e0 := by positivity
    refine ⟨|x0A| + |x0B| + |x0T| + A ^ J + (c : ℝ) * 2 ^ e0 + 1, ?_, ?_, ?_, ?_, ?_⟩ <;>
      linarith [le_abs_self x0A, le_abs_self x0B, le_abs_self x0T, abs_nonneg x0A, abs_nonneg x0B,
        abs_nonneg x0T]
  refine ⟨CT2, C8, 4, c6, Cb, x1, le_trans hC1 hC8, by norm_num, hc6, hCb, ?_⟩
  refine ⟨⟨J, hJ, {x | ∃ Y q d e, UpperTheory.Top.WinDatum ψ eps J c x Y q d e}, hwin⟩, ?_⟩
  rintro s hs hx ⟨hsJ, Y, q, d, e, hW⟩
  have hx1 : 1 < s.x := s.one_lt_alt
  have hJ0 : 0 < J := by linarith
  have hYA : A ≤ Y := by
    calc A = (A ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hA0 hJ0.ne']
      _ ≤ s.x ^ (1 / J) := Real.rpow_le_rpow hAJ0 (h1J.trans hx) (div_nonneg zero_le_one hJ0.le)
      _ ≤ Y := hW.lo
  have hY0 : 0 ≤ Y := hA0.trans hYA
  have hYK : K ≤ Y ^ (eps / 5) := by
    rw [← hAK]
    exact Real.rpow_le_rpow hA0 hYA (by positivity)
  obtain ⟨hHyp, hjac, -⟩ := UpperTheory.Top.pairHyp eps Y q d hW.good.pair
  have hq3 : q ≠ 3 := by
    intro hq
    have h1 := hW.good.pair.q_lo
    rw [hq] at h1
    push_cast at h1
    have h2 : Real.log 3 ≤ 2 := by
      have := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 3)
      linarith
    linarith
  have he : e ≥ e0 := by
    by_contra hlt
    push_neg at hlt
    have h1 : (2 : ℝ) ^ e ≤ 2 ^ e0 := pow_le_pow_right₀ (by norm_num) hlt.le
    have h2 : s.x ≤ s.x ^ (2 + 8 * eps) := by
      calc s.x = s.x ^ (1 : ℝ) := (Real.rpow_one _).symm
        _ ≤ _ := Real.rpow_le_rpow_of_exponent_le hx1.le (by linarith)
    have h3 := hW.n_lo
    linarith [mul_le_mul_of_nonneg_left h1 hc0]
  have h4N : 4 * ψ.N ≤ ⌊Y ^ (eps / 5)⌋₊ := by
    apply Nat.le_floor
    push_cast
    linarith
  have hjacb : ∀ p : ℕ, Nat.Prime p → p ≠ 2 → p ≤ ⌊Y ^ (eps / 5)⌋₊ → jacobiSym (-(d : ℤ)) p = 1 :=
    fun p hp hp2 hpb => hjac p hp hp2 ((Nat.cast_le.2 hpb).trans (Nat.floor_le (Real.rpow_nonneg hY0 _)))
  obtain ⟨φ, H0, hφe, hφord, hHq, hHd, hφo, hFR, hQSdvd, hQSle, hkept, hps, hker, htw⟩ :=
    hF e he q d ⌊Y ^ (eps / 5)⌋₊ hHyp hq3 hW.good.coprime h4N hjacb
  obtain ⟨R, h, hRV, hAdmR⟩ := hB s φ H0 hs (h1B.trans hx)
    (by rw [hφord]; push_cast; exact hW.n_lo) (by rw [hφord]; push_cast; exact hW.n_up) hφo hker
  subst h
  have hnlo := hRV.n_lo
  rw [hs] at hnlo
  have hQS : (H0.QS : ℝ) ≤ C0 * R.n := by
    have hq' : (H0.QS : ℝ) ≤ 4 * ψ.N * R.toFrame.ord := by exact_mod_cast hQSle
    have hord : (R.toFrame.ord : ℝ) = c * 2 ^ e := by rw [hφord]; push_cast; ring
    have hn : (0 : ℝ) ≤ R.n := Nat.cast_nonneg _
    have hN : (0 : ℝ) ≤ ψ.N := Nat.cast_nonneg _
    rw [hord] at hq'
    have h5 := hW.n_up
    nlinarith [mul_le_mul_of_nonneg_left h5 (by positivity : (0 : ℝ) ≤ 4 * ψ.N),
      mul_le_mul_of_nonneg_left hnlo (by positivity : (0 : ℝ) ≤ 8 * ψ.N),
      mul_le_mul_of_nonneg_right hCN hn]
  obtain ⟨H, q0, hH, hCT, hGood, hSh⟩ := hA s R H0 ψ.N Y hs (h1A.trans hx) hRV
    (by rw [hsJ]; exact hCJ) (by rw [hφo]; exact hCo) hQS hN0
    (by have : (0 : ℝ) ≤ ψ.N := Nat.cast_nonneg _; linarith)
    (by rw [hφe]; exact hQSdvd) ⟨by rw [hsJ]; exact hW.lo, hW.up⟩
    (by rw [hHq, hHd]; exact hW.good) hFR hAdmR
  subst hH
  refine ⟨R, H, q0, hRV, hCT, hGood, ?_, ?_⟩
  · have hprime : ∀ l : ℕ, Nat.Prime l → l ∣ H.QS → l ∣ 2 * ψ.N := by
      intro l hl hlQ
      have h1 : l ∣ 2 ^ (e + 2) * ψ.N := hlQ.trans (hQSdvd.trans (Nat.lcm_dvd (dvd_mul_right _ _) (dvd_mul_left _ _)))
      rcases (Nat.Prime.dvd_mul hl).1 h1 with h2 | h2
      · have h3 := (Nat.prime_dvd_prime_iff_eq hl Nat.prime_two).1 (hl.dvd_of_dvd_pow h2)
        subst h3
        exact dvd_mul_right 2 _
      · exact dvd_mul_of_dvd_right h2 2
    have hbd := UpperTheory.Top.boundedTw ψ R.toFrame H.toHostRaw eps Y s.x heps hx1.le hW.up htw hker.1 hprime
      (by rw [hHq, hHd]; exact hW.good)
    rw [hs] at hSh ⊢
    exact ⟨hφo, hkept, hps, hSh, hbd.1, hbd.2⟩
  · have hCF := UpperTheory.Top.isChiField ψ R.toFrame H.toHostRaw hker
    rw [hφe, hHq, hHd] at hCF
    have hv := hW.bound H.E hCF
    refine hv.mono ?_ (le_of_eq ?_)
    · apply Nat.le_floor
      exact hT s R hs (h1T.trans hx) hRV
    · rw [Formalism.BasicNotions.Scale.b, Formalism.BasicNotions.Scale.L, hs]


open Formalism.BasicNotions Formalism.MainNotions Formalism.HC GlobalTheory.EX UpperTheory.Top

theorem UpperTheory.Top.supplyChi_principal400 :
    VWinAt PChar.one 400 → HostExW (3 / 2) (GChi PChar.one).req := by
  intro hψ
  refine UpperTheory.T3.supplyOfAdmOf_unit400 UpperTheory.Top.hostOfField PChar.one rfl hψ ?_
  intro eps he0 he1
  obtain ⟨x0, hx0⟩ := admissibleClassesTwistedChar eps he0 he1
  refine ⟨x0, fun s φ H0 hs hx hlo hhi _ _ => ?_⟩
  subst hs
  exact hx0 s φ H0 rfl hx hlo hhi

theorem UpperTheory.Top.supplyChi_principal400_original_bridge (h : VWinAt PChar.one 401) :
    HostExW (3 / 2) (GChi PChar.one).req := by
  first
  | (rh_reduce 3 using [supplyChi_principal400, vwin400_of_401]; done)
  | (rh_auto 3; done)
  | (rh_auto_frontier 3; done)
  | exact supplyChi_principal400 (vwin400_of_401 _ h)

rh_scan UpperTheory.Top.fieldChi limit 2000
rh_scan UpperTheory.Top.fieldChi_unit400 limit 2000
rh_scan UpperTheory.Top.winPairs limit 2000
rh_scan UpperTheory.Top.winPairs_unit400 limit 2000
rh_scan UpperTheory.Top.supplyChi_principal400 limit 2000
rh_prune UpperTheory.Top.fieldChi_unit400 as RHFieldChiUnitPruned
rh_prune UpperTheory.Top.winPairs_unit400 as RHWinPairsUnitPruned
#print axioms UpperTheory.Top.fieldChi
#print axioms UpperTheory.Top.fieldChi_unit400
#print axioms UpperTheory.Top.winPairs_unit400
#print axioms UpperTheory.Top.vwin400_of_401
#print axioms UpperTheory.T3.supplyOfAdmOf_unit400
#print axioms UpperTheory.Top.supplyChi_principal400
#print axioms UpperTheory.Top.supplyChi_principal400_original_bridge
end
