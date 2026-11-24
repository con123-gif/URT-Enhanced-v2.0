#!/usr/bin/env python3
"""galois_rows RUN6 / covolume_premises RUN2 replay.
Usage: RUN6_replay_checks.py <pinned riemann-hypothesis checkout> <RUN6_replay_checks.tsv>
1. HEAD equals the pin.
2. Each quoted token occurs on the stated line (whitespace-normalised); prints blob ids.
3. The 30 PublishedHodgeBundleTheorems wrapper bodies (28 fields + 2 helper wrappers they call)
   contain no projection `O.<field>` of OpenLiteratureStatements (body = lines up to the next `theorem`).
4. Census of the textual projection `.aut.gal` in src (informational count; expectation set from
   the observed run and disclosed in the log)."""
import subprocess, sys, re, pathlib
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
root = sys.argv[1]; tsv = sys.argv[2]; ok = bad = 0
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
F = pathlib.Path(root, "src", "Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean")
L = F.read_text(encoding="utf-8").split("\n")
ws = ("toroidal_compactification vol_ge vol_nef ar_calc abelian_de_rham ray_class_field_st semistable_reduction_st "
      "strong_approx_su green_series_st good_chern_weil landherr_st hasse_norm_st semi_abelian_hom_extension "
      "induced_simple_lowest_alcove principal_polarisation_one_section ab_mul_n_st grothendieck_messing "
      "prismatic_dieudonne_hodge kawamata_viehweg nef_numerics l2_extension_log_canonical arith_hilbert_samuel "
      "chow_form_exists cycle_heights serre_holomorphic_sections nadel_vanishing_and_non_klt_divisor principalisation "
      "formal_algebraisation grothendieck_deformation abelian_lifting").split()
for w in ws:
    tok = f"theorem UpperTheory.LiteratureTheorems.{w}_of_literature (O :"
    idx = [k for k, x in enumerate(L) if tok in x]
    if len(idx) != 1: bad += 1; print("BAD wrapper not unique", w, len(idx)); continue
    i = idx[0]; j = i + 1
    while j < len(L) and not L[j].startswith(("theorem ", "end", "def ", "structure ")): j += 1
    body = " ".join(L[i+1:j]); proj = re.findall(r"\bO\.[A-Za-z_]+", body)
    if proj: bad += 1; print("BAD wrapper projects O:", w, proj)
    else: ok += 1; print(f"ok wrapper {w}_of_literature line {i+1}: no O.<field> in body ({j-i-1} line(s))")
src = pathlib.Path(root, "src"); hits = []
for f in src.rglob("*.lean"):
    t = f.read_text(encoding="utf-8", errors="replace")
    if ".aut.gal" in t:
        for k, l in enumerate(t.split("\n"), 1):
            if re.search(r"\.aut\.gal\b", l): hits.append(f"{f.relative_to(src)}:{k}")
print("CENSUS .aut.gal projections:", len(hits)); [print("  ", x) for x in sorted(hits)]
EXP = int(sys.argv[3]) if len(sys.argv) > 3 else None
if EXP is not None:
    if len(hits) == EXP: ok += 1
    else: bad += 1; print("BAD census", len(hits), "expected", EXP)
print(f"checks ok={ok} bad={bad}")
sys.exit(1 if bad else 0)
