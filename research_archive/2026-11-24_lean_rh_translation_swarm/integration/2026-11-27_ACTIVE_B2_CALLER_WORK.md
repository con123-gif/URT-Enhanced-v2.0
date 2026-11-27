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
the original pair-weight theorem. Complete repaired-caller replay remains pending; the first failed native attempt is recorded below.
The check also compares the complete original declaration type, including
binder order. The candidate carries the exact compact elaboration options.

A local exact Lean toolchain and pinned Mathlib checkout were located.
Tracked compact sources and lakefile were compared to the exact pin.
An initial original BlockBound build was started locally with two Lean threads;
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
deriving options from the pinned lakefile. A subsequent cache-enabled local
attempt records every reused native olean and its SHA256, and does NOT
claim a fresh replay of those modules. The fresh shared caller job is
`rh-compact-b2-callers-replay-20261127`; the active worker continues here
while that independent machine check runs. Results remain pending, with
no speedup or caller-validation claim yet. The cache-enabled local attempt
then timed out (exit 124) at its first uncached module,
Lib.Weil.GaussSum.LocalHomUnit, after 900 seconds. The five cached native
modules were reused, not freshly verified. No source error was emitted,
and neither the replacement nor BlockBound was reached locally. Its exact
partial receipt is retained; this does not give a mathematical verdict.
Inspection of that receipt then exposed a local builder bug: TOML dotted
`pp.unicode.fun` was emitted as a nested dictionary instead of a flattened
Lean option. The local builder is corrected and its exact six arguments
were checked against the actual lakefile. This is a local infrastructure
correction, not a successful native replay. The active shared job uses
Lake directly plus the explicit Lean-file options, so it does not use this
local option generator. The failed receipt retains the original arguments.

The next actual consumer is now prepared as
`B2_ACTIVE_ENERGY_REPLACEMENT.lean`: the COMPLETE original
`Filling.energy_le_of_level_pairs`, replacing only its final occurrence
of `sum_pairWeight_le` by the active replacement. Its own original
statement and direct proof dependencies are checked independently.
The two-fragment energy preflight authenticated both source hashes and
preserved an assembled input (blob d15c404c18d2efc0aa36a449391b4ebf1750f23a).
The next batch also authenticates and replays the independent audit's
reversible skew/count caller patch (4c942de0145e223298b3441b6c814a23ae946434)
in the SAME built workspace, with a separate receipt. It preserves partial
success if that patch fails. The named pair/energy route still uses the
original weighted-count supplier; this separate skew replay is not a claim
that the two alternative count assemblies have been combined. A native
cache archive is retained as an Actions artifact after a successful source
build; its pin/checksum manifest is explicitly not a proof receipt.
The first full caller run 45994173721 has now finished: source build
exit 0 (1454.31 seconds), candidate exit 1 (302.51 seconds), six separate
original probes passed and the negative guard was rejected. Overall
ERROR, not PASS. Status blob 1b8274e110b4be4fbf4cbf8dd6202f0cea903953,
result blob 7d6aa4920926b95f60958f4a5a5d09e90c1183e6, compiler log
acf075f047d1b374d2ef5379d39b7742470b15a4. The inner divisor was accepted
with only propext/Classical.choice/Quot.sound. The outer bridge failed on
an offside lambda continuation at line 52; the missing-constant errors,
placeholder axiom reports and missing caller proof followed from it.
The axiom/dependency checks correctly rejected the full file.

The lambda body is now kept on the same line as its pattern alternative.
Repaired source blob 0d93565d7962a314167e39f10566f9f10b641a2e; the
new assembled pair/energy input is 2a748f33ad2fbce589a53ff8750ea0f783c63d80.
Static input preflight passed; repaired native validation remains pending.
Job `rh-compact-b2-energy-repair-20261127` now checks the repaired pair
caller and its complete energy consumer, plus the separate peer skew/count
patch. Each result and the preserved native cache have distinct receipts.
No full B2, human assembly or RH validation is claimed.

RESUME HERE: inspect the active repair batch's actual compiler outputs,
fix its first failure, and continue from the retained native artifact
cache rather than another cold build. Only a completed exact-type,
bridge-dependency and standard-axiom receipt permits caller validation.
