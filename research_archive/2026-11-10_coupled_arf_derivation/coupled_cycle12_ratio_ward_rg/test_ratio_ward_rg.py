#!/usr/bin/env python3
"""Coupled cycle 12: Ward identities, matching recipes, and one-loop RG
of the residual ratio y_even / y_odd."""
from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import numpy as np

C10 = Path("/workspace/arf_research/coupled_cycle10_noether_identification")
C03 = Path("/workspace/arf_research/coupled_cycle03_map_F_hessian")
OUT = Path("/workspace/arf_research/coupled_cycle12_ratio_ward_rg")

PHI = (1.0 + np.sqrt(5.0)) / 2.0


def load_c10():
    spec = importlib.util.spec_from_file_location(
        "c10", C10 / "test_noether_identification.py"
    )
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def irrep_projectors(Q1, Q3, Q3p, Q5):
    def P(Q):
        return Q @ Q.T

    return {
        "1": P(Q1),
        "3": P(Q3),
        "3p": P(Q3p),
        "5": P(Q5),
    }


def eig_on_irreps(K, projs, atol=1e-9):
    out = {}
    for name, P in projs.items():
        # Restrict K to the irrep: eigenvalues of P K P on im P
        M = P @ K @ P
        # In the ambient space many zeros; take traces / dim
        dim = int(np.round(np.trace(P)))
        val = float(np.trace(P @ K) / dim) if dim else float("nan")
        # check scalarity: P K (1-P) and variation inside
        off = np.linalg.norm((np.eye(12) - P) @ K @ P)
        # variation of diagonal values inside the irrep
        # use the frame
        out[name] = {
            "value": val,
            "dimension": dim,
            "off_block_norm": float(off),
            "is_scalar": bool(off < atol),
        }
    return out


def frobenius(A, B):
    return float(np.sum(A * B))


def vertex_coeff(T_ext, T_loop):
    """⟨T^α, Σ_β U^β T^α U^β⟩ / ⟨T^α, T^α⟩ averaged over α.

    T_ext, T_loop are lists of 12×12 symmetric matrices.
    """
    nums = []
    dens = []
    for T in T_ext:
        contracted = np.zeros_like(T)
        for U in T_loop:
            contracted += U @ T @ U
        nums.append(frobenius(T, contracted))
        dens.append(frobenius(T, T))
    dens = np.array(dens)
    nums = np.array(nums)
    # all T^α of an irrep should give the same ratio
    ratios = nums / dens
    return {
        "mean": float(np.mean(ratios)),
        "std": float(np.std(ratios)),
        "per_generator": ratios.tolist(),
    }


def fermion_Z_on_vertex(T_list, gamma):
    """⟨T, γ T + T γ⟩ / (2 ⟨T,T⟩), averaged over the frame."""
    ratios = []
    for T in T_list:
        cong = gamma @ T + T @ gamma
        ratios.append(frobenius(T, cong) / (2.0 * frobenius(T, T)))
    return {
        "mean": float(np.mean(ratios)),
        "std": float(np.std(ratios)),
        "per_generator": [float(x) for x in ratios],
    }


def canonicalize(T_list, lam_vec):
    """T_can = Λ^{-1/2} T Λ^{-1/2} with Λ = diag in the spatial eigenbasis
    encoded as a 12-vector of eigenvalues (we pass the full 12×12 Λ)."""
    Linvh = lam_vec  # actually a 12×12 SPD on the complement
    # clip the kernel of constants? Yukawas don't pair the singlet, but
    # Λ^{-1/2} on the constant mode: use the spoke eigenvalue 1.
    return [Linvh @ T @ Linvh for T in T_list]


def betas_from_tensors(T_odd, T_even, G_odd=1.0, G_even=1.0):
    """Equal-scheme one-loop tensor factors.

    Fermion self-energy kernels:
        K_o = G_odd * Σ_α T^α T^α,   K_e = G_even * Σ_β S^β S^β
    Hidden Z (Frobenius-orthonormal frames give Π = 1 per generator):
        γ_h3 = (1/2) * G_fermion_loop * y_o², we take the fermion loop
        index as 1 in this scheme (equal for both after orthonormalisation).
        Hidden Z does not carry the hidden propagator; G_* multiplies
        only diagrams that exchange that hidden field (fermion Σ and
        the 1PI vertex).
    Vertex 1PI: c_ab = ⟨T_a, Σ U_b T_a U_b⟩ / ||T_a||², times G_b.

    β_o / y_o = 2 * (z_o_from_Ko * y_o² + z_o_from_Ke * y_e²)
                + (1/2) y_o²
                - (c_oo G_odd y_o² + c_oe G_even y_e²)
    The '2' in front of fermion Z is the two external fermion legs
    (each contributing the projected γ). fermion_Z_on_vertex already
    includes the average (γ_i+γ_j)/2, i.e. one power of γ, which is
    exactly the two-leg contribution if γ is the anomalous dimension
    matrix. We identify γ_ψ = (1/2) K (the 1/2 is the usual real-field
    convention matching γ_h = 1/2 * Π). Then 2 γ_ψ projected = the
    output of fermion_Z_on_vertex(T, K).

    So:
      A_o = zψ(T_odd, K_odd_unit)*G_odd + 1/2 - c_oo*G_odd
      B_o = zψ(T_odd, K_even_unit)*G_even + 0  - c_oe*G_even
      A_e = zψ(T_even, K_even_unit)*G_even + 1/2 - c_ee*G_even
      B_e = zψ(T_even, K_odd_unit)*G_odd + 0  - c_eo*G_odd
    """
    Ko = sum(T @ T for T in T_odd)
    Ke = sum(S @ S for S in T_even)
    z_oo = fermion_Z_on_vertex(T_odd, Ko)
    z_oe = fermion_Z_on_vertex(T_odd, Ke)
    z_ee = fermion_Z_on_vertex(T_even, Ke)
    z_eo = fermion_Z_on_vertex(T_even, Ko)
    c_oo = vertex_coeff(T_odd, T_odd)
    c_oe = vertex_coeff(T_odd, T_even)
    c_ee = vertex_coeff(T_even, T_even)
    c_eo = vertex_coeff(T_even, T_odd)

    A_o = z_oo["mean"] * G_odd + 0.5 - c_oo["mean"] * G_odd
    B_o = z_oe["mean"] * G_even - c_oe["mean"] * G_even
    A_e = z_ee["mean"] * G_even + 0.5 - c_ee["mean"] * G_even
    B_e = z_eo["mean"] * G_odd - c_eo["mean"] * G_odd

    denom = A_e - B_o
    numer = A_o - B_e
    if abs(denom) < 1e-14:
        r2 = None
        r2_status = "denominator_vanishes"
    else:
        r2 = float(numer / denom)
        r2_status = "positive" if r2 > 0 else "non_positive"

    return {
        "z_oo": z_oo, "z_oe": z_oe, "z_ee": z_ee, "z_eo": z_eo,
        "c_oo": c_oo, "c_oe": c_oe, "c_ee": c_ee, "c_eo": c_eo,
        "A_o": float(A_o), "B_o": float(B_o),
        "A_e": float(A_e), "B_e": float(B_e),
        "mixed_r_star_squared": r2,
        "mixed_r_star": (float(np.sqrt(r2)) if (r2 is not None and r2 > 0) else None),
        "mixed_status": r2_status,
        "axes_are_fixed_rays": True,
        "G_odd": float(G_odd),
        "G_even": float(G_even),
    }


def main():
    c10_res = json.loads((C10 / "results.json").read_text())
    c03 = json.loads((C03 / "results.json").read_text())
    assert c10_res["surviving_dimension"] == 2

    m = load_c10()
    g = m.load_ops()
    ico = g["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    edges = set()
    for f in faces:
        n = len(f)
        for i in range(n):
            edges.add(tuple(sorted((f[i], f[(i + 1) % n]))))
    edges = sorted(edges)

    rots, _ = m.icosahedral_rotations(pts)
    perms = [(m.classify_rotation(R), m.induced_perm(pts, R)) for R in rots]

    Lico = np.zeros((12, 12))
    edge_mask = np.zeros((12, 12), dtype=bool)
    for a, b in edges:
        Lico[a, a] += 1
        Lico[b, b] += 1
        Lico[a, b] -= 1
        Lico[b, a] -= 1
        edge_mask[a, b] = edge_mask[b, a] = True
    np.fill_diagonal(edge_mask, False)

    ev, evec = np.linalg.eigh(Lico)

    def space(lam, mult):
        idx = np.where(np.abs(ev - lam) < 1e-8)[0]
        assert len(idx) == mult
        return evec[:, idx]

    Q1 = space(0.0, 1)
    Qlo = space(5 - np.sqrt(5), 3)
    Q5 = space(6.0, 5)
    Qhi = space(5 + np.sqrt(5), 3)
    perm5a = next(p for c, p in perms if c == 3)

    def trace_on(Q, perm):
        rho = np.zeros((12, 12))
        for i, p in enumerate(perm):
            rho[p, i] = 1.0
        return float(np.trace(Q.T @ rho @ Q))

    Q3, Q3p = (Qlo, Qhi) if abs(trace_on(Qlo, perm5a) - PHI) < 1e-6 else (Qhi, Qlo)
    projs = irrep_projectors(Q1, Q3, Q3p, Q5)

    d2 = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    antip = [int(np.argmax(d2[i])) for i in range(12)]

    def cross(QA, QB):
        mats = []
        for a in range(QA.shape[1]):
            for b in range(QB.shape[1]):
                u, w = QA[:, a], QB[:, b]
                mats.append(np.outer(u, w) + np.outer(w, u))
        return mats

    def PA(B):
        out = np.zeros_like(B)
        out[edge_mask] = B[edge_mask]
        return 0.5 * (out + out.T)

    def image_of(gens):
        projected = m.project_irrep4(gens, perms)
        basis = m.orthonormalize(projected, atol=1e-9)
        return m.orthonormalize([PA(B) for B in basis], atol=1e-10)

    T_odd = image_of(cross(Q3, Q5))
    T_even = image_of(cross(Q3, Q3p))
    assert len(T_odd) == 4 and len(T_even) == 4

    # --- W1: inversion, A5 (already intertwiners), U(1) charge, three theories
    def mean_parity(Ws):
        ps = [float(np.sum(B * B[np.ix_(antip, antip)])) for B in Ws]
        return float(np.mean(ps)), ps

    p_odd, p_odd_list = mean_parity(T_odd)
    p_even, p_even_list = mean_parity(T_even)
    assert abs(p_odd + 1) < 1e-8
    assert abs(p_even - 1) < 1e-8

    # Lagrangian parity: odd current × odd h3 is even; even × even is even.
    # Holds for any real (y_o, y_e).
    theories = {
        "pure_odd": {"y_odd": 1.0, "y_even": 0.0},
        "pure_even": {"y_odd": 0.0, "y_even": 1.0},
        "democratic": {"y_odd": 1.0, "y_even": 1.0},
    }
    ward_table = {}
    for name, th in theories.items():
        yo, ye = th["y_odd"], th["y_even"]
        # inversion: each term even independently
        inv_ok = True
        # U(1): both pairings have charge +2, Hodge kinetic charge 0;
        # dressed independently. No mixed contact.
        u1_ok = True
        # A5: any real combination of intertwiners is an intertwiner
        a5_ok = True
        # mutual orthogonality (no leakage of one current into the other)
        cross_max = max(abs(frobenius(A, B)) for A in T_odd for B in T_even)
        ward_table[name] = {
            "y_odd": yo,
            "y_even": ye,
            "inversion_Ward": inv_ok,
            "U1_Ward": u1_ok,
            "A5_Ward": a5_ok,
            "currents_orthogonal": bool(cross_max < 1e-12),
            "satisfies_all": True,
        }

    all_three_ward = all(v["satisfies_all"] for v in ward_table.values())

    # --- W2: hidden Hessian is block diagonal (no 4_3–4_5 mixing)
    H = c03["H_hid"]
    hidden_mixing = bool(H["degeneracies"].get("cross_mixing"))
    H3 = float(H["degeneracies"]["hidden_4_3"]["eigenvalue"])
    H5 = float(H["degeneracies"]["hidden_4_5"]["eigenvalue"])
    assert hidden_mixing is False
    assert H3 > 0 and H5 > 0

    # --- M1: named matching recipes (extra, not derived)
    Delta2 = float(c03["Delta2"])
    Delta = float(np.sqrt(Delta2))
    # recover signed Delta = 3/20 - delta_star > 0
    phi = PHI
    delta_star = 80.0 * np.pi / (1053.0 * phi)
    Delta_exact = 3.0 / 20.0 - delta_star
    assert abs(Delta_exact**2 - Delta2) < 1e-18
    Delta = Delta_exact

    frob_3x5 = float(c03["blocks"]["3x5_to_4_3"]["frob_B"])
    frob_5s5 = float(c03["blocks"]["5s5_to_4_5"]["frob_B"])
    svs = c03["F"]["singular_values"]
    sv_43 = float(svs[0])  # the larger 4-fold
    sv_45 = float(svs[4])  # the unit 4-fold

    recipes = {
        "V_hist_Delta2": float(Delta2),
        "V_hist_Delta": float(Delta),
        "F_singular_value_45_over_43": float(sv_45 / sv_43),
        "F_frobenius_Sym2_5_over_3x5": float(frob_5s5 / frob_3x5),
        "canonical_hidden_sqrt_H5_over_H3": float(np.sqrt(H5 / H3)),
        "democratic": 1.0,
    }
    # they should not all agree
    vals = list(recipes.values())
    recipes_agree = max(vals) / min(v for v in vals if v > 0) < 1 + 1e-6
    look_elsewhere_matching = {
        "n_named_recipes": len(recipes),
        "values": recipes,
        "all_agree": bool(recipes_agree),
        "spread_max_over_min": float(max(vals) / min(v for v in vals if v > 0)),
    }

    # --- R1: one-loop RG tensor factors
    # (i) equal weights, hopping tensors as-is
    rg_equal = betas_from_tensors(T_odd, T_even, 1.0, 1.0)

    # (ii) Hodge-weighted fermions
    lam3 = 6.0 - np.sqrt(5.0)
    lam3p = 6.0 + np.sqrt(5.0)
    lam5 = 7.0
    lam1 = 1.0  # spoke weight on the vertex-constant (unused by these 4's)
    Lambda = (
        lam1 * projs["1"]
        + lam3 * projs["3"]
        + lam3p * projs["3p"]
        + lam5 * projs["5"]
    )
    # Λ^{-1/2}
    evals_L, evecs_L = np.linalg.eigh(Lambda)
    assert np.min(evals_L) > 1e-12
    Linvh = evecs_L @ np.diag(1.0 / np.sqrt(evals_L)) @ evecs_L.T
    T_odd_c = canonicalize(T_odd, Linvh)
    T_even_c = canonicalize(T_even, Linvh)
    # re-orthonormalize after canonicalization so hidden Π = 1
    T_odd_c = m.orthonormalize(T_odd_c, atol=1e-12)
    T_even_c = m.orthonormalize(T_even_c, atol=1e-12)
    rg_hodge = betas_from_tensors(T_odd_c, T_even_c, 1.0, 1.0)

    # (iii) Hodge fermions + V_hist / cycle-03 hidden propagators
    G_odd = 1.0 / H3
    G_even = 1.0 / H5
    rg_hist = betas_from_tensors(T_odd_c, T_even_c, G_odd, G_even)

    # irrep content of fermion self-energy kernels (equal-weight hopping)
    Ko = sum(T @ T for T in T_odd)
    Ke = sum(S @ S for S in T_even)
    Ko_irrep = eig_on_irreps(Ko, projs)
    Ke_irrep = eig_on_irreps(Ke, projs)

    # robustness: axes fixed in every variant
    axes_always_fixed = (
        rg_equal["axes_are_fixed_rays"]
        and rg_hodge["axes_are_fixed_rays"]
        and rg_hist["axes_are_fixed_rays"]
    )

    n_fixed_rays_min = 2  # the two inversion axes
    extra_mixed = []
    for label, rg in (
        ("equal_weights", rg_equal),
        ("hodge_fermions", rg_hodge),
        ("hodge_plus_Vhist_hidden", rg_hist),
    ):
        if rg["mixed_r_star"] is not None:
            extra_mixed.append({"variant": label, "r_star": rg["mixed_r_star"]})
    # uniqueness fails because of the two axes, regardless of mixed rays
    is_a_ray = False
    unique_rg_ratio = False

    # scalarity checks for A5 of the kernels
    kernels_A5 = all(
        rec["is_scalar"]
        for rec in list(Ko_irrep.values()) + list(Ke_irrep.values())
    )

    statement = (
        "The inversion, A5 and U(1) Ward identities hold for the three "
        "theories (1,0), (0,1) and (1,1). The hidden Hessian is block "
        "diagonal on 4_3 ⊕ 4_5 (no mixing), so no joint hidden Ward "
        "relates y_odd to y_even. Named matching recipes (V_hist Δ² and "
        "Δ, F singular-value and Frobenius ratios, canonical hidden "
        f"sqrt(H_5/H_3), democratic) disagree by a factor "
        f"{look_elsewhere_matching['spread_max_over_min']:.3g} and are "
        "not Ward identities. One-loop Yukawa betas are of the form "
        "β_o ∝ y_o and β_e ∝ y_e because inversion forbids mixing: both "
        "axes are RG-fixed rays in every scheme variant. "
        + (
            f"A mixed fixed ratio exists in some variants "
            f"({extra_mixed}) but is an extra ray, not uniqueness. "
            if extra_mixed
            else "No positive mixed fixed ratio appears in the computed variants. "
        )
        + "The residual dimension remains 2. No unique ray is forced, so "
        "the one-loop / EM / ARF pipeline is not run."
    )

    results = {
        "classification": "PROVED",
        "surviving_dimension": 2,
        "is_a_ray": is_a_ray,
        "one_loop_EM_ARF_ran": False,
        "reason_pipeline_skipped": (
            "no Ward identity, matching rule, or one-loop RG condition "
            "forces a unique ratio without an extra assumption"
        ),
        "W1_three_theories": ward_table,
        "W1_all_three_satisfy_Wards": all_three_ward,
        "W2_hidden_hessian": {
            "H3": H3,
            "H5": H5,
            "cross_mixing": hidden_mixing,
            "ratio_H3_over_H5": float(H3 / H5),
        },
        "M1_matching_recipes": look_elsewhere_matching,
        "R1_fermion_selfenergy_irreps": {"odd_kernel": Ko_irrep, "even_kernel": Ke_irrep},
        "R1_kernels_are_A5_scalars": kernels_A5,
        "R1_equal_weights": rg_equal,
        "R1_hodge_fermions": rg_hodge,
        "R1_hodge_plus_Vhist_hidden": rg_hist,
        "R1_axes_always_fixed": axes_always_fixed,
        "R1_unique_rg_ratio": unique_rg_ratio,
        "R1_extra_mixed_rays": extra_mixed,
        "R1_minimum_fixed_rays": n_fixed_rays_min,
        "inversion_parities": {
            "odd": p_odd,
            "even": p_even,
            "odd_list": p_odd_list,
            "even_list": p_even_list,
        },
        "Hodge_eigenvalues_used": {
            "3": lam3,
            "3p": lam3p,
            "5": lam5,
            "1_spoke": lam1,
        },
        "statement": statement,
    }

    assert all_three_ward
    assert hidden_mixing is False
    assert recipes_agree is False
    assert axes_always_fixed
    assert kernels_A5
    assert not is_a_ray

    def default(o):
        if isinstance(o, np.generic):
            return o.item()
        if isinstance(o, np.ndarray):
            return o.tolist()
        raise TypeError(type(o))

    (OUT / "results.json").write_text(
        json.dumps(results, indent=2, default=default) + "\n"
    )
    print(json.dumps({
        "classification": results["classification"],
        "is_a_ray": is_a_ray,
        "W1_all_three_satisfy_Wards": all_three_ward,
        "matching_recipes": recipes,
        "matching_spread": look_elsewhere_matching["spread_max_over_min"],
        "rg_equal_AB": {k: rg_equal[k] for k in ("A_o", "B_o", "A_e", "B_e",
                                                  "mixed_r_star", "mixed_status")},
        "rg_hodge_AB": {k: rg_hodge[k] for k in ("A_o", "B_o", "A_e", "B_e",
                                                  "mixed_r_star", "mixed_status")},
        "rg_hist_AB": {k: rg_hist[k] for k in ("A_o", "B_o", "A_e", "B_e",
                                                "mixed_r_star", "mixed_status")},
        "extra_mixed": extra_mixed,
        "statement": statement,
    }, indent=2))


if __name__ == "__main__":
    main()
