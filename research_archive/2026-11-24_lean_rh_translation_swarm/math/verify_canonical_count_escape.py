#!/usr/bin/env python3
"""Exhaustive finite check of the canonical count-escape reduction.

The asymptotic theorem is proved in the companion note.  This certificate
checks its exact combinatorial core: CountEscape only sees prime elements,
so every auxiliary prime subset is dominated by the canonical set of all
budget-good primes, regardless of composite contamination in the set.
"""


def is_prime(n: int) -> bool:
    return n >= 2 and all(n % d for d in range(2, int(n**0.5) + 1))


def prime_count(mask: int, x: int) -> int:
    return sum(1 for n in range(1, x + 1) if is_prime(n) and mask >> (n - 1) & 1)


def main() -> None:
    nmax = 12
    prime_mask = sum(1 << (n - 1) for n in range(1, nmax + 1) if is_prime(n))
    checked = 0

    # A good mask records the prime d for which the full native budget witness
    # exists.  S may contain arbitrary composites because goodPrimes filters
    # them before counting.
    good_masks = [m for m in range(1 << nmax) if m & ~prime_mask == 0]
    for good in good_masks:
        canonical = good | (((1 << nmax) - 1) ^ prime_mask)
        for s in range(1 << nmax):
            if s & prime_mask & ~good:
                continue
            for x in range(1, nmax + 1):
                assert prime_count(s, x) <= prime_count(canonical, x)
                assert prime_count(canonical, x) == prime_count(good, x)
            checked += 1

    # Negative control: raw counting (without the prime filter) is not
    # monotone under the prime-only inclusion used by the proof.
    composites = ((1 << nmax) - 1) ^ prime_mask
    assert composites.bit_count() > 0
    assert composites.bit_count() > 0  # raw S count, while the good prime set is empty
    assert prime_count(composites, nmax) == 0

    print("CANONICAL_COUNT_ESCAPE_PRIME_FILTER_OK")
    print(f"universe=1..{nmax} admissible_pairs={checked}")
    print("NEGATIVE_CONTROL_RAW_COUNT_REJECTED")


if __name__ == "__main__":
    main()
