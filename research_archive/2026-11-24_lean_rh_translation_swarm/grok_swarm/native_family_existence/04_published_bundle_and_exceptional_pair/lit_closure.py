#!/usr/bin/env python3
"""Closure of the literature wrapper at the pinned revision.
Usage: lit_closure.py <path to EveryCharacterOfLiteratureOfVWin.lean>
Parses top-level `theorem UpperTheory.LiteratureTheorems.X (O : ...) : TYPE := BODY` declarations,
computes the set reachable from `every_character_of_literature_of_vWin` through
`_root_.UpperTheory.LiteratureTheorems.*` references, and for each reached declaration reports
its type, whether its body touches a field of O, and the non-wrapper constants its body uses."""
import re, sys, json
src = open(sys.argv[1], encoding="utf-8").read()
lines = src.split("\n")
decls = {}; order = []
cur = None
for i, l in enumerate(lines, 1):
    m = re.match(r"^(theorem|def|noncomputable def|abbrev|structure)\s+(\S+)", l)
    if m or l.startswith("end") or l.startswith("section"):
        if cur: decls[cur["name"]] = cur
        cur = None
        if m:
            cur = {"name": m.group(2), "line": i, "text": l}
            order.append(m.group(2))
    elif cur is not None:
        cur["text"] += "\n" + l
if cur: decls[cur["name"]] = cur
P = "UpperTheory.LiteratureTheorems."
def short(n): return n[len(P):] if n.startswith(P) else n
REF = re.compile(r"_root_\.UpperTheory\.LiteratureTheorems\.([A-Za-z0-9_']+)")
OFIELD = re.compile(r"\bO\.(caraianiLocalGlobalDual|localLanglandsExists|galoisRepOfPolarizedPairLit|1|2|3)\b|⟨[^⟩]*⟩\s*:=\s*O\b|cases\s+O|obtain[^\n]*:=\s*O\b")
info = {}
for n, d in decls.items():
    t = d["text"]
    head, sep, body = t.partition(":=") if ":=" in t.split("\n")[0] or " where" not in t.split("\n")[0] else t.partition(" where")
    typ = head.split(") :", 1)[1].strip() if ") :" in head else head
    refs = sorted(set(REF.findall(body)))
    ofld = sorted(set(m.group(0) for m in OFIELD.finditer(body)))
    ext = sorted(set(re.findall(r"(?<![\w.'])((?:_root_\.)?[A-Z][A-Za-z0-9_']*(?:\.[A-Za-z0-9_'₀-₉]+)+)", REF.sub("", body))))
    info[short(n)] = {"line": d["line"], "type": typ[:200], "refs": refs, "O_field_use": ofld, "external": ext}
root = "every_character_of_literature_of_vWin"
seen, stack = set(), [root]
while stack:
    x = stack.pop()
    if x in seen or x not in info: continue
    seen.add(x); stack.extend(info[x]["refs"])
missing = sorted({r for x in seen for r in info[x]["refs"] if r not in info})
ofuse = sorted(x for x in seen if info[x]["O_field_use"])
leaves = sorted(x for x in seen if not info[x]["refs"])
pub_types = sorted({info[x]["type"] for x in seen if "Published." in info[x]["type"]})
print(f"declarations parsed: {len(info)}; reachable from {root}: {len(seen)}; unresolved refs: {missing}")
print(f"reachable declarations whose body uses a field of O: {ofuse}")
for x in ofuse: print(f"  {x} (line {info[x]['line']}): {info[x]['O_field_use']}")
print(f"reachable declarations typed GlobalTheory.Published.*: {len(pub_types)}")
json.dump({"reachable": {x: info[x] for x in sorted(seen)}, "unreached": sorted(set(info) - seen)},
          open("lit_closure.json", "w"), indent=1, ensure_ascii=False)
print("leaves (no wrapper refs) and their producers:")
for x in leaves:
    print(f"  L{info[x]['line']:4d} {x} : {info[x]['type'][:90]}  <=  {', '.join(info[x]['external'])[:220]}")
