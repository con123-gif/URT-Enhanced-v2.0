#!/usr/bin/env python3
"""Q88/Q89 independent recovery (Claude, 2026-11-13) with the exact Cathedral engine. Stdlib + numpy only.

Q88 (reconstructed; GPT's local computation was never committed).  sigma_1 = the beta = 1 lift; Pi_K the exact
real projector of its 24-clock modes K; Pi_D the dictionary pull-back; M, P3 the original 64x20 history map and
4_3 projector.  For K = {2,10,14,22} (the k = 2 mod 4, k != 0 mod 3 modes of the P3 carrier):
  (a) each of the 8 selected dictionaries gives a 2-dimensional row space of Pi_K Pi_D M P3 in Q^20;
      over Q(sqrt3) the k in {2,22} and k in {10,14} row spaces are each that same plane;
  (b) jointly the 8 give a 3-dimensional space, inside the row space of P3 (dim 4);
  (c) the three integer rows committed in Q89 are independent and span it exactly.
For K = {6,18}: 2 per dictionary, 4 jointly (all of im P3).

Q89 (independent check, strengthened).  The archived source x = Plinear (e0 + e3) is exactly
x = a Z + b XY on the 12 icosahedral vertices (raw coordinates; a, b exact radicals), and the three rows
annihilate (CZ)^2, (CZ)(CXY) and (CXY)^2 separately in Q(sqrt5).  Hence r_j . (Cx)^2 = 0 for EVERY x in
span{Z, XY}: the cancellation does not depend on the Gram whitening coefficients.  The actual source is
also checked directly: r_j . f reduces to the zero element of the radical tower (a proof that it is zero).

Inputs: original constructions via cathedral_engine (regression-tested against the 2026-11-07 action, Q3, Q61,
Q64 and Q83 code).  The eight dictionaries are recomputed from the Q64 principle and compared with the list in the
Q83 certificate; the rows are parsed from the committed Q89 certificate.  Nothing fitted; no SymPy.
"""
import ast
import sys
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve()
sys.path.insert(0, str(HERE.parents[2]))
from cathedral_engine.certify import Certificate
from cathedral_engine import gate_a, histories
from cathedral_engine.fields import RadicalTower
from cathedral_engine.geometry import icosahedron, vertices
from cathedral_engine.linalg import rank, rref, matmul
from cathedral_engine.provenance import original_path
from cathedral_engine.source import exact_source

with Certificate("Q88_Q89_ENGINE_RECOVERY", __file__) as c:
    # ---------------------------------------------------------------- inputs
    Ds = gate_a.selected_dictionaries()
    Q83_LIST = [(0, 2, 4, 6, 10, 9), (0, 2, 7, 5, 9, 10), (0, 2, 9, 10, 4, 6), (0, 2, 10, 9, 7, 5),
                (0, 3, 4, 7, 10, 8), (0, 3, 7, 4, 9, 11), (0, 3, 9, 11, 4, 7), (0, 3, 10, 8, 7, 4)]   # Q83 at c33fc56
    c.check(list(Ds) == Q83_LIST, "Q64 maximiser recomputed = the eight dictionaries of Q83")
    try:
        tree = ast.parse(original_path("q83_clock").read_text())
        q83 = next((ast.literal_eval(n.value) for n in ast.walk(tree) if isinstance(n, ast.Assign)
                    and any(isinstance(t, ast.Name) and t.id == "Ds" for t in n.targets)), None)
    except (OSError, SyntaxError, ValueError):
        q83 = None
    c.record("Q83 file cross-check", "list unchanged" if q83 is not None and [tuple(d) for d in q83] == Q83_LIST
             else "Q83 file no longer defines the same Ds list (informational; recomputed list used)")
    sel = histories.selected_orbit()
    c.check(sel["beta"] == {histories.SIGMA1_BETA} and sel["ties"] == {0} and sel["is_one_q24_orbit"],
            "unique lift sigma_1, no ties, one Q24 orbit")
    rows = gate_a.q89_rows()
    parsed = gate_a.q89_rows_parsed()
    c.record("Q89 rows", rows)
    c.record("Q89 file cross-check", "rows identical to the committed Q89 certificate" if parsed == rows
             else "Q89 file no longer defines the same rows (informational)")
    P3 = icosahedron()["P3"]
    R = [[Fraction(x) for x in r] for r in rows]

    # ---------------------------------------------------------------- Q88 over Q
    joint, per = gate_a.joint_rowspace(Ds, gate_a.FORBIDDEN_K)
    c.check(set(per.values()) == {2}, f"per-dictionary forbidden-mode rank 2: {per}")
    c.check(len(joint) == 3, f"joint forbidden-mode row space has dimension 3 (got {len(joint)})")
    c.check(rank(R) == 3 and rank(joint + R) == 3, "the three Q89 rows are a basis of the joint row space")
    c.check(all(matmul([r], P3)[0] == r for r in R), "rows lie in the row space of P3 (r P3 = r)")
    joint_ok, per_ok = gate_a.joint_rowspace(Ds, gate_a.ALLOWED_K)
    c.check(set(per_ok.values()) == {2} and len(joint_ok) == 4, "k in {6,18}: rank 2 per dictionary, 4 jointly")
    c.record("Q88 forbidden modes", f"K={gate_a.FORBIDDEN_K}: rank 2 per dictionary, joint rank 3 = span of the Q89 rows")
    # cross-method agreement with GPT's Q90 (1c3cf35): (I + P_sigma^2) M_D P3 has the same row space as Pi_K M_D P3
    from cathedral_engine.histories import M_matrix, dictionary_index
    s2 = [gate_a.sigma1()[gate_a.sigma1()[h]] for h in range(64)]
    for D in Ds:
        idx = dictionary_index(D)
        B = matmul([[Fraction(M_matrix()[i][k]) for k in range(20)] for i in idx], P3)
        Qd = [[B[h][k] + B[s2[h]][k] for k in range(20)] for h in range(64)]
        Rk = rref(gate_a.constraint_matrix(D))[0]
        c.check(rank(Qd) == 2 and rank(Qd + Rk) == 2, f"{D}: (I + P^2) M_D P3 and Pi_K M_D P3 share their row space")
    c.record("cross-check with GPT Q90", "(I + P_sigma^2) M_D P3 has the same 2-dim row space as Pi_K M_D P3 on all 8")

    # ---------------------------------------------------------------- Q88 over Q(sqrt3): the two mode pairs
    from cathedral_engine.clock import mode_class_projector
    T3 = RadicalTower(256)
    for D in Ds:
        idx = dictionary_index(D)
        MD = [[Fraction(M_matrix()[i][k]) for k in range(20)] for i in idx]
        base = matmul(MD, P3)
        spans = []
        for K in ((2, 22), (10, 14)):
            PK, rational = mode_class_projector(gate_a.sigma1(), K, T3)
            c.check(not rational, f"{K} projector is irrational (needs sqrt3)")
            A = [[sum((PK[i][j] * base[j][k] for j in range(64) if PK[i][j] and base[j][k]), T3.zero())
                  for k in range(20)] for i in range(64)]
            spans.append(A)
        r1, r2 = rank(spans[0]), rank(spans[1])
        both = rank(spans[0] + spans[1])
        c.check(r1 == r2 == both == 2, f"{D}: k in {{2,22}} and {{10,14}} give the same plane ({r1},{r2},{both})")
        Rq = [[T3.const(x) for x in r] for r in rref(gate_a.constraint_matrix(D))[0]]
        c.check(rank(spans[0] + Rq) == 2, f"{D}: that plane is the rational forbidden-mode plane")
    c.record("Q88 mode pairs", "per dictionary, k in {2,22} and k in {10,14} constrain the same plane (exact over Q(sqrt3))")

    # ---------------------------------------------------------------- Q89: the source family
    fam = gate_a.source_family_vectors()
    for j, r in enumerate(rows):
        for key in ("ZZ", "ZXY", "XYXY"):
            v = sum((fam[key][i] * r[i] for i in range(20)), fam[key][0] * 0)
            c.check(v.is_zero(), f"row {j} . ({key}) = {v}")
    c.record("Q89 family identities", "r_j . (CZ)^2 = r_j . (CZ)(CXY) = r_j . (CXY)^2 = 0, j = 0,1,2 (Q(sqrt5), 9 identities)")

    S = exact_source()
    T, x = S["T"], S["x"]
    P = vertices("icosahedron")
    st = S["st"]
    # solve x = a Z + b XY from vertices 8 (Z = -1, XY = 0) and 4 (Z = 0, XY = phi), then check all 12
    a = x[8] / st.q5(P[8][2])
    b = x[4] / st.q5(P[4][0] * P[4][1])
    for v in range(12):
        c.check((x[v] - a * st.q5(P[v][2]) - b * st.q5(P[v][0] * P[v][1])).is_zero(), f"x_{v} = a Z + b XY")
    c.record("source family", "x = Plinear(e0+e3) = a Z + b XY exactly on all 12 vertices")
    c.record("a (coefficient of raw Z)", T.decimal(a, 25) if T.sign(a) else "0")
    c.record("b (coefficient of raw XY)", T.decimal(b, 25) if T.sign(b) else "0")
    for j, r in enumerate(rows):
        v = sum((S["f"][i] * r[i] for i in range(20)), T.zero())
        c.check(v.is_zero(), f"direct: r_{j} . f is not the zero tower element: {v}")
    c.record("Q89 direct", "r_j . f = 0 exactly for the archived source, j = 0,1,2 (radical tower, no SymPy)")
    c.record("tower", T.describe())
print("Q88_Q89_ENGINE_RECOVERY_PASS")
