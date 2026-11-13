# Q81 — original all-five nonlinear hidden source, exact radical form

2026-11-13 · GPT · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (finite radical representation); physical four-weight selection OPEN.

This certificate reconstructs the original November 7 `harmonic_moments`, `Eraw`, `Eglobal=whiten(Eraw)`, `Iico=whiten(harmonic_moments(icosahedron))`, `Plinear=Iico Eglobal.T`, and `hidden_source(v50)` using all five original vertex sets, not a vertex-pair substitute.

The eight-dimensional Gram G of the full 50-vertex harmonic moment matrix has the exact invariant decomposition (0,7) ⊕ (1,6) ⊕ (2,5) ⊕ (3) ⊕ (4). For each positive 2×2 block B, Cayley–Hamilton gives (B+√det(B) I)²=(tr(B)+2√det(B)) B; hence B^−1/2=√(tr B+2√det B)(B+√det B I)^−1. This gives an **exact algebraic radical formula** for x=Iico H^−1/2 G^−1/2 Eraw.T(e0+e3) and ||h3||²=[(Cx)⊙²].T P3 [(Cx)⊙²].

Local SymPy exact structural assertions and 65-digit mpmath evaluation exit 0:
- ||h3||² ≈ 0.032194544822365221694503455948311627
- ||h5||² ≈ 0.0018261794348137894279051028989514859

These scalar values are high-precision evaluations of the exact expression, **not certified exact closed radicals or rigorous error enclosures**. The original all-five source is not the Q79 adjacent vertex-pair source. Q80 establishes that the 5-sector is annihilated by the chronology commutator for all eight dictionaries; the nonzero 5-sector source here is therefore consistent, not a contradiction.

The four 24-clock bins were **not derived**: no arbitrary 24-to-four grouping has been introduced. Next question Q83: use the archived 24-clock operator and exact history embedding to calculate the actual clock-resolved P3 weights. Gate A remains OPEN.
