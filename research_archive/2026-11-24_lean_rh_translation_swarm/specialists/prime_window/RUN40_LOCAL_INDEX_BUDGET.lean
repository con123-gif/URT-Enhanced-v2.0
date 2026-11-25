import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40 lane 3 prime_window, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED,
NOT COMPILED. RH OPEN. Actual native ZK.sFinal, not alternative KBridge.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine;
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d,
state/continuity and living proof 10e3d636 consulted (selected sections).
Peers de1f67ea (actual LemmaK fork), f26f77b4 (four-count core),
4ff04116 (projected odd rank), c55df0a0 (factorial charge), RUN39 79428d5b.
Route correction: RUN39 is alternative, not actual ZK.lemmaK body.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed 07be9a52ebbee066d706195cad0f6863880f9284,
not substituted. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT. Fix actual L,D,l,e (e>=1), n=[L:Q], and for v above l
let i_v=[Z_l^*:decImage(L,l,D.A(v))], r=#places above l.
Native sf_loc bounds EACH i_v by n then counts r<=n, losing log_l n.
Instead the joint index budget is sum_v i_v<=n.

Human proof of budget: write L_v for completion at v. The decomposition
group in the algebraic closure identifies with the local absolute
Galois group (via extension to the henselization and completion);
the cyclotomic image is therefore the local cyclotomic character image.
Over Q_l the cyclotomic character is onto Z_l^*: the l-power cyclotomic
extensions have full groups (Z/l^a)^* (shifted prime-power cyclotomic
polynomial is Eisenstein). For subgroup H of finite index d in G
and onto f:G->U, [U:f(H)]<=d by the surjection of coset sets.
Take G=Gal(Q_l^alg/Q_l), H=Gal(Q_l^alg/L_v), then i_v<=[L_v:Q_l].
Sum local degrees using L tensor_Q Q_l=product_{v|l} L_v, of dimension n.
No Galois assumption on L/Q or extra quantitative conjecture.
The standard completion/decomposition identification is NOT formalized
in this certificate. Do not mark LocalIndexBudget40 kernel-closed.
Original ineOpen proves weaker individual i_v<=n and positivity.

By native sf_nu, nu_v(e)<=2+v_l(i_v)+v_l(e).
For i_v>=1, l^v_l(i_v)<=i_v and v_l(i_v)+1<=l^v_l(i_v).
Hence v_l(i_v)<=i_v-1 and
 sum_v nu_v(e)<=r*(1+v_l(e))+sum_v i_v<=n*(2+v_l(e)).
Native exact duality Formula yields before discarding global correction:
 VLen(D,e)+nuGal(l,L,e)<=shaLen(D,e)+n*(2+v_l(e)).
This includes l=2; no odd-prime LTE improvement used.
For direct replacement of sFinal use v_l(e)<=e. Its local correction is
n*(2+e), not n*(2+log_l n+e). Old numFin and all original PT/LF/LT/ShaK
premises suffice once budget is formalized. No changed LemmaK exponent,
proof of ShaK, or downstream RH bound claimed.

Pinned source ledger (relative to AutomorphicVarieties/):
ModularityArgument/ClassCounting/SFinal.lean a960a48653fa69c34f72f5f8ed434135ff1163a6
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
GaloisLibrary/GaloisCohomologyLength/IneOpen.lean 1379a7d94a7506cb119dd039428075c937b7be5d
GaloisLibrary/GaloisCohomologyLength/LevelInertiaLeLevelDec.lean 497c591dbb6981c12b4e99d280ed1c81d356adaf
GaloisLibrary/GaloisCohomologyLength/NonemptyH0GlobalEquivGaloisImage.lean 038fbd19dbb996a7353f20691993a400de0732f3
GaloisLibrary/GaloisCohomologyLength/Formula.lean cff8e2bcf570c27bd9970dbcb80df51eb41d7a26
GaloisLibrary/GaloisCohomologyLength/CardAbove.lean cc76a575c437d03c951429cdc4e67b2373a1420a
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975

Original source graph: VWin -> lemmaK_litN_alt -> ZK.lemmaK ->
lemmaK_of_steps -> sFinal -> sf_loc -> sf_nu, ineOpen, cardAbove,
Nat.log, plus numFin, ShaK, PT/LF/LT, VFormula and all sibling counts,
geometry, analytic suppliers. Candidate: sFinal40 -> sf_loc40 ->
sf_locVal40 -> LocalIndexBudget40,sf_nu40,ineOpen (positivity only).
Signed statement localSigned40 uses exact VFormula. Original fallback
and all unresolved role/type/constructor/axiom edges retained.
Cache by pin/toolchain,L,Omega,D,l,e, same local places and images,
PT/LF/LT,ShaK,budget proof. Backtrack to original sFinal if replay fails.

Executed connector JS: 9 source checks (pinned blob and unique
transformations; first trial wrong occurrence count rejected).
Actual cyclotomic fields Q(zeta_m), 3<=m<=150, l in
{3,5,7,11,13,17,19,23,29,31}: 1480 degree/index checks and
44400 local/twist checks. Reproduce: a=v_l(m), m0=m/l^a,
i=phi(l^a), d=ord_{m0}(l) (ord_1=1), r=phi(m0)/d, n=phi(m);
check r*i*d=n and r*i<=n. For e=1..30, nu=a+v_l(e) if a>0;
otherwise nu=1+v_l(e) if (l-1)|e, else 0. Check r*nu<=n*(2+v_l(e))
and (r-1)*nu<=n*(2+v_l(e))-nu. These use known local cyclotomic degree
formulas; not a test of general completion bridge or cohomology.
Lean/Lake not on local PATH. Baseline CI blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved returncode 0
(runs 45577239749,45576756833); not verification of this new file.
Engine/axiom commands are prepared requests, not results. No URT claim.

RESUME HERE: formalize the budget via sum of decomposition orbit
indices or completion tensor product dimensions, using actual ineOpen.
Batch replay sFinal40 and substitute as h21 in lemmaK_of_steps.
Independent audit requested. Retain ShaK, other counts, and geometry.
HANDOFF TO integration, Galois, literature, kernel, audit.
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK
open scoped BigOperators

def LocalIndexBudget40 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
      (∑ v : D.S, (LDataCardLeFinrank.decImage L l (D.A v)).index) ≤ Module.finrank ℚ L

private theorem sf_card40 (l : ℕ) [Fact l.Prime] (M : Type) [AddCommGroup M] [Module ℤ_[l] M]
    (h : IsFiniteLength ℤ_[l] M) : ∃ k : ℕ, Module.length ℤ_[l] M = k ∧ Nat.card M = l ^ k := by
  induction h with
  | @of_subsingleton M' _ _ _ =>
    refine ⟨0, Module.length_eq_zero, ?_⟩
    haveI := uniqueOfSubsingleton (0 : M')
    simp
  | @of_simple_quotient M _ _ N _ _ ih =>
    obtain ⟨k, hk, hc⟩ := ih
    obtain ⟨m, hm, ⟨e⟩⟩ := isSimpleModule_iff_quot_maximal.mp ‹IsSimpleModule ℤ_[l] (M ⧸ N)›
    rw [IsLocalRing.eq_maximalIdeal hm] at e
    have hq : Nat.card (M ⧸ N) = l := by
      rw [Nat.card_congr e.toEquiv]
      exact (Nat.card_congr PadicInt.residueField.toEquiv).trans (Nat.card_zmod l)
    refine ⟨k + 1, ?_, ?_⟩
    · rw [Module.length_eq_add_of_exact N.subtype N.mkQ N.injective_subtype N.mkQ_surjective
        (LinearMap.exact_subtype_mkQ N), hk, Module.length_eq_one]
      push_cast
      rfl
    · have h2 := AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup N.toAddSubgroup
      rw [h2]
      change Nat.card (M ⧸ N) * Nat.card N = _
      rw [hq, hc, pow_succ, mul_comm]

open KStar.TotallyRealRoots in
private theorem sf_nu40 {l : ℕ} [Fact l.Prime] (U : Subgroup ℤ_[l]ˣ) (h0 : U.index ≠ 0) {e : ℕ} (he : e ≠ 0) :
    nu l U e ≤ ((2 + padicValNat l U.index + padicValNat l e : ℕ) : ℕ∞) := by
  have hp : Prime (l : ℤ_[l]) := PadicInt.prime_p
  have hunit : IsUnit (1 + (l : ℤ_[l]) ^ 2) := by
    rw [PadicInt.isUnit_iff]
    have h1 : ‖((l : ℤ_[l]) ^ 2)‖ < 1 := by
      rw [norm_pow, PadicInt.norm_p]
      have h2 : (1:ℝ) < l := by exact_mod_cast (Fact.out : l.Prime).one_lt
      have h3 : (0:ℝ) < (l:ℝ)⁻¹ := by positivity
      have h4 : (l:ℝ)⁻¹ < 1 := inv_lt_one_of_one_lt₀ h2
      nlinarith
    rw [PadicInt.norm_add_eq_max_of_ne] <;> simp_all [ne_of_gt, le_of_lt]
  have hmem : hunit.unit ^ U.index ∈ U := U.pow_index_mem hunit.unit
  by_contra hcon
  push_neg at hcon
  have hle : (((2 + padicValNat l U.index + padicValNat l e + 1 : ℕ)) : ℕ∞) ≤ nu l U e := by
    have := Order.add_one_le_of_lt hcon
    exact_mod_cast this
  have hdvd := (KStar.TotallyRealRoots.le_nu_iff.1 hle) _ hmem
  have hw : ((hunit.unit ^ U.index : ℤ_[l]ˣ) : ℤ_[l]) ^ e = (1 + (l:ℤ_[l]) ^ 2) ^ (U.index * e) := by
    rw [Units.val_pow_eq_pow_val, IsUnit.unit_spec, pow_mul]
  rw [hw] at hdvd
  have hm := KStar.TotallyRealRoots.emultiplicity_pow_sub_one_sq (l := l) (u := 1 + (l:ℤ_[l]) ^ 2) (by simp) (U.index * e)
  rw [add_sub_cancel_left, emultiplicity_pow_self hp.ne_zero hp.not_unit,
    ← padicValNat_eq_emultiplicity (Nat.mul_ne_zero h0 he), padicValNat.mul h0 he] at hm
  have h5 := (pow_dvd_iff_le_emultiplicity).1 hdvd
  rw [hm] at h5
  norm_cast at h5
  omega


private theorem sf_locVal40 (hB : LocalIndexBudget40)
    {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω]
    [IsAlgClosure L Ω] (D : LData L Ω l) {e : ℕ} (he : e ≠ 0) :
    sumLocalH0TwistLength D e ≤
      ((Module.finrank ℚ L * (2 + padicValNat l e) : ℕ) : ℕ∞) := by
  classical
  rw [LDataCardLeFinrank.local_H0_length_eq_sum]
  let i : D.S → ℕ := fun v => (LDataCardLeFinrank.decImage L l (D.A v)).index
  have hi : ∀ v, i v ≠ 0 := by
    intro v
    obtain ⟨_, hi0, _⟩ := LDataCardLeFinrank.ineOpen L Ω l v (D.A v) (LDataCardLeFinrank.above_of_mem D v) (D.hA v)
    have hdvd := Subgroup.index_dvd_of_le (LDataCardLeFinrank.ineImage_le_decImage L l (D.A v))
    intro h
    change (LDataCardLeFinrank.decImage L l (D.A v)).index = 0 at h
    rw [h] at hdvd
    exact hi0 (Nat.eq_zero_of_zero_dvd hdvd)
  have hv : ∀ v : D.S, KStar.TotallyRealRoots.nu l
      (LDataCardLeFinrank.decImage L l (D.A v)) ((e : ℤ).natAbs) ≤
        ((i v * (2 + padicValNat l e) : ℕ) : ℕ∞) := by
    intro v
    have hpow : l ^ padicValNat l (i v) ≤ i v :=
      Nat.le_of_dvd (Nat.pos_of_ne_zero (hi v)) pow_padicValNat_dvd
    have hlt : padicValNat l (i v) < l ^ padicValNat l (i v) :=
      Nat.lt_pow_self (Fact.out : l.Prime).one_lt
    have hip : 1 ≤ i v := Nat.pos_of_ne_zero (hi v)
    have hval : padicValNat l (i v) + 1 ≤ i v := by omega
    have hnat : 2 + padicValNat l (i v) + padicValNat l e ≤ i v * (2 + padicValNat l e) := by
      have hm := Nat.mul_le_mul_right (1 + padicValNat l e) hip
      nlinarith
    have hne : (e : ℤ).natAbs ≠ 0 := by simpa using he
    have h := sf_nu40 (LDataCardLeFinrank.decImage L l (D.A v)) (hi v) hne
    exact h.trans (by exact_mod_cast hnat)
  calc _ ≤ ∑ v : D.S, ((i v * (2 + padicValNat l e) : ℕ) : ℕ∞) :=
        Finset.sum_le_sum fun v _ => hv v
    _ = (((∑ v : D.S, i v) * (2 + padicValNat l e) : ℕ) : ℕ∞) := by
      rw [Finset.sum_mul]
      push_cast
    _ ≤ _ := by
      exact_mod_cast Nat.mul_le_mul_right (2 + padicValNat l e) (hB l L Ω D)

private theorem sf_loc40 (hB : LocalIndexBudget40)
    {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω]
    [IsAlgClosure L Ω] (D : LData L Ω l) {e : ℕ} (he : e ≠ 0) :
    sumLocalH0TwistLength D e ≤ ((Module.finrank ℚ L * (2 + e) : ℕ) : ℕ∞) := by
  have hp : l ^ padicValNat l e ≤ e := Nat.le_of_dvd (Nat.pos_of_ne_zero he) pow_padicValNat_dvd
  have hlt : padicValNat l e < l ^ padicValNat l e := Nat.lt_pow_self (Fact.out : l.Prime).one_lt
  refine (sf_locVal40 hB D he).trans ?_
  exact_mod_cast Nat.mul_le_mul_left (Module.finrank ℚ L) (show 2 + padicValNat l e ≤ 2 + e by omega)

theorem localSigned40 (hB : LocalIndexBudget40)
    (hP : GlobalTheory.Published.PoitouTateDuality) (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω]
    [IsAlgClosure L Ω] (hc : PTCase L l) (D : LData L Ω l) {e : ℕ} (he : e ≠ 0) :
    VLen D (e : ℤ) + KStar.TotallyRealRoots.nuGal l L ((e : ℤ).natAbs) ≤
      shaLen D (e : ℤ) + ((Module.finrank ℚ L * (2 + padicValNat l e) : ℕ) : ℕ∞) := by
  rw [LDataCardLeFinrank.vFormula_of_classicalTheorems hP hF hT hc]
  exact add_le_add le_rfl (sf_locVal40 hB D he)

theorem UpperTheory.V.ZK.sFinal40 (hB : LocalIndexBudget40) :
    UpperTheory.V.ZK.SFinal := by
  rw [SFinal.eq_1]
  rintro hPT hLF hLTD ⟨C, hC⟩
  obtain ⟨CK, _, hCK⟩ := K.numFin C
  refine ⟨CK, ?_⟩
  rw [LemmaK.eq_1]
  intro l _ L Ω _ _ _ _ _ D htc hmu e he
  rw [ShaK.eq_1] at hC
  obtain ⟨s, hs, hslog⟩ := hC l L htc hmu e he
  set n := Module.finrank ℚ L with hn
  have hV := LDataCardLeFinrank.VLen_le_shaLen_add hPT hLF hLTD (LDataCardLeFinrank.ptCase_of_isTotallyComplex L l) D (e : ℤ)
  rw [VLen.eq_1, LDataCardLeFinrank.shaLen_eq_shaInv, hs] at hV
  have hloc := sf_loc40 hB D (e := e) (by omega)
  have hlen : Module.length ℤ_[l] (H2 (zlTw D ((e : ℤ) + 1))) ≤ ((s + n * (2 + e) : ℕ) : ℕ∞) := by
    rw [Nat.cast_add]
    rw [← hn] at hloc
    exact le_trans hV (add_le_add le_rfl hloc)
  have hfl : IsFiniteLength ℤ_[l] (H2 (zlTw D ((e : ℤ) + 1))) := by
    rw [← Module.length_ne_top_iff]
    exact ne_top_of_le_ne_top (ENat.coe_ne_top _) hlen
  obtain ⟨k, hk, hcard⟩ := sf_card40 l _ hfl
  have hkK : k ≤ s + n * (2 + e) := by
    rw [hk] at hlen
    exact_mod_cast hlen
  have hfin : Finite (H2 (zlTw D ((e : ℤ) + 1))) :=
    Nat.finite_of_card_ne_zero (by rw [hcard]; exact pow_ne_zero _ (Fact.out : l.Prime).ne_zero)
  refine ⟨hfin, ?_⟩
  rw [hcard, Nat.cast_pow, Real.log_pow]
  have hl1 : (1 : ℝ) < l := by exact_mod_cast (Fact.out : l.Prime).one_lt
  have hlogl : 0 ≤ Real.log l := Real.log_nonneg hl1.le
  have hn1 : 1 ≤ n := Module.finrank_pos
  have hD1 : 1 ≤ (discr L).natAbs := Int.natAbs_pos.2 (discr_ne_zero L)
  have hnR : (1 : ℝ) ≤ n := by exact_mod_cast hn1
  have heR : (1 : ℝ) ≤ e := by exact_mod_cast he
  have hDR : (1 : ℝ) ≤ (discr L).natAbs := by exact_mod_cast hD1
  have hln : (l : ℝ) ≤ n + 1 := by exact_mod_cast K.primeLe l L hmu
  have hX : Real.log l ≤ Real.log ((n : ℝ) + 1) := Real.log_le_log (by linarith) hln
  have hX0 : 0 ≤ Real.log ((n : ℝ) + 1) := Real.log_nonneg (by linarith)
  have hY : 1 / 2 ≤ Real.log (2 * ((discr L).natAbs : ℝ)) := by
    have h2 := Real.log_two_gt_d9
    have h3 : Real.log 2 ≤ Real.log (2 * ((discr L).natAbs : ℝ)) := Real.log_le_log (by norm_num) (by linarith)
    linarith
  have hnum := hCK e n (discr L).natAbs he hn1 hD1
  have hk' : (k : ℝ) ≤ s + n * (2 + e) := by exact_mod_cast hkK
  have e1 : (k : ℝ) * Real.log l ≤ (s + n * (2 + e)) * Real.log l :=
    mul_le_mul_of_nonneg_right hk' hlogl
  have e2 : (n : ℝ) * (2 + e) * Real.log l ≤ n * (2 + e) * Real.log ((n : ℝ) + 1) :=
    mul_le_mul_of_nonneg_left hX (by positivity)
  have hcoef : (2 + e : ℝ) ≤ 4 * (2 * e * (2 * e + 3)) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    have q1 : (2 + e : ℝ) ≤ 4 * (2 * e * (2 * e + 3)) * (1 / 2) := by nlinarith
    have q2 : 4 * (2 * e * (2 * e + 3)) * (1 / 2 : ℝ) ≤ 4 * (2 * e * (2 * e + 3)) * Real.log (2 * ((discr L).natAbs : ℝ)) :=
      mul_le_mul_of_nonneg_left hY (by positivity)
    linarith
  have e4 : (n : ℝ) * (2 + e) * Real.log ((n : ℝ) + 1) ≤
      n * (4 * (2 * e * (2 * e + 3)) * Real.log (2 * ((discr L).natAbs : ℝ))) * Real.log ((n : ℝ) + 1) :=
    mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hcoef (by positivity)) hX0
  linarith [e1, e2, e4, hnum, hslog]

theorem UpperTheory.V.ZK.sFinalReplay40 (hB : LocalIndexBudget40) : SFinal := by
  first
  | (rh_reduce 2 using [UpperTheory.V.ZK.sFinal40]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.ZK.sFinal40 hB

rh_scan UpperTheory.V.ZK.sFinal limit 2000
rh_scan UpperTheory.V.ZK.sFinal40 limit 2000
rh_scan UpperTheory.V.ZK.lemmaK_of_steps limit 2000
rh_prune UpperTheory.V.ZK.sFinalReplay40 as RH40FinalPruned
#print axioms UpperTheory.V.ZK.sFinal
#print axioms UpperTheory.V.ZK.sFinal40
#print axioms UpperTheory.V.ZK.sFinalReplay40
#print axioms localSigned40
end
