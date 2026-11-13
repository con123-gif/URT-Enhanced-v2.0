"""Provenance: the original archived sources each engine operator reproduces, pinned by sha256.

``ORIGINALS`` is the single index of canonical source files.  ``verify_originals()`` re-hashes them, so a test
fails loudly if a pinned original changes.  ``load_definitions`` executes selected top-level definitions of an
original file *unmodified* (parsed with ``ast``), so regression tests compare the engine against the archived
code itself rather than against a paraphrase, even when the original file's other imports are unavailable.
"""
from __future__ import annotations

import ast
import hashlib
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
ARCHIVE = REPO / "research_archive"

ORIGINALS = {
    "joint_action_2026_11_07": (
        "research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py",
        "5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd",
        "all-five solids, 190 Hodge-Dirac, harmonic moments, Eglobal/Iico/Plinear, hidden_source, M, Uh, Hbits"),
    "q3_twirl": (
        "research_archive/2026-11-11_q3_twirled_chronology_classes/Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py",
        None, "geometric A5 action on the 64 axis codes; Q2; twirled chronology census"),
    "q24_nosympy": (
        "research_archive/2026-11-11_q24_history_symmetries/native_source_nosympy.py",
        None, "sympy-free Q11 rebuild: icosahedron, faces, pairs, proper rotations, P5"),
    "q61_lifts": (
        "research_archive/2026-11-12_q61_inverse_limit_lifts/Q61_INVERSE_LIMIT_LIFTS_CERTIFICATE.py",
        None, "lifts sigma_beta, signed dictionaries, index(h, D), 768 A5 classes, Q24 ops, exceptional orbits"),
    "q62_carrier": (
        "research_archive/2026-11-12_q62_lift_carrier/Q62_LIFT_CARRIER_CERTIFICATE.py",
        None, "P8 = M Ph M^T / 2, H13 = Walsh 0+6+1 + V5"),
    "q64_selection": (
        "research_archive/2026-11-12_q64_conditioned_selection/Q64_CONDITIONED_SELECTION_CERTIFICATE.py",
        None, "twirled chronology S_D in history coordinates; conditioned likelihood; selected orbit 1"),
    "q81_source": (
        "research_archive/2026-11-13_q81_native_source/Q81_NATIVE_SOURCE.py",
        None, "exact radical form of the all-five source (SymPy)"),
    "q83_clock": (
        "research_archive/2026-11-13_q83_native_clock/Q83_NATIVE_CLOCK_CARRIER.py",
        None, "sigma_1 permutation, T = P^6, the eight selected dictionaries, H3/H5 carriers"),
    "q89_source": (
        "research_archive/2026-11-13_q89_exact_source/Q89_EXACT_SOURCE.py",
        None, "three Q88 integer rows and the exact source cancellation (SymPy)"),
}


# sha256 of each original at the time it was ported (informational: behaviour, not bytes, is regression-tested,
# so a harmless repair of an agent's certificate does not break the engine's gating tests).
PORTED_SHA = {
    "q3_twirl": "4dcb5301d98dfd945c14d8db218acb18722f96ad29556dcce096b6783008b904",
    "q24_nosympy": "27ada4b6c848bdf6fcd20a98a95c3efb8f7fd06079ad5b0a800993db35b082d9",
    "q61_lifts": "c033ae0130a45b329102f587d24abb90765eebe8a87b022387fd0674d214a38a",
    "q62_carrier": "60652f30a1473f6f80c8b09dcfc9fd391137225693617f23d7f5d531aec6caf1",
    "q64_selection": "225228a6d87d6efc8785d336753375da34a35dc0106dc4496df32391135c87d5",
    "q81_source": "6ddc0bfac24a6a71a2100cb8f3affb074fc1e5cc1ec893ea76b0cc1bdee22ede",
    "q83_clock": "b532b9b0714bb8553ea8d43404331afdb67c28dbb3e76816b9b3b4cc07995d12",
    "q89_source": "eae470764ac8e5ba620017d935460d482a31b6c2f95f202aca2d81ec2c792f43",
}


def sha256_file(path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode()).hexdigest()


def original_path(key: str) -> Path:
    return REPO / ORIGINALS[key][0]


def verify_originals() -> dict:
    """{key: (exists, sha256, pinned_ok)}; pinned_ok is None where no pin is recorded."""
    out = {}
    for key, (rel, pin, _) in ORIGINALS.items():
        p = REPO / rel
        if not p.exists():
            out[key] = (False, None, False)
            continue
        h = sha256_file(p)
        out[key] = (True, h, None if pin is None else h == pin)
    return out


def load_definitions(path, names, extra_globals=None) -> dict:
    """Execute the named top-level functions/assignments of an original file, unmodified, in a fresh namespace.

    Only nodes whose name is in ``names`` (plus all import statements that succeed) are executed, in source
    order.  Returns the namespace.
    """
    src = Path(path).read_text()
    tree = ast.parse(src)
    ns = dict(extra_globals or {})
    ns.setdefault("__name__", "cathedral_original")
    wanted = set(names)
    for node in tree.body:
        if isinstance(node, (ast.Import, ast.ImportFrom)):
            try:
                exec(compile(ast.Module([node], []), str(path), "exec"), ns)
            except ImportError:
                pass
            continue
        target = None
        if isinstance(node, (ast.FunctionDef, ast.ClassDef)):
            target = node.name
        elif isinstance(node, ast.Assign) and len(node.targets) == 1 and isinstance(node.targets[0], ast.Name):
            target = node.targets[0].id
        if target in wanted:
            exec(compile(ast.Module([node], []), str(path), "exec"), ns)
    missing = wanted - set(ns)
    if missing:
        raise KeyError(f"definitions not found in {path}: {sorted(missing)}")
    return ns
