#!/usr/bin/env python3
"""Verify the pinned EveryCharacter adapter checkpoint.

With --source-root, verify the seven upstream Git blob IDs and source-shape tokens.
With --report, verify that the human checkpoint retains its provenance and handoff fields.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


PINNED_COMMIT = "40e56bab026552e089d7afcfeff08d2defb9c005"
FILES = {
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean": "42abe20ee235820aaa924dbabce5e1d2c2540380",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/At23OfAll.lean": "e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean": "c51cb6b5bd4bf2944ace89e00a2990da16bd519a",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean": "6ac769568b67f85f33565ba3e1eef7b91f53c55f",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean": "0e1bad41f4b165c0d9b1693f419530309e1da5ba",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
}


def git_blob_sha(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode()
    return hashlib.sha1(header + data).hexdigest()


def require(text: str, tokens: list[str], label: str) -> None:
    missing = [token for token in tokens if token not in text]
    if missing:
        raise AssertionError(f"{label}: missing tokens: {missing}")


def check_sources(root: Path) -> None:
    contents: dict[str, str] = {}
    for rel, expected in FILES.items():
        path = root / rel
        data = path.read_bytes()
        actual = git_blob_sha(data)
        if actual != expected:
            raise AssertionError(f"{rel}: blob {actual}, expected {expected}")
        contents[rel] = data.decode("utf-8")

    wrapper = contents[next(key for key in FILES if key.endswith("EveryCharacterOfLiteratureOfVWin.lean"))]
    adapter = contents[next(key for key in FILES if key.endswith("SiegelEisensteinSecondTermHypotheses.lean"))]
    at23 = contents[next(key for key in FILES if key.endswith("At23OfAll.lean"))]
    top_plug = contents[next(key for key in FILES if key.endswith("TopPlug.lean"))]

    require(
        adapter,
        [
            "theorem every_character_of_theta_integrals_local_matching",
            "UnitaryGroupThirdPlaceHypotheses",
            "ThetaLocalInputs",
            "ThetaIntegralsAgree",
            "LocalMatching",
            "CovolumeBoundOfX",
            "RecTExists",
            "(hV : VWin)",
            "nonempty_hyps_definite_side_of_closed_bound P F hA hM hX hL",
            "boundAtTwoThree_linked_of_recT P.nLink",
            "parametersOfDependence hL cDep",
        ],
        "adapter",
    )
    require(
        wrapper,
        [
            "every_character_of_literature_of_vWin",
            "published_results_eigen O",
            "published_results_first O",
            "theta_integrals_agree_and_local_matching_of_literature O).1",
            "theta_integrals_agree_and_local_matching_of_literature O).2",
            "topCovolSlim2_use_alt_alt",
            "local_langlands_gl_recT_exists_of_literature O",
        ],
        "literature wrapper",
    )
    require(
        at23,
        ["at23_family_alt", "boundAtTwoThree_n_linked", "boundAtTwoThree_linked_of_recT"],
        "two/three-prime bridge",
    )
    require(
        top_plug,
        ["zero_free_all_of_green_v_win", "every_character_of_green_v_win", "UpperTheory.Top.imprimitive"],
        "character-box discharge",
    )
    print(f"source verification passed at {PINNED_COMMIT}: {len(FILES)} blobs")


def check_report(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    require(
        text,
        [
            PINNED_COMMIT,
            "## RESULT",
            "## Source ledger",
            "## Correction to the existing interpretation",
            "## Executed tests",
            "## Failed attempts and limitations",
            "## RESUME HERE",
            "source-matched",
            "not a new Lean proof",
        ] + list(FILES.values()),
        "report",
    )
    print(f"report verification passed: {path}")


def self_test() -> None:
    # Git's canonical hash for a blob containing exactly b"test\n".
    assert git_blob_sha(b"test\n") == "9daeafb9864cf43055ae93beb0afd6c7d144bfa4"
    try:
        require("alpha", ["alpha", "beta"], "negative test")
    except AssertionError as exc:
        assert "beta" in str(exc)
    else:
        raise AssertionError("negative token test did not fail")
    print("self-test passed")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-root", type=Path)
    parser.add_argument("--report", type=Path)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if not (args.source_root or args.report or args.self_test):
        parser.error("select --source-root, --report, or --self-test")
    if args.self_test:
        self_test()
    if args.report:
        check_report(args.report)
    if args.source_root:
        check_sources(args.source_root)


if __name__ == "__main__":
    main()
