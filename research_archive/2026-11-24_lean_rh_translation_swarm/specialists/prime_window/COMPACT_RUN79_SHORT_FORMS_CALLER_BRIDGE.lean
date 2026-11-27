import New.Endgame.ShortAndEnough
import Mathlib.Tactic

/-!
# RUN79 — actual A consumer: separate divisibility from index, with a fixed native truncation
27 November 2026. SOURCE-MATCHED human caller bridge; native replacement
PREPARED, NOT compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Historical old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained;
no cross-pin verification or import of the RH root.

Read latest ONE_EQUATION_MISSION blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
LIVE_PROOF_SPINE 67e542df1b5557b2e1314643931ef1355bbdc50d,
LIVE_OBLIGATIONS 073d86374ebc415e217a2732814dde7b0f3dfb9d,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE and EXPANSION. D1/E1 already have
human audits; do not reopen them without discrepancy. A1 shared with theta
and kernel. Latest ef27878d replaces second support approximation;
263f1763 removes arbitrary-length jet frame at marked caller;
b68f22f4 audits composite sign; 78cb4221 queues B2 replay. Those
primitive replacements are NOT premises of this bridge. RUN78
93f1fe32928fb5427dc20572c3c594a8e549aaf5 is the immediate predecessor.
Theta f1abc81e gives independent log-free index candidate. No repeat
of projector, count, or fixed-exponent optimization.

Source ledger, relative to grh-compact/src:
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  21–26 exists_rat_log_eq_and_padic_norm_eq, 48–70 heightPerRow_le,
  114–132 scaledInclusion, projectedPoincare, integralRamified, IndexLe,
  138–168 Data.short_forms, ACTUAL Theorem A consumer.
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  220–227 weylNormSq_Bmu_le (archimedean conclusion), 233–240 native
  hasType_prod_markOperator_pow, 255–276 three gauges,
  285–307 exists_indexDvd_Bmu_divisible.
* New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
  83–104 allowedLoss and finite-support log budget.
All objects, twists, level and common datum D are unchanged.

## 1. Audit RUN78 at the exact local caller; eliminate even the adaptive
##    truncation from the bridge

Fix p small nonsplit, the same PadicPlace, G=gain(p), L=loss(p)>=1,
C=m*collisionSum(p,empty), J=jetCeil(p), M=integralColumns,
v=dim_C(Column). For EVERY integer beta<=G-2L the original
local theorem's conclusion holds with l<=3Lv. This follows
using only the THREE ORIGINAL gauge theorems and original
hasType_prod_markOperator_pow at J; no new HasType product bound needed.

If C<=L, the original unmarked gauge exponent C+L-G<=2L-G<=-beta.
Take S=M, exponent l=0. Otherwise the native dichotomy at line 299
gives a full mark Lambda. Keep native S=Y^m M+p^J M and the original
index exponent l<=3Lv. The two native summand gauge exponents are
2L-G and L-G, BOTH <= -beta. For each summand, the scalar p^(-beta)
has p-adic norm p^beta, exactly as local proof k at lines 289–291.
Each scaled summand is integral, so their sum is integral. The same S
works for all good data and all twists prime to p; choices are made
BEFORE these quantifiers. Keep the original ramified-column guard.
No assumption that summands are separately ramified. The earlier
adaptive construction is valid under its stated premises but is
unnecessary for this bridge; no need to replay a changed product
lemma merely to change the valuation threshold. Exceptional N and
other primes use the original local theorem.

## 2. Exact rounding at the real consumer, not an unrounded loss substitution

Let T=nonsplitPrimes union {N}. Define G_p=gain(p) on nonsplitPrimes,
zero otherwise, and E_p=allowedLoss(p). Source q has exponent
g_old(p)=floor(E_p-G_p), so local beta=-g_old=ceil(G_p-E_p).
Choose instead
    g_new(p) = ceil(2L-G_p) on nonsplitPrimes,
               g_old(p) otherwise.
Here beta=-g_new=floor(G_p-2L) on the nonsplit branch. The
decisive interface equality/inequality is
    2L-G_p <= g_new(p) <= g_old(p)=floor(3L-G_p).       (1)
Proof: ceil(u)<u+1 and L>=1, so the integer ceil(u)<=3L-G_p,
hence <= its floor. In particular the ORIGINAL index allowance
3Lv remains untouched. The alternative naive floor(2L-G_p)
is NOT sufficient for beta<=G_p-2L at nonintegral values.
Outside T, g_new=0 exactly. All exceptional prime cases follow
the original branch with beta=-g_old and the strict ceil bound.

Apply exists_rat_log_eq_and_padic_norm_eq to g_new on T. This
constructs ONE q'>0, independent of every twist, translate, embedding
and column, with
    log q' = sum_T g_new(p) log p,
    |q'|_p = |p|_p^g_new(p).
In particular log q' <= log q, because log p>=0 for primes.
The exact effective valuation payment on nonsplit primes is
    G_p+g_new(p) in [2L,2L+1),
not necessarily 2L. No assumption G_p integral is used.

## 3. Actual Data.short_forms assembly with the SAME conclusions

Take B'_s=q' projectedPoincare(s) and exactly the native short
spanning S (span_short_ramifiedColumns). In the same seesaw identity
and archimedean bound, the pre-budget expression is
    2 log q' + budget + heightPerRow + 2 sum_nonsplit gain(p)log p
             + budget.
Use g_new<=g_old<=E_p-G_p before applying norms/estimates, and
cancel the gain sum exactly. The original finite-support budget and
heightPerRow_le prove the same bound exp(H-mR+logB*budget).
Equivalently, compared with the old q, the pre-budget expression
falls by exactly 2 sum_T (g_old-g_new) log p. This is only a
comparison of upper exponents, NOT a lower bound on actual norms
or a new estimate of the star remainder.

For every finite t, family y from the images of B'_s, and each p,
embedding and twist, use the local S_p above. The identity
|q'|_p=|p|_p^(-beta) means the SAME integral-form conclusion
transports to q' B_mu after scaling, via weylGauge_smul, the native
seesaw identity and goodProjTranslate_mem_integralForms.
Apply IndexDvd.sup exactly as lines 157–164 to the scaled maps
on the ramified column lattice. No division by q' in the integral
lattice and no comparison of arbitrary lattice cardinal indices.
Its determinant bound is the same, with
    e_p=|t| v E_p log p,
and sum_U e_p<=|t| v budget for EVERY finite U. Thus short_forms
has the original conclusion with a specified alternative normalization.
No dependence of e_p on the twist or embedding has been introduced.
Use this q' in B and C together if ever integrated; do not compare
row bases obtained from different choices of q.

The prepared general exponent consumer below copies the native
short_forms assembly, using explicit hcap and hlocal instead of
the one native exponent. It is a candidate for compilation, not
a kernel-checked result. hlocal explicitly preserves every
source quantifier and index bound. Its proof does not call
Data.short_forms or the claimed RH theorem.

## 4. Frontier and actual verification

Original occurrence graph: allowedLoss -> floor normalization and
local index/divisibility -> seesaw, archimedean estimate, IndexDvd.sup
-> short_forms -> star.
Candidate human graph: same index budget + fixed native truncation
and stronger local valuation -> ceil normalization (1) -> same
seesaw/archimedean estimate and IndexDvd.sup -> same short_forms.
No removed global dependency; the conditional local theorem and
actual generalized caller must be replayed. All A1 marked
frame/Hecke and count suppliers, A2 lift span, A3 CM, B/C premises,
and original/reduced native graphs/axiom evidence remain. The
uncompiled log-free marked bound and other peer improvements
are deliberately not used. No URT advantage or new root closure.

Context key: compact pin,D,T,p,PadicPlace,G,L,C,J,full mark,Y,
beta,g_new,q',the same seesaw scalar/good data, t and y. Do not
cache an S_p across changing D or embeddings.

Local command -v lean/lake gave no executables. Actual exact Python
Fraction regression (not actual D instances, and not a proof by sampling):
    from fractions import Fraction as F
    from math import floor,ceil
    n=eq=0
    for a in range(1,101):
      L=F(a,10)+1
      for j in range(-100,101):
        G=F(j,7)
        old=floor(3*L-G); new=ceil(2*L-G); beta=-new
        assert beta==floor(G-2*L)
        assert new<=old and 2*L-G<=new
        assert 2*L<=G+new<2*L+1
        assert -old<=G-2*L
        n+=1; eq+=new==old
    print(n,eq)
    assert ceil(2*F(1,4))>floor(3*F(1,4))
Output 20100 890, exit 0; final negative control rejects dropping L>=1.

Actual state receipts retrieved this run:
45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
pass ONLY old-pin conditional root/engine/bounded scan, 324 pending.
Compact targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six original B/C axiom checks standard three only; A timeout 124,
all_requested_checks_ok=false, full_RH_replay=false. B2 replay status
404 on retrieval; no verdict inferred. Native rh_scan/prune/reduce/auto/
frontier unavailable locally. No new kernel PASS.

RESUME HERE: shared A replay should compile the fixed-J strengthened
local lemma by the two branches in section 1, then supply hlocal
to the actual generalized consumer below at g_new. Audit the
original-statement bridge, not another exponent optimization.
HANDOFF TO theta, kernel, integration/editor, formal audit.
Decisive prime-window/compact star remains OPEN.
-/

namespace CompactPrimeRun79

theorem integer_rounding (G L : ℝ) (hL : 1 ≤ L) :
    (⌈2*L-G⌉ : ℤ) ≤ ⌊3*L-G⌋ := by
  apply Int.le_floor.mpr
  have h := Int.ceil_lt_add_one (2*L-G)
  linarith

theorem rounded_payment (G L : ℝ) :
    2*L ≤ G + (⌈2*L-G⌉ : ℤ) ∧
      G + (⌈2*L-G⌉ : ℤ) < 2*L+1 := by
  constructor
  · have h := Int.le_ceil (2*L-G)
    linarith
  · have h := Int.ceil_lt_add_one (2*L-G)
    linarith

theorem fixed_J_gauges (G L b : ℝ) (hL : 0 ≤ L)
    (hb : b ≤ G-2*L) :
    2*L-G ≤ -b ∧ L-G ≤ -b := by
  constructor <;> linarith

#print axioms integer_rounding
#print axioms rounded_payment
#print axioms fixed_J_gauges
end CompactPrimeRun79

open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm

-- PREPARED actual caller bridge; no use of Data.short_forms as a proof.
lemma Data.short_forms_of_exponents_run79 {P} (D : Data P) (g : ℕ → ℤ)
    (hzero : ∀ l ∉ D.nonsplitPrimes ∪ {D.N}, g l = 0)
    (hcap : ∀ l, (g l : ℝ) ≤ D.allowedLoss l -
      ite (l ∈ D.nonsplitPrimes) (D.gain l) 0)
    (hlocal : ∀ l [Fact l.Prime] [PadicPlace l], ∃ n : ℕ,
      n ≤ D.allowedLoss l * finrank ℂ D.Column ∧ ∃ S,
      IndexDvd D.integralColumns S (l ^ n) ∧ ∀ ϑ Ψ,
      D.IsGoodDatum ϑ Ψ → l.Coprime ϑ.levelNorm → ∀ φ ∈ S,
      φ ∈ D.ramifiedColumns → (l : ℂ) ^ (g l) • D.Bμ ϑ Ψ φ ∈
        integralFormsAt ⊤ 1) :
    ∃ q > (0 : ℚ), ∃ B, B = (q : ℂ) • D.projectedPoincare ∧
      (∃ S ⊆ D.integralRamified, span ℂ S = ⊤ ∧ ∀ φ ∈ S, ∀ s σ,
        (D.Θ 1 (B s φ)).normSqAt σ ≤ exp (D.mainHeight -
          D.m * D.remainder + D.logB * D.budget)) ∧
      ∀ (t : Finset D.G) n (y : Fin n → _),
        (∀ i, y i ∈ Set.image2 (B ·) t D.integralRamified) →
        D.IndexLe y (#t * finrank ℂ D.Column * D.budget) := by
  classical
  obtain ⟨q, q0, e, v⟩ := exists_rat_log_eq_and_padic_norm_eq
    (D.nonsplitPrimes ∪ {D.N}) g (by grind [N_prime]) hzero
  have hs : ∑ l ∈ D.nonsplitPrimes ∪ {D.N}, (g l : ℝ) * log l ≤
      ∑ l ∈ D.nonsplitPrimes ∪ {D.N},
        (D.allowedLoss l - ite (l ∈ D.nonsplitPrimes) (D.gain l) 0) * log l :=
    sum_le_sum fun l _ ↦ mul_le_mul_of_nonneg_right (hcap l) (log_natCast_nonneg l)
  choose Ψ G S using D.seesaw.choose_spec
  refine ⟨q, q0, _, rfl, ⟨_, fun φ k l _ _ ↦ ⟨φ.1.2, k.1 l⟩,
    D.span_short_ramifiedColumns, fun φ k s σ ↦
    (map_smul (D.projectedPoincare s) .. ▸ normSqAt_goodProjTranslate_le
    (S .. ▸ weylNormSq_Bmu_le (B := 2 * log q + D.budget)
    (G 1) (by simpa [two_mul, exp_add, exp_log, q0, sq] using k.2 σ ·) ·)).trans (by
    grw [e, heightPerRow_le, hs]
    simp [sub_mul, -mem_filter, -union_singleton]
    grw [sum_allowedLoss_mul_log_le]; ring; simpa using D.le_of_hasLogBound)⟩,
    fun t n y h ↦
    ⟨fun l ↦ #t * finrank ℂ D.Column * (_ * log l),
    fun U ↦ by grw [← mul_sum, sum_allowedLoss_mul_log_le], fun l _ ι cϑ c ↦
    (hlocal l).elim fun n a ↦ a.2.elim fun _ b ↦
    (IndexDvd.sup (N' := (integralForms ι).comap ((D.Θ cϑ).restrictScalars embValRing)) (f :=
    ((q : ℂ) • D.projectedPoincare · |>.restrictScalars embValRing)) (fun s ↦ b.1.comap
    (D.ramifiedColumns.subtype.restrictScalars _) le_rfl fun φ _ h ↦ congr($((D.Θ cϑ).map_smul ..) ∈
    integralForms ι).mpr (goodProjTranslate_mem_integralForms ι (fun z ↦ by
    erw [weylGauge_smul, congr($(S ..).1 z)]
    simpa [v, weylGauge_smul] using (b.2 _ _ (G cϑ) c _ h φ.2).2 z) s)) t _ y
    fun k ↦ subset_span (.inl (Set.image2_subset_left (by exact fun _ ↦ (· l)) (h k)))).imp
    fun u ⟨k, h⟩ ↦ ⟨?_, h⟩⟩⟩
  · apply (Valuation.valuationSubring.integers _).le_of_dvd at k
    simp [norm_p_eq_inv, ← NNReal.coe_le_coe] at k
    grw [← k, ← le_log_iff_exp_le] <;> simp [NeZero.pos]
    linarith [mul_le_mul_of_nonneg_right a.1 (mul_nonneg (#t).cast_nonneg (log_natCast_nonneg l))]

#print axioms Data.short_forms_of_exponents_run79
#check Data.IsMarked.hasType_prod_markOperator_pow
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#check Data.IsGoodDatum.gaugeLe_pow_jetCeil_smul
#check Data.exists_indexDvd_Bmu_divisible
#check Data.short_forms
