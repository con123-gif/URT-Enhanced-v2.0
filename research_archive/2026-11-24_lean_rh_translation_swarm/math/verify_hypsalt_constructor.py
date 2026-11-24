#!/usr/bin/env python3
"""Check the pinned HypsAlt constructor checkpoint and its source identities."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
FILES = {
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean": "c0ce994aa86f737b707b5617fb10bcfb35c0117e",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean": "18ce45e0cb7d9555897580f6c5565217bea190a6",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LinkROfIsLinked.lean": "66e5fddcb389f78669cef5787ef2c648d537bf4d",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/AllRows.lean": "be24ab5328945e90d2b981ff43ed9f20bb8b86ac",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean": "6a09205dfc3e57486ecbc27517072f3c27f09a51",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/Hyps.lean": "7e51220c82d43cf3a9345e87a9aa8751b38a5a25",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/CFinal.lean": "4a29a074e7b79272cca68b0e34b7191d282b9136",
}


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()


def require(text: str, tokens: list[str], label: str) -> None:
    missing = [token for token in tokens if token not in text]
    if missing:
        raise AssertionError(f"{label}: missing {missing}")


def check_sources(root: Path) -> None:
    src: dict[str, str] = {}
    for rel, expected in FILES.items():
        data = (root / rel).read_bytes()
        actual = git_blob_sha(data)
        if actual != expected:
            raise AssertionError(f"{rel}: blob {actual}, expected {expected}")
        src[rel] = data.decode("utf-8")

    hyp = src[next(p for p in FILES if p.endswith("HypothesesNonemptyOfUnramifiedExponents.lean"))]
    members = src[next(p for p in FILES if p.endswith("MemberBundlesLargeUnramifiedExponents.lean"))]
    link = src[next(p for p in FILES if p.endswith("LinkROfIsLinked.lean"))]
    rows = src[next(p for p in FILES if p.endswith("AllRows.lean"))]
    nonempty = src[next(p for p in FILES if p.endswith("NonemptyHypsOfAllRows.lean"))]
    hyps = src[next(p for p in FILES if p.endswith("Hyps.lean"))]

    require(
        hyp,
        [
            "theorem hypotheses_nonempty_of_unramified_exponents_alt",
            "(cDep : ℝ) (A : GroupRetwisting.AtP)",
            "EvLgG A",
            "BoundAtTwoThreeFamilyFonAlt",
            "S0.FunctionalCondition",
            "S0.CovolumeBoundThirdPlaceSeries",
            "large_unramified_exponent_bundles_exist_alt P hR hL cDep A hA",
            "have hNrow :=",
            "final_alt_alt P.nLink",
            "have hN' :",
            "allRows_of_open0_alt",
            "nonempty_hyps_of_allRows_alt",
        ],
        "main constructor",
    )
    require(
        members,
        [
            "large_unramified_exponent_bundles_exist_alt",
            "StandardLattice.SiegelMassRatioCM ∧ MemberE",
            "ExBL KPx",
            "memberE_extensionWithAtProperty_of_evLgG",
        ],
        "member constructor",
    )
    require(
        link,
        [
            "theorem allRows_of_open0_alt",
            "hL3 hfun",
            "nRest := hN",
            "rRows := eventually_coreProperty_mono",
        ],
        "all-rows constructor",
    )
    require(rows, ["structure AllRowsAlt", "rRows :", "nRest :"], "AllRowsAlt")
    require(
        nonempty,
        [
            "theorem nonempty_hyps_of_allRows_alt",
            "UpperTheory.Top.classSel",
            "exact ⟨{",
            "rRows := rRows",
            "nRest := nRest",
        ],
        "HypsAlt constructor",
    )
    require(hyps, ["structure HypsAlt", "rRows :", "nRest :"], "HypsAlt")
    print(f"source verification passed at {PIN}: {len(FILES)} blobs")


def check_report(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    require(
        text,
        [
            PIN,
            "## RESULT",
            "## Source ledger",
            "## Exact dependency map of the four late inputs",
            "## Executed tests",
            "## Failed attempts and limitations",
            "## RESUME HERE",
            "HANDOFF TO:",
            "SOURCE-MATCHED",
        ]
        + list(FILES.values()),
        "report",
    )
    print(f"report verification passed: {path}")


def self_test() -> None:
    assert git_blob_sha(b"test\n") == "9daeafb9864cf43055ae93beb0afd6c7d144bfa4"
    try:
        require("alpha", ["alpha", "beta"], "negative")
    except AssertionError as exc:
        assert "beta" in str(exc)
    else:
        raise AssertionError("negative control survived")
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
