"""python -m cathedral_engine {status | evidence | selftest | originals}

status     the resume view every session starts from: CI verdict, ACTIVE PROBLEM, open Queue items by lane,
           newest log entries' next steps, evidence-ledger health.
evidence   validate research_archive/cathedral_arf_runner/evidence.jsonl (exit 1 on malformed entries).
selftest   rebuild the core operators and check the archived invariants (a few seconds).
originals  re-hash the pinned original sources.
"""
from __future__ import annotations

import sys


def _status(lane: str | None) -> int:
    from .evidence import active_problem, check_ledger, ci_verdict, newest_log_entries, queue_items
    print("CI:", ci_verdict())
    print(active_problem())
    items = queue_items()
    open_items = [i for i in items if not i["done"]]
    print(f"\nOpen Queue items ({len(open_items)} of {len(items)}):")
    for i in open_items:
        if lane is None or i["lane"] == lane:
            print(f"  {i['id']} [{i['lane']}] ({i['gate']}) {i['text'][:150]}")
    print("\nNewest log entries:")
    for e in newest_log_entries(4):
        print(f"  {e['title']}\n    next: {e['next'][:200]}")
    led = check_ledger()
    print(f"\nEvidence ledger: {led['entries']} entries, {len(led['problems'])} problems, {len(led['stale'])} stale")
    for p in led["problems"] + led["stale"]:
        print("  -", p)
    return 0


def _selftest() -> int:
    import time
    t = time.perf_counter()
    from . import geometry as g, histories as h
    facts = g.hodge_dirac_facts()
    assert (facts["tr_D2"], facts["tr_D4"], facts["dim_ker"]) == (720, 3456, 10)
    assert h.hbits_spectrum() == {0: 2, 10: 12, 16: 30, 18: 20}
    assert len(h.a5_classes()) == 768 and len(h.q24_orbits()) == 96
    sel = h.selected_orbit()
    assert sel["beta"] == {h.SIGMA1_BETA} and len(sel["classes"]) == 8
    print(f"selftest ok in {time.perf_counter() - t:.2f} s; selected orbit {sel['classes'][0]} ...")
    return 0


def main(argv=None) -> int:
    argv = sys.argv[1:] if argv is None else argv
    cmd = argv[0] if argv else "status"
    if cmd == "status":
        lane = argv[argv.index("--lane") + 1] if "--lane" in argv else None
        return _status(lane)
    if cmd == "evidence":
        from .evidence import check_ledger
        r = check_ledger()
        print(r)
        return 1 if r["problems"] else 0
    if cmd == "selftest":
        return _selftest()
    if cmd == "originals":
        from .provenance import PORTED_SHA, verify_originals
        bad = 0
        for k, (exists, h, pin) in verify_originals().items():
            moved = "" if k not in PORTED_SHA else ("  (unchanged since port)" if h == PORTED_SHA[k]
                                                    else "  (CHANGED since port: re-run the regression tests)")
            print(f"{k}: exists={exists} sha256={h} pinned_ok={pin}{moved}")
            bad |= (not exists) or pin is False
        return 1 if bad else 0
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main())
