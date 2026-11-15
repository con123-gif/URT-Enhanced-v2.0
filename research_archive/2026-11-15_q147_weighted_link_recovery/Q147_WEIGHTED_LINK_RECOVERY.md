# Q147 — Recover missing source-weighted fourth-power link sum (15 Nov 2026)

## Why this entry exists
Previous ChatGPT conversation at approximately **11:16 UTC on 2026-11-15** reported Q147, after Q146. The Q147 result and next frontier were absent from the GitHub research state, despite later claims that recovery through Q146 was complete. This note corrects the specific continuity gap. It is not the lost original Q147 script, and does not claim the entire conversation archive is reconciled.

## Original-source facts and exact result
From the original all-five Q101 hidden source / Q125a 444-state coherent current `J_{xy}=f_x^T W f_y/2` with `f_x=(C Pl s_x)^2`, the exact native Q125a source calculation recorded 1032 undirected golden-barrier links:
- 240 each of `J=+8 sqrt(5)/5` and `J=-8 sqrt(5)/5` (480 total).
- 120 each of `J=+(4+12 sqrt(5)/5)` and its negative (240 total).
- 312 zero links (240 outer and 72 centre).
- Two nonzero absolute strengths have exact ratio `phi^2`.

By direct exact arithmetic, **without fitted data**:
```
sum_{undirected edges} J_e^2 = 16896 + 4608 sqrt(5).
sum_{undirected edges} J_e^4
  = 480 * (8 sqrt(5)/5)^4 + 240 * (4+12 sqrt(5)/5)^4
  = (5013504+2064384 sqrt(5))/5.
```

The second identity is **Q147**. It is a symmetric moment of the edge weights, and is mathematically a consequence of the canonical Q125a link census. A new independent exact SymPy check of the source census and identity passed in the assistant's container on 2026-11-15. The prior Q147 original executable was not retrieved; no independent re-execution of the entire native Q101 source operator was performed in this particular certificate.

## Strict scope
This is **NOT** `Tr(H_ch^4)` for the 42624-dimensional `H_ch`: that requires diagonal and off-diagonal contributions from all closed walks of length four and products of **actual native Q124 SU(2)/Q96 transport matrices** around four-link loops, including Wilson-holonomy interference. The Q145 rank/moment lower bound is valid within its original explicit Q125a hypotheses but does not compute this trace either.

The historical **four ARF formulas and their shapes are NOT fixed targets**: user correction 2026-11-14 requires first-principles laws anew from URT / full five-Platonic / 190/H64 / 24 structure, without reverse engineering old candidates. This Track M symmetry-breaking line is independent of the old Q77 history selector and should not be assessed merely by counting older six ARF gates. The finite results also do not establish a complete physical theory.

## RESUME HERE — Q148, within active Q144b/Q145b
Build actual 444-state native signed/weighted 720-link `J` with Q124 `U_{xy}^{(96)}`. Compute **vertex-resolved** `Tr(H_ch^4)` from `Tr[(H_ch^2)^† H_ch^2]`, keeping diagonal backtracks, all common-neighbour interference, and 4-cycle Wilson transports. Establish exact rank/nullity or rigorous bounds and genuine weighted partition invariance; then complete the true v61 192/528 stable-gauge photon Hessian. No old Q77 clock, no synthetic matrices, no ARF fitting.

## Verification
`python research_archive/2026-11-15_q147_weighted_link_recovery/Q147_WEIGHTED_LINK_FOURTH_CERTIFICATE.py`
Local execution on 2026-11-15 returned exit 0. CI status must be verified against the commit; no physical gate is closed.

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for this particular link-amplitude identity; OPEN for the full charged fourth trace and physical photon.
