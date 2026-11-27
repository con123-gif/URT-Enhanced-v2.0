# Archive usage: exact PR13174 target variant

Archive root: `research_archive/2026-11-27_left_to_solve/`.

After statement PR13174 actually merges, use this proof for its registered target:

- Statement: `TARGET_VARIANTS/mo-430643-pr13174/statement.lean`; SHA256 `ccd96caa9b504c58cacbd005f7b32cba2c71f23985781f61f955ca32446c8a16`.
- Proof: `TARGET_VARIANTS/mo-430643-pr13174/proof.lean`; SHA256 `8badfe72b09906ee6feeea2c7824fb9bb4ab5938c19c5c22ecaf5a9b714aff9f`.
- Independent actual verification receipt: `TARGET_VARIANTS/mo-430643-pr13174/VERIFICATION.json`.

The original `PROOFS_READY/mo-430643.proof.lean` SHA256 `d05018f0ec188fd037c397a3ba2c4ff8497c769dbf3a509dcd34652668936460` targets our earlier equivalent statement interface. It must not be submitted unchanged against PR13174's explicit-r interface. Preserve the original canonical certificate and its evidence.

Before an official proof PR, compare the actual merged statement bytes with this exact statement, execute the unchanged official checker importing that merged target, and perform a fresh all-state full-proof PR search and supported claim/team/heartbeat gates. This target variant is the SAME problem; no new certificate count, claim, official proof submission or acceptance is created by this mirror.

---

# MO430643: independent complete proof ready for proposed statement PR #13174

The exact proposed target and our independently developed full proof adapter
passed the pinned whole-kernel check. This is the same MO430643 mathematical
problem and contributes no additional problem or acceptance count.

- Proposed statement: [official PR #13174](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/13174), formalized by @AminAhantab, head `9b1b52bd6bd633dce8a4f7b1ce7de8dbd9343a74`.
- Our full adapter: `MO430643_PR #13174_OWN_PROOF.lean` in this research branch, SHA256 `8badfe72b09906ee6feeea2c7824fb9bb4ab5938c19c5c22ecaf5a9b714aff9f`.
- Exact proposed statement SHA256: `ccd96caa9b504c58cacbd005f7b32cba2c71f23985781f61f955ca32446c8a16`.
- Complete public combined probe: [immutable source](https://github.com/con123-gif/open-math-agents/blob/b3c7160de56edb9cc7a12d4f084d0b93dcb1f0b0/campaign/ProbeMO430643ProposedTarget.lean), SHA256 `8962e602e6d3837aedaf2a2ba7554df901d5d98e69032f13a357de8f0375296c`.
- Actual verification: [run 46078851442](https://github.com/con123-gif/open-math-agents/actions/runs/46078851442), job 140772859618. Selected compiler exit 0, no plain or tagged compiler errors, all three selected theorem reports contain only `propext`, `Classical.choice`, `Quot.sound`.
- Saved artifact 15236113412 SHA256 `79f78d08ce8919ee259bbec0cbc5e60cab8da99db8604d2198aab1e907be4f68` matches GitHub's digest. A separate collaborating ChatGPT agent independently audited its bytes, exit code, errors and exact complete canonical proof/source embedding.
- The exact proposed statement also passed the unmodified official statement checker in the same run. This is elaboration acceptance, not official acceptance of a mathematical solution.

Our original full-source proof, SHA256 `d05018f0ec188fd037c397a3ba2c4ff8497c769dbf3a509dcd34652668936460`, had already passed the whole-kernel check in run 46077033577. Its complete mathematical lemma bodies are byte-for-byte unchanged here. The only adaptation moves our product helper `number` into our own helper namespace and replaces the final wrapper to handle the proposed statement's explicit `r`, product equality and finite-set exclusions. No proof code was taken from the concurrent author's proof.

Chronology is recorded without a global or exclusive priority claim. Our complete hand proof was first publicly checkpointed at 22:05:27 UTC on 27 November 2026 in [commit fb54f2bf](https://github.com/con123-gif/open-math-agents/commit/fb54f2bf83d65241ad7bf3e1901959572c178488). The concurrent statement commit was at 22:18:30 UTC and its PR at 22:18:34 UTC. The linked concurrent formal proof candidate appeared at 22:24:38 UTC, before our original full kernel pass. We acknowledge @AminAhantab's statement and concurrent independent proof candidate; neither candidate's official proof acceptance is asserted here.

No duplicate registration, official proof PR or problem lease has been created by this lane for MO430643. Before any official proof submission, we still require the statement's actual merge, a check importing the actual merged target, and a fresh all-state search proving no preceding full official proof PR. If a preceding full proof PR exists, our submission will be withheld.

Source: Pablo Spiga, [An arithmetic inequality](https://mathoverflow.net/questions/430643/an-arithmetic-inequality), 17 September 2022, CC BY-SA 4.0. Complete current question, empty answers/comments and source history were read. Close primary subgroup-counting papers 2210.02972, 2304.14200, 2505.00413, 2609.10343 were read in the relevant sections and acknowledged in the source audit; no full exact source implication was located in that bounded review. We do not assert worldwide novelty.

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex GPT-6 (exact serving variant not exposed). Collaborating ChatGPT agents independently challenged the complete source, mathematics and verification evidence. Classical inequalities and Mathlib contributors are acknowledged. Actual proposed statement formalization and concurrent candidate: @AminAhantab.
