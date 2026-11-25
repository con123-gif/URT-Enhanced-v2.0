#!/usr/bin/env python3
"""Exact dyadic mean-witness selector; actual cyclotomic prime-count controls.
Not native geometry, not native GPsi data, not an RH proof. See RUN27 note.
"""
import json, math, resource, statistics, time, tracemalloc


def require(ok, message):
    if not ok:
        raise AssertionError(message)


def validate(d, t):
    h = len(d)
    require(h > 0 and h & (h - 1) == 0, "non-dyadic group")
    require(len(set(t)) == len(t) and all(0 <= s < h for s in t), "invalid mask")
    return h


def dyadic(d, t, minimize=False):
    h = validate(d, t)
    c = [0] * h
    for s in t:
        c[s] = 1
    levels = [(list(d), c)]
    while len(c) > 1:
        q = len(c) // 2
        old = levels[-1][0]
        c = [c[i] + c[i + q] for i in range(q)]
        levels.append(([old[i] + old[i + q] for i in range(q)], c))
    a, total, trace = 0, sum(d) * len(t), []
    for f, c in reversed(levels[:-1]):
        q = len(c)
        left = sum(f[v] * c[(v - a) % q] for v in range(q))
        right = total - left
        take_right = right < left if minimize else right > left
        if take_right:
            a += q // 2
        total = right if take_right else left
        trace.append((q, a, total, left, right))
    require(total == sum(d[(s+a) % h] for s in t), "leaf mismatch")
    return a, total, trace


def direct(d, t, first=False):
    h = validate(d, t)
    target = sum(d) * len(t)
    best = None
    for u in range(h):
        z = sum(d[(s+u) % h] for s in t)
        if first and h*z >= target:
            return u, z
        if best is None or z > best[1]:
            best = (u, z)
    return best


def primes(n):
    a = bytearray(b'\x01') * (n+1)
    a[:2] = b'\x00\x00'
    for p in range(2, math.isqrt(n)+1):
        if a[p]:
            a[p*p::p] = b'\x00' * ((n-p*p)//p+1)
    return [p for p in range(2,n+1) if a[p]]


def cyclotomic_counts(h, pp, bound):
    # Real field Q(zeta_(4h))^+: quotient by +/-1, generator 5.
    mod = 4*h
    lookup = {}
    x = 1
    for k in range(h):
        require(x not in lookup and (-x)%mod not in lookup, "generator collision")
        lookup[x] = lookup[(-x)%mod] = k
        x = (5*x)%mod
    require(x == 1 and len(lookup) == 2*h, "incomplete residue map")
    d = [0]*h
    mask = set()
    for p in pp:
        if p == 2:
            continue
        k = lookup[p%mod]
        if p <= 20000:
            mask.add(k)
        n, i = p, 1
        while n <= bound:
            d[(k*i)%h] += 1 if n > bound//2 else -1
            i += 1
            n *= p
    return d, sorted(mask)


def benchmark(fn):
    times = []
    for _ in range(4):
        t = time.perf_counter_ns()
        result = fn()
        times.append((time.perf_counter_ns()-t)/1e6)
    tracemalloc.start()
    fn()
    _, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()
    return result, {"first_ms":times[0],"repeat_median_ms":statistics.median(times[1:]),"python_peak_bytes":peak}


def main():
    bound = 200000
    pp = primes(bound)
    checks, negative, rows = 0, 0, []
    for h in (1, 128, 512, 2048, 4096):
        d,t = cyclotomic_counts(h,pp,bound)
        a, z, trace = dyadic(d,t)
        brute = [sum(d[(s+u)%h] for s in t) for u in range(h)]
        require(sum(brute) == sum(d)*len(t), "mean mismatch")
        require(brute[a] == z and h*z >= sum(brute), "selection mismatch")
        checks += 2
        for q,u,v,left,right in trace:
            parent = u % (q//2)
            l = sum(brute[k] for k in range(parent,h,q))
            r = sum(brute[k] for k in range(parent+q//2,h,q))
            require((left,right,v) == (l,r,max(l,r)), "coset mismatch")
            checks += 1
        lo,low,_ = dyadic(d,t,minimize=True)
        require(h*low <= sum(brute), "negative selection mismatch")
        if min(brute) < max(brute):
            require(h*low < sum(brute), "non-strict negative control")
            negative += 1
        fast, f = benchmark(lambda:dyadic(d,t))
        early, e = benchmark(lambda:direct(d,t,first=True))
        # Full scan runtime; tracemalloc here is deliberately omitted for slow scans.
        times = []
        for _ in range(4):
            start = time.perf_counter_ns(); full = direct(d,t)
            times.append((time.perf_counter_ns()-start)/1e6)
        require(full[1] == max(brute), "exhaustive max mismatch")
        require(h*early[1] >= sum(brute) and h*fast[1] >= sum(brute), "benchmark mismatch")
        checks += 2
        rows.append(dict(h=h, mask=len(t), chosen=a, score=z, early_index=early[0],
            dyadic=f, early=e, full={"first_ms":times[0],"repeat_median_ms":statistics.median(times[1:])},
            direct_term_count=h*len(t), dyadic_dot_terms=2*h-2))
    for d,t in (([1,2,3],[0]),([1,2],[0,0]),([1,2],[2])):
        try:
            dyadic(d,t)
        except AssertionError:
            negative += 1
        else:
            raise AssertionError("invalid input accepted")
    print(json.dumps(dict(bound=bound,primes=len(pp),checks=checks,negative=negative,
        process_peak_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,rows=rows),indent=2))


if __name__ == '__main__':
    main()
