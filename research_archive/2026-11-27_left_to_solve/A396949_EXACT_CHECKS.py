"""Finite edge checks for the A396949 family; these are not an infinite proof."""
import itertools
import json
from pathlib import Path


def check_prime(p):
    assert p >= 13 and all(p % d for d in range(2, int(p ** 0.5) + 1))
    k = p // 4
    cutoff = p * 11 ** (p + 21)
    values = set()
    for u in itertools.product(range(k + 1), repeat=4):
        e = [x + 1 for x in u] + [p + 17 - sum(u), 1]
        assert min(e) >= 1 and sum(e) == p + 22
        n = 1
        for q, exponent in zip([2, 3, 5, 7, 11, p], e):
            n *= q ** exponent
        assert 0 < n <= cutoff and n not in values
        values.add(n)
        remaining = n
        actual = {}
        for q in [2, 3, 5, 7, 11, p]:
            while remaining % q == 0:
                actual[q] = actual.get(q, 0) + 1
                remaining //= q
        assert remaining == 1
        assert len(actual) + sum(actual.values()) == sum(actual)
    assert len(values) == (k + 1) ** 4
    assert p ** 4 <= 256 * len(values)
    return {"prime": p, "box_card": len(values), "min_member": str(min(values)),
            "max_member": str(max(values)), "cutoff": str(cutoff),
            "actual_factorizations_checked": len(values)}


if __name__ == "__main__":
    evidence = {"scope": "Finite exact edge checks only; not an infinite proof",
                "cases": [check_prime(p) for p in [13, 17, 23, 31]]}
    dest = Path(__file__).with_suffix(".json")
    dest.write_text(json.dumps(evidence, indent=2) + "\n")
    print(json.dumps({"checked": sum(c["box_card"] for c in evidence["cases"]),
                      "primes": [c["prime"] for c in evidence["cases"]]}))
