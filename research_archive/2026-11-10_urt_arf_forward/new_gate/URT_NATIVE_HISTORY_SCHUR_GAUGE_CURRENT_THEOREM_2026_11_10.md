# Newton's Cathedral / URT: native history-Schur gauge current and full second Ward contact

**10 November 2026; original analysis; no fitted parameters or historical ARF inputs.** This is a **source-to-64-history-to-temporal-gauge-response theorem** for the **specified archived conditional action**, not a physical source-to-`H13⊕H51` fermion-pole theorem. The original 190-cochain geometry, 50 vertices from all five Platonic solids, rank-eight 50→12 harmonic bridge, 20-face hidden `4_3⊕4_5`, 64 signed histories, and 24 temporal links are reproduced and independently tested. The 140 spatial edge/face cochains are retained in the full source input but do not directly enter the quadratic hidden-source coupling; their original Hodge/gauge energy is not rederived here. The original six-bit cylinder ↔ geometric sign-history dictionary and all-five-solid harmonic bridge remain explicit model hypotheses, not unique consequences of the bare pi/phi/e recursion.

## 1. Original source and exact 64-history elimination

Let `z_t ∈ C^190`, `v_t ∈ C^50` be its five-solid vertex part, `x_t=Plinear v_t ∈ C^12`, and `w_t=C x_t ∈ C^20`. The native hidden sources are

`h3_t=P3(w_t⊙w_t)` and `h5_t=P5(w_t⊙w_t)`.

Both have diagonal temporal U(1) charge `q=2` because `z_t` has charge one. `P3,P5` are mutually orthogonal rank-four projectors. The original 64-history isometry `Uh` obeys

`Uh†Uh=P3+P5`, `H64 Uh P3=18 Uh P3`, `H64 Uh P5=16 Uh P5`,

with `spec(H64)=0(2),10(12),16(30),18(20)`. The 24-clock covariant difference is `D_q y_t=y_{t+1}−exp(iqθ_t)y_t`; let `L_q=D_q†D_q`, `r=π/e`, `Δ=3/20−80π/(1053φ)`, `φ=(1+√5)/2`. Define

`A3=18I24+r²L_q`, `A5=16I24+r²L_q`, `s_a=A_a^{-1}h_a`.

The native uneliminated history source is `b=(h3+Δh5)Uh†` (24×64). Its **exact** stationary history field is `y=(s3+Δs5)Uh†`. The reduced history energy is

`V_hist = (||h3||²+Δ²||h5||²)/4 − (h3†A3^{-1}h3 + Δ² h5†A5^{-1}h5)/2`.

This is an exact Schur complement, not a fitted or phenomenological gauge coupling. The original full cochain action also has the Hodge bridge, temporal cochain term and KMS entropy feedback; those pieces are **not** silently included in the current below. The source-norm and entropy pieces have zero explicit θ derivative and are gauge-invariant along the full orbit.

## 2. A derived 24-link source-induced gauge current

For any 24 independent link angles `θ_t`, put `B_t=∂A_a/∂θ_t` and `D_t=∂²A_a/∂θ_t²`; these matrices are independent of `a` because only the constant history eigenvalue differs. On the link `(t,t+1)` with `u_t=exp(iqθ_t)`, their only nonzero entries are

`(B_t)_{t+1,t}=−i q r²u_t`, `(B_t)_{t,t+1}=+i q r²conj(u_t)`,

`(D_t)_{t+1,t}=q²r²u_t`, `(D_t)_{t,t+1}=q²r²conj(u_t)`.

With `c3=1`, `c5=Δ²`, the exact current and complete link Hessian are

`J_t = (1/2) Σ_{a=3,5} c_a Re[s_a† B_t s_a]`,

`H_ts = (1/2) δ_ts Σ_a c_a Re[s_a† D_t s_a] − Σ_a c_a Re[(B_s s_a)† A_a^{-1}(B_t s_a)]`.

**The second term is the induced-history relaxation/paramagnetic contact.** Dropping it is not the Hessian of the reduced action. In particular, the gauge response is not determined by the four neutral cubic source cumulants alone.

## 3. First and second Ward identities including every source/clock contact

Under arbitrary periodic temporal phases `λ_t`, the native source transforms `h_a→exp(iqλ_t)h_a` and the link transforms `θ_t→θ_t+λ_{t+1}−λ_t`. The Schur action is invariant exactly. Its local first Ward identity is

`J_{t−1}−J_t + q Σ_a c_a Im[(s_a)_t† (h_a)_t]=0`.

For a one-parameter gauge orbit, define `A'=Σ_t (λ_{t+1}−λ_t) B_t`, `A''=Σ_t(λ_{t+1}−λ_t)² D_t`, `h'_a=iqΛh_a`, `h''_a=−q²Λ²h_a`, `Λ=diag(λ_t)`. Then the exact **second Ward identity** for the Schur part is

`Σ_a c_a { −Re[s_a†h''_a] + (1/2) Re[s_a†A''s_a] − (h'_a−A's_a)† A_a^{-1}(h'_a−A's_a) } = 0`.

The three terms are, respectively, **source-rotation acceleration**, **Wilson-link seagull**, and **history relaxation**. All three are required. This is distinct from (and compatible with) the separate first/second Ward contacts of the gauge-neutral squared norms and the original uneliminated 64-history Wilson current.

### Independent executable checks

`URT_SOURCE_SCHUR_WARD_CONTACTS_2026_11_10.py` independently reconstructs the original five solids (cochain dimensions `14,26,26,62,62`, total **190**), the rank-eight vertex bridge, both rank-four hidden projectors, the original `H64` spectrum and source isometry. For a generic complex 24×190 input, its direct **uneliminated 24×64 history action** agrees with the 24×20 Schur energy within `2.84e−14`. The exact finite gauge-orbit action variation is `0`, and the local first Ward residual is `4.44e−16`. The second Ward terms are `+238.11960607195883`, `+1.592922739878237`, `−239.71252881183705`; their sum is `2.84e−14`. Independent link finite differences verify the analytic current and Hessian.

## 4. Parameter-free conditional uniform-clock response

For a Fourier source `h_a(t)=exp(ikt)v_a`, a uniform link `θ`, and `δ=k−2θ`, set

`d3=18+r²(2−2cosδ)`, `d5=16+r²(2−2cosδ)`.

The exact 24-clock Schur energy, current (derivative w.r.t. the **common** link angle), and complete second derivative are

`V=V_raw − 12 (||v3||²/d3 + Δ²||v5||²/d5)`,

`J_common=−48 r² sinδ (||v3||²/d3² + Δ²||v5||²/d5²)`,

`H_common=96 r² cosδ (||v3||²/d3² + Δ²||v5||²/d5²) − 384 r⁴ sin²δ (||v3||²/d3³ + Δ²||v5||²/d5³)`.

These are *source-induced temporal gauge derivatives* and not Maxwell couplings or fermion pole residues. In the explicitly specified six-bit Haar source ensemble, `E||v3||²=36+72√5/5`, `E||v5||²=7`. Taking a source with cochain frequency `2π/24`, hence `k=4π/24`, and the original golden clock `θ=2π/φ²`, gives

`J_common = −8.339895795899402`, `H_common = −11.477859100942238`.

The `4_5` contributions are approximately `−6.4295058066e−6` and `−9.1372215189e−6`; the rest comes from `4_3`. These numbers follow without inserting a target ARF, but depend on the **stated choice of Fourier probe**, so they are not unconditional predictions. The action respects the large gauge identification `θ→θ+2π/24`, `k→k+4π/24`.

## 5. Exact two-channel orthogonalization and a four-component warning

The separate exact program `URT_NEUTRAL_ORTHOGONAL_CUBIC_2026_11_10.py` uses only the previously proved `Q(√5)` two-channel covariance and third cumulant tensor. It derives the unique covariance-orthogonal residual (for this ordered basis)

`gR=g3−αg5`, `α=(3852/785)+(7704/3925)√5 ≈9.2959662926518165`,

`K_R5=0`, `K_RR=(419904+186624√5)/98125≈8.532055543774989`,

`K_RRR≈16.032539319411294` (the script prints its exact `Q(√5)` value).

The original binary cubic `K333 x³+3K335 x²y+3K355 xy²+K555 y³` has strictly positive exact discriminant

`(38992806977284026925056+17438112362288322183168√5)/3814697265625`,

hence three distinct real projective zero directions. The **four tensor components** arise because `dim Sym³(R²)=4`; this does not imply four independent gauge fields, four charged currents or four physical ARFs.

## 6. Falsification, hypotheses, next missing theorem

**Established for the archived conditional source action:** a new exact source-to-history-to-24-link current/Hessian, a complete second Ward cancellation with all three contacts, direct 64×24 vs reduced 20-face agreement, exact neutral source orthogonalization and a positive cubic discriminant. No target ARF was used or fitted.

**Ruled out:** using the Wilson seagull alone as the reduced gauge Hessian; equating four components of `Sym³(R²)` with four physical gauge couplings; treating the current above as a physical electromagnetic normalization without a charged-matter current embedding.

**Precise unsolved step:** derive (rather than assume) an `A5`- and diagonal-`U(1)`-equivariant charged-matter vertex that takes the original `4_3⊕4_5` charge-two source and full 190-cochain gauge connection into the `H13⊕H51` fermion action, then calculate *defined physical pole positions/residues* with all seagull/Schur/fermion Ward contacts. Charge selection already forces a source `h` of charge `+2` to couple linearly only to an operator of charge `−2`; a same-charge fermion mass bilinear `barΨΨ` is neutral, so a bare `h barΨΨ` Yukawa is forbidden without dressing or charge-difference sectors. Neither an admissible representation nor its unique normalization is supplied by the original action. The pi/phi/e recursion also has not uniquely selected the geometric-history dictionary. The four historical ARFs are therefore **not derived**.

## Reproduce

Run from the directory containing the new files:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_SOURCE_SCHUR_WARD_CONTACTS_2026_11_10.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_NEUTRAL_ORTHOGONAL_CUBIC_2026_11_10.py
```

Only original analysis, reproducible checks and a separate honest status ledger are added; previous files are untouched. No James/third-party Yang–Mills material is included.
