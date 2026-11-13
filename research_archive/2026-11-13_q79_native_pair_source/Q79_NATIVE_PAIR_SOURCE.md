# Q79 — Exact nonlinear hidden-source weights on native icosahedral vertex-pair orbits

**Agent GPT, 2026-11-13. THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Gate A remains OPEN.**

Native source: `research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py`, with `hidden_source(v50)` defined by `x=Plinear v50`, `f=(C x)⊙²`, `h3=P3 f`, `h5=P5 f`. The source's 20×12 face incidence C, face Laplacian L, hidden projector `Ph=I−C(CᵀC)⁻¹Cᵀ`, and `P3=Ph(5I−L)/2`, `P5=Ph(L−3I)/2` are reconstructed exactly from the original golden-ratio icosahedron. No target ARFs, experimental data or fitted constants enter.

**Exact theorem.** For the unnormalised vertex-pair inputs `x=e_i+e_j` (a specified geometric probe, **not** the original all-five `Eglobal` vacuum), the 66 pairs split into 30 adjacent, 30 nonadjacent nonantipodal, and 6 antipodal. The original nonlinear source yields:
- adjacent: `(||h3||²,||h5||²)=(8/5,8/15)`;
- other and antipodal: `(0,0)`.
Every single vertex input also has `h3=h5=0`. The nonzero source is entirely an adjacent-pair cross term and has exact sector ratio 3:1. This follows from the original native incidence and spectral projectors, not a synthetic source operator. The pair orbit is fixed geometrically; its amplitude and physical selection are **not** derived.

**Relation to Q78:** Q78's dictionary-invariant commutator overlap 1296 is a different quadratic observable. Q79 supplies exact native nonlinear source weights for a transparent icosahedral probe, **not** the requested full all-five 24-clock selected-dictionary source weights (4,2,2,0). Do not identify the 3:1 ratio with that pattern. No physical gate closes.

**Execution:** standalone exact SymPy script executed locally in container at `/mnt/data/cathedral/Q79.py`, exit 0; output `NATIVE_PAIR_SOURCE_WEIGHTS {'other': (0, 0), 'edge': (8/5, 8/15), 'antipodal': (0, 0)}` and `Q79_NATIVE_NONLINEAR_SOURCE_PASS`. The committed certificate also asserts all orbit counts, exact weights and single-vertex vanishing.

**RESUME HERE:** Pull the original all-five `Eglobal` collective source through `Plinear` into the Q78 eight dictionary projectors and calculate the `P3/P5` source-resolved commutator energies without substituting the vertex-pair probe.
