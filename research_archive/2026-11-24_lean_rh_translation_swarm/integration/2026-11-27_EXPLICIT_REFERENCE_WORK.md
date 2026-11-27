# Explicit unit reference — bounded native result

27 November 2026. LOCAL KERNEL PASS. Both new declarations passed the normal Lean 4.35.0 kernel against the pinned original compact source, with only propext, Classical.choice and Quot.sound. The wrong-reference negative control failed at the intended witness check. This is a local explicit-interface result, not a complete RH or height proof.

The canonical matching proof explicitly constructs reference polynomial 1. Extracting its actual Exists.intro payload, checking the typed witness, and submitting the closed payload to ordinary Lean.addDecl yields c2_real_matching_unit_reference. This does not infer P(1) from a bare existential statement. In the earlier consumer, Classical.choose on an existential remains an unspecified choice even when its proof constructs 1; that earlier proof remains valid.

The complete c2_unit_empty_matching statement is definitionally identical to the original empty-matching interface. Its actual finite exchange target is now the literal polynomial 1. All tame-character, real-action, quotient-measure and nonzero-normalization inputs are retained. The rank-zero Haar volume is not set to one.

| Declaration/control | Actual exit | Seconds | Result |
| --- | --- | --- | --- |
| c2_real_matching_unit_reference | 0 | 163.81 | Normal kernel; constructive typed unit |
| c2_unit_empty_matching | 0 | 162.76 | Complete original statement; literal unit exchange target |
| Typed reference changed from 1 to 2 | 1 | 157.02 | Rejected: Matching reference is not the typed polynomial unit |

Exact checked sources, commands in the receipts, axiom reports, object hashes and the rejected control are in 2026-11-27_explicit_reference_receipt/. The successful sources are C2_EXPLICIT_UNIT_REFERENCE.lean and C2_UNIT_EMPTY_MATCHING.lean. The failed control produced no accepted compiled module. The trailing unknown-name diagnostic follows the intended rejection; it is not counted as the reason the control passed.

The preferred direct determinant route and its complete 52-guard local audit remain unchanged. These two optional declarations are not promoted to that preferred route until their actual callers and full reachable paths have been checked. No independent replay of this new unit variant is claimed, and no additional cold original build is queued for it.

The earlier restricted C2 chain independently passed run 46050109450. The coordinated original C1 build and four downstream family consumers are actually running in run 46055305146, snapshot 98f6d14d1ed640bdc432aec50251fc29dbfe95e8; their new receipts remain pending. Continue the common determinant/volume-height witness while that build runs.
