# 2026-11-27 20:43 UTC — independent audit and publication gate

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2), with earlier campaign collaborators. Original sequence author Juri-Stepan Gerasimov and conjecture author Charles R. Greathouse IV acknowledged. Classical prime number theorem, Landau and Crisan–Erban semiprime asymptotics are prior mathematics. No historical priority claim.

## Readback and actual checks

Read AGENTS.md blob 8db0201da965541e0487d6dd1271e010bdaa0972, CAMPAIGN_LEDGER.md blob e715f64aaa8b32e535008f5eb256f9e65de0dfd1, VERIFIED_PROOFS.json (record_updated_utc 20:30:16.852Z; 31 complete certificates, 30 legacy candidates), upstream tools/oma.sh blob 34fe3d4bc6e8fd0c3c6d8e8c98e2b1de40c62051. Direct join.txt web fetch failed; public https://lefttosolve.com/join protocol was retrieved via indexed page; shell curl cannot resolve host (HTTP000). No fresh authorized lease obtained or attempted; no old token used. Site credit/profile unavailable to this run, so do not invent a live site refresh.

Independent current GitHub fetch: own 7724, 7815, 7817 merged, own 10139 open, unmerged. Actual official upstream job 140671608373 log from run 46047885906, executed line 19:10:39.3670774Z: accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound. Actual fork A181674 job 140722015963 log from run 46063152958, executed 20:24:17.4196011Z: OMA.disproof depends on propext, Classical.choice, Quot.sound. These are independent log readbacks, not new proof executions. Current total: 3 merged formal proofs, 4 actual full checker acceptances, 31 complete certificates, 0 conservatively certified original accepted resolutions. A158960 known prior; other merged proofs originality unconfirmed.

## New duplicate gates (all-state search explicitly is:pr, then actual PR fetch and changed-file inspection)

Each listed PR is OPEN and NOT MERGED at inspection. Each has exactly one proof file for its exact target, and its final theorem uses the registered target via type_of%. These are competing full-scope submissions, not just registrations. No foreign checker acceptance asserted.

| target | foreign full PR | author | head | created UTC |
|---|---|---|---|---|
| oeis-a383246 | 10917 | rexmhall09 | 73bc728b34c02e5d3ac2da67c0a0bc3c68b849ea | 19:39:41 |
| oeis-a383248 | 10994 | KoaOkano | 6b64d74559917f76dc5581e468b698cee26fd0db | 19:49:31 |
| mo-487192 | 11324 | rpinho | 30fb4004c05563199b97fcfe3914c31db2cc26f9 | 20:20:07 |
| oeis-a382465 | 10872 | rexmhall09 | 5778ecb363610e164c4b9824e0043c8106e4f401 | 19:35:28 |
| oeis-a382465 | 10955 | KoaOkano | 474272852d9c8f4948621db15767236863bc6894 | 19:45:35 |
| oeis-a382624 | 10881 | rexmhall09 | af4c783bb2e7021e4ab23b73d12e8fa44eb078af | 19:36:38 |
| oeis-a383062 | 10976 | KoaOkano | 2bcc7d680fb112df855668293e10b892d5a803ab | 19:47:03 |

URL prefix https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/ . The five digit targets all conclude injectivity and both directions of range equality; the MO487192 submission refutes the exact conjunction with a central nonzero square-zero element over C. This is structural scope review, not an execution of these seven files. Withhold all six own prepared full-proof branches pending changed circumstances. No copying allegation. With prior nine duplicate-withheld targets, the observed total becomes 15 distinct withheld targets (31-4-15=12 without recorded competitor or own full submission, subject to fresh gates). Master manifest left untouched to preserve root ownership. A181674 all-state exact ID PR search returned zero, but that neither establishes originality nor constitutes authorization.

## New mathematical result: exact average tends to 1 (human proof, not newly Lean checked)

Source https://oeis.org/A181674, source entry and conjecture re-read; canonical statement blob a5230ab9cae45d4da99872c64217eb4f80335a45, earlier hand proof blob a7112c6a7ff992aaa15771e0683309f29633e6db, source audit blob 4e8e489764e03adcdf9cd105888549d09dad3a86, full verification receipt blob 8d1d70873c3985dd43952b1610bbb52a425d8e1d. Earlier proof explicitly did not establish the limit 1. Here we prove it using stronger *classical* unconditional inputs, independently of the Chebyshev-only Lean disproof.

Let P be the distinct primorial values, including 1, and Q the positive semiprimes, including squares. Write K(x), B(x) for their counting functions, and S(N) for the source summatory unordered partition count. The intersection P∩Q is exactly {6}: a product of the first k distinct primes has exactly k prime factors counted with multiplicity, so it is semiprime iff k=2. Sorting an oriented pair (p,q) in P×Q is therefore injective: two different oriented pairs giving the same sorted pair would require two DISTINCT common elements, impossible. It is surjective by the definition of a source partition. In particular (6,6) is counted once, not twice. Hence, for any integer N>=1,

    S(N) = sum_{p in P, p<=N} B(N-p).

For any real 0<=h<=N, monotonicity and the same bijection imply the exact sandwich

    K(h) B(N-h) <= S(N) <= K(N) B(N).

Let p_k denote the kth prime and theta(t)=sum_{p<=t} log p. The prime number theorem gives theta(t)~t and pi(t)~t/log t. For every 0<eps<1, for all sufficiently large t, (1-eps)t <= theta(t) <= (1+eps)t. Taking y=log x and applying these inequalities to primes (with finitely many small primes absorbed for large x) gives

    1+pi(y/(1+eps)) <= K(x) <= 1+pi(y/(1-eps)).

Divide by y/log y, use the PNT and let eps decrease to zero. Thus K(x)~log x/log log x. Landau's unconditional semiprime theorem gives B(x)~x log log x/log x, including squares. See Crisan–Erban, On the counting function of semiprimes, Integers 21 (2021), arXiv:2006.16491, https://www.maths.ox.ac.uk/node/40908 (the leading term is explicit). The published abstract and Oxford exposition were read; no exhaustive full-paper or priority audit is claimed.

Take h=N/log N for N>=3, interpreted as a real threshold. Then h tends to infinity, h/N tends to 0, log h/log N tends to 1, and log log h/log log N tends to 1. Also (N-h)/N tends to 1, log(N-h)/log N tends to 1, and the corresponding double logarithm ratio tends to 1. Consequently both endpoints in the exact sandwich divided by N tend to 1, proving

    lim_{N->infinity} S(N)/N = 1.

This is a rigorous independent strengthening of the existing O(N) result using classical analytic inputs. It is not a new distinct problem, a new kernel pass, or an original discovery claim; the simplicity of the consequence makes conservative novelty classification appropriate. No RH or unproved analytic hypothesis used. The already checked Chebyshev-only proof remains canonical, with all source hypotheses.

## Executed finite challenge (Python 3 local, not Lean)

The following script was executed with the outputs below. Exact counting tests check source semantics and finite sandwich, not the asymptotic inference.

```python
from math import isqrt,log
from bisect import bisect_right
M=1_000_000
isprime=bytearray(b'\x01')*(M+1);isprime[:2]=b'\x00\x00'
for p in range(2,isqrt(M)+1):
    if isprime[p]: isprime[p*p::p]=b'\x00'*((M-p*p)//p+1)
pr=[i for i in range(2,M+1) if isprime[i]]
sem=set()
for i,p in enumerate(pr):
    if p*p>M:break
    sem.update(p*q for q in pr[i:bisect_right(pr,M//p)])
qs=sorted(sem); ps=[1]
for p in pr:
    x=ps[-1]*p
    if x>M:break
    ps.append(x)
assert set(ps)&sem=={6}
for n in range(1,501):
    pairs={(min(p,q),max(p,q)) for p in ps for q in qs[:bisect_right(qs,n-p)] if p<=n}
    exact=sum(bisect_right(qs,n-p) for p in ps if p<=n)
    assert len(pairs)==exact
for n in range(3,10001):
    h=int(n/log(n));s=sum(bisect_right(qs,n-p) for p in ps if p<=n)
    assert bisect_right(ps,h)*bisect_right(qs,n-h)<=s<=bisect_right(ps,n)*bisect_right(qs,n)
for n in [100,1000,10000,100000,1000000]:
    s=sum(bisect_right(qs,n-p) for p in ps if p<=n)
    print(n,s,s/n)
```

Output:
100 125 1.25
1000 1423 1.423
10000 15102 1.5102
100000 156372 1.56372
1000000 1569808 1.569808

500 exact unordered comparisons and 9998 sandwich assertions completed. Finite mean is NOT monotonically required to converge and values above1 are not counterexamples to the limiting theorem. (Exact primorial and semiprime definitions make all counts integer; floor h in the test is harmless.) No local Lean or gh executable was found.

## RESUME HERE

Reconcile the six additional foreign-proof gates with the fresh manifest before any claim; then choose the first still-uncontested exact checked target with current registry/lease authorization. Do not retry old 500 claims blindly. If unavailable, continue independent substantive mathematics (MO513259 full graph proof infrastructure remains unfinished in its owning lane). No schedules changed.
