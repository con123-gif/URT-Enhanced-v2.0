# Status ledger — native dark/hidden cubic tensor — 2026-11-10

**Branch:** `newtons-cathedral`. **Change policy:** add-only; no existing files overwritten, no external Yang–Mills/James material.

## Inputs inspected
- Original exact all-five-solid neutral source: `URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py`.
- `URT_A5_SYMMETRIC_THIRD_CUMULANT_THEOREM_2026_11_10.md` and `URT_A5_SYMMETRIC_CUBIC_SOURCE_2026_11_10.py`: exact A5-symmetric tetrahedral cubic source, *distinct* from this neutral dark composite.
- `URT_DARK_PARITY_COMPOSITE_SCHUR_2026_11_10.py`: exact dark composite and Green–Kubo residual.
- `URT_EXACT_NEUTRAL_FOURTH_CUMULANT_THEOREM_2026_11_10.md`: previous two-channel fourth cumulant.
- `URT_A5_H64_H13_CHARGED_VERTEX_THEOREM_2026_11_10.md` and `URT_NATIVE_DIAGONAL_WARD_AND_RELATIVE_BRIDGE_THEOREM_2026_11_10.md`: matter typing, 190-cochain diagonal gauge symmetry, Wilson/Schur contacts and bridge limitations.

## New, independently checked mathematical facts
1. Full exact symmetric third-cumulant tensor on `span{d,g3,g5}` (10 independent entries, six newly involving `d`).
2. `K_ddd=3/128` despite `E[d³]=0`; all equal/repeated-time cubic contributions vanish. The entire skewness comes from strictly three-time URT correlations.
3. Nonzero mixed dark–bright chronological cubic coefficients, e.g. `K_d35=2268/25+5319sqrt(5)/125`, `K_dd5=-371/160+9sqrt(5)/80`.
4. Exact agreement between finite lag correlation and tilted-Perron cumulant methods; independent ordered-lag enumeration and off-grid polarization passed.
5. Independent numerical icosahedral geometry reconstruction confirmed the 64-level checksum; the committed executable additionally reads and checks the exact archived source.

## Classification
- **PROVED (conditional on existing native source dictionary):** finite third-cumulant identities and dark pure-three-time skewness.
- **INDEPENDENTLY CHECKED:** exact Fraction/Q(sqrt5) methods and independent geometric history labeling, locally.
- **NOT YET VERIFIED:** a separate GitHub Actions run on the committed branch.
- **OPEN:** physical source-to-gauge/matter current embedding, unique H13⊕H51 charged intertwiner, full 24-clock charged vertex and Ward-complete transverse/pole projection; all four historical physical ARFs.
- **NOT CLAIMED:** a new hidden particle, a gauge-charged cubic vertex, a mass pole, an electromagnetic constant, or a derivation of the four ARFs.

## Next decisive calculation
Start with the native gauge-covariant 190+64+24 action and the existing charged Weyl-pair intertwiner space. Derive the source-to-charged-current mixed three-point functional derivative, including all source acceleration, Wilson seagull, Schur relaxation and fermionic contact terms. Determine whether a neutral dark insertion `d` yields a nonzero **gauge-invariant** pole residue and whether its normalization is fixed by the original recursion. Do not identify neutral cumulants with physical ARFs by analogy.

## New files
- `URT_DARK_THREE_CHANNEL_CUBIC_TENSOR_2026_11_10.py`
- `URT_DARK_THREE_CHANNEL_CUBIC_THEOREM_2026_11_10.md`
- This ledger.
