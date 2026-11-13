"""Regression tests for cathedral_engine: exact arithmetic, and every ported operator against the original code.

Original definitions are executed unmodified (``provenance.load_definitions``) or the original modules are
imported, and the engine's exact objects are compared with them.  Archived certified numbers are asserted.
"""
from collections import Counter
from fractions import Fraction as F
import importlib.util

import numpy as np
import pytest

from cathedral_engine import cache, clock, gate_a, geometry as g, histories as h, interfaces, linalg as la
from cathedral_engine.evidence import check_ledger, queue_items
from cathedral_engine.fields import DegenerateTower, PHI, Q5, RadicalTower
from cathedral_engine.provenance import REPO, load_definitions, original_path, verify_originals


# ------------------------------------------------------------------------------------------------ fields
def test_q5_field_and_order():
    s5 = Q5(0, 1)
    assert PHI * PHI == PHI + 1 and (PHI - 1) * PHI == 1 and s5 * s5 == 5
    assert (PHI.conj() * PHI) == -1 and Q5(3, -1) > 0 and Q5(2, -1) < 0 and Q5(-3, 1) < 0
    assert sorted([Q5(1), PHI, Q5(0, 1), Q5(2)], key=float) == sorted([Q5(1), PHI, Q5(0, 1), Q5(2)])
    assert (Q5(F(7, 3), F(-2, 5)) / Q5(F(1, 2), 3)) * Q5(F(1, 2), 3) == Q5(F(7, 3), F(-2, 5))


def test_radical_tower_soundness_and_certificates():
    T = RadicalTower(200)
    s2, s3 = T.sqrt(2), T.sqrt(3)
    assert (s2 * s2 - 2).is_zero() and T.sqrt(F(8, 5)) == 2 * s2 * T.sqrt(5) / 5          # canonical primes
    x = s2 + s3
    assert T.minimal_polynomial(x) == [1, 0, -10, 0, 1]
    assert T.certify_field() and T.certify_nonsquare(1)               # 2, 3 independent: degree 4
    tau = T.sqrt(3 + s2)                                              # nested, independent
    assert ((tau * tau) - 3 - s2).is_zero() and (1 / tau) * tau == 1 and T.certify_field()
    import decimal
    decimal.getcontext().prec = 50
    ref = (3 + decimal.Decimal(2).sqrt()).sqrt()                      # independent stdlib reference
    assert T.decimal(tau, 20) == str(ref)[:22]
    bad = T.sqrt(3 + 2 * s2)                                          # = 1 + sqrt2: a dependent generator
    assert not T.certify_field()
    with pytest.raises(DegenerateTower):
        T.inverse(bad - 1 - s2)


# ------------------------------------------------------------------------------------------------ linalg
def test_exact_linear_algebra():
    A = [[F(1), F(2), F(3)], [F(2), F(4), F(6)], [F(1), F(0), F(1)]]
    assert la.rank(A) == 2 and la.rank_mod_p(A) == 2
    ns = la.nullspace(A)
    assert len(ns) == 1 and all(not x for x in la.matvec(A, ns[0]))
    B = [[F(2), F(1)], [F(1), F(3)]]
    assert la.matmul(B, la.inverse(B)) == la.identity(2) and la.det(B) == 5
    assert la.charpoly(B) == [5, -5, 1]
    assert la.primitive_integer_rows([[F(1, 2), F(-1, 3)]]) == [[3, -2]]


# ------------------------------------------------------------------------------------------------ geometry
def test_solids_faces_boundaries_equal_original_code():
    ns = load_definitions(original_path("joint_action_2026_11_07"),
                          ["phi", "names", "verts", "build_faces", "build_bdry"])
    for s in g.SOLIDS:
        P = np.array([[float(x) for x in p] for p in g.vertices(s)])
        assert np.allclose(P, ns["verts"][s])
        fo = ns["build_faces"](ns["verts"][s])
        assert fo == [list(f) for f in g.faces(s)]
        b1o, b2o, eo = ns["build_bdry"](ns["verts"][s], fo)
        b1, b2 = g.boundary_maps(s)
        assert np.array_equal(b1o, np.array(b1)) and np.array_equal(b2o, np.array(b2))
        assert [tuple(e) for e in eo] == list(g.edges(s))


def test_five_solid_complex_invariants():
    f = g.hodge_dirac_facts()
    assert (f["tr_D2"], f["tr_D4"], f["dim_ker"]) == (720, 3456, 10)
    V = sum(len(g.vertices(s)) for s in g.SOLIDS); E = sum(len(g.edges(s)) for s in g.SOLIDS)
    Fc = sum(len(g.faces(s)) for s in g.SOLIDS)
    assert (V, E, Fc, V + E + Fc) == (50, 90, 50, 190)


def _polymul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def test_icosahedral_and_13_cell_spectra():
    cp = g.laplacian_charpolys()
    def prod(*fs):
        out = [1]
        for f_, k in fs:
            for _ in range(k):
                out = _polymul(out, f_)
        return out
    # 0(1), 5 -+ sqrt5 (3 each), 6(5);   centred 13-cell: 0, 6 -+ sqrt5 (3), 7 (5), 13
    assert cp["L12"] == prod(([0, 1], 1), ([-6, 1], 5), ([20, -10, 1], 3))
    assert cp["L13"] == prod(([0, 1], 1), ([-13, 1], 1), ([-7, 1], 5), ([31, -12, 1], 3))


def test_hidden_projectors_and_a5_decompositions():
    ico = g.icosahedron()
    P3, P5, Ph, L = ico["P3"], ico["P5"], ico["Ph"], ico["L_face"]
    assert la.is_projector(P3) and la.is_projector(P5) and la.trace(P3) == la.trace(P5) == 4
    assert la.matmul(P3, P5) == la.zeros(20, 20) and la.rank(Ph) == 8
    assert la.matmul(L, P3) == [[3 * x for x in r] for r in P3] and la.matmul(L, P5) == [[5 * x for x in r] for r in P5]
    rots = g.a5_rotations()
    def perm_char(objects, act):
        chi = {}
        for gg, R in rots:
            chi.setdefault(g.a5_class_of(R), sum(1 for o in objects if act(gg, o) == o))
        return chi
    assert g.decompose_character(perm_char(range(12), lambda gg, v: gg[v])) == {"1": 1, "3": 1, "3'": 1, "5": 1}
    Fs = [frozenset(f) for f in g.faces("icosahedron")]
    assert g.decompose_character(perm_char(Fs, lambda gg, f: frozenset(gg[v] for v in f))) == \
        {"1": 1, "3": 1, "3'": 1, "4": 2, "5": 1}
    Es = [frozenset(e) for e in g.edges("icosahedron")]
    assert g.decompose_character(perm_char(Es, lambda gg, e: frozenset(gg[v] for v in e))) == \
        {"1": 1, "3": 1, "3'": 1, "4": 2, "5": 3}


def test_d6_to_h3():
    d = g.d6_h3()
    assert d["labels"] == (PHI, 1 - PHI) and d["shell_norms"] == (Q5(4), Q5(6, 2))
    assert la.trace(d["P_H3"]) == 3 and la.is_projector(d["P_H3"])


# ------------------------------------------------------------------------------------------------ histories
def test_history_operators():
    assert h.hbits_spectrum() == {0: 2, 10: 12, 16: 30, 18: 20}
    Q2 = h.Q2().astype(object)
    Q6 = np.linalg.matrix_power(Q2, 6)
    assert np.all(Q6 == 1)                                  # Q^6 = J/64 for Q = Q2/2
    cp = h.carrier_projectors()
    assert [la.trace(cp[k]) for k in ("P8", "H3", "H5")] == [8, 4, 4]
    assert all(cp["P8"][a][b] == cp["H3"][a][b] + cp["H5"][a][b] for a in range(64) for b in range(64))
    M = [[F(x) for x in r] for r in h.M_matrix()]
    ico = g.icosahedron()
    MtM = la.matmul(la.transpose(M), M)
    assert la.matmul(MtM, ico["Ph"]) == [[2 * x for x in r] for r in ico["Ph"]]      # U_h = M Ph / sqrt2 isometric
    lhs = la.matmul([[F(21 if i == j else 0) - int(h.hbits()[i, j]) for j in range(64)] for i in range(64)],
                    la.matmul(M, ico["Ph"]))
    rhs = la.matmul(M, [[3 * a + 5 * b for a, b in zip(r3, r5)] for r3, r5 in zip(ico["P3"], ico["P5"])])
    assert lhs == rhs                                       # (21 - Hbits) U_h = U_h (3 P3 + 5 P5)
    assert len(h.uh_support()) == 40


def test_dictionaries_orbits_and_original_q3_action():
    assert len(h.all_dictionaries()) == 46080 and len(h.a5_classes()) == 768
    assert all(len(o) == 8 for o in h.q24_orbits()) and len(h.q24_orbits()) == 96
    if not original_path("q3_twirl").exists():
        pytest.skip("Q3 original not present")
    spec = importlib.util.spec_from_file_location("q3", original_path("q3_twirl"))
    q3 = importlib.util.module_from_spec(spec); spec.loader.exec_module(q3)
    assert sorted(tuple(int(x) for x in p) for p in q3.geometric_a5_on_codes()) == sorted(h.a5_on_codes())


def test_twirled_chronology_census_and_selection():
    S = h.twirled_chronologies()
    m2 = Counter(int(np.trace(S[D] @ S[D])) for D in h.a5_classes())
    assert len(m2) == 32 and {31440, 42480, 27120} <= set(m2)                     # Q3
    assert min(m2) == 8880 and max(m2) == 45360
    assert len({h.twirled_chronology_code(D).tobytes() for D in h.a5_classes()}) == 372   # Q41 (code frame)
    assert len({S[D].tobytes() for D in h.a5_classes()}) == 192                    # history frame (engine census)
    sel = h.selected_orbit()
    q83 = [(0, 2, 4, 6, 10, 9), (0, 2, 7, 5, 9, 10), (0, 2, 9, 10, 4, 6), (0, 2, 10, 9, 7, 5),
           (0, 3, 4, 7, 10, 8), (0, 3, 7, 4, 9, 11), (0, 3, 9, 11, 4, 7), (0, 3, 10, 8, 7, 4)]
    assert list(sel["classes"]) == q83 and sel["beta"] == {h.SIGMA1_BETA} and sel["ties"] == {0}
    assert sel["is_one_q24_orbit"] and sel["L"] / sel["runner_up"] > F(454, 100)  # Q64 margin x4.54


def test_P13_is_a_rank_13_projector():
    P13 = h.P13_projector()
    assert sum((P13[i][i] for i in range(64)), Q5(0)) == 13
    row = [P13[5][j] for j in range(64)]
    assert sum((row[j] * P13[j][7] for j in range(64)), Q5(0)) == P13[5][7]


# ------------------------------------------------------------------------------------------------ clock
def test_sigma1_clock_and_q83_carrier():
    sig = gate_a.sigma1()
    assert sorted(len(c) for c in la.perm_cycles(sig)) == [4, 12, 12, 12, 12, 12] and clock.perm_order(sig) == 12
    mult = clock.clock_multiplicities(sig)
    assert sum(mult.values()) == 64 and mult[6] == 6 and mult[2] == 5 and mult[1] == 0
    tau = la.perm_power(sig, 6)
    H3 = h.carrier_projectors()["H3"]
    for D in gate_a.selected_dictionaries():
        Hd = la.conj_by_perm(H3, h.dictionary_index(D))
        assert all(Hd[tau[a]][b] == -Hd[a][b] for a in range(64) for b in range(64))    # T H3,D = -H3,D (Q83)
    P, rational = clock.mode_class_projector(sig, gate_a.FORBIDDEN_K)
    assert rational and la.is_projector(P)
    v = [F(i % 7 - 3, i % 5 + 1) for i in range(64)]
    E = clock.mode_energies(v, sig, RadicalTower(64))
    assert sum((E[k] for k in range(24)), 0 * E[0]) == sum(x * x for x in v)            # Parseval, exact


# ------------------------------------------------------------------------------------------------ source, Q88-Q90
def test_exact_source_against_original_function_and_q81():
    from cathedral_engine.source import Q81_PRINTED, exact_source, hidden_source_float
    S = exact_source()
    v = np.zeros(50); v[0] = v[3] = 1
    h3f, h5f, xf = hidden_source_float(v)
    assert max(abs(float(a) - b.real) for a, b in zip(S["x"], xf)) < 1e-13
    T = S["T"]
    assert T.decimal(S["norm3"], 36)[:36] == Q81_PRINTED["norm3"][:36]
    assert abs(float(S["norm5"]) - float((h5f.conj() @ h5f).real)) < 1e-15


def test_q88_rows_and_source_line():
    rows = gate_a.q89_rows()
    assert gate_a.q89_rows_parsed() in (rows, None)
    joint, per = gate_a.joint_rowspace(gate_a.selected_dictionaries())
    assert set(per.values()) == {2} and len(joint) == 3
    assert la.rank([[F(x) for x in r] for r in rows] + joint) == 3
    assert len(gate_a.source_line()) == 1


# ------------------------------------------------------------------------------------------------ infrastructure
def test_cache_keys_and_reuse(tmp_path, monkeypatch):
    monkeypatch.setenv("CATHEDRAL_CACHE_DIR", str(tmp_path))
    monkeypatch.setenv("CATHEDRAL_CACHE", "1")
    k1 = cache.cache_key("x", ("q83_clock",), {"a": 1})
    assert k1 != cache.cache_key("x", ("q83_clock",), {"a": 2}) and k1 == cache.cache_key("x", ("q83_clock",), {"a": 1})
    calls = []
    f = lambda: calls.append(1) or 42
    assert cache.cached_call("t", f, assumptions={"z": 1}) == 42 and cache.cached_call("t", f, assumptions={"z": 1}) == 42
    assert len(calls) == 1
    cache.clear_memory()
    assert cache.cached_call("t", f, assumptions={"z": 1}) == 42 and len(calls) == 1      # served from disk


def test_interfaces_never_invent_the_missing_map():
    with pytest.raises(interfaces.UnresolvedInterface):
        interfaces.require("h64_to_v61_charged_map")
    assert interfaces.require("hopf_2I_charged_carrier").status == "ESTABLISHED"


def test_evidence_ledger_and_queue_parse(tmp_path):
    # ledger health is reported by the non-gating check engine.evidence_ledger; here only the machinery is tested
    good = {"id": "QX", "kind": "result", "agent": "A", "date": "2026-11-13", "result": "THEOREM",
            "status": "CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING", "statement": "s", "certificate": "",
            "executed": [], "ci": {}}
    led = tmp_path / "ev.jsonl"
    import json
    led.write_text(json.dumps(good) + "\n" + json.dumps({"id": "QY"}) + "\n")
    r = check_ledger(led)
    assert r["entries"] == 2 and len(r["problems"]) == 1 and "missing keys" in r["problems"][0]
    log = tmp_path / "log.md"
    log.write_text("# t\n## Queue\n- [ ] Q7 [derive] (A) open task\n- [x] Q8 [compute] (B) done — X\n## Log\n")
    items = queue_items(log)
    assert [(i["id"], i["done"], i["lane"], i["gate"]) for i in items] == [("Q7", False, "derive", "A"), ("Q8", True, "compute", "B")]
    assert isinstance(check_ledger()["entries"], int)
    assert verify_originals()["joint_action_2026_11_07"][2] is True
