# RUN92 — repair the actual failed endpoint replay

28 November 2026. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679, Lean 4.35.0. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7, 40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484. No protected files edited, no unrelated work.

## Native evidence, not inferred from workflow colour

Run 46081903735, source f66148d270ab023f25b8b24f694cb3187e9c1b70, status ERROR (exit 1, 1925.91 s) at 2026-11-27T23:55:40Z. State branch compute/rh-compact-prime-endpoint-replay-20261127/status.json blob cbae0e78caa2f178dfc040f45dcaddcf134f3ad7; outputs/run91_receipt.json 6d03bd681b2dcaa4bc9da6e5fcaf34e56f0b0df6; analytic/endpoint.log eb10cfb827f56083c65953b550270ad52101271f; adapter.log 49027e598b1b33446f5ad243209527fb12a1f6e6. Compiler archive hash and source pins verified on that run. Both import builds exit 0. All four native analytic original probes report only standard axioms (log 74bf5b75ed81454f2e89a9813610cac7567f53ac). The hinge and logarithm-correction helpers and Data.run90Remainder_eq individually report standard axioms, but their containing files FAILED; no accepted candidate olean or full graph. Five other analytic roots and two adapter roots have sorryAx. Bridge never executed. Keep negative-control and full graph outstanding.

## Minimal repairs, not yet executed

- Chord: line 168 uses add_le_add_left with reversed operand convention. Preserve exact inequality and close using linarith only [hLd].
- Quartic cover: explicit import of Mathlib/Analysis/SpecialFunctions/Pow/Asymptotics.lean and _root_.tendsto_rpow_atTop. At the pinned Mathlib revision the theorem exists in the root namespace, not Real. All geometric hypotheses and estimates unchanged. Further errors may become visible after this repair.
- Principal caller: disambiguate DirichletCharacter.LFunction; use the native class-unit calculation at generic q before instantiating q=1, with an explicit nonzero modulus instance, to avoid the specialized kernel mismatch. Prove the 9240-1 to 9239 conversion by Nat.cast_sub, not unverified simp normalization. The same cast correction is prepared for the previously unexecuted bridge. Native verification pending.
- Data adapter: explicitly cast towerDeg and thick cardinality to real before division; correct calc indentation; restore the original New/Main scale hypothesis in the local context. No mathematical assumption added: D.scale is a field of the same Data witness. Exact remainder definition and proof are unchanged. Both EndpointGrid definitions are textually identical to the previous version. Native original-definition bridge to ShortAndEnough remains pending; this does not prove star, TailGrid or RH.

Actual checks this session: retrieved exact failed native logs and original axiom output, exact source hashes of five prior files, inspected native New/Main caller and pinned Mathlib asymptotics source. Each of 25 exact source substitutions matched its expected multiplicity (including two root-name substitutions); the exact Data remainder block and both EndpointGrid definitions were compared unchanged. No fresh Lean or rh_scan/prune/reduce/auto/frontier execution here. Old-pin tools are not transferred across versions. Candidate files are new; all old graphs, axiom evidence and failure logs remain intact. The source-level original/reduced graph is unchanged from RUN91 (GoodGrid + TailGrid -> exact remainder cancellation -> endpoint grid -> chord/cover -> native Landau -> principal nonvanishing -> reflection). Preserve D1, A/B/C, TailGrid and original-definition comparison as unresolved at full-root level.

## Candidate identities

- COMPACT_RUN92_ANALYTIC_REPAIR.lean: feac9de9a2448bf595ea18873528e6066d16846f
- COMPACT_RUN92_ADAPTER_REPAIR.lean: 14aaedca526240e1ef947958ee9278dd14add544
- COMPACT_RUN92_BRIDGE_REPAIR.lean: d1f58ba6d8c29b70e5a07e1eb497abd830a7a29b
- COMPACT_RUN92_REPLAY_ANALYTIC.py: 401cdaf5b32416d9efa267ec267180d60f67981a
- COMPACT_RUN92_QUEUE_REPAIR.py: 0110cffe01cfcd644d7a07f0c78573f4fbd6258a

RESUME HERE: inspect compute/rh-compact-prime-endpoint-repair-20261128/status.json and outputs/run91_receipt.json on cathedral-research-state, then repair the first actual remaining compiler failure, or if all stages pass send the exact checked root and original-definition bridge to the constructor-inclusive dependency auditor. No claim of a new kernel PASS until the actual receipt is available. HANDOFF TO kernel/integration. RH OPEN.
