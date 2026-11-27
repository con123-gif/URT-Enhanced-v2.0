# Determinant class-sum attachment — not yet accepted

27 November 2026. The [finite determinant exchange](../C2_DETERMINANT_EXCHANGE.lean) and its complete dependency graph have passed. The [consumer source](../C2_DETERMINANT_CLASS_SUM.lean) is the next proposed attachment through the native real_matching theorem to the complete original determinant class-sum statement. **This consumer has no accepted kernel or complete-graph receipt yet. RH and root C2 remain OPEN.**

The first two actual attempts are preserved in full. Attempt 1 failed on namespace/type elaboration. Attempt 2 additionally exposed a pointwise weight-function normalization, the missing local HasWeight instance, and an expensive grind search for a left inverse of an empty-column matrix; it reached the fixed heartbeat limit. Both reported sorryAx and were rejected even though the complete-statement/direct-edge command could inspect the failed declarations. A type/edge sentinel alone is never acceptance.

The current proposed source exposes the weight instance, normalizes the function and inverse character explicitly, and proves the empty-column left inverse directly. These changes add no premise. The rank-zero Haar volume remains in the final normalization. Later replays are running against separate exact source copies; no success is inferred before their compiler, complete-statement, supplier and axiom guards all pass. Complete transitive old/new graph verification must then follow.

Reuse the authenticated C2 workspace and accepted C2Combined, C2StandardExchange, C2DeterminantLift and C2DeterminantExchange receipts. The generic replay runner accepts each dependency receipt and authenticates its exact source and compiled object before import. Do not repeat the completed original source build.
