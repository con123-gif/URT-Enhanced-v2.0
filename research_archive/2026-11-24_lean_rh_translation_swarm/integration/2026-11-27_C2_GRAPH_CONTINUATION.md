# C2 dependency audit continuation

27 November 2026, 15:53 UTC. WORK IN PROGRESS. RH remains OPEN.

Credit: original proof by Alpöge, Sernau, Anthropic collaborators and Claude.
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

## Recovered prior work

- B2: joint eleven-declaration labelled/skew count-to-energy module was already
  checked, source 46f4fe6655495d3d6a49ff2199f827fef30e7020. Do not repeat it.
- C2: third native combined replay completed successfully in the existing
  authenticated Carrier workspace: six candidate declarations, five complete
  original statement/dependency guards, seven original axiom probes. Compiler
  exit 0 in 126.63 s. Source aba46120ca4118decd864f817b51bcca2bc31c19;
  checked object SHA256 9ee60a0ff16a5f1fd6756906e050081de2b0f7afba39334b0534e436b4f46df3.
  Only propext, Classical.choice and Quot.sound were reported.
  Exact source/log/receipt are now retained in 2026-11-27_c2_third_native_receipt/.
- Earlier two native C2 failures remain unchanged in their existing folders.
- The native eight-root fused B2 graph completed: 94,382 nodes, 2,857,836
  constructor-inclusive reference edges, zero missing nodes, eight independent
  verifier exits 0, and all advertised supplier/old-target guards true.
  These are a local frontier, not coverage of the complete RH graph.

## Next audit

The already-running interpreted C2 graph was observed writing its ten-root
JSONL at 15:52 UTC. Reuse that execution and preserve its exact result; do not
launch a second source build. Check every graph record against the independent
verifier, then check recursive old-target absence, retained general outer
exchange, and standard-pair supplier reachability. The native collector has
only core and limited B2 equivalence evidence so far; record that scope.

The whole human C2 assembly, reciprocal height estimates, decisive inequality
and full RH replay remain OPEN. A successful replacement does not prove
these remaining premises.

## RESUME HERE

Last completed: recovered and authenticated the actual third C2 compiler
receipt, and regenerated the same combined source with the current runner.
Next: inspect c2_native_graph/graph_execution.json and c2_graph_summary.json
under the existing rh_native_work_logs; when complete, audit the ten roots
and commit the precise verdict with source and graph hashes.
