#!/usr/bin/env python3
"""Coupled cycle 24: evaluate non-pairing ratios only if cycle 22 fixed ye."""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle24_nonpairing_ratios")
C22 = ROOT / "coupled_cycle22_ye_normalisation"
PRED_SHA = "a04f1c7d7d22f040c0c2ece666d747c6c5389378e3fe72d2a0f6f2d0f69488fc"

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
C3 = 0.25 - 1.0 / (2.0 * (18.0 + ((np.pi / np.e) ** 2) * (4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2)))
C5 = 0.25 - 1.0 / (2.0 * (16.0 + ((np.pi / np.e) ** 2) * (4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2)))
C_ODD = C3
C_EVEN = (DELTA_GEOM ** 2) * C5
N_NUC = 4.640379972803843


def main():
    c22 = json.loads((C22 / "results.json").read_text())
    formulas = {
        "g_star": "ye**2 * N / (4 * c_even)",
        "E_3": "g_star * sqrt(2/15)",
        "E_6pm": "g_star * sqrt(1/6) +/- sqrt(5)",
        "E_2": "g_star * sqrt(3/10)",
        "R13": "13 / E_3",
        "R_odd": "sqrt(2*c_odd) / E_3",
        "N": N_NUC,
        "c_even": C_EVEN,
        "c_odd": C_ODD,
        "at_ye_equals_1_E_3": float((N_NUC / (4.0 * C_EVEN)) * np.sqrt(2.0 / 15.0)),
        "at_ye_equals_1_R13": float(13.0 / ((N_NUC / (4.0 * C_EVEN)) * np.sqrt(2.0 / 15.0))),
        "at_ye_equals_1_R_odd": float(np.sqrt(2.0 * C_ODD) / ((N_NUC / (4.0 * C_EVEN)) * np.sqrt(2.0 / 15.0))),
        "scale": "all non-pairing ratios listed run as 1/ye**2",
    }
    if c22.get("ye_status") != "FIXED":
        out = {
            "integrity": {"predeclaration_sha256": PRED_SHA},
            "classification": "DID_NOT_RUN",
            "reason": "cycle 22 classified y_even as %s; no unique derived scale"
            % c22.get("ye_status"),
            "ARF_comparison_performed": False,
            "symbolic_formulas": formulas,
            "advances_physical_ARF": False,
        }
        (OUT / "results.json").write_text(json.dumps(out, indent=2) + "\n")
        print(json.dumps(out, indent=2))
        return
    raise RuntimeError("FIXED branch not implemented in this run: unexpected ye_status")


if __name__ == "__main__":
    main()
