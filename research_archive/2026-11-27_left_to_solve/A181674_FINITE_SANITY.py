"""Reproducible finite source/edge check; not an asymptotic proof."""
from pathlib import Path
import bisect
import html
import json
import math
import re

ROOT = Path(__file__).resolve().parent
LIMIT = 10**6
spf = list(range(LIMIT + 1))
big_omega = [0] * (LIMIT + 1)
for p in range(2, math.isqrt(LIMIT) + 1):
    if spf[p] == p:
        for n in range(p * p, LIMIT + 1, p):
            if spf[n] == n:
                spf[n] = p
primes, semiprimes = [], []
for n in range(2, LIMIT + 1):
    big_omega[n] = big_omega[n // spf[n]] + 1
    if spf[n] == n:
        primes.append(n)
    if big_omega[n] == 2:
        semiprimes.append(n)
primorials, product = [1], 1
for p in primes:
    product *= p
    if product > LIMIT:
        break
    primorials.append(product)

text = html.unescape((ROOT / "A181674_newscreen_source.html").read_text())
terms = []
for line in re.findall(r"<tt>(%[STU].*?)</tt>", text, re.S):
    terms.extend(int(x) for x in re.sub(r"^%[STU]\s*", "", line).split(",")
                 if x.strip())
primorial_set, semiprime_set = set(primorials), set(semiprimes)
assert primorial_set & semiprime_set == {6}
for n, expected in enumerate(terms, 1):
    actual = sum(1 for a in range(n // 2 + 1)
                 if ((a in primorial_set and n - a in semiprime_set) or
                     (a in semiprime_set and n - a in primorial_set)))
    assert actual == expected, (n, expected, actual)

rows = []
for bound in [100, 1000, 10000, 100000, 1000000]:
    k = bisect.bisect_right(primorials, bound)
    q = bisect.bisect_right(semiprimes, bound)
    # The only overlap of the two sets is 6; no distinct pair is counted twice.
    total = sum(bisect.bisect_right(semiprimes, bound - a)
                for a in primorials[:k])
    assert total <= 2 * k * q
    rows.append({"N": bound, "primorial_count": k, "semiprime_count": q,
                 "summatory_exact": total, "mean": total / bound,
                 "loglog": math.log(math.log(bound))})
result = {"status": "finite sanity checks passed; not an infinite proof",
          "source_terms_matched": len(terms), "sieve_limit": LIMIT,
          "method": "Exact smallest-prime-factor sieve; source sorted-pair count",
          "rows": rows}
(ROOT / "A181674_FINITE_SANITY.json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result))
