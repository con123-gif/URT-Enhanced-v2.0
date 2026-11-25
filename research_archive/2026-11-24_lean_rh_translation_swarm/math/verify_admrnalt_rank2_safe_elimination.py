#!/usr/bin/env python3
"""Exact regression certificate for the rank-two SafeRA gap branch.

The universal proof is the four symbolic differences printed below.  The
finite loop is a regression check, not a finite-to-infinite inference.
"""


def weight(e: int, i: int) -> int:
    assert i in (0, 1)
    return e if i == 0 else -e


def main() -> None:
    # For pairs (0,0), (0,1), (1,0), (1,1), SafeRA asks that
    # m_i - m_j - 1 not vanish.  These are exact affine forms in e.
    symbolic = ("-1", "2*e-1", "-2*e-1", "-1")
    boundary = (-1, 1, -3, -1)
    assert boundary == tuple(weight(1, i) - weight(1, j) - 1
                              for i in (0, 1) for j in (0, 1))
    # Exact sign argument for all e >= 1:
    # -1 < 0; 2e-1 >= 1; -2e-1 <= -3; -1 < 0.
    assert 2 * 1 - 1 >= 1
    assert -2 * 1 - 1 <= -3

    checks = 0
    forbidden = 0
    for e in range(1, 10_001):
        for i in (0, 1):
            for j in (0, 1):
                forbidden += weight(e, i) == weight(e, j) + 1
                checks += 1
    assert forbidden == 0

    print("ADMRNALT RANK-TWO SAFE ELIMINATION CERTIFICATE")
    print(f"four symbolic differences=({', '.join(symbolic)})")
    print(f"boundary e=1 values={boundary}")
    print(f"checked integer range=1..10000, pairs={checks}")
    print(f"forbidden adjacent-pair count={forbidden}")
    print("RESULT: SafeRA right disjunct is forced by rank-two weights "
          "(e,-e), e>=1")


if __name__ == "__main__":
    main()
