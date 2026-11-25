#!/usr/bin/env python3
"""Exact bounded regression for the final arithmetic step in CountVOf.lean.

This is deliberately not presented as a proof of CountV.  It checks the two
branches of the source's private `arith` lemma using exact Fraction arithmetic.
"""

from fractions import Fraction


def check(a: int, v: int, e0: int, s: int, log_l: Fraction,
          x: int, c: int) -> bool:
    if not (a <= v and Fraction(v) <= 2 * e0 * s):
        return True
    if log_l < 0 or s * log_l > x**c or x < 2:
        return True
    lhs = Fraction(0) if e0 == 0 else Fraction(a, e0) * log_l
    return lhs <= x ** (c + 1)


def main() -> None:
    tested = 0
    e0_zero = 0
    for a in range(9):
        for v in range(9):
            for e0 in range(5):
                for s in range(7):
                    for num in range(7):
                        for den in range(1, 5):
                            log_l = Fraction(num, den)
                            for x in range(2, 8):
                                for c in range(5):
                                    if (a <= v and Fraction(v) <= 2 * e0 * s
                                            and s * log_l <= x**c):
                                        tested += 1
                                        e0_zero += e0 == 0
                                        assert check(a, v, e0, s, log_l, x, c), (
                                            a, v, e0, s, log_l, x, c
                                        )
    assert tested > 0 and e0_zero > 0
    print(f"PASS exact CountV arithmetic: {tested} admissible tuples; "
          f"{e0_zero} with E=0")


if __name__ == "__main__":
    main()
