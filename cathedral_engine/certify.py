"""Certificate helpers: fail-on-error checks, timing, provenance stamp, JSON report."""
from __future__ import annotations

import json
import os
import platform
import sys
import time
from pathlib import Path

from . import __version__
from .provenance import sha256_file


class Certificate:
    """with Certificate("Q88", __file__) as c: c.check(cond, msg); c.record(key, value)"""

    def __init__(self, name: str, script: str):
        self.name, self.script = name, Path(script).resolve()
        self.checks, self.report, self.t0 = 0, {}, None

    def __enter__(self):
        self.t0 = time.perf_counter()
        return self

    def check(self, cond, msg: str):
        self.checks += 1
        if not cond:
            print(f"FAIL [{self.name}]: {msg}", flush=True)
            raise SystemExit(1)

    def record(self, key: str, value):
        self.report[key] = value
        print(f"{key}: {value}", flush=True)

    def __exit__(self, et, ev, tb):
        if et is not None:
            return False
        wall = time.perf_counter() - self.t0
        stamp = {"certificate": self.name, "script": str(self.script.name), "script_sha256": sha256_file(self.script),
                 "engine": __version__, "python": platform.python_version(), "checks": self.checks,
                 "wall_s": round(wall, 3), "report": self.report}
        if os.environ.get("CATHEDRAL_RESULT_DIR"):
            out = Path(os.environ["CATHEDRAL_RESULT_DIR"]) / f"{self.name}.json"
            try:
                out.parent.mkdir(parents=True, exist_ok=True)
                out.write_text(json.dumps(stamp, indent=2, default=str) + "\n")
            except OSError:
                pass
        print(f"{self.name}: all {self.checks} checks passed in {wall:.2f} s", flush=True)
        return False


def repo_on_path(script: str):
    root = Path(script).resolve()
    while not (root / "cathedral_engine").exists():
        if root.parent == root:
            raise RuntimeError("repository root not found")
        root = root.parent
    if str(root) not in sys.path:
        sys.path.insert(0, str(root))
    return root
