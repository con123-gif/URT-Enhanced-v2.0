import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ModelUpper
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.FinHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.HomHolds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN19 lane 11, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including mandatory
pipeline; SWARM/HANDOFF/EXPANSION/AGENTS, state and CI summary consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
2fc633272442a664eb260b76151c6e4e474c6b0b (batch merge), not adopted.
Peer edb25260 separates finiteness of length from trace; f304da1a shares
CountI/V number supplier; 49cea008 restricts cotangent lower; ce4476bd
discriminant ramification and cd8a9fa9 rank-two weight restriction read
excerpts. Prior b0fd82e7 cutoff retained independently. No merging uncompiled candidates.

RESULT: in actual ModelUpper / FOneCharU, construct a finite point orbit
cover C of the SAME model *before* choosing/using sigma. The construction
uses fin_holds (M2,M4, homogeneous ideal), M.pts, model_signs and
transport, not LemmaM, sigma, trace nonvanishing, or M3. For any sigma
trace difference d_f is unchanged on torus conjugacy: the (i,i) entry
is multiplied by t^(wt i i)=1, and the base trace is common. Therefore
    product_{f in C} d_f(sigma) != 0
      iff forall f, TwoPt f -> d_f(sigma) != 0.
No field ordering or norm estimate required; empty cover yields empty
product 1 and vacuous universal condition. Product zero in a field iff
a factor zero. Coverage is essential: a nonempty subfamily can miss an
orbit with zero trace difference. No claim that the finite product is
nonzero for a common Frobenius element, that the cover is uniform in l,
or that this test replaces the final trace SUM (valuation of product
could count orbit multiplicities). This isolates finite same-host
nonvanishing from the remaining quantitative bound. Original FOneCharU
caller still has its all-admissible hne input; the replacement consumes
it only at C19. Actual general CountI supplier still needs a proof of
the finite test uniformly, not a separate chosen sigma per model.

Source blobs (paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
UnitaryThreeGroups/ConjStable.lean 21bf08ed788963953d2f8f6dc0d4a62e4d3b5bd3
UnitaryThreeGroups/ConjTor.lean e635c560ec9d491816e4f6c37c1cd69d55247e48
CommutativeAlgebra/GradedModulesLength/FinHolds.lean 6fe49e1289a90866bc8810f83979cf7b12e966ea
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
CommutativeAlgebra/GradedModulesLength/HomHolds.lean ef6cd169c8608724cbdd9606b4d36952e83ce831
Original selected graph: CountI -> OneCharU -> model_upper -> LemmaM
and all-point htr -> M5; LemmaM -> fin_holds and core_holds.
Candidate: coverPt19 -> fin_holds + M2,M4 + same-model transport
(independent of sigma); model_upper_finite19 -> cover_product_iff19
-> conjBy_tor -> exact diagonal cancellation; model_upper_finite19 ->
original model_upper with recovered htr. FOneCharU overlay calls
coverPt19 and model_upper_finite19, retains vlen_le and quantitative
sum, classification, orbit-uniqueness and same coefficient. All original
type/value/constructor/axiom and unresolved side edges retained pending
native scan. Cache by pin/toolchain/S/M/eta/Psi/l/host/cover/sigma/role;
cover cache does not use sigma; product cache does. Backtrack on failed
replay. No import of claimed RH theorem.

Executed 44 fail-on-error source/guard/round-trip checks in connector V8.
Native lean/lake absent. Retrieved actual CI status files
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, both status pass (baseline
45577239749/45576756833). Requested strip-root logs/result.json returned
404; no new kernel or axiom evidence. No claim of global premise retirement.
RESUME HERE: compile as RHFiniteTraceCover19 in warmed pinned Lean,
including engine oleans; if private access fails use source overlay
of ModelUpper with candidate declarations appended. Then generate and
compile actual FOneCharU overlay below. Compare original/reduced
constructor-inclusive scans and axiom ledgers. Investigate whether
same finite catalogue admits a common Frobenius avoiding all zero
factors with the existing quantitative window bounds; do not infer
simultaneous nonzero from each factor individually nonzero somewhere.
HANDOFF TO integration, audit, Galois, acceleration. RH OPEN.
-/

open Matrix IsLocalRing UpperTheory.V.U3 UpperTheory.V.Alg UpperTheory.V.HV UpperTheory.V.Alg.M
open private act_tz act_act act_one twoSigned_act from Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ModelUpper
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

namespace UpperTheory.V.U3

theorem trDiff_conj19 {O R K Γ : Type} [CommRing O] [CommRing R] [Algebra O R]
    [Field K] [Algebra O K] [Group Γ] (η : Γ →* ℤˣ) (Ψ : Γ →* Oˣ)
    (r : Γ →* GG 3 R) (σ : Γ) (f f' : R →ₐ[O] K) (t : Kˣ)
    (h : push f r = conjBy (tor K t) (push f' r)) :
    trDiff η Ψ r σ f = trDiff η Ψ r σ f' := by
  have hpm (g : R →ₐ[O] K) (i : Fin 3) :
      ((push g r) σ).mat i i = g ((r σ).mat i i) := by
    show ((GG.map (g : R →+* K)) (r σ)).mat i i = _
    rw [GG.map_mat]
    rfl
  have hd (i : Fin 3) : f ((r σ).mat i i) = f' ((r σ).mat i i) := by
    rw [← hpm f i, h, (conjBy_tor _ t).1, hpm f' i]
    simp [wt]
  simp only [trDiff, Matrix.trace_fin_three, map_add, hd]

theorem cover_product_iff19 {O R K Γ : Type} [CommRing O] [IsDomain O]
    [CommRing R] [Algebra O R] [IsLocalRing R] [NormedField K] [Algebra O K]
    [Group Γ] (η : Γ →* ℤˣ) (Ψ : Γ →* Oˣ) (r : Γ →* GG 3 R)
    (σ : Γ) (T : Finset (R →ₐ[O] K)) (hT : CoversPt η r T) :
    (∏ f ∈ T, trDiff η Ψ r σ f) ≠ 0 ↔
      ∀ f, TwoPt η r f → trDiff η Ψ r σ f ≠ 0 := by
  classical
  constructor
  · intro hp f hf
    obtain ⟨f', hf', t, ht⟩ := hT.2 f hf
    rw [trDiff_conj19 η Ψ r σ f f' t ht]
    exact Finset.prod_ne_zero_iff.mp hp f' hf'
  · intro h
    exact Finset.prod_ne_zero_iff.mpr fun f hf => h f (hT.1 f hf)

end UpperTheory.V.U3

theorem UpperTheory.V.U3.coverPt19 :
    ∀ {l : ℕ} [Fact l.Prime] {c : Coef l} {Γ H : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
      {η : Γ →* ℤˣ} {Ψ : Γ →* (c.O)ˣ} {N : Set Γ} {ι : H →* Γ} {hι : Continuous ι}
      {U : Univ (GCond.noCondition c.O (η.comp ι) (Ψ.comp ι))} {I : Ideal U.R} {cc g₁ : Γ} (S : SRing N hι U I cc g₁) (M : Model S (PadicAlgCl l)), l ≠ 2 → Marks η Ψ cc g₁ →
      Module.Finite c.O (weightZeroSubalgebra c.O S.r.hom) → PtHyp η S.r.hom M.x₀ →
      ∃ T : Finset (S.R →ₐ[c.O] PadicAlgCl l), CoversPt η S.r.hom T:= by
  classical
  intro l _ c Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M hl hmk hfin hpt
  letI := M.cr
  letI := M.al
  letI := M.gr
  have hM2 := modelIdeal_finiteness_of_weightZero_finite S M hl hmk hfin
  have hM4 := gradedModel_derivationCondition_of_ptHyp S M hl hmk hM2 hpt
  have hsg := model_signs S M hl hmk
  obtain ⟨-, -, -, hcomp, -, he0, hefin, -, -⟩ := UpperTheory.V.Base.dvrFacts l c.O
  haveI := hcomp
  have htp : ∀ f : S.R →ₐ[c.O] PadicAlgCl l, IsLocPt f →
      (TwoPt η S.r.hom f ↔ TwoSigned M.𝒜 (f.comp M.q)) := fun f hf =>
    ⟨fun h => ⟨fun hn => h.2.1 ((hsg f hf).1.1 hn), fun hp => h.2.2 ((hsg f hf).2.1.1 hp)⟩,
     fun h => ⟨hf, fun hu => h.1 ((hsg f hf).1.2 hu), fun hw => h.2 ((hsg f hf).2.1.2 hw)⟩⟩
  have hon : ∀ f : S.R →ₐ[c.O] PadicAlgCl l, OnS M.Q.ideal (f.comp M.q) := by
    intro f y hy
    have hy' : y ∈ RingHom.ker M.q := by rw [M.ker_q]; exact hy
    rw [AlgHom.comp_apply, RingHom.mem_ker.1 hy', map_zero]
  haveI := M.wring.co
  obtain ⟨T₀, hT₀⟩ := fin_holds c.O (PadicAlgCl l) M.A M.𝒜 M.x M.wring M.Q.ideal
    (hom_holds c.O M.A M.𝒜 M.x M.wring M.r M.s M.r' M.s' M.m M.Q).1 hM2 hM4
  have hpm : ∀ (f : S.R →ₐ[c.O] PadicAlgCl l) g i j,
      ((push f S.r.hom) g).mat i j = f ((S.r.hom g).mat i j) := fun f g i j => by
    show ((GG.map (f : S.R →+* PadicAlgCl l)) (S.r.hom g)).mat i j = _
    rw [GG.map_mat]
    rfl
  have hpr : ∀ (f : S.R →ₐ[c.O] PadicAlgCl l) g, ((push f S.r.hom) g).right = (S.r.hom g).right :=
    fun f g => GG.map_right _ _
  have hext : ∀ r₁ r₂ : Γ →* GG 3 (PadicAlgCl l), (∀ g i j, (r₁ g).mat i j = (r₂ g).mat i j) →
      (∀ g, (r₁ g).right = (r₂ g).right) → r₁ = r₂ := by
    intro r₁ r₂ hm hr
    apply MonoidHom.ext
    intro g
    apply SemidirectProduct.ext
    · exact Units.ext (Matrix.ext (hm g))
    · exact hr g
  have hac : ∀ (f f' : S.R →ₐ[c.O] PadicAlgCl l) (t : (PadicAlgCl l)ˣ),
      f.comp M.q = act M.𝒜 (tz t) (f'.comp M.q) →
      push f S.r.hom = conjBy (tor _ t) (push f' S.r.hom) := by
    intro f f' t h
    apply hext
    · intro g i j
      rw [(conjBy_tor _ t).1, hpm, hpm]
      obtain ⟨e, he, hqe⟩ := M.ent g i j
      rw [← hqe]
      have h2 := congrArg (fun φ => φ e) h
      simp only [AlgHom.comp_apply] at h2
      rw [h2, act_tz M.𝒜 t _ he, AlgHom.comp_apply]
    · intro g
      rw [(conjBy_tor _ t).2.1, hpr, hpr]
  have hch : ∀ ξ ∈ T₀, ∃ f : S.R →ₐ[c.O] PadicAlgCl l, ∃ t : (PadicAlgCl l)ˣ,
      IsLocPt f ∧ act M.𝒜 (tz t) ξ = f.comp M.q := fun ξ hξ => by
    obtain ⟨t, f, h1, h2⟩ := M.pts hM2 ξ (hT₀.1 ξ hξ).1
    exact ⟨f, t, h1, h2⟩
  choose F tF hF using hch
  let Rel : (S.R →ₐ[c.O] PadicAlgCl l) → (S.R →ₐ[c.O] PadicAlgCl l) → Prop :=
    fun f' f => ∃ t : (PadicAlgCl l)ˣ, push f S.r.hom = conjBy (tor _ t) (push f' S.r.hom)
  let T₁ := T₀.attach.image (fun ξ => F ξ.1 ξ.2)
  have hT₁ : (∀ f ∈ T₁, TwoPt η S.r.hom f) ∧ ∀ f, TwoPt η S.r.hom f → ∃ f' ∈ T₁, Rel f' f := by
    constructor
    · intro f hf
      obtain ⟨⟨ξ, hξ⟩, -, rfl⟩ := Finset.mem_image.1 hf
      rw [htp _ (hF ξ hξ).1, ← (hF ξ hξ).2]
      exact twoSigned_act M.𝒜 _ (hT₀.1 ξ hξ).2
    · intro f hf
      obtain ⟨ξ', hξ', t, hξeq⟩ := hT₀.2 _ (hon f) ((htp f hf.1).1 hf)
      have hf' := hF ξ' hξ'
      have hξ'' : ξ' = act M.𝒜 (tz (tF ξ' hξ')⁻¹) ((F ξ' hξ').comp M.q) := by
        rw [← hf'.2, act_act, inv_mul_cancel, act_one]
      refine ⟨F ξ' hξ', Finset.mem_image.2 ⟨⟨ξ', hξ'⟩, Finset.mem_attach _ _, rfl⟩, t * (tF ξ' hξ')⁻¹, ?_⟩
      apply hac
      rw [hξeq]
      exact (congrArg (act M.𝒜 (tz t)) hξ'').trans (act_act M.𝒜 _ _ _)
  exact ⟨T₁, hT₁⟩


theorem UpperTheory.V.U3.model_upper_finite19 :
    ∀ {l : ℕ} [Fact l.Prime] {c : Coef l} {Γ H : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
      {η : Γ →* ℤˣ} {Ψ : Γ →* (c.O)ˣ} {N : Set Γ} {ι : H →* Γ} {hι : Continuous ι}
      {U : Univ (GCond.noCondition c.O (η.comp ι) (Ψ.comp ι))} {I : Ideal U.R} {cc g₁ : Γ} (S : SRing N hι U I cc g₁) (M : Model S (PadicAlgCl l)), l ≠ 2 → Marks η Ψ cc g₁ →
      LemmaM → Module.Finite c.O (weightZeroSubalgebra c.O S.r.hom) → PtHyp η S.r.hom M.x₀ → ∀ σ : Γ, η σ = 1 →
      (∃ T : Finset (S.R →ₐ[c.O] PadicAlgCl l), CoversPt η S.r.hom T ∧
        ∏ f ∈ T, trDiff η Ψ S.r.hom σ f ≠ 0) →
      M.len ≠ ⊤ ∧ ∃ T : Finset (S.R →ₐ[c.O] PadicAlgCl l), CoversPt η S.r.hom T ∧
        (∀ f ∈ T, ∀ f' ∈ T, ∀ t : (PadicAlgCl l)ˣ, push f' S.r.hom = conjBy (tor _ t) (push f S.r.hom) → f = f') ∧
        UpperTheory.V.Chr.nrm l c.O M.len ≤ 2 * ∑ f ∈ T, vl l (trDiff η Ψ S.r.hom σ f) := by
  intro l _ c Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M hl hmk hLM hfin hpt σ hσ htr
  obtain ⟨T, hT, hprod⟩ := htr
  have hnon := (cover_product_iff19 η Ψ S.r.hom σ T hT).1 hprod
  first
  | (rh_reduce 1 using [model_upper]; done)
  | (rh_auto_frontier 1; done)
  | exact model_upper S M hl hmk hLM hfin hpt σ hσ hnon


rh_scan UpperTheory.V.U3.model_upper limit 2000
rh_scan UpperTheory.V.U3.coverPt19 limit 2000
rh_scan UpperTheory.V.U3.model_upper_finite19 limit 2000
rh_prune UpperTheory.V.U3.coverPt19 as UpperTheory.V.U3.CoverPtPruned19
#print axioms UpperTheory.V.U3.model_upper
#print axioms UpperTheory.V.U3.trDiff_conj19
#print axioms UpperTheory.V.U3.cover_product_iff19
#print axioms UpperTheory.V.U3.coverPt19
#print axioms UpperTheory.V.U3.model_upper_finite19

/-!
Executable overlay generator (Python 3, pinned checkout; run only after
the candidate module is compiled). No changes to upstream source:
```python
import pathlib, hashlib, json
p=pathlib.Path("src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean")
raw=p.read_bytes()
assert hashlib.sha1(b"blob "+str(len(raw)).encode()+bytes([0])+raw).hexdigest()=="3560d196d696e5ebceded72e747a060392837b91"
s=raw.decode("utf-8")
edits=json.loads("[[\"private theorem oneChar_unramU (\",\"private theorem oneChar_unramU19 (\"],[\"  obtain ⟨hlen, T, hT, hTo, hle⟩ := model_upper S M hG.l_odd hM hLM (hFin U S)\\n    (_root_.UpperTheory.V.Z.J.ptHyp_of_autB_of_lemW_of_isBase hC hK hRI hRII D hM S ι hB hW M.x₀ M.base) (galEmb ℚ K Ω σ) hσ\\n    fun f hf => by rw [htr]; exact sub_ne_zero.2 (hne _ (hadm f hf))\\n\",\"  have hpt19 := _root_.UpperTheory.V.Z.J.ptHyp_of_autB_of_lemW_of_isBase hC hK hRI hRII D hM S ι hB hW M.x₀ M.base\\n  obtain ⟨C19, hC19⟩ := coverPt19 S M hG.l_odd hM (hFin U S) hpt19\\n  have hprod19 : ∏ f ∈ C19, trDiff D.η D.Ψ S.r.hom (galEmb ℚ K Ω σ) f ≠ 0 := by\\n    apply Finset.prod_ne_zero_iff.mpr\\n    intro f hf\\n    rw [htr]\\n    exact sub_ne_zero.2 (hne _ (hadm f (hC19.1 f hf)))\\n  obtain ⟨hlen, T, hT, hTo, hle⟩ := model_upper_finite19 S M hG.l_odd hM hLM (hFin U S)\\n    hpt19 (galEmb ℚ K Ω σ) hσ ⟨C19, hC19, hprod19⟩\\n\"],[\"theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy :\",\"theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy19 :\"],[\"refine oneChar_unramU hC\",\"refine oneChar_unramU19 hC\"]]")
t=s
for a,b in edits:
    assert t.count(a)==1
    t=t.replace(a,b,1)
rev=t
for a,b in reversed(edits):
    assert rev.count(b)==1
    rev=rev.replace(b,a,1)
assert rev==s
with open("RHOneCharFiniteTrace19.lean","x",encoding="utf-8") as f:
    f.write("import RHFiniteTraceCover19\n"+t+"\nrh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy19 limit 2000\n#print axioms UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy19\n")
```
-/
