# How the hidden sectors of the five solids link (canonical inclusions only)

Status: CLOSED INTERNALLY (double-precision certificates, deviations ≤ 1e-14) / PHYSICAL IDENTIFICATION PENDING.
Prior work: the archived 50→8→12 portal (2026-11-07) is a constructed choice ("not a theorem of the original URT
selector"). This note uses only the geometric inclusions and dualities.

Hidden sectors (vertex: ker Bᵀ; face: ker B; B = vertex–face incidence):
tetrahedron 0/0 · cube 4/2 · octahedron 2/4 · dodecahedron 8/0 · icosahedron 0/8.
Dodecahedron hidden vertex 8 = 4₃ ⊕ 4₅ (Laplacian 3 and 5); cube hidden vertex 4 = 1 (Laplacian 6) ⊕ 3 (Laplacian 4).

Links:
1. **Tetrahedra → cube.** The parity vector of the two inscribed tetrahedra lies in the cube's hidden vertex sector
   (it is the Laplacian-6 line).
2. **Cubes → dodecahedron.** Each of the 5 inscribed cubes' hidden 4 has exactly half its weight in the dodecahedral
   hidden 8, split exactly 1 : 1: tr(P₃ P_cube) = tr(P₅ P_cube) = 1.
   Summed over the five cubes: P₃ S P₃ = (5/4) P₃, P₅ S P₅ = (5/4) P₅, P₃ S P₅ = 0. The five cubes form a tight
   frame on 4₃ ⊕ 4₅ with constant 5/4 and no 4₃–4₅ mixing.
3. **Dualities.** Cube hidden vertex 4 ≅ octahedron hidden face 4; dodecahedron hidden vertex 8 ≅ icosahedron hidden face 8.

Consequences:
- **Obstruction (Δ-blindness).** The geometric link treats 4₃ and 4₅ identically. The asymmetry of the five-cube
  bridge F = P₃ + ΔP₅ cannot come from the inclusions; it must come from dynamics.
- **Vacuum on the linked compound** (dodecahedron + 5 cubes + 10 tetrahedra on shared vertices; 150 edges, 82 faces,
  600 incidences, 300 squares; `LINKED_COMPOUND_FLUX_VACUUM_2026_11_11.py`): the d1 d0 = 0 point exists but is not the
  minimum of the half-filled sea. It relaxes 8.32 lower; eight random starts all land 8.41–8.51 lower, with no
  square at flux π. The per-solid selection of d1 d0 = 0 (`2026-11-11_icosahedral_induced_photon/`) does **not**
  survive linking through shared vertices, and the linked vacuum is glassy.
