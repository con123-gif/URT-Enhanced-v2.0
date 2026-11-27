# Active B2 caller replacement

27 November 2026. WORK IN PROGRESS / NOT VERIFIED. This is the active
interactive worker, continuing mathematical implementation here; no new
automation or delegated worker is requested. RH remains OPEN.

Current source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Project start a4fd9895.

Prior work: compute/rh-compact-b2-human-replay-20261127 status is pass,
returncode 0, 1013.3 seconds, run 45986308748. Eight RUN73/74/75 helper
proofs compiled; six original caller axiom probes are separate; the
missing-projector-guard proof was rejected. Caller replacements and the
full human assembly were explicitly unchecked. Landau RUN77 a62382a8
already records this receipt and prepares the exact outer index/count
bridge. Geometry RUN77 2cb53847 records the crucial distinction between
the outer labelled right class and the right class of inner congruence
witnesses. Reuse these results, do not rederive or overstate them.

Task: kernel-check the existing outer bridge, factor the actual inner
saturation divisor from BlockBound.sum_pairWeight_le into a named lemma,
and compile a replacement of that FULL original pair-weight statement
using these bridges. Preserve its support overcount, same right-class
inner witnesses, codimension, class sum and scale inputs. The original
pair-weight theorem must not be used to prove its replacement.

Prepared implementation now has both named divisors and the complete
pair-weight conclusion. The inner divisor takes only the actual congruent
pair and its common-link equality; it does not take the outer term's class
label or a HasLevel premise. This is a candidate local premise weakening,
not a global deletion of level assumptions from the counting theorem.
The existing source geometry is factored, not advertised as a new theorem
of arithmetic geometry. A command inspects the elaborated caller proof,
requires both new bridges to occur, and rejects a direct invocation of
the original pair-weight theorem. Execution remains pending.
The check also compares the complete original declaration type, including
binder order. The candidate carries the exact compact elaboration options.

A local exact Lean toolchain and pinned Mathlib checkout were located.
Tracked compact sources and lakefile were compared to the exact pin.
The original BlockBound build is running locally with two Lean threads;
its log is outside the tracked source. Earlier claims that Lean was
absent meant absent on PATH; the present local capability is now checked.
No protected source or workflow is modified. A later preflight detected
an unrelated concurrent TwistForRows edit in the shared checkout. The
parallel local build was interrupted (exit 130), and work moved to a
clean isolated checkout of the SAME pin. Cached external dependency
packages are reused. Per-module Lake invocations spent about 47 seconds
even on cached native targets, repeatedly scanning approximately 9000
cached external imports. The current builder resolves Lake's environment
once, verifies the pinned native sources and recompiles their entire
131-module import closure directly with Lean in order, one at a time,
using the exact pinned lakefile options. No native source is substituted
by a cached mathematical claim; this changes scheduling and repeated
bookkeeping. Its final result remains pending, not a speedup claim.

RESUME HERE: finish local BlockBound build; compile the prepared outer
bridge and new inner/caller file. Preserve every compiler error and
repair actual elaboration failures. Then print axioms and inspect the
new theorem's actual dependencies before reporting caller validation.
