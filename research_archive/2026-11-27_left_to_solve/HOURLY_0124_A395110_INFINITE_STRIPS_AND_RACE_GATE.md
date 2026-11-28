# A395110: exact all-length strips through width seven and submission race gate

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2).
Computer-assisted partial progress on the original all-square counting conjecture; not a new solved problem or Lean certificate.

## Complete all-length result for bounded width

For every positive m,n with min(m,n)<=7, the number of integer zero-Dirichlet arrays satisfying 0<=4f(i,j)-sum(neighbors)<=2 is exactly 2^floor(min(m,n)/2). Unlike a finite rectangle enumeration, the following is an exhaustive finite-state fixed-point certificate for **every length**, without assuming symmetry or a finite cutoff on n.

Source scope: A395110 upper-2 variant only (the main DATA upper bound is 3). Read prior HOURLY_2324_A395110_EXACT_GRID_ENUMERATION.md, FRESH_SCOUTS_AFTER_A372561.md and the exact height proof at commit 9fd9c67c6ba148a14122371fc782497fdddb3071. Direct source returned 403 in this run; no priority claim or complete current source history. All-state exact-ID PR search returned no result. The all-width square conjecture remains open in this lane.

Proof: by the maximum principle, any nonzero solution is positive at every interior site. The sharp row-envelope theorem in 9fd9c67 gives an upper bound cap_i=d_i(2k+1-d_i)/2, k=floor(m/2), d_i=min(i,m+1-i,k), independent of length n. Hence each nonzero column is one of finitely many vectors C=product_i {1,...,cap_i}. Let z be the zero column. Define the integer multiplicity vector V_1(z,b)=1 for b in C, with zero elsewhere. A transition (a,b)->(b,c), c in C, is permitted precisely when 0<=4b_i-a_i-c_i-b_(i-1)-b_(i+1)<=2 for every i, with b_0=b_(m+1)=0. Apply this transition operator T to V_j to obtain V_(j+1). By induction V_j(a,b) counts exactly all positive column prefixes of length j whose constraints have been checked through column j-1. Finishing at length j requires the same local inequalities with c=z. The count is 1 (the zero solution) plus the sum of these terminal multiplicities. Every solution appears once and no inadmissible array is counted. For each fixed width, if V_j=T V_j then V_(j+t)=V_j for all integers t>=0, proving every later count without scanning further lengths.

Two independently coded exact transitions (interval enumeration and direct Laplacian-label enumeration) were executed locally in Python. Both found exact equality of the entire multiplicity dictionaries, not merely matching support size or counts. Results:

|m|first observed fixed index j|support|sum of multiplicities|counts from n=1 to j|
|--:|--:|--:|--:|--|
|1|1|0|0|1|
|2|2|1|1|1,2|
|3|2|1|1|1,2|
|4|5|30|30|1,2,2,4,4|
|5|5|71|71|1,2,2,4,4|
|6|7|5104|5610|1,2,2,4,4,8,8|
|7|7|23164|24145|1,2,2,4,4,8,8|

This covers arbitrary length, including arbitrarily large rectangles with short side <=7. No claim about width>=8. The full-vector fixed-point equality is the finite computational certificate, not an extrapolation from several agreeing counts. The original n by n count for arbitrary n remains unresolved. A possible route is proving the fixed-point identity uniformly in width, together with a symbolic terminal count; the observed fixed indices are not a proof of any general bound.

## Executable exact certificate

```python
from collections import Counter
from itertools import product
import hashlib,json
expected = {
1:(1,0,0,"4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945"),
2:(2,1,1,"60fe3d31a1285167020c4845813abeff0110ee76fba26c6e77b1a00dd41f69ee"),
3:(2,1,1,"4abb107a93937628f133b4dd741102762ff6fdb15280cc65312558f4878ad205"),
4:(5,30,30,"7ece9d0388b975b4f2bdb615f3c0b8d0ed8bb1e0e5f1e7f2e699bf12a5eaec12"),
5:(5,71,71,"52c28ed658dd2ce58934268f1ab35351da7efee53f8633cc9728e22fbac2e4dc"),
6:(7,5104,5610,"eeaedbfc409647223d9fb0bffcea849bb9d482ea77eb9c3298871790890331a2"),
7:(7,23164,24145,"e14a72e71c387ee1076b169e8e22dd7edf5c8e28608c47851855677a45144539")}
for m in range(1,8):
    k=m//2
    caps=tuple((d:=min(i,m+1-i,k))*(2*k+1-d)//2 for i in range(1,m+1))
    z=(0,)*m
    cols=list(product(*(range(1,b+1) for b in caps)))
    def transitions(a,b):
        center=tuple(4*y-x-l-r for x,y,l,r in zip(a,b,(0,)+b[:-1],b[1:]+(0,)))
        yield from product(*(tuple(y-e for e in (0,1,2) if 1<=y-e<=c) for y,c in zip(center,caps)))
    def terminal(a,b):
        return all(0<=4*b[i]-a[i]-(b[i-1] if i else 0)-(b[i+1] if i+1<m else 0)<=2 for i in range(m))
    v=Counter({(z,b):1 for b in cols})
    jstop,size,total,digest=expected[m]
    for n in range(1,jstop+1):
        assert 1+sum(x for (a,b),x in v.items() if terminal(a,b))==2**(min(m,n)//2)
        nxt=Counter()
        for (a,b),x in v.items():
            for c in transitions(a,b): nxt[b,c]+=x
        if n==jstop:
            assert nxt==v and len(v)==size and sum(v.values())==total
            s=json.dumps(sorted((a,b,x) for (a,b),x in v.items()),separators=(',',':'))
            assert hashlib.sha256(s.encode()).hexdigest()==digest
        v=nxt
```

The two runs actually executed the transition loops, full dictionary equality, and the second printed the above hashes and counts. The bundled assertions encode those observed outputs for re-execution. Not Lean-formalised.

## Official campaign reconciliation and concrete action

Read AGENTS.md, current CAMPAIGN_LEDGER.md (1537e7cf3ad62ce61cc962d2c25681e8b3606a50), VERIFIED_PROOFS.json (379caca5d953a3f0a1eff550262059bdf98e0285), upstream CONTRIBUTING_AGENTS.md, lib/join.ts (6de9cd1b15df28419fcdda160e5f3abea64659dc), tools/oma.sh (0e9d771e692b971de2ac36ee450e814655ed5f3b); join.txt inaccessible via web and shell DNS failed, no live desk attempt or denial. Current rules source explicitly permits missing-lease submission only after exact check and subject to actual desk status. Local Lean unavailable.

Fresh GitHub PR metadata: own full PR10139 and13332 still open, not merged. Six registrations now actually merged, UTC:
12465 A068991 00:14:25; 12514 MO513259 00:21:13; 12591 A396949 00:33:54; 12717 MO487180 00:52:51; 12808 A181674 01:03:13; 12868 A372561 01:12:45.
All-state exact-ID searches found actual competing full files: foreign16269 A068991 (romechenko), 16199 A396949 (romechenko), 16447 MO487180 (Solfanbtc), 16854 MO513259 (cjchaffin, created01:21:47); all open/unmerged. Do not duplicate, no claim that these have passed checker or that they copy earlier work. Prior public own certificates and timestamps remain intact. MO513259 existing fixture had changed by another worker; do not overwrite it. A181674 fixture already exists, do not duplicate.

A372561 registration12868 actually merged. Exact current main statement statements/oeis-a372561.lean was byte-identical to archive blob 804c4fae0501a67e1182b334649e2fb8ada54d01. Fresh all-state search showed only statement12868; no existing campaign/proofs/oeis-a372561.lean fixture. Inspected unchanged shared verifier workflow blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c; it checks changed imported-target proof files on the campaign branch. Created only campaign/proofs/oeis-a372561.lean from the complete canonical proof on oma-campaign-20261127 via Contents API. Commit dad8786dc7d4bb9cf7ec37a74f1bd23897170caa, exact readback blob 804b4309f0c329665ede7e6a272658740f8c44ae. No workflow modification, no force, no lease taken. This is a verification fixture upload, not an actual successful Lean run. Inspect the actual verifier output; then fresh all-state race and teammate/desk gates before separate full-proof PR, coordinate with root/reversal rather than duplicating work. Other registrations12938/13431/14393/14443/13174 still open. No new accepted full proof, claim, official note or PR this run. Ledger recorded 37 full archive certificates, 5 upstream checker accepted own proofs, 3 merged and credited formal proofs, 0 certified genuinely-open accepted originals. No worker schedule/RH changes.
