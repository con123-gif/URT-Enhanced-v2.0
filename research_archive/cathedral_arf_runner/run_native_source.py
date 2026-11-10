#!/usr/bin/env python3
"""Execute the archived native charged-matter source without editing it.

The archived script
  research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents.py
is pinned by sha256 in research_archive/2026-10-17_recovery_assets/RECOVERY_MANIFEST.json,
so it must stay byte-identical.

It hashes a provenance file, common_action_work/recovery/theory_input_v5.md, that is
NOT in the repository. Executed unmodified it computes every operator, writes the
NPZ, then raises FileNotFoundError while hashing that file, before it writes its
checks JSON. The mathematics never reads the file; only the provenance hash does.

This shim:
  1. restores the split H64 matrix snapshot (restore_matrices.py, sha256-checked);
  2. verifies the archived script against its pinned sha256 and refuses to run a
     modified copy;
  3. executes the archived source with exactly two provenance-only substitutions,
     so a missing file is recorded as "ABSENT_FROM_REPOSITORY" instead of being
     given an invented hash;
  4. writes a sidecar provenance record stating what was substituted.

No numerical line of the archived computation is altered.
"""
from __future__ import annotations

import hashlib
import json
import runpy
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MATTER = REPO / "research_archive/2026-10-17_original_oct08_source/common_action_work/matter"
SCRIPT = MATTER / "microscopic_source_currents.py"
PINNED_SHA256 = "a2564f6d93b428b6c2aad7b7556ee48b2c498bba7c09c4c1a47d19a93e0eead5"
RESTORE = REPO / "research_archive/2026-10-17_recovery_assets/restore_matrices.py"
SIDECAR = MATTER / "microscopic_source_currents_shim_provenance.json"

# (original text, replacement) — each must occur exactly once in the pinned source.
SUBSTITUTIONS = [
    ('"current_spec_snapshot_sha256":sha(SPEC)',
     '"current_spec_snapshot_sha256":_sha_or_absent(SPEC)'),
    (':sha(p) for p in [SOURCE,GAUGE,HISTORY,SPEC]}',
     ':_sha_or_absent(p) for p in [SOURCE,GAUGE,HISTORY,SPEC]}'),
]

HELPER = '''
def _sha_or_absent(p):
    p = Path(p)
    if not p.is_file():
        return "ABSENT_FROM_REPOSITORY"
    return hashlib.sha256(p.read_bytes()).hexdigest()
'''


def main() -> int:
    # 1. byte-exact restoration of the H64 history operators (idempotent)
    sys.argv = [str(RESTORE), "--repo-root", str(REPO)]
    runpy.run_path(str(RESTORE), run_name="__main__")

    # 2. refuse a modified archive
    raw = SCRIPT.read_bytes()
    actual = hashlib.sha256(raw).hexdigest()
    if actual != PINNED_SHA256:
        raise SystemExit(f"REFUSED: archived script sha256 {actual} != pinned {PINNED_SHA256}")

    # 3. provenance-only substitutions
    src = raw.decode("utf-8")
    for old, new in SUBSTITUTIONS:
        n = src.count(old)
        if n != 1:
            raise SystemExit(f"REFUSED: expected exactly one occurrence of {old!r}, found {n}")
        src = src.replace(old, new)
    anchor = "def norm(a):"
    if src.count(anchor) != 1:
        raise SystemExit("REFUSED: helper anchor not unique")
    src = src.replace(anchor, HELPER.lstrip() + "\n" + anchor)

    spec = REPO / "research_archive/2026-10-17_original_oct08_source/common_action_work/recovery/theory_input_v5.md"
    record = {
        "archived_script": str(SCRIPT.relative_to(REPO)),
        "archived_script_sha256": actual,
        "pinned_sha256_matches": True,
        "substitutions": [{"from": o, "to": n} for o, n in SUBSTITUTIONS],
        "reason": "provenance file absent from repository; hash recorded as ABSENT_FROM_REPOSITORY, not invented",
        "spec_file": str(spec.relative_to(REPO)),
        "spec_file_present": spec.is_file(),
        "numerical_lines_modified": 0,
    }
    SIDECAR.write_text(json.dumps(record, indent=2) + "\n")

    # 4. execute as __main__ with the archived file's own path semantics
    code = compile(src, str(SCRIPT), "exec")
    sys.argv = [str(SCRIPT)]
    g = {"__name__": "__main__", "__file__": str(SCRIPT), "__builtins__": __builtins__}
    exec(code, g)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
