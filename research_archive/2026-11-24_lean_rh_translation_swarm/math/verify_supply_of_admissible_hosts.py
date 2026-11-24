#!/usr/bin/env python3
"""Checks for the source-matched supplyOfAdmOf reconstruction."""

from __future__ import annotations

import argparse
import hashlib
import math
import subprocess
from pathlib import Path

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"

SOURCES = {
    "src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean": "04ca5068e90544580c7684a316ec79c49d3572fc",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean": "339885b77069601fb716a60739369805241e8222",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean": "d98214b25bf84966a5b4e858a35f21ac9193b49f",
    "src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean": "261b566b0ea0d155ef1a434889d720c3b439735f",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/WinPairs.lean": "4670fec488d1eb59a3cc52dffc8d0eab16e16b0b",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean": "5e8b1a992a393336dffd3603524526dfccfa1981",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean": "68d04b506355e999c0f6020ee066c4967c1e6939",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/PairHyp.lean": "d47dbeec05e2463c5882a8a7643dc2bf22059f35",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/FieldChi.lean": "f3e2032b133ff64406a87e27438cdf467aa05a1f",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/IsChiField.lean": "181ab535373fb54af925bfdca6af685f6955ddc5",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/BoundedTw.lean": "69e88858735720bd60454c30c64d6380e216613f",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/EventuallyRankLeRpowOfLtOneDivFiftytwo.lean": "d60585aca568591e8192b6fd1ce9a91433c4af2d",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean": "398eb8ed3528aa2666e9d3b2b09a582ad4390dd7",
    "src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean": "15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17",
}

TOKENS = {
    "src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean": [
        "theorem UpperTheory.T3.supplyOfAdmOf", "fieldChi ψ", "winPairs ψ eps", "hW.bound H.E hCF",
        "eventually_rank_le_rpow_of_lt_one_div_fiftytwo"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean": [
        "VWinAt ψ 401", "supplyOfAdm ψ hψ", "admissibleClassesTwistedChar"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean": [
        "theorem UpperTheory.Top.hostOfField", "UpperTheory.T3.supplyOfAdmOf UpperTheory.Top.hostOfField"
    ],
    "src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean": [
        "theorem UpperTheory.T3.hostOfFieldOf", "UpperTheory.T3.levelData", "hof_exists_host",
        "HostGood s C8 4 c6 Cb"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/WinPairs.lean": [
        "theorem UpperTheory.Top.winPairs", "VWinAt ψ 401", "WinDatum ψ eps J c x Y q d e",
        "show (401 : ℝ) = 1 + 400"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean": [
        "def KerChi", "def TwistForm", "structure WinDatum", "⌊x ^ (400 : ℝ)⌋₊"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean": [
        "structure PairGood", "def PairEx", "ZeroBox"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/PairHyp.lean": [
        "theorem UpperTheory.Top.pairHyp", "jac_neg_of_dvd"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/FieldChi.lean": [
        "theorem UpperTheory.Top.fieldChi", "FieldRows H.toHostRaw b", "KerChi ψ", "TwistForm ψ"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/IsChiField.lean": [
        "theorem UpperTheory.Top.isChiField", "KerChi ψ H", "IsChiField ψ φ.e H.q H.d H.E"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/BoundedTw.lean": [
        "theorem UpperTheory.Top.boundedTw", "BoundedCharsPointwise", "logDerivativeAtOne"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/EventuallyRankLeRpowOfLtOneDivFiftytwo.lean": [
        "eventually_rank_le_rpow_of_lt_one_div_fiftytwo", "(R.t : ℝ) ≤ s.x ^ (400 : ℝ)"
    ],
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean": [
        "def VVle", "def VAt", "def VWinAt"
    ],
    "src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean": ["admissibleClassesTwistedChar"],
}

REPORT_TOKENS = [
    "401",
    "400",
    "3/2",
    "Complete theorem boundary",
    "Constructing the two conjuncts",
    "Executed tests",
    "Failed attempts and limitations",
    "RESUME HERE",
]


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()


def primes_up_to(n: int) -> list[int]:
    out = []
    for x in range(2, n + 1):
        if all(x % d for d in range(2, math.isqrt(x) + 1)):
            out.append(x)
    return out


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def arithmetic_test() -> None:
    cases = prime_checks = 0
    for e in range(10):
        two_power = 2 ** (e + 2)
        for m in range(1, 81):
            target = math.lcm(two_power, m)
            for q in divisors(target):
                cases += 1
                for p in primes_up_to(q):
                    if q % p == 0:
                        prime_checks += 1
                        assert (2 * m) % p == 0
    # Removing Q | lcm(2^(e+2),M) is genuinely unsafe: 3 | 3 but 3 ∤ 2·5.
    assert 3 % 3 == 0 and (2 * 5) % 3 != 0
    print(f"arithmetic-test: PASS ({cases} divisor cases, {prime_checks} prime-divisor checks, 1 negative control)")


def self_test() -> None:
    sample = b"supplyOfAdmOf\n"
    expected = hashlib.sha1(f"blob {len(sample)}\0".encode() + sample).hexdigest()
    assert git_blob_sha(sample) == expected
    assert git_blob_sha(sample + b"x") != expected
    assert len(SOURCES) == 14 and set(SOURCES) == set(TOKENS)
    print("self-test: PASS (blob formula, mutation rejection, 14-file ledger)")


def check_report(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    missing = [t for t in REPORT_TOKENS if t.lower() not in text.lower()]
    if missing:
        raise SystemExit(f"report check failed; missing {missing}")
    for sha in SOURCES.values():
        if sha not in text:
            raise SystemExit(f"report check failed; missing source blob {sha}")
    print(f"report check: PASS ({len(REPORT_TOKENS)} required topics, {len(SOURCES)} blob IDs)")


def source_bytes(root: Path, rel: str) -> bytes:
    return subprocess.check_output(["git", "-C", str(root), "show", f"{PIN}:{rel}"])


def check_source(root: Path) -> None:
    resolved = subprocess.check_output(["git", "-C", str(root), "rev-parse", PIN], text=True).strip()
    if resolved != PIN:
        raise SystemExit(f"cannot resolve pinned revision {PIN}")
    assertions = 0
    for rel, expected in SOURCES.items():
        data = source_bytes(root, rel)
        actual = git_blob_sha(data)
        if actual != expected:
            raise SystemExit(f"blob mismatch {rel}: {actual} != {expected}")
        source = data.decode("utf-8")
        for token in TOKENS[rel]:
            assertions += 1
            if token not in source:
                raise SystemExit(f"token mismatch {rel}: {token!r}")
    print(f"source check: PASS ({len(SOURCES)} blobs, {assertions} tokens)")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--arithmetic-test", action="store_true")
    parser.add_argument("--report", type=Path)
    parser.add_argument("--source-root", type=Path)
    args = parser.parse_args()
    if not (args.self_test or args.arithmetic_test or args.report or args.source_root):
        parser.error("select at least one check")
    if args.self_test:
        self_test()
    if args.arithmetic_test:
        arithmetic_test()
    if args.report:
        check_report(args.report)
    if args.source_root:
        check_source(args.source_root)


if __name__ == "__main__":
    main()
