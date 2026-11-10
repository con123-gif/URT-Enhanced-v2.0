#!/usr/bin/env python3
"""Q5 certificate: classify the 14 sweep-labelled /mnt/data sandbox-bound scripts.

Independent static analysis (Python stdlib only: ast, pathlib, os). It does not
import any archived research module and does not treat historical or measured
values as inputs.

The 14 paths are exactly those whose latest cathedral-research-state sweep.md
row is missing_file with detail starting \"sandbox path /mnt/data\"
(checkpoint of orchestrator run 42894969958, 2026-11-10T20:34:26Z).

A script is WRITE_ONLY if every /mnt/data filesystem use is a write, and
READ_INPUT if any /mnt/data use is a read (runpy.run_path, Path.read_text,
open(..., 'r'), etc.). WRITE_ONLY scripts are the ones that become runnable
once /mnt/data exists and is writable.

Exit status 0 iff the frozen classification holds (3 write-only, 11 read-input).
Prints the two groups, same-named archive copies of read targets, the proposed
one-line sweep change, and a /mnt writability probe.
"""
from __future__ import annotations

import ast
import os
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]

# The Q5 set: sweep.md missing_file rows whose detail is a /mnt/data sandbox path.
SCRIPTS = [
    "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/decoded_originals/URT_full_framework/source_archive/derive_a4_clifford_dirac.py",
    "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/decoded_originals/URT_full_framework/source_archive/urt_dirac_selection_audit.py",
    "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/decoded_originals/URT_full_framework/source_archive/urt_platonic_u2_holonomy.py",
    "research_archive/2026-10-25_golay_leech_selection/cathedral_golay_leech_selection_audit.py",
    "research_archive/2026-11-10_urt_arf_forward/audit/arf_full_five_charged_no_fit_nonuniqueness_2026_11_09.py",
    "research_archive/2026-11-10_urt_arf_forward/audit/arf_inter_sheet_current_pole_derivation_2026_11_09.py",
    "research_archive/2026-11-10_urt_arf_forward/audit/first_principles_arf_source_test.py",
    "research_archive/2026-11-10_urt_arf_forward/aux_tests/URT_HISTORY_CLOCK_INFORMATION_CURVATURE_2026-11-09.py",
    "research_archive/2026-11-10_urt_arf_forward/aux_tests/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py",
    "research_archive/2026-11-10_urt_arf_forward/aux_tests/URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py",
    "research_archive/2026-11-10_urt_arf_forward/aux_tests/cathedral_native_spatial_vacuum_audit_2026-11-09.py",
    "research_archive/2026-11-10_urt_arf_forward/new_gate/URT_ORIGINAL_190X64_DIAGONAL_CHARGE_AND_FIVE_SOLID_SECTORS_2026_11_10.py",
    "research_archive/2026-11-10_urt_arf_forward/new_gate/URT_TRANSFER_ITERATES_KMS_TEST_2026_11_10.py",
    "research_archive/Cathedral_v129_Universe_Fallout_2026-09-12/cathedral_v129_universe_fallout_verify.py",
]

WRITE_ONLY_EXPECTED = {
    "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/decoded_originals/URT_full_framework/source_archive/urt_platonic_u2_holonomy.py",
    "research_archive/2026-10-25_golay_leech_selection/cathedral_golay_leech_selection_audit.py",
    "research_archive/2026-11-10_urt_arf_forward/aux_tests/cathedral_native_spatial_vacuum_audit_2026-11-09.py",
}

PROPOSED_SWEEP_LINE = 'Path("/mnt/data").mkdir(parents=True, exist_ok=True)'
PROPOSED_LOCATION = (
    "research_archive/cathedral_arf_runner/orchestrator.py, function sweep(), "
    "immediately after the existing `out.mkdir(parents=True, exist_ok=True)`"
)


def _is_path_ctor(node: ast.AST) -> bool:
    if not isinstance(node, ast.Call):
        return False
    func = node.func
    if isinstance(func, ast.Name) and func.id == "Path":
        return True
    if isinstance(func, ast.Attribute) and func.attr == "Path":
        return True
    return False


def _is_run_path(node: ast.Call) -> bool:
    func = node.func
    if isinstance(func, ast.Name) and func.id == "run_path":
        return True
    if isinstance(func, ast.Attribute) and func.attr == "run_path":
        return True
    return False


def _is_open_call(node: ast.Call) -> bool:
    func = node.func
    if isinstance(func, ast.Name) and func.id == "open":
        return True
    if isinstance(func, ast.Attribute) and func.attr == "open":
        return True
    return False


def _const_str(node: ast.AST) -> str | None:
    if isinstance(node, ast.Constant) and isinstance(node.value, str):
        return node.value
    return None


def resolve_path(node: ast.AST, env: dict[str, str]) -> str | None:
    """Reconstruct a path expression that may mention /mnt/data."""
    s = _const_str(node)
    if s is not None:
        return s
    if isinstance(node, ast.Name) and node.id in env:
        return env[node.id]
    if _is_path_ctor(node) and node.args:
        return resolve_path(node.args[0], env)
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id == "str" and node.args:
        return resolve_path(node.args[0], env)
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
        left = resolve_path(node.left, env)
        right = resolve_path(node.right, env)
        if left is not None and right is not None:
            return left + right
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Div):
        left = resolve_path(node.left, env)
        right = resolve_path(node.right, env)
        if left is not None and right is not None:
            return str(Path(left) / right)
    if isinstance(node, ast.JoinedStr):
        parts: list[str] = []
        for value in node.values:
            piece = _const_str(value)
            if piece is None:
                return None
            parts.append(piece)
        return "".join(parts)
    return None


def is_mnt(path: str | None) -> bool:
    if path is None:
        return False
    return path == "/mnt/data" or path.startswith("/mnt/data/") or path.startswith("/mnt/data\\")


def collect_bindings(tree: ast.AST) -> dict[str, str]:
    env: dict[str, str] = {}
    for node in ast.walk(tree):
        if not isinstance(node, ast.Assign):
            continue
        value = resolve_path(node.value, env)
        if value is None or not is_mnt(value):
            continue
        for target in node.targets:
            if isinstance(target, ast.Name):
                env[target.id] = value
    return env


def open_mode(node: ast.Call) -> str:
    if len(node.args) >= 2:
        mode = _const_str(node.args[1])
        if mode is not None:
            return mode
    for kw in node.keywords:
        if kw.arg == "mode":
            mode = _const_str(kw.value)
            if mode is not None:
                return mode
    return "r"


def classify_script(rel: str) -> dict:
    path = REPO / rel
    text = path.read_text(encoding="utf-8")
    tree = ast.parse(text, filename=rel)
    env = collect_bindings(tree)
    uses: list[tuple[str, str, int]] = []  # kind, path, lineno

    for node in ast.walk(tree):
        if not isinstance(node, ast.Call):
            continue
        lineno = getattr(node, "lineno", 0)
        if _is_run_path(node) and node.args:
            target = resolve_path(node.args[0], env)
            if is_mnt(target):
                uses.append(("read", target, lineno))
            continue
        if _is_open_call(node) and node.args:
            target = resolve_path(node.args[0], env)
            if is_mnt(target):
                mode = open_mode(node)
                kind = "write" if any(c in mode for c in "wax+") else "read"
                # 'r+' is a read+write of an existing file: count as read of an input.
                if mode.startswith("r"):
                    kind = "read"
                uses.append((kind, target, lineno))
            continue
        if isinstance(node.func, ast.Attribute):
            target = resolve_path(node.func.value, env)
            if not is_mnt(target):
                continue
            attr = node.func.attr
            if attr in {"write_text", "write_bytes", "write", "touch", "mkdir"}:
                uses.append(("write", target, lineno))
            elif attr in {"read_text", "read_bytes", "read", "open", "exists", "read_json"}:
                # exists() is not a content read; still a dependence on a sandbox path
                # only if later used as input. We count content reads only.
                if attr != "exists":
                    uses.append(("read", target, lineno))

    literals = []
    for node in ast.walk(tree):
        s = _const_str(node)
        if s is not None and "/mnt/data" in s:
            literals.append(s)

    reads = [(p, ln) for kind, p, ln in uses if kind == "read"]
    writes = [(p, ln) for kind, p, ln in uses if kind == "write"]
    if reads:
        label = "READ_INPUT"
    elif writes:
        label = "WRITE_ONLY"
    else:
        label = "UNCLASSIFIED"
    return {
        "script": rel,
        "label": label,
        "reads": reads,
        "writes": writes,
        "literals": literals,
        "bindings": env,
    }


def archive_copies(basename: str) -> list[str]:
    hits: list[str] = []
    root = REPO / "research_archive"
    if not root.is_dir():
        return hits
    for p in root.rglob(basename):
        if p.is_file():
            hits.append(str(p.relative_to(REPO)))
    hits.sort()
    return hits


def probe_mnt() -> dict:
    mnt = Path("/mnt")
    data = Path("/mnt/data")
    return {
        "mnt_exists": mnt.exists(),
        "mnt_writable": os.access("/mnt", os.W_OK) if mnt.exists() else False,
        "data_exists": data.exists(),
        "data_writable": os.access("/mnt/data", os.W_OK) if data.exists() else False,
    }


def main() -> int:
    errors: list[str] = []
    if len(SCRIPTS) != 14:
        errors.append(f"internal list length {len(SCRIPTS)} != 14")
    if len(WRITE_ONLY_EXPECTED) != 3:
        errors.append(f"internal write-only expectation {len(WRITE_ONLY_EXPECTED)} != 3")

    reports = []
    for rel in SCRIPTS:
        path = REPO / rel
        if not path.is_file():
            errors.append(f"missing script {rel}")
            continue
        report = classify_script(rel)
        reports.append(report)
        if not report["literals"]:
            errors.append(f"{rel}: no /mnt/data string literal")
        if report["label"] == "UNCLASSIFIED":
            errors.append(f"{rel}: no classified /mnt/data I/O")
        if report["label"] == "WRITE_ONLY" and rel not in WRITE_ONLY_EXPECTED:
            errors.append(f"{rel}: classified WRITE_ONLY but not in the expected set")
        if report["label"] == "READ_INPUT" and rel in WRITE_ONLY_EXPECTED:
            errors.append(f"{rel}: classified READ_INPUT but expected WRITE_ONLY")
        if rel in WRITE_ONLY_EXPECTED and report["reads"]:
            errors.append(f"{rel}: expected write-only but has reads {report['reads']}")

    write_only = [r for r in reports if r["label"] == "WRITE_ONLY"]
    read_input = [r for r in reports if r["label"] == "READ_INPUT"]
    if len(write_only) != 3:
        errors.append(f"write-only count {len(write_only)} != 3")
    if len(read_input) != 11:
        errors.append(f"read-input count {len(read_input)} != 11")
    got_write = {r["script"] for r in write_only}
    if got_write != WRITE_ONLY_EXPECTED and not any("WRITE_ONLY" in e for e in errors):
        errors.append(f"write-only set mismatch: {sorted(got_write ^ WRITE_ONLY_EXPECTED)}")

    print("Q5 sandbox-bound script classification")
    print(f"scripts analysed: {len(reports)}")
    print(f"WRITE_ONLY: {len(write_only)}")
    print(f"READ_INPUT: {len(read_input)}")
    print()
    print("=== WRITE_ONLY (runnable if /mnt/data exists and is writable) ===")
    for r in write_only:
        targets = ", ".join(f"{p} (line {ln})" for p, ln in r["writes"])
        print(f"  {r['script']}")
        print(f"    writes: {targets}")
    print()
    print("=== READ_INPUT (hardcoded /mnt/data inputs; mkdir is not enough) ===")
    read_basenames: set[str] = set()
    for r in read_input:
        print(f"  {r['script']}")
        for p, ln in r["reads"]:
            print(f"    reads: {p} (line {ln})")
            read_basenames.add(Path(p).name)
        for p, ln in r["writes"]:
            print(f"    also writes: {p} (line {ln})")
    print()
    print("=== same-named files already in research_archive/ (informational) ===")
    for name in sorted(read_basenames):
        copies = archive_copies(name)
        if copies:
            print(f"  {name}:")
            for c in copies:
                print(f"    {c}")
        else:
            print(f"  {name}: no committed copy")
    print()
    print("=== proposed one-line sweep change ===")
    print(f"  line: {PROPOSED_SWEEP_LINE}")
    print(f"  where: {PROPOSED_LOCATION}")
    print("  This unblocks only the three WRITE_ONLY scripts, and only if the")
    print("  process can actually create a writable /mnt/data. On this machine")
    print("  /mnt is root-owned, so the bare mkdir raises PermissionError.")
    print("  A matching workflow pre-create (`sudo mkdir -p /mnt/data &&")
    print("  sudo chmod a+rwx /mnt/data`) is required on typical GitHub")
    print("  hosted runners; this certificate does not edit workflows.")
    print()
    probe = probe_mnt()
    print("=== /mnt probe (no directory is created) ===")
    for key, value in probe.items():
        print(f"  {key}: {value}")
    print()
    if errors:
        print("FAIL")
        for e in errors:
            print(f"  - {e}")
        return 1
    print("PASS: 3 write-only, 11 read-input; proposed sweep line recorded.")
    print("Status class: CLOSED INTERNALLY (archive-health classification only).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
