# Green lane dependency tree after RUN1–RUN6

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream `leanprover-community/riemann-hypothesis` @ `40e56bab…`.
Supersedes `RUN5_GREEN_DEPENDENCY_TREE.md` (kept unchanged as history). Arrow `A ⇐ B, C`: *reconstructed* (Lean,
lake-built, standard axioms only) — exact upstream statement A derived in a companion from hypotheses whose text is
the exact upstream statements B, C; or *source edge* (not reconstructed) — read from the pinned source only.
**[✓ no hyps]** = derived in the companion with no remaining upstream hypotheses (faithful re-derivation from
verbatim upstream definitions, not a build of the upstream repository). Every other node is **conditional**.
No gate is closed.

## Tree
```
GlobalTheory.greenRegularCharacters_holds                       [RUN1, Exhaustion.lean]
 ⇐ T.exists_cuspidalCharacter_of_regularCharacter_GLn            (ExistsPart)
 │   source edge ⇐ ParamLabel.isCusp_psi ⇐ … T.isCharacter_cuspidal_rootSum_regular, + rootSum/Möbius-inverse lemmas
 ├ T.monicIrreducible_inject_regularCharacterOrbits               (InjectPart)   — closed by LEAVES_I_PN (e53a195, other worker)
 ├ T.card_cuspidal_multisets_total_degree_le                      (CardPart)
 │   source edge ⇐ T.ncard_generic_irreducible_characters_GLn_le, T.exists_generic_constituent_harishChandra_cuspidal,
 │   GLq.irr_finite_and_finsum_zOf_eq_one, GLq.IpCuspProd.ip_hcL_cusp
 └ T.ncard_monic_natDegree_coeff_zero_ne_zero                     (PolyPart)     — closed by LEAVES_I_PN (e53a195, other worker)
GlobalTheory.GreenBridge.green_of_regular                       [RUN1, Bridge.lean]

card_generic_irr_le                                             [RUN2, GenericCount.lean]
 ⇐ FinIrr, CharDec, TrIdem, WJ,
   GGNorm = T.gelfandGraevCharacterGLn_norm_and_reciprocity     [RUN3, GGNorm.lean]
     ⇐ GLm.GGSum.sum_wh_gg                                       [RUN4; combined: sumWhGGPart_of_leaves6', RUN6]
         ⇐ T.whittakerJacquetIdempotents_properties_primeField (WJ),
           T.whittakerDimension_harishChandraInduction_mul (WhMul),
           T.bernsteinZelevinskyDerivativeGLn_eq_twisted_sum (BZ),
           T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives  [RUN5; mirPart_of_leaves6, RUN6]
             ⇐ T.mirabolicConjInvariant_eq_sum_induced_derivatives          [RUN6, mirConjPart_of_deps]
                 ⇐ T.isMirabolicConjInvariant_twistedTailMeanFun (TailMir),
                   T.mirabolic_function_eq_induced_derivative_add_tail (MirTail),
                   T.mirabolicInductionPhiPlus_inductionFromBlockUni (PhiPlus),
                   T.der_tail_of_lt_of_le (DerTail)
               T.mirabolicInduction_blockDiag_eq_harishChandra_gelfandGraev [RUN6, mirIndPart_of_deps]
                 ⇐ T.blockParabolic_unitriangular_subgroups_GLnPrimeField (BlockPar)
               T.isClassFunction_bernsteinZelevinskyDerivative              [✓ no hyps, RUN6]
ip_hcL_cusp                                                     [RUN2, MackeyCusp.lean]
 ⇐ FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm
T.isCharacter_cuspidal_rootSum_regular                          [RUN2, RootSumCore.lean]
 ⇐ psi_conj, rootSum_charpoly_mem_virt, rootSum_isAdditive, PrimOrth.ipGL_psi_eq, isPrimitive_psi,
   extZero_spec, psi_one, irr_of_norm_one,
   ParabVirt.parab_virt ⇐ virt_mul_comap_conj_ind_linear                    [RUN3, CuspGLRun3.lean]
   CuspGL.ipGL_psi_rootSum ⇐ RA, Conj, Prim, Min, Mang, Orth,                [RUN3, CuspGLRun3.lean]
     Torus = T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum   [✓ no hyps, RUN5]
       ⇐ T.classFn_eq_zero_of_charpoly_not_irreducible_pow          [✓ no hyps, RUN5]
     Mass  = T.endomorphismMass_mobiusInverse_monic_eq              [RUN4; massPart_of_leaves6, RUN6]
       ⇐ T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj (Conj),
         T.endomorphismMass_mul_parabolic_induction_trivial (ParMass),
         T.apply_charpoly_eq_finsum_psi_invariant_submodules (PsiSum),
         T.endomorphismMass_eq_of_linearEquiv_invariant              [✓ no hyps, RUN6]
         T.monicFactorizationConvolution_cancel_of_one               [✓ no hyps, RUN5]
         T.additive_mul_eq_vonMangoldt_convolution                   [RUN6, logConvPart_of_deps]
           ⇐ T.monicFactorizationConvolution_finite_comm_assoc_add (FinComm),
             T.additive_eq_polynomialVonMangoldt_convolution_one (VonMangoldtOne)
         T.charpolyEndomorphismDensityGL_recursion                   [RUN5; muRecPart_of_parMass, RUN6]
           ⇐ ParMass,
             T.finsum_card_cyclic_vectors_invariant_subspaces        [✓ no hyps, RUN6]
             T.endomorphismMassOfCharpoly_card_cyclic_vectors        [✓ no hyps, RUN6]
```
Exact upstream names of RUN2/RUN3 short labels: `RUN2_GENERIC_COUNT_MACKEY_ROOTSUM.md`, `RUN3_IPGL_PARAB_GGNORM.md`.

## Current leaf frontier
* RUN1: Inject and PolyCount were closed (Mathlib-only) by another worker in `e53a195` (`LEAVES_I_PN_*`; reported
  there, not re-checked in this run). Exists and Card proof bodies not reconstructed (source edges only).
* RUN2: FinIrr, CharDec, TrIdem; FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm; the 8 non-reduced RootSum deps.
* RUN3: `virt_mul_comap_conj_ind_linear`; RA, Conj, Prim, Min, Mang, Orth.
* Whittaker side: WJ, WhMul, BZ, TailMir, MirTail, PhiPlus, DerTail, BlockPar.
* Mass side: Conj, ParMass, PsiSum, FinComm, VonMangoldtOne.

Closed (no hyps in companion) so far: RUN5 NotPrimary, Cancel, Torus; RUN6 CycSum, MassCyc, MassEq, DerClass.

Suggested next: FinComm (`T.monicFactorizationConvolution_finite_comm_assoc_add`), VonMangoldtOne
(`T.additive_eq_polynomialVonMangoldt_convolution_one`), DerTail (`T.der_tail_of_lt_of_le`), TailMir, BlockPar;
then ParMass, PsiSum, Conj.
