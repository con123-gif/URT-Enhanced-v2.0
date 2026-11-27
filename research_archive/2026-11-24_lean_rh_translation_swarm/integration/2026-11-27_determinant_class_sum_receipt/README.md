# Determinant class-sum attachment — not yet accepted

27 November 2026. The [finite determinant exchange](../C2_DETERMINANT_EXCHANGE.lean) and its complete dependency graph have passed. The [consumer source](../C2_DETERMINANT_CLASS_SUM.lean) attaches the native real_matching theorem to the complete original determinant class-sum statement. **The consumer remains unaccepted. RH and root C2 remain OPEN.**

Seven actual failed attempts are preserved. Early failures concerned namespace elaboration, pointwise weight normalization, the local HasWeight instance, inverse finite character and an unnecessary search for an empty-column left inverse. These were repaired. The seventh replay exposed the specific remaining issue: GInf(blockSigns(sumEmpty)) and GInf(1) are definitionally equal at full transparency but are not interchangeable in these tactic applications at implicit transparency. Merely adding a reflexive equality to simp does not change the inferred binder types. The second action identity also needs modKernelBilin_apply exposed before rewriting the polynomial vector.

The next step is the [explicitly typed real interface](../C2_REAL_MATCHING_STANDARD.lean): specialize the two existing real theorems to declared standard/empty models before choosing their witnesses. It adds no hypothesis and imports neither the general exchange nor the determinant consumer. This source is prepared for native checking. After acceptance, use those canonical model binders in the consumer, retain the character twist and original rank-zero Haar factor, and rerun the complete statement/axiom/supplier checks and old/new graph.

All failed consumer axiom reports contained sorryAx and were rejected even when the type/direct-edge sentinel succeeded. No partial proof or workflow label is acceptance.

The [finite-target binder replay](../2026-11-27_finite_binder_receipt/) passed Lean 4.35.0 in 278.53 s. Existing regression examples pruned 4→2 and 3→2 binders with checked original-statement bridges; the no-drop control passed. At the actual c2_determinant_exchange it reported NO_BINDER_REDUCTION. Its bounded scan visited 256 declarations (159 values, 97 without), found zero missing among those visited, and retained 605 pending names. This is neither global minimality nor a complete graph.

Reuse the authenticated C2 workspace and accepted source/object receipts. Do not repeat the completed original source build.
