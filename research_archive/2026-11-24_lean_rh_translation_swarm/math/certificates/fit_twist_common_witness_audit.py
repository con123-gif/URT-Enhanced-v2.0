#!/usr/bin/env python3
"""Exact source-structure audit for exists_isFitFamily.

This verifies pinned Git blobs and the quantifier/projection structure used by
the two denominator consumers.  It is source evidence, not Lean elaboration.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
FILES = {
    "New/Selmer/FitTwistsExist.lean": "da769eba595af2f883eed9b82dbd322a521aea14",
    "New/Selmer/TwistForRows.lean": "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
    "New/Selmer/DenominatorBound.lean": "5889d96fe1a6ad7926e0df09a7d183232f91c534",
    "New/Selmer/FitTwists.lean": "c62935a73ccbef6c7fc42f45c83f111e811a5825",
    "New/Selmer/RowsExist.lean": "3faeb868305f3619007179e2447907dc6109b852",
    "New/Rows/RowVolume.lean": "925de9c592b40763516e70ddeae48b4ad1a35b88",
    "New/Selmer/AptTupleDefs.lean": "ba41ff0e729d5182ac236911898dfd0865165f8c",
}


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()


def theorem_slice(text: str, start: str, end: str) -> str:
    a = text.index(start)
    b = text.index(end, a)
    return text[a:b]


def check(root: Path) -> dict[str, int]:
    texts: dict[str, str] = {}
    for rel, expected in FILES.items():
        data = (root / rel).read_bytes()
        actual = git_blob_sha(data)
        assert actual == expected, (rel, actual, expected)
        texts[rel] = data.decode()

    fit = texts["New/Selmer/FitTwistsExist.lean"]
    body = theorem_slice(fit, "lemma exists_isFitFamily", "open scoped") if "open scoped" in fit[fit.index("lemma exists_isFitFamily"):] else fit[fit.index("lemma exists_isFitFamily"):]

    assert body.count("choose τ H using") == 1
    assert "fun κ : PrimePadicIso" in body
    assert body.count("exists_mFoldTwist_selmerLengthLe") == 1
    assert "⌊D.r * rowBudget D κ.1⌋₊.succ" in body
    assert body.count("denominatorLe_rowBudget") == 2
    assert body.count("(H ..).1") == 2
    assert body.count("(H ..).2.1 (.inl _)") == 1
    assert body.count("(H ..).2.1 (.inr _)") == 1
    assert "(.of_le s' fun _ ↦ H _ · |>.2.2 · · ·)" in body

    # No second twist choice occurs in the packaging/consumer block.
    consumer = body[body.index("use τ,"):]
    assert "choose τ" not in consumer

    twist = texts["New/Selmer/TwistForRows.lean"]
    assert "∃ τ : D.MFoldTwist, ∀ n" in twist
    assert "IsAuxTwist" in twist
    assert "(∀ i, ∃ γ y, SelmerLengthLe" in twist
    assert "∀ (p : D.Pair) s, p.IsRamified" in twist

    den = texts["New/Selmer/DenominatorBound.lean"]
    assert "(hq : IsAuxTwist" in den
    assert "∃ γ s, SelmerLengthLe" in den
    assert "(⌊D.r * rowBudget D ℓ⌋₊ + 1) γ s" in den

    fit_def = texts["New/Selmer/FitTwists.lean"]
    assert "structure Data.IsFitFamily" in fit_def
    assert "denominator_le j : ∃ γ" in fit_def
    assert fit_def.count("DenominatorLe") >= 2

    rows = texts["New/Selmer/RowsExist.lean"]
    assert "there is one row T serving\nevery twist" in rows
    assert "∃ T, HasRow O b T" in rows

    apt = texts["New/Selmer/AptTupleDefs.lean"]
    assert "def HasRow := (∃ τ, IsRow" in apt
    assert "∀ {ϑ : D.TameChar}" in apt

    return {
        "pinned_blobs": len(FILES),
        "twist_choices": body.count("choose τ H using"),
        "denominator_calls": body.count("denominatorLe_rowBudget"),
        "good_row_projection": body.count("(H ..).2.1 (.inl _)"),
        "rank_one_projection": body.count("(H ..).2.1 (.inr _)"),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-root", type=Path, required=True)
    args = parser.parse_args()
    counts = check(args.source_root)
    print(f"pinned source blobs: PASS ({counts['pinned_blobs']}, {PIN})")
    print(f"common m-fold twist choice: PASS ({counts['twist_choices']})")
    print(f"denominator consumers: PASS ({counts['denominator_calls']})")
    print(f"good/rank-one Selmer projections: PASS ({counts['good_row_projection']}/{counts['rank_one_projection']})")
    print("Lean kernel replay: NOT RUN")


if __name__ == "__main__":
    main()
