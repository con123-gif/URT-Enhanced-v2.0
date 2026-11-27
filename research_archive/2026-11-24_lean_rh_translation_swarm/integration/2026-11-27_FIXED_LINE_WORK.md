# Direct determinant line — active native work

27 November 2026. WORK IN PROGRESS; not a checked replacement yet. RH and reciprocal height remain OPEN.

Prior work: character-box RUN66_COMPACT_RANK_ZERO_DETERMINANT_PROJECTION.lean already derives a human fixed-line argument by compact averaging and density, with native replay pending. RUN65_COMPACT_DETERMINANT_PERIOD_MEASURE.lean already derives the critical integral measure; do not redo it. The accepted C2 determinant/Carrier route has since passed full original-statement kernel checks and the four-root dependency audit, but its real interface still calls the native general real_matching theorem. Use the [accepted proof](2026-11-27_determinant_class_sum_receipt/) and [graph](2026-11-27_determinant_carrier_graph_receipt/).

This native continuation first proves the precise polynomial determinant-line identity from the already retained Fischer polarisation supplier, then aims to extend it to invariant continuous Fock functionals by density. It is a different formal implementation of the archived fixed-line idea; it does not claim a new human insight or remove Fischer polarisation itself.

For D=product det(X_tau)^card(iota_tau), a polynomial functional M with the exact unitary determinant covariance should satisfy
    Fischer(P,D) M(D) = M(P) Fischer(D,D).
The first local compile was rejected (exit 1, 87.66 s): a nonexistent map_det shorthand and unsimplified determinant evaluation, coefficient-map identity and bilinear scalar caused elaboration errors. Its sorryAx-bearing reports are explicitly rejected and preserved in 2026-11-27_fixed_line_receipt/failed_attempt_1. Replay 2 replaces these with explicit identity-matrix mapping and determinant evaluation normalization; it is running and is not accepted yet. The coefficient-level realPairWeil action, continuous universal coefficient, empty-polynomial matching interface and determinant/Carrier transports still need actual proofs and complete audits before any new dependency deletion is claimed.

Exact proposed source: [C2_DETERMINANT_FIXED_LINE.lean](C2_DETERMINANT_FIXED_LINE.lean). First replay directory: /workspace/scratch/9bec6a205c16/rh_native_work_logs/c2_fixed_line_1. Command uses replay_c2_standard_exchange.py, clean pinned c2_build workspace, accepted C2Combined input, module C2DeterminantFixedLine, named theorem c2_det_polynomial_line and guard C2_FIXED_LINE:. No original source file is modified.

The independent full accepted-chain compute replay is now actually running: [run 46050109450](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/46050109450), selected job rh-compact-c2-determinant-chain-20261127, source aceceb93b79727aac30ebcb24388c58aebc5adbf. Actual mathematical outcome is pending, independently of this new proposal.

RESUME HERE: inspect replay 2's exact result; repair its first concrete elaboration error, or if accepted prove the realPairWeil covariance interface and continuous extension. Preserve rejected sources and logs. Do not repeat the 354-module ValueFamilies build: the already queued C1 fit-family replay overlaps that closure.
