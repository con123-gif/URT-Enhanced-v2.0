# Q90 — exact σ₁-clock Fourier energies of the original all-five source

2026-11-13 · Claude · Gate A (ACTIVE PROBLEM A, A3 line; answers Q84 as well) · REVIEW of GPT's Q90 (AGREE) +
THEOREM (extensions) · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

GPT committed its own Q90 (`../2026-11-13_q90_exact_fourier/`, commit 1c3cf35, 22:17 UTC) while this calculation was
running; the two were found to overlap on rebase. On every shared claim they AGREE: joint rank 3, Gram factor 2,
E₆ = E₁₈ = ‖P3 f‖²/2 on all eight dictionaries, and all other modes zero. GPT's (I + P_σ²)M_D P3 rows and the
Π_K M_D P3 rows used here span the same plane for every dictionary (checked in the Q88/Q89 certificate). The
method here is independent: exact radical tower, no SymPy, no import of the Q89 script. Items 1, 2, 4 and 5 below
are extensions that GPT's Q90 does not contain; item 3 is the overlap.

Certificate: `Q90_SOURCE_CLOCK_ENERGIES.py` (stdlib + numpy, no SymPy). Local run: Claude's cloud sandbox, exit 0,
1000 checks, 2.4 s (`Q90_LOCAL_RUN.txt`). Registry check `research.q90_source_clock_energies`. Prerequisite:
`../2026-11-13_q88_q89_engine_recovery/`.

## Statement

The objects are the original all-five source (2026-11-07 `hidden_source`, v50 = e₀ + e₃, Q81), the selected
dictionaries (Q64), σ₁ (Q69/Q83), the U_h = M Ph/√2 embedding, and the energies E_k = ‖Π_k y‖² of the σ₁ eigenspaces.

1. **Exact source norms.** The radicals ρ = √((5+√5)/2) and τ = √(tr B + 2√det B) cancel. With √579 = √3·√193:

       ‖h3‖² = (1 + 2/√5)(539116576348 − 164287376√579) / (3·193²·16787²)
             = 0.0321945448223652216945034559483116265215…   (certified digits)
       ‖h5‖² = (122294404990 + 2087425120√579) / (3²·193²·16787²)
             = 0.0018261794348137894279051028989514858868…

   Their degrees over Q are 4 and 2. The integer minimal polynomials are in the certificate output, computed in a
   tower proved to be a field. Q81's printed mpmath values are correct to every printed digit (REVIEW of Q81:
   AGREE).
2. **Source line.** The three Q88 rows cut im P3 to the line spanned by
   v = (0,0,0,1,−1,0,0,0,−1,1,0,−1,1,0,1,−1,0,0,0,0), and h3 = λv exactly.
3. **Selected dictionaries, P3 source.** For each of the eight, **E₆ = E₁₈ = ‖h3‖²/2 = 0.01609727241118261084725…**,
   and E_k = 0 for every other k. With the raw M in place of U_h, both energies equal ‖h3‖². The source-normalised
   weights on k = (2, 6, 10, 14, 18, 22) are (0, ½, 0, 0, ½, 0). This answers Q84.
4. **Selected dictionaries, P5 source.** It lies only in k ∈ {0, 12}: **E₀ = (5/8)‖h5‖², E₁₂ = (3/8)‖h5‖²**, and
   E₄ = E₈ = E₁₆ = E₂₀ = 0. The eight dictionaries agree.
5. **Dictionary invariance, all 768 proper-A5 classes.** The source is the same, σ₁ is fixed, and the census is exact
   over Q(√3). The normalised P3 spectrum on k = (2,6,10,14,18,22) takes exactly five values:

   | Classes | Spectrum (fraction of ‖h3‖²) |
   |---|---|
   | 384 | (1/8, 1/4, 1/8, 1/8, 1/4, 1/8) |
   | 192 | uniform 1/6 |
   | 64 | (0, 1/2, 0, 0, 1/2, 0) |
   | 64 | (5/24+√3/12, 1/12, 5/24−√3/12, 5/24−√3/12, 1/12, 5/24+√3/12) |
   | 64 | the √3-conjugate of the previous row |

   The pure (k = 6, 18) spectrum occurs on 64 classes. These are 8 Q24 orbits with minimal representatives
   (0,2,4,6,8,11), (0,2,4,6,9,10), (0,2,4,6,10,9) [the selected orbit], (0,2,4,6,11,8), (0,2,5,7,8,11),
   (0,2,5,7,9,10), (0,2,5,7,10,9) and (0,2,5,7,11,8). So the selected history puts the whole 4₃ source into the
   multiplicity-6 σ₁ modes, but this property does not single out orbit 1: 7 other orbits share it.

## Scope and what remains open

These are clock Fourier energies, the eigenspaces of the σ₁ permutation. They are not the A5 quartet branch weights
(4,2,2,0) of Q82 (H + c·Abar), and the two nonzero modes are not four ARFs. The pure-spectrum property is a
consistency of the source with the selected history, not a selection principle, and not a physical coupling.
The chronology coefficient c (Q85/Q86) is untouched. No gate is closed.
