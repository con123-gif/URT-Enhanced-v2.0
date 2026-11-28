import New.Selmer.TwistTheorem

/-!
RUN100 — PREPARED, NOT NATIVE VERIFIED. 28 Nov 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Actual caller New/Selmer/TwistTheorem.lean blob bdf0bed65edefd067b584695b1fac0b6acbbd754;
RootsOfUnityPoints.lean blob 7c07be15e6c410124a9bc5ecb470e7750ac67074.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN98 bd2a59d4 human single-exclusion argument, section 1 only; no dependence
on the pending RUN96/97 new root selector. Preserve first line selector unchanged.

New proof: g=gcd(d,ℓ^N) divides ℓ^log_ℓ(m) because g is an ℓ-power and g≤d≤m.
Let x=ζ^g. Since x^(ℓ^N/g)=1, d/g is coprime to orderOf x, so x is a
nonnegative integral power of ζ^d. Then ζ^(ℓ^log_ℓ(m)) is likewise such a
power. Use the original nonarchimedean norm power inequality. No primitive
root or exact order premise; handles ζ^d=1 and N=0. m=0 has no power
indices, but the single degree-1 exclusion is still allowed at L=1.
The original multivariate selector with one monic polynomial supplies all
the pointwise bounds on F without weakening the common witness.

Actual static checks in JS: three unique reversible replacements (theorem
name, second selector supplier, second selector call); three damaged-anchor
negative controls rejected. Original complete statement identical modulo
name; all code after 'replace f s :=' byte-identical. Source of Nat.dvd_prime_pow,
Nat.le_log_of_pow_le, Nat.gcd_div (use in ModEq), exists_pow_eq_self_of_coprime,
orderOf_dvd_of_pow_eq_one, Coprime.of_dvd_right, monic_X_pow_sub_C and
natDegree_X_pow_sub_C inspected at the pinned Mathlib commit. These are
source checks, not elaboration. No Lean/lake executable locally; no new
rh_scan/prune/reduce/auto/frontier, axiom result or graph comparison.
Latest peer heads 393ed5ff (theta), 0033842b (conditioned moments),
57c55e2e (URT weighted fixer). C1 RUN99 state status.json and run93_receipt.json
both 404 when queried; queue still outstanding, no duplicate job registered.
Retain original and reduced graphs, all failed receipts, and all other
C1 foundations including tied pencil, sharp Fitting, crystalline and length.
C1 and RH OPEN.

RESUME HERE: inspect compute/rh-compact-c1-finite-cache-path-repair-20261128/
outputs/run93/run93_receipt.json on cathedral-research-state, repairing the
first actual diagnostic or handing accepted finite_fused_run92 to the
existing squared C consumer. Only then schedule this independent candidate
for exact original statement comparison, standard axiom check and
constructor-inclusive reachability of the new twist caller (not Main).
HANDOFF integration/kernel/audit.
-/

section SingleExclusionRun100
open Polynomial Filter Finset Real IsUltrametricDist NeZero Function Fint CoeffRing
variable {ℓ : ℕ} [prime : ThePrime ℓ] {κ : Type}

lemma ellVal_power_le_run100 {m N d : ℕ} (hd : 0 < d) (hdm : d ≤ m)
    (ζ : PadicAlgCl ℓ) (hnorm : ‖ζ‖ ≤ 1) (hz : ζ ^ ℓ ^ N = 1) :
    ellVal (ζ ^ d - 1) ≤ ellVal (ζ ^ (ℓ ^ Nat.log ℓ m) - 1) := by
  let P := ℓ ^ N
  let g := Nat.gcd d P
  have hgd : g ∣ d := Nat.gcd_dvd_left _ _
  have hgP : g ∣ P := Nat.gcd_dvd_right _ _
  have hgpos : 0 < g := Nat.gcd_pos_of_pos_left _ hd
  obtain ⟨j, hj, hgj⟩ := (Nat.dvd_prime_pow prime.out).1 hgP
  have hjlog : j ≤ Nat.log ℓ m := Nat.le_log_of_pow_le prime.out.one_lt
    (hgj ▸ (Nat.le_of_dvd hd hgd).trans hdm)
  have hgE : g ∣ ℓ ^ Nat.log ℓ m := by
    obtain ⟨k, hk⟩ := Nat.exists_eq_add_of_le hjlog
    rw [hgj, hk, pow_add]
    exact dvd_mul_right _ _
  have hcop : Nat.Coprime (d / g) (P / g) := by
    change Nat.gcd (d / g) (P / g) = 1
    rw [Nat.gcd_div hgd hgP]
    exact Nat.div_self hgpos
  have hpow : (ζ ^ g) ^ (P / g) = 1 := by
    rw [← pow_mul, Nat.mul_comm g, Nat.div_mul_cancel hgP]
    exact hz
  have hd' : (ζ ^ g) ^ (d / g) = ζ ^ d := by
    rw [← pow_mul, Nat.mul_comm g, Nat.div_mul_cancel hgd]
  obtain ⟨c, hc⟩ := exists_pow_eq_self_of_coprime
    (x := ζ ^ g) (hcop.of_dvd_right (orderOf_dvd_of_pow_eq_one hpow))
  rw [hd'] at hc
  obtain ⟨e, he⟩ := hgE
  have hpower : (ζ ^ d) ^ (c * e) = ζ ^ (ℓ ^ Nat.log ℓ m) := by
    rw [pow_mul, hc, ← pow_mul, he]
  apply ellVal_le_ellVal
  rw [← hpower]
  exact norm_pow_sub_one_le_norm_sub_one
    (show ‖ζ ^ d‖ ≤ 1 by rw [norm_pow]; exact pow_le_one₀ (norm_nonneg _) hnorm) _

lemma exists_roots_of_unity_all_powers_run100 [Finite κ] {δ : NNReal}
    (hδ : 0 < δ) (m a q : ℕ) (B : κ → NNReal) :
    ∀ᶠ N in atTop, ∀ᶠ O : CoeffRing ℓ in atTop,
    ∀ (σ : Type) [Fintype σ], Fintype.card σ ≤ q →
    ∀ (F : κ × Set.Icc 1 m → MvPolynomial σ _) (u : _ → _ → ↑O),
    (∀ k j, ↑ℓ ∣ (u k j - 1) ^ a) →
    (∀ k, ellVal ((F k).eval (u k)).1 ≤ B k.1) →
    ∃ ζ : σ → ↑O, (∀ k, ellVal ((F k).eval (ζ · ^ k.2.1)).1 ≤
    ↑(δ + B k.1)) ∧ ∀ j, ζ j ^ ℓ ^ N = 1 ∧
    ∀ n : Set.Icc 1 m, ellVal ((ζ j ^ n.1 - 1 : ↑O).1) ≤ δ := by
  let E := ℓ ^ Nat.log ℓ m
  have hE : E ≠ 0 := ne_of_gt (pow_pos prime.out.pos _)
  refine (exists_roots_of_unity_ellVal_le hδ m E a q B).mono
    fun N hN ↦ hN.mono fun O hO σ _ hq F u hu hB ↦ ?_
  let D : Fin 1 → O.1[X] := fun _ ↦ Polynomial.X ^ E - Polynomial.C 1
  obtain ⟨ζ, hF, hζ⟩ := hO σ (Fin 1) hq D F u
    (fun _ ↦ Polynomial.monic_X_pow_sub_C 1 hE)
    (by simp [D, Polynomial.natDegree_X_pow_sub_C]) hu hB
  refine ⟨ζ, hF, fun j ↦ ⟨(hζ j).1, ?_⟩⟩
  intro n
  have hw : ellVal ((ζ j).1 ^ E - 1) ≤ δ := by
    simpa [D] using (hζ j).2 (0 : Fin 1)
  have hz' : (ζ j).1 ^ ℓ ^ N = 1 := by
    exact_mod_cast (hζ j).1
  simpa using (ellVal_power_le_run100
    (m := m) (N := N) (d := n.1) (by omega : 0 < n.1)
    n.2.2 (ζ j).1 (norm_le_one (ζ j)) hz').trans hw
end SingleExclusionRun100

open Module Fintype NeZero Finset Fint
variable {ℓ} [ThePrime ℓ] {E ι : Type} [Field E] [UnramCMField E] [Finite ι] {n : ι → Type} [∀ i,
  Fintype (n i)] {S₀ S : Finset (FinPlace E)} {z M} {γ β : ι → _} (hS : S ⊆ S₀) (hz :
  z ∈ inertiaAbove (S₀ \ placesDividing E ℓ))
include hS hz
attribute [-simp] Set.insert_eq_of_mem

open Matrix Filter MvPolynomial ENNReal NNReal CoeffRing IsDiscreteValuationRing Subalgebra

lemma exists_anticyclotomic_twist_run100 {κ T : Type} [Finite κ] [Finite T] {O : CoeffRing ℓ} {ρ : ∀ i,
  _ →* Matrix _ (n i) O} {μ : κ → T → _} {L : ∀ _, _} {B : ι → _} (hρ : ∀ i, IsBalanced ℓ S (ρ i)
  (L i) (γ i) (β i) M) {val : κ → _} (hf : ∀ k, IsFamily S₀ (μ k) (val k)) (hB : ∀ i, B i ≠ ⊤) (hβ :
  ∀ i, O.normLength (β i + ∑ b, addVal _ (ρ i (idOrConjInv b z) - 1).det) ≤ B i) {c η : ℝ≥0} (hc :
  ∀ k t, ellVal ((μ k t z).1 - 1) ≤ c) (hη : 0 < η) m : ∃ I ψ, ∀ d ∈ Set.Icc 1 m,
  (∀ k, ellVal (val k I (ψ ^ d)) ≤ ellVal (val k ∅ 1) + 8 * c + η) ∧ IsAuxTwist S₀ I (ψ ^ d) η ∧
  ∀ i, ∀ᶠ O' in atTop, ∃ hO : O ≤ O', ∃ ψ', (∀ g, (ψ' g).1 = (ψ ^ d) g) ∧
  O'.normLength (length O' (selmerModule (twistRep (inclusion hO).1 ψ' (ρ i)) (unionWithConj S I)
  (mapRel (inclusion hO).1 '' (L i ∪ {.single (γ i) 1})) (QuotSpan (ℓ ^ M : ↑O')))) ≤ B i + η := by
  choose J₀ hJ using exists_isPencil hS hz hρ ((Eventually.all fun k ↦ .all fun t ↦
    ((IsUltrametricDist.isClosed_ball ..).preimage (Units.continuous_val.comp ((hf _).1
    _))).compl_mem_nhds (ellVal_le_iff.1 (hc k t)).not_gt).and (.all fun i ↦ (((hρ
    i).1.comp_continuous continuous_conjGal.inv).prodMk (hρ i).1).eventually_eq z)) dvd_rfl
  choose δ hδ _ using exists_pos_mul_lt hη (J₀ * 8 + 2)
  lift B ⊕ᵥ fun k ↦ ellVal (val k ∅ 1) + 8 * c to ι ⊕ κ → ℝ≥0 using by
    simp [ellVal, mul_eq_top, (hf _).4, *] with b W
  choose k hk using (exists_roots_of_unity_ellVal_le hδ 1 _ 1 _ b).exists
  choose N hN l using ((exists_roots_of_unity_all_powers_run100 hδ m _ J₀ (δ + b · + J₀ * 8 * δ)).and
    (Ici_mem_atTop _)).exists
  choose P₀ J x hp hJ hl using hJ N
  let θ (j : J) := (x j).1.h
  obtain ⟨A, o, q, a⟩ := hp.1, hp.2, J.erase_subset P₀, fun j : J ↦ hp.3 _ j.2
  have Q {y hy I} (_ : ∀ j, ↑j ∉ I → y j = (1 : PadicAlgCl ℓ) := by simp +contextual [t]) :
      IsFromU1 (placesDividing E ℓ) I (pointChar θ y hy) := by
    choose φ e b d using (a · |>.exists_ideleChar)
    use (LocallyConstant.unflip (⟨θ ·, (a _).isLocallyConstant⟩)).2.comp
      (pointChar (Pi.evalMonoidHom _) y hy), pointChar φ y hy, by simp [e], fun u h k ↦
      prod_eq_one _ fun j ↦ by by_cases j.1 ∈ I <;> simp +contextual [*], (by simp [θ, d _ · · ·])
  have U {I} : I ⊆ J → IsAuxiliary S₀ I := by clear * - A; grind
  have K {k} I (v : J) s := ((hf k).3 I v · (U s) · · _ _ (a v).3 (a v).4)
  choose O' hN hk hO hm V hV using (hN.and (hk.and (.and (Ici_mem_atTop O) (.and (.all fun p :
    (κ × T) × J × ℤˣ ↦ eventually_mem (norm_eq_one_of_continuous ((hf p.1.1).1 p.1.2) ((x
    p.2.1).1.φ ^ p.2.2.1)).le) (.all fun p : κ × Set.Iic J ↦ (
    let ⟨_, _, g, c, a, b⟩ := (hf p.1).2 _ (U p.2.2); .mono (.all (eventually_mem <| a ·)) fun O H ↦
    ⟨∑ i, C ⟨_, H i⟩ * ∏ j, X j ^ (θ j (g i)).toAdd.val, by simp [b]⟩ : ∀ᶠ O : CoeffRing ℓ in _,
    ∃ F, ∀ {y} hy, (eval y F : O.1).1 = val p.1 p.2 (pointChar θ (y ·) hy))))))).exists
  let e := (inclusion hO).1
  have r i := hp.length_le_of_drop_ties i (by simp [reduceModPow,
    (hρ i).2 · <| ·.imp fun _ ↦ by gcongr]) k l fun _ ↦ id
  let t (s : ι ⊕ κ) (j : J) := ite (↑j = P₀) 1 (s.elim (e ∘ (x j).2) 0)
  choose G g g' using fun i ↦ exists_sharp_fitting_poly (.id _) _ (a · |>.isLocallyConstant)
    (hρ i).1 (L i ∪ {.single (γ i) 1} ∪ tieRelations (J.erase P₀) x i) _
  -- First along a line.
  choose u f₃ p s using hk (Fin 1) (J × ι × Bool ⊕ _) le_rfl ((fun (v, i, b) ↦ ((ρ i (idOrConjInv b
    (x v).1.φ)⁻¹).map e).charpoly) ⊕ᵥ (.X - .C ⟨_, hm ·⟩)) (fun s ↦ eval₂ C (fun j ↦ 1 + C (t s.1 j)
    * (X 0 - 1)) (s.1.elim (.map e ∘ G) (V ⟨·, {P₀}, by simpa⟩))) 1 (by simp [↓charpoly_monic,
    Polynomial.Monic]) (by simp [↓sum_prod_type]; grw [hJ]) (by simp) (by
    rintro ⟨i | k', _⟩ <;> simp [← eval_assoc, congrFun W, hV]
    · grw [← hβ, ← hl]
      convert normLength_mono ((g i).trans (r i _ _ (one_pow _) {P₀} (idOrConjInv ·.2 z) (by simpa)
        (by simp) (by simpa using! hp.5.2 i))) <;> simp [e, eval₂_eq', eval_eq' _ (G i),
        sum_prod_type, mapRel.eq_def, twistAtPoint, funext_iff] <;> clear * - o <;> refine ?u
      ext; simp [tieRelations]; grind
    convert! K ∅ ⟨_, o⟩ (by simpa) nofun 1 ⟨.const _, 1, by simp⟩ c (by
      simpa [ellVal_le_iff, dist_eq_norm'] using hp.5.1 k')
    ext; simp)
  choose F f ϕ using fun i ↦ exists_sharp_fitting_poly e _ (a · |>.isLocallyConstant) (hρ i).1 ..
  simp [← eval_assoc, Function.comp_def] at f₃ p
  -- Then to common roots of unity.
  choose ζ f hζ w using hN J (by simpa) (·.1.elim F (V ⟨·, J, by simp⟩)) _ (fun s j ↦
    (dvd_one_add_mul_pow_sub_one (t s.1 j) p 0 .refl).1) (by
    rintro ⟨i | k', _⟩ <;> simp
    · grw (transparency := default) [← normLength_addVal, (f i).trans (r i _ e p _ _ q (by simp)
        fun _ ↦ rfl), g' i _ e, map_add, normLength_addVal, f₃.1, map_sum, sum_le_sum fun z _ ↦
        normLength_addVal _ ▸ (ellVal_le_ellVal ((dvd_iff_norm_le ..).1 ⟨det _, by
          erw [eval_charpoly, ← det_mul, sub_one_mul]; congr
          simp [← Matrix.map_mul, ← map_mul, smul_one_eq_diagonal]⟩)).trans
        (s 0 (.inl (⟨_, q z.1.2⟩, i, z.2))), ← hJ]
      simp; gcongr; norm_num
    have y j : (1 + t (.inr k') j * (u 0 - 1)).1 ^ ℓ ^ N = 1 := mod_cast l.dest.choose_spec ▸ by
      simp [pow_add, pow_mul, t, add_ite, *]
    grw [← f₃.2, hV _ y, hV _ y, ← hJ, ← q,
      ← @Finset.induction_on' _ (fun I ↦ ellVal (val k' (insert
      P₀ I) (pointChar θ _ y)) ≤ _ + #I * 8 * _) _ _ (by simp) fun v I a b w i ↦ ?_, insert_erase o]
    lift v to J using q a
    simp at a
    grw [I.insert_comm, K _ v (by grw [b]; simp [*]) (by simp [*]) _ Q δ fun z t ↦ (ellVal_le_ellVal
      ((hp.pointChar_idOrConjInv y v true).2 a ▸ by fin_cases t <;> simp [t,
      (isUnit_iff_norm_eq_one _).1 (.of_pow_eq_one p out),
      norm_eq_one_of_continuous, (hf _).1, sub_div', inv_eq_one_div, norm_pos_iff.1, norm_sub_rev,
      mul_comm (u 0).1, mul_one_div, -one_div])).trans (s 0 (.inr ((k', z), v, -t))), i]
    simp [w, add_mul, add_assoc])
  replace f s := (f s).trans (.trans_eq (coe_le_coe.2 (by linarith)) congr($W _ + η))
  have hd d j : (ζ j ^ d).1 ^ ℓ ^ N = 1 := mod_cast by simp [pow_right_comm _ d, hζ]
  use J, pointChar θ _ (hd 1), fun d e ↦ ?_
  rw [show _ ^ d = pointChar θ _ (hd d) by ext; simp [← prod_pow, pow_right_comm]]
  exact ⟨(hV .. ▸ f ⟨.inr ·, d, e⟩ :), ⟨A, Q, _, fun v ↦ ⟨(a v).5, map_one _, _, _, (a v).6.2.2⟩,
    (sum_le_card_nsmul _ _ ↑δ fun v _ ↦
    (hp.pointChar_idOrConjInv (hd d) v true).1 ▸ by simpa using w v ⟨d, e⟩).trans
    (by simp; grw [hJ]; norm_cast; bound)⟩, fun i ↦ mem_atTop_sets.2 ⟨O', fun R h ↦ ⟨hO.trans h,
    pointChar θ (inclusion h ∘ ζ ^ d) (Subtype.ext <| hd d ·), by simp, (normLength_mono
    (ϕ i _ (inclusion h).1 _)).trans (by simpa [eval₂_eq', eval_eq'] using f ⟨.inl i, d, e⟩)⟩⟩⟩

#print axioms ellVal_power_le_run100
#print axioms exists_roots_of_unity_all_powers_run100
#print axioms exists_anticyclotomic_twist_run100
#print axioms exists_anticyclotomic_twist
