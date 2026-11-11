# Hidden-sector parity and the Δ-selection rule of the native URT action (2026-11-11)

Status: THEOREM (exact representation theory; numerical certificate in double precision) and OBSTRUCTION —
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Certificate:
`HIDDEN_PARITY_DELTA_SELECTION_2026_11_11.py` (executes the archived 7 November construction verbatim up to its
first test block). Executed in Claude's sandbox 2026-11-11; registered as `research.hidden_parity_delta_selection`.

## Prior work used
- 15 Tr L⁺ = 137 on the dual dodecahedron, the chirality W with WᵀL⁺W = 3P₃ + 5P₅, and the even-in-Δ chiral
  deformation 15 Tr L_Δ⁺ = 105 + 32/(1 − Δ²/15): `2026-10-24_alpha_physical_gate/NATIVE_137_COULOMB_CHIRAL_CHARGE_INDEX_THEOREM.md`.
- The native action: `2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py`.
- "The 7 November action contains no vertex-to-spatial-edge charged coupling": `docs/RESEARCH_STATE.md` §3.
- Hidden-sector links, tr(P₃P_c) = tr(P₅P_c) = 1: `2026-11-11_hidden_sector_link/`.
- v61 `DO_NOT_RESURRECT` forbids "a single cube/Klein four as the A5 irrep 4". Consistent with statement 3 below: a cube's
  A4 singlets are rank one in each of 4₃ and 4₅; no cube is identified with an irrep here. v61's "A4 root lattice" is the
  Lie-type root system of its Wilson stencil, a different object from the tetrahedral subgroup A4 ⊂ A5 used here.

## Statements
1. **Parity of the hidden sector.** Central inversion permutes the 20 icosahedral faces (dodecahedral vertices) and
   commutes with L. On the eigenspaces: 0 (1) even, 3−√5 (3) odd, 2 (5) even, **3 = 4₃ odd**, **5 = 4₅ even**,
   3+√5 (3′) odd. So the hidden 4₃ ⊕ 4₅ is 4⁻ ⊕ 4⁺ under I_h, and W (which swaps them) is parity-odd.
2. **Bare trace by parity.** 15 Tr L⁺ = 99/2 (even: 5/2 + 4/5) + 175/2 (odd: 3/(3−√5) + 4/3 + 3/(3+√5)) = 137.
3. **A4 vacua.** For each of the five A4 subgroups the A4-invariant face functions form a 3-dimensional space,
   spanned by the indicators of the face orbits of sizes 4, 4, 12. The 4₃ singlet is the tetrahedral parity
   vector 1_T − 1_T′ (odd); the 4₅ singlet is the contrast 2·1_rest − 3·1_(T∪T′) (even). These are the
   "tetrahedral parity" and "cube occupation" of the inscribed cube.
4. **The native photon is free.** Edge cochains appear only in ½|b₂ᵀa|² and the clock covariant derivative; the
   history and KMS terms read vertex cochains only. Shifting every edge component changes history + KMS by 0.
5. **R-symmetry.** R = I − 2U_hP₅U_hᵀ is an orthogonal involution on the 64 histories commuting with Hbits, with
   R U_hP₃ = U_hP₃ and R U_hP₅ = −U_hP₅. The only Δ-linear term of the action, −Re⟨y, U_h(h₃ + Δh₅)⟩, obeys
   S(z, y; Δ) = S(z, Ry; −Δ); the rest depends on Δ², and on log Δ only through the KMS odds Δ².

## Consequence
Every observable of the geometric cochains z alone — vacuum, Hessian, induced or free photon — is even in Δ, and
the photon trace 15 Tr M⁺ = 137 receives no correction at all from the native action. The linear coefficient
17572/1215 of the Δ polynomial therefore has no source in the native URT. A Δ-linear α correction needs a new
coupling that (i) reaches the edge cochains and (ii) is odd under R, i.e. distinguishes the sign of the history
amplitude in the parity-even 4₅ sector. In a single A4 vacuum the only parity-even, A4-invariant hidden direction
is the cube contrast of statement 3; it averages to zero over the five vacua.

## Scope
This is about the archived 7 November action and its named operators. It does not identify α with any trace and
does not change δ⋆, δ_cl, Δ or η.
