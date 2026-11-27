# Lean 4.35 graph collector compatibility

27 November 2026. Collector repair PREPARED; recursive graph not accepted.
RH remains OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Shared run 46006832164 rebuilt the pinned CrudeEnergy closure (exit 0,
1384.02 s), checked all seven pair/energy declarations (exit 0, 55.32 s),
and checked the reversible skew/count replacement (exit 0, 60.18 s).
Every requested theorem reports only propext, Classical.choice, Quot.sound.
The six-root graph exited 1 after 5.58 s with
`getUsedConstants disagrees with independent traversal`. Its incomplete
stream has 31 lines and no footer. Do not accept it as a complete graph.

Actual source of the mismatch: Lean 4.35.0's
`Lean/Util/FoldConsts.lean:41` visits a projection's carrier name:

    | .proj typeName _ b => visit b (← visitConst typeName acc)

The authenticated older exporter explicitly assumed FoldConsts skipped
projection carriers. It compared native getUsedConstants only with .const
nodes, although its independent traversal already recorded .proj carriers
in a separate set. The Nat.le_refl compatibility check did not exercise
that difference. This is a collector compatibility failure, not a new
axiom or a failed B2 theorem.

The derived adapter preserves the original exporter byte-for-byte and
changes its generated copy. It requires exact set equality:

    native constants = independent .const names ∪ independent .proj carriers.

It exports .const and .proj edges in their separate existing schema fields.
It neither drops projection edges nor relaxes equality, missing-node checks,
constructor closure or the independent verifier. A future mismatch reports
both missing and extra names. The generated six-root source has blob
0d7a169b087a23bf6c0139904086ca187c643648. Preparation checks passed;
fresh native graph execution and independent verification remain required.

Original exporter blob ee4efebb066f6775fa551ae9104cfa973e585071 and
Node verifier blob 2e431301970196a6b786d004fb16a4320a25fe8e remain unchanged.
The failed stream and exact logs remain under
`cathedral-research-state/compute/rh-compact-b2-full-chain-graph-20261127/outputs/graph/`.
Graph execution receipt aa93ae80a43143cac2d15535bfd1c5c42c1bf321;
compiler log ae8303ac742f9ce634b34966617e8b0e18e5269c;
partial stream 5e1eca007f80977b9eddb92b1e11802714213940.

RESUME HERE: run the repaired six-root audit using the already checked local
module and authenticated native cache. Do not repeat the seven proofs or
launch a cold source build. Require a complete footer, zero missing records,
all six independent root audits and all recursive caller guards before
acceptance. Keep the subsequent fused count-to-energy candidate separate.
