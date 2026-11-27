#!/usr/bin/env python3
"""Exact arithmetic regression for the Kummer finite-index square.

This checks only the integer/cardinality implication isolated in the companion
Lean theorem.  It is not a test of class field theory, Lean elaboration, or RH.
"""

def main() -> None:
    square_checks = 0
    quotient_checks = 0
    reversed_divisibility_controls = 0

    for n in range(1, 17):
        for s_size in range(7):
            for infinite_places in range(7):
                rank = s_size + infinite_places - 1
                if rank < 0:
                    continue

                local_bound = n ** (2 * s_size + 2 * infinite_places)
                for torsion_multiple in range(1, 6):
                    torsion_card = n * torsion_multiple
                    unit_index = (n ** rank) * torsion_card
                    assert local_bound <= unit_index * unit_index
                    square_checks += 1

    assert square_checks > 0

    # Exhaust the isolated final integer lemma on a bounded box.
    for unit_index in range(1, 41):
        for local_index in range(1, unit_index * unit_index + 1):
            for quotient_index in range(1, 61):
                if local_index % (unit_index * quotient_index) == 0:
                    assert quotient_index <= unit_index
                    quotient_checks += 1

                # Reversing the divisibility direction is not sufficient.
                if (unit_index * quotient_index) % local_index == 0 \
                        and quotient_index > unit_index:
                    reversed_divisibility_controls += 1

    assert quotient_checks > 0
    assert reversed_divisibility_controls > 0

    print({
        "dirichlet_square_checks": square_checks,
        "quotient_index_checks": quotient_checks,
        "reversed_divisibility_counterexamples": reversed_divisibility_controls,
    })


if __name__ == "__main__":
    main()
