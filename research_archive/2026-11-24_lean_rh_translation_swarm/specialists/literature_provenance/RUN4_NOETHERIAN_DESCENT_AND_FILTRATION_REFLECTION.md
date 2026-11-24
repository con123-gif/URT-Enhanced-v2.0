# RUN4 — Noetherian descent and filtration reflection

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the reduction from Noetherian rings to arbitrary rings for canonical square-zero lifting. PARTIAL for underlying geometric producers and whole RH. No independent Lean replay or URT speed claim.

Continuity: read swarm protocol, handoff, expansion, AGENTS, research state, runner log/protocol, continuity, CI and latest peer handoffs (integration, manuscript, kernel, acceleration, Galois, theta, prime, Landau, character-box, geometry, structure, dependencies, formal audit). Physical CI PASS run 45373263454 at 10:36:09 UTC is not RH verification. Follow RUN3, not other lanes' arithmetic tasks. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream main 35cf45f5e031bafe9ce8305214b2b3be108d1b40; proofs anchored to pin. Five old modules consolidated into AbelianLiftingOfDeRhamUnobstructed.lean, head blob 5b16826bb38b1b907d24526e461f71510856654f; migration checks below do not certify semantic equivalence.

## 1. Scope and assumption boundary

Let P=AbelianDeRham. Let H assert that for EVERY commutative Noetherian ring S, square-zero ideal J, commutative S0 and surjective q:S→S0 with ker(q)=J, both LiftObj and LiftHom hold for divided₂ J and q. Then sqLifting_of_noetherian gives SqLifting (same pair for EVERY commutative R). divided₂ means canonical square-zero DP, not an arbitrary DP structure on a square-zero ideal. SquareZeroLiftingOfNoetherianCase L17–23 uses an object lifting theorem, a scheme morphism existence theorem and a unique group-lift theorem. Its Statement wrapper is a theorem application, not an axiom. AbelianLiftingOfDeRhamUnobstructed L72–78 supplies H from two square-zero theorem applications using P and AbelianSchemeLifts.At (hL); hU=AbelianUnobstructed stays a premise of the larger induction. H is not the conclusion assumed recursively, and its base producers remain open for expansion.

## 2. Object: descend the scheme AND the projection

Fix arbitrary π:R→R0 surjective, kerπ=I, I²=0, reference abelian lift A' of A0 with relative dimension g, and admissible F⊆HdR(A'). Keep the group pullback and all admissibility conditions. A direct complement gives idempotent e with im e=F (GrothendieckMessingLiftOfNoetherianCase L240–249).

First descend A' to B over a finite-type Z-subring S⊆R. AbelianSchemeDescendsToFinitelyGeneratedSubring L144–171 first uses finite-presentation descent of smooth group schemes, then adjoins finitely many coefficients to ensure properness. Injectivity of S⊆R gives dominance of Spec R→Spec S. The actual connectedness proof is nontrivial: multiplication-by-n is surjective on the original abelian scheme for n≥1 by passage to algebraically closed fibers and finite/flat/surjective abelian endomorphisms (L91–119). Each descended multiplication map has closed image containing a dense subset, so is surjective (L121–142). In an algebraically closed fiber the rational points modulo the identity component form a finite group: components are open and compactness gives finitely many; translations preserve components. If the index is m, every point is an m-th power and hence lies in the identity component. A nonempty complement would have a rational point, contradiction (L25–71). Relative dimension follows by the separate dominant pullback lemma. Preserve these finite-presentation, properness, multiplication-finiteness and dimension producers. Noetherianity is due to finite type over Z, not a claim about arbitrary subrings.

Now put M=primDR(B), M_R=primDR(A'). P gives finite projectivity of M and base-change spanning and dual-extension properties. Choose a dual frame p_i,l_i with c=Σ_i l_i(c)p_i (L28–38). It need not be a basis. Let f:M→M_R be semilinear pullback, l'_i corresponding duals. Adjoin the n² coefficients a_ij=e(l'_i)(f(p_j)) to S inside R, obtaining T finite type over S and hence Noetherian. Factor the model through T, with corresponding frame p_i^T,l_i^T. Define the descended operator by

    e_T(x) = Σ_i x(p_i^T) Σ_j a_ij l_j^T.

For corresponding x,x', expand x' in the dual frame and f_T(c) in the primal frame. Commuting the two finite sums yields e(x')(f_T(c))=σ_T(e_T(x)(c)). These expansions and extensions follow from P and the span hypotheses, not from freeness of M (L40–89,200–238). n² counts coefficients for this frame, not total translation complexity.

Rename T as S, σ:S↪R; J=ker(πσ). Products of elements of J map into I²=0; injectivity gives J²=0. S0=S/J embeds into R0 by ρ, with ρq=πσ. The special fiber group pullback factors through S0. Compatibility, dual extension and injectivity of σ reflect e_S²=e_S, so im e_S is complemented by ker e_S (L250–279).

## 3. Admissibility and the return to R

red_descent (L91–140) is necessary; complementarity alone is insufficient. Use its square of semilinear maps f:M→M_R, r1:M→M0, r:M_R→M_R0, f0:M0→M_R0, with rf=f0r1 and ρq=πσ. Keep projectivity of M, finite projectivity of M_R, injectivity of ρ, surjectivity of q, stated span and dual-extension hypotheses. W=span_R0 f0(W0). The top reduction equality asserts that y' annihilates W iff it is the reduction of an element of im e.

If y annihilates W0, extend it to y' on M_R0; y' annihilates W. Write y' as reduction of e w. Lift y∘r1 to a dual x of M by projectivity and surjectivity of q; extend x to x' over R. On the spanning images f(M), the reductions of x' and e w agree. Therefore all coefficients of x'−e w in a finite dual frame reduce to zero. Linearity of e and e²=e imply reduction(e x')=reduction(e w). Compatibility with e_S and injectivity of ρ give the required reduction of e_S x on r1(M). Conversely, for y represented as reduction of e_S x, extend x and reduce e(x') to obtain y' annihilating W by the top equality. The span of r1(M) identifies the restriction along f0 with ρy; injectivity gives y annihilating W0. Neither step assumes faithful flatness of σ (L104–140).

Apply H's object branch to B over S→S/J with admissible im e_S. Obtain C over S and its prescribed crystal filtration; base-change C to R to get A lifting A0. P supplies crystal-to-de Rham bijections for B,C identifying their primitive modules. ann_bc (L142–181) proves the necessary two-way equality: for Q≅M and W⊕N=Q, let q_M project onto the image of N. A dual annihilating the extended W depends only on q_M, each l_i∘q_M is in im e_S, and preimages under e_S can be extended to R. Frame expansion writes the dual as a linear combination of their e-images. Conversely an e-image expanded in the extended dual frame kills the image of W and hence its span. The required correspondence of the two crystal duals is established by naturality and the DP morphism along σ (L280–305). This recovers the requested filtration over R, not only an object.

## 4. Morphism: the guard must descend too

Keep specified abelian lifts A,B and reductions A0,B0, dimensions g,g' (not necessarily equal), group pullbacks, f0 a group homomorphism and full filtration-preservation guard. AbelianHomReductionDescendsFinitelyGenerated L146–236 produces a common finite-type subring S, abelian models AS,BS, reductions modulo J=I∩S, a group map fS0, four group pullbacks and three compatibility equations.

Descend A first, then B over a subring containing a finite generating set for A's model; base-change A. S/J is isomorphic to its image in R0. Finite-presentation morphism descent for the composite of f0 with the model projection requires finitely many additional coefficients in R0; lift each into R using π surjective, then adjoin them (L74–136,166–190). Pullback universal properties yield a scheme map fS0. Injection of S/J→R0 gives scheme-theoretic dominance, and with source flatness and target separatedness ExtUnique.isMonHom_of_isGrpPullback reflects the group law (L224–232). Ordinary topological dominance alone is not asserted sufficient here.

PushMemLiftFilOfInjective L12–80 establishes the guard rather than assuming it. For any d in the smaller A filtration, P's base-change extension and crystal bijection supply corresponding d' over R. The big primitive submodule is spanned by pullbacks of smaller primitive elements, so d' annihilates it (L52–70). Apply the given filtration guard to d'. By push naturality and crystal correspondence, σ of the small pushed pairing equals the big pushed pairing, which vanishes on pulled-back primitive elements. Injectivity reflects zero (L71–80). This is elementwise reflection, not a claim that any tensor extension reflects membership; all commuting squares and pullbacks remain hypotheses.

As J²=0 and S is Noetherian, apply H's hom branch, then base-change the lifted map by the pullback property. Both projections verify reduction equality (LiftHomExistsOfNoetherian L24–45). The conclusion is only a scheme morphism φ lifting f0. The separate normalization is required.

## 5. Rigidity converts a scheme lift into a unique group lift

ExistsUniqueIsMonHomLift L29–72 assumes surjective π with NILPOTENT kernel, abelian schemes and group pullbacks, f0 a group hom and scheme lift φ. In additive notation put f(a)=φ(a)−φ(0). Since φ reduces to a pointed map, the correction reduces to zero. Thus f still lifts f0 and is pointed. GlobalTheory.rigidity_holds makes it a group hom. For another group lift g, d=g−f is pointed and reduces to zero. EqCompSectionOfProperSmoothNilpotentRigidity L16–62 proves that a map constant on the reduction factors through its value on the unit section: nilpotence gives surjectivity of Spec R0→Spec R on points, smooth geometrically connected source is geometrically integral (with properness used for global functions), global-functions isomorphisms and local rigidity on fibers give equality on an open cover. Hence d=0. These are substantive geometric dependencies, not a pointwise argument modulo I. The top assembly supplies the nilpotence exponent 2 and combines the unique group lift with the object lifting result.

## 6. Assumption ledger

P's primitive finite projectivity, base-change and rigidity fields are retained. H is a local quantified hypothesis with the explicit internal supplier described in §1. The seven Statement wrappers in the ledger are proved applications of the corresponding internal bodies, not extra axioms. The two base-case square-zero Statement wrappers point to liftObj_sq and Hom.liftHom_sq; their geometry is not reconstructed here. Remaining actual producer names include smooth_grpScheme_descends_to_fg_subring, ProperLimit.exists_finset_isProper, MulFiniteAny.isFinite_mulA, flat_and_surjective_of_isFinite_abelianEnd, smoothOfRelativeDimension_of_isPullback_isDominant, morphism_descends_to_subring, ExtUnique.isMonHom_of_isGrpPullback, rigidity_holds, GlobalFunctions.isIso_app, FlatFibreInjective.injective_baseChange, exists_noetherian_model_of_smooth, local_rigidity, and P's fields and definitions. Mathlib imports remain. These are source dependency edges, not full elaborated closure; historical attribution of all leaves and their kernel axiom footprints are not independently audited. No hypothesis added or discarded in the reconstruction.

## 7. Executed evidence

18/18 connector-reported pinned blob IDs matched on final retrieval. 147/147 source line substring anchors passed on the second run (after correcting an off-by-one anchor at MulFiniteAny.isFinite_mulA, 115→116; a separate mistyped expected blob ID in that run was corrected in the final retrieval). The appendix records exact source lines for independent replay: git rev-parse PIN:PATH must equal sha; git show PIN:PATH must contain the recorded line at each listed 1-indexed position. Migration tests use exact trimmed lines within clump boundaries, not proof equality. No Lean executable proof check performed.

RESUME HERE: inspect GrothendieckMessingLiftAbelianSchemeOfSquareZero.lean (liftObj_sq) and GrothendieckMessingLiftHomomorphismOfSquareZero.lean (Hom.liftHom_sq) at pin; expand actual base producers of H using AbelianSchemeLifts.At, trace the construction of that record. Do not repeat Noetherian descent or RUN3 induction. HANDOFF TO: integration, editor, audit, positivity geometry and Galois. Attach §§1–6 to RUN3. No physics gates changed. Project OPEN.

### Source ledger
```json
[
  {
    "name": "SquareZeroLiftingOfNoetherianCase",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SquareZeroLiftingOfNoetherianCase.lean",
    "sha": "cd93c5dfa11f49fdc4bf589047cbafda9a696f97",
    "checks": [
      [
        17,
        "theorem sqLifting_of_noetherian : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        20,
        "  refine ⟨GlobalTheory.T.grothendieckMessing_lift_of_noetherian_case P H R I h R₀ π hπ hI, ?_⟩"
      ],
      [
        22,
        "  obtain ⟨φ, hφ⟩ := GlobalTheory.T.liftHom_exists_of_noetherian_alt P H R I h R₀ π hπ hI g A₀ A i hA hAa hg g' B₀ B j hB hBa hg' f₀ hf"
      ],
      [
        23,
        "  exact GlobalTheory.T.existsUnique_isMonHom_lift_of_grpPullback_abelian R R₀ π hπ ⟨2, by rw [hI]; exact h⟩ A₀ B₀ A B i j hA hB hAa hBa f₀ φ hφ"
      ]
    ]
  },
  {
    "name": "SquareZeroLiftingOfNoetherianCaseStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SquareZeroLiftingOfNoetherianCaseStatement.lean",
    "sha": "60f7f4b838d2b1f3654082622c6a121ade1ad908",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.squareZeroLifting_of_noetherian_case : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.sqLifting_of_noetherian | exact GlobalTheory.SqLift.sqLifting_of_noetherian | (intros; apply GlobalTheory.SqLift.sqLifting_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCase",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftOfNoetherianCase.lean",
    "sha": "2c4102ba70d054e9dd61b0781b1e83713cf5ce22",
    "checks": [
      [
        28,
        "theorem exists_frame [Module.Finite S P] [Module.Projective S P] :"
      ],
      [
        40,
        "theorem cor_of_span {σ : S →+* R} {Λ : Type*} {v : Λ → P} (hv : Submodule.span S (Set.range v) = ⊤)"
      ],
      [
        50,
        "theorem frame_bc {σ : S →+* R} {n : ℕ} {p : Fin n → P} {l : Fin n → Dual S P}"
      ],
      [
        64,
        "theorem dual_frame {n : ℕ} {p : Fin n → P} {l : Fin n → Dual S P}"
      ],
      [
        70,
        "theorem exists_descent {τ : S →+* S₀} {σ₁ : S₀ →+* R} {σ : S →+* R} (hσ : ∀ a, σ₁ (τ a) = σ a)"
      ],
      [
        84,
        "  refine ⟨∑ i, (LinearMap.applyₗ (f₀ (p i))).smulRight (∑ j, b i j • l₁ j), fun x x' hx c ↦ ?_⟩"
      ],
      [
        91,
        "theorem red_descent [Module.Projective S P] [Module.Finite R P'] [Module.Projective R P']"
      ],
      [
        120,
        "    obtain ⟨x, hx⟩ := Module.projective_lifting_property (Algebra.linearMap S S₀) t hπ₁"
      ],
      [
        125,
        "    have z : ∀ c, π (e (x' - e w) c) = 0 := fun c ↦ by"
      ],
      [
        128,
        "    refine ⟨_, ⟨x, rfl⟩, fun c ↦ hρ ?_⟩"
      ],
      [
        135,
        "    have m := (H y').2 ⟨_, ⟨x', rfl⟩, hy'⟩"
      ],
      [
        138,
        "    refine (Submodule.mem_dualAnnihilator _).2 fun c hc ↦ hρ ?_"
      ],
      [
        142,
        "theorem ann_bc {Q Q' : Type*} [AddCommGroup Q] [Module S Q] [AddCommGroup Q'] [Module R Q']"
      ],
      [
        155,
        "    let q : P →ₗ[S] P := θ.toLinearMap ∘ₗ Submodule.projection _ _ hN.symm ∘ₗ θ.symm.toLinearMap"
      ],
      [
        174,
        "    choose l' hl using fun i ↦ ef (l i)"
      ],
      [
        187,
        "theorem exists_factor {S S' S'' : Scheme.{0}} {G : Over S} [GrpObj G] {G'' : Over S''} [GrpObj G'']"
      ],
      [
        200,
        "theorem bc_facts (P : AbelianDeRham) {S R : Type} [CommRing S] [CommRing R] {σ : S →+* R} {g : ℕ}"
      ],
      [
        207,
        "  obtain ⟨h₁, h₂⟩ := P.2.2.1 S B g hB hg R A φ h"
      ],
      [
        215,
        "theorem exists_noeth_model (P : AbelianDeRham) {R : Type} [CommRing R] {g : ℕ} (A : Over (Sp R)) [GrpObj A]"
      ],
      [
        222,
        "  obtain ⟨S, B, _, φ, -, hS, hB, hgB, h⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g A ∅ hA hg"
      ],
      [
        223,
        "  haveI : IsNoetherianRing S := Algebra.FiniteType.isNoetherianRing ℤ S"
      ],
      [
        224,
        "  obtain ⟨hf, hp, -⟩ := P.1.prim hB hgB"
      ],
      [
        228,
        "  let a : Fin n × Fin n → R := fun ij ↦ e (l' ij.1) ((redMor h).pull (p ij.2))"
      ],
      [
        229,
        "  let T := Algebra.adjoin S (Set.range a)"
      ],
      [
        231,
        "  haveI : IsNoetherianRing T := Algebra.FiniteType.isNoetherianRing S T"
      ],
      [
        235,
        "  obtain ⟨e₁, he₁⟩ := exists_descent (τ := algebraMap S T) (σ₁ := T.val.toRingHom) (fun _ ↦ rfl) hpl _ b₁ hl e"
      ],
      [
        240,
        "theorem liftObj_of_noetherian (P : AbelianDeRham)"
      ],
      [
        245,
        "  intro g A₀ _ A' _ i' h' hA hg F ⟨⟨N, hN⟩, hF⟩"
      ],
      [
        247,
        "    ⟨Submodule.projection _ _ hN, fun x ↦ Submodule.projection_apply_left hN"
      ],
      [
        249,
        "  obtain ⟨S, _, _, σ, B, _, φ, h, e₁, hσ, hB, hgB, hee⟩ := exists_noeth_model P A' hA hg e"
      ],
      [
        250,
        "  let J : Ideal S := RingHom.ker (π.comp σ)"
      ],
      [
        252,
        "  have hJ : J ^ 2 = 0 := by"
      ],
      [
        257,
        "    exact hσ (this.trans (map_zero σ).symm)"
      ],
      [
        259,
        "  let ρ : S ⧸ J →+* R₀ := RingHom.kerLift (π.comp σ)"
      ],
      [
        260,
        "  have hρ : Function.Injective ρ := RingHom.kerLift_injective _"
      ],
      [
        267,
        "  have adm : IsAdmissible k (LinearMap.range e₁) := by"
      ],
      [
        270,
        "    refine ⟨⟨LinearMap.ker e₁, LinearMap.IsIdempotentElem.isCompl (LinearMap.ext fun x ↦ ?_)⟩,"
      ],
      [
        271,
        "      red_descent hρ Ideal.Quotient.mk_surjective hsq (redMor h).pull (redMor k).pull (redMor h').pull"
      ],
      [
        275,
        "      refine LinearMap.ext fun c ↦ hσ ?_"
      ],
      [
        280,
        "  obtain ⟨C, _, l, hl, hC, hgC, hfil⟩ := (H S J hJ (S ⧸ J) π₁ Ideal.Quotient.mk_surjective"
      ],
      [
        282,
        "  obtain ⟨A, _, χ, i, n, hi, hχ, hA₁, hg₁⟩ := exists_factor (k₀.comp hl) sq.symm hC hgC"
      ],
      [
        284,
        "  let α := LinearEquiv.ofBijective _ (P.2.2.2.1 S C g hC hgC J _ (isDPNilpotent_squareZero hJ) _ π₁"
      ],
      [
        289,
        "    GrpMor.of_isGrpPullback (isDPMorphism_sqDP hJ hI σ hJI) sq k₀"
      ],
      [
        291,
        "  refine ann_bc (α.trans β.symm) (redMor h).pull (redMor n).pull b₁ b₂ e e₁ hee _ M hM _"
      ],
      [
        293,
        "  · have := SetLike.ext_iff.1 hfil (x ∘ₗ β.symm.toLinearMap)"
      ],
      [
        301,
        "    exact (GrpMor.pull_pull (redMor n) (liftMor _ hi) ((liftMor (divided₂ hJ) hl).comp m) (fun _ ↦ rfl)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCaseStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftOfNoetherianCaseStatement.lean",
    "sha": "6aae4a108bc44f6f9e009481b4773336f08612fc",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.grothendieckMessing_lift_of_noetherian_case : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        16,
        "  first | exact @GlobalTheory.NoethLiftObj.liftObj_of_noetherian | exact GlobalTheory.NoethLiftObj.liftObj_of_noetherian | (intros; apply GlobalTheory.NoethLiftObj.liftObj_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "LiftHomExistsOfNoetherian",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftHomExistsOfNoetherian.lean",
    "sha": "d5b8cf31044329b8be401203e0d74d060a0a5fa6",
    "checks": [
      [
        14,
        "theorem liftHom_exists_of_noetherian : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        22,
        "  ∀ (f₀ : A₀ ⟶ B₀) [IsMonHom f₀], (∀ d ∈ liftFil (divided₂ h) hA, push (divided₂ h) (spMap π) f₀ d ∈ liftFil (divided₂ h) hB) →"
      ],
      [
        26,
        "    abBS, smBS, pA, pB, qA, qB, cA, cB, cf⟩ := GlobalTheory.T.abelian_hom_reduction_descends_finitely_generated R I R₀ π hπ hker g A₀ A i hA abA smA g' B₀ B j hB abB smB f₀"
      ],
      [
        27,
        "  have hS : (I.comap S.subtype) ^ 2 = 0 := by"
      ],
      [
        30,
        "    rw [h, Ideal.zero_eq_bot, Ideal.comap_bot_of_injective _ Subtype.val_injective]"
      ],
      [
        31,
        "  haveI : IsNoetherianRing S := Algebra.FiniteType.isNoetherianRing ℤ S"
      ],
      [
        32,
        "  have hfilS := GlobalTheory.T.push_mem_liftFil_of_injective_alt P R I h R₀ π hπ hker S S.subtype Subtype.val_injective (I.comap S.subtype) hS"
      ],
      [
        36,
        "  obtain ⟨fS, ⟨_, efS⟩, -⟩ := (H S (I.comap S.subtype) hS (S ⧸ I.comap S.subtype) (Ideal.Quotient.mk _)"
      ],
      [
        37,
        "    Ideal.Quotient.mk_surjective Ideal.mk_ker).2 g AS₀ AS iS hAS abAS smAS g' BS₀ BS jS hBS abBS smBS fS₀ hfilS"
      ],
      [
        38,
        "  let fl : A.left ⟶ B.left := pB.1.lift (φA ≫ fS.left) A.hom (by"
      ],
      [
        41,
        "  apply pB.1.hom_ext"
      ],
      [
        43,
        "    rw [reassoc_of% cA, efS, ← Category.assoc, ← cf, Category.assoc, cB]"
      ]
    ]
  },
  {
    "name": "LiftHomExistsOfNoetherianStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftHomExistsOfNoetherianStatement.lean",
    "sha": "6bd9fddfe3905e45a06108fb901166b2c4c2fd8f",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.liftHom_exists_of_noetherian_alt : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        21,
        "    ∃ f : A ⟶ B, i ≫ f.left = f₀.left ≫ j := by"
      ],
      [
        22,
        "  first | exact @GlobalTheory.liftHom_exists_of_noetherian | exact GlobalTheory.liftHom_exists_of_noetherian | (intros; apply GlobalTheory.liftHom_exists_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "PushMemLiftFilOfInjective",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PushMemLiftFilOfInjective.lean",
    "sha": "6d162cf205e0ff1f4e5fa095994c072ec1c13c91",
    "checks": [
      [
        12,
        "theorem push_mem_liftFil_of_injective : AbelianDeRham →"
      ],
      [
        15,
        "  ∀ (S : Type) [CommRing S] (σ : S →+* R), Function.Injective σ →"
      ],
      [
        34,
        "    (∀ d ∈ liftFil (divided₂ h) hA, push (divided₂ h) (spMap π) f₀ d ∈ liftFil (divided₂ h) hB) →"
      ],
      [
        39,
        "  obtain ⟨_, _, HBC, HR, _⟩ := H"
      ],
      [
        45,
        "  have hdp : IsDPMorphism (divided₂ hJ) (divided₂ h) σ := isDPMorphism_sqDP hJ h σ hJI"
      ],
      [
        53,
        "  obtain ⟨y, hy⟩ := hBCA.1.exists (crysToDR (divided₂ hJ) hAS d)"
      ],
      [
        55,
        "    (GlobalTheory.Published.AbelianDeRham.Rigid.crysToDR_bijective HR hAab hAg (isDPNilpotent_squareZero h) hπ hI hA).2 y"
      ],
      [
        56,
        "  have hsurj := (HR S AS g hASab hASg J (divided₂ hJ) (isDPNilpotent_squareZero hJ) S₀ πS hπS hJk AS₀ iS hAS).2"
      ],
      [
        63,
        "  have hd' : d' ∈ liftFil (divided₂ h) hA := by"
      ],
      [
        65,
        "      rw [hBCA.2, Submodule.span_le]"
      ],
      [
        71,
        "  have hpush := hyp d' hd'"
      ],
      [
        72,
        "  have hcorr := GrpMor.Corr.push (m := mA) mB fS₀ f₀ hf.symm hm"
      ],
      [
        73,
        "  have hx := crysToDR_corr (divided₂ hJ) hBS hB mB nB hjB hcorr"
      ],
      [
        77,
        "  apply hσ"
      ],
      [
        80,
        "  exact (hx c).symm.trans (hpush _ (nB.isMor.pullback1_mem_hodgeFiltration hc))"
      ]
    ]
  },
  {
    "name": "PushMemLiftFilOfInjectiveStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PushMemLiftFilOfInjectiveStatement.lean",
    "sha": "2aa22534da913c9d18f759835872b656d0e7b036",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.push_mem_liftFil_of_injective_alt : AbelianDeRham →"
      ],
      [
        36,
        "  first | exact @GlobalTheory.SqLift.push_mem_liftFil_of_injective | exact GlobalTheory.SqLift.push_mem_liftFil_of_injective | (intros; apply GlobalTheory.SqLift.push_mem_liftFil_of_injective <;> assumption)"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLift",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsUniqueIsMonHomLift.lean",
    "sha": "068d2a0d2492401d9951b1e018d06c5feecd18d8",
    "checks": [
      [
        29,
        "theorem existsUnique_isMonHom_lift :"
      ],
      [
        30,
        "    ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        48,
        "  obtain ⟨f, hfdef⟩ : ∃ f : A ⟶ B, f = φ * ((1 : A ⟶ A) ≫ φ)⁻¹ := ⟨_, rfl⟩"
      ],
      [
        53,
        "  have hf : IsMonHom f := GlobalTheory.rigidity_holds (Sp R) A B hAab hBab f hηf"
      ],
      [
        55,
        "    rw [← hzl, hfdef, comp_mul, GrpObj.comp_inv, hc, inv_one, _root_.mul_one, hzl, hφ]"
      ],
      [
        57,
        "  obtain ⟨d, hddef⟩ : ∃ d : A ⟶ B, d = g * f⁻¹ := ⟨_, rfl⟩"
      ],
      [
        62,
        "  have key := GlobalTheory.Rigidity.eq_comp_section R R₀ π hπ hnil A B A₀ i hA.1 hAab.smooth hAab.proper"
      ],
      [
        72,
        "  exact mul_inv_eq_one.1 hd"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLiftStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsUniqueIsMonHomLiftStatement.lean",
    "sha": "84fbf13797dbe233f5fab526d5bd535937ae26d1",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.existsUnique_isMonHom_lift_of_grpPullback_abelian : ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        16,
        "  first | exact @GlobalTheory.HomLift.existsUnique_isMonHom_lift | exact GlobalTheory.HomLift.existsUnique_isMonHom_lift | (intros; apply GlobalTheory.HomLift.existsUnique_isMonHom_lift <;> assumption)"
      ]
    ]
  },
  {
    "name": "AbelianSchemeDescendsToFinitelyGeneratedSubring",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDescendsToFinitelyGeneratedSubring.lean",
    "sha": "5e248e8d0cc15138e475d6b8a278c40d3d237d00",
    "checks": [
      [
        25,
        "theorem connectedSpace_of_surjective_pow {k : Type} [Field k] [IsAlgClosed k] (G : Over (Sp k)) [GrpObj G]"
      ],
      [
        59,
        "  have : H.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient"
      ],
      [
        65,
        "    exact H.pow_index_mem y"
      ],
      [
        91,
        "theorem surjective_pow {S : Scheme.{0}} (A : Over S) [GrpObj A] (hA : IsAbelianScheme A) (n : ℕ) (hn : 1 ≤ n) :"
      ],
      [
        116,
        "    hm (MulFiniteAny.isFinite_mulA K B hB n hn)).2"
      ],
      [
        121,
        "theorem isAbelianScheme_of_isDominant {S S' : Scheme.{0}} {B : Over S} {A : Over S'} [GrpObj B] [GrpObj A]"
      ],
      [
        132,
        "    rw [← ((𝟙 B) ^ n : B ⟶ B).left.isClosedMap.isClosed_range.closure_eq]"
      ],
      [
        141,
        "  exact connectedSpace_of_surjective_pow ((Over.pullback s).obj B) fun n hn =>"
      ],
      [
        144,
        "theorem abelianScheme_descends_to_fg_subring :"
      ],
      [
        152,
        "    smooth_grpScheme_descends_to_fg_subring R A F hA.smooth inferInstance inferInstance"
      ],
      [
        158,
        "  obtain ⟨s, hs⟩ := ProperLimit.exists_finset_isProper k R A₀.hom"
      ],
      [
        159,
        "  let S : Subalgebra k R := Algebra.adjoin k (s : Set R)"
      ],
      [
        165,
        "  have hd : IsDominant (spMap S.toSubring.subtype) :="
      ],
      [
        167,
        "      rw [(RingHom.injective_iff_ker_eq_bot _).1 Subtype.val_injective]"
      ],
      [
        170,
        "    SpreadGroup.finiteType_of_fg hk (Subalgebra.fg_adjoin_finset s), isAbelianScheme_of_isDominant hφ hA,"
      ]
    ]
  },
  {
    "name": "AbelianSchemeDescendsToFinitelyGeneratedSubringStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDescendsToFinitelyGeneratedSubringStatement.lean",
    "sha": "db471312d16f8ab9ea199fe005c23722c1ed19bd",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring : ∀ (R : Type) [CommRing R] (g : ℕ) (A : Over (Sp R)) [GrpObj A] (F : Finset R), IsAbelianScheme A → SmoothOfRelativeDimension g A.hom →"
      ],
      [
        15,
        "  first | exact @GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring | exact GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring | (intros; apply GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring <;> assumption)"
      ]
    ]
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGenerated",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianHomReductionDescendsFinitelyGenerated.lean",
    "sha": "457cca287fbacd987e38dcb4020c3ee98b25c010",
    "checks": [
      [
        37,
        "theorem exists_finset_le_of_finiteType : ∀ (R : Type) [CommRing R] (S : Subring R), Algebra.FiniteType ℤ S → ∃ F : Finset R, ∀ T : Subring R, (F : Set R) ⊆ T → S ≤ T := by"
      ],
      [
        74,
        "noncomputable def redEquiv {R R₀ : Type} [CommRing R] [CommRing R₀] (I : Ideal R) (π : R →+* R₀)"
      ],
      [
        98,
        "theorem morphism_descends_to_reduction : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀) (hπ : Function.Surjective π) (hI : RingHom.ker π = I) (S : Subring R) (X X₀ Y₀ : Scheme.{0}) (p : X ⟶ Sp R₀) (a : X₀ ⟶ Sp (S ⧸ I.comap S.subtype)) (b : Y₀ ⟶ Sp (S ⧸ I.comap S.subtype)) (π' : X ⟶ X₀) [QuasiCompact a] [QuasiSeparated a] [LocallyOfFinitePresentation b] (φ : X ⟶ Y₀), IsPullback π' p a (spMap (GlobalTheory.AbHomDesc.iota I π hI S)) → φ ≫ b = π' ≫ a → ∃ F : Finset R, ∀ (S' : Subring R) (h : S ≤ S'), (F : Set R) ⊆ S' → ∀ (X₁ : Scheme.{0}) (a₁ : X₁ ⟶ Sp (S' ⧸ I.comap S'.subtype)) (π₁ : X₁ ⟶ X₀) (k : X ⟶ X₁), IsPullback π₁ a₁ a (spMap (GlobalTheory.AbHomDesc.trans I h)) → k ≫ π₁ = π' → k ≫ a₁ = p ≫ spMap (GlobalTheory.AbHomDesc.iota I π hI S') → ∃ ψ : X₁ ⟶ Y₀, k ≫ ψ = φ ∧ ψ ≫ b = π₁ ≫ a := by"
      ],
      [
        105,
        "  obtain ⟨F₀, hF₀⟩ := GlobalTheory.morphism_descends_to_subring R₀ (iota I π hI S).range X X₀ Y₀ p"
      ],
      [
        108,
        "  refine ⟨F₀.image (Function.surjInv hπ), fun S' h hF X₁ a₁ π₁ k hpb₁ hk₁ hk₂ => ?_⟩"
      ],
      [
        138,
        "theorem exists_isGrpPullback_reduction : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀) (hI : RingHom.ker π = I) (S : Subring R) (A₀ : Over (Sp R₀)) [GrpObj A₀] (A : Over (Sp R)) [GrpObj A] (i : A₀.left ⟶ A.left) (AS : Over (Sp S)) [GrpObj AS] (φ : A.left ⟶ AS.left), IsGrpPullback A₀ A (spMap π) i → IsGrpPullback A AS (spMap S.subtype) φ → ∃ ψ : A₀.left ⟶ ((Over.pullback (spMap (Ideal.Quotient.mk (I.comap S.subtype)))).obj AS).left, IsGrpPullback A₀ ((Over.pullback (spMap (Ideal.Quotient.mk (I.comap S.subtype)))).obj AS) (spMap (GlobalTheory.AbHomDesc.iota I π hI S)) ψ ∧ i ≫ φ = ψ ≫ pullback.fst AS.hom (spMap (Ideal.Quotient.mk (I.comap S.subtype))) := by"
      ],
      [
        146,
        "theorem abelian_hom_reduction_descends : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        166,
        "  obtain ⟨S₀, AS₀, _, φA₀, -, hfg₀, hAS₀ab, hAS₀sm, hφA₀⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g A ∅ hAab hAsm"
      ],
      [
        168,
        "  obtain ⟨S₁, BS₁, _, φB₁, hF₀S₁, hfg₁, hBS₁ab, hBS₁sm, hφB₁⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g' B F₀ hBab hBsm"
      ],
      [
        184,
        "  obtain ⟨F, hF⟩ := morphism_descends_to_reduction R I R₀ π hπ hI S₁ A₀.left _ _ A₀.hom"
      ],
      [
        188,
        "  obtain ⟨S', h, hFS, hfg'⟩ := GlobalTheory.KeyTf.exists_finiteType_subring_adjoin R S₁ F hfg₁"
      ],
      [
        209,
        "  obtain ⟨ψ, hψ₁, hψ₂⟩ := hF S' h hFS _ (pullback.snd AS'.hom _) pA ψA' hpA cA wA'"
      ],
      [
        215,
        "  have key : f₀.left ≫ ψB' = ψA' ≫ fS.left := by"
      ],
      [
        224,
        "  have : IsSchemeTheoreticallyDominant (spMap (iota I π hI S')) :="
      ],
      [
        225,
        "    GlobalTheory.ExtUnique.isSchemeTheoreticallyDominant_spec_of_injective _ (iota_injective I π hI S')"
      ],
      [
        232,
        "  have hmon : IsMonHom fS := GlobalTheory.ExtUnique.isMonHom_of_isGrpPullback hψA' hψB' f₀ fS key"
      ]
    ]
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGeneratedStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianHomReductionDescendsFinitelyGeneratedStatement.lean",
    "sha": "e803020736ead31f5a1316b3a4eee5387dd25fcf",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.abelian_hom_reduction_descends_finitely_generated : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        30,
        "  first | exact @GlobalTheory.AbHomDesc.abelian_hom_reduction_descends | exact GlobalTheory.AbHomDesc.abelian_hom_reduction_descends | (intros; apply GlobalTheory.AbHomDesc.abelian_hom_reduction_descends <;> assumption)"
      ]
    ]
  },
  {
    "name": "EqCompSectionOfProperSmoothNilpotentRigidity",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EqCompSectionOfProperSmoothNilpotentRigidity.lean",
    "sha": "cb7128e5287191c40fcc5a39e55ee09fb9a62829",
    "checks": [
      [
        16,
        "theorem spMap_surjective {R R₀ : Type} [CommRing R] [CommRing R₀] (π : R →+* R₀)"
      ],
      [
        20,
        "  have h2 : PrimeSpectrum.zeroLocus (RingHom.ker π : Set R) = Set.univ := by"
      ],
      [
        31,
        "theorem eq_comp_section : ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        40,
        "    forall_geometricallyIntegral_of_smooth_of_geometricallyConnected _ _ P.hom hsm hgc"
      ],
      [
        42,
        "    have := GlobalFunctions.isIso_app FlatFibreInjective.injective_baseChange"
      ],
      [
        43,
        "      exists_noetherian_model_of_smooth P.hom V"
      ],
      [
        49,
        "    refine local_rigidity _ _ _ P.hom ε f.left hε inferInstance hsurj t (s₀ t₀) ?_"
      ],
      [
        62,
        "  exact (P.left.openCoverOfIsOpenCover _ hc).hom_ext _ _ fun t => hfg t"
      ]
    ]
  },
  {
    "name": "AbelianLiftingOfDeRhamUnobstructed",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfDeRhamUnobstructed.lean",
    "sha": "271c5c0d12c40d2230c3df521256f39e9ebfc0f4",
    "checks": [
      [
        72,
        "theorem abelianLifting_of_schemeLifts :"
      ],
      [
        75,
        "  refine abelianLifting_of_sqLifting hD hU (GlobalTheory.T.squareZeroLifting_of_noetherian_case hD ?_)"
      ],
      [
        77,
        "  exact ⟨GlobalTheory.T.grothendieckMessingLiftAbelianScheme_of_squareZero hD R R₀ I hI π hπ hk (hL R I hI R₀ π hπ hk),"
      ],
      [
        78,
        "    GlobalTheory.T.grothendieckMessingLiftHomomorphism_of_squareZero hD R R₀ I hI π hπ hk (hL R I hI R₀ π hπ hk)⟩"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement.lean",
    "sha": "a4591047a5b6959a970e8593ff1ec6009be4ada4",
    "checks": [
      [
        13,
        "theorem _root_.GlobalTheory.T.grothendieckMessingLiftAbelianScheme_of_squareZero : AbelianDeRham → ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (I : Ideal R) (hI : I ^ 2 = 0) (π : R →+* R₀), Function.Surjective π → RingHom.ker π = I → AbelianSchemeLifts.At hI π → LiftObj (divided₂ hI) π := by"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.liftObj_sq | exact GlobalTheory.SqLift.liftObj_sq | (intros; apply GlobalTheory.SqLift.liftObj_sq <;> assumption)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftHomomorphismOfSquareZeroStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftHomomorphismOfSquareZeroStatement.lean",
    "sha": "5d748c8b2fc9816b156da7bc296a7abb536be3d9",
    "checks": [
      [
        13,
        "theorem _root_.GlobalTheory.T.grothendieckMessingLiftHomomorphism_of_squareZero : AbelianDeRham → ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (I : Ideal R) (hI : I ^ 2 = 0) (π : R →+* R₀), Function.Surjective π → RingHom.ker π = I → AbelianSchemeLifts.At hI π → LiftHom (divided₂ hI) π := by"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.Hom.liftHom_sq | exact GlobalTheory.SqLift.Hom.liftHom_sq | (intros; apply GlobalTheory.SqLift.Hom.liftHom_sq <;> assumption)"
      ]
    ]
  }
]
```

### Current-head clump migration
```json
[
  {
    "name": "SquareZeroLiftingOfNoetherianCase",
    "start": 1822,
    "end": 1847,
    "anchors": 4,
    "matches": 3
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCase",
    "start": 981,
    "end": 1292,
    "anchors": 46,
    "matches": 46
  },
  {
    "name": "LiftHomExistsOfNoetherian",
    "start": 1747,
    "end": 1795,
    "anchors": 12,
    "matches": 12
  },
  {
    "name": "PushMemLiftFilOfInjective",
    "start": 1620,
    "end": 1706,
    "anchors": 15,
    "matches": 15
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGenerated",
    "start": 1354,
    "end": 1585,
    "anchors": 16,
    "matches": 16
  }
]
```
