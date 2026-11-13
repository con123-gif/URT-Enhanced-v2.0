# Q82: the source weights on the selected dictionary are exactly (4,2,2,0); the chronology coefficient drops out (ACTIVE PROBLEM A, attempt A3)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **Part 1 OBSTRUCTION (exact structure, float64 values). Part 2 THEOREM (exact rational). CLOSED INTERNALLY /
PHYSICAL IDENTIFICATION PENDING.** Part 2 holds for the 2026-11-10 Kbar construction on the Q64/Q72 selected dictionary;
both of those are readings, and the selection is the conditional one recorded for A1/A2b/A4. Gate A stays open.
Certificate: `Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py` (check `research.q82_oriented_source_weights`). Executed in
Claude's cloud sandbox: exit 0 in about 18 s. It re-executes Q73 (and so Q64, Q61, Q3).

## What (4,2,2,0) is (recovered, not new)

The weights are defined in `2026-11-10_urt_arf_forward/new_gate/URT_NATIVE_QUARTET_SOURCE_WEIGHTS_2026_11_10.md` and
checked by `handover_claims.py` (claim 7). The construction is:

- K = H + c·Abar, with H = 15I − Σ_{i<j} X_iX_j, A = (I − Q)ᵀ(I − Q), and Abar its A5 Reynolds average.
- K has four A5 quartet branches.
- The weights are tr(P_λ U_h P_s U_hᵀ) on those branches.

The "A5 chronology coefficient" is c, which that note sets to 1 by choice. The four slots are therefore **spectral
branches of K**. They are not clock bins and not σ₁ cycles. Q82 as queued compared against bins and cycles; Part 1 does
that and records why it cannot work, and Part 2 makes the comparison in the correct slots.

## Part 1: forward-minus-reverse joint clock bridge (Q82 as queued)

Setting: D₀ = (0,2,4,6,10,9) and R D₀ (its time reverse, Q77), with the Q73 joint-clock bridge.

- **1a (exact, Q(√5)).** The clock translation u ↦ u + 1/4 maps URT block x onto block x+16 with identical joint
  data: row pieces shift by 6 bins, column pieces by 12. This works because T(u + 1/4) = T(u) + 1/2. Hence
  F_x = F_{x+16} as functions.
- **1b (exact).** ρ_x(D₀) ≠ ρ_x(R D₀) on exactly 16 blocks, M₀ ∪ (M₀+16) with M₀ = {2,3,6,7,8,9,12,13}.
  - Every such block swaps 1/9 ↔ 2/9, with the same data on x and x+16.
  - The forward chronology has the smaller ρ on {2,3,12,13,18,19,28,29}.
  - All other blocks contribute exactly zero (Q77 lemma).
- **1c.**
  - Exact consequence: the source-bin profile of B^J_{D₀} − B^J_{RD₀} on σ₁'s edges has period 6. Its golden-bin Fourier
    support is k ≡ 0 (mod 4), so every k mod 4 four-bin pattern has the form (u, v, u, v). No relabelling of (4,2,2,0)
    has that form.
  - float64 values: source bins (−0.038004, +0.094808, −0.038004, +0.094808); target bins (+0.2705, +0.1557, −0.1249,
    −0.1877).
  - σ₁ cycle log-weights (4 + 5×12): +0.0711, +0.0555, +0.0454, +0.0454, −0.0257 and −0.0101 (the 4-cycle). They sum to
    ln 1.1991476… (Q77).
  - Every resolution has mixed signs, so none is a non-negative weight pattern.

## Part 2: the quartet branches on the selected dictionary (exact)

- **2a (c drops out).** H is the scalar 2k(6−k) on Walsh block k (exact check), and Abar preserves each Walsh block and
  commutes with A5. So for **every** dictionary and every c > 0:
  - the branch projectors, and hence the source weights, are independent of c;
  - c only moves the poles, to 16 + c·a₂, 18 + c·μ±, 16 + c·a₄.

  **The source weights cannot fix the A5 chronology coefficient.**
- **2b (selected orbit 1, all 8 classes).** The forward and reverse chronologies give identical data. The weights are:

  | Branch | Pole | P5 weight | P3 weight |
  |---|---|---|---|
  | Walsh-2 | 16 + 4c/3 | 4 | 0 |
  | Walsh-3 | 18 + 27c/20 | 0 | 2 |
  | Walsh-3 | 18 + 33c/20 | 0 | 2 |
  | Walsh-4 (dark) | 16 + 3c/2 | 0 | 0 |

  That is **(4,2,2,0) exactly**. At c = 1 the poles are 52/3, 387/20, 393/20 and the dark 35/2, with
  G_sel(z) = 4(2400z² − 91000z + 861873)/((3z−52)(20z−387)(20z−393)). The source moments are 8, 442/3 and 2450581/900.
- **2c (census, all 768 classes).**
  - The pattern (4,2,2,0) holds exactly on 272 classes (34 Q24 orbits, 14 pole sets). So the **weights do not select the
    dictionary; the poles do.**
  - The archived poles 266/15, 389/20, 391/20 (dark 521/30) occur on 32 classes in 4 Q24 orbits, none of them orbit 1.
    The historical resolvent G(z) = 20(2400z² − 91480z + 871257)/(…) therefore belongs to an unselected dictionary.
  - On the other classes the Walsh-3 split is unequal (≈ 0.211/3.789, 0.4/3.6, 0.891/3.109, 1.257/2.743), and no class
    is degenerate.
- **2d (Q → P_σ₁).** Using the selected reversible history itself as the chronology, the two Walsh-3 branches merge into
  one 8-fold pole at 18 + 2c, so the P3 split is undefined. The poles are then 16 + 3c/2 (P5, weight 4), 16 + 5c/2
  (dark) and 18 + 2c (P3, weight 4). The four-pole structure needs the two-successor Q.

## What this establishes, and what it does not

- On the history dictionary selected by A1/A2b/A4, the native hidden source assigns exactly (4,2,2,0) to the four A5
  quartet branches of H + c·Abar, for every c.
- The A3 weight question is answered on the selected orbit, and the answer matches the historical pattern. It is not a
  selection by itself: 272 of 768 classes give it.
- The poles differ from the archived ones. Any later use of G(z) must use G_sel, or say which dictionary it uses.
- The chronology coefficient c is **not derived**. Part 2a proves the weights are blind to it.
- No ARF and no physical pole is identified.

## Next

Q85 [derive] (A3, coefficient): find a native condition fixing c in H + c·Abar on the selected D₀. One candidate is that
the selected bridge B^J_{D₀} (Q73/Q77), used in place of Q in A, reproduces the same branch projectors. Another is a
Ward/Schur matching of the Q2 two-step generator to H on the hidden quartets. Either derive c or prove that every native
condition tried leaves the one-parameter family.
