# Green lane dependency tree after RUN1–RUN4

Grok, green_regular_character lane, 2026-11-24 (GMT). Upstream `leanprover-community/riemann-hypothesis` @ `40e56bab…`.
Arrow `A ⇐ B, C` means: *reconstructed* (Lean, lake-built, standard axioms only) — the exact upstream statement A is
derived in a companion module from hypotheses whose text is the exact upstream statements of B, C; or *source edge*
(not reconstructed) — the upstream proof of A cites B, C (read from the pinned source, not rebuilt by this lane).
Every reconstructed node is **conditional** on the leaves at the bottom. No gate is closed.

## Tree
```
GlobalTheory.greenRegularCharacters_holds                       [RUN1, Exhaustion.lean]
 ⇐ T.exists_cuspidalCharacter_of_regularCharacter_GLn            (ExistsPart)
 │   source edge ⇐ ParamLabel.isCusp_psi ⇐ … T.isCharacter_cuspidal_rootSum_regular, + rootSum/Möbius-inverse
 │   lemmas (T.rootPowerSumCharacter_additive_and_X_sub_one_pow, T.invariantSubspaceMobiusInverseCharpoly_*,
 │   T.exists_teichmuller_map_algebraicClosure_finiteField, …)
 ├ T.monicIrreducible_inject_regularCharacterOrbits               (InjectPart)   — leaf for this lane
 ├ T.card_cuspidal_multisets_total_degree_le                      (CardPart)
 │   source edge ⇐ T.ncard_generic_irreducible_characters_GLn_le, T.exists_generic_constituent_harishChandra_cuspidal,
 │   GLq.irr_finite_and_finsum_zOf_eq_one, GLq.IpCuspProd.ip_hcL_cusp
 └ T.ncard_monic_natDegree_coeff_zero_ne_zero                     (PolyPart)     — leaf for this lane
GlobalTheory.GreenBridge.green_of_regular                       [RUN1, Bridge.lean] (GLq.Green from GreenRegularCharacters)

card_generic_irr_le                                             [RUN2, GenericCount.lean]
 ⇐ FinIrr, CharDec, TrIdem, WJ = T.whittakerJacquetIdempotents_properties_primeField,
   GGNorm = T.gelfandGraevCharacterGLn_norm_and_reciprocity
         ⇐ GLm.GGSum.sum_wh_gg                                   [RUN3, GGNorm.lean]
             ⇐ T.whittakerJacquetIdempotents_properties_primeField,
               T.whittakerDimension_harishChandraInduction_mul,
               T.bernsteinZelevinskyDerivativeGLn_eq_twisted_sum,
               T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives   [RUN4, SumWhGG.lean; ggNorm_of_deps]
ip_hcL_cusp                                                     [RUN2, MackeyCusp.lean]
 ⇐ FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm
T.isCharacter_cuspidal_rootSum_regular                          [RUN2, RootSumCore.lean]
 ⇐ psi_conj, rootSum_charpoly_mem_virt, rootSum_isAdditive, PrimOrth.ipGL_psi_eq, isPrimitive_psi,
   extZero_spec, psi_one, irr_of_norm_one,
   ParabVirt.parab_virt ⇐ virt_mul_comap_conj_ind_linear                         [RUN3, CuspGLRun3.lean]
   CuspGL.ipGL_psi_rootSum ⇐ RA, Conj, Prim, Min, Mang, Orth,                     [RUN3, CuspGLRun3.lean]
       Torus = T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum
             ⇐ T.classFn_eq_zero_of_charpoly_not_irreducible_pow                 [RUN4, torusPart_of_deps]
       Mass  = T.endomorphismMass_mobiusInverse_monic_eq
             ⇐ T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj,
               T.charpolyEndomorphismDensityGL_recursion,
               T.additive_mul_eq_vonMangoldt_convolution,
               T.endomorphismMass_mul_parabolic_induction_trivial,
               T.apply_charpoly_eq_finsum_psi_invariant_submodules,
               T.monicFactorizationConvolution_cancel_of_one,
               T.endomorphismMass_eq_of_linearEquiv_invariant                    [RUN4, massPart_of_deps]
```
Exact upstream names of the RUN2/RUN3 short labels are in `RUN2_GENERIC_COUNT_MACKEY_ROOTSUM.md` and
`RUN3_IPGL_PARAB_GGNORM.md`.

## Current leaf frontier (open, not attempted in this lane yet)
* RUN1: `T.monicIrreducible_inject_regularCharacterOrbits`, `T.ncard_monic_natDegree_coeff_zero_ne_zero`; the Exists
  and Card nodes are linked to RUN2 work only by source edges (their own proof bodies not yet reconstructed).
* RUN2: FinIrr, CharDec, TrIdem (card_generic_irr_le); FrobRec, ResCuspZero, ResProd, ZOrth, HCPerm (ip_hcL_cusp);
  the 8 non-reduced RootSum deps listed above.
* RUN3: `virt_mul_comap_conj_ind_linear`; ipGL_psi_rootSum's RA, Conj, Prim, Min, Mang, Orth.
* RUN4: the 4 Whittaker/BZ/mirabolic leaves, `T.classFn_eq_zero_of_charpoly_not_irreducible_pow`, the 7 mass leaves
  (`T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj` also = RUN3's Conj).

Suggested next targets (small, self-contained, finite checks possible): `T.charpolyEndomorphismDensityGL_recursion`
(already finitely checked in RUN4 for q=2 deg≤3, q=3 deg≤2), `T.classFn_eq_zero_of_charpoly_not_irreducible_pow`,
`T.monicFactorizationConvolution_cancel_of_one`, `T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives`.
