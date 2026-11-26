import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import Mathlib.Data.Fin.Tuple.Sort
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN48, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED.
Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine);
SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, state/log/protocol/
continuity openings consulted. Prior RUN47 de7fd645 read in full; peer
d2660dc3 (factorwise modular), 2becd062 (scaled primary), 7d1fc0e1
(local Hodge), 04b054aa (shared flag) inspected; latest commit summaries
through d2660dc3. No duplicate arithmetic exponent refinement.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/KTheoryStability/ReductionBoundsTorsion/
IteratedHeckeBounds/LemBound.lean 59e23b33fa6d779ab02f33af97bb59ce9350347b
IteratedHeckeBounds/LemForm.lean fa1fbd6622fa0603e9e2d08b8d7a9815aa7f73fc
IteratedHeckeBounds/LemLz.lean e53a026eae60e04faef24dbf10d4838ab4662348
SBridgeAlt.lean ec6c9ebdf9477b507dee27a41d1b7ddd12fe9106
ArithmeticGapBounds/SGapOf.lean 678c1eb08c507a233df663cbb5b42d332fd546d2
ArithmeticGapBounds/SGapOfParts.lean 88837e45dc5c0290bc36e35f76be5c27b38e2765
Mathlib: LinearAlgebra/Alternating/Basic.lean fb400ee7e5888328effef2d282b3dfe18371253a,
Topology/Algebra/Module/Alternating/Basic.lean d010eb5a66c9606963d401fd9360460d0d03b6a7,
Data/Fin/Tuple/Sort.lean a622f342828f3ff86e08a02e3d9e2f5ab72ac9d8,
GroupTheory/Perm/Sign.lean 59fb103146af1783e2b38c5f0c38915eb2667c35.

RESULT: at native lem_bound, only strictly increasing basis tuples
need the initial Lz premise and the actual lem_gap spectral estimate.
Let q=k+1, d=dim HS, b_i the native basis, and f_v(x)=fr omega x (b_v).
Repeated index -> f_v identically zero for every iterate.
Otherwise w=v o sort(v) is strictly increasing, and
  f_w(x)=sign(sort(v)) f_v(x),
with the SAME sign for all x and all Hecke iterates. Hence the
Lz property and square integral estimates transport exactly.
There are binom(d,q) genuinely distinct coordinate premises instead
of d^q ordered evaluations; if q>d all forms vanish. The exact energy
identity sum_v f_v(x)^2 = q! sum_{strict w} f_w(x)^2 also follows.
The candidate keeps the native full sum/reconstruction to avoid changing
norm constants, but calls lem_gap only on the sorted representative.
No claim that Lean elaboration enumerates tuples or that actual runtime
is reduced; these are counts of mathematical coordinate obligations.
Native gap proof sGap_of_parts even yields 2/5 before weakening to 3/5;
we retain the original 3/5 for interface compatibility. No new assumption.
The native Lz supplier lem_Lz still provides all directions (stronger),
and key48 now consumes only the restricted interface. Original graph:
bStarOdd -> sSurj -> key -> lem_bound -> lem_gap(v), hLz0(u), all v;
sGap_of -> sGap_of_parts -> gapAbs_of, arith_holds, dens_holds etc.
Reduced candidate bStarOdd48 -> sSurj48 -> key48 -> lem_bound48 ->
lem_gap(w strictly increasing), hLz0(w), alternation/sort/sign;
all native gap, local overlap, mean, integrability, height, and
stabilization suppliers survive. No upstream lemma globally retired.
Source-visible graph only; same L,N,k,pi,d,omega,r/basis context
and role required for caching. Preserve original fallback and previous
RUN45-47 candidates; independent composition with RUN47 outstanding.

Executed 64373 exact JS assertions, 34636 ordered tuple
cases over d=1..7,q=1..5, 10 negative controls. Reproduce:
V(v)=prod_{i<j}(v[j]-v[i]); enumerate every tuple v; compare V(v)
with permutation sign times V(sort v); check repeated zero, orbit
counts binom(d,q), orbit multiplicity q!, exact sum V(v)^2=q! sum
V(w)^2. Nonalternating product and asymmetric linear examples show
why neither reduction is licensed without alternation. These are
algebraic regression controls, NOT evaluations of the native HS or RH.
Source substitutions required exact reversal, sole sorted gap call
and unchanged caller. Failed SGapOf path (404), corrected via SBridge.
No local lean/lake/elan. Native engine CI historical status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read: returncode 0, pass
for runs 45577239749 and 45576756833 ONLY. New candidate not run;
no new axiom evidence or kernel closure. Native prune/scan and
bounded backtracking supplied below, not represented as executed.
RESUME HERE: native replay lemma lem_bound48 (check units sign simp,
Lz negation and sorted basis elaboration), combine with RUN47 key47
and inspect actual SLoc overlap for a direct common finite-family bound.
HANDOFF TO kernel, audit, integration. RH OPEN.
-/

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL

namespace PositivityTheory.KB.JoinReconstruction

theorem lz_neg48 {L : Type} [Field L] [NumberField L] {N : ℕ}
    (d : Dom L N) {f : Gp L N → ℝ} (hf : Lz d f) : Lz d (fun x => -f x) := by
  obtain ⟨hc, he, hs, hi, h0⟩ := hf
  refine ⟨hc.neg, fun γ x => by rw [he], fun s x => by rw [hs], ?_, ?_⟩
  · simpa only [neg_sq] using hi
  · rw [integral_neg, h0, neg_zero]

theorem lem_bound48 (hGap : SGap) (hLoc : SLoc) (L : Type) [Field L] [NumberField L] (hC : IsTotallyComplex L)
    (π : 𝓞 L) (hπ : Prime π) (hπ25 : 25 ≤ Ideal.absNorm (Ideal.span {π})) (N k : ℕ) (h3N : 3 ≤ N)
    (d : Dom L N) (ω₀ : Form (HS L N) (k + 1)) (hω₀G : Good ω₀) (hω₀γ : ∀ γ, FInv ω₀ (emb L N γ))
    (hω₀s : ∀ s, FInv ω₀ (scal L N s)) (hLz0 : ∀ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)), StrictMono v →
      Lz d (fun x => fr ω₀ x (fun i => Module.finBasis ℝ (HS L N) (v i))))
    (z : Chn (Gm L N) (k + 1)) (hz : IsCyc z) :
    ∃ C : ℝ, ∀ r : ℕ, |ev (toK L N) ((hecke (toK L N) (MonoidHom.id (GK L N)) (qel L N π hπ.ne_zero))^[r]
      (fun y => intP ω₀ fun j => toP L N (y j) • one L N)) 1 z| ≤ C * (3 / 5 : ℝ) ^ r := by
  obtain ⟨K, hK0, hK⟩ := lem_nrm (L := L) (N := N) k
  obtain ⟨Cz, hCz⟩ := hLoc L N k (by omega) d z hz
  obtain ⟨S0, hS0⟩ : ∃ S0, S0 = ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ := ⟨_, rfl⟩
  refine ⟨|Cz| * √(K * S0), fun r => ?_⟩
  rw [ev_toK _ _ (hecke_iter (qel L N π hπ.ne_zero) hω₀G.1 r) z]
  obtain ⟨ωr, hωr⟩ : ∃ ωr, ωr = (Hk (qel L N π hπ.ne_zero))^[r] ω₀ := ⟨_, rfl⟩
  rw [← hωr]
  obtain ⟨hrG, hrγ, hrs⟩ := Hk_iter_props (qel L N π hπ.ne_zero) hω₀G hω₀γ hω₀s r
  rw [← hωr] at hrG hrγ hrs
  have hLzr : ∀ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      Lz d (fun x => fr ωr x fun i => Module.finBasis ℝ (HS L N) (v i)) ∧
      ∫ x in d.D, fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ ≤
        ((3 / 5 : ℝ) ^ 2) ^ r * ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
    fun v => by
      classical
      by_cases hv : Function.Injective v
      · let σ := Tuple.sort v
        let w := v ∘ σ
        have hwi : Function.Injective w := hv.comp σ.injective
        have hw : StrictMono w := fun i j hij =>
          lt_of_le_of_ne ((Tuple.monotone_sort v) hij.le) (hwi.ne hij.ne)
        have h := lem_gap hGap hC π hπ hπ25 h3N d _ (hLz0 w hw) r
        rw [← comp_Hk_iter, ← hωr] at h
        have hp (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
            fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) =
              Equiv.Perm.sign σ • fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) := by
          simpa only [w, Function.comp_def] using
            (fr ω x).toAlternatingMap.map_perm (fun i => Module.finBasis ℝ (HS L N) (v i)) σ
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with hsign | hsign
        · have he (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
              fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) =
                fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) := by
            simpa [hsign] using (hp ω x).symm
          simpa only [he] using h
        · have he (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
              fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) =
                -fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) := by
            have hh := hp ω x
            simp [hsign, Units.smul_def] at hh
            linarith
          refine ⟨?_, ?_⟩
          · simpa only [he] using lz_neg48 d h.1
          · simpa only [he, neg_sq] using h.2
      · have hzero (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
            fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) = 0 := by
          apply ContinuousAlternatingMap.map_eq_zero_of_not_injective
          intro hi
          exact hv (fun i j hij => hi (congrArg (Module.finBasis ℝ (HS L N)) hij))
        simp [hzero, Lz]
  have hsumint : Integrable (fun x => K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2) (d.μ.restrict d.D) :=
    (integrable_finsetSum _ fun v _ => (hLzr v).1.2.2.2.1).const_mul _
  have hint_r : IntegrableOn (fun x => ‖fr ωr (ofS L N x)‖ ^ 2) d.D d.μ :=
    Integrable.mono' hsumint ((lem_meas d hrG.1).norm.pow 2) (Filter.Eventually.of_forall fun x => by
      show ‖‖fr ωr (ofS L N x)‖ ^ 2‖ ≤ _
      rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]; exact hK _)
  have hIr : ∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ ≤ ((3 / 5 : ℝ) ^ 2) ^ r * (K * S0) := by
    calc ∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ
        ≤ ∫ x in d.D, K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
            fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
          integral_mono hint_r hsumint fun x => hK _
      _ = K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
            ∫ x in d.D, fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ := by
          rw [integral_const_mul, integral_finsetSum _ fun v _ => (hLzr v).1.2.2.2.1]
      _ ≤ K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)), ((3 / 5 : ℝ) ^ 2) ^ r *
            ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
          mul_le_mul_of_nonneg_left (Finset.sum_le_sum fun v _ => (hLzr v).2) hK0
      _ = ((3 / 5 : ℝ) ^ 2) ^ r * (K * S0) := by rw [hS0, ← Finset.mul_sum]; ring
  have hsq : √(((3 / 5 : ℝ) ^ 2) ^ r * (K * S0)) = (3 / 5 : ℝ) ^ r * √(K * S0) := by
    rw [← pow_mul, mul_comm 2 r, pow_mul, Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq (by positivity)]
  calc |ev (emb L N) (intP ωr) (one L N) z|
      ≤ Cz * √(∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ) := hCz _ hrG hrγ hrs hint_r
    _ ≤ |Cz| * √(((3 / 5 : ℝ) ^ 2) ^ r * (K * S0)) :=
        mul_le_mul (le_abs_self _) (Real.sqrt_le_sqrt hIr) (Real.sqrt_nonneg _) (abs_nonneg _)
    _ = |Cz| * √(K * S0) * (3 / 5 : ℝ) ^ r := by rw [hsq]; ring


theorem key48 (hPrime : SPrime) (hHecke : SHecke) (hHt : SHt) (hPU : SPU) (hMom : SMom) (hWhit : SWhit)
    (hCen : SCen) (hGap : SGap) (hLoc : SLoc) (hMean : SMean) (hInv : SInv) : SSurj := by
  intro L _ _ hC k hkr n₀
  obtain ⟨π, hπ, hπ25⟩ := hPrime L
  obtain ⟨a, hPUa⟩ := hPU L hC
  obtain ⟨N₀, hN₀⟩ := hHecke L hC k hkr π hπ
  obtain ⟨N₁, hN₁⟩ := hMom L hC (2 * (a * (k + 1)))
  obtain ⟨N, hN⟩ : ∃ N, N = max (max N₀ N₁) (max n₀ 3) := ⟨_, rfl⟩
  have hN0 : N₀ ≤ N := by rw [hN]; exact (le_max_left N₀ N₁).trans (le_max_left _ _)
  have hN1 : N₁ ≤ N := by rw [hN]; exact (le_max_right N₀ N₁).trans (le_max_left _ _)
  have hn₀ : n₀ ≤ N := by rw [hN]; exact (le_max_left n₀ 3).trans (le_max_right _ _)
  have h3N : 3 ≤ N := by rw [hN]; exact (le_max_right n₀ 3).trans (le_max_right _ _)
  have h1N : 1 ≤ N := by omega
  refine ⟨N, hn₀, fun c hcI hcd => ?_⟩
  obtain ⟨d, hd⟩ := hN₁ N hN1
  obtain ⟨ω', hω'G, hω'γ, hω's, hω'z, K, hK⟩ :=
    lem_form hHt hPU hWhit hCen L hC k a N h1N (hPUa N h1N) c hcI hcd
  obtain ⟨_, _, ⟨c0, hc0, hc0le⟩, _⟩ := hHt L hC N h1N
  have hht0 : ∀ x, 0 ≤ ht x := fun x => hc0.le.trans (hc0le x)
  haveI : IsFiniteMeasure (d.μ.restrict d.D) := isFiniteMeasure_restrict.2 d.fin.ne
  have hsq' : IntegrableOn (fun x => ‖fr ω' (ofS L N x)‖ ^ 2) d.D d.μ := by
    refine Integrable.mono' (hd.const_mul (K ^ 2)) ((lem_meas d hω'G.1).norm.pow 2)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖‖fr ω' (ofS L N x)‖ ^ 2‖ ≤ K ^ 2 * ht (ofS L N x) ^ (2 * (a * (k + 1)))
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), mul_comm 2 (a * (k + 1)), pow_mul, ← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hK _) 2
  have hint' : IntegrableOn (fun x => fr ω' (ofS L N x)) d.D d.μ := by
    refine Integrable.mono' (hsq'.add (integrable_const (1 : ℝ))) (lem_meas d hω'G.1)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖fr ω' (ofS L N x)‖ ≤ ‖fr ω' (ofS L N x)‖ ^ 2 + 1
    nlinarith [sq_nonneg (‖fr ω' (ofS L N x)‖ - 1)]
  obtain ⟨ωb, hωbI, hωbfr⟩ := hMean L N (k + 1) h1N d ω' hω'G.1 hω'γ hω's hint'
  have hωbG : Good ωb := (hInv L N k ωb hωbI).1
  have hγ0 : ∀ γ, FInv (ω' - ωb) (emb L N γ) := fun γ => finv_sub (hω'γ γ) (hωbI _)
  have hs0 : ∀ s, FInv (ω' - ωb) (scal L N s) := fun s => finv_sub (hω's s) (hωbI _)
  have hLz0 := lem_Lz d hω'G.1 hωbG.1 hγ0 hs0 hωbfr hint' hsq'
  have e2 : intP (ω' - ωb) = fun y => intP ω' y - intP ωb y := funext (intP_sub hω'G.1 hωbG.1)
  have hG0 : Good (ω' - ωb) := by
    refine ⟨hω'G.1.sub hωbG.1, ?_⟩
    rw [e2, dC_sub, hω'G.2, hωbG.2]
    funext y
    simp
  have hFI : Inv (toK L N) (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) :=
    fun γ y => by
      show (intP (ω' - ωb) fun j => toP L N (toK L N γ • y j) • one L N) =
        intP (ω' - ωb) fun j => toP L N (y j) • one L N
      simp only [smul_eq_mul, map_mul, mul_smul]
      exact intP_inv (hγ0 γ) _
  have hFd : dC (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) = 0 := by
    funext y
    have h4 := congrFun hG0.2 (fun j => toP L N (y j) • one L N)
    simp only [dC, Pi.zero_apply] at h4 ⊢
    exact h4
  have hF0 := hN₀ N hN0 _ hFI hFd fun z hz =>
    lem_bound48 hGap hLoc L hC π hπ hπ25 N k h3N d (ω' - ωb) hG0 hγ0 hs0 (fun v _ => hLz0 _) z hz
  refine ⟨ωb, hωbI, fun z hz => ?_⟩
  have h5 := hF0 z hz
  rw [ev_toK _ (intP (ω' - ωb)) (fun y => rfl) z, e2, ev_sub] at h5
  rw [← hω'z z hz]
  linarith


end PositivityTheory.KB.JoinReconstruction

namespace PositivityTheory.KB

theorem sSurj48 : SSurj := by
  first
  | (rh_reduce 2 using [JoinReconstruction.key48]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact JoinReconstruction.key48 sPrime_of sHecke sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInv

theorem bStarOdd48 : BStarOdd :=
  sBStarOdd_of sChain sSep' sBridge sStab sSurj48
    (sWtOdd_of sChain sEv sPsi sStokes_of)

end PositivityTheory.KB
end

rh_prune PositivityTheory.KB.JoinReconstruction.lem_bound as RHStructure48BoundPruned
rh_scan PositivityTheory.KB.JoinReconstruction.lem_bound limit 2000
rh_scan PositivityTheory.KB.JoinReconstruction.lem_bound48 limit 2000
rh_scan PositivityTheory.KB.bStarOdd48 limit 2000
#print axioms PositivityTheory.KB.JoinReconstruction.lem_bound
#print axioms PositivityTheory.KB.JoinReconstruction.lem_bound48
#print axioms PositivityTheory.KB.sSurj48
#print axioms PositivityTheory.KB.bStarOdd48
