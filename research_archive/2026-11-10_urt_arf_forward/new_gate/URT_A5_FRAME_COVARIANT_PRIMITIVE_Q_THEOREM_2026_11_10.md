# Newton's Cathedral / URT — minimal A5 frame lift preserving the primitive six-bit recursion

**10 November 2026. New exact, parameter-free conditional construction.** The original 190-cochain all-five-solid source, its icosahedral hidden `4_3⊕4_5`, 64 signed histories, 24-clock charge-two Wilson links and all previously verified Ward contacts are unchanged. This theorem adds a mathematically minimal **frame label** to make the *original unaveraged* six-bit chronology A5-covariant without replacing its transition probabilities. The existence of the lift is proved; its identification with a physical degree of freedom is **not**.

## 1. Minimal orbit of the original dyadic chronology

Let `Q[h,2h]=Q[h,2h+1]=1/2` be the native 64-state URT six-bit chronology. Let `rho(g)` be the signed-axis A5 action on the same 64 histories, derived from the icosahedral `A5/C5` vertices and their antipodal pairs. The exact centralizer theorem from the preceding research shows

```
Stab_A5(Q) = {identity}.
```

By orbit–stabilizer, the 60 matrices

```
Q_g = rho(g) Q rho(g)^(-1),  g∈A5
```

are **all distinct**. Any discrete A5-equivariant family of transfers containing the original Q must contain this full 60-member orbit. Thus 60 is the **minimal number of distinct conjugate primitive chronology frames** under the stated equivariance requirement. This is not a count of physical particles, spatial dimensions or independent fitted constants.

## 2. Constructive exact equivariant lift

Introduce a frame index `g∈A5`, held fixed during the primitive history update. The lifted state space is `C[A5]⊗C^64`, dimension `60×64=3840`. Define the block-diagonal transfer

```
Q_tilde((g,h),(g',h')) = delta_(g,g') (Q_g)_(h,h').
```

A5 acts simultaneously by `k:(g,h)→(kg,rho(k)h)`. Group multiplication gives

```
rho(k) Q_g rho(k)^(-1) = Q_(kg),
```

so `Q_tilde` is **exactly A5-equivariant**. An exhaustive executable check verifies this identity for all `60×60×64` frame/group/history combinations and both outgoing transitions, with integer-exact equality. No transition probability, coupling or free parameter has been fitted.

Because each Q_g is unitarily conjugate to Q,

```
(Q_g)^6 = J64/64,
Q_tilde^6 = I60 ⊗ J64/64.
```

This preserves the original **exact six-step memory erasure inside each frame**. It does *not* erase the frame label. The existing 24-clock is an **independent temporal factor**, giving `60×64×24=92160` frame/history/clock coordinates if explicitly tensored. The 24 temporal positions are not silently reinterpreted as 60 frames; 24 slots cannot injectively label 60 distinct Q_g matrices. The original five-solid 190-cochain source is still the input to the hidden projector and has not been replaced by this history/frame construction.

## 3. Why averaging the transfer was not equivalent

If the frame is unobserved and uniformly distributed, the **one-step marginal** is the previously proved Reynolds transfer

```
R(Q)=(1/60) Σ_g Q_g.
```

But the frame is **fixed over the entire trajectory**. Hence the n-step marginal is `(1/60)Σ_g Q_g^n`, not `[R(Q)]^n`. In particular

```
(1/60) Σ_g Q_g^6 = J64/64,
[R(Q)]^6 ≠ J64/64,
max entry discrepancy = 29461/116640000.
```

The exact discrepancy is verified using integer sixth powers. **Averaging over an unobserved fixed frame produces non-Markovian observed history dynamics**; it is invalid to replace it with repeated one-step Reynolds averaging when computing the original Green–Kubo and third-cumulant rates. This resolves a concrete tension between the primitive six-bit memory theorem and the A5-symmetrized source theorem without changing Q.

## 4. The five A4 source vacua arise as a marginal of 60 frames

The A5 four-dimensional real irreducible has five unit regular-simplex vectors `v_i` with `v_i·v_j=1` for `i=j` and `−1/4` otherwise. Each oriented tetrahedral `A4` singlet line is fixed by an order-12 subgroup `A4⊂A5`, so its orbit has size `60/12=5`. Uniform Haar weighting of the **60 fixed frames** pushes forward to **exactly five equally weighted A4 branches**. The executable code verifies the five orbit counts `(12,12,12,12,12)` and the simplex identity

```
||(1/5) Σ_(i=1..5) v_i⊗v_i⊗v_i||² = 3/16.
```

This matches the group-theoretic normalization in the archived exact A5-symmetric third-cumulant theorem. It explains why the prior **equal five fixed-frame average** is natural as a group-Haar marginal. It does **not** claim the numerical third-cumulant rate is unchanged under a new frame/history dictionary; to transfer that numerical result, one must prove that the archived source and its six-bit coding are transported equivariantly in each frame. Crucially, the frame is held fixed throughout the trajectory; resampling an A4 branch at every URT step would alter time correlations.

## 5. Scope, falsification and next theorem

**Proved:** exact 60-frame minimal conjugacy orbit; explicit A5-covariant 60×64 transfer retaining original Q in every frame; six-step exact history erasure in each frame; difference between fixed-frame averaging and repeated Reynolds transfer; exact five-branch A4 Haar pushforward and cubic simplex norm. Independent finite integer tests passed.

**Ruled out:** a 24-slot *injective frame label* for all 60 distinct primitive chronologies; replacing fixed-frame averaged dynamics with the one-step averaged Markov transfer; claiming the primitive Q itself is A5-equivariant at a fixed six-axis ordering.

**Still open:** the physical status and dynamics of the frame label, and especially a unique **equivariant source-to-matter map** that transports the complete five-solid 190-cochain source and `4_3⊕4_5` through the frame lift to the charged `H13⊕H51` fermion representation. The previous representation theorem found 8 H13 Weyl-pair quartet tensor structures and 276 in an unrestricted uniform-charge full-64 Weyl hypothesis; the primitive dynamics must select and normalize physical vertices. The native 24-clock Wilson, Schur, source-rotation and fermion Ward contacts must then be assembled into gauge-invariant pole residues. **No historical physical ARF has yet been derived.**

## Reproduction

```
OPENBLAS_NUM_THREADS=1 python URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_A5_MINIMAL_FRAME_LIFT_2026_11_10.py
```

Only new original analysis and executable tests are added. No prior files or third-party Yang–Mills work are changed.
