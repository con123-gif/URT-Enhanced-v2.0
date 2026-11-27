#!/usr/bin/env python3
"""Finite certificate for the prescribed tame-value last mile.

This checks the exact corestriction/action substitution in equation (7) of
the accompanying note.  It does not test global class field theory, Lean
elaboration, or RH.
"""

from itertools import product
from math import gcd


def main() -> None:
    checked = 0
    action_deletion_counterexamples = 0

    for modulus in range(2, 12):
        for order in range(1, 5):
            # A cyclic quotient acts on Z/modulus through a unit u with u^order=1.
            action_units = [
                u for u in range(modulus)
                if gcd(u, modulus) == 1 and pow(u, order, modulus) == 1
            ]
            for unit in action_units:
                actions = [pow(unit, delta, modulus) for delta in range(order)]
                for coeffs in product(range(modulus), repeat=order):
                    for scalar in range(modulus):
                        local_values = [c * scalar % modulus for c in coeffs]

                        corestricted = sum(
                            act * value
                            for act, value in zip(actions, local_values)
                        ) % modulus
                        prescribed = sum(
                            act * ((coefficient * scalar) % modulus)
                            for act, coefficient in zip(actions, coeffs)
                        ) % modulus
                        assert corestricted == prescribed
                        checked += 1

                        without_action = sum(local_values) % modulus
                        if corestricted != without_action:
                            action_deletion_counterexamples += 1

    assert checked > 0
    assert action_deletion_counterexamples > 0
    print({
        "exact_corestriction_substitutions": checked,
        "action_deletion_counterexamples": action_deletion_counterexamples,
    })


if __name__ == "__main__":
    main()
