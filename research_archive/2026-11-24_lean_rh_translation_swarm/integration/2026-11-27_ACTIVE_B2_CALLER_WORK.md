# Active B2 caller replacement

27 November 2026. WORK IN PROGRESS / NOT VERIFIED. This is the active
interactive worker, continuing mathematical implementation here; no new
automation or delegated worker is requested. RH remains OPEN.

Latest active status, 13:04 UTC: run 45998845682 built CrudeEnergy and
accepted the pair and level-energy proof bodies, but the complete batch
was ERROR. The inspector mistakenly used ConstantInfo.value? without
allowOpaque=true; the energy axiom printer also abbreviated Classical.choice.
The separate skew/count patch needs Matrix.neg_mul for rectangular products.
These exact issues are repaired. Seven declarations (pair plus all three
energy callers and their bridges), followed by the repaired skew/count proof,
are NOW executing locally from the authenticated native cache. No whole-file
PASS or constructor-inclusive B2 frontier is claimed yet.

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

The local constructor-inclusive graph comparison is now prepared as
`audit_active_b2_graph.py`. It authenticates the existing exporter/verifier,
uses the same two source fragments in closed sections, and compares ONLY
the original/replacement pair and original/replacement level-energy roots.
It must verify recursive reachability of both bridges and absence of both
old targets from the corresponding new roots. Its prepare-only execution
succeeded (generated source blob 940a11154a118ef4d2138b2eb35707288ad6fca5).
No graph was executed, no native graph frontier is claimed, and its local
four-root scope is explicitly not an RH completion denominator. Run it from
the retained, pinned CrudeEnergy artifact workspace after the repair batch,
using --compact-root, --lean-bin and --out. The active repair run is
45998845682; no additional cold-build job is registered for this graph.

The graph exporter/verifier compatibility check has now actually run on
Lean 4.35.0, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, using ONLY
Nat.le_refl. Compilation exit 0; the independent verifier accepted 11
nodes / 29 edges with zero missing nodes and no root axioms. This checks
the exporter API/format on that small root, not the B2 graph, not its full
constructor coverage on every declaration kind, and not any RH theorem.
Exact generated source, graph and verifier receipt are preserved.

The corrected local BlockBound attempt also timed out at LocalHomUnit
(exit 124, 900 seconds), with the corrected six lakefile arguments. The
shared source build compiled that module in 12 seconds. No more local cold
builds are planned; continue from the shared compiled native cache.

The remaining two native CrudeEnergy consumers are now prepared in
B2_ACTIVE_FULL_ENERGY_EXTENSION.lean, using the new level-pair and
lower-level suppliers. The separate full-energy manifest has seven named
proofs and three authenticated fragments; its prepare-only assembly
succeeded (0fd0b23c6c4bc39a1a935d4347a4c6ea2eb1b5d1). No Lean execution
of those two additional callers is claimed. The existing repair run
still checks only the five declarations and separate skew/count patch
from commit 234c5a3130055d3a0900d329b6361155610741f7. After that passes,
use its native cache for this extension and the local graph comparison.

The artifact retrieval route was exercised on the first failed batch's
15,079-byte ZIP and matched its actual Actions digest
12e6572dbc13c01414cf499f7ce16da56fff8c6d5b5adc55d32bd6623119b9c0.
This validates retrieval, not any proof. restore_native_b2_cache.py is
prepared to verify both outer and inner digests, exact source pins and all
archive paths, then swap only the local native import cache with rollback.
It has not restored a native cache yet.

Peer C2 RUN78 70b2bd10 now supplies BOTH complete equal-rank caller
substitutions (source 6bb8f53e746aa4d5c876c7eff3433e6daf126795). Its
prepared-workspace runner authenticates that exact file, passes the full
pinned Lean options explicitly, and separates the two replacement probes
from three original probes. Prepare-only preflight passed; no native C2
execution or parallel cold build was launched. Use it after B2, in the
already-built compatible workspace. RH remains OPEN.

Second shared result: active_b2_energy.log bbfb981a34c342107737e35786b6287556132142;
b2_native_results 6684b794bbed520fa4b813ddbb556d1e91a07b24. The source build
passed in 1495.25 s; candidate took 49.66 s and exited 1 solely at the two
proof-accessor guards. All four pair-block declarations had standard-axiom
reports; energy printed the shortened name choice, so the strict parser
correctly refused to accept it. The corrected run forces pp.fullNames=true.
Skew log 887fc42b6cf57ba369bccb92ce71fa5c84e13bae identifies the rectangular
negation mismatch; the repaired adapter preserves the peer's original file.

Native artifact 15198517963 was downloaded and its ZIP digest verified:
f1345ef3dc47bbf93e58c4b6a946596b62e94d7f287ff5f04086c5f8502a2ecc.
Inner cache digest 35db72daacbbb00449c12be74f0c79a324128baf72a429cff841d11d0207b57e,
660 files / 338757850 restored bytes, exact source/Mathlib/Lean release pins.
The previous local native cache is retained for rollback. Restoration is not
a proof receipt. replay_full_b2_built.py now performs fresh candidate checks
without any source rebuild and retains a checked object for graph inspection.
The graph comparison now covers SIX local roots (original/replacement pair,
level energy, full energy); it remains unexecuted. C2's pinned peer file is
unchanged; its prepared runner applies the same documented value? adapter
to a derived copy, with original and derived source hashes recorded.
