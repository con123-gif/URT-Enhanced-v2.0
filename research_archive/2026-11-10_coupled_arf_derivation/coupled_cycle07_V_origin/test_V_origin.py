#!/usr/bin/env python3
"""Coupled cycle 07: locate the printed V coefficients in repo history and archives."""
from __future__ import annotations
import json, subprocess, os
from pathlib import Path

OUT = Path("/workspace/arf_research/coupled_cycle07_V_origin")
REPO = Path("/workspace/arf_research/repo")
NEEDLES = [
    "0.490435304391",
    "4.16132699108",
    "1.961741217564",
    "0.490435",
    "4.161326",
    "1.961741",
    "490435304391",
]
ROOTS = [
    REPO,
    Path("/workspace/arf_research"),
    Path("/tmp"),
]


def run(cmd, cwd=None, timeout=120):
    p = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=timeout)
    return p.returncode, p.stdout, p.stderr


def main():
    code, branches, _ = run(["git", "branch", "-a"], cwd=REPO)
    code2, logS, _ = run(
        ["bash", "-lc", "git log -S '0.490435304391' --all --oneline; "
         "git log -S '0.490435' --all --oneline; "
         "git log -S '4.16132699108' --all --oneline; "
         "git log -S '1.961741217564' --all --oneline; "
         "git log -S 't2f2' --all --oneline; "
         "git log -S 'mixed derivative' --all --oneline"],
        cwd=REPO,
    )
    # grep working tree including notebooks, excluding our own cycle files and venv
    hits = []
    for needle in NEEDLES:
        code, out, err = run(
            ["rg", "-n", "-a", "-l", "--glob", "!**/.git/**", "--glob", "!**/venv*/**",
             needle, str(REPO), "/workspace/arf_research"],
            timeout=180,
        )
        files = [ln.strip() for ln in out.splitlines() if ln.strip()]
        # filter our own newly written files
        files = [f for f in files if "coupled_cycle02" not in f
                 and "coupled_cycle07" not in f
                 and "ANSWERS_A_to_E" not in f
                 and "coupled_cycle05" not in f
                 and "/LEDGER.md" not in f
                 and "2026-11-10_coupled_arf_derivation" not in f]
        hits.append({"needle": needle, "files": files})

    # notebooks specifically
    nb_hits = []
    code, out, _ = run(
        ["rg", "-n", "-a", "-l", "--glob", "*.ipynb",
         "0.490435|4.161326|1.961741|490435304391", str(REPO)],
        timeout=180,
    )
    nb_hits = [ln.strip() for ln in out.splitlines() if ln.strip()]

    # git grep across all commits (only branch is newtons-cathedral)
    code, revlist, _ = run(["git", "rev-list", "--all"], cwd=REPO)
    revs = [ln.strip() for ln in revlist.splitlines() if ln.strip()]
    grep_commits = []
    for rev in revs:
        code, out, _ = run(["git", "grep", "-l", "-F", "0.490435", rev], cwd=REPO, timeout=60)
        if out.strip():
            grep_commits.append({"rev": rev, "files": out.strip().splitlines()})

    # also search looser phrases in repo text
    code, phrase, _ = run(
        ["rg", "-n", "-a", "--glob", "!**/.git/**", "--glob", "!**/venv*/**",
         "t\\^2 f\\^2|t2f2|mixed derivative|0\\.4904",
         str(REPO / "research_archive")],
        timeout=180,
    )
    phrase_lines = [ln for ln in phrase.splitlines() if "2026-11-10_coupled_arf_derivation" not in ln][:40]

    any_external = any(h["files"] for h in hits) or bool(nb_hits) or bool(grep_commits)

    results = {
        "branches": branches.strip().splitlines(),
        "n_commits_all_branches": len(revs),
        "git_log_pickaxe": [ln for ln in logS.splitlines() if ln.strip()],
        "git_grep_all_commits": grep_commits,
        "working_tree_hits_excluding_this_programme": hits,
        "notebook_hits": nb_hits,
        "phrase_hits_research_archive": phrase_lines,
        "origin_found": bool(any_external),
        "classification": "PROVED" if any_external else "OPEN",
        "note": (
            "Origin located." if any_external else
            "Printed digits were not found in any commit of any branch, "
            "any Colab/ipynb under the clone, or any research_archive / "
            "drive_archive / backup file outside this programme's own reports."
        ),
        "advances_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    print("commits", len(revs), "branches", results["branches"])
    print("pickaxe", results["git_log_pickaxe"])
    print("grep commits", grep_commits)
    print("hits", hits)
    print("notebooks", nb_hits)
    print("classification", results["classification"])
    print("PASS: cycle 07 V origin search")


if __name__ == "__main__":
    main()
