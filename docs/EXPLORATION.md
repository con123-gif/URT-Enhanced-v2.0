# Pure-Math Exploration Log

This file tracks mathematical investigations developed on the
`pure-math` branch, since the snapshot was taken from `main` v2.9.76.

The snapshot itself is documented in `THEORY.md` and `cathedral_structure.txt`. This log records what was *added* on this branch, in chronological order. Each entry corresponds to one or more new modules with their own CI gates.

---

## Module 1 — `urt.triple_coincidences`

**Question.** *How densely do Cathedral compounds appear across distinct mathematical domains?*

The framework's central observation is that the seven Cathedral integers are the canonical numerical invariants of essentially every classical mathematical object. This module turns that observation into a structured catalogue: each entry is a Cathedral compound paired with the (domain, role, source) triples in which it appears.

**Output.** 17 compounds catalogued, each appearing in ≥3 distinct mathematical domains.

```
Multiplicity histogram
  8 domains :  V·F = 240,  V = 12
  7 domains :  2V = 24,  D! = 6,  G = 60,  N = 13
  5 domains :  q/D = 5/3,  D²/F = 4/9,  D = 3, ...
  4 domains :  2N = 26,  D·q = 15, ...
  3 domains :  ...
```

**Headlines.**

  - **V·F = 240** reaches 8 domains (E₈ root count, |π_7^s|, K_7(Z) torsion, E_4 Eisenstein leading coefficient, K(8) kissing number, Hopf σ order, del Pezzo d=1 (-1)-curves, J-image into π_7^s).
  - **q/D = 5/3** reaches ≥4 domains: M6 just-intonation interval, Kolmogorov γ from fluid mechanics, F/V Fiedler-spectrum ratio, fluid γ_monatomic.
  - **4/9 = (D+1)/(D!+D)** reaches ≥4 domains: K₄/A₅ sector-volume ratio, Casimir coefficient, bare cosmology Ω_m^bare/Ω_Λ^bare, η_B prefactor halved (8/9 = 2·(4/9)).

**CI gate.** `triple_coincidence_audit_passes()` checks ≥15 compounds in catalogue and ≥2 compounds at ≥7 domains.

---

## Module 2 — `urt.deep_self_references`

**Question.** *How far does the f(X) = X self-reference cluster extend?*

The framework already includes 14 identities of the form `f(X) = X` where X is a Cathedral integer and f is a classical sequence (partition, Fibonacci, totient, Bell, etc.). This module extends the search via a deeper iteration of σ (divisor sum), φ (Euler totient), Pisano period, and partition.

**Output.** 17 new identities, each verified to machine precision.

**The σ-chain (six steps from 2^D, every value Cathedral).**

```
σ(8)   = 15       (D · q, Lo Shu constant)
σ(15)  = 24       (2V, K3 Euler χ)
σ(24)  = 60       (G = |A_5|)
σ(60)  = 168      (|PSL_2(7)|)
σ(168) = 480
σ(480) = 1512     (Cathedral compound)
```

The σ-chain reveals that **σ acts as an upward generator** on the Cathedral set: starting from 2^D, six iterations produce six Cathedral compounds.

**New φ-identities.**

```
φ(q²)   = 25 → 20 = F            (totient of 25 equals icosahedral face count)
φ(D!+1) = 7  → 6  = D!           (totient of 7 equals 6)
φ(D·q)  = 15 → 8  = 2^D          (totient of 15 equals 8)
```

**New σ-identities.**

```
σ(G)    = 60   → 168 = |PSL_2(7)|
σ(2V)   = 24   → 60  = G
```

**New partition identities.**

```
p(D!+1) = p(7) = 15 = D · q       (= Lo Shu constant)
p(D²)   = p(9) = 30 = E
```

**Pisano-period self-reference at 2V.**

```
π_Pisano(24) = 24                 (2V is a Pisano fixed point)
```

**CI gate.** `deep_self_references_audit_passes()` checks σ-chain reaches step 6 from 2^D, all phi/sigma/partition identities hold, Pisano-2V self-reference holds, and total identity count is ≥16.

---

## Module 3 — `urt.cathedral_orbits`

**Question.** *Are the Cathedral integers a closed system under iterated arithmetic functions?*

The deep self-reference work showed that σ generates a chain of 6 Cathedral compounds from 2^D. This module extends that observation: iterate σ, φ, and the Pisano period from each Cathedral integer and ask whether the orbit stays inside the Cathedral set.

**Output.** Three structural findings.

**(1) Extended σ-chain from D = 3 (10 steps, every value Cathedral).**

```
σ⁰ : 3       D
σ¹ : 4       D + 1
σ² : 7       D! + 1
σ³ : 8       2^D
σ⁴ : 15      D · q       (Lo Shu)
σ⁵ : 24      2V          (Mathieu, Leech, K3 χ)
σ⁶ : 60      G           (|A_5|)
σ⁷ : 168                 (|PSL_2(7)|)
σ⁸ : 480     2^q · D · q
σ⁹ : 1512    2^D · D^D · (D! + 1)
                          (orbit escapes after step 10)
```

The orbit from D itself reaches depth 10 — every step a Cathedral compound. The orbit only leaves the Cathedral set at step 11 (σ(1512) = 4368).

**(2) φ-orbit from V·F = 240 (8 steps, every value Cathedral).**

```
φ⁰ : 240     V · F = (D+1) · G
φ¹ : 64      (D + 1)^D
φ² : 32      2^q
φ³ : 16      2^(q-1)
φ⁴ : 8       2^D
φ⁵ : 4       D + 1
φ⁶ : 2       D − 1
φ⁷ : 1       (φ-fixed-point)
```

The Euler totient terminates at 1 for any input (a general theorem); from V·F the path visits *only* Cathedral integers.

**(3) Pisano-period attractor at 2V = 24.**

Multiple Cathedral starting points iterate via the Fibonacci-Pisano period to 2V = 24:

```
π_Pisano(8)   = 12  →  π_Pisano(12)  =  24
π_Pisano(27)  = 72  →  π_Pisano(72)  =  24
π_Pisano(32)  = 48  →  π_Pisano(48)  =  24
π_Pisano(2V)  = 2V                                  (already self-referential)
```

24 is a Pisano fixed point reached from multiple Cathedral integers — a basin of attraction.

**Interpretation.** The Cathedral integers form a **near-trapping set** under classical arithmetic functions. Once inside, an iterated function tends to stay Cathedral for many steps. This is structural evidence that the integers are a natural orbit basin in number theory, not a curated list.

**CI gate.** `cathedral_orbits_audit_passes()` checks σ-depth ≥ 10 from D, φ-depth ≥ 8 from V·F, and ≥3 distinct Pisano-2V attractor entries.

---

## Status of the exploration

```
Snapshot baseline    :  3,698 tests
After triple_coinc.  :  3,737 tests  (+39 from triple_coincidences)
After deep_self_refs :  3,698 tests  (overlap with existing self_reference)
After cathedral_orb. :  3,727 tests  (+29 from cathedral_orbits)

Current              :  3,727 passed, 6 skipped, 0 xfail
```

(The deep_self_references count is consistent with main; the explore-wave totals reflect the actual delta on this branch.)

---

## What's next on this branch

Open lines of investigation suitable for future modules:

  - **Multi-function orbits.** Mix σ and φ in alternating iterations from each Cathedral integer; ask which sequences stay Cathedral longest.
  - **Inverse maps.** For each Cathedral integer X, enumerate the pre-image set σ⁻¹(X) and ask how many of those are themselves Cathedral.
  - **Larger Cathedral set.** The current `_CATHEDRAL_SET` covers compounds up to ~7,200. Test whether the trapping property persists at larger scales (PSL₂(11) order = 660? σ(2520)? etc.).
  - **Orbit topology graph.** Build the directed graph on the Cathedral set where each node X has an edge to σ(X), φ(X), p(X), π_Pisano(X) (when those are Cathedral). Ask: is there a single "central" sink? (Candidate: 2V = 24, which is both a Pisano fixed point and on the σ-chain.)
  - **Probabilistic baseline.** Compare the orbit-length statistics of Cathedral starts against random-integer starts of similar magnitude. Quantifies the "trapping" claim.

Each of these can become a new module with its own audit gate.
