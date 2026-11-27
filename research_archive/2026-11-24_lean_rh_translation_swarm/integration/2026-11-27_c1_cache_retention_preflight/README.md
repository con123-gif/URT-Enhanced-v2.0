# Preserve the C1 original build

27 November 2026. Prepared cache-retention wrapper only; no new C1 theorem or cache artifact is claimed. The unchanged RUN84 original source runner is authenticated at blob 4ec1f89444fd6e779595ed83c601c2a5ebca2560.

The existing queued job rh-compact-c1-fit-budget-replay-20261127 now calls integration/run_c1_retained_cache.py. Its original FitTwistsExist build, peer proofs, type/axiom/negative guards, result file and status remain in the original runner. After the original build returns, the wrapper retains .lake/build/lib/lean before the temporary workspace is removed, including a partial build after failure. It records source pins, original build receipt, module availability, archive size/hash and proof_receipt=false. A successful run must retain the cache; incomplete cache modules never imply a theorem passed.

Local Python syntax check and source-authentication preflight passed. The initial local preflight only lacked the already published RUN83 input; its exact failure metadata is retained. Mirroring that exact pinned input allowed the unchanged preflight to pass. No Lean execution or archive was produced by preflight.

This preserves the ValueFamilies/Carrier modules that overlap the next determinant-to-integral-measure consumer, avoiding another full original build. No new job, schedule, protected workflow or pinned peer source was changed. Read actual C1 compiler receipts separately before claiming acceptance.
