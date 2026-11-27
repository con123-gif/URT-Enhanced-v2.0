#!/usr/bin/env python3
"""Finite sign/cancellation check for the principal-Artin last mile.

This checks only the exact algebraic substitution in the companion Lean
file.  It is not a test of class field theory, the compact Lean source, or RH.
"""

from itertools import product


def main() -> None:
    checks = 0
    negative_controls = 0
    for modulus in range(2, 10):
        for size in range(1, 4):
            for b in product(range(-2, 3), repeat=size):
                ords = tuple(-x for x in b)
                for values in product(range(modulus), repeat=size):
                    artin = sum((-ords[j]) * values[j] for j in range(size)) % modulus
                    target = sum(b[j] * values[j] for j in range(size)) % modulus
                    assert artin == target
                    checks += 1

                    unsigned = sum(ords[j] * values[j] for j in range(size)) % modulus
                    if target != (-target) % modulus:
                        assert unsigned != target
                        negative_controls += 1

    assert negative_controls > 0
    print({
        "exact_substitution_checks": checks,
        "sign_deletion_negative_controls": negative_controls,
    })


if __name__ == "__main__":
    main()
