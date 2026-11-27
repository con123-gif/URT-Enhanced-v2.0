#!/usr/bin/env python3
"""Source-anchor and arithmetic certificate for RibetElement.ribet_columns.

This is not a Lean/kernel replay.  With --source-root it verifies the exact
pinned Git blobs and caller/definition snippets.  Independently it stress
tests the complete micro-term payment used in the accompanying human proof.
"""

from __future__ import annotations

import argparse
import hashlib
import random
from pathlib import Path


PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
FILES = {
    "New/Selmer/RibetElement.lean": "188eeb68d437bfa58bcc30042d4eee66c2111e18",
    "New/Selmer/RibetFirstOrder.lean": "a05cb18d1ee62520f104d41361099db4b23cbe1f",
    "New/Selmer/Corepresentable.lean": "3e401695d96b8ea826d60dadf0174d366f85d37c",
    "New/Selmer/AptTupleDefs.lean": "ba41ff0e729d5182ac236911898dfd0865165f8c",
}


def git_blob_sha(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode()
    return hashlib.sha1(header + data).hexdigest()


def check_source(root: Path) -> int:
    texts: dict[str, str] = {}
    for rel, expected in FILES.items():
        data = (root / rel).read_bytes()
        actual = git_blob_sha(data)
        assert actual == expected, (rel, actual, expected)
        texts[rel] = data.decode()

    caller = texts["New/Selmer/RibetElement.lean"]
    required = [
        "⟨s, hs, hr⟩",
        "tri.detect",
        "hR · |>.elim (·.span_and_scalar.and ·)",
        "rw [← @Nat.cast_le ℝ≥0∞] at hs",
        "at hs hq ⊢",
        "grw [hS, hJ.rank_mem.2",
        "hq.2, card_le_of_subset_placesAboveG",
        "((l _ u'",
    ]
    for snippet in required:
        assert snippet in caller, snippet

    assert "∑ k, ellVal (ψ (σ k) - 1) ≤ c" in texts[
        "New/Selmer/Corepresentable.lean"
    ]
    assert "(card J + s.card) * h ≤ c" in texts[
        "New/Selmer/Corepresentable.lean"
    ]
    assert "≤ 10 * D.f * Fintype.card n * crudeUnit ℓ D + crudeUnit ℓ D" in texts[
        "New/Selmer/AptTupleDefs.lean"
    ]
    assert "∑ i, O.normLength (blockLoss" in caller
    assert "≤ 4 * card r * D.f * loss D ℓ" in caller
    return len(FILES)


def raw_coefficient(H: int, f: int, t: int, r: int) -> int:
    return 4 + 10 * f * r + t * (2 + 8 * f + 4 * H**22) + H**22 + H


def micro_payment(
    H: int,
    f: int,
    t: int,
    r: int,
    h: int,
    m: int,
    c: int,
    a: int,
    L: int,
    j: int,
    s0: int,
    detector_card: int,
    aux_sum: int,
    g_card: int,
    block_loss: int,
) -> tuple[int, int]:
    q = H * h
    row_and_strings = (10 * f * r + 1) * c + block_loss + t * a
    polynomial_cost = t * (2 * aux_sum + 2 * g_card * m)
    selector_cost = t * (2 * detector_card * q) + (j + 1) * q
    actual = 3 * m + row_and_strings + polynomial_cost + selector_cost
    envelope = raw_coefficient(H, f, t, r) * c + t * a + 4 * r * f * L
    return actual, envelope


def check_random_micro_payments(samples: int = 100_000) -> int:
    rng = random.Random(0x48534851)
    for _ in range(samples):
        H = rng.randint(2, 20)
        f = rng.randint(0, H)
        t = rng.randint(1, H)
        r = rng.randint(1, H)
        c = rng.randint(0, 200)
        m = rng.randint(0, c)
        h = rng.randint(0, m)
        a = rng.randint(0, 200)
        L = rng.randint(0, 200)
        aux_sum = rng.randint(0, c)
        g_card = rng.randint(0, 4 * f)
        block_loss = rng.randint(0, 4 * r * f * L)

        q = H * h
        cap = H**22 * h
        # Choose j,s0 only when the native triangle inequality holds.
        j = rng.randint(0, 20)
        s0 = rng.randint(0, 20)
        if (j + s0) * q > cap:
            j = s0 = 0
        detector_card = rng.randint(0, s0 + 2 * j)

        actual, envelope = micro_payment(
            H, f, t, r, h, m, c, a, L, j, s0, detector_card,
            aux_sum, g_card, block_loss,
        )
        assert actual <= envelope
    return samples


def check_symbolic_boundary_box() -> int:
    checked = 0
    for H in range(2, 33):
        for f in range(H + 1):
            for t in range(1, H + 1):
                for r in range(1, H + 1):
                    C = raw_coefficient(H, f, t, r)
                    A = 4 + 10 * f + t * (2 + 8 * f + 4 * H**22) + H**22 + H
                    N = 4 + t * (2 + 10 * f + 6 * H**22) + H**22 + H
                    assert C <= r * A
                    assert C <= r * N
                    assert A <= H**27
                    assert N <= H**27
                    checked += 1
    return checked


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--source-root",
        type=Path,
        help="path to pinned grh-compact/src for exact blob/snippet checks",
    )
    args = parser.parse_args()

    if args.source_root is not None:
        anchored = check_source(args.source_root)
        print(f"pinned source blobs/snippets: PASS ({anchored} files, {PIN})")
    else:
        print("pinned source blobs/snippets: NOT RUN (supply --source-root)")

    box = check_symbolic_boundary_box()
    samples = check_random_micro_payments()
    print(f"rank-weighted boundary tuples: PASS ({box})")
    print(f"complete micro-term payments: PASS ({samples})")
    print("Lean kernel replay: NOT RUN")


if __name__ == "__main__":
    main()
