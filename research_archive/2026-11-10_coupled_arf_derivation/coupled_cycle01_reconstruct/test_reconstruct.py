#!/usr/bin/env python3
"""Coupled cycle 01: reconstruct original 190, 64, 24 operators from the repo."""
from __future__ import annotations
import json
from pathlib import Path
import numpy as np

SRC = Path(
    "/workspace/arf_research/repo/research_archive/"
    "2026-11-07_joint_interacting_native/"
    "cathedral_constructed_joint_dynamics_2026_11_07.py"
)
text = SRC.read_text()
marker = "rng=np.random.default_rng(20261107)"
gbl = {}
exec(compile(text.split(marker)[0], str(SRC), "exec"), gbl)

checks = {}

def rec(name, ok, detail):
    checks[name] = {"ok": bool(ok), "detail": detail}

D = gbl["D"]; Cbridge = gbl["Cbridge"]; Hbits = gbl["Hbits"]
Uh = gbl["Uh"]; P3 = gbl["P3"]; P5 = gbl["P5"]
Plinear = gbl["Plinear"]; C = gbl["C"]
phi, r, theta, Delta, eta, N = (gbl[k] for k in ("phi","r","theta","Delta","eta","N"))
names = gbl["names"]; geom = gbl["geom"]

rec("D_shape", D.shape == (190, 190), str(D.shape))
rec("Tr_D2", abs(np.trace(D @ D) - 720) < 1e-8, float(np.trace(D @ D)))
rec("Tr_D4", abs(np.trace(D @ D @ D @ D) - 3456) < 1e-6, float(np.trace(np.linalg.matrix_power(D, 4))))
rec("Cbridge_trace", abs(np.trace(Cbridge) - 160) < 1e-8, float(np.trace(Cbridge)))
VFEs = [(geom[n]["V"], geom[n]["E"], geom[n]["F"]) for n in names]
rec("V_E_F_totals", (sum(v for v,_,_ in VFEs), sum(e for _,e,_ in VFEs), sum(f for *_,f in VFEs)) == (50, 90, 50), VFEs)
rec("N24", N == 24, N)

ew = np.sort(np.linalg.eigvalsh(Hbits))
def count_near(val):
    return int(np.sum(np.abs(ew - val) < 1e-8))
spec = {0: count_near(0), 10: count_near(10), 16: count_near(16), 18: count_near(18)}
rec("Hbits_spectrum", spec == {0: 2, 10: 12, 16: 30, 18: 20}, spec)

Ph = P3 + P5
rec("Uh_isometry", float(np.linalg.norm(Uh.T @ Uh - Ph)) < 1e-10, float(np.linalg.norm(Uh.T @ Uh - Ph)))
rec("trace_P3", abs(np.trace(P3) - 4) < 1e-10, float(np.trace(P3)))
rec("trace_P5", abs(np.trace(P5) - 4) < 1e-10, float(np.trace(P5)))
rec("Hbits_Uh_P3", float(np.linalg.norm(Hbits @ Uh @ P3 - 18 * Uh @ P3)) < 1e-9,
    float(np.linalg.norm(Hbits @ Uh @ P3 - 18 * Uh @ P3)))
rec("Hbits_Uh_P5", float(np.linalg.norm(Hbits @ Uh @ P5 - 16 * Uh @ P5)) < 1e-9,
    float(np.linalg.norm(Hbits @ Uh @ P5 - 16 * Uh @ P5)))
rec("Plinear_rank", int(np.linalg.matrix_rank(Plinear, tol=1e-10)) == 8,
    int(np.linalg.matrix_rank(Plinear, tol=1e-10)))
rec("Plinear_shape", Plinear.shape == (12, 50), Plinear.shape)
rec("C_shape", C.shape == (20, 12), C.shape)

ms = np.arange(24)
gaps1 = 2 - 2 * np.cos(theta - 2 * np.pi * ms / 24)
gaps2 = 2 - 2 * np.cos(2 * theta - 2 * np.pi * ms / 24)
m1 = int(np.argmin(gaps1)); m2 = int(np.argmin(gaps2))
rec("clock_m1", m1 == 9, m1)
rec("clock_m2", m2 == 18, m2)
rec("b1b2_all_solids", all(np.max(np.abs(geom[n]["b1"] @ geom[n]["b2"])) < 1e-12 for n in names), True)

all_ok = all(v["ok"] for v in checks.values())
result = {
    "source": str(SRC),
    "checks": checks,
    "all_ok": all_ok,
    "constants": {"phi": float(phi), "r": float(r), "theta": float(theta),
                  "Delta": float(Delta), "eta": float(eta)},
    "classification": "PROVED" if all_ok else "FALSIFIED",
    "advances_ARF": False,
}
Path("/workspace/arf_research/coupled_cycle01_reconstruct/results.json").write_text(
    json.dumps(result, indent=2) + "\n"
)
print(json.dumps({"all_ok": all_ok, "failed": [k for k,v in checks.items() if not v["ok"]],
                  "classification": result["classification"],
                  "n_checks": len(checks)}, indent=2))
print("PASS" if all_ok else "FAIL")
