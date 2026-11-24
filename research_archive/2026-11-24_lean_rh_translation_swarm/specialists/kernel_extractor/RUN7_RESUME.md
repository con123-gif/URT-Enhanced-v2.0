# RUN7 — native compiler failure diagnosed; v3 retry (2026-11-24 13:08 UTC)

RESULT PARTIAL — actual native v2 compiler output obtained; source-only parser repair and executed JS regressions, native v3 retry registered. No successful native graph extraction, RH kernel validation, or URT speed claim.

Preflight: read AGENTS, swarm protocol, queue/expansion, research state/log/protocol and continuity excerpts, peer lane handoffs (including acceleration RUN7, editor 12:56, dependency and integration coverage), physical CI #369 PASS (unrelated). Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained. Upstream head e26756e547b281cbf137eb7e0f16cccb738f3f84 at 12:49:24Z (documentation merge, not adopted). Local container has Node v22.16.0 but no lean/lake, DNS to GitHub fails. Native compute did run.

## Actual native evidence
CI run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45399188511, state branch compute/rh-native-lean-fixture-v2-20261124/status.json, execution SHA 6871a68e493c407833de07490a9dead4463335c1, UTC 2026-11-24T13:02:26Z, exit 1, wall 11.07s. Downloaded release checksum matched; Lean reported v4.33.1 commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6. KernelFixture.lean compiled (empty fixture_compile.log, driver attempted). Driver #print axioms printed exactly 'riemannHypothesis' depends on axioms: [KernelFixture.witness]. This is the synthetic fixture root, NOT upstream RH. Exporter failed before its graph could be produced. Compiler log SHA256 f1be7dbe8291ecc8762d2730a9c3ce8471a0ff32cd0c1ce996a59498d956ec1c, blob c6407b184e7e43102f75a08c6e25bb298e1b8d6b.
```
FixtureDriver.lean:55:68: error: unexpected identifier; expected '}'
FixtureDriver.lean:87:9: error: unexpected token 'mutual'; expected '(', ':=', '|', identifier or term
FixtureDriver.lean:87:16: error: unexpected token ':'; expected command
FixtureDriver.lean:91:25: error: unexpected token ':='; expected command
FixtureDriver.lean:92:24: error: unexpected token ':='; expected command
FixtureDriver.lean:93:27: error: unexpected token ':='; expected command
FixtureDriver.lean:115:88: error: unexpected token '++'; expected command
FixtureDriver.lean:127:34: error: unexpected token ')'; expected command
FixtureDriver.lean:145:11: error: unexpected token 'at'; expected '(', ':=', '|', identifier or term
FixtureDriver.lean:172:0: error: Aborting evaluation since the expression depends on the 'sorry' axiom, which can lead to runtime instability and crashes.

To attempt to evaluate anyway despite the risks, use the '#eval!' command.
'riemannHypothesis' depends on axioms: [KernelFixture.witness]
```
Observed parser errors at injected driver lines 55 (multiline structure return), 87 (reserved mutual identifier), 145 (reserved at identifier); subsequent errors may be cascading. Do not bypass sorry-axiom evaluation guard. Repair parser errors and rerun; additional elaboration/runtime errors may remain. No evidence of RH failure.

## Repair and verification
Original exporter blob 20fedff7d72530fafa1dfa78f11db9b979afe706; runner blob b85383a2532c620ba2847cf79228d30272d5855c; unchanged checker blob 2e431301970196a6b786d004fb16a4320a25fe8e. New KernelGraphExport_v3.lean retains schema cathedral-kernel-v2, all field names, graph and axiom policies, source/Mathlib pins. Use explicit local IO bindings and positional ExprRefs constructor; rename mutual to mutualBlock and at to cursor. Checked exact source reversibility: undoing these changes plus status comment recreates original source byte-for-byte in JS. Source-preservation test, NOT parser or semantic proof. Constructor fields in original order (constants, projections, hasNatLit, hasStrLit). Re-executed existing graph checker 13/13 self-tests in V8 (synthetic graphs). Relevant APIs checked at Lean commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6: ForEachExpr.lean e8c728018470d7234d3a2a3727add85678683620, FoldConsts.lean 2bb5be3893dc1daca2e14a6434244920b9784316, Environment.lean 33928512dadcfa2e42a307499e9228596da0341a, Declaration.lean 52a32d4fdeae1fe12e46cd46a1635420a3b62195, CollectAxioms.lean dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154. Environment source documents private import level loading all module data, not merely setExporting false. Original driver deliberately lacks module header. Actual access to private bodies still to be demonstrated.

New runner reuses verified release SHA and existing fixture assertions; also compiles previously prepared two-module cyclic-cache fixture before exporter attempt, records local/imported logs and separate exit codes even if driver fails. Compare all six actual #print axioms lines; do not infer Lean bug from abstract model or syntax failure. Job ID rh-native-lean-fixture-v3-parser-repair-20261124, unique registration after actual v2 failure; no protected workflow edits or physics queue changes. Native retry not executed in this session. Reproduce: bash research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run_native_fixture_v3.sh --out /tmp/rh-native-v3. Existing 13 checks: cyclic closure and axiom equality; projection and group edges retained; unusual axiom exposed; missing boundary; axiom disagreement; hidden theorem body; omitted endpoint; missing footer; sorryAx exposure; literal implicit references retained; literal omitted despite flag; quotient package retained; quotient member omitted.

Dependency lane stream retry timed out per acceleration RUN7; that lane owns storage/locality improvements. Do not duplicate full export. No change to translation completion status.

RESUME HERE: read compute/rh-native-lean-fixture-v3-parser-repair-20261124/status.json and outputs/export_compile.log, cycle_status.txt, cycle_local.log, cycle_imported.log on cathedral-research-state. If compiler errors persist, fix exact diagnostic, preserve parser guard. If exporter succeeds, verify closure, private theorem body, literal/quotient flags, witness and six local/imported axiom lists; preserve native output SHA and report any discrepancy with witness paths, not inferred RH invalidity. Then obtain authenticated complete RH export and compare exact named dependencies versus static source.
HANDOFF TO: dependencies, acceleration, formal audit, integration. Project OPEN.
