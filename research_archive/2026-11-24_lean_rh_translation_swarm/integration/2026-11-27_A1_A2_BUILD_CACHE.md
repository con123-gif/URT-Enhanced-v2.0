# A1/A2 original build retention

27 November 2026. Run [46023465491](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/46023465491), source `936316769c22ce71f4f24fa79624ee38741b55b7`, completed the original `New.Columns.LocalStatement` source build (exit 0, 3199.21 s). Its proposed replacements failed; a green wrapper workflow is not an accepted proof receipt.

A1 failed first at the inferred matrix type in `IsOpen.matrix hO` and the ring inferred for `markOperator`; the leaf and downstream chain have no accepted axiom audit. A2's original probe passed, then its replacement rebuild failed at `New.Curve.ConjugatesOfJets.lean:60:5`. Actual receipts remain under [the compute state branch](https://github.com/con123-gif/URT-Enhanced-v2.0/tree/cathedral-research-state/compute/rh-compact-a1-a2-transport-20261127/outputs).

That run did not retain its compiled native source cache. The shared RUN57 wrapper now archives `.lake/build/lib/lean` immediately after a successful original build, before either replacement changes the disposable source tree. A manifest records the exact compact/Mathlib/compiler pins, original build command and result, archive exit code, byte size and SHA256. `proof_receipt` is explicitly false. The pattern matches the already exercised C2 cache retention route.

This orchestration edit passed Python syntax checking. It has not yet produced an A1/A2 cache artifact or repaired either mathematical replacement. No new job is registered, no schedule changes, and no source build, proof premise, acceptance guard or protected workflow is altered. Owners can repair the first concrete compiler errors and reuse the retained original cache on the next actual run.
