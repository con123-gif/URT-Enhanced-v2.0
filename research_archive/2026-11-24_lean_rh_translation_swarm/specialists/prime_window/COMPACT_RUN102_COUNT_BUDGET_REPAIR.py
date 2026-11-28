#!/usr/bin/env python3
"""RUN102 — repair actual RUN99 compiler failures, 28 November 2026.
PREPARED, not replayed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION and continuity read; RUN101 paired
quartic candidate preserved. Reuse dependency RUN86 acec0b39617b0777b682c58f1cbd28425616d8df.

Actual native run 46129085575 (RUN99), state branch status blob
294e96059d7723a0ca2162d790ff0d7aeb5dea6b, receipt
9ad4f72573d9e6e27a98e4371eecd8d9719fac17:
  DataExist build exit 0; Run94StarGrid exit 0, four standard axioms
  reports, object b08e8b708fedfb4de3e25dfd09c72323ecaeac8911ca313b2e3e4ec99d8f620c.
  IntegrationGuardedFinitePower exit 1, 8.74s, scalar standard axioms,
  other four reports sorryAx; DepCountEscape82 exit 1, 7.78s, all four
  reports sorryAx. Combined root, negative control, graph NOT RUN.
Actual logs 8b5208362be88e343ddab26c35c1712c16b426c3 (integration)
and fdad789a55c6f91d705110f1255d566be6abd34f (dependency).

Integration diagnosis: line 142 calc.step goal was
  D.x ^ (8*eta+2^-1-1) <= exp(D.logX*(8*eta+2^-1-1)).
The preceding simp only [log_exp, Set.mem_preimage, <- exp_mul] at *
already converts the target to the exponential form. The final calc
equality back to D.x^... is redundant and creates this remaining
comparison. Stop at finite_power_scalar, which already has exactly
the exponential bound. This is a proof-body deletion only; all five
guarded budget conditions, threshold and fixed parameter quantifiers
remain unchanged. If the compiler still reports a conversion goal,
use explicit change to exp D.logX and Real.rpow_def_of_pos, log_exp.

Dependency: use the actual peer RUN86 repair unchanged under the old
module name; qualified Finset intervals/cardinality and LFunction,
bare nonnegative real sum as .of_norm_le RHS. No new estimates.
Re-use RUN99's strict axiom/direct/negative/constructor-inclusive graph
checks and exact old/new roots, never import Main or claim RH closure.
The peer patch has not yet passed native compilation. No new engine
execution or graph deletion claimed. Source-only checks executed
in connector: one unique integration deletion, two anchor negative
controls, both peer axiom rosters and guard tails unchanged.

RESUME HERE: inspect compute/rh-compact-prime-count-budget-repair-20261128/
outputs/run99_count_budget_receipt.json and run102_patch_receipt.json
on cathedral-research-state; repair first actual failing stage, or
if accepted hand the modules to the existing density/fiber callers.
Do not duplicate A/B/C builds or infer a proof from success labels.
HANDOFF integration/dependency/kernel/audit. Arithmetic and RH OPEN.
"""
import json
from pathlib import Path
import tempfile
import COMPACT_RUN99_COUNT_BUDGET_REPLAY as old

HERE = Path(__file__).resolve().parent
OLD_BLOB = "6905299fe6160eb5cc41516bed6a16843f315ecd"
PEER_REL = "dependencies/compact/RUN86_COUNT_ESCAPE_RUN99_DIAGNOSTIC_REPAIR.lean"
PEER_BLOB = "9fb9d11e5503ccf222b4ad87ff3a76f9ff1e02f3"
ANCHOR = "    _ = D.x ^ (8*eta+2⁻¹-1) := by rw [Real.rpow_def_of_pos (exp_pos _), log_exp]\n"

def patch(text):
    old.graph.require(text.count(ANCHOR) == 1, "integration calc anchor changed")
    return text.replace(ANCHOR, "", 1)

def axiom_roster(text):
    return [line for line in text.splitlines() if line.startswith("#print axioms ")]

def guard_tail(text):
    return text.split("open Lean in\nrun_cmd do", 1)[1]

def main():
    old.graph.require(old.graph.git_blob((HERE/"COMPACT_RUN99_COUNT_BUDGET_REPLAY.py").read_bytes()) == OLD_BLOB,
                      "RUN99 runner changed")
    old.checked_sources()
    original = old.SPECS[1]
    dep = old.SPECS[2]
    source = (old.SWARM/original[1]).read_text()
    peer_original = (old.SWARM/dep[1]).read_text()
    peer = (old.SWARM/PEER_REL).read_bytes()
    old.graph.require(old.graph.git_blob(peer) == PEER_BLOB, "RUN86 peer changed")
    changed = patch(source)
    peer_text = peer.decode()
    for before, after in [(source, changed), (peer_original, peer_text)]:
        old.graph.require(axiom_roster(before) == axiom_roster(after), "axiom roster changed")
        old.graph.require(guard_tail(before) == guard_tail(after), "direct/axiom guard changed")
    rejected = 0
    for bad in [source.replace(ANCHOR, ""), source + ANCHOR]:
        try:
            patch(bad)
        except RuntimeError:
            rejected += 1
    old.graph.require(rejected == 2, "patch negative control failed")
    with tempfile.TemporaryDirectory(prefix="run102-source-") as tmp:
        replacement = Path(tmp)/"IntegrationGuardedFinitePower.lean"
        replacement.write_text(changed)
        new_blob = old.graph.git_blob(replacement.read_bytes())
        old.SPECS[1] = [original[0], str(replacement), new_blob, original[3], original[4]]
        old.SPECS[2] = [dep[0], PEER_REL, PEER_BLOB, dep[3], dep[4]]
        receipt = {
            "old_runner_blob": OLD_BLOB, "original_integration_blob": original[2],
            "repaired_integration_blob": new_blob, "original_dep_blob": dep[2],
            "repaired_dep_blob": PEER_BLOB, "source_negative_controls": rejected,
            "axiom_rosters_and_guard_tails_unchanged": True,
            "arithmetic_premise_proved": False, "full_RH_replay": False,
            "prior_failed_run": 46129085575,
        }
        def stage(root, env, out, modules):
            old.graph.dump(out/"run102_patch_receipt.json", receipt)
            old.stage(root, env, out, modules)
        code = old.prev.preflight()
        exec(code, {"__file__": str(old.prev.OLD), "__name__": "__main__", "run95_stage": stage})

if __name__ == "__main__":
    main()
