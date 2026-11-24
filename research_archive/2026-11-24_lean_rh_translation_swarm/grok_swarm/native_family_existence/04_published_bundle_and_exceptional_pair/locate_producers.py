#!/usr/bin/env python3
"""Locate the defining file of every constant used by the reachable literature-wrapper declarations.
Usage: locate_producers.py <src root> lit_closure.json
Method (source-level, approximate): a constant N = A.B.c is located at a declaration line
`theorem|lemma|def|abbrev|instance|structure X` with X ending in the longest suffix of N that,
combined with the file's `namespace` lines, reconstructs N. Classifies the file path as
PublishedTheorems/ or not. Field projections (e.g. `.2.2`, `.heightProjection`) are resolved to their head constant."""
import json, re, subprocess, sys, os, collections
root, cj = sys.argv[1], sys.argv[2]
R = json.load(open(cj))["reachable"]
consts = set()
for v in R.values():
    for e in v["external"]:
        e = e.replace("_root_.", "")
        if e.startswith("GlobalTheory.Published.") and e.count(".") == 2 and e.split(".")[-1][:1].isupper():
            continue  # a Prop name used as a type, not a producer
        consts.add(e)
lasts = sorted({c.split(".")[-1] for c in consts} | {c.split(".")[-2] for c in consts if c.count(".") >= 2})
pat = r"^\s*(@\[[^\]]*\]\s*)?((private|protected|noncomputable)\s+)*(theorem|lemma|def|abbrev|instance|structure)\s+(\S+)"
out = subprocess.run(["rg", "-n", "--no-heading", "-g", "*.lean", pat, root], capture_output=True, text=True).stdout
decl_by_last = collections.defaultdict(list)
want = set(lasts)
for line in out.splitlines():
    f, ln, rest = line.split(":", 2)
    m = re.match(pat, rest)
    if not m: continue
    name = m.group(5).replace("_root_.", "").rstrip(":")
    last = name.split(".")[-1]
    if last in want: decl_by_last[last].append((f, int(ln), name))
ns_cache = {}
def namespaces_at(f, ln):
    if f not in ns_cache:
        ns_cache[f] = open(f, encoding="utf-8", errors="replace").read().split("\n")
    stack = []
    for l in ns_cache[f][:ln-1]:
        m = re.match(r"^namespace\s+(\S+)", l)
        if m: stack.append(m.group(1))
        m = re.match(r"^end\s+(\S+)", l)
        if m and stack and stack[-1] == m.group(1): stack.pop()
    return ".".join(stack)
def locate(c):
    parts = c.split(".")
    # strip trailing projections like .1 .2 or lowercase field after a Capitalised structure-valued constant
    cands = [c]
    while len(parts) > 1 and (parts[-1].isdigit()):
        parts = parts[:-1]; cands.append(".".join(parts))
    if len(parts) > 2: cands.append(".".join(parts[:-1]))
    for cc in cands:
        last = cc.split(".")[-1]
        for f, ln, name in decl_by_last.get(last, []):
            ns = namespaces_at(f, ln)
            full = (ns + "." + name) if ns and not name.startswith(ns) else name
            if full == cc or full.endswith("." + cc) or cc.endswith(full) and full.count(".") >= 1 and cc == full:
                return cc, os.path.relpath(f, os.path.dirname(root)), ln
    return None
rows = []; unresolved = []
for c in sorted(consts):
    r = locate(c)
    if r: rows.append((c,) + r)
    else: unresolved.append(c)
pub = [r for r in rows if "/PublishedTheorems/" in r[2]]
print(f"producer constants: {len(consts)}; located: {len(rows)}; unresolved: {len(unresolved)}")
print(f"located in a PublishedTheorems/ directory: {len(pub)}")
for r in pub: print(f"  PUB {r[0]}  ->  {r[2]}:{r[3]}")
by_top = collections.Counter(r[2].split("/")[1] + "/" + r[2].split("/")[2] for r in rows)
print("located files by top-level area:", dict(by_top.most_common()))
print("unresolved (not located by this source-level method):")
for u in unresolved: print("  ", u)
json.dump({"located": rows, "unresolved": unresolved}, open("producers.json", "w"), indent=1, ensure_ascii=False)
