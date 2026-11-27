#!/usr/bin/env python3
"""Compare complete native/interpreted exports by every named graph record.

Graph traversal order and JSON object-key order are immaterial. Every field
and every array entry within each record must agree exactly. This checks
exporter compatibility, not a new proof or whole-RH coverage. The existing
independent reference/axiom verifier remains required for both exports.
"""
import argparse
import gzip
import hashlib
import json
from pathlib import Path


def execution_engine(receipt):
    """Identify a successful engine from its actual flags or recorded command."""
    if receipt.get("returncode") != 0:
        raise ValueError("Graph execution did not finish successfully")
    engine = None
    if "native_graph_execution" in receipt or "new_Lean_execution" in receipt:
        if receipt.get("native_graph_execution") is True and receipt.get("new_Lean_execution") is False:
            engine = "native"
        elif receipt.get("native_graph_execution") is False and receipt.get("new_Lean_execution") is True:
            engine = "interpreted"
        else:
            raise ValueError("Incomplete or contradictory execution flags")
    argv = receipt.get("argv")
    command_engine = None
    if isinstance(argv, list) and argv:
        executable = Path(str(argv[0])).name
        if executable == "native_graph":
            command_engine = "native"
        elif executable == "lean" and any(str(arg).endswith(".lean") for arg in argv[1:]):
            command_engine = "interpreted"
    if engine is not None and command_engine is not None and engine != command_engine:
        raise ValueError("Execution flags disagree with the recorded command")
    if engine is None:
        engine = command_engine
    if engine is None:
        raise ValueError("Execution receipt does not identify an engine")
    return engine


def validate_execution_modes(interpreted, native):
    first, second = execution_engine(interpreted), execution_engine(native)
    if first != "interpreted":
        raise ValueError("Interpreted graph receipt records " + first + " execution")
    if second != "native":
        raise ValueError("Native graph receipt records " + second + " execution")
    return {"interpreted": first, "native": second}


def read_graph(path):
    records = {}
    header = footer = None
    digest = hashlib.sha256()
    opener = gzip.open if path.suffix == ".gz" else open
    with opener(path, "rb") as stream:
        for line in stream:
            digest.update(line)
            row = json.loads(line)
            if footer is not None:
                raise ValueError("Data after footer: " + str(path))
            kind = row.get("record")
            if kind == "header":
                if header is not None or records:
                    raise ValueError("Duplicate or misplaced header: " + str(path))
                if row.get("schema") != "compact-kernel-union-v1":
                    raise ValueError("Unexpected graph schema: " + str(path))
                header = row
            elif header is None:
                raise ValueError("Missing initial header: " + str(path))
            elif kind == "footer":
                footer = row
            elif kind in ("node", "missing"):
                name = json.dumps(row["id"], ensure_ascii=False, separators=(",", ":"))
                if name in records:
                    raise ValueError("Duplicate graph node: " + name)
                canonical = json.dumps(row, sort_keys=True, ensure_ascii=False,
                                       separators=(",", ":")).encode()
                records[name] = hashlib.sha256(canonical).digest()
            else:
                raise ValueError("Unexpected graph record: " + str(kind))
    if header is None or footer is None:
        raise ValueError("Incomplete graph stream: " + str(path))
    if footer.get("nodes") != len(records) or footer.get("missing") != 0:
        raise ValueError("Incomplete node inventory: " + str(path))
    return header, footer, records, digest.hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--interpreted", type=Path, required=True)
    parser.add_argument("--native", type=Path, required=True)
    parser.add_argument("--interpreted-execution", type=Path, required=True,
                        help="Actual successful interpreted Lean command receipt")
    parser.add_argument("--native-execution", type=Path, required=True,
                        help="Actual successful native runtime receipt")
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    result = {"all_checks_pass": False, "execution_modes_valid": False, "full_RH_replay": False,
              "scope": "complete graph-record compatibility for the listed local roots"}
    try:
        raw_interpreted = args.interpreted_execution.read_bytes()
        raw_native = args.native_execution.read_bytes()
        modes = validate_execution_modes(json.loads(raw_interpreted), json.loads(raw_native))
        result.update(execution_modes_valid=True, execution_modes=modes,
                      interpreted_execution_sha256=hashlib.sha256(raw_interpreted).hexdigest(),
                      native_execution_sha256=hashlib.sha256(raw_native).hexdigest())
        ih, it, ir, ish = read_graph(args.interpreted)
        nh, nt, nr, nsh = read_graph(args.native)
        absent = set(ir) - nr.keys()
        extra = set(nr) - ir.keys()
        different = {key for key in ir.keys() & nr.keys() if ir[key] != nr[key]}
        result.update(interpreted_nodes=len(ir), native_nodes=len(nr),
                      interpreted_sha256=ish, native_sha256=nsh,
                      headers_equal=ih == nh, footers_equal=it == nt,
                      absent_count=len(absent), extra_count=len(extra),
                      different_record_count=len(different),
                      mismatch_examples=sorted(absent | extra | different)[:12],
                      roots=ih["roots"],
                      all_checks_pass=ih == nh and it == nt and not (absent or extra or different))
    except (OSError, ValueError, KeyError, TypeError) as exc:
        result["error"] = str(exc)
    args.out.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(result, ensure_ascii=False))
    if result["all_checks_pass"] is not True:
        raise SystemExit(1)


if __name__ == "__main__":
    main()

