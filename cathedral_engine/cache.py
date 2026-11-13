"""Content-addressed cache for expensive exact objects.

Key = sha256 over (engine version, object name, sha256 of every engine source file, sha256 of each declared
original input file, the declared assumptions).  Any change to the engine code, to a pinned original or to an
assumption therefore produces a new key: a stale object can never be served.  Values are pickled to
``$CATHEDRAL_CACHE_DIR`` (default ``<repo>/.cathedral_cache``, git-ignored).  ``CATHEDRAL_CACHE=0`` disables the
disk layer.  ``STATS`` records hits, misses and build times for the benchmark reports.
"""
from __future__ import annotations

import json
import os
import pickle
import time
from pathlib import Path

from . import __version__
from .provenance import ORIGINALS, REPO, sha256_file

PKG = Path(__file__).resolve().parent
STATS = {"hits": 0, "misses": 0, "build_s": {}, "load_s": {}}
_MEMO: dict = {}


def cache_dir() -> Path:
    return Path(os.environ.get("CATHEDRAL_CACHE_DIR", REPO / ".cathedral_cache"))


def disk_enabled() -> bool:
    return os.environ.get("CATHEDRAL_CACHE", "1") != "0"


def engine_fingerprint() -> str:
    from .provenance import sha256_text
    parts = []
    for p in sorted(PKG.glob("*.py")):
        parts.append(f"{p.name}:{sha256_file(p)}")
    return sha256_text("\n".join(parts))


def cache_key(name: str, inputs=(), assumptions=None) -> str:
    from .provenance import sha256_text
    ins = {}
    for k in inputs:
        rel = ORIGINALS[k][0]
        p = REPO / rel
        ins[k] = sha256_file(p) if p.exists() else "absent"
    payload = {"engine": __version__, "name": name, "code": engine_fingerprint(), "inputs": ins,
               "assumptions": assumptions or {}}
    return sha256_text(json.dumps(payload, sort_keys=True, default=str))


def cached_call(name: str, fn, inputs=(), assumptions=None):
    key = cache_key(name, inputs, assumptions)
    if key in _MEMO:
        STATS["hits"] += 1
        return _MEMO[key]
    path = cache_dir() / f"{name}-{key[:20]}.pkl"
    if disk_enabled() and path.exists():
        t = time.perf_counter()
        try:
            with open(path, "rb") as fh:
                blob = pickle.load(fh)
            if blob.get("key") == key:
                STATS["hits"] += 1
                STATS["load_s"][name] = time.perf_counter() - t
                _MEMO[key] = blob["value"]
                return blob["value"]
        except Exception:
            pass
    STATS["misses"] += 1
    t = time.perf_counter()
    value = fn()
    STATS["build_s"][name] = time.perf_counter() - t
    _MEMO[key] = value
    if disk_enabled():
        try:
            cache_dir().mkdir(parents=True, exist_ok=True)
            tmp = path.with_suffix(".tmp")
            with open(tmp, "wb") as fh:
                pickle.dump({"key": key, "name": name, "assumptions": assumptions, "value": value}, fh)
            os.replace(tmp, path)
        except OSError:
            pass
    return value


def clear_memory():
    _MEMO.clear()
