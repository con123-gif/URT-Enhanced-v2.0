# Two spectra, one symmetry group — disambiguation

*Status: framework documentation, v2.9.86.  External contribution: James Lockwood (mathematician, 2026, private communication) — derivation of the actual graph-Laplacian spectrum of Cone(I_12), the inverse-Laplacian trace η_{G_{13}} = 5508/2821, and the BT8g coupling sector that turns it into a Cathedral closure.*

---

## Why this document exists

Inside the framework, the symbol `G_{13}` appears in two operationally distinct contexts, and earlier write-ups (notably `docs/PI_PHI_E_DERIVATION.md` and the π-φ-e flow PDF) conflated them.  This document fixes the disambiguation in one place.

There are **two genuinely different mathematical objects**, both A_5-symmetric, both 13-dimensional, both containing the eigenvalues `{0, 7, 13}`.  They are not the same Laplacian.  Either can be the right object depending on what you are computing — but you cannot interchange them.

## Object A — the K_4 ⊕ A_5 character spectrum

**Module**: `urt.spectrum_cathedral`, `urt.sector_unification`

**What it is**: the representation-theoretic decomposition of the 13-dimensional space `K_4 ⊕ A_5 = (D+1) ⊕ (D!+D)` into integer "spectral" data organised by the icosahedral rotation group's characters.

**Spectrum (asserted, integer)**:

```
{0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13}     multiplicities (1, 2, 6, 2, 1, 1)
trace = 72 = D! · V
```

**Decomposition**:

```
tr(L | K_4)  =  0 + 3 + 3 + 5         =  11
tr(L | A_5)  =  5 + 5 + 5 + 5 + 5 + 7 + 7 + 9 + 13   =  61
total        =                                          72  =  D! · V
```

**Where it appears in the framework**:

- `urt.spectrum_cathedral.LAPLACIAN_EIGENVALUES` — postulated integer list
- `urt.sector_unification` — proves the 11 + 61 = 72 sector split
- The "Cathedral β-closure" identity catalogued in `urt.bt8g_cathedral` connects to this object via the **(2/γ)·π² = 2^q·π²** normalisation
- Most of the framework's Cathedral identities (`F_q = q`, `T_3 + T_6 + T_9 = D!·V`, etc.) cross-reference this trace via `D!·V = 72`

**What it is not**: it is **not** the graph Laplacian of any standard icosahedral construction.  The literal interpretation "L = diag(deg) − A" of a 13-vertex centred icosahedron gives trace 84, not 72 (see Object B).

## Object B — the actual graph Laplacian of Cone(I_12)

**Module**: `urt.cone_icosahedron` (added v2.9.86, Lockwood)

**What it is**: the graph-theoretically rigorous Laplacian `L = diag(deg) − A` of the **cone over the icosahedron** — the centred-icosahedral graph with 12 outer vertices (the icosahedron, 5-regular) plus 1 centre vertex connected to all 12 outer vertices.

**Spectrum (computed, irrational)**:

```
{0, (6−√5)³, 7⁵, (6+√5)³, 13}        multiplicities (1, 3, 5, 3, 1)
trace = 84 = 2·|E|,  |E| = 42 = 30 + 12
```

**Inverse-Laplacian trace** (Lockwood):

```
              3              5              3            1
η_{G_13}  =  ──────────  +  ───  +  ──────────  +  ────
             6 − √5          7      6 + √5           13

              36     5     1       5508
          =  ──── + ─── + ───  =  ──────
              31     7    13       2821
```

The √5 terms cancel exactly because `(6 − √5)(6 + √5) = 36 − 5 = 31`.

**Cathedral factorisation** (Lockwood/collaborative):

```
                                     4 · 81 · 17
η  =  (D+1)·(1/γ)·(N+D+1)    =   ─────────────   =   5508/2821
      ─────────────────────         7 · 13 · 31
        (D!+1) · N · M_q
```

Every prime in numerator and denominator is Cathedral:

```
4  = D+1   = |K_4|              7  = D!+1
81 = 1/γ   = D^(D+1)            13 = N
17 = N+D+1 (also # wallpaper)   31 = 2^q − 1 = M_q (Mersenne prime at q)
```

**Where it appears in the framework**:

- `urt.cone_icosahedron` — full graph construction + spectrum + Kirchhoff data
- `urt.bt8g_cathedral` — the BT8g bimetric sector uses *this* Laplacian, not the character spectrum.  The locked-summary identities `𝒦·η = D!` and `c₁/c₂ = −δ★` are derived from η = 5508/2821.

## Side-by-side comparison

| Property | Object A — character spectrum | Object B — Cone(I_12) graph Laplacian |
|---|---|---|
| Module | `urt.spectrum_cathedral` | `urt.cone_icosahedron` |
| Origin | K_4 ⊕ A_5 rep-theoretic split | `L = diag(deg) − A` on 13 vertices, 42 edges |
| Eigenvalues | integers | irrationals involving √5 |
| Multiplicities | (1, 2, 6, 2, 1, 1) | (1, 3, 5, 3, 1) |
| Trace | 72 = D! · V | 84 = 2 · 42 |
| Inverse trace | (use case-specific) | **5508/2821** = (D+1)·(1/γ)·(N+D+1) / [(D!+1)·N·M_q] |
| A_5-symmetric | yes | yes |
| Same eigenvalues `{0, 7, 13}` | yes | yes |
| Used by `urt.bt8g_cathedral` | for context | **for the actual coefficients** |
| Used by `urt.cathedral_engine` (π-φ-e flow) | yes (as canonical spec) | no |

## How the framework should read the π-φ-e flow derivation

The π-φ-e flow paper (`docs/PI_PHI_E_DERIVATION.md`, Lytollis 2026) currently writes:

> "The centred-icosahedral graph G_{13} has Laplacian L = diag(deg) − A with eigenvalues 0 < 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13 (Fiedler value = 3)."

That sentence simultaneously invokes the **graph definition** (Object B) and the **K_4 ⊕ A_5 character spectrum** (Object A), which are not consistent — the graph Laplacian of the cone over the icosahedron does not have eigenvalue 3 at all, nor multiplicity 6 at λ = 5.

The intended object for the π-φ-e flow derivation appears to be **Object A** (the character spectrum) — because the derivation uses the Fiedler value `λ_2 = D = 3` to set the contraction rate, and the framework's other tour modules use `tr(L) = D!·V = 72`.

The intended object for **BT8g** (Lockwood) is **Object B** — because the BT8g spectral susceptibility requires the actual graph Laplacian to give `η = 5508/2821` and the resulting `𝒦·η = D!` closure.

Both are legitimate Cathedral structures.  They share A_5 symmetry and the integer eigenvalues `{0, 7, 13}`, but **they are not the same Laplacian** and the framework should henceforth keep them notationally distinct.

## Suggested notational convention

| Symbol | Refers to |
|---|---|
| `L_{G_13}` | the K_4 ⊕ A_5 character spectrum (Object A, trace 72) |
| `L_{Cone(I_12)}` | the actual graph Laplacian (Object B, trace 84) |
| `spec(L_{G_13})` | `{0, 3², 5⁶, 7², 9, 13}` |
| `spec(L_{Cone(I_12)})` | `{0, (6−√5)³, 7⁵, (6+√5)³, 13}` |
| `η_{G_13}` (Cathedral character) | (use-case-specific) |
| `η_{Cone(I_12)} = Tr'(L^{−1})` | `5508/2821` (Lockwood) |

The existing identity `tr(L_{G_13}) = 11 + 61 = 72` (Cathedral) and the new identity `η_{Cone(I_12)} = 5508/2821` (Lockwood) are independent and both rigorous within their own object.

## Cross-references

- `urt/spectrum_cathedral.py` — Object A (character spectrum)
- `urt/sector_unification.py` — proves 11 + 61 = 72 = D!·V split
- `urt/cone_icosahedron.py` — Object B (actual graph Laplacian) [v2.9.86, Lockwood]
- `urt/bt8g_cathedral.py` — BT8g locked-summary identities using Object B [v2.9.86]
- `docs/PI_PHI_E_DERIVATION.md` — uses Object A (recommend explicit footnote)
