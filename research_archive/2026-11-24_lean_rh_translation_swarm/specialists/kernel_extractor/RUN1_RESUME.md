# Kernel extractor — run 1 — 2026-11-24

**RESULT: PARTIAL / source-matched API audit, native exporter prepared, graph checker executed on synthetic fixtures.** No Lean compilation or RH proof validation. 9/9 independent synthetic regression tests passed in the tool's V8 JavaScript runtime.

## Source and version lock
- Original RH source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Original src/Main.lean: global riemannHypothesis : RiemannHypothesis := rhOfAll. Main is the module name, not a namespace. Original src/Supplements/Kernels/MainTheorems.lean blob 6a542d7ce969a791fd12ce575f587e6bc29044bf: rhOfAll := Formalism.VW.rh_of_every allChi; allChi := UpperTheory.FinalTheorems.everyCharacter.
- Original Lean v4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474, original lakefile.toml blob 07e85dc8afcf28b4885a8f092154c8b74c8cf800.
- **Upstream changed:** current main 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf at 2026-11-24 06:57:31Z. src/Main.lean blob 67c65badc15f80a1db65df1c84dc7a4928fc410f: riemannHypothesis := Claim.zeta LFunction_ne_zero_of_half_lt_re, and LFunction_ne_zero_of_half_lt_re := UpperTheory.FinalTheorems.everyCharacter. Latest file has module header, public imports and exposed public section. New toolchain v4.37.0-rc1; Mathlib 31ce06eaadf4a200c0e1407c5f10953cf606b8f8. MainConclusion also restructured (blob f3b0f6c4a567ca5f04f8125347b845f7a23e1f61). Keep graphs separate, never mix source edges. No inference of proof validity from this source diff.
- Preflight: acceleration RUN1_RESUME.md confirmed three old fixtures were not byte-identical to pinned sources; use Git blob identity. No earlier kernel checkpoint found. Physical CI #351 PASS for 9aa5afb at 07:05 UTC, unrelated to this work.

## Source-level discovery: constant references, structural metadata and axiom closure are different
Lean API audited at v4.33.1:
- [FoldConsts.lean](https://github.com/leanprover/lean4/blob/v4.33.1/src/Lean/Util/FoldConsts.lean), blob 2bb5be3893dc1daca2e14a6434244920b9784316: pointer-cached expression traversal emits each .const name once. The .proj case visits its child but omits the carrier type name. Record it separately.
- [CollectAxioms.lean](https://github.com/leanprover/lean4/blob/v4.33.1/src/Lean/Util/CollectAxioms.lean), blob dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154: follows type/value references, constructors of inductives, types of constructor/recursor, skips quotient info. Imported declarations may return precomputed exported axiom arrays, even when a body is not available. A successful #print axioms alone is not a full proof-term dependency graph.
- [Declaration.lean](https://github.com/leanprover/lean4/blob/v4.33.1/src/Lean/Declaration.lean), blob 52a32d4fdeae1fe12e46cd46a1635420a3b62195: ConstantInfo.value? (allowOpaque := true) includes theorem and opaque values. Recursor rules contain constructor name and RHS expression. Include those, inductive mutual-group and constructor-parent names as distinct structural edges. Cycles are legitimate.
- [Environment.lean](https://github.com/leanprover/lean4/blob/v4.33.1/src/Lean/Environment.lean), blob 33928512dadcfa2e42a307499e9228596da0341a: toKernelEnv = checked.get. Private module data contains all kernel constants; importModulesCore with globalLevel=.private makes transitive importAll true. Use a non-module driver for the original pin; matching private artifacts still required.
- [ForEachExpr.lean](https://github.com/leanprover/lean4/blob/v4.33.1/src/Lean/Util/ForEachExpr.lean), blob e8c728018470d7234d3a2a3727add85678683620: independent structural traversal caches Expr and visits child expressions.

## Deliverable and conditional completeness
KernelGraphExport.lean reads the checked environment, compares getUsedConstants with independent Expr.forEach .const traversal, exports separately type/body references, projection carrier names, inductive constructors/groups, parent and recursor rule names/RHS references. Names use lossless tagged components. Each referenced name is queued or already seen; induction on path length proves completeness for the defined reference graph IF the exporter runs correctly and the actual declarations are available. Missing names become explicit records. The graph is not necessarily a DAG; condense SCCs for scheduling. It is not a kernel recheck, logically minimal proof, or trace of every reduction event.
verify_graph.mjs reconstructs CollectAxioms-style reachability and independently compares to the native axiom list, while retaining structural extras. Rejects omitted endpoints, duplicate/unreachable nodes, incomplete stream and count mismatch; flags unavailable bodies, axiom disagreement, unusual axioms, sorryAx and unsafe/partial nodes. It cannot authenticate a fabricated JSONL or establish source/build provenance. Exporter has not been compiled; code may require API repairs.
Expected queue/closure O(V+E) plus expression scans and JSON/Name sizes under hash-table assumptions; queue+seen O(V), output streamed. Repeated ruleRefs concatenation may be nonlinear in rule sizes. Offline verifier retains graph/records O(V+E) plus string IDs. No measured full-corpus runtime or URT advantage.

## Actual execution
- Local command checks found no lean, lake or elan executable. git ls-remote of upstream failed DNS (Could not resolve host: github.com); connector reads worked.
- Executed JS synthetic tests: {"passed":9,"tests":["cyclic closure and axiom equality","projection and group edges retained","unusual axiom exposed","missing boundary","axiom disagreement","hidden theorem body","omitted endpoint","missing footer","sorryAx exposure"]}
- Zero RH kernel declarations or kernel edges extracted; no actual #print axioms output. Static source root and wrapper only. No changed premises, no claim of RH closure.
- New engineering files not executed by CI; no CI success claim.

## Reproducible next step
On a networked Lean-capable host, clone/checkout original pin, record git HEAD, lean-toolchain, lake env lean --version, Mathlib revision and source hashes. Obtain matching private .olean artifacts using upstream instructions (lake build Main where appropriate). Copy exporter and checker into the checkout root. First smoke-test with a temporary fixture replacing import Main with a local theorem named riemannHypothesis and exercising theorem/opaque/axiom/inductive/projection/recursor edges.
```sh
lake env lean --tstack=400000 KernelGraphExport.lean > kernel_run.log 2>&1
node verify_graph.mjs --self-test
node verify_graph.mjs rh_kernel_graph.jsonl > graph_audit.json
```
Check exit codes and preserve full logs, graph, hashes and toolchain provenance. For the new upstream version, audit separately and verify private artifacts and API changes.

## RESUME HERE
Compile exporter on a small fixture with Lean v4.33.1, fix actual API issues, then run against pinned RH checkout. Publish exact graph and built-in axioms; reconcile static source and elaborated root edges. Coordinate shared blob cache and SCC condensation with acceleration/integration. Any missing private bodies or axiom mismatch goes to audit; do not present source-only graph as kernel data.
HANDOFF TO: dependency, acceleration, integration, audit and all math lanes — original and current revisions must remain separate.
