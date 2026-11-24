#!/usr/bin/env python3
"""Static provenance and report checks for the TopG/VWin bridge checkpoint."""

from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"

SOURCES = {
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean": "c51cb6b5bd4bf2944ace89e00a2990da16bd519a",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ShapeOf.lean": "236d0eadd60b292bd0a832114f8c4a6253131250",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean": "3f791ca182db235c4a8ff582d3f038019320d5cd",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean": "54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/Supply.lean": "b104f034fc9c13758e280d1b7d33ac1ea370663a",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean": "398eb8ed3528aa2666e9d3b2b09a582ad4390dd7",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean": "339885b77069601fb716a60739369805241e8222",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean": "d98214b25bf84966a5b4e858a35f21ac9193b49f",
    "src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean": "15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/DivinNOfHypV.lean": "5321920359316653b7627951429a6d7555c311b0",
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean": "2dc9b4e690951c66ffe443e279fcada259bcce13",
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean": "ed60b4b997cd4703713660b185b9e43fd95559a1",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean": "97cbdce9fcc91c4f0dcc25fef62daf4c95724afa",
}

TOKENS = {
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean": [
        "zero_free_all_of_green_v_win", "zeroFreeAll_of_topG (la := 3 / 2)", "supplyChi ψ (hV ψ)"
    ],
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ShapeOf.lean": [
        "forall_goal_of_shape_of_hyps", "divRows3G_iff", "serv_t_iff_formalism_serv_t"
    ],
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean": [
        "shape_closed_link_n_of_green", "UpperTheory.Top.topDesWin"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean": [
        "def TopG", "theorem hypV_of_cls", "theorem eFamC_of_cls", "zeroFreeOn_of_tiedWin_cyc"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/Supply.lean": [
        "def cls (la : ℝ)", "def GChi", "EAtH", "VVle"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean": [
        "def VWinAt", "def VWin : Prop := ∀ ψ : PChar, VWinAt ψ 401", "def VAt"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean": [
        "VWinAt ψ 401", "HostExW (3 / 2)", "admissibleClassesTwistedChar"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean": [
        "theorem UpperTheory.Top.supplyOfAdm", "s.x ^ (2 + 8 * eps)", "KerChi ψ"
    ],
    "src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean": ["admissibleClassesTwistedChar"],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/DivinNOfHypV.lean": [
        "def HypV", "def FamilyClassConnected"
    ],
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean": [
        "theorem UpperTheory.Comparison₂.formB", "zeroFree_of_rpow_window"
    ],
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean": [
        "def ZeroFreeOn", "def ZeroFreeAll"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean": [
        "theorem UpperTheory.Top.imprimitive", "LFunction_changeLevel"
    ],
}

REPORT_TOKENS = [
    "PINNED source ledger".lower(),
    "3 / 2",
    "Ct = 401",
    "VWinAt",
    "FamilyClassConnected",
    "primitive boundary",
    "Executed tests",
    "Failed attempts and limitations",
    "RESUME HERE",
]


def git_blob_sha(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode()
    return hashlib.sha1(header + data).hexdigest()


def self_test() -> None:
    sample = b"TopG-VWin provenance\n"
    expected = hashlib.sha1(f"blob {len(sample)}\0".encode() + sample).hexdigest()
    assert git_blob_sha(sample) == expected
    assert git_blob_sha(sample + b"mutated") != expected
    assert PIN == "40e56bab026552e089d7afcfeff08d2defb9c005"
    assert len(SOURCES) == 13 and set(SOURCES) == set(TOKENS)
    print("self-test: PASS (Git blob formula, mutation rejection, source ledger)")


def check_report(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    folded = text.lower()
    missing = [token for token in REPORT_TOKENS if token.lower() not in folded]
    if missing:
        raise SystemExit(f"report check failed; missing: {missing}")
    for sha in SOURCES.values():
        if sha not in text:
            raise SystemExit(f"report check failed; missing blob {sha}")
    print(f"report check: PASS ({len(REPORT_TOKENS)} sections, {len(SOURCES)} blob IDs)")


def source_bytes(root: Path, rel: str) -> bytes:
    return subprocess.check_output(["git", "-C", str(root), "show", f"{PIN}:{rel}"])


def check_source(root: Path) -> None:
    actual_pin = subprocess.check_output(
        ["git", "-C", str(root), "rev-parse", PIN], text=True
    ).strip()
    if actual_pin != PIN:
        raise SystemExit(f"source check failed; cannot resolve pin {PIN}")
    assertions = 0
    for rel, expected_sha in SOURCES.items():
        data = source_bytes(root, rel)
        actual_sha = git_blob_sha(data)
        if actual_sha != expected_sha:
            raise SystemExit(f"blob mismatch {rel}: {actual_sha} != {expected_sha}")
        decoded = data.decode("utf-8")
        for token in TOKENS[rel]:
            assertions += 1
            if token not in decoded:
                raise SystemExit(f"token mismatch {rel}: {token!r}")
    print(f"source check: PASS ({len(SOURCES)} blobs, {assertions} exact tokens)")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--report", type=Path)
    parser.add_argument("--source-root", type=Path)
    args = parser.parse_args()
    if not (args.self_test or args.report or args.source_root):
        parser.error("choose --self-test, --report, or --source-root")
    if args.self_test:
        self_test()
    if args.report:
        check_report(args.report)
    if args.source_root:
        check_source(args.source_root)


if __name__ == "__main__":
    main()
