#!/usr/bin/env python3
"""Exact regression for the NumberU3U classifier-union exponent reduction.

This is an arithmetic certificate, not a substitute for the two native
eigensystem-count hypotheses.  It checks the endpoint inequality from which
the full monotone statement follows.
"""


def main() -> None:
    checked = 0
    for c1 in range(7):
        for c2 in range(7):
            for d in range(7):
                for a1 in range(7):
                    for a2 in range(7):
                        a = max(a1, a2)
                        coefficient = c1 + c2 * d**a2
                        for y in range(1, 10):
                            original_sum = c1 * y**a1 + c2 * d**a2 * y**a2
                            reduced_bound = coefficient * y**a
                            assert original_sum <= reduced_bound

                            # The following native logarithmic-norm step
                            # contributes one further factor 5*y.
                            original_final = 5 * y * original_sum
                            reduced_final = 5 * coefficient * y ** (a + 1)
                            assert original_final <= reduced_final
                            checked += 1

    print(
        "PASS exact NumberU3U exponent merge: "
        f"{checked} endpoint tuples; A=max(A1,A2), final exponent A+1"
    )


if __name__ == "__main__":
    main()
