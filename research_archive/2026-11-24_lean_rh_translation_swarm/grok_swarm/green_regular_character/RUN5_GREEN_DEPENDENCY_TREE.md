# Green lane dependency tree after RUN1–RUN5

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab…`.
This file supersedes `RUN4_GREEN_DEPENDENCY_TREE.md`, which is left unchanged as history.

**Arrow `A ⇐ B, C`.** It means one of two things:
* *Reconstructed* (Lean, lake-built, standard axioms only): the exact upstream statement A is derived in a companion module from hypotheses whose text is the exact upstream statements of B and C.
* *Source edge* (not reconstructed): the upstream proof of A cites B and C. This was read from the pinned source and was not rebuilt by this lane.

**Markers.**
* **[✓ no hyps]**: derived in the companion with no remaining upstream hypotheses. This is a faithful re-derivation from verbatim upstream definitions; it is not a build of the upstream repository.
* Every other reconstructed node is **conditional** on the leaves below it.

No gate is closed.

## Tree
```
GlobalTheory.greenRegularCharacters_holds                       [RUN1, Exhaustion.lean]
 ⇐ T.exists_cuspidalCharacter_of_regularCharacter_GLn            (ExistsPart)
 │   source edge ⇐ ParamLabel.isCusp_psi ⇐ … T.isCharacter_cuspidal_rootSum_regular, + rootSum/Möbius-inverse lemmas
 ├ T.monicIrreducible_inject_regularCharacterOrbits               (InjectPart)   — leaf
 ├ T.card_cuspidal_multisets_total_degree_le                      (CardPart)
 │   source edge ⇐ T.ncard_generic_irreducible_characters_GLn_le, T.exists_generic_constituent_harishChandra_cuspidal,
 │   GLq.irr_finite_and_finsum_zOf_eq_one, GLq.IpCuspProd.ip_hcL_cusp
 └ T.ncard_monic_natDegree_coeff_zero_ne_zero                     (PolyPart)     — leaf
GlobalTheory.GreenBridge.green_of_regular                       [RUN1, Bridge.lean]

card_generic_irr_le                                             [RUN2, GenericCount.lean]
 ⇐ FinIrr, CharDec, TrIdem, WJ,
   GGNorm = T.gelfandGraevCharacterGLn_norm_and_reciprocity     [RUN3, GGNorm.lean]
     ⇐ GLm.GGSum.sum_wh_gg                                       [RUN4, SumWhGG.lean]
         ⇐ T.whittakerJacquetIdempotents_properties_primeField (WJ),
           T.whittakerDimension_harishChandraInduction_mul (WhMul),
           T.bernsteinZelevinskyDerivativeGLn_eq_twisted_sum (BZ),
           T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives  [RUN5, mirPart_of_deps]
             ⇐ T.mirabolicConjInvariant_eq_sum_induced_derivatives (MirConj),
               T.mirabolicInduction_blockDiag_eq_harishChandra_gelfandGraev (MirInd),
               T.isClassFunction_bernsteinZelevinskyDerivative (DerClass)
         (combined: sumWhGGPart_of_leaves, RUN5)
ip_hcL_cusp                                                     [RUN2, MackeyCusp.lean]
 ⇐ FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm
T.isCharacter_cuspidal_rootSum_regular                          [RUN2, RootSumCore.lean]
 ⇐ psi_conj, rootSum_charpoly_mem_virt, rootSum_isAdditive, PrimOrth.ipGL_psi_eq, isPrimitive_psi,
   extZero_spec, psi_one, irr_of_norm_one,
   ParabVirt.parab_virt ⇐ virt_mul_comap_conj_ind_linear                    [RUN3, CuspGLRun3.lean]
   CuspGL.ipGL_psi_rootSum ⇐ RA, Conj, Prim, Min, Mang, Orth,                [RUN3, CuspGLRun3.lean]
     Torus = T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum   [✓ no hyps: torusPart_holds, RUN5]
       ⇐ T.classFn_eq_zero_of_charpoly_not_irreducible_pow          [✓ no hyps: notPrimaryPart_holds, RUN5]
     Mass  = T.endomorphismMass_mobiusInverse_monic_eq              [RUN4; massPart_of_leaves, RUN5]
       ⇐ T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj (Conj),
         T.additive_mul_eq_vonMangoldt_convolution (LogConv),
         T.endomorphismMass_mul_parabolic_induction_trivial (ParMass),
         T.apply_charpoly_eq_finsum_psi_invariant_submodules (PsiSum),
         T.endomorphismMass_eq_of_linearEquiv_invariant (MassEq),
         T.monicFactorizationConvolution_cancel_of_one              [✓ no hyps: cancelPart_holds, RUN5]
         T.charpolyEndomorphismDensityGL_recursion                  [RUN5, muRecPart_of_deps]
           ⇐ ParMass, T.finsum_card_cyclic_vectors_invariant_subspaces (CycSum),
             T.endomorphismMassOfCharpoly_card_cyclic_vectors (MassCyc)
```
The exact upstream names of the RUN2/RUN3 short labels are given in `RUN2_GENERIC_COUNT_MACKEY_ROOTSUM.md` and `RUN3_IPGL_PARAB_GGNORM.md`.

## Current leaf frontier
* **RUN1:**
  * `T.monicIrreducible_inject_regularCharacterOrbits`
  * `T.ncard_monic_natDegree_coeff_zero_ne_zero`
  * The proof bodies of the Exists and Card nodes are not yet reconstructed; they are linked only by source edges.
* **RUN2:**
  * FinIrr, CharDec, TrIdem;
  * FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm;
  * the 8 non-reduced RootSum deps.
* **RUN3:**
  * `virt_mul_comap_conj_ind_linear`
  * RA, Conj, Prim, Min, Mang, Orth.
* **Whittaker side:** WJ, WhMul, BZ, MirConj, MirInd, DerClass.
* **Mass side:** Conj, LogConv, ParMass, PsiSum, MassEq, CycSum, MassCyc.

**Closed in RUN5, with no remaining hypotheses in the companion:** NotPrimary, Cancel, and through them Torus.

**Suggested next targets:**
* Small self-contained ones: CycSum (`T.finsum_card_cyclic_vectors_invariant_subspaces`), MassCyc, MassEq (`T.endomorphismMass_eq_of_linearEquiv_invariant`), LogConv (`T.additive_mul_eq_vonMangoldt_convolution`) and DerClass.
* After those: MirInd and MirConj.
