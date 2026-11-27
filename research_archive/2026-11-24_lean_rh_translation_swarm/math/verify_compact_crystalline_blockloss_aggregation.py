#!/usr/bin/env python3
"""Exact rational regression for the scalar tail of sum_blockLoss_le.

This does not prove the local crystalline/cup-product theorem or RH. It checks
the exact aggregation after the source has supplied, for every place v and
block i,

  delta[v,i] <= q[v] * rank[i] * loss / x[i],

with rank[none]=r, x[none]=1, and t singleton blocks with x=T.
"""

from fractions import Fraction


def main() -> None:
    losses = [Fraction(0), Fraction(1, 7), Fraction(1, 2), Fraction(1), Fraction(5, 3), Fraction(9)]
    checks = 0

    for r in range(1, 10):
        for T in range(1, 10):
            for t in range(T + 1):
                for f in range(1, 6):
                    for q_total in range(2 * f + 1):
                        for loss in losses:
                            direct_blocks = r * loss + t * (loss / T)
                            normalized = (Fraction(r) + Fraction(t, T)) * loss
                            after_places = q_total * direct_blocks
                            embedding_bound = 2 * f * normalized
                            row_plus_one = 2 * f * (r + 1) * loss
                            final = 4 * r * f * loss

                            assert direct_blocks == normalized
                            assert after_places <= embedding_bound
                            assert embedding_bound <= row_plus_one
                            assert row_plus_one <= final
                            checks += 1

    # Each guard and the factor four are necessary at the scalar interface.
    loss = Fraction(1)
    no_positive_rank_lhs = 2 * (Fraction(0) + Fraction(1, 1)) * loss
    no_positive_rank_rhs = 4 * 0 * 1 * loss
    assert no_positive_rank_lhs > no_positive_rank_rhs

    no_t_le_T_lhs = 2 * (Fraction(1) + Fraction(2, 1)) * loss
    no_t_le_T_rhs = 4 * 1 * 1 * loss
    assert no_t_le_T_lhs > no_t_le_T_rhs

    sharp_lhs = 2 * (Fraction(1) + Fraction(1, 1)) * loss
    false_factor_two_rhs = 2 * 1 * 1 * loss
    assert sharp_lhs > false_factor_two_rhs
    assert sharp_lhs == 4 * 1 * 1 * loss

    print("COMPACT CRYSTALLINE BLOCK-LOSS AGGREGATION")
    print(f"exact rational instances={checks}")
    print("guards checked: r>=1, T>0, t<=T, q_total<=2f")
    print("negative controls: rank guard, string-length guard, factor-two strengthening")
    print("RESULT: exact scalar regression passed")


if __name__ == "__main__":
    main()
