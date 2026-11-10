#!/usr/bin/env python3
"""Q6 certificate: producer map for the 10 remaining non-/mnt/data missing_file scripts.

Independent static analysis (Python stdlib only: ast, hashlib, pathlib). It does
not import any archived research module and does not treat historical or
measured values as inputs.

The 10 (script, missing file) pairs are exactly the latest cathedral-research-state
sweep.md missing_file rows whose detail is not a sandbox path /mnt/data
(orchestrator run 42903908099, 2026-11-10T21:31:28Z, commit d0eb5ed). The other
14 missing_file rows are the Q5 /mnt/data set.

A producer is another research_archive/**/*.py that writes the missing basename
(np.savez / savez_compressed / save, Path.write_text / write_bytes, open in a
write mode, shutil copy/replace). The consumer itself is not counted.

Exit status 0 iff the frozen classification holds:
  * exactly one basename-level producer (golden_species_derivation.py writes
    golden_species_operators.npz next to itself);
  * zero producers write any of the 10 files at the path the consumer opens;
  * therefore no sweep reordering unblocks any of the 10.
"""
from __future__ import annotations

import ast
import hashlib
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]

# (consumer relative to repo, sweep-reported missing file relative to repo)
CONSUMERS: list[tuple[str, str]] = [
    (
        "research_archive/2026-10-17_h64_quadratic_koide_phase/urt_h64_quadratic_phase_derivation.py",
        "research_archive/2026-10-17_h64_quadratic_koide_phase/golden_species_operators.npz",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/combined_source_work/photon/correlated_long_transfer.py",
        "research_archive/2026-10-17_original_oct08_source/joint_vacuum_work/photon/correlated_hat_k5_checks.json",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/combined_source_work/species/combined_signed_source.py",
        "research_archive/2026-10-17_original_oct08_source/flavour_work_v2/outer_history_operators.npz",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents.py",
        "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/theory_input_v5.md",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/common_action_work/photon/translated_photon_response.py",
        "research_archive/2026-10-17_original_oct08_source/derive_three_work/photon/a4_entropy_gaussian.py",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/common_action_work/review/source_response_dictionary.py",
        "research_archive/2026-10-17_original_oct08_source/response_join_work/normalization/compact_source_normalization_operators.npz",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_derivation.py",
        "research_archive/2026-10-17_original_oct08_source/flavour_work_v2/grounded_charged_amplitude_operators.npz",
    ),
    (
        "research_archive/2026-10-17_original_oct08_source/final_join_work/matter/full_period_physical.py",
        "research_archive/2026-10-17_original_oct08_source/combined_source_work/recovery/combined_chat_recovery.json",
    ),
    (
        "research_archive/2026-10-17_source_h64_joint_flux/joint_urt_h64_joint_holonomy_and_mass.py",
        "research_archive/2026-10-17_source_h64_joint_flux/original_h64_species_link_source.npz",
    ),
    (
        "research_archive/URT_Nature_Checkpoint_2026-08-25/urt_blocked_numpy_compat.py",
        "research_archive/URT_Nature_Checkpoint_2026-08-25/full_library/run_endpoint_test.py",
    ),
]

EXPECTED_BASENAME_PRODUCER = (
    "research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_derivation.py",
    "golden_species_operators.npz",
    "research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_operators.npz",
)

GOLDEN_COPIES = [
    "research_archive/2026-10-17_exact_14D_H64_reduction/golden_species_operators.npz",
    "research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_operators.npz",
    "research_archive/2026-10-17_source_first_recovery/golden_species_operators.npz",
]
GOLDEN_SHA256 = "9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b"

ENDPOINT_COPY = "research_archive/run_endpoint_test.py"
NEAR_NAME = (
    "research_archive/2026-10-17_source_h64_joint_flux/original_h64_species_link_source.npz",
    "research_archive/2026-10-17_source_h64_joint_flux/joint_original_h64_species_link_source.npz",
)

RESTORE = "research_archive/2026-10-17_recovery_assets/restore_matrices.py"
WRITE_ATTRS = {
    "savez", "savez_compressed", "save", "write_text", "write_bytes",
    "write", "copy", "copy2", "copyfile", "move", "replace",
}


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _const_str(node: ast.AST) -> str | None:
    if isinstance(node, ast.Constant) and isinstance(node.value, str):
        return node.value
    return None


def _is_path_ctor(node: ast.AST) -> bool:
    if not isinstance(node, ast.Call):
        return False
    func = node.func
    if isinstance(func, ast.Name) and func.id == "Path":
        return True
    if isinstance(func, ast.Attribute) and func.attr == "Path":
        return True
    return False


def _is_open_call(node: ast.Call) -> bool:
    func = node.func
    if isinstance(func, ast.Name) and func.id == "open":
        return True
    if isinstance(func, ast.Attribute) and func.attr == "open":
        return True
    return False


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


def is_write_call(node: ast.Call) -> bool:
    if _is_open_call(node):
        return any(ch in open_mode(node) for ch in "wax+")
    func = node.func
    if isinstance(func, ast.Name):
        return func.id in WRITE_ATTRS
    if isinstance(func, ast.Attribute):
        return func.attr in WRITE_ATTRS
    return False


def resolve_path(node: ast.AST, env: dict[str, str], script: Path) -> str | None:
    s = _const_str(node)
    if s is not None:
        return s
    if isinstance(node, ast.Name) and node.id in env:
        return env[node.id]
    if _is_path_ctor(node) and node.args:
        return resolve_path(node.args[0], env, script)
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id == "str" and node.args:
        return resolve_path(node.args[0], env, script)
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute):
        recv = resolve_path(node.func.value, env, script)
        if recv is None:
            return None
        if node.func.attr == "resolve":
            return recv
        if node.func.attr == "parent":
            return str(Path(recv).parent)
        return None
    if isinstance(node, ast.Attribute) and node.attr == "parent":
        recv = resolve_path(node.value, env, script)
        return str(Path(recv).parent) if recv is not None else None
    if isinstance(node, ast.Attribute) and node.attr == "parents":
        return resolve_path(node.value, env, script)
    if isinstance(node, ast.Subscript):
        base = resolve_path(node.value, env, script)
        if base is None:
            return None
        idx = node.slice
        if isinstance(idx, ast.Constant) and isinstance(idx.value, int):
            path = Path(base)
            try:
                return str(path.parents[idx.value] if path.name or idx.value >= 0 else path)
            except IndexError:
                return None
        return None
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
        left = resolve_path(node.left, env, script)
        right = resolve_path(node.right, env, script)
        if left is not None and right is not None:
            return left + right
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Div):
        left = resolve_path(node.left, env, script)
        right = resolve_path(node.right, env, script)
        if left is not None and right is not None:
            return str(Path(left) / right)
    if isinstance(node, ast.Name) and node.id == "__file__":
        return str(script)
    return None


def collect_bindings(tree: ast.AST, script: Path) -> dict[str, str]:
    env: dict[str, str] = {}
    for node in ast.walk(tree):
        if not isinstance(node, ast.Assign):
            continue
        value = resolve_path(node.value, env, script)
        if value is None:
            continue
        for target in node.targets:
            if isinstance(target, ast.Name):
                env[target.id] = value
    return env


def list_data_targets(restore: Path) -> list[str]:
    tree = ast.parse(restore.read_text(encoding="utf-8"))
    for node in tree.body:
        if not isinstance(node, ast.Assign):
            continue
        if len(node.targets) != 1 or not isinstance(node.targets[0], ast.Name):
            continue
        if node.targets[0].id != "DATA_TARGETS":
            continue
        if not isinstance(node.value, (ast.List, ast.Tuple)):
            continue
        out: list[str] = []
        for elt in node.value.elts:
            s = _const_str(elt)
            if s is not None:
                out.append(s)
        return out
    return []


def rel_to_repo(path: str) -> str:
    raw = Path(path)
    try:
        return str(raw.resolve().relative_to(REPO))
    except Exception:
        text = path.replace("\\", "/")
        marker = "research_archive/"
        if marker in text:
            return text[text.index(marker):]
        return text


def find_writes(script_rel: str, basename: str) -> list[str]:
    path = REPO / script_rel
    try:
        source = path.read_text(encoding="utf-8")
    except OSError:
        return []
    try:
        tree = ast.parse(source)
    except SyntaxError:
        return []
    env = collect_bindings(tree, path)
    found: list[str] = []
    for node in ast.walk(tree):
        if not isinstance(node, ast.Call) or not is_write_call(node):
            continue
        candidates = list(node.args[:2])
        if isinstance(node.func, ast.Attribute):
            candidates.append(node.func.value)
        for kw in node.keywords:
            if kw.arg in {None, "file", "filename", "dst", "dst_dir"}:
                candidates.append(kw.value)
        for cand in candidates:
            resolved = resolve_path(cand, env, path)
            if resolved is None:
                continue
            if Path(resolved).name == basename or resolved.endswith("/" + basename):
                found.append(rel_to_repo(resolved))
    return sorted(set(found))


def archive_py_files() -> list[Path]:
    root = REPO / "research_archive"
    return sorted(
        p for p in root.rglob("*.py")
        if p.resolve() != Path(__file__).resolve()
    )


def archive_copies(basename: str) -> list[str]:
    return sorted(
        str(p.relative_to(REPO)).replace("\\", "/")
        for p in (REPO / "research_archive").rglob(basename)
        if p.is_file()
    )


def main() -> int:
    errors: list[str] = []
    if len(CONSUMERS) != 10:
        errors.append(f"internal consumer list length {len(CONSUMERS)} != 10")

    missing_basenames = [Path(missing).name for _, missing in CONSUMERS]
    if len(set(missing_basenames)) != 10:
        errors.append("internal missing-file basenames are not unique")

    for script, missing in CONSUMERS:
        if not (REPO / script).is_file():
            errors.append(f"missing consumer script {script}")
        if (REPO / missing).exists():
            errors.append(f"sweep-reported missing file unexpectedly present: {missing}")

    py_files = archive_py_files()
    basename_hits: list[tuple[str, str, str]] = []
    exact_hits: list[tuple[str, str, str]] = []
    expected_by_base = {Path(missing).name: missing for _, missing in CONSUMERS}
    consumers_by_base = {Path(missing).name: script for script, missing in CONSUMERS}
    bases = set(expected_by_base)

    for py in py_files:
        rel = str(py.relative_to(REPO)).replace("\\", "/")
        try:
            text = py.read_text(encoding="utf-8")
        except OSError:
            continue
        mentioned = [basename for basename in bases if basename in text]
        if not mentioned:
            continue
        for basename in mentioned:
            if rel == consumers_by_base[basename]:
                continue
            writes = find_writes(rel, basename)
            for dest in writes:
                basename_hits.append((rel, basename, dest))
                if dest == expected_by_base[basename]:
                    exact_hits.append((rel, basename, dest))

    if len(exact_hits) != 0:
        errors.append(f"expected 0 exact-path producers, found {exact_hits}")

    expected_triple = EXPECTED_BASENAME_PRODUCER
    if len(basename_hits) != 1:
        errors.append(f"expected 1 basename-level producer, found {basename_hits}")
    elif basename_hits[0] != expected_triple:
        errors.append(f"basename producer mismatch: {basename_hits[0]} != {expected_triple}")

    restore_targets = list_data_targets(REPO / RESTORE)
    if not restore_targets:
        errors.append(f"{RESTORE}: DATA_TARGETS not parsed")
    overlap = [t for t in restore_targets if t in {m for _, m in CONSUMERS}]
    if overlap:
        errors.append(f"{RESTORE} writes a Q6 missing file: {overlap}")

    golden_on_disk = archive_copies("golden_species_operators.npz")
    if golden_on_disk != GOLDEN_COPIES:
        errors.append(f"golden_species_operators.npz copies {golden_on_disk} != {GOLDEN_COPIES}")
    for rel in GOLDEN_COPIES:
        path = REPO / rel
        if not path.is_file():
            errors.append(f"missing committed copy {rel}")
            continue
        digest = sha256_file(path)
        if digest != GOLDEN_SHA256:
            errors.append(f"{rel} sha256 {digest} != {GOLDEN_SHA256}")

    if not (REPO / ENDPOINT_COPY).is_file():
        errors.append(f"missing same-named copy {ENDPOINT_COPY}")
    if (REPO / NEAR_NAME[0]).exists():
        errors.append(f"near-name target unexpectedly present: {NEAR_NAME[0]}")
    if not (REPO / NEAR_NAME[1]).is_file():
        errors.append(f"missing near-name file {NEAR_NAME[1]}")

    no_copy = [
        Path(missing).name
        for _, missing in CONSUMERS
        if Path(missing).name not in {
            "golden_species_operators.npz",
            "run_endpoint_test.py",
        }
        and not archive_copies(Path(missing).name)
    ]
    expected_no_copy = {
        "correlated_hat_k5_checks.json",
        "outer_history_operators.npz",
        "theory_input_v5.md",
        "a4_entropy_gaussian.py",
        "compact_source_normalization_operators.npz",
        "grounded_charged_amplitude_operators.npz",
        "combined_chat_recovery.json",
        "original_h64_species_link_source.npz",
    }
    if set(no_copy) != expected_no_copy:
        errors.append(f"no-copy set {sorted(no_copy)} != {sorted(expected_no_copy)}")

    print("Q6 missing-intermediate producer map")
    print(f"consumers analysed: {len(CONSUMERS)}")
    print(f"exact-path producers: {len(exact_hits)}")
    print(f"basename-level producers: {len(basename_hits)}")
    print()
    print("=== producer -> consumer (basename only; paths differ) ===")
    if basename_hits:
        producer, basename, dest = basename_hits[0]
        consumer = consumers_by_base[basename]
        expected = expected_by_base[basename]
        print(f"  {producer}")
        print(f"    writes: {dest}")
        print(f"    consumer: {consumer}")
        print(f"    consumer opens: {expected}")
        print("    sweep ordering: none. The producer writes next to itself,")
        print("    where a committed copy already exists; the consumer looks")
        print("    in its own directory. Running the producer first would not")
        print("    place the file at the path the consumer opens. The producer")
        print("    itself is one of these 10 consumers and cannot run.")
    else:
        print("  (none)")
    print()
    print("=== no producer at the consumer path (all 10) ===")
    for script, missing in CONSUMERS:
        print(f"  {script}")
        print(f"    missing: {missing}")
    print()
    print("=== same-named committed copies (informational) ===")
    print("  golden_species_operators.npz:")
    for rel in GOLDEN_COPIES:
        print(f"    {rel}  sha256 {GOLDEN_SHA256}")
    print(f"  run_endpoint_test.py:")
    print(f"    {ENDPOINT_COPY}")
    print("  original_h64_species_link_source.npz: no file of that name;")
    print(f"    near-name in the same folder: {NEAR_NAME[1]}")
    print()
    print("=== restore_matrices.py ===")
    print(f"  {RESTORE} DATA_TARGETS ({len(restore_targets)}):")
    for t in restore_targets:
        print(f"    {t}")
    print("  None of those is a Q6 missing file. Restore explains why the")
    print("  quadratic-phase and full-period scripts fail on their *second*")
    print("  input (the first is reconstructed from the split .partXX blobs).")
    print()
    print("=== sweep ordering ===")
    print("  No reordering of the archive sweep can unblock any of these 10")
    print("  scripts: no archived script writes the missing file at the path")
    print("  the consumer opens.")
    print()
    if errors:
        print("FAIL")
        for e in errors:
            print(f"  - {e}")
        return 1
    print("PASS: 1 basename-only producer, 0 exact-path producers;")
    print("no sweep reordering unblocks the 10 remaining missing_file scripts.")
    print("Status class: CLOSED INTERNALLY (archive-health classification only).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
