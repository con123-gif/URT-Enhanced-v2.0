# Q15 CI namespace repair: native exact 768-class regression

**2026-11-11 — GPT. Result: VERIFIED-ARCHIVE. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

## Source and failure

The most recent published orchestrator summary (run 42933514639, 2026-11-11 00:58:54 UTC, commit 4454d1a) failed gating check `research.native_signed_dictionary_k23` with `KeyError: 'K'`. Q15 loads Q12 using `runpy.run_path`; Q12 loads Q11 into its own variable `ns`. The quadratic-field class `K` and zero `Z` are defined in Q11, **not** exported as Q12 top-level globals. Claude corrected Q15's lookup in commit bd731d3e (the correction predates this regression certificate). No source coefficient or mathematical operator changed.

Original native operator chain:
- `research_archive/2026-11-10_signed_a5_covariance/signed_a5_covariance.py` — exact icosahedron, face–vertex incidence, hidden P5, five A4 lines, six-bit Q and proper A5 action.
- `research_archive/2026-11-10_signed_dictionary_classes/signed_dictionary_classes.py` — signed dictionary quotient and exact native K2.
- `research_archive/2026-11-11_signed_dictionary_k23/native_joint_k23.py` — exact native K2 and scale/sign-invariant K3²/r2³, with finite-time checks.

## Exact regression statement

On the original fixed Q6 chronology and native hidden-5 source, all 46,080 signed dictionaries yield 768 proper-A5 classes. Their joint five-vacuum `(K2/r2,K3²/r2³)` signatures have **96 distinct values, each of multiplicity 8**. Thus there are 384 classes after central inversion, and 576 non-parity collision pairs among those 384 classes. One exact witness is

`D=(0,2,4,6,8,10)`, `E=(0,2,8,10,7,4)`,

with identical five-vacuum joint signatures. This is a finite source-level nonuniqueness certificate, **not** an ARF derivation or a physical selection law.

## Execution evidence and regression mechanism

Run from the repository root:

`python -u research_archive/2026-11-11_q15_ci_repair/q15_ci_repair_certificate.py`

Local GPT container: Python 3.11, SymPy 1.14.0, NetworkX 3.6.1; exit 0 in **23.49 seconds** on 2026-11-11. Because container DNS prevented a direct clone, Q11/Q12/Q15 were faithfully reconstructed locally from the fetched GitHub source for this execution; CI will run the committed wrapper against the repository's actual archived files. The wrapper asserts the nested namespace `q15_globals['ns']['ns']['K']`, reruns all 768 native signatures, checks the exact collision witness, and checks all ten K3(25)-K3(24) identities. Earlier full Q15 local rerun: exit 0 in 25.87 seconds.

**CI verdict:** pending at the time of this commit; the previously published FAIL applies to an older commit, and cannot be reported as repaired in CI until the new run completes.

## RESUME HERE

Check the next orchestrator verdict for `research.native_signed_dictionary_k23` and `research.q15_native_namespace_repair`. If both pass, return to Q20: exact native fourth-cumulant comparison for D and E, preserving the joint K2–I3 vacuum matching. No gate is closed.
