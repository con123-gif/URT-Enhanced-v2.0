# Q4 — what the native matter archive defines (2026-11-11)

Status: OBSTRUCTION (exact graph theory plus a complete array census) — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION
PENDING. Certificate: `Q4_NATIVE_MATTER_MAP_2026_11_11.py`; executed in Claude's sandbox; check
`research.q4_native_matter_map`.

## Question (Queue Q4)
From `microscopic_source_currents_operators.npz` (written by `run_native_source.py`) and the v61 source, determine exactly how
the 48 sites, 528 links and 96 charged states relate to the icosahedral vertices, the 30 edges and the 64 histories. State
the map the archive defines, or prove it defines none.

## Answer
1. **The v61 site graph.** Simple graph on 48 sites with 456 edges: six slices of 8 sites, each inducing the cube graph Q₃,
   consecutive slices joined completely (K₈,₈), slices arranged in a 6-cycle. Two sites share ≥ 16 neighbours exactly when
   they lie in one slice, so slices are blocks for every automorphism.
2. **No A5 on the lattice.** Aut acts on slices through Aut C₆ (order 12) and inside slices through Aut Q₃ (order 48).
   Neither order is divisible by 5, so the site graph has no automorphism of order 5. A5 (simple, with elements of order 5)
   cannot act on the 48 sites, and no A5-equivariant map from sites or links to vertices, edges or faces of any Platonic
   solid exists. A5 can reach the v61 matter only through internal indices (spinor or registry).
3. **Array census (136 arrays, three archives).** No array couples a Wilson dimension (192 states, 528 links, 48 sites,
   188) to a geometry or history dimension. The only array joining the Wilson sea to the 96-state registry is
   `conditional_neutral_tensor_sum_energies` (192 × 96), which equals the Kronecker sum e_i + e^Y_a and is labelled
   "explicitly typed tensor-sum restriction ... does not identify the microscopic Lorentz/Yukawa/wall insertion" in its source.
4. **What is defined.**
   - End(4) of the hidden A5 quartet splits into an A5-invariant 12-dimensional gauge response and a 4-dimensional
     geometry response (gauge registry `A5_gauge_response_basis`, `A5_geometry_response_basis`; mixing under all 60
     elements < 1e-15).
   - The 64-history source reaches the registry only as the Yukawa coefficient samples Ys = `loaded_amplitudes[:, 0]`
     (4 × 3 × 3).
   - Tr Q96² = 32, equal to Tr(WᵀL⁺W) of the 2026-10-24 theorem: an index equality, not a map.

## Consequence
The missing object of `docs/RESEARCH_STATE.md` §5 is genuinely absent from the archive, and statement 2 constrains any
future construction: a source-preserving, A5-equivariant map must act on internal indices of the v61 matter, never by
identifying lattice sites or links with Platonic cells. Together with `2026-11-11_hidden_parity/` (native photon free,
action even in Δ), no route to R_α runs through the archived operators as they stand.
