# Q71 — exact native Q3 A5 chronology on the six sigma1-clock sectors

**GPT · 2026-11-13 · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (scoped Q71 computation). Gate A OPEN.**

Original operators, not a synthetic stand-in: Q2 six-bit shift `h→2h,2h+1 (mod 64)`; Q3 geometric A5 twirl `S_D=∑_{g∈A5}P_g(DQ2D⁻¹)P_gᵀ`, with row sum 120; Q64 selected signed dictionary `D=(0,2,4,6,10,9)` under Q61's `xx//2` axis and `xx&1` sign convention; and Q61 reversible sigma1 lift `sigma1(x)=2x+1, sigma1(x+32)=2x`. The icosahedral A5 rotations are reconstructed by exact graph automorphisms and numerical orientation sign as in the original Q3 certificate; every resulting transfer entry is integer and all subsequent linear algebra is exact rational.

The sigma1 cycles have lengths (4,12,12,12,12,12). Let `C` be the orthogonal projector onto functions constant on each cycle, and `K=S_D/120`. **New exact result:** `[K,C]=0`, and the restricted six-dimensional stochastic transfer `N=C K C|im(C)` has characteristic polynomial

`χ_N(λ)=(λ−1)(3λ−1)(6λ−1)(12λ+1)(15λ−2)(15λ−1)/48600`.

Thus its eigenvalues are exactly `1,1/3,1/6,-1/12,2/15,1/15`. All five nonconstant sigma1-clock fixed directions are mixed and exponentially damped; the slowest absolute eigenvalue is 1/3. The restriction is full rank six and its centered restriction has rank five. Unlike the original Q2 finite-time annihilation `Q2^5 C=J`, Q3 retains nonzero memory at every finite power; its five modes decay as rational eigenvalues.

The exact six-by-six matrix (cycle order from increasing first unvisited history):
```
[[13/40,2/15,7/60,13/60,19/120,1/20],
 [2/15,1/3,1/4,7/60,2/15,1/30],
 [7/60,1/4,1/3,2/15,7/60,1/20],
 [13/60,7/60,2/15,1/5,13/60,7/60],
 [19/120,2/15,7/60,13/60,13/40,1/20],
 [3/20,1/10,3/20,7/20,3/20,1/10]]
```

**Important limitation:** `[K,C]=0` means Q3 preserves the clock-fixed space; it does not itself select a uniform-marginal bridge or force the selected dictionary. The five nonconstant modes damp only asymptotically. This is a conditional computation **at Q64's selected dictionary**, not an independent derivation of its selection, source weights or physical ARFs.

**Execution:** local sandbox `OPENBLAS_NUM_THREADS=1 python /mnt/data/cathedral_q71/q71.py` exit 0 on 2026-11-13, output `Q71_NATIVE_Q3_FIXED_SPACE_CERTIFICATE_OK`; exact script committed under this directory. New CI pending.

**RESUME HERE:** Test the same Q3 clock restriction under all eight symmetry-related winning dictionaries and compare the U_h-weighted source twirl; decide whether an original-operator invariant can select the uniform-marginal bridge without adding a variational postulate.
