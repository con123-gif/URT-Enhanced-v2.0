#!/usr/bin/env python3
"""galois_rows RUN5 / covolume_premises RUN1 replay: checks pinned HEAD, that each quoted
token occurs on the stated line (whitespace-normalised) of the pinned checkout, prints blob ids,
and re-runs the repo-wide lexical census of the Row0b weakened clauses."""
import subprocess, sys, re, os, pathlib
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
root = sys.argv[1]; tsv = sys.argv[2]
ok = bad = 0
def git(*a): return subprocess.run(["git", "-C", root, *a], capture_output=True, text=True).stdout.strip()
head = git("rev-parse", "HEAD")
print("HEAD", head, "OK" if head == PIN else "MISMATCH"); ok, bad = (ok+1, bad) if head == PIN else (ok, bad+1)
norm = lambda s: re.sub(r"\s+", " ", s).strip()
for line in open(tsv, encoding="utf-8"):
    if not line.strip(): continue
    p, n, tok = line.rstrip("\n").split("\t")
    f = pathlib.Path(root, "src", p)
    try: L = f.read_text(encoding="utf-8").split("\n")[int(n)-1]
    except Exception as e: print("BAD", p, n, e); bad += 1; continue
    if norm(tok) in norm(L): ok += 1; print("ok", git("rev-parse", f"HEAD:src/{p}")[:12], f"{p}:{n}")
    else: bad += 1; print("BAD", f"{p}:{n}", "| line:", L[:160])
# census: every projection of the weakened clauses in the whole src tree
src = pathlib.Path(root, "src"); tame0 = []; qpbig = []
for f in src.rglob("*.lean"):
    t = f.read_text(encoding="utf-8", errors="replace")
    if ".tame0" in t or "IsQpBig" in t:
        for i, l in enumerate(t.split("\n"), 1):
            if re.search(r"\.tame0\b", l): tame0.append(f"{f.relative_to(src)}:{i}")
            if "IsQpBig" in l: qpbig.append(f"{f.relative_to(src)}:{i}")
print("CENSUS .tame0 projections:", len(tame0)); [print("  ", x) for x in sorted(tame0)]
print("CENSUS IsQpBig lines:", len(qpbig)); [print("  ", x) for x in sorted(qpbig)]
exp_t = 2; exp_q = 8
for name, got, exp in (("tame0", len(tame0), exp_t), ("IsQpBig", len(qpbig), exp_q)):
    if got == exp: ok += 1
    else: bad += 1; print("BAD census", name, got, "expected", exp)
print(f"checks ok={ok} bad={bad}")
sys.exit(1 if bad else 0)
