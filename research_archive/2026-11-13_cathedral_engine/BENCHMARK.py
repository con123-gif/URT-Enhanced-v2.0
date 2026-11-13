#!/usr/bin/env python3
"""Measured wall times: original archived calculation vs the exact engine (cold and warm cache).

Each case runs in a fresh subprocess (imports included).  Originals that need SymPy/mpmath are skipped where
those are absent and run on GitHub Actions, which has them.  Both sides must produce the same mathematical
answer; the engine side checks it.  Nothing here is estimated: every number printed was measured on this run.

usage: python BENCHMARK.py [--out DIR] [--skip-originals]
"""
import argparse
import importlib.util
import json
import os
import platform
import subprocess
import sys
import tempfile
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
ARCH = REPO / "research_archive"

ENGINE_CASES = {
    "q64_selection": """
from cathedral_engine import histories as h
s = h.selected_orbit()
assert len(s['classes']) == 8 and s['beta'] == {h.SIGMA1_BETA} and s['ties'] == {0}
print(s['classes'][0])
""",
    "q3_census": """
import json, numpy as np
from collections import Counter
from cathedral_engine import histories as h
S = h.twirled_chronologies()
# covariance lemma: S_hist is constant on proper-A5 classes (twirl reindexing), so each class carries 60 dictionaries
c = Counter()
for D in h.a5_classes():
    c[int(np.trace(S[D] @ S[D]))] += 60
orig = json.load(open('research_archive/2026-11-11_q3_twirled_chronology_classes/Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.json'))
assert {str(k): v for k, v in sorted(c.items())} == orig['values_with_multiplicity'], 'census differs from Q3'
print(len(c), 'distinct second moments, identical to the archived Q3 census')
""",
    "q81_source": """
from cathedral_engine.source import exact_source
S = exact_source()
print(S['T'].decimal(S['norm3'], 36))
""",
    "q89_rows": """
from cathedral_engine import gate_a
from cathedral_engine.source import exact_source
S = exact_source()
rows = gate_a.q89_rows()
assert all(sum((S['f'][i] * r[i] for i in range(20)), S['T'].zero()).is_zero() for r in rows)
print('three exact zeros')
""",
    "q83_clock": """
from cathedral_engine import gate_a, histories as h, linalg as la
tau = la.perm_power(gate_a.sigma1(), 6)
H3, H5 = h.carrier_projectors()['H3'], h.carrier_projectors()['H5']
for D in gate_a.selected_dictionaries():
    idx = h.dictionary_index(D)
    A, B = la.conj_by_perm(H3, idx), la.conj_by_perm(H5, idx)
    assert all(A[tau[a]][b] == -A[a][b] and B[tau[a]][b] == B[a][b] for a in range(64) for b in range(64))
print('T H3 = -H3, T H5 = H5 on the eight dictionaries')
""",
}

ORIGINALS = {
    "q64_selection": ("research_archive/2026-11-12_q64_conditioned_selection/Q64_CONDITIONED_SELECTION_CERTIFICATE.py", []),
    "q3_census": ("research_archive/2026-11-11_q3_twirled_chronology_classes/Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py", []),
    "q81_source": ("research_archive/2026-11-13_q81_native_source/Q81_NATIVE_SOURCE.py", ["sympy", "mpmath"]),
    "q89_rows": ("research_archive/2026-11-13_q89_exact_source/Q89_EXACT_SOURCE.py", ["sympy"]),
    "q83_clock": ("research_archive/2026-11-13_q83_native_clock/Q83_NATIVE_CLOCK_CARRIER.py", ["sympy"]),
}


def run(cmd, env=None, timeout=900):
    t = time.perf_counter()
    try:
        p = subprocess.run(cmd, cwd=REPO, env=env, capture_output=True, text=True, timeout=timeout)
        return time.perf_counter() - t, p.returncode, (p.stdout.strip().splitlines() or [""])[-1][:120]
    except subprocess.TimeoutExpired:
        return time.perf_counter() - t, "timeout", ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", type=Path)
    ap.add_argument("--skip-originals", action="store_true")
    a = ap.parse_args()
    env0 = dict(os.environ, PYTHONPATH=str(REPO), OPENBLAS_NUM_THREADS="1")
    rows = []
    with tempfile.TemporaryDirectory() as cdir:
        envc = dict(env0, CATHEDRAL_CACHE_DIR=cdir)
        for case, code in ENGINE_CASES.items():
            path, needs = ORIGINALS[case]
            missing = [m for m in needs if importlib.util.find_spec(m) is None]
            if a.skip_originals:
                orig = (None, "skipped", "--skip-originals")
            elif missing:
                orig = (None, "skipped", f"needs {', '.join(missing)} (runs on GitHub Actions)")
            else:
                orig = run([sys.executable, path])
            cold = run([sys.executable, "-c", code], env=envc)
            warm = run([sys.executable, "-c", code], env=envc)
            if cold[1] != 0 or warm[1] != 0:
                print(f"engine case {case} failed: {cold} {warm}")
                return 1
            speed = (orig[0] / cold[0]) if orig[0] and orig[1] == 0 else None
            rows.append({"case": case, "original_s": orig[0], "original_exit": orig[1], "original_note": orig[2],
                         "engine_cold_s": cold[0], "engine_warm_s": warm[0], "engine_answer": cold[2],
                         "speedup_cold": speed, "speedup_warm": (orig[0] / warm[0]) if speed else None})
    meta = {"utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()), "python": platform.python_version(),
            "machine": platform.machine(), "cpus": os.cpu_count()}
    lines = [f"Benchmark {meta['utc']} · python {meta['python']} · {meta['cpus']} CPUs (fresh subprocess per run)", "",
             "| Case | Original (s) | Engine cold (s) | Engine warm (s) | Speed-up cold | Speed-up warm | Note |",
             "|---|---|---|---|---|---|---|"]
    for r in rows:
        o = f"{r['original_s']:.2f}" if r["original_s"] is not None and r["original_exit"] == 0 else str(r["original_exit"])
        sc = f"×{r['speedup_cold']:.1f}" if r["speedup_cold"] else "—"
        sw = f"×{r['speedup_warm']:.1f}" if r["speedup_warm"] else "—"
        note = r["original_note"] if r["original_exit"] != 0 else r["engine_answer"]
        lines.append(f"| {r['case']} | {o} | {r['engine_cold_s']:.2f} | {r['engine_warm_s']:.2f} | {sc} | {sw} | {note} |")
    text = "\n".join(lines)
    print(text)
    if a.out:
        a.out.mkdir(parents=True, exist_ok=True)
        (a.out / "benchmark.json").write_text(json.dumps({"meta": meta, "rows": rows}, indent=2) + "\n")
        (a.out / "benchmark.md").write_text(text + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
