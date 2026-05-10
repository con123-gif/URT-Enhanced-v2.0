# Breakthrough Notes — Pure-Math Branch

This file records new mathematical discoveries surfaced on the
`pure-math` branch (i.e. since the snapshot of `main` v2.9.76).

For physics-side discoveries — Casimir, η_B, axion mass, the v9 anchor-free chain, predictions-registry findings — see `docs/BREAKTHROUGH_NOTES.md` on the `main` branch.

---

## How this branch is organised

The `pure-math` branch is a *snapshot* of `main` v2.9.76 stripped to mathematical content (87 modules retained, ~105 physics-application modules removed). Three exploration modules have been added since the snapshot — they live only on this branch and are documented in `docs/EXPLORATION.md`.

```
Snapshot baseline:  3,698 tests
After exploration:  3,727 tests  (+29 from cathedral_orbits)
```

---

## v2.9.76 → exploration wave (2026-05-09 → 2026-05-10)

### Triple-coincidence catalogue (`urt.triple_coincidences`)

A catalogue of 17 Cathedral compounds, each appearing as a canonical numerical invariant in **≥3 distinct mathematical domains**. Headline counts:

| Compound | Domain count |
|---|---|
| **V·F = 240** | 8 (E₈ roots, π_7^s, K_7(Z), E₄ Eisenstein, K(8) kissing, Hopf σ, del Pezzo d=1, J-image) |
| **V = 12** | 8 (Coxeter h(E₆), H₃ vertices, K(3) kissing, K_3(Z) torsion mod 4, Riemann moduli M_5, A₅ irrep, …) |
| **2V = 24** | 7 |
| **D! = 6** | 7 |
| **q/D = 5/3** | ≥4 (M6 just-intonation interval, Kolmogorov γ, F/V Fiedler-spectrum ratio, fluid γ_monatomic) |
| **D²/F = 4/9** | ≥4 (sector-volume ratio, Casimir coefficient, bare cosmology Ω_m/Ω_Λ, η_B prefactor halved) |

13 compounds reach ≥5 domains; 4 reach ≥7.

### Deep self-references (`urt.deep_self_references`)

Extends the self-reference cluster (the Cathedral integers compute themselves under classical sequences).

**New identities (every step Cathedral)**:

  - σ(G) = 168 = \|PSL_2(7)\| — divisor sum of \|A_5\| equals order of (3,3,7)-triangle group
  - σ(2V) = G — divisor sum of K3 χ equals \|A_5\|
  - φ(q²) = F — Euler totient of 25 equals icosahedral face count
  - φ(D!+1) = D! — totient of 7 equals 6
  - φ(D·q) = 2^D — totient of 15 equals 8
  - p(D²) = E — partition of 9 equals 30
  - p(D!+1) = D·q — partition of 7 equals Lo Shu constant 15
  - π_Pisano(2V) = 2V — Pisano period of 24 is 24 itself (a fixed point)

**The σ-chain** continues across 6 Cathedral integers:

```
σ(2^D) = D·q       (15)        Lo Shu
σ(D·q) = 2V        (24)        K3 χ, Niemeier, Leech
σ(2V)  = G         (60)        |A_5|
σ(G)   = 168                   |PSL_2(7)|
σ(168) = 480
σ(480) = 1512                  Cathedral compound
```

### Cathedral orbits (`urt.cathedral_orbits`)

Iterated arithmetic functions stay in the Cathedral set. Three findings:

**σ-chain from D=3 (10 steps, every value Cathedral)**:

```
σ(D)   = D + 1     (4)
σ(D+1) = D! + 1    (7)
σ(D!+1)= 2^D       (8)
σ(2^D) = D·q       (15)        Lo Shu
σ(D·q) = 2V        (24)
σ(2V)  = G         (60)        |A_5|
σ(G)   = 168                   |PSL_2(7)|
σ(168) = 480
σ(480) = 1512
                    →           orbit escapes after step 10
```

**φ-orbit from V·F = 240 (8 steps, every value Cathedral)**:

```
φ(V·F) = (D+1)^D = 64
φ(64)  = 2^q     = 32
φ(32)  = 2^(q-1) = 16
φ(16)  = 2^D     = 8
φ(8)   = D+1     = 4
φ(4)   = D-1     = 2
φ(2)   = 1                     terminates at φ-fixed-point
```

**Pisano-period attractor at 2V = 24**: multiple Cathedral integers iterate via the Fibonacci-Pisano period to land on 24 (which is itself a fixed point, π_Pisano(24) = 24).

**Interpretation**: the Cathedral integers form a **trapping set** under classical arithmetic functions. Once inside, an iterated function tends to stay Cathedral for many steps. This is structural evidence the integers are a natural orbit basin in number theory, not a curated list.

---

## Failed attempts (preserved for transparency)

The framework discloses its failed attempts. Two of them are foundational to remember:

### Null hypothesis test (RETRACTED — category error)

An earlier version of the framework attempted a Monte-Carlo "null test": generate random integers under the same multi-domain catalogue; check that they don't satisfy as many Cathedral identities as the actual seven integers do. The test was retracted because **the icosahedron is not drawn from a random distribution**: D=3 and the Jordan-classification step force A₅ uniquely. The integers are theorems, not samples. The retracted module `urt.null_hypothesis_test` is preserved in this branch with full critique in its docstring.

### Matter-direction "0.13 % failure" (PROMOTED to identity)

Earlier work flagged the inequality `D·N·φ > F·(1−γ)·π` as failing by 0.13 %. On re-examination this was a digit error: the actual margin is 22 ppm. **Promoted** from "near failure" to "near-exact identity" and absorbed into `urt.matter_direction`.

The full audit lives in `urt.failed_attempts_study`.

---

## Test totals on this branch

```
3,698 — snapshot from main v2.9.76 stripped of physics modules
3,727 — current (after cathedral_orbits +29 tests)
   95 % coverage on retained modules
    0 xfail
    6 skipped (numerical-only edge cases)
```
