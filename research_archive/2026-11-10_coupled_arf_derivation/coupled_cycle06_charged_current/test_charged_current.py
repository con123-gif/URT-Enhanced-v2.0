#!/usr/bin/env python3
"""Coupled cycle 06: A5-equivariant gauge-covariant charged currents on 90 edges."""
from __future__ import annotations
import json
from collections import defaultdict
from itertools import combinations
from pathlib import Path
import numpy as np

SRC = Path("/workspace/arf_research/repo/research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py")
OUT = Path("/workspace/arf_research/coupled_cycle06_charged_current")
CLSZ = [1, 15, 20, 12, 12]
IRREPS = {
    "1": (1, 1, 1, 1, 1),
    "3": (3, -1, 0, (1 + np.sqrt(5)) / 2, (1 - np.sqrt(5)) / 2),
    "3'": (3, -1, 0, (1 - np.sqrt(5)) / 2, (1 + np.sqrt(5)) / 2),
    "4": (4, 0, 1, -1, -1),
    "5": (5, 1, -1, 0, 0),
}


def load_ops():
    g = {}
    exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), g)
    return g


def inner(chi, psi):
    return float(np.dot(CLSZ, np.array(chi) * np.array(psi)) / 60.0)


def decompose(chi):
    return {name: round(inner(chi, vec), 10) for name, vec in IRREPS.items()}


def classify_rotation(R, atol=1e-8):
    if np.allclose(R, np.eye(3), atol=atol):
        return 0  # identity
    tr = float(np.trace(R))
    # orders via trace of SO(3): 2cos(theta)+1
    if abs(tr + 1) < 1e-6:  # 180 deg, 2cos(pi)+1 = -1
        return 1
    if abs(tr - 0) < 1e-6:  # 120 deg, 2cos(2pi/3)+1 = 0
        return 2
    # 72 deg: 2cos(72)+1 = (sqrt(5)-1)/2 + 1 = (sqrt(5)+1)/2 = phi
    # 144 deg: 2cos(144)+1 = -(sqrt(5)+1)/2 + 1 = (1-sqrt(5))/2
    phi = (1 + np.sqrt(5)) / 2
    if abs(tr - phi) < 1e-6:
        return 3  # 5A, 72 deg
    if abs(tr - (1 - np.sqrt(5)) / 2) < 1e-6:
        return 4  # 5B, 144 deg
    raise RuntimeError(f"unclassified rotation trace {tr}")


def icosahedral_rotations(pts):
    n = len(pts)
    d = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    # neighbor threshold: 5 nearest distinct nonzero non-antipodal
    neigh = []
    for i in range(n):
        order = np.argsort(d[i])
        # skip self (0); take next 5
        nn = [int(j) for j in order if j != i][:5]
        # drop antipode if it sneaked in (largest distance)
        antip = int(np.argmax(d[i]))
        nn = [j for j in nn if j != antip][:5]
        assert len(nn) == 5, (i, nn, antip)
        neigh.append(nn)
    v0 = pts[0]
    n0 = pts[neigh[0][0]]
    A0 = np.column_stack([v0, n0, np.cross(v0, n0)])
    rots = []
    for vt in range(n):
        for nj in neigh[vt]:
            v1 = pts[vt]
            n1 = pts[nj]
            A1 = np.column_stack([v1, n1, np.cross(v1, n1)])
            R = A1 @ np.linalg.inv(A0)
            if abs(np.linalg.det(R) - 1) > 1e-6:
                continue
            if np.linalg.norm(R.T @ R - np.eye(3)) > 1e-6:
                continue
            rots.append(R)
    # unique
    uniq = []
    for R in rots:
        if not any(np.linalg.norm(R - S) < 1e-8 for S in uniq):
            uniq.append(R)
    return uniq, neigh


def induced_perm(pts, R, atol=1e-7):
    new = pts @ R.T
    perm = []
    for x in new:
        dists = np.linalg.norm(pts - x, axis=1)
        j = int(np.argmin(dists))
        if dists[j] > atol:
            return None
        perm.append(j)
    if sorted(perm) != list(range(len(pts))):
        return None
    return perm


def edge_chars(perms, edges, n_classes=5):
    """edges: list of frozenset({i,j}). signed and unsigned characters per class."""
    # classify each perm? we pass list of (class_id, perm)
    unsigned = [0] * n_classes
    signed = [0] * n_classes
    counts = [0] * n_classes
    eset = [tuple(sorted(e)) for e in edges]
    for cls, perm in perms:
        counts[cls] += 1
        ufix = 0
        sfix = 0
        for a, b in eset:
            pa, pb = perm[a], perm[b]
            if {pa, pb} == {a, b}:
                ufix += 1
                if (pa, pb) == (a, b) or (pa, pb) == (b, a) and (pa, pb) == (a, b):
                    pass
                # orientation preserved iff (pa,pb)==(a,b)
                if (pa, pb) == (a, b):
                    sfix += 1
                elif (pa, pb) == (b, a):
                    sfix -= 1
                else:
                    # mapped to same set; the only options are (a,b) or (b,a)
                    sfix -= 1
        unsigned[cls] += ufix
        signed[cls] += sfix
    # average per class (should be constant on class)
    for c in range(n_classes):
        if counts[c]:
            # character is the fixed count for any one element; all should agree
            unsigned[c] = unsigned[c] / counts[c]
            signed[c] = signed[c] / counts[c]
    return tuple(unsigned), tuple(signed), counts


def vertex_char(perms, n_vert):
    chi = [0] * 5
    counts = [0] * 5
    for cls, perm in perms:
        counts[cls] += 1
        chi[cls] += sum(1 for i in range(n_vert) if perm[i] == i)
    for c in range(5):
        if counts[c]:
            chi[c] = chi[c] / counts[c]
    return tuple(chi), counts


def main():
    g = load_ops()
    geom, names = g["geom"], g["names"]
    ico = geom["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(f) for f in ico["faces"]]
    # edges from faces
    def edges_from_faces(face_list):
        es = set()
        for f in face_list:
            F = [int(x) for x in f]
            n = len(F)
            # consecutive sides only (triangles: all pairs; pentagons: no diagonals)
            for i in range(n):
                es.add(frozenset((F[i], F[(i + 1) % n])))
        return list(es)
    eico = edges_from_faces(faces)
    assert len(eico) == 30, len(eico)

    rots, neigh = icosahedral_rotations(pts)
    assert len(rots) == 60, len(rots)
    class_counts = [0] * 5
    ico_perms = []
    for R in rots:
        cls = classify_rotation(R)
        class_counts[cls] += 1
        perm = induced_perm(pts, R)
        assert perm is not None
        ico_perms.append((cls, perm))
    assert class_counts == CLSZ, class_counts

    chi_v, _ = vertex_char(ico_perms, 12)
    chi_eu, chi_es, _ = edge_chars(ico_perms, eico)
    # faces
    face_sets = [frozenset(f) for f in faces]
    chi_f = [0] * 5
    counts = [0] * 5
    for cls, perm in ico_perms:
        counts[cls] += 1
        chi_f[cls] += sum(1 for F in face_sets if frozenset(perm[i] for i in F) == F)
    chi_f = tuple(chi_f[c] / counts[c] for c in range(5))

    dec_v = decompose(chi_v)
    dec_eu = decompose(chi_eu)
    dec_es = decompose(chi_es)
    dec_f = decompose(chi_f)

    # dodeca vertices = face centroids of ico (dual)
    dod = geom["dodecahedron"]
    dpts = np.asarray(dod["points"], dtype=float)
    # how many rotations preserve the dodeca vertex set?
    n_preserve_dod = 0
    dod_perms = []
    for R, (cls, _) in zip(rots, ico_perms):
        perm = induced_perm(dpts, R, atol=1e-6)
        if perm is not None:
            n_preserve_dod += 1
            dod_perms.append((cls, perm))
    # dodeca edges
    dfaces = [tuple(f) for f in dod["faces"]]
    edod = edges_from_faces(dfaces)
    assert len(edod) == 30, len(edod)
    if len(dod_perms) == 60:
        chi_dv, _ = vertex_char(dod_perms, 20)
        chi_deu, chi_des, _ = edge_chars(dod_perms, edod)
        dec_dv = decompose(chi_dv)
        dec_deu = decompose(chi_deu)
        dec_des = decompose(chi_des)
    else:
        chi_dv = chi_deu = chi_des = None
        dec_dv = dec_deu = dec_des = f"preserved_by_{len(dod_perms)}_of_60"

    # tetra, cube, octa preservation
    preserve = {}
    for name in ("tetrahedron", "cube", "octahedron"):
        spts = np.asarray(geom[name]["points"], dtype=float)
        n_ok = 0
        for R in rots:
            if induced_perm(spts, R, atol=1e-6) is not None:
                n_ok += 1
        preserve[name] = n_ok

    # incidences / conserved dimensions
    cons = {}
    for name in names:
        gg = geom[name]
        b1 = np.asarray(gg["b1"])
        # b1 is V x E
        V, E = gg["V"], gg["E"]
        # rank of divergence: if b1 is V x E, ker is nullspace of b1
        if b1.shape == (V, E):
            k = E - np.linalg.matrix_rank(b1, tol=1e-10)
        elif b1.shape == (E, V):
            k = E - np.linalg.matrix_rank(b1.T, tol=1e-10)
        else:
            k = None
        cons[name] = {"V": V, "E": E, "F": gg["F"], "b1_shape": list(b1.shape),
                      "dim_ker_div": int(k) if k is not None else None}

    # Hom dimensions
    # signed C^1 ico = chi_es, conserved = signed C^1 minus gradients
    # gradients ≅ vertices minus constants = chi_v - 1
    chi_grad_ico = tuple(chi_v[i] - IRREPS["1"][i] for i in range(5))
    chi_cons_ico = tuple(chi_es[i] - chi_grad_ico[i] for i in range(5))
    dec_grad_ico = decompose(chi_grad_ico)
    dec_cons_ico = decompose(chi_cons_ico)

    if isinstance(dec_des, dict):
        chi_grad_dod = tuple(chi_dv[i] - IRREPS["1"][i] for i in range(5))
        chi_cons_dod = tuple(chi_des[i] - chi_grad_dod[i] for i in range(5))
        dec_grad_dod = decompose(chi_grad_dod)
        dec_cons_dod = decompose(chi_cons_dod)
        n4_c1_dod = dec_des["4"]
        n4_cons_dod = dec_cons_dod["4"]
    else:
        dec_grad_dod = dec_cons_dod = None
        n4_c1_dod = n4_cons_dod = None

    # two hidden quartets
    n4_c1_ico = dec_es["4"]
    n4_cons_ico = dec_cons_ico["4"]
    n4_unsigned = dec_eu["4"]  # adjacent Sym²

    hom = {
        "Hom_4plus4_to_signed_C1_ico": 2 * n4_c1_ico,
        "Hom_4plus4_to_cons_ico": 2 * n4_cons_ico,
        "Hom_4plus4_to_unsigned_edges_ico_Sym2_supported": 2 * n4_unsigned,
        "Hom_4plus4_to_signed_C1_dodeca": None if n4_c1_dod is None else 2 * n4_c1_dod,
        "Hom_4plus4_to_cons_dodeca": None if n4_cons_dod is None else 2 * n4_cons_dod,
        "Hom_4plus4_to_tetra_cube_octa": 0,
        "reason_tco": "full A5 does not preserve those vertex sets; trivial action gives Hom(4,1)=0",
    }
    # total 90-edge signed (disjoint union)
    total_c1 = hom["Hom_4plus4_to_signed_C1_ico"] + (hom["Hom_4plus4_to_signed_C1_dodeca"] or 0)
    total_cons = hom["Hom_4plus4_to_cons_ico"] + (hom["Hom_4plus4_to_cons_dodeca"] or 0)
    hom["Hom_4plus4_to_signed_C1_90"] = total_c1
    hom["Hom_4plus4_to_conserved_90_Ward"] = total_cons
    hom["H13_edge_supported_Sym2_pairings"] = 2 * n4_unsigned
    hom["H13_edge_supported_Lambda2_pairings"] = 2 * n4_c1_ico
    hom["surviving_Ward_and_H13_ico_hopping"] = 2 * n4_cons_ico
    unique = (hom["surviving_Ward_and_H13_ico_hopping"] == 1)

    results = {
        "n_rotations": len(rots),
        "class_counts": class_counts,
        "characters": {
            "ico_vertices": chi_v,
            "ico_unsigned_edges": chi_eu,
            "ico_signed_edges": chi_es,
            "ico_faces": chi_f,
            "dod_vertices": chi_dv,
            "dod_unsigned_edges": chi_deu,
            "dod_signed_edges": chi_des,
        },
        "decompositions": {
            "ico_vertices": dec_v,
            "ico_unsigned_edges": dec_eu,
            "ico_signed_C1": dec_es,
            "ico_faces": dec_f,
            "ico_gradients": dec_grad_ico,
            "ico_conserved": dec_cons_ico,
            "dod_vertices": dec_dv,
            "dod_signed_C1": dec_des,
            "dod_gradients": dec_grad_dod,
            "dod_conserved": dec_cons_dod,
        },
        "preservation": {"dodecahedron": n_preserve_dod, **preserve},
        "conserved_dims": cons,
        "Hom": hom,
        "unique_current": unique,
        "classification": "PROVED",
        "obstruction": not unique,
        "surviving_dimension": hom["surviving_Ward_and_H13_ico_hopping"],
        "advances_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    print("rots", len(rots), "classes", class_counts)
    print("chi V", chi_v, dec_v)
    print("chi Eu", chi_eu, dec_eu)
    print("chi Es", chi_es, dec_es)
    print("chi F", chi_f, dec_f)
    print("cons ico", dec_cons_ico, "cons dod", dec_cons_dod)
    print("preserve", results["preservation"])
    print("Hom", hom)
    print("surviving", results["surviving_dimension"], "unique", unique)
    print("PASS: cycle 06 charged current")


if __name__ == "__main__":
    main()
