#!/usr/bin/env python3
"""Assemble the three explicit mathematical junction proofs in one file.

This is source preparation only. The separate replay must check every named
declaration and guard with the original HeightLe and normal kernel enabled.
"""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
INPUTS = ["C2_SIGNED_HEIGHT_ROOT.lean", "C2_ARCHIMEDEAN_ALGEBRAICITY.lean",
          "C2_SINGLE_WITNESS_PRODUCT_FORMULA.lean"]
EXTERNAL = {"New.Heights.Heights", "Lib.General.LinearAlgebra.CommonEigenvectors",
            "Mathlib.Tactic", "Lean"}
INTERNAL = {"C2SignedHeightRoot", "C2ArchAlgebraicity"}


def blob(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()


def main():
    imports, bodies, records = [], [], []
    for filename in INPUTS:
        raw = (HERE / filename).read_bytes()
        records.append({"source": filename, "source_blob": blob(raw),
                        "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()})
        body = []
        for line in raw.decode().splitlines():
            if line.startswith("import "):
                name = line.removeprefix("import ").strip()
                if name not in EXTERNAL | INTERNAL:
                    raise ValueError("Unexpected import: " + name)
                if name in EXTERNAL and name not in imports:
                    imports.append(name)
            else:
                body.append(line)
        bodies.append("-- Exact body from " + filename + "\n" + "\n".join(body))
    code = "\n".join("import " + name for name in imports) + "\n\n"
    code += "/-! Assembled source; preparation is not native proof acceptance. -/\n\n"
    code += "\n\n".join(bodies) + "\n"
    raw = code.encode()
    (HERE / "C2_SINGLE_WITNESS_COMBINED.lean").write_bytes(raw)
    manifest = {"inputs": records, "combined_source_blob": blob(raw),
                "combined_sha256": hashlib.sha256(raw).hexdigest(),
                "combined_bytes": len(raw), "new_Lean_execution": False,
                "full_RH_replay": False}
    (HERE / "C2_SINGLE_WITNESS_COMPOSITION.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps(manifest))


if __name__ == "__main__":
    main()
