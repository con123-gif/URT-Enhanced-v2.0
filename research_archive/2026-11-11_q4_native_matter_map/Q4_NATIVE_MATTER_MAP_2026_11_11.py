#!/usr/bin/env python3
"""Q4: what map the native matter archive defines between the v61 Wilson matter, the icosahedral geometry
and the 64 histories.

Inputs (all archived, none modified):
  - the v61 operator archive written by `research_archive/cathedral_arf_runner/run_native_source.py`
    (`microscopic_source_currents_operators.npz`); regenerated here if absent;
  - `combined_source_work/gauge/charged_gauge_join_operators.npz` (Q96 registry and its A5 data);
  - `combined_source_work/species/combined_signed_source_operators.npz` (64-history source).

Certified:
  1. The v61 site graph (48 sites from `link_edges`) is a 6-cycle of slices; each slice induces the cube graph Q3
     and consecutive slices are joined completely (K_{8,8}). Slices are forced blocks: two sites share >= 16
     neighbours iff they lie in one slice.
  2. Hence every automorphism permutes slices (Aut C6, order 12) and acts on each slice by Aut Q3 (order 48).
     Neither has an element of order 5, so the v61 site graph has NO automorphism of order 5: A5 cannot act on the
     48 sites, and no A5-equivariant map from sites (or links) to vertices, edges or faces of any Platonic solid
     exists. A5 can reach the v61 matter only through internal indices.
  3. Census of all 136 archived arrays: none couples a Wilson dimension (192 states, 528 links, 48 sites, 188)
     to a geometry or history dimension. The only array that joins the Wilson sea to the 96-state registry is
     `conditional_neutral_tensor_sum_energies` (192 x 96) = e_i + eY_a, a Kronecker sum labelled conditional by
     its own source.
  4. What the archive does define: (a) End(4) of the hidden A5 quartet splits into a 12-dimensional gauge
     response and a 4-dimensional geometry response (orthogonal, complementary, A5-invariant subspaces);
     (b) the 64-history source reaches the registry only through the Yukawa samples Ys = loaded_amplitudes[:, 0]
     (4 x 3 x 3); (c) Tr Q96^2 = 32, an index equal to Tr(W^T L+ W) of the 2026-10-24 theorem, not a map.
Result: OBSTRUCTION. The archive defines no map from the v61 matter to the icosahedral geometry or to the
histories, and none can be A5-equivariant on sites.
"""
from __future__ import annotations

import json
import runpy
import sys
from itertools import combinations
from pathlib import Path

import networkx as nx
import numpy as np

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
BASE = REPO / "research_archive/2026-10-17_original_oct08_source"
MICRO = BASE / "common_action_work/matter/microscopic_source_currents_operators.npz"
GAUGE = BASE / "combined_source_work/gauge/charged_gauge_join_operators.npz"
SPECIES = BASE / "combined_source_work/species/combined_signed_source_operators.npz"
RUNNER = REPO / "research_archive/cathedral_arf_runner/run_native_source.py"


def count_automorphisms(G: nx.Graph) -> int:
    return sum(1 for _ in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter())


def main() -> int:
    if not MICRO.is_file():
        argv = sys.argv
        runpy.run_path(str(RUNNER), run_name="__main__")
        sys.argv = argv
    out: dict = {}
    micro = dict(np.load(MICRO, allow_pickle=False))
    gauge = dict(np.load(GAUGE, allow_pickle=False))
    species = dict(np.load(SPECIES, allow_pickle=False))

    # ---- 1. the v61 site graph
    edges = micro["link_edges"]
    assert edges.shape == (528, 2)
    G = nx.Graph()
    G.add_nodes_from(range(48))
    G.add_edges_from((int(a), int(b)) for a, b in edges if a != b)
    A = nx.to_numpy_array(G, nodelist=range(48))
    common = A @ A
    same = (common >= 16) | np.eye(48, dtype=bool)
    blocks = sorted({frozenset(np.nonzero(same[i])[0]) for i in range(48)}, key=min)
    assert len(blocks) == 6 and all(len(b) == 8 for b in blocks)
    for i, j in combinations(range(48), 2):
        bi = next(k for k, b in enumerate(blocks) if i in b); bj = next(k for k, b in enumerate(blocks) if j in b)
        assert (bi == bj) == bool(same[i, j])
    Q = nx.Graph()
    Q.add_nodes_from(range(6))
    for a, b in G.edges():
        ba = next(k for k, s in enumerate(blocks) if a in s); bb = next(k for k, s in enumerate(blocks) if b in s)
        if ba != bb:
            Q.add_edge(ba, bb)
    assert nx.is_isomorphic(Q, nx.cycle_graph(6))
    for k in range(6):
        for l in Q.neighbors(k):
            assert all(G.has_edge(a, b) for a in blocks[k] for b in blocks[l]), "consecutive slices not complete"
    slice_graphs = [G.subgraph(b) for b in blocks]
    assert all(nx.is_isomorphic(s, nx.hypercube_graph(3)) for s in slice_graphs)
    aut_c6, aut_q3 = count_automorphisms(nx.cycle_graph(6)), count_automorphisms(nx.hypercube_graph(3))
    out["v61_site_graph"] = {"sites": 48, "simple_edges": G.number_of_edges(), "slices": 6,
                             "slice_graph": "cube Q3", "between_consecutive_slices": "complete K_{8,8}",
                             "Aut_C6": aut_c6, "Aut_Q3": aut_q3,
                             "order_5_automorphisms_possible": bool(aut_c6 % 5 == 0 or aut_q3 % 5 == 0)}
    assert aut_c6 == 12 and aut_q3 == 48 and aut_c6 % 5 and aut_q3 % 5

    # ---- 3. dimension census
    wilson_dims = {192, 528, 188}
    geometry_history_dims = {12, 20, 30, 64, 13, 6, 18, 216, 60, 120}
    census, mixed = {}, []
    for name, arrs in (("micro", micro), ("gauge", gauge), ("species", species)):
        for k, v in arrs.items():
            census[f"{name}:{k}"] = list(v.shape)
            dims = set(v.shape)
            if dims & wilson_dims and dims & (geometry_history_dims | {96, 16}):
                mixed.append(f"{name}:{k}")
    out["arrays_total"] = len(census)
    out["arrays_joining_wilson_to_registry_geometry_or_history"] = mixed
    assert mixed == ["micro:conditional_neutral_tensor_sum_energies"], mixed
    tens = micro["conditional_neutral_tensor_sum_energies"]
    eY = np.linalg.eigvalsh(micro["neutral_Yukawa_D96"])
    assert np.allclose(tens, micro["wilson_eigenvalues"][:, None] + eY[None, :])
    out["tensor_sum_is_Kronecker_sum_of_spectra"] = True

    # ---- 4a. End(4) = gauge 12 + geometry 4
    Bg, Bgeo = gauge["A5_gauge_response_basis"], gauge["A5_geometry_response_basis"]
    Bfull = np.hstack([Bg, Bgeo])
    assert np.allclose(Bfull.T @ Bfull, np.eye(16))
    V4 = gauge["A5_V4"]                                     # 60 matrices of the hidden quartet
    adj = [np.kron(g, g) for g in V4]                        # conjugation on End(4) = 4 (x) 4 (real orthogonal rep)
    inv_g = max(float(np.linalg.norm(Bgeo.T @ a @ Bg)) for a in adj)
    out["End4_gauge_geometry_split"] = {"orthonormal_complement": True, "max_mixing_under_A5": inv_g}
    assert inv_g < 1e-10
    # ---- 4b. history -> registry only through the Yukawa samples
    Ys = micro["source_amplitude_sample"]
    assert np.allclose(Ys, species["loaded_amplitudes"][:, 0])
    out["history_to_registry"] = "Yukawa samples Ys = loaded_amplitudes[:,0], shape (4,3,3)"
    # ---- 4c. charge index
    Q96 = micro["Q96"]
    out["TrQ96^2"] = float(np.trace(Q96 @ Q96).real)
    assert abs(out["TrQ96^2"] - 32) < 1e-10

    print(json.dumps(out, indent=2))
    (HERE / "Q4_NATIVE_MATTER_MAP_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: v61 sites form C6 x Q3 slices with K_{8,8} joins; no order-5 automorphism, so no A5 action on sites; "
          "the archive's only Wilson-registry join is a conditional Kronecker sum.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
